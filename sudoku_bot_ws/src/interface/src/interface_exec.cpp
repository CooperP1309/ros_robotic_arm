#include <ros/ros.h>
#include <ros/package.h>
#include <mover_client/grid_num.h>
#include <mover_client/grid_num_vector.h>
#include <stdlib.h>
#include <string>
#include <fstream>
#include <vector>
#include <iomanip>
#include <iostream>
#include <regex>

mover_client::grid_num_vector grid_facts;
bool vector_received;

void grid_vectorReceived(const mover_client::grid_num_vector&);
int generate_facts_file();
std::string extract_results();
bool is_satisfiable(std::string);
void extract_grid_vector(std::string);

int main(int argc, char **argv)
{
	// initializing of subscriber node
	ros::init(argc, argv, "interface_node");
	ros::NodeHandle nh;
	ros::Subscriber sub = nh.subscribe("num_grids/vector", 1000, &grid_vectorReceived);
	ros::Publisher pub = nh.advertise<mover_client::grid_num_vector>("num_grids_sol/vector", 1000);
	
	// listening for a vector from the 'num_grids/vector' topic
	vector_received = false;	
	ROS_INFO_STREAM("Listening for vectors...\n");	

	while (vector_received == false && ros::ok()) { 	// checking if the recieved flag is triggered yet
		ros::spinOnce();
	}

	// solving of the assigned facts via clingo
	ROS_INFO_STREAM("Attempting to solve vector of grids...\n");

	if (generate_facts_file() == 0) {			// the recieved vector is firstly encoded into ASP facts
		ROS_INFO_STREAM("Unable to generate facts file");
		return 0;
	}											// then our asp solver and asp program are executed via system()								
		system("./clingo my_sudoku_facts.lp my_sudoku_ASP_program.lp >> result.txt");

	// processing of clingo results
	ROS_INFO_STREAM("Encoding results...\n");
	
	std::string results = extract_results();	// pushing results into a string
	if (results.empty()) {
		ROS_INFO_STREAM("Unable extract results");
		return 0;
	}

	if (!is_satisfiable(results)) {				// checking that the result is actually satisfiable
		ROS_INFO_STREAM("Results were unsatisfiable");
		return 0;
	}

	// encoding of results into a grid_num_vector message
	extract_grid_vector(results);
	if (grid_facts.numbered_grids.size() <= 0) {
		ROS_INFO_STREAM("Error in solution");
		return 0;
	}

	// publishing of results
	ros::Rate rate(0.5);
	while(ros::ok())
	{        		
        pub.publish(grid_facts);
        ROS_INFO_STREAM("Published the solution grid vector\n");        
               		
	   rate.sleep();
	}
}





/* ---------- functions ---------- */

void grid_vectorReceived(const mover_client::grid_num_vector& grid_vector)
{
    ROS_INFO_STREAM("Received the following vector of grids:\n");        
    for( int i = 0; i < grid_vector.numbered_grids.size(); i++ )
    {
         ROS_INFO_STREAM("(" << grid_vector.numbered_grids[i].row <<"," 
         					 << grid_vector.numbered_grids[i].col <<"," 
         					 << grid_vector.numbered_grids[i].num <<")");

         if( i+1 != grid_vector.numbered_grids.size() )
	     	ROS_INFO_STREAM(", ");
    }
    ROS_INFO_STREAM("\n"); 

    grid_facts = grid_vector;	// assigning of our received vector to a global variable for use in the main function
    vector_received = true;	   	// setting of our flag - necessary for continuation of program
}

int generate_facts_file() {

	std::ofstream fileWrite("my_sudoku_facts.lp");	// opening a file stream for our facts file

	if (!fileWrite.is_open()) {
		return 0;
	}
	else {	// for each numbered grid in our vector, write as an ASP fact in our file
		for (int i = 0; i < grid_facts.numbered_grids.size(); i++) {
			fileWrite << "gridNum(" 
					  << grid_facts.numbered_grids[i].row << ","
	   				  << grid_facts.numbered_grids[i].col << ","
					  << grid_facts.numbered_grids[i].num << ")."
		  			  << "\n";
		}

		fileWrite.close();
		return 1;
	}
}

std::string extract_results() {

	std::string results, buffer;			// string to hold results
	std::ifstream fileRead("result.txt");	// opening of the results file
	if (fileRead.is_open()) {

		while(getline(fileRead, buffer)) {	// extracting each line to our results
			results.append(buffer);
		}
	}

	fileRead.close();
	system("rm result.txt");

	return results;
}

bool is_satisfiable(std::string results) {

	std::regex pattern("(UNSATISFIABLE)");

    if (std::regex_search(results, pattern)) {	
        return false;						// case: the results were unsatisfiable
    }	

	return true;
}

void extract_grid_vector(std::string results) {

	int grid_count = 0;
	int known_grids_count = grid_facts.numbered_grids.size();
	grid_facts.numbered_grids.clear();
	mover_client::grid_num grid;

	for (int i = 0; i < results.size(); i++) {			// for each character in our results

		if (results[i] == '(' && results[i-1] == 'd') {	// if we discover a 'grid(' in results
			
			if (grid_count < known_grids_count) {		// if this grid is already given on the board...
				grid_count++;							// dont process this grid
			}
			else {										// else; go for it
				grid.row = results[i+1] - '0';
				grid.col = results[i+3] - '0';
				grid.num = results[i+5] - '0';
				grid_facts.numbered_grids.push_back(grid);
			}
		}
	}

	ROS_INFO_STREAM("Publishing the following sudoku solution:\n");        
    for( int i = 0; i < grid_facts.numbered_grids.size(); i++ )
    {
         ROS_INFO_STREAM("(" << grid_facts.numbered_grids[i].row <<"," 
         					 << grid_facts.numbered_grids[i].col <<"," 
         					 << grid_facts.numbered_grids[i].num <<")");

         if( i+1 != grid_facts.numbered_grids.size() )
	     	ROS_INFO_STREAM(", ");
    }
    ROS_INFO_STREAM("\n");
}
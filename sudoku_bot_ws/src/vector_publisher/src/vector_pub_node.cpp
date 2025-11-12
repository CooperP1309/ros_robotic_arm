#include <ros/ros.h>
#include <ros/package.h>
#include <mover_client/grid_num.h>
#include <mover_client/grid_num_vector.h>
#include <fstream>
#include <string>
#include <stdlib.h>
#include <iostream>
#include <vector>

void readBoardData(mover_client::grid_num_vector&);

int main(int argc, char **argv)
{
	// initializing our node
	ros::init(argc, argv, "vect_pub_node");
	ros::NodeHandle nh;
	ros::Publisher pub = nh.advertise<mover_client::grid_num_vector>("num_grids/vector", 1000);

	srand(time(0));

	// reading from facts file to our vector message
    	mover_client::grid_num_vector grid_vect;	// declaring a list of given grids
    	readBoardData(grid_vect);				// Filling the vector with board data from a txt file		

    	// publishing of our vector message to the 'num_grids/vector' node
    	ros::Rate rate(0.5);
	while(ros::ok())
	{        		
        pub.publish(grid_vect);
        ROS_INFO_STREAM("Published the grid vector\n");        
               		
	   rate.sleep();
	}
}





void readBoardData(mover_client::grid_num_vector& grid_vect) {

	// opening the facts file
	std::string path = ros::package::getPath("vector_publisher") + "/config/test_facts";

	std::ifstream file(path);
	if (!file.is_open()) {
		ROS_INFO_STREAM("Could not open facts file:" << path.c_str());
		return;
	}

	// actual reading of facts file
	ROS_INFO_STREAM("Reading file...\n");

	int number;
	std::string buffer;
	mover_client::grid_num grid;					// declaring a single given grid
	while(getline(file, buffer)) {
		
		// inserting data into a grid message
		for (int i = 0; i < 3; i++) {
			
			//ROS_INFO_STREAM(buffer[i]);
		
			if (i==0) {						// case for 'row'
				grid.row = buffer[i] - '0';	//std::stoi(buffer[i]);
			}

			if (i==1) {						// case for 'col'
				grid.col = buffer[i] - '0';	//std::stoi(buffer[i]);
			}

			if (i==2) {						// case for 'num'
				grid.num = buffer[i] - '0';	//std::stoi(buffer[i]);
			}
		}

		// inserting of processed grid into vector structure
		ROS_INFO_STREAM("Pushing grid: " << grid.row << ", " 
								   << grid.col << ", "
								   << grid.num << "\n");

		grid_vect.numbered_grids.push_back(grid);
	}

	file.close();
}
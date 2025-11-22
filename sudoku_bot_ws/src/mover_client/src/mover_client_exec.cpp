#include <ros/ros.h>
#include <mover_client/grid_num.h>
#include <mover_client/grid_num_vector.h>
#include <move_arm_joints/move_and_confirm.h>
#include <stdlib.h>
#include <iostream>
#include <vector>
#include <fstream>
#include <string>
#include <array>

mover_client::grid_num_vector grid_vector;
bool vector_received;

// globalise the client objects for use in a recursive function
ros::ServiceClient arm_shoulder_pan_client;
ros::ServiceClient arm_elbow_flex_client;
ros::ServiceClient arm_wrist_flex_client;
ros::ServiceClient arm_shoulder_lift_client;
ros::ServiceClient gripper_client;

void grid_vector_received(const mover_client::grid_num_vector&);
std::array<float,5> extract_parameters(int, int, int);
bool execute_move(int, float);

int main(int argc, char **argv) {

	// initializing of node
	ros::init(argc, argv, "mover_client_node");
	ros::NodeHandle nh;
	ros::Subscriber sub = nh.subscribe("num_grids_sol/vector", 1000, &grid_vector_received);

	// implementing a client handler for each servo service
	ros::ServiceClient arm_shoulder_pan_client = nh.serviceClient<move_arm_joints::move_and_confirm>("move_arm_joints/arm_shoulder_pan_joint_service");
	ros::ServiceClient arm_elbow_flex_client = nh.serviceClient<move_arm_joints::move_and_confirm>("move_arm_joints/arm_elbow_flex_joint_service");
	ros::ServiceClient arm_wrist_flex_client = nh.serviceClient<move_arm_joints::move_and_confirm>("move_arm_joints/arm_wrist_flex_joint_service");
	ros::ServiceClient arm_shoulder_lift_client = nh.serviceClient<move_arm_joints::move_and_confirm>("move_arm_joints/arm_shoulder_lift_joint_service");
	ros::ServiceClient gripper_client = nh.serviceClient<move_arm_joints::move_and_confirm>("move_arm_joints/gripper_joint_service");

	// listening for a vector from the 'num_grids_sol/vector' topic
	ROS_INFO_STREAM("Listening for vectors...\n");	
	vector_received = false;	

	while (vector_received == false && ros::ok()) { 	// checking if the recieved flag is triggered yet
		ros::spinOnce();
	}

	// execution of all solutions via the servos
	std::array<float, 5> params;
	for (int i = 0; i < grid_vector.numbered_grids.size(); i++) {		// for each solution {
		
		ROS_INFO_STREAM("Solving grid: " << grid_vector.numbered_grids[i].row << ", "
							        << grid_vector.numbered_grids[i].col << ", "
							        << grid_vector.numbered_grids[i].num << "...\n");

		params = extract_parameters(grid_vector.numbered_grids[i].row, 	// 	generate parameters
							   grid_vector.numbered_grids[i].col,
						        grid_vector.numbered_grids[i].num);

		// ensure parameter extraction was successful
		if (params[0] == 0 && params[1] == 0) {						// (whilst some params can be 0, 0 occuring twice
			ROS_INFO_STREAM("Parameter extraction fault");			//  breaks the rules of sudoku)
			return 0;												// (thus, checking for corrupted params is 0... 0)
		}

		for (int i = 0; i < 5; i++) {								// for each servo [i+1], execute it via the
			if (!execute_move(i+1,params[i])){						// corresponding parameter[i]
				ROS_INFO_STREAM("Failed to execute servo:" << i+1 << " with move:" << params[i]);
				return 0;
			}

			ROS_INFO_STREAM("Successfully moved servo " << i+1 << " to approx. " << params[i] << "\n");
		}
	}
}





/* ---------- functions ---------- */

void grid_vector_received(const mover_client::grid_num_vector& solution_vector) {

     ROS_INFO_STREAM("Received the following vector of grids:\n");        
    for( int i = 0; i < solution_vector.numbered_grids.size(); i++ )
    {
         ROS_INFO_STREAM("(" << solution_vector.numbered_grids[i].row <<"," 
         					 << solution_vector.numbered_grids[i].col <<"," 
         					 << solution_vector.numbered_grids[i].num <<")");

         if( i+1 != solution_vector.numbered_grids.size() )
	     	ROS_INFO_STREAM(", ");
    }
    ROS_INFO_STREAM("\n"); 

    grid_vector = solution_vector;	// assigning of our received vector to a global variable for use in the main function
    vector_received = true;	   	// setting of our flag - necessary for continuation of program   
}

std::array<float,5> extract_parameters(int row, int col, int num) {

	std::array<float,5> params;			

	// opening of csv file
	std::fstream fileRead;
	fileRead.open("param.csv", std::ios::in);

    	// variables for extracting and comparing values
    	int param_row, param_col, param_num;
    	std::vector<std::string> records;
    	std::string record, cell, buffer;

    	// reading of csv file lines
    	while (getline(fileRead,record)) {

    	// reseting of record struct
     records.clear();

     	// use sstream to process individual cells
        	std::stringstream stream(record.c_str());

        	// processing of each cell
        	while (getline(stream, cell, ',')) {
          	records.push_back(cell);
        	} 	

        	// converting each value to int for comparison use
   		param_row = stoi(records[0]);
     	param_col = stoi(records[1]);
     	param_num = stoi(records[2]);

        	// Compare the roll number
        	if (param_row == row && param_col == col && param_num == num) {
        		ROS_INFO_STREAM("Extracting the following parameters: ");
          
          	// extracting of each found parrameter
          	for (int i = 0; i < 5; i++) {
          		ROS_INFO_STREAM(records[i+3].c_str() << " ");
          		params[i] = stof(records[i+3]);
          	}
          	fileRead.close();
      		return params;
        	}

    }
     
     ROS_INFO_STREAM("Parameters not found");
    	fileRead.close();

	return params;
}

bool execute_move(int servo_number, float move) {

	move_arm_joints::move_and_confirm::Request req;
	move_arm_joints::move_and_confirm::Response resp;
	req.move = move;

	do {
		// via a switch, the servo number dictates the service called
		switch (servo_number) {

		case 1:		// arm shoulder pan joint

			if (!arm_shoulder_pan_client.call(req, resp)) {
				ROS_INFO_STREAM("Unable to contact service: arm shoulder pan");
				return false;
			}

			break;

		case 2:		// arm eblow flex joint

			if (!arm_elbow_flex_client.call(req, resp)) {
				ROS_INFO_STREAM("Unable to contact service: arm elbow flex");
				return false;
			}

			break;

		case 3:		// arm wrist flex joint

			if (!arm_wrist_flex_client.call(req, resp)) {
				ROS_INFO_STREAM("Unable to contact service: arm wrist flex");
				return false;
			}
		
			break;

		case 4:		// arm shoulder lift joint

			if (!arm_shoulder_lift_client.call(req, resp)) {
				ROS_INFO_STREAM("Unable to contact service: arm shoulder lift");
				return false;
			}
		
			break;

		case 5:		// gripper joint

			if (!gripper_client.call(req, resp)) {
				ROS_INFO_STREAM("Unable to contact service");
				return false;
			}
		
			break;

		default:
			ROS_INFO_STREAM("invalid servo number");
			return false;
		}

	} while (resp.confirm != move);

	return true;
}
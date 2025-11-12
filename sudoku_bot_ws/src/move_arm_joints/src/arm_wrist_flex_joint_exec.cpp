#include <ros/ros.h>
#include <move_arm_joints/move_and_confirm.h>
#include <stdlib.h>
#include <iostream>
#include <vector>
#include <sstream>
#include <fstream>

bool recieve_and_send_move(move_arm_joints::move_and_confirm::Request&,
                           move_arm_joints::move_and_confirm::Response&);
float execute_servo(float);
float extract_last_log();

int main(int argc, char **argv)
{
    // initializing of server node
    ros::init(argc, argv, "arm_wrist_flex_joint_node");
    ros::NodeHandle nh;
    ros::ServiceServer myServer = nh.advertiseService("move_arm_joints/arm_wrist_flex_joint_service", &recieve_and_send_move);

    ros::spin();

    return 0;
}





/* ---------- functions ---------- */

bool recieve_and_send_move(move_arm_joints::move_and_confirm::Request &req,
                           move_arm_joints::move_and_confirm::Response &resp)
{   

    ROS_INFO_STREAM("Requested move: " << req.move << "\n");
    resp.confirm = execute_servo(req.move);
    ROS_INFO_STREAM("Responding with: " << resp.confirm << "\n");


    return true;
}

float execute_servo(float move) {

    // formating move from float to string for command usage
    std::string cmd = "./arm_wrist_flex_servo ";
    std::stringstream input;
    input<<move;                // appending the move to the stream string
    cmd.append(input.str());    // appending formatted move to command

    // execute the servo binary via system()
    system(cmd.c_str());

    return extract_last_log();
}

float extract_last_log() {

    std::ifstream fileRead("arm_wrist_flex_servo_confirm.log");
    std::string last_log, buffer;

    while(getline(fileRead, buffer)) {
        last_log = buffer;
    }

    return stof(last_log);
}
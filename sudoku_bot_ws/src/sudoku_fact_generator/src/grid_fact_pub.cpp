#include <ros/ros.h>
#include <sudoku_fact_generator/grid_fact.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	ros::init(argc, argv, "publish_fact");
	ros::NodeHandle nh;
	ros::Publisher pub = nh.advertise<sudoku_fact_generator::grid_fact>("num_grids/vector", 1000);

	srand(time(0));

	ros::Rate rate(2);
	while(ros::ok())
	{
		sudoku_fact_generator::grid_fact msg;

		msg.X = 3;
		msg.Y = 2;
		msg.Z = 4;

		pub.publish(msg);
		ROS_INFO_STREAM("Sending a fact:"
							<< " Row " << msg.X
							<< " Col " << msg.Y
							<< " Num " << msg.Z);
		rate.sleep();
	}
}

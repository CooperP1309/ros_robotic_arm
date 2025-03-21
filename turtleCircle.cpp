#include <iostream>
#include <fstream>
#include <cstdlib>    // library for 'system()'
using namespace std;

int main() {
  
  cout << "Let's make a circle ಠoಠ" << endl;

  // make a char array to hold the command in
  char* turnCommand = "rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist '{linear: {x: 1.1, y: 0.0, z: 0.0}, angular: {x: 0.0, y: 0.0, z: 1.0}}'";

  // 7 iterations of this command should complete a circle...
  for (int i = 0; i < 7; i++) {
    system(turnCommand);
  }

  cout << "Enjoy your circle ;)" << endl;
} 
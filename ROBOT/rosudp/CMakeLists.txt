cmake_minimum_required(VERSION 2.8.3)
project(rosudp)
 
## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp rospy geometry_msgs genmsg)

## Declare a catkin package
catkin_package(
  
)

## Build udp
include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(rosudp_node src/rosudp.cpp)

add_dependencies(rosudp_node 
   rosudp_generate_messages_cpp
)

target_link_libraries(rosudp_node ${catkin_LIBRARIES})



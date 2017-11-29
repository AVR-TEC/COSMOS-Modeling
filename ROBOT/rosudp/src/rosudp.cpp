#include "ros/ros.h"
#include "geometry_msgs/PoseWithCovarianceStamped.h"
 
#include <sstream>
#include "boost/asio.hpp"
using namespace boost::asio;

void PoseCallback(const geometry_msgs::PoseWithCovarianceStamped::ConstPtr& msg)
{
  double px = msg->pose.pose.position.x;
  double py = msg->pose.pose.position.y;
  double pz = msg->pose.pose.position.z;

  //double ox = msg->pose.pose.orientation.x;
  //double oy = msg->pose.pose.orientation.y;
  //double oz = msg->pose.pose.orientation.z;
  //double ow = msg->pose.pose.orientation.w;

  ROS_INFO("px: [%f], py: [%f], pz: [%f]", px,py,pz);

  io_service io_service;
  ip::udp::socket socket(io_service);
  ip::udp::endpoint remote_endpoint;

  socket.open(ip::udp::v4());

  remote_endpoint = ip::udp::endpoint(ip::address::from_string("127.0.0.1"), 5005);

  boost::system::error_code err;

  socket.send_to(buffer("X:" + boost::lexical_cast<std::string>(px)+ "Y:" + boost::lexical_cast<std::string>(py)+ "Z:" + boost::lexical_cast<std::string>(pz) + "END", 1000), remote_endpoint, 0, err);

  socket.close();
 
}

int main(int argc, char **argv)
{

  ros::init(argc, argv, "rosudp");

  ros::NodeHandle n;

  ros::Subscriber sub = n.subscribe("poseupdate", 1000, PoseCallback);

  ros::spin();
  
  return 0;
}






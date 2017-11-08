# Installing ROS Kinetic
(http://wiki.ros.org/kinetic/Installation/Ubuntu)


## Setting up sources.list and keys

```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

sudo apt-get update
```

## Full Installation 

For other options refer to ROS install webpage some packages may cause trouble
```
sudo apt-get install ros-kinetic-desktop-full

sudo rosdep init

rosdep update

sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential
```

## Environment setup

```
source /opt/ros/kinetic/setup.bash

mkdir -p ~/catkin_ws/src

cd ~/catkin_ws/

catkin_make

source devel/setup.bash
```

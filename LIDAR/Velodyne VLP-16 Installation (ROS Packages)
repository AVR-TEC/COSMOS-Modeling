# Installing Velodyne VLP-16 (ROS Packages)
 


Building the Velodyne Driver
---------------------------------------------------------------------------------
```
cd catkin_ws/src

git clone https://github.com/AVR-TEC/velodyne.git

source /opt/ros/kinetic/setup.bash

cd catkin_ws

rosdep install --from-paths src --ignore-src --rosdistro indigo -y

catkin_make -DCMAKE_BUILD_TYPE=Release
```


Building Velodyne LOAM (Laser Odometry and Mapping)
---------------------------------------------------------------------------------
```
cd catkin_ws/src

git clone https://github.com/AVR-TEC/loam_velodyne.git

source /opt/ros/kinetic/setup.bash

cd catkin_ws

catkin_make -DCMAKE_BUILD_TYPE=Release
```

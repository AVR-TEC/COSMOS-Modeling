# Installing RPLIDAR (ROS Packages)



Building RPLIDAR Driver
---------------------------------------------------------------------------------
```
cd catkin_ws/src

git clone https://github.com/AVR-TEC/rplidar_ros.git

source /opt/ros/kinetic/setup.bash

cd catkin_ws

catkin_make -DCMAKE_BUILD_TYPE=Release
```


Building HECTOR SLAM
---------------------------------------------------------------------------------
```
cd catkin_ws/src

git clone https://github.com/AVR-TEC/hector_slam.git

source /opt/ros/kinetic/setup.bash

cd catkin_ws

catkin_make -DCMAKE_BUILD_TYPE=Release
```


Modifying HECTOR SLAM to run with RPLIDAR
---------------------------------------------------------------------------------

* Set values of mapping_default.launch file:
```
<arg name="base_frame" default="base_link"/>
<arg name="odom_frame" default="base_link"/>
<node pkg="tf" type="static_transform_publisher" name="base_to_laser_broadcaster" args="0 0 0 0 0 0 base_link laser 100" />
```

* Set values of tutorial.launch file: 
```
<param name="/use_sim_time" value="false"/>
```

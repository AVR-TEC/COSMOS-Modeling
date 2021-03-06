# 3D Mapping with Velodyne VLP-16 (ROS Packages)

Beforehand Install ROS and the Velodyne Drivers

* Connect the LIDAR by Ethernet, change the IP to:

```
sudo ifconfig eth0 192.168.1.77
```

* Use Wireshark to corroborate you are receiving data


* The next steps require of different 4 Terminals to run each program 

```
CTRL + Shift + N (This will open a new Terminal Window)

CTRL + Shift + T (This will open a new TAB in the current Terminal Window)
```


Terminal 1 
---------------------------------------------------------------------------------
In order for ROS nodes to communicate you need a roscore running 
```
source ~/catkin_ws/devel/setup.bash

roscore
```


Terminal 2
---------------------------------------------------------------------------------
This commmand will save the the pointcloud of each 360 degree scan
```
source ~/catkin_ws/devel/setup.bash

rosrun pcl_ros pointcloud_to_pcd input:=/velodyne_cloud_registered
```


Terminal 3 
---------------------------------------------------------------------------------
Start the LOAM service to generate the mapping
```
source ~/catkin_ws/devel/setup.bash

roslaunch loam_velodyne loam_velodyne.launch
```


Terminal 4
---------------------------------------------------------------------------------
Run Velodyne LIDAR to gather information from the sensor
```
source ~/catkin_ws/devel/setup.bash

roslaunch velodyne_pointcloud VLP16_points.launch
```

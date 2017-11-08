# 2D Mapping with RPLIDAR and Hector SLAM


Check the authority of RPLIDAR's serial-port and Add the authority of write 

```
ls -l /dev |grep ttyUSB

sudo chmod 666 /dev/ttyUSB0
```


The next steps require of different 4 Terminals to run each program 

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
Run RPLIDAR to gather information from the sensor
```
source ~/catkin_ws/devel/setup.bash

roslaunch rplidar_ros rplidar.launch
```


Terminal 3 
---------------------------------------------------------------------------------
Run Hector SLAM to generate the mapping
```
source ~/catkin_ws/devel/setup.bash

roslaunch hector_slam_launch tutorial.launch

```


Terminal 4 
---------------------------------------------------------------------------------
To save a geotiff file with the mapping information at any time during the process
```
source ~/catkin_ws/devel/setup.bash

rostopic pub syscommand std_msgs/String "savegeotiff"
```

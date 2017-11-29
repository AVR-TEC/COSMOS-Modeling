#!/bin/bash
# License: Free
# Copyright(c) enRouteLAB (2017)
cd $HOME

# Install Prerequisites
sudo apt-get update
sudo apt-get -y install git cmake build-essential cmake-curses-gui libatlas-base-dev libprotobuf-dev libleveldb-dev libsnappy-dev libboost-all-dev libhdf5-serial-dev libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler libgtk2.0-dev pkg-config libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libtbb-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils unzip python-protobuf libeigen3-dev uuid-dev libusb-1.0-0-dev libudev-dev libglew-dev python-dev python-py python-pytest python-numpy libtbb2 libpng-dev libtiff-dev libtiff5-dev zlib1g-dev libavutil-dev libpostproc-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev 

# Remove Unnecessary Files   
sudo rm -r nv-gie-repo-ubuntu1604-ga-cuda8.0-trt2.1-20170614_1-1_arm64.deb
sudo rm -r cuda-l4t
sudo rm -r cudnn

# Create Work Folder
cd $HOME
mkdir src


# Update Eigen
cd $HOME/src
wget --no-check-certificate http://bitbucket.org/eigen/eigen/get/3.3.4.tar.gz
tar xzvf 3.3.4.tar.gz
sudo rm -r 3.3.4.tar.gz
cd eigen-eigen-5a0156e40feb
mkdir build
cd build
cmake ../
sudo make install


# Install OpenCV for Jetson TX1
cd $HOME/src
git clone https://github.com/opencv/opencv.git
git checkout -b v3.3.1 3.3.1
cd opencv
git clone https://github.com/opencv/opencv_contrib.git
mkdir build
cd build 
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_PNG=OFF -DBUILD_TIFF=OFF -DBUILD_TBB=OFF -DBUILD_JPEG=OFF -DBUILD_JASPER=OFF -DBUILD_ZLIB=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TESTS=OFF -DBUILD_opencv_java=OFF -DBUILD_opencv_python2=ON -DBUILD_opencv_python3=OFF -DENABLE_PRECOMPILED_HEADERS=OFF -DWITH_OPENCL=OFF -DWITH_OPENMP=OFF -DWITH_FFMPEG=ON -DWITH_GSTREAMER=ON -DCUDA_FAST_MATH=ON -DWITH_V4L=ON -DWITH_GSTREAMER_0_10=OFF -DWITH_CUDA=ON -DWITH_GTK=ON -DWITH_VTK=OFF -DWITH_TBB=ON -DWITH_1394=OFF -DWITH_OPENEXR=OFF -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-8.0 -DCUDA_ARCH_BIN=5.3 -DCUDA_ARCH_PTX="" -DINSTALL_C_EXAMPLES=OFF -DINSTALL_TESTS=OFF -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules ../
make -j4
sudo make install

# Install Pangolin
cd $HOME/src
git clone https://github.com/yankailab/Pangolin.git
cd Pangolin
mkdir build
cd build
cmake ..
cmake --build .
sudo make install

# Install Orb_SLAM2 GPU VERSION
cd $HOME/src
git clone https://github.com/yankailab/orb_slam2_gpu.git
cd orb_slam2_gpu
chmod +x build.sh
./build.sh

# Install Jetson-Inference
cd $HOME/src
git clone https://github.com/dusty-nv/jetson-inference.git
cd jetson-inference/
mkdir build
cd build
cmake ../
make

#Build OpenKAI
cd $HOME/src
git clone https://github.com/yankailab/OpenKAI.git
cd OpenKAI
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCUDA_ARCH=53 -DUSE_OPENCV4TEGRA=OFF -DUSE_ZED=OFF -DTensorRT_build=/home/nvidia/src/jetson-inference/build/aarch64 ../
make all -j4

# Installing OpenMVS 
(https://github.com/cdcseacave/openMVS/wiki/Building)


Install and Update Eigen
---------------------------------------------------------------------------------
NOTE: Do it only if you didnt follow the previous guide to install Colmap

```
sudo apt-get install libeigen3-dev

wget --no-check-certificate http://bitbucket.org/eigen/eigen/get/3.2.10.tar.gz

tar xzvf 3.2.10.tar.gz

cd eigen

mkdir build

cd build

cmake ../

sudo make install
```


Install Ceres Solver
---------------------------------------------------------------------------------
NOTE: Do it only if you didnt follow the previous guide to install Colmap
```
sudo apt-get install libatlas-base-dev libsuitesparse-dev

git clone https://ceres-solver.googlesource.com/ceres-solver

cd ceres-solver

mkdir build

cd build

cmake .. -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF

make

sudo make install
```


Install OpenCV
---------------------------------------------------------------------------------
NOTE: In case you already have an OpenCV version installed omit this step.
      For an specific version of OpenCV, install from source and omit this step

```
sudo apt-get -y install libopencv-dev
```


Install VCGLib libraries
---------------------------------------------------------------------------------
```
git clone https://github.com/cdcseacave/VCG.git vcglib
```


Install Ubuntu Dependencies 
---------------------------------------------------------------------------------
```
sudo apt-get -y install build-essential git mercurial cmake libpng-dev \
        libjpeg-dev libtiff-dev libglu1-mesa-dev libboost-iostreams-dev \ 
        libboost-program-options-dev libboost-system-dev \
        libboost-serialization-dev libcgal-dev libcgal-qt5-dev freeglut3-dev \ 
        libglew-dev libglfw3-dev
```


Build and Install OpenMVS
---------------------------------------------------------------------------------
```
git clone https://github.com/AVR-TEC/openMVS.git

cd openMVS

mkdir build

cd build

cmake ../ -DCMAKE_BUILD_TYPE=Release -DVCG_DIR="$main_path/vcglib" \
	-DBUILD_SHARED_LIBS=ON

make

sudo make install
```

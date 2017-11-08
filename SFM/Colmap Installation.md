#Installing COLMAP
(https://colmap.github.io/install.html)



Install Ubuntu Dependencies
---------------------------------------------------------------------------------
NOTE: For full dense reconstruction support, download the binaries with CUDA.
      These binaries require a CUDA-enabled NVidia GPU.

```
sudo apt-get install cmake build-essential libboost-all-dev libeigen3-dev \
    libsuitesparse-dev libfreeimage-dev libgoogle-glog-dev libgflags-dev \
    libglew-dev qtbase5-dev libqt5opengl5-dev
```


Update Eigen
---------------------------------------------------------------------------------
```
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


Build COLMAP from Source 
---------------------------------------------------------------------------------
```
git clone https://github.com/AVR-TEC/colmap.git

cd colmap

mkdir build

cd build

cmake ..

make
```

#!/bin/bash
NAME=hlpr_simulator_indigo
if [ -z ${DOTFILE_hlpr_simulator_indigo_INSTALLED+x} ]; then
  echo "Installing $NAME..."
################################################################################
  echo "Installation method via https://github.com/HLP-R/hlpr_documentation/wiki/Vector-Simulation-Setup-Steps"

  ./install_indigo.sh
  
  # Prep
  cd ~
  mkdir hlpr
  cd hlpr

  # Dependencies
  sudo apt install -y \
    ros-indigo-control-toolbox \
    ros-indigo-moveit-core \
    ros-indigo-costmap-2d \
    ros-indigo-move-base \
    ros-indigo-jsk-recognition \
    ros-indigo-controller-manager \
    ros-indigo-gazebo-ros* \
    ros-indigo-hector* \
    ros-indigo-rviz-imu-plugin \
    ros-indigo-robot-pose-ekf \
    ros-indigo-robot-localization \
    ros-indigo-yocs-cmd-vel-mux \
    ros-indigo-joint-* \
    ros-indigo-global-planner \
    ros-indigo-teleop-twist-*

  # Freenect2
  ls /usr/share/cmake-`cmake --version | head -n 1 | awk -F" " '{print $3}' | awk -F"." '{print $1"."$2; }'`/Modules/ | grep Findfreenect2
  if [ $? -ne 0 ]; then
    sudo dpkg -i debs/libusb*deb
    sudo apt install -y libturbojpeg libjpeg-turbo8-dev
    sudo dpkg -i debs/libglfw3*deb; sudo apt install -f; sudo apt install libgl1-mesa-dri-lts-`lsb_release -sc`
    git clone https://github.com/OpenKinect/libfreenect2.git
    
    cd libfreenect2/depends; ./download_debs_trusty.sh
    cd ..
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=~.local
    make -j7 && make install -j7
    cd ../..
  fi

  # Install Vector
  mkdir -p vector_ws/src
  cd vector_ws/src
  git clone https://github.com/Kukanani/vector_v1.git
  # nano vector_v1/vector_network/env-hooks/50.vector_network_config.sh
  cd ../..

  # if this messes up, just clone the hlpr_documentation wiki and find the exact tags in plaintext file, then paste them into the filename referenced.
  echo '
  <library path="lib/libhector_pose_estimation_nodelet">
  <class name="hector_pose_estimation/PoseEstimationNodelet" type="hector_pose_estimation::PoseEstimationNodelet" base_class_type="nodelet::Nodelet">
  <description>
    This nodelet initializes the pose estimation filter with a generic system model driven by IMU measurements only.
  </description>
  </class>
  </library>' > /opt/ros/${ROSDISTRO}/share/hector_pose_estimation/hector_pose_estimation_nodelets.xml

  # Install HLP-R Manipulation Stack
  sudo apt install -y \
    python-easygui \
    ros-indigo-ecl-geometry \
    ros-indigo-moveit-full \
    python-pip \
    libnlopt-dev
  sudo pip install aenum
  cd vector_ws/src
  git clone https://bitbucket.org/traclabs/trac_ik.git
  git clone -b vector-develop https://github.com/GT-RAIL/wpi_jaco.git
  touch wpi_jaco/jaco_description/CATKIN_IGNORE
  touch wpi_jaco/jaco_interaction/CATKIN_IGNORE
  touch wpi_jaco/jaco_teleop/CATKIN_IGNORE

  git clone https://github.com/GT-RAIL/rail_manipulation_msgs.git
  # git clone https://github.com/StanleyInnovation/robotiq_85_gripper.git
  git clone https://github.com/Kukanani/hlpr_manipulation.git

  # HLP-R Simulation
  git clone https://github.com/HLP-R/hlpr_simulator.git

  # Navigation
  sudo apt install -y \ 
    ros-indigo-navigation \
    ros-indigo-slam-gmapping

  cd ../
  catkin build

  echo >> ~/.bashrc

  export GAZEBO_PLUGIN_PATH=~/hlpr/vector_ws/build/roboticsgroup_gazebo_plugins/:$GAZEBO_PLUGIN_PATH
  # echo "export DOTFILE_${NAME}_INSTALLED=yes" >> ~/.bashrc
################################################################################
  echo "Finished installing $NAME"
  echo "Don't forget to run:"
  echo ". ~/.bashrc"
else
  echo "$NAME is already installed."
fi
#!/bin/bash

# Intro
echo 'My Fresh Ubuntu'
echo 'A collection of packages installations and pc customizations'
echo 'Cause home is where you type fast'
echo '............................................................'
echo '............................................................'
echo 'Developed and tested on a standard Ubuntu 10.64 Desktop installation'
echo 'Some packages require restricted, universe and multiveerse repositories.'
echo 'Make sure these are enable before proceeding.'
echo 'sleep 4 seconds...'
sleep 4


# Functions useful for this script
command_exists() {
    type "$1" &> /dev/null;
}

# *** Web browsing

# *** Java iced tea to run .jnlp Robotran file
sudo apt-get install icedtea-8-plugin

# *** Editors and IDE
sudo apt-get install kdevelop
sudo apt-get install emacs24
sudo apt-get install texstudio

# terminator
sudo apt-get install terminator

# zsh and oh-my-zsh + guake
if command_exists zsh --version; then
    echo 'Shell combo (zsh+oh-my-zsh+guake) already installed'
else
    echo 'TODO: install mendeley.'
    sudo apt-get install zsh
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    # https://github.com/Guake/guake
    git clone https://github.com/Guake/guake.git
    cd guake
    ./dev.sh --install
    make
    sudo make install
    cd ..
    rm -rf guake
    echo 'Guake is fine!'
    sleep 5
fi



# mendeley
if command_exists mendeleydesktop --help; then
    echo 'mendeley already installed'
else
    echo 'TODO: install mendeley.'
fi


# git
sudo apt-get install git git-gui gitk

# cmake
sudo apt-get install cmake

# Package manager
sudo apt-get install synaptic

# Image editing
sudo apt-get install gimp

# Keyboard customization

# 3D graphics
sudo apt-get install mesa-utils

# gazebo
if command_exists gazebo; then
    echo 'gazebo already installed'
    gazebo -v
else
    echo 'Getting gazebo...'
    curl -ssL http://get.gazebosim.org | sh
    echo 'Gazebo installed.'
fi

# ros (kinetic)
if command_exists gazebo; then # command_exists rosversion; then
    echo 'ros already installed'
    rosversion ros
else
    echo 'Getting ros...'
    # x.y from http://wiki.ros.org/kinetic/Installation/Ubuntu
    # 1.2 setup sources.list
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    # 1.3 setup keys
    sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116
    # 1.4 installation
    sudo apt-get update
    sudo apt-get install ros-kinetic-desktop-full
    # 1.5 initialize rosdep
    sudo rosdep init
    rosdep update
    # 1.6 environment setup
    echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
    source ~/.bashrc
    # 1.8 getting rosinstall
    sudo apt-get install python-rosinstall

    echo 'ros installed.'
fi

# TODO
if command_exists dropbox; then
    echo 'Dropbox installed.'
else
    sudo apt-get install python-gpgme
    echo 'TODO: Install dropbox manually.'
    # sudo dpkg -i dropbox.deb
fi

if command_exists matlab -h; then
    echo 'Matlab installed.'
else
    echo 'TODO: Install Matlab manually.'
fi

# Final
sudo apt-get update
sudo apt-get upgrade

# Outro
echo "What's done is done"


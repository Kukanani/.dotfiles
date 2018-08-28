###################################################################
# ROS
###################################################################
alias sourceros='source /opt/ros/kinetic/setup.bash'
# Add your main repo to your path. Only the last sourcing matters, it will
# overwrite all previous ones
sourceros

unsourceros() {
unset CMAKE_PREFIX_PATH
unset ROS_ROOT
unset ROS_PACKAGE_PATH
unset ROS_MASTER_URI
unset ROS_DISTRO
unset ROS_ETC_DIR
unset ROSLISP_PACKAGE_DIRECTORIES

unset ROSCONSOLE_FORMAT

# clear ros paths from other env vars that we can't totally remove
export PATH=$(echo $PATH | perl -ne 's/\:?[^\:]*ros[^\:]*(?=\:)?//g; print;')
export PYTHONPATH=$(echo $PYTHONPATH | perl -ne 's/\:?[^\:]*ros[^\:]*(?=\:)?//g; print;')
export LD_LIBRARY_PATH=$(echo $LD_LIBRARY_PATH | perl -ne 's/\:?[^\:]*ros[^\:]*(?=\:)?//g; print;')
export PKG_CONFIG_PATH=$(echo $PKG_CONFIG_PATH | perl -ne 's/\:?[^\:]*ros[^\:]*(?=\:)?//g; print;')
export CMAKE_PREFIX_PATH=$(echo $CMAKE_PREFIX_PATH | perl -ne 's/\:?[^\:]*ros[^\:]*(?=\:)?//g; print;')
export MANPATH=$(echo $MANPATH | perl -ne 's/\:?[^\:]*ros[^\:]*(?=\:)?//g; print;')
}

# Source the current repo, replacing any previous repo sourcing commands
alias sourcethis='unset CMAKE_PREFIX_PATH;source ./devel/setup.bash'

# Automatic return to your last-sourced catkin root directory
alias roshome='cd $(echo $CMAKE_PREFIX_PATH | cut -d ':' -f 1);cd ..'

# Automatic catkin_make from any folder (use in conjunction with the above one-liner)
cb() {
  (roshome && exec catkin build --summarize "$@")
}

# Automatic catkin_make from any folder (use in conjunction with the above one-liner)
cm() {
  (roshome && exec catkin_make "$@")
}

# Automatic catkin_make from any folder (use in conjunction with the above one-liner)
cmi() {
  (roshome && exec catkin_make_isolated --install "$@")
}

# Clean catkin_make (delete the generated folders, then catkin_make)
alias cmclean='(roshome && rm -rf build devel install && cm)'

# Clean catkin_make (delete the generated folders, then catkin_make)
alias cbclean='(roshome && rm -rf build devel install && cm)'

# Clean catkin_make (delete the generated folders, then catkin_make)
alias cmiclean='(roshome && rm -rf build_isolated devel_isolated install_isolated && cmi)'

# Change the format of ROS console output. This way you can get rid of the annoying timestamp.
# The total list of items you can add to this format string is available here. As of the time this article was written, the options were:
# severity message time thread logger file line function
export ROSCONSOLE_FORMAT='[${severity}] ${message}'

# Export a package config, helps with finding some manually installed packages
export PKG_CONFIG_PATH=/home/adam/.local/lib/pkgconfig/:$PKG_CONFIG_PATH

memaster() {
    export ROS_MASTER_URI=http://localhost:11311/
    export ROS_IP=127.0.0.1
}
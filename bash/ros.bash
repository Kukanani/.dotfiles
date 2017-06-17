###################################################################
# ROS
###################################################################
# Add your main repo to your path. Only the last item in this list matters, each will overwrite the previous one.
source /opt/ros/kinetic/setup.bash

# Source the current repo, replacing any previous repo sourcing commands
alias sourcethis='unset CMAKE_PREFIX_PATH;source ./devel/setup.bash'
  
# Automatic return to your last-sourced catkin root directory
alias roshome='cd $(echo $CMAKE_PREFIX_PATH | cut -d ':' -f 1);cd ..'
  
# Automatic catkin_make from any folder (use in conjunction with the above one-liner)
alias cm='(roshome && exec catkin build --summarize)'
  
# Clean catkin_make (delete the generated folders, then catkin_make)
alias cmclean='(roshome && rm -rf build devel && exec catkin build --summarize)'
  
# Change the format of ROS console output. This way you can get rid of the annoying timestamp.
# The total list of items you can add to this format string is available here. As of the time this article was written, the options were:
# severity message time thread logger file line function
export ROSCONSOLE_FORMAT='[${severity}] ${message}'
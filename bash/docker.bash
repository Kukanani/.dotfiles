###################################################################
# Docker
###################################################################
# via https://forums.docker.com/t/how-to-delete-cache/5753
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_kill_stopped='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
alias docker_run_gui='XSOCK=/tmp/.X11-unix && XAUTH=/tmp/.docker.xauth && xauth nlist :0 | sed -e "s/^..../ffff/" | xauth -f $XAUTH nmerge - && docker run  -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH  -e DISPLAY=$DISPLAY'
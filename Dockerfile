FROM library/julia
MAINTAINER Stephen Eglen <sje30@cam.ac.uk>
RUN apt-get update
RUN apt-get -y install qt4-bin-dbg mesa-utils qt5-default 
# RUN apt-get -y texlive-full

##RUN julia -e 'Pkg.add("PyPlots.jl")'
RUN julia -e 'Pkg.add("GR")'
RUN julia -e 'using GR'

# RUN apt-get -y install libgl1-mesa-dri:i386 libgl1-mesa-glx:i386
RUN julia -e 'Pkg.add("Plots")'
RUN julia -e 'using Plots'
# RUN julia -e 'Pkg.add("PGFPlots")
# RUN julia -e 'using PGFPlots'

## TO REBUILD
#  docker build -t sje30/izh2004 .
## TO RUN
#  docker run -it sje30/izh2004 bash

# docker run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/home/stephen/.Xauthority --net=host amanral/ubuntu-firefox:rev1
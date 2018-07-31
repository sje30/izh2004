## -*- docker-image-name: "sje30/izh2004" -*-
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

RUN apt-get -y install git-core make
ENV PROJ /home/stephen/izh2004
RUN mkdir -p $PROJ
RUN git clone https://github.com/sje30/izh2004.git $PROJ

WORKDIR $PROJ
RUN make

RUN mkdir codecheck

RUN date > codecheck/date.txt
RUN uname -a > codecheck/uname.txt
RUN cp figure1.png codecheck


## TO REBUILD
#  docker build -t sje30/izh2004 .
## TO RUN
#  docker run --name road -it sje30/izh2004 bash

# docker run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/home/stephen/.Xauthority --net=host amanral/ubuntu-firefox:rev1

# docker cp road:/home/stephen/izh2004/codecheck/uname.txt /tmp
# docker cp road:/home/stephen/izh2004/codecheck/figure1.png /tmp
 

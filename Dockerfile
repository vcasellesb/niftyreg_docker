FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y cmake cmake-curses-gui \
    gcc g++ libeigen3-dev git

RUN git clone https://github.com/KCL-BMEIS/niftyreg.git

WORKDIR /niftyreg/build

RUN CXX=/usr/bin/g++ CC=/usr/bin/gcc cmake ../ && \
    make && make install

WORKDIR /

RUN rm -rf /niftyreg
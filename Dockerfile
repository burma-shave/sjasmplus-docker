FROM gcc as build
ARG SJASMPLUS_VER=master
RUN apt-get update && apt install git
RUN git clone --recursive --depth 1 --shallow-submodules \
    -j8 --branch ${SJASMPLUS_VER} https://github.com/z00m128/sjasmplus.git
WORKDIR /sjasmplus
# RUN make

FROM ubuntu:latest
RUN apt-get update && apt install make 
COPY --from=build /sjasmplus/sjasmplus /usr/local/bin/sjasmplus

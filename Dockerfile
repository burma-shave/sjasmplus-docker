FROM gcc as build
RUN apt-get update && apt install git
RUN git clone --recursive --depth 1 --shallow-submodules \
    -j8 --branch v1.20.1 https://github.com/z00m128/sjasmplus.git
WORKDIR /sjasmplus
RUN make

FROM ubuntu:latest
RUN apt-get update && apt install make 
COPY --from=build /sjasmplus/sjasmplus /usr/local/bin/sjasmplus

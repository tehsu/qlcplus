# Define software download URLs.
ARG QLC_URL=https://www.qlcplus.org/downloads/4.13.1/qlcplus_4.13.1_amd64.deb

# Pull base image.
FROM consol/debian-xfce-vnc

# Define working directory.
WORKDIR /tmp

ARG QLC_URL

ADD $QLC_URL /tmp/qlcplus.deb

RUN sudo apt-get update

RUN sudo apt-get dist-upgrade -y

# Install dependencies.
RUN \
  sudo apt-get -y install \
    libasound2 \
    libfftw3-double3 \
    libftdi1-2 \
    libqt5core5a \
    libqt5gui5 \
    libqt5multimedia5 \
    libqt5multimediawidgets5 \
    libqt5network5 \
    libqt5script5 \
    libqt5widgets5 \
    libqt5serialport5 \
    libusb-1.0-0 

RUN sudo apt-get clean

RUN sudo dpkg -i /tmp/qlcplus.deb

COPY rootfs/ /
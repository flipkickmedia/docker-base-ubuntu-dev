FROM ubuntu:latest AS ecosurv-base-dev

ENV LC_ALL=en_GB.UTF-8
ENV LANG=en_GB.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt update -y
RUN apt upgrade -y

RUN apt install -y software-properties-common \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    dnsutils \
    git \
    gnupg \
    iputils-ping \
    locales \
    lsb-release \
    make \
    mlocate \
    net-tools \
    openssh-server \
    pkg-config \
    procps \
    psmisc \
    tzdata \
    unzip \
    vim \
    zip \
    iputils-ping

RUN apt install -y libsecret-1-dev
RUN apt install -y libx11-dev
RUN apt install -y libxkbfile-dev

RUN locale-gen en_GB.UTF-8 && dpkg-reconfigure locales

COPY root /
COPY etc /

CMD service ssh start && tail -f /dev/null
EXPOSE 22/tcp

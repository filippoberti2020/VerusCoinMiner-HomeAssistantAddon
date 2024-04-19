ARG BUILD_FROM
FROM $BUILD_FROM

FROM python:3.9

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libcurl4-openssl-dev \
    libjansson-dev \
    libssl-dev \
    libhwloc-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libreadline6-dev \
    pkg-config \
    wget \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

# Clone the ccminer-verus repository, build the binary, and copy it
RUN git clone https://github.com/Oink70/ccminer-verus.git /ccminer-verus \
    && cd /ccminer-verus \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && cp ccminer-verus /usr/local/bin/ccminer-verus

# Copy the run.sh script
COPY run.sh /
# Copy the miner.py script
COPY miner.py /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

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

# Clone the ccminer-verus repository
RUN git clone https://github.com/Oink70/ccminer-verus.git /ccminer-verus && cd /ccminer-verus

# Build the ccminer-verus binary
RUN mkdir build && cd build && cmake .. && make

# Copy the ccminer-verus binary into the container
COPY --from=build /ccminer-verus/ccminer-verus /usr/local/bin/ccminer-verus

# Set the working directory
WORKDIR /config

# Set the entrypoint
ENTRYPOINT ["/run.sh"]


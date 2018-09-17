# Define base image
FROM ubuntu:14.04

MAINTAINER Li Zhang, Seven Bridges, <li.zhang@sbgenomics.com>

# extra metadata
LABEL version="1.0"
LABEL description="seqtk1.3 image with Dockerfile."

# Install required packages, this will install older version seqtk1.0-r31
RUN apt-get update && apt-get install -y git make gcc g++ zlibc zlib1g zlib1g-dev #build-essential #seqtk

#Download and install seqtk 1.3-r106
RUN git clone https://github.com/lh3/seqtk.git && \
    cd seqtk && \
    make && \
    make install
 
CMD ["/usr/local/bin/seqtk"]


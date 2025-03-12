FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3.12 \
    python3-pip \
    git

# Install the required package
RUN pip install --upgrade pip
RUN pip install PyYAML
# RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
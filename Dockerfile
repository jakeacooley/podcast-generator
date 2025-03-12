FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3.12 \
    python3-pip \
    git \
    python3-yaml \
    python3-venv

# Create a virtual environment
RUN python3 -m venv /venv

# Upgrade pip inside the virtual environment
RUN /venv/bin/pip install --upgrade pip

# Install python dependencies inside the virtual environment
RUN /venv/bin/pip install pyyaml

# Install the required package
RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENV PATH="/venv/bin:$PATH"
ENTRYPOINT ["/entrypoint.sh"]
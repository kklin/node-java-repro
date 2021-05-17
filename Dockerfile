FROM node:10.23.1

# Install python3.7 (from source) and dbt
RUN apt-get update \
    && apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget \
    && wget https://www.python.org/ftp/python/3.7.5/Python-3.7.5.tgz \
    && tar -xf Python-3.7.5.tgz \
    && cd Python-3.7.5 \
    && ./configure \
    && make install \
    && python3.7 -m pip install dbt

# Install Java (Used by the JDBC source). TODO: Pin version to jdk11.
RUN apt-get install -y default-jdk

WORKDIR /home/node/app
COPY . .

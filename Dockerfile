FROM python:3-slim

RUN apt update && \
    apt install -y build-essential && \
    pip3 install dxpy

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

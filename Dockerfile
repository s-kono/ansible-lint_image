FROM python:3.11-slim-bullseye as builder

RUN pip3 install --upgrade pip

COPY requirements.txt /

RUN pip3 install -r /requirements.txt

FROM python:3.11-slim-bullseye

RUN apt update -y \
  && apt install -y git

COPY --from=builder /usr/local/lib/python3.11/site-packages/ /usr/local/lib/python3.11/site-packages/
COPY --from=builder /usr/local/bin/ /usr/local/bin/

WORKDIR /data
ENTRYPOINT ["ansible-lint"]
ENV ANSIBLE_FORCE_COLOR=true

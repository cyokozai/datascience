FROM julia:latest

SHELL ["/bin/bash", "-c"]

ARG lang="C"

ENV DEBIAN_FRONTEND="noninter active"
ENV LC_ALL=${lang}
ENV TZ="Asia/Tokyo"

WORKDIR /home
COPY pkginstall.jl /home/pkginstall.jl

RUN apt -y update && apt -y upgrade &&\
    julia pkginstall.jl run &&\
    rm -rf pkginstall.jl &&\
    if [ ! -d result ]; then mkdir result; fi

COPY ./*.jl /home

CMD ["julia", "main.jl"]
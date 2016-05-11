FROM microsoft/aspnet:1.0.0-rc1-update1

ENV HOME=/app


RUN mkdir -p ${HOME} && \
    chown -R 1001:0 ${HOME}/ && \
    useradd -u 1001 -r -g 0 -d ${HOME} -s /sbin/nologin -c "Default Application User" default 


USER 1001
EXPOSE 5004

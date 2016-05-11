FROM microsoft/aspnet

ENV HOME=/opt/app-root/src

COPY . /app
RUN mkdir -p ${HOME} && \
    chown -R 1001:0 ${HOME}/ && \
    useradd -u 1001 -r -g 0 -d ${HOME} -s /sbin/nologin -c "Default Application User" default && \
    chown -R 1001:0 /app

WORKDIR /app
RUN ["dnu", "restore"]

USER 1001
EXPOSE 5004
ENTRYPOINT ["dnx", "-p", "project.json", "web"]

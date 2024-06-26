
FROM ubuntu:latest
USER root
RUN apt-get update && \
apt-get install -y python3-pip python-dev-is-python3 build-essential
ADD . /flask-app
WORKDIR /flask-app
RUN apt install -y python3-flask
COPY /certs /certs
ENTRYPOINT ["python3"]
CMD ["app.py"]
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"

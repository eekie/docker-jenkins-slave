FROM maven:3-jdk-8-alpine

RUN apk update && \
     apk upgrade && \
     apk add git

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENV JENKINS_URL="jenkins:50000"

CMD ["/entrypoint.sh"]

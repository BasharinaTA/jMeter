FROM ubuntu:latest

RUN apt-get update && apt-get install -y default-jre-headless wget unzip

RUN wget https://downloads.apache.org/jmeter/binaries/apache-jmeter-5.6.3.zip  && \
    unzip apache-jmeter-5.6.3.zip  && \
    rm apache-jmeter-5.6.3.zip  && \
    mv apache-jmeter-5.6.3 /opt/jmeter

COPY ./thread.jmx /opt/jmeter/bin/thread.jmx
COPY ./jmeter.sh /jmeter.sh

RUN chmod +x /jmeter.sh

ENTRYPOINT ["/jmeter.sh"]
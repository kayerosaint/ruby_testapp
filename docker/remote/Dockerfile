FROM amazon/aws-cli:2.2.4

RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "/tmp/session-manager-plugin.rpm" && \
    yum install -y /tmp/session-manager-plugin.rpm

RUN yum install -y jq which make

RUN curl -Ls https://raw.githubusercontent.com/aws-containers/amazon-ecs-exec-checker/main/check-ecs-exec.sh > /usr/local/bin/check-ecs-exec && chmod +x /usr/local/bin/check-ecs-exec

RUN mkdir /app

WORKDIR /app

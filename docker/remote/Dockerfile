FROM amazon/aws-cli:2.2.4

RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "/tmp/session-manager-plugin.rpm" && \
    yum install -y /tmp/session-manager-plugin.rpm

RUN yum install -y jq which make bash

RUN curl -Ls https://raw.githubusercontent.com/aws-containers/amazon-ecs-exec-checker/main/check-ecs-exec.sh > /usr/local/bin/check-ecs-exec && chmod +x /usr/local/bin/check-ecs-exec

ARG ECS_CLUSTER_NAME

ARG ECS_TASK_ID

ARG AWS_REGION
ENV AWS_REGION=$AWS_REGION

ARG AWS_SECRET_ACCESS_KEY
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

ARG AWS_ACCESS_KEY_ID
ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID

WORKDIR /usr/local/bin/

ENTRYPOINT [ "/bin/bash", "-c", "exec /usr/local/bin/check-ecs-exec $ECS_CLUSTER_NAME $ECS_TASK_ID\"${@}\"", "--" ]

RUN mkdir /app
WORKDIR /app

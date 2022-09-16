FROM amazon/aws-cli:2.2.4

RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "/tmp/session-manager-plugin.rpm" && \
    yum install -y /tmp/session-manager-plugin.rpm

RUN yum install -y jq which make bash

RUN curl -Ls https://raw.githubusercontent.com/aws-containers/amazon-ecs-exec-checker/main/check-ecs-exec.sh > /usr/local/bin/check-ecs-exec && chmod +x /usr/local/bin/check-ecs-exec

WORKDIR /usr/local/bin/

ENV AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}

ENV AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}

ENV AWS_REGION=${AWS_REGION}

ENV ECS_TASK_ID=${ECS_TASK_ID}

ENV ECS_CLUSTER_NAME=${ECS_CLUSTER_NAME}

RUN bash -c "./check-ecs-exec ${ECS_CLUSTER_NAME} ${ECS_TASK_ID}"

CLUSTER_NAME := $(shell aws ecs list-clusters | jq -r  ".clusterArns[]")
TASK_ID := $(shell aws ecs list-tasks --cluster=${CLUSTER_NAME} | jq -r ".taskArns[0]")

check_exec:
	check-ecs-exec ${CLUSTER_NAME} ${TASK_ID}

exec:
	aws ecs execute-command \
		--cluster ${CLUSTER_NAME} \
		--task ${TASK_ID} \
		--region us-east-1 \
		--container=web \
		--command /bin/bash \
		--interactive

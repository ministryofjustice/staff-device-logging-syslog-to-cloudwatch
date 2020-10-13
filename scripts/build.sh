log_group_name=$( jq -r '.syslog.logging.log_group_name' <<< "${LOGGING_TERRAFORM_OUTPUTS}" )
docker build -t docker_syslog ./docker --build-arg log_group_name=$text

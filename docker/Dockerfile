FROM timberio/vector:latest-alpine

ARG log_group_name
ARG config_file=vector.toml
ENV LGN=${log_group_name}

COPY ${config_file} /etc/vector/vector.toml

RUN sed -i "s/<AWS_LOG_GROUP_NAME>/$LGN/g" /etc/vector/vector.toml

FROM timberio/vector:latest-alpine
ENV LOG=debug

ARG log_group_name
ARG config_file=vector.toml
ENV LOG_GROUP_NAME=${log_group_name}

COPY ${config_file} /etc/vector/vector.toml

RUN sed -i "s/<AWS_LOG_GROUP_NAME>/$LOG_GROUP_NAME/g" /etc/vector/vector.toml

EXPOSE 514/udp

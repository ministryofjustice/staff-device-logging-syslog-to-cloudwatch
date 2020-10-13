FROM timberio/vector:latest-alpine

ARG log_group_name
ENV LGN=${log_group_name}

COPY ./vector.toml /etc/vector/vector.toml

RUN sed -i "s/<AWS_LOG_GROUP_NAME>/$LGN/g" /etc/vector/vector.toml

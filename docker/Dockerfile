FROM amazon/aws-for-fluent-bit

ARG log_group_name
ARG config_file=fluent-bit.conf
ENV LOG_GROUP_NAME=${log_group_name}

COPY ${config_file} /fluent-bit/etc/fluent-bit.conf
#COPY parsers.conf /fluent-bit/etc/parsers.conf

RUN sed -i "s/<AWS_LOG_GROUP_NAME>/$LOG_GROUP_NAME/g" /fluent-bit/etc/fluent-bit.conf

EXPOSE 514/udp

FROM alpine:latest
RUN apk add --update --no-cache openssh
RUN adduser -h /home/ansible -s /bin/sh -D ansible
RUN echo -n 'ansible:ansible' | chpasswd
#RUN mkdir /tmp/ssh
#RUN chown -R ansible:ansible /tmp/ssh
WORKDIR /home/ansible
#USER ansible
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /

FROM alpine:latest

EXPOSE 22

RUN apk add --update openssh git shadow \
&&  rm  -rf /tmp/* /var/cache/apk/*

RUN mkdir -p /git /var/run/sshd

RUN ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519 \
&&  ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa \
&&  ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa \
&&  ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
	
RUN adduser --disabled-password --shell /usr/bin/git-shell git \
&&  usermod -p '*' git \
&&  mkdir -p /home/git/.ssh

COPY sshd_config /etc/ssh/sshd_config
# COPY authorized_keys /home/git/.ssh/authorized_keys
COPY git-shell-commands/ /home/git/git-shell-commands/
COPY scripts/vars.sh /etc/profile.d/git-server-vars.sh

RUN chown -Rv git:git /home/git \
&&  chown -v git:git /git \
&&  chmod -v 700 /home/git/.ssh \
&&  chmod -v +x  /home/git/git-shell-commands/*
# &&  chmod -v 600 /home/git/.ssh/authorized_keys \

CMD [ "/usr/sbin/sshd", "-D", "-e" ]


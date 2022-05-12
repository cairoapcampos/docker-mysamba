FROM debian:11.3

ENV TZ=America/Sao_Paulo \
    LANG=pt_BR.utf8 \
    LANGUAGE=pt_BR:pt \
    LC_ALL=pt_BR.UTF-8

RUN apt-get update

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt-get install -y locales \
    && localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8

RUN apt-get install -y nano samba \
    && apt-get clean \
    && apt-get  autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN addgroup grupo 

COPY smb.conf /etc/samba/smb.conf
COPY smbadd /sbin/smbadd
COPY smbrm /sbin/smbrm

EXPOSE 139/tcp 445/tcp

RUN mkdir /dados

RUN chgrp grupo /dados && chmod 770 /dados 

VOLUME ["/dados", "/etc/samba"]

workdir /dados

CMD ["smbd", "--foreground", "--log-stdout", "--no-process-group"]

#teste comentário
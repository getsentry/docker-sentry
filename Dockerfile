FROM python:2.7

RUN groupadd user && useradd --create-home --home-dir /home/user -g user user
WORKDIR /home/user

ENV SENTRY_VERSION 6.4.4

RUN pip install sentry==$SENTRY_VERSION

COPY sentry.conf.py /home/user/.sentry/
RUN chown -R user:user /home/user/.sentry # TODO this might not work on AUFS sometimes

USER user
EXPOSE 9000
CMD ["sentry", "start"]

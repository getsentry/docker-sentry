# Explicitly 2.7.10 because of https://github.com/getsentry/sentry/issues/2429
FROM python:2.7.10

# Sane defaults for pip
ENV PIP_NO_CACHE_DIR off
ENV PIP_DISABLE_PIP_VERSION_CHECK on

ENV SENTRY_VERSION 8.0.0rc1

RUN pip install sentry==$SENTRY_VERSION

ENV SENTRY_CONF /etc/sentry
RUN mkdir -p /etc/sentry

# Allow Celery to run as root
ENV C_FORCE_ROOT 1

COPY docker-entrypoint.sh /

EXPOSE 9000

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]

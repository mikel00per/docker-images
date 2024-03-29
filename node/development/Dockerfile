ARG NODE_VERSION

FROM node:${NODE_VERSION}

RUN apk update; \
    apk upgrade; \
    apk add bash shadow;

ARG NODE_HEALTHCHECK_SOURCE
ARG NODE_HEALTHCHECK_TARGET
COPY ${NODE_HEALTHCHECK_SOURCE} ${NODE_HEALTHCHECK_TARGET}

ARG UID
ARG GID
ARG UNAME
ARG GNAME
RUN usermod -u ${UID} ${UNAME} && groupmod -g ${GID} ${GNAME}

ARG NODE_CODE_TARGET
RUN mkdir -p ${NODE_CODE_TARGET}
RUN chown ${UNAME}:${GNAME} -R ${NODE_CODE_TARGET}

ARG NODE_ENTRYPOINT_SOURCE
ARG NODE_ENTRYPOINT_TARGET
ENV NODE_ENTRYPOINT_TARGET=$NODE_ENTRYPOINT_TARGET

COPY ${NODE_ENTRYPOINT_SOURCE} ${NODE_ENTRYPOINT_TARGET}

HEALTHCHECK --interval=10s --timeout=3s --retries=3 CMD ["docker-healthcheck"]

USER node

WORKDIR ${NODE_CODE_TARGET}

ARG NODE_PORT
EXPOSE ${NODE_PORT}

ENTRYPOINT ${NODE_ENTRYPOINT_TARGET}

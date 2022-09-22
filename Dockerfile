# Dockerfile development version
FROM ruby:3.1.0 AS checkplant-challenge

ARG USER_ID
ARG GROUP_ID
ARG TOKEN_GITHUB
ARG USER_GITHUB

RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user

ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH
COPY checkplant-challenge/ .
RUN gem install rspec
RUN chown -R user:user /opt/app

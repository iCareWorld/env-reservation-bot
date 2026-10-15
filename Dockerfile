FROM ruby:3.4-slim-trixie

ENV LANG=en_US.UTF-8

RUN apt-get update && apt-get install --no-install-recommends -y build-essential

ENV LAMBDA_TASK_ROOT=/var/task
WORKDIR ${LAMBDA_TASK_ROOT}

ENTRYPOINT ["bash", "-c"]
CMD ["/var/task/.buildkite/bundle.sh"]

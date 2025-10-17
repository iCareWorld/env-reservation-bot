FROM public.ecr.aws/lambda/ruby:3.2

ENV LANG=en_US.UTF-8

RUN yum install -y ruby3.2-devel.x86_64 libyaml-devel.x86_64
RUN yum groupinstall "Development Tools" -y

WORKDIR ${LAMBDA_TASK_ROOT}

ENTRYPOINT ["bash", "-c"]
CMD ["/var/task/.buildkite/bundle.sh"]

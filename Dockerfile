# FROM public.ecr.aws/lambda/provided:al2.2026.10.13.17
FROM ruby:3.4-slim-trixie

ENV LANG=en_US.UTF-8
# # RUN dnf install -y libyaml-devel.x86_64
# RUN dnf install ruby3.4 ruby3.4-devel ruby3.4-rubygems-devel -y

# # RUN dnf group install development-tools -y
# RUN yum groupinstall "Development Tools" -y


# Install the runtime interface client for Ruby
RUN gem install aws_lambda_ric

# Add the runtime interface client to the PATH
ENV PATH="/usr/local/bundle/bin:${PATH}"

# Create a directory for the Lambda function
ENV LAMBDA_TASK_ROOT=/var/task
RUN mkdir -p ${LAMBDA_TASK_ROOT}
# WORKDIR ${LAMBDA_TASK_ROOT}

# Copy Gemfile and Gemfile.lock
# COPY Gemfile Gemfile.lock ${LAMBDA_TASK_ROOT}/

# Install Bundler and the specified gems
# RUN gem install bundler:2.4.20 && \
#     bundle config set --local path 'vendor/bundle' && \
#     bundle install

# Copy function code
# COPY lambda_function.rb ${LAMBDA_TASK_ROOT}/

# Set runtime interface client as default command for the container runtime
# ENTRYPOINT [ "aws_lambda_ric" ]

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
# CMD [ "lambda_function.LambdaFunction::Handler.process" ]

WORKDIR ${LAMBDA_TASK_ROOT}

ENTRYPOINT ["bash", "-c"]
CMD ["/var/task/.buildkite/bundle.sh"]

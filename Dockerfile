FROM continuumio/miniconda3:4.6.14

# diffengineai/airflow-conda-ml
LABEL maintainer="difference-engine"

# Never prompts the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

# Airflow
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG AIRFLOW_USER_HOME=/usr/local/airflow

# canary, live, local, test or ci
ARG PROJECT_ENV=canary
# production, development or test
ARG PYTHON_ENV=development

# Setup environment
ENV AIRFLOW_GPL_UNIDECODE yes
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}
ENV PROJECT_ENV=${PROJECT_ENV}
ENV PYTHON_ENV=${PROJECT_ENV}

# Define en_US.
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8

ENV PATH /opt/conda/envs/inference/bin:/opt/conda/bin:$PATH

RUN set -ex \
    && buildDeps=' \
        freetds-dev \
        libkrb5-dev \
        libsasl2-dev \
        libssl-dev \
        libffi-dev \
        libpq-dev \
        git \
    ' \
    && apt-get update -yqq \
    && apt-get upgrade -yqq \
    && apt-get install -yqq --no-install-recommends \
        $buildDeps \
        freetds-bin \
        build-essential \
        default-libmysqlclient-dev \
        apt-utils \
        xauth \
        sudo \
        tree \
        curl \
        rsync \
        netcat \
        locales \
        iptables \
        openssh-client \
    && sed -i 's/^# en_US.UTF-8 UTF-8$/en_US.UTF-8 UTF-8/g' /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
    && apt-get purge --auto-remove -yqq $buildDeps \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man \
        /usr/share/doc \
        /usr/share/doc-base


COPY conda-production.yml /environment.yml
RUN groupadd -g ${GROUP_ID} airflow \
    && useradd -u ${USER_ID} -ms /bin/bash -d ${AIRFLOW_USER_HOME} -g airflow airflow \
    && usermod -aG sudo airflow \
    && conda env create -f environment.yml \
    && conda clean -a -y

RUN conda init bash \
    && su - airflow -c 'conda init bash' \
    && echo '# Always activate conda' >> ~/.bashrc \
    && echo '. /opt/conda/bin/activate inference' >> ~/.bashrc \
    && . ~/.bashrc \
    && pip install -U pip setuptools wheel \
    && rm -rf \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man \
        /usr/share/doc \
        /usr/share/doc-base

COPY scripts/entrypoint.sh /entrypoint.sh
COPY config/airflow.cfg ${AIRFLOW_USER_HOME}/airflow.cfg

RUN echo '# Always activate conda' >> ${AIRFLOW_USER_HOME}/.bashrc \
    && echo '. /opt/conda/bin/activate inference' >> ${AIRFLOW_USER_HOME}/.bashrc
RUN chown -R airflow: ${AIRFLOW_USER_HOME}
RUN echo '%sudo  ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers

EXPOSE 8080 5555 8793 8888 9999 9090 9100 9103 9107 8100 8103 8107

USER airflow
WORKDIR ${AIRFLOW_USER_HOME}
ENTRYPOINT ["/entrypoint.sh"]
CMD ["webserver"]

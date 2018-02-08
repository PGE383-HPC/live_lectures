FROM johntfoster/pytrilinos:2d03ab1bb413

ENV NB_USER default
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
RUN chown -R ${NB_UID} ${CONDA_HOME}
USER ${NB_USER}

ENV PATH ${CONDA_HOME}/bin:${PATH}

RUN pip install notebook

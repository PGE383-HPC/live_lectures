FROM johntfoster/pytrilinos:12700159ce36


ENV PATH ${HOME}/miniconda/bin:${PATH}

RUN pip install --no-cache-dir notebook
RUN pip install --no-cache-dir RISE
RUN jupyter-nbextension install rise --py --sys-prefix
RUN jupyter-nbextension enable rise --py --sys-prefix

USER root
RUN mkdir ${HOME}/notebooks
COPY *.ipynb ${HOME}/notebooks
RUN chown -R ${NB_USER} ${HOME}
RUN rm miniconda.sh
WORKDIR ${HOME}/notebooks
USER ${NB_USER}

CMD jupyter notebook --ip 0.0.0.0

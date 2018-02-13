FROM johntfoster/pytrilinos:12700159ce36


ENV PATH ${HOME}/miniconda/bin:${PATH}

RUN pip install --no-cache-dir notebook
RUN pip install --no-cache-dir RISE
RUN pip install --no-cache-dir jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --sys-prefix
RUN jupyter nbextension install rise --py --sys-prefix
RUN jupyter nbextension enable rise --py --sys-prefix
RUN jupyter nbextension enable hide_input/main --sys-prefix
RUN jupyter nbextension enable init_cell/main --sys-prefix

USER root
RUN mkdir ${HOME}/notebooks
COPY *-rise.ipynb ${HOME}/notebooks/
COPY *.pdf ${HOME}/notebooks/
COPY images ${HOME}/notebooks/images
COPY rise.css ${HOME}/notebooks/
RUN chown -R ${NB_USER} ${HOME}/notebooks
RUN rm miniconda.sh
WORKDIR ${HOME}/notebooks
USER ${NB_USER}
RUN jupyter trust ${HOME}/notebooks/*.ipynb

CMD jupyter notebook --ip 0.0.0.0

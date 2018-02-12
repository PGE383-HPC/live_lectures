FROM johntfoster/pytrilinos:12700159ce36


ENV PATH ${HOME}/miniconda/bin:${PATH}

RUN pip install --no-cache-dir notebook
RUN pip install --no-cache-dir RISE
RUN jupyter-nbextension install rise --py --sys-prefix
RUN jupyter-nbextension enable rise --py --sys-prefix

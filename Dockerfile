FROM continuumio/miniconda3:4.9.2
LABEL authors="Phil Palmer" \
    description="Docker image containing dependencies for DeepVirFinder https://github.com/jessieren/DeepVirFinder"

# Install the conda environment
COPY environment.yml /
RUN conda env create --quiet -f /environment.yml && conda clean -a

# Install DeepVirFinder
RUN git clone https://github.com/jessieren/DeepVirFinder /DeepVirFinder && \
    chmod +x /DeepVirFinder/dvf.py

# Add DeepVirFinder and conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /DeepVirFinder:/opt/conda/envs/dvf/bin:$PATH
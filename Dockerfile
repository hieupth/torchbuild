ARG CUDA_VERSION=11.6.2

FROM hieupth/minicuda:${CUDA_VERSION}-devel

ARG CUDA_VERSION
ENV TORCH_VERSION=v1.12.1

RUN IFS='.' read -r -a cuda_version <<< "${CUDA_VERSION}" && \
    conda install astunparse numpy ninja pyyaml cffi typing_extensions future six requests dataclasses mkl mkl-include magma-cuda${cuda_version[0]}${cuda_version[1]} -c pytorch

RUN wget https://github.com/pytorch/pytorch/archive/refs/tags/${TORCH_VERSION}.tar.gz -O torch.tar.gz && \
    mkdir torch && tar -zxf torch.tar.gz -C torch --strip-components 1 && \
    rm -rf torch.tar.gz

WORKDIR torch

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]
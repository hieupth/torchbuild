ARG CUDA=116
ARG TORCH=v1.12.1

FROM hieupth/minicuda:116.devel

ARG CUDA
ARG TORCH

RUN conda install astunparse numpy ninja pyyaml cffi typing_extensions future six requests dataclasses mkl mkl-include magma-cuda${CUDA} -c pytorch

RUN wget https://github.com/pytorch/pytorch/archive/refs/tags/${TORCH}.tar.gz -O torch.tar.gz
RUN mkdir torch && tar -zxf torch.tar.gz -C torch --strip-components 1

WORKDIR torch

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]
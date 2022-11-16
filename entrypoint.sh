#!/bin/bash

set -ex;

MAX_JOBS=1 USE_CUDA=1 USE_CUDNN=1 BUILD_TEST=0 USE_MKLDNN=1 TORCH_CUDA_ARCH_LIST=All \
CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"} && \
    python setup.py clean && \
    python setup.py bdist_wheel
#! /bin/bash

conda install pytorch=1.0.1 torchvision cudatoolkit=10.0 -c pytorch -y

root=`pwd`

# Install dependecies
conda install numpy matplotlib pillow scipy tqdm scikit-learn -y
pip install tensorflow-gpu==1.1.0
pip install tensorboardX==1.7

# Compile CUDA kernel for CD/EMD loss
cd metrics/pytorch_structural_losses/
make clean
make
cd $root

# install torchdiffeq
git clone https://github.com/rtqichen/torchdiffeq.git
cd torchdiffeq
pip install -e .
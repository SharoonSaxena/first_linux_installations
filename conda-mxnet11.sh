curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
conda create --name mxnet112 python=3.9.5
conda activate mxnet112
conda install pip
conda install -c conda-forge cudatoolkit=11.2 cudnn=8.1.0
mkdir -p $CONDA_PREFIX/etc/conda/activate.d
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/' > $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
pip install mxnet-cu110==2.0.0a0
python3 -c "import mxnet as mx; a = mx.nd.ones((2, 3), mx.gpu()); b = a * 2 + 1; b.asnumpy()"

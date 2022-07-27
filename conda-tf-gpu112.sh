curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
conda create --name tf-gpu112 python=3.9.5
conda activate tf-gpu112
conda install pip
conda install -c conda-forge tensorflow-gpu
mkdir -p $CONDA_PREFIX/etc/conda/activate.d
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/' > $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
## https://gist.github.com/zrruziev/b93e1292bf2ee39284f834ec7397ee9f
python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"

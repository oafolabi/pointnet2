CUDA_DIR='/usr/local/cuda'
TENSORFLOW_DIR='/home/oladapo/anaconda3/envs/py36'

TF_INC=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_include())')
TF_LIB=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_lib())')

echo $TF_INC
#/bin/bash
$CUDA_DIR/bin/nvcc -std=c++11 tf_sampling_g.cu -o tf_sampling_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC

# TF1.2
#g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I /usr/local/lib/python2.7/dist-packages/tensorflow/include -I /usr/local/cuda-8.0/include -lcudart -L /usr/local/cuda-8.0/lib64/ -O2 -D_GLIBCXX_USE_CXX11_ABI=0

# TF1.4
g++ -std=c++11 tf_sampling.cpp tf_sampling_g.cu.o -o tf_sampling_so.so -shared -fPIC -I $TENSORFLOW_DIR/lib/python3.6/site-packages/tensorflow/include -I $CUDA_DIR/include -I $TF_INC/external/nsync/public -lcudart -L $CUDA_DIR/lib64/ -L$TF_LIB -ltensorflow_framework -O2 

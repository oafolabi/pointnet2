# TF1.2
#g++ -std=c++11 tf_interpolate.cpp -o tf_interpolate_so.so -shared -fPIC -I /usr/local/lib/python2.7/dist-packages/tensorflow/include -I /usr/local/cuda-8.0/include -lcudart -L /usr/local/cuda-8.0/lib64/ -O2 -D_GLIBCXX_USE_CXX11_ABI=0

# TF1.4
g++ -std=c++11 tf_interpolate.cpp -o tf_interpolate_so.so -shared -fPIC -I $TENSORFLOW_DIR/lib/python3.5/site-packages/tensorflow/include -I $CUDA_DIR/include -I $TENSORFLOW_DIR/lib/python3.5/site-packages/tensorflow/include/external/nsync/public -lcudart -L $CUDA_DIR/lib64/ -L$TENSORFLOW_DIR/lib/python3.5/site-packages/tensorflow -ltensorflow_framework -O2 -D_GLIBCXX_USE_CXX11_ABI=0

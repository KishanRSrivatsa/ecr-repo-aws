FROM tensorflow/tensorflow:2.10.0-gpu
# RUN apt-get update &&  apt-get -y upgrade

# Install sagemaker-training toolkit that contains the common functionality necessary to create a container compatible with SageMaker and the Python SDK.
RUN pip3 install sagemaker-training

# Install required Version of require packages
#RUN pip3 install -r requirements.txt

# Copies the training code inside the container
COPY train.py ./train.py

ENV PYTHONPATH=.

# Defines train.py as script entrypoint
ENV SAGEMAKER_PROGRAM train.py

COPY train.py /opt/ml/code/train.py
ENV SAGEMAKER_PROGRAM /opt/ml/code/train.py


### build and run commands
# docker build -t sagemaker_integration -f Dockerfile .
# docker run -i -t sagemaker_integration /bin/bash


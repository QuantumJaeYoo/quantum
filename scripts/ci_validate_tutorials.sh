#!/bin/bash
# Copyright 2020 The TensorFlow Quantum Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =============================================================================

# Run the tutorials using the installed pip package
pip install jupyter nbclient==0.6.5 jupyter-client==6.1.12 ipython==7.22.0
# Workaround for ipykernel - see https://github.com/ipython/ipykernel/issues/422
pip install ipykernel==5.1.1
# OpenAI Gym pip package needed for the quantum reinforcement learning tutorial
pip install gym==0.24.1
# seaborn has also numpy dependency, it requires version >= 0.12.0.
pip install seaborn==0.12.0
# tf_docs pip package needed for noise tutorial.
pip install -q git+https://github.com/tensorflow/docs
# Leave the quantum directory, otherwise errors may occur
cd ..
examples_output=$(python3 quantum/scripts/test_tutorials.py)
exit_code=$?
if [ "$exit_code" == "0" ]; then
	exit 0;
else
	echo "Tutorials failed to run to completion:"
	echo "{$examples_output}"
	exit 64;
fi

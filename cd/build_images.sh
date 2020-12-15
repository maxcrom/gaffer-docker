#!/bin/bash

# Copyright 2020 Crown Copyright
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

set -e

root_directory="$( cd $(dirname $(dirname $0)) > /dev/null 2>&1 && pwd )"
cd $root_directory

docker-compose --project-directory ./docker/accumulo/ -f ./docker/accumulo/docker-compose.yaml build
docker-compose --project-directory ./docker/gaffer-operation-runner/ -f ./docker/gaffer-operation-runner/docker-compose.yaml build
docker-compose --project-directory ./docker/gaffer-federated-store/ -f ./docker/gaffer-federated-store/docker-compose.yaml build
docker-compose --project-directory ./docker/gaffer-pyspark-notebook/ -f ./docker/gaffer-pyspark-notebook/docker-compose.yaml build notebook
docker-compose --project-directory ./docker/gaffer-jhub-options-server -f ./docker/gaffer-jhub-options-server/docker-compose-yaml build

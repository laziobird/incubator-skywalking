# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/usr/bin/env sh

function killProcess() 
{ 
    NAME=$1 
    echo $NAME 
    #获取进程 PID 
    PID=$(ps -e | grep $NAME | awk '{print $1}') 
    echo "WANT TO KILL PID: $PID" 
    #杀死进程 
    kill -9 $PID 
}

echo "stop skywalking=>collect"
killProcess "org.apache.skywalking.oap.server.starter.OAPServerStartUp"

echo "---------------------------"
sleep 1

echo "stop skywalking=>webapp"
killProcess "skywalking-webapp.jar"




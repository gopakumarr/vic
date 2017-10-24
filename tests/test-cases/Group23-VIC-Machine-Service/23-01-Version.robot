# Copyright 2017 VMware, Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License

*** Settings ***
Documentation	Test 23-01 - Version
Resource	../../resources/Util.robot
Resource	../../resources/Group23-VIC-Machine-Service-Util.robot
Suite Setup	Start VIC Machine Server
Suite Teardown	Terminate All Processes  kill=True
Default Tags


*** Variables ***
${RC}		The return code of the last curl invocation
${OUTPUT}	The output of the last curl invocation
${STATUS}	The HTTP status of the last curl invocation


*** Keywords ***
Get Version
    Get Path    version


Verify Version
    Should Match Regexp    ${OUTPUT}    v\\d+\\.\\d+\\.\\d+-\\w+-\\d+-[a-f0-9]+
    Should Not Contain     ${OUTPUT}    "


*** Test Cases ***
Get Version
    Sleep    1s    for service to start

    Get Version

    Verify Return Code
    Verify Status Ok
    Verify Version
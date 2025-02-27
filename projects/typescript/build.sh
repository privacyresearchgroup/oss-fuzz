#!/bin/bash -eu
# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

# Install dependencies.
npm install
npm install --save-dev @jazzer.js/core

# Build Fuzzers.
# Fuzzing is kinda slow and a resource hog so we have to adjust the timeout and
# memory limit to satisfy libfuzzer
compile_javascript_fuzzer TypeScript fuzz_ast -i typescript --sync --timeout=30000 -- -rss_limit_mb=4096
compile_javascript_fuzzer TypeScript fuzz_compiler -i typescript --sync --timeout=30000 -- -rss_limit_mb=4096

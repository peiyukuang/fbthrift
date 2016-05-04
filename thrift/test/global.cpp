/*
 * Copyright 2016 Facebook, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <thrift/test/gen-cpp/global_types.h>

#include <tuple>

bool global_structA::operator<(const global_structA& rhs) const {
  return std::tie(a, b) < std::tie(rhs.a, rhs.b);
}

bool global_structB::operator<(const global_structB& rhs) const {
  return std::tie(c, d) < std::tie(rhs.c, rhs.d);
}

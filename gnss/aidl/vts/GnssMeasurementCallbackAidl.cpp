/*
 * Copyright (C) 2020 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "GnssMeasurementCallbackAidl"

#include "GnssMeasurementCallbackAidl.h"
#include <inttypes.h>
#include <log/log.h>

using android::hardware::gnss::GnssData;

android::binder::Status GnssMeasurementCallbackAidl::gnssMeasurementCb(const GnssData& gnssData) {
    ALOGI("gnssMeasurementCb");
    ALOGV("elapsedRealtime: flags = 0x%X, timestampNs: %" PRId64
          ", timeUncertaintyNs=%lf"
          " isFullTracking=%s",
          gnssData.elapsedRealtime.flags, gnssData.elapsedRealtime.timestampNs,
          gnssData.elapsedRealtime.timeUncertaintyNs, gnssData.isFullTracking ? "true" : "false");

    gnss_data_cbq_.store(gnssData);
    return android::binder::Status::ok();
}

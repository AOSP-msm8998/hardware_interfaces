/*
 * Copyright (C) 2022 The Android Open Source Project
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

package android.hardware.wifi;

import android.hardware.wifi.NanCipherSuiteType;
import android.hardware.wifi.NanDataPathSecurityType;

/**
 * Configuration of NAN data-path security.
 */
@VintfStability
parcelable NanDataPathSecurityConfig {
    /**
     * Security configuration of the data-path (NDP). Security is enabled if not equal to
     * |NanDataPathSecurityType.OPEN|.
     * NAN Spec: Service Discovery Extension Attribute (SDEA) / Control / Security Required
     */
    NanDataPathSecurityType securityType;
    /**
     * Cipher type for data-paths. If |securityType| is |NanDataPathSecurityType.OPEN| then must
     * be set to |NanCipherSuiteType.NONE|. Otherwise a non-|NanCipherSuiteType.NONE| cipher suite
     * must be specified.
     */
    NanCipherSuiteType cipherType;
    /**
     * Optional Pairwise Master Key (PMK). Must be specified (and is only used) if |securityType| is
     * set to |NanDataPathSecurityType.PMK|.
     * Ref: IEEE 802.11i
     */
    byte[32] pmk;
    /**
     * Optional Passphrase. Must be specified (and is only used) if |securityType| is set to
     * |NanDataPathSecurityType.PASSPHRASE|.
     * Min length: |IWifiNanIface.MIN_DATA_PATH_CONFIG_PASSPHRASE_LENGTH|
     * Max length: |IWifiNanIface.MAX_DATA_PATH_CONFIG_PASSPHRASE_LENGTH|
     * NAN Spec: Appendix: Mapping passphrase to PMK for NCS-SK Cipher Suites
     */
    byte[] passphrase;
    /**
     * Security Context Identifier attribute contains PMKID. Shall be included in NDP setup and
     * response messages. Security Context Identifier identifies the Security Context. When
     * security is enabled this field contains the 16 octet PMKID identifying the PMK used for
     * setting up the Secure Data Path.
     */
    byte[16] scid;
}

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

package android.hardware.media.c2;

import android.hardware.common.NativeHandle;
/**
 * Surface(BufferQueue/IGBP) synchronization object regarding # of dequeued
 * output buffers. This keeps # of dequeued buffers from Surface less than
 * configured max # of dequeued buffers all the time.
 */
parcelable SurfaceSyncObj {
    /**
     * ASharedMemory for synchronization data. Layout is below
     *
     * |lock(futex)                               4bytes|
     * |conditional_variable(futex)               4bytes|
     * |# of max dequeable buffer                 4bytes|
     * |# of dequeued buffer                      4bytes|
     * |Status of the surface                     4bytes|
     *      INIT        = 0, Configuring surface is not finished.
     *      ACTIVE      = 1, Surface is ready to allocate(dequeue).
     *      SWITCHING   = 2, Switching to the new surface. It is blocked
     *                       to allocate(dequeue) a buffer until switching
     *                       completes.
     */
    NativeHandle syncMemory;
    /**
     * BufferQueue id.
     */
    long bqId;
    /**
     * Generation id.
     */
    int generationId;
    /**
     * Consumer usage flags. See +ndk
     * libnativewindow#AHardwareBuffer_UsageFlags for possible values.
     */
    long consumerUsage;
}

# Copyright (C) 2022 The Proton AOSP Project
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

PRODUCT_HOST_PACKAGES += \
    aapt2 \
    avbtool \
    brotli \
    debugfs \
    signapk \
    zipalign

# Updater
PRODUCT_PACKAGES += \
    Updater

PRODUCT_COPY_FILES += \
    vendor/proton/build/etc/init/init.protonaosp-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.protonaosp-updater.rc

# Use the default charger mode images
PRODUCT_PACKAGES += \
    charger_res_images

# Disable remote keyguard animation
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.wm.enable_remote_keyguard_animation=0

# Pixel Framework
$(call inherit-product, vendor/pixel-framework/config.mk)
# Copyright (C) 2020 The Proton AOSP Project
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

$(call inherit-product, vendor/proton/themes/themes.mk)

LOCAL_PATH := vendor/proton/apps

# LineageOS apps
PRODUCT_PACKAGES += \
    ExactCalculator \
    Jelly

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# Wallpapers
PRODUCT_PACKAGES += \
    ProtonWallpaperStub \
    StatixThemePicker

# Repainter integration
PRODUCT_PACKAGES += \
    RepainterServicePriv

# Gamespace
PRODUCT_PACKAGES += \
    GameSpace

# Permissions for Google product apps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/default-permissions-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default-permissions-product.xml

# Google apps and services
ifeq ($(WITH_GMS),true)

$(call inherit-product, vendor/gms/gms.mk)

$(call inherit-product, packages/overlays/ThemeIcons/config.mk)

# SetupWizard
PRODUCT_PRODUCT_PROPERTIES += \
    ro.setupwizard.rotation_locked=true \
    setupwizard.theme=glif_v3_light

# Google Assistant
PRODUCT_PRODUCT_PROPERTIES += \
    ro.opa.eligible_device=true

# Client ID
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=android-google

# Overlays
PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_PATH)/gms_overlay

endif

# Sandboxed Google Play
PRODUCT_PACKAGES += \
    GmsCompat

# Face Unlock
PRODUCT_PACKAGES += \
    FaceUnlockService
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face_unlock_service.enabled=true
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml

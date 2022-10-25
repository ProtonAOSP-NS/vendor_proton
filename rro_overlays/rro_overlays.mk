ifneq ($(VANILLA_BUILD),true)
# RRO Overlays
PRODUCT_PACKAGES += \
    NetworkStackOverlay \
    PixelLauncherOverlay \
    PixelLauncherCustomOverlay \
    PixelLauncherThemeResources \
    PixelDocumentsUIGoogleOverlay \
    BuiltInPrintServiceOverlay \
    GooglePermissionControllerOverlay \
    PixelConfigOverlayCommon \
    TeleServiceOverlay \
    CaptivePortalLoginOverlay \
    GoogleWebViewOverlay \
    TelecomOverlay \
    CellBroadcastServiceOverlay \
    SettingsGoogleOverlay \
    SettingsGoogleOverlayPixel2022 \
    TelephonyProviderOverlay \
    ContactsProviderOverlay \
    PixelConfigOverlay2018 \
    SettingsProviderOverlay \
    TraceurOverlay \
    PixelConfigOverlay2019 \
    PixelConfigOverlay2019Midyear \
    PixelConfigOverlay2021 \
    PixelSetupWizardOverlay \
    PixelSetupWizardOverlay2019 \
    PixelSetupWizardOverlay2021 \
    PixelSetupWizardStringsOverlay \
    PixelFwResOverlay \
    GoogleConfigOverlay \
    SystemUIGoogleOverlay \
    StorageManagerGoogleOverlay \
    FlipendoOverlay
endif


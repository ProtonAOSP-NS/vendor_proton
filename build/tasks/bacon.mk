BUILD_DATE := $(shell date +%Y%m%d)
ifeq ($(WITH_GMS),true)
CUSTOM_ROM_TARGET_PACKAGE := $(PRODUCT_OUT)/ProtonAOSP-$(CUSTOM_ROM_VERSION)-$(PRODUCT_DEVICE)-$(BUILD_DATE)-gapps.zip
else
CUSTOM_ROM_TARGET_PACKAGE := $(PRODUCT_OUT)/ProtonAOSP-$(CUSTOM_ROM_VERSION)-$(PRODUCT_DEVICE)-$(BUILD_DATE).zip
endif

.PHONY: bacon
bacon: otapackage
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(CUSTOM_ROM_TARGET_PACKAGE)
	@echo -e "zip: "$(CUSTOM_ROM_TARGET_PACKAGE)
	@echo -e "size:`ls -lah $(CUSTOM_ROM_TARGET_PACKAGE) | cut -d ' ' -f 5`"

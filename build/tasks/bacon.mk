BUILD_DATE := $(shell date +%Y%m%d)
BUILD_TIME := $(shell date +%H%M)

CUSTOM_ROM_TARGET_PACKAGE := $(PRODUCT_OUT)/ProtonAOSP-$(CUSTOM_ROM_VERSION)-$(PRODUCT_DEVICE)-$(BUILD_DATE)-$(BUILD_TIME)-$(BUILD_VARIANT).zip


.PHONY: bacon signed
bacon: otapackage
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(CUSTOM_ROM_TARGET_PACKAGE)
	@echo -e "zip: "$(CUSTOM_ROM_TARGET_PACKAGE)
	@echo -e "size:`ls -lah $(CUSTOM_ROM_TARGET_PACKAGE) | cut -d ' ' -f 5`"

signed: target-files-package otatools
	$(hide) $(HOST_OUT)/bin/sign_target_files_apks -o -d vendor/keys $(BUILT_TARGET_FILES_PACKAGE) $(SIGNED_TARGET_FILES_PACKAGE)
	$(hide) $(HOST_OUT)/bin/ota_from_target_files -k vendor/keys/releasekey --block $(SIGNED_TARGET_FILES_PACKAGE) $(CUSTOM_ROM_TARGET_PACKAGE)
	$(hide) rm $(BUILT_TARGET_FILES_PACKAGE)
	@echo -e "signed zip: "$(CUSTOM_ROM_TARGET_PACKAGE)
	@echo -e "size:`ls -lah $(CUSTOM_ROM_TARGET_PACKAGE) | cut -d ' ' -f 5`"

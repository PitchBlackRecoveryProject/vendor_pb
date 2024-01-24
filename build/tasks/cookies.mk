
PB_TARGET_PACKAGE := $(PRODUCT_OUT)/pb-$(ROM_VERSION).zip

.PHONY: cookies
cookies: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(PB_TARGET_PACKAGE)
	$(hide) $(shell md5sum) $(PB_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(PB_TARGET_PACKAGE).md5sum
	@echo -e "Package complete: $(PB_TARGET_PACKAGE)" >&2

include theos/makefiles/common.mk

BUNDLE_NAME = snapstoreprefs
snapstoreprefs_FILES = snapstoreprefs.mm
snapstoreprefs_INSTALL_PATH = /Library/PreferenceBundles
snapstoreprefs_FRAMEWORKS = UIKit
snapstoreprefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/snapstoreprefs.plist$(ECHO_END)

include theos/makefiles/common.mk

TWEAK_NAME = snapstore
snapstore_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += snapstoreprefs
include $(THEOS_MAKE_PATH)/aggregate.mk

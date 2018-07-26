ARCHS = arm64
include $(THEOS)/makefiles/common.mk
TARGET = iphone:latest:11.1
BUNDLE_NAME = AppleIdPasswordFillerPrefs
AppleIdPasswordFillerPrefs_FILES = prefRootListController.m
AppleIdPasswordFillerPrefs_INSTALL_PATH = /Library/PreferenceBundles
AppleIdPasswordFillerPrefs_FRAMEWORKS = UIKit
AppleIdPasswordFillerPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/AppleIdPasswordFillerPrefs.plist$(ECHO_END)

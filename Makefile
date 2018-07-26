ARCHS = arm64
include $(THEOS)/makefiles/common.mk

TARGET = iphone:latest:11.1
TWEAK_NAME = AppleIdPasswordFiller
AppleIdPasswordFiller_FILES = Tweak.xm
AppleIdPasswordFiller_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += appleidpasswordfillerprefs
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"

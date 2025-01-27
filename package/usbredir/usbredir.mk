################################################################################
#
# usbredir
#
################################################################################

USBREDIR_VERSION = 0.11.0
USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.xz
USBREDIR_SITE = http://spice-space.org/download/usbredir
USBREDIR_LICENSE = LGPL-2.1+ (libraries)
USBREDIR_LICENSE_FILES = COPYING.LIB
USBREDIR_INSTALL_STAGING = YES
USBREDIR_DEPENDENCIES = host-pkgconf libusb
USBREDIR_CONF_OPTS = \
	-Dgit_werror=disabled \
	-Dtests=disabled \
	-Dtools=disabled

ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)

USBREDIR_LICENSE += , GPL-2.0+ (program)
USBREDIR_LICENSE_FILES += COPYING

else # BR2_PACKAGE_USBREDIR_SERVER != y

define USBREDIR_POST_INSTALL_TARGET_RM_SERVER
	rm -f $(TARGET_DIR)/usr/sbin/usbredirserver
endef
USBREDIR_POST_INSTALL_TARGET_HOOKS += USBREDIR_POST_INSTALL_TARGET_RM_SERVER

endif # BR2_PACKAGE_USBREDIR_SERVER

$(eval $(meson-package))

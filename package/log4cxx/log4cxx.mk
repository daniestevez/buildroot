################################################################################
#
# log4cxx
#
################################################################################

LOG4CXX_VERSION = 0.12.0
LOG4CXX_SITE = http://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
LOG4CXX_INSTALL_STAGING = YES
LOG4CXX_LICENSE = Apache-2.0
LOG4CXX_LICENSE_FILES = LICENSE

LOG4CXX_CONF_OPTS = \
	-DAPR_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apr-1-config \
	-DAPR_UTIL_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apu-1-config

LOG4CXX_DEPENDENCIES = apr apr-util

ifeq ($(BR2_PACKAGE_LIBESMTP),y)
LOG4CXX_DEPENDENCIES += libesmtp
endif

$(eval $(cmake-package))

################################################################################
#
# dfreerdp
#
################################################################################

DFREERDP_VERSION = 1.0.1
DFREERDP_SOURCE = freerdp-$(DFREERDP_VERSION).tar.gz
DFREERDP_SITE = https://github.com/downloads/FreeRDP/FreeRDP
DFREERDP_DEPENDENCIES = openssl zlib directfb

DFREERDP_LICENSE = Apache-2.0
FREEDRP_LICENSE_FILES = LICENSE

ifeq ($(BR2_PACKAGE_CUPS),y)
DFREERDP_CONF_OPT += -DWITH_CUPS=ON
DFREERDP_DEPENDENCIES += cups
else
DFREERDP_CONF_OPT += -DWITH_CUPS=OFF
endif

ifeq ($(BR2_PACKAGE_FFMPEG),y)
DFREERDP_CONF_OPT += -DWITH_FFMPEG=ON
DFREERDP_DEPENDENCIES += ffmpeg
else
DFREERDP_CONF_OPT += -DWITH_FFMPEG=OFF
endif

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
DFREERDP_CONF_OPT += -DWITH_ALSA=ON
DFREERDP_DEPENDENCIES += alsa-lib
else
DFREERDP_CONF_OPT += -DWITH_ALSA=OFF
endif

ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
DFREERDP_CONF_OPT += -DWITH_PULSEAUDIO=ON
DFREERDP_DEPENDENCIES += pulseaudio
else
DFREERDP_CONF_OPT += -DWITH_PULSEAUDIO=OFF
endif

DFREERDP_CONF_OPT += -DWITH_X11=OFF
DFREERDP_CONF_OPT += -DWITH_XKBFILE=OFF
DFREERDP_CONF_OPT += -DWITH_DIRECTFB=ON

$(eval $(cmake-package))

################################################################################
#
# Advance MAME
#
################################################################################
#ADVANCEMAME_
ADVANCEMAME_VERSION = 1.2
ADVANCEMAME_SITE = ftp://ftp.mirrorservice.org/sites/downloads.sourceforge.net/a/ad/advancemame/advancemame/$(ADVANCEMAME_VERSION)/advancemame-$(ADVANCEMAME_VERSION).tar.gz
ADVANCEMAME_DEPENDENCIES += alsa-lib

ADVANCEMAME_LICENSE = GPLv2
ADVANCEMAME_LICENSE_FILES = COPYING
ADVANCEMAME_INSTALL_STAGING = YES
ADVANCEMAME_AUTORECONF = YES

ADVANCEMAME_TEMPOUTPUT = $(BUILD_DIR)/output_obj/

ADVANCEMAME_CONF_OPT = 		\
	--exec-prefix=$(ADVANCEMAME_TEMPOUTPUT)		\
	--prefix=$(ADVANCEMAME_TEMPOUTPUT)

ADVANCEMAME_TARGETS_ =
ADVANCEMAME_TARGETS_y =

ADVANCEMAME_TARGETS_y += bin/advmame

define ADVANCEMAME_INSTALL_TARGET_CMDS
    $(Q)mkdir -p $(TARGET_DIR)/usr/bin
    $(Q)for file in $(ADVANCEMAME_TARGETS_y); do 	\
        $(INSTALL) -m 0755 $(ADVANCEMAME_TEMPOUTPUT)/$$file $(TARGET_DIR)/usr/bin; 	\
    done
endef

$(eval $(autotools-package))


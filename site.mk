GLUON_MULTIDOMAIN=1
GLUON_DEPRECATED=full

# use actual gluon version tag, can be overwritten on cmd line
GLUON_RELEASE ?= $(GLUON_VERSION)-ffkbu-bnv2-mdom.wireguard

# Default priority for updates.
GLUON_PRIORITY ?= 0

# Languages to include
GLUON_LANGS ?= en de

# Region settings for ARCHERC7
GLUON_REGION ?= eu

GLUON_ATH10K_MESH = 11s
CONFIG_ZRAM_SIZE_PERCENT="20"
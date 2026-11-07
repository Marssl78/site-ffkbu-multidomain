features({
	'authorized-keys',
	'autoupdater',
	'banner',
	'config-mode-domain-select',
	'config-mode-geo-location-osm',
	'ebtables-filter-multicast',
	'ebtables-filter-ra-dhcp',
	'ebtables-limit-arp',
	'ffkbu-files',
	'mesh-batman-adv-15',
	'mesh-vpn-wireguard-kbu',
	'respondd',
	'status-page',
	'web-advanced',
	'web-private-wifi',
	'web-wizard',
	})

if not device_class('tiny') then
    features({
	'tls',
        'wireless-encryption-wpa3',
	})
end

if device({
        'zte-mf281',
        'glinet-gl-xe300',
        'glinet-gl-ap1300',
        'zte-mf289f',
        'zte-mf286r',
        'wavlink-ws-wn572hp3-4g',
        'tp-link-tl-mr6400-v5',
	}) then
	     features ({
		      'web-cellular',
		      })
end

packages({
	'iwinfo',
	'ffac-ssid-changer',
	})

--if device({
--	'tp-link-archer-c50-v1',
--	'tp-link-archer-c50-v2',
--	'tp-link-archer-c50-v3',
--	'tp-link-archer-c50-v4',
--	'tp-link-archer-c50-v5',
--	'tp-link-archer-c50-v6',
--	}) then
--	     packages({
--	             'zram-swap',
--	             })
--end

-- basic support for USB stack
usb_packages_basic = ({
	'kmod-usb-core',
	'kmod-usb2',
	})

-- storage support for USB devices
usb_packages_storage = ({
	'block-mount',
	'blkid',
	'kmod-fs-ext4',
	'kmod-fs-vfat',
	'kmod-usb-storage',
	'kmod-usb-storage-extras',
	'kmod-nls-cp1250',
	'kmod-nls-cp1251',
	'kmod-nls-cp437',
	'kmod-nls-cp775',
	'kmod-nls-cp850',
	'kmod-nls-cp852',
	'kmod-nls-cp866',
	'kmod-nls-iso8859-1',
	'kmod-nls-iso8859-13',
	'kmod-nls-iso8859-15',
	'kmod-nls-iso8859-2',
	'kmod-nls-koi8r',
	'kmod-nls-utf8',
	'swap-utils',
	})

-- network support for USB devices
usb_packages_net = ({
	'kmod-mii',
	'kmod-nls-base',
	'kmod-usb-net',
	'kmod-usb-net-asix',
	'kmod-usb-net-asix-ax88179',
	'kmod-usb-net-cdc-eem',
	'kmod-usb-net-cdc-ether',
	'kmod-usb-net-cdc-mbim',
	'kmod-usb-net-cdc-ncm',
	'kmod-usb-net-cdc-subset',
	'kmod-usb-net-dm9601-ether',
	'kmod-usb-net-hso',
	'kmod-usb-net-huawei-cdc-ncm',
	'kmod-usb-net-ipheth',
	'kmod-usb-net-kalmia',
	'kmod-usb-net-kaweth',
	'kmod-usb-net-mcs7830',
	'kmod-usb-net-pegasus',
	'kmod-usb-net-qmi-wwan',
	'kmod-usb-net-rndis',
	'kmod-usb-net-sierrawireless',
	'kmod-usb-net-smsc95xx',
	'usbutils',
	})

-- network support for PCI devices
pci_packages_net = ({
	'kmod-3c59x',
	'kmod-e100',
	'kmod-e1000',
	'kmod-e1000e',
	'kmod-forcedeth',
	'kmod-natsemi',
	'kmod-ne2k-pci',
	'kmod-pcnet32',
	'kmod-r8169',
	'kmod-sis900',
	'kmod-sky2',
	'kmod-tg3',
	'kmod-tulip',
	'kmod-via-rhine',
	'kmod-8139cp',
	})

-- additional packages
tools_packages = ({
	'iperf',
	'socat',
	})

-- x86-generic, x86-64
if target ('x86','generic') or target ('x86','64') then
	packages = ({
		'kmod-usb-hid',
		'kmod-hid-generic',
		usb_packages_basic,
		usb_packages_storage,
		usb_packages_net,
		pci_packages_net,
		tools_packages,
		})
end

if target ('x86','kvm_guest') then
	packages = (tools_packages)
end

if target('ath79') then
	if device({
		'buffalo-wzr-hp-ag300h',
		'devolo-wifi-pro-1750e',
		'buffalo-wzr-600dhp',
		'buffalo-wzr-hp-g300nh-rtl8366s',
		'd-link-dir825b1',
		'gl.inet-gl-ar150',
		'gl.inet-6416',
		'gl.inet-gl-ar150',
		'gl.inet-gl-ar300m-nor',
		'gl.inet-gl-ar300m-lite',
		'gl.inet-gl-ar750',
		'gl.inet-gl-ar750s-nor',
		'gl.inet-gl-xe300',
		'librerouter-v1',
		'netgear-wndr3700',
		'netgear-wndr3700-v2',
		'netgear-wndr3700-v4',
		'netgear-wndr3800',
		'netgear-wndr3800ch',
		'netgear-wndr4300',
		'tp-link-archer-a7-v5',
		'tp-link-archer-c5-v1',
		'tp-link-archer-c7-v2',
		'tp-link-archer-c7-v4',
		'tp-link-archer-c7-v5',
		'tp-link-archer-c59-v1',
		'tp-link-tl-wdr3500-v1',
		'tp-link-tl-wdr3600-v1',
		'tp-link-tl-wdr4300-v1',
		'tp-link-tl-wr842n-v3',
		'tp-link-tl-wr902ac-v1',
		'tp-link-tl-wr1043nd-v2',
		'tp-link-tl-wr1043nd-v3',
		'tp-link-tl-wr1043nd-v4',
	}) then
		packages(usb_packages_basic,tools_packages)
	end
end

-- mpc85xx-generic
if target ('mpc85xx') then
	packages(usb_packages_basic,tools_packages)
end

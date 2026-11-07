[![CI](https://github.com/ff-kbu/site-ffkbu-multidomain/actions/workflows/ci.yml/badge.svg?branch=wireguard)](https://github.com/ff-kbu/site-ffkbu-multidomain/actions/workflows/ci.yml)

Freifunk KBU Multihood with Batman15 and 802.11s


This is my personal site for Gluon v2025.X with wireguard.

## The main differences to the v2022.x Version are:

  1.) not using kbu-special-packages, due to kbu-ssid-changer doesn't handle owe-interfaces, wgkbu doesn't deliver pubkey_privacy state to node's status-page (which gives error 500 on status page of uplink-node) and radvd is disabled in gluon by default
  2.) only use wg-peers 6 and 7, as others are dead meanwhilst
  3.) adding my PubKey for administrating

## Build Instructions

1. Go in your build system with the user you want to build
2. Download Gluon 2025.X. You'll find the informations you'll need under the URL https://gluon.readthedocs.io/en/latest/releases/v2025.1.3.html
3. Create a directory *site* in your firmware-directory.
4. Download this branch into site directory.
5. Now run *make update*
6. Everything should be complete now. You can start the compiling with the command *make GLUON_TARGET=ath79-generic*
7. If everything works you should find your files now in the directory *./output/images/*

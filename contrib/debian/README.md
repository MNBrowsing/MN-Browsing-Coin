
Debian
====================
This directory contains files used to package mnbrowsingcoind/mnbrowsingcoin-qt
for Debian-based Linux systems. If you compile mnbrowsingcoind/mnbrowsingcoin-qt yourself, there are some useful files here.

## mnbrowsingcoin: URI support ##


mnbrowsingcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install mnbrowsingcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your mnbrowsingcoinqt binary to `/usr/bin`
and the `../../share/pixmaps/mnbrowsingcoin128.png` to `/usr/share/pixmaps`

mnbrowsingcoin-qt.protocol (KDE)


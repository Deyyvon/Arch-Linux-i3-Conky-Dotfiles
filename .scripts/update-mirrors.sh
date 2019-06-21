#!/usr/bin/env bash

if [ -a /etc/pacman.d/mirrorlist-arch.pacnew ]; then
	echo -n 'New mirrorlist found. Backing up...'
	cp /etc/pacman.d/mirrorlist.pacnew /etc/pacman.d/mirrorlist-arch.backup
	echo 'Done.'
	
	echo -n 'Enabling every mirror...'
	sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist-arch.pacnew
	echo 'Done.'

	echo -n 'Ranking mirrors by speed...'
	rankmirrors /etc/pacman.d/mirrorlist-arch.pacnew > /etc/pacman.d/mirrorlist-arch
	echo 'Done.'

	echo -n 'Cleaning up...'
	rm /etc/pacman.d/mirrorlist-arch.pacnew
	echo 'Done.'
	exit 0
else
    echo 'Backing up mirrorlist.'
    cp /etc/pacman.d/mirrorlist-arch /etc/pacman.d/mirrorlist-arch.backup

    echo 'Enabling every mirror.'
    sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist-arch

    echo 'Ranking mirrors by speed.'
    rankmirrors /etc/pacman.d/mirrorlist-arch > /etc/pacman.d/mirrorlist-arch.tmp
    mv /etc/pacman.d/mirrorlist-arch.tmp /etc/pacman.d/mirrorlist-arch

    echo 'Done.'
    exit 0
fi


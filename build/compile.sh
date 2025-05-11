#!/bin/sh

# apt install libmotif-dev libxaw7-dev x11proto-core-dev libx11-dev libxpm-dev libpng-dev libncurses5-dev libjpeg-dev libgnutls28-dev libfreetype-dev autoconf automake

cd "$(dirname "$0")"
export CFLAGS='-std=gnu18 -Wall -Wextra -Werror -Wfatal-errors -Wno-unused-function -Wstrict-prototypes -Wno-trigraphs'
[ -x ../configure ] || {
  pushd ..
  ./autogen.sh
  popd
}
[ -s config.status ] || {
  ../configure --prefix="$PWD" --with-x \
    --with-sound=all,ao,alsa,pulse,jack --with-media=all,internal,ffmpeg,magic --with-image=all,jpeg,tiff,gif,xpm,png,xface \
    --with-experimental-features --with-clash-detection --with-gnutls
}
make install -j10

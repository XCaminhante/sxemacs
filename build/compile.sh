#!/bin/sh
cd "$(dirname "$0")"
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

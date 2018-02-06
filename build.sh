#!/bin/bash
echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
./configure --prefix=/usr && \
make -j $SHED_NUMJOBS && \
make DESTDIR="$SHED_FAKEROOT" install || exit 1
ln -sv vim "${SHED_FAKEROOT}/usr/bin/vi"
for L in "${SHED_FAKEROOT}"/usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done
mkdir -pv "${SHED_FAKEROOT}/usr/share/doc"
ln -sv ../vim/vim80/doc "${SHED_FAKEROOT}/usr/share/doc/vim-8.0.586"
install -v -Dm644 "${SHED_CONTRIBDIR}/vimrc" "${SHED_FAKEROOT}/etc/vimrc.default"

#!/bin/bash
echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
./configure --prefix=/usr && \
make -j $SHED_NUM_JOBS && \
make DESTDIR="$SHED_FAKE_ROOT" install || exit 1
ln -sv vim "${SHED_FAKE_ROOT}/usr/bin/vi"
for L in "${SHED_FAKE_ROOT}"/usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done
mkdir -pv "${SHED_FAKE_ROOT}/usr/share/doc"
ln -sv ../vim/vim80/doc "${SHED_FAKE_ROOT}/usr/share/doc/vim-8.0.586"
install -v -Dm644 "${SHED_PKG_CONTRIB_DIR}/vimrc" "${SHED_FAKE_ROOT}/etc/vimrc.default"

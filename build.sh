#!/bin/bash
declare -A SHED_PKG_LOCAL_OPTIONS=${SHED_PKG_OPTIONS_ASSOC}
# Set the default config file location to /etc/vimrc
echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h &&
# Configure
./configure --prefix=/usr &&
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" install &&
install -v -Dm644 "${SHED_PKG_CONTRIB_DIR}/vimrc" "${SHED_FAKE_ROOT}/usr/share/defaults/etc/vimrc" &&
ln -sv vim "${SHED_FAKE_ROOT}/usr/bin/vi" || exit 1
for L in "${SHED_FAKE_ROOT}"/usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1 || exit 1
done
# Install Documentation
if [ -n "${SHED_PKG_LOCAL_OPTIONS[docs]}" ]; then
    mkdir -pv "${SHED_FAKE_ROOT}/usr/share/doc" &&
    ln -sv ../vim/vim81/doc "${SHED_FAKE_ROOT}/usr/share/doc/${SHED_PKG_NAME}-${SHED_PKG_VERSION}" || exit 1
fi

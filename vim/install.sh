#!/bin/sh

export CONFIG_INSTALL_DIR=/home/${USER}
export CONFIG_VIM_INSTALL_DIR=${CONFIG_INSTALL_DIR}/.vim
export CONFIG_PACK_INSTALL_DIR=${CONFIG_VIM_INSTALL_DIR}/pack
export CONFIG_THEME_INSTALL_DIR=${CONFIG_VIM_INSTALL_DIR}/theme

echo "Installing .vimrc ..."
cp vimrc ${CONFIG_INSTALL_DIR}/.vimrc 

echo "Installing packages ..."
if [ ! -d ${CONFIG_PACK_INSTALL_DIR} ]; then
	echo "Creating ${CONFIG_PACK_INSTALL_DIR}...";
	mkdir -p ${CONFIG_PACK_INSTALL_DIR};
fi
cp -r pack/* ${CONFIG_PACK_INSTALL_DIR}

echo "Installing themes ..."
if [ ! -d ${CONFIG_THEME_INSTALL_DIR} ]; then
	echo "Creating ${CONFIG_THEME_INSTALL_DIR}...";
	mkdir -p ${CONFIG_THEME_INSTALL_DIR};
fi
cp -r theme/* ${CONFIG_THEME_INSTALL_DIR}

echo "Done."

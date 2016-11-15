#!/bin/bash

nag_vers=6.1
install_location=/shared/software/nag_compiler/$nag_vers

tarball=npl6a61na_amd64.tgz
tarball_url=https://www.nag.co.uk/downloads/impl/$tarball

tmp_dir=/tmp/nag_compiler/$nag_vers
# Directory to contain binary materials:
export INSTALL_TO_BINDIR=$install_location/bin
# Directory to contain supporting library materials, which must
# be different from the binaries directory:
export INSTALL_TO_LIBDIR=$install_location/lib/NAG_Fortran
# Directory prefix for preformatted man pages:
export INSTALL_TO_CATMANDIR=$install_location/man/man
# Directory prefix for unformatted man pages;
export INSTALL_TO_MANDIR=$install_location/man/man

# Create directories
mkdir -p $tmp_dir

# Download and unpack
pushd $tmp_dir
wget -c $tarball_url
tar -zxf $tarball

# Unattended install
pushd NAG_Fortran-amd64/
sh INSTALLU.sh

popd
popd

# Test using:
#nagfor -o ~/f90_util /usr/local/packages6/compilers/NAG/6.1/lib/NAG_Fortran/f90_util.f90

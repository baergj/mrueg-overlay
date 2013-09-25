# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

MY_PV1="${PV%*.*}"
MY_PV2="${PV#*.*.}"
MY_PV="${MY_PV1}+13.10.${MY_PV2}"
DESCRIPTION="Scripts to work with Phablet. Installs Touch Developer Preview on Nexus devices"
HOMEPAGE="https://launchpad.net/phablet-tools"
SRC_URI="https://launchpad.net/~phablet-team/+archive/+files/${PN}_${MY_PV}.orig.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/configobj[${PYTHON_USEDEP}]
	dev-python/pyxdg[${PYTHON_USEDEP}]
	dev-python/pyliblzma[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-util/android-sdk-update-manager"

S=${WORKDIR}/${PN}-${MY_PV}

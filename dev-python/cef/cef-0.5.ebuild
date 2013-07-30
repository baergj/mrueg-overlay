# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_6 python2_7 )
inherit distutils-r1

DESCRIPTION="Module that emits CEF logs"
HOMEPAGE="https://pypi.python.org/pypi/cef"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="|| ( GPL-2 LGPL-2.1 MPL-1.1 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

python_test() {
	${PYTHON} test_cef.py || die
}

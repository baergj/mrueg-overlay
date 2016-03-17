# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

EHG_REPO_URI="https://bitbucket.org/EionRobb/purple-hangouts"
inherit mercurial multilib

DESCRIPTION="Hangouts Plugin for libpurple"
HOMEPAGE="https://bitbucket.org/EionRobb/purple-hangouts/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=dev-libs/protobuf-c-1.1.1
	dev-libs/json-glib
	dev-libs/nss
	sys-libs/zlib
	net-im/pidgin"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_compile() {
	emake CC=$(tc-getCC)
}

src_install() {
	dodir /usr/$(get_libdir)/purple-2
	default
}

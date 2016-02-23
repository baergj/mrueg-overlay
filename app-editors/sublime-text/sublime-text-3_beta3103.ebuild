# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

MY_PN=${PN/-/_}
MY_P=${MY_PN}_${PV/beta/build_}

DESCRIPTION="A sophisticated text editor for code, html and prose"
HOMEPAGE="http://www.sublimetext.com"
COMMON_URI="https://download.sublimetext.com/"
SRC_URI="amd64? ( ${COMMON_URI}/${MY_P}_x64.tar.bz2 )
	x86? ( ${COMMON_URI}/${MY_P}_x32.tar.bz2 )"
LICENSE="Sublime"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

S=${WORKDIR}/${PN/-/_}_${PV%%_*}

RDEPEND="media-libs/libpng:0
	>=x11-libs/gtk+-2.24.8-r1:2"

QA_PREBUILT="/opt/${PN}/crash_reporter
	/opt/${PN}/plugin_host
	/opt/${PN}/sublime_text"

src_install() {
	insinto /opt/${PN}
	into /opt/${PN}
	exeinto /opt/${PN}
	docinto /opt/${PN}
	doins -r "Icon"
	doins -r "Packages"
	dodoc "changelog.txt"
	doins "sublime_plugin.py"
	doins "sublime.py"
	doins "python3.3.zip"
	doexe "sublime_text"
	doexe "plugin_host"
	doexe "crash_reporter"
	dosym "/opt/${PN}/sublime_text" /usr/bin/subl
	make_desktop_entry "subl" "Sublime Text Editor" "accessories-text-editor" "TextEditor"
}

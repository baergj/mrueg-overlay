# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/Aloshi/EmulationStation.git"
inherit git-r3 cmake-utils

DESCRIPTION="A flexible emulator front-end supporting keyboardless navigation and custom system themes"
HOMEPAGE="https://github.com/Aloshi/EmulationStation/"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-cpp/eigen:3
	dev-libs/boost
	media-libs/freeimage
	media-libs/freetype
	media-libs/libsdl2[sound,joystick,opengl]
	net-misc/curl"
RDEPEND="${DEPEND}"

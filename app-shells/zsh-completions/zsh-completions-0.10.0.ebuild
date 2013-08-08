# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Additional completion definitions for Zsh"
HOMEPAGE="https://github.com/zsh-users/zsh-completions"
SRC_URI="https://github.com/zsh-users/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gentoo-zsh-completion"
RDEPEND="app-shells/zsh
	gentoo-zsh-completion? ( app-shells/zsh-completion )
	!gentoo-zsh-completion? ( !app-shells/zsh-completion )"

src_prepare() {
	use gentoo-zsh-completion && (rm src/_{baselayout,eselect,gcc-config,genlop,gentoo_packages,gentoolkit,layman,portage,portage_utils} || die)
	rm src/_yaourt || die
}

src_install() {
	insinto /usr/share/zsh/site-functions/
	doins src/*
}

pkg_postinst() {
	elog
	elog "If you happen to compile your functions, you may need to delete"
	elog "~/.zcompdump{,.zwc} and recompile to make zsh-completion available"
	elog "to your shell."
	elog
}

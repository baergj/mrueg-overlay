# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vcs-snapshot

DESCRIPTION="Additional completion definitions for Zsh"
HOMEPAGE="https://github.com/zsh-users/zsh-completions"
COMMIT_ID="8d3c8e6541e9c1f20fe3c67e333920eba00c0cd7"
SRC_URI="https://github.com/zsh-users/${PN}/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+gentoo-zsh-completion"
RDEPEND="app-shells/zsh
	gentoo-zsh-completion? ( app-shells/zsh-completion )"

src_install() {
	insinto /usr/share/zsh/site-functions/
	doins src/*
	dodoc README.md zsh-completions-howto.org
}

pkg_postinst() {
	elog
	elog "If you happen to compile your functions, you may need to delete"
	elog "~/.zcompdump{,.zwc} and recompile to make zsh-completion available"
	elog "to your shell."
	elog
}

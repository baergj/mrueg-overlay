# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_EXTRAINSTALL="vendor"

inherit ruby-fakegem

DESCRIPTION="Ruby wrapper for pygmentize"
HOMEPAGE="https://github.com/github/albino/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/mocha )"
ruby_add_rdepend "dev-ruby/posix-spawn"
RDEPEND+=" dev-python/pygments"

each_fakegem_test() {
	${RUBY} -Ilib test/* || die
}

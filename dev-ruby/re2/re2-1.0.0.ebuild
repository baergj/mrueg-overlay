# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="yard"

inherit ruby-fakegem

DESCRIPTION="Ruby bindings to re2, an efficient, principled regular expression library"
HOMEPAGE="https://github.com/mudge/re2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND+=" dev-libs/re2"
RDEPEND+=" dev-libs/re2"

each_ruby_configure() {
	${RUBY} -Cext/re2 extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext/re2
	cp ext/re2/re2$(get_modname) lib/ || die
}

each_ruby_test() {
	${RUBY} -S rspec-3 -Ilib --require spec_helper spec || die
}

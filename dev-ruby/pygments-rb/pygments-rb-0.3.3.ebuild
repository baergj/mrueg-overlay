# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2"
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_NAME="pygments.rb"
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_EXTRAINSTALL="vendor/custom_lexers bench.rb cache-lexers.rb lexers"

inherit python ruby-fakegem

DESCRIPTION="Ruby wrapper for pygments syntax highlighter"
HOMEPAGE="http://github.com/tmm1/pygments.rb http://rubygems.org/gems/pygments.rb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/posix-spawn
	dev-ruby/yajl-ruby"
RDEPEND+=" dev-python/pygments"
# could be also an rdep: dev-python/simplejson

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

all_ruby_prepare() {
	rm -rf vendor/{pygments-main,simple-json}
	python_convert_shebangs -r 2 .
}

# 1 test is fails 28/12/2012
each_ruby_test() {
	cd test
	${RUBY} -I../lib test_pygments.rb
}

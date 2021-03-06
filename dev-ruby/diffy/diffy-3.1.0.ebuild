# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Convenient diffing in ruby"
HOMEPAGE="http://github.com/samg/diffy https://rubygems.org/gems/diffy"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

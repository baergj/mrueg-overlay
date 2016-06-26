# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Font-awesome for the asset pipeline"
HOMEPAGE="https://github.com/bokmann/font-awesome-rails https://rubygems.org/gems/font-awesome-rails"

LICENSE="MIT OFL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "<dev-ruby/railties-5.1
	>=dev-ruby/railties-3.2"

RESTRICT="test"

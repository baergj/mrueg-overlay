# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST=""
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="underscore.js asset pipeline provider/wrapper"
HOMEPAGE="https://rubygems.org/gems/underscore-rails https://github.com/rweng/underscore-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

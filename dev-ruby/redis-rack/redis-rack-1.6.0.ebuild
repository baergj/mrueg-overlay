# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Redis Store for Rack"
HOMEPAGE="http://redis-store.org/redis-rack https://rubygems.org/gems/redis-rack"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.5
	<dev-ruby/rack-2
	>=dev-ruby/redis-store-1.2.0
	<dev-ruby/redis-store-1.3"

# ruby_add_bdepend "test? ( >=dev-ruby/minitest-5
#	dev-ruby/mocha:0.14
#	>=dev-ruby/rake-10 )"

RESTRICT="test"

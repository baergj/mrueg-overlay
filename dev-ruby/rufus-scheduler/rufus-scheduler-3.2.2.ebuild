# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Job scheduler for Ruby (at, cron, in and every jobs)"
HOMEPAGE="https://rubygems.org/gems/rufus-scheduler http://github.com/jmettraux/rufus-scheduler"
SRC_URI="https://github.com/jmettraux/rufus-scheduler/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/chronic
	dev-ruby/tzinfo )"

# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20"
inherit ruby-ng user

DESCRIPTION="A Redmine plugin which makes building your Jenkins projects easy"
HOMEPAGE="https://github.com/jbox-web/redmine_jenkins"
COMMIT_ID="e7c3a6a2a543cdd3913a79c9a057dfbf01645316"
SRC_URI="https://github.com/jbox-web/${PN}/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	www-apps/redmine
	www-apps/redmine_bootstrap_kit"

RDEPEND+=" dev-util/jenkins-bin"

RUBY_S=${PN}-${COMMIT_ID}

REDMINE_DIR="/var/lib/redmine"

pkg_setup() {
	enewgroup redmine
	enewuser redmine -1 -1 "${REDMINE_DIR}" redmine
}

all_ruby_install() {
	dodoc README.md
	rm README.md LICENSE || die
	dodir "${REDMINE_DIR}"/plugins/${PN}
	insinto "${REDMINE_DIR}"/plugins/${PN}
	doins -r .
	fowners -R redmine:redmine "${REDMINE_DIR}"/plugins/${PN}
}

pkg_postinst() {
	einfo
	elog "Please run emerge --config =${PF}"
	einfo
}

pkg_config() {
	local RAILS_ENV=${RAILS_ENV:-production}
	if [ ! -L /usr/bin/ruby ]; then
		eerror "/usr/bin/ruby is not a valid symlink to any ruby implementation."
		eerror "Please update it via `eselect ruby`"
		die
	fi
	if [[ $RUBY_TARGETS != *$( eselect ruby show | awk 'NR==2' | tr  -d ' '  )* ]]; then
		eerror "/usr/bin/ruby is currently not included in redmine's ruby targets: ${RUBY_TARGETS}."
		eerror "Please update it via `eselect ruby`"
		die
	fi

	local RUBY=${RUBY:-ruby}
	einfo "Upgrading the plugin migrations."
	cd "${EPREFIX}${REDMINE_DIR}" || die
	RAILS_ENV="${RAILS_ENV}" ${RUBY} -S rake redmine:plugins:migrate || die
}

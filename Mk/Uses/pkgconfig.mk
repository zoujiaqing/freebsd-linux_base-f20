# $FreeBSD: head/Mk/Uses/pkgconfig.mk 348308 2014-03-15 10:31:54Z gerald $
#
# handle dependency on the pkgconf port
#
# Feature:	pkgconfig
# Usage:	USES=pkgconfig or USES=pkgconfig:ARGS
# Valid ARGS:	build (default, implicit), run, both
#
# MAINTAINER: portmgr@FreeBSD.org

.if !defined(_INCLUDE_USES_PKGCONFIG_MK)
_INCLUDE_USES_PKGCONFIG_MK=	yes

_PKGCONFIG_DEPENDS=	pkgconf:${PORTSDIR}/devel/pkgconf

.if !defined(pkgconfig_ARGS)
pkgconfig_ARGS=	build
.endif

.if ${pkgconfig_ARGS} == "build"
BUILD_DEPENDS+=	${_PKGCONFIG_DEPENDS}
CONFIGURE_ENV+=	PKG_CONFIG=pkgconf
.elif ${pkgconfig_ARGS} == "run"
RUN_DEPENDS+=	${_PKGCONFIG_DEPENDS}
.elif ${pkgconfig_ARGS} == "both"
CONFIGURE_ENV+=	PKG_CONFIG=pkgconf
BUILD_DEPENDS+=	${_PKGCONFIG_DEPENDS}
RUN_DEPENDS+=	${_PKGCONFIG_DEPENDS}
.else
IGNORE=	USES=pkgconfig - invalid args: [${pkgconfig_ARGS}] specified
.endif

.endif

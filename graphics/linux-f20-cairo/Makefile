# Created by: vassilisl
# $FreeBSD$

PORTNAME=	cairo
PORTVERSION=	1
CATEGORIES=	x11 graphics linux
MASTER_SITES=		http://archives.fedoraproject.org/pub/fedora/linux/releases/${LINUX_RPM_VERSION}/Everything/${LINUX_CPU_ARCH}/os/Packages/
PKGNAMEPREFIX=	linux-f20-
DISTFILES=	${BIN_DISTFILES}

MAINTAINER=	vassilis@einval.com
COMMENT=	A 2D graphics library (Linux Fedora 20)

BIN_DISTFILES=	\
			c/cairo-1.13.1-0.1.git337ab1f.fc${LINUX_RPM_VERSION}.${LINUX_RPM_ARCH}.rpm

ONLY_FOR_ARCHS=	i386 amd64
LINUX_CPU_ARCH=		i386
LINUX_RPM_ARCH=		i686
LINUX_RPM_VERSION=	20
USE_LINUX_PREFIX=	yes
NO_WRKSUBDIR=		yes
DISTINFO_FILE?=		${MASTERDIR}/distinfo.${LINUX_RPM_ARCH}
RUN_DEPENDS=		/compat/linux/usr/lib/libEGL.so.1:${PORTSDIR}/graphics/linux-f20-mesa-libEGL \
					/compat/linux/usr/lib/libGL.so.1:${PORTSDIR}/graphics/linux-f20-mesa-libGL \
					/compat/linux/usr/lib/libpixman-1.so.0:${PORTSDIR}/x11/linux-f20-pixman

CONFLICTS=			linux-f10-cairo-[0-9]*

EXTRACT_CMD?=		${TAR}
EXTRACT_BEFORE_ARGS?=	-xPf
EXTRACT_AFTER_ARGS?=

do-build:

do-install:
	@cd ${WRKSRC} && ${FIND} * ! -path "stage*" -type d -exec ${MKDIR} "${STAGEDIR}${PREFIX}/{}" \;
	@cd ${WRKSRC} && ${FIND} * ! -path "stage/*" ! -type d \
		| ${CPIO} -pm -R root:wheel ${STAGEDIR}${PREFIX}

USE_LDCONFIG=		yes

.include <bsd.port.mk>

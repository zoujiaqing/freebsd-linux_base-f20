# Created by: vassilisl
# $FreeBSD$

PORTNAME=	mesa-libgbm
PORTVERSION=	1
CATEGORIES=	graphics linux
MASTER_SITES=		http://archives.fedoraproject.org/pub/fedora/linux/releases/${LINUX_RPM_VERSION}/Everything/${LINUX_CPU_ARCH}/os/Packages/
PKGNAMEPREFIX=	linux-f20-
DISTFILES=	${BIN_DISTFILES}

MAINTAINER=	vassilis@einval.com
COMMENT=	RPM of Mesa gbm library (Linux Fedora 20)

BIN_DISTFILES=	\
			m/mesa-libgbm-9.2.3-1.20131114.fc${LINUX_RPM_VERSION}.${LINUX_RPM_ARCH}.rpm

ONLY_FOR_ARCHS=	i386 amd64
LINUX_CPU_ARCH=		i386
LINUX_RPM_ARCH=		i686
LINUX_RPM_VERSION=	20
USE_LINUX_PREFIX=	yes
NO_WRKSUBDIR=		yes
DISTINFO_FILE?=		${MASTERDIR}/distinfo.${LINUX_RPM_ARCH}
RUN_DEPENDS=		/compat/linux/usr/lib/libdrm.so.2:${PORTSDIR}/graphics/linux-f20-libdrm \
					/compat/linux/usr/lib/libglapi.so.0:${PORTSDIR}/graphics/linux-f20-mesa-libglapi \
					/compat/linux/usr/lib/libudev.so.1:${POR|TSDIR}/devel/linux-f20-systemd-libs \
					/compat/linux/usr/lib/libwayland-client.so.0:${PORTSDIR}/x11/linux-f20-libwayland-client \
					/compat/linux/usr/lib/libwayland-server.so.0:${PORTSDIR}/x11/linux-f20-libwayland-server

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

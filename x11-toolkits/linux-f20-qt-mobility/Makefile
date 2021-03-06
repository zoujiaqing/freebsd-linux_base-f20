# Created by: Vassilis
# $FreeBSD:$

PORTNAME=	qt-mobility
PORTVERSION=	1
CATEGORIES=	x11-toolkits linux
MASTER_SITES=		http://archives.fedoraproject.org/pub/fedora/linux/releases/${LINUX_RPM_VERSION}/Everything/${LINUX_CPU_ARCH}/os/Packages/
PKGNAMEPREFIX=	linux-f20-
DISTFILES=	${BIN_DISTFILES}
EXTRACT_ONLY=		${DISTFILES} ${DISTFILES_DEPS}

MAINTAINER=	vassilis@einval.com
COMMENT=	RPM with Qt4 Mobility APIs (Linux Fedora 20)

BIN_DISTFILES=	\
			q/qt-mobility-1.2.2-0.5.20120224git.fc${LINUX_RPM_VERSION}.${LINUX_RPM_ARCH}.rpm

# This probably should be in the USE_LINUX_APPS; waiting for modular support of linux_base
# of the user's choice in /usr/ports/Mk/bsd.linux-apps.mk
DISTFILES_DEPS=	\

ONLY_FOR_ARCHS=	i386 amd64
LINUX_CPU_ARCH=		i386
LINUX_RPM_ARCH=		i686
LINUX_RPM_VERSION=	20
USE_LINUX_PREFIX=	yes
USE_LINUX=			f20
NO_WRKSUBDIR=		yes
DISTINFO_FILE?=		${MASTERDIR}/distinfo.${LINUX_RPM_ARCH}
RUN_DEPENDS=		/compat/linux/usr/lib/libQtGui.so.4:${PORTSDIR}/x11-toolkits/linux-f20-qt4-gui \
					/compat/linux/usr/lib/libgstvideo-0.10.so.0:${PORTSDIR}/multimedia/linux-f20-gstreamer-plugins-base \
					/compat/linux/usr/lib/libgstbase-0.10.so.0:${PORTSDIR}/multimedia/linux-f20-gstreamer \
					/compat/linux/usr/lib/libudev.so.1:${PORTSDIR}/devel/linux-f20-systemd-libs \
					/compat/linux/usr/lib/libxml2.so.2:${PORTSDIR}/devel/linux-f20-libxml2 \
					/compat/linux/usr/lib/libpulse.so.0:${PORTSDIR}/audio/linux-f20-pulseaudio-libs \
					/compat/linux/usr/lib/libblkid.so.1:${PORTSDIR}/devel/linux-f20-libblkid

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

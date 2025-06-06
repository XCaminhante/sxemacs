dnl SXEmacs emodules configure script
dnl -------------------------------------------------------------------------

AC_PREREQ(2.59)
AC_INIT([SXEmacs modules], [22.1.15],[https://issues.sxemacs.org/])
AC_CONFIG_HEADERS([config.emods.h])
AC_LANG(C)

dnl -------------------------------------------------------------------------
dnl Local copyright notices.
dnl -------------------------------------------------------------------------
AC_COPYRIGHT(
[#### Configuration script for SXEmacs modules.
#### Guess values for system-dependent variables and create Makefiles.
#### Copyright (C) 2006 Steve Youngs.
#### Copyright (C) 2006 Sebastian Freundt.

### Don't edit this script!
### This script was automatically generated by the `autoconf' program
### from the file `./configure.ac'.
### To rebuild it, execute the command
###	autogen.sh (or autoreconf)
### in the this directory.

## This file is part of SXEmacs.

## Redistribution and use in source and binary forms, with or without
## modification, are permitted provided that the following conditions
## are met:
##
## 1. Redistributions of source code must retain the above copyright
##    notice, this list of conditions and the following disclaimer.
##
## 2. Redistributions in binary form must reproduce the above copyright
##    notice, this list of conditions and the following disclaimer in the
##    documentation and/or other materials provided with the distribution.
##
## 3. Neither the name of the author nor the names of any contributors
##    may be used to endorse or promote products derived from this
##    software without specific prior written permission.
##
## THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR
## IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
## WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
## DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
## FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
## CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
## SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
## BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
## WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
## OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
## IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

### For usage, run `./configure --help'
###
### If configure succeeds, it leaves its status in config.status.
### A log of configuration tests can be found in config.log.
### If configure fails after disturbing the status quo,
###	config.status is removed.
])


dnl -------------------------------------------------------------------------
dnl Command line argument processing.

dnl If you add or remove any options here, make sure you also update
dnl the section below it "Check for bogus options"

dnl Build Options
dnl =============
OG_OPTION_GROUP(Build Options)

OG_ARG_WITH([sxemacs],
	AS_HELP_STRING([--with-sxemacs],
		[Specify the sxemacs binary to use.]),
	[auto], [Auto], [og_any])

OG_ARG_WITH([sxemacs-from-the-future],
	AS_HELP_STRING([--with-sxemacs-from-the-future],
		[Do NOT use me.]),
	[no], [No], [og_any])

OG_ARG_WITH([sxemacs-headers],
	AS_HELP_STRING([--with-sxemacs-headers],
		[Specify the directory of SXEmacs headers to use.]),
	[auto], [Auto], [og_any])

OG_ARG_WITH([ellcc],
	AS_HELP_STRING([--with-ellcc],
		[Specify the ellcc binary to use.]),
	[auto], [Auto], [og_any])

OG_ARG_WITH([make-docfile],
	AS_HELP_STRING([--with-make-docfile],
		[Specify the make-docfile binary to use.]),
	[auto], [Auto], [og_any])


dnl Module Options
dnl ==============
OG_OPTION_GROUP(Module Options)

OG_MULTIARG_WITH([ell-modules],
	AS_HELP_STRING([--with-ell-modules],
		[Which modules to compile and install.]),
	[all], [all], [base64 ldap sample zlib])

OG_MULTIARG_WITH([static-modules],
	AS_HELP_STRING([--with-static-modules],
		[Which modules to compile as archives for static linking.]),
	[none], [none], [base64 ldap sample zlib])

dnl Installation Options
dnl ====================
OG_OPTION_GROUP(Installation Options)

dnl OG_ARG_WITH([module-dir],
dnl	AS_HELP_STRING([--with-module-dir],
dnl		[Specify the directory where the modules go.]),
dnl	[auto], [$prefix/lib/sxemacs/site-modules], [og_any])
OG_ARG_WITH([module-dir],
	AS_HELP_STRING([--with-module-dir],
		[Specify the directory where the modules go.]),
	[auto], [${libdir}/${instvardir}/modules], [og_any])

OG_ARG_WITH([package-dir],
	AS_HELP_STRING([--with-package-dir],
		[Specify a package hierarchy where the elisp files go.]),
	[auto], [$prefix/lib/sxemacs/site-packages], [og_any])


## -------------------------------------------------------------------------
## Check for users who regularly forget about running autoconf
## -------------------------------------------------------------------------
if test -f $0.ac -a $0.ac -nt $0; then
##	`dirname $0`/autogen.sh
	AC_MSG_ERROR([What are you doing? RUN autoconf or autogen.sh NOW!!!])
fi

## Now since the user ran us, we build a stand-alone module
AM_CONDITIONAL([AUTARKIC], [test "1" = "0"])

### ------------------------------------------------------------------------
### Detection routines
### ------------------------------------------------------------------------

test "x$prefix" = xNONE && prefix=$ac_default_prefix
test "x$exec_prefix" = xNONE && exec_prefix=${prefix}


AM_INIT_AUTOMAKE([foreign -Wall])
AC_PROG_RANLIB

## Check for working SXEmacs
## =========================

if test "$with_sxemacs_from_the_future" != "no"; then
	EMACS=$with_sxemacs_from_the_future
elif test -n "$with_sxemacs" -a "$with_sxemacs" != "yes"; then
	EMACS=$with_sxemacs
elif test -n "$EMACS"; then
	EMACS=$EMACS
elif test -n "$EDITOR"; then
	EMACS=$EDITOR
else
	EMACS=sxemacs
fi

sxebatch="$EMACS -batch -vanilla"
sxeflavour=t
if test "$with_sxemacs_from_the_future" = "no"; then
	AC_MSG_CHECKING([for a working Emacs])
	$sxebatch &>/dev/null && have_sxebatch=yes || have_sxebatch=no
	if test "$have_sxebatch" = "yes"; then
		AC_MSG_RESULT([yes])
	else
		AC_MSG_RESULT([no])
		AC_MSG_ERROR([Your emacs is too old, buggy, or non-existent.
Specify a *working* emacs via the EMACS or EDITOR environment variable.
Please note: GNU Emacs is _not_ a working version of Emacs hereby.])
	fi

	AC_MSG_CHECKING([for the flavour of Emacs])
	sxeflavour=`$sxebatch -eval "(message \"%s\" (featurep 'sxemacs))" \
		2>&1 | tail -n1`
	if test "$sxeflavour" = "t"; then
		AC_MSG_RESULT([SXEmacs (fortunately)])
	else
		AC_MSG_RESULT([XEmacs])
		AC_MSG_CHECKING([whether XEmacs is working])
		majver=`$sxebatch -eval '(message "%s" emacs-major-version)' \
			2>&1 | tail -n1`
		minver=`$sxebatch -eval '(message "%s" emacs-minor-version)' \
			2>&1 | tail -n1`
		subver=`$sxebatch -eval '(message "%s" emacs-beta-version)' \
			2>&1 | tail -n1`
		if test "$majver" -ge 21 -a "$minver" -ge "4"; then
			if test "$minver" -eq "4"; then
				AC_MSG_RESULT([yes ($majver.$minver.$subver)])
			else
				AC_MSG_RESULT([no ($majver.$minver.$subver)])
				AC_MSG_ERROR(
[We currently do not support the beta dnl
branch of XEmacs.
Consider installing SXEmacs.])
			fi
		else
			AC_MSG_RESULT([no ($majver.$minver.$subver)])
			AC_MSG_ERROR([Your XEmacs is waaaay too old.])
		fi
	fi
fi

AC_SUBST(EMACS)
AC_SUBST(sxebatch)


## Check for the sxemacs headers
## =============================

if test "$with_sxemacs_from_the_future" = "no"; then
	sxemoddir=`$sxebatch -eval "(message module-directory)" 2>&1 | tail -n1`
	sxearchdir=`dirname $sxemoddir`
	if test -z "$with_sxemacs_headers"; then
		with_sxemacs_headers=$sxearchdir/include
	fi
fi

COLON_TO_SPACE(with_sxemacs_headers)

AC_MSG_CHECKING([for SXEmacs include directory])
if test -n "$with_sxemacs_headers"; then
	AC_MSG_RESULT([$with_sxemacs_headers])
else
	AC_MSG_RESULT([no])
	AC_MSG_ERROR(['$with_sxemacs_headers' does not exist])
fi

echo $with_sxemacs_headers
for i in $with_sxemacs_headers; do
	echo $i
	SXEMACS_INCLUDES="$SXEMACS_INCLUDES -I$i"
done
AC_SUBST(SXEMACS_INCLUDES)

## Check for the sxemacs lisp or package path
## ==========================================

if test "$with_sxemacs_from_the_future" = "no"; then
	if test -z "$with_lisp_dir"; then
		sxelispdir=`$sxebatch -eval "(message lisp-directory)" \
			2>&1 | tail -n1`
	fi
fi
if test -z "$with_package_dir"; then
	AC_MSG_CHECKING([for package hierarchy])
	pkgdir_candidates="\
$prefix/share/sxemacs/site-packages \
$prefix/share/xemacs/site-packages \
$prefix/lib/sxemacs/site-packages \
$prefix/lib/sxemacs/xemacs-packages \
$prefix/lib/xemacs/site-packages \
$prefix/lib/xemacs/xemacs-packages"
	if test -n "$sxearchdir"; then
		pkgdir_candidates=$pkgdir_candidates" "`dirname $sxearchdir`
	fi
	for i in $pkgdir_candidates; do
		if test -e "$i" -a -z "$with_package_dir"; then
			AC_MSG_RESULT([$i])
			with_package_dir=$i
		fi
	done

	if test -z "$with_package_dir"; then
		AC_MSG_RESULT([no])
	fi
fi

AC_MSG_CHECKING([whether package directory is indeed a directory])

if test -d "$with_package_dir"; then
	AC_MSG_RESULT([yes])
else
	AC_MSG_RESULT([no])
	if test -n "$with_package_dir"; then
		AC_MSG_ERROR(['$with_package_dir' is not a directory])
	fi
fi

packagedir=$with_package_dir
AC_SUBST([packagedir])

dnl this is necessary so automake loads lisp handling
dnl but automake's AM_PATH_LISPDIR is simply bullshit, we fake our own version
AC_DEFUN([AM_PATH_LISPDIR], [])
AM_PATH_LISPDIR

infodir=$packagedir/info
AC_SUBST([infodir])

etcdir=$packagedir/etc
AC_SUBST([etcdir])

## Check for the sxemacs lisp or package path
## ==========================================

if test -z "$with_module_dir"; then
	AC_MSG_CHECKING([for module hierarchy])
	moddir_candidates="\
$prefix/lib/sxemacs/site-modules \
$prefix/lib/xemacs/site-modules \
$sxemoddir"
	for i in $moddir_candidates; do
		if test -e "$i" -a -z "$with_module_dir"; then
			AC_MSG_RESULT([$i])
			with_module_dir=$i
		fi
	done

	if test -z "$with_module_dir"; then
		AC_MSG_RESULT([no])
	fi
fi

AC_MSG_CHECKING([whether module directory is indeed a directory])

if test -d "$with_module_dir"; then
	AC_MSG_RESULT([yes])
elif test "$with_sxemacs_from_the_future" != "no"; then
	AC_MSG_RESULT([probably yes ($with_module_dir)])
else
	AC_MSG_RESULT([no])
	AC_MSG_ERROR(['$with_module_dir' is not a directory])
fi

moduledir=$with_module_dir
AC_SUBST(moduledir)


## Check for ellcc
## ===============

AC_PROG_CC
AM_PROG_CC_C_O

if test -z "$with_ellcc"; then
	with_ellcc=`which ellcc`
fi
AC_MSG_CHECKING([for ellcc])
if test -f "$with_ellcc"; then
	AC_MSG_RESULT([$with_ellcc])
else
	AC_MSG_RESULT([no])
	AC_MSG_ERROR([ellcc is mandatory. Consider --with-ellcc])
fi

AC_SUBST(CC)
ELLCC=$with_ellcc
AC_SUBST(ELLCC)
ELLCCLD="$with_ellcc --mode=link"
AC_SUBST(ELLCCLD)
MKINIT="$with_ellcc --mode=init"
AC_SUBST(MKINIT)

CFLAGS="-g -O3"
AC_SUBST(CFLAGS)
AC_SUBST(CPPFLAGS)


## Check for make-docfile
## ======================

if test -z "$with_make_docfile"; then
	with_make_docfile=$sxearchdir/make-docfile
fi
AC_MSG_CHECKING([for make-docfile])
if test -f "$with_make_docfile"; then
	AC_MSG_RESULT([$with_make_docfile])
elif test "$with_sxemacs_from_the_future" != "no"; then
	AC_MSG_RESULT([probably yes ($with_make_docfile)])
else
	AC_MSG_RESULT([no])
	AC_MSG_WARN([make-docfile is extremely useful, consider --with-make-docfile])
fi

ELLMAKEDOC=$with_make_docfile
AC_SUBST(ELLMAKEDOC)


## Available modules
## =================

modules="base64 sample zlib"
AM_CONDITIONAL([EMOD_BASE64], [test "$with_ell_modules_base64" = "yes"])
AM_CONDITIONAL([EMOD_SAMPLE], [test "$with_ell_modules_sample" = "yes"])
AM_CONDITIONAL([EMOD_ZLIB], [test "$with_ell_modules_zlib" = "yes"])
AM_CONDITIONAL([STATIC_BASE64], [test "$with_static_modules_base64" = "yes"])
AM_CONDITIONAL([STATIC_SAMPLE], [test "$with_static_modules_sample" = "yes"])
AM_CONDITIONAL([STATIC_ZLIB], [test "$with_static_modules_zlib" = "yes"])
AM_CONDITIONAL([DESCEND_BASE64],
	[test "$with_static_modules_base64" = "yes" -o \
		"$with_ell_modules_base64" = "yes"])
AM_CONDITIONAL([DESCEND_SAMPLE],
	[test "$with_static_modules_sample" = "yes" -o \
		"$with_ell_modules_sample" = "yes"])
AM_CONDITIONAL([DESCEND_ZLIB],
	[test "$with_static_modules_zlib" = "yes" -o \
		"$with_ell_modules_zlib" = "yes"])
AM_CONDITIONAL([FROM_THE_FUTURE],
	[test "$with_sxemacs_from_the_future" != "no"])

AC_CONFIG_FILES([
	Makefile
	base64/Makefile
	sample/Makefile
	zlib/Makefile
])
dnl ldap/Makefile - totally b0rked

AC_OUTPUT

#ifndef __ERROR_BI__
#define __ERROR_BI__

''	FreeBASIC - 32-bit BASIC Compiler.
''	Copyright (C) 2004-2006 Andre Victor T. Vicentini (av1ctor@yahoo.com.br)
''
''	This program is free software; you can redistribute it and/or modify
''	it under the terms of the GNU General Public License as published by
''	the Free Software Foundation; either version 2 of the License, or
''	(at your option) any later version.
''
''	This program is distributed in the hope that it will be useful,
''	but WITHOUT ANY WARRANTY; without even the implied warranty of
''	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
''	GNU General Public License for more details.
''
''	You should have received a copy of the GNU General Public License
''	along with this program; if not, write to the Free Software
''	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA.

'' errors
enum FB_ERRMSG
	FB_ERRMSG_OK
	FB_ERRMSG_ARGCNTMISMATCH
	FB_ERRMSG_EXPECTEDEOF
	FB_ERRMSG_EXPECTEDEOL
	FB_ERRMSG_DUPDEFINITION
	FB_ERRMSG_EXPECTINGAS
	FB_ERRMSG_EXPECTEDLPRNT
	FB_ERRMSG_EXPECTEDRPRNT
	FB_ERRMSG_UNDEFINEDSYMBOL
	FB_ERRMSG_EXPECTEDEXPRESSION
	FB_ERRMSG_EXPECTEDEQ
	FB_ERRMSG_EXPECTEDCONST
	FB_ERRMSG_EXPECTEDTO
	FB_ERRMSG_EXPECTEDNEXT
	FB_ERRMSG_EXPECTEDVAR
	FB_ERRMSG_EXPECTEDIDENTIFIER		= FB_ERRMSG_EXPECTEDVAR
	FB_ERRMSG_TABLESFULL
	FB_ERRMSG_EXPECTEDMINUS
	FB_ERRMSG_EXPECTEDCOMMA
	FB_ERRMSG_SYNTAXERROR
	FB_ERRMSG_ELEMENTNOTDEFINED
	FB_ERRMSG_EXPECTEDENDTYPE
	FB_ERRMSG_TYPEMISMATCH
	FB_ERRMSG_INTERNAL
	FB_ERRMSG_PARAMTYPEMISMATCH
	FB_ERRMSG_FILENOTFOUND
	FB_ERRMSG_ILLEGALOUTSIDEASTMT
	FB_ERRMSG_INVALIDDATATYPES
	FB_ERRMSG_INVALIDCHARACTER
	FB_ERRMSG_FILEACCESSERROR
	FB_ERRMSG_RECLEVELTOODEEP
	FB_ERRMSG_EXPECTEDPOINTER
	FB_ERRMSG_EXPECTEDLOOP
	FB_ERRMSG_EXPECTEDWEND
	FB_ERRMSG_EXPECTEDTHEN
	FB_ERRMSG_EXPECTEDENDIF
	FB_ERRMSG_ILLEGALEND
	FB_ERRMSG_EXPECTEDCASE
	FB_ERRMSG_EXPECTEDENDSELECT
	FB_ERRMSG_WRONGDIMENSIONS
	FB_ERRMSG_INNERPROCNOTALLOWED
	FB_ERRMSG_EXPECTEDENDSUBORFUNCT
	FB_ERRMSG_ILLEGALPARAMSPEC
	FB_ERRMSG_VARIABLENOTDECLARED
	FB_ERRMSG_VARIABLEREQUIRED
	FB_ERRMSG_ILLEGALOUTSIDECOMP
	FB_ERRMSG_EXPECTEDENDASM
	FB_ERRMSG_PROCNOTDECLARED
	FB_ERRMSG_EXPECTEDSEMICOLON
	FB_ERRMSG_UNDEFINEDLABEL
	FB_ERRMSG_TOOMANYDIMENSIONS
	FB_ERRMSG_EXPECTEDSCALAR
	FB_ERRMSG_ILLEGALOUTSIDEASUB
	FB_ERRMSG_EXPECTEDDYNAMICARRAY
	FB_ERRMSG_CANNOTRETURNFIXLENFROMFUNCTS
	FB_ERRMSG_ARRAYALREADYDIMENSIONED
	FB_ERRMSG_ILLEGALRESUMEERROR
	FB_ERRMSG_PARAMTYPEMISMATCHAT
	FB_ERRMSG_ILLEGALPARAMSPECAT
	FB_ERRMSG_EXPECTEDENDWITH
	FB_ERRMSG_ILLEGALINSIDEASUB
	FB_ERRMSG_EXPECTEDARRAY
	FB_ERRMSG_EXPECTEDLBRACKET
	FB_ERRMSG_EXPECTEDRBRACKET
	FB_ERRMSG_TOOMANYEXPRESSIONS
	FB_ERRMSG_EXPECTEDRESTYPE
	FB_ERRMSG_RANGETOOLARGE
	FB_ERRMSG_FORWARDREFNOTALLOWED
	FB_ERRMSG_INCOMPLETETYPE
	FB_ERRMSG_ARRAYNOTALLOCATED
	FB_ERRMSG_EXPECTEDINDEX
	FB_ERRMSG_EXPECTEDENDENUM
	FB_ERRMSG_CANTINITDYNAMICARRAYS
	FB_ERRMSG_INVALIDBITFIELD
	FB_ERRMSG_TOOMANYPARAMS
	FB_ERRMSG_MACROTEXTTOOLONG
	FB_ERRMSG_INVALIDCMDOPTION
	FB_ERRMSG_CANTINITDYNAMICSTRINGS
	FB_ERRMSG_RECURSIVEUDT
	FB_ERRMSG_RECURSIVEMACRO
	FB_ERRMSG_CANTREDIMARRAYFIELDS
	FB_ERRMSG_CANTINCLUDEPERIODS
	FB_ERRMSG_EXEMISSING
	FB_ERRMSG_ARRAYOUTOFBOUNDS
	FB_ERRMSG_MISSINGCMDOPTION
	FB_ERRMSG_MATHOVERFLOW
	FB_ERRMSG_EXPECTEDANY
	FB_ERRMSG_EXPECTEDENDSCOPE
	FB_ERRMSG_ILLEGALINSIDEASCOPE
	FB_ERRMSG_CANTPASSUDTRESULTBYREF
	FB_ERRMSG_AMBIGUOUSCALLTOPROC
	FB_ERRMSG_NOMATCHINGPROC
	FB_ERRMSG_DIVBYZERO
	FB_ERRMSG_STACKUNDERFLOW
	FB_ERRMSG_CANTINITDYNAMICFIELDS
	FB_ERRMSG_BRANCHTOBLOCKWITHLOCALVARS
	FB_ERRMSG_BRANCHTARTGETOUTSIDECURRPROC
	FB_ERRMSG_BRANCHCROSSINGDYNDATADEF
	FB_ERRMSG_LOOPWITHOUTDO
	FB_ERRMSG_NEXTWITHOUTFOR
	FB_ERRMSG_WENDWITHOUTWHILE
	FB_ERRMSG_ENDWITHWITHOUTWITH
	FB_ERRMSG_ENDIFWITHOUTIF
	FB_ERRMSG_ENDSELECTWITHOUTSELECT
	FB_ERRMSG_ENDSUBWITHOUTSUB
	FB_ERRMSG_ENDSCOPEWITHOUTSCOPE
	FB_ERRMSG_ENDNAMESPACEWITHOUTNAMESPACE
	FB_ERRMSG_ENDEXTERNWITHOUTEXTERN
	FB_ERRMSG_ELSEIFWITHOUTIF
	FB_ERRMSG_ELSEWITHOUTIF
	FB_ERRMSG_CASEWITHOUTSELECT
	FB_ERRMSG_CONSTANTCANTBECHANGED
	FB_ERRMSG_EXPECTEDPERIOD
	FB_ERRMSG_EXPECTEDENDNAMESPACE
	FB_ERRMSG_ILLEGALINSIDEANAMESPC
	FB_ERRMSG_CANTREMOVENAMESPCSYMBOLS
	FB_ERRMSG_EXPECTEDENDEXTERN
	FB_ERRMSG_EXPECTEDENDSUB
	FB_ERRMSG_EXPECTEDENDFUNCTION
	FB_ERRMSG_EXPECTEDENDCTOR
	FB_ERRMSG_EXPECTEDENDDTOR
	FB_ERRMSG_EXPECTEDENDOPERATOR
	FB_ERRMSG_DECLOUTSIDENAMESPC
	FB_ERRMSG_EXPECTEDENDCOMMENT
	FB_ERRMSG_TOOMANYERRORS
	FB_ERRMSG_EXPECTEDMACRO
	FB_ERRMSG_CANNOTINITEXTERNORCOMMON
	FB_ERRMSG_ATLEASTONEPARAMMUSTBEANUDT
	FB_ERRMSG_PARAMORRESULTMUSTBEANUDT
	FB_ERRMSG_SAMEPARAMETERTYPES
	FB_ERRMSG_SAMEPARAMANDRESULTTYPES
	FB_ERRMSG_INVALIDRESULTTYPEFORTHISOP
	FB_ERRMSG_VARARGPARAMNOTALLOWED
	FB_ERRMSG_ILLEGALOUTSIDEANOPERATOR
	FB_ERRMSG_PARAMCANTBEOPTIONAL
	FB_ERRMSG_ONLYVALIDINLANG
	FB_ERRMSG_DEFTYPEONLYVALIDINLANG
	FB_ERRMSG_SUFFIXONLYVALIDINLANG
	FB_ERRMSG_IMPLICITVARSONLYVALIDINLANG
	FB_ERRMSG_INVALIDARRAYINDEX

	FB_ERRMSGS
end enum

enum FB_WARNINGMSG
	FB_WARNINGMSG_PASSINGSCALARASPTR			= 1
	FB_WARNINGMSG_PASSINGPTRTOSCALAR
	FB_WARNINGMSG_PASSINGDIFFPOINTERS
	FB_WARNINGMSG_SUSPICIOUSPTRASSIGN
	FB_WARNINGMSG_IMPLICITCONVERSION
	FB_WARNINGMSG_CANNOTEXPORT
	FB_WARNINGMSG_IDNAMETOOBIG
	FB_WARNINGMSG_NUMBERTOOBIG
	FB_WARNINGMSG_LITSTRINGTOOBIG
	FB_WARNINGMSG_POINTERFIELDS
	FB_WARNINGMSG_DYNAMICFIELDS
	FB_WARNINGMSG_IMPLICITALLOCATION
	FB_WARNINGMSG_NOCLOSINGQUOTE
	FB_WARNINGMSG_NOFUNCTIONRESULT
	FB_WARNINGMSG_BRANCHCROSSINGLOCALVAR
	FB_WARNINGMSG_NOEXPLICITPARAMMODE
	FB_WARNINGMSG_POSSIBLEESCSEQ
	FB_WARNINGMSG_PARAMSIZETOOBIG
	FB_WARNINGMSG_PARAMLISTSIZETOOBIG

	FB_WARNINGMSGS
end enum

'' runtime errors
enum FB_RTERROR
	FB_RTERROR_OK = 0
	FB_RTERROR_ILLEGALFUNCTIONCALL
	FB_RTERROR_FILENOTFOUND
	FB_RTERROR_FILEIO
	FB_RTERROR_OUTOFMEM
	FB_RTERROR_ILLEGALRESUME
	FB_RTERROR_OUTOFBOUNDS
	FB_RTERROR_SIGINT
	FB_RTERROR_SIGILL
	FB_RTERROR_SIGFPE
	FB_RTERROR_SIGSEGV
	FB_RTERROR_SIGTERM
	FB_RTERROR_SIGABRT
	FB_RTERROR_SIGQUIT
end enum

#include once "inc\hash.bi"

type FB_ERRCTX
	cnt				as integer
	lastmsg 		as integer
	lastline		as integer
	laststmt		as integer
	undefhash		as THASH				'' undefined symbols
end type

enum FB_ERRMSGOPT
	FB_ERRMSGOPT_NONE 		= &h00000000
	FB_ERRMSGOPT_ADDCOMMA 	= &h00000001
	FB_ERRMSGOPT_ADDCOLON 	= &h00000002
	FB_ERRMSGOPT_ADDQUOTES 	= &h00000004

	FB_ERRMSGOPT_DEFAULT	= FB_ERRMSGOPT_ADDCOMMA
end enum

declare	sub 		errInit					( _
											)

declare	sub 		errEnd					( _
											)

declare function	errReportEx				( _
												byval errnum as integer, _
												byval msgex as zstring ptr, _
												byval linenum as integer = 0, _
												byval options as FB_ERRMSGOPT = FB_ERRMSGOPT_DEFAULT _
											) as integer

declare function	errReport				( _
												byval errnum as integer, _
												byval isbefore as integer = FALSE _
											) as integer

declare sub 		errReportWarn			( _
												byval msgnum as integer, _
												byval msgex as zstring ptr = NULL, _
												byval options as FB_ERRMSGOPT = FB_ERRMSGOPT_DEFAULT _
											)

declare sub 		errReportWarnEx			( _
												byval msgnum as integer, _
												byval msgex as zstring ptr = NULL, _
												byval linenum as integer = 0, _
												byval options as FB_ERRMSGOPT = FB_ERRMSGOPT_DEFAULT _
											)

declare function	errReportParam			( _
												byval proc as any ptr, _
												byval pnum as integer, _
												byval pid as zstring ptr, _
												byval msgnum as integer _
											) as integer

declare sub 		errReportParamWarn		( _
												byval proc as any ptr, _
												byval pnum as integer, _
												byval pid as zstring ptr, _
												byval msgnum as integer _
											)

declare function	errReportUndef			( _
												byval errnum as integer, _
												byval id as zstring ptr _
											) as integer

declare function	errReportNotAllowed		( _
												byval opt as FB_LANG_OPT, _
												byval errnum as integer = FB_ERRMSG_ONLYVALIDINLANG, _
												byval msgex as zstring ptr = NULL _
											) as integer

declare function	errFatal				( _
											) as integer

''
'' macros
''
#define errGetLast( ) iif( errctx.cnt >= env.clopt.maxerrors, _
						   errctx.lastmsg, _
						   cint(FB_ERRMSG_OK) )

#define errGetCount( ) errctx.cnt


''
'' inter-module globals
''
extern errctx as FB_ERRCTX


#endif ''__ERROR_BI__

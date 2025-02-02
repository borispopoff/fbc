' TEST_MODE : MULTI_MODULE_TEST

'' test mapping of basic data types between fbc and g++
'' with c++ name mangling

'' by default, fbc's Long/ULong data type maps to c's int type, and since 
'' Integer/Uinteger are meant to be (consistently) 64bits in fbc-64bit,
'' there is no other type that (by default) that can map to c's long int, 
'' which is 32bit even on Win64.

'' So, in Win64, to allow calling an external library that needs a 'long int' 
'' parameter there is the following, non-portable mangling modifier.  It is 
'' ignored for all targets except for Win64

#if defined(__FB_64BIT__) and not defined(__FB_UNIX__)
	'' map fbc's 32bit 'LONG' type to Win64's 32bit 'long' type
	type cxxlongint as long alias "long"
#else
	'' otherwise, integer is used on 32bit and Unix-64bit consistently to map
	'' fbc's 32/64bit 'INTEGER' type to the target 32/64bit 'long int' type
	type cxxlongint as integer
#endif 

extern "c++"

namespace cpp_mangle
	
	declare function cpp_byval_bool( byval a as boolean ) as boolean
	declare function cpp_byref_bool( byref a as boolean ) as boolean

	declare function cpp_byval_float( byval a as single ) as single
	declare function cpp_byref_float( byref a as single ) as single

	declare function cpp_byval_double( byval a as double ) as double
	declare function cpp_byref_double( byref a as double ) as double

	declare function cpp_byval_char_b( byval a as byte alias "char" ) as byte alias "char"
	declare function cpp_byval_char_u( byval a as ubyte alias "char" ) as ubyte alias "char"
	declare function cpp_byval_char_ub( byval a as unsigned byte alias "char" ) as unsigned byte alias "char"

	declare function cpp_byref_char_b( byref a as byte alias "char" ) as byte alias "char"
	declare function cpp_byref_char_u( byref a as ubyte alias "char" ) as ubyte alias "char"
	declare function cpp_byref_char_ub( byref a as unsigned byte alias "char" ) as unsigned byte alias "char"

	declare function cpp_byval_uchar( byval a as unsigned byte ) as unsigned byte
	declare function cpp_byval_schar( byval a as byte ) as byte
	declare function cpp_byref_uchar( byref a as unsigned byte ) as unsigned byte
	declare function cpp_byref_schar( byref a as byte ) as byte

   	declare function cpp_byval_ushort( byval a as unsigned short ) as unsigned short
	declare function cpp_byval_sshort( byval a as short ) as short
	declare function cpp_byref_ushort( byref a as unsigned short ) as unsigned short
	declare function cpp_byref_sshort( byref a as short ) as short

   	declare function cpp_byval_uint( byval a as unsigned long ) as unsigned long
	declare function cpp_byval_sint( byval a as long ) as long
	declare function cpp_byref_uint( byref a as unsigned long ) as unsigned long
	declare function cpp_byref_sint( byref a as long ) as long

   	declare function cpp_byval_ulongint( byval a as unsigned cxxlongint ) as unsigned cxxlongint
	declare function cpp_byval_slongint( byval a as cxxlongint ) as cxxlongint
	declare function cpp_byref_ulongint( byref a as unsigned cxxlongint ) as unsigned cxxlongint
	declare function cpp_byref_slongint( byref a as cxxlongint ) as cxxlongint

   	declare function cpp_byval_ulonglongint( byval a as unsigned longint ) as unsigned longint
	declare function cpp_byval_slonglongint( byval a as longint ) as longint
	declare function cpp_byref_ulonglongint( byref a as unsigned longint ) as unsigned longint 
	declare function cpp_byref_slonglongint( byref a as longint ) as longint

	declare function cpp_byval_const_double( byval a as const double ) as double
	declare function cpp_byval_double_ptr( byval a as double ptr ) as double
	declare function cpp_byval_const_double_ptr( byval a as const double ptr ) as double
	declare function cpp_byval_double_const_ptr( byval a as double const ptr ) as double
	declare function cpp_byval_const_double_const_ptr( byval a as const double const ptr ) as double
	declare function cpp_byval_double_ptr_ptr( byval a as double ptr ptr ) as double
	declare function cpp_byval_const_double_ptr_ptr( byval a as const double ptr ptr ) as double
	declare function cpp_byval_double_const_ptr_ptr( byval a as double const ptr ptr ) as double
	declare function cpp_byval_double_ptr_const_ptr( byval a as double ptr const ptr ) as double

	declare function cpp_byref_const_double( byref a as const double ) as double
	declare function cpp_byref_double_ptr( byref a as double ptr ) as double
	declare function cpp_byref_const_double_ptr( byref a as const double ptr ) as double
	declare function cpp_byref_double_const_ptr( byref a as double const ptr ) as double
	declare function cpp_byref_const_double_const_ptr( byref a as const double const ptr ) as double
	declare function cpp_byref_double_ptr_ptr( byref a as double ptr ptr ) as double
	declare function cpp_byref_const_double_ptr_ptr( byref a as const double ptr ptr ) as double
	declare function cpp_byref_double_const_ptr_ptr( byref a as double const ptr ptr ) as double
	declare function cpp_byref_double_ptr_const_ptr( byref a as double ptr const ptr ) as double

	declare function cpp_variadic_start( byval n as long, ... ) as long
	declare function cpp_variadic_list_byval( byval n as long, byval args as cva_list ) as long
	declare function cpp_variadic_list_byref( byval n as long, byref args as cva_list ) as long
	declare function cpp_variadic_list_byref_ptr( byval n as long, byref args as cva_list ptr ) as long
	declare function cpp_variadic_list_ptr( byval n as long, byval args as cva_list ptr ) as long
	declare function cpp_variadic_list_ptr_ptr( byval n as long, byval args as cva_list ptr ptr ) as long

	declare function cpp__byval_int__byref_int__byref_int(byval a as long, byref b as long, byref c as long) as long
	declare function cpp__byval_const_int__byref_int__byref_int(byval a as const long, byref b as long, byref c as long) as long
	declare function cpp__byval_const_int_ptr__byref_int__byref_int(byval a as const long ptr, byref b as long, byref c as long) as long
	declare function cpp__byval_const_int_const_ptr__byref_int__byref_int(byval a as const long const ptr, byref b as long, byref c as long) as long

end namespace

end extern

using cpp_mangle

scope

	''  c = bool
	'' fb = boolean

	dim b as boolean
	ASSERT( cpp_byval_bool(false) = 0 )
	ASSERT( cpp_byval_bool(true) = true )
	b = false: ASSERT( cpp_byref_bool(b) = false )
	b = true : ASSERT( cpp_byref_bool(b) = true )

end scope

scope

	''  c = float
	'' fb = single

	dim s as single
	ASSERT( cpp_byval_float(s) = 0 )
	ASSERT( cpp_byval_float(s) = 0 )
	s = 0: ASSERT( cpp_byref_float(s) = 0 )
	s = 10 : ASSERT( cpp_byref_float(s) = 10 )

end scope

scope

	''  c = double
	'' fb = double

	dim d as double
	ASSERT( cpp_byval_double(d) = 0 )
	ASSERT( cpp_byval_double(d) = 0 )
	d = 0: ASSERT( cpp_byref_double(d) = 0 )
	d = 10 : ASSERT( cpp_byref_double(d) = 10 )

end scope

scope
				 
	''  c = [signed|unsigned] char
	'' fb = [unsigned] byte

	ASSERT( cpp_byval_char_b(0) = 0 )
	ASSERT( cpp_byval_char_u(0) = 0 )
	ASSERT( cpp_byval_char_ub(0) = 0 )
	ASSERT( cpp_byval_uchar(0) = 0 )
	ASSERT( cpp_byval_schar(0) = 0 )
	ASSERT( cpp_byval_char_b(&h7f) = &h7f )
	ASSERT( cpp_byval_char_u(&h7f) = &h7f )
	ASSERT( cpp_byval_char_ub(&h7f) = &h7f )
	ASSERT( cpp_byval_uchar(&h7f) = &h7f )
	ASSERT( cpp_byval_schar(&h7f) = &h7f )

	dim ub as unsigned byte = 0
	dim sb as byte = 0
	ASSERT( cpp_byref_char_b(ub) = 0 )
	ASSERT( cpp_byref_char_u(ub) = 0 )
	ASSERT( cpp_byref_char_ub(ub) = 0 )
	ASSERT( cpp_byref_uchar(ub) = 0 )
	ASSERT( cpp_byref_schar(sb) = 0 )
	ub = &h7f
	sb = &h7f
	ASSERT( cpp_byref_char_b(ub) = &h7f )
	ASSERT( cpp_byref_char_u(ub) = &h7f )
	ASSERT( cpp_byref_char_ub(ub) = &h7f )
	ASSERT( cpp_byref_uchar(ub) = &h7f )
	ASSERT( cpp_byref_schar(sb) = &h7f )

end scope

scope

	''  c = signed|unsigned short int
	'' fb = [unsigned] short

	ASSERT( cpp_byval_ushort(0) = 0 )
	ASSERT( cpp_byval_sshort(0) = 0 )
	ASSERT( cpp_byval_ushort(&h7fff) = &h7fff )
	ASSERT( cpp_byval_sshort(&h7fff) = &h7fff )

	dim us as unsigned short = 0
	dim ss as short = 0
	ASSERT( cpp_byref_ushort(us) = 0 )
	ASSERT( cpp_byref_sshort(ss) = 0 )
	us = &h7fff
	ss = &h7fff
	ASSERT( cpp_byref_ushort(us) = &h7fff )
	ASSERT( cpp_byref_sshort(ss) = &h7fff )

end scope

scope

	''  c = signed|unsigned int
	'' fb = [unsigned] long

	ASSERT( cpp_byval_uint(0) = 0 )
	ASSERT( cpp_byval_sint(0) = 0 )
	ASSERT( cpp_byval_uint(&h7fffffff) = &h7fffffff )
	ASSERT( cpp_byval_sint(&h7fffffff) = &h7fffffff )

	dim ui as unsigned long = 0
	dim si as long = 0
	ASSERT( cpp_byref_uint(ui) = 0 )
	ASSERT( cpp_byref_sint(si) = 0 )
	ui = &h7fffffff
	si = &h7fffffff
	ASSERT( cpp_byref_uint(ui) = &h7fffffff )
	ASSERT( cpp_byref_sint(si) = &h7fffffff )

end scope

scope

	'' c = signed|unsigned long int
	'' fb = [unsigned] long alias "long"    on Win64
	'' fb = [unsigned] integer              on everything else

	ASSERT( cpp_byval_ulongint(0) = 0 )
	ASSERT( cpp_byval_slongint(0) = 0 )
	ASSERT( cpp_byval_ulongint(&h7fffffff) = &h7fffffff )
	ASSERT( cpp_byval_sint(&h7fffffff) = &h7fffffff )

	dim ul as unsigned cxxlongint = 0
	dim sl as cxxlongint = 0
	ASSERT( cpp_byref_ulongint(ul) = 0 )
	ASSERT( cpp_byref_slongint(sl) = 0 )
	ul = &h7fffffff
	sl = &h7fffffff
	ASSERT( cpp_byref_ulongint(ul) = &h7fffffff )
	ASSERT( cpp_byref_slongint(sl) = &h7fffffff )

end scope

scope

	''  c = signed|unsigned long long int
	'' fb = [unsigned] longint

	ASSERT( cpp_byval_ulonglongint(0) = 0 )
	ASSERT( cpp_byval_slonglongint(0) = 0 )
	ASSERT( cpp_byval_ulonglongint(&h7fffffffffffffff) = &h7fffffffffffffff )
	ASSERT( cpp_byval_slonglongint(&h7fffffffffffffff) = &h7fffffffffffffff )

	dim ull as unsigned longint = 0
	dim sll as longint = 0
	ASSERT( cpp_byref_ulonglongint(ull) = 0 )
	ASSERT( cpp_byref_slonglongint(sll) = 0 )
	ull = &h7fffffffffffffff
	sll = &h7fffffffffffffff
	ASSERT( cpp_byref_ulonglongint(ull) = &h7fffffffffffffff )
	ASSERT( cpp_byref_slonglongint(sll) = &h7fffffffffffffff )

end scope

scope
	'' [const] pointers and references

	dim d as double = 1
	dim dp as double ptr = @d
	dim dpp as double ptr ptr = @dp

	ASSERT( cpp_byval_double( d ) = d )
	ASSERT( cpp_byval_const_double( d ) = d )
	ASSERT( cpp_byval_double_ptr( dp ) = d )
	ASSERT( cpp_byval_const_double_ptr( dp ) = d )
	ASSERT( cpp_byval_double_const_ptr( dp ) = d )
	ASSERT( cpp_byval_const_double_const_ptr( dp ) = d )

	ASSERT( cpp_byval_double_ptr_ptr( dpp ) = d )
	ASSERT( cpp_byval_const_double_ptr_ptr( dpp ) = d )
	ASSERT( cpp_byval_double_const_ptr_ptr( dpp ) = d )
	ASSERT( cpp_byval_double_ptr_const_ptr( dpp ) = d )

	ASSERT( cpp_byref_double( d ) = d )
	ASSERT( cpp_byref_const_double( d ) = d )
	ASSERT( cpp_byref_double_ptr( dp ) = d )
	ASSERT( cpp_byref_const_double_ptr( dp ) = d )
	ASSERT( cpp_byref_double_const_ptr( dp ) = d )
	ASSERT( cpp_byref_const_double_const_ptr( dp ) = d )

	ASSERT( cpp_byref_double_ptr_ptr( dpp ) = d )
	ASSERT( cpp_byref_const_double_ptr_ptr( dpp ) = d )
	ASSERT( cpp_byref_double_const_ptr_ptr( dpp ) = d )
	ASSERT( cpp_byref_double_ptr_const_ptr( dpp ) = d )

end scope

sub variadic_list_byval cdecl( byval n as long, ... )
	dim x as cva_list = any
	cva_start( x, n )
	ASSERT( cpp_variadic_list_byval( 3, x ) = 3 )
	cva_end( x )
end sub

sub variadic_list_byref cdecl( byval n as long, ... )
	dim x as cva_list = any
	cva_start( x, n )
	ASSERT( cpp_variadic_list_byref( 4, x ) = 4 )
	cva_end( x )
end sub

sub variadic_list_byref_ptr cdecl( byval n as long, ... )
	dim x as cva_list = any
	dim y as cva_list ptr = @x
	cva_start( *y, n )
	ASSERT( cpp_variadic_list_byref_ptr( 5, y ) = 5 )
	cva_end( *y )
end sub

sub variadic_list_ptr cdecl( byval n as long, ... )
	dim x as cva_list = any
	cva_start( x, n )
	ASSERT( cpp_variadic_list_ptr( 6, @x ) = 6 )
	cva_end( x )
end sub

sub variadic_list_ptr_ptr cdecl( byval n as long, ... )
	dim x as cva_list = any
	dim y as cva_list ptr = @x
	cva_start( *y, n )
	ASSERT( cpp_variadic_list_ptr_ptr( 7, @y ) = 7 )
	cva_end( *y )
end sub

scope
	ASSERT( cpp_variadic_start( 3, 1, 2, 3 ) = 3 )
	variadic_list_byval( 3, 1, 2, 3 )
	variadic_list_byref( 3, 1, 2, 3 )
	variadic_list_byref_ptr( 3, 1, 2, 3 )
	variadic_list_ptr( 3, 1, 2, 3 )
	variadic_list_ptr_ptr( 3, 1, 2, 3 )
end scope

scope
	dim i as long = 123
	ASSERT( cpp__byval_int__byref_int__byref_int( 123, 0, 0 ) = 123 )
	ASSERT( cpp__byval_const_int__byref_int__byref_int( 123, 0, 0 ) = 123 )
	ASSERT( cpp__byval_const_int_ptr__byref_int__byref_int( @i, 0, 0 ) = 123 )
	ASSERT( cpp__byval_const_int_const_ptr__byref_int__byref_int( @i, 0, 0 ) = 123 )
end scope

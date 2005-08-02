/*
 *  libgfx2 - FreeBASIC's alternative gfx library
 *	Copyright (C) 2005 Angelo Mottola (a.mottola@libero.it)
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 2.1 of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

/*
 * vsync.c -- vertical sync routine
 *
 * chng: may/2005 written [lillo]
 *
 */

#include "fb_gfx.h"


FBCALL int fb_GfxWaitVSync(void)
{
	if (!fb_mode)
		return fb_ErrorSetNum( FB_RTERROR_ILLEGALFUNCTIONCALL );
	if (fb_mode->driver->wait_vsync)
		fb_mode->driver->wait_vsync();
	
	return FB_RTERROR_OK;
}

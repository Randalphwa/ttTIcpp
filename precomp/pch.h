// This header file is used to create a pre-compiled header for use in the entire project

#pragma once

#if defined(_WIN32)

    #define NOATOM
    #define NODRIVERS
    #define NOEXTDEVMODEPROPSHEET
    #define NOIME
    #define NOKANJI
    #define NOLOGERROR
    #define NOMCX
    #define NOPROFILER
    #define NOSCALABLEFONT
    #define NOSERVICE
    #define NOSOUND
    #define NOWINDOWSX
    #define NOENHMETAFILE

    #define OEMRESOURCE

    #define WIN32_LEAN_AND_MEAN
    #define STRICT

    #ifndef _WIN32_WINNT_VISTA
        #define _WIN32_WINNT_NT4   0x0400
        #define _WIN32_WINNT_WINXP 0x0501
        #define _WIN32_WINNT_VISTA 0x0600
        #define _WIN32_WINNT_WIN7  0x0601
        #define _WIN32_WINNT_WIN8  0x0602
        #define _WIN32_WINNT_WIN10 0x0A00
    #endif

    #define WINVER       _WIN32_WINNT_VISTA  // minimum OS required
    #define _WIN32_WINNT _WIN32_WINNT_VISTA

    #define _WTL_NEW_PAGE_NOTIFY_HANDLERS
    #define _ATL_NO_DEBUG_CRT

    #define _WINSOCKAPI_  // so atlbase.h won't pull in WinSock2.h

    #include <windows.h>

#endif

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

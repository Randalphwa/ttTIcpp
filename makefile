# Call with nmake.exe (MSVC) or a GNU make variation (mingw32-make.exe, gmake.exe, or make.exe)

# nmake               <-- this will build release target(s)
# nmake debug         <-- this will build debug target(s)
# nmake clean release <-- this will rebuild release target(s)
# nmake cleanD debug  <-- this will rebuild debug target(s)

# mingw32-make               <-- this will build release target(s)
# mingw32-make debug         <-- this will build release target(s)
# mingw32-make clean release <-- this will rebuild release target(s)
# mingw32-make cleanD debug  <-- this will rebuild debug target(s)

# This makefile defaults to building _x64 (64-bit) targets. If you need to build _x86 (32-bit)
# targets, then you must either add b32=1 to the nmake or make command line, or remove the '#'
# character from the #b32=1 line below.

# If b32=1 is set and you have a LIB32 environment variable, then LIB will be set to LIB33
# for all programs run by this makefile.

# If b32=1 is set and you have a PATH32 environment variable, then PATH will be set to PATH32
# for all programs run by this makefile.

# Remove the '#' character in the following line to always build x86 (32-bit) targets

#b32=1

# \
!ifndef 0 # \
######### Following section is for nmake ######### \
#\
!ifdef b32 # \
bits=_x86 # \
!ifdef LIB32 # \
LIB=$(LIB32) # \
!endif # \
!ifdef PATH32 # \
PATH=$(PATH32) # \
!endif  # \
#\
!else # \
bits=_x64 # \
!endif  # b32 \
!ifndef cmplr # \
cmplr=msvc # \
!endif #\
#\
bdir=bld # \
BldScript=$(bdir)/$(cmplr)$(bits)_rel.ninja # \
BldScriptD=$(bdir)/$(cmplr)$(bits)_dbg.ninja # \
# \
!else
######### Following section is for GNU make and variants #########

ifdef b32
    bits=_x86
    ifdef LIB32
        LIB=$(LIB32)
    endif
    ifdef PATH32
        PATH=$(PATH32)
    endif
else
    bits=_x64
endif

ifndef cmplr
    cmplr=clang
endif

bdir=bld
BldScript=$(bdir)/$(cmplr)$(bits)_rel.ninja
BldScriptD=$(bdir)/$(cmplr)$(bits)_dbg.ninja

# \
!endif

########## release section ##########

release: $(BldScript) ttTIcpp

ttTIcpp:
	ninja -f $(BldScript)

########## debug section ##########

debug: $(BldScriptD) ttTIcppD

ttTIcppD:
	ninja -f $(BldScriptD)

########## localization ##########

locale:
	xgettext -k_ -kwxGetTranslation -kwxPLURAL -k_XGET -kTRANSLATE -i -c --omit-header -fxgen.lst

########## clean release section ##########

clean: $(BldScript)
	ninja -f $(BldScript) -t clean

########## clean debug section ##########

cleanD: $(BldScriptD)
	ninja -f $(BldScriptD) -t clean

########## special ninja diagnostics ##########

commandsD: $(BldScriptD)
	ninja -f $(BldScriptD) -t commands

commandsR: $(BldScript)
	ninja -f $(BldScript) -t commands

targetsD: $(BldScriptD)
	ninja -f $(BldScriptD) -t targets depth 2

targetsR: $(BldScript)
	ninja -f $(BldScript) -t targets depth 2

deps: $(BldScript)
	ninja -f $(BldScript) -t deps

########## Creates or updates ninja file any time .srcfiles.yaml changes ##########

$(BldScript): .srcfiles.yaml
	ttBld.exe -u$(cmplr)$(bits)

$(BldScriptD): .srcfiles.yaml
	ttBld.exe -u$(cmplr)$(bits)D

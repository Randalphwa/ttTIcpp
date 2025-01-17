# Building

At an absolute minimum, you will need to have the following in your PATH:

- [Ninja.exe](https://github.com/ninja-build/ninja)

- Either of the following compilers:
  - [CLANG](https://clang.llvm.org/) (version 7 or higher)
  - MSVC

Before building, you will need to start one of the Visual Studio command shells, preferablly one that builds 64-bit targets. From within that shell, you can use the following commands to build the library:

	cd src
	nmake

By default, this will build a 64-bit release version of the library.

If you have MINGW installead and both MINGW and the CLANG compiler are in your PATH, you can use the following commands to build the library:

	cd src
	mingw32-make

This will also default to creating a 64-bit release version of the library.

The comments at the top of the **makefile** explain how to build a 32-bit version of the library using either compiler.

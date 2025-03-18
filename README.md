# Khuraphati

A collection of miscellaneous scripts.

## Getting started

1. Clone this repo `git clone https://github.com/ayushmanchhabra/khuraphati.git`
1. Jump into repo `cd ./khuraphati`
1. Make script executable `chmod +x ./aos.sh`
1. Follow below usage instructions

## Platform specific instructions:

If using script in Linux but referencing adb binary from Windows file path:

```sh
./aos.sh extract com.package.name ./out /mnt/c/ProgramData/chocolatey/bin/adb.exe
```

## aos.sh

```sh
└─$ ./aos.sh help
aos.sh <command>

Usage:

./aos.sh (h)elp ..Get information on how to use this script
./aos.sh (e)xtract com.package.name /path/to/out/dir /path/toadb/exe ..Extract APK(s) from Android device using Android Debug Bridge (adb)
```

## License

MIT.

> Legal disclaimer: Usage of khuraphati scripts on hosts without prior mutual consent is illegal. It is the end user's responsibility to obey all applicable local, state and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program.

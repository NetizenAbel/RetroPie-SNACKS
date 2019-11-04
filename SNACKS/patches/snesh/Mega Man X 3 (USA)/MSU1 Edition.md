Mega Man X3 MSU-1 hack
Version 1.1
by DarkShock

This hack adds CD quality audio to Mega Man X3 and Mega Man X3 Zero Project using the MSU-1 chip invented by byuu.
The hack has been tested on SD2SNES, bsnes-plus and higan 094. The patched ROM needs to be named mmx3_msu1.sfc.

Note they are 4 IPS patches:
- mmx3_msu1_emulator.ips is the one to use for proper volume in emulators.
- mmx3_msu1.ips is for the SD2SNES
- mmx3_msu1_zero_emulator.ips is for Zero Project to use in emulators
- mmx3_msu1_zero.ips is for Zero Project to use on the SD2SNES

Original specs of the ROM:
MEGAMAN X3
2097152 Bytes (16.0000 Mb)
Padded: Maybe, 2887 Bytes (0.0220 Mb)
Interleaved/Swapped: No
Backup unit/emulator header: No
Version: 1.0
Checksum: Ok, 0x4055 (calculated) == 0x4055 (internal)
Inverse checksum: Ok, 0xbfaa (calculated) == 0xbfaa (internal)
Checksum (CRC32): 0xfa0fe671

===============
= Using higan =
===============
1. Patch the ROM
2. Launch it using higan
3. Go to %USERPROFILE%\Emulation\Super Famicom\mmx3_msu1.sfc in Windows Explorer.
4. Copy manifest.bml and the .pcm file there
5. Run the game

====================
= Using on SD2SNES =
====================
Drop the ROM file, mmx3_msu1.msu and the .pcm files in any folder. (I really suggest creating a folder)
Launch the game and voilà, enjoy !

===============
= Music       =
===============
The music is an edited version of the PS1/Saturn music for looping and volume boosting.
Find the music pack here: https://www.mediafire.com/?d249260e88oc9y2

If you want to make your own music pack, here's the music index:
01 = Intro Stage
02 = Blast Hornet
03 = Frost Buffalo
04 = Gravity Beetle
05 = Toxic Seahorse
06 = Doppler Stage 1
07 = Crush Crawfish
08 = Neon Tiger
09 = Boss Battle 1
10 = Doppler Stage 4
11 = Title Screen
12 = Stage Select
13 = Passsword
14 = Tunnel Rhino
15 = Boss Selected Jingle
16 = Talking to Dr.Cain
17 = Doppler Boss Battle
18 = Doppler Stage Select
19 = Victory Jingle
20 = Intro cutscene
21 = Ending Theme 1
22 = Boss Intro 1
24 = Doppler Stage 3
26 = Volt Catfish
27 = Vile Secret Stage
28 = Sigma Battle 1
29 = Sigma Battle 2
30 = Cast Roll (Ending Theme 2)
31 = Got a Weapon Jingle
32 = Zero Theme

=============
= Compiling =
=============
Source is availabe on GitHub: https://github.com/mlarouche/MegamanX3-MSU1

To compile the hack you need

* bass v14 (http://files.byuu.org/download/bass_v14.tar.xz)
* wav2msu (https://github.com/mlarouche/wav2msu)

To distribute the hack you need

* uCON64 (http://ucon64.sourceforge.net/)
* 7-Zip (http://www.7-zip.org/)

make.bat assemble the patch
create_pcm.bat create the .pcm from the WAV files
distribute.bat distribute the patch
make_all.bat does everything

Secret of Mana/Seiken Densetsu 2 MSU-1
Version 1.0
by DarkShock

This hack adds CD quality audio to Secret of Mana using the MSU-1 chip invented by byuu.
The hack has been tested on SD2SNES, bsnes-plus 073.1b and higan 094. The patched ROM needs to be named som_msu1.sfc.

BSNES v075 or any other version is NOT RECOMMENDED, use bsnes-plus it's much better (and also the emulator I use for testing/analysis/debugging).

Works also with:
- Seiken Densetsu 2 (J)
- Secret of Mana (F)

**** IMPORTANT FOR PAL ROM *****
You need to edit the manifest file (som_msu1.xml or manifest.bml) and change NTSC to PAL in order to work

In order for this to work, you need the music pack available here: https://www.mediafire.com/?q6lss155pnywtt3

=================
= Patch the ROM =
=================
Use Lunar IPS or your favorite IPS patcher to patch the ROM.

===============
= Using BSNES =
===============
1. Patch the ROM
2. Generate the .pcm
3. Launch the game

===============
= Using higan =
===============
1. Patch the ROM
2. Launch it using higan
3. Go to %USERPROFILE%\Emulation\Super Famicom\som_msu1.sfc in Windows Explorer.
4. Copy manifest.bml and the .pcm file there
5. Run the game

====================
= Using on SD2SNES =
====================
Drop the ROM file, som_msu1.msu and the .pcm files in any folder. (I really suggest creating a folder)
Launch the game and voilà, enjoy !

===========
= Credits =
===========
* DarkShock - ASM hacking & coding
* David Thomas / GinBunBun - Music compilation
* NTI Productions - Music editing
* Datschge - SPC dump

=========
= Music =
=========
$00 / 00 = Secret of the Arid Sands
$01 / 01 = Flight into the Unknown
$02 / 02 = Star of Darkness
$03 / 03 = Prophecy
$04 / 04 = Danger
$05 / 05 = Far Thunder
$06 / 06 = The Wind Nevere Ceases
$07 / 07 = Close your Eyelids
$08 / 08 = Spirit of the Night
$09 / 09 = The Fairy Child
$0A / 10 = What the Forest Taught Me
$0B / 11 = Eternal Recurrence
$0C / 12 = Oracle
$0D / 13 = Tell a Strange Tale
$0E / 14 = Into the tick of it
$0F / 15 = Rose and Ghost
$10 / 16 = Did you See the Sea?
$11 / 17 = The Color of the Summer Sky
$12 / 18 = Menu music
$13 / 19 = The Legend
$14 / 20 = The Orphan of Storm
$15 / 21 = Eight Ringing Bells
$16 / 22 = Dancing Beasts
$17 / 23 = Victory ! (Jingle)
$18 / 24 = Boss Defeated
$19 / 25 = Cannon Travel Lunch (SFX)
$1A / 26 = Cannon Travel (SFX)
$1B / 27 = Ceremony
$1C / 28 = Always Together / Together Always
$1D / 29 = A Prayer and a Whisper
$1E / 30 = New Contient Rises (SFX)
$1F / 31 = Happenings on a Moonlight Night
$20 / 32 = A Curious Happening
$21 / 33 = Unused Jingle 1
$22 / 34 = Midge Mallet (SFX)
$23 / 35 = Unknown Jingle 2
$24 / 36 = A Wish
$25 / 37 = Monarch on the Shore
$26 / 38 = Steel and Traps
$27 / 39 = Pure Night
$28 / 40 = Flammie Coming (SFX)
$29 / 41 = Kind Memories
$2A / 42 = The Holy Intruder
$2B / 43 = In the Darkness' Depths (The Dead of Night)
$2C / 44 = Angel's Fear
$2D / 45 = Mysterious Moaning
$2E / 46 = Mara's Key (Jingle)
$2F / 47 = Got an Item (Jingle)
$30 / 48 = Elemental Acquired (Jingle)
$31 / 49 = Give Love its Rightful Time
$32 / 50 = The Second Truth from the left
$33 / 51 = The Curse
$34 / 52 = I Won't Forget
$35 / 53 = Ally Joins (Jingle)
$36 / 54 = To Reach Tomorrow
$37 / 55 = One of them is hope
$38 / 56 = A Conclusion
$39 / 57 = Meridian Dance
$3A / 58 = The Wings No Longer Beat

=============
= Compiling =
=============
Source is availabe on GitHub: https://github.com/mlarouche/SecretOfMana-MSU1

To compile the hack you need

* bass v14 (https://web.archive.org/web/20140710190910/http://byuu.org/files/bass_v14.tar.xz)
* wav2msu (https://github.com/mlarouche/wav2msu)
* sox (https://sox.sourceforge.net/)

To distribute the hack you need

* uCON64 (http://ucon64.sourceforge.net/)
* 7-Zip (http://www.7-zip.org/)

make.bat assemble the patch
create_pcm.bat create the .pcm from the WAV files
edit_audio.bat process the WAV files with SOX
distribute.bat distribute the patch
make_all.bat does everything

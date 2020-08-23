# <a href="https://github.com/a5tronomy/Tekken-7-Modding-Tools/archive/master.zip">Download</a>
# Tekken 7 Extracting and Packing Tools

This is a set of scripts and batch files that was created to simplify Tekken 7's modding workflow. <br>

# Features
  - Automatic decryption and encryption
  - Simplified extraction and packing
  - Includes exclusive PS4 files

# Generate config file
In order to use the batch files, you have to generate a config file. Said file includes the paths to the '.pak' files, <br>
'tkdata.bin' as well as the '~mods' folder. To generate it, launch "Generate Config.bat". <br>

<img src="https://i.imgur.com/Zn0pjEO.png">

It will prompt you to paste the path to your local Tekken 7 installation as seen in the examples above. <br>
The console will echo "The configuration file has been generated." when the config file was succesfully generated. <br>
If you should ever need to edit it, you can do it manually by opening "Required\tools.config" in a text editor, by deleting it <br>
or by letting the batch file overwrite it. <br>

# Extract
Run one of the six batch files located in the 'Extract' folder in order to extract the desired assets - no drag and drop needed since <br>
the paths to the '.pak' files are stored in the config file.

# Packing
In order to pack one of your mods, you have to place it inside of the 'Packing' folder. Drag and drop it afterwards in one of the four batch files:
  - 'Pak (Uncompressed).bat': Packs your mod without any compression and places it automatically into the '~mods' folder
  - 'Pak (Compressed).bat': Packs & compresses your mod and places it automatically into the '~mods' folder
  - 'Pak (Compressed - Auto. Encryption).bat' & and 'Pak (Uncompressed - Auto. Encryption).bat': These batch files do the same processes as the ones listed above,
  but automatically encrypt the files that have to be encrypted in case you are working with decrypted assets (What means that you do not need to worry about encrypting and decrypting assets anymore)
  
# Unpacking
Drag and drop a '.pak' file into 'Unpak.bat' in order to unpack it - encrypted files will automatically be decrypted.

# Credits
  - <a href="https://aluigi.altervista.org/">Luigi Auriemma</a> for creating QuickBMS
  - <a href="https://www.fluffyquack.com/">FluffyQuack</a> for creating UnrealPak
  - <a href="https://twitter.com/gneiss64">Gneiss</a> for creating the cryptionscripts
  - <a href="https://twitter.com/MemeMongerBPM">Labryz</a> for creating the 'tkdata'-script


# Questions?
Join our Discord for help: <br>
https://discord.gg/4eKxJVg

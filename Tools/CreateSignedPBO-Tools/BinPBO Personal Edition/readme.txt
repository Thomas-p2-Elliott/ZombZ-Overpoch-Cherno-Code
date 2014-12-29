


BinPBO Personal Edition for ArmA2 OA
=================================
Copyright (c) 2011 Bohemia Interactive a.s. All rights reserved.

For more information about the tool visit http://community.bistudio.com/wiki/BinPBO

This tool is a GUI application for binarizing and packing ARMA2 OA addons

Requires BinMake, FileBank and DSSignFile (all are included in the installation setup).


Supported formats
=================================
input: folder
output: PBO file (ARMA2 OA addon) - binarized PBOs are no more compatible with ARMA: Armed Assault and ARMA Queens Gambit addons.


How to use (Window mode)
=================================
Binarize: uses a temp folder and stores there compressed files then packs them.

Create signature: If you have *.bi.biprivatekey file you can sign you addon and then this addon can by used on secured servers in MP games.

Clear temp folder: before binarizing, the subfolder for the current project is emptied.

List of files to copy directly: files with matching file-mask will be copied to the temp folder and then packed. Take effect only when binarize is enabled.

Path to signature file: *.bi.biprivatekey file with signature, addons created with a signature can be added to secure servers.

Path to temporary folder: path for the folder which stores binarized files, default destination is temp in Windows, if no value is present then the last folder is used, if you use the same folder, the next time you binarize the same addon it will take less time.


How to use (Command line mode)
=================================
BinPBO.exe [source_path [destination_path] [-WINDOW]] [-PACK|-BINARIZE [-CLEAR][-TEMP temp_path] ] [-DEBUG] [-PREFIX prefix_path] [-HELP] [-PROJECT project_path] [-SIGN privatekey_file] [-INCLUDE file_name]

source_path: path to folder to make PBO addon.

destination_path: path to folder to save the final PBO. If destination_path is not present then one level up from source_path is used to store the PBO file.

Without any parameters, BinPBO will start in window mode.
BinPBO.exe with source_path parameter executes a program in console mode; you can disable it by using parameter -WINDOW.

Parameters
=================================
-HELP: shows information about the program and parameters.

-PACK: only stores the folder to a PBO.

-BINARIZE: uses a temp folder and stores there compressed files, and then packs them.

-CLEAR: before binarizing, the subfolder for the current project is emptied.

-TEMP: path for the folder which stores binarized files, default destination is temp in Windows, if no value is present then the last folder is used, if you use the same folder, the next time you binarize the same addon it will take less time.

-DEBUG: shows output from the binarizing and packing process.

-PREFIX: relative path to files used in addon, if not present then this value is calculated automatically.

-PROJECT: path to folder where project starts from, if you are packing only the path of a project.
       e.g.:  project is P:\MyMOD
              addon  is P:\MyMOD\Tanks\T72

-SIGN: *.biprivatekey file with signature, addons created with a signature can be added to secure servers.

-INCLUDE: create a new list of file-masks to direct copy to PBO from record in file, separator is ";".

How to Pack
=================================
Pack without binarize:

Creates a PBO file that contains all the files from the source folder without files and directories that matched file-mask ..\Filebank\exclude.lst, you can modify this file at will.

Pack with binarize:

Creates a PBO file that contains converted files.
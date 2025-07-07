#!/bin/sh
# SETUP FOR MAC AND LINUX SYSTEMS!!!
# REMINDER THAT YOU NEED HAXE INSTALLED PRIOR TO USING THIS
# https://haxe.org/download
cd ..
echo Makking the main haxelib and setuping folder in same time..
mkdir ~/haxelib && haxelib setup ~/haxelib
echo Installing dependencies...
echo This might take a few moments depending on your internet speed.
haxelib install lime 8.1.2
haxelib install openfl 9.3.3
haxelib install flixel 4.11.0
haxelib install flixel-addons 2.11.0
haxelib install flixel-tools
haxelib install flixel-ui 2.6.1
haxelib install actuate 1.9.0 
haxelib install hscript
haxelib install hxCodec 2.5.1          
haxelib install linc_luajit
haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc
haxelib git faxe https://github.com/uhrobots/faxe
haxelib install hxcpp-debug-server
haxelib list
echo Finished!

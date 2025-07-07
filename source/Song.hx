package;

import Section.SwagSection;
import haxe.Json;
import haxe.format.JsonParser;
import lime.utils.Assets;

#if windows
import lime.app.Application;
#end

#if sys
import sys.io.File;
import sys.FileSystem;
#end

using StringTools;

typedef SwagSong =
{
	var song:String;
	var notes:Array<SwagSection>;
	var bpm:Float;
	var needsVoices:Bool;
	var speed:Float;
	var mania:Int;

	var player1:String;
	var player2:String;
	var gf:String;
	var gfVersion:String;
	var stage:String;

	var validScore:Bool;
}

class Song
{
	public var song:String;
	public var notes:Array<SwagSection>;
	public var bpm:Int;
	public var needsVoices:Bool = true;
	public var speed:Float = 1;
	public var mania:Int = 0;

	public var player1:String = 'bf';
	public var player2:String = 'dad';
	public var gfVersion:String = 'gf';
	public var gfVersion2:String = 'gf-bent';
	public var gf:String;
	public var stage:String;

	public static var CurSongDiffs:Array<String> = ["NORMAL"];

	public function new(song, notes, bpm)
	{
		this.song = song;
		this.notes = notes;
		this.bpm = bpm;
	}
	public static function difficultyString():String
		{
			return CurSongDiffs[PlayState.storyDifficulty];
		}

	public static function loadFromJson(jsonInput:String):SwagSong
	{
		var rawJson = "";
		rawJson = Assets.getText(Paths.chart(jsonInput.toLowerCase())).trim();

		while (!rawJson.endsWith("}"))
		{
			rawJson = rawJson.substr(0, rawJson.length - 1);
		}

		return parseJSONshit(rawJson);
	}

	public static function loadFromCustomJson(jsonInput:String):SwagSong
		{
			#if sys
			var rawJson = File.getContent(Paths.chartCustom(jsonInput.toLowerCase())).trim();
			#else
			var rawJson = Assets.getText(Paths.chart(jsonInput.toLowerCase())).trim();
			#end
	
			while (!rawJson.endsWith("}"))
			{
				rawJson = rawJson.substr(0, rawJson.length - 1);
			}
	
			return parseJSONshit(rawJson);
		}

	public static function parseJSONshit(rawJson:String):SwagSong
	{
		var swagShit:SwagSong = cast Json.parse(rawJson).song;
		swagShit.validScore = true;
		return swagShit;
	}
}
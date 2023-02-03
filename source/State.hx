package;

import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.system.FlxSound

class State extends MusicTheory {
	var cam:FlxCamera;
	var txt:FlxText;

	var g:FlxSound;

	override public function create() {
		super.create();

		txt = new FlxText(50, 0, 0, 'ok fjgodhfdghji', 75);
		add(txt);

		cam = new FlxCamera();
		FlxG.cameras.reset(cam);
		FlxG.cameras.setDefaultDrawTarget(cam, true);
	}

	override public function beatHit() {
		super.beatHit();
	}
}
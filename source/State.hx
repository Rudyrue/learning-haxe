package;

import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.text.FlxText;

class State extends MusicTheory extends flixel.FlxState {
	var cam:FlxCamera;
	var txt:FlxText;

	override public function create() {
		super.create();

		txt = new FlxText(50, 0, 0, 'ok fjgodhfdghji', 75);
		add(txt);

		cam = new FlxCamera();
		FlxG.cameras.reset(cam);
		FlxG.cameras.setDefaultDrawTarget(cam, true);
	}
}
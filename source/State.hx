package;

import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.FlxG;

class State extends flixel.FlxState {
	var cam:FlxCamera;

	override public function create() {
		super.create();

		cam = new FlxCamera();
		FlxG.cameras.reset(camGame);
		FlxG.cameras.setDefaultDrawTarget(camGame, true);
	}
}
package;

import flixel.FlxSprite;
import flixel.FlxCamera;

class State extends flixel.FlxState {
	var cam:FlxCamera;

	override public function create() {
		super.create();

		cam = new FlxCamera();
		FlxG.cameras.reset(camGame);
		FlxG.cameras.setDefaultDrawTarget(camGame, true);
	}
}
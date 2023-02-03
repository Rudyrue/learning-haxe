package;

class MusicTheory extends flixel.FlxState {
	public static var bpm:Float = 120;
	// public static var measure:Int = (bpm / 4);
	public static var crochet:Float = ((60 / bpm) * 1000);
	public static var stepCrochet:Float = (crochet / 4);

	public static var curStep:Int = 1;
	public static var curBeat:Int = 1;
	public static var curMeasure:Int = 1;

	public function measureHit() {

	}

	public function beatHit() {
		
	}

	public function stepHit() {

	}
}
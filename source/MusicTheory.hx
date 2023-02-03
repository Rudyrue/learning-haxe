package;

typedef BPMChange = {
	var stepTime:Int;
	var songPos:Float;
	var bpm:Float;
	@:optional var stepCrochet:Float;
}

class MusicTheory extends flixel.FlxState {
	public static var bpm:Float = 120;
	public static var measure:Int = Std.int((bpm / 4));
	public static var crochet:Float = ((60 / bpm) * 1000);
	public static var stepCrochet:Float = (crochet / 4);
	public static var songPos:Float = 0;

	public static var bpmChangeMap:Array<BPMChange> = [];

	public static var curStep:Int = 1;
	public static var curBeat:Int = 1;
	public static var curMeasure:Int = 1;

	private var stepsToDo:Int = 0;

	override function update(elapsed:Float) {
		var oldStep:Int = curStep;

		updateCurStep();
		updateBeat();

		if (oldStep != curStep) {
			if(curStep > 0) stepHit();
			if (oldStep < curStep) updateSection();
		}

		super.update(elapsed);
	}

	// bpm stuff
	public static function getBPMFromSeconds(time:Float) {
		var lastChange:BPMChange = {
			stepTime: 0,
			songPos: 0,
			bpm: bpm,
			stepCrochet: stepCrochet
		}

		for (i in 0...bpmChangeMap.length) if (time >= bpmChangeMap[i].songPos) lastChange = bpmChangeMap[i];
		return lastChange;
	}

	/* public static function mapBPMChanges(song) {
		bpmChangeMap = [];

		var curBPM:Float = song.bpm;
		var totalSteps:Int = 0;
		var totalPos:Float = 0;
		for (i in 0...song.notes.length) {
			if(song.notes[i].changeBPM && song.notes[i].bpm != curBPM) {
				curBPM = song.notes[i].bpm;
				var event:BPMChange = {
					stepTime: totalSteps,
					songTime: totalPos,
					bpm: curBPM,
					stepCrochet: calculateCrochet(curBPM) / 4
				};

				bpmChangeMap.push(event);
			}

			var deltaSteps:Int = Math.round(getSectionBeats(song, i) * 4);
			totalSteps += deltaSteps;
			totalPos += ((60 / curBPM) * 1000 / 4) * deltaSteps;
		}
		trace("New BPM map created: " + bpmChangeMap);
	} */

	// measure stuff
	public function measureHit() {

	}

	private function updateMeasure():Void {
		if(stepsToDo < 1) stepsToDo = Math.round(getBeatsOnSection() * 4);
		while(curStep >= stepsToDo) {
			curMeasure++;
			var beats:Float = getBeatsOnSection();
			stepsToDo += Math.round(beats * 4);
			measureHit();
		}
	}

	// beat stuff
	public function beatHit() {
		
	}

	private function updateBeat():Void {
		curBeat = Math.floor(curStep / 4);
	}

	function getBeatsOnSection() {
		/* var val:Null<Float> = 4;
		if(PlayState.SONG != null && PlayState.SONG.notes[curSection] != null) val = PlayState.SONG.notes[curSection].sectionBeats; */
		return /*val == null ?*/ 4 /*: val*/;
	}

	// step stuff
	public function stepHit() {
		if (curStep % 4 == 0) beatHit();
	}

	private function updateCurStep():Void {
		var lastChange = getBPMFromSeconds(songPos);

		var shit = (songPos - lastChange.songPos) / lastChange.stepCrochet;
		curStep = lastChange.stepTime + Math.floor(shit);
	}
}
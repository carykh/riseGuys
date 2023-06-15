class Player{
	public var vx:Number; // X - Velocity
	public var vy:Number; // Y - Velocity
	public var cx:Number; // X - Location
	public var cy:Number; // Y - Location
	public var cw:Number = 40;
	public var platon:Number; // last platform touched
	public var firstPlatAbove:Number = 1;
	public var prevFirstPlatAbove:Number = 1;
	public var t:Number; //for AI, yeah, targets!
	public var r:Number; //adding randomness to AIs
	public var init:Boolean; //Is the player still in?
	public var ttl:Number; //Pixels overshoot
	public var ttl2:Number; //Time until the land
	public var jh:Number; //jump height.
	public var jt:Number; //timer before AI hits the ground
	public var dire:Number; //Direction an AI plans to move (-1, 0, +1)
	public var eal:Number; //Eliminated after leg.... says how many legs until elimination, if player's still in, it is zero
	public var powerTimer:Array; //timer
	public var frozen:Boolean
	public var platby:Number; //theplatform it's next to
	public var px:Number; //previous X coordinate
	public var py:Number; //previous Y coordinate
	public var deathCounter:Number = 0;
	public var faceDire:Number;
	public var pieces:Array;
	public var doom:Boolean = false;
	public var prevLegRank:Number = -1;
	public var targetMin:Number = 0;
	public var targetMax:Number = 0;
	public var bad:Array = new Array(0);
	public var maneuver:Number = 0;
	public var canGoForLowPlat:Number = 0;
	public var rethink:Number = 0;
	public var manThreshold:Number = 0;
	public var legOn:Number = 0;
	public function Player(tvx:Number, tvy:Number,
	tcx:Number, tcy:Number, tplaton:Number, tt:Number, tr:Number,
	tinit:Boolean, tttl:Number, tttl2:Number, tjh:Number, tjt:Number, tdire:Number, teal:Number, tpowerTimer:Array,
	tfrozen:Boolean, tplatby:Number, tdeathCounter:Number, tlegOn:Number){ //Just some initialization variables
		vx = tvx;
		vy = tvy;
		cx = tcx;
		cy = tcy;
		platon = tplaton;
		t = tt;
		r = tr;
		init = tinit;
		ttl = tttl;
		ttl2 = tttl2;
		jh = tjh;
		jt = tjt;
		dire = tdire;
		eal = teal;
		powerTimer = tpowerTimer;
		frozen = tfrozen;
		platby = tplatby;
		deathCounter = tdeathCounter;
		legOn = tlegOn;
	}
	public function applyPhysics(gravity:Number, friction:Number){
		vy += gravity;
		vx *= friction;
		if(vy > 20){
			vy = 20;
		}
		if(cx < 20){
			cx = 20;
			vx = Math.abs(vx)*0.9;
		}
		if(cx > 380){
			cx = 380;
			vx = -Math.abs(vx)*0.9;
		}
	}
	public function doMotion(){
		px = cx;
		py = cy;
		cx += vx;
		cy += vy;
	}
	public function getLeg(){
		return Math.ceil(firstPlatAbove/100)-1;
	}
}
class Platform{
	public var cx:Number; // X - Location
	public var cy:Number; // Y - Location
	public var cw:Number; //width
	public var t:Number; //type
	public var ex:Boolean; //whether it should continue to exist
	public var ton:Number; //Type of nonexistance, actually gone forever, or a hidden powerup.
	public var ap:Number; //Time to appear
	public var speed:Number; //Frequency of movement- lower is faster.
	public var sdist:Number; //Distance of movement - 0 is no movement.
	public var offset:Number; //offset for switching around.
	public var lastChanged:Number = -1;
	public function Platform(tcx:Number, tcy:Number, tcw:Number, tt:Number, tex:Boolean, tton:Number, tap:Number,
	tspeed:Number, tsdist:Number, toffset:Number){ //Just some initialization variables
		cx = tcx;
		cy = tcy;
		cw = tcw;
		t = tt;
		ex = tex;
		ton = tton;
		ap = tap;
		speed = tspeed;
		sdist = tsdist;
		offset = toffset;
	}
}
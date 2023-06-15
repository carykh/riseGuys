class PlayerPiece{
	public var vx:Number; // X - Velocity
	public var vy:Number; // Y - Velocity
	public var vr:Number; // Rotation - Velocity
	public var onob:Boolean = false;
	
	public var cx:Number; // X - Location
	public var cy:Number; // Y - Location
	public var cr:Number; // Rotation

	public var px:Number; //previous X coordinate
	public var py:Number; //previous Y coordinate
	public var pr:Number; //previous Rotation
	public function PlayerPiece(tcx:Number, tcy:Number, tcr:Number, tvx:Number, tvy:Number, tvr:Number){ //Just some initialization variables
		cx = tcx;
		cy = tcy;
		cr = tcr;
		vx = tvx;
		vy = tvy;
		vr = tvr;
	}
	public function applyPhysics(gravity:Number, friction:Number){
		if(onob){
			vx *= friction;
		}else{
			vy += gravity;
		}
	}
	public function doMotion(factor:Number, max:Number, friction:Number){
		px = cx;
		py = cy;
		pr = cr;
		cx += vx*factor;
		cy += vy*factor;
		cr += vr*factor;
		if(vy < -33){
			vy = -33;
		}
		if(cx < 7){
			cx = 7;
			vx = Math.abs(vx)*0.9;
		}
		if(cx > 393){
			cx = 393;
			vx = -Math.abs(vx)*0.9;
		}
		if(!onob){
			while(cr < 0){
				cr += 360;
			}
			var csr = 45-Math.abs((cr+72000)%90-45);
			var a = csr/180*Math.PI;
			var h = 7.0/Math.cos(a);
			var ground:Number = max-h;
			//trace(max+",    "+h+",    "+ground);
			if(cy > ground && vy > 0){
				vx *= friction;
				cy = ground;
				if(vy < 5){
					onob = true;
					vy = 0;
					vr = 0;
					cr = Math.round(cr/90)*90;
				}else{
					vy = -Math.abs(vy)*0.83+1;
					vr = -vy*2*(Math.sin(cr/90*Math.PI)+(Math.random()-0.5)*0.4);
					vx = -vy*0.4*(Math.sin(cr/90*Math.PI)+(Math.random()-0.5)*0.5);
				}
			}
		}
	}
}
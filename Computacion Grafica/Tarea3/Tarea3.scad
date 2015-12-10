 module tree(n, angle, ka=1/2, seed=rands(-1000000,+1000000,1)) {
	seeds = rands(-1000000,+1000000,8,seed);
	random = rands(-1, +1, 10, seeds[6]);
	length = n;
	if (n>0) translate([0,0,length]) rotate([0,0,random[0]*180]) {
		color([0.6,0.5,0.1])
			rotate([180,0,0]) cylinder(r1=0.1*n, r2=0.1*(n+1),  h=length, $fn=8);
		rotate([angle*random[0]/5, 0, 0]) tree(n-1, ka*angle, ka, seeds[0]);
		
		rotate([angle, 0,   0+angle*random[2]/10]) tree(n-1, ka*angle, ka, seeds[1]);
		rotate([angle, 0,  90+angle*random[3]/10]) tree(n-1, ka*angle, ka, seeds[2]);
		rotate([angle, 0, 180+angle*random[4]/10]) tree(n-1, ka*angle, ka, seeds[3]);
		rotate([angle, 0, 270+angle*random[5]/10]) tree(n-1, ka*angle, ka, seeds[4]);
	} else {
        color([0,1,0]) sphere(0.3);
	}
}

module forest() {
    translate([0,5,0]) tree(3, 55, ka=0.75, seed=2);
    translate([0,-5,0]) tree(3, 55, ka=0.75, seed=2);
    translate([5,0,0]) tree(3, 55, ka=0.75, seed=2);
    translate([-5,0,0]) tree(3, 55, ka=0.75, seed=2);
}
scale([3,3,3])tree(2, 60, ka=0.75, seed=2);
//color([ 139/255, 90/255, 43/255,1 ]) cylinder(r=10, h=1, center = true);

//forest();

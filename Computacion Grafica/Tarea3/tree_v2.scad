 module tree(n, angle, ka=1/2, seed=rands(-1000000,+1000000,1)) {
	seeds = rands(-1000000,+1000000,8,seed);
	ru = rands(0, 1, 10, seeds[5]);
	rs = rands(-1, +1, 10, seeds[6]);
	rk = rands(0.9, 1.1, 10, seeds[7]);
	
	ct = [0.6,0.5,0.1]; // Trunk color
	cl = [0,1,0]; // Leaf color
	length = rk[0] * (n<1 ? 0.7+n*0.3 : n);

	if (n>0) translate([0,0,length]) rotate([0,0,rs[0]*180]) {
		// Trunk
		color(n>=1 ? ct : cl + (ct-cl)*(1+n))
			rotate([180,0,0]) cylinder(r1=0.1*n, r2=0.1*(n+1),  h=length, $fn=8);

		// Forward Branch
		rotate([angle*rs[0]/5, 0, 0]) tree(n-1, ka*angle, ka, seeds[0]);
		// Side branches
		rotate([angle*rk[2], 0,   0+angle*rs[2]/10]) tree(n-1, ka*angle, ka, seeds[1]);
		rotate([angle*rk[3], 0,  90+angle*rs[3]/10]) tree(n-1, ka*angle, ka, seeds[2]);
		rotate([angle*rk[4], 0, 180+angle*rs[4]/10]) tree(n-1, ka*angle, ka, seeds[3]);
		rotate([angle*rk[5], 0, 270+angle*rs[5]/10]) tree(n-1, ka*angle, ka, seeds[4]);
	} else {
        color(cl) sphere(1.5);
	}
}

module forest() {
    translate([0,5,0]) tree(3, 55, ka=0.75, seed=2);
    translate([0,-5,0]) tree(3, 55, ka=0.75, seed=2);
    translate([5,0,0]) tree(3, 55, ka=0.75, seed=2);
    translate([-5,0,0]) tree(3, 55, ka=0.75, seed=2);
}
tree(4, 60, ka=0.75, seed=2);
color([ 139/255, 90/255, 43/255,1 ]) cylinder(r=5, h=1, center = true);
//forest();

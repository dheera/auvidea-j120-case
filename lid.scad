L=110;
LL=120;
W=49.5;
WW=60;
HH=45;
T=2;

XW=42;
XL=79;

offsetL = T+1.5; // (LL-L)/2;
offsetW = (WW-W)/2 - 1;

difference() {
    cube([LL,WW,T]);
    translate([offsetL + 4 + XL/2, WW/2,0])
    fanvent();
    /*
    translate([offsetL + 4 + XL/2, WW/2,0])
    difference() {
        cylinder(d=40,h=5,$fn=256, center=true);
        cube([100,2,5],center=true);
        rotate([0,0,45])
        cube([100,2,5],center=true);
        rotate([0,0,90])
        cube([100,2,5],center=true);
        rotate([0,0,-45])
        cube([100,2,5],center=true);
        
        cylinder(d=8,h=5,$fn=256,center=true);
        difference() {
            cylinder(d=27,h=5,$fn=256,center=true);
            cylinder(d=23,h=5,$fn=256,center=true);
        }
    }
    */
}


difference() {
    translate([2.2,2.2,2])
    difference() {
        cube([LL-6-.4,WW-4-.4,T]);
        translate([2,2,0])
        cube([LL-10-.4,WW-8-.4,T]);
    }
}

translate([7,T+.2,2])
    support();
translate([LL-7-T-T,T+.2,2])
    support();

translate([7,WW-4-T-.2,2])
    support();
translate([LL-7-T-T,WW-4-T-.2,2])
    support();

module support() {
    difference() {
        translate([-4,0,0])
        cube([8,4,10]);
        translate([0,0,4+2])
        rotate([90,0,0])
        cylinder(d=4.7,h=10,center=true,$fn=32);
    }
}

module fanvent() {
    for (i = [-24:6:24]) {
        for (j = [-24:6:24]) {
            translate([i,j,0])
            cube([2.5,2.5,30], center=true);
        }
    }
}
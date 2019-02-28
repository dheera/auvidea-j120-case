L=110;
LL=120;
W=49.5;
WW=60;
HH=45;
T=2;

XW=42;
XL=79;

cube([LL,WW,T]);

cube([2,WW,HH]);

cube([LL,2,HH]);

translate([0,WW-2,0])
cube([LL,2,HH]);

//translate([LL-2,0,0])
//cube([2,WW,HH]);

/*
translate([LL-4-2,0,0])
cube([4,4,HH]);

translate([LL-4-2,WW-4,0])
cube([4,4,HH]);
*/
translate([LL-T-T,0,T])
cube([T,WW,T]);
translate([LL-T-T,T,T])
cube([T,T,HH-T]);
translate([LL-T-T,WW-T-T,T])
cube([T,T,HH-T]);

offsetL = T+2; // (LL-L)/2;
offsetW = (WW-W)/2 - 1;

translate([offsetL, offsetW, T])
auvidea();

module auvidea() {
    
    // marker
    difference() {
        cube([L,W,0.1]);
        translate([0.1,0.1,0])
        cube([L-0.2,W-0.2,0.1]);
    }
    
    
    translate([(W-XW)/2,(W-XW)/2]) {
    translate([0,0])
    standoff();
    translate([0,XW])
    standoff();
    translate([XL,0])
    standoff();
    translate([XL,XW])
    standoff();
    }
    
}

module standoff() {
    difference() {
        cylinder(d1=9,d2=7,h=5.5,$fn=32);
        cylinder(d=4.7,h=6,$fn=16);
    }
}
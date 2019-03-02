L=110;
LL=120;
W=49.5;
WW=60;
HH=45;
T=2;

XW=42;
XL=79;

/*
translate([0,WW,49])
rotate([180,0,0])
import("lid.stl");
*/


/*
translate([LL-3*T,T,T])
rotate([90,0,90])
import("side.stl");
*/

scale([-1,1,1])
tab();

translate([LL,0,0])
tab();

module tab() {
    difference() {
        minkowski() {
            translate([0,2.5,0])
            cube([7,WW-5,2]);
            cylinder(d=5,h=0.0001,$fn=32,center=true);
        }
        
        translate([5,5,0])
        cylinder(d=3.3,h=10,$fn=16,center=true);
        
        translate([5,WW-5,0])
        cylinder(d=3.3,h=10,$fn=16,center=true);
        
        translate([5,WW/2,0])
        cylinder(d=3.3,h=10,$fn=16,center=true);
    }
}

offsetL = T+1.5; // (LL-L)/2;
offsetW = (WW-W)/2 - 1;

cube([LL,WW,T]);

difference() {
    cube([2,WW,HH]);
    translate([0,WW/2,HH/2+6])
    rotate([0,90,0])
    fanvent();
    
    // sd card slot
    translate([0,offsetW+W - (23.5+10)/2,5.5+T-1.5])
    cube([5,23.5-10,3],center=true);
}


difference() {
    cube([LL,2,HH]);
    
    translate([7,0,HH-6])
    rotate([-90,0,0])
    cylinder(d2=3.1,d1=5,h=T,$fn=32,$center=true);
    translate([LL-7-T-T,0,HH-6])
    rotate([-90,0,0])
    cylinder(d2=3.1,d1=5,h=T,$fn=32,$center=true);
}

translate([0,WW-2,0])
difference() {
    cube([LL,2,HH]);
    
    translate([7,0,HH-6])
    rotate([-90,0,0])
    cylinder(d1=3.1,d2=5,h=T,$fn=32,$center=true);
    translate([LL-7-T-T,0,HH-6])
    rotate([-90,0,0])
    cylinder(d1=3.1,d2=5,h=T,$fn=32,$center=true);
    
    translate([offsetL+73, 0, 5.5+1.5+7/2])
    cube([11,5,7],center=true);
}

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

translate([offsetL, offsetW, T])
auvidea();

module auvidea() {
    
    // marker
    /*
    difference() {
        cube([L,W,0.1]);
        translate([0.1,0.1,0])
        cube([L-0.2,W-0.2,0.1]);
    }
    */
    
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

module fanvent() {
    for (i = [-12:6:12]) {
        for (j = [-30:6:30]) {
            translate([i,j,0])
            cube([2.5,2.5,30], center=true);
        }
    }
}
L=110;
LL=120;
W=49.5;
WW=60;
HH=45;
T=2;

XW=42;
XL=79;

difference() {
    plate();
    ethernet();
    usb();
    hdmi();
    power();
    misc();
    switches();
    difference() {
        translate([(WW-2*T)/2,32,0])
        fanvent();
        
        translate([(WW-2*T)/2,12,0])
        cube([20,HH,10*T],center=true);
    }
}

module plate() {
translate([0,0,3*T])
scale([1,1,-1])
union() {
cube([WW-2*T,HH-T,T]);
translate([T,T,T])
cube([WW-4*T,HH-2*T,T]);

difference() {
translate([T,T,2*T])
minkowski() {
cube([WW-4*T,HH-3*T,0.0001]);
cylinder(d1=0,d2=2*T,h=T);
}

translate([0,HH-2*T,2*T])
  cube([WW,2*T,2*T]);
}
}
}

module ethernet() {
    translate([4,6,-T])
    cube([15,14,10*T]);
}

module usb() {
    translate([29.5,15.5])
    cube([16,18,10*T],center=true);
}

module hdmi() {
    translate([46,9])
    cube([13.7,8.7,10*T],center=true);
}

module power() {
    translate([46,19])
    cube([10.5,5.3,10*T],center=true);
}

module misc() {
    translate([29.5,30.5])
    cube([16,6,10*T],center=true);
}

module switches() {
    translate([11.5,4]) {
        cube([3,2,10*T], center=true);
        translate([0,0,T-0.5])
        cube([5,2,2*T], center=true);
    }
    
    translate([26,4]) {
        cube([3,2,10*T], center=true);
        translate([0,0,T-0.5])
        cube([5,2,2*T], center=true);
    }
    
    translate([33,4]) {
        cube([3,2,10*T], center=true);
        translate([0,0,T-0.5])
        cube([5,2,2*T], center=true);
    }
}


module fanvent() {
    for (i = [-24:6:24]) {
        for (j = [-6:6:6]) {
            translate([i,j,0])
            cube([2.5,2.5,30], center=true);
        }
    }
}
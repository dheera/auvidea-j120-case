L=110;
LL=120;
W=49.5;
WW=60;
HH=45;
T=2;

XW=42;
XL=79;

difference() {
    union() {
        plate();
        plate2();
    }
    ethernet();
    usb();
    hdmi();
    power();
    //misc();
    switches();
    
    /*
    difference() {
        translate([(WW-2*T)/2+1,33,0])
        fanvent();
        
        translate([0,0,0])
        cube([20,HH,10*T]);
    }
    */
    
    translate([13,36-.0001])
    milligrid4();
    translate([13,28.5-.0001])
    milligrid4();
    translate([(WW-2*T)/2,36-.0001])
    milligrid4();
    
    translate([(WW-2*T)/2,28.5-.0001])
    milligrid4();
    translate([WW-2*T-13,36,-.0001])
    milligrid4();
    
    translate([WW-2*T-13,28.5-.0001])
    milligrid4();
}

module plate2() {
    translate([2.5*T,HH-20.5,-3*T])
    cube([WW-7*T,16.5,3*T]);
}

module milligrid4() {
    /*
    translate([-8,-10/2+1,2])
    cube([16,10,5]);
    
    cube([15.0+.2,4.15+.2,5], center=true);
    cube([10.7+.2,5.15+.2,5], center=true);
    translate([0,1.6/2,0])
    cube([4.0+.2,5.15+1.6+.2,5], center=true);
    */
    
    cube([12.5,4.6,15], center=true);
    
    translate([0,4.3/2+1.8/2,0])
    cube([7.3,1.8,15], center=true);
    
    //cube([13.0,7.5,8],center=true);
}

module jstsm4() {
    translate([-8,-10/2+1,2])
    cube([16,10,5]);
    
    cube([15.0+.2,4.15+.2,5], center=true);
    cube([10.7+.2,5.15+.2,5], center=true);
    translate([0,1.6/2,0])
    cube([4.0+.2,5.15+1.6+.2,5], center=true);
    
    //cube([13.0,7.5,8],center=true);
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
    difference() {
        cube([10.5,5.3,10*T],center=true);
        translate([8,2.5,0])
        rotate([0,0,-45])
        cube([10.5,5.3,10*T],center=true);
        translate([8,-2.5,0])
        rotate([0,0,45])
        cube([10.5,5.3,10*T],center=true);
    }
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
    for (i = [-22:5.5:22]) {
            translate([i,0,0])
            cube([2.5,12,30], center=true);
    }
}
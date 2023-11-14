//  I/O shield for MSI Z170A-G43 PLUS

// based on blank_v01
translate([-3.5, -3.5, 0]) union() {
    
    // border
    translate([2, 2, 1]){
        difference() {
            cube([158, 44, 2.58]);
            translate([1.5, 1.5, -0.01]) cube([155, 41, 2.60]);
        }
    }
    
    // backplate
    difference() {
        cube([162, 48, 1]);
        
        translate([3.5, 3.5, -1]) {

            // usb-usb-ps1
            translate([4.5, 2.5, 0]) cube([15, 7, 3]);
            translate([4.5, 11.1, 0]) cube([15, 7, 3]);
            translate([12, 26.5, 0]) cylinder(3, 6.5, 6.5, $fn=100);
            
            // dvi
            translate([27.9, 2.4, 0]) cube([30, 8.5, 3]);
            translate([25.7, 3.1, 0]) cube([34.4, 7, 3]);
            translate([26, 6.6, 0]) cylinder(3, 3.5, 3.5, $fn=100);
            translate([59.7, 6.6, 0]) cylinder(3, 3.5, 3.5, $fn=100);

            // hdmi-usb-usb
            translate([68, 1, 0]) cube([17.5, 7.5, 3]);
            translate([69.3, 15, 0]) cube([15, 7, 3]);
            translate([69.3, 24,0]) cube([15, 7, 3]);
            
            // button
            translate([96.8, 6, 0]) cylinder(3, 3, 3, $fn=100);

            // usb-usb-rj45
            translate([110.3, 2.5, 0]) cube([15, 7, 3]);
            translate([110.3, 11.1, 0]) cube([15, 7, 3]);
            translate([110.3, 19.7, 0]) cube([15, 13, 3]);
            
            // toslink-35-35
            translate([131, 2.6, 0]) cube([11.5, 10.5, 3]);
            translate([136.8, 19.5, 0]) cylinder(3, 4.5, 4.5, $fn=100);
            translate([136.8, 30.5, 0]) cylinder(3, 4.5, 4.5, $fn=100);

            // 35-35-35
            translate([148.8, 8.4, 0]) cylinder(3, 4.5, 4.5, $fn=100);
            translate([148.8, 19.5, 0]) cylinder(3, 4.5, 4.5, $fn=100);
            translate([148.8, 30.5, 0]) cylinder(3, 4.5, 4.5, $fn=100);
        }
    }   
}
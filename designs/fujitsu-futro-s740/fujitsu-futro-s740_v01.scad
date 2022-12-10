// I/O shield for Fujitsu Futro S740 on custom ITX adapter.
// You need to simple adjust the alignment for your own setup.

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

            // 75
            translate([28.5, 13.25, 0]) cylinder(3, 4, 4, $fn=100);

            // dp
            translate([38.25, 7.5, 0]) cube([16, 5.5, 3]);

            // dp
            translate([57.75, 7.5, 0]) cube([16, 5.5, 3]);

            // 35
            translate([84.75, 13, 0]) cylinder(3, 4, 4, $fn=100);

            // rj45
            translate([97.25, 7.5, 0]) cube([14, 12, 3]);

            // usb - usb
            translate([115, 7, 0]) cube([13, 6.5, 3]);
            translate([115, 15.5, 0]) cube([13, 6.5, 3]);

            // usb - usb
            translate([131, 7, 0]) cube([13, 6.5, 3]);
            translate([131, 15.5, 0]) cube([13, 6.5, 3]);
        }
    }   
}

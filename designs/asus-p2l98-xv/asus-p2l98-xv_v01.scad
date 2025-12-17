// I/O shield for Asus P2L98-XV

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
        
        translate([6, 5, -1]) {
            //Place your IO recesses here.           
            
            // move to lower ps2
            translate([7, 8, 0]) {
            
                // ps2-ps2
                translate([3.5, 0, 0]) cylinder(3, 6, 6, $fn=100);
                translate([3.5, 15.5, 0]) cylinder(3, 6, 6, $fn=100);
            
                // usb-usb
                translate([14.9, -6.3, 0]) cube([15, 7, 3]);
                translate([14.9, 3.9, 0]) cube([15, 7, 3]);
                
                // serial DB-9
                translate([37.0, -6, 0]) {
                    translate([2.2, 0, 0]) cube([22, 10.5, 3]);
                    translate([0, 1.7, 0]) cube([26.4, 7, 3]);
                    translate([0.3, 5.2, 0]) cylinder(3, 3.5, 3.5, $fn=100);
                    translate([26, 5.2, 0]) cylinder(3, 3.5, 3.5, $fn=100);
                }
                
                // VGA DE-15
                translate([73, -6, 0]) {
                    translate([2.2, 0, 0]) cube([22, 10.5, 3]);
                    translate([0, 1.7, 0]) cube([26.4, 7, 3]);
                    translate([0.3, 5.2, 0]) cylinder(3, 3.5, 3.5, $fn=100);
                    translate([26, 5.2, 0]) cylinder(3, 3.5, 3.5, $fn=100);
                }
                
                // parallel DB-25
                translate([44.1, 14, 0]) {
                    translate([2.2, 0, 0]) cube([42.7, 10.5, 3]);
                    translate([0, 1.7, 0]) cube([47.1, 7, 3]);
                    translate([0.3, 5.2, 0]) cylinder(3, 3.5, 3.5, $fn=100);
                    translate([47.1, 5.2, 0]) cylinder(3, 3.5, 3.5, $fn=100);
                }
                
                // gameport DB-15
                translate([109.1, 14, 0]) {
                    translate([2.2, 0, 0]) cube([29.6, 10.5, 3]);
                    translate([0, 1.7, 0]) cube([34, 7, 3]);
                    translate([0.3, 5.2, 0]) cylinder(3, 3.5, 3.5, $fn=100);
                    translate([34, 5.2, 0]) cylinder(3, 3.5, 3.5, $fn=100);
                
                }
                
                // sound 3.5mms
                translate([113.5, 0, 0]) {
                    translate([0, 0, 0]) cylinder(3, 5.2, 5.2, $fn=100);
                    translate([12.5, 0, 0]) cylinder(3, 5.2, 5.2, $fn=100);
                    translate([25, 0, 0]) cylinder(3, 5.2, 5.2, $fn=100);
                }
            }
        }
    } 
}

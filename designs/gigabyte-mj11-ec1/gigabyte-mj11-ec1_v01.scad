// I/O shield for Gigabyte MJ11-EC1, Gigabyte MJ11-EC0

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
            
            // Button
            translate([8.3, 6.2, 0]) cylinder(3, 3, 3, $fn=100);
            
            // Button - Button
            translate([28.5, 8.1, 0]) cylinder(3, 3.8, 3.5, $fn=100);
            translate([28.5, 20.5, 0]) cylinder(3, 3.8, 3.5, $fn=100);
            
            // RJ45 - RJ45
            translate([52.6, 1.5, 0]) cube([15, 12, 3]);
            translate([52.6, 15.6, 0]) cube([15, 12, 3]);
            
            // USB - USB - RJ45
            translate([97, 2.5, 0]) cube([15, 7, 3]);
            translate([97, 11.1, 0]) cube([15, 7, 3]);
            translate([97, 19.7, 0]) cube([15, 13, 3]);
            
            // VGA
            translate([124.2,3.2,0]) {
                translate([2.2, 0, 0]) cube([22, 10.5, 3]);
                translate([0, 1.7, 0]) cube([26.4, 7, 3]);
                translate([0.3, 5.2, 0]) cylinder(3, 3.5, 3.5, $fn=100);
                translate([26, 5.2, 0]) cylinder(3, 3.5, 3.5, $fn=100);
            }
        }
    } 
}

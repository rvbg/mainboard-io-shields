// I/O shield for MSI 970 GAMING, MSI 970 GAMING PRO, MSI 990FXA GAMING

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
            translate([5, 3, 0]) cube([15, 7, 3]);
            translate([5, 11.1, 0]) cube([15, 7, 3]);
            translate([12.5, 26.6, 0]) cylinder(3, 6.5, 6.5, $fn=100);
            
            // toslink
            translate([24.9, 4.25, 0]) cube([10.8, 11.1, 3]);

            // usb-usb
            translate([40.9, 3, 0]) cube([15, 7, 3]);
            translate([40.9,11.1,0]) cube([15, 7, 3]);

            // usb-usb
            translate([61.4, 3, 0]) cube([15, 7, 3]);
            translate([61.4, 11.1, 0]) cube([15, 7, 3]);

            // usb-usb
            translate([81.15, 3, 0]) cube([15, 7, 3]);
            translate([81.15, 11.1, 0]) cube([15, 7, 3]);

            // usb-usb-rj45
            translate([108.5, 3, 0]) cube([16, 7, 3]);
            translate([108.5, 11.1, 0]) cube([16, 7, 3]);
            translate([108.5, 19.9, 0]) cube([16, 11.7, 3]);

            //35-35-35
            translate([136, 8.9, 0]) cylinder(3, 4.6, 4.6, $fn=100);
            translate([136, 21.45, 0]) cylinder(3, 4.6, 4.6, $fn=100);
            translate([136, 34, 0]) cylinder(3, 4.6, 4.6, $fn=100);

            //35-35-35
            translate([148.1, 8.9, 0]) cylinder(3, 4.6, 4.6, $fn=100);
            translate([148.1, 21.45, 0]) cylinder(3, 4.6, 4.6, $fn=100);
            translate([148.1, 34, 0]) cylinder(3, 4.6, 4.6, $fn=100);
        }
    }   
}

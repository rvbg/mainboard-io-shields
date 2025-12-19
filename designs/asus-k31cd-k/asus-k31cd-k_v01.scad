// I/O shield for ASUS K31CD-K

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

            // usb-usb
            translate([6, 3, 0]) cube([15, 7, 3]);
            translate([6, 11, 0]) cube([15, 7, 3]);

            // hdmi
            translate([29, 3, 0]) cube([15, 7, 3]);

            // vga
            translate([51.5, 3, 0]) {
                translate([2.2, 0, 0]) cube([22, 10.5, 3]);
                translate([0, 1.7, 0]) cube([26.4, 7, 3]);
                translate([0.8, 5.2, 0]) cylinder(3, 3.5, 3.5, $fn=100);
                translate([25.5, 5.2, 0]) cylinder(3, 3.5, 3.5, $fn=100);
            }

            // usb-usb
            translate([84, 3, 0]) cube([15, 7, 3]);
            translate([84, 11, 0]) cube([15, 7, 3]);

            // usb-usb-rj45
            translate([108, 3, 0]) cube([15, 7, 3]);
            translate([108, 11, 0]) cube([15, 7, 3]);
            translate([108, 20, 0]) cube([15, 12, 3]);

            // 35-35-35
            translate([135, 9, 0]) cylinder(3, 4.5, 4.5, $fn=100);
            translate([135, 20, 0]) cylinder(3, 4.5, 4.5, $fn=100);
            translate([135, 31, 0]) cylinder(3, 4.5, 4.5, $fn=100);

            // 35-35-35
            translate([149, 9, 0]) cylinder(3, 4.5, 4.5, $fn=100);
            translate([149, 20, 0]) cylinder(3, 4.5, 4.5, $fn=100);
            translate([149, 31, 0]) cylinder(3, 4.5, 4.5, $fn=100);
        }
    }
}

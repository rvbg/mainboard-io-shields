// I/O shield for Gigabyte GA-EX58-UD3R

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

            // ps2-ps2
            translate([12.5, 8, 0])  cylinder(3, 6.5, 6.5, $fn=100);
            translate([12.5, 24, 0]) cylinder(3, 6.5, 6.5, $fn=100);

            // coax-toslink
            translate([30.25, 8, 0]) cylinder(3, 4.5, 4.5, $fn=100);
            translate([24.5, 18, 0]) cube([11.5, 10.5, 3]);

            // usb-usb-1394
            translate([42, 3, 0]) cube([16, 7, 3]);
            translate([42, 11.1, 0]) cube([16, 7, 3]);
            translate([42, 19.9, 0]) cube([16, 8, 3]);

            // usb-usb-1394
            translate([64.5, 3, 0]) cube([16, 7, 3]);
            translate([64.5, 11.1, 0]) cube([16, 7, 3]);
            translate([64.5, 19.9, 0]) cube([16, 8, 3]);

            // usb-usb
            translate([88, 3, 0]) cube([15, 7, 3]);
            translate([88, 11.1, 0]) cube([15, 7, 3]);

            // usb-usb-rj45
            translate([110, 3, 0]) cube([17, 7, 3]);
            translate([110, 11.1, 0]) cube([17, 7, 3]);
            translate([110, 19.9, 0]) cube([17, 11.7, 3]);

            // 35-35-35
            translate([139, 8, 0]) cylinder(3, 4.6, 4.6, $fn=100);
            translate([139, 19, 0]) cylinder(3, 4.6, 4.6, $fn=100);
            translate([139, 30, 0]) cylinder(3, 4.6, 4.6, $fn=100);

            // 35-35-35
            translate([151, 8, 0]) cylinder(3, 4.6, 4.6, $fn=100);
            translate([151, 19, 0]) cylinder(3, 4.6, 4.6, $fn=100);
            translate([151, 30, 0]) cylinder(3, 4.6, 4.6, $fn=100);
        }
    }
}

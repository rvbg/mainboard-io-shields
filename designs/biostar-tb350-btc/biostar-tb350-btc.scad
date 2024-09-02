// I/O shield for Biostar TB350-BTC

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

            // ps2
            translate([10, 8.5, 0]) cylinder(3, 6.5, 6.5, $fn=100);
            translate([10, 23.5, 0]) cylinder(3, 6.5, 6.5, $fn=100);

            // dvi
            translate([26.9, 2.4, 0]) cube([30, 8.5, 3]);
            translate([24.7, 3.1, 0]) cube([34.4, 7, 3]);
            translate([25, 6.6, 0]) cylinder(3, 3.5, 3.5, $fn=100);
            translate([58.7, 6.6, 0]) cylinder(3, 3.5, 3.5, $fn=100);

            // usb
            translate([66, 2.5, 0]) cube([15, 7, 3]);
            translate([66, 11.1, 0]) cube([15, 7, 3]);

            // usb
            translate([84.5, 2.5, 0]) cube([15, 7, 3]);
            translate([84.5, 11.1, 0]) cube([15, 7, 3]);

            // usb
            translate([103, 2.5, 0]) cube([15, 7, 3]);
            translate([103, 11.1, 0]) cube([15, 7, 3]);

            // usb-usb-rj45
            translate([123.6, 2.5, 0]) cube([15, 7, 3]);
            translate([123.6, 11.1, 0]) cube([15, 7, 3]);
            translate([123.6, 19.7, 0]) cube([15, 13, 3]);

            // 35-35-35
            translate([150.4, 9.4, 0]) cylinder(3, 4.5, 4.5, $fn=100);
            translate([150.4, 20.5, 0]) cylinder(3, 4.5, 4.5, $fn=100);
            translate([150.4, 31.5, 0]) cylinder(3, 4.5, 4.5, $fn=100);
        }
    }
}

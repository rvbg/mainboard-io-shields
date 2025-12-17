// I/O shield for BKHD 1264 NAS MB

// Taken from pages 14 at https://web.archive.org/web/20120725150314/http://www.formfactors.org/developer/specs/atx2_2.pdf
io_shield_width = 44.45 - 0.3; // 1.75" ± 0.008"
io_shield_height = 158.75 - 0.3; // 6.25" ± 0.008"
io_shield_max_rounding = 1; // 0.039"
io_shield_overlap = 2.54; // 0.1"

// Note based on specs.
io_shield_thickness = 1;
io_shield_border = 1.5;
io_shield_border_height = 2.54;

// Datum 0,0 is set to left bottom corner of the I/O Aperture.
translate([-io_shield_overlap, -io_shield_overlap, 0]) union() {

    // Border
    translate([io_shield_overlap, io_shield_overlap, io_shield_thickness]){
        difference() {
            roundedcube(io_shield_height, io_shield_width, io_shield_border_height, io_shield_max_rounding);

            // We move super small amount down to avoid shimmering in openSCAD preview.
            translate([io_shield_border, io_shield_border, -0.001]) cube([
                io_shield_height - 2 * io_shield_border,
                io_shield_width - 2 * io_shield_border,
                io_shield_border_height + 0.002
            ]);
        }
    }

    // Text
    translate([io_shield_overlap, io_shield_overlap, io_shield_thickness]) {
        linear_extrude(0.4) {
            translate([ 5, 35, 0]) text("BKHD 1264 NAS MB", size=5, font="Comic Neue");
            translate([80, 35, 0]) text("v00.3", size=4, font="Comic Neue");
            translate([ 5, 28, 0]) text("https://github.com/rvbg/mainboard-io-shields/", size=4, font="Comic Neue");

            // BIOS reset button:
            translate([48, 10, 0]) rotate(90) text("CMOS", size=4, font="Comic Neue");

            // LED:
            translate([64, 17, 0]) text("PWR", size=4, font="Comic Neue");
            translate([64, 22, 0]) text("HDD", size=4, font="Comic Neue");
        }
    }

    // Backplate
    difference() {
        roundedcube(
            io_shield_height + 2 * io_shield_overlap,
            io_shield_width + 2 * io_shield_overlap,
            io_shield_thickness,
            io_shield_max_rounding
        );

        translate([io_shield_overlap, io_shield_overlap, -1]) {
            // Place your IO recesses here.

            // IMPORTANT: All distances are relative to the left bottom corner of the I/O aperture! This makes it easy
            // to measure and position the cutouts. Remember when using cylinders, openscad uses position as the center!

            // USB+USB
            translate([   5,  4.5, 0]) cube([13, 6.5, 3]);
            translate([   5, 13.0, 0]) cube([13, 6.5, 3]);

            // HDMI+DP
            translate([  27,    4, 0]) cube([15, 5.5, 3]);
            translate([  26, 14.5, 0]) cube([17, 8.5, 3]);

            // CRL CMOS
            translate([  46,    6, 0]) cylinder(3, 2, 2, $fn=25);

            // USB+USB
            translate([  51,  4.5, 0]) cube([13, 6.5, 3]);
            translate([  51, 13.0, 0]) cube([13, 6.5, 3]);

            // LEDs
            translate([ 67,   4, 0]) cube([5, 10, 3]);

            // 4x RJ-45
            translate([ 74, 4.5, 0]) cube([63, 12, 3]);

            // Audio jack 3.5mm
            translate([149,   7, 0]) cylinder(3, 4, 4, $fn=25);
        }
    }
}

module roundedcube(xdim, ydim, zdim, rdim){
    hull(){
        translate([rdim,rdim,0]) cylinder(h=zdim,r=rdim, $fn=100);
        translate([xdim-rdim,rdim,0]) cylinder(h=zdim,r=rdim, $fn=100);
        translate([rdim,ydim-rdim,0]) cylinder(h=zdim,r=rdim, $fn=100);
        translate([xdim-rdim,ydim-rdim,0]) cylinder(h=zdim,r=rdim, $fn=100);
    }
}

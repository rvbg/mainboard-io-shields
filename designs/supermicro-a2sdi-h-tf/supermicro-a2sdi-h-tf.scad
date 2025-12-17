// I/O shield for Supermicro A2SDi-H-TF

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


            // USB - USB - RJ45 (width = 19, cutout 15, padding = 2)
            translate([6.5 + 2, 4.5, 0]) {
                translate([0, 0, 0]) cube([15, 7, 20]);
                translate([0, 8.6, 0]) cube([15, 7, 3]);
                translate([0, 17.2, 0]) cube([15, 12.5, 3]);
            }

            // RJ45 - RJ45 (width = 17.2, cutout = 15, padding = 1
            translate([73.5 + 1.1, 4, 0]) {
                translate([0, 0, 0]) cube([15, 11.5, 3]);
                translate([0, 13.5, 0]) cube([15, 12.5, 3]);
            }


            // VGA (note cilinder is left of translate)
            translate([117, 3, 0]) {
                radius = 3.5;
                width = 31;
                height = 10;
                offset_center = (height - radius * 2) / 2;

                translate([radius, offset_center, 0]) cube([width - radius * 2, radius * 2, 3]);
                translate([(width - 20) / 2, 0, 0]) cube([20, 10, 3]);
                translate([radius, offset_center + radius, 0]) cylinder(3, radius, radius, $fn=100);
                translate([width - radius, offset_center + radius, 0]) cylinder(3, radius, radius, $fn=100);
            }

            translate([150, 4 , 0]) {
                button_radius = 2.20 / 2;

                // UID button
                translate([button_radius, button_radius, 0]) cylinder(3, button_radius, button_radius, $fn=100);

                // UID LED
                translate([5, button_radius, 0]) cylinder(3, button_radius, button_radius, $fn=100);
            }
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

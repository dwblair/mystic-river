pipe_id = 36;
pipe_taper = 0.7;
taper_h = 15;
wire_hole_width = 8;
sensor_board_width = 20;
sensor_board_height = 10;

module cap() {
    difference() {
        // body
        union() {
            translate([0,0,-taper_h])
            cylinder(r1=pipe_id/2-pipe_taper, r2=pipe_id/2, h=taper_h);

            cylinder(r=pipe_id/2, h=25);

            translate([0, 0, taper_h+10])
            rotate([90,0,0])
            scale([0.9, 1, 1])
            difference() {
                // eye body
                scale([1, 1.3, 1])
                cylinder(r=pipe_id/2, h=pipe_id/4, center=true);

                // eye
                translate([0, pipe_id/3, 0])
                cylinder(r=pipe_id/6, h=pipe_id/2, center=true);
            }
        }

        // EC wire recess
        for (z = [0, 10])
        translate([0, 0, 10+z])
        rotate_extrude()
        translate([pipe_id/2, 0])
        circle(r=0.45);

        // board recess
        translate([20, 0, 15])
        cube([20, sensor_board_width, sensor_board_height], center=true);

        // inner cavity
        translate([0, 0, -taper_h])
        cylinder(r=pipe_id/2-8, h=2*(taper_h + 15), center=true);

        // wire hole
        translate([0, -wire_hole_width/2, 10])
        cube([pipe_id, wire_hole_width, 3]);
    }
}

cap($fn=70);
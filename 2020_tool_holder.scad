ENABLE_WIRE_CUTTERS = true;

/* TRIDIMENSIONAL TRIANGLE:
polyhedron(
    points = [
        [0, 0, 0],                // 0 - low bottom left
        [lenght, 0, 0],           // 1 - low bottom right
        [0, size, 0],             // 2 - low top left
        [lenght, size, 0],        // 3 - low top right
        [0, size/2, height],      // 4 - high left
        [lenght, size/2, height], // 5 - high right
    ],
    faces = [
        [0, 2, 4],    // left triangle face
        [1, 3, 5],    // right triangle face
        [0, 1, 3, 2], // bottom rectangle face
        [0, 1, 5, 4], // front rectangle face
        [2, 3, 5, 4], // back rectangle face
    ]
); */

function triangle_height(size) = size * sqrt(3) / 2;
function triangle(size, lenght) = [[[0, 0, 0],[lenght, 0, 0],[0, size, 0],[lenght, size, 0],[0, size/2, triangle_height(size)],[lenght, size/2, triangle_height(size)]], [[0, 2, 4],[1, 3, 5],[0, 1, 3, 2],[0, 1, 5, 4],[2, 3, 5, 4]]];

/* SECTION: wire cutters */
wire_cutters_small_triangle_size = 7;
wire_cutters_small_triangle_lenght = 10;
wire_cutters_large_triangle_size = 12;
wire_cutters_large_triangle_lenght = 2;

if(ENABLE_WIRE_CUTTERS) {
    translate([0, 0, 0]) {
        small_triangle = triangle(wire_cutters_small_triangle_size, wire_cutters_small_triangle_lenght);
        large_triangle = triangle(wire_cutters_large_triangle_size, wire_cutters_large_triangle_lenght);
        polyhedron(points = small_triangle [0], faces = small_triangle[1]);
        translate([wire_cutters_small_triangle_lenght, -(wire_cutters_large_triangle_size-wire_cutters_small_triangle_size)/2, 0]) {
            polyhedron(points = large_triangle [0], faces = large_triangle[1]);
        }
    }
}

const std = @import("std");
const Square = @import("square.zig");
const Shape = @import("shape.zig");
const Triangle = @import("triangle.zig");

pub fn main() !void {
    var tri = Triangle.init();
    var squ = Square.init();

    const tri_shape = Shape.init(Triangle, &tri);
    const squ_shape = Shape.init(Square, &squ);

    tri_shape.draw();
    squ_shape.draw();
}

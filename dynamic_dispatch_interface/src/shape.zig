const Shape = @This();
shape: *anyopaque, // equivalent to *void in C or generic type
vtable: *const VTable,

const VTable = struct {
    draw: *const fn (*anyopaque) void,
};

pub fn init(comptime T: type, shape_ptr: *T) Shape {
    const vt = &VTable{ .draw = struct {
        fn callImpl(ptr: *anyopaque) void {
            const self: *T = @ptrCast(@alignCast(ptr));
            self.drawImpl();
        }
    }.callImpl };

    return Shape{
        .shape = shape_ptr,
        .vtable = vt,
    };
}

pub fn draw(self: Shape) void {
    self.vtable.draw(self.shape);
}

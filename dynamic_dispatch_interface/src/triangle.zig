const std = @import("std");

const Triangle = @This();

pub fn init() Triangle {
    return Triangle{};
}

pub fn drawImpl(_: Triangle) void {
    std.debug.print("Draw from Triangle\n", .{});
}

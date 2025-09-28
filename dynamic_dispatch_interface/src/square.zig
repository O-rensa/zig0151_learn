const std = @import("std");

const Square = @This();

pub fn init() Square {
    return Square{};
}

pub fn drawImpl(_: Square) void {
    std.debug.print("Draw from Square\n", .{});
}

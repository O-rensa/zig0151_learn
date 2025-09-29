const std = @import("std");

fn delayedWork(ms: u64) void {
    std.debug.print("delayed work start\n", .{});
    std.Thread.sleep(ms); // thread blocking
    std.debug.print("delayed work finished after {} ms\n", .{ms});
}

pub fn main() !void {
    std.debug.print("call site start\n", .{});
    delayedWork(3000);
    std.debug.print("call site end\n", .{});
}

const std = @import("std");

fn delayedWork(id: u32, ms: u64) void {
    std.debug.print("delayed work with id {} start\n", .{id});
    // puts the thread to sleep while for n ms
    std.Thread.sleep(ms * std.time.ns_per_ms); // thread blocking (blocking function)
    std.debug.print("delayed work with id {} finished after {} ms\n", .{ id, ms });
}

pub fn main() !void {
    std.debug.print("\n", .{});
    std.debug.print("call site start\n", .{});
    std.debug.print("\n", .{});
    const start_ms = std.time.milliTimestamp();

    delayedWork(1, 3000); // blocks thread until delayed work with id 1 is finished
    delayedWork(2, 1500); // blocks thread until delayed work with id 2 is finished
    delayedWork(3, 1000); // blocks thread until delayed work with id 3 is finished

    std.debug.print("\n", .{});
    std.debug.print("run a random function here\n", .{});
    std.debug.print("\n", .{});

    const end_ms = std.time.milliTimestamp();
    const time_used = end_ms - start_ms;
    std.debug.print("call site end after {} ms\n", .{time_used});
    std.debug.print("\n", .{});
}

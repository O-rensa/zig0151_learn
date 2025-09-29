const std = @import("std");

fn delayedWork(id: u32, ms: u64) void {
    std.debug.print("delayed work with id {} start\n", .{id});
    // blocks thread for n ms
    std.Thread.sleep(ms * std.time.ns_per_ms); // thread blocking also known as blocking function
    std.debug.print("delayed work with id {} finished after {} ms\n", .{ id, ms });
}

pub fn main() !void {
    std.debug.print("\n", .{});
    std.debug.print("call site started\n", .{});
    const start_ms = std.time.milliTimestamp();

    // spawn 3 threads
    var thread1 = try std.Thread.spawn(.{}, delayedWork, .{ 1, 3000 }); // spawn a thread
    var thread2 = try std.Thread.spawn(.{}, delayedWork, .{ 2, 1500 }); // spawn a thread
    var thread3 = try std.Thread.spawn(.{}, delayedWork, .{ 3, 1000 }); // spawn a thread

    std.debug.print("\n", .{});
    std.debug.print("run a random function here\n\n", .{});

    thread1.join(); // blocks the call site thread until thread 1 finishes
    thread2.join(); // blocks the call site thread until thread 2 finishes
    thread3.join(); // blocks the call site thread unitl thread 3 finishes

    const after_ms = std.time.milliTimestamp();

    const time_used = after_ms - start_ms;

    std.debug.print("\n", .{});
    std.debug.print("call site ended after {} ms.\n", .{time_used});
}

const std = @import("std");

/* ================================
   Types
   ================================ */

const EntityType = enum {
    alpha,
    beta,
    gamma,
};

const Entity = struct {
    name: []const u8,
    energy: i32,
    entity_type: EntityType,
};

/* ================================
   Data
   ================================ */

fn initEntities() []Entity {
    return &[_]Entity{
        .{ .name = "alpha", .energy = 93, .entity_type = .alpha },
        .{ .name = "beta",  .energy = 78, .entity_type = .beta },
        .{ .name = "gamma", .energy = 65, .entity_type = .gamma },
    };
}

/* ================================
   Behavior
   ================================ */

fn decay(rate: i32, e: *Entity) void {
    e.energy -= rate;
    if (e.energy < 0) e.energy = 0;
}

fn applyDecayAll(entities: []Entity, rate: i32) void {
    for (entities) |*e| {
        decay(rate, e);
    }
}

/* ================================
   API
   ================================ */

fn findEntity(entities: []Entity, name: []const u8) ?*Entity {
    for (entities) |*e| {
        if (std.mem.eql(u8, e.name, name)) {
            return e;
        }
    }
    return null;
}

/* ================================
   Print
   ================================ */

fn printEntity(e: Entity) void {
    std.debug.print(
        "<Entity {s} | energy={} | type={any}>\n",
        .{ e.name, e.energy, e.entity_type }
    );
}

/* ================================
   Main
   ================================ */

pub fn main() void {
    var entities = initEntities();

    std.debug.print("Initial state:\n", .{});
    for (entities) |e| {
        printEntity(e);
    }

    std.debug.print("\nApplying decay(10)...\n", .{});
    applyDecayAll(entities, 10);

    for (entities) |e| {
        printEntity(e);
    }

    std.debug.print("\nLookup:\n", .{});
    if (findEntity(entities, "beta")) |e| {
        printEntity(e.*);
    }
}

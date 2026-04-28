# ================================
# Types and Data Model
# ================================

from enum import Enum
from dataclasses import dataclass
from typing import Callable, List, Optional


class EntityType(Enum):
    ALPHA = 0
    BETA = 1
    GAMMA = 2


@dataclass
class Entity:
    name: str
    energy: int
    type: EntityType


# ================================
# Data Initialization
# ================================

_entities: List[Entity] = [
    Entity("alpha", 93, EntityType.ALPHA),
    Entity("beta", 78, EntityType.BETA),
    Entity("gamma", 65, EntityType.GAMMA),
]


# ================================
# Functional Behavior
# ================================

DecayFunc = Callable[[Entity], None]


def decay(rate: int) -> DecayFunc:
    """Closure that returns a decay function."""
    def _decay(e: Entity) -> None:
        e.energy = max(0, e.energy - rate)
    return _decay


# Predefined decay functions (mirrors your C macros)
decay_5 = decay(5)
decay_10 = decay(10)
decay_20 = decay(20)


# ================================
# API Functions
# ================================

def get_entity(entity_type: EntityType) -> Optional[Entity]:
    try:
        return _entities[entity_type.value]
    except IndexError:
        return None


def find_entity(name: str) -> Optional[Entity]:
    return next((e for e in _entities if e.name == name), None)


def apply_decay_all(fn: DecayFunc) -> None:
    for e in _entities:
        fn(e)


def print_entity(e: Entity) -> None:
    print(f"<Entity {e.name} | energy={e.energy} | type={e.type.name}>")


def entity_count() -> int:
    return len(_entities)


# ================================
# "Main" Demo
# ================================

if __name__ == "__main__":
    print("[LOG] Initial state:")
    for e in _entities:
        print_entity(e)

    print("\n[LOG] Applying decay_10 to all...")
    apply_decay_all(decay_10)

    for e in _entities:
        print_entity(e)

    print("\n[LOG] Lookup test:")
    e = find_entity("beta")
    if e:
        print_entity(e)

    print("\n[LOG] Direct enum access:")
    alpha = get_entity(EntityType.ALPHA)
    if alpha:
        print_entity(alpha)

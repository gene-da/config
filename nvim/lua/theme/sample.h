#ifndef ENTITY_H
#define ENTITY_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stddef.h> /* size_t */

/* ================================
   Public Types
   ================================ */

/* Forward declaration (opaque if you want to hide internals later) */
typedef struct Entity Entity;

/* Enum for entity types */
typedef enum {
  ENTITY_alpha,
  ENTITY_beta,
  ENTITY_gamma,
  ENTITY_COUNT
} EntityType;

/* Function pointer typedef */
typedef void (*DecayFunc)(Entity *e);

/* ================================
   Struct Definition
   ================================ */

/* If you want this opaque later, move this to .c */
struct Entity {
  const char *name;
  int energy;
  EntityType type;
};

/* ================================
   Public API
   ================================ */

/* Accessors */
Entity *get_entity(EntityType type);
Entity *find_entity(const char *name);

/* Operations */
void print_entity(const Entity *e);
void apply_decay_all(DecayFunc fn);

/* Decay functions (generated in .c) */
void decay_5(Entity *e);
void decay_10(Entity *e);
void decay_20(Entity *e);

/* Utility */
size_t entity_count(void);

#ifdef __cplusplus
}
#endif

#endif /* ENTITY_H */

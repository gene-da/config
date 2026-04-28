#include <stdio.h>
#include <stdlib.h>

/* ================================
   Preprocessor Utilities
   ================================ */
#define STR(x) #x
#define CONCAT(a, b) a##b
#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))

#define LOG(fmt, ...)                                                          \
  printf("[LOG %s:%d] " fmt "\n", __FILE__, __LINE__, ##__VA_ARGS__)

/* ================================
   X-Macro Data Definition
   ================================ */
#define ENTITY_LIST                                                            \
  X(alpha, 93)                                                                 \
  X(beta, 78)                                                                  \
  X(gamma, 65)

/* ================================
   Types
   ================================ */

/* Enum from X-Macro */
#define X(name, energy) ENTITY_##name,
typedef enum { ENTITY_LIST ENTITY_COUNT } EntityType;
#undef X

/* Struct typedef */
typedef struct {
  const char *name;
  int energy;
  EntityType type;
} Entity;

/* Function pointer typedef */
typedef void (*DecayFunc)(Entity *e);

/* ================================
   Generated Data
   ================================ */

/* Generate entity table */
#define X(name, energy) {STR(name), energy, ENTITY_##name},
static Entity entities[] = {ENTITY_LIST};
#undef X

/* ================================
   Function Generation (Macros)
   ================================ */

#define DEFINE_DECAY_FUNC(rate)                                                \
  void CONCAT(decay_, rate)(Entity * e) {                                      \
    if (!e)                                                                    \
      return;                                                                  \
    e->energy -= (rate);                                                       \
    if (e->energy < 0)                                                         \
      e->energy = 0;                                                           \
  }

/* Generate multiple decay functions */
DEFINE_DECAY_FUNC(5)
DEFINE_DECAY_FUNC(10)
DEFINE_DECAY_FUNC(20)

/* ================================
   Real Functions (Not Macro Junk)
   ================================ */

/* Lookup by enum */
Entity *get_entity(EntityType type) {
  if (type >= ENTITY_COUNT)
    return NULL;
  return &entities[type];
}

/* Print a single entity */
void print_entity(const Entity *e) {
  if (!e)
    return;
  printf("<Entity %s | energy=%d | type=%d>\n", e->name, e->energy, e->type);
}

/* Apply decay function to all entities */
void apply_decay_all(DecayFunc fn) {
  if (!fn)
    return;

  for (size_t i = 0; i < ARRAY_SIZE(entities); ++i) {
    fn(&entities[i]);
  }
}

/* Find entity by name (string match) */
Entity *find_entity(const char *name) {
  for (size_t i = 0; i < ARRAY_SIZE(entities); ++i) {
    if (strcmp(entities[i].name, name) == 0) {
      return &entities[i];
    }
  }
  return NULL;
}

/* ================================
   Compile-Time Check
   ================================ */
typedef char
    static_assert_entity_size[(sizeof(Entity) >= sizeof(void *) * 2) ? 1 : -1];

/* ================================
   Main
   ================================ */
int main(void) {
  LOG("Initial state:");

  for (size_t i = 0; i < ARRAY_SIZE(entities); ++i) {
    print_entity(&entities[i]);
  }

  LOG("Applying decay_10 to all...");
  apply_decay_all(decay_10);

  for (size_t i = 0; i < ARRAY_SIZE(entities); ++i) {
    print_entity(&entities[i]);
  }

  LOG("Lookup test:");
  Entity *e = find_entity("beta");
  if (e) {
    print_entity(e);
  }

  LOG("Direct enum access:");
  Entity *alpha = get_entity(ENTITY_alpha);
  print_entity(alpha);

  /* Token pasting demo */
  int CONCAT(my_, counter) = 123;
  LOG("Token pasted var: %d", my_counter);

  return 0;
}

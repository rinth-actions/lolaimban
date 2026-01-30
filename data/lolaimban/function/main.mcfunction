# Biome Resonance - Main Function
# Run every tick: /function lolaimban:main

# === HARMONIOUS BIOMES - Reduced mob aggression ===
# Flower Forest - peaceful resonance
execute as @e[type=zombie,tag=!resonance_checked] at @s if biome ~ ~ ~ minecraft:flower_forest run data merge entity @s {Attributes:[{Name:"generic.follow_range",Base:8}]}
execute as @e[type=skeleton,tag=!resonance_checked] at @s if biome ~ ~ ~ minecraft:flower_forest run data merge entity @s {Attributes:[{Name:"generic.follow_range",Base:8}]}
execute as @e[type=creeper,tag=!resonance_checked] at @s if biome ~ ~ ~ minecraft:flower_forest run data merge entity @s {Attributes:[{Name:"generic.movement_speed",Base:0.15}]}

# Meadow - calming frequency
execute as @e[type=zombie,tag=!resonance_checked] at @s if biome ~ ~ ~ minecraft:meadow run data merge entity @s {Attributes:[{Name:"generic.follow_range",Base:10}]}
execute as @e[type=skeleton,tag=!resonance_checked] at @s if biome ~ ~ ~ minecraft:meadow run data merge entity @s {Attributes:[{Name:"generic.follow_range",Base:10}]}

# Cherry Grove - serene tones
execute as @e[type=zombie,tag=!resonance_checked] at @s if biome ~ ~ ~ minecraft:cherry_grove run data merge entity @s {Attributes:[{Name:"generic.attack_damage",Base:2}]}
execute as @e[type=spider,tag=!resonance_checked] at @s if biome ~ ~ ~ minecraft:cherry_grove run data merge entity @s {Attributes:[{Name:"generic.movement_speed",Base:0.2}]}

# === DISSONANT BIOMES - Increased aggression ===
# Soul Sand Valley - discordant frequencies cause territorial behavior
execute as @e[type=piglin,tag=!resonance_checked] at @s if biome ~ ~ ~ minecraft:soul_sand_valley run data merge entity @s {Attributes:[{Name:"generic.follow_range",Base:24}]}
execute as @e[type=hoglin,tag=!resonance_checked] at @s if biome ~ ~ ~ minecraft:soul_sand_valley run data merge entity @s {Attributes:[{Name:"generic.attack_damage",Base:8}]}

# Deep Dark - unsettling vibrations
execute as @e[type=zombie,tag=!resonance_checked] at @s if biome ~ ~ ~ minecraft:deep_dark run data merge entity @s {Attributes:[{Name:"generic.follow_range",Base:24},{"Name":"generic.attack_damage",Base:5}]}
execute as @e[type=skeleton,tag=!resonance_checked] at @s if biome ~ ~ ~ minecraft:deep_dark run data merge entity @s {Attributes:[{Name:"generic.follow_range",Base:24}]}

# Basalt Deltas - chaotic resonance
execute as @e[type=magma_cube,tag=!resonance_checked] at @s if biome ~ ~ ~ minecraft:basalt_deltas run data merge entity @s {Attributes:[{Name:"generic.movement_speed",Base:0.35}]}

# === BREEDING BOOST IN HARMONIOUS BIOMES ===
execute as @e[type=cow] at @s if biome ~ ~ ~ minecraft:flower_forest run effect give @s regeneration 3 0 true
execute as @e[type=sheep] at @s if biome ~ ~ ~ minecraft:meadow run effect give @s regeneration 3 0 true
execute as @e[type=chicken] at @s if biome ~ ~ ~ minecraft:cherry_grove run effect give @s regeneration 3 0 true

# === BELL RESONANCE - Extended ringing in plains ===
execute as @a at @s if biome ~ ~ ~ minecraft:plains run execute if block ~ ~ ~ minecraft:bell run playsound minecraft:block.bell.resonate block @a ~ ~ ~ 1 0.8

# === BIOME TRANSITION ZONES - Random effects ===
# Check for players at biome edges and apply confusion effects to nearby mobs
execute as @a at @s if biome ~8 ~ ~ minecraft:forest unless biome ~ ~ ~ minecraft:forest run effect give @e[type=!player,distance=..10] slowness 2 0 true
execute as @a at @s if biome ~8 ~ ~ minecraft:desert unless biome ~ ~ ~ minecraft:desert run effect give @e[type=!player,distance=..10] slowness 2 0 true

# Random note block activation at biome transitions (1/100 chance per tick)
execute as @a at @s if biome ~5 ~ ~ minecraft:plains unless biome ~ ~ ~ minecraft:plains if predicate lolaimban:random_chance run playsound minecraft:block.note_block.harp block @a ~ ~ ~ 0.5 1

# === MOB CONFUSION IN TRANSITION ZONES ===
execute as @e[type=zombie] at @s if biome ~4 ~ ~ minecraft:forest unless biome ~ ~ ~ minecraft:forest run effect give @s nausea 3 0 true
execute as @e[type=skeleton] at @s if biome ~4 ~ ~ minecraft:desert unless biome ~ ~ ~ minecraft:desert run effect give @s blindness 2 0 true

# === JUKEBOX EXTENDED RANGE IN MUSICAL BIOMES ===
execute as @a at @s if biome ~ ~ ~ minecraft:flower_forest run effect give @s hero_of_the_village 1 0 true

# Mark all mobs as checked to prevent repeated attribute changes
tag @e[type=!player,tag=!resonance_checked] add resonance_checked
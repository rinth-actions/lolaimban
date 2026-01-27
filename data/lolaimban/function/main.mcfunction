# Breath Clouds - Main function
# Runs every 30 ticks via tick scheduling

# Schedule next run
schedule function lolaimban:main 30t

# Breath in snowy plains
execute as @a at @s if biome ~ ~ ~ minecraft:snowy_plains run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in snowy taiga
execute as @a at @s if biome ~ ~ ~ minecraft:snowy_taiga run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in snowy beach
execute as @a at @s if biome ~ ~ ~ minecraft:snowy_beach run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in frozen peaks
execute as @a at @s if biome ~ ~ ~ minecraft:frozen_peaks run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in frozen river
execute as @a at @s if biome ~ ~ ~ minecraft:frozen_river run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in frozen ocean
execute as @a at @s if biome ~ ~ ~ minecraft:frozen_ocean run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in deep frozen ocean
execute as @a at @s if biome ~ ~ ~ minecraft:deep_frozen_ocean run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in ice spikes
execute as @a at @s if biome ~ ~ ~ minecraft:ice_spikes run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in jagged peaks
execute as @a at @s if biome ~ ~ ~ minecraft:jagged_peaks run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in grove
execute as @a at @s if biome ~ ~ ~ minecraft:grove run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in snowy slopes
execute as @a at @s if biome ~ ~ ~ minecraft:snowy_slopes run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in stony peaks (high altitude cold)
execute as @a at @s if biome ~ ~ ~ minecraft:stony_peaks run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in old growth pine taiga (cold)
execute as @a at @s if biome ~ ~ ~ minecraft:old_growth_pine_taiga run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in old growth spruce taiga (cold)
execute as @a at @s if biome ~ ~ ~ minecraft:old_growth_spruce_taiga run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in taiga
execute as @a at @s if biome ~ ~ ~ minecraft:taiga run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in windswept hills (cold mountains)
execute as @a at @s if biome ~ ~ ~ minecraft:windswept_hills run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Breath in windswept gravelly hills
execute as @a at @s if biome ~ ~ ~ minecraft:windswept_gravelly_hills run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.02 0.02 0.02 0.001 1

# Extreme altitude breath - above Y 180, thin cold air causes visible breath regardless of biome
execute as @a at @s if predicate lolaimban:high_altitude run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.03 0.03 0.03 0.001 2

# Denser breath during rain/snow in cold biomes
execute as @a at @s if biome ~ ~ ~ minecraft:snowy_plains if predicate lolaimban:is_raining run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.04 0.04 0.04 0.002 2
execute as @a at @s if biome ~ ~ ~ minecraft:snowy_taiga if predicate lolaimban:is_raining run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.04 0.04 0.04 0.002 2
execute as @a at @s if biome ~ ~ ~ minecraft:frozen_peaks if predicate lolaimban:is_raining run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.04 0.04 0.04 0.002 2
execute as @a at @s if biome ~ ~ ~ minecraft:ice_spikes if predicate lolaimban:is_raining run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.04 0.04 0.04 0.002 2
execute as @a at @s if biome ~ ~ ~ minecraft:snowy_slopes if predicate lolaimban:is_raining run particle minecraft:campfire_cosy_smoke ^ ^1.6 ^0.3 0.04 0.04 0.04 0.002 2
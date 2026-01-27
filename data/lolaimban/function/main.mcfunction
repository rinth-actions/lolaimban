# Biome Resonance Enchanting - Main Function
# Runs every tick to check players near enchanting tables and apply biome bonuses

# Check for players within 3 blocks of enchanting tables
execute as @a at @s if block ~ ~ ~ minecraft:enchanting_table run function lolaimban:check_biome
execute as @a at @s if block ~1 ~ ~ minecraft:enchanting_table run function lolaimban:check_biome
execute as @a at @s if block ~-1 ~ ~ minecraft:enchanting_table run function lolaimban:check_biome
execute as @a at @s if block ~ ~ ~1 minecraft:enchanting_table run function lolaimban:check_biome
execute as @a at @s if block ~ ~ ~-1 minecraft:enchanting_table run function lolaimban:check_biome

# Cold biomes - Frost Walker, Protection boost
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:snowy_plains run effect give @s minecraft:resistance 5 1 true
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:frozen_peaks run effect give @s minecraft:resistance 5 2 true
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:ice_spikes run effect give @s minecraft:resistance 5 2 true
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:snowy_taiga run effect give @s minecraft:resistance 5 1 true

# Hot biomes - Fire Aspect, Blast Protection, Unbreaking boost
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:desert run effect give @s minecraft:fire_resistance 5 0 true
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:badlands run effect give @s minecraft:fire_resistance 5 1 true
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:eroded_badlands run effect give @s minecraft:fire_resistance 5 1 true

# Ocean biomes - Respiration, Aqua Affinity, Depth Strider boost
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:ocean run effect give @s minecraft:water_breathing 5 0 true
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:deep_ocean run effect give @s minecraft:water_breathing 5 1 true
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:warm_ocean run effect give @s minecraft:dolphins_grace 5 0 true
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:river run effect give @s minecraft:water_breathing 5 0 true

# Jungle/Lush - Fortune, Looting, Luck of the Sea boost
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:jungle run effect give @s minecraft:luck 5 1 true
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:sparse_jungle run effect give @s minecraft:luck 5 0 true
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:lush_caves run effect give @s minecraft:luck 5 2 true

# Rare biomes - Exclusive combinations and XP boost
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:mushroom_fields run effect give @s minecraft:luck 5 3 true
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:mushroom_fields run xp add @s 1 points
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:deep_dark run effect give @s minecraft:darkness 3 0 true
execute as @a at @s if predicate lolaimban:near_enchant_table if biome ~ ~ ~ minecraft:deep_dark run xp add @s 2 points

# Apply enchantment seed modifier particles for visual feedback
execute as @a at @s if block ~ ~-1 ~ minecraft:enchanting_table if biome ~ ~ ~ #lolaimban:cold_biomes run particle snowflake ~ ~1 ~ 0.5 0.5 0.5 0.01 3
execute as @a at @s if block ~ ~-1 ~ minecraft:enchanting_table if biome ~ ~ ~ #lolaimban:hot_biomes run particle flame ~ ~1 ~ 0.5 0.5 0.5 0.01 3
execute as @a at @s if block ~ ~-1 ~ minecraft:enchanting_table if biome ~ ~ ~ #lolaimban:ocean_biomes run particle bubble ~ ~1 ~ 0.5 0.5 0.5 0.1 5
execute as @a at @s if block ~ ~-1 ~ minecraft:enchanting_table if biome ~ ~ ~ #lolaimban:lush_biomes run particle happy_villager ~ ~1 ~ 0.5 0.5 0.5 0.01 3
execute as @a at @s if block ~ ~-1 ~ minecraft:enchanting_table if biome ~ ~ ~ minecraft:mushroom_fields run particle entity_effect ~ ~1 ~ 0.5 0.5 0.5 1 5
execute as @a at @s if block ~ ~-1 ~ minecraft:enchanting_table if biome ~ ~ ~ minecraft:deep_dark run particle sculk_charge_pop ~ ~1 ~ 0.5 0.5 0.5 0.01 5

# Lapis cost reduction for ocean biomes (give back lapis when enchanting)
execute as @a[nbt={Inventory:[{id:"minecraft:lapis_lazuli"}]}] at @s if block ~ ~-1 ~ minecraft:enchanting_table if biome ~ ~ ~ #lolaimban:ocean_biomes run give @s minecraft:lapis_lazuli 1
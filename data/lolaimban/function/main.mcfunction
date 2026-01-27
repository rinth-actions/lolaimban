# File: data/lolaimban/function/main.mcfunction

# === Tidal Pull System ===
# Moon phase: 0=full, 4=new, others=transitional
# Tides shift gradually based on lunar cycle

# Initialize scoreboards on first run
scoreboard objectives add tidal_phase dummy
scoreboard objectives add tidal_timer dummy
scoreboard objectives add tidal_strength dummy
scoreboard objectives add tidal_transition dummy

# Timer increments every tick (20 ticks = 1 second)
scoreboard players add #timer tidal_timer 1

# Run tidal calculations every 100 ticks (5 seconds) for performance
execute unless score #timer tidal_timer matches 100.. run return 0
scoreboard players set #timer tidal_timer 0

# Store current moon phase (0-7) using time query
execute store result score #moon_phase tidal_phase run time query day
scoreboard players operation #moon_phase tidal_phase %= #eight tidal_phase
execute unless score #eight tidal_phase matches 1.. run scoreboard players set #eight tidal_phase 8

# Calculate tidal strength: full moon (0) = +4, new moon (4) = -4
# Phases 1-3 transition down, phases 5-7 transition up
execute if score #moon_phase tidal_phase matches 0 run scoreboard players set #tidal_strength tidal_strength 4
execute if score #moon_phase tidal_phase matches 1 run scoreboard players set #tidal_strength tidal_strength 2
execute if score #moon_phase tidal_phase matches 2 run scoreboard players set #tidal_strength tidal_strength 0
execute if score #moon_phase tidal_phase matches 3 run scoreboard players set #tidal_strength tidal_strength -2
execute if score #moon_phase tidal_phase matches 4 run scoreboard players set #tidal_strength tidal_strength -4
execute if score #moon_phase tidal_phase matches 5 run scoreboard players set #tidal_strength tidal_strength -2
execute if score #moon_phase tidal_phase matches 6 run scoreboard players set #tidal_strength tidal_strength 0
execute if score #moon_phase tidal_phase matches 7 run scoreboard players set #tidal_strength tidal_strength 2

# === HIGH TIDE EFFECTS (Full Moon) ===
# Water spreads inland, aquatic mobs spawn more, coral/kelp thrive

# Spread water one block inland during high tide (phases 0,1,7)
execute if score #tidal_strength tidal_strength matches 2..4 as @a at @s if predicate lolaimban:near_ocean run fill ~-16 ~ ~-16 ~16 ~3 ~16 water replace air
execute if score #tidal_strength tidal_strength matches 2..4 as @a at @s positioned ~-24 ~ ~-24 if block ~ ~-1 ~ sand if block ~ ~ ~ air run setblock ~ ~ ~ water
execute if score #tidal_strength tidal_strength matches 2..4 as @a at @s positioned ~24 ~ ~24 if block ~ ~-1 ~ sand if block ~ ~ ~ air run setblock ~ ~ ~ water

# Boost aquatic mob spawning during high tide
execute if score #tidal_strength tidal_strength matches 3..4 as @a at @s run spreadplayers ~ ~ 5 20 false @e[type=cod,limit=1,sort=random]
execute if score #tidal_strength tidal_strength matches 3..4 as @a at @s run spreadplayers ~ ~ 5 20 false @e[type=salmon,limit=1,sort=random]
execute if score #tidal_strength tidal_strength matches 4 as @a at @s run spreadplayers ~ ~ 3 15 false @e[type=squid,limit=1,sort=random]

# Drowned venture closer to shore during high tide
execute if score #tidal_strength tidal_strength matches 3..4 as @e[type=drowned] at @s run tp @s ^ ^ ^0.1

# Accelerate kelp and coral growth during high tide
execute if score #tidal_strength tidal_strength matches 2..4 as @a at @s run forceload add ~-32 ~-32 ~32 ~32
execute if score #tidal_strength tidal_strength matches 3..4 as @a at @s run fill ~-8 ~-10 ~-8 ~8 ~ ~8 kelp_plant replace kelp

# Push boats shoreward during high tide
execute if score #tidal_strength tidal_strength matches 3..4 as @e[type=boat] at @s if block ~ ~-1 ~ water run tp @s ~ ~ ~ ~5 ~

# === LOW TIDE EFFECTS (New Moon) ===
# Water recedes, aquatic mobs retreat to deep water, tidal pools form

# Remove surface water from beaches during low tide (phases 3,4,5)
execute if score #tidal_strength tidal_strength matches -4..-2 as @a at @s if block ~ ~-1 ~ sand if block ~ ~ ~ water run setblock ~ ~ ~ air
execute if score #tidal_strength tidal_strength matches -4..-3 as @a at @s positioned ~-16 ~62 ~-16 if block ~ ~ ~ water[level=0] if block ~ ~-1 ~ sand run setblock ~ ~ ~ air

# Push aquatic mobs to deeper water during low tide
execute if score #tidal_strength tidal_strength matches -4..-2 as @e[type=cod] at @s if block ~ ~1 ~ air run tp @s ~ ~-1 ~
execute if score #tidal_strength tidal_strength matches -4..-2 as @e[type=salmon] at @s if block ~ ~1 ~ air run tp @s ~ ~-1 ~
execute if score #tidal_strength tidal_strength matches -4..-3 as @e[type=squid] at @s run tp @s ^ ^ ^-0.2
execute if score #tidal_strength tidal_strength matches -4..-2 as @e[type=drowned] at @s run tp @s ^ ^ ^-0.15

# Strand boats on exposed beaches during low tide
execute if score #tidal_strength tidal_strength matches -4..-3 as @e[type=boat] at @s unless block ~ ~-0.5 ~ water run tp @s ~ ~-0.05 ~

# Create tidal pools (small isolated water pockets)
execute if score #tidal_strength tidal_strength matches -4 as @a at @s if block ~3 ~-1 ~3 sand if block ~3 ~-2 ~3 stone run setblock ~3 ~-1 ~3 water

# === TRANSITIONAL EFFECTS ===
# Gradual changes during waxing/waning phases

# Increment transition counter for smooth changes
scoreboard players add #transition tidal_transition 1
execute if score #transition tidal_transition matches 20.. run scoreboard players set #transition tidal_transition 0

# Fish schooling behavior intensifies near tide changes
execute if score #tidal_strength tidal_strength matches -1..1 as @e[type=cod] at @s run tp @s ~ ~ ~ facing entity @e[type=cod,limit=1,sort=nearest,distance=1..10]
execute if score #tidal_strength tidal_strength matches -1..1 as @e[type=salmon] at @s run tp @s ~ ~ ~ facing entity @e[type=salmon,limit=1,sort=nearest,distance=1..10]

# === PARTICLE AND AMBIENT EFFECTS ===
# Visual indicators of tidal state

# High tide: water particles rise
execute if score #tidal_strength tidal_strength matches 3..4 as @a at @s run particle bubble ~ ~1 ~ 10 2 10 0.01 5

# Low tide: dripping effect on exposed areas
execute if score #tidal_strength tidal_strength matches -4..-3 as @a at @s if block ~ ~-1 ~ sand run particle dripping_water ~ ~0.5 ~ 5 0.5 5 0.01 3

# === FISHING BONUS DURING HIGH TIDE ===
# Players fishing during full moon have better luck
execute if score #tidal_strength tidal_strength matches 4 as @a[nbt={SelectedItem:{id:"minecraft:fishing_rod"}}] at @s run effect give @s luck 10 1 true
# File: data/lolaimban/function/main.mcfunction

# Clean up light blocks where items no longer exist
execute as @e[type=minecraft:marker,tag=lolaimban.light_source] at @s unless entity @e[type=minecraft:item,distance=..0.5] run setblock ~ ~ ~ air
execute as @e[type=minecraft:marker,tag=lolaimban.light_source] at @s unless entity @e[type=minecraft:item,distance=..0.5] run kill @s

# Glowstone Dust - Light level 10 (warm glow)
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:glowstone_dust"}}] at @s unless entity @e[type=minecraft:marker,tag=lolaimban.light_source,distance=..0.5] if block ~ ~ ~ air run setblock ~ ~ ~ light[level=10]
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:glowstone_dust"}}] at @s unless entity @e[type=minecraft:marker,tag=lolaimban.light_source,distance=..0.5] run summon marker ~ ~ ~ {Tags:["lolaimban.light_source"]}

# Blaze Rod - Light level 12 (fiery luminescence)
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:blaze_rod"}}] at @s unless entity @e[type=minecraft:marker,tag=lolaimban.light_source,distance=..0.5] if block ~ ~ ~ air run setblock ~ ~ ~ light[level=12]
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:blaze_rod"}}] at @s unless entity @e[type=minecraft:marker,tag=lolaimban.light_source,distance=..0.5] run summon marker ~ ~ ~ {Tags:["lolaimban.light_source"]}

# Nether Star - Light level 15 (brilliant shine)
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:nether_star"}}] at @s unless entity @e[type=minecraft:marker,tag=lolaimban.light_source,distance=..0.5] if block ~ ~ ~ air run setblock ~ ~ ~ light[level=15]
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:nether_star"}}] at @s unless entity @e[type=minecraft:marker,tag=lolaimban.light_source,distance=..0.5] run summon marker ~ ~ ~ {Tags:["lolaimban.light_source"]}

# Magma Cream - Light level 6 (dim pulsing heat)
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:magma_cream"}}] at @s unless entity @e[type=minecraft:marker,tag=lolaimban.light_source,distance=..0.5] if block ~ ~ ~ air run setblock ~ ~ ~ light[level=6]
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:magma_cream"}}] at @s unless entity @e[type=minecraft:marker,tag=lolaimban.light_source,distance=..0.5] run summon marker ~ ~ ~ {Tags:["lolaimban.light_source"]}

# Ender Pearl - Light level 7 (eerie dim teal light)
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:ender_pearl"}}] at @s unless entity @e[type=minecraft:marker,tag=lolaimban.light_source,distance=..0.5] if block ~ ~ ~ air run setblock ~ ~ ~ light[level=7]
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:ender_pearl"}}] at @s unless entity @e[type=minecraft:marker,tag=lolaimban.light_source,distance=..0.5] run summon marker ~ ~ ~ {Tags:["lolaimban.light_source"]}
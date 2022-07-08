dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/gun/procedural/gun_action_utils.lua")

local entity_id = GetUpdatedEntityID()
entity_id = EntityGetRootEntity( entity_id )

local pos_x, pos_y = EntityGetTransform( entity_id )

SetRandomSeed( GameGetFrameNum() + GetUpdatedComponentID(), pos_x + pos_y + entity_id )

local angle = math.rad(Random(0,360))
local length = Random(1,3000)

length = 5 * (length ^ 0.8)

local vel_x = math.cos( angle ) * length
local vel_y = 0 - math.sin( angle ) * length

shoot_projectile( entity_id, "mods/Hydroxide/files/entities/projectiles/radiation_particle.xml", pos_x, pos_y, vel_x, vel_y )

EntityKill(GetUpdatedEntityID())
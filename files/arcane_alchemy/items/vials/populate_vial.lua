materials = {
    {
        material="aa_base_potion",
        weight=1,
    },
    {
        material="aa_arborium",
        weight=1,
    },
    {
        material="aa_catalyst",
        weight=1,
    },
    {
        material="aa_hungry_slime",
        weight=1,
    }
}

function get_weighted_random(table)
    local total_weight = 0
    for i, v in ipairs(table) do
        total_weight = total_weight + v.weight
    end
    local rnd = Random(0, total_weight)
    for i, v in ipairs(table) do
        rnd = rnd - v.weight
        if rnd <= 0 then
            return v.material
        end
    end
end

function init( entity_id )
	local x,y = EntityGetTransform( entity_id )
	SetRandomSeed( x, y ) -- so that all the potions will be the same in every position with the same seed

    local potion_material = get_weighted_random(materials)

	local components = EntityGetComponent( entity_id, "VariableStorageComponent" )

	if( components ~= nil ) then
		for key,comp_id in pairs(components) do 
			local var_name = ComponentGetValue2( comp_id, "name" )
			if( var_name == "potion_material") then
				potion_material = ComponentGetValue2( comp_id, "value_string" )
			end
		end
	end

    AddMaterialInventoryMaterial( entity_id, potion_material, 200 )


end
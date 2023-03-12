// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_29BB()
{
    level._id_29B9 = [];
    _id_29BA();
    _id_29C7();
    level._id_29B9 = undefined;
    anim._id_AECC = [];
}

_id_29C7()
{
    anim._id_29BC = [];
    var_0 = getentarray();
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( var_3.classname ) && issubstr( var_3.classname, "trigger_multiple_bcs" ) )
            var_1[var_1.size] = var_3;
    }

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( level._id_29B9[var_3.classname] ) )
            continue;

        var_6 = _id_C908( level._id_29B9[var_3.classname] );

        if ( var_6.size > 1 )
            var_6 = scripts\engine\utility::_id_22A7( var_6 );

        var_3._id_AECB = var_6;
    }

    anim._id_29BC = var_1;
}

_id_C908( var_0 )
{
    var_1 = strtok( var_0, " " );
    return var_1;
}

_id_169E( var_0, var_1 )
{
    if ( isdefined( level._id_29B9[var_0] ) )
    {
        var_2 = level._id_29B9[var_0];
        var_3 = _id_C908( var_2 );
        var_4 = _id_C908( var_1 );

        foreach ( var_6 in var_4 )
        {
            foreach ( var_8 in var_3 )
            {
                if ( var_6 == var_8 )
                    return;
            }
        }

        var_2 += ( " " + var_1 );
        level._id_29B9[var_0] = var_2;
        return;
    }

    level._id_29B9[var_0] = var_1;
}

_id_29BA()
{
    if ( scripts\engine\utility::_id_9F64() )
        _id_104AC();
    else
    {
        metropolis();
        quarry();
        breakneck();
        desert();
        divide();
        _id_6B6E();
        frontier();
        parkour();
        riot();
        rivet();
        proto();
        skyway();
    }
}

_id_104AC()
{
    _id_169E( "trigger_multiple_bcs_sp_doorway", "doorway_generic" );
    _id_169E( "trigger_multiple_bcs_sp_window_generic", "window_generic" );
    _id_169E( "trigger_multiple_bcs_sp_1stfloor", "1stfloor_generic" );
    _id_169E( "trigger_multiple_bcs_sp_2ndfloor", "2ndfloor_generic" );
    _id_169E( "trigger_multiple_bcs_sp_rooftop", "rooftop_generic" );
    _id_169E( "trigger_multiple_bcs_sp_balcony_generic", "balcony_generic" );
    _id_169E( "trigger_multiple_bcs_sp_bridge", "bridge_generic" );
    _id_169E( "trigger_multiple_bcs_sp_catwalk", "catwalk_generic" );
    _id_169E( "trigger_multiple_bcs_sp_crates_generic", "crates_generic" );
    _id_169E( "trigger_multiple_bcs_sp_hallway", "hallway_generic" );
    _id_169E( "trigger_multiple_bcs_sp_pillar", "pillar_generic" );
    _id_169E( "trigger_multiple_bcs_sp_pipes_generic", "pipes_generic" );
    _id_169E( "trigger_multiple_bcs_sp_railings", "railings_generic" );
    _id_169E( "trigger_multiple_bcs_sp_bar", "bar_generic" );
    _id_169E( "trigger_multiple_bcs_sp_cafe", "cafe_generic" );
    _id_169E( "trigger_multiple_bcs_sp_counter", "counter_generic" );
    _id_169E( "trigger_multiple_bcs_sp_elevator", "elevator_generic" );
    _id_169E( "trigger_multiple_bcs_sp_fountain", "fountain_generic" );
    _id_169E( "trigger_multiple_bcs_sp_generator", "generator_generic" );
    _id_169E( "trigger_multiple_bcs_sp_loadingbay", "loadingbay_generic" );
    _id_169E( "trigger_multiple_bcs_sp_ramp_generic", "ramp_generic" );
    _id_169E( "trigger_multiple_bcs_sp_stairs", "stairs_generic" );
    _id_169E( "trigger_multiple_bcs_sp_statue", "statue_generic" );
    _id_169E( "trigger_multiple_bcs_sp_turbines", "turbines_generic" );
    _id_169E( "trigger_multiple_bcs_sp_wall_generic", "wall_generic" );
    _id_169E( "trigger_multiple_bcs_sp_courtyard", "courtyard_generic" );
    _id_169E( "trigger_multiple_bcs_sp_street_generic", "street_generic" );
    _id_169E( "trigger_multiple_bcs_sp_planter", "planter_generic" );
    _id_169E( "trigger_multiple_bcs_sp_bench", "bench_generic" );
    _id_169E( "trigger_multiple_bcs_sp_boats", "boats_generic" );
    _id_169E( "trigger_multiple_bcs_sp_ladder", "ladder_generic" );
    _id_169E( "trigger_multiple_bcs_sp_tables", "tables_generic" );
    _id_169E( "trigger_multiple_bcs_sp_sign_generic", "sign_generic" );
    _id_169E( "trigger_multiple_bcs_sp_barricade_multiple", "barricades_generic" );
    _id_169E( "trigger_multiple_bcs_sp_garage", "garage_generic" );
    _id_169E( "trigger_multiple_bcs_sp_trench", "trench_generic" );
    _id_169E( "trigger_multiple_sp_rock", "rock_generic" );
    _id_169E( "trigger_multiple_bcs_sp_crater", "crater_generic" );
    _id_169E( "trigger_multiple_bcs_sp_trees", "trees_generic" );
    _id_169E( "trigger_multiple_bcs_sp_rubble", "rubble_generic" );
    _id_169E( "trigger_multiple_bcs_sp_dropship", "dropship_generic" );
    _id_169E( "trigger_multiple_bcs_sp_bookstore", "bookstore_generic" );
    _id_169E( "trigger_multiple_bcs_sp_bus", "bus_generic" );
    _id_169E( "trigger_multiple_bcs_sp_shop_kiosk", "kiosk_generic" );
    _id_169E( "trigger_multiple_bcs_sp_solarpanels", "solarpanels_generic" );
    _id_169E( "trigger_multiple_bcs_sp_aagun", "aagun_generic" );
    _id_169E( "trigger_multiple_bcs_sp_stairway", "stairway_generic" );
    _id_169E( "trigger_multiple_bcs_sp_foodcourt", "foodcourt_generic" );
    _id_169E( "trigger_multiple_bcs_sp_railcar", "railcar_generic" );
    _id_169E( "trigger_multiple_bcs_sp_droppod", "droppod_generic" );
    _id_169E( "trigger_multiple_bcs_sp_shop_generic", "shop_generic" );
    _id_169E( "trigger_multiple_bcs_sp_vendingmachine", "vendingmachine_generic" );
    _id_169E( "trigger_multiple_bcs_sp_lounge", "lounge_generic" );
    _id_169E( "trigger_multiple_bcs_sp_checkpoint", "checkpoint_generic" );
    _id_169E( "trigger_multiple_bcs_sp_hangar", "hangar_generic" );
    _id_169E( "trigger_multiple_bcs_sp_deck_upper", "deck_upper" );
    _id_169E( "trigger_multiple_bcs_sp_ramp_main", "ramp_main" );
    _id_169E( "trigger_multiple_bcs_sp_drill_heads", "drill_heads" );
    _id_169E( "trigger_multiple_bcs_sp_street_end", "street_end" );
    _id_169E( "trigger_multiple_bcs_sp_sign_parking", "parking_sign" );
    _id_169E( "trigger_multiple_bcs_sp_sign_yield", "yield_sign" );
    _id_169E( "trigger_multiple_bcs_sp_3rd_floor", "3rdfloor" );
    _id_169E( "trigger_multiple_bcs_sp_vehicle_van", "vehicle_van" );
    _id_169E( "trigger_multiple_bcs_sp_banner_blue", "banner_blue" );
    _id_169E( "trigger_multiple_bcs_sp_building_destroyed", "building_destroyed" );
    _id_169E( "trigger_multiple_bcs_sp_conveyor_belt", "conveyor_belt" );
    _id_169E( "trigger_multiple_bcs_sp_door_security", "security_door" );
    _id_169E( "trigger_multiple_bcs_sp_trash_cans", "trash_cans" );
    _id_169E( "trigger_multiple_bcs_sp_door_report", "door_report" );
    _id_169E( "trigger_multiple_bcs_sp_door_1stfloor_report", "door_1st_report" );
    _id_169E( "trigger_multiple_bcs_sp_door_2ndfloor_report", "door_2nd_report" );
    _id_169E( "trigger_multiple_bcs_sp_window_3rdfloor", "window_3rdfloor" );
    _id_169E( "trigger_multiple_bcs_sp_window_1stfloor_report", "wndw_1st_report" );
    _id_169E( "trigger_multiple_bcs_sp_window_2ndfloor_report", "wndw_2nd_report" );
    _id_169E( "trigger_multiple_bcs_sp_floor_1st_report", "1st_report" );
    _id_169E( "trigger_multiple_bcs_sp_floor_2nd_report", "2nd_report" );
    _id_169E( "trigger_multiple_bcs_sp_fuel_tanks", "fuel_tanks" );
    _id_169E( "trigger_multiple_bcs_sp_barrier_concrete", "concrete_barrier" );
    _id_169E( "trigger_multiple_bcs_sp_barrels_yellow", "barrels_yellow" );
    _id_169E( "trigger_multiple_bcs_sp_barrels_generic", "barrels_generic" );
    _id_169E( "trigger_multiple_bcs_sp_barrels_blue", "barrels_blue" );
    _id_169E( "trigger_multiple_bcs_sp_oildrum", "oildrum_generic" );
    _id_169E( "trigger_multiple_bcs_sp_balcony_2ndfloor", "balcony_2ndfloor" );
    _id_169E( "trigger_multiple_bcs_sp_vent", "vent_generic" );
    _id_169E( "trigger_multiple_bcs_sp_controlpanel", "controlpanel_generic" );
    _id_169E( "trigger_multiple_bcs_sp_lockers", "lockers_generic" );
    _id_169E( "trigger_multiple_bcs_sp_container_stacked", "container_stacked" );
    _id_169E( "trigger_multiple_bcs_sp_container_shipping", "container_shipping" );
    _id_169E( "trigger_multiple_bcs_sp_crates_plastic", "crates_plastic" );
    _id_169E( "trigger_multiple_bcs_sp_crates_pile", "crates_pile" );
    _id_169E( "trigger_multiple_bcs_sp_crates_white", "crates_white" );
    _id_169E( "trigger_multiple_bcs_sp_crates_ammo", "crate_ammo" );
    _id_169E( "trigger_multiple_bcs_sp_commandcenter", "commandcenter_generic" );
    _id_169E( "trigger_multiple_bcs_sp_rack_missile", "rack_missile" );
    _id_169E( "trigger_multiple_bcs_sp_pipes_gas", "pipes_gas" );
    _id_169E( "trigger_multiple_bcs_sp_vehicle_atv", "vehicle_atv" );
    _id_169E( "trigger_multiple_bcs_sp_wall_low", "wall_low" );
    _id_169E( "trigger_multiple_bcs_sp_boulder_generic", "boulder_generic" );
    _id_169E( "trigger_multiple_bcs_sp_boulder_gap", "boulder_gap" );
    _id_169E( "trigger_multiple_bcs_sp_vehicle_tram", "vehicle_tram" );
    _id_169E( "trigger_multiple_bcs_sp_shop_dutyfree", "shop_dutyfree" );
    _id_169E( "trigger_multiple_bcs_sp_shop_jewelry", "shop_jewelry" );
    _id_169E( "trigger_multiple_bcs_sp_cart_luggage", "cart_luggage" );
    _id_169E( "trigger_multiple_bcs_sp_vehicle_forklift", "vehicle_forklift" );
    _id_169E( "trigger_multiple_bcs_sp_servers", "servers_generic" );
    _id_169E( "trigger_multiple_bcs_sp_vehicle_transport", "vehicle_transport" );
    _id_169E( "trigger_multiple_bcs_sp_wall_stone", "wall_stone" );
    _id_169E( "trigger_multiple_bcs_sp_wall_brick", "wall_brick" );
    _id_169E( "trigger_multiple_bcs_sp_barricade_single", "barricades_generic" );
    _id_169E( "trigger_multiple_bcs_sp_bushes", "bushes_generic" );
    _id_169E( "trigger_multiple_bcs_sp_tower_control", "tower_control" );
    _id_169E( "trigger_multiple_bcs_sp_missile_launcher", "missile_launcher" );
    _id_169E( "trigger_multiple_bcs_sp_tower_radar", "tower_radar" );
    _id_169E( "trigger_multiple_bcs_sp_satdish", "satdish_generic" );
    _id_169E( "trigger_multiple_bcs_sp_door_cargo", "door_cargo" );
    _id_169E( "trigger_multiple_bcs_sp_gun_big", "gun_big" );
    _id_169E( "trigger_multiple_bcs_sp_deck_lower", "deck_lower" );
    _id_169E( "trigger_multiple_bcs_sp_side_port", "side_port" );
    _id_169E( "trigger_multiple_bcs_sp_tower_generic", "tower_generic" );
    _id_169E( "trigger_multiple_bcs_sp_dropshipbay", "dropshipbay_generic" );
    _id_169E( "trigger_multiple_bcs_sp_roomcontrol", "room_control" );
    _id_169E( "trigger_multiple_bcs_sp_terminal", "terminal_generic" );
    _id_169E( "trigger_multiple_bcs_sp_radar", "radar_generic" );
    _id_169E( "trigger_multiple_bcs_sp_wheelhouse", "wheelhouse_generic" );
    _id_169E( "trigger_multiple_bcs_sp_deck_2nd", "deck_2nd" );
    _id_169E( "trigger_multiple_bcs_sp_missile_rack", "missile_rack" );
    _id_169E( "trigger_multiple_bcs_sp_below", "below_generic" );
    _id_169E( "trigger_multiple_bcs_sp_hatch", "hatch_generic" );
    _id_169E( "trigger_multiple_bcs_sp_bulkheads", "bulkheads_generic" );
    _id_169E( "trigger_multiple_bcs_sp_topside", "topside_generic" );
    _id_169E( "trigger_multiple_bcs_sp_debris", "debris_generic" );
    _id_169E( "trigger_multiple_bcs_sp_above", "above_generic" );
    _id_169E( "trigger_multiple_bcs_sp_missile_silos", "missile_silos" );
    _id_169E( "trigger_multiple_bcs_sp_deck_gun", "deck_gun" );
    _id_169E( "trigger_multiple_bcs_sp_torpedo_mag", "torpedo_mag" );
    _id_169E( "trigger_multiple_bcs_sp_airlock", "airlock_generic" );
    _id_169E( "trigger_multiple_bcs_sp_cargobay", "cargobay_generic" );
    _id_169E( "trigger_multiple_bcs_sp_controlcenter", "controlcenter_generic" );
    _id_169E( "trigger_multiple_bcs_sp_armory", "armory_generic" );
    _id_169E( "trigger_multiple_bcs_sp_rack_ordnance", "rack_ordnance" );
    _id_169E( "trigger_multiple_bcs_sp_vault", "vault_generic" );
    _id_169E( "trigger_multiple_bcs_sp_pipes_orange", "pipes_orange" );
    _id_169E( "trigger_multiple_bcs_sp_console", "console_generic" );
    _id_169E( "trigger_multiple_bcs_sp_gurney", "gurney_generic" );
    _id_169E( "trigger_multiple_bcs_sp_scanner_body", "scanner_body" );
    _id_169E( "trigger_multiple_bcs_sp_bed", "bed_generic" );
    _id_169E( "trigger_multiple_bcs_sp_refinery", "refinery_generic" );
    _id_169E( "trigger_multiple_bcs_sp_tank_fuel", "tank_fuel" );
    _id_169E( "trigger_multiple_bcs_sp_roof_vents", "roof_vents" );
    _id_169E( "trigger_multiple_bcs_sp_truck_cargo", "truck_cargo" );
    _id_169E( "trigger_multiple_bcs_sp_drill_generic", "drill_generic" );
}

metropolis()
{
    _id_169E( "trigger_multiple_bcs_mp_metropolis_room_bathroom", "room_bathroom" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_generator_generic", "generator_generic" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_tunnel_generic", "tunnel_generic" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_train_generic", "train_generic" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_station_charging", "station_charging" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_alley_generic", "alley_generic" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_van_news", "van_news" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_station_central", "station_central" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_park_generic", "park_generic" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_slums_generic", "slums_generic" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_building_bbq", "building_bbq" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_lobby_generic", "lobby_generic" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_car_fire", "car_fire" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_rack_bikes", "rack_bikes" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_screen_big", "screen_big" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_building_steakhouse", "building_steakhouse" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_droppod_generic", "droppod_generic" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_tree_glow", "tree_glow" );
    _id_169E( "trigger_multiple_bcs_mp_metropolis_car_generic", "car_generic" );
}

quarry()
{
    _id_169E( "trigger_multiple_bcs_mp_quarry_crates_red", "crates_red" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_crates_generic", "crates_generic" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_quarters_crew", "quarters_crew" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_barrels_yellow", "barrels_yellow" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_room_rechall", "room_rechall" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_room_cafeteria", "room_cafeteria" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_room_canteen", "room_canteen" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_tunnel_underground", "tunnel_underground" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_tunnel_maintenance", "tunnel_maintenance" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_underpass_generic", "underpass_generic" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_tunnel_access", "tunnel_access" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_crawlspace_generic", "crawlspace_generic" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_overpass_generic", "overpass_generic" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_tires_generic", "tires_generic" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_fence_generic", "fence_generic" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_vehicle_dumptruck", "vehicle_dumptruck" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_vehicle_bigtruck", "vehicle_bigtruck" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_room_repairbay", "room_repairbay" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_room_motorpool", "room_motorpool" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_robots_generic", "robots_generic" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_rocks_generic", "rocks_generic" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_rockcrusher_generic", "rockcrusher_generic" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_deck_lower", "deck_lower" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_room_readyroom", "room_readyroom" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_room_fillingstation", "room_fillingstation" );
    _id_169E( "trigger_multiple_bcs_mp_quarry_room_cleanroom", "room_cleanroom" );
}

breakneck()
{
    _id_169E( "trigger_multiple_bcs_mp_breakneck_hallway_officersquarter", "hallway_officersquarter" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_hallway_bridge", "hallway_bridge" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_room_server", "room_server" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_portmissionbay_one", "portmissionbay_one" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_loadingdock_one", "loadingdock_one" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_hangar_one", "hangar_one" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_readyroom_officers", "readyroom_officers" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_readyroom_one", "readyroom_one" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_readyroom_blue", "readyroom_blue" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_navigation_holo", "navigation_holo" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_room_briefing", "room_briefing" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_kitchen_generic", "kitchen_generic" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_elevators_port", "elevators_port" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_gundeck_port", "gundeck_port" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_hall_dining", "hall_dining" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_area_common", "area_common" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_berths_crew", "berths_crew" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_quarters_enlisted", "quarters_enlisted" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_readyroom_crew", "readyroom_crew" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_readyroom_two", "readyroom_two" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_readyroom_red", "readyroom_red" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_portmissionbay_two", "portmissionbay_two" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_loadingdock_two", "loadingdock_two" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_hangar_two", "hangar_two" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_command_control", "command_control" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_command_shipdefense", "command_shipdefense" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_armory_generic", "armory_generic" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_armorylift_generic", "armorylift_generic" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_room_armament", "room_armament" );
    _id_169E( "trigger_multiple_bcs_mp_breakneck_room_weaponstorage", "room_weaponstorage" );
}

desert()
{
    _id_169E( "trigger_multiple_bcs_mp_desert_pod_2", "pod_2" );
    _id_169E( "trigger_multiple_bcs_mp_desert_pod_yellow", "pod_yellow" );
    _id_169E( "trigger_multiple_bcs_mp_desert_bridge_generic", "bridge_generic" );
    _id_169E( "trigger_multiple_bcs_mp_desert_pod_1", "pod_1" );
    _id_169E( "trigger_multiple_bcs_mp_desert_pod_blue", "pod_blue" );
    _id_169E( "trigger_multiple_bcs_mp_desert_window_pod", "window_pod" );
    _id_169E( "trigger_multiple_bcs_mp_desert_cave_sniper", "cave_sniper" );
    _id_169E( "trigger_multiple_bcs_mp_desert_turret_destroyed", "turret_destroyed" );
    _id_169E( "trigger_multiple_bcs_mp_desert_panels_solar", "panels_solar" );
    _id_169E( "trigger_multiple_bcs_mp_desert_jackal_crashed", "jackal_crashed" );
    _id_169E( "trigger_multiple_bcs_mp_desert_window_generic", "window_generic" );
    _id_169E( "trigger_multiple_bcs_mp_desert_wall_run", "wall_run" );
    _id_169E( "trigger_multiple_bcs_mp_desert_engine_giant", "engine_giant" );
    _id_169E( "trigger_multiple_bcs_mp_desert_hallway_ship", "hallway_ship" );
    _id_169E( "trigger_multiple_bcs_mp_desert_cargobay_generic", "cargobay_generic" );
    _id_169E( "trigger_multiple_bcs_mp_desert_screen_generic", "screen_generic" );
    _id_169E( "trigger_multiple_bcs_mp_desert_stairs_generic", "stairs_generic" );
    _id_169E( "trigger_multiple_bcs_mp_desert_area_yard", "area_yard" );
}

divide()
{
    _id_169E( "trigger_multiple_bcs_mp_divide_building_cargohangar", "building_cargohangar" );
    _id_169E( "trigger_multiple_bcs_mp_divide_controls_hangar", "controls_hangar" );
    _id_169E( "trigger_multiple_bcs_mp_divide_room_drillcontrol", "room_drillcontrol" );
    _id_169E( "trigger_multiple_bcs_mp_divide_deck_observation", "deck_observation" );
    _id_169E( "trigger_multiple_bcs_mp_divide_room_lockerroom", "room_lockerroom" );
    _id_169E( "trigger_multiple_bcs_mp_divide_turbine_generic", "turbine_generic" );
    _id_169E( "trigger_multiple_bcs_mp_divide_lava_pipe", "lava_pipe" );
    _id_169E( "trigger_multiple_bcs_mp_divide_building_processing", "building_processing" );
    _id_169E( "trigger_multiple_bcs_mp_divide_skybridge_generic", "skybridge_generic" );
    _id_169E( "trigger_multiple_bcs_mp_divide_drill_generic", "drill_generic" );
    _id_169E( "trigger_multiple_bcs_mp_divide_wallrun_digsite", "wallrun_digsite" );
    _id_169E( "trigger_multiple_bcs_mp_divide_building_shiphang", "building_shiphang" );
}

_id_6B6E()
{
    _id_169E( "trigger_multiple_bcs_mp_fallen_shop_icecream", "shop_icecream" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_movietheater_generic", "movietheater_generic" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_store_hardware", "store_hardware" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_church_generic", "church_generic" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_mainstreet_generic", "mainstreet_generic" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_mainstreet_underpass", "mainstreet_underpass" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_bowlingalley_generic", "bowlingalley_generic" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_policestation_generic", "policestation_generic" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_field_baseball", "field_baseball" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_fieldhouse_generic", "fieldhouse_generic" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_station", "station" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_station_ticketcounter", "station_ticketcounter" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_station_departures", "station_departures" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_station_foodcourt", "station_foodcourt" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_station_arrivals", "station_arrivals" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_silo_generic", "silo_generic" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_greenhouse_generic", "greenhouse_generic" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_farmersmarket_generic", "farmersmarket_generic" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_farmhouse_generic", "farmhouse_generic" );
    _id_169E( "trigger_multiple_bcs_mp_fallen_barn_generic", "barn_generic" );
}

frontier()
{
    _id_169E( "trigger_multiple_bcs_mp_frontier_room_briefing", "room_briefing" );
    _id_169E( "trigger_multiple_bcs_mp_frontier_room_bunk", "room_bunk" );
    _id_169E( "trigger_multiple_bcs_mp_frontier_room_command", "room_command" );
    _id_169E( "trigger_multiple_bcs_mp_frontier_pods_escape", "pods_escape" );
    _id_169E( "trigger_multiple_bcs_mp_frontier_lounge_generic", "lounge_generic" );
    _id_169E( "trigger_multiple_bcs_mp_frontier_hallway_lower", "hallway_lower" );
    _id_169E( "trigger_multiple_bcs_mp_frontier_room_medbay", "room_medbay" );
    _id_169E( "trigger_multiple_bcs_mp_frontier_hall_mess", "hall_mess" );
    _id_169E( "trigger_multiple_bcs_mp_frontier_lab_hydro", "lab_hydro" );
    _id_169E( "trigger_multiple_bcs_mp_frontier_hallway_main", "hallway_main" );
    _id_169E( "trigger_multiple_bcs_mp_frontier_lift_yellow", "lift_yellow" );
    _id_169E( "trigger_multiple_bcs_mp_frontier_lift_blue", "lift_blue" );
    _id_169E( "trigger_multiple_bcs_mp_frontier_tunnel_service", "tunnel_service" );
    _id_169E( "trigger_multiple_bcs_mp_frontier_stairwell_generic", "stairwell_generic" );
    _id_169E( "trigger_multiple_bcs_mp_frontier_ramp_generic", "ramp_generic" );
    _id_169E( "trigger_multiple_bcs_mp_frontier_room_control", "room_control" );
}

parkour()
{
    _id_169E( "trigger_multiple_bcs_mp_parkour_watertank_generic", "helipad_generic" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_watertank_generic", "watertank_generic" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_whirlpool", "whirlpool" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_window_washroom", "window_washroom" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_vehicle_dropship", "vehicle_dropship" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_bodies_dead", "bodies_dead" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_room_barracks", "room_barracks" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_window_generic", "window_generic" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_crates_generic", "crates_generic" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_cave_generic", "cave_generic" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_cryo_prisoners", "cryo_prisoners" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_vehicle_truck", "vehicle_truck" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_room_shipping", "room_shipping" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_barrels_generic", "barrels_generic" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_roof_mid", "roof_mid" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_building_round", "building_round" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_room_wet", "room_wet" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_balcony_generic", "balcony_generic" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_wall_run", "wall_run" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_cellblock_generic", "cellblock_generic" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_building_medpod", "building_medpod" );
    _id_169E( "trigger_multiple_bcs_mp_parkour_window_medbay", "window_medbay" );
}

proto()
{
    _id_169E( "trigger_multiple_bcs_mp_proto_dock_loading", "dock_loading" );
    _id_169E( "trigger_multiple_bcs_mp_proto_room_security", "room_security" );
    _id_169E( "trigger_multiple_bcs_mp_proto_entrance_generic", "entrance_generic" );
    _id_169E( "trigger_multiple_bcs_mp_proto_bay_robot", "bay_robot" );
    _id_169E( "trigger_multiple_bcs_mp_proto_sub_launch", "sub_launch" );
    _id_169E( "trigger_multiple_bcs_mp_proto_pump_water", "pump_water" );
    _id_169E( "trigger_multiple_bcs_mp_proto_building_comms", "building_comms" );
    _id_169E( "trigger_multiple_bcs_mp_proto_blocks_ice", "catwalk_generic" );
    _id_169E( "trigger_multiple_bcs_mp_proto_blocks_ice", "blocks_ice" );
    _id_169E( "trigger_multiple_bcs_mp_proto_area_construction", "area_construction" );
    _id_169E( "trigger_multiple_bcs_mp_proto_jackal_control", "jackal_control" );
    _id_169E( "trigger_multiple_bcs_mp_proto_crate_stack", "crate_stack" );
    _id_169E( "trigger_multiple_bcs_mp_proto_grinder_ice", "grinder_ice" );
}

riot()
{
    _id_169E( "trigger_multiple_bcs_mp_riot_building_church", "building_church" );
    _id_169E( "trigger_multiple_bcs_mp_riot_wall_destroyed", "wall_destroyed" );
    _id_169E( "trigger_multiple_bcs_mp_riot_courtyard_generic", "courtyard_generic" );
    _id_169E( "trigger_multiple_bcs_mp_riot_garden_beer", "garden_beer" );
    _id_169E( "trigger_multiple_bcs_mp_riot_statue_generic", "statue_generic" );
    _id_169E( "trigger_multiple_bcs_mp_riot_stairs_archway", "stairs_archway" );
    _id_169E( "trigger_multiple_bcs_mp_riot_bikeshop_interior", "bikeshop_interior" );
    _id_169E( "trigger_multiple_bcs_mp_riot_scaffolding_generic", "scaffolding_generic" );
    _id_169E( "trigger_multiple_bcs_mp_riot_vehicle_apc", "vehicle_apc" );
    _id_169E( "trigger_multiple_bcs_mp_riot_vehicle_sailboat", "vehicle_sailboat" );
    _id_169E( "trigger_multiple_bcs_mp_riot_building_castle", "building_castle" );
    _id_169E( "trigger_multiple_bcs_mp_riot_vehicle_bus", "vehicle_bus" );
    _id_169E( "trigger_multiple_bcs_mp_riot_room_bar", "room_bar" );
    _id_169E( "trigger_multiple_bcs_mp_riot_hallway_generic", "hallway_generic" );
    _id_169E( "trigger_multiple_bcs_mp_riot_lobby_hotel", "lobby_hotel" );
    _id_169E( "trigger_multiple_bcs_mp_riot_room_hotel", "room_hotel" );
    _id_169E( "trigger_multiple_bcs_mp_riot_rooftop_generic", "rooftop_generic" );
    _id_169E( "trigger_multiple_bcs_mp_riot_vehicle_policecar", "vehicle_policecar" );
    _id_169E( "trigger_multiple_bcs_mp_riot_tunnel_generic", "tunnel_generic" );
    _id_169E( "trigger_multiple_bcs_mp_riot_docks_upper", "docks_upper" );
    _id_169E( "trigger_multiple_bcs_mp_riot_waterfront_generic", "waterfront_generic" );
}

rivet()
{
    _id_169E( "trigger_multiple_bcs_mp_rivet_dock_yellow", "dock_yellow" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_ship_bow", "ship_bow" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_dock_blue", "dock_blue" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_room_chemstorage", "room_chemstorage" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_area_hosing", "area_hosing" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_area_cleaning", "area_cleaning" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_path_center", "path_center" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_rocket_generic", "rocket_generic" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_loadingzone_generic", "loadingzone_generic" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_area_warehouseload", "area_warehouseload" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_rocket_engine", "rocket_engine" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_catwalk_yellow", "catwalk_yellow" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_airlock_generic", "airlock_generic" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_catwalk_blue", "catwalk_blue" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_hallway_west", "hallway_west" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_building_yellow", "building_yellow" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_building_fabrication", "building_fabrication" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_overlook_fabrication", "overlook_fabrication" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_building_blue", "building_blue" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_building_warehouse", "building_warehouse" );
    _id_169E( "trigger_multiple_bcs_mp_rivet_door_garage", "door_garage" );
}

skyway()
{
    _id_169E( "trigger_multiple_bcs_mp_skyway_area_checkpoint", "area_checkpoint" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_area_security", "area_security" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_area_luggagecheck", "area_luggagecheck" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_desk_desk", "desk_desk" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_tree_generic", "tree_generic" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_store_gift", "store_gift" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_store_book", "store_book" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_jetway_generic", "jetway_generic" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_corridor_generic", "corridor_generic" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_store_sushi", "store_sushi" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_area_dining", "area_dining" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_room_restroom", "room_restroom" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_fountain_generic", "fountain_generic" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_fountain_stairs", "fountain_stairs" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_vehicle_crane", "vehicle_crane" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_statue_astronaut", "statue_astronaut" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_stair_car", "stair_car" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_room_control", "room_control" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_turret_generic", "turret_generic" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_shuttle_ramp", "shuttle_ramp" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_shuttle_cockpit", "shuttle_cockpit" );
    _id_169E( "trigger_multiple_bcs_mp_skyway_tarmac_generic", "tarmac_generic" );
}

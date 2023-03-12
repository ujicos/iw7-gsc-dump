// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_29BB()
{
    if ( !isdefined( level._id_29B9 ) )
        level._id_29B9 = [];

    _id_29BA();
    _id_29C7();
    level._id_29B9 = undefined;
    anim._id_AECC = [];
}

_id_29C7()
{
    if ( !isdefined( anim._id_29BC ) )
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

    anim._id_29BC = scripts\engine\utility::_id_227F( anim._id_29BC, var_1 );
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
    geneva();
    neon();
    prime();
    afghan();
    _id_B2FD();
    flip();
    junk();
    marsoasis();
    nova();
    paris();
    pixel();
    overflow();
    hawkwar();
    rally();
    _id_5238();
    codphish();
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

geneva()
{
    _id_169E( "trigger_multiple_bcs_mp_geneva_masq_shop", "masq_shop" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_statue_plaza", "statue_plaza" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_well", "well" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_well_inside", "well_inside" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_restaurant_outside", "restaurant_outside" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_gelato_parlor", "gelato_parlor" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_fountain", "fountain" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_fruit_stand", "fruit_stand" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_monument", "monument" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_gandolas", "gandolas" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_bank_outside", "bank_outside" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_atms", "atms" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_church_inside", "church_inside" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_travelagency_wndw", "travelagency_wndw" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_travelagency_inside", "travelagency_inside" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_doubledoors", "doubledoors" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_boat", "informatioboatn_desk" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_canal_shop", "canal_shop" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_canal", "canal" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_garden", "garden" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_stairs", "stairs" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_newsstand", "newsstand" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_kiosk", "kiosk" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_lamppost", "lamppost" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_altar", "altar" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_candles", "candles" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_window", "window" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_tables", "tables" );
    _id_169E( "trigger_multiple_bcs_mp_geneva_arches", "arches" );
}

prime()
{
    _id_169E( "trigger_multiple_bcs_mp_prime_barbershop", "barbershop" );
    _id_169E( "trigger_multiple_bcs_mp_prime_market", "market" );
    _id_169E( "trigger_multiple_bcs_mp_prime_pharmacy_2ndflr", "pharmacy_2ndflr" );
    _id_169E( "trigger_multiple_bcs_mp_prime_statue_plaza", "statue_plaza" );
    _id_169E( "trigger_multiple_bcs_mp_prime_policestation_outside", "policestation_outside" );
    _id_169E( "trigger_multiple_bcs_mp_prime_subway_inside", "subway_inside" );
    _id_169E( "trigger_multiple_bcs_mp_prime_subway_outside", "subway_outside" );
    _id_169E( "trigger_multiple_bcs_mp_prime_bridge_under", "bridge_under" );
    _id_169E( "trigger_multiple_bcs_mp_prime_crane", "crane" );
    _id_169E( "trigger_multiple_bcs_mp_prime_plaza", "plaza" );
    _id_169E( "trigger_multiple_bcs_mp_prime_docks", "docks" );
    _id_169E( "trigger_multiple_bcs_mp_prime_store_2ndflr", "store_2ndflr" );
    _id_169E( "trigger_multiple_bcs_mp_prime_store_1stflr", "store_1stflr" );
    _id_169E( "trigger_multiple_bcs_mp_prime_firehouse_inside", "firehouse_inside" );
    _id_169E( "trigger_multiple_bcs_mp_prime_firehouse_outside", "firehouse_outside" );
    _id_169E( "trigger_multiple_bcs_mp_prime_diner_above", "diner_above" );
    _id_169E( "trigger_multiple_bcs_mp_prime_scaffolding", "scaffolding" );
    _id_169E( "trigger_multiple_bcs_mp_prime_fuelcans", "fuelcans" );
    _id_169E( "trigger_multiple_bcs_mp_prime_subway_tunnel", "subway_tunnel" );
}

neon()
{
    _id_169E( "trigger_multiple_bcs_mp_neon_theater", "theater" );
    _id_169E( "trigger_multiple_bcs_mp_neon_nightclub", "nightclub" );
    _id_169E( "trigger_multiple_bcs_mp_neon_parking_lot", "parking_lot" );
    _id_169E( "trigger_multiple_bcs_mp_neon_pharmacy", "pharmacy" );
    _id_169E( "trigger_multiple_bcs_mp_neon_hospital", "hospital" );
    _id_169E( "trigger_multiple_bcs_mp_neon_stairway", "stairway" );
    _id_169E( "trigger_multiple_bcs_mp_neon_canopy", "canopy" );
    _id_169E( "trigger_multiple_bcs_mp_neon_policestation_inside", "policestation_inside" );
    _id_169E( "trigger_multiple_bcs_mp_neon_policestation_balcony", "policestation_balcony" );
    _id_169E( "trigger_multiple_bcs_mp_neon_policestation_outside", "policestation_outside" );
    _id_169E( "trigger_multiple_bcs_mp_neon_cityhall_inside", "cityhall_inside" );
    _id_169E( "trigger_multiple_bcs_mp_neon_cityhall_outside", "cityhall_outside" );
    _id_169E( "trigger_multiple_bcs_mp_neon_bank_outside", "bank_outside" );
    _id_169E( "trigger_multiple_bcs_mp_neon_apts_2ndflr", "apts_2ndflr" );
    _id_169E( "trigger_multiple_bcs_mp_neon_apts_outside", "apts_outside" );
    _id_169E( "trigger_multiple_bcs_mp_neon_hotel_outside", "hotel_outside" );
    _id_169E( "trigger_multiple_bcs_mp_neon_market", "market" );
    _id_169E( "trigger_multiple_bcs_mp_neon_firetruck", "firetruck" );
    _id_169E( "trigger_multiple_bcs_mp_neon_ambulance", "ambulance" );
}

afghan()
{
    _id_169E( "trigger_multiple_bcs_mp_afghan_large_pipes", "large_pipes" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_hydroponics", "hydroponics" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_garden", "garden" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_control_room", "control_room" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_bunker", "bunker" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_servers", "servers" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_crash_site", "crash_site" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_cockpit", "cockpit" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_tail_section", "tail_section" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_generator", "generator" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_aaguns", "aaguns" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_overlook", "overlook" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_broken_stairs", "broken_stairs" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_satellite_dish", "satellite_dish" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_cavern", "cavern" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_atmogen", "atmogen" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_vehicle_ent", "vehicle_ent" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_vehicles", "vehicles" );
    _id_169E( "trigger_multiple_bcs_mp_afghan_pump_station", "pump_station" );
}

_id_B2FD()
{
    _id_169E( "trigger_multiple_bcs_mp_mansion_shark", "shark" );
    _id_169E( "trigger_multiple_bcs_mp_mansion_room_security", "room_security" );
    _id_169E( "trigger_multiple_bcs_mp_mansion_vases_antique", "vases_antique" );
    _id_169E( "trigger_multiple_bcs_mp_mansion_garden", "garden" );
    _id_169E( "trigger_multiple_bcs_mp_mansion_station_foodcourt", "station_foodcourt" );
    _id_169E( "trigger_multiple_bcs_mp_mansion_room_bathroom", "room_bathroom" );
    _id_169E( "trigger_multiple_bcs_mp_mansion_station_ticketcounter", "station_ticketcounter" );
    _id_169E( "trigger_multiple_bcs_mp_mansion_room_storage", "room_storage" );
    _id_169E( "trigger_multiple_bcs_mp_mansion_store_gift", "store_gift" );
    _id_169E( "trigger_multiple_bcs_mp_mansion_room_fist", "store_gift" );
    _id_169E( "trigger_multiple_bcs_mp_mansion_room_library", "room_library" );
    _id_169E( "trigger_multiple_bcs_mp_mansion_courtyard_generic", "courtyard_generic" );
}

flip()
{
    _id_169E( "trigger_multiple_bcs_mp_flip_docks", "docks" );
    _id_169E( "trigger_multiple_bcs_mp_flip_statue_head", "statue_head" );
    _id_169E( "trigger_multiple_bcs_mp_flip_penthouse", "penthouse" );
    _id_169E( "trigger_multiple_bcs_mp_flip_lobby_tower", "lobby_tower" );
    _id_169E( "trigger_multiple_bcs_mp_flip_car_gold", "car_gold" );
    _id_169E( "trigger_multiple_bcs_mp_flip_garden_rooftop", "garden_rooftop" );
    _id_169E( "trigger_multiple_bcs_mp_flip_tubes_generic", "tubes_generic" );
    _id_169E( "trigger_multiple_bcs_mp_flip_sign_building", "sign_building" );
    _id_169E( "trigger_multiple_bcs_mp_flip_elevator", "elevator" );
    _id_169E( "trigger_multiple_bcs_mp_flip_fan_ventilation", "fan_ventilation" );
    _id_169E( "trigger_multiple_bcs_mp_flip_control_docking", "control_docking" );
    _id_169E( "trigger_multiple_bcs_mp_flip_fountain_runner", "fountain_runner" );
    _id_169E( "trigger_multiple_bcs_mp_flip_fountain_2nd", "fountain_2nd" );
    _id_169E( "trigger_multiple_bcs_mp_flip_fountain_generic", "fountain_generic" );
    _id_169E( "trigger_multiple_bcs_mp_flip_statue_lion", "statue_lion" );
    _id_169E( "trigger_multiple_bcs_mp_flip_screen_generic", "screen_generic" );
}

junk()
{
    _id_169E( "trigger_multiple_bcs_mp_junk_crane_blue", "crane_blue" );
    _id_169E( "trigger_multiple_bcs_mp_junk_room_control", "room_control" );
    _id_169E( "trigger_multiple_bcs_mp_junk_fuselage_interior", "fuselage_interior" );
    _id_169E( "trigger_multiple_bcs_mp_junk_tunnel_generic", "tunnel_generic" );
    _id_169E( "trigger_multiple_bcs_mp_junk_crane_orange", "crane_orange" );
    _id_169E( "trigger_multiple_bcs_mp_junk_compactor_interior", "compactor_interior" );
    _id_169E( "trigger_multiple_bcs_mp_junk_compactor_wallrun", "compactor_wallrun" );
    _id_169E( "trigger_multiple_bcs_mp_junk_gate_front", "gate_front" );
    _id_169E( "trigger_multiple_bcs_mp_junk_room_security", "room_security" );
    _id_169E( "trigger_multiple_bcs_mp_junk_room_grindercontrol", "room_grindercontrol" );
    _id_169E( "trigger_multiple_bcs_mp_junk_quarters_crew", "quarters_crew" );
    _id_169E( "trigger_multiple_bcs_mp_junk_area_maintenance", "area_maintenance" );
    _id_169E( "trigger_multiple_bcs_mp_junk_comm_center", "comm_center" );
    _id_169E( "trigger_multiple_bcs_mp_junk_grinder_ice", "grinder_ice" );
    _id_169E( "trigger_multiple_bcs_mp_junk_magnet_scrap", "magnet_scrap" );
    _id_169E( "trigger_multiple_bcs_mp_junk_vehicle_mooncrawler", "vehicle_mooncrawler" );
    _id_169E( "trigger_multiple_bcs_mp_junk_vehicle_bulldozer", "vehicle_bulldozer" );
    _id_169E( "trigger_multiple_bcs_mp_junk_building_rotunda", "building_rotunda" );
    _id_169E( "trigger_multiple_bcs_mp_junk_pod_communication", "pod_communication" );
    _id_169E( "trigger_multiple_bcs_mp_junk_vehicle_dropship", "vehicle_dropship" );
    _id_169E( "trigger_multiple_bcs_mp_junk_tires_generic", "tires_generic" );
    _id_169E( "trigger_multiple_bcs_mp_junk_crane", "crane" );
}

marsoasis()
{
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_waterfall_generic", "waterfall_generic" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_truck_generic", "truck_generic" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_table_gaming", "table_gaming" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_building_casino", "building_casino" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_room_bar", "room_bar" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_slot_machine", "slot_machine" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_lounge_generic", "lounge_generic" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_overlook", "overlook" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_window_generic", "window_generic" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_shop_dive", "shop_dive" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_directory_generic", "directory_generic" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_desk_front", "desk_front" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_elevators_port", "elevators_port" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_aquarium_generic", "aquarium_generic" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_cliff_side", "cliff_side" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_spa_interior", "spa_interior" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_hot_springs", "hot_springs" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_pods_generic", "pods_generic" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_river_generic", "river_generic" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_hotel_entrance", "hotel_entrance" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_luggage_generic", "luggage_generic" );
    _id_169E( "trigger_multiple_bcs_mp_marsoasis_elevator", "elevator" );
}

nova()
{
    _id_169E( "trigger_multiple_bcs_mp_nova_lighthouse_generic", "lighthouse_generic" );
    _id_169E( "trigger_multiple_bcs_mp_nova_lighthouse_bridge", "lighthouse_bridge" );
    _id_169E( "trigger_multiple_bcs_mp_nova_beach_generic", "beach_generic" );
    _id_169E( "trigger_multiple_bcs_mp_nova_lumberyard_generic", "lumberyard_generic" );
    _id_169E( "trigger_multiple_bcs_mp_nova_market", "market" );
    _id_169E( "trigger_multiple_bcs_mp_nova_market_food", "market_food" );
    _id_169E( "trigger_multiple_bcs_mp_nova_market_square", "market_square" );
    _id_169E( "trigger_multiple_bcs_mp_nova_trading_post", "trading_post" );
    _id_169E( "trigger_multiple_bcs_mp_nova_downedship_generic", "downedship_generic" );
    _id_169E( "trigger_multiple_bcs_mp_nova_downedship_interior", "downedship_interior" );
    _id_169E( "trigger_multiple_bcs_mp_nova_residential_interior", "residential_interior" );
    _id_169E( "trigger_multiple_bcs_mp_nova_apartments_container", "apartments_container" );
    _id_169E( "trigger_multiple_bcs_mp_nova_outhouse_generic", "outhouse_generic" );
    _id_169E( "trigger_multiple_bcs_mp_nova_outhouse_generic", "room_engine" );
    _id_169E( "trigger_multiple_bcs_mp_nova_greenhouse_generic", "greenhouse_generic" );
    _id_169E( "trigger_multiple_bcs_mp_nova_hydroponics", "hydroponics" );
    _id_169E( "trigger_multiple_bcs_mp_nova_farm_generic", "farm_generic" );
    _id_169E( "trigger_multiple_bcs_mp_nova_restaurant_outside", "restaurant_outside" );
    _id_169E( "trigger_multiple_bcs_mp_nova_oil_spill", "oil_spill" );
    _id_169E( "trigger_multiple_bcs_mp_nova_oil_tanks", "oil_tanks" );
    _id_169E( "trigger_multiple_bcs_mp_nova_broiler_generic", "broiler_generic" );
    _id_169E( "trigger_multiple_bcs_mp_nova_pier_generic", "pier_generic" );
    _id_169E( "trigger_multiple_bcs_mp_nova_large_pipes", "large_pipes" );
    _id_169E( "trigger_multiple_bcs_mp_nova_sewer_wall", "sewer_wall" );
    _id_169E( "trigger_multiple_bcs_mp_nova_sewer_generic", "sewer_generic" );
    _id_169E( "trigger_multiple_bcs_mp_nova_pump_station", "pump_station" );
}

paris()
{
    _id_169E( "trigger_multiple_bcs_mp_paris_gallows_generic", "gallows_generic" );
    _id_169E( "trigger_multiple_bcs_mp_paris_waterwell_generic", "waterwell_generic" );
    _id_169E( "trigger_multiple_bcs_mp_paris_church_generic", "church_generic" );
    _id_169E( "trigger_multiple_bcs_mp_paris_building_church", "building_church" );
    _id_169E( "trigger_multiple_bcs_mp_paris_church_inside", "church_inside" );
    _id_169E( "trigger_multiple_bcs_mp_paris_tower_radio", "tower_radio" );
    _id_169E( "trigger_multiple_bcs_mp_paris_gazebo_generic", "gazebo_generic" );
    _id_169E( "trigger_multiple_bcs_mp_paris_tanks_water", "tanks_water" );
    _id_169E( "trigger_multiple_bcs_mp_paris_room_cellar", "room_cellar" );
    _id_169E( "trigger_multiple_bcs_mp_paris_gate_green", "gate_green" );
    _id_169E( "trigger_multiple_bcs_mp_paris_archway_generic", "archway_generic" );
    _id_169E( "trigger_multiple_bcs_mp_paris_sandbags_generic", "sandbags_generic" );
    _id_169E( "trigger_multiple_bcs_mp_paris_balcony_generic", "balcony_generic" );
    _id_169E( "trigger_multiple_bcs_mp_paris_wall_destroyed", "wall_destroyed" );
    _id_169E( "trigger_multiple_bcs_mp_paris_pile_log", "pile_log" );
    _id_169E( "trigger_multiple_bcs_mp_paris_wire_barbed", "wire_barbed" );
    _id_169E( "trigger_multiple_bcs_mp_paris_building_wrecked", "building_wrecked" );
    _id_169E( "trigger_multiple_bcs_mp_paris_building_jail", "building_jail" );
    _id_169E( "trigger_multiple_bcs_mp_paris_building_inn", "building_inn" );
    _id_169E( "trigger_multiple_bcs_mp_paris_building_lodge", "building_lodge" );
}

pixel()
{
    _id_169E( "trigger_multiple_bcs_mp_pixel_dragon_giant", "dragon_giant" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_skull_dino", "skull_dino" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_catapult_generic", "catapult_generic" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_range_archery", "range_archery" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_tents_generic", "tents_generic" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_forest_dark", "forest_dark" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_haystacks_generic", "haystacks_generic" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_building_windmill", "building_windmill" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_archway_castle", "archway_castle" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_stairs_castle", "stairs_castle" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_doorway_castle", "doorway_castle" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_obelisk_generic", "obelisk_generic" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_tomb_generic", "tomb_generic" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_fountain_generic", "fountain_generic" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_tiki_hut", "tiki_hut" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_statues_tiki", "statues_tiki" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_stairs_temple", "stairs_temple" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_arch_donut", "arch_donut" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_statue_icecreamcone", "statue_icecreamcone" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_station_foodcourt", "station_foodcourt" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_barrels_generic", "barrels_generic" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_window_office", "window_office" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_arcade_generic", "arcade_generic" );
    _id_169E( "trigger_multiple_bcs_mp_pixel_breakroom_generic", "breakroom_generic" );
}

overflow()
{
    _id_169E( "trigger_multiple_bcs_mp_overflow_breakroom_generic", "breakroom_generic" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_droppod_generic", "droppod_generic" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_building_droppod", "building_droppod" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_parkinglot", "parkinglot" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_backlot_generic", "backlot_generic" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_door_garage", "door_garage" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_cliff_side", "cliff_side" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_cliff_generic", "cliff_generic" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_alleyway_generic", "alleyway_generic" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_tunnel_generic", "tunnel_generic" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_street_collapsed", "street_collapsed" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_firetruck", "firetruck" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_vehicle_bus", "vehicle_bus" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_theater", "theater" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_theater_lobby", "theater_lobby" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_theater_entrance", "theater_entrance" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_murderscene_generic", "murderscene_generic" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_vehicle_dropship", "vehicle_dropship" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_shipwreck_generic", "shipwreck_generic" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_terrace_generic", "terrace_generic" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_hotdogstand_generic", "hotdogstand_generic" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_underpass_generic", "underpass_generic" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_window_generic", "window_generic" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_wall_run", "wall_run" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_room_bathroom", "room_bathroom" );
    _id_169E( "trigger_multiple_bcs_mp_overflow_elevators_port", "elevators_port" );
}

hawkwar()
{
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_antiques", "antiques" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_bar", "bar" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_icecream", "icecream" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_mill_outside", "mill_outside" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_postoffice_inside", "postoffice_inside" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_apartment_inside", "apartment_inside" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_headquarters", "headquarters" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_assembly_line", "assembly_line" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_firetruck", "firetruck" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_intersection", "intersection" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_alley", "alley" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_shops", "shops" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_roadwork", "roadwork" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_hardware", "hardware" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_watertower", "watertower" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_bakery", "bakery" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_maintenance_area", "maintenance_area" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_restoration", "restoration" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_encoding", "encoding" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_behavioral", "behavioral" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_parts", "parts" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_storage", "storage" );
    _id_169E( "trigger_multiple_bcs_mp_hawkwar_barbershop", "barbershop" );
}

_id_5238()
{
    _id_169E( "trigger_multiple_bcs_mp_depot_ship", "ship" );
    _id_169E( "trigger_multiple_bcs_mp_depot_warehouse", "warehouse" );
    _id_169E( "trigger_multiple_bcs_mp_depot_repairshop", "repairshop" );
    _id_169E( "trigger_multiple_bcs_mp_depot_restaurant_outside", "restaurant_outside" );
    _id_169E( "trigger_multiple_bcs_mp_depot_construction", "construction" );
    _id_169E( "trigger_multiple_bcs_mp_depot_market", "market" );
    _id_169E( "trigger_multiple_bcs_mp_depot_alley", "alley" );
    _id_169E( "trigger_multiple_bcs_mp_depot_garage_outside", "garage_outside" );
    _id_169E( "trigger_multiple_bcs_mp_depot_office", "office" );
    _id_169E( "trigger_multiple_bcs_mp_depot_pulley", "pulley" );
    _id_169E( "trigger_multiple_bcs_mp_depot_silos", "silos" );
    _id_169E( "trigger_multiple_bcs_mp_depot_trains", "trains" );
    _id_169E( "trigger_multiple_bcs_mp_depot_market_entrance", "market_entrance" );
    _id_169E( "trigger_multiple_bcs_mp_depot_monorail", "monorail" );
    _id_169E( "trigger_multiple_bcs_mp_depot_rooftop", "rooftop" );
    _id_169E( "trigger_multiple_bcs_mp_depot_mainstreet", "mainstreet" );
}

rally()
{
    _id_169E( "trigger_multiple_bcs_mp_rally_diner_outside", "diner_outside" );
    _id_169E( "trigger_multiple_bcs_mp_rally_gasstation", "gasstation" );
    _id_169E( "trigger_multiple_bcs_mp_rally_bleachers", "bleachers" );
    _id_169E( "trigger_multiple_bcs_mp_rally_stage", "stage" );
    _id_169E( "trigger_multiple_bcs_mp_rally_soundbooth", "soundbooth" );
    _id_169E( "trigger_multiple_bcs_mp_rally_snackshop", "snackshop" );
    _id_169E( "trigger_multiple_bcs_mp_rally_burninator", "burninator" );
    _id_169E( "trigger_multiple_bcs_mp_rally_bigtruck", "big_truck" );
    _id_169E( "trigger_multiple_bcs_mp_rally_bar", "bar" );
    _id_169E( "trigger_multiple_bcs_mp_rally_bridge", "bridge" );
    _id_169E( "trigger_multiple_bcs_mp_rally_junkyard", "junkyard" );
    _id_169E( "trigger_multiple_bcs_mp_rally_spillway", "spillway" );
    _id_169E( "trigger_multiple_bcs_mp_rally_pumproom", "pumproom" );
    _id_169E( "trigger_multiple_bcs_mp_rally_control_window", "control_window" );
    _id_169E( "trigger_multiple_bcs_mp_rally_riverbed", "riverbed" );
    _id_169E( "trigger_multiple_bcs_mp_rally_dam", "dam" );
    _id_169E( "trigger_multiple_bcs_mp_rally_office", "office" );
    _id_169E( "trigger_multiple_bcs_mp_rally_parkinglot", "parkinglot" );
    _id_169E( "trigger_multiple_bcs_mp_rally_cliffside", "cliffside" );
    _id_169E( "trigger_multiple_bcs_mp_rally_drain", "drain" );
    _id_169E( "trigger_multiple_bcs_mp_rally_trucks", "trucks" );
    _id_169E( "trigger_multiple_bcs_mp_rally_bus", "bus" );
    _id_169E( "trigger_multiple_bcs_mp_rally_van", "van" );
    _id_169E( "trigger_multiple_bcs_mp_rally_balcony", "balcony" );
    _id_169E( "trigger_multiple_bcs_mp_rally_fire", "fire" );
    _id_169E( "trigger_multiple_bcs_mp_rally_fence", "fence" );
}

codphish()
{
    _id_169E( "trigger_multiple_bcs_mp_codphish_cliffside", "cliffside" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_awning", "awning" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_terrace", "terrace" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_terrace", "terrace" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_valet", "valet" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_lobby", "lobby" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_lobby_entrance", "lobby_entrance" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_oaktree", "oaktree" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_cafe", "cafe" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_cafe_kiosk", "cafe_kiosk" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_waterfall_kiosk", "waterfall_kiosk" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_bridge", "bridge" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_lowerbridge", "lowerbridge" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_underpass", "underpass" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_waterfall", "waterfall" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_elevators", "elevators" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_monument", "monument" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_cinema", "cinema" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_observatory", "observatory" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_mannequins", "mannequins" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_turnstiles", "turnstiles" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_sushi_restaurant", "sushi_restaurant" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_nightclub_inside", "nightclub_inside" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_restrooms", "restrooms" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_apartments_inside", "apartments_inside" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_apartments_outside", "apartments_outside" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_gym", "gym" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_hallway", "hallway" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_vending_machines", "vending_machines" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_commonroom", "commonroom" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_stairs", "stairs" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_fountain", "fountain" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_balcony", "balcony" );
    _id_169E( "trigger_multiple_bcs_mp_codphish_restaurant_outside", "restaurant_outside" );
}

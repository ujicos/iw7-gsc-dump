// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_C73F = [];
    level._id_C73F["escort_airdrop"] = spawnstruct();
    level._id_C73F["escort_airdrop"].vehicle = "osprey_mp";
    level._id_C73F["escort_airdrop"]._id_B91A = "vehicle_v22_osprey_body_mp";
    level._id_C73F["escort_airdrop"]._id_B91B = "vehicle_v22_osprey_blades_mp";
    level._id_C73F["escort_airdrop"]._id_11415 = "tag_le_door_attach";
    level._id_C73F["escort_airdrop"]._id_11416 = "tag_ri_door_attach";
    level._id_C73F["escort_airdrop"]._id_113F0 = "tag_turret_attach";
    level._id_C73F["escort_airdrop"]._id_DA71 = &"KILLSTREAKS_DEFEND_AIRDROP_PACKAGES";
    level._id_C73F["escort_airdrop"].name = &"KILLSTREAKS_ESCORT_AIRDROP";
    level._id_C73F["escort_airdrop"]._id_039B = "osprey_minigun_mp";
    level._id_C73F["escort_airdrop"].helitype = "osprey";
    level._id_C73F["escort_airdrop"]._id_5EF1 = "airdrop_escort";
    level._id_C73F["escort_airdrop"].maxhealth = level._id_8D73 * 2;
    level._id_C73F["escort_airdrop"]._id_11901 = 60.0;
    level._id_C73F["osprey_gunner"] = spawnstruct();
    level._id_C73F["osprey_gunner"].vehicle = "osprey_player_mp";
    level._id_C73F["osprey_gunner"]._id_B91A = "vehicle_v22_osprey_body_mp";
    level._id_C73F["osprey_gunner"]._id_B91B = "vehicle_v22_osprey_blades_mp";
    level._id_C73F["osprey_gunner"]._id_11415 = "tag_le_door_attach";
    level._id_C73F["osprey_gunner"]._id_11416 = "tag_ri_door_attach";
    level._id_C73F["osprey_gunner"]._id_113F0 = "tag_turret_attach";
    level._id_C73F["osprey_gunner"]._id_DA71 = &"KILLSTREAKS_DEFEND_AIRDROP_PACKAGES";
    level._id_C73F["osprey_gunner"].name = &"KILLSTREAKS_OSPREY_GUNNER";
    level._id_C73F["osprey_gunner"]._id_039B = "osprey_player_minigun_mp";
    level._id_C73F["osprey_gunner"].helitype = "osprey_gunner";
    level._id_C73F["osprey_gunner"]._id_5EF1 = "airdrop_osprey_gunner";
    level._id_C73F["osprey_gunner"].maxhealth = level._id_8D73 * 2;
    level._id_C73F["osprey_gunner"]._id_11901 = 75.0;

    foreach ( var_1 in level._id_C73F )
    {
        level._id_3F19["explode"]["death"][var_1._id_B91A] = loadfx( "vfx/core/expl/helicopter_explosion_osprey" );
        level._id_3F19["explode"]["air_death"][var_1._id_B91A] = loadfx( "vfx/core/expl/helicopter_explosion_osprey_air_mp" );
        level._id_3F19["anim"]["blades_anim_up"][var_1._id_B91A] = loadfx( "vfx/props/osprey_blades_anim_up" );
        level._id_3F19["anim"]["blades_anim_down"][var_1._id_B91A] = loadfx( "vfx/props/osprey_blades_anim_down" );
        level._id_3F19["anim"]["blades_static_up"][var_1._id_B91A] = loadfx( "vfx/props/osprey_blades_up" );
        level._id_3F19["anim"]["blades_static_down"][var_1._id_B91A] = loadfx( "vfx/props/osprey_blades_default" );
        level._id_3F19["anim"]["hatch_left_static_up"][var_1._id_B91A] = loadfx( "vfx/props/osprey_bottom_door_left_default" );
        level._id_3F19["anim"]["hatch_left_anim_down"][var_1._id_B91A] = loadfx( "vfx/props/osprey_bottom_door_left_anim_open" );
        level._id_3F19["anim"]["hatch_left_static_down"][var_1._id_B91A] = loadfx( "vfx/props/osprey_bottom_door_left_up" );
        level._id_3F19["anim"]["hatch_left_anim_up"][var_1._id_B91A] = loadfx( "vfx/props/osprey_bottom_door_left_anim_close" );
        level._id_3F19["anim"]["hatch_right_static_up"][var_1._id_B91A] = loadfx( "vfx/props/osprey_bottom_door_right_default" );
        level._id_3F19["anim"]["hatch_right_anim_down"][var_1._id_B91A] = loadfx( "vfx/props/osprey_bottom_door_right_anim_open" );
        level._id_3F19["anim"]["hatch_right_static_down"][var_1._id_B91A] = loadfx( "vfx/props/osprey_bottom_door_right_up" );
        level._id_3F19["anim"]["hatch_right_anim_up"][var_1._id_B91A] = loadfx( "vfx/props/osprey_bottom_door_right_anim_close" );
    }

    level._id_1A6F = [];
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "escort_airdrop", ::_id_128E4 );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "osprey_gunner", ::_id_128F3 );
}

_id_128E4( var_0, var_1 )
{
    var_2 = 1;

    if ( isdefined( level._id_3F14 ) )
    {
        self iprintlnbold( &"KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }

    if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + var_2 >= scripts\mp\utility\game::_id_B4D2() )
    {
        self iprintlnbold( &"KILLSTREAKS_TOO_MANY_VEHICLES" );
        return 0;
    }

    if ( scripts\mp\utility\game::_id_9E68() )
        return 0;

    scripts\mp\utility\game::_id_93FA();
    return 1;
}

_id_128F3( var_0, var_1 )
{
    var_2 = 1;

    if ( isdefined( level._id_3F14 ) )
    {
        self iprintlnbold( &"KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }

    if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + var_2 >= scripts\mp\utility\game::_id_B4D2() )
    {
        self iprintlnbold( &"KILLSTREAKS_TOO_MANY_VEHICLES" );
        return 0;
    }

    scripts\mp\utility\game::_id_93FA();
    var_4 = _id_F1AD( var_0, "osprey_gunner", "compass_objpoint_osprey_friendly", "compass_objpoint_osprey_enemy", &"KILLSTREAKS_SELECT_MOBILE_MORTAR_LOCATION" );

    if ( !isdefined( var_4 ) || !var_4 )
    {
        scripts\mp\utility\game::_id_4FC1();
        return 0;
    }

    scripts\mp\matchdata::_id_AFC9( "osprey_gunner", self.origin );
    return 1;
}

_id_6CE4( var_0, var_1, var_2, var_3 )
{
    self notify( "used" );
    var_4 = ( 0, var_2, 0 );
    var_5 = 12000;
    var_6 = getent( "airstrikeheight", "targetname" );
    var_7 = var_6.origin[2];
    var_8 = level._id_8D96[randomint( level._id_8D96.size )];
    var_9 = var_8.origin;
    var_10 = ( var_1[0], var_1[1], var_7 );
    var_11 = var_1 + anglestoforward( var_4 ) * var_5;
    var_12 = vectortoangles( var_10 - var_9 );
    var_13 = var_1;
    var_1 = ( var_1[0], var_1[1], var_7 );
    var_14 = _id_4983( self, var_0, var_9, var_12, var_1, var_3 );
    var_9 = var_8;
    _id_130E3( var_0, var_14, var_9, var_10, var_11, var_7, var_13 );
}

_id_6CDF( var_0, var_1, var_2, var_3 )
{
    self notify( "used" );
    var_4 = ( 0, var_2, 0 );
    var_5 = 12000;
    var_6 = getent( "airstrikeheight", "targetname" );
    var_7 = var_6.origin[2];
    var_8 = level._id_8D96[randomint( level._id_8D96.size )];
    var_9 = var_8.origin;
    var_10 = ( var_1[0], var_1[1], var_7 );
    var_11 = var_1 + anglestoforward( var_4 ) * var_5;
    var_12 = vectortoangles( var_10 - var_9 );
    var_1 = ( var_1[0], var_1[1], var_7 );
    var_13 = _id_4983( self, var_0, var_9, var_12, var_1, var_3 );
    var_9 = var_8;
    _id_130B6( var_0, var_13, var_9, var_10, var_11, var_7 );
}

_id_11089()
{
    self waittill( "stop_location_selection", var_0 );

    switch ( var_0 )
    {
        case "emp":
        case "weapon_change":
        case "cancel_location":
        case "disconnect":
        case "death":
            self notify( "customCancelLocation" );
            break;
    }
}

_id_F1AD( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "customCancelLocation" );
    var_5 = undefined;
    var_6 = level._id_B339 / 6.46875;

    if ( level._id_10A56 )
        var_6 *= 1.5;

    scripts\mp\utility\game::_id_1197( var_1, "map_artillery_selector", 0, 500 );
    thread _id_11089();
    self waittill( "confirm_location", var_7, var_8 );
    scripts\mp\utility\game::_id_11079( 0 );
    scripts\mp\utility\game::_id_FB09( var_1 );
    var_9 = scripts\mp\killstreaks\killstreaks::_id_98C2( var_1 );

    if ( var_9 != "success" )
    {
        if ( var_9 != "disconnect" )
            scripts\mp\utility\game::_id_41E9();

        return 0;
    }

    if ( isdefined( level._id_3F14 ) )
    {
        scripts\mp\utility\game::_id_41E9();
        self iprintlnbold( &"KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }
    else if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA >= scripts\mp\utility\game::_id_B4D2() )
    {
        scripts\mp\utility\game::_id_41E9();
        self iprintlnbold( &"KILLSTREAKS_TOO_MANY_VEHICLES" );
        return 0;
    }

    thread _id_6CDF( var_0, var_7, var_8, var_1 );
    return 1;
}

_id_1012E( var_0, var_1, var_2, var_3 )
{
    var_4 = scripts\mp\hud_util::_id_49B2( "bigfixed", 0.5 );
    var_4 scripts\mp\hud_util::_id_F801( "CENTER", "CENTER", 0, -150 );
    var_4 _meth_834D( var_2 );
    self._id_AECD = [];

    for ( var_5 = 0; var_5 < var_3; var_5++ )
    {
        self._id_AECD[var_5] = scripts\mp\objidpoolmanager::requestminimapid( 1 );

        if ( self._id_AECD[var_5] != -1 )
        {
            scripts\mp\objidpoolmanager::minimap_objective_add( self._id_AECD[var_5], "invisible", ( 0, 0, 0 ) );
            scripts\mp\objidpoolmanager::minimap_objective_position( self._id_AECD[var_5], level._id_1A6F[level.script][var_5]["origin"] );
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_AECD[var_5], "active" );
            scripts\mp\objidpoolmanager::minimap_objective_player( self._id_AECD[var_5], self getentitynumber() );

            if ( level._id_1A6F[level.script][var_5]["in_use"] == 1 )
            {
                scripts\mp\objidpoolmanager::minimap_objective_icon( self._id_AECD[var_5], var_1 );
                continue;
            }

            scripts\mp\objidpoolmanager::minimap_objective_icon( self._id_AECD[var_5], var_0 );
        }
    }

    scripts\engine\utility::waittill_any( "cancel_location", "picked_location", "stop_location_selection" );
    var_4 scripts\mp\hud_util::_id_52DC();

    for ( var_5 = 0; var_5 < var_3; var_5++ )
        scripts\mp\objidpoolmanager::returnminimapid( self._id_AECD[var_5] );
}

_id_4983( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnhelicopter( var_0, var_2, var_3, level._id_C73F[var_5].vehicle, level._id_C73F[var_5]._id_B91A );

    if ( !isdefined( var_6 ) )
        return undefined;

    var_6._id_C740 = var_5;
    var_6._id_8DA0 = level._id_C73F[var_5]._id_B91A;
    var_6.helitype = level._id_C73F[var_5].helitype;
    var_6._id_2550 = missile_createattractorent( var_6, level._id_8D2E, level._id_8D2D );
    var_6._id_AC68 = var_1;
    var_6.team = var_0.pers["team"];
    var_6.pers["team"] = var_0.pers["team"];
    var_6.owner = var_0;
    var_6 _meth_831F( var_0 );
    var_6.maxhealth = level._id_C73F[var_5].maxhealth;
    var_6._id_13F0A = ( 0, 0, 0 );
    var_6._id_11568 = level._id_8D9A;
    var_6._id_D8DF = undefined;
    var_6._id_F0C3 = undefined;
    var_6.attacker = undefined;
    var_6._id_4C07 = "ok";
    var_6._id_5EF1 = level._id_C73F[var_5]._id_5EF1;
    var_6 scripts\mp\sentientpoolmanager::registersentient( "Killstreak_Air", var_0 );
    level._id_3F14 = var_6;
    var_6 scripts\mp\killstreaks\helicopter::_id_184E();
    var_6 thread _id_0D9B::_id_6EAD( 2 );
    var_6 thread scripts\mp\killstreaks\helicopter::_id_8D69( var_0 );
    var_6 thread scripts\mp\killstreaks\helicopter::_id_8D68( var_0 );
    var_6 thread scripts\mp\killstreaks\helicopter::_id_8D6A( var_0 );
    var_7 = level._id_C73F[var_5]._id_11901;
    var_6 thread scripts\mp\killstreaks\helicopter::_id_8D6D( var_7 );
    var_6 thread scripts\mp\killstreaks\helicopter::_id_8D40( var_5, 0 );
    var_6 thread scripts\mp\killstreaks\helicopter::_id_8D61();
    var_6 thread scripts\mp\killstreaks\helicopter::_id_8D49();
    var_6 thread _id_1AE8();
    var_6 thread _id_1AEA();

    if ( var_5 == "escort_airdrop" )
    {
        var_8 = var_6.origin + ( anglestoforward( var_6.angles ) * -200 + anglestoright( var_6.angles ) * -200 ) + ( 0, 0, 200 );
        var_6._id_A63A = spawn( "script_model", var_8 );
        var_6._id_A63A setscriptmoverkillcam( "explosive" );
        var_6._id_A63A linkto( var_6, "tag_origin" );
    }

    return var_6;
}

_id_1AE8()
{
    self endon( "death" );
    wait 0.05;
    playfxontag( level._id_3F19["light"]["tail"], self, "tag_light_tail" );
    wait 0.05;
    playfxontag( level._id_3F19["light"]["belly"], self, "tag_light_belly" );
    wait 0.05;
    playfxontag( level._id_3F19["anim"]["blades_static_down"][level._id_C73F[self._id_C740]._id_B91A], self, "TAG_BLADES_ATTACH" );
    wait 0.05;
    playfxontag( level._id_3F19["anim"]["hatch_left_static_up"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11415 );
    wait 0.05;
    playfxontag( level._id_3F19["anim"]["hatch_right_static_up"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11416 );
}

_id_1AEA()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        thread _id_1AE9( var_0 );
    }
}

_id_1AE9( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    wait 0.05;
    playfxontagforclients( level._id_3F19["light"]["tail"], self, "tag_light_tail", var_0 );
    wait 0.05;
    playfxontagforclients( level._id_3F19["light"]["belly"], self, "tag_light_belly", var_0 );

    if ( isdefined( self._id_DA9F ) )
    {
        if ( self._id_DA9F == "up" )
        {
            wait 0.05;
            playfxontagforclients( level._id_3F19["anim"]["blades_static_up"][level._id_C73F[self._id_C740]._id_B91A], self, "TAG_BLADES_ATTACH", var_0 );
        }
        else
        {
            wait 0.05;
            playfxontagforclients( level._id_3F19["anim"]["blades_static_down"][level._id_C73F[self._id_C740]._id_B91A], self, "TAG_BLADES_ATTACH", var_0 );
        }
    }
    else
    {
        wait 0.05;
        playfxontagforclients( level._id_3F19["anim"]["blades_static_down"][level._id_C73F[self._id_C740]._id_B91A], self, "TAG_BLADES_ATTACH", var_0 );
    }

    if ( isdefined( self._id_8C42 ) )
    {
        if ( self._id_8C42 == "down" )
        {
            wait 0.05;
            playfxontagforclients( level._id_3F19["anim"]["hatch_left_static_down"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11415, var_0 );
            wait 0.05;
            playfxontagforclients( level._id_3F19["anim"]["hatch_right_static_down"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11416, var_0 );
        }
        else
        {
            wait 0.05;
            playfxontagforclients( level._id_3F19["anim"]["hatch_left_static_up"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11415, var_0 );
            wait 0.05;
            playfxontagforclients( level._id_3F19["anim"]["hatch_right_static_up"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11416, var_0 );
        }
    }
    else
    {
        wait 0.05;
        playfxontagforclients( level._id_3F19["anim"]["hatch_left_static_up"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11415, var_0 );
        wait 0.05;
        playfxontagforclients( level._id_3F19["anim"]["hatch_right_static_up"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11416, var_0 );
    }
}

_id_130E3( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_1 thread _id_1AE6( self, var_2, var_3, var_4, var_5, var_6 );
}

_id_130B6( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    thread _id_E4F8( var_0, var_1 );
    var_1 thread _id_1AE7( self, var_2, var_3, var_4, var_5 );
}

_id_E4F8( var_0, var_1 )
{
    self endon( "disconnect" );
    var_1 endon( "helicopter_done" );
    thread scripts\mp\utility\game::_id_115DE( "used_osprey_gunner", self );
    scripts\mp\utility\game::_id_12C6( "heli_remote_mp" );
    scripts\mp\utility\game::_id_141A( "heli_remote_mp" );

    if ( getdvarint( "camera_thirdPerson" ) )
        scripts\mp\utility\game::_id_F887( 0 );

    var_1 _meth_83ED( self );
    self _meth_823E( var_1, "tag_player", 1.0, 0, 0, 0, 0, 1 );
    self setplayerangles( var_1 gettagangles( "tag_player" ) );
    var_1 thread scripts\mp\killstreaks\helicopter::_id_8D99();
    var_1._id_8712 = self;
    self._id_8DD2 = var_0;
    thread _id_6381( var_1 );
    thread _id_13714( 1.0, var_1 );
    thread scripts\mp\utility\game::_id_DF2E( var_1 );

    for (;;)
    {
        var_1 waittill( "turret_fire" );
        var_1 fireweapon();
        earthquake( 0.2, 1, var_1.origin, 1000 );
    }
}

_id_13714( var_0, var_1 )
{
    self endon( "disconnect" );
    var_1 endon( "death" );
    var_1 endon( "helicopter_done" );
    var_1 endon( "crashing" );
    var_1 endon( "leaving" );
    wait( var_0 );
    self _meth_8401( level._id_1537._id_65D1, 0 );
    self._id_AA42 = level._id_1537._id_65D1;
    self _meth_83C0();
    self _meth_83BE();
}

_id_1011E( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "helicopter_done" );
    self._id_6741 = scripts\mp\hud_util::_id_49B2( "bigfixed", 1.5 );
    self._id_6741 scripts\mp\hud_util::_id_F801( "CENTER", "CENTER", 0, -150 );
    self._id_6741 _meth_834D( level._id_C73F[var_0._id_C740]._id_DA71 );
    wait 6;

    if ( isdefined( self._id_6741 ) )
        self._id_6741 scripts\mp\hud_util::_id_52DC();
}

_id_1AEE()
{
    self endon( "crashing" );
    self endon( "death" );
    stopfxontag( level._id_3F19["anim"]["blades_static_down"][level._id_C73F[self._id_C740]._id_B91A], self, "TAG_BLADES_ATTACH" );
    playfxontag( level._id_3F19["anim"]["blades_anim_up"][level._id_C73F[self._id_C740]._id_B91A], self, "TAG_BLADES_ATTACH" );
    wait 1.0;

    if ( isdefined( self ) )
    {
        playfxontag( level._id_3F19["anim"]["blades_static_up"][level._id_C73F[self._id_C740]._id_B91A], self, "TAG_BLADES_ATTACH" );
        self._id_DA9F = "up";
    }
}

_id_1AED()
{
    self endon( "crashing" );
    self endon( "death" );
    stopfxontag( level._id_3F19["anim"]["blades_static_up"][level._id_C73F[self._id_C740]._id_B91A], self, "TAG_BLADES_ATTACH" );
    playfxontag( level._id_3F19["anim"]["blades_anim_down"][level._id_C73F[self._id_C740]._id_B91A], self, "TAG_BLADES_ATTACH" );
    wait 1.0;

    if ( isdefined( self ) )
    {
        playfxontag( level._id_3F19["anim"]["blades_static_down"][level._id_C73F[self._id_C740]._id_B91A], self, "TAG_BLADES_ATTACH" );
        self._id_DA9F = "down";
    }
}

_id_1AEC()
{
    self endon( "crashing" );
    self endon( "death" );
    stopfxontag( level._id_3F19["anim"]["hatch_left_static_down"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11415 );
    playfxontag( level._id_3F19["anim"]["hatch_left_anim_up"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11415 );
    stopfxontag( level._id_3F19["anim"]["hatch_right_static_down"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11416 );
    playfxontag( level._id_3F19["anim"]["hatch_right_anim_up"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11416 );
    wait 1.0;

    if ( isdefined( self ) )
    {
        playfxontag( level._id_3F19["anim"]["hatch_left_static_up"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11415 );
        playfxontag( level._id_3F19["anim"]["hatch_right_static_up"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11416 );
        self._id_8C42 = "up";
    }
}

_id_1AEB()
{
    self endon( "crashing" );
    self endon( "death" );
    stopfxontag( level._id_3F19["anim"]["hatch_left_static_up"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11415 );
    playfxontag( level._id_3F19["anim"]["hatch_left_anim_down"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11415 );
    stopfxontag( level._id_3F19["anim"]["hatch_right_static_up"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11416 );
    playfxontag( level._id_3F19["anim"]["hatch_right_anim_down"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11416 );
    wait 1.0;

    if ( isdefined( self ) )
    {
        playfxontag( level._id_3F19["anim"]["hatch_left_static_down"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11415 );
        playfxontag( level._id_3F19["anim"]["hatch_right_static_down"][level._id_C73F[self._id_C740]._id_B91A], self, level._id_C73F[self._id_C740]._id_11416 );
        self._id_8C42 = "down";
    }

    self notify( "hatch_down" );
}

_id_7DFC( var_0 )
{
    self endon( "helicopter_removed" );
    self endon( "heightReturned" );
    var_1 = getent( "airstrikeheight", "targetname" );

    if ( isdefined( var_1 ) )
        var_2 = var_1.origin[2];
    else if ( isdefined( level._id_1AF8 ) )
        var_2 = 850 * level._id_1AF8;
    else
        var_2 = 850;

    self._id_2A95 = var_2;
    var_3 = 200;
    var_4 = 0;
    var_5 = 0;

    for ( var_6 = 0; var_6 < 125; var_6++ )
    {
        wait 0.05;
        var_7 = var_6 % 8;
        var_8 = var_6 * 3;

        switch ( var_7 )
        {
            case 0:
                var_4 = var_8;
                var_5 = var_8;
                break;
            case 1:
                var_4 = var_8 * -1;
                var_5 = var_8 * -1;
                break;
            case 2:
                var_4 = var_8 * -1;
                var_5 = var_8;
                break;
            case 3:
                var_4 = var_8;
                var_5 = var_8 * -1;
                break;
            case 4:
                var_4 = 0;
                var_5 = var_8 * -1;
                break;
            case 5:
                var_4 = var_8 * -1;
                var_5 = 0;
                break;
            case 6:
                var_4 = var_8;
                var_5 = 0;
                break;
            case 7:
                var_4 = 0;
                var_5 = var_8;
                break;
            default:
                break;
        }

        var_9 = bullettrace( var_0 + ( var_4, var_5, 1000 ), var_0 + ( var_4, var_5, -10000 ), 1, self );

        if ( var_9["position"][2] > var_3 )
            var_3 = var_9["position"][2];
    }

    self._id_2A95 = var_3 + 300;

    switch ( getdvar( "mapname" ) )
    {
        case "mp_morningwood":
            self._id_2A95 += 600;
            break;
        case "mp_overwatch":
            var_10 = level._id_108FB;
            var_11 = var_10[0];
            var_12 = var_10[0];

            foreach ( var_14 in var_10 )
            {
                if ( var_14.origin[2] < var_11.origin[2] )
                    var_11 = var_14;

                if ( var_14.origin[2] > var_12.origin[2] )
                    var_12 = var_14;
            }

            if ( var_3 < var_11.origin[2] - 100 )
                self._id_2A95 = var_12.origin[2] + 900;

            break;
    }
}

_id_1AE6( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self notify( "airshipFlyDefense" );
    self endon( "airshipFlyDefense" );
    self endon( "helicopter_removed" );
    self endon( "death" );
    self endon( "leaving" );
    thread _id_7DFC( var_2 );
    scripts\mp\killstreaks\helicopter::_id_8D53( var_1 );
    self._id_C96C = var_2;
    var_6 = self.angles;
    self setyawspeed( 30, 30, 30, 0.3 );
    var_7 = self.origin;
    var_8 = self.angles[1];
    var_9 = self.angles[0];
    self._id_11901 = level._id_C73F[self._id_C740]._id_11901;
    self setvehgoalpos( var_2, 1 );
    var_10 = gettime();
    self waittill( "goal" );
    var_11 = ( gettime() - var_10 ) * 0.001;
    self._id_11901 -= var_11;
    thread _id_1AEE();
    var_12 = var_2 * ( 1, 1, 0 );
    var_12 += ( 0, 0, self._id_2A95 );
    self vehicle_setspeed( 25, 10, 10 );
    self setyawspeed( 20, 10, 10, 0.3 );
    self setvehgoalpos( var_12, 1 );
    var_10 = gettime();
    self waittill( "goal" );
    var_11 = ( gettime() - var_10 ) * 0.001;
    self._id_11901 -= var_11;
    self sethoverparams( 65, 50, 50 );
    _id_C73E( 1, level._id_C73F[self._id_C740]._id_113F0, var_12 );
    thread _id_A663( var_5 );

    if ( isdefined( var_0 ) )
        var_0 scripts\engine\utility::_id_13736( self._id_11901, "disconnect" );

    self waittill( "leaving" );
    self notify( "osprey_leaving" );
    thread _id_1AED();
}

_id_13589( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    wait( var_0 );
    self delete();
}

_id_A663( var_0 )
{
    self endon( "osprey_leaving" );
    self endon( "helicopter_removed" );
    self endon( "death" );
    var_1 = var_0;

    for (;;)
    {
        foreach ( var_3 in level.players )
        {
            wait 0.05;

            if ( !isdefined( self ) )
                return;

            if ( !isdefined( var_3 ) )
                continue;

            if ( !scripts\mp\utility\game::isreallyalive( var_3 ) )
                continue;

            if ( !self.owner scripts\mp\utility\game::isenemy( var_3 ) )
                continue;

            if ( var_3 scripts\mp\utility\game::_id_12D6( "specialty_blindeye" ) )
                continue;

            if ( distancesquared( var_1, var_3.origin ) > 500000 )
                continue;

            thread _id_1B01( var_3, var_1 );
            _id_136B2();
        }
    }
}

_id_1B01( var_0, var_1 )
{
    self notify( "aiShootPlayer" );
    self endon( "aiShootPlayer" );
    self endon( "helicopter_removed" );
    self endon( "leaving" );
    var_0 endon( "death" );
    self setturrettargetent( var_0 );
    self setlookatent( var_0 );
    thread _id_1155A( var_0 );
    var_2 = 6;
    var_3 = 2;

    for (;;)
    {
        var_2--;
        self fireweapon( "tag_flash", var_0 );
        wait 0.15;

        if ( var_2 <= 0 )
        {
            var_3--;
            var_2 = 6;

            if ( distancesquared( var_0.origin, var_1 ) > 500000 || var_3 <= 0 || !scripts\mp\utility\game::isreallyalive( var_0 ) )
            {
                self notify( "abandon_target" );
                return;
            }

            wait 1;
        }
    }
}

_id_1155A( var_0 )
{
    self endon( "abandon_target" );
    self endon( "leaving" );
    self endon( "helicopter_removed" );
    var_0 waittill( "death" );
    self notify( "target_killed" );
}

_id_136B2()
{
    self endon( "helicopter_removed" );
    self endon( "leaving" );
    self endon( "target_killed" );
    self endon( "abandon_target" );

    for (;;)
        wait 0.05;
}

_id_1AE7( var_0, var_1, var_2, var_3, var_4 )
{
    self notify( "airshipFlyGunner" );
    self endon( "airshipFlyGunner" );
    self endon( "helicopter_removed" );
    self endon( "death" );
    self endon( "leaving" );
    thread _id_7DFC( var_2 );
    scripts\mp\killstreaks\helicopter::_id_8D53( var_1 );
    thread scripts\mp\killstreaks\helicopter::_id_8D6D( level._id_C73F[self._id_C740]._id_11901 );
    var_5 = self.angles;
    self setyawspeed( 30, 30, 30, 0.3 );
    var_6 = self.origin;
    var_7 = self.angles[1];
    var_8 = self.angles[0];
    self._id_11901 = level._id_C73F[self._id_C740]._id_11901;
    self setvehgoalpos( var_2, 1 );
    var_9 = gettime();
    self waittill( "goal" );
    var_10 = ( gettime() - var_9 ) * 0.001;
    self._id_11901 -= var_10;
    thread _id_1AEE();
    var_11 = var_2 * ( 1, 1, 0 );
    var_11 += ( 0, 0, self._id_2A95 );
    self vehicle_setspeed( 25, 10, 10 );
    self setyawspeed( 20, 10, 10, 0.3 );
    self setvehgoalpos( var_11, 1 );
    var_9 = gettime();
    self waittill( "goal" );
    var_10 = ( gettime() - var_9 ) * 0.001;
    self._id_11901 -= var_10;
    _id_C73D( 1, level._id_C73F[self._id_C740]._id_113F0, var_11 );
    var_12 = 1.0;

    if ( isdefined( var_0 ) )
        var_0 scripts\engine\utility::_id_13736( var_12, "disconnect" );

    self._id_11901 -= var_12;
    self setvehgoalpos( var_2, 1 );
    var_9 = gettime();
    self waittill( "goal" );
    var_10 = ( gettime() - var_9 ) * 0.001;
    self._id_11901 -= var_10;
    var_13 = getentarray( "heli_attack_area", "targetname" );
    var_14 = level._id_8D6F[randomint( level._id_8D6F.size )];

    if ( var_13.size )
        thread scripts\mp\killstreaks\helicopter::_id_8D55( var_13 );
    else
        thread scripts\mp\killstreaks\helicopter::_id_8D52( var_14 );

    self waittill( "leaving" );
    thread _id_1AED();
}

_id_C73E( var_0, var_1, var_2 )
{
    thread _id_1AEB();
    self waittill( "hatch_down" );
    level notify( "escort_airdrop_started", self );
    var_3[0] = thread scripts\mp\killstreaks\airdrop::_id_5EEC( undefined, self._id_5EF1, undefined, 0, undefined, self.origin, ( randomint( 10 ), randomint( 10 ), randomint( 10 ) ), undefined, var_1 );
    wait 0.05;
    self notify( "drop_crate" );
    wait( var_0 );
    var_3[1] = thread scripts\mp\killstreaks\airdrop::_id_5EEC( undefined, self._id_5EF1, undefined, 0, undefined, self.origin, ( randomint( 100 ), randomint( 100 ), randomint( 100 ) ), var_3, var_1 );
    wait 0.05;
    self notify( "drop_crate" );
    wait( var_0 );
    var_3[2] = thread scripts\mp\killstreaks\airdrop::_id_5EEC( undefined, self._id_5EF1, undefined, 0, undefined, self.origin, ( randomint( 50 ), randomint( 50 ), randomint( 50 ) ), var_3, var_1 );
    wait 0.05;
    self notify( "drop_crate" );
    wait( var_0 );
    var_3[3] = thread scripts\mp\killstreaks\airdrop::_id_5EEC( undefined, self._id_5EF1, undefined, 0, undefined, self.origin, ( randomintrange( -100, 0 ), randomintrange( -100, 0 ), randomintrange( -100, 0 ) ), var_3, var_1 );
    wait 0.05;
    self notify( "drop_crate" );
    wait( var_0 );
    thread scripts\mp\killstreaks\airdrop::_id_5EEC( undefined, self._id_5EF1, undefined, 0, undefined, self.origin, ( randomintrange( -50, 0 ), randomintrange( -50, 0 ), randomintrange( -50, 0 ) ), var_3, var_1 );
    wait 0.05;
    self notify( "drop_crate" );
    wait 1.0;
    thread _id_1AEC();
}

_id_C73D( var_0, var_1, var_2 )
{
    thread _id_1AEB();
    self waittill( "hatch_down" );
    var_3[0] = thread scripts\mp\killstreaks\airdrop::_id_5EEC( undefined, self._id_5EF1, undefined, 0, undefined, self.origin, ( randomint( 10 ), randomint( 10 ), randomint( 10 ) ), undefined, var_1 );
    wait 0.05;
    self._id_11901 -= 0.05;
    self notify( "drop_crate" );
    wait( var_0 );
    self._id_11901 -= var_0;
    var_3[1] = thread scripts\mp\killstreaks\airdrop::_id_5EEC( undefined, self._id_5EF1, undefined, 0, undefined, self.origin, ( randomint( 100 ), randomint( 100 ), randomint( 100 ) ), var_3, var_1 );
    wait 0.05;
    self._id_11901 -= 0.05;
    self notify( "drop_crate" );
    wait( var_0 );
    self._id_11901 -= var_0;
    var_3[2] = thread scripts\mp\killstreaks\airdrop::_id_5EEC( undefined, self._id_5EF1, undefined, 0, undefined, self.origin, ( randomint( 50 ), randomint( 50 ), randomint( 50 ) ), var_3, var_1 );
    wait 0.05;
    self._id_11901 -= 0.05;
    self notify( "drop_crate" );
    wait 1.0;
    thread _id_1AEC();
}

_id_6380( var_0 )
{
    if ( isdefined( self._id_6741 ) )
        self._id_6741 scripts\mp\hud_util::_id_52DC();

    self _meth_8258();
    self thermalvisionoff();
    self thermalvisionfofoverlayoff();
    self unlink();
    scripts\mp\utility\game::_id_41E9();

    if ( getdvarint( "camera_thirdPerson" ) )
        scripts\mp\utility\game::_id_F887( 1 );

    self _meth_8401( game["thermal_vision"], 0 );

    if ( isdefined( var_0 ) )
        var_0 _meth_83EC( self );

    self notify( "heliPlayer_removed" );
    scripts\mp\utility\game::_id_141A( scripts\engine\utility::_id_7F62() );
    scripts\mp\utility\game::_id_141E( "heli_remote_mp" );
}

_id_6381( var_0 )
{
    self endon( "disconnect" );
    var_0 waittill( "helicopter_done" );
    _id_6380( var_0 );
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_DBD9 = 23;
    level.advradarviewtime = 28;
    level._id_12AF0 = 23;
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "uav", ::_id_1290B );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "counter_uav", ::_id_1290B );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "directional_uav", ::_id_1290B );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "uav_3dping", ::_id_128B2 );
    var_0 = [ "passive_increased_duration", "passive_decreased_duration", "passive_decreased_health", "passive_increased_armor", "passive_increased_cost", "passive_extra_assist", "passive_stealth_vehicle", "passive_vision_sweep", "passive_disable_hud", "passive_emp_blast", "passive_duration_health", "passive_armor_speed", "passive_stealth_speed" ];
    _id_0AC7::_id_DF07( "uav", var_0 );
    _id_0AC7::_id_DF07( "counter_uav", var_0 );
    _id_0AC7::_id_DF07( "directional_uav", var_0 );
    level.uavsettings = [];
    level.uavsettings["uav"] = spawnstruct();
    level.uavsettings["uav"]._id_11901 = level._id_DBD9;
    level.uavsettings["uav"].health = 999999;
    level.uavsettings["uav"].maxhealth = 800;
    level.uavsettings["uav"]._id_110EA = "uav";
    level.uavsettings["uav"]._id_B91A = "veh_mil_air_un_uav";
    level.uavsettings["uav"]._id_7630 = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_veh_exp_uav.vfx" );
    level.uavsettings["uav"]._id_7631 = loadfx( "vfx/misc/jet_engine_ac130" );
    level.uavsettings["uav"]._id_7637 = loadfx( "vfx/core/mp/killstreaks/vfx_3d_world_ping_large" );
    level.uavsettings["uav"]._id_75A2 = "tag_origin";
    level.uavsettings["uav"]._id_762F = undefined;
    level.uavsettings["uav"]._id_7566 = undefined;
    level.uavsettings["uav"]._id_1045F = "ball_drone_explode";
    level.uavsettings["uav"]._id_115EB = "used_uav";
    level.uavsettings["uav"]._id_13554 = "uav_timeout";
    level.uavsettings["uav"]._id_377B = "callout_destroyed_uav";
    level.uavsettings["uav"]._id_17C8 = ::_id_179A;
    level.uavsettings["uav"]._id_E124 = ::_id_E0C1;
    level.uavsettings["counter_uav"] = spawnstruct();
    level.uavsettings["counter_uav"]._id_11901 = level._id_12AF0;
    level.uavsettings["counter_uav"].health = 999999;
    level.uavsettings["counter_uav"].maxhealth = 800;
    level.uavsettings["counter_uav"]._id_110EA = "counter_uav";
    level.uavsettings["counter_uav"]._id_B91A = "veh_mil_air_un_cuav";
    level.uavsettings["counter_uav"]._id_7630 = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_veh_exp_uav.vfx" );
    level.uavsettings["counter_uav"]._id_7631 = loadfx( "vfx/misc/jet_engine_ac130" );
    level.uavsettings["counter_uav"]._id_75A2 = "tag_origin";
    level.uavsettings["counter_uav"]._id_762F = undefined;
    level.uavsettings["counter_uav"]._id_7566 = undefined;
    level.uavsettings["counter_uav"]._id_1045F = "ball_drone_explode";
    level.uavsettings["counter_uav"]._id_13554 = "counter_uav_timeout";
    level.uavsettings["counter_uav"]._id_115EB = "used_counter_uav";
    level.uavsettings["counter_uav"]._id_377B = "callout_destroyed_counter_uav";
    level.uavsettings["counter_uav"]._id_17C8 = ::_id_1799;
    level.uavsettings["counter_uav"]._id_E124 = ::_id_E0BF;
    level.uavsettings["directional_uav"] = spawnstruct();
    level.uavsettings["directional_uav"]._id_11901 = level.advradarviewtime;
    level.uavsettings["directional_uav"].health = 999999;
    level.uavsettings["directional_uav"].maxhealth = 2000;
    level.uavsettings["directional_uav"]._id_110EA = "directional_uav";
    level.uavsettings["directional_uav"]._id_B91A = "veh_mil_air_un_auav";
    level.uavsettings["directional_uav"]._id_7630 = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_veh_exp_uav.vfx" );
    level.uavsettings["directional_uav"]._id_7631 = loadfx( "vfx/misc/jet_engine_ac130" );
    level.uavsettings["directional_uav"]._id_75A2 = "tag_origin";
    level.uavsettings["directional_uav"]._id_762F = undefined;
    level.uavsettings["directional_uav"]._id_7566 = "tag_jet_trail";
    level.uavsettings["directional_uav"]._id_1045F = "ball_drone_explode";
    level.uavsettings["directional_uav"]._id_13554 = "directional_uav_timeout";
    level.uavsettings["directional_uav"]._id_115EB = "used_directional_uav";
    level.uavsettings["directional_uav"]._id_377B = "callout_destroyed_directional_uav";
    level.uavsettings["directional_uav"]._id_17C8 = ::_id_179A;
    level.uavsettings["directional_uav"]._id_E124 = ::_id_E0C1;
    level.uavsettings["uav_3dping"] = spawnstruct();
    level.uavsettings["uav_3dping"]._id_11901 = 63;
    level.uavsettings["uav_3dping"]._id_110EA = "uav_3dping";
    level.uavsettings["uav_3dping"]._id_8EF7 = 1.5;
    level.uavsettings["uav_3dping"]._id_CB9A = 10.0;
    level.uavsettings["uav_3dping"]._id_7636 = loadfx( "vfx/core/mp/killstreaks/vfx_3d_world_ping" );
    level.uavsettings["uav_3dping"]._id_1046A = "oracle_radar_pulse_plr";
    level.uavsettings["uav_3dping"]._id_10469 = "oracle_radar_pulse_npc";
    level.uavsettings["uav_3dping"]._id_13554 = "oracle_gone";
    level.uavsettings["uav_3dping"]._id_115EB = "used_uav_3dping";
    var_1 = getentarray( "minimap_corner", "targetname" );

    if ( var_1.size )
        level._id_12AF6 = scripts\mp\spawnlogic::findboxcenter( var_1[0].origin, var_1[1].origin );
    else
        level._id_12AF6 = ( 0, 0, 0 );

    level._id_12AF5 = spawn( "script_model", level._id_12AF6 );
    level._id_12AF5 setmodel( "tag_origin" );
    level._id_12AF5.angles = ( 0, 115, 0 );
    level._id_12AF5 hide();
    level._id_12AF5._id_0336 = "uavrig_script_model";
    level._id_12AF5 thread _id_E734( 70 );
    level.uavrigslow = spawn( "script_model", level._id_12AF6 );
    level.uavrigslow setmodel( "tag_origin" );
    level.uavrigslow.angles = ( 0, 115, 0 );
    level.uavrigslow hide();
    level.uavrigslow._id_0336 = "uavrig_script_model";
    level.uavrigslow thread _id_E734( 90 );
    level._id_46B8 = spawn( "script_model", level._id_12AF6 );
    level._id_46B8 setmodel( "tag_origin" );
    level._id_46B8.angles = ( 0, 115, 0 );
    level._id_46B8 hide();
    level._id_46B8._id_0336 = "counteruavrig_script_model";
    level._id_46B8 thread _id_E734( 80 );
    level._id_18D2 = spawn( "script_model", level._id_12AF6 );
    level._id_18D2 setmodel( "tag_origin" );
    level._id_18D2.angles = ( 0, 115, 0 );
    level._id_18D2 hide();
    level._id_18D2._id_0336 = "advanceduavrig_script_model";
    level._id_18D2 thread _id_E734( 60 );
    level.advanceduavrigslow = spawn( "script_model", level._id_12AF6 );
    level.advanceduavrigslow setmodel( "tag_origin" );
    level.advanceduavrigslow.angles = ( 0, 115, 0 );
    level.advanceduavrigslow hide();
    level.advanceduavrigslow._id_0336 = "advanceduavrig_script_model";
    level.advanceduavrigslow thread _id_E734( 80 );
    var_2 = getuavstrengthlevelneutral();

    if ( level._id_BDCC )
    {
        for ( var_3 = 0; var_3 < level._id_115DA.size; var_3++ )
        {
            level._id_0254[level._id_115DA[var_3]] = "normal_radar";
            level._id_1679[level._id_115DA[var_3]] = 0;
            level._id_164F[level._id_115DA[var_3]] = 0;
            level.activeadvanceduavs[level._id_115DA[var_3]] = 0;
            level._id_12AF3[level._id_115DA[var_3]] = [];
        }
    }
    else if ( level.teambased )
    {
        level._id_0254["allies"] = "normal_radar";
        level._id_0254["axis"] = "normal_radar";
        level._id_1679["allies"] = 0;
        level._id_1679["axis"] = 0;
        level._id_164F["allies"] = 0;
        level._id_164F["axis"] = 0;
        level.activeadvanceduavs["allies"] = 0;
        level.activeadvanceduavs["axis"] = 0;
        level._id_12AF3["allies"] = [];
        level._id_12AF3["axis"] = [];
    }
    else
    {
        level._id_0254 = [];
        level._id_1679 = [];
        level._id_164F = [];
        level.activeadvanceduavs = [];
        level._id_12AF3 = [];
    }

    level thread _id_C56E();
    level thread _id_12AF9();
}

_id_C56E()
{
    var_0 = getuavstrengthlevelneutral();

    for (;;)
    {
        level waittill( "connected", var_1 );
        _id_0DC9::_id_12F51();
        level._id_1679[var_1.guid] = 0;
        level._id_1679[var_1.guid + "_radarStrength"] = var_0;
        level._id_164F[var_1.guid] = 0;
        level._id_0254[var_1.guid] = "normal_radar";
        var_1._id_0256 = var_0;
        var_1 thread monitorplayerupdate();
    }
}

monitorplayerupdate()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        level notify( "uav_update" );
    }
}

_id_E734( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        self endon( var_2 );

    if ( !isdefined( var_0 ) )
        var_0 = 60;

    if ( !isdefined( var_1 ) )
        var_1 = -360;

    for (;;)
    {
        self _meth_8271( var_1, var_0 );
        wait( var_0 );
    }
}

_id_1290B( var_0 )
{
    return _id_130F4( var_0._id_110EA, var_0 );
}

_id_128B2( var_0 )
{
    var_1 = "uav_3dping";
    thread _id_13920( var_1 );
    thread _id_13921( var_1 );
    level thread scripts\mp\utility\game::_id_115DE( level.uavsettings[var_1]._id_115EB, self );
    return 1;
}

_id_130F4( var_0, var_1 )
{
    scripts\mp\matchdata::_id_AFC9( var_0, self.origin );
    var_2 = self.pers["team"];
    var_3 = level.uavsettings[var_0]._id_11901;
    level thread _id_AAB8( self, var_0, var_1 );

    if ( !isdefined( self._id_12AF8 ) )
        self._id_12AF8 = [];

    switch ( var_0 )
    {
        case "counter_uav":
            self notify( "used_counter_uav" );
            self._id_12AF8["counter_uav"] = 1;
            break;
        case "directional_uav":
            self._id_0255 = 1;

            if ( level.teambased )
            {
                foreach ( var_5 in level.players )
                {
                    if ( var_5.pers["team"] == var_2 )
                        var_5._id_0255 = 1;
                }
            }

            self notify( "used_directional_uav" );
            self._id_12AF8["directional_uav"] = 1;
            break;
        default:
            self notify( "used_uav" );

            if ( level.teambased )
            {
                var_7 = _id_12B5( var_2 );

                if ( var_7 >= getuavstrengthlevelshowenemyfastsweep() )
                    scripts\mp\missions::_id_D991( "ch_uav_doubleup" );
            }

            self._id_12AF8["uav"] = 1;
            break;
    }

    if ( self._id_12AF8.size == 3 )
    {
        self._id_12AF8 = [];
        scripts\mp\missions::_id_D991( "ch_uav_combo" );
    }

    return 1;
}

_id_AAB8( var_0, var_1, var_2 )
{
    var_3 = var_0.team;
    var_4 = _id_81E8( var_1, var_2 );
    var_5 = spawn( "script_model", var_4 gettagorigin( "tag_origin" ) + ( 0, 0, 5000 ) );
    var_6 = level.uavsettings[var_1]._id_B91A;
    var_7 = level.uavsettings[var_1]._id_11901;
    var_8 = level.uavsettings[var_1].maxhealth;
    var_9 = level.uavsettings[var_1]._id_115EB;
    var_10 = _id_0AC7::getrarityforlootitem( var_2._id_1318B );

    if ( var_10 != "" )
    {
        var_6 = var_6 + "_" + var_10;
        var_9 = var_9 + "_" + var_10;
    }

    level thread scripts\mp\utility\game::_id_115DE( var_9, var_0 );

    if ( var_1 == "uav" )
    {
        if ( _id_0DC9::_id_A69F( var_2, "passive_duration_health" ) )
        {
            var_7 += 5;
            var_8 -= 200;
        }

        if ( _id_0DC9::_id_A69F( var_2, "passive_armor_speed" ) )
            var_7 -= 5;
    }
    else if ( var_1 == "counter_uav" )
    {
        if ( _id_0DC9::_id_A69F( var_2, "passive_duration_health" ) )
        {
            var_7 += 5;
            var_8 -= 200;
        }

        if ( _id_0DC9::_id_A69F( var_2, "passive_disable_hud" ) )
            var_7 -= 10;
    }
    else
    {
        if ( _id_0DC9::_id_A69F( var_2, "passive_duration_health" ) )
        {
            var_7 += 5;
            var_8 -= 500;
        }

        if ( _id_0DC9::_id_A69F( var_2, "passive_vision_sweep" ) )
            var_7 -= 5;
    }

    var_5 setmodel( var_6 );
    var_5.team = var_3;
    var_5.owner = var_0;
    var_5._id_11938 = 0;
    var_5._id_12AFA = var_1;
    var_5.health = level.uavsettings[var_1].health;
    var_5.maxhealth = var_8;
    var_5._id_110E8 = var_2;
    var_5 _meth_831F( var_0 );
    var_5 _meth_8549();
    var_5 _meth_8594();
    var_5 _id_0DC9::_id_1843( var_1, "Killstreak_Air", var_0 );
    var_5 thread _id_4D72();
    var_5 thread _id_89B7();
    var_5 thread _id_CA50();
    var_5 thread _id_B9FF();
    var_5 thread _id_E2E4();
    var_5 setscriptablepartstate( "lights", "on", 0 );

    if ( _id_0DC9::_id_A69F( var_2, "passive_stealth_vehicle" ) )
        var_5 setscriptablepartstate( "stealth", "active", 0 );

    var_11 = randomintrange( 5250, 5500 );

    if ( isdefined( level._id_108FB ) )
        var_12 = level._id_108FB;
    else
        var_12 = level._id_10DF1;

    var_13 = var_12[0];

    foreach ( var_15 in var_12 )
    {
        if ( var_15.origin[2] < var_13.origin[2] )
            var_13 = var_15;
    }

    var_17 = var_13.origin[2];
    var_18 = var_4.origin[2];

    if ( var_17 < 0 )
    {
        var_18 += var_17 * -1;
        var_17 = 0;
    }

    var_19 = var_18 - var_17;

    if ( var_19 + var_11 > 8100.0 )
        var_11 -= ( var_19 + var_11 - 8100.0 );

    var_20 = randomint( 360 );
    var_21 = randomint( 1000 ) + 4000;
    var_22 = cos( var_20 ) * var_21;
    var_23 = sin( var_20 ) * var_21;
    var_24 = vectornormalize( ( var_22, var_23, var_11 ) );
    var_24 *= var_11;
    var_5 linkto( var_4, "tag_origin", var_24, ( 0, var_20 - 90, 0 ) );
    var_5 thread _id_12F50();
    var_5 [[ level.uavsettings[var_1]._id_17C8 ]]();

    if ( isdefined( level._id_1679[var_3] ) )
    {
        foreach ( var_26 in level._id_12AF3[var_3] )
        {
            if ( var_26 == var_5 )
                continue;

            if ( isdefined( var_26._id_11938 ) )
                var_26._id_11938 += 5;
        }
    }

    var_5 thread handlewiretap();

    if ( _id_0DC9::_id_A69F( var_2, "passive_disable_hud" ) )
        var_5 thread startsystemshutdown();

    if ( _id_0DC9::_id_A69F( var_2, "passive_emp_blast" ) )
        var_5 thread startemppulse();

    level notify( "uav_update" );
    var_5 scripts\mp\hostmigration::_id_137B8( "death", var_7 );

    if ( var_5._id_00E1 < var_5.maxhealth )
    {
        var_5 unlink();
        var_28 = var_5.origin + anglestoforward( var_5.angles ) * 20000;
        var_5 moveto( var_28, 60 );

        if ( isdefined( level.uavsettings[var_1]._id_7631 ) && isdefined( level.uavsettings[var_1]._id_75A2 ) )
            playfxontag( level.uavsettings[var_1]._id_7631, var_5, level.uavsettings[var_1]._id_75A2 );

        var_5 scripts\mp\hostmigration::_id_137B8( "death", 3 );

        if ( var_5._id_00E1 < var_5.maxhealth )
        {
            var_5 notify( "leaving" );
            var_5 setscriptablepartstate( "trail", "on", 0 );
            var_5._id_9E78 = 1;
            var_5 moveto( var_28, 4, 4, 0.0 );
        }

        var_5 scripts\mp\hostmigration::_id_137B8( "death", 4 + var_5._id_11938 );
    }

    var_5 [[ level.uavsettings[var_1]._id_E124 ]]();

    if ( isdefined( var_5._id_6569 ) )
    {
        scripts\mp\objidpoolmanager::returnminimapid( var_5._id_6569 );
        var_5 notify( "uav_deleteObjective" );
    }

    if ( isdefined( var_5 ) )
        var_5 delete();

    if ( var_1 == "directional_uav" )
    {
        var_0._id_0255 = 0;

        if ( level.teambased )
        {
            foreach ( var_30 in level.players )
            {
                if ( var_30.pers["team"] == var_3 )
                    var_30._id_0255 = 0;
            }
        }
    }

    scripts\mp\utility\game::_id_D915( "killstreak ended - " + var_1, var_0 );
    level notify( "uav_update" );
}

_id_B9FF()
{
    self endon( "death" );
    self.owner scripts\engine\utility::waittill_any( "disconnect", "joined_team" );
    self hide();
    var_0 = anglestoright( self.angles ) * 200;
    playfx( level.uavsettings[self._id_12AFA]._id_7630, self.origin, var_0 );
    self._id_00E1 = self.maxhealth;
    self notify( "death" );
}

_id_E2E4()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "host_migration_end" );

        if ( level.teambased )
        {
            var_0 = _id_12B5( "allies" );
            var_1 = _id_12B5( "axis" );
            _setteamradarstrength( "allies", var_0 );
            _setteamradarstrength( "axis", var_1 );
        }
    }
}

_id_12F50()
{
    self endon( "death" );

    for (;;)
    {
        level scripts\engine\utility::_id_13762( "joined_team", "uav_update" );
        self hide();

        foreach ( var_1 in level.players )
        {
            if ( level.teambased )
            {
                if ( var_1.team != self.team )
                    self _meth_8388( var_1 );

                continue;
            }

            if ( isdefined( self.owner ) && var_1 == self.owner )
                continue;

            self _meth_8388( var_1 );
        }
    }
}

_id_4D72()
{
    level endon( "game_ended" );
    self setcandamage( 1 );
    self._id_00E1 = 0;

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
        var_9 = scripts\mp\utility\game::_id_13CA1( var_9, var_13 );

        if ( !isplayer( var_1 ) )
        {
            if ( !isdefined( self ) )
                return;
        }
        else
        {
            if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_1 ) )
                continue;

            if ( isdefined( var_8 ) && var_8 & level.idflags_penetration )
                self._id_1390E = 1;

            if ( isdefined( var_8 ) && var_8 & level.idflags_no_team_protection )
                self._id_1390F = 1;

            self._id_1390B = 1;
            var_14 = var_0;

            if ( isplayer( var_1 ) )
            {
                var_1 scripts\mp\damagefeedback::updatedamagefeedback( "" );

                if ( var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_PISTOL_BULLET" )
                {
                    if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_armorpiercing" ) )
                        var_14 += var_0 * level._id_218B;
                }
            }

            var_15 = 1;
            var_16 = 1;
            var_17 = 1;

            if ( self._id_12AFA == "directional_uav" )
            {
                var_15 = 5;
                var_16 = 6;
                var_17 = 7;

                if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_duration_health" ) )
                {
                    var_15--;
                    var_16--;
                    var_17--;
                }
            }

            if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_armor_speed" ) )
            {
                var_15++;
                var_16++;
                var_17++;
            }

            if ( isdefined( var_9 ) )
            {
                if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_armor_speed" ) )
                {
                    if ( _id_0DC9::isexplosiveantikillstreakweapon( var_9 ) )
                        var_1 scripts\mp\damagefeedback::updatedamagefeedback( "hitblastshield" );
                }

                var_14 = _id_0DC9::_id_7FBD( var_1, var_9, var_4, var_14, self.maxhealth, var_15, var_16, var_17 );
                scripts\mp\killstreaks\killstreaks::_id_A6A0( var_1, var_9, self, var_4 );
                scripts\mp\damage::_id_AF96( self, var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
            }

            self._id_00E1 += var_14;

            if ( self._id_00E1 >= self.maxhealth )
            {
                if ( isplayer( var_1 ) && ( !isdefined( self.owner ) || var_1 != self.owner ) )
                {
                    var_18 = _id_0AC7::getrarityforlootitem( self._id_110E8._id_1318B );
                    var_19 = level.uavsettings[self._id_12AFA]._id_377B;

                    if ( var_18 != "" )
                        var_19 = var_19 + "_" + var_18;

                    scripts\mp\damage::onkillstreakkilled( self._id_12AFA, var_1, var_9, var_4, var_0, "destroyed_" + self._id_12AFA, self._id_12AFA + "_destroyed", var_19 );

                    if ( isdefined( self._id_12AF4 ) && self._id_12AF4 != var_1 )
                        self._id_12AF4 thread scripts\mp\killstreaks\remoteuav::_id_DFA5();
                }

                self hide();
                var_20 = anglestoright( self.angles ) * 200;
                playfx( level.uavsettings[self._id_12AFA]._id_7630, self.origin, var_20 );
                self notify( "death" );
                return;
            }
        }
    }
}

_id_12AF9()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "uav_update" );

        if ( level._id_BDCC )
        {
            for ( var_0 = 0; var_0 < level._id_115DA.size; var_0++ )
                _id_12F3F( level._id_115DA[var_0] );

            continue;
        }

        if ( level.teambased )
        {
            _id_12F3F( "allies" );
            _id_12F3F( "axis" );
            _id_0DC9::_id_12F51();
            continue;
        }

        _id_12EF2();
    }
}

handlewiretap()
{
    foreach ( var_1 in level.players )
    {
        if ( isdefined( self._id_110EA ) && ( self._id_110EA == "directional_uav" || self._id_110EA == "counter_uav" ) )
            return;

        if ( !var_1 scripts\mp\utility\game::_id_12D6( "specialty_expanded_minimap" ) )
            continue;

        if ( var_1.team == self.team )
            continue;

        thread executewiretapsweeps( var_1 );
    }
}

executewiretapsweeps( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    triggeroneoffradarsweep( var_0 );
    self waittill( "death" );
    triggeroneoffradarsweep( var_0 );
}

_id_12B5( var_0 )
{
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;

    foreach ( var_5 in level._id_12AF3[var_0] )
    {
        if ( !isdefined( var_5 ) )
            continue;

        if ( var_5._id_12AFA == "counter_uav" )
            continue;

        if ( var_5._id_12AFA == "remote_mortar" )
            continue;

        if ( var_5._id_12AFA == "directional_uav" )
        {
            var_3++;
            continue;
        }

        var_1++;
    }

    if ( level._id_BDCC )
    {
        foreach ( var_8 in level._id_115DA )
        {
            foreach ( var_5 in level._id_12AF3[var_8] )
            {
                if ( !isdefined( var_5 ) )
                    continue;

                if ( var_8 == var_0 )
                    continue;

                if ( var_5._id_12AFA != "counter_uav" )
                    continue;

                var_2++;
            }
        }
    }
    else
    {
        foreach ( var_5 in level._id_12AF3[level._id_C74B[var_0]] )
        {
            if ( !isdefined( var_5 ) )
                continue;

            if ( var_5._id_12AFA != "counter_uav" )
                continue;

            var_2++;
        }
    }

    var_14 = getuavstrengthmin();
    var_15 = getuavstrengthmax();

    if ( var_3 )
        var_1 = var_15 - getuavstrengthlevelneutral();

    if ( var_0 == "axis" )
        level.axisactiveuavs = var_1;
    else
        level.alliesactiveuavs = var_1;

    if ( var_2 > 0 )
        var_16 = var_14;
    else if ( var_3 > 0 )
        var_16 = var_15;
    else
        var_16 = int( clamp( var_1 + getuavstrengthlevelneutral(), getuavstrengthlevelneutral(), getuavstrengthlevelshowenemyfastsweep() ) );

    if ( var_16 <= var_14 )
        var_16 = var_14;
    else if ( var_16 >= var_15 )
        var_16 = var_15;

    return var_16;
}

_setteamradarstrength( var_0, var_1 )
{
    _id_12F3F( var_0, var_1 );
}

_id_12F3F( var_0, var_1 )
{
    var_2 = getuavstrengthmin();
    var_3 = getuavstrengthmax();
    var_4 = getuavstrengthlevelshowenemydirectional();
    var_5 = getuavstrengthlevelneutral();
    var_6 = getuavstrengthlevelshowenemyfastsweep();

    if ( isdefined( var_1 ) )
        var_7 = var_1;
    else
        var_7 = _id_12B5( var_0 );

    if ( var_0 == "axis" )
        var_8 = level.axisactiveuavs;
    else
        var_8 = level.alliesactiveuavs;

    foreach ( var_10 in level.players )
    {
        var_11 = var_7;

        if ( var_10.team != var_0 )
            continue;

        if ( var_10 scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) && var_7 <= var_5 )
        {
            if ( scripts\mp\utility\game::istrue( var_10._id_0255 ) )
                var_11 = var_3;

            if ( var_11 != var_3 )
                var_11 = int( clamp( var_8 + var_5, var_5, var_6 ) );
        }

        if ( var_11 <= var_2 )
            var_11 = var_2;
        else if ( var_11 >= var_3 )
            var_11 = var_3;

        var_10._id_0256 = var_11;

        if ( var_11 >= var_5 )
            var_10._id_0194 = 0;
        else
            var_10._id_0194 = 1;

        if ( var_11 <= var_5 )
        {
            var_10._id_016E = 0;
            var_10._id_0255 = 0;

            if ( isdefined( var_10._id_0254 ) && var_10._id_0254 == "constant_radar" )
                var_10._id_0254 = "normal_radar";

            var_10 setclientomnvar( "ui_show_hardcore_minimap", 0 );
            continue;
        }

        var_10 setradarmode( var_11, var_6, var_4 );
        var_10._id_0255 = var_11 >= var_4;
        var_10._id_016E = 1;
        var_10 setclientomnvar( "ui_show_hardcore_minimap", 1 );
    }
}

_id_12EF2()
{
    var_0 = getuavstrengthmin();
    var_1 = getuavstrengthmax();
    var_2 = getuavstrengthlevelshowenemydirectional();
    var_3 = getuavstrengthlevelshowenemyfastsweep();

    foreach ( var_5 in level.players )
    {
        var_6 = level._id_1679[var_5.guid + "_radarStrength"];

        foreach ( var_8 in level.players )
        {
            if ( var_8 == var_5 )
                continue;

            var_9 = level._id_164F[var_8.guid];

            if ( var_9 > 0 && !var_5 scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) )
            {
                var_6 = var_0;
                break;
            }
        }

        if ( var_6 <= var_0 )
            var_6 = var_0;
        else if ( var_6 >= var_1 )
            var_6 = var_1;

        var_5._id_0256 = var_6;

        if ( var_6 >= getuavstrengthlevelneutral() )
            var_5._id_0194 = 0;
        else
            var_5._id_0194 = 1;

        if ( var_6 <= getuavstrengthlevelneutral() )
        {
            var_5._id_016E = 0;
            var_5._id_0255 = 0;

            if ( isdefined( var_5._id_0254 ) && var_5._id_0254 == "constant_radar" )
                var_5._id_0254 = "normal_radar";

            var_5 setclientomnvar( "ui_show_hardcore_minimap", 0 );
            continue;
        }

        var_5 setradarmode( var_6, var_3, var_2 );
        var_5._id_0255 = var_6 >= var_2;
        var_5._id_016E = 1;
        var_5 setclientomnvar( "ui_show_hardcore_minimap", 1 );
    }
}

setradarmode( var_0, var_1, var_2 )
{
    if ( var_0 >= var_1 )
        self._id_0254 = "fast_radar";
    else
        self._id_0254 = "normal_radar";

    if ( var_0 >= var_2 )
    {
        var_3 = undefined;

        if ( level.teambased )
            var_3 = level._id_12AF3[self.team];
        else
            var_3 = level._id_12AF3;

        foreach ( var_5 in var_3 )
        {
            if ( isdefined( var_5 ) && var_5._id_12AFA == "directional_uav" )
            {
                if ( !level.teambased )
                {
                    if ( var_5.owner != self )
                        continue;
                }

                if ( _id_0DC9::_id_A69F( var_5._id_110E8, "passive_vision_sweep" ) )
                {
                    self._id_0254 = "constant_radar";
                    break;
                }
            }
        }
    }
}

_id_2BBC()
{
    self endon( "disconnect" );
    self notify( "blockPlayerUAV" );
    self endon( "blockPlayerUAV" );
    self._id_0194 = 1;
    wait( level._id_12AF0 );
    self._id_0194 = 0;
}

_id_12F40( var_0 )
{
    var_1 = _id_12B5( var_0 ) >= getuavstrengthlevelshowenemydirectional();

    foreach ( var_3 in level.players )
    {
        if ( var_3.team == "spectator" )
            continue;

        var_3._id_0254 = level._id_0254[var_3.team];

        if ( var_3.team == var_0 )
            var_3._id_0255 = var_1;
    }
}

_id_130BF( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self notify( "usePlayerUAV" );
    self endon( "usePlayerUAV" );

    if ( var_0 )
        self._id_0254 = "fast_radar";
    else
        self._id_0254 = "normal_radar";

    self._id_016E = 1;
    wait( var_1 );
    self._id_016E = 0;
}

_id_F87B( var_0, var_1 )
{
    setteamradar( var_0, var_1 );
    level notify( "radar_status_change", var_0 );
}

_id_89B7()
{
    level endon( "game_ended" );
    self endon( "death" );

    for (;;)
    {
        level waittill( "stinger_fired", var_0, var_1, var_2 );

        if ( !isdefined( var_2 ) || var_2 != self )
            continue;

        var_1 thread _id_10FA8( var_2, var_0 );
    }
}

_id_10FA8( var_0, var_1 )
{
    self endon( "death" );
    var_2 = distance( self.origin, var_0 getpointinbounds( 0, 0, 0 ) );
    var_3 = var_0 getpointinbounds( 0, 0, 0 );

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            var_4 = var_3;
        else
            var_4 = var_0 getpointinbounds( 0, 0, 0 );

        var_3 = var_4;
        var_5 = distance( self.origin, var_4 );

        if ( var_5 < var_2 )
            var_2 = var_5;

        if ( var_5 > var_2 )
        {
            if ( var_5 > 1536 )
                return;

            radiusdamage( self.origin, 1536, 600, 600, var_1, "MOD_EXPLOSIVE", "iw7_lockon_mp" );
            playfx( level._id_10FA1, self.origin );
            self hide();
            self notify( "deleted" );
            wait 0.05;
            self delete();
            var_1 notify( "killstreak_destroyed" );
        }

        wait 0.05;
    }
}

_id_1867()
{
    if ( level.teambased )
        level._id_12AF3[self.team][level._id_12AF3[self.team].size] = self;
    else
        level._id_12AF3[self.owner.guid + "_" + gettime()] = self;
}

_id_E182()
{
    var_0 = [];

    if ( level.teambased )
    {
        var_1 = self.team;

        foreach ( var_3 in level._id_12AF3[var_1] )
        {
            if ( !isdefined( var_3 ) )
                continue;

            var_0[var_0.size] = var_3;
        }

        level._id_12AF3[var_1] = var_0;
    }
    else
    {
        foreach ( var_3 in level._id_12AF3 )
        {
            if ( !isdefined( var_3 ) )
                continue;

            var_0[var_0.size] = var_3;
        }

        level._id_12AF3 = var_0;
    }
}

_id_179A()
{
    if ( level.teambased )
    {
        level._id_1679[self.team]++;

        if ( self._id_12AFA == "directional_uav" )
            level.activeadvanceduavs[self.team]++;
    }
    else
    {
        level._id_1679[self.owner.guid]++;
        level._id_1679[self.owner.guid + "_radarStrength"]++;

        if ( self._id_12AFA == "directional_uav" )
        {
            level._id_1679[self.owner.guid + "_radarStrength"] = level._id_1679[self.owner.guid + "_radarStrength"] + 2;

            if ( !isdefined( level.activeadvanceduavs[self.owner.guid] ) )
                level.activeadvanceduavs[self.owner.guid] = 0;

            level.activeadvanceduavs[self.owner.guid]++;
        }
    }
}

_id_1799()
{
    if ( level.teambased )
        level._id_164F[self.team]++;
    else
        level._id_164F[self.owner.guid]++;
}

_id_E0C1()
{
    if ( level.teambased )
    {
        level._id_1679[self.team]--;

        if ( self._id_12AFA == "directional_uav" )
            level.activeadvanceduavs[self.team]--;
    }
    else if ( isdefined( self.owner ) )
    {
        level._id_1679[self.owner.guid]--;
        level._id_1679[self.owner.guid + "_radarStrength"]--;

        if ( self._id_12AFA == "directional_uav" )
        {
            level._id_1679[self.owner.guid + "_radarStrength"] = level._id_1679[self.owner.guid + "_radarStrength"] - 2;
            level.activeadvanceduavs[self.owner.guid]--;
        }
    }
}

_id_E0BF()
{
    if ( level.teambased )
        level._id_164F[self.team]--;
    else if ( isdefined( self.owner ) )
        level._id_164F[self.owner.guid]--;
}

_id_108CD( var_0, var_1 )
{
    self endon( "death" );
    level endon( "game_ended" );
    wait 0.5;
    playfxontag( var_0, self, var_1 );
}

_id_13920( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        var_1 endon( "death" );

    self endon( "leave" );
    self endon( "killstreak_disowned" );
    level endon( "game_ended" );
    var_2 = level.uavsettings[var_0];
    var_3 = var_2._id_CB9A;

    if ( level.teambased )
        level._id_1679[self.team]++;
    else
        level._id_1679[self.guid]++;

    for (;;)
    {
        playfx( var_2._id_7636, self.origin );
        self playlocalsound( var_2._id_1046A );
        playloopsound( self.origin + ( 0, 0, 5 ), var_2._id_10469 );

        foreach ( var_5 in level._id_C928 )
        {
            if ( !scripts\mp\utility\game::isreallyalive( var_5 ) )
                continue;

            if ( !scripts\mp\utility\game::isenemy( var_5 ) )
                continue;

            if ( var_5 scripts\mp\utility\game::_id_12D6( "specialty_noplayertarget" ) )
                continue;

            var_5 scripts\mp\hud_message::_id_1013D( "spotted" );

            foreach ( var_7 in level._id_C928 )
            {
                if ( !scripts\mp\utility\game::isreallyalive( var_7 ) )
                    continue;

                if ( scripts\mp\utility\game::isenemy( var_7 ) )
                    continue;

                if ( isai( var_7 ) )
                {
                    var_7 scripts\engine\utility::_id_1913( var_5 );
                    continue;
                }

                var_8 = scripts\mp\utility\game::_id_C794( var_5, "orange", var_7, 0, 0, "killstreak" );
                var_9 = var_2._id_8EF7;
                var_7 thread _id_13AA0( var_8, var_5, var_9, var_1 );
            }
        }

        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_3 );
    }
}

_id_13921( var_0 )
{
    self endon( "killstreak_disowned" );
    level endon( "game_ended" );
    var_1 = level.uavsettings[var_0];
    var_2 = var_1._id_11901;
    var_3 = self.guid;

    if ( level.teambased )
        var_3 = self.team;

    thread _id_13922( var_3 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_2 );
    scripts\mp\utility\game::leaderdialogonplayer( var_1._id_13554 );
    self notify( "leave" );
    _id_4044( var_3 );
}

_id_13922( var_0 )
{
    self endon( "leave" );
    self waittill( "killstreak_disowned" );
    _id_4044( var_0 );
}

_id_4044( var_0 )
{
    level._id_1679[var_0]--;

    if ( level._id_1679[var_0] < 0 )
        level._id_1679[var_0] = 0;
}

_id_13AA0( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
        var_3 endon( "death" );

    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\engine\utility::_id_13737( var_2, "leave" );

    if ( isdefined( var_1 ) )
        scripts\mp\utility\game::_id_C78F( var_0, var_1 );
}

_id_81E8( var_0, var_1 )
{
    var_2 = undefined;

    switch ( var_0 )
    {
        case "uav":
            var_2 = level._id_12AF5;
            break;
        case "counter_uav":
            var_2 = level._id_46B8;
            break;
        case "directional_uav":
            var_2 = level._id_18D2;

            if ( _id_0DC9::_id_A69F( var_1, "passive_stealth_vehicle" ) )
                var_2 = level.advanceduavrigslow;

            break;
        case "default":
            break;
    }

    return var_2;
}

_id_CA50()
{
    self.owner endon( "disconnect" );
    self endon( "uav_deleteObjective" );

    switch ( self._id_12AFA )
    {
        case "uav":
            var_0 = "icon_minimap_uav_enemy";
            break;
        case "counter_uav":
            var_0 = "icon_minimap_counter_uav_enemy";
            break;
        case "directional_uav":
            var_0 = "icon_minimap_advanced_uav_enemy";
            break;
        default:
            var_0 = "icon_minimap_uav_enemy";
    }

    self._id_6569 = scripts\mp\killstreaks\airdrop::_id_49F8( var_0, 1, 1 );

    for (;;)
    {
        foreach ( var_2 in level.players )
        {
            if ( !isdefined( var_2 ) )
                continue;

            if ( !isplayer( var_2 ) )
                continue;

            if ( self._id_6569 != -1 )
            {
                if ( var_2 scripts\mp\utility\game::_id_12D6( "specialty_engineer" ) && scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( var_2, self.owner ) ) )
                {
                    scripts\mp\objidpoolmanager::minimap_objective_playermask_showto( self._id_6569, var_2 getentitynumber() );
                    continue;
                }

                scripts\mp\objidpoolmanager::minimap_objective_playermask_hidefrom( self._id_6569, var_2 getentitynumber() );
            }
        }

        wait 0.1;
    }
}

startsystemshutdown()
{
    level endon( "game_ended" );

    foreach ( var_1 in level.players )
    {
        if ( !scripts\mp\utility\game::isreallyalive( var_1 ) )
            continue;

        if ( !scripts\mp\utility\game::playersareenemies( self.owner, var_1 ) )
            continue;

        if ( !var_1 scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) )
            var_1 thread shutdownenemysystem( self );
    }

    thread applyshutdownonspawn();
}

givefriendlyperks( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\mp\utility\game::giveperk( "specialty_coldblooded" );
    scripts\mp\utility\game::giveperk( "specialty_tracker_jammer" );
    scripts\mp\utility\game::giveperk( "specialty_noscopeoutline" );
    var_0 waittill( "death" );
    scripts\mp\utility\game::_id_E150( "specialty_coldblooded" );
    scripts\mp\utility\game::_id_E150( "specialty_tracker_jammer" );
    scripts\mp\utility\game::_id_E150( "specialty_noscopeoutline" );
}

shutdownenemysystem( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self _meth_85C7( 1 );
    self playlocalsound( "counter_uav_jam_sfx" );
    var_0 waittill( "death" );
    self _meth_85C7( 0 );
    self playlocalsound( "counter_uav_jam_reboot_sfx" );
}

applyshutdownonspawn()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = self.owner;
    var_1 = var_0.team;

    for (;;)
    {
        level waittill( "player_spawned", var_2 );

        if ( !scripts\mp\utility\game::playersareenemies( var_0, var_2 ) )
            continue;

        if ( !var_2 scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) )
            var_2 thread shutdownenemysystem( self );
    }
}

startemppulse()
{
    self endon( "death" );
    level endon( "game_ended" );
    wait 2;
    self playsound( "jammer_drone_charge" );
    playfxontag( scripts\engine\utility::_id_7ECB( "jammer_drone_charge" ), self, "tag_origin" );
    wait 1.5;
    stopfxontag( scripts\engine\utility::_id_7ECB( "jammer_drone_charge" ), self, "tag_origin" );
    playfxontag( scripts\engine\utility::_id_7ECB( "jammer_drone_shockwave" ), self, "tag_origin" );
    self playsound( "jammer_drone_shockwave" );

    foreach ( var_1 in level.players )
    {
        if ( !scripts\mp\utility\game::isreallyalive( var_1 ) )
            continue;

        if ( !scripts\mp\utility\game::playersareenemies( self.owner, var_1 ) )
            continue;

        if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) )
            continue;

        var_2 = 1;

        if ( var_1 scripts\mp\killstreaks\emp_common::_id_9D29() )
            var_2 = 0;

        var_3 = 1;

        if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_1 ) )
            var_3 = 0;
        else if ( scripts\mp\utility\game::istrue( var_1.visionpulsevisionsetactive ) )
            var_3 = 0;

        var_1 thread applyuavshellshock( var_3, var_2 );
    }

    _id_52C5( scripts\mp\utility\game::_id_8027( self.team ), self.owner );
}

applyuavshellshock( var_0, var_1 )
{
    self endon( "disconnect" );

    if ( var_0 )
    {
        self shellshock( "flashbang_mp", 0.5 );
        thread applyuavshellshockvisionset();
    }

    if ( var_1 )
        self setscriptablepartstate( "emped", "active", 0 );

    self playloopsound( "emp_nade_lp" );
    var_2 = gettime() + 500.0;

    while ( gettime() <= var_2 )
    {
        if ( var_1 && scripts\mp\killstreaks\emp_common::_id_9D29() )
            var_1 = 0;

        if ( !scripts\mp\utility\game::isreallyalive( self ) )
            break;

        scripts\engine\utility::waitframe();
    }

    if ( var_1 )
        self setscriptablepartstate( "emped", "neutral", 0 );

    self stoploopsound( "emp_nade_lp" );
}

applyuavshellshockvisionset()
{
    visionsetnaked( "coup_sunblind", 0.05 );
    scripts\engine\utility::waitframe();
    visionsetnaked( "coup_sunblind", 0 );
    visionsetnaked( "", 0.5 );
}

_id_52C5( var_0, var_1 )
{
    var_2 = "nuke_mp";
    var_3 = level._id_1655;
    var_4 = scripts\mp\perks\perkfunctions::_id_7D96();
    var_5 = undefined;

    if ( isdefined( var_3 ) && isdefined( var_4 ) )
        var_5 = scripts\engine\utility::_id_2284( var_3, var_4 );
    else if ( isdefined( var_3 ) )
        var_5 = var_3;
    else if ( isdefined( var_4 ) )
        var_5 = var_4;

    if ( isdefined( var_5 ) )
    {
        foreach ( var_7 in var_5 )
        {
            if ( isdefined( var_7 ) )
                var_7 _id_0DC9::dodamagetokillstreak( 10000, var_1, var_1, var_0, var_7.origin, "MOD_EXPLOSIVE", var_2 );
        }
    }
}

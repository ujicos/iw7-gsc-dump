// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_C1D0 = "aftermath_post";
    level._effect["mons_warp_flash"] = loadfx( "vfx/iw7/_requests/mp/vfx_vehicle_nuke_warp_flash.vfx" );
    level._effect["mons_warp_in"] = loadfx( "vfx/iw7/_requests/mp/vfx_vehicle_nuke_warp_in.vfx" );
    level._effect["mons_warp_out"] = loadfx( "vfx/iw7/_requests/mp/vfx_vehicle_nuke_warp_out.vfx" );
    level._effect["mons_laser_charge"] = loadfx( "vfx/iw7/_requests/mp/vfx_nuke_build_lgt_ship_belly.vfx" );
    level._effect["mons_laser"] = loadfx( "vfx/iw7/_requests/mp/vfx_nuke_laser.vfx" );
    level._effect["mons_laser_flash"] = loadfx( "vfx/iw7/_requests/mp/vfx_nuke_initial_flash.vfx" );
    level._effect["mons_laser_smoke"] = loadfx( "vfx/iw7/_requests/mp/vfx_nuke_dust_wave.vfx" );
    level._effect["mons_screen_ash"] = loadfx( "vfx/iw7/_requests/mp/vfx_nuke_cam_att_ashfall.vfx" );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "nuke", ::_id_128F0 );
    setdvarifuninitialized( "scr_nukeTimer", 10 );
    setdvarifuninitialized( "scr_nukeCancelMode", 0 );
    level._id_C1CD = getdvarint( "scr_nukeTimer" );
    level._id_3883 = getdvarint( "scr_nukeCancelMode" );
    level._id_C1C5 = spawnstruct();
    level._id_C1BB = undefined;
    level._id_C1C3 = undefined;
    level._id_C1B2 = undefined;

    if ( !scripts\mp\utility\game::istrue( level._id_C1B2 ) )
        level thread _id_C56E();
}

_id_128F0( var_0 )
{
    if ( isdefined( level._id_C1C4 ) )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_NUKE_ALREADY_INBOUND" );
        return 0;
    }

    if ( scripts\mp\utility\game::isusingremote() && ( !isdefined( level._id_86AD ) || !level._id_86AD ) )
        return 0;

    thread _id_5973( 0 );
    self notify( "used_nuke" );
    scripts\mp\matchdata::_id_AFC9( "nuke", self.origin );
    return 1;
}

_id_512C( var_0, var_1, var_2 )
{
    level endon( "nuke_cancelled" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    level thread [[ var_1 ]]( var_2 );
}

_id_5973( var_0 )
{
    level endon( "nuke_cancelled" );
    level._id_C1C5.player = self;
    level._id_C1C5.team = self.pers["team"];
    level._id_C1C4 = 1;
    level._id_C1B2 = undefined;
    level._id_D8C5 = int( getomnvar( "ui_bomb_timer" ) );
    setomnvar( "ui_bomb_timer", 4 );
    thread scripts\mp\utility\game::_id_115DE( "used_nuke", self );
    var_1 = _id_108E6();

    if ( !isdefined( var_1 ) )
        return;

    var_1 thread _id_1395B( self );
    var_1 thread _id_1395A();
    var_1 thread _id_13959( var_0 );
}

_id_108E6()
{
    var_0 = level.mapcenter;
    var_1 = 0;
    var_2 = ( 0, var_1, 0 );
    var_3 = 24000;
    var_4 = 10000;
    var_5 = 15000;
    var_6 = 5000;
    var_7 = getmonsflightpath( var_0, var_2, var_3, undefined, var_4, var_5, var_6 );
    var_8 = var_0 * ( 1, 1, 0 );
    var_9 = var_8 + ( 0, 0, var_4 );
    var_10 = var_7["startPoint"];
    var_11 = vectortoangles( var_9 - var_10 );
    var_12 = spawn( "script_model", var_10 );
    var_12 setmodel( "veh_mil_air_ca_olympus_mons_mp" );
    var_12.angles = var_11;
    var_12.team = self.team;
    var_12.owner = self;
    var_12._id_C96C = var_9;
    var_12 setcandamage( 0 );
    var_12 setscriptablepartstate( "body", "hide", 0 );
    return var_12;
}

getmonsflightpath( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = var_0 + anglestoforward( var_1 ) * ( -1 * var_2 );

    if ( isdefined( var_3 ) )
        var_8 *= ( 1, 1, 0 );

    var_8 += ( 0, 0, var_4 );
    var_9 = var_0 + anglestoforward( var_1 ) * var_2;

    if ( isdefined( var_3 ) )
        var_9 *= ( 1, 1, 0 );

    var_9 += ( 0, 0, var_4 );
    var_10 = length( var_8 - var_9 );
    var_11 = var_10 / var_5;
    var_10 = abs( var_10 / 2 + var_6 );
    var_12 = var_10 / var_5;
    var_13["startPoint"] = var_8;
    var_13["endPoint"] = var_9;
    var_13["bombTime"] = var_12;
    var_13["flyTime"] = var_11;
    return var_13;
}

_id_1395B( var_0 )
{
    soundsettimescalefactor( "music_lr", 0 );
    soundsettimescalefactor( "music_lsrs", 0 );
    soundsettimescalefactor( "weap_plr_fire_1_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_2_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_3_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_4_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_overlap_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_lfe_2d", 0 );
    soundsettimescalefactor( "weap_plr_fire_alt_1_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_alt_2_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_alt_3_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_alt_4_2d", 0.25 );
    soundsettimescalefactor( "scn_fx_unres_3d", 0.15 );
    soundsettimescalefactor( "scn_fx_unres_2d", 0.15 );
    soundsettimescalefactor( "spear_refl_close_unres_3d_lim", 0.15 );
    soundsettimescalefactor( "spear_refl_unres_3d_lim", 0.15 );
    soundsettimescalefactor( "weap_npc_main_3d", 0.15 );
    soundsettimescalefactor( "weap_npc_mech_3d", 0.15 );
    soundsettimescalefactor( "weap_npc_mid_3d", 0.15 );
    soundsettimescalefactor( "weap_npc_lfe_3d", 0 );
    soundsettimescalefactor( "weap_npc_dist_3d", 0.15 );
    soundsettimescalefactor( "weap_npc_lo_3d", 0.15 );
    soundsettimescalefactor( "melee_npc_3d", 0.15 );
    soundsettimescalefactor( "melee_plr_2d", 0.15 );
    soundsettimescalefactor( "special_hi_unres_1_3d", 0.15 );
    soundsettimescalefactor( "special_lo_unres_1_2d", 0 );
    soundsettimescalefactor( "bulletflesh_npc_1_unres_3d_lim", 0.15 );
    soundsettimescalefactor( "bulletflesh_npc_2_unres_3d_lim", 0.15 );
    soundsettimescalefactor( "bulletflesh_1_unres_3d_lim", 0.15 );
    soundsettimescalefactor( "bulletflesh_2_unres_3d_lim", 0.15 );
    soundsettimescalefactor( "foley_plr_mvmt_unres_2d_lim", 0.2 );
    soundsettimescalefactor( "scn_fx_unres_2d_lim", 0.2 );
    soundsettimescalefactor( "scn_fx_special_unres_2d", 0 );
    soundsettimescalefactor( "menu_1_2d_lim", 0 );
    soundsettimescalefactor( "equip_use_unres_3d", 0.15 );
    soundsettimescalefactor( "explo_1_3d", 0.15 );
    soundsettimescalefactor( "explo_2_3d", 0.15 );
    soundsettimescalefactor( "explo_3_3d", 0.15 );
    soundsettimescalefactor( "explo_4_3d", 0.15 );
    soundsettimescalefactor( "explo_5_3d", 0.15 );
    soundsettimescalefactor( "explo_lfe_3d", 0.15 );
    soundsettimescalefactor( "vehicle_air_loops_3d_lim", 0.15 );
    soundsettimescalefactor( "projectile_loop_close", 0.15 );
    soundsettimescalefactor( "projectile_loop_mid", 0.15 );
    soundsettimescalefactor( "projectile_loop_dist", 0.15 );
    self endon( "nuke_ship_exit" );
    level endon( "game_ended" );
    var_0 waittill( "disconnect" );
    level._id_C1B2 = 1;
    _id_C1B5();

    if ( level._id_B335 != "mp_dome_dusk" )
        visionsetalternate( -3, 5 );

    setslowmotion( 1, 1, 0 );
    level notify( "nuke_cancelled" );
    self notify( "nuke_ship_exit" );
}

_id_13959( var_0 )
{
    self endon( "nuke_ship_exit" );
    level endon( "game_ended" );
    thread _id_1395C();
    wait 2;
    self moveto( self._id_C96C, 5, 0.2, 2 );
    thread _id_665A();
    self waittill( "near_goal" );
    thread _id_10DD1();
    level thread _id_512C( level._id_C1CD - 7.0, ::_id_C1B1, self );
    level thread _id_512C( level._id_C1CD - 3.3, ::_id_C1CC, self );
    level thread _id_512C( level._id_C1CD, ::_id_C1CB, self );
    level thread _id_512C( level._id_C1CD, ::_id_C1CA, self );
    level thread _id_512C( level._id_C1CD, ::_id_C1BE, self );
    level thread _id_512C( level._id_C1CD, ::_id_C1BC, self );
    level thread _id_512C( level._id_C1CD + 0.25, ::_id_C1CE, self );
    level thread _id_512C( level._id_C1CD + 1.5, ::_id_C1B8, self );
    self waittill( "at_goal" );
    self _meth_8294( "veh_mil_air_ca_mons_mp_doors_open", 1 );

    if ( !isdefined( level._id_C1AE ) )
    {
        level._id_C1AE = spawn( "script_origin", ( 0, 0, 1 ) );
        level._id_C1AE hide();
    }

    scripts\mp\rank::_id_1835( 2, level._id_C1C5.team, "nuke" );

    if ( level._id_3883 && var_0 )
        level thread _id_3884( level._id_C1C5.player );
}

_id_10DD1()
{
    level endon( "nuke_cancelled" );
    setomnvar( "ui_nuke_countdown_active", 1 );

    if ( level._id_B335 != "mp_dome_dusk" )
        visionsetalternate( -1, 10 );

    level thread _id_12E43();

    if ( !isdefined( level._id_C1A7 ) )
    {
        level._id_C1A7 = spawn( "script_origin", ( 0, 0, 0 ) );
        level._id_C1A7 hide();
    }

    for ( var_0 = level._id_C1CD; var_0 > 0; var_0-- )
    {
        if ( var_0 == 1 )
            level._id_C1A7 playsound( "mp_killstreak_nuclearstrike_alarm_last" );
        else
            level._id_C1A7 playsound( "mp_killstreak_nuclearstrike_alarm" );

        wait 1.0;
    }

    wait 5;
    self notify( "nuke_ship_exit" );
}

_id_665A()
{
    self endon( "nuke_ship_exit" );
    playfx( scripts\engine\utility::_id_7ECB( "mons_warp_in" ), self._id_C96C );
    playloopsound( self._id_C96C, "ks_nuke_mons_arrive" );
    wait 0.545;
    scripts\mp\shellshock::_id_1245( 0.8, 0.5, level.mapcenter, 100000 );
    playfx( scripts\engine\utility::_id_7ECB( "mons_warp_flash" ), self._id_C96C );
    self setscriptablepartstate( "body", "show", 0 );
    wait 0.5;
    self setscriptablepartstate( "thrusters_burst", "active", 0 );
    self playsound( "ks_nuke_mons_start" );
    wait 4;
    self setscriptablepartstate( "thrusters", "active", 0 );
    wait 1;
    self setscriptablepartstate( "thrusters_burst", "neutral", 0 );
}

_id_1395C()
{
    self endon( "nuke_ship_exit" );

    for (;;)
    {
        var_0 = distance( self.origin, self._id_C96C );

        if ( var_0 <= 5000 && !isdefined( self._id_BE83 ) )
        {
            self notify( "near_goal" );
            self._id_BE83 = 1;
        }

        if ( var_0 == 0 )
        {
            self notify( "at_goal" );
            break;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_1395A()
{
    self waittill( "nuke_ship_exit" );
    playfx( scripts\engine\utility::_id_7ECB( "mons_warp_out" ), self.origin );
    playloopsound( self.origin, "ks_nuke_mons_ftl_buildup" );
    wait 3;
    scripts\mp\shellshock::_id_1245( 0.8, 0.5, level.mapcenter, 100000 );
    playloopsound( self.origin, "ks_nuke_mons_ftl_out" );
    playfx( scripts\engine\utility::_id_7ECB( "mons_warp_flash" ), self.origin );
    self delete();
    level._id_C1C4 = undefined;
}

_id_8051()
{
    var_0 = 150;
    var_1 = 100000;
    var_2 = self.angles[1];
    var_3 = ( 0, var_2, 0 );
    var_4 = self.origin + anglestoforward( var_3 ) * var_1;
    return var_4;
}

_id_3884( var_0 )
{
    level waittill( "game_ended" );
    var_0 scripts\engine\utility::waittill_any( "death", "disconnect" );
    _id_C1B5();
    level._id_C1C4 = undefined;
    level notify( "nuke_cancelled" );
}

_id_C1B1( var_0 )
{
    var_0 endon( "nuke_ship_exit" );
    level endon( "nuke_cancelled" );
    playfx( scripts\engine\utility::_id_7ECB( "mons_laser_charge" ), var_0.origin );
    var_0 playsound( "ks_nuke_mons_prepare" );
    var_1 = 15;
    scripts\mp\shellshock::_id_1245( 0.1, var_1, level.mapcenter, 100000 );
}

_id_C1CC( var_0 )
{
    var_0 endon( "nuke_ship_exit" );
    level endon( "nuke_cancelled" );
}

_id_C1CB( var_0 )
{
    var_0 endon( "nuke_ship_exit" );
    level endon( "nuke_cancelled" );

    if ( isdefined( level._id_C1AE ) )
        return;
}

_id_C1B5( var_0 )
{
    var_1 = 0;

    if ( isdefined( level._id_D8C5 ) )
        var_1 = level._id_D8C5;

    setomnvar( "ui_bomb_timer", var_1 );
    setomnvar( "ui_nuke_countdown_active", 0 );
}

_id_C1BE( var_0 )
{
    var_0 endon( "nuke_ship_exit" );
    level endon( "nuke_cancelled" );
    _id_C1B5();
    level._id_C1BB = 1;
    var_0 playsound( "ks_nuke_mons_laser" );
    playfx( scripts\engine\utility::_id_7ECB( "mons_laser_flash" ), var_0.origin - ( 0, 0, 500 ) );
    playfx( scripts\engine\utility::_id_7ECB( "mons_laser_smoke" ), level.mapcenter );
}

_id_C1CA( var_0 )
{
    var_0 endon( "nuke_ship_exit" );
    level endon( "nuke_cancelled" );
    setslowmotion( 1.0, 0.25, 0.5 );
    level waittill( "nuke_death" );
    setslowmotion( 0.25, 1, 3.0 );
}

_id_C1CE( var_0 )
{
    var_0 endon( "nuke_ship_exit" );
    level endon( "nuke_cancelled" );
    level._id_C1CF = 1;

    if ( level._id_B335 != "mp_dome_dusk" )
        visionsetalternate( -2, 1.5 );

    setdvar( "r_materialBloomHQScriptMasterEnable", 0 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.5 );
    level notify( "nuke_aftermath_post_started" );
    level waittill( "nuke_death" );
    var_0 _meth_8294( "veh_mil_air_ca_mons_mp_doors_close", 1 );
    level thread _id_12EDA();

    foreach ( var_2 in level.players )
    {
        if ( scripts\mp\utility\game::isreallyalive( var_2 ) )
            playfxontagforclients( scripts\engine\utility::_id_7ECB( "mons_screen_ash" ), var_2, "tag_eye", var_2 );
    }

    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 3.1 );

    if ( level._id_B335 != "mp_dome_dusk" )
        visionsetalternate( -3, 1 );
}

_id_C1B8( var_0 )
{
    var_0 endon( "nuke_ship_exit" );
    level endon( "nuke_cancelled" );
    level endon( "game_ended" );
    level notify( "nuke_death" );
    scripts\mp\hostmigration::waittillhostmigrationdone();
    var_1 = 0;

    if ( level.gametype == "war" || level.gametype == "dm" )
        var_1 = 1;

    if ( isdefined( level._id_C1C5.player ) )
    {
        foreach ( var_3 in level._id_3CB5 )
        {
            if ( _id_C1B3( var_3, var_1 ) )
            {
                if ( isplayer( var_3 ) )
                {
                    var_3.nuked = 1;

                    if ( scripts\mp\utility\game::isreallyalive( var_3 ) )
                    {
                        scripts\mp\damage::addattacker( var_3, level._id_C1C5.player, undefined, "nuke_mp", 0, undefined, undefined, undefined, undefined, undefined );
                        var_3 thread scripts\mp\damage::_id_6CE1( level._id_C1C5.player, level._id_C1C5.player, 999999, 0, "MOD_EXPLOSIVE", "nuke_mp", var_3.origin, ( 0, 0, 1 ), "none", 0, 0, undefined, undefined );
                    }
                }
            }
        }

        if ( scripts\mp\utility\game::istrue( var_1 ) )
            _id_52C5();
        else
            _id_52C5( scripts\mp\utility\game::_id_8027( var_0.team ) );

        scripts\mp\utility\game::_id_D915( "killstreak ended - nuke", level._id_C1C5.player );

        if ( scripts\mp\utility\game::istrue( var_1 ) )
        {
            level._id_C1C3 = 1;
            var_5 = level._id_C1C5.player;

            if ( level.teambased )
                var_5 = level._id_C1C5.player.team;

            thread scripts\mp\gamelogic::endgame( var_5, game["end_reason"]["nuke_end"], 1 );
        }
    }

    level._id_C1C4 = undefined;
}

_id_C1B3( var_0, var_1 )
{
    if ( !isdefined( level._id_C1C5 ) )
        return 0;

    if ( scripts\mp\utility\game::istrue( var_1 ) )
        return 1;

    if ( level.teambased )
    {
        if ( isdefined( level._id_C1C5.team ) && var_0.team == level._id_C1C5.team )
            return 0;
    }
    else
    {
        var_2 = isdefined( level._id_C1C5.player ) && var_0 == level._id_C1C5.player;
        var_3 = isdefined( level._id_C1C5.player ) && isdefined( var_0.owner ) && var_0.owner == level._id_C1C5.player;

        if ( var_2 || var_3 )
            return 0;
    }

    return 1;
}

_id_C1BC( var_0 )
{
    level endon( "nuke_cancelled" );
    scripts\mp\shellshock::_id_1245( 0.2, 1.5, level.mapcenter, 100000 );
    level waittill( "nuke_death" );
    scripts\mp\shellshock::_id_1245( 0.4, 0.1, level.mapcenter, 100000 );

    foreach ( var_2 in level.players )
        var_2 playrumbleonentity( "damage_heavy" );
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread onplayerspawned();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );
    level endon( "nuke_cancelled" );

    for (;;)
    {
        self waittill( "spawned_player" );

        if ( isdefined( level._id_C1BB ) )
            thread _id_FB0F( 0.1 );
    }
}

_id_FB0F( var_0 )
{
    wait( var_0 );

    if ( level._id_B335 != "mp_dome_dusk" )
        self _meth_83FD( -3, 0 );

    playfxontagforclients( scripts\engine\utility::_id_7ECB( "mons_screen_ash" ), self, "tag_eye", self );
}

_id_12E43()
{
    level endon( "game_ended" );
    level endon( "disconnect" );
    level endon( "nuke_cancelled" );
    level endon( "nuke_death" );
    var_0 = level._id_C1CD * 1000 + gettime();
    setomnvar( "ui_nuke_end_milliseconds", var_0 );
    level waittill( "host_migration_begin" );
    var_1 = scripts\mp\hostmigration::waittillhostmigrationdone();

    if ( var_1 > 0 )
        setomnvar( "ui_nuke_end_milliseconds", var_0 + var_1 );
}

_id_12EDA()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "host_migration_end" );
        level _id_F7BC( 0 );
    }
}

_id_F7BC( var_0 )
{
    if ( isdefined( level._id_C1BA ) )
        level thread [[ level._id_C1BA ]]();
    else if ( level._id_B335 != "mp_dome_dusk" )
        visionsetalternate( -3, var_0 );
}

_id_52C5( var_0 )
{
    var_1 = "nuke_mp";
    var_2 = level._id_1655;
    var_3 = scripts\mp\perks\perkfunctions::_id_7D96();
    var_4 = undefined;

    if ( isdefined( var_2 ) && isdefined( var_3 ) )
        var_4 = scripts\engine\utility::_id_2284( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        var_4 = var_2;
    else if ( isdefined( var_3 ) )
        var_4 = var_3;

    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_4 )
        {
            if ( isdefined( var_6 ) )
                var_6 _id_0DC9::dodamagetokillstreak( 10000, level._id_C1C5.player, level._id_C1C5.player, var_0, var_6.origin, "MOD_EXPLOSIVE", var_1 );
        }
    }
}

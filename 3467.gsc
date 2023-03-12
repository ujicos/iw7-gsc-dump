// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    _id_FAB1();
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "bombardment", ::_id_128DC, undefined, undefined, ::triggeredbombardmentweapon, ::_id_13C8B );
    level._id_4D82["bombardment"] = 160000;
    var_0 = [ "passive_fast_launch", "passive_decreased_explosions", "passive_extra_selection", "passive_increased_cost", "passive_impulse_explosion", "passive_single_explosion" ];
    _id_0AC7::_id_DF07( "bombardment", var_0 );
}

_id_FAB1()
{
    level._effect["spike_charge"] = loadfx( "vfx/iw7/_requests/mp/vfx_bombard_blast_source.vfx" );
    level._effect["spike_fire"] = loadfx( "vfx/iw7/_requests/mp/vfx_bombardment_aerial_blast.vfx" );
    level._effect["spike_trail"] = loadfx( "vfx/iw7/_requests/mp/vfx_bombard_projectile_trail.vfx" );
}

_id_13C8B( var_0 )
{
    if ( scripts\mp\utility\game::istrue( level._id_2C48 ) )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }

    _id_0DAC::_id_10DC2( 0, 0, undefined );
}

_id_128DC( var_0 )
{
    var_1 = _id_F1AC( var_0._id_AC68, var_0._id_110EA, var_0 );

    if ( !isdefined( var_1 ) || !var_1 )
        return 0;

    return 1;
}

_id_F1AC( var_0, var_1, var_2 )
{
    scripts\engine\utility::_id_1C6E( 0 );
    scripts\engine\utility::_id_1C76( 0 );
    var_3 = 3;
    var_4 = "Multi-Strike";
    var_5 = "used_bombardment";
    var_6 = _id_0AC7::getrarityforlootitem( var_2._id_1318B );

    if ( var_6 != "" )
        var_5 = var_5 + "_" + var_6;

    if ( _id_0DC9::_id_A69F( var_2, "passive_extra_selection" ) )
        var_3 = 4;

    if ( _id_0DC9::_id_A69F( var_2, "passive_impulse_explosion" ) )
    {
        var_4 = "Single-Strike";
        var_7 = undefined;
    }
    else
    {
        var_8 = spawn( "script_origin", self.origin );
        self playlocalsound( "bombardment_killstreak_bootup" );
        var_8 playloopsound( "bombardment_killstreak_hud_loop" );
        self _meth_84D5( "mp_killstreak_overlay" );
        var_7 = _id_0DAC::_id_8112( var_1, var_3 );
        self playlocalsound( "bombardment_killstreak_shutdown" );
        self _meth_84D6();
        var_8 stoploopsound( "" );

        if ( isdefined( var_8 ) )
            var_8 delete();

        if ( !isdefined( var_7 ) )
        {
            scripts\engine\utility::_id_1C6E( 1 );
            scripts\engine\utility::_id_1C76( 1 );
            return 0;
        }
    }

    if ( scripts\mp\utility\game::istrue( level._id_2C48 ) )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        scripts\engine\utility::_id_1C6E( 1 );
        scripts\engine\utility::_id_1C76( 1 );
        return 0;
    }

    thread _id_6CD4( var_7, var_1, var_4, var_2 );
    level thread scripts\mp\utility\game::_id_115DE( var_5, self );
    scripts\mp\matchdata::_id_AFC9( var_1, self.origin );
    return 1;
}

_id_6CD4( var_0, var_1, var_2, var_3 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_4 = getent( "airstrikeheight", "targetname" );
    var_5 = var_4.origin[2] + 10000;

    if ( !isdefined( var_5 ) )
        var_5 = 20000;

    if ( !isdefined( var_2 ) )
        var_2 = "Multi-Strike";

    level._id_2C48 = 1;
    thread _id_139B2();
    var_6 = [];

    if ( var_2 == "Single-Strike" )
    {
        var_7 = [ "physicscontents_clipshot", "physicscontents_corpseclipshot", "physicscontents_missileclip", "physicscontents_solid", "physicscontents_vehicle" ];
        var_8 = physics_createcontents( var_7 );
        var_9 = [];

        foreach ( var_11 in level.players )
        {
            if ( !scripts\mp\utility\game::isreallyalive( var_11 ) )
                continue;

            if ( level.teambased && var_11.team == self.team )
                continue;

            if ( !level.teambased && var_11 == self )
                continue;

            if ( var_11 _meth_84D9() )
                continue;

            var_12 = var_11.origin + ( 0, 0, var_5 );
            var_13 = scripts\engine\trace::_id_DCED( var_12, var_11.origin - ( 0, 0, 10000 ), level._id_3CB5, var_8 );
            var_14 = var_13["position"];
            var_9[var_9.size] = spawnstruct();
            var_9[var_9.size - 1]._id_AEC4 = var_14;
        }

        var_6 = createkillcaments( var_9, var_5, var_3 );
        scripts\engine\utility::_id_1C6E( 1 );
        scripts\engine\utility::_id_1C76( 1 );
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.5 );

        foreach ( var_19, var_17 in var_9 )
        {
            var_18 = spawnstruct();
            var_18.origin = var_17._id_AEC4;
            var_18._id_110EA = var_1;
            var_18.radius = 350;
            var_18.team = self.team;
            playloopsound( var_17._id_AEC4, "bombardment_laser_on_epic" );
            level._id_2300[level._id_2300.size] = var_18;
            level thread _id_6D84( self, var_5, var_17._id_AEC4, self.angles, var_18, var_6[var_19], 0, var_3 );
            wait 0.1;
        }
    }
    else
    {
        var_6 = createkillcaments( var_0, var_5, var_3 );
        scripts\engine\utility::_id_1C6E( 1 );
        scripts\engine\utility::_id_1C76( 1 );
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.5 );

        foreach ( var_19, var_21 in var_0 )
        {
            thread sfx_bombardment_designator( var_21._id_AEC4, var_3 );

            if ( var_2 == "Multi-Strike" )
            {
                var_22 = _id_7DBB( var_21._id_AEC4, var_5, 500, var_3 );
                thread _id_6D7D( var_22, var_5, var_1, var_6[var_19], var_3 );

                if ( _id_0DC9::_id_A69F( var_3, "passive_fast_launch" ) )
                    wait 0.1;
                else
                    wait 0.2;
            }
        }
    }

    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 7 );
    level._id_2C48 = undefined;
    self notify( "bombardment_finished" );
    thread _id_D910();

    if ( isdefined( var_6 ) && var_6.size > 0 )
    {
        foreach ( var_24 in var_6 )
            var_24 delete();
    }
}

sfx_bombardment_designator( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_0 );
    var_2 setmodel( "ks_bombardment_mp" );
    var_3 = "active";
    var_4 = 5;

    if ( _id_0DC9::_id_A69F( var_1, "passive_fast_launch" ) )
    {
        var_3 = "active_fast";
        var_4 = 5;
    }

    var_2 setscriptablepartstate( "buildup", var_3, 0 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_4 );
    var_2 setscriptablepartstate( "buildup", "neutral", 0 );
    var_2 delete();
}

createkillcaments( var_0, var_1, var_2 )
{
    var_3 = [];
    var_4 = 1.5;

    foreach ( var_9, var_6 in var_0 )
    {
        var_7 = findclosestunobstructedpointonnavmeshradius( var_6._id_AEC4, var_1, 500, var_2 );
        var_8 = spawn( "script_model", var_7 + ( 0, 0, 30 ) );
        var_8 thread _id_5114( var_4, var_7 + ( 0, 0, 1500 ), 2.0, 1.0, 0.05 );
        var_3[var_3.size] = var_8;
        wait 0.2;
        var_4 -= 0.2;
    }

    return var_3;
}

_id_139B2()
{
    self endon( "bombardment_finished" );
    level endon( "game_ended" );
    scripts\engine\utility::waittill_any( "disconnect", "joined_team" );

    if ( scripts\mp\utility\game::istrue( level._id_2C48 ) )
        level._id_2C48 = undefined;
}

_id_D910()
{
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 8.0 );
    scripts\mp\utility\game::_id_D915( "killstreak ended - bombardment", self );
}

_id_5114( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    wait( var_0 );

    if ( scripts\mp\utility\game::istrue( var_5 ) )
    {
        var_7 = 0;
        var_8 = [];

        for ( var_9 = 0; var_9 < var_6; var_9++ )
        {
            var_10 = randomint( 100 );
            var_11 = randomint( 360 );
            var_12 = var_1[0] + var_10 * cos( var_11 );
            var_13 = var_1[1] + var_10 * sin( var_11 );
            var_14 = var_1[2];
            var_15 = ( var_12, var_13, var_14 );
            var_8[var_8.size] = var_15;
        }

        while ( var_7 < var_6 )
        {
            self moveto( var_8[var_7], 0.05 );
            var_7++;
            scripts\engine\utility::waitframe();
        }
    }
    else
        self moveto( var_1, var_2, var_3, var_4 );
}

findclosestunobstructedpointonnavmeshradius( var_0, var_1, var_2, var_3 )
{
    var_4 = getclosestpointonnavmesh( var_0 );
    var_5 = undefined;
    var_6 = _id_7DBB( var_0, var_1, var_2, var_3 );

    foreach ( var_8 in var_6 )
    {
        var_9 = getclosestpointonnavmesh( var_8 );
        var_10 = var_9 + ( 0, 0, 20 );
        var_11 = var_10 + ( 0, 0, 10000 );
        var_12 = scripts\engine\trace::_id_48BC( 0, 1, 1, 1, 1, 1, 0 );
        var_13 = scripts\engine\trace::_id_DCED( var_10, var_11, level._id_3CB5, var_12 );

        if ( isdefined( var_13["hittype"] ) && var_13["hittype"] == "hittype_none" )
        {
            var_14 = distance2dsquared( var_0, var_9 );

            if ( !isdefined( var_5 ) || var_14 < var_5 )
            {
                var_5 = var_14;
                var_4 = var_9;
            }
        }
    }

    return var_4;
}

_id_7DBB( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_5 = 7;

    if ( _id_0DC9::_id_A69F( var_3, "passive_fast_launch" ) )
        var_5 = 4;

    for ( var_6 = 0; var_6 < var_5; var_6++ )
    {
        var_7 = randomint( var_2 );
        var_8 = randomint( 360 );
        var_9 = var_0[0] + var_7 * cos( var_8 );
        var_10 = var_0[1] + var_7 * sin( var_8 );
        var_11 = var_0[2];
        var_12 = ( var_9, var_10, var_11 );
        var_13 = var_12 + ( 0, 0, var_1 );
        var_14 = [ "physicscontents_clipshot", "physicscontents_corpseclipshot", "physicscontents_missileclip", "physicscontents_solid", "physicscontents_vehicle" ];
        var_15 = physics_createcontents( var_14 );
        var_16 = scripts\engine\trace::_id_DCED( var_13, var_12 - ( 0, 0, 10000 ), level._id_3CB5, var_15 );
        var_4[var_4.size] = var_16["position"];
    }

    return var_4;
}

_id_6D7D( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    foreach ( var_6 in var_0 )
    {
        if ( !isdefined( self ) )
            break;

        var_7 = var_6 + ( 0, 0, var_1 );
        var_8 = var_6;
        var_9 = randomfloatrange( 0.3, 0.5 );

        if ( _id_0DC9::_id_A69F( var_4, "passive_fast_launch" ) )
            var_9 = randomfloatrange( 0.1, 0.3 );

        var_10 = spawnstruct();
        var_10.origin = var_8;
        var_10._id_110EA = var_2;
        var_10.radius = 350;
        var_10.team = self.team;
        level._id_2300[level._id_2300.size] = var_10;
        level thread _id_6D84( self, var_7, var_8, self.angles, var_10, var_3, 0, var_4 );
        wait( var_9 );
    }
}

_id_6D84( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    level endon( "game_ended" );
    var_8 = spawn( "script_model", var_2 + ( 0, 0, 3 ) );
    var_8 setmodel( "ks_bombardment_mp" );
    var_8 _meth_82DD( var_0 );
    var_8 _meth_831F( var_0 );
    var_8._id_13C2E = "bombproj_mp";
    var_8._id_110E8 = var_7;
    var_8._id_A63A = var_5;

    if ( _id_0DC9::_id_A69F( var_7, "passive_fast_launch" ) )
        var_8 setscriptablepartstate( "target", "active_fast" );
    else
        var_8 setscriptablepartstate( "target", "active" );

    var_9 = 2;

    if ( _id_0DC9::_id_A69F( var_7, "passive_fast_launch" ) )
        var_9 = 1.5;

    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_9 );
    var_8 setscriptablepartstate( "fire", "active" );

    if ( isdefined( var_0 ) )
    {
        wait 0.5;
        var_8 setscriptablepartstate( "explosion", "active", 0 );
        var_8 thread scripts\mp\utility\game::_id_5106( 5 );
        level._id_2300 = scripts\engine\utility::array_remove( level._id_2300, var_4 );
    }
    else
    {
        level._id_2300 = scripts\engine\utility::array_remove( level._id_2300, var_4 );

        if ( isdefined( var_5 ) )
            var_5 delete();
    }
}

_id_511A( var_0, var_1, var_2 )
{
    self endon( "death" );
    wait( var_0 );
    playfxontag( scripts\engine\utility::_id_7ECB( var_1 ), self, var_2 );
}

triggeredbombardmentweapon( var_0 )
{
    if ( _id_0DC9::_id_A69F( var_0, "passive_impulse_explosion" ) )
    {
        var_0._id_EF88 = "gesture_script_weapon";
        var_0.weapon = "ks_gesture_generic_mp";
        var_0._id_6D6B = "offhand_fired";
    }

    return 1;
}

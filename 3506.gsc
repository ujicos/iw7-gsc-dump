// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_E5DE = [];
    level._id_DF7E["explode"] = loadfx( "vfx/core/expl/aerial_explosion" );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "orbital_deployment", ::_id_128F2 );
    level._effect["odin_clouds"] = loadfx( "vfx/core/mp/killstreaks/odin/odin_parallax_clouds" );
    level._effect["odin_fisheye"] = loadfx( "vfx/code/screen/vfx_scrnfx_odin_fisheye.vfx" );
    level._effect["odin_targeting"] = loadfx( "vfx/core/mp/killstreaks/odin/vfx_marker_good_target" );
    level._effect["odin_targeting_bad"] = loadfx( "vfx/core/mp/killstreaks/odin/vfx_marker_bad_target" );
    level._effect["phase_out_friendly"] = loadfx( "vfx/core/mp/killstreaks/vfx_phase_orbital_deployment_friendly" );
    level._effect["phase_out_enemy"] = loadfx( "vfx/core/mp/killstreaks/vfx_phase_orbital_deployment_enemy" );
    level._effect["drop_pod_atmo"] = loadfx( "vfx/core/expl/emp_flash_mp" );
    level._effect["drop_pod_fx"] = loadfx( "vfx/core/mp/killstreaks/odin/vfx_odin_flash_small" );
    level._id_C6D7 = [];
    level._id_C6D7["orbital_deployment"] = spawnstruct();
    level._id_C6D7["orbital_deployment"]._id_11901 = 60.0;
    level._id_C6D7["orbital_deployment"]._id_110EA = "orbital_deployment";
    level._id_C6D7["orbital_deployment"]._id_13260 = "odin_mp";
    level._id_C6D7["orbital_deployment"]._id_B91A = "vehicle_odin_mp";
    level._id_C6D7["orbital_deployment"]._id_115EB = "used_orbital_deployment";
    level._id_C6D7["orbital_deployment"]._id_13553 = "odin_gone";
    level._id_C6D7["orbital_deployment"]._id_1352D = "odin_target_killed";
    level._id_C6D7["orbital_deployment"]._id_1352C = "odin_targets_killed";
    level._id_C6D7["orbital_deployment"]._id_12B20 = 3;
    level._id_C6D7["orbital_deployment"]._id_12B80 = &"KILLSTREAKS_ODIN_UNAVAILABLE";
    level._id_C6D7["orbital_deployment"].weapon["juggernaut"] = spawnstruct();
    level._id_C6D7["orbital_deployment"].weapon["juggernaut"]._id_D5E4 = "null";
    level._id_C6D7["orbital_deployment"].weapon["juggernaut"]._id_D5DD = "odin_jugg_launch";

    if ( !isdefined( level._id_8D7C ) )
    {
        level._id_8D7C = getent( "heli_pilot_mesh", "targetname" );

        if ( !isdefined( level._id_8D7C ) )
        {

        }
        else
            level._id_8D7C.origin += scripts\mp\utility\game::_id_7EF9();
    }

    level._id_163A = [];
}

_id_128F2( var_0 )
{
    self endon( "disconnect" );
    var_1 = var_0._id_98F2;

    if ( isdefined( self._id_12B90 ) && self._id_12B90 )
        return 0;

    var_2 = _id_10DD3( var_0._id_110EA );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    return var_2;
}

_id_10DD3( var_0, var_1 )
{
    level endon( "game_ended" );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self._id_E2D7 = vectortoangles( anglestoforward( self.angles ) );
    _id_C6CB();

    if ( var_1 == 1 )
    {
        scripts\engine\utility::_id_1C6E( 0 );
        scripts\engine\utility::_id_1C76( 0 );
        scripts\mp\utility\game::_id_93FA();
        var_2 = _id_49FB();

        if ( !isdefined( var_2 ) )
        {
            scripts\engine\utility::_id_1C76( 1 );
            scripts\mp\utility\game::_id_4FC1();
            return 0;
        }

        self remotecontrolvehicle( var_2 );
    }
    else
    {
        scripts\engine\utility::_id_1C6E( 0 );
        scripts\engine\utility::_id_1C76( 0 );
        var_3 = _id_0DAC::_id_8112( var_0 );

        if ( !isdefined( var_3 ) )
        {
            _id_C6C4();
            scripts\engine\utility::_id_1C6E( 1 );
            scripts\engine\utility::_id_1C76( 1 );
            return 0;
        }

        _id_10DD4( var_3[0]._id_AEC4, var_3[0]._id_AEC4 + ( 0, 0, 10000 ), var_0 );
    }

    return 1;
}

_id_49FB()
{
    var_0 = ( 0, 0, 0 );
    var_1 = self.origin * ( 1, 1, 0 ) + ( level._id_8D7C.origin - scripts\mp\utility\game::_id_7EF9() ) * ( 0, 0, 1 );
    var_2 = spawnhelicopter( self, var_1, var_0, level._id_C6D7["orbital_deployment"]._id_13260, level._id_C6D7["orbital_deployment"]._id_B91A );

    if ( !isdefined( var_2 ) )
        return;

    var_2._id_02B3 = 40;
    var_2.owner = self;
    var_2.team = self.team;
    var_2._id_110EA = "orbital_deployment";
    level._id_163A["orbital_deployment"] = 1;
    self._id_98FF = 1;
    self._id_A641 = 0;
    self._id_C6C3 = var_2;
    var_2 thread _id_C6D4();
    var_2 thread _id_C6D3();
    var_2 thread _id_C6D0();
    var_2 thread _id_C6D2();
    return var_2;
}

_id_C6D4()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    var_0 endon( "juggernaut_dead" );

    if ( !isai( var_0 ) )
    {
        var_0 notifyonplayercommand( "orbital_deployment_action", "+attack" );
        var_0 notifyonplayercommand( "orbital_deployment_action", "+attack_akimbo_accessible" );
    }

    for (;;)
    {
        var_0 waittill( "orbital_deployment_action" );

        if ( scripts\mp\utility\game::istrue( self._id_1156A._id_EA21 ) )
        {
            var_0 setclientomnvar( "ui_odin", -1 );
            var_0 _id_10DD4( self._id_1156A.origin, self.origin, self._id_110EA );
            var_0 remotecontrolvehicleoff( self );
            _id_4074();
            self notify( "death" );
            break;
        }
        else
            var_0 scripts\mp\utility\game::_id_13A7( "odin_negative_action" );

        wait 1.1;
    }
}

_id_7E6A( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_1 = getnodesinradiussorted( var_0, 256, 0, 128, "Path" );

    if ( !isdefined( var_1[0] ) )
        return;

    return var_1[0];
}

_id_C6D3()
{
    level endon( "game_ended" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    var_0 = level._id_C6D7["orbital_deployment"];
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0._id_11901 );
    thread _id_C6C7();
}

_id_C6D0()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner scripts\engine\utility::waittill_any( "disconnect", "joined_team", "joined_spectators" );
    thread _id_C6C7();
}

_id_C6D2()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    var_1 = var_0 getvieworigin();
    var_2 = var_1 + anglestoforward( self gettagangles( "tag_player" ) ) * 10000;
    var_3 = bullettrace( var_1, var_2, 0, self );
    var_4 = spawn( "script_model", var_3["position"] );
    var_4.angles = vectortoangles( ( 0, 0, 1 ) );
    var_4 setmodel( "tag_origin" );
    self._id_1156A = var_4;
    var_4 endon( "death" );
    var_5 = bullettrace( var_4.origin + ( 0, 0, 50 ), var_4.origin + ( 0, 0, -100 ), 0, var_4 );
    var_4.origin = var_5["position"] + ( 0, 0, 50 );
    var_4 hide();
    var_4 _meth_8388( var_0 );
    var_4 childthread _id_B9F2( var_0 );
    thread _id_10129();
    self _meth_831F( var_4 );
}

_id_B9F2( var_0 )
{
    var_0 endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    wait 1.5;
    var_1 = [];

    for (;;)
    {
        var_2 = _id_7E6A( self.origin );

        if ( isdefined( var_2 ) )
        {
            self._id_EA21 = 1;
            stopfxontag( level._effect["odin_targeting_bad"], self, "tag_origin" );
            wait 0.05;
            playfxontag( level._effect["odin_targeting"], self, "tag_origin" );
        }
        else
        {
            self._id_EA21 = 0;
            stopfxontag( level._effect["odin_targeting"], self, "tag_origin" );
            wait 0.05;
            playfxontag( level._effect["odin_targeting_bad"], self, "tag_origin" );
        }

        var_3 = var_0 scripts\mp\utility\game::_id_7BC3();

        foreach ( var_5 in var_1 )
        {
            if ( !scripts\engine\utility::array_contains( var_3, var_5 ) )
            {
                var_1 = scripts\engine\utility::array_remove( var_1, var_5 );
                self hide();
                self _meth_8388( var_0 );
            }
        }

        foreach ( var_5 in var_3 )
        {
            self _meth_8388( var_5 );

            if ( !scripts\engine\utility::array_contains( var_1, var_5 ) )
            {
                var_1 = scripts\engine\utility::_id_2279( var_1, var_5 );
                stopfxontag( level._effect["odin_targeting"], self, "tag_origin" );
                wait 0.05;
                playfxontag( level._effect["odin_targeting"], self, "tag_origin" );
            }
        }

        wait 0.05;
    }
}

_id_10129()
{
    self endon( "death" );
    wait 1.0;
    var_0 = _id_7E6A( self._id_1156A.origin );

    if ( isdefined( var_0 ) )
        playfxontag( level._effect["odin_targeting"], self._id_1156A, "tag_origin" );
    else
        playfxontag( level._effect["odin_targeting_bad"], self._id_1156A, "tag_origin" );
}

_id_C6C7( var_0 )
{
    self endon( "death" );
    self notify( "leaving" );
    var_1 = level._id_C6D7["orbital_deployment"];
    scripts\mp\utility\game::_id_AAE7( var_1._id_13553 );

    if ( isdefined( self.owner ) )
        self.owner _id_C6C5( self, var_0 );

    self notify( "gone" );
    _id_4074();
    _id_C6CC( 3.0 );
    scripts\mp\utility\game::_id_4FC1();
    level._id_163A["orbital_deployment"] = undefined;
    self delete();
}

_id_4074()
{
    if ( isdefined( self._id_1156A ) )
        self._id_1156A delete();

    if ( isdefined( self._id_C6CA ) )
        self._id_C6CA delete();
}

_id_C6CC( var_0 )
{
    while ( isdefined( self._id_9BE2 ) && var_0 > 0 )
    {
        wait 0.05;
        var_0 -= 0.05;
    }
}

_id_C6C5( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        self setclientomnvar( "ui_odin", -1 );
        var_0 notify( "end_remote" );
        self notify( "odin_ride_ended" );
        _id_C6C4();

        if ( getdvarint( "camera_thirdPerson" ) )
            scripts\mp\utility\game::_id_F887( 1 );

        self thermalvisionfofoverlayoff();
        self remotecontrolvehicleoff( var_0 );
        self setplayerangles( self._id_E2D7 );

        if ( isdefined( var_1 ) && var_1 )
        {
            _id_108F5();
            self._id_A641 = 0;
            scripts\engine\utility::_id_1C71( 1 );
            self notify( "weapon_change", self getcurrentweapon() );
        }

        self stopolcalsound( "odin_negative_action" );
        self stopolcalsound( "odin_positive_action" );

        foreach ( var_3 in level._id_C6D7["orbital_deployment"].weapon )
        {
            if ( isdefined( var_3._id_D5E4 ) )
                self stopolcalsound( var_3._id_D5E4 );

            if ( isdefined( var_3._id_D5DD ) )
                self stopolcalsound( var_3._id_D5DD );
        }

        if ( isdefined( var_0._id_A4A3 ) )
            var_0._id_A4A3 scripts\mp\bots\bots_strategy::_id_2DC1( self, 350 );

        self notify( "stop_odin" );
    }
}

_id_108F5()
{
    self._id_98FF = 0;
    var_0 = self [[ level.getspawnpoint ]]();
    var_1 = var_0.origin;
    var_2 = var_0.angles;
    self.angles = var_2;
    self setorigin( var_1, 1 );

    foreach ( var_4 in level.players )
    {
        if ( var_4 != self )
            self _meth_8388( var_4 );
    }
}

_id_10DD8()
{
    var_0 = undefined;

    if ( self.team == "allies" )
        var_0 = "axis";
    else if ( self.team == "axis" )
        var_0 = "allies";
    else
    {

    }

    var_1 = anglestoforward( self.angles );
    var_2 = anglestoup( self.angles );

    foreach ( var_4 in level.players )
    {
        if ( var_4 != self )
        {
            self _meth_8429( var_4 );

            if ( var_4.team == self.team )
            {
                playfx( level._effect["phase_out_friendly"], self.origin, var_1, var_2 );
                continue;
            }

            playfx( level._effect["phase_out_enemy"], self.origin, var_1, var_2 );
        }
    }
}

_id_C6CB()
{
    scripts\mp\utility\game::_id_FB09( "orbital_deployment" );
}

_id_C6C4()
{
    if ( isdefined( self ) )
        scripts\mp\utility\game::_id_41E9();
}

_id_10DD4( var_0, var_1, var_2 )
{
    _id_10D70();
    self waittill( "blackout_done" );
    scripts\mp\utility\game::_id_7385( 1 );
    level thread _id_B9CB( self );
    level thread _id_B9DD( self );
    level thread _id_B9FD( self );
    var_3 = scripts\mp\killstreaks\killstreaks::_id_98C2( var_2 );

    if ( var_3 == "success" )
        level thread _id_1285( var_0, var_1, self, var_2 );
    else
    {
        self notify( "end_kill_streak" );
        _id_C6C4();
        scripts\engine\utility::_id_1C6E( 1 );
        scripts\engine\utility::_id_1C76( 1 );
    }

    level thread scripts\mp\utility\game::_id_115DE( level._id_C6D7["orbital_deployment"]._id_115EB, self );
}

_id_1285( var_0, var_1, var_2, var_3 )
{
    var_2._id_98FF = 1;
    var_4 = 0;
    var_5 = var_0;
    var_6 = var_1;
    var_7 = vectornormalize( var_6 - var_5 );
    var_6 = var_7 * 14000 + var_5;
    var_8 = scripts\mp\utility\game::_id_1309( "drone_hive_projectile_mp", var_6 - ( 0, 0, 5000 ), var_5, var_2 );
    var_8 _meth_830B( 1 );
    var_9 = spawn( "script_model", var_8.origin );
    var_9 setmodel( "jsp_drop_pod_top" );
    var_9 linkto( var_8, "tag_origin" );
    var_9 _meth_831F( var_8 );
    var_9.team = var_2.team;
    var_9.owner = var_2;
    var_9 _id_0DC9::_id_1843( var_3, "Killstreak_Air", var_9.owner, 1 );

    if ( scripts\mp\utility\game::isreallyalive( var_2 ) )
        var_2 _id_10DD8();

    if ( isdefined( var_2.fauxdeath ) && var_2.fauxdeath )
    {
        var_2._id_6BA6 = var_2 getstance();
        var_2 thread scripts\mp\playerlogic::_id_108F2( 0 );
        var_4 = 1;
    }

    var_2 setorigin( var_8.origin + ( 0, 0, 10 ), 1 );
    var_8 thread _id_13A22( "large_rod" );
    var_8.team = var_2.team;
    var_8.type = "remote";
    var_8.owner = var_2;
    var_8 thread scripts\mp\killstreaks\remotemissile::_id_898C();
    level._id_DF80 = 1;
    level thread _id_B9C8( var_8, 1 );
    level thread _id_B9C1( var_8 );
    _id_C6D6( var_2, var_8 );
    var_2 setclientomnvar( "ui_predator_missile", 3 );
    var_2 setclientomnvar( "ui_predator_missiles_left", 0 );
    playfx( level._effect["drop_pod_atmo"], var_8.origin );
    var_8 thread _id_5821();
    var_8 thread _id_13AA4( var_2 );
    var_8 thread _id_13AA3( var_2 );

    for (;;)
    {
        var_10 = var_8 scripts\engine\utility::_id_13734( "death", "missileTargetSet" );
        scripts\mp\hostmigration::waittillhostmigrationdone();

        if ( var_10 == "death" )
            break;

        if ( !isdefined( var_8 ) )
            break;
    }

    if ( isdefined( var_8 ) )
    {
        var_0 = var_8.origin;

        if ( isdefined( var_2 ) )
            var_2 scripts\mp\matchdata::_id_AFC9( var_3, var_8.origin );
    }

    level thread _id_E474( var_2, undefined, var_0, var_9, var_4 );
}

_id_B9C1( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        var_0.owner waittill( "missileTargetSet" );
        var_0 notify( "missileTargetSet" );
    }
}

_id_C6D6( var_0, var_1 )
{
    var_0 scripts\mp\utility\game::_id_7385( 1 );
    var_0 cameralinkto( var_1, "tag_origin" );
    var_0 _meth_808D( var_1 );
    var_0 _meth_83F9( "default", 0 );
    var_0 thread scripts\mp\utility\game::_id_F607( "default", 0, undefined, 1 );
    var_0 _meth_83F9( game["thermal_vision"], 1.0 );
    var_0 thread _id_50FF();
}

_id_50FF()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.25 );
    self _meth_83BE();
}

_id_13A22( var_0 )
{
    self waittill( "explode", var_1 );

    if ( var_0 == "small_rod" )
    {
        playrumbleonentity( "grenade_rumble", var_1 );
        earthquake( 0.7, 1.0, var_1, 1000 );
    }
    else if ( var_0 == "large_rod" )
    {
        playrumbleonentity( "artillery_rumble", var_1 );
        earthquake( 1.0, 1.0, var_1, 2000 );
    }
}

_id_13AA4( var_0 )
{
    var_0 endon( "killstreak_disowned" );
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "death" );

    for (;;)
    {
        level waittill( "host_migration_begin" );

        if ( isdefined( self ) )
        {
            var_0 _meth_83F9( game["thermal_vision"], 0 );
            var_0 scripts\mp\utility\game::_id_F607( "default", 0, undefined, 1 );
            var_0 _meth_83BE();
            continue;
        }

        var_0 setclientomnvar( "ui_predator_missile", 2 );
    }
}

_id_13AA3( var_0 )
{
    var_0 endon( "killstreak_disowned" );
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "death" );

    for (;;)
    {
        level waittill( "host_migration_end" );

        if ( isdefined( self ) )
        {
            var_0 setclientomnvar( "ui_predator_missile", 3 );
            continue;
        }

        var_0 setclientomnvar( "ui_predator_missile", 2 );
    }
}

_id_B9CB( var_0 )
{
    var_0 endon( "disconnect" );
    var_0 endon( "end_kill_streak" );
    var_0 waittill( "killstreak_disowned" );
    level thread _id_E474( var_0 );
}

_id_B9DD( var_0 )
{
    var_0 endon( "disconnect" );
    var_0 endon( "end_kill_streak" );
    level waittill( "game_ended" );
    level thread _id_E474( var_0 );
}

_id_B9FD( var_0 )
{
    var_0 endon( "end_kill_streak" );
    var_0 endon( "disconnect" );
    level waittill( "objective_cam" );
    level thread _id_E474( var_0, 1 );
}

_id_B9C8( var_0, var_1 )
{
    var_0 waittill( "death" );
    scripts\mp\hostmigration::waittillhostmigrationdone();

    if ( isdefined( var_0._id_114F1 ) )
        var_0._id_114F1 delete();

    if ( isdefined( var_0._id_6649 ) )
        level._id_E5DE[var_0._id_6649] = undefined;

    if ( var_1 )
        level._id_DF80 = undefined;
}

_id_E474( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( var_3 ) )
            var_3 thread _id_51B1();

        return;
    }

    var_0 setclientomnvar( "ui_predator_missile", 2 );
    var_0 notify( "end_kill_streak" );
    var_0 notify( "orbital_deployment_complete" );
    var_0 thermalvisionfofoverlayoff();
    var_0 _meth_808E();

    if ( !isdefined( var_1 ) )
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.95 );

    var_0 cameraunlink();
    var_0 setclientomnvar( "ui_predator_missile", 0 );

    if ( !var_4 )
    {
        var_0 _id_C6C4();
        var_0 scripts\engine\utility::_id_1C76( 1 );
    }
    else
    {
        var_0 scripts\engine\utility::_id_1C58( 0 );
        var_0 scripts\engine\utility::_id_1C76( 0 );
        var_0 _id_C6C4();
        var_0 scripts\engine\utility::_id_1C76( 1 );
    }

    var_0 scripts\mp\utility\game::_id_7385( 0 );
    var_0 scripts\engine\utility::_id_1C6E( 1 );

    if ( isdefined( var_2 ) )
        var_0 _id_10D89( var_2, var_3 );
}

_id_10D89( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_0 );
    var_2.angles = self.angles;
    var_2.owner = self;
    var_2.team = self.team;
    self._id_98FF = 0;
    self setorigin( var_0 + ( 0, 0, 15 ), 1 );

    foreach ( var_4 in level.players )
    {
        if ( var_4 != self )
            self _meth_8388( var_4 );
    }

    self notify( "weapon_change", self getcurrentweapon() );
    var_1 thread _id_51B1();
}

_id_51B1()
{
    wait 0.7;
    playfx( scripts\engine\utility::_id_7ECB( "trophy_spark_fx" ), self.origin );
    self delete();
}

_id_10D70()
{
    var_0 = newclienthudelem( self );
    var_0.x = 0;
    var_0.y = 0;
    var_0._id_002B = "left";
    var_0._id_002C = "top";
    var_0._id_02A4 = 1;
    var_0._id_017D = "fullscreen";
    var_0._id_0382 = "fullscreen";
    var_0._id_0142 = 1;
    var_0 setshader( "black", 640, 480 );
    thread _id_50E0( var_0, 0, 0.05, 1 );
    var_1 = 0.1;
    childthread _id_50DE( var_0, var_1 );
}

_id_50E0( var_0, var_1, var_2, var_3 )
{
    self endon( "disconnect" );
    wait( var_1 );
    var_0 fadeovertime( var_2 );
}

_id_50DE( var_0, var_1 )
{
    wait( var_1 );
    var_0 destroy();
    self notify( "blackout_done" );
}

_id_5821()
{
    wait 0.5;
    playfx( level._effect["drop_pod_fx"], self.origin );
    wait 0.3;
    playfx( level._effect["drop_pod_fx"], self.origin );
    wait 0.3;
    playfx( level._effect["drop_pod_fx"], self.origin );
}

_id_D39C( var_0 )
{
    var_1 = self.pers["killstreaks"];

    for ( var_2 = 0; var_2 <= 3; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( isdefined( var_3 ) && var_3._id_110EA == var_0 && var_3._id_269A )
            return 1;
    }

    return 0;
}

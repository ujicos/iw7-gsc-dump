// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_12F81 = [];
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "uplink", ::_id_1290C );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "uplink_support", ::_id_1290C );
    level._id_768F = 0;
    level._id_4418 = [];
    level._id_4418["giveComExpBenefits"] = ::_id_835B;
    level._id_4418["removeComExpBenefits"] = ::_id_E0DF;
    level._id_4418["getRadarStrengthForTeam"] = ::_id_80A8;
    level._id_4418["getRadarStrengthForPlayer"] = ::_id_80A7;
    level._effect["uav_beam"] = loadfx( "vfx/old/_requests/mp_gameplay/vfx_energy_beam" );
    unblockteamradar( "axis" );
    unblockteamradar( "allies" );
    level thread _id_12F82();
    level thread _id_12F83();

    if ( level._id_768F )
        level thread _id_C799();

    var_0 = spawnstruct();
    var_0._id_110EA = "uplink";
    var_0._id_039B = "ims_projectile_mp";
    var_0._id_B91A = "mp_satcom";
    var_0._id_B924 = "mp_satcom_obj";
    var_0._id_B925 = "mp_satcom_obj_red";
    var_0._id_B91C = "mp_satcom_bombsquad";
    var_0._id_017B = &"KILLSTREAKS_HINTS_UPLINK_PICKUP";
    var_0._id_CC28 = &"KILLSTREAKS_HINTS_UPLINK_PLACE";
    var_0._id_38E3 = &"KILLSTREAKS_HINTS_UPLINK_CANNOT_PLACE";
    var_0._id_8C79 = 42;
    var_0._id_10A38 = "used_uplink";
    var_0._id_AC71 = 30;
    var_0.maxhealth = 340;
    var_0._id_1C9D = 1;
    var_0._id_1C8F = 1;
    var_0._id_4D4A = "trophy";
    var_0._id_EC44 = "destroyed_uplink";
    var_0._id_52DA = "satcom_destroyed";
    var_0._id_CC22 = 30.0;
    var_0._id_CC25 = 16.0;
    var_0._id_CC23 = 16;
    var_0._id_C56C = ::_id_C56B;
    var_0._id_C4D6 = ::_id_C4D5;
    var_0._id_CC15 = "mp_killstreak_satcom_deploy";
    var_0._id_1673 = "mp_killstreak_satcom_loop";
    var_0._id_C55B = ::_id_12F80;
    var_0._id_C4EB = ::_id_C4EA;
    var_0._id_C4F3 = ::_id_C4F2;
    var_0._id_4E74 = loadfx( "vfx/core/mp/killstreaks/vfx_ballistic_vest_death" );
    level._id_CC09["uplink"] = var_0;
    level._id_CC09["uplink_support"] = var_0;
}

_id_C799()
{
    if ( !level.teambased )
        return;

    for (;;)
    {
        level waittill( "joined_team", var_0 );
        var_0 thread _id_1383D();
    }
}

_id_1383D()
{
    self waittill( "spawned_player" );

    foreach ( var_1 in level.players )
    {
        if ( var_1.team == "spectator" )
            continue;

        var_2 = scripts\mp\utility\game::_id_C795( var_1, "cyan", var_1.team, 0, 0, "killstreak" );
    }
}

_id_12F82()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "update_uplink" );
        level childthread _id_12E5B();
    }
}

_id_12E5B()
{
    self notify( "updateAllUplinkThreads" );
    self endon( "updateAllUplinkThreads" );
    level childthread _id_4419();

    if ( level.teambased )
    {
        level childthread _id_12F41( "axis" );
        level childthread _id_12F41( "allies" );
    }
    else
        level childthread _id_12EF4();

    level childthread _id_12E79();
}

_id_4419()
{
    var_0 = [];

    if ( !level.teambased )
        level waittill( "radar_status_change_players" );
    else
    {
        while ( var_0.size < 2 )
        {
            level waittill( "radar_status_change", var_1 );
            var_0[var_0.size] = var_1;
        }
    }

    level notify( "start_com_exp" );
}

_id_12F41( var_0 )
{
    var_1 = _id_80A8( var_0 );
    var_2 = var_1 == 1;
    var_3 = var_1 >= 2;
    var_4 = var_1 >= 3;
    var_5 = var_1 >= 4;

    if ( var_3 )
        unblockteamradar( var_0 );

    if ( var_4 )
        level._id_0254[var_0] = "fast_radar";
    else
        level._id_0254[var_0] = "normal_radar";

    foreach ( var_7 in level._id_C928 )
    {
        if ( !isdefined( var_7 ) )
            continue;

        if ( var_7.team != var_0 )
            continue;

        var_7._id_FFC7 = var_2;
        var_7 _meth_82DF( var_2 );
        var_7._id_0254 = level._id_0254[var_7.team];
        var_7._id_0255 = var_5;
        var_7 _id_12F09( var_0 );
        wait 0.05;
    }

    setteamradar( var_0, var_3 );
    level notify( "radar_status_change", var_0 );
}

_id_12EF4()
{
    foreach ( var_1 in level._id_C928 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_2 = _id_80A7( var_1 );
        _id_F7F7( var_1, var_2 );
        var_1 _id_12F09();
        wait 0.05;
    }

    level notify( "radar_status_change_players" );
}

_id_12E79()
{
    level waittill( "start_com_exp" );

    foreach ( var_1 in level._id_C928 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1 _id_835B();
        wait 0.05;
    }
}

_id_835B()
{
    if ( scripts\mp\utility\game::_id_12D6( "specialty_comexp" ) )
    {
        var_0 = _id_80A6( self );
        _id_F7F7( self, var_0 );
        _id_12F09();
    }
}

_id_12F09( var_0 )
{
    var_1 = 0;

    if ( isdefined( var_0 ) )
        var_1 = _id_80A8( var_0 );
    else
        var_1 = _id_80A7( self );

    if ( scripts\mp\utility\game::_id_12D6( "specialty_comexp" ) )
        var_1 = _id_80A6( self );

    if ( var_1 > 0 )
        self setclientomnvar( "ui_satcom_active", 1 );
    else
        self setclientomnvar( "ui_satcom_active", 0 );
}

_id_E0DF()
{
    self._id_FFC7 = 0;
    self _meth_82DF( 0 );
    self._id_0255 = 0;
    self._id_0254 = "normal_radar";
    self._id_016E = 0;
    self._id_0194 = 0;
}

_id_F7F7( var_0, var_1 )
{
    var_2 = var_1 == 1;
    var_3 = var_1 >= 2;
    var_4 = var_1 >= 3;
    var_5 = var_1 >= 4;
    var_0._id_FFC7 = var_2;
    var_0 _meth_82DF( var_2 );
    var_0._id_0255 = var_5;
    var_0._id_0254 = "normal_radar";
    var_0._id_016E = var_3;
    var_0._id_0194 = 0;

    if ( var_4 )
        var_0._id_0254 = "fast_radar";
}

_id_1290C( var_0, var_1 )
{
    var_2 = scripts\mp\killstreaks\placeable::_id_838E( var_1, 1 );

    if ( var_2 )
        scripts\mp\matchdata::_id_AFC9( "uplink", self.origin );

    self._id_9D81 = undefined;
    return var_2;
}

_id_C4D5( var_0 )
{
    var_1 = self getentitynumber();

    if ( isdefined( level._id_12F81[var_1] ) )
        _id_11099();
}

_id_13A7B()
{
    self waittill( "satComTimedOut" );

    foreach ( var_1 in level._id_C928 )
    {
        if ( isdefined( var_1._id_2A3B ) )
            var_1._id_2A3B delete();
    }
}

_id_12AEF()
{
    self endon( "satComTimedOut" );
    var_0 = 3;
    var_1 = 3;
    var_2 = 0.5;
    thread _id_13A7B();

    for (;;)
    {
        foreach ( var_4 in level._id_C928 )
        {
            if ( !isdefined( var_4 ) )
                continue;

            if ( level.teambased && var_4.team == self.team )
                continue;

            if ( var_4 scripts\mp\utility\game::_id_12D6( "specialty_gpsjammer" ) )
                continue;

            if ( !scripts\mp\utility\game::isreallyalive( var_4 ) )
            {
                if ( isdefined( var_4._id_2A3B ) )
                    var_4._id_2A3B delete();

                continue;
            }

            if ( isdefined( var_4._id_12AF1 ) )
            {
                if ( isdefined( var_4._id_2A3B ) )
                    var_4._id_2A3B delete();

                var_4._id_12AF1.origin = var_4.origin;
                var_4._id_12AF2.origin = var_4.origin;
                var_4._id_12AF2.alpha = 0.95;
                var_4._id_12AF2 thread _id_6AB8( var_1, var_2 );
            }
            else
            {
                var_5 = spawn( "script_model", var_4.origin );
                var_5 setmodel( "tag_origin" );
                var_5.owner = var_4;
                var_4._id_12AF1 = var_5;
                var_4._id_12AF2 = var_5 scripts\mp\entityheadicons::_id_F73D( self.team, "headicon_enemy", ( 0, 0, 32 ), 2, 2, 1, 0.01, 0, 1, 1, 0 );
                var_4._id_12AF2.alpha = 0.95;
                var_4._id_12AF2 thread _id_6AB8( var_1, var_2 );
            }

            var_4._id_2A3B = playloopedfx( scripts\engine\utility::_id_7ECB( "uav_beam" ), var_0, var_4.origin );
        }

        wait( var_1 );
    }
}

_id_B37E()
{
    var_0 = 3;
    var_1 = 3;
    var_2 = 0.5;

    if ( !isdefined( self ) )
        return;

    if ( isdefined( self._id_12AF1 ) )
    {
        if ( isdefined( self._id_2A3B ) )
            self._id_2A3B delete();

        self._id_12AF1.origin = self.origin;
        self._id_12AF2.origin = self.origin;
        self._id_12AF2.alpha = 0.95;
        self._id_12AF2 thread _id_6AB8( var_1, var_2 );
    }
    else
    {
        var_3 = spawn( "script_model", self.origin );
        var_3 setmodel( "tag_origin" );
        var_3.owner = self;
        self._id_12AF1 = var_3;
        self._id_12AF2 = var_3 scripts\mp\entityheadicons::_id_F73D( scripts\mp\utility\game::_id_8027( self.team ), "headicon_enemy", ( 0, 0, 32 ), 14, 14, 1, 0.01, 0, 1, 1, 0 );
        self._id_12AF2.alpha = 0.95;
        self._id_12AF2 thread _id_6AB8( var_1, var_2 );
    }

    self._id_2A3B = playloopedfx( scripts\engine\utility::_id_7ECB( "uav_beam" ), var_0, self.origin );
    wait( var_1 );

    if ( isdefined( self._id_2A3B ) )
        self._id_2A3B delete();
}

_id_6AB8( var_0, var_1 )
{
    self notify( "fadeOut" );
    self endon( "fadeOut" );
    var_2 = var_0 - var_1;
    wait 0.05;

    if ( !isdefined( self ) )
        return;

    self fadeovertime( var_2 );
    self.alpha = 0.0;
}

_id_C56B( var_0 )
{
    var_1 = level._id_CC09[var_0];
    self.owner notify( "uplink_deployed" );
    self setmodel( var_1._id_B91A );
    self._id_933C = 0;
    self _meth_831F( self.owner );
    scripts\mp\sentientpoolmanager::registersentient( "Killstreak_Ground", self.owner );
    self._id_451C = var_1;

    if ( level._id_768F )
        thread _id_12AEF();

    _id_10E04( 1 );
    thread _id_13A10();
}

_id_10E04( var_0 )
{
    _id_1868( self );
    self playloopsound( self._id_451C._id_1673 );
}

_id_11099()
{
    scripts\mp\weapons::_id_11061();
    self scriptmodelclearanim();

    if ( isdefined( self._id_2C68 ) )
        self._id_2C68 scriptmodelclearanim();

    _id_E188( self );
    self stoploopsound();
}

_id_C4F2( var_0, var_1, var_2, var_3 )
{
    var_1 notify( "destroyed_equipment" );
}

_id_C4EA( var_0, var_1, var_2, var_3 )
{
    scripts\mp\weapons::_id_11061();
    scripts\mp\weapons::_id_66A6();
    _id_E188( self );
    self scriptmodelclearanim();

    if ( !self._id_933C )
        wait 3.0;

    scripts\mp\weapons::_id_66A8();
}

_id_1868( var_0 )
{
    var_1 = var_0 getentitynumber();
    level._id_12F81[var_1] = var_0;
    level notify( "update_uplink" );
}

_id_E188( var_0 )
{
    var_0 notify( "satComTimedOut" );
    var_1 = var_0 getentitynumber();
    level._id_12F81[var_1] = undefined;
    level notify( "update_uplink" );
}

_id_80A8( var_0 )
{
    var_1 = 0;

    foreach ( var_3 in level._id_12F81 )
    {
        if ( isdefined( var_3 ) && var_3.team == var_0 )
            var_1++;
    }

    if ( var_1 == 0 && isdefined( level._id_8DD7 ) && level._id_8DD7.team == var_0 )
        var_1++;

    if ( var_1 == 1 )
        var_1 = 2;

    return clamp( var_1, 0, 4 );
}

_id_80A7( var_0 )
{
    var_1 = 0;

    foreach ( var_3 in level._id_12F81 )
    {
        if ( isdefined( var_3 ) )
        {
            if ( isdefined( var_3.owner ) )
            {
                if ( var_3.owner.guid == var_0.guid )
                    var_1++;

                continue;
            }

            var_4 = var_3 getentitynumber();
            level._id_12F81[var_4] = undefined;
        }
    }

    if ( !level.teambased && var_1 > 0 )
        var_1++;

    return clamp( var_1, 0, 4 );
}

_id_80A6( var_0 )
{
    var_1 = 0;

    foreach ( var_3 in level._id_12F81 )
    {
        if ( isdefined( var_3 ) )
            var_1++;
    }

    if ( !level.teambased && var_1 > 0 )
        var_1++;

    return clamp( var_1, 0, 4 );
}

_id_12F80( var_0 )
{
    self._id_933C = 1;
    self notify( "death" );
}

_id_13A10()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        scripts\mp\weapons::_id_66A9();
        _id_11099();
        wait( var_1 );
        _id_10E04( 0 );
    }
}

_id_12F83()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "player_spawned", var_0 );
        var_1 = isdefined( var_0._id_FFC7 ) && var_0._id_FFC7;
        var_0 _meth_82DF( var_1 );
    }
}

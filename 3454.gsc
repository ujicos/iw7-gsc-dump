// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    var_0 = spawnstruct();
    var_0._id_B923 = [];
    var_0._id_B923["allies"] = "veh_mil_air_ca_jackal_drone_atmos_periph_mp";
    var_0._id_B923["axis"] = "veh_mil_air_ca_jackal_drone_atmos_periph_mp";
    var_0.vehicle = "a10_warthog_mp";
    var_0._id_93B9 = "veh_mig29_dist_loop";
    var_0._id_02B3 = 3000;
    var_0._id_8863 = 12500;
    var_0._id_8D13 = 750;
    var_0._id_3ED0 = 1;
    var_0._id_F1CA = "KS_hqr_airstrike";
    var_0._id_93BA = "KS_ast_inbound";
    var_0._id_38D9 = loadfx( "vfx/core/smktrail/smoke_trail_white_heli" );
    var_0._id_38DA = "ac130_25mm_fire";
    var_0._id_12A7B = "a10_30mm_turret_mp";
    var_0._id_12A58 = "tag_barrel";
    var_0._id_E5DD = "maverick_projectile_mp";
    var_0._id_C23F = 4;
    var_0._id_50DD = 0.125;
    var_0._id_50DC = 0.4;
    var_0._id_AF2A = "veh_hud_target_chopperfly";
    var_0.maxhealth = 1000;
    var_0._id_EC44 = "destroyed_a10_strafe";
    var_0._id_3774 = "callout_destroyed_a10";
    var_0._id_13523 = undefined;
    var_0._id_69B9 = loadfx( "vfx/core/expl/aerial_explosion" );
    var_0._id_FC39 = "veh_a10_plr_fire_gatling_lp";
    var_0._id_FC3B = "veh_a10_plr_fire_gatling_cooldown";
    var_0._id_FC3A = "veh_a10_npc_fire_gatling_lp";
    var_0._id_FC3C = "veh_a10_npc_fire_gatling_cooldown";
    var_0._id_FC38 = 500;
    var_0._id_FC37 = "veh_a10_npc_fire_gatling_short_burst";
    var_0._id_FC36 = "veh_a10_npc_fire_gatling_long_burst";
    var_0._id_FC35 = "veh_a10_bullet_impact_lp";
    var_0._id_FC41 = [];
    var_0._id_FC41[0] = "veh_a10_plr_missile_ignition_left";
    var_0._id_FC41[1] = "veh_a10_plr_missile_ignition_right";
    var_0._id_FC42 = "veh_a10_npc_missile_fire";
    var_0._id_FC40 = "veh_a10_missile_loop";
    var_0._id_FC3D = "veh_a10_plr_engine_lp";
    var_0._id_FC3E = "veh_a10_dist_loop";
    level._id_CC43["a10_strafe"] = var_0;
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "a10_strafe", ::_id_C5BB );
    _id_31D4();
}

_id_C5BB( var_0, var_1 )
{
    if ( isdefined( level._id_1490 ) )
    {
        self iprintlnbold( &"KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }
    else if ( scripts\mp\utility\game::isusingremote() || scripts\mp\utility\game::_id_9E68() )
        return 0;
    else if ( getcsplinecount() < 2 )
        return 0;
    else
    {
        thread _id_5AB7( var_0, "a10_strafe" );
        return 1;
    }
}

_id_5AB7( var_0, var_1 )
{
    self endon( "end_remote" );
    self endon( "death" );
    level endon( "game_ended" );
    var_2 = _id_8052();
    var_3 = _id_10DF5( var_1, var_0 );

    if ( var_3 )
    {
        var_4 = _id_10829( var_1, var_0, level._id_148E[var_2] );

        if ( isdefined( var_4 ) )
        {
            var_4 _id_5976();
            _id_11370( var_4, var_1 );
            var_4 = _id_10829( var_1, var_0, level._id_148E[var_2] );

            if ( isdefined( var_4 ) )
            {
                thread scripts\mp\killstreaks\killstreaks::_id_41D6( 1.0, 0.75 );
                var_4 _id_5976();
                var_4 thread _id_631B( var_1 );
                _id_638E( var_1 );
            }
        }
    }
}

_id_10DF5( var_0, var_1 )
{
    scripts\mp\utility\game::_id_FB09( "a10_strafe" );

    if ( getdvarint( "camera_thirdPerson" ) )
        scripts\mp\utility\game::_id_F887( 0 );

    self._id_E2D7 = self.angles;
    scripts\mp\utility\game::_id_7385( 1 );
    var_2 = scripts\mp\killstreaks\killstreaks::_id_98C2( "a10_strafe" );

    if ( var_2 != "success" )
    {
        if ( var_2 != "disconnect" )
            scripts\mp\utility\game::_id_41E9();

        if ( isdefined( self._id_55E6 ) && self._id_55E6 )
            scripts\engine\utility::_id_1C71( 1 );

        self notify( "death" );
        return 0;
    }

    if ( scripts\mp\utility\game::isjuggernaut() && isdefined( self._id_A4A8 ) )
        self._id_A4A8.alpha = 0;

    scripts\mp\utility\game::_id_7385( 0 );
    level._id_1490 = 1;
    self._id_13105 = 1;
    level thread scripts\mp\utility\game::_id_115DE( "used_" + var_0, self, self.team );
    return 1;
}

_id_638E( var_0 )
{
    scripts\mp\utility\game::_id_41E9();

    if ( getdvarint( "camera_thirdPerson" ) )
        scripts\mp\utility\game::_id_F887( 1 );

    if ( scripts\mp\utility\game::isjuggernaut() && isdefined( self._id_A4A8 ) )
        self._id_A4A8.alpha = 1;

    self setplayerangles( self._id_E2D7 );
    self._id_E2D7 = undefined;
    thread _id_1483();
    level._id_1490 = undefined;
    self._id_13105 = undefined;
}

_id_11370( var_0, var_1 )
{
    self._id_13118 = undefined;
    self visionsetnakedforplayer( "black_bw", 0.75 );
    thread scripts\mp\utility\game::_id_F607( "black_bw", 0.75, 0.75 );
    wait 0.75;

    if ( isdefined( var_0 ) )
        var_0 thread _id_631B( var_1 );
}

_id_10829( var_0, var_1, var_2 )
{
    var_3 = _id_49FD( var_0, var_1, var_2 );

    if ( !isdefined( var_3 ) )
        return undefined;

    var_3._id_110EA = var_0;
    self remotecontrolvehicle( var_3 );
    thread _id_13AA8( var_0, var_3 );
    var_4 = level._id_CC43[var_0];
    var_3 playloopsound( var_4._id_FC3D );
    var_3 thread _id_1485();
    scripts\mp\killstreaks\plane::_id_10E02( var_3 );
    return var_3;
}

_id_24AE( var_0 )
{
    var_1 = level._id_CC43[var_0];
    var_2 = self gettagorigin( var_1._id_12A58 );
    var_3 = spawnturret( "misc_turret", self.origin + var_2, var_1._id_12A7B, 0 );
    var_3 linkto( self, var_1._id_12A58, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3 setmodel( "vehicle_ugv_talon_gun_mp" );
    var_3.angles = self.angles;
    var_3.owner = self.owner;
    var_3 maketurretinoperable();
    var_3 _meth_835B( 0 );
    var_3 _meth_830F( "sentry_offline" );
    var_3 makeunusable();
    var_3 setcandamage( 0 );
    var_3 _meth_8336( self.owner );
    self.owner remotecontrolturret( var_3 );
    self._id_129B9 = var_3;
}

_id_40E3()
{
    if ( isdefined( self._id_129B9 ) )
        self._id_129B9 delete();

    foreach ( var_1 in self._id_11571 )
    {
        if ( isdefined( var_1["icon"] ) )
        {
            var_1["icon"] destroy();
            var_1["icon"] = undefined;
        }
    }

    self delete();
}

_id_8052()
{
    return randomint( level._id_148E.size );
}

_id_5976()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "splinePlaneReachedNode", var_0 );

        if ( isdefined( var_0 ) && var_0 == "End" )
        {
            self notify( "a10_end_strafe" );
            break;
        }
    }
}

_id_631B( var_0 )
{
    if ( !isdefined( self ) )
        return;

    self.owner remotecontrolvehicleoff( self );

    if ( isdefined( self._id_129B9 ) )
        self.owner remotecontrolturretoff( self._id_129B9 );

    self notify( "end_remote" );
    self.owner thermalvisionfofoverlayoff();
    var_1 = level._id_CC43[var_0];
    self stoploopsound( var_1._id_FC39 );
    scripts\mp\killstreaks\plane::_id_11098( self );
    wait 5;

    if ( isdefined( self ) )
    {
        self stoploopsound( var_1._id_FC3D );
        _id_40E3();
    }
}

_id_49FD( var_0, var_1, var_2 )
{
    var_3 = level._id_CC43[var_0];
    var_4 = getcsplinepointposition( var_2, 0 );
    var_5 = getcsplinepointtangent( var_2, 0 );
    var_6 = vectortoangles( var_5 );
    var_7 = spawnhelicopter( self, var_4, var_6, var_3.vehicle, var_3._id_B923[self.team] );

    if ( !isdefined( var_7 ) )
        return undefined;

    var_7 makevehiclesolidcapsule( 18, -9, 18 );
    var_7.owner = self;
    var_7.team = self.team;
    var_7._id_AC68 = var_1;
    var_7 thread scripts\mp\killstreaks\plane::_id_D4FA();
    return var_7;
}

_id_898E()
{
    level endon( "game_ended" );
    self endon( "delete" );
    self waittill( "death" );
    level._id_1490 = undefined;
    self.owner._id_13105 = undefined;
    self delete();
}

_id_1483()
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    scripts\mp\utility\game::_id_7385( 1 );
    wait 0.5;
    scripts\mp\utility\game::_id_7385( 0 );
}

_id_BA0F( var_0, var_1 )
{
    var_1 endon( "end_remote" );
    var_1 endon( "death" );
    self endon( "death" );
    level endon( "game_ended" );
    var_2 = level._id_CC43[var_0];
    var_1._id_C240 = var_2._id_C23F;
    self notifyonplayercommand( "rocket_fire_pressed", "+speed_throw" );
    self notifyonplayercommand( "rocket_fire_pressed", "+ads_akimbo_accessible" );

    if ( !level._id_4542 )
        self notifyonplayercommand( "rocket_fire_pressed", "+toggleads_throw" );

    while ( var_1._id_C240 > 0 )
    {
        self waittill( "rocket_fire_pressed" );
        var_1 _id_C52A( var_0 );
        wait( var_2._id_50DD );
    }
}

_id_BA0E( var_0, var_1 )
{
    var_1 endon( "end_remote" );
    var_1 endon( "death" );
    self endon( "death" );
    level endon( "game_ended" );
    var_2 = level._id_CC43[var_0];
    var_1._id_C240 = var_2._id_C23F;
    self notifyonplayercommand( "rocket_fire_pressed", "+speed_throw" );
    self notifyonplayercommand( "rocket_fire_pressed", "+ads_akimbo_accessible" );

    if ( !level._id_4542 )
        self notifyonplayercommand( "rocket_fire_pressed", "+toggleads_throw" );

    var_1._id_11571 = [];

    while ( var_1._id_C240 > 0 )
    {
        if ( !self adsbuttonpressed() )
            self waittill( "rocket_fire_pressed" );

        var_1 _id_B846();

        if ( var_1._id_11571.size > 0 )
            var_1 thread _id_6D76();
    }
}

_id_B88B()
{
    var_0 = [];

    foreach ( var_2 in level.players )
    {
        if ( _id_B88E( var_2 ) )
            var_0[var_0.size] = var_2;
    }

    foreach ( var_5 in level._id_12F81 )
    {
        if ( _id_B88E( var_5 ) )
            var_0[var_0.size] = var_5;
    }

    if ( var_0.size > 0 )
    {
        var_7 = sortbydistance( var_0, self.origin );
        return var_7[0];
    }

    return undefined;
}

_id_B88E( var_0 )
{
    return isalive( var_0 ) && var_0.team != self.owner.team && !_id_9EA2( var_0 ) && ( isplayer( var_0 ) && !var_0 scripts\mp\utility\game::_id_12D6( "specialty_blindeye" ) ) && _id_B8B3( var_0 ) > 0.25;
}

_id_B8B3( var_0 )
{
    var_1 = vectornormalize( var_0.origin - self.origin );
    var_2 = anglestoforward( self.angles );
    return vectordot( var_1, var_2 );
}

_id_B846()
{
    self endon( "death" );
    self endon( "end_remote" );
    level endon( "game_ended" );
    self endon( "a10_missiles_fired" );
    var_0 = level._id_CC43[self._id_110EA];
    self.owner setclientomnvar( "ui_a10_rocket_lock", 1 );
    thread _id_B8B7();
    var_1 = undefined;

    while ( self._id_11571.size < self._id_C240 )
    {
        if ( !isdefined( var_1 ) )
        {
            var_1 = _id_B88B();

            if ( isdefined( var_1 ) )
            {
                thread _id_B88F( var_1 );
                wait( var_0._id_50DC );
                var_1 = undefined;
                continue;
            }
        }

        wait 0.1;
    }

    self.owner setclientomnvar( "ui_a10_rocket_lock", 0 );
    self notify( "a10_missiles_fired" );
}

_id_B8B7()
{
    self endon( "end_remote" );
    self endon( "death" );
    level endon( "game_ended" );
    self endon( "a10_missiles_fired" );
    var_0 = self.owner;
    var_0 notifyonplayercommand( "rocket_fire_released", "-speed_throw" );
    var_0 notifyonplayercommand( "rocket_fire_released", "-ads_akimbo_accessible" );

    if ( !level._id_4542 )
        var_0 notifyonplayercommand( "rocket_fire_released", "-toggleads_throw" );

    self.owner waittill( "rocket_fire_released" );
    var_0 setclientomnvar( "ui_a10_rocket_lock", 0 );
    self notify( "a10_missiles_fired" );
}

_id_B88F( var_0 )
{
    var_1 = level._id_CC43[self._id_110EA];
    var_2 = [];
    var_2["icon"] = var_0 scripts\mp\entityheadicons::_id_F73D( self.owner, var_1._id_AF2A, ( 0, 0, -70 ), 10, 10, 0, 0.05, 1, 0, 0, 0 );
    var_2["target"] = var_0;
    self._id_11571[var_0 getentitynumber()] = var_2;
    self.owner playlocalsound( "recondrone_lockon" );
}

_id_9EA2( var_0 )
{
    return isdefined( self._id_11571[var_0 getentitynumber()] );
}

_id_6D76()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = level._id_CC43[self._id_110EA];

    foreach ( var_2 in self._id_11571 )
    {
        if ( self._id_C240 > 0 )
        {
            var_3 = _id_C529( self._id_110EA, var_2["target"], ( 0, 0, -70 ) );

            if ( isdefined( var_2["icon"] ) )
            {
                var_3._id_928E = var_2["icon"];
                var_2["icon"] = undefined;
            }

            wait( var_0._id_50DD );
            continue;
        }

        break;
    }

    var_5 = [];
}

_id_C529( var_0, var_1, var_2 )
{
    var_3 = self._id_C240 % 2;
    var_4 = "tag_missile_" + ( var_3 + 1 );
    var_5 = self gettagorigin( var_4 );

    if ( isdefined( var_5 ) )
    {
        var_6 = self.owner;
        var_7 = level._id_CC43[var_0];
        var_8 = scripts\mp\utility\game::_id_1309( var_7._id_E5DD, var_5, var_5 + 100 * anglestoforward( self.angles ), self.owner );
        var_8 thread _id_1488( var_1, var_2 );
        earthquake( 0.25, 0.05, self.origin, 512 );
        self._id_C240--;
        var_7 = level._id_CC43[var_0];
        var_8 playsoundonmovingent( var_7._id_FC41[var_3] );
        var_8 playloopsound( var_7._id_FC40 );
        return var_8;
    }

    return undefined;
}

_id_C52A( var_0 )
{
    var_1 = "tag_missile_" + self._id_C240;
    var_2 = self gettagorigin( var_1 );

    if ( isdefined( var_2 ) )
    {
        var_3 = self.owner;
        var_4 = level._id_CC43[var_0];
        var_5 = scripts\mp\utility\game::_id_1309( var_4._id_E5DD, var_2, var_2 + 100 * anglestoforward( self.angles ), self.owner );
        earthquake( 0.25, 0.05, self.origin, 512 );
        self._id_C240--;
        var_5 playsoundonmovingent( var_4._id_FC41[self._id_C240] );
        var_5 playloopsound( var_4._id_FC40 );
        self playsoundonmovingent( "a10p_missile_launch" );
    }
}

_id_1488( var_0, var_1 )
{
    thread _id_1486();
    wait 0.2;
    self _meth_8206( var_0, var_1 );
}

_id_1486()
{
    self waittill( "death" );

    if ( isdefined( self._id_928E ) )
        self._id_928E destroy();
}

_id_BA39( var_0, var_1 )
{
    var_1 endon( "end_remote" );
    var_1 endon( "death" );
    self endon( "death" );
    level endon( "game_ended" );
    var_2 = level._id_CC43[var_0];
    var_1._id_1E41 = 1350;
    self notifyonplayercommand( "a10_cannon_start", "+attack" );
    self notifyonplayercommand( "a10_cannon_start", "+attack_akimbo_accessible" );
    self notifyonplayercommand( "a10_cannon_stop", "-attack" );
    self notifyonplayercommand( "a10_cannon_stop", "-attack_akimbo_accessible" );

    while ( var_1._id_1E41 > 0 )
    {
        if ( !self attackbuttonpressed() )
            self waittill( "a10_cannon_start" );

        var_3 = gettime() + var_2._id_FC38;
        var_1 playloopsound( var_2._id_FC39 );
        var_1 thread _id_12E6D( var_0 );
        self waittill( "a10_cannon_stop" );
        var_1 stoploopsound( var_2._id_FC39 );
        var_1 playsoundonmovingent( var_2._id_FC3B );

        if ( gettime() < var_3 )
        {
            playloopsound( var_1.origin, var_2._id_FC37 );
            continue;
        }

        playloopsound( var_1.origin, var_2._id_FC36 );
    }
}

_id_12E6D( var_0 )
{
    self.owner endon( "a10_cannon_stop" );
    self endon( "death" );
    level endon( "game_ended" );
    var_1 = level._id_CC43[var_0];

    while ( self._id_1E41 > 0 )
    {
        earthquake( 0.2, 0.5, self.origin, 512 );
        self._id_1E41 -= 10;
        var_2 = self gettagorigin( "tag_flash_attach" ) + 20 * anglestoforward( self.angles );
        playfx( var_1._id_38D9, var_2 );
        self playrumbleonentity( var_1._id_38DA );
        wait 0.1;
    }

    self._id_129B9 _meth_83C6();
}

_id_B9B6( var_0, var_1 )
{
    var_1 endon( "end_remote" );
    var_1 endon( "death" );
    self endon( "death" );
    level endon( "game_ended" );
    self setclientomnvar( "ui_a10_alt_warn", 0 );

    for (;;)
    {
        var_2 = int( clamp( var_1.origin[2], 0, 16383 ) );
        self setclientomnvar( "ui_a10_alt", var_2 );

        if ( var_2 <= 1000 && !isdefined( var_1._id_1D57 ) )
        {
            var_1._id_1D57 = 1;
            self setclientomnvar( "ui_a10_alt_warn", 1 );
        }
        else if ( var_2 > 1000 && isdefined( var_1._id_1D57 ) )
        {
            var_1._id_1D57 = undefined;
            self setclientomnvar( "ui_a10_alt_warn", 0 );
        }

        wait 0.1;
    }
}

_id_13AA8( var_0, var_1 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "intro_cleared" );
    thread _id_B9B6( var_0, var_1 );
    thread _id_BA0E( var_0, var_1 );
    thread _id_BA39( var_0, var_1 );
    thread _id_13B2F( var_1, var_0 );
    self _meth_83BE();
    thread _id_13A0D( var_1 );
}

_id_13B2F( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "leaving" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    level scripts\engine\utility::waittill_any( "round_end_finished", "game_ended" );
    var_0 thread _id_631B( var_1 );
    _id_638E( var_1 );
    _id_1481();
}

_id_31D4()
{
    var_0 = [];
    var_0[0] = 1;
    var_0[1] = 2;
    var_0[2] = 3;
    var_0[3] = 4;
    var_0[4] = 1;
    var_0[5] = 2;
    var_0[6] = 4;
    var_0[7] = 3;
    var_1 = [];
    var_1[0] = 2;
    var_1[1] = 1;
    var_1[2] = 4;
    var_1[3] = 3;
    var_1[4] = 1;
    var_1[5] = 4;
    var_1[6] = 3;
    var_1[7] = 2;
    _id_31D3( var_0, var_1 );
}

_id_31D3( var_0, var_1 )
{
    level._id_148E = var_0;
    level._id_148F = var_1;
}

_id_1480()
{
    level endon( "remove_player_control" );

    for (;;)
        wait( randomfloatrange( 3.0, 7.0 ) );
}

_id_13A0D( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 endon( "a10_end_strafe" );
    var_0 thread scripts\mp\killstreaks\killstreaks::_id_1CA5();
    var_0 waittill( "killstreakExit" );
    self notify( "end_remote" );
    var_0 thread _id_631B( var_0._id_110EA );
    _id_638E( var_0._id_110EA );
    var_0 _id_1481();
}

_id_1485()
{
    self endon( "end_remote" );
    var_0 = level._id_CC43[self._id_110EA];
    scripts\mp\damage::monitordamage( var_0.maxhealth, "helicopter", ::_id_898F, ::_id_B938, 1 );
}

_id_B938( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;
    var_5 = scripts\mp\damage::_id_8999( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_89C6( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8975( var_1, var_2, var_5 );
    return var_5;
}

_id_898F( var_0, var_1, var_2, var_3 )
{
    var_4 = level._id_CC43[self._id_110EA];
    scripts\mp\damage::onkillstreakkilled( "a10", var_0, var_1, var_2, var_3, var_4._id_EC44, var_4._id_13523, var_4._id_3774 );
    _id_1481();
}

_id_1481()
{
    var_0 = level._id_CC43[self._id_110EA];
    scripts\mp\killstreaks\plane::_id_11098( self );
    playfx( var_0._id_69B9, self.origin );
    self delete();
}

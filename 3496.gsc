// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_115C9["allies"] = 0;
    level._id_115C9["axis"] = 0;
    level._id_61AD = undefined;
    level._id_61B5 = 10.0;
    level._id_61B6 = int( level._id_61B5 );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "jammer", ::_id_618B );
    level._id_A434["air_patrol"] = spawnstruct();
    level._id_A434["air_patrol"]._id_AC75 = 60;
    level._id_A434["air_patrol"].health = 99999;
    level._id_A434["air_patrol"].maxhealth = 1000;
    level._id_A434["air_patrol"]._id_110EA = "jammer";
    level._id_A434["air_patrol"]._id_13260 = "veh_jammer_drone_mp";
    level._id_A434["air_patrol"]._id_F268 = "sentry_offline";
    level._id_A434["air_patrol"]._id_B91A = "veh_jammer_drone_model";
    level._id_A434["air_patrol"]._id_A84D = "killstreak_remote_tank_laptop_mp";
    level._id_A434["air_patrol"]._id_DF7B = "killstreak_remote_tank_remote_mp";
    level._id_A434["air_patrol"]._id_12A72 = "sentry_shock_mp";
    level._effect["jammer_drone_explode"] = loadfx( "vfx/iw7/_requests/mp/vfx_jammer_drone_explosion" );
    level._effect["jammer_drone_spark"] = loadfx( "vfx/core/impacts/large_metal_painted_hit" );
    level._effect["jammer_drone_pulse"] = loadfx( "vfx/iw7/_requests/mp/vfx_jammer_drone_emp_pulse" );
    level._effect["jammer_drone_charge"] = loadfx( "vfx/iw7/_requests/mp/vfx_jammer_drone_emp_charge" );
    level._effect["jammer_drone_shockwave"] = loadfx( "vfx/iw7/_requests/mp/vfx_jammer_drone_emp_shockwave" );
    _id_F764();
    _id_F765();
}

_id_F764()
{
    level._id_A433 = scripts\engine\utility::_id_8180( "jammer_drone_start", "targetname" );
}

_id_F765()
{
    level._id_A432 = scripts\engine\utility::_id_8180( "jammer_drone_emp", "script_noteworthy" );
}

_id_618B( var_0 )
{
    var_1 = 1;
    var_2 = _id_7E37( self.origin );
    var_3 = _id_6CBF( var_2 );
    var_4 = vectortoangles( var_3.origin - var_2.origin );

    if ( !isdefined( level._id_A433 ) || !isdefined( var_2 ) || !isdefined( var_3 ) )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_UNAVAILABLE_IN_LEVEL" );
        return 0;
    }

    if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + var_1 >= scripts\mp\utility\game::_id_B4D2() )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_TOO_MANY_VEHICLES" );
        return 0;
    }

    scripts\mp\utility\game::_id_93FA();
    var_5 = _id_49DE( self, var_2, var_3, var_4, "air_patrol", var_0._id_110EA, var_0._id_AC68 );

    if ( !isdefined( var_5 ) )
        return 0;

    thread _id_376F( var_5 );
    return 1;
}

_id_49DE( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = getent( "airstrikeheight", "targetname" );
    var_8 = var_2.origin;
    var_9 = anglestoforward( var_3 );
    var_10 = var_1.origin;
    var_11 = spawnhelicopter( var_0, var_10, var_9, level._id_A434[var_4]._id_13260, level._id_A434[var_4]._id_B91A );

    if ( !isdefined( var_11 ) )
        return;

    var_11 _meth_80C7();
    var_11 _meth_81FA( 1 );
    var_11.health = level._id_A434[var_4].health;
    var_11.maxhealth = level._id_A434[var_4].maxhealth;
    var_11._id_00E1 = 0;
    var_11._id_10955 = ::_id_3758;
    var_11._id_AC68 = var_6;
    var_11._id_02B3 = 200;
    var_11.owner = var_0;
    var_11.team = var_0.team;
    var_11._id_52D0 = 0;
    var_11._id_A436 = var_4;
    var_11._id_110EA = var_5;
    var_11._id_61A3 = 0;
    var_11._id_0143 = var_9;
    var_11._id_C973 = var_10;
    var_11._id_C96C = var_8;
    var_11._id_4BF7 = var_2;
    var_11._id_A435 = 0;
    var_11 _id_0DC9::_id_1843( var_5, "Killstreak_Air", var_0, 1 );
    var_11 vehicle_setspeed( var_11._id_02B3, 70, 50 );
    var_11 setyawspeed( 120, 90 );
    var_11 setneargoalnotifydist( 150 );
    var_11 sethoverparams( 20, 10, 5 );
    var_11 _meth_831F( var_0 );
    var_11 setcandamage( 1 );
    var_11 scripts\mp\sentientpoolmanager::registersentient( "Killstreak_Air", var_0 );
    var_11 thread _id_5C29();
    var_11 thread _id_5C2A();
    var_11 thread _id_5C26();
    var_11 thread _id_5C28();
    var_11 thread _id_5C2B();
    var_11 thread _id_5C27();
    return var_11;
}

_id_376F( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_1 = 1;
    var_2 = undefined;
    thread scripts\mp\utility\game::_id_115DE( "used_jammer", self );

    for (;;)
    {
        if ( var_0._id_A435 && !isdefined( var_2 ) )
        {
            playfxontag( scripts\engine\utility::_id_7ECB( "jammer_drone_pulse" ), var_0, "tag_origin" );
            var_2 = 1;
        }
        else if ( !var_0._id_A435 && isdefined( var_2 ) )
        {
            stopfxontag( scripts\engine\utility::_id_7ECB( "jammer_drone_pulse" ), var_0, "tag_origin" );
            var_2 = undefined;
        }

        var_0 setvehgoalpos( var_0._id_C96C, var_1 );
        var_0 waittill( "near_goal" );

        if ( _id_9DD5( var_0._id_4BF7 ) && !var_0._id_A435 )
            var_0 waittill( "goal" );

        if ( !isdefined( var_0._id_DD1C ) )
        {
            var_0 vehicle_setspeed( 10, 5, 500 );
            var_0._id_DD1C = 1;
        }

        if ( _id_9DD5( var_0._id_4BF7 ) && !var_0._id_A435 )
        {
            var_0 thread _id_5C83( self );
            var_0 waittill( "finished_emp_pulse" );
        }

        var_0._id_4BF7 = _id_6CBF( var_0._id_4BF7 );
        var_0._id_C96C = var_0._id_4BF7.origin;

        if ( _id_9DD5( var_0._id_4BF7 ) && !var_0._id_A435 )
        {
            var_1 = 1;
            continue;
        }

        var_1 = 0;
    }
}

_id_9DD5( var_0 )
{
    var_1 = 0;

    foreach ( var_3 in level._id_A432 )
    {
        if ( var_0 == var_3 )
        {
            var_1 = 1;
            break;
        }
    }

    return var_1;
}

_id_6CBF( var_0 )
{
    var_1 = var_0._id_0334;
    var_2 = scripts\engine\utility::_id_817E( var_1, "targetname" );
    return var_2;
}

_id_3758( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = self;

    if ( isdefined( var_12._id_1D41 ) && var_12._id_1D41 )
        return;

    if ( !scripts\mp\weapons::_id_7415( var_12.owner, var_1 ) )
        return;

    if ( isdefined( var_3 ) && var_3 & level.idflags_penetration )
        var_12._id_1390E = 1;

    if ( isdefined( var_3 ) && var_3 & level.idflags_no_team_protection )
        self._id_1390F = 1;

    var_12._id_1390B = 1;

    if ( isdefined( var_5 ) )
    {
        switch ( var_5 )
        {
            case "precision_airstrike_mp":
                var_2 *= 4;
                break;
        }
    }

    if ( var_4 == "MOD_MELEE" )
        var_2 = var_12.maxhealth * 0.5;

    var_13 = var_2;

    if ( isplayer( var_1 ) )
    {
        var_1 scripts\mp\damagefeedback::updatedamagefeedback( "" );

        if ( var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_PISTOL_BULLET" )
        {
            if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_armorpiercing" ) )
                var_13 += var_2 * level._id_218B;
        }

        if ( isexplosivedamagemod( var_4 ) )
            var_13 += var_2;
    }

    if ( isexplosivedamagemod( var_4 ) && ( isdefined( var_5 ) && var_5 == "destructible_car" ) )
        var_13 = var_12.maxhealth;

    if ( isdefined( var_1.owner ) && isplayer( var_1.owner ) )
        var_1.owner scripts\mp\damagefeedback::updatedamagefeedback( "" );

    if ( isdefined( var_5 ) )
    {
        switch ( var_5 )
        {
            case "remotemissile_projectile_mp":
            case "javelin_mp":
            case "remote_mortar_missile_mp":
            case "stinger_mp":
            case "ac130_40mm_mp":
            case "ac130_105mm_mp":
                var_12._id_A859 = 1;
                var_13 = var_12.maxhealth + 1;
                break;
            case "stealth_bomb_mp":
            case "artillery_mp":
                var_12._id_A859 = 0;
                var_13 = var_12.maxhealth * 0.5;
                break;
            case "bomb_site_mp":
                var_12._id_A859 = 0;
                var_13 = var_12.maxhealth + 1;
                break;
            case "emp_grenade_mp":
                var_13 = 0;
                break;
            case "ims_projectile_mp":
                var_12._id_A859 = 1;
                var_13 = var_12.maxhealth * 0.5;
                break;
        }

        scripts\mp\killstreaks\killstreaks::_id_A6A0( var_1, var_5, self );
    }

    var_12._id_00E1 += var_13;

    if ( var_12._id_00E1 >= var_12.maxhealth )
    {
        if ( isplayer( var_1 ) && ( !isdefined( var_12.owner ) || var_1 != var_12.owner ) )
        {
            var_12._id_1D41 = 1;
            var_12 scripts\mp\damage::onkillstreakkilled( "jammer", var_1, var_5, var_4, var_2, "destroyed_" + var_12._id_110EA, var_12._id_110EA + "_destroyed", "callout_destroyed_" + var_12._id_110EA, 1 );
        }

        var_12 notify( "death" );
    }
}

_id_5C29()
{
    self endon( "death" );
    self.owner waittill( "disconnect" );
    self notify( "death" );
}

_id_5C2A()
{
    self endon( "death" );
    self.owner waittill( "stop_using_remote" );
    self notify( "death" );
}

_id_5C26()
{
    self endon( "death" );
    self.owner scripts\engine\utility::waittill_any( "joined_team", "joined_spectators" );
    self notify( "death" );
}

_id_5C2B()
{
    self endon( "death" );
    var_0 = level._id_A434[self._id_A436]._id_AC75;
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    self notify( "death" );
}

_id_5C27()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( isdefined( self._id_10955 ) )
            self [[ self._id_10955 ]]( undefined, var_1, var_0, var_8, var_4, var_9, var_3, var_2, undefined, undefined, var_5, var_7 );
    }
}

_id_5C28()
{
    level endon( "game_ended" );
    self waittill( "death" );
    self playsound( "sentry_explode" );
    playfx( level._effect["jammer_drone_explode"], self.origin );
    scripts\mp\utility\game::_id_4FC1();
    self delete();
}

_id_5C83( var_0 )
{
    self endon( "death" );
    self._id_A435 = 1;
    self playsound( "jammer_drone_charge" );
    playfxontag( scripts\engine\utility::_id_7ECB( "jammer_drone_charge" ), self, "tag_origin" );
    wait 1.5;
    stopfxontag( scripts\engine\utility::_id_7ECB( "jammer_drone_charge" ), self, "tag_origin" );
    playfxontag( scripts\engine\utility::_id_7ECB( "jammer_drone_shockwave" ), self, "tag_origin" );
    self playsound( "jammer_drone_shockwave" );
    thread _id_61AF();
    var_1 = var_0.pers["team"];

    if ( level.teambased )
    {
        var_2 = scripts\mp\utility\game::_id_8027( var_1 );
        thread _id_6165( var_2, var_0 );
    }
    else
        thread _id_6164( var_0 );

    var_0 scripts\mp\matchdata::_id_AFC9( "jammer", self.origin );
    level notify( "emp_used" );
    self notify( "finished_emp_pulse" );
}

_id_61AF()
{
    self endon( "death" );
    level waittill( "player_spawned", var_0 );

    if ( level.teambased )
    {
        if ( var_0 scripts\mp\killstreaks\emp_common::_id_FFC5() && var_0 != self.owner && var_0.team != self.owner.team )
        {
            var_0 scripts\mp\killstreaks\emp_common::_id_20C3();
            var_0 shellshock( "flashbang_mp", 0.5 );
            var_0 thread _id_DF77( self );
        }
    }
    else if ( var_0 scripts\mp\killstreaks\emp_common::_id_FFC5() && var_0 != self.owner )
    {
        var_0 scripts\mp\killstreaks\emp_common::_id_20C3();
        var_0 shellshock( "flashbang_mp", 0.5 );
        var_0 thread _id_DF77( self );
    }
}

_id_6165( var_0, var_1 )
{
    level endon( "game_ended" );
    wait 0.5;
    level notify( "EMP_JamTeam" + var_0 );
    level endon( "EMP_JamTeam" + var_0 );

    foreach ( var_3 in level.players )
    {
        if ( var_3 scripts\mp\killstreaks\emp_common::_id_FFC5() && var_3 != var_1 && var_3.team != var_1.team )
        {
            var_3 scripts\mp\killstreaks\emp_common::_id_20C3();
            var_3 shellshock( "flashbang_mp", 0.5 );
            var_3 thread _id_DF77( self );
        }
    }

    level thread scripts\mp\killstreaks\emp_common::_id_20CD();
    level notify( "emp_update" );
    level _id_52C5( var_1, var_0 );
    level._id_115C9[var_0] = 1;
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 60 );
    level._id_115C9[var_0] = 0;

    if ( isdefined( self ) )
        self._id_A435 = 0;

    level notify( "emp_update" );
}

_id_6164( var_0 )
{
    level notify( "EMP_JamPlayers" );
    level endon( "EMP_JamPlayers" );
    wait 0.5;

    if ( !isdefined( var_0 ) )
        return;

    level._id_61AD = var_0;

    foreach ( var_2 in level.players )
    {
        if ( var_2 scripts\mp\killstreaks\emp_common::_id_FFC5() && var_2 != var_0 )
        {
            var_2 scripts\mp\killstreaks\emp_common::_id_20C3();
            var_2 shellshock( "flashbang_mp", 0.5 );
            var_2 thread _id_DF77( self );
        }
    }

    level thread scripts\mp\killstreaks\emp_common::_id_20CD();
    level notify( "emp_update" );
    level._id_61AD thread _id_61AE();
    level _id_52C5( var_0 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 60 );

    if ( isdefined( self ) )
        self._id_A435 = 0;

    level notify( "emp_update" );
    level notify( "emp_ended" );
}

_id_A577()
{
    level notify( "keepEMPTimeRemaining" );
    level endon( "keepEMPTimeRemaining" );
    level endon( "emp_ended" );

    for ( level._id_61B6 = int( level._id_61B5 ); level._id_61B6; level._id_61B6-- )
        wait 1.0;
}

_id_61AE()
{
    level endon( "EMP_JamPlayers" );
    level endon( "emp_ended" );
    self waittill( "disconnect" );
    level notify( "emp_update" );
}

_id_531D( var_0, var_1, var_2 )
{
    var_3 = "killstreak_jammer_mp";

    if ( isdefined( var_2 ) )
        var_3 = var_2;

    scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, var_3, level._id_12A83 );
    scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, var_3, level._id_CC11 );
    scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, var_3, level._id_27EF );
    scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, var_3, level._id_B779 );
}

_id_52CA( var_0, var_1, var_2 )
{
    var_3 = "aamissile_projectile_mp";

    if ( isdefined( var_2 ) )
        var_3 = var_2;

    scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, var_3, level._id_8DD3 );
    scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, var_3, level._id_AD8B );
    scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, var_3, level._id_DF74 );
    scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, var_3, level._id_CC46 );
    scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, var_3, level._id_105EA );

    if ( isdefined( var_1 ) )
        scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, var_3, level._id_12AF3[var_1] );
    else
    {
        var_4 = [];

        foreach ( var_7, var_6 in level._id_12AF3 )
        {
            if ( issubstr( var_7, var_0.guid ) )
                continue;

            var_4[var_4.size] = var_6;
        }

        scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, var_3, var_4 );
    }

    var_8 = [];

    if ( isdefined( var_1 ) )
    {
        foreach ( var_10 in level.players )
        {
            if ( var_10.team == var_0.team )
                continue;

            if ( scripts\mp\utility\game::_id_9EF0( var_10 ) )
                var_8[var_8.size] = var_10;
        }

        scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, var_3, var_8 );
    }
}

_id_52C5( var_0, var_1, var_2 )
{
    level _id_531D( var_0, var_1, var_2 );
    level _id_52CA( var_0, var_1, var_2 );
}

_id_7E37( var_0 )
{
    var_1 = undefined;
    var_2 = 999999;

    foreach ( var_4 in level._id_A433 )
    {
        var_5 = distance( var_4.origin, var_0 );

        if ( var_5 < var_2 )
        {
            var_1 = var_4;
            var_2 = var_5;
        }
    }

    return var_1;
}

_id_DF77( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 waittill( "death" );
    scripts\mp\killstreaks\emp_common::_id_E0F3();
}

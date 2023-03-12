// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_B897 = 14000;
    level._id_B895 = 7000;
    level._id_B896 = 1500;
    level._id_E5DE = [];
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "predator_missile", ::_id_128F6 );
    level._id_DF7E["explode"] = loadfx( "vfx/core/expl/aerial_explosion" );
}

_id_128F6( var_0, var_1 )
{
    scripts\mp\utility\game::_id_FB09( "remotemissile" );
    var_2 = scripts\mp\killstreaks\killstreaks::_id_98C2();

    if ( var_2 != "success" )
    {
        if ( var_2 != "disconnect" )
            scripts\mp\utility\game::_id_41E9();

        return 0;
    }

    self setclientomnvar( "ui_predator_missile", 1 );
    level thread _id_1282( var_0, self );
    return 1;
}

_id_7E01( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_3._id_1314F = [];
        var_3._id_10909 = 0;
    }

    foreach ( var_6 in level.players )
    {
        if ( !scripts\mp\utility\game::isreallyalive( var_6 ) )
            continue;

        if ( var_6.team == self.team )
            continue;

        if ( var_6.team == "spectator" )
            continue;

        var_7 = 999999999;
        var_8 = undefined;

        foreach ( var_3 in var_0 )
        {
            var_3._id_1314F[var_3._id_1314F.size] = var_6;
            var_10 = distance2d( var_3._id_1155F.origin, var_6.origin );

            if ( var_10 <= var_7 )
            {
                var_7 = var_10;
                var_8 = var_3;
            }
        }

        var_8._id_10909 += 2;
    }

    var_13 = var_0[0];

    foreach ( var_3 in var_0 )
    {
        foreach ( var_6 in var_3._id_1314F )
        {
            var_3._id_10909 += 1;

            if ( bullettracepassed( var_6.origin + ( 0, 0, 32 ), var_3.origin, 0, var_6 ) )
                var_3._id_10909 += 3;

            if ( var_3._id_10909 > var_13._id_10909 )
            {
                var_13 = var_3;
                continue;
            }

            if ( var_3._id_10909 == var_13._id_10909 )
            {
                if ( scripts\engine\utility::_id_4347() )
                    var_13 = var_3;
            }
        }
    }

    return var_13;
}

_id_1282( var_0, var_1 )
{
    var_2 = getentarray( "remoteMissileSpawn", "targetname" );

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4._id_0334 ) )
            var_4._id_1155F = getent( var_4._id_0334, "targetname" );
    }

    if ( var_2.size > 0 )
        var_6 = var_1 _id_7E01( var_2 );
    else
        var_6 = undefined;

    if ( isdefined( var_6 ) )
    {
        var_7 = var_6.origin;
        var_8 = var_6._id_1155F.origin;
        var_9 = vectornormalize( var_7 - var_8 );
        var_7 = var_9 * 14000 + var_8;
        var_10 = scripts\mp\utility\game::_id_1309( "remotemissile_projectile_mp", var_7, var_8, var_1 );
    }
    else
    {
        var_11 = ( 0, 0, level._id_B897 );
        var_12 = level._id_B895;
        var_13 = level._id_B896;
        var_14 = anglestoforward( var_1.angles );
        var_7 = var_1.origin + var_11 + var_14 * var_12 * -1;
        var_8 = var_1.origin + var_14 * var_13;
        var_10 = scripts\mp\utility\game::_id_1309( "remotemissile_projectile_mp", var_7, var_8, var_1 );
    }

    if ( !isdefined( var_10 ) )
    {
        var_1 scripts\mp\utility\game::_id_41E9();
        return;
    }

    var_10.team = var_1.team;
    var_10 thread _id_898C();
    var_10._id_AC68 = var_0;
    var_10.type = "remote";
    level._id_DF80 = 1;
    _id_B889( var_1, var_10 );
}

_id_898C()
{
    self endon( "death" );
    self endon( "deleted" );
    self setcandamage( 1 );

    for (;;)
        self waittill( "damage" );
}

_id_B889( var_0, var_1 )
{
    var_0 endon( "joined_team" );
    var_0 endon( "joined_spectators" );
    var_1 thread _id_E5C5();
    var_0 thread _id_CFC7( var_1 );
    var_0 thread _id_CFC8( var_1 );
    var_0 _meth_83F9( "black_bw", 0 );
    var_0 endon( "disconnect" );

    if ( isdefined( var_1 ) )
    {
        var_0 _meth_83F9( game["thermal_vision"], 1.0 );
        var_0 _meth_83C0();
        var_0 thread _id_50FF();
        var_0 cameralinkto( var_1, "tag_origin" );
        var_0 _meth_808D( var_1 );

        if ( getdvarint( "camera_thirdPerson" ) )
            var_0 scripts\mp\utility\game::_id_F887( 0 );

        var_1 waittill( "death" );
        var_0 thermalvisionoff();

        if ( isdefined( var_1 ) )
            var_0 scripts\mp\matchdata::_id_AFC9( "predator_missile", var_1.origin );

        var_0 _meth_808E();
        var_0 scripts\mp\utility\game::_id_7385( 1 );

        if ( !level._id_7669 )
            var_0 setclientomnvar( "ui_predator_missile", 2 );

        wait 0.5;
        var_0 thermalvisionfofoverlayoff();
        var_0 cameraunlink();

        if ( getdvarint( "camera_thirdPerson" ) )
            var_0 scripts\mp\utility\game::_id_F887( 1 );
    }

    var_0 setclientomnvar( "ui_predator_missile", 0 );
    var_0 scripts\mp\utility\game::_id_41E9();
}

_id_50FF()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait 0.15;
    self _meth_83BE();
}

_id_CFC8( var_0 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    scripts\engine\utility::waittill_any( "joined_team", "joined_spectators" );

    if ( self.team != "spectator" )
    {
        self thermalvisionfofoverlayoff();
        self _meth_808E();
        self cameraunlink();

        if ( getdvarint( "camera_thirdPerson" ) )
            scripts\mp\utility\game::_id_F887( 1 );
    }

    scripts\mp\utility\game::_id_41E9();
    level._id_DF80 = undefined;
}

_id_E5C5()
{
    var_0 = self getentitynumber();
    level._id_E5DE[var_0] = self;
    self waittill( "death" );
    level._id_E5DE[var_0] = undefined;
    level._id_DF80 = undefined;
}

_id_CFC7( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );
    level waittill( "game_ended" );
    self thermalvisionfofoverlayoff();
    self _meth_808E();
    self cameraunlink();

    if ( getdvarint( "camera_thirdPerson" ) )
        scripts\mp\utility\game::_id_F887( 1 );
}

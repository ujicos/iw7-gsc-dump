// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_E4E3()
{
    level._id_E4DF = [];
    level._effect["proto_ricochet_temp"] = loadfx( "vfx/old/misc/proto_ricochet_temp" );
    level._effect["proto_ricochet_shot_temp"] = loadfx( "vfx/old/misc/proto_ricochet_shot_temp" );
    level._id_E4DF["proto_ricochet_device_mp"] = spawnstruct();
    level._id_E4DF["proto_ricochet_device_mp"]._id_C739 = 60;
    level._id_E4DF["proto_ricochet_device_mp"]._id_B9DC = ::_id_E4E5;
    level._id_E4DF["proto_ricochet_device_mp"]._id_01F1 = "prop_mp_ricochet_temp";
    level._id_E4DF["proto_ricochet_device_mp"]._id_7542 = "proto_ricochet_temp";
}

_id_E4E9( var_0 )
{
    self endon( "spawned_player" );
    self endon( "disconnect" );

    if ( !isalive( self ) )
    {
        var_0 delete();
        return;
    }

    var_0 waittill( "missile_stuck", var_1 );
    var_2 = ( var_0.origin[0], var_0.origin[1], var_0.origin[2] + level._id_E4DF[var_0._id_13C2E]._id_C739 );
    var_3 = spawn( "script_model", var_2 );
    var_3 setmodel( level._id_E4DF[var_0._id_13C2E]._id_01F1 );
    var_3.angles = var_0.angles;
    var_3.team = self.team;
    var_3.owner = self;
    var_3._id_015F = var_0;
    var_4 = ( var_2[0], var_2[1], var_2[2] + 12 );
    var_3._id_7542 = spawnfx( scripts\engine\utility::_id_7ECB( level._id_E4DF[var_0._id_13C2E]._id_7542 ), var_4 );
    triggerfx( var_3._id_7542 );
    var_5 = 16;
    var_6 = anglestoup( var_3.angles );
    var_6 = var_5 * var_6;
    var_7 = var_3.origin + var_6;
    var_3.trigger = spawn( "script_origin", var_7 );
    var_3.trigger linkto( var_3 );
    var_3 setcandamage( 1 );
    var_3 thread _id_E4E0( self );
    var_3 thread [[ level._id_E4DF[var_0._id_13C2E]._id_B9DC ]]( self );
    var_3 _meth_831F( self );
}

_id_E4E8()
{
    if ( isdefined( self._id_015F ) )
        self._id_015F delete();

    if ( isdefined( self._id_7542 ) )
        self._id_7542 delete();

    self delete();
    self notify( "death" );
}

_id_E4E7()
{
    self endon( "death" );

    while ( getdvarint( "scr_ric_debug", 0 ) == 1 )
        wait 1;

    wait 6.0;
    _id_E4E8();
}

_id_E4E0( var_0 )
{
    scripts\mp\damage::monitordamage( 100, "trophy", ::_id_E4E2, ::_id_E4E4, 0 );
}

_id_E4E4( var_0, var_1, var_2, var_3, var_4 )
{
    return 0;
}

_id_E4E2( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self.owner ) && var_0 != self.owner )
        var_0 notify( "destroyed_equipment" );

    self notify( "detonateExplosive" );
}

_id_E4E5( var_0 )
{
    var_0 endon( "disconnect" );
    self endon( "death" );
    thread _id_E4E7();

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
        var_11 = _id_E4E1( var_4, var_3 );

        if ( isdefined( var_11 ) )
        {
            var_12 = var_4 + var_11 * 5000;

            if ( getdvarint( "scr_ric_debug", 0 ) == 1 )
            {

            }

            if ( getdvarint( "scr_ric_debug", 0 ) != 1 )
                scripts\mp\utility\game::_id_1309( var_10, var_4, var_12, var_0 );

            var_13 = scripts\engine\utility::_id_7ECB( "proto_ricochet_shot_temp" );
            playfx( var_13, var_4, var_11 * -1, ( 0, 0, 1 ) );
        }
    }
}

_id_E4E1( var_0, var_1 )
{
    var_2 = ( var_1[0], var_1[1], 0 );
    var_3 = getdvarfloat( "scr_ric_spread", 7 );
    var_4 = undefined;
    var_5 = 50000;

    foreach ( var_7 in level.players )
    {
        if ( !scripts\mp\utility\game::isreallyalive( var_7 ) )
            continue;

        if ( var_7.team == self.team )
            continue;

        var_8 = ( var_7.origin[0], var_7.origin[1], var_7.origin[2] + 36 );
        var_9 = var_8 - var_0;
        var_10 = distance( var_7.origin, var_0 );
        var_9 *= 1.0 / var_10;
        var_11 = vectordot( var_9, var_1 );

        if ( abs( var_11 ) < 0.707 )
        {
            if ( var_10 < 500 )
            {
                if ( var_10 < var_5 )
                {
                    var_4 = var_8;
                    var_5 = var_10;
                }
            }
        }
    }

    if ( isdefined( var_4 ) )
    {
        var_9 = var_4 - var_0;
        var_9 *= 1.0 / var_5;
        var_13 = randomfloatrange( -180, 180 );
        var_14 = vectorcross( ( 0, 0, 1 ), var_9 );
        var_15 = vectorcross( var_9, var_14 );
        var_16 = sin( var_13 );
        var_17 = cos( var_13 );
        var_18 = randomfloatrange( var_3 * -1, var_3 );
        var_18 = _func_1FC( var_18 );
        var_19 = ( var_14 * var_17 + var_15 * var_16 ) * var_18 + var_9;
        return var_19;
    }
}

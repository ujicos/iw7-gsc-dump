// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main( var_0 )
{
    if ( !isdefined( level._id_A3B9 ) )
    {
        level._id_A3B9 = spawnstruct();
        level._id_A3B9._id_11888 = loadfx( "vfx/iw7/core/vehicle/jackal/vfx_jackal_rear_thrust_fly_atmosphere.vfx" );
        level._id_A3B9._id_10573 = loadfx( "vfx/old/space_fighter/space_particulate_player_oneshot.vfx" );
        level._id_A3B9._id_375D = var_0;
        level._id_A3B9._id_375D._id_444F = ::init;
        _id_A22F( var_0 );
    }
}

_id_A22F( var_0 )
{
    var_1 = getentarray( "script_vehicle", "code_classname" );

    foreach ( var_3 in var_1 )
    {
        if ( _func_113( var_3 ) || !_func_0FD( var_3 ) || !_id_1312C( var_3 ) )
            continue;

        var_3 init();
    }
}

_id_1312C( var_0 )
{
    var_1 = [ "script_vehicle_jackal_friendly", "script_vehicle_jackal_friendly_moon", "script_vehicle_jackal_friendly_heist", "script_vehicle_jackal_friendly_pearl", "script_vehicle_jackal_friendly_marsbase_cheap", "script_vehicle_jackal_enemy", "script_vehicle_jackal_enemy_marsbase_cheap", "script_vehicle_jackal_fake_friendly", "script_vehicle_jackal_fake_enemy" ];

    if ( scripts\engine\utility::array_contains( var_1, var_0.classname ) )
        return 1;

    return 0;
}

init()
{
    if ( isdefined( level._id_A3B9 ) && !isdefined( self._id_A3B9 ) )
    {
        var_0 = level._id_A3B9._id_375D;
        self._id_A3B9 = spawnstruct();
        self._id_A3B9._id_375D = var_0;
        _id_9639();
        self [[ var_0.init ]]();
    }
}

_id_9639()
{
    self._id_5958 = 1;
    self._id_C1DB = 0;
    self _meth_8455( self.origin );
}

_id_A2B2( var_0, var_1, var_2 )
{
    var_0 notify( "enter_jackal" );
    self setplayerangles( var_0.angles );
    var_0.owner = self;
    self._id_0184 = 1;
    self remotecontrolvehicle( var_0 );
    var_0 makeentitysentient( self.team, 0 );
    var_0 _meth_8364( self.team );

    if ( isdefined( var_1 ) )
    {
        self._id_E473 = self _meth_814F();
        self setorigin( var_1 );
    }

    if ( !isdefined( var_2 ) )
        var_2 = "fly";

    var_0 _meth_8491( var_2 );
    self _meth_8490( "disable_pilot_move_assist", 1 );
    thread _id_B9C1( var_0, self );
}

_id_A2B1( var_0 )
{
    self notify( "exit_jackal" );
    self remotecontrolvehicleoff();

    if ( isdefined( self._id_E473 ) )
        self setorigin( self._id_E473 );

    self._id_0184 = 0;
    var_0.owner = undefined;
}

_id_104FE()
{
    level notify( "stop_particulates" );
    level endon( "stop_particulates" );
    thread _id_104FF();

    for (;;)
    {
        var_0 = anglestoforward( level._id_D127.angles ) * 300;
        playfx( scripts\engine\utility::_id_7ECB( "space_particulate_player" ), level._id_D127.origin + var_0 );
        wait 0.6;
    }
}

_id_104FF()
{
    level endon( "stop_particulates" );

    for (;;)
    {
        var_0 = level._id_D127.origin;
        wait 0.1;

        if ( distance( var_0, level._id_D127.origin ) > 1 )
        {
            var_1 = vectortoangles( level._id_D127.origin - var_0 );
            var_2 = anglestoforward( var_1 ) * 256;
            playfx( scripts\engine\utility::_id_7ECB( "space_particulate_player" ), level._id_D127.origin + var_2 );
        }
    }
}

_id_B9C1( var_0, var_1 )
{
    level endon( "game_ended" );
    var_1 endon( "disconnect" );
    var_1 endon( "exit_jackal" );
    var_0 endon( "death" );

    for (;;)
    {
        while ( !var_0._id_02A8 )
            scripts\engine\utility::waitframe();

        var_1 notify( "engage boost" );

        while ( var_0._id_02A8 )
            scripts\engine\utility::waitframe();

        var_1 notify( "disengage boost" );
    }
}

_id_7DB5()
{
    var_0 = [];
    var_1 = vehicle_getarray();

    foreach ( var_3 in var_1 )
    {
        if ( _func_0FD( var_3 ) )
            var_0[var_0.size] = var_3;
    }

    return var_0;
}

_id_10056()
{
    if ( isdefined( level._id_241D ) && level._id_241D )
        return 0;

    return 1;
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

callback_hostmigration()
{
    level._id_90A8 = 0;

    if ( level._id_7669 )
        return;

    level thread _id_90A5();

    foreach ( var_1 in level._id_3CB5 )
        var_1._id_90A6 = 0;

    level._id_90A9 = 1;
    setdvar( "ui_inhostmigration", 1 );
    level._id_90A4 = 1;
    level notify( "host_migration_begin" );
    scripts\mp\gamelogic::_id_12F45();

    foreach ( var_1 in level._id_3CB5 )
    {
        if ( !isdefined( var_1 ) )
            continue;

        var_1 thread _id_90AA();

        if ( isplayer( var_1 ) )
            var_1 setclientomnvar( "ui_session_state", var_1.sessionstate );
    }

    level endon( "host_migration_begin" );
    _id_90AC();
    level._id_90A9 = undefined;
    setdvar( "ui_inhostmigration", 0 );
    visionsetthermal( game["thermal_vision"] );
    level._id_90A4 = 0;
    level notify( "host_migration_end" );
    scripts\mp\gamelogic::_id_12F45();
    level thread scripts\mp\gamelogic::_id_12E9D();
    setdvar( "match_running", 1 );
}

_id_90A5()
{
    level endon( "host_migration_end" );
    level endon( "host_migration_begin" );
    level waittill( "connected", var_0 );
    var_0 thread _id_90AA();

    if ( isplayer( var_0 ) )
        var_0 setclientomnvar( "ui_session_state", var_0.sessionstate );
}

_id_90AC()
{
    level endon( "game_ended" );
    level.ingraceperiod = 25;
    thread scripts\mp\gamelogic::_id_B412( "waiting_for_players", 20.0 );
    _id_90AD();
    level.ingraceperiod = 10;
    thread scripts\mp\gamelogic::_id_B412( "match_resuming_in", 5.0 );
    wait 5;
    level.ingraceperiod = 0;

    if ( scripts\mp\utility\game::istrue( level._id_72F2 ) && !scripts\mp\utility\game::istrue( level._id_72F1 ) )
        setomnvar( "ui_match_start_text", "opponent_forfeiting_in" );
}

_id_90AD()
{
    level endon( "hostmigration_enoughplayers" );
    wait 15;
}

_id_90A7( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "<removed_ent>";

    var_1 = -1;
    var_2 = "?";

    if ( isdefined( var_0.entity_number ) )
        var_1 = var_0.entity_number;

    if ( isplayer( var_0 ) && isdefined( var_0.name ) )
        var_2 = var_0.name;

    if ( isplayer( var_0 ) )
        return "player <" + var_2 + ">";

    if ( isagent( var_0 ) && scripts\mp\utility\game::_id_9E0E( var_0 ) )
        return "participant agent <" + var_1 + ">";

    if ( isagent( var_0 ) )
        return "non-participant agent <" + var_1 + ">";

    return "unknown entity <" + var_1 + ">";
}

_id_90AB()
{
    level endon( "host_migration_begin" );
    level endon( "host_migration_end" );

    while ( !scripts\mp\utility\game::isreallyalive( self ) )
        self waittill( "spawned" );

    self._id_90A6 = 1;
    scripts\mp\utility\game::_id_7385( 1 );
    level waittill( "host_migration_end" );
}

_id_90AA()
{
    self endon( "disconnect" );
    _id_90AB();

    if ( self._id_90A6 )
    {
        scripts\mp\utility\game::_id_7385( 0 );
        self._id_90A6 = undefined;
    }
}

waittillhostmigrationdone()
{
    if ( !isdefined( level._id_90A9 ) )
        return 0;

    var_0 = gettime();
    level waittill( "host_migration_end" );
    return gettime() - var_0;
}

_id_13835( var_0 )
{
    if ( isdefined( level._id_90A9 ) )
        return;

    level endon( "host_migration_begin" );
    wait( var_0 );
}

waitlongdurationwithhostmigrationpause( var_0 )
{
    if ( var_0 == 0 )
        return;

    var_1 = gettime();
    var_2 = gettime() + var_0 * 1000;

    while ( gettime() < var_2 )
    {
        _id_13835( ( var_2 - gettime() ) / 1000 );

        if ( isdefined( level._id_90A9 ) )
        {
            var_3 = waittillhostmigrationdone();
            var_2 += var_3;
        }
    }

    waittillhostmigrationdone();
    return gettime() - var_1;
}

_id_137B8( var_0, var_1 )
{
    self endon( var_0 );

    if ( var_1 == 0 )
        return;

    var_2 = gettime();
    var_3 = gettime() + var_1 * 1000;

    while ( gettime() < var_3 )
    {
        _id_13835( ( var_3 - gettime() ) / 1000 );

        if ( isdefined( level._id_90A9 ) )
        {
            var_4 = waittillhostmigrationdone();
            var_3 += var_4;
        }
    }

    waittillhostmigrationdone();
    return gettime() - var_2;
}

_id_13707( var_0 )
{
    if ( var_0 == 0 )
        return;

    var_1 = gettime();
    var_2 = gettime() + var_0 * 1000;

    while ( gettime() < var_2 )
    {
        _id_13835( ( var_2 - gettime() ) / 1000 );

        while ( isdefined( level._id_90A9 ) )
        {
            var_2 += 1000;
            setgameendtime( int( var_2 ) );
            wait 1;
        }
    }

    while ( isdefined( level._id_90A9 ) )
    {
        var_2 += 1000;
        setgameendtime( int( var_2 ) );
        wait 1;
    }

    return gettime() - var_1;
}

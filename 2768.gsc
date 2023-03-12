// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    var_0 = getdvarint( "scr_match_recording", 0 );

    if ( !_id_B408( var_0 ) )
        return;
    else
        level._id_B406 = var_0;

    level._id_B3EE = 0;
    level._id_B3EF = [];
    level._id_B3FB = ::_id_B3FB;
    level._id_B3FC = ::_id_B3FC;
    level._id_B3FD = ::_id_B3FD;
    level._id_B3F0 = ::_id_B3F0;
    level._id_B3F3 = ::_id_B3F3;
    level._id_B407 = ::_id_B407;

    if ( level._id_B406 == 1 )
        _id_B3F5();
    else if ( level._id_B406 == 3 )
        _id_B402( 1 );

    level thread _id_B3FA();
    level thread _id_B400();
    level thread _id_B3FE();
}

_id_B408( var_0 )
{
    var_1 = 1;

    if ( var_0 == 0 )
        var_1 = 0;
    else if ( var_0 < 0 || var_0 > 4 )
        var_1 = 0;
    else if ( var_0 == 3 || var_0 == 4 )
    {
        var_2 = 0;

        if ( !var_2 )
            var_1 = 0;
    }
    else if ( var_0 == 1 || var_0 == 2 )
    {
        var_3 = getdvarint( "g_logEnable", 0 );
        var_1 = var_3 == 1;
    }

    return var_1;
}

_id_B3F9()
{
    return isdefined( level._id_B406 ) && level._id_B406 > 0;
}

_id_B405( var_0 )
{
    if ( isdefined( level.teambased ) && !level.teambased )
        var_1 = 2;
    else if ( !isdefined( var_0 ) || var_0 == "allies" )
        var_1 = 2;
    else
        var_1 = 3;

    return var_1;
}

_id_B3F1( var_0 )
{
    var_1 = undefined;

    switch ( var_0 )
    {
        case "PATH":
            var_1 = "p";
            break;
        case "SPAWN":
            var_1 = "s";
            break;
        case "DEATH":
            var_1 = "d";
            break;
        case "BULLET":
            var_1 = "b";
            break;
        case "EXPLOSION":
            var_1 = "e";
            break;
        case "ANCHOR":
            var_1 = "t";
            break;
        case "FRONT_LINE":
            var_1 = "l";
            break;
        case "FRONT_LINE_ALLIES":
            var_1 = "[";
            break;
        case "FRONT_LINE_AXIS":
            var_1 = "]";
            break;
        case "FLAG_A":
            var_1 = "A";
            break;
        case "FLAG_B":
            var_1 = "B";
            break;
        case "FLAG_C":
            var_1 = "C";
            break;
        case "SPAWN_ENTITY":
            var_1 = "S";
            break;
        case "PORTAL":
            var_1 = "O";
            break;
        case "LOG_BAD_SPAWN":
            var_1 = "!";
            break;
        case "LOG_GENERIC_MESSAGE":
            var_1 = "m";
            break;
        case "LOG_USER_EVENT":
            var_1 = "u";
            break;
        case "LOG_STAT":
            var_1 = "?";
            break;
        case "PLAYER_NAME":
            var_1 = "n";
            break;
        case "BEST_SPAWN_ALLIES":
            var_1 = "+";
            break;
        case "BEST_SPAWN_AXIS":
            var_1 = "^";
            break;
        default:
            break;
    }

    return var_1;
}

_id_B3F4()
{
    var_0 = [];
    var_0[var_0.size] = "<mrec_map> " + level.script + "\\n";
    var_0[var_0.size] = "<mrec_game_type> " + level.gametype + "\\n";
    var_0[var_0.size] = "<mrec_event_def> PATH p\\n";
    var_0[var_0.size] = "<mrec_event_def> PATH_SPAWN s\\n";
    var_0[var_0.size] = "<mrec_event_def> PATH_DEATH d\\n";
    var_0[var_0.size] = "<mrec_event_def> PATH_BULLET b\\n";
    var_0[var_0.size] = "<mrec_event_def> PATH_EXPLOSION e\\n";
    var_0[var_0.size] = "<mrec_event_def> ANCHOR t\\n";
    var_0[var_0.size] = "<mrec_event_def> GENERIC_LINE l 255,0,0,0\\n";
    var_0[var_0.size] = "<mrec_event_def> GENERIC_LINE [ 255,255,127,0\\n";
    var_0[var_0.size] = "<mrec_event_def> GENERIC_LINE ] 255,0,255,255\\n";
    var_0[var_0.size] = "<mrec_event_def> GENERIC_IMAGE A flagA.tga flagAallies.tga flagAaxis.tga\\n";
    var_0[var_0.size] = "<mrec_event_def> GENERIC_IMAGE B flagB.tga flagBallies.tga flagBaxis.tga\\n";
    var_0[var_0.size] = "<mrec_event_def> GENERIC_IMAGE C flagC.tga flagCallies.tga flagCaxis.tga\\n";
    var_0[var_0.size] = "<mrec_event_def> SPAWN_ENTITY S\\n";
    var_0[var_0.size] = "<mrec_event_def> GENERIC_IMAGE O flagAallies.tga flagAaxis.tga\\n";
    var_0[var_0.size] = "<mrec_event_def> LOG_MESSAGE ! \"No good spawns found. Using bad spawn.\" \\n";
    var_0[var_0.size] = "<mrec_event_def> LOG_MESSAGE m \"MSG: \" \\n";
    var_0[var_0.size] = "<mrec_event_def> LOG_MESSAGE u \"User Event From \" \\n";
    var_0[var_0.size] = "<mrec_event_def> LOG_MESSAGE ? \"STAT: \" \\n";
    var_0[var_0.size] = "<mrec_event_def> PLAYER_NAME n\\n";
    var_0[var_0.size] = "<mrec_event_def> GENERIC_IMAGE + bestSpawnAllies.tga\\n";
    var_0[var_0.size] = "<mrec_event_def> GENERIC_IMAGE ^ bestSpawnAxis.tga\\n";
    return var_0;
}

_id_B3FB( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !_id_B3F9() )
        return;

    _id_B3F7();
    var_9 = _id_B405( var_1 );
    var_10 = int( var_3 ) + "," + int( var_4 );
    var_11 = _id_B3F1( var_2 );

    if ( var_2 == "BULLET" || var_2 == "FRONT_LINE" || var_2 == "FRONT_LINE_ALLIES" || var_2 == "FRONT_LINE_AXIS" )
    {

    }

    var_12 = "";

    if ( isdefined( var_6 ) )
        var_12 = " s:" + var_6;

    var_13 = "";

    if ( isdefined( var_7 ) && isdefined( var_8 ) )
        var_13 = " " + int( var_7 ) + "," + int( var_8 );

    var_14 = "|" + var_0 + " " + var_9 + " " + var_11 + " " + var_10 + " " + var_5 + var_13 + var_12;
    level._id_B3EF[level._id_B3EF.size - 1] = level._id_B3EF[level._id_B3EF.size - 1] + var_14;
}

_id_B3FC( var_0, var_1, var_2 )
{
    if ( !_id_B3F9() )
        return;

    _id_B3F7();
    var_3 = _id_B3F1( var_0 );

    if ( var_2 != "" )
    {
        if ( !isdefined( var_2 ) )
            var_2 = "";
        else
            var_2 = " \"" + var_2 + "\"";
    }

    var_4 = "|0 0 " + var_3 + " " + var_1 + var_2;
    level._id_B3EF[level._id_B3EF.size - 1] = level._id_B3EF[level._id_B3EF.size - 1] + var_4;
}

_id_B3FD( var_0, var_1, var_2 )
{
    if ( !_id_B3F9() )
        return;

    _id_B3F7();
    var_3 = _id_B405( var_1 );
    var_4 = _id_B3F1( "PLAYER_NAME" );
    var_5 = "|" + var_0 + " " + var_3 + " " + var_4 + " " + "\"" + var_2 + "\"";
    level._id_B3EF[level._id_B3EF.size - 1] = level._id_B3EF[level._id_B3EF.size - 1] + var_5;
}

_id_B3F7()
{
    level._id_B3EE++;

    if ( level._id_B3EF.size == 0 )
    {
        level._id_B3EF[level._id_B3EF.size] = "<mrec_events> ";
        level._id_B3EE = 0;
    }
    else if ( level._id_B3EE > 30 || level._id_B3EF[level._id_B3EF.size - 1].size > 800 )
    {
        if ( level._id_B406 == 1 || level._id_B406 == 3 )
            _id_B3F0();

        level._id_B3EF[level._id_B3EF.size] = "<mrec_events> ";
        level._id_B3EE = 0;
    }
}

_id_B3F0()
{
    if ( !_id_B3F9() )
        return;

    if ( !isdefined( level._id_B3EF ) || level._id_B3EF.size == 0 )
        return;

    switch ( level._id_B406 )
    {
        case 2:
        case 1:
            _id_B3F6();
            break;
        case 4:
        case 3:
            _id_B401();
            break;
        default:
            break;
    }
}

_id_B3F6()
{
    if ( level._id_B406 == 2 )
        _id_B3F5();

    foreach ( var_1 in level._id_B3EF )
        logprint( var_1 + "\\n" );

    level._id_B3EF = [];
}

_id_B3F5()
{
    var_0 = _id_B3F4();

    foreach ( var_2 in var_0 )
        logprint( var_2 );
}

_id_B404()
{

}

_id_B403()
{

}

_id_B402( var_0 )
{

}

_id_B401()
{

}

_id_B3FA()
{
    if ( !_id_B3F9() )
        return;

    level endon( "game_ended" );
    scripts\mp\utility\game::_id_7670( "prematch_done" );

    for (;;)
    {
        var_0 = gettime();
        var_1 = level.players;

        foreach ( var_3 in var_1 )
        {
            var_4 = gettime();

            if ( isdefined( var_3 ) && scripts\mp\utility\game::isreallyalive( var_3 ) )
            {
                _id_B3FB( var_3._id_41F0, var_3.team, "PATH", var_3.origin[0], var_3.origin[1], var_4 );
                scripts\engine\utility::waitframe();
            }
        }

        wait( max( 0.05, 1.5 - ( gettime() - var_0 ) / 1000 ) );
    }
}

_id_B400()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_B407();
    }
}

_id_B3FE()
{
    level waittill( "game_ended" );
    var_0 = 0;
    var_1 = 0;
    var_2 = 0.0;
    var_3 = 0;
    var_4 = 0.0;

    foreach ( var_6 in level.players )
    {
        if ( isdefined( var_6._id_D37E ) )
        {
            foreach ( var_8 in var_6._id_D37E )
            {
                var_2 += var_8;
                var_1++;

                if ( var_8 > 75.0 )
                    var_0++;
            }
        }

        if ( isdefined( var_6._id_658E ) )
        {
            foreach ( var_11 in var_6._id_658E )
            {
                var_4 += var_11;
                var_3++;
            }
        }
    }

    if ( var_1 > 0 )
    {
        _id_B3FC( "LOG_STAT", gettime(), "Shot in the back percent: " + var_0 / var_1 * 100.0 + "%" );
        _id_B3FC( "LOG_STAT", gettime(), "Avg. Death Angle: " + var_2 / var_1 );
    }

    if ( var_3 > 0 )
        _id_B3FC( "LOG_STAT", gettime(), "Avg. Engagement Length: " + var_4 / var_3 / 1000.0 + "s" );

    if ( isdefined( level._id_744D ) && isdefined( level._id_744D._id_12F92 ) && isdefined( level._id_744D._id_5AFE ) )
    {
        var_14 = level._id_744D._id_12F92 + level._id_744D._id_5AFE;

        if ( var_14 > 0.0 )
            _id_B3FC( "LOG_STAT", gettime(), "Frontline Uptime: " + level._id_744D._id_12F92 / var_14 * 100.0 + "%" );
    }
}

_id_B407()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( isai( self ) )
        return;

    self notifyonplayercommand( "log_user_event_start", "+actionslot 3" );
    self notifyonplayercommand( "log_user_event_end", "-actionslot 3" );
    self notifyonplayercommand( "log_user_event_generic_event", "+gostand" );

    for (;;)
    {
        self waittill( "log_user_event_start" );
        var_0 = scripts\engine\utility::_id_13734( "log_user_event_end", "log_user_event_generic_event" );

        if ( var_0 == "log_user_event_generic_event" )
        {
            self iprintlnbold( "Event Logged" );
            _id_B3FC( "LOG_USER_EVENT", gettime(), self.name );
        }
    }
}

_id_B3F3()
{
    if ( !isdefined( game["matchRecording_nextID"] ) )
        game["matchRecording_nextID"] = 100;

    var_0 = game["matchRecording_nextID"];
    game["matchRecording_nextID"]++;
    return var_0;
}

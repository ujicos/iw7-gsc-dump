// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_3E05( var_0 )
{
    if ( isdefined( level._id_5F93 ) )
        var_0 = [[ level._id_5F93 ]]( var_0 );

    return var_0;
}

_id_F1AB( var_0, var_1 )
{
    var_2 = var_0;
    return var_2;
}

_id_6CB1()
{
    if ( !level.teambased || isdefined( level._id_112BF ) && !level._id_112BF )
        return undefined;

    var_0 = _id_81B4( self.team );
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_4 = _id_6CC5( var_3 );

        if ( !isdefined( var_4 ) )
            continue;

        var_5 = spawnstruct();
        var_5.origin = var_4;
        var_5.angles = _id_7E0F( var_3, var_5.origin );
        var_5.index = -1;
        var_5._id_3165 = 1;
        var_5._id_9DCF = 1;
        var_5 scripts\mp\spawnlogic::_id_108FA();

        if ( isdefined( var_3._id_1E61 ) && isdefined( var_3._id_1E61._id_D3AB ) )
            var_5._id_3164 = var_3._id_1E61._id_D3AB;

        var_1[var_1.size] = var_5;
    }

    var_7 = [];
    _id_12F1E( var_1 );

    foreach ( var_5 in var_1 )
    {
        if ( !_id_11746( var_5 ) )
            continue;

        _id_EC24( var_5 );
        var_7[var_7.size] = var_5;
    }

    var_10 = undefined;

    foreach ( var_5 in var_7 )
    {
        if ( !isdefined( var_10 ) || var_5._id_11A3B > var_10._id_11A3B )
            var_10 = var_5;
    }

    return var_10;
}

_id_EC24( var_0 )
{
    scripts\mp\spawnfactor::_id_3710( var_0, "avoidShortTimeToEnemySight", 1.0 );
    scripts\mp\spawnfactor::_id_3710( var_0, "avoidClosestEnemy", 1.0 );
}

_id_7E0F( var_0, var_1 )
{
    var_2 = ( 0, var_0.angles[1], 0 );
    var_3 = findentrances( var_1 );

    if ( isdefined( var_3 ) && var_3.size > 0 )
        var_2 = vectortoangles( var_3[0].origin - var_1 );

    return var_2;
}

_id_81B4( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level.players )
    {
        if ( var_3.team != var_0 )
            continue;

        if ( var_3 == self )
            continue;

        if ( !_id_38F0( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return scripts\engine\utility::_id_22A7( var_1 );
}

_id_38F0( var_0 )
{
    if ( var_0.sessionstate != "playing" )
        return 0;

    if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
        return 0;

    if ( !var_0 isonground() )
        return 0;

    if ( var_0 isonladder() )
        return 0;

    if ( var_0 scripts\engine\utility::_id_9DFB() )
        return 0;

    if ( var_0.health < var_0.maxhealth && ( !isdefined( var_0._id_A965 ) || gettime() < var_0._id_A965 + 3000 ) )
        return 0;

    return 1;
}

_id_6CC5( var_0 )
{
    var_1 = scripts\mp\spawnlogic::_id_8083( var_0, 1 );
    var_2 = _id_6CB0( var_0, var_1, 0.5 );

    if ( isdefined( var_2 ) )
        return var_2.origin;

    return undefined;
}

_id_6CB0( var_0, var_1, var_2 )
{
    var_3 = getnodesinradiussorted( var_0.origin, 192, 64, var_1, "Path" );
    var_4 = undefined;

    if ( isdefined( var_3 ) && var_3.size > 0 )
    {
        var_5 = anglestoforward( var_0.angles );

        foreach ( var_7 in var_3 )
        {
            var_8 = vectornormalize( var_7.origin - var_0.origin );
            var_9 = vectordot( var_5, var_8 );

            if ( var_9 <= var_2 && !positionwouldtelefrag( var_7.origin ) )
            {
                var_4 = var_7;

                if ( var_9 <= 0.0 )
                    break;
            }
        }
    }

    return var_4;
}

_id_6CB5( var_0, var_1, var_2, var_3 )
{
    var_4 = getnodesinradiussorted( var_0.origin, var_3, 32, var_1, "Path" );
    var_5 = undefined;

    if ( isdefined( var_4 ) && var_4.size > 0 )
    {
        var_6 = anglestoforward( var_0.angles );

        foreach ( var_8 in var_4 )
        {
            var_9 = var_8.origin + ( 0, 0, var_1 );

            if ( capsuletracepassed( var_9, var_2, var_2 * 2 + 0.01, undefined, 1, 1 ) )
            {
                if ( bullettracepassed( var_0 geteye(), var_9, 0, var_0 ) )
                {
                    var_5 = var_9;
                    break;
                }
            }
        }
    }

    return var_5;
}

_id_98C8( var_0 )
{
    var_0._id_11A3B = 0;
    var_0._id_11A3A = 0;
    var_0._id_9D60 = 0;
    var_0._id_A9E9 = [];
    var_0._id_A9E9["allies"] = 0;
    var_0._id_A9E9["axis"] = 0;
    var_0._id_A9F5 = "";
    var_0.lastspawntime = 0;
    var_0._id_1E5B = spawnstruct();
    var_0._id_1E5B._id_1D30 = 0;
    var_0._id_1E5B._id_654A = 0;
    var_0._id_1E5B._id_1192A = 0;
    var_0._id_1E5B._id_B498 = 0;
    var_0._id_1E5B._id_DCC5 = 0;
    var_0._id_1E5B._id_B4A5 = 0;
    var_0._id_1E5B._id_1091B = 0;
    var_0._id_1E5B._id_10919 = 0;
}

_id_12F1E( var_0 )
{
    var_1 = scripts\mp\spawnlogic::_id_8143( self );
    scripts\mp\spawnlogic::_id_12F1F();
    var_2 = scripts\mp\spawnlogic::_id_7D9A();

    foreach ( var_4 in var_0 )
    {
        _id_98C8( var_4 );
        scripts\mp\spawnlogic::_id_108F9( var_4, var_2 );
        scripts\mp\spawnlogic::_id_67D3( var_4, var_1 );
    }

    scripts\mp\spawnfactor::_id_12E98( var_1 );
}

_id_11748( var_0 )
{
    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26B7, var_0 ) )
    {
        var_0._id_275D = 0;
        return "bad";
    }

    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26B8, var_0 ) )
    {
        var_0._id_275D = 1;
        return "bad";
    }

    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26BC, var_0 ) )
    {
        var_0._id_275D = 2;
        return "bad";
    }

    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26AB, var_0 ) )
    {
        var_0._id_275D = 3;
        return "bad";
    }

    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26AD, var_0 ) )
    {
        var_0._id_275D = 4;
        return "bad";
    }

    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26C4, var_0 ) )
    {
        var_0._id_275D = 5;
        return "bad";
    }

    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26B6, var_0 ) )
    {
        var_0._id_275D = 6;
        return "bad";
    }

    if ( isdefined( var_0._id_7450 ) && level._id_744D._id_9D25[self.team] && var_0._id_7450 != self.team )
    {
        var_0._id_275D = 7;
        return "bad";
    }

    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26B3, var_0 ) )
        return "secondary";

    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26AE, var_0 ) )
        return "secondary";

    return "primary";
}

_id_11746( var_0 )
{
    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26B7, var_0 ) )
        return 0;

    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26B8, var_0 ) )
        return 0;

    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26BC, var_0 ) )
        return 0;

    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26AB, var_0 ) )
        return 0;

    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26AD, var_0 ) )
        return 0;

    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26C4, var_0 ) )
        return 0;

    if ( !scripts\mp\spawnfactor::_id_4A71( scripts\mp\spawnfactor::_id_26AE, var_0 ) )
        return 0;

    return 1;
}

getstartspawnpoint_freeforall( var_0 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    var_1 = undefined;
    var_2 = scripts\mp\spawnlogic::_id_7D9A();
    var_0 = _id_3E05( var_0 );

    if ( !isdefined( var_2 ) || var_2.size == 0 )
        return scripts\mp\spawnlogic::_id_813C( var_0 );

    var_3 = 0;

    foreach ( var_5 in var_0 )
    {
        if ( canspawn( var_5.origin ) && !positionwouldtelefrag( var_5.origin ) )
        {
            var_6 = undefined;

            foreach ( var_8 in var_2 )
            {
                var_9 = distancesquared( var_5.origin, var_8.origin );

                if ( !isdefined( var_6 ) || var_9 < var_6 )
                    var_6 = var_9;
            }

            if ( !isdefined( var_1 ) || var_6 > var_3 )
            {
                var_1 = var_5;
                var_3 = var_6;
            }
        }
    }

    if ( !isdefined( var_1 ) )
        return scripts\mp\spawnlogic::_id_813C( var_0 );

    return var_1;
}

_id_AF98( var_0, var_1 )
{
    if ( isdefined( var_1 ) && isdefined( var_1._id_5612 ) && var_1._id_5612 )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = "";
    else
        var_0 = var_0;

    if ( isdefined( level._id_B3FC ) )
        [[ level._id_B3FC ]]( "LOG_BAD_SPAWN", gettime(), var_0 );
}

getspawnpoint( var_0, var_1, var_2, var_3 )
{
    level._id_108D1._id_108FD = var_0;

    if ( level._id_72A2 )
    {
        var_4 = _id_6CB1();

        if ( isdefined( var_4 ) )
            return var_4;
    }

    var_5 = undefined;
    level._id_108D1._id_107FE = 0;
    var_6 = _id_8142( var_0, var_2, 0 );

    if ( isdefined( var_6 ) )
    {
        if ( !scripts\mp\utility\game::istrue( var_6._id_9D60 ) )
            return var_6;
        else
            var_5 = var_6;
    }

    if ( isdefined( var_1 ) )
    {
        var_7 = _id_8142( var_1, var_2, 3 );

        if ( isdefined( var_7 ) )
        {
            if ( scripts\mp\utility\game::istrue( var_7._id_9D60 ) )
            {
                if ( !isdefined( var_5 ) || var_7._id_11A3B > var_5._id_11A3B )
                    var_5 = var_7;
            }
            else
            {
                _id_AF98( "Using a fallback spawn.", self );
                return var_7;
            }
        }
    }

    if ( scripts\mp\utility\game::istrue( var_3 ) )
        return undefined;

    _id_AF98( "Using a LastResort spawn point.", self );
    var_8 = _id_6CB1();

    if ( isdefined( var_8 ) )
    {
        var_8._id_10919 = 7;
        level._id_108D1._id_3166 = 0;

        if ( isdefined( var_8._id_3164 ) )
            level._id_108D1._id_3164 = var_8._id_3164;

        return var_8;
    }

    _id_AF98( "UNABLE TO BUDDY SPAWN. EXTREMELY BAD", self );

    if ( level.teambased && !scripts\mp\utility\game::_id_9D46() )
    {
        var_9 = level._id_108D1.lastbadspawntime[self.team];

        if ( isdefined( var_9 ) && gettime() - var_9 < 5000 )
            var_5 = var_0[randomint( var_0.size )];
        else
            level._id_108D1.lastbadspawntime[self.team] = gettime();
    }

    return var_5;
}

_id_8142( var_0, var_1, var_2 )
{
    var_0 = _id_3E05( var_0 );
    var_3["primary"] = [];
    var_3["secondary"] = [];
    var_3["bad"] = [];

    if ( scripts\mp\spawnlogic::_id_100B9() && !scripts\mp\spawnlogic::_id_9FB6() )
    {
        if ( isdefined( level._id_B3FC ) )
            [[ level._id_B3FC ]]( "LOG_GENERIC_MESSAGE", gettime(), "ERROR: TTLOS System disabled! Could not access visDistData" );

        if ( !isdefined( level._id_8C28 ) )
            level._id_8C28 = 1;

        level._id_560C = 1;
        scripts\mp\spawnlogic::_id_E2B6();
    }

    _id_12F1E( var_0 );

    foreach ( var_5 in var_0 )
    {
        var_6 = _id_11748( var_5 );
        var_3[var_6][var_3[var_6].size] = var_5;
        var_5._id_A94A[scripts\engine\utility::ter_op( isdefined( self._id_108DF ), self._id_108DF, self.team )] = var_6;

        if ( isdefined( var_5._id_1E5B ) && isdefined( var_5._id_1E5B._id_10919 ) )
        {
            if ( var_6 == "primary" )
            {
                var_5._id_1E5B._id_10919 = var_2 + 1;
                continue;
            }

            if ( var_6 == "secondary" )
            {
                var_5._id_1E5B._id_10919 = var_2 + 2;
                continue;
            }

            var_5._id_1E5B._id_10919 = var_2 + 3;
        }
    }

    if ( var_3["primary"].size )
    {
        var_6 = _id_7F01( var_3["primary"], var_1 );
        var_6._id_107FE = 1;
        return var_6;
    }

    if ( var_3["secondary"].size )
    {
        var_6 = _id_7F01( var_3["secondary"], var_1 );
        var_6._id_107FE = 2;
        return var_6;
    }

    if ( var_3["bad"].size )
    {
        _id_AF98( "Using Bad Spawn", self );
        var_6 = _id_7F01( var_3["bad"], var_1 );

        if ( isdefined( var_6 ) )
            var_6._id_9D60 = 1;

        return var_6;
    }

    return undefined;
}

_id_7F01( var_0, var_1 )
{
    var_2 = var_0[0];

    foreach ( var_4 in var_0 )
    {
        scripts\mp\spawnlogic::_id_EC46( var_4, var_1 );

        if ( var_4._id_11A3B > var_2._id_11A3B )
            var_2 = var_4;
    }

    var_2 = _id_F1AB( var_2, var_0 );
    return var_2;
}

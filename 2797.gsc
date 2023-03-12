// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_9758()
{
    if ( !isdefined( level._id_10680 ) )
        level._id_10680 = 250000;

    if ( !isdefined( level._id_656F ) )
        level._id_656F = 810000;

    _id_DEF0( "avoidShortTimeToEnemySight", ::_id_26C2, undefined );
    _id_DEF0( "preferAlliesByDistance", ::_id_D829, undefined );
    _id_DEF0( "preferCloseToAlly", ::_id_D82D, undefined );
    _id_DEF0( "avoidRecentlyUsedByEnemies", ::_id_26BF, undefined );
    _id_DEF0( "avoidEnemiesByDistance", ::_id_26B4, undefined );
    _id_DEF0( "avoidEnemyInfluence", ::_id_26B5, undefined );
    _id_DEF0( "avoidLastDeathLocation", ::_id_26BB, undefined );
    _id_DEF0( "avoidLastAttackerLocation", ::_id_26BA, undefined );
    _id_DEF0( "avoidShortTimeToJumpingEnemySight", ::_id_26C3, undefined );
    _id_DEF0( "avoidVeryShortTimeToJumpingEnemySight", ::_id_26C5, undefined );
    _id_DEF0( "avoidSameSpawn", ::_id_26C1, undefined );
    _id_DEF0( "avoidRecentlyUsedByAnyone", ::_id_26BE, undefined );
    _id_DEF0( "randomSpawnScore", ::_id_DCC6, undefined );
    _id_DEF0( "preferNearLastTeamSpawn", ::prefernearlastteamspawn, undefined );
    _id_DEF0( "preferClosePoints", ::_id_D82B, [ "closestPoints" ] );
    _id_DEF0( "preferShortestDistToKOTHZone", ::_id_D837, [ "activeKOTHZoneNumber", "maxSquaredDistToObjective" ] );
    _id_DEF0( "avoidCloseToKOTHZone", ::_id_26B2, [ "activeKOTHZoneNumber", "kothZoneDeadzoneDistSq" ] );
    _id_DEF0( "preferDomPoints", ::_id_D82E, [ "preferredDomPoints" ] );
    _id_DEF0( "avoidClosestEnemy", ::_id_26AF, undefined );
    _id_DEF0( "avoidClosestEnemyByDistance", ::avoidclosestenemybydistance, [ "closestEnemyInfluenceDistSq" ] );
    _id_DEF0( "preferClosestToHomeBase", ::_id_D82C, [ "homeBaseTeam", "maxDistToHomeBase" ] );
    _id_DEF0( "avoidCloseToBall", ::_id_26B0, [ "activeCarrierPosition", "ballPosition", "avoidBallDeadZoneDistSq" ] );
    _id_DEF0( "avoidCloseToBallSpawn", ::_id_26B1, [ "avoidBallDeadZoneDistSq" ] );
}

_id_DEF0( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_108D1._id_6A90 ) )
        level._id_108D1._id_6A90 = [];

    var_3 = spawnstruct();
    level._id_108D1._id_6A90[var_0] = var_3;
    var_3._id_74D6 = var_1;
    var_3._id_C8EF = var_2;
}

_id_9DEF( var_0 )
{
    return isdefined( level._id_108D1._id_6A90[var_0] );
}

_id_7EAF( var_0 )
{
    return level._id_108D1._id_6A90[var_0]._id_74D6;
}

_id_7EB1( var_0 )
{
    return level._id_108D1._id_6A90[var_0]._id_C8EF;
}

_id_3710( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_7EAF( var_1 );
    var_5 = _id_7EB1( var_1 );

    if ( isdefined( var_5 ) )
    {
        if ( !isdefined( var_3 ) )
        {

        }

        var_13 = [[ var_4 ]]( var_0, var_3 );
    }
    else
        var_13 = [[ var_4 ]]( var_0 );

    var_13 = clamp( var_13, 0, 100 );
    var_13 *= var_2;
    var_0._id_11A3A += 100 * var_2;
    var_0._id_A9E9[self.team] += var_13;
    var_0._id_11A3B += var_13;
    return var_13;
}

_id_4A71( var_0, var_1 )
{
    var_2 = [[ var_0 ]]( var_1 );
    var_2 = clamp( var_2, 0, 100 );
    return var_2;
}

_id_26AD( var_0 )
{
    foreach ( var_2 in level._id_3A59 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        if ( distancesquared( var_0.origin, var_2.origin ) < 22500 )
            return 0;
    }

    return 100;
}

_id_26B8( var_0 )
{
    foreach ( var_2 in level._id_85D5 )
    {
        if ( !isdefined( var_2 ) || !var_2 _id_9DE6( self ) || scripts\mp\utility\game::istrue( var_2.shouldnotblockspawns ) )
            continue;

        if ( distancesquared( var_0.origin, var_2.origin ) < 122500 )
            return 0;
    }

    return 100;
}

_id_26BC( var_0 )
{
    var_1 = scripts\engine\utility::_id_227F( level._id_B779, level._id_CC11 );

    if ( isdefined( level._id_126BC ) && level._id_126BC.size > 0 )
        var_1 = scripts\engine\utility::_id_227F( var_1, level._id_126BC );

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) || !var_3 _id_9DE6( self ) || scripts\mp\utility\game::istrue( var_3.shouldnotblockspawns ) )
            continue;

        if ( distancesquared( var_0.origin, var_3.origin ) < 122500 )
            return 0;
    }

    return 100;
}

_id_9DE6( var_0 )
{
    if ( !level.teambased || level._id_740A || !isdefined( var_0.team ) )
        return 1;
    else
    {
        var_1 = undefined;

        if ( isdefined( self.owner ) )
        {
            if ( var_0 == self.owner )
                return 1;

            var_1 = self.owner.team;
        }

        if ( isdefined( var_1 ) )
            return var_1 != var_0.team;
        else
            return 1;
    }
}

_id_26AB( var_0 )
{
    if ( !isdefined( level._id_2300 ) )
        return 100;

    if ( !var_0._id_C7DA )
        return 100;

    var_1 = scripts\mp\killstreaks\airstrike::_id_7DAA( var_0.origin );

    if ( var_1 > 0 )
        return 0;

    return 100;
}

_id_26B3( var_0 )
{
    var_1 = "all";

    if ( level.teambased )
        var_1 = scripts\mp\gameobjects::_id_7E93( self.team );

    if ( var_0._id_466B[var_1] > 0 )
        return 0;

    return 100;
}

_id_26B7( var_0 )
{
    var_1 = "all";

    if ( level.teambased )
        var_1 = scripts\mp\gameobjects::_id_7E93( self.team );

    if ( var_0._id_74BC[var_1] > 0 )
        return 0;

    return 100;
}

_id_26AE( var_0 )
{
    var_1 = [];
    var_2 = [];

    if ( level.teambased )
        var_1[0] = scripts\mp\gameobjects::_id_7E93( self.team );
    else
        var_1[var_1.size] = "all";

    foreach ( var_4 in var_1 )
    {
        if ( var_0._id_11A39[var_4] == 0 )
            continue;

        var_2[var_2.size] = var_4;
    }

    if ( var_2.size == 0 )
        return 100;

    foreach ( var_4 in var_2 )
    {
        if ( var_0._id_B75F[var_4] < level._id_10680 )
            return 0;
    }

    return 100;
}

_id_26C4( var_0 )
{
    if ( isdefined( self._id_1CAE ) )
        return 100;

    if ( positionwouldtelefrag( var_0.origin ) )
    {
        foreach ( var_2 in var_0._id_1D53 )
        {
            if ( !positionwouldtelefrag( var_2 ) )
                return 100;
        }

        return 0;
    }

    return 100;
}

_id_26C1( var_0 )
{
    if ( isdefined( self._id_A9F4 ) && self._id_A9F4 == var_0 )
        return 0;

    return 100;
}

_id_26B6( var_0 )
{
    if ( isdefined( var_0._id_A9F5 ) && ( !level.teambased || var_0._id_A9F5 != self.team ) )
    {
        var_1 = var_0.lastspawntime + 500;

        if ( gettime() < var_1 )
            return 0;
    }

    return 100;
}

_id_26BF( var_0 )
{
    var_1 = !level.teambased || isdefined( var_0._id_A9F5 ) && self.team != var_0._id_A9F5;

    if ( var_1 && isdefined( var_0.lastspawntime ) )
    {
        var_2 = gettime() - var_0.lastspawntime;
        var_0._id_1E5B._id_1091B = var_2 / 1000;

        if ( var_2 > 4000 )
            return 100;

        return var_2 / 4000 * 100;
    }

    return 100;
}

_id_26BE( var_0 )
{
    if ( isdefined( var_0.lastspawntime ) )
    {
        var_1 = gettime() - var_0.lastspawntime;
        var_0._id_1E5B._id_1192A = var_1 / 1000;

        if ( var_1 > 4000 )
            return 100;

        return var_1 / 4000 * 100;
    }

    return 100;
}

_id_26BB( var_0 )
{
    if ( !isdefined( self._id_A972 ) )
        return 100;

    var_1 = distancesquared( var_0.origin, self._id_A972 );

    if ( var_1 > 810000 )
        return 100;

    var_2 = var_1 / 810000;
    return var_2 * 100;
}

_id_26BA( var_0 )
{
    if ( !isdefined( self._id_01B1 ) || !isdefined( self._id_01B1.origin ) )
        return 100;

    if ( !scripts\mp\utility\game::isreallyalive( self._id_01B1 ) )
        return 100;

    var_1 = distancesquared( var_0.origin, self._id_01B1.origin );

    if ( var_1 > 810000 )
        return 100;

    var_2 = var_1 / 810000;
    return var_2 * 100;
}

_id_12E98( var_0 )
{
    if ( !_id_12E9B() )
        return;

    _id_E850( var_0 );
    _id_12E99();
}

_id_12E9B()
{
    if ( !_id_4BED() )
        return 0;

    var_0 = _id_7ED7();
    var_1 = gettime();

    if ( !isdefined( var_0._id_AA36 ) )
        var_0._id_AA36 = var_1;
    else if ( var_0._id_9D25["allies"] && var_0._id_9D25["axis"] )
        var_0._id_12F92 += var_0._id_AA37;
    else
        var_0._id_5AFE += var_0._id_AA37;

    var_2 = ( var_1 - var_0._id_AA36 ) / 1000.0;
    var_0._id_AA36 = var_1;
    var_0._id_AA37 = var_2;
    var_3 = _id_7ECA( "allies" );

    if ( !isdefined( var_3 ) )
        return 0;

    var_3 = ( var_3[0], var_3[1], 0 );
    var_0._id_1C27 = var_3;
    var_4 = _id_7ECA( "axis" );

    if ( !isdefined( var_4 ) )
        return 0;

    var_4 = ( var_4[0], var_4[1], 0 );
    var_0._id_26F3 = var_4;
    var_5 = var_4 - var_3;
    var_6 = vectortoyaw( var_5 );

    if ( !isdefined( var_0._id_115C7 ) || !var_0._id_9D25["allies"] || !var_0._id_9D25["axis"] )
        var_0._id_115C7 = var_6;

    var_7 = 80.0 * var_2;
    var_8 = var_6 - var_0._id_115C7;

    if ( var_8 > 180 )
        var_8 -= 360;
    else if ( var_8 < -180 )
        var_8 = 360 + var_8;

    var_7 = clamp( var_8, var_7 * -1, var_7 );
    var_0._id_115C7 += var_7;
    var_9 = var_3 + var_5 * 0.5;

    if ( !isdefined( var_0._id_B72B ) || !var_0._id_9D25["allies"] || !var_0._id_9D25["axis"] )
        var_0._id_B72B = var_9;

    var_10 = var_9 - var_0._id_B72B;
    var_11 = length2d( var_10 );
    var_12 = min( var_11, 200.0 * var_2 );

    if ( var_12 > 0 )
    {
        var_10 *= var_12 / var_11;
        var_0._id_B72B += var_10;
    }

    var_13 = anglestoforward( ( 0, var_0._id_115C7, 0 ) );
    var_14 = level._id_108FB;
    var_14 = scripts\mp\spawnscoring::_id_3E05( var_14 );

    foreach ( var_16 in var_14 )
    {
        var_17 = undefined;
        var_18 = var_0._id_B72B - var_16.origin;
        var_19 = vectordot( var_18, var_13 );

        if ( var_19 > 0 )
        {
            var_17 = "allies";
            var_16._id_7450 = var_17;
            continue;
        }

        var_17 = "axis";
        var_16._id_7450 = var_17;
    }

    return 1;
}

_id_12E99()
{
    var_0 = isdefined( level._id_B3FB ) && isdefined( level._id_B3F3 );
    var_1 = scripts\mp\analyticslog::_id_1E62();

    if ( !var_0 && !var_1 )
        return;

    var_2 = _id_7ED7();

    if ( !isdefined( var_2._id_AFC2 ) && isdefined( level._id_B3F3 ) )
    {
        var_2._id_AFC2 = [];
        var_2._id_AFC2["line"] = [[ level._id_B3F3 ]]();
        var_2._id_AFC2["alliesCenter"] = [[ level._id_B3F3 ]]();
        var_2._id_AFC2["axisCenter"] = [[ level._id_B3F3 ]]();
    }

    if ( !var_2._id_9D25["allies"] && !var_2._id_9D25["axis"] )
        return;

    var_3 = ( var_2._id_B72B[0], var_2._id_B72B[1], level.mapcenter[2] );
    var_4 = anglestoright( ( 0, var_2._id_115C7, 0 ) );
    var_5 = var_3 + var_4 * 5000;
    var_6 = var_3 - var_4 * 5000;

    if ( isdefined( level._id_B3FB ) )
    {
        var_7 = undefined;

        if ( var_2._id_9D25["allies"] && var_2._id_9D25["axis"] )
            var_7 = "FRONT_LINE";
        else
            var_7 = scripts\engine\utility::ter_op( var_2._id_9D25["allies"], "FRONT_LINE_ALLIES", "FRONT_LINE_AXIS" );

        [[ level._id_B3FB ]]( var_2._id_AFC2["line"], "allies", var_7, var_5[0], var_5[1], gettime(), undefined, var_6[0], var_6[1] );
    }

    scripts\mp\analyticslog::_id_AF9F( var_5, var_6, var_2._id_1C27, var_2._id_26F3, 1 );

    if ( isdefined( level._id_B3FB ) )
    {
        var_8 = scripts\engine\utility::ter_op( var_2._id_9D25["axis"], var_2._id_26F3, ( 10000, 10000, 10000 ) );
        [[ level._id_B3FB ]]( var_2._id_AFC2["axisCenter"], "axis", "ANCHOR", var_8[0], var_8[1], gettime() );
        var_9 = scripts\engine\utility::ter_op( var_2._id_9D25["allies"], var_2._id_1C27, ( 10000, 10000, 10000 ) );
        [[ level._id_B3FB ]]( var_2._id_AFC2["alliesCenter"], "allies", "ANCHOR", var_9[0], var_9[1], gettime() );
    }
}

_id_7ECA( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level.players )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( !scripts\mp\utility\game::isreallyalive( var_3 ) )
            continue;

        if ( var_3.team == var_0 )
            var_1[var_1.size] = var_3;
    }

    if ( var_1.size == 0 )
        return undefined;

    var_5 = scripts\mp\utility\game::_id_7DEA( var_1 );
    return var_5;
}

_id_E850( var_0 )
{
    if ( !_id_4BED() )
        return;

    var_1 = _id_7ED7();
    var_1._id_9D25[var_0] = 1;

    if ( getdvarint( "scr_frontline_trap_checks" ) == 0 )
        return;

    var_2 = getdvarint( "scr_frontline_min_spawns", 0 );

    if ( var_2 == 0 )
        var_2 = 4;

    var_3 = scripts\mp\utility\game::_id_8027( var_0 );
    var_4 = 0;
    var_5 = level._id_108FB;
    var_5 = scripts\mp\spawnscoring::_id_3E05( var_5 );

    foreach ( var_7 in var_5 )
    {
        if ( !isdefined( var_7._id_7450 ) || var_7._id_7450 != var_0 )
            continue;

        if ( !isdefined( var_7._id_74BC ) || !isdefined( var_7._id_74BC[var_3] ) || var_7._id_74BC[var_3] <= 0 )
            var_4++;
    }

    var_9 = var_4 / var_5.size;

    if ( var_4 < var_2 || var_9 < 0.0 )
    {
        if ( var_4 < var_2 )
            var_1._id_55DD[var_0] = 0;
        else
            var_1._id_55DD[var_0] = 1;

        var_1._id_9D25[var_0] = 0;
    }
}

_id_4BED()
{
    if ( level.gametype != "war" && level.gametype != "conf" && level.gametype != "cranked" )
        return 0;

    return 1;
}

_id_7ED7()
{
    if ( !isdefined( level._id_744D ) )
    {
        level._id_744D = spawnstruct();
        level._id_744D._id_9D25 = [];
        level._id_744D._id_9D25["allies"] = 0;
        level._id_744D._id_9D25["axis"] = 0;
        level._id_744D._id_12F92 = 0.0;
        level._id_744D._id_5AFE = 0.0;
    }

    return level._id_744D;
}

_id_D829( var_0 )
{
    if ( var_0._id_11A39[self.team] == 0 )
        return 0;

    var_1 = var_0._id_5722[self.team] / var_0._id_11A39[self.team];
    var_1 = min( var_1, 3240000 );
    var_0._id_1E5B._id_1D30 = var_1;
    var_2 = 1 - var_1 / 3240000;
    return var_2 * 100;
}

_id_D82D( var_0 )
{
    var_1 = min( var_0._id_B75F[self.team], 3240000 );
    var_2 = 1 - var_1 / 3240000;
    return var_2 * 100;
}

_id_26B4( var_0 )
{
    var_1 = [];
    var_2 = [];

    if ( level.teambased )
        var_1[0] = scripts\mp\gameobjects::_id_7E93( self.team );
    else
        var_1[var_1.size] = "all";

    foreach ( var_4 in var_1 )
    {
        if ( var_0._id_11A39[var_4] == 0 )
            continue;

        var_2[var_2.size] = var_4;
    }

    if ( var_2.size == 0 )
        return 100;

    foreach ( var_4 in var_2 )
    {
        if ( var_0._id_B75F[var_4] < 250000 )
            return 0;
    }

    var_8 = 0;
    var_9 = 0;

    foreach ( var_4 in var_2 )
    {
        var_8 += var_0._id_5723[var_4];
        var_9 += var_0._id_11A39[var_4];
    }

    var_12 = var_8 / var_9;
    var_12 = min( var_12, 7290000 );
    var_13 = var_12 / 7290000;
    var_0._id_1E5B._id_654A = var_12;
    return var_13 * 100;
}

_id_26B5( var_0 )
{
    var_1 = undefined;

    if ( level.teambased )
        var_1 = scripts\mp\gameobjects::_id_7E93( self.team );
    else
        var_1 = "all";

    foreach ( var_3 in var_0._id_5721[var_1] )
    {
        if ( var_3 < level._id_656F )
            return 0;
    }

    return 100;
}

_id_26AF( var_0 )
{
    var_1 = [];
    var_2 = [];

    if ( level.teambased )
        var_1[0] = scripts\mp\gameobjects::_id_7E93( self.team );
    else
        var_1[var_1.size] = "all";

    foreach ( var_4 in var_1 )
    {
        if ( var_0._id_11A39[var_4] == 0 )
            continue;

        var_2[var_2.size] = var_4;
    }

    if ( var_2.size == 0 )
        return 100;

    var_6 = 0;

    foreach ( var_4 in var_2 )
    {
        if ( var_0._id_B75F[var_4] < 250000 )
            return 0;

        var_8 = min( var_0._id_B75F[var_4], 3240000 );
        var_9 = var_8 / 3240000;
        var_6 += var_9 * 100;
    }

    return var_6 / var_2.size;
}

avoidclosestenemybydistance( var_0, var_1 )
{
    var_2 = var_1["closestEnemyInfluenceDistSq"];
    var_3 = "all";

    if ( level.teambased )
        var_3 = scripts\mp\gameobjects::_id_7E93( self.team );

    if ( var_0._id_B75F[var_3] < 250000 )
        return 0;

    var_4 = min( var_0._id_B75F[var_3], var_2 );
    var_5 = var_4 / var_2;
    return var_5 * 100;
}

_id_EC28( var_0 )
{
    var_1 = undefined;

    foreach ( var_3 in level._id_5913 )
    {
        if ( isdefined( var_3._id_5922 ) && var_3._id_5922 == var_0 )
        {
            var_1 = var_3;
            break;
        }
    }

    if ( !isdefined( var_1 ) )
        return 100;

    var_5 = var_1 scripts\mp\gameobjects::_id_7E29();

    if ( var_5 == "none" )
        return 100;
    else
        return 50.0;
}

_id_D82E( var_0, var_1 )
{
    var_2 = var_1["preferredDomPoints"];

    if ( var_2[0] && var_0._id_591F )
        return _id_EC28( 0 );

    if ( var_2[1] && var_0._id_5920 )
        return _id_EC28( 1 );

    if ( var_2[2] && var_0._id_5921 )
        return _id_EC28( 2 );

    return 0;
}

_id_D82B( var_0, var_1 )
{
    var_2 = var_1["closestPoints"];

    foreach ( var_4 in var_2 )
    {
        if ( var_0 == var_4 )
            return 100;
    }

    return 0;
}

_id_D82A( var_0, var_1 )
{
    if ( isdefined( var_0._id_115C2 ) && var_0._id_115C2 == var_1 )
        return 100;

    return 0;
}

_id_26C2( var_0 )
{
    var_1 = "all";

    if ( level.teambased )
        var_1 = scripts\mp\gameobjects::_id_7E93( self.team );

    var_2 = scripts\engine\utility::ter_op( isdefined( var_0._id_B4C4 ) && isdefined( var_0._id_B4C4[var_1] ), 1.0 - var_0._id_B4C4[var_1], 0.0 );
    var_0._id_1E5B._id_B498 = var_2;
    return ( 1.0 - var_2 ) * 0 + var_2 * 100;
}

_id_26C3( var_0 )
{
    var_1 = "all";

    if ( level.teambased )
        var_1 = scripts\mp\gameobjects::_id_7E93( self.team );

    var_2 = scripts\engine\utility::ter_op( isdefined( var_0._id_B4A6 ) && isdefined( var_0._id_B4A6[var_1] ), 1.0 - var_0._id_B4A6[var_1], 0.0 );
    var_0._id_1E5B._id_B4A5 = var_2;
    return ( 1.0 - var_2 ) * 0 + var_2 * 100;
}

_id_26C5( var_0 )
{
    var_1 = "all";

    if ( level.teambased )
        var_1 = scripts\mp\gameobjects::_id_7E93( self.team );

    var_2 = scripts\engine\utility::ter_op( isdefined( var_0._id_B4A6 ) && isdefined( var_0._id_B4A6[var_1] ), 1.0 - var_0._id_B4A6[var_1], 0.0 );
    var_3 = var_2 * scripts\mp\spawnlogic::_id_7F98();

    if ( var_3 < 300 )
        return 0;
    else
        return 100;
}

_id_DCC6( var_0 )
{
    var_0._id_1E5B._id_DCC5 = randomintrange( 0, 99 );
    return var_0._id_1E5B._id_DCC5;
}

_id_B4BD( var_0 )
{
    return 3240000;
}

_id_D837( var_0, var_1 )
{
    var_2 = var_1["activeKOTHZoneNumber"];
    var_3 = var_0._id_571F[var_2];
    var_4 = var_1["maxSquaredDistToObjective"];
    var_5 = 1.0 - var_3 / var_4;
    return 100 * var_5 + 0;
}

_id_26B2( var_0, var_1 )
{
    var_2 = var_1["activeKOTHZoneNumber"];
    var_3 = var_0._id_571F[var_2];
    var_4 = var_1["kothZoneDeadzoneDistSq"];
    return scripts\engine\utility::ter_op( var_3 < var_4, 0, 100 );
}

_id_D82C( var_0, var_1 )
{
    var_2 = var_1["homeBaseTeam"];
    var_3 = var_0._id_5724[var_2];
    var_4 = var_1["maxDistToHomeBase"];
    var_5 = var_3 * var_3;
    var_6 = var_4 * var_4;
    var_7 = 1.0 - var_5 / var_6;
    return 100 * var_7 + 0;
}

_id_26B0( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = var_1["activeCarrierPosition"];
    var_4 = var_1["ballPosition"];
    var_5 = var_1["avoidBallDeadZoneDistSq"];

    if ( isdefined( var_3 ) )
        var_2 = var_3;
    else if ( isdefined( var_4 ) )
        var_2 = var_4;

    if ( isdefined( var_2 ) )
    {
        var_6 = distancesquared( var_2, var_0.origin );
        return scripts\engine\utility::ter_op( var_6 < var_5, 0, 100 );
    }
    else
        return 100;
}

_id_26B1( var_0, var_1 )
{
    var_2 = var_0._id_571E;
    var_3 = var_1["avoidBallDeadZoneDistSq"];
    return scripts\engine\utility::ter_op( var_2 < var_3, 0, 100 );
}

prefernearlastteamspawn( var_0 )
{
    var_1 = level._id_108D1.lastteamspawnpoints[self.team];

    if ( !isdefined( var_1 ) )
        return 0;

    var_2 = distancesquared( var_1.origin, var_0.origin );
    var_2 = int( min( var_2, 9000000 ) );
    var_3 = 1.0 - var_2 / 9000000;
    return 100 * var_3 + 0;
}

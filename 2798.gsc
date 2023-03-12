// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_108D1 = spawnstruct();

    if ( scripts\mp\utility\game::_id_9D46() )
        level.killstreakspawnshielddelayms = 0;
    else
        level.killstreakspawnshielddelayms = 4000;

    level._id_72A2 = 0;
    level.spawnmins = ( 0, 0, 0 );
    level.spawnmaxs = ( 0, 0, 0 );
    level._id_55B6 = 0;
    level._id_C23D = 0;
    level._id_C23C = 0;
    level.players = [];
    level._id_C928 = [];
    level._id_3CB5 = [];
    level._id_108F8 = [];
    level._id_85D5 = [];
    level._id_B898 = [];
    level._id_3A59 = [];
    level._id_8DD3 = [];
    level._id_12A83 = [];
    level._id_114E3 = [];
    level._id_EC9F = [];
    level._id_935F = [];
    level._id_12B14 = [];
    level._id_27EF = [];
    level._id_105EA = [];
    level._id_D3CC = [];
    level._id_108D1.lowerlimitfullsights = getdvarfloat( "scr_lowerLimitFullSights" );
    level._id_108D1.lowerlimitcornersights = getdvarfloat( "scr_lowerLimitCornerSights" );
    level._id_108D1.lastteamspawnpoints = [];
    level._id_108D1.lastbadspawntime = [];
    level thread _id_C56E();
    level thread _id_108FE();
    level thread _id_11ADC();
    level thread _id_11B00();
    level thread _id_11ACB();
    level thread _id_11ADD();
    thread _id_D91D();
    level thread _id_AFB8();

    for ( var_0 = 0; var_0 < level._id_115DA.size; var_0++ )
    {
        level._id_115EA[level._id_115DA[var_0]] = [];
        level._id_115CA[level._id_115DA[var_0]] = [];
    }

    scripts\mp\spawnfactor::_id_9758();
    _id_AEAE();
}

_id_11ADD()
{
    for (;;)
        self waittill( "host_migration_end" );
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        _id_FAD6( var_0 );
    }
}

_id_FAD6( var_0 )
{
    if ( isdefined( level._id_C7B3 ) )
    {
        foreach ( var_2 in level._id_C7B3 )
            var_0 thread _id_139B5( var_2 );
    }
}

_id_139B5( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( var_1 != self )
            continue;

        if ( !scripts\mp\utility\game::isreallyalive( var_1 ) )
            continue;

        if ( scripts\mp\utility\game::_id_9FAE( var_1 ) )
            continue;

        if ( scripts\mp\utility\game::istouchingboundsnullify( var_1 ) )
            continue;

        var_1 thread _id_13B84( var_0 );
    }
}

_id_13B84( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( !isdefined( self.lastboundstimelimit ) )
        self.lastboundstimelimit = scripts\mp\utility\game::_id_7F9B();

    var_1 = gettime() + int( self.lastboundstimelimit * 1000 );
    self._id_1D44 = 1;
    self setclientomnvar( "ui_out_of_bounds_countdown", var_1 );
    self _meth_859E( "mp_out_of_bounds" );
    var_2 = 0;

    for ( var_3 = self.lastboundstimelimit; self istouching( var_0 ); var_3 -= 0.05 )
    {
        if ( !scripts\mp\utility\game::isreallyalive( self ) || scripts\mp\utility\game::istrue( level._id_7669 ) )
            break;

        if ( var_3 <= 0 )
        {
            var_2 = 1;
            break;
        }

        scripts\engine\utility::waitframe();
    }

    self setclientomnvar( "ui_out_of_bounds_countdown", 0 );
    self _meth_859E( "" );
    self._id_1D44 = undefined;

    if ( scripts\mp\utility\game::istrue( var_2 ) )
    {
        self.lastboundstimelimit = undefined;
        scripts\mp\utility\game::_id_1417();
    }
    else
    {
        self.lastboundstimelimit = var_3;
        thread watchtimelimitcooldown();
    }

    if ( scripts\mp\utility\game::isreallyalive( self ) && scripts\mp\utility\game::istrue( level._id_C1BB ) && !scripts\mp\utility\game::istrue( level._id_C1B2 ) )
        thread scripts\mp\killstreaks\nuke::_id_FB0F( 0.05 );
}

watchtimelimitcooldown()
{
    self endon( "disconnect" );
    self notify( "start_time_limit_cooldown" );
    self endon( "start_time_limit_cooldown" );

    for ( var_0 = scripts\mp\utility\game::getmaxoutofboundscooldown(); var_0 > 0; var_0 -= 0.05 )
        scripts\engine\utility::waitframe();

    self.lastboundstimelimit = undefined;
}

_id_F62D( var_0 )
{
    var_1 = [ var_0 ];
    var_2 = [ 0 ];

    foreach ( var_4 in level._id_108D1._id_AFBF )
    {
        var_5 = strtok( var_4, "_" );

        if ( var_5.size == 3 && var_5[0] == var_0 && var_5[1] == "v" )
        {
            var_1[var_1.size] = var_4;
            var_2[var_2.size] = int( var_5[2] );
        }
    }

    var_7 = randomint( var_1.size );
    var_0 = var_1[var_7];
    level._id_108D1._id_AFC0 = var_2[var_7];
    level._id_108D1._id_1677 = var_0;
}

_id_AEAE()
{
    level._id_108D1._id_10882 = [];
    level._id_108D1._id_AFBF = [];
    var_0 = -1;

    for (;;)
    {
        var_0++;
        var_1 = tablelookupbyrow( "mp/spawnweights.csv", var_0, 0 );

        if ( !isdefined( var_1 ) || var_1 == "" )
            break;

        if ( !isdefined( level._id_108D1._id_10882[var_1] ) )
        {
            level._id_108D1._id_10882[var_1] = [];
            level._id_108D1._id_AFBF[level._id_108D1._id_AFBF.size] = var_1;
        }

        var_2 = tablelookupbyrow( "mp/spawnweights.csv", var_0, 1 );
        var_3 = tablelookupbyrow( "mp/spawnweights.csv", var_0, 2 );
        var_3 = float( var_3 );
        level._id_108D1._id_10882[var_1][var_2] = var_3;
    }
}

_id_EC46( var_0, var_1 )
{
    foreach ( var_4, var_3 in level._id_108D1._id_10882[level._id_108D1._id_1677] )
        scripts\mp\spawnfactor::_id_3710( var_0, var_4, var_3, var_1 );
}

addstartspawnpoints( var_0, var_1 )
{
    var_2 = getspawnpointarray( var_0 );
    var_3 = [];

    if ( isdefined( level.modifiedspawnpoints ) )
    {
        for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        {
            if ( checkmodifiedspawnpoint( var_2[var_4] ) )
                continue;

            var_3[var_3.size] = var_2[var_4];
        }
    }
    else
        var_3 = var_2;

    if ( !var_3.size )
    {
        if ( !scripts\mp\utility\game::istrue( var_1 ) )
        {

        }

        return;
    }

    if ( !isdefined( level._id_10DF1 ) )
        level._id_10DF1 = [];

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_3[var_4] _id_108FA();
        var_3[var_4]._id_F1AE = 0;
        var_3[var_4]._id_94C6 = 0;
        level._id_10DF1[level._id_10DF1.size] = var_3[var_4];
    }

    if ( level.teambased )
    {
        foreach ( var_6 in var_3 )
        {
            var_6._id_94C6 = 1;
            var_7 = anglestoforward( var_6.angles );

            foreach ( var_9 in var_3 )
            {
                if ( var_6 == var_9 )
                    continue;

                var_10 = vectornormalize( var_9.origin - var_6.origin );
                var_11 = vectordot( var_7, var_10 );

                if ( var_11 > 0.86 )
                {
                    var_6._id_94C6 = 0;
                    break;
                }
            }
        }
    }
}

addspawnpoints( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_4 = getspawnpointarray( var_1 );

    if ( !var_4.size )
        return;

    _id_DF0D( var_0, var_4, var_3 );
}

_id_DF0D( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_108FB ) )
        level._id_108FB = [];

    if ( !isdefined( level._id_115EA[var_0] ) )
        level._id_115EA[var_0] = [];

    if ( !isdefined( level._id_115CA[var_0] ) )
        level._id_115CA[var_0] = [];

    foreach ( var_4 in var_1 )
    {
        if ( checkmodifiedspawnpoint( var_4 ) )
            continue;

        if ( !isdefined( var_4._id_9800 ) )
        {
            var_4 _id_108FA();
            level._id_108FB[level._id_108FB.size] = var_4;
        }

        if ( scripts\mp\utility\game::istrue( var_2 ) )
        {
            level._id_115CA[var_0][level._id_115CA[var_0].size] = var_4;
            var_4._id_9DF0 = 1;
            continue;
        }

        level._id_115EA[var_0][level._id_115EA[var_0].size] = var_4;
    }
}

_id_108FA()
{
    var_0 = self;
    level.spawnmins = _id_6988( level.spawnmins, var_0.origin );
    level.spawnmaxs = _id_6987( level.spawnmaxs, var_0.origin );
    var_0._id_0143 = anglestoforward( var_0.angles );
    var_0._id_101E9 = var_0.origin + ( 0, 0, 50 );
    var_0.lastspawntime = gettime();
    var_0._id_C7DA = 1;
    var_0._id_9800 = 1;
    var_0._id_1D53 = [];
    var_0._id_A9E9 = [];
    var_1 = 1024;

    if ( !bullettracepassed( var_0._id_101E9, var_0._id_101E9 + ( 0, 0, var_1 ), 0, undefined ) )
    {
        var_2 = var_0._id_101E9 + var_0._id_0143 * 100;

        if ( !bullettracepassed( var_2, var_2 + ( 0, 0, var_1 ), 0, undefined ) )
            var_0._id_C7DA = 0;
    }

    var_3 = anglestoright( var_0.angles );
    var_4 = 1;

    if ( scripts\mp\utility\game::istrue( var_0.noalternates ) )
        var_4 = 0;

    if ( var_4 )
    {
        _id_17A7( var_0, var_0.origin + var_3 * 45 );
        _id_17A7( var_0, var_0.origin - var_3 * 45 );
    }

    if ( _id_100B9() || getdvarint( "sv_generateLOSData", 0 ) == 1 )
    {
        var_0._id_DC0A = _id_80AA( var_0.origin );

        if ( var_0._id_DC0A.size <= 0 )
        {

        }
    }

    _id_98CD( var_0 );
}

_id_17A7( var_0, var_1 )
{
    var_2 = playerphysicstrace( var_0.origin, var_0.origin + ( 0, 0, 18 ) );
    var_3 = var_2[2] - var_0.origin[2];
    var_4 = ( var_1[0], var_1[1], var_1[2] + var_3 );
    var_5 = playerphysicstrace( var_2, var_4 );

    if ( var_5 != var_4 )
        return;

    var_6 = playerphysicstrace( var_4, var_1 );
    var_0._id_1D53[var_0._id_1D53.size] = var_6;
}

getspawnpointarray( var_0 )
{
    if ( !isdefined( level._id_108F8 ) )
        level._id_108F8 = [];

    if ( !isdefined( level._id_108F8[var_0] ) )
    {
        level._id_108F8[var_0] = [];
        level._id_108F8[var_0] = getspawnarray( var_0 );

        foreach ( var_2 in level._id_108F8[var_0] )
            var_2.classname = var_0;
    }

    return level._id_108F8[var_0];
}

_id_813C( var_0 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    var_1 = undefined;
    var_0 = scripts\mp\spawnscoring::_id_3E05( var_0 );
    var_0 = scripts\engine\utility::_id_22A7( var_0 );

    foreach ( var_3 in var_0 )
    {
        var_1 = var_3;

        if ( canspawn( var_1.origin ) && !positionwouldtelefrag( var_1.origin ) )
            break;
    }

    return var_1;
}

getspawnpoint_startspawn( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return undefined;

    var_2 = undefined;
    var_0 = scripts\mp\spawnscoring::_id_3E05( var_0 );

    foreach ( var_4 in var_0 )
    {
        if ( !isdefined( var_4._id_F1AE ) )
            continue;

        if ( var_4._id_F1AE )
            continue;

        if ( var_4._id_94C6 )
        {
            var_2 = var_4;
            break;
        }

        var_2 = var_4;
    }

    if ( !isdefined( var_2 ) )
    {
        if ( scripts\mp\utility\game::istrue( var_1 ) )
            return undefined;

        var_2 = _id_813C( var_0 );
    }

    if ( isdefined( var_2 ) )
        var_2._id_F1AE = 1;

    return var_2;
}

_id_11ADC()
{
    for (;;)
    {
        level._id_85D5 = getentarray( "grenade", "classname" );
        wait 0.05;
    }
}

_id_11B00()
{
    for (;;)
    {
        level._id_B898 = getentarray( "rocket", "classname" );
        wait 0.05;
    }
}

_id_11ACB()
{
    for (;;)
    {
        level._id_3A59 = getentarray( "care_package", "targetname" );
        wait 0.05;
    }
}

getteamspawnpoints( var_0 )
{
    return level._id_115EA[var_0];
}

_id_81A9( var_0 )
{
    return level._id_115CA[var_0];
}

_id_9ED7()
{
    if ( !isdefined( level._id_C96A ) )
    {
        var_0 = getallnodes();
        level._id_C96A = isdefined( var_0 ) && var_0.size > 150;
    }

    return level._id_C96A;
}

_id_1855()
{
    level._id_C928[level._id_C928.size] = self;
}

_id_E113()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < level._id_C928.size; var_1++ )
    {
        if ( level._id_C928[var_1] == self )
        {
            for ( var_0 = 1; var_1 < level._id_C928.size - 1; var_1++ )
                level._id_C928[var_1] = level._id_C928[var_1 + 1];

            level._id_C928[var_1] = undefined;
            break;
        }
    }
}

_id_184B()
{
    level._id_3CB5[level._id_3CB5.size] = self;
}

_id_E106()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < level._id_3CB5.size; var_1++ )
    {
        if ( level._id_3CB5[var_1] == self )
        {
            for ( var_0 = 1; var_1 < level._id_3CB5.size - 1; var_1++ )
                level._id_3CB5[var_1] = level._id_3CB5[var_1 + 1];

            level._id_3CB5[var_1] = undefined;
            break;
        }
    }
}

_id_108FE()
{
    while ( !isdefined( level._id_108FB ) || level._id_108FB.size == 0 )
        wait 0.05;

    level thread _id_108FC();

    if ( _id_100B9() || getdvarint( "sv_generateLOSData", 0 ) == 1 )
    {
        var_0 = [];

        if ( level._id_108FB.size == 0 )
            scripts\engine\utility::_id_66BD( "Spawn System Failure. No Spawnpoints found." );

        for ( var_1 = 0; var_1 < level._id_108FB.size; var_1++ )
        {
            for ( var_2 = 0; var_2 < level._id_108FB[var_1]._id_DC0A.size; var_2++ )
                var_0[var_0.size] = level._id_108FB[var_1]._id_DC0A[var_2];
        }

        if ( var_0.size > 0 )
            cachespawnpathnodesincode( var_0 );
        else
            scripts\engine\utility::_id_66BD( "Spawn System Failure. There are no pathnodes near any spawnpoints." );
    }

    for (;;)
    {
        level._id_55B6 = getdvarint( "scr_disableClientSpawnTraces" ) > 0;
        wait 0.05;
    }
}

_id_7D9A()
{
    var_0 = [];

    foreach ( var_2 in level._id_3CB5 )
    {
        if ( !scripts\mp\utility\game::isreallyalive( var_2 ) )
            continue;

        if ( isplayer( var_2 ) && var_2.sessionstate != "playing" )
            continue;

        if ( var_2 scripts\mp\killstreaks\killstreaks::_id_9FC3() && isdefined( var_2._id_3F14 ) && ( !isdefined( var_2._id_3F14._id_BCB4 ) || !var_2._id_3F14._id_BCB4 ) )
            continue;

        if ( var_2 scripts\mp\killstreaks\killstreaks::_id_9FC4() )
            continue;

        var_2._id_108DF = _id_8143( var_2 );

        if ( var_2._id_108DF == "spectator" )
            continue;

        if ( isagent( var_2 ) && var_2.agent_type == "seeker" )
            continue;

        var_3 = _id_8083( var_2 );
        var_4 = var_2 geteye();
        var_4 = ( var_4[0], var_4[1], var_2.origin[2] + var_3 );
        var_2._id_108E0 = var_3;
        var_2._id_10917 = var_4;
        var_0[var_0.size] = var_2;
    }

    return var_0;
}

_id_12F1F()
{
    level._id_1091D = _id_7D9A();

    foreach ( var_1 in level._id_1091D )
        var_1._id_1091E = undefined;

    foreach ( var_4 in level._id_12A83 )
    {
        if ( !isdefined( var_4 ) )
            continue;

        var_4._id_108DF = _id_8143( var_4 );
        level._id_1091D[level._id_1091D.size] = var_4;
        var_4._id_1091E = undefined;
    }

    foreach ( var_7 in level._id_12B14 )
    {
        if ( !isdefined( var_7 ) )
            continue;

        var_7._id_108DF = _id_8143( var_7 );
        level._id_1091D[level._id_1091D.size] = var_7;
        var_7._id_1091E = undefined;
    }

    foreach ( var_10 in level._id_105EA )
    {
        if ( !isdefined( var_10 ) )
            continue;

        var_10._id_108DF = _id_8143( var_10 );
        level._id_1091D[level._id_1091D.size] = var_10;
        var_10._id_1091E = undefined;
    }

    foreach ( var_13 in level._id_27EF )
    {
        if ( !isdefined( var_13 ) )
            continue;

        var_13._id_108DF = _id_8143( var_13 );
        level._id_1091D[level._id_1091D.size] = var_13;
        var_13._id_1091E = undefined;
    }
}

_id_108FC()
{
    if ( _id_100B9() )
        level waittill( "spawn_restart_trace_system" );

    var_0 = 18;
    var_1 = 0;
    var_2 = 0;
    var_3 = _id_7D9A();

    for (;;)
    {
        if ( var_2 )
        {
            wait 0.05;
            var_1 = 0;
            var_2 = 0;
            var_3 = _id_7D9A();
        }

        var_4 = level._id_108FB;
        var_4 = scripts\mp\spawnscoring::_id_3E05( var_4 );
        var_2 = 1;

        foreach ( var_6 in var_4 )
        {
            _id_41DF( var_6 );

            foreach ( var_8 in var_3 )
            {
                if ( var_6._id_74BC[var_8._id_108DF] )
                    continue;

                var_9 = spawnsighttrace( var_6, var_6._id_101E9, var_8._id_10917 );
                var_1++;

                if ( !var_9 )
                    continue;

                if ( var_9 > 0.95 )
                {
                    var_6._id_74BC[var_8._id_108DF]++;
                    var_6._id_AFD9[var_8._id_108DF]++;
                    continue;
                }

                var_6._id_466B[var_8._id_108DF]++;
            }

            _id_17DC( var_6, level._id_12A83 );
            _id_17DC( var_6, level._id_12B14 );
            _id_17DC( var_6, level._id_105EA );
            _id_17DC( var_6, level._id_27EF );
            _id_AFDA( var_6 );

            if ( var_0 < var_1 )
            {
                wait 0.05;
                var_1 = 0;
                var_2 = 0;
                var_3 = _id_7D9A();
            }
        }
    }
}

_id_AFDA( var_0 )
{
    if ( scripts\mp\utility\game::istrue( var_0._id_3165 ) || scripts\mp\utility\game::istrue( var_0._id_9DCF ) )
        return;

    if ( isdefined( level._id_B3FB ) )
    {
        if ( isdefined( level._id_B3F3 ) && !isdefined( var_0._id_AFC1 ) )
            var_0._id_AFC1 = [[ level._id_B3F3 ]]();

        if ( isdefined( var_0._id_AFC1 ) )
        {
            var_1 = 3;

            if ( level.teambased )
            {
                var_2 = var_0._id_AFD9["allies"] == 0;
                var_3 = var_0._id_AFD9["axis"] == 0;

                if ( var_2 && var_3 )
                    var_1 = 0;
                else if ( var_2 )
                    var_1 = 1;
                else if ( var_3 )
                    var_1 = 2;
            }
            else
                var_1 = scripts\engine\utility::ter_op( var_0._id_74BC["all"] == 0, 0, 3 );

            if ( !isdefined( var_0._id_AFBB ) || var_0._id_AFBB != var_1 )
            {
                [[ level._id_B3FB ]]( var_0._id_AFC1, "allies", "SPAWN_ENTITY", var_0.origin[0], var_0.origin[1], gettime(), var_1 );
                var_0._id_AFBB = var_1;
            }
        }
    }
}

_id_108F9( var_0, var_1 )
{
    _id_41DE( var_0 );

    foreach ( var_3 in var_1 )
    {
        var_4 = distancesquared( var_3.origin, var_0.origin );

        if ( var_4 < var_0._id_B75F[var_3._id_108DF] )
            var_0._id_B75F[var_3._id_108DF] = var_4;

        if ( var_3._id_108DF == "spectator" )
            continue;

        var_0._id_5722[var_3._id_108DF] += var_4;
        var_0._id_5723[var_3._id_108DF] += min( var_4, scripts\mp\spawnfactor::_id_B4BD() );
        var_0._id_11A39[var_3._id_108DF]++;
        var_0._id_5721[var_3._id_108DF][var_3 getentitynumber()] = var_4;
    }
}

_id_8143( var_0 )
{
    var_1 = "all";

    if ( level.teambased )
        var_1 = var_0.team;

    return var_1;
}

_id_98CD( var_0 )
{
    _id_41DF( var_0 );
    _id_41DE( var_0 );
}

_id_41DF( var_0 )
{
    if ( level.teambased )
    {
        foreach ( var_2 in level._id_115DA )
            _id_41E6( var_0, var_2 );
    }
    else
        _id_41E6( var_0, "all" );
}

_id_FADD( var_0 )
{

}

_id_41DE( var_0 )
{
    if ( level.teambased )
    {
        foreach ( var_2 in level._id_115DA )
            _id_41E5( var_0, var_2 );
    }
    else
        _id_41E5( var_0, "all" );
}

_id_41E6( var_0, var_1 )
{
    var_0._id_74BC[var_1] = 0;
    var_0._id_466B[var_1] = 0;
    var_0._id_AFD9[var_1] = 0;
    var_0._id_B4C4[var_1] = 0.0;
    var_0._id_B4A6[var_1] = 0.0;
}

_id_41E5( var_0, var_1 )
{
    var_0._id_5722[var_1] = 0;
    var_0._id_5723[var_1] = 0;
    var_0._id_B75F[var_1] = 9999999;
    var_0._id_11A39[var_1] = 0;
    var_0._id_5721[var_1] = [];
}

_id_8083( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 )
        return 64;

    var_2 = var_0 getstance();

    if ( var_2 == "stand" )
        return 64;

    if ( var_2 == "crouch" )
        return 44;

    return 32;
}

_id_17DC( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_4 = _id_8143( var_3 );

        if ( var_0._id_74BC[var_4] )
            continue;

        var_5 = var_3.origin + ( 0, 0, 50 );
        var_6 = 0.0;

        if ( !var_6 )
            var_6 = spawnsighttrace( var_0, var_0._id_101E9, var_5 );

        if ( !var_6 )
            continue;

        if ( var_6 > 0.95 )
        {
            var_0._id_74BC[var_4]++;
            continue;
        }

        var_0._id_466B[var_4]++;
    }
}

_id_6C5B( var_0 )
{
    if ( !isplayer( self ) )
        return;

    var_1 = gettime();
    self._id_A9F4 = var_0;
    self.lastspawntime = var_1;
    var_0.lastspawntime = var_1;
    var_0._id_A9F5 = self.team;
    level._id_108D1.lastteamspawnpoints[self.team] = var_0;
}

_id_6989( var_0 )
{
    var_1 = getspawnpointarray( var_0 );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        level.spawnmins = _id_6988( level.spawnmins, var_1[var_2].origin );
        level.spawnmaxs = _id_6987( level.spawnmaxs, var_1[var_2].origin );
    }
}

_id_6988( var_0, var_1 )
{
    if ( var_0[0] > var_1[0] )
        var_0 = ( var_1[0], var_0[1], var_0[2] );

    if ( var_0[1] > var_1[1] )
        var_0 = ( var_0[0], var_1[1], var_0[2] );

    if ( var_0[2] > var_1[2] )
        var_0 = ( var_0[0], var_0[1], var_1[2] );

    return var_0;
}

_id_6987( var_0, var_1 )
{
    if ( var_0[0] < var_1[0] )
        var_0 = ( var_1[0], var_0[1], var_0[2] );

    if ( var_0[1] < var_1[1] )
        var_0 = ( var_0[0], var_1[1], var_0[2] );

    if ( var_0[2] < var_1[2] )
        var_0 = ( var_0[0], var_0[1], var_1[2] );

    return var_0;
}

findboxcenter( var_0, var_1 )
{
    var_2 = ( 0, 0, 0 );
    var_2 = var_1 - var_0;
    var_2 = ( var_2[0] / 2, var_2[1] / 2, var_2[2] / 2 ) + var_0;
    return var_2;
}

_id_F78E()
{
    level.spawnmins = ( 0, 0, 0 );
    level.spawnmaxs = ( 0, 0, 0 );
    _id_6989( "mp_tdm_spawn_allies_start" );
    _id_6989( "mp_tdm_spawn_axis_start" );
    level.mapcenter = findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
}

_id_100BA()
{
    if ( getdvarint( "scr_forceStartSpawns", 0 ) == 1 )
        return 1;

    if ( scripts\mp\utility\game::istrue( level._id_5614 ) )
        return 0;

    return level.ingraceperiod && ( !isdefined( level._id_C234 ) || level._id_C234 == 0 );
}

_id_8053( var_0, var_1 )
{
    if ( var_1 )
    {
        var_2 = 0;
        var_3 = _id_7E2D();
    }
    else
    {
        var_2 = _id_7E2D();
        var_3 = 250;
    }

    return getnodesinradius( var_0, var_3, var_2, 512, "path" );
}

_id_80AA( var_0 )
{
    var_1 = [];
    var_2 = getclosestnodeinsight( var_0 );

    if ( isdefined( var_2 ) )
        var_1[0] = var_2;

    if ( !isdefined( var_2 ) )
    {
        var_1 = getnodesinradius( var_0, _id_7E2D(), 0, 256, "path" );

        if ( var_1.size == 0 )
            var_1 = getnodesinradius( var_0, 250, 0, 256, "path" );
    }

    return var_1;
}

_id_67D3( var_0, var_1 )
{
    if ( !_id_100B9() )
        return;

    var_2 = "all";

    if ( level.teambased )
        var_2 = scripts\mp\gameobjects::_id_7E93( var_1 );

    _id_41E6( var_0, var_2 );
    var_3 = 0.95;
    var_4 = 0;
    var_5 = undefined;
    var_6 = undefined;
    var_7 = _id_9FB6();
    var_3 = level._id_108D1.lowerlimitfullsights;
    var_4 = level._id_108D1.lowerlimitcornersights;

    foreach ( var_9 in level._id_1091D )
    {
        if ( level.teambased && var_9._id_108DF != var_2 )
            continue;

        if ( var_0._id_74BC[var_9._id_108DF] )
            break;

        if ( !isdefined( var_9._id_1091E ) )
        {
            var_9._id_1091E = var_9 _meth_8480( _id_7EB3() );

            if ( !isdefined( var_9._id_1091E ) || var_9._id_1091E.size == 0 )
            {
                if ( isdefined( level._id_B3FC ) && var_7 && isplayer( var_9 ) )
                {
                    if ( !isdefined( var_9._id_A9CC ) || var_9._id_A9CC != gettime() )
                    {
                        [[ level._id_B3FC ]]( "LOG_GENERIC_MESSAGE", gettime(), "WARNING: Could not use TTLOS data for player " + var_9.name );
                        var_9._id_A9CC = gettime();
                    }
                }
            }
        }

        if ( var_7 && isdefined( var_9._id_1091E ) && var_9._id_1091E.size > 0 )
        {
            var_10 = _precomputedlosdatatest( var_9, var_0 );
            var_5 = var_10[0];
            var_6 = var_10[1];
        }

        if ( !isdefined( var_5 ) )
        {
            var_11 = undefined;

            if ( isplayer( var_9 ) )
                var_11 = var_9 geteye();
            else
                var_11 = var_9.origin + ( 0, 0, 50 );

            var_5 = _id_54EC( var_0, var_9, var_11 );
            var_6 = var_5;
        }

        if ( !isdefined( var_0._id_B4C4[var_9._id_108DF] ) || var_5 > var_0._id_B4C4[var_9._id_108DF] )
            var_0._id_B4C4[var_9._id_108DF] = var_5;

        if ( isdefined( var_6 ) && isplayer( var_9 ) )
        {
            if ( !isdefined( var_0._id_B4A6[var_9._id_108DF] ) || var_5 > var_0._id_B4A6[var_9._id_108DF] )
                var_0._id_B4A6[var_9._id_108DF] = var_6;
        }

        if ( var_5 > var_3 )
        {
            var_0._id_74BC[var_9._id_108DF]++;
            var_0._id_AFD9[var_9._id_108DF]++;
            continue;
        }

        if ( var_5 > var_4 )
            var_0._id_466B[var_9._id_108DF]++;
    }

    _id_AFDA( var_0 );
}

_precomputedlosdatatest( var_0, var_1 )
{
    var_2 = checkttlosoverrides( var_0, var_1 );

    if ( !isdefined( var_2 ) )
        var_2 = _func_295( var_0._id_1091E, var_1._id_DC0A );

    return var_2;
}

checkttlosoverrides( var_0, var_1 )
{
    if ( !isdefined( level._id_108D1.ttlosoverrides ) )
        return;

    foreach ( var_3 in var_0._id_1091E )
    {
        var_4 = var_3 _meth_8149();

        if ( isdefined( level._id_108D1.ttlosoverrides[var_4] ) )
        {
            foreach ( var_6 in var_1._id_DC0A )
            {
                var_7 = var_6 _meth_8149();

                if ( isdefined( level._id_108D1.ttlosoverrides[var_4][var_7] ) )
                    return level._id_108D1.ttlosoverrides[var_4][var_7];
            }
        }
    }
}

addttlosoverride( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );

    for (;;)
    {
        if ( isdefined( level._id_108D1 ) )
            break;

        scripts\engine\utility::waitframe();
    }

    if ( !isdefined( level._id_108D1.ttlosoverrides ) )
        level._id_108D1.ttlosoverrides = [];

    if ( !isdefined( level._id_108D1.ttlosoverrides[var_0] ) )
        level._id_108D1.ttlosoverrides[var_0] = [];

    level._id_108D1.ttlosoverrides[var_0][var_1] = [ var_2, var_3 ];

    if ( !isdefined( level._id_108D1.ttlosoverrides[var_1] ) )
        level._id_108D1.ttlosoverrides[var_1] = [];

    level._id_108D1.ttlosoverrides[var_1][var_0] = [ var_2, var_3 ];
}

_id_7E2D()
{
    return 130;
}

_id_7EB3()
{
    return 250;
}

_id_54EC( var_0, var_1, var_2 )
{
    var_3 = var_0._id_101E9;
    var_4 = var_2;
    var_5 = physics_createcontents( [ "physicscontents_aiavoid", "physicscontents_solid", "physicscontents_structural" ] );
    var_6 = physics_raycast( var_3, var_4, var_5, var_1, 0, "physicsquery_any" );
    return scripts\engine\utility::ter_op( var_6, 0.0, 1.0 );
}

_id_7F98()
{
    return 2550;
}

_id_100B9()
{
    return getdvarint( "sv_usePrecomputedLOSData", 0 ) == 1 && !isdefined( level._id_560C ) && getdvarint( "sv_generateLOSData", 0 ) != 1;
}

_id_9FB6()
{
    return _func_296();
}

_id_D91D()
{
    level waittill( "prematch_done" );

    if ( getdvarint( "scr_playtest", 0 ) == 1 && isdefined( level.players ) )
    {
        foreach ( var_1 in level.players )
        {
            if ( var_1 ishost() )
            {
                if ( _id_100B9() )
                    var_1 iprintlnbold( "Attempting to use NEW Spawn System..." );
                else
                    var_1 iprintlnbold( "Using OLD Spawn System..." );

                break;
            }
        }
    }

    if ( isdefined( level._id_B3FC ) )
    {
        if ( _id_100B9() )
            [[ level._id_B3FC ]]( "LOG_GENERIC_MESSAGE", gettime(), "Attempting to use TTLOS Spawning Data..." );
        else
            [[ level._id_B3FC ]]( "LOG_GENERIC_MESSAGE", gettime(), "Using Corner-Trace Spawning System..." );
    }
}

_id_E2B6()
{
    level notify( "spawn_restart_trace_system" );
}

_id_9DF1( var_0 )
{
    return scripts\mp\utility\game::istrue( var_0._id_9DF0 );
}

_id_AFB8()
{
    if ( getdvarint( "scr_extra_spawn_logging", 0 ) != 1 )
        return;

    level waittill( "prematch_done" );
    var_0 = undefined;
    var_1 = undefined;

    if ( isdefined( level._id_B3F3 ) )
    {
        var_0 = [[ level._id_B3F3 ]]();
        var_1 = [[ level._id_B3F3 ]]();
    }

    for (;;)
    {
        if ( !_id_100B9() )
            break;

        _id_AFB7( "allies", var_0 );
        wait 0.5;
        _id_AFB7( "axis", var_1 );
        wait 0.5;
    }
}

_id_AFB7( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2.team = var_0;
    var_2.pers = [];
    var_2.pers["team"] = var_0;
    var_2._id_5612 = 1;
    var_2._id_9DCF = 1;
    var_3 = var_2 [[ level.getspawnpoint ]]();

    if ( isdefined( level._id_B3FB ) && isdefined( var_3 ) && isdefined( var_1 ) )
    {
        var_4 = scripts\engine\utility::ter_op( var_0 == "allies", "BEST_SPAWN_ALLIES", "BEST_SPAWN_AXIS" );
        [[ level._id_B3FB ]]( var_1, var_0, var_4, var_3.origin[0], var_3.origin[1], gettime() );
    }
}

clearlastteamspawns()
{
    level._id_108D1.lastteamspawnpoints = [];
}

getoriginidentifierstring( var_0 )
{
    return int( var_0.origin[0] ) + " " + int( var_0.origin[1] ) + " " + int( var_0.origin[2] );
}

checkmodifiedspawnpoint( var_0 )
{
    if ( !isdefined( level.modifiedspawnpoints ) )
        return 0;

    var_1 = undefined;
    var_2 = getoriginidentifierstring( var_0 );

    if ( isdefined( level.modifiedspawnpoints[var_2] ) )
        var_1 = level.modifiedspawnpoints[var_2][var_0.classname];

    if ( !isdefined( var_1 ) )
        return 0;

    if ( scripts\mp\utility\game::istrue( var_1["remove"] ) )
        return 1;

    if ( isdefined( var_1["origin"] ) )
        var_0.origin = var_1["origin"];

    if ( isdefined( var_1["angles"] ) )
        var_0.angles = var_1["angles"];

    if ( scripts\mp\utility\game::istrue( var_1["no_alternates"] ) )
        var_0.noalternates = 1;

    return 0;
}

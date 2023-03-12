// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_2DB1( var_0, var_1, var_2 )
{
    var_3 = self _meth_8533();
    var_4 = getnodesinradius( self.origin, var_0, 0, 512, "path", var_3 );
    var_5 = [];
    var_6 = self getnearestnode();
    var_7 = anglestoforward( self getplayerangles() );
    var_8 = vectornormalize( var_7 * ( 1, 1, 0 ) );

    foreach ( var_10 in var_4 )
    {
        var_11 = vectornormalize( ( var_10.origin - self.origin ) * ( 1, 1, 0 ) );
        var_12 = vectordot( var_11, var_8 );

        if ( var_12 > var_1 )
        {
            if ( !var_2 || isdefined( var_6 ) && nodesvisible( var_10, var_6, 1 ) )
                var_5 = scripts\engine\utility::_id_2279( var_5, var_10 );
        }
    }

    return var_5;
}

_id_2DBB( var_0, var_1 )
{
    if ( var_0 == "none" )
        return var_1 == "none";
    else if ( var_0 == "hunt" )
        return var_1 == "hunt" || var_1 == "none";
    else if ( var_0 == "guard" )
        return var_1 == "guard" || var_1 == "hunt" || var_1 == "none";
    else if ( var_0 == "objective" )
        return var_1 == "objective" || var_1 == "guard" || var_1 == "hunt" || var_1 == "none";
    else if ( var_0 == "critical" )
        return var_1 == "critical" || var_1 == "objective" || var_1 == "guard" || var_1 == "hunt" || var_1 == "none";
    else if ( var_0 == "tactical" )
        return 1;
}

bot_set_personality( var_0 )
{
    self botsetpersonality( var_0 );
    scripts\mp\bots\bots_personality::bot_assign_personality_functions();
    self botclearscriptgoal();
}

bot_set_difficulty( var_0 )
{
    if ( var_0 == "default" )
        var_0 = _id_2D30();

    self botsetdifficulty( var_0 );

    if ( isplayer( self ) )
    {
        self.pers["rankxp"] = scripts\mp\utility\game::_id_7BF8();
        scripts\mp\rank::_id_D458();
    }
}

_id_2D30()
{
    if ( !isdefined( level._id_2D5B ) )
    {
        level._id_2D5B = [];

        if ( level.rankedmatch )
        {
            level._id_2D5B[level._id_2D5B.size] = "regular";
            level._id_2D5B[level._id_2D5B.size] = "hardened";
        }
        else
        {
            level._id_2D5B[level._id_2D5B.size] = "recruit";
            level._id_2D5B[level._id_2D5B.size] = "regular";
            level._id_2D5B[level._id_2D5B.size] = "hardened";
        }
    }

    var_0 = self._id_2D32;

    if ( !isdefined( var_0 ) )
    {
        var_1 = [];
        var_2 = self.team;

        if ( !isdefined( var_2 ) )
            var_2 = self.bot_team;

        if ( !isdefined( var_2 ) )
            var_2 = self.pers["team"];

        if ( !isdefined( var_2 ) )
            var_2 = "allies";

        foreach ( var_4 in level.players )
        {
            if ( var_4 == self )
                continue;

            if ( !isai( var_4 ) )
                continue;

            var_5 = var_4 botgetdifficulty();

            if ( var_5 == "default" )
                continue;

            var_6 = var_4.team;

            if ( !isdefined( var_6 ) )
                var_6 = var_4.bot_team;

            if ( !isdefined( var_6 ) )
                var_6 = var_4.pers["team"];

            if ( !isdefined( var_6 ) )
                continue;

            if ( !isdefined( var_1[var_6] ) )
                var_1[var_6] = [];

            if ( !isdefined( var_1[var_6][var_5] ) )
            {
                var_1[var_6][var_5] = 1;
                continue;
            }

            var_1[var_6][var_5]++;
        }

        var_8 = -1;

        foreach ( var_10 in level._id_2D5B )
        {
            if ( !isdefined( var_1[var_2] ) || !isdefined( var_1[var_2][var_10] ) )
            {
                var_0 = var_10;
                break;
            }
            else if ( var_8 == -1 || var_1[var_2][var_10] < var_8 )
            {
                var_8 = var_1[var_2][var_10];
                var_0 = var_10;
            }
        }
    }

    if ( isdefined( var_0 ) )
        self._id_2D32 = var_0;

    return var_0;
}

_id_2DD5()
{
    if ( _id_2DD7() )
    {
        if ( self._id_2D57 == "capture" || self._id_2D57 == "capture_zone" )
            return 1;
    }

    return 0;
}

_id_2DDC()
{
    if ( _id_2DD7() )
    {
        if ( self._id_2D57 == "patrol" )
            return 1;
    }

    return 0;
}

_id_2DDD()
{
    if ( _id_2DD7() )
    {
        if ( self._id_2D57 == "protect" )
            return 1;
    }

    return 0;
}

_id_2DD4()
{
    if ( _id_2DD7() )
    {
        if ( self._id_2D57 == "bodyguard" )
            return 1;
    }

    return 0;
}

_id_2DD7()
{
    return isdefined( self._id_2D51 );
}

_id_2DD8( var_0 )
{
    if ( _id_2DD7() )
    {
        if ( _id_2EC6( self._id_2D52, var_0 ) )
            return 1;
    }

    return 0;
}

_id_2DDA( var_0 )
{
    if ( _id_2DD4() && self._id_2D4D == var_0 )
        return 1;

    return 0;
}

_id_2D19()
{
    var_0 = [];
    var_1 = [];
    var_2 = 0;

    foreach ( var_4 in level._id_2C7A )
    {
        var_0[var_2] = scripts\engine\utility::_id_DC6B( var_4._id_2EFE ).origin;
        var_1[var_2] = "zone" + var_4._id_01AD;
        var_2++;
    }

    _id_2D18( var_0, var_1 );
}

_id_2D1A( var_0, var_1 )
{
    wait 1.0;
    var_2 = [];
    var_3 = [];

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        if ( isdefined( var_0[var_4]._id_2EFD ) )
            var_2[var_4] = var_0[var_4]._id_2EFD.origin;
        else
        {
            var_0[var_4]._id_BE7C = getclosestnodeinsight( var_0[var_4].origin );
            var_2[var_4] = var_0[var_4]._id_BE7C.origin;
        }

        var_3[var_4] = var_1 + var_0[var_4]._id_EDF9;
    }

    _id_2D18( var_2, var_3 );
}

_id_6655( var_0, var_1, var_2 )
{
    var_3 = ( 0, 0, 11 );
    var_4 = ( 0, 0, 40 );
    var_5 = undefined;

    if ( var_2 == "stand" )
        return 1;
    else if ( var_2 == "crouch" )
        var_5 = var_4;
    else if ( var_2 == "prone" )
        var_5 = var_3;

    return sighttracepassed( var_1 + var_5, var_0 + var_5, 0, undefined );
}

_id_2D18( var_0, var_1 )
{
    wait 0.1;
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_1[var_3];
        var_2[var_4] = findentrances( var_0[var_3] );
        wait 0.05;

        for ( var_5 = 0; var_5 < var_2[var_4].size; var_5++ )
        {
            var_6 = var_2[var_4][var_5];
            var_6._id_9C8B = 1;
            var_6._id_DA7C[var_4] = _id_6655( var_6.origin, var_0[var_3], "prone" );
            wait 0.05;
            var_6._id_4A9C[var_4] = _id_6655( var_6.origin, var_0[var_3], "crouch" );
            wait 0.05;

            for ( var_7 = 0; var_7 < var_1.size; var_7++ )
            {
                for ( var_8 = var_7 + 1; var_8 < var_1.size; var_8++ )
                {
                    var_6._id_C4B6[var_1[var_7]][var_1[var_8]] = 0;
                    var_6._id_C4B6[var_1[var_8]][var_1[var_7]] = 0;
                }
            }
        }
    }

    var_9 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        for ( var_5 = var_3 + 1; var_5 < var_0.size; var_5++ )
        {
            var_10 = _id_79A9( var_0[var_3], var_0[var_5] );
            var_9[var_1[var_3]][var_1[var_5]] = var_10;
            var_9[var_1[var_5]][var_1[var_3]] = var_10;

            foreach ( var_12 in var_10 )
            {
                var_12._id_C4B6[var_1[var_3]][var_1[var_5]] = 1;
                var_12._id_C4B6[var_1[var_5]][var_1[var_3]] = 1;
            }
        }
    }

    if ( !isdefined( level._id_D813 ) )
        level._id_D813 = [];

    if ( !isdefined( level._id_6650 ) )
        level._id_6650 = [];

    if ( !isdefined( level._id_664E ) )
        level._id_664E = [];

    if ( !isdefined( level._id_6651 ) )
        level._id_6651 = [];

    level._id_D813 = scripts\engine\utility::_id_2283( level._id_D813, var_9 );
    level._id_6650 = scripts\engine\utility::_id_227F( level._id_6650, var_0 );
    level._id_664E = scripts\engine\utility::_id_227F( level._id_664E, var_1 );
    level._id_6651 = scripts\engine\utility::_id_2283( level._id_6651, var_2 );
    level._id_6652 = 1;
}

_id_79A9( var_0, var_1 )
{
    var_2 = _id_74C8( var_0, var_1 );

    if ( isdefined( var_2 ) )
    {
        var_2 = _id_E001( var_2 );
        var_2 = _id_7800( var_2 );
    }

    return var_2;
}

_id_74C9( var_0, var_1 )
{
    return getpathdist( var_0, var_1 );
}

_id_74C8( var_0, var_1 )
{
    return getnodesonpath( var_0, var_1 );
}

_id_74C3( var_0, var_1, var_2 )
{
    return botgetclosestnavigablepoint( var_0, var_1, var_2 );
}

_id_C037( var_0, var_1 )
{
    if ( !isdefined( self._id_C4B6 ) || !isdefined( self._id_C4B6[var_0] ) || !isdefined( self._id_C4B6[var_0][var_1] ) )
        return 0;

    return self._id_C4B6[var_0][var_1];
}

_id_7800( var_0 )
{
    var_1 = var_0;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = getlinkednodes( var_0[var_2] );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            if ( !scripts\engine\utility::array_contains( var_1, var_3[var_4] ) )
                var_1 = scripts\engine\utility::_id_2279( var_1, var_3[var_4] );
        }
    }

    return var_1;
}

_id_7D4B( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( nodesvisible( var_4, var_1, 1 ) )
            var_2 = scripts\engine\utility::_id_2279( var_2, var_4 );
    }

    return var_2;
}

_id_E001( var_0 )
{
    var_0[var_0.size - 1] = undefined;
    var_0[0] = undefined;
    return scripts\engine\utility::_id_22BC( var_0 );
}

_id_2ECA( var_0 )
{
    var_1 = 1;

    while ( !_id_2D17( var_0 ) )
        wait 0.5;
}

_id_2D17( var_0 )
{
    if ( botautoconnectenabled() )
        return 1;

    if ( _id_2EEF( var_0 ) )
        return 1;

    return 0;
}

_id_2ECC( var_0 )
{
    var_1 = gettime();

    for (;;)
    {
        if ( isdefined( var_0 ) )
        {
            if ( gettime() > var_1 + var_0 )
                return;
        }

        if ( !isdefined( self._id_010C ) )
            return;
        else if ( !_id_2DCA() )
            return;

        wait 0.05;
    }
}

_id_2DCA( var_0 )
{
    var_1 = gettime() - self._id_A8BA;
    var_2 = level._id_2E3C;

    if ( isdefined( var_0 ) )
        var_2 = var_0;

    return var_1 < var_2;
}

_id_2ECB( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) && isdefined( var_2 ) )
    {

    }

    var_3 = [ "goal", "bad_path", "no_path", "node_relinquished", "script_goal_changed" ];

    if ( isdefined( var_1 ) )
        var_3[var_3.size] = var_1;

    if ( isdefined( var_2 ) )
        var_3[var_3.size] = var_2;

    if ( isdefined( var_0 ) )
        var_4 = scripts\engine\utility::_id_1372E( var_3, var_0 );
    else
        var_4 = scripts\engine\utility::_id_13730( var_3 );

    return var_4;
}

_id_2EBE( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    childthread _id_12FB1();
    var_3 = scripts\engine\utility::_id_13736( var_0, var_1, var_2, "use_button_no_longer_pressed", "finished_use" );
    self notify( "stop_usebutton_watcher" );
    return var_3;
}

_id_12FB1( var_0, var_1 )
{
    self endon( "stop_usebutton_watcher" );
    wait 0.05;

    while ( self usebuttonpressed() )
        wait 0.05;

    self notify( "use_button_no_longer_pressed" );
}

_id_2EEF( var_0 )
{
    foreach ( var_2 in level._id_C928 )
    {
        if ( isai( var_2 ) )
        {
            if ( isdefined( var_0 ) && var_0 )
            {
                if ( !scripts\mp\utility\game::_id_9F9D( var_2 ) )
                    continue;
            }

            return 1;
        }
    }

    return 0;
}

_id_2DA8( var_0, var_1 )
{
    if ( !isdefined( level._id_6652 ) && !isdefined( self._id_5091 ) )
        return undefined;

    var_2 = [];

    if ( isdefined( self._id_5091 ) )
        var_2 = self._id_5091;
    else
        var_2 = level._id_6651[var_1];

    if ( !isdefined( var_0 ) || var_0 == "stand" )
        return var_2;
    else if ( var_0 == "crouch" )
    {
        var_3 = [];

        foreach ( var_5 in var_2 )
        {
            if ( var_5._id_4A9C[var_1] )
                var_3 = scripts\engine\utility::_id_2279( var_3, var_5 );
        }

        return var_3;
    }
    else if ( var_0 == "prone" )
    {
        var_3 = [];

        foreach ( var_5 in var_2 )
        {
            if ( var_5._id_DA7C[var_1] )
                var_3 = scripts\engine\utility::_id_2279( var_3, var_5 );
        }

        return var_3;
    }

    return undefined;
}

_id_2D7A( var_0, var_1, var_2 )
{
    var_3 = undefined;
    var_4 = self _meth_8533();
    var_5 = self._id_2D4D _meth_816B();

    if ( lengthsquared( var_5 ) > 100 )
    {
        var_6 = getnodesinradius( var_0, var_1 * 1.75, var_1 * 0.5, 500, "path", var_4 );
        var_7 = [];
        var_8 = vectornormalize( var_5 );

        for ( var_9 = 0; var_9 < var_6.size; var_9++ )
        {
            var_10 = vectornormalize( var_6[var_9].origin - self._id_2D4D.origin );

            if ( vectordot( var_10, var_8 ) > 0.1 )
                var_7[var_7.size] = var_6[var_9];
        }
    }
    else
        var_7 = getnodesinradius( var_0, var_1, 0, 500, "path", var_4 );

    if ( isdefined( var_2 ) && var_2 )
    {
        var_11 = vectornormalize( self._id_2D4D.origin - self.origin );
        var_12 = var_7;
        var_7 = [];

        foreach ( var_14 in var_12 )
        {
            var_10 = vectornormalize( var_14.origin - self._id_2D4D.origin );

            if ( vectordot( var_11, var_10 ) > 0.2 )
                var_7[var_7.size] = var_14;
        }
    }

    var_16 = [];
    var_17 = [];
    var_18 = [];

    for ( var_9 = 0; var_9 < var_7.size; var_9++ )
    {
        var_19 = distancesquared( var_7[var_9].origin, var_0 ) > 10000;
        var_20 = abs( var_7[var_9].origin[2] - self._id_2D4D.origin[2] ) < 50;

        if ( var_19 )
            var_16[var_16.size] = var_7[var_9];

        if ( var_20 )
            var_17[var_17.size] = var_7[var_9];

        if ( var_19 && var_20 )
            var_18[var_18.size] = var_7[var_9];

        if ( var_9 % 100 == 99 )
            wait 0.05;
    }

    if ( var_18.size > 0 )
        var_3 = self botnodepick( var_18, var_18.size * 0.15, "node_capture", var_0, undefined, self._id_5092 );

    if ( !isdefined( var_3 ) )
    {
        wait 0.05;

        if ( var_17.size > 0 )
            var_3 = self botnodepick( var_17, var_17.size * 0.15, "node_capture", var_0, undefined, self._id_5092 );

        if ( !isdefined( var_3 ) && var_16.size > 0 )
        {
            wait 0.05;
            var_3 = self botnodepick( var_16, var_16.size * 0.15, "node_capture", var_0, undefined, self._id_5092 );
        }
    }

    return var_3;
}

_id_2D78( var_0, var_1, var_2 )
{
    var_3 = undefined;
    var_4 = self _meth_8533();
    var_5 = getnodesinradius( var_0, var_1, 0, 500, "path", var_4 );

    if ( var_5.size > 0 )
        var_3 = self botnodepick( var_5, var_5.size * 0.15, "node_capture", var_0, var_2, self._id_5092 );

    return var_3;
}

_id_2D79( var_0, var_1 )
{
    var_2 = undefined;

    if ( var_0.size > 0 )
        var_2 = self botnodepick( var_0, var_0.size * 0.15, "node_capture", undefined, var_1, self._id_5092 );

    return var_2;
}

_id_2D77( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = self _meth_8533();
    var_4 = getnodesinradius( var_0, var_1, 0, 500, "path", var_3 );

    if ( var_4.size > 0 )
        var_2 = self botnodepick( var_4, var_4.size * 0.15, "node_protect", var_0, self._id_5092 );

    return var_2;
}

_id_2E4A( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = undefined;
    var_6 = self _meth_8533();
    var_7 = getnodesinradius( var_0, var_1, 0, 500, "path", var_6 );

    if ( isdefined( var_7 ) && var_7.size >= 2 )
        var_5 = _id_2D7B( var_7, var_2 );

    if ( !isdefined( var_5 ) )
    {
        if ( !isdefined( var_3 ) )
            var_3 = 0;

        if ( !isdefined( var_4 ) )
            var_4 = 1;

        var_8 = randomfloatrange( self._id_2D55 * var_3, self._id_2D55 * var_4 );
        var_9 = anglestoforward( ( 0, randomint( 360 ), 0 ) );
        var_5 = var_0 + var_9 * var_8;
    }

    return var_5;
}

_id_2E49( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( var_1.size >= 2 )
        var_3 = _id_2D7B( var_1, var_2 );

    if ( !isdefined( var_3 ) )
    {
        var_4 = scripts\engine\utility::_id_DC6B( var_1 );
        var_5 = var_4.origin - var_0;
        var_3 = var_0 + vectornormalize( var_5 ) * length( var_5 ) * randomfloat( 1.0 );
    }

    return var_3;
}

_id_2D7B( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = scripts\engine\utility::_id_22A7( var_0 );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        for ( var_5 = var_4 + 1; var_5 < var_3.size; var_5++ )
        {
            var_6 = var_3[var_4];
            var_7 = var_3[var_5];

            if ( nodesvisible( var_6, var_7, 1 ) )
            {
                var_2 = ( ( var_6.origin[0] + var_7.origin[0] ) * 0.5, ( var_6.origin[1] + var_7.origin[1] ) * 0.5, ( var_6.origin[2] + var_7.origin[2] ) * 0.5 );

                if ( isdefined( var_1 ) && self [[ var_1 ]]( var_2 ) == 1 )
                    return var_2;
            }
        }
    }

    return var_2;
}

_id_507A()
{
    if ( isdefined( self._id_2D54 ) )
        return self._id_2D54.origin;
    else if ( isdefined( self._id_2D52 ) )
        return self._id_2D52;

    return undefined;
}

_id_2D0A()
{
    if ( scripts\mp\utility\game::bot_is_fireteam_mode() )
    {
        if ( isdefined( self._id_101B9 ) && self._id_101B9 == 1 )
            return 0;
    }

    if ( scripts\mp\utility\game::_id_9E68() )
        return 0;

    if ( bot_is_remote_or_linked() )
        return 0;

    if ( self isusingturret() )
        return 0;

    if ( isdefined( level._id_C1C4 ) )
        return 0;

    if ( isdefined( self._id_12B90 ) && self._id_12B90 )
        return 0;

    if ( isdefined( self._id_45D6 ) && self._id_45D6 )
        return 0;

    if ( self _meth_81B3() )
        return 0;

    if ( !_id_2DCA( 500 ) )
        return 1;

    if ( !isalive( self._id_010C ) )
        return 1;

    return 0;
}

bot_recent_point_of_interest()
{
    var_0 = undefined;
    var_1 = botmemoryflags( "investigated", "killer_died" );
    var_2 = botmemoryflags( "investigated" );
    var_3 = scripts\engine\utility::_id_DC6B( botgetmemoryevents( 0, gettime() - 10000, 1, "death", var_1, self ) );

    if ( isdefined( var_3 ) )
    {
        var_0 = var_3;
        self._id_2E20 = 10000;
    }
    else
    {
        var_4 = undefined;

        if ( self botgetscriptgoaltype() != "none" )
            var_4 = self botgetscriptgoal();

        var_5 = botgetmemoryevents( 0, gettime() - 45000, 1, "kill", var_2, self );
        var_6 = botgetmemoryevents( 0, gettime() - 45000, 1, "death", var_1, self );
        var_7 = [];

        foreach ( var_9 in var_5 )
            var_7[var_7.size] = var_9;

        foreach ( var_9 in var_6 )
            var_7[var_7.size] = var_9;

        var_3 = scripts\engine\utility::_id_DC6B( var_7 );

        if ( isdefined( var_3 ) > 0 && ( !isdefined( var_4 ) || distancesquared( var_4, var_3 ) > 1000000 ) )
        {
            var_0 = var_3;
            self._id_2E20 = 45000;
        }
    }

    if ( isdefined( var_0 ) )
    {
        var_13 = getzonenearest( var_0 );
        var_14 = getzonenearest( self.origin );

        if ( isdefined( var_13 ) && isdefined( var_14 ) && var_14 != var_13 )
        {
            var_15 = botzonegetcount( var_13, self.team, "ally" ) + botzonegetcount( var_13, self.team, "path_ally" );

            if ( var_15 > 1 )
                var_0 = undefined;
        }
    }

    if ( isdefined( var_0 ) )
        self._id_2E1F = var_0;

    return var_0;
}

_id_2D66( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{

}

_id_2D67( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{

}

_id_2D65( var_0, var_1, var_2, var_3, var_4 )
{

}

_id_2DB8()
{
    var_0 = 0;
    var_1 = undefined;

    if ( isdefined( self._id_13CA0 ) && self._id_13CA0.size > 0 )
        var_1 = self._id_13CA0;
    else
        var_1 = self getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        var_0 += self getweaponammoclip( var_3 );
        var_0 += self getweaponammostock( var_3 );
    }

    return var_0;
}

_id_2E3B()
{
    var_0 = undefined;

    if ( isdefined( self._id_13CA0 ) && self._id_13CA0.size > 0 )
        var_0 = self._id_13CA0;
    else
        var_0 = self getweaponslistprimaries();

    foreach ( var_2 in var_0 )
    {
        if ( self getweaponammoclip( var_2 ) > 0 )
            return 0;

        if ( self getweaponammostock( var_2 ) > 0 )
            return 0;
    }

    return 1;
}

_id_2DA9()
{
    var_0 = 0;
    var_1 = self getweaponslistall();

    foreach ( var_3 in var_1 )
        var_0 += self getweaponammostock( var_3 );

    return var_0;
}

_id_2DBD( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return 0;

    switch ( var_0 )
    {
        case "trap_directional":
            switch ( var_1 )
            {
                case "claymore_mp":
                    return 1;
            }

            break;
        case "trap":
            switch ( var_1 )
            {
                case "motion_sensor_mp":
                case "proximity_explosive_mp":
                case "trophy_mp":
                    return 1;
            }

            break;
        case "c4":
            switch ( var_1 )
            {
                case "c4_mp":
                    return 1;
            }

            break;
        case "tacticalinsertion":
            switch ( var_1 )
            {
                case "flare_mp":
                    return 1;
            }

            break;
    }

    return 0;
}

_id_2DAA( var_0 )
{
    if ( self botgetdifficultysetting( "allowGrenades" ) != 0 )
    {
        var_1 = self botfirstavailablegrenade( "lethal" );

        if ( _id_2DBD( var_0, var_1 ) )
            return "lethal";

        var_1 = self botfirstavailablegrenade( "tactical" );

        if ( _id_2DBD( var_0, var_1 ) )
            return "tactical";
    }
}

_id_2ED4( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self notify( "bot_watch_nodes" );
    self endon( "bot_watch_nodes" );
    self endon( "bot_watch_nodes_stop" );
    self endon( "disconnect" );
    self endon( "death" );
    wait 1.0;
    var_8 = 1;

    while ( var_8 )
    {
        if ( self bothasscriptgoal() && self botpursuingscriptgoal() )
        {
            if ( distancesquared( self botgetscriptgoal(), self.origin ) < 16 )
                var_8 = 0;
        }

        if ( var_8 )
            wait 0.05;
    }

    var_9 = self.origin;

    if ( isdefined( var_0 ) )
    {
        self._id_1395E = [];

        foreach ( var_11 in var_0 )
        {
            var_12 = 0;

            if ( distance2dsquared( self.origin, var_11.origin ) <= 10 )
                var_12 = 1;

            var_13 = self geteye();
            var_14 = vectordot( ( 0, 0, 1 ), vectornormalize( var_11.origin - var_13 ) );

            if ( abs( var_14 ) > 0.92 )
                var_12 = 1;

            if ( !var_12 )
                self._id_1395E[self._id_1395E.size] = var_11;
        }
    }

    if ( !isdefined( self._id_1395E ) )
        return;

    if ( isdefined( var_4 ) )
        self endon( var_4 );

    if ( isdefined( var_5 ) )
        self endon( var_5 );

    if ( isdefined( var_6 ) )
        self endon( var_6 );

    if ( isdefined( var_7 ) )
        self endon( var_7 );

    thread _id_1395F();
    self._id_1395E = scripts\engine\utility::_id_22A7( self._id_1395E );

    foreach ( var_11 in self._id_1395E )
        var_11._id_1395D[self.entity_number] = 1.0;

    var_18 = gettime();
    var_19 = var_18;
    var_20 = [];
    var_21 = undefined;

    if ( isdefined( var_1 ) )
        var_21 = ( 0, var_1, 0 );

    var_22 = isdefined( var_21 ) && isdefined( var_2 );
    var_23 = undefined;
    var_24 = undefined;

    for (;;)
    {
        var_25 = gettime();
        self notify( "still_watching_nodes" );
        var_26 = self botgetfovdot();

        if ( isdefined( var_3 ) && var_25 >= var_3 )
            return;

        if ( scripts\mp\bots\bots_strategy::_id_2DC5() )
        {
            self botlookatpoint( undefined );
            wait 0.2;
            continue;
        }

        if ( !self bothasscriptgoal() || !self botpursuingscriptgoal() )
        {
            wait 0.2;
            continue;
        }

        if ( isdefined( var_23 ) && var_23._id_1395D[self.entity_number] == 0.0 )
            var_19 = var_25;

        if ( self._id_1395E.size > 0 )
        {
            var_27 = 0;

            if ( isdefined( self._id_010C ) )
            {
                var_28 = self _meth_81DA( self._id_010C );
                var_29 = self _meth_81DB( self._id_010C );

                if ( var_29 && var_25 - var_29 < 5000 )
                {
                    var_30 = vectornormalize( var_28 - self.origin );
                    var_31 = 0;

                    for ( var_32 = 0; var_32 < self._id_1395E.size; var_32++ )
                    {
                        var_33 = vectornormalize( self._id_1395E[var_32].origin - self.origin );
                        var_34 = vectordot( var_30, var_33 );

                        if ( var_34 > var_31 )
                        {
                            var_31 = var_34;
                            var_23 = self._id_1395E[var_32];
                            var_27 = 1;
                        }
                    }
                }
            }

            if ( !var_27 && var_25 >= var_19 )
            {
                var_35 = [];

                for ( var_32 = 0; var_32 < self._id_1395E.size; var_32++ )
                {
                    var_11 = self._id_1395E[var_32];
                    var_36 = var_11 _meth_8149();

                    if ( var_22 && !scripts\engine\utility::within_fov( self.origin, var_21, var_11.origin, var_2 ) )
                        continue;

                    if ( !isdefined( var_20[var_36] ) )
                        var_20[var_36] = 0;

                    if ( scripts\engine\utility::within_fov( self.origin, self.angles, var_11.origin, var_26 ) )
                        var_20[var_36] = var_25;

                    for ( var_37 = 0; var_37 < var_35.size; var_37++ )
                    {
                        if ( var_20[var_35[var_37] _meth_8149()] > var_20[var_36] )
                            break;
                    }

                    var_35 = scripts\engine\utility::_id_229C( var_35, var_11, var_37 );
                }

                var_23 = undefined;

                for ( var_32 = 0; var_32 < var_35.size; var_32++ )
                {
                    if ( randomfloat( 1 ) > var_35[var_32]._id_1395D[self.entity_number] )
                        continue;

                    var_11 = var_35[var_32];
                    var_38 = ( 0, 0, 1 );
                    var_39 = self geteye();
                    var_40 = ( 0, 0, self _meth_8157() );
                    var_24 = var_11.origin + var_40;
                    var_41 = var_24 - var_39;
                    var_41 = vectornormalize( var_41 );
                    var_34 = vectordot( var_41, var_38 );

                    if ( var_34 > 0.939693 )
                        continue;

                    var_23 = var_11;
                    var_19 = var_25 + randomintrange( 3000, 5000 );
                    break;
                }
            }

            if ( isdefined( var_23 ) )
            {
                var_40 = ( 0, 0, self _meth_8157() );
                var_24 = var_23.origin + var_40;
                self botlookatpoint( var_24, 0.4, "script_search" );
            }
        }

        wait 0.2;
    }
}

_id_13960()
{
    self notify( "bot_watch_nodes_stop" );
    self._id_1395E = undefined;
}

_id_1395F()
{
    self notify( "watch_nodes_aborted" );
    self endon( "watch_nodes_aborted" );

    for (;;)
    {
        var_0 = scripts\engine\utility::_id_13736( 0.5, "still_watching_nodes" );

        if ( !isdefined( var_0 ) || var_0 != "still_watching_nodes" )
        {
            _id_13960();
            return;
        }
    }
}

_id_2DFB( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 != ( 0, 0, 0 ) )
    {
        if ( !scripts\engine\utility::within_fov( self.origin, self.angles, var_1, self botgetfovdot() ) )
        {
            var_2 = self botpredictseepoint( var_1 );

            if ( isdefined( var_2 ) )
                self botlookatpoint( var_2 + ( 0, 0, 40 ), 1.0, "script_seek" );
        }

        self botmemoryevent( "known_enemy", undefined, var_1 );
    }
}

bot_get_known_attacker( var_0, var_1 )
{
    if ( isdefined( var_1 ) && isdefined( var_1.classname ) )
    {
        if ( var_1.classname == "grenade" )
        {
            if ( !_id_2D6E( var_1 ) )
                return var_0;
        }
        else if ( var_1.classname == "rocket" )
        {
            if ( isdefined( var_1._id_131D8 ) )
                return var_1._id_131D8;

            if ( isdefined( var_1.type ) && ( var_1.type == "remote" || var_1.type == "odin" ) )
                return var_1;

            if ( isdefined( var_1.owner ) )
                return var_1.owner;
        }
        else if ( var_1.classname == "worldspawn" || var_1.classname == "trigger_hurt" )
            return undefined;

        return var_1;
    }

    return var_0;
}

_id_2D6E( var_0 )
{
    if ( !isdefined( var_0._id_13C2E ) )
        return 0;

    if ( var_0._id_13C2E == "c4_mp" )
        return 1;

    if ( var_0._id_13C2E == "proximity_explosive_mp" )
        return 1;

    return 0;
}

_id_2EC6( var_0, var_1 )
{
    return var_0[0] == var_1[0] && var_0[1] == var_1[1] && var_0[2] == var_1[2];
}

_id_2D06( var_0 )
{
    var_0._id_8EE3 = [];

    if ( var_0._id_2DD1 == "use" )
        _id_2D07( var_0 );
    else if ( var_0._id_2DD1 == "damage" )
        _id_2D05( var_0 );
    else
    {

    }
}

_id_2E64( var_0 )
{
    var_0._id_1D3F = 1;
    level._id_ABE5 = scripts\engine\utility::array_remove( level._id_ABE5, var_0 );
}

_id_2D07( var_0 )
{
    if ( !issubstr( var_0.code_classname, "trigger_use" ) )
        return;

    if ( !isdefined( var_0._id_0334 ) )
        return;

    if ( isdefined( var_0._id_2EA8 ) )
        return;

    if ( !isdefined( var_0._id_13031 ) )
        return;

    var_1 = getnodearray( var_0._id_0334, "targetname" );

    if ( var_1.size != 1 )
        return;

    var_0._id_2EA8 = var_1[0];

    if ( !isdefined( level._id_ABE5 ) )
        level._id_ABE5 = [];

    level._id_ABE5 = scripts\engine\utility::_id_2279( level._id_ABE5, var_0 );
}

_id_2D05( var_0 )
{
    if ( !issubstr( var_0.code_classname, "trigger_damage" ) )
        return;

    var_1 = getnodearray( var_0._id_0334, "targetname" );

    if ( var_1.size != 2 )
        return;

    var_0._id_2EAA = var_1;

    if ( !isdefined( level._id_ABE5 ) )
        level._id_ABE5 = [];

    level._id_ABE5 = scripts\engine\utility::_id_2279( level._id_ABE5, var_0 );
}

_id_2DB4( var_0, var_1 )
{
    var_2 = 0;

    foreach ( var_5, var_4 in var_0 )
    {
        if ( var_2 == var_1 )
            return var_5;

        var_2++;
    }

    return undefined;
}

_id_2DB9( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < level._id_13FBD; var_2++ )
    {
        var_3 = getzonenodeforindex( var_2 );
        var_3._id_13484 = 0;
    }

    var_4 = getzonenodeforindex( var_0 );
    return _id_2DBA( var_4, var_1 );
}

_id_2DBA( var_0, var_1 )
{
    var_2 = [];
    var_2[0] = getnodezone( var_0 );
    var_0._id_13484 = 1;
    var_3 = getlinkednodes( var_0 );

    foreach ( var_5 in var_3 )
    {
        if ( !var_5._id_13484 )
        {
            var_6 = distance( var_0.origin, var_5.origin );

            if ( var_6 < var_1 )
            {
                var_7 = _id_2DBA( var_5, var_1 - var_6 );
                var_2 = scripts\engine\utility::_id_227F( var_7, var_2 );
            }
        }
    }

    return var_2;
}

_id_2D44( var_0 )
{
    return isdefined( var_0 ) && isdefined( var_0._id_441B ) && var_0._id_441B;
}

_id_2DB5()
{
    return int( bot_get_client_limit() / 2 );
}

bot_get_client_limit()
{
    var_0 = getdvarint( "party_maxplayers", 0 );
    var_0 = max( var_0, getdvarint( "party_maxPrivatePartyPlayers", 0 ) );

    if ( var_0 > level._id_B488 )
        return level._id_B488;

    return var_0;
}

_id_2E59()
{
    self notify( "bot_queued_process_level_thread" );
    self endon( "bot_queued_process_level_thread" );
    wait 0.05;

    for (;;)
    {
        if ( isdefined( level._id_2E5B ) && level._id_2E5B.size > 0 )
        {
            var_0 = level._id_2E5B[0];

            if ( isdefined( var_0 ) && isdefined( var_0.owner ) )
            {
                var_1 = undefined;

                if ( isdefined( var_0._id_C8FC ) )
                    var_1 = var_0.owner [[ var_0._id_74C2 ]]( var_0._id_C8F9, var_0._id_C8FA, var_0._id_C8FB, var_0._id_C8FC );
                else if ( isdefined( var_0._id_C8FB ) )
                    var_1 = var_0.owner [[ var_0._id_74C2 ]]( var_0._id_C8F9, var_0._id_C8FA, var_0._id_C8FB );
                else if ( isdefined( var_0._id_C8FA ) )
                    var_1 = var_0.owner [[ var_0._id_74C2 ]]( var_0._id_C8F9, var_0._id_C8FA );
                else if ( isdefined( var_0._id_C8F9 ) )
                    var_1 = var_0.owner [[ var_0._id_74C2 ]]( var_0._id_C8F9 );
                else
                    var_1 = var_0.owner [[ var_0._id_74C2 ]]();

                var_0.owner notify( var_0._id_BE47, var_1 );
            }

            var_2 = [];

            for ( var_3 = 1; var_3 < level._id_2E5B.size; var_3++ )
                var_2[var_3 - 1] = level._id_2E5B[var_3];

            level._id_2E5B = var_2;
        }

        wait 0.05;
    }
}

_id_2E58( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( level._id_2E5B ) )
        level._id_2E5B = [];

    foreach ( var_8, var_7 in level._id_2E5B )
    {
        if ( var_7.owner == self && var_7.name == var_0 )
        {
            self notify( var_7.name );
            level._id_2E5B[var_8] = undefined;
        }
    }

    var_7 = spawnstruct();
    var_7.owner = self;
    var_7.name = var_0;
    var_7._id_BE47 = var_7.name + "_done";
    var_7._id_74C2 = var_1;
    var_7._id_C8F9 = var_2;
    var_7._id_C8FA = var_3;
    var_7._id_C8FB = var_4;
    var_7._id_C8FC = var_5;
    level._id_2E5B[level._id_2E5B.size] = var_7;

    if ( !isdefined( level._id_2E5A ) )
    {
        level._id_2E5A = 1;
        level thread _id_2E59();
    }

    self waittill( var_7._id_BE47, var_9 );
    return var_9;
}

bot_is_remote_or_linked()
{
    return scripts\mp\utility\game::isusingremote() || self _meth_81AB();
}

_id_2DB0( var_0 )
{
    var_1 = undefined;

    if ( isdefined( self._id_13CA0 ) && self._id_13CA0.size > 0 )
        var_1 = self._id_13CA0;
    else
        var_1 = self getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        var_4 = weaponclipsize( var_3 );
        var_5 = self getweaponammostock( var_3 );

        if ( var_5 <= var_4 )
            return 1;

        if ( self _meth_8127( var_3 ) <= var_0 )
            return 1;
    }

    return 0;
}

_id_2E4E( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 256;

    if ( !isdefined( var_2 ) )
        var_2 = 50;

    var_3 = getnodesinradiussorted( var_0, var_1, 0, var_2, "Path" );

    foreach ( var_5 in var_3 )
    {
        var_6 = var_0 + ( 0, 0, 30 );
        var_7 = var_5.origin + ( 0, 0, 30 );
        var_8 = _func_16D( var_6, var_7 );

        if ( _id_2EC6( var_8, var_7 ) )
            return 1;

        wait 0.05;
    }

    return 0;
}

_id_2E21( var_0 )
{
    level endon( "game_ended" );
    self notify( "bot_monitor_enemy_camp_spots" );
    self endon( "bot_monitor_enemy_camp_spots" );
    level._id_63E5 = [];
    level._id_63E4 = [];
    level._id_63E3 = [];

    for (;;)
    {
        wait 1.0;
        var_1 = [];

        if ( !isdefined( var_0 ) )
            continue;

        foreach ( var_3 in level._id_C928 )
        {
            if ( !isdefined( var_3.team ) )
                continue;

            if ( var_3 [[ var_0 ]]() && !isdefined( var_1[var_3.team] ) )
            {
                level._id_63E3[var_3.team] = undefined;
                level._id_63E5[var_3.team] = var_3 botpredictenemycampspots( 1 );

                if ( isdefined( level._id_63E5[var_3.team] ) )
                {
                    if ( !isdefined( level._id_63E4[var_3.team] ) || !scripts\engine\utility::array_contains( level._id_63E5[var_3.team], level._id_63E4[var_3.team] ) )
                        level._id_63E4[var_3.team] = scripts\engine\utility::_id_DC6B( level._id_63E5[var_3.team] );

                    if ( isdefined( level._id_63E4[var_3.team] ) )
                    {
                        var_4 = [];

                        foreach ( var_6 in level._id_C928 )
                        {
                            if ( !isdefined( var_6.team ) )
                                continue;

                            if ( var_6 [[ var_0 ]]() && var_6.team == var_3.team )
                                var_4[var_4.size] = var_6;
                        }

                        var_4 = sortbydistance( var_4, level._id_63E4[var_3.team] );

                        if ( var_4.size > 0 )
                            level._id_63E3[var_3.team] = var_4[0];
                    }
                }

                var_1[var_3.team] = 1;
            }
        }
    }
}

_id_2EBF()
{
    if ( !isdefined( self ) )
        return 0;

    if ( !isai( self ) )
        return 0;

    if ( !isdefined( self.team ) )
        return 0;

    if ( self.team == "spectator" )
        return 0;

    if ( !isalive( self ) )
        return 0;

    if ( !scripts\mp\utility\game::_id_9D36( self ) )
        return 0;

    if ( self.personality == "camper" )
        return 0;

    return 1;
}

_id_2EBD()
{
    if ( !isdefined( level._id_63E3 ) )
        return;

    if ( !isdefined( level._id_63E3[self.team] ) )
        return;

    if ( level._id_63E3[self.team] == self )
    {
        scripts\mp\bots\bots_strategy::_id_2D4E();
        self botsetscriptgoal( level._id_63E4[self.team], 128, "objective", undefined, 256 );
        _id_2ECB();
    }
}

_id_2D9C( var_0, var_1 )
{
    self notify( "bot_force_stance_for_time" );
    self endon( "bot_force_stance_for_time" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self botsetstance( var_0 );
    wait( var_1 );
    self botsetstance( "none" );
}

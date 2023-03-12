// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main()
{
    setup_callbacks();
    _id_F8DB();
    level thread scripts\mp\bots\bots_util::_id_2E21( scripts\mp\bots\bots_util::_id_2EBF );
}

setup_callbacks()
{
    level.bot_funcs["crate_can_use"] = ::_id_4830;
    level.bot_funcs["gametype_think"] = ::_id_2D64;
    level.bot_funcs["should_start_cautious_approach"] = ::_id_FF9B;
    level.bot_funcs["leader_dialog"] = ::_id_2D62;
    level.bot_funcs["get_watch_node_chance"] = ::_id_2D61;
    level.bot_funcs["commander_gametype_tactics"] = ::_id_2D5E;
}

_id_2DD3( var_0 )
{
    var_1 = 90000;

    if ( scripts\mp\bots\bots_util::_id_2DD7() && distance2dsquared( var_0, self._id_2D52 ) < var_1 )
        return 1;

    if ( self bothasscriptgoal() )
    {
        var_2 = self botgetscriptgoal();

        if ( distance2dsquared( var_0, var_2 ) < var_1 )
            return 1;
    }

    return 0;
}

_id_4832( var_0 )
{
    if ( isagent( self ) )
    {
        if ( !isdefined( level._id_10356 ) || self.owner != level._id_10356 )
            return _id_4830();

        if ( !isdefined( var_0.boxtype ) && scripts\mp\bots\bots_util::_id_2D44( var_0 ) )
            return _id_2DD3( var_0.origin );

        return 0;
    }

    return _id_4830( var_0 );
}

_id_4830( var_0 )
{
    if ( isagent( self ) && !isdefined( var_0.boxtype ) )
        return 0;

    if ( isdefined( var_0._id_485F ) && !scripts\mp\bots\bots_killstreaks::_id_2DDB( var_0._id_485F ) )
        return 0;

    if ( !scripts\mp\utility\game::_id_9F9D( self ) )
        return 1;

    return scripts\mp\bots\bots_util::_id_2DDD();
}

_id_2D5E( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "tactic_none":
            level._id_2D63[self.team] = [];
            var_1 = 1;
            break;
        case "tactic_dom_holdA":
            level._id_2D63[self.team] = [];
            level._id_2D63[self.team][0] = _id_7C92( "A" );
            var_1 = 1;
            break;
        case "tactic_dom_holdB":
            level._id_2D63[self.team] = [];
            level._id_2D63[self.team][0] = _id_7C92( "B" );
            var_1 = 1;
            break;
        case "tactic_dom_holdC":
            level._id_2D63[self.team] = [];
            level._id_2D63[self.team][0] = _id_7C92( "C" );
            var_1 = 1;
            break;
        case "tactic_dom_holdAB":
            level._id_2D63[self.team] = [];
            level._id_2D63[self.team][0] = _id_7C92( "A" );
            level._id_2D63[self.team][1] = _id_7C92( "B" );
            var_1 = 1;
            break;
        case "tactic_dom_holdBC":
            level._id_2D63[self.team] = [];
            level._id_2D63[self.team][0] = _id_7C92( "B" );
            level._id_2D63[self.team][1] = _id_7C92( "C" );
            var_1 = 1;
            break;
        case "tactic_dom_holdAC":
            level._id_2D63[self.team] = [];
            level._id_2D63[self.team][0] = _id_7C92( "A" );
            level._id_2D63[self.team][1] = _id_7C92( "C" );
            var_1 = 1;
            break;
        case "tactic_dom_holdABC":
            level._id_2D63[self.team] = [];
            level._id_2D63[self.team][0] = _id_7C92( "A" );
            level._id_2D63[self.team][1] = _id_7C92( "B" );
            level._id_2D63[self.team][2] = _id_7C92( "C" );
            var_1 = 1;
            break;
    }

    if ( var_1 )
    {
        foreach ( var_3 in level._id_C928 )
        {
            if ( !isdefined( var_3.team ) )
                continue;

            if ( scripts\mp\utility\game::_id_9D36( var_3 ) && var_3.team == self.team )
                var_3._id_727F = 1;
        }
    }
}

_id_B9B0()
{
    self notify( "monitor_zone_control" );
    self endon( "monitor_zone_control" );
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        wait 1;
        var_0 = self._id_130AC scripts\mp\gameobjects::_id_803E();

        if ( var_0 != "neutral" )
        {
            var_1 = getzonenearest( self.origin );

            if ( isdefined( var_1 ) )
                botzonesetteam( var_1, var_0 );
        }
    }
}

_id_B970()
{
    self notify( "monitor_flag_ownership" );
    self endon( "monitor_flag_ownership" );
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = self._id_130AC scripts\mp\gameobjects::_id_803E();

    for (;;)
    {
        var_1 = self._id_130AC scripts\mp\gameobjects::_id_803E();

        if ( var_1 != var_0 )
            level notify( "flag_changed_ownership" );

        var_0 = var_1;
        wait 0.05;
    }
}

_id_F8DB()
{
    var_0 = _id_2DA2();

    if ( var_0.size > 3 )
    {
        while ( !isdefined( level._id_1161F ) )
            wait 0.05;

        var_1 = [];

        foreach ( var_3 in var_0 )
        {
            if ( !isdefined( var_1[var_3._id_11651] ) )
                var_1[var_3._id_11651] = [];

            var_1[var_3._id_11651] = scripts\engine\utility::_id_2279( var_1[var_3._id_11651], var_3 );
        }

        foreach ( var_7, var_6 in var_1 )
        {
            level._id_6652 = 0;
            _id_2D1B( var_6 );
            scripts\mp\bots\bots_util::_id_2D1A( var_6, var_7 + "_flag" );
        }
    }
    else
    {
        scripts\mp\bots\bots_util::_id_2D1A( var_0, "flag" );
        _id_2D1B( var_0 );
    }

    foreach ( var_3 in var_0 )
    {
        var_3 thread _id_B9B0();
        var_3 thread _id_B970();

        if ( var_3._id_EDF9 != "_a" && var_3._id_EDF9 != "_b" && var_3._id_EDF9 != "_c" )
        {

        }

        var_3._id_C053 = getnodesintrigger( var_3 );
        _id_1711( var_3 );
    }

    level._id_2D63 = [];
    level._id_2D63["axis"] = [];
    level._id_2D63["allies"] = [];
    level._id_2DA1 = 1;
}

_id_2DA2()
{
    if ( isdefined( level._id_1BEA ) )
        return level._id_1BEA;
    else
        return level._id_0134;
}

_id_2D1B( var_0 )
{
    if ( !isdefined( level._id_6E32 ) )
        level._id_6E32 = [];

    for ( var_1 = 0; var_1 < var_0.size - 1; var_1++ )
    {
        for ( var_2 = var_1 + 1; var_2 < var_0.size; var_2++ )
        {
            var_3 = distance( var_0[var_1].origin, var_0[var_2].origin );
            var_4 = _id_79BB( var_0[var_1] );
            var_5 = _id_79BB( var_0[var_2] );
            level._id_6E32[var_4][var_5] = var_3;
            level._id_6E32[var_5][var_4] = var_3;
        }
    }
}

_id_1711( var_0 )
{
    if ( var_0.classname == "trigger_radius" )
    {
        var_1 = getnodesinradius( var_0.origin, var_0.radius, 0, 100 );
        var_2 = scripts\engine\utility::_id_22AC( var_1, var_0._id_C053 );

        if ( var_2.size > 0 )
        {
            var_0._id_C053 = scripts\engine\utility::_id_227F( var_0._id_C053, var_2 );
            return;
        }
    }
    else if ( var_0.classname == "trigger_multiple" )
    {
        var_3[0] = var_0 getpointinbounds( 1, 1, 1 );
        var_3[1] = var_0 getpointinbounds( 1, 1, -1 );
        var_3[2] = var_0 getpointinbounds( 1, -1, 1 );
        var_3[3] = var_0 getpointinbounds( 1, -1, -1 );
        var_3[4] = var_0 getpointinbounds( -1, 1, 1 );
        var_3[5] = var_0 getpointinbounds( -1, 1, -1 );
        var_3[6] = var_0 getpointinbounds( -1, -1, 1 );
        var_3[7] = var_0 getpointinbounds( -1, -1, -1 );
        var_4 = 0;

        foreach ( var_6 in var_3 )
        {
            var_7 = distance( var_6, var_0.origin );

            if ( var_7 > var_4 )
                var_4 = var_7;
        }

        var_1 = getnodesinradius( var_0.origin, var_4, 0, 100 );

        foreach ( var_10 in var_1 )
        {
            if ( !ispointinvolume( var_10.origin, var_0 ) )
            {
                if ( ispointinvolume( var_10.origin + ( 0, 0, 40 ), var_0 ) || ispointinvolume( var_10.origin + ( 0, 0, 80 ), var_0 ) || ispointinvolume( var_10.origin + ( 0, 0, 120 ), var_0 ) )
                    var_0._id_C053 = scripts\engine\utility::_id_2279( var_0._id_C053, var_10 );
            }
        }
    }
}

_id_FF9B( var_0 )
{
    if ( var_0 )
    {
        if ( self._id_4B75._id_130AC scripts\mp\gameobjects::_id_803E() == "neutral" && _id_6E38( self._id_4B75 ) )
        {
            var_1 = _id_78B7( self._id_A9F4.origin );

            if ( var_1 == self._id_4B75 )
                return 0;
            else
            {
                var_2 = _id_7B51( var_1, self._id_4B75 );
                var_3 = distancesquared( var_1.origin, self._id_4B75.origin );
                var_4 = distancesquared( var_2.origin, self._id_4B75.origin );

                if ( var_3 < var_4 )
                    return 0;
            }
        }
    }

    return scripts\mp\bots\bots_strategy::_id_FF9A( var_0 );
}

_id_2D5F()
{
    return 0;
}

_id_2D60()
{
    return 0;
}

_id_2D64()
{
    self notify( "bot_dom_think" );
    self endon( "bot_dom_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    while ( !isdefined( level._id_2DA1 ) )
        wait 0.05;

    self._id_727F = 0;
    self._id_BF08 = 0;
    self._id_BF60 = 0;
    self botsetflag( "separation", 0 );
    self botsetflag( "grenade_objectives", 1 );
    self botsetflag( "use_obj_path_style", 1 );

    for (;;)
    {
        scripts\mp\bots\bots_util::_id_2EBD();
        var_0 = gettime();

        if ( var_0 > self._id_BF60 )
        {
            self._id_BF60 = gettime() + 10000;
            self._id_110DC = self botgetdifficultysetting( "strategyLevel" );
        }

        if ( var_0 > self._id_BF08 || self._id_727F )
        {
            if ( _id_FF25() )
                self._id_BF08 = var_0 + 5000;
            else
            {
                self._id_727F = 0;
                _id_2D31();
                self._id_BF08 = var_0 + randomintrange( 30000, 45000 );
            }
        }

        scripts\engine\utility::_id_137B7( "needs_new_flag_goal", 1.0 );
    }
}

_id_FF25()
{
    if ( self._id_727F )
        return 0;

    if ( !scripts\mp\bots\bots_util::_id_2DD5() )
        return 0;

    if ( self._id_4B75._id_130AC scripts\mp\gameobjects::_id_803E() == self.team )
        return 0;

    var_0 = _id_79BA();

    if ( distancesquared( self.origin, self._id_4B75.origin ) < var_0 * 2 * ( var_0 * 2 ) )
    {
        var_1 = _id_780B( self.team );

        if ( var_1.size == 2 && !scripts\engine\utility::array_contains( var_1, self._id_4B75 ) && !_id_2D09() )
            return 0;

        return 1;
    }

    return 0;
}

_id_7B5E()
{
    return level._id_2D63[self.team];
}

_id_8B98()
{
    var_0 = _id_7B5E();
    return var_0.size > 0;
}

_id_6E37( var_0 )
{
    return !_id_6E38( var_0 );
}

_id_6E38( var_0 )
{
    return var_0._id_130AC._id_6DE3;
}

_id_2D31()
{
    var_0 = undefined;
    var_1 = [];
    var_2 = [];
    var_3 = 1;
    var_4 = _id_7B5E();

    if ( var_4.size > 0 )
        var_5 = var_4;
    else
        var_5 = level._id_0134;

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_7 = var_5[var_6]._id_130AC scripts\mp\gameobjects::_id_803E();

        if ( var_3 )
        {
            if ( _id_6E37( var_5[var_6] ) )
                var_3 = 0;
            else
            {

            }
        }

        if ( var_7 != self.team )
        {
            var_1[var_1.size] = var_5[var_6];
            continue;
        }

        var_2[var_2.size] = var_5[var_6];
    }

    var_8 = undefined;

    if ( var_1.size == 3 )
        var_8 = 1;
    else if ( var_1.size == 2 )
    {
        if ( var_2.size == 1 )
        {
            if ( !_id_2E8D( var_2[0], 1 ) )
                var_8 = 1;
            else
                var_8 = !_id_2E8C( 0.34 );
        }
        else if ( var_2.size == 0 )
            var_8 = 1;
    }
    else if ( var_1.size == 1 )
    {
        if ( var_2.size == 2 )
        {
            if ( _id_2D09() )
            {
                if ( !_id_2E8D( var_2[0], 2 ) && !_id_2E8D( var_2[1], 2 ) )
                    var_8 = 1;
                else if ( self._id_110DC == 0 )
                    var_8 = !_id_2E8C( 0.34 );
                else
                    var_8 = !_id_2E8C( 0.5 );
            }
            else
                var_8 = 0;
        }
        else if ( var_2.size == 1 )
        {
            if ( !_id_2E8D( var_2[0], 1 ) )
                var_8 = 1;
            else
                var_8 = !_id_2E8C( 0.34 );
        }
        else if ( var_2.size == 0 )
            var_8 = 1;
    }
    else if ( var_1.size == 0 )
        var_8 = 0;

    if ( var_8 )
    {
        if ( var_1.size > 1 )
            var_9 = scripts\engine\utility::_id_782F( self.origin, var_1 );
        else
            var_9 = var_1;

        if ( var_3 && !_id_8B98() )
        {
            var_10 = _id_7B2D( var_9[0], 1 );

            if ( var_10 < 2 )
                var_11 = 0;
            else
            {
                var_12 = 20;
                var_13 = 65;
                var_14 = 15;

                if ( self._id_110DC == 0 )
                {
                    var_12 = 50;
                    var_13 = 25;
                    var_14 = 25;
                }

                var_15 = randomint( 100 );

                if ( var_15 < var_12 )
                    var_11 = 0;
                else if ( var_15 < var_12 + var_13 )
                    var_11 = 1;
                else
                    var_11 = 2;
            }

            var_16 = undefined;

            if ( var_11 == 0 )
                var_16 = "critical";

            _id_3A37( var_9[var_11], var_16 );
            return;
        }

        if ( var_9.size == 1 )
            var_0 = var_9[0];
        else if ( distancesquared( var_9[0].origin, self.origin ) < 102400 )
            var_0 = var_9[0];
        else
        {
            var_17 = [];
            var_18 = [];

            for ( var_6 = 0; var_6 < var_9.size; var_6++ )
            {
                var_19 = distance( var_9[var_6].origin, self.origin );
                var_18[var_6] = var_19;
                var_17[var_6] = var_19;
            }

            if ( var_2.size == 1 )
            {
                var_20 = 1.5;

                for ( var_6 = 0; var_6 < var_17.size; var_6++ )
                    var_17[var_6] += level._id_6E32[_id_79BB( var_9[var_6] )][_id_79BB( var_2[0] )] * var_20;
            }

            if ( self._id_110DC == 0 )
            {
                var_15 = randomint( 100 );

                if ( var_15 < 50 )
                    var_0 = var_9[0];
                else if ( var_15 < 50 + 50 / ( var_9.size - 1 ) )
                    var_0 = var_9[1];
                else
                    var_0 = var_9[2];
            }
            else if ( var_17.size == 2 )
            {
                var_21[0] = 50;
                var_21[1] = 50;

                for ( var_6 = 0; var_6 < var_9.size; var_6++ )
                {
                    if ( var_17[var_6] < var_17[1 - var_6] )
                    {
                        var_21[var_6] += 20;
                        var_21[1 - var_6] = var_21[1 - var_6] - 20;
                    }

                    if ( var_18[var_6] < 640 )
                    {
                        var_21[var_6] += 15;
                        var_21[1 - var_6] = var_21[1 - var_6] - 15;
                    }

                    if ( var_9[var_6]._id_130AC scripts\mp\gameobjects::_id_803E() == "neutral" )
                    {
                        var_21[var_6] += 15;
                        var_21[1 - var_6] = var_21[1 - var_6] - 15;
                    }
                }

                var_15 = randomint( 100 );

                if ( var_15 < var_21[0] )
                    var_0 = var_9[0];
                else
                    var_0 = var_9[1];
            }
            else if ( var_17.size == 3 )
            {
                var_21[0] = 34;
                var_21[1] = 33;
                var_21[2] = 33;

                for ( var_6 = 0; var_6 < var_9.size; var_6++ )
                {
                    var_22 = ( var_6 + 1 ) % 3;
                    var_23 = ( var_6 + 2 ) % 3;

                    if ( var_17[var_6] < var_17[var_22] && var_17[var_6] < var_17[var_23] )
                    {
                        var_21[var_6] += 36;
                        var_21[var_22] -= 18;
                        var_21[var_23] -= 18;
                    }

                    if ( var_18[var_6] < 640 )
                    {
                        var_21[var_6] += 15;
                        var_21[var_22] -= 7;
                        var_21[var_23] -= 8;
                    }

                    if ( var_9[var_6]._id_130AC scripts\mp\gameobjects::_id_803E() == "neutral" )
                    {
                        var_21[var_6] += 15;
                        var_21[var_22] -= 7;
                        var_21[var_23] -= 8;
                    }
                }

                var_15 = randomint( 100 );

                if ( var_15 < var_21[0] )
                    var_0 = var_9[0];
                else if ( var_15 < var_21[0] + var_21[1] )
                    var_0 = var_9[1];
                else
                    var_0 = var_9[2];
            }
        }
    }
    else
    {
        if ( var_2.size > 1 )
            var_24 = scripts\engine\utility::_id_782F( self.origin, var_2 );
        else
            var_24 = var_2;

        foreach ( var_26 in var_24 )
        {
            if ( _id_2E8D( var_26, var_2.size ) )
            {
                var_0 = var_26;
                break;
            }
        }

        if ( !isdefined( var_0 ) )
        {
            if ( self._id_110DC == 0 )
                var_0 = var_2[0];
            else if ( var_24.size == 2 )
            {
                var_28 = _id_7B51( var_24[0], var_24[1] );
                var_29 = scripts\engine\utility::_id_782F( var_28.origin, var_24 );
                var_15 = randomint( 100 );

                if ( var_15 < 70 )
                    var_0 = var_29[0];
                else
                    var_0 = var_29[1];
            }
            else
                var_0 = var_24[0];
        }
    }

    if ( var_8 )
        _id_3A37( var_0 );
    else
        _id_5062( var_0 );
}

_id_2D09()
{
    if ( self._id_110DC == 0 )
        return 1;

    var_0 = _id_7B5E();

    if ( var_0.size == 3 )
        return 1;

    var_1 = scripts\mp\gamescore::_id_12B6( scripts\engine\utility::_id_7984( self.team ) );
    var_2 = scripts\mp\gamescore::_id_12B6( self.team );
    var_3 = 200 - var_1;
    var_4 = 200 - var_2;
    var_5 = var_4 * 0.5 > var_3;
    return var_5;
}

_id_2E8C( var_0 )
{
    if ( randomfloat( 1 ) < var_0 )
        return 1;

    var_1 = level._id_2E46[self.personality];

    if ( var_1 == "stationary" )
        return 1;
    else if ( var_1 == "active" )
        return 0;
}

_id_3A37( var_0, var_1, var_2 )
{
    self._id_4B75 = var_0;

    if ( _id_2D60() )
    {
        var_3["override_goal_type"] = var_1;
        var_3["entrance_points_index"] = _id_79BB( var_0 );
        scripts\mp\bots\bots_strategy::_id_2E57( var_0.origin, _id_79BC(), var_3 );
    }
    else
    {
        var_3["override_goal_type"] = var_1;
        var_3["entrance_points_index"] = _id_79BB( var_0 );
        scripts\mp\bots\bots_strategy::_id_2D2C( var_0.origin, var_0._id_C053, var_0, var_3 );
    }

    if ( !isdefined( var_2 ) || !var_2 )
        thread _id_B971( var_0 );
}

_id_5062( var_0 )
{
    self._id_4B75 = var_0;

    if ( _id_2D5F() )
    {
        var_1["entrance_points_index"] = _id_79BB( var_0 );
        scripts\mp\bots\bots_strategy::_id_2D2C( var_0.origin, var_0._id_C053, var_0, var_1 );
    }
    else
    {
        var_1["entrance_points_index"] = _id_79BB( var_0 );
        var_1["nearest_node"] = var_0._id_BE7C;
        scripts\mp\bots\bots_strategy::_id_2E57( var_0.origin, _id_79BC(), var_1 );
    }

    thread _id_B971( var_0 );
}

_id_79BA()
{
    if ( !isdefined( level._id_3A38 ) )
        level._id_3A38 = 158;

    return level._id_3A38;
}

_id_79BC()
{
    if ( !isdefined( level._id_DAA3 ) )
    {
        var_0 = self botgetworldsize();
        var_1 = ( var_0[0] + var_0[1] ) / 2;
        level._id_DAA3 = min( 1000, var_1 / 3.5 );
    }

    return level._id_DAA3;
}

_id_2D62( var_0, var_1 )
{
    if ( issubstr( var_0, "losing" ) )
    {
        var_2 = getsubstr( var_0, var_0.size - 2 );
        var_3 = undefined;

        for ( var_4 = 0; var_4 < level._id_0134.size; var_4++ )
        {
            if ( var_2 == level._id_0134[var_4]._id_EDF9 )
                var_3 = level._id_0134[var_4];
        }

        if ( isdefined( var_3 ) && bot_ambush_end( var_3 ) )
        {
            self botmemoryevent( "known_enemy", undefined, var_3.origin );

            if ( !isdefined( self._id_A8E1 ) || gettime() - self._id_A8E1 > 10000 )
            {
                if ( scripts\mp\bots\bots_util::_id_2DDD() )
                {
                    if ( distancesquared( self.origin, var_3.origin ) < 490000 )
                    {
                        _id_3A37( var_3 );
                        self._id_A8E1 = gettime();
                    }
                }
            }
        }
    }

    scripts\mp\bots\bots_util::_id_2DFB( var_0, var_1 );
}

bot_ambush_end( var_0 )
{
    var_1 = _id_7B5E();

    if ( var_1.size == 0 )
        return 1;

    if ( scripts\engine\utility::array_contains( var_1, var_0 ) )
        return 1;

    return 0;
}

_id_B971( var_0 )
{
    self notify( "monitor_flag_status" );
    self endon( "monitor_flag_status" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_1 = _id_7B2F( self.team );
    var_2 = _id_79BA() * _id_79BA();
    var_3 = _id_79BA() * 3 * ( _id_79BA() * 3 );
    var_4 = 1;

    while ( var_4 )
    {
        var_5 = 0;
        var_6 = var_0._id_130AC scripts\mp\gameobjects::_id_803E();
        var_7 = _id_7B2F( self.team );
        var_8 = _id_797C( self.team );

        if ( scripts\mp\bots\bots_util::_id_2DD5() )
        {
            if ( var_6 == self.team && var_0._id_130AC._id_3FF9 == "none" )
            {
                if ( !_id_2D5F() )
                    var_5 = 1;
            }

            if ( var_7 == 2 && var_6 != self.team && !_id_2D09() )
            {
                if ( distancesquared( self.origin, var_0.origin ) > var_2 )
                    var_5 = 1;
            }

            foreach ( var_10 in var_8 )
            {
                if ( var_10 != var_0 && bot_ambush_end( var_10 ) )
                {
                    if ( distancesquared( self.origin, var_10.origin ) < var_3 )
                        var_5 = 1;
                }
            }

            if ( self istouching( var_0 ) && var_0._id_130AC._id_130C7 <= 0 )
            {
                if ( self bothasscriptgoal() )
                {
                    var_12 = self botgetscriptgoal();
                    var_13 = self botgetscriptgoalradius();

                    if ( distancesquared( self.origin, var_12 ) < squared( var_13 ) )
                    {
                        var_14 = self getnearestnode();

                        if ( isdefined( var_14 ) )
                        {
                            var_15 = undefined;

                            foreach ( var_17 in var_0._id_C053 )
                            {
                                if ( !nodesvisible( var_17, var_14 ) )
                                {
                                    var_15 = var_17.origin;
                                    break;
                                }
                            }

                            if ( isdefined( var_15 ) )
                            {
                                self._id_5090 = var_15;
                                self notify( "defend_force_node_recalculation" );
                            }
                        }
                    }
                }
            }
        }

        if ( scripts\mp\bots\bots_util::_id_2DDD() )
        {
            if ( var_6 != self.team )
            {
                if ( !_id_2D60() )
                    var_5 = 1;
            }
            else if ( var_7 == 1 && var_1 > 1 )
                var_5 = 1;
        }

        var_1 = var_7;

        if ( var_5 )
        {
            self._id_727F = 1;
            var_4 = 0;
            self notify( "needs_new_flag_goal" );
            continue;
        }

        var_19 = level scripts\engine\utility::_id_137B9( "flag_changed_ownership", 1 + randomfloatrange( 0, 2 ) );

        if ( !( isdefined( var_19 ) && var_19 == "timeout" ) )
        {
            var_20 = randomfloatrange( 0.5, 1.0 );
            wait( var_20 );
        }
    }
}

_id_2D61( var_0 )
{
    if ( var_0 == self._id_C031 )
        return 1.0;

    if ( !isdefined( self._id_4B75 ) )
        return 1.0;

    var_1 = 0;
    var_2 = _id_79BB( self._id_4B75 );
    var_3 = _id_780B( self.team );

    foreach ( var_5 in var_3 )
    {
        if ( var_5 != self._id_4B75 )
        {
            var_1 = var_0 scripts\mp\bots\bots_util::_id_C037( var_2, _id_79BB( var_5 ) );

            if ( var_1 )
            {
                var_6 = _id_7B51( self._id_4B75, var_5 );
                var_7 = var_6._id_130AC scripts\mp\gameobjects::_id_803E();

                if ( var_7 != self.team )
                {
                    if ( var_0 scripts\mp\bots\bots_util::_id_C037( var_2, _id_79BB( var_6 ) ) )
                        var_1 = 0;
                }
            }
        }
    }

    if ( var_1 )
        return 0.2;

    return 1.0;
}

_id_79BB( var_0 )
{
    var_1 = "";

    if ( isdefined( var_0._id_11651 ) )
        var_1 += ( var_0._id_11651 + "_" );

    var_1 += ( "flag" + var_0._id_EDF9 );
    return var_1;
}

_id_7B51( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < level._id_0134.size; var_2++ )
    {
        if ( level._id_0134[var_2] != var_0 && level._id_0134[var_2] != var_1 )
            return level._id_0134[var_2];
    }
}

_id_7C92( var_0 )
{
    var_0 = "_" + tolower( var_0 );

    for ( var_1 = 0; var_1 < level._id_0134.size; var_1++ )
    {
        if ( level._id_0134[var_1]._id_EDF9 == var_0 )
            return level._id_0134[var_1];
    }
}

_id_78B7( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;

    foreach ( var_4 in level._id_0134 )
    {
        var_5 = distancesquared( var_4.origin, var_0 );

        if ( !isdefined( var_2 ) || var_5 < var_2 )
        {
            var_1 = var_4;
            var_2 = var_5;
        }
    }

    return var_1;
}

_id_7B2D( var_0, var_1 )
{
    var_2 = 0;
    var_3 = _id_79BA();

    foreach ( var_5 in level._id_C928 )
    {
        if ( !isdefined( var_5.team ) )
            continue;

        if ( var_5.team == self.team && var_5 != self && scripts\mp\utility\game::_id_9F9D( var_5 ) )
        {
            if ( isai( var_5 ) )
            {
                if ( var_5 _id_2DD6( var_0 ) )
                    var_2++;

                continue;
            }

            if ( !isdefined( var_1 ) || !var_1 )
            {
                if ( var_5 istouching( var_0 ) )
                    var_2++;
            }
        }
    }

    return var_2;
}

_id_2DD6( var_0 )
{
    if ( !scripts\mp\bots\bots_util::_id_2DD5() )
        return 0;

    return _id_2EA9( var_0 );
}

_id_2DDE( var_0 )
{
    if ( !scripts\mp\bots\bots_util::_id_2DDD() )
        return 0;

    return _id_2EA9( var_0 );
}

_id_2EA9( var_0 )
{
    return isdefined( self._id_4B75 ) && self._id_4B75 == var_0;
}

_id_7B2F( var_0 )
{
    var_1 = 0;

    for ( var_2 = 0; var_2 < level._id_0134.size; var_2++ )
    {
        var_3 = level._id_0134[var_2]._id_130AC scripts\mp\gameobjects::_id_803E();

        if ( var_3 == var_0 )
            var_1++;
    }

    return var_1;
}

_id_797C( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level._id_0134.size; var_2++ )
    {
        var_3 = level._id_0134[var_2]._id_130AC scripts\mp\gameobjects::_id_803E();

        if ( var_3 == scripts\engine\utility::_id_7984( var_0 ) )
            var_1 = scripts\engine\utility::_id_2279( var_1, level._id_0134[var_2] );
    }

    return var_1;
}

_id_780B( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level._id_0134.size; var_2++ )
    {
        var_3 = level._id_0134[var_2]._id_130AC scripts\mp\gameobjects::_id_803E();

        if ( var_3 == var_0 )
            var_1 = scripts\engine\utility::_id_2279( var_1, level._id_0134[var_2] );
    }

    return var_1;
}

_id_2E8D( var_0, var_1 )
{
    if ( var_1 == 1 )
        var_2 = 1;
    else
        var_2 = 2;

    var_3 = _id_7879( var_0 );
    return var_3.size < var_2;
}

_id_7879( var_0 )
{
    var_1 = _id_79BC();
    var_2 = [];

    foreach ( var_4 in level._id_C928 )
    {
        if ( !isdefined( var_4.team ) )
            continue;

        if ( var_4.team == self.team && var_4 != self && scripts\mp\utility\game::_id_9F9D( var_4 ) )
        {
            if ( isai( var_4 ) )
            {
                if ( var_4 _id_2DDE( var_0 ) )
                    var_2 = scripts\engine\utility::_id_2279( var_2, var_4 );

                continue;
            }

            if ( distancesquared( var_0.origin, var_4.origin ) < var_1 * var_1 )
                var_2 = scripts\engine\utility::_id_2279( var_2, var_4 );
        }
    }

    return var_2;
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main()
{
    setup_callbacks();
    _id_F8D8();
}

setup_callbacks()
{
    level.bot_funcs["gametype_think"] = ::_id_2D39;
}

_id_F8D8()
{
    level._id_2EA7 = 200;
    level._id_2EA6 = 38;
}

_id_2D39()
{
    self notify( "bot_conf_think" );
    self endon( "bot_conf_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_BF68 = gettime() + 500;
    self._id_1141F = [];
    childthread _id_2ED3();

    if ( self.personality == "camper" )
    {
        self._id_4503 = 0;

        if ( !isdefined( self._id_4504 ) )
            self._id_4504 = 0;
    }

    for (;;)
    {
        var_0 = isdefined( self._id_113DD );
        var_1 = 0;

        if ( var_0 && self bothasscriptgoal() )
        {
            var_2 = self botgetscriptgoal();

            if ( scripts\mp\bots\bots_util::_id_2EC6( self._id_113DD.curorigin, var_2 ) )
            {
                if ( self botpursuingscriptgoal() )
                    var_1 = 1;
            }
            else if ( scripts\mp\bots\bots_strategy::_id_2DC5( "kill_tag" ) && self._id_113DD scripts\mp\gameobjects::_id_38C3( self.team ) )
            {
                self._id_113DD = undefined;
                var_0 = 0;
            }
        }

        self botsetflag( "force_sprint", var_1 );
        self._id_1141F = _id_2E65( self._id_1141F );
        var_3 = _id_2D74( self._id_1141F, 1 );
        var_4 = isdefined( var_3 );

        if ( var_0 && !var_4 || !var_0 && var_4 || var_0 && var_4 && self._id_113DD != var_3 )
        {
            self._id_113DD = var_3;
            self botclearscriptgoal();
            self notify( "stop_camping_tag" );
            scripts\mp\bots\bots_personality::clear_camper_data();
            scripts\mp\bots\bots_strategy::_id_2D02( "kill_tag" );
        }

        if ( isdefined( self._id_113DD ) )
        {
            self._id_4504 = 0;

            if ( self.personality == "camper" && self._id_4503 )
            {
                self._id_4504 = 1;

                if ( scripts\mp\bots\bots_personality::_id_FF87() )
                {
                    if ( scripts\mp\bots\bots_personality::find_ambush_node( self._id_113DD.curorigin, 1000 ) )
                        childthread _id_2D1F( self._id_113DD, "camp" );
                    else
                        self._id_4504 = 0;
                }
            }

            if ( !self._id_4504 )
            {
                if ( !scripts\mp\bots\bots_strategy::_id_2DC5( "kill_tag" ) )
                {
                    var_5 = spawnstruct();
                    var_5._id_EDCA = "objective";
                    var_5._id_C293 = level._id_2EA7;
                    scripts\mp\bots\bots_strategy::_id_2E27( "kill_tag", self._id_113DD.curorigin, 25, var_5 );
                }
            }
        }

        var_6 = 0;

        if ( isdefined( self._id_17D9 ) )
            var_6 = self [[ self._id_17D9 ]]();

        if ( !isdefined( self._id_113DD ) )
        {
            if ( !var_6 )
                self [[ self.personality_update_function ]]();
        }

        if ( gettime() > self._id_BF68 )
        {
            self._id_BF68 = gettime() + 500;
            var_7 = _id_2D7C( 1 );
            self._id_1141F = _id_2D38( var_7, self._id_1141F );
        }

        wait 0.05;
    }
}

_id_2D2E( var_0 )
{
    if ( isdefined( var_0._id_C4B7 ) && var_0._id_C4B7 )
    {
        var_1 = self.origin + ( 0, 0, 55 );

        if ( distance2dsquared( var_0.curorigin, var_1 ) < 144 )
        {
            var_2 = var_0.curorigin[2] - var_1[2];

            if ( var_2 > 0 )
            {
                if ( var_2 < level._id_2EA6 )
                {
                    if ( !isdefined( self._id_A920 ) )
                        self._id_A920 = 0;

                    if ( gettime() - self._id_A920 > 3000 )
                    {
                        self._id_A920 = gettime();
                        thread _id_2DE3();
                    }
                }
                else
                {
                    var_0._id_C4B7 = 0;
                    return 1;
                }
            }
        }
    }

    return 0;
}

_id_2DE3()
{
    self endon( "death" );
    self endon( "disconnect" );
    self botsetstance( "stand" );
    wait 1.0;
    self botpressbutton( "jump" );
    wait 1.0;
    self botsetstance( "none" );
}

_id_2ED3()
{
    for (;;)
    {
        level waittill( "new_tag_spawned", var_0 );
        self._id_BF68 = -1;

        if ( isdefined( var_0 ) )
        {
            if ( isdefined( var_0.victim ) && var_0.victim == self || isdefined( var_0.attacker ) && var_0.attacker == self )
            {
                if ( !isdefined( var_0._id_C4B7 ) && !isdefined( var_0._id_3731 ) )
                {
                    thread _id_3704( var_0 );
                    _id_1380A( var_0 );

                    if ( var_0._id_C4B7 )
                    {
                        var_1 = spawnstruct();
                        var_1.origin = var_0.curorigin;
                        var_1._id_02DD = var_0;
                        var_2[0] = var_1;
                        self._id_1141F = _id_2D38( var_2, self._id_1141F );
                    }
                }
            }
        }
    }
}

_id_2D38( var_0, var_1 )
{
    var_2 = var_1;

    foreach ( var_4 in var_0 )
    {
        var_5 = 0;

        foreach ( var_7 in var_1 )
        {
            if ( var_4._id_02DD == var_7._id_02DD && scripts\mp\bots\bots_util::_id_2EC6( var_4.origin, var_7.origin ) )
            {
                var_5 = 1;
                break;
            }
        }

        if ( !var_5 )
            var_2 = scripts\engine\utility::_id_2279( var_2, var_4 );
    }

    return var_2;
}

_id_2DE1( var_0, var_1, var_2 )
{
    if ( !var_0._id_370E )
    {
        var_0._id_BE7C = getclosestnodeinsight( var_0.curorigin );
        var_0._id_370E = 1;
    }

    if ( isdefined( var_0._id_3731 ) )
        return 0;

    var_3 = var_0._id_BE7C;
    var_4 = !isdefined( var_0._id_C4B7 );

    if ( isdefined( var_3 ) && ( var_4 || var_0._id_C4B7 ) )
    {
        var_5 = var_3 == var_1 || nodesvisible( var_3, var_1, 1 );

        if ( var_5 )
        {
            var_6 = scripts\engine\utility::within_fov( self.origin, self.angles, var_0.curorigin, var_2 );

            if ( var_6 )
            {
                if ( var_4 )
                {
                    thread _id_3704( var_0 );
                    _id_1380A( var_0 );

                    if ( !var_0._id_C4B7 )
                        return 0;
                }

                return 1;
            }
        }
    }

    return 0;
}

_id_2D7C( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( isdefined( var_1 ) )
        var_3 = var_1;
    else
        var_3 = self getnearestnode();

    var_4 = undefined;

    if ( isdefined( var_2 ) )
        var_4 = var_2;
    else
        var_4 = self botgetfovdot();

    var_5 = [];

    if ( isdefined( var_3 ) && isdefined( level.dogtags ) )
    {
        foreach ( var_7 in level.dogtags )
        {
            if ( var_7 scripts\mp\gameobjects::_id_38C3( self.team ) )
            {
                var_8 = 0;

                if ( !var_0 )
                {
                    if ( !isdefined( var_7._id_3731 ) )
                    {
                        if ( !isdefined( var_7._id_C4B7 ) )
                        {
                            level thread _id_3704( var_7 );
                            _id_1380A( var_7 );
                        }

                        var_8 = distancesquared( self.origin, var_7.curorigin ) < 1000000 && var_7._id_C4B7;
                    }
                }
                else if ( _id_2DE1( var_7, var_3, var_4 ) )
                    var_8 = 1;

                if ( var_8 )
                {
                    var_9 = spawnstruct();
                    var_9.origin = var_7.curorigin;
                    var_9._id_02DD = var_7;
                    var_5 = scripts\engine\utility::_id_2279( var_5, var_9 );
                }
            }
        }
    }

    return var_5;
}

_id_3704( var_0 )
{
    var_0 endon( "reset" );
    var_0._id_3731 = 1;
    var_0._id_C4B7 = scripts\mp\bots\bots_util::_id_2E4E( var_0.curorigin, undefined, level._id_2EA6 + 55 );
    var_0._id_3731 = undefined;
}

_id_1380A( var_0 )
{
    while ( !isdefined( var_0._id_C4B7 ) )
        wait 0.05;
}

_id_2D74( var_0, var_1 )
{
    var_2 = undefined;

    if ( var_0.size > 0 )
    {
        var_3 = 1409865409;

        foreach ( var_5 in var_0 )
        {
            var_6 = _id_7B2E( var_5._id_02DD );

            if ( !var_1 || var_6 < 2 )
            {
                var_7 = distancesquared( var_5._id_02DD.curorigin, self.origin );

                if ( var_7 < var_3 )
                {
                    var_2 = var_5._id_02DD;
                    var_3 = var_7;
                }
            }
        }
    }

    return var_2;
}

_id_2E65( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( var_3._id_02DD scripts\mp\gameobjects::_id_38C3( self.team ) && scripts\mp\bots\bots_util::_id_2EC6( var_3._id_02DD.curorigin, var_3.origin ) )
        {
            if ( !_id_2D2E( var_3._id_02DD ) && var_3._id_02DD._id_C4B7 )
                var_1 = scripts\engine\utility::_id_2279( var_1, var_3 );
        }
    }

    return var_1;
}

_id_7B2E( var_0 )
{
    var_1 = 0;

    foreach ( var_3 in level._id_C928 )
    {
        if ( !isdefined( var_3.team ) )
            continue;

        if ( var_3.team == self.team && var_3 != self )
        {
            if ( isai( var_3 ) )
            {
                if ( isdefined( var_3._id_113DD ) && var_3._id_113DD == var_0 )
                    var_1++;

                continue;
            }

            if ( distancesquared( var_3.origin, var_0.curorigin ) < 160000 )
                var_1++;
        }
    }

    return var_1;
}

_id_2D1F( var_0, var_1, var_2 )
{
    self notify( "bot_camp_tag" );
    self endon( "bot_camp_tag" );
    self endon( "stop_camping_tag" );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    self botsetscriptgoalnode( self.node_ambushing_from, var_1, self.ambush_aw );
    var_3 = scripts\mp\bots\bots_util::_id_2ECB();

    if ( var_3 == "goal" )
    {
        var_4 = var_0._id_BE7C;

        if ( isdefined( var_4 ) )
        {
            var_5 = findentrances( self.origin );
            var_5 = scripts\engine\utility::_id_2279( var_5, var_4 );
            childthread scripts\mp\bots\bots_util::_id_2ED4( var_5 );
        }
    }
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_F9FD()
{
    level._id_2E44 = [];
    level._id_2E45 = [];
    level._id_2E44["active"][0] = "default";
    level._id_2E44["active"][1] = "run_and_gun";
    level._id_2E44["active"][2] = "cqb";
    level._id_2E44["stationary"][0] = "camper";
    level._id_2E46 = [];

    foreach ( var_5, var_1 in level._id_2E44 )
    {
        foreach ( var_3 in var_1 )
        {
            level._id_2E46[var_3] = var_5;
            level._id_2E45[level._id_2E45.size] = var_3;
        }
    }

    level._id_2E47 = [];
    level._id_2E47["active"] = 2;
    level._id_2E47["stationary"] = 1;
    level._id_2E42 = [];
    level._id_2E42["default"] = ::_id_96D4;
    level._id_2E42["camper"] = ::_id_96D3;
    level._id_2E43["default"] = ::_id_12E08;
    level._id_2E43["camper"] = ::_id_12E07;
}

bot_assign_personality_functions()
{
    self.personality = self botgetpersonality();
    self._id_CA7A = level._id_2E42[self.personality];

    if ( !isdefined( self._id_CA7A ) )
        self._id_CA7A = level._id_2E42["default"];

    self [[ self._id_CA7A ]]();
    self.personality_update_function = level._id_2E43[self.personality];

    if ( !isdefined( self.personality_update_function ) )
        self.personality_update_function = level._id_2E43["default"];
}

bot_balance_personality()
{
    if ( isdefined( self._id_CA7C ) && self._id_CA7C )
        return;

    if ( scripts\mp\utility\game::bot_is_fireteam_mode() )
        return;

    var_0 = [];
    var_1 = [];

    foreach ( var_7, var_3 in level._id_2E44 )
    {
        var_1[var_7] = 0;

        foreach ( var_5 in var_3 )
            var_0[var_5] = 0;
    }

    foreach ( var_9 in level.players )
    {
        if ( isbot( var_9 ) && isdefined( var_9.team ) && var_9.team == self.team && var_9 != self && isdefined( var_9._id_8B68 ) )
        {
            var_5 = var_9 botgetpersonality();
            var_7 = level._id_2E46[var_5];
            var_0[var_5] += 1;
            var_1[var_7] += 1;
        }
    }

    var_11 = undefined;

    while ( !isdefined( var_11 ) )
    {
        for ( var_12 = level._id_2E47; var_12.size > 0; var_12[var_13] = undefined )
        {
            var_13 = scripts\mp\bots\bots_util::_id_2DB4( var_12, randomint( var_12.size ) );
            var_1[var_13] -= level._id_2E47[var_13];

            if ( var_1[var_13] < 0 )
            {
                var_11 = var_13;
                break;
            }
        }
    }

    var_14 = undefined;
    var_15 = undefined;
    var_16 = 9999;
    var_17 = undefined;
    var_18 = -9999;
    var_19 = scripts\engine\utility::_id_22A7( level._id_2E44[var_11] );

    foreach ( var_5 in var_19 )
    {
        if ( var_0[var_5] < var_16 )
        {
            var_15 = var_5;
            var_16 = var_0[var_5];
        }

        if ( var_0[var_5] > var_18 )
        {
            var_17 = var_5;
            var_18 = var_0[var_5];
        }
    }

    if ( var_18 - var_16 >= 2 )
        var_14 = var_15;
    else
        var_14 = scripts\engine\utility::_id_DC6B( level._id_2E44[var_11] );

    if ( self botgetpersonality() != var_14 )
        self botsetpersonality( var_14 );

    self._id_8B68 = 1;
}

_id_96D3()
{
    clear_camper_data();
}

_id_96D4()
{
    clear_camper_data();
}

_id_12E07()
{
    if ( _id_FF87() && !scripts\mp\bots\bots_util::_id_2DD7() && !scripts\mp\bots\bots_util::bot_is_remote_or_linked() )
    {
        var_0 = self botgetscriptgoaltype();
        var_1 = 0;

        if ( !isdefined( self._id_37EB ) )
            self._id_37EB = 0;

        var_2 = var_0 == "hunt";
        var_3 = gettime() > self._id_37EB + 10000;

        if ( ( !var_2 || var_3 ) && !scripts\mp\bots\bots_util::_id_2E3B() )
        {
            if ( !self bothasscriptgoal() )
                bot_random_path();

            var_1 = _id_6C7E();

            if ( !var_1 )
                self._id_37EB = gettime();
        }

        if ( isdefined( var_1 ) && var_1 )
        {
            self._id_1E16 = scripts\mp\bots\bots_util::_id_2E58( "bot_find_ambush_entrances", ::_id_2D73, self.node_ambushing_from, 1 );
            var_4 = scripts\mp\bots\bots_strategy::_id_2DA3( "trap_directional", "trap", "c4" );

            if ( isdefined( var_4 ) )
            {
                var_5 = gettime();
                scripts\mp\bots\bots_strategy::_id_2E7E( var_4, self._id_1E16, self.node_ambushing_from, self.ambush_aw );
                var_5 = gettime() - var_5;

                if ( var_5 > 0 && isdefined( self.ambush_end ) && isdefined( self.node_ambushing_from ) )
                {
                    self.ambush_end += var_5;
                    self.node_ambushing_from._id_2D0B = self.ambush_end + 10000;
                }
            }

            if ( !scripts\mp\bots\bots_strategy::_id_2DC5() && !scripts\mp\bots\bots_util::_id_2DD7() && isdefined( self.node_ambushing_from ) )
            {
                self botsetscriptgoalnode( self.node_ambushing_from, "camp", self.ambush_aw );
                thread _id_417C( "bad_path", "node_relinquished", "out_of_ammo" );
                thread _id_13961();
                thread _id_2D03( "clear_camper_data", "goal" );
                thread _id_2ECF( "clear_camper_data", "bot_add_ambush_time_delayed", self._id_1E16, self.ambush_aw );
                return;
            }
        }
        else
        {
            if ( var_0 == "camp" )
                self botclearscriptgoal();

            _id_12E08();
        }
    }
}

_id_12E08()
{
    var_0 = undefined;
    var_1 = self bothasscriptgoal();

    if ( var_1 )
        var_0 = self botgetscriptgoal();

    if ( !scripts\mp\bots\bots_strategy::_id_2DC5() && !scripts\mp\bots\bots_util::bot_is_remote_or_linked() )
    {
        var_2 = undefined;
        var_3 = undefined;

        if ( var_1 )
        {
            var_2 = distancesquared( self.origin, var_0 );
            var_3 = self botgetscriptgoalradius();
            var_4 = var_3 * 2;

            if ( isdefined( self._id_2E1F ) && var_2 < var_4 * var_4 )
            {
                var_5 = botmemoryflags( "investigated" );
                botflagmemoryevents( 0, gettime() - self._id_2E20, 1, self._id_2E1F, var_4, "kill", var_5, self );
                botflagmemoryevents( 0, gettime() - self._id_2E20, 1, self._id_2E1F, var_4, "death", var_5, self );
                self._id_2E1F = undefined;
                self._id_2E20 = undefined;
            }
        }

        if ( !var_1 || var_2 < var_3 * var_3 )
        {
            var_6 = bot_random_path();

            if ( var_6 && randomfloat( 100 ) < 25 )
            {
                var_7 = scripts\mp\bots\bots_strategy::_id_2DA3( "trap_directional", "trap" );

                if ( isdefined( var_7 ) )
                {
                    var_8 = self botgetscriptgoal();

                    if ( isdefined( var_8 ) )
                    {
                        var_9 = getclosestnodeinsight( var_8 );

                        if ( isdefined( var_9 ) )
                        {
                            var_10 = scripts\mp\bots\bots_util::_id_2E58( "bot_find_ambush_entrances", ::_id_2D73, var_9, 0 );
                            var_11 = scripts\mp\bots\bots_strategy::_id_2E7E( var_7, var_10, var_9 );

                            if ( !isdefined( var_11 ) || var_11 )
                            {
                                self botclearscriptgoal();
                                var_6 = bot_random_path();
                            }
                        }
                    }
                }
            }

            if ( var_6 )
                thread _id_417C( "enemy", "bad_path", "goal", "node_relinquished", "search_end" );
        }
    }
}

_id_417C( var_0, var_1, var_2, var_3, var_4 )
{
    self notify( "clear_script_goal_on" );
    self endon( "clear_script_goal_on" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "start_tactical_goal" );
    var_5 = self botgetscriptgoal();
    var_6 = 1;

    while ( var_6 )
    {
        var_7 = scripts\engine\utility::_id_13734( var_0, var_1, var_2, var_3, var_4, "script_goal_changed" );
        var_6 = 0;
        var_8 = 1;

        if ( var_7 == "node_relinquished" || var_7 == "goal" || var_7 == "script_goal_changed" )
        {
            if ( !self bothasscriptgoal() )
                var_8 = 0;
            else
            {
                var_9 = self botgetscriptgoal();
                var_8 = scripts\mp\bots\bots_util::_id_2EC6( var_5, var_9 );
            }
        }

        if ( var_7 == "enemy" && isdefined( self._id_010C ) )
        {
            var_8 = 0;
            var_6 = 1;
        }

        if ( var_8 )
            self botclearscriptgoal();
    }
}

_id_13961()
{
    self notify( "watch_out_of_ammo" );
    self endon( "watch_out_of_ammo" );
    self endon( "death" );
    self endon( "disconnect" );

    while ( !scripts\mp\bots\bots_util::_id_2E3B() )
        wait 0.5;

    self notify( "out_of_ammo" );
}

_id_2D03( var_0, var_1 )
{
    self notify( "bot_add_ambush_time_delayed" );
    self endon( "bot_add_ambush_time_delayed" );
    self endon( "death" );
    self endon( "disconnect" );

    if ( isdefined( var_0 ) )
        self endon( var_0 );

    self endon( "node_relinquished" );
    self endon( "bad_path" );
    var_2 = gettime();

    if ( isdefined( var_1 ) )
        self waittill( var_1 );

    if ( isdefined( self.ambush_end ) && isdefined( self.node_ambushing_from ) )
    {
        self.ambush_end += gettime() - var_2;
        self.node_ambushing_from._id_2D0B = self.ambush_end + 10000;
    }

    self notify( "bot_add_ambush_time_delayed" );
}

_id_2ECF( var_0, var_1, var_2, var_3 )
{
    self notify( "bot_watch_entrances_delayed" );

    if ( var_2.size > 0 )
    {
        self endon( "bot_watch_entrances_delayed" );
        self endon( "death" );
        self endon( "disconnect" );
        self endon( var_0 );
        self endon( "node_relinquished" );
        self endon( "bad_path" );

        if ( isdefined( var_1 ) )
            self waittill( var_1 );

        self endon( "path_enemy" );
        childthread scripts\mp\bots\bots_util::_id_2ED4( var_2, var_3, 0, self.ambush_end );
        childthread _id_2E24();
    }
}

_id_2E24()
{
    self notify( "bot_monitor_watch_entrances_camp" );
    self endon( "bot_monitor_watch_entrances_camp" );
    self notify( "bot_monitor_watch_entrances" );
    self endon( "bot_monitor_watch_entrances" );
    self endon( "disconnect" );
    self endon( "death" );

    while ( !isdefined( self._id_1395E ) )
        wait 0.05;

    while ( isdefined( self._id_1395E ) )
    {
        foreach ( var_1 in self._id_1395E )
            var_1._id_1395D[self.entity_number] = 1.0;

        scripts\mp\bots\bots_strategy::_id_D924( 0.5 );
        wait( randomfloatrange( 0.5, 0.75 ) );
    }
}

_id_2D73( var_0, var_1 )
{
    self endon( "disconnect" );
    var_2 = [];
    var_3 = findentrances( var_0.origin );

    if ( isdefined( var_3 ) && var_3.size > 0 )
    {
        wait 0.05;
        var_4 = var_0.type != "Cover Stand" && var_0.type != "Conceal Stand";

        if ( var_4 && var_1 )
            var_3 = self botnodescoremultiple( var_3, "node_exposure_vis", var_0.origin, "crouch" );

        foreach ( var_6 in var_3 )
        {
            if ( distancesquared( self.origin, var_6.origin ) < 90000 )
                continue;

            if ( var_4 && var_1 )
            {
                wait 0.05;

                if ( !scripts\mp\bots\bots_util::_id_6655( var_6.origin, var_0.origin, "crouch" ) )
                    continue;
            }

            var_2[var_2.size] = var_6;
        }
    }

    return var_2;
}

bot_filter_ambush_inuse( var_0 )
{
    var_1 = [];
    var_2 = gettime();
    var_3 = var_0.size;

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        var_5 = var_0[var_4];

        if ( !isdefined( var_5._id_2D0B ) || var_2 > var_5._id_2D0B )
            var_1[var_1.size] = var_5;
    }

    return var_1;
}

_id_2D72( var_0, var_1, var_2 )
{
    var_3 = [];
    var_4 = [];
    var_5 = var_2 * var_2;

    if ( level.teambased )
    {
        foreach ( var_7 in level._id_C928 )
        {
            if ( !scripts\mp\utility\game::isreallyalive( var_7 ) )
                continue;

            if ( !isdefined( var_7.team ) )
                continue;

            if ( var_7.team == var_1.team && var_7 != var_1 && isdefined( var_7.node_ambushing_from ) )
                var_4[var_4.size] = var_7.node_ambushing_from.origin;
        }
    }

    var_9 = var_4.size;
    var_10 = var_0.size;

    for ( var_11 = 0; var_11 < var_10; var_11++ )
    {
        var_12 = 0;
        var_13 = var_0[var_11];

        for ( var_14 = 0; !var_12 && var_14 < var_9; var_14++ )
        {
            var_15 = distancesquared( var_4[var_14], var_13.origin );
            var_12 = var_15 < var_5;
        }

        if ( !var_12 )
            var_3[var_3.size] = var_13;
    }

    return var_3;
}

clear_camper_data()
{
    self notify( "clear_camper_data" );

    if ( isdefined( self.node_ambushing_from ) && isdefined( self.node_ambushing_from._id_2D0B ) )
        self.node_ambushing_from._id_2D0B = undefined;

    self.node_ambushing_from = undefined;
    self.point_to_ambush = undefined;
    self.ambush_aw = undefined;
    self._id_1E16 = undefined;
    self.ambush_duration = randomintrange( 20000, 30000 );
    self.ambush_end = -1;
}

_id_FF87()
{
    if ( scripts\mp\bots\bots_strategy::_id_2DC5() )
        return 0;

    if ( gettime() > self.ambush_end )
        return 1;

    if ( !self bothasscriptgoal() )
        return 1;

    return 0;
}

_id_6C7E()
{
    self notify( "find_camp_node" );
    self endon( "find_camp_node" );
    return scripts\mp\bots\bots_util::_id_2E58( "find_camp_node_worker", ::find_camp_node_worker );
}

find_camp_node_worker()
{
    self notify( "find_camp_node_worker" );
    self endon( "find_camp_node_worker" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    clear_camper_data();

    if ( level._id_13FBD <= 0 )
        return 0;

    var_0 = getzonenearest( self.origin );
    var_1 = undefined;
    var_2 = undefined;
    var_3 = self.angles;

    if ( isdefined( var_0 ) )
    {
        var_4 = botzonenearestcount( var_0, self.team, -1, "enemy_predict", ">", 0, "ally", "<", 1 );

        if ( !isdefined( var_4 ) )
            var_4 = botzonenearestcount( var_0, self.team, -1, "enemy_predict", ">", 0 );

        if ( !isdefined( var_4 ) )
        {
            var_5 = -1;
            var_6 = -1;

            for ( var_7 = 0; var_7 < level._id_13FBD; var_7++ )
            {
                var_8 = distance2dsquared( getzoneorigin( var_7 ), self.origin );

                if ( var_8 > var_5 )
                {
                    var_5 = var_8;
                    var_6 = var_7;
                }
            }

            var_4 = var_6;
        }

        var_9 = getzonepath( var_0, var_4 );

        if ( isdefined( var_9 ) && var_9.size > 0 )
        {
            for ( var_10 = 0; var_10 <= int( var_9.size / 2 ); var_10++ )
            {
                var_1 = var_9[var_10];
                var_2 = var_9[int( min( var_10 + 1, var_9.size - 1 ) )];

                if ( botzonegetcount( var_2, self.team, "enemy_predict" ) != 0 )
                    break;
            }

            if ( isdefined( var_1 ) && isdefined( var_2 ) && var_1 != var_2 )
            {
                var_3 = getzoneorigin( var_2 ) - getzoneorigin( var_1 );
                var_3 = vectortoangles( var_3 );
            }
        }
    }

    var_11 = undefined;

    if ( isdefined( var_1 ) )
    {
        var_12 = 1;
        var_13 = 1;
        var_14 = 0;

        while ( var_12 )
        {
            var_15 = getzonenodesbydist( var_1, 800 * var_13, 1 );

            if ( var_15.size > 1024 )
                var_15 = getzonenodes( var_1, 0 );

            wait 0.05;
            var_16 = randomint( 100 );

            if ( var_16 < 66 && var_16 >= 33 )
                var_3 = ( var_3[0], var_3[1] + 45, 0 );
            else if ( var_16 < 33 )
                var_3 = ( var_3[0], var_3[1] - 45, 0 );

            if ( var_15.size > 0 )
            {
                var_17 = int( min( max( 1, var_15.size * 0.15 ), 5 ) );

                if ( var_14 )
                    var_15 = self botnodepickmultiple( var_15, var_17, var_17, "node_camp", anglestoforward( var_3 ), "lenient" );
                else
                    var_15 = self botnodepickmultiple( var_15, var_17, var_17, "node_camp", anglestoforward( var_3 ) );

                var_15 = bot_filter_ambush_inuse( var_15 );

                if ( !isdefined( self.can_camp_near_others ) || !self.can_camp_near_others )
                {
                    var_18 = 800;
                    var_15 = _id_2D72( var_15, self, var_18 );
                }

                if ( var_15.size > 0 )
                    var_11 = scripts\engine\utility::random_weight_sorted( var_15 );
            }

            if ( isdefined( var_11 ) )
                var_12 = 0;
            else if ( isdefined( self.camping_needs_fallback_camp_location ) )
            {
                if ( var_13 == 1 && !var_14 )
                    var_13 = 3;
                else if ( var_13 == 3 && !var_14 )
                    var_14 = 1;
                else if ( var_13 == 3 && var_14 )
                    var_12 = 0;
            }
            else
                var_12 = 0;

            if ( var_12 )
                wait 0.05;
        }
    }

    if ( !isdefined( var_11 ) || !self botnodeavailable( var_11 ) )
        return 0;

    self.node_ambushing_from = var_11;
    self.ambush_end = gettime() + self.ambush_duration;
    self.node_ambushing_from._id_2D0B = self.ambush_end;
    self.ambush_aw = var_3[1];
    return 1;
}

find_ambush_node( var_0, var_1 )
{
    clear_camper_data();

    if ( isdefined( var_0 ) )
        self.point_to_ambush = var_0;
    else
    {
        var_2 = undefined;
        var_3 = getnodesinradius( self.origin, 5000, 0, 2000 );

        if ( var_3.size > 0 )
            var_2 = self botnodepick( var_3, var_3.size * 0.25, "node_traffic" );

        if ( isdefined( var_2 ) )
            self.point_to_ambush = var_2.origin;
        else
            return 0;
    }

    var_4 = 2000;

    if ( isdefined( var_1 ) )
        var_4 = var_1;

    var_5 = getnodesinradius( self.point_to_ambush, var_4, 0, 1000 );
    var_6 = undefined;

    if ( var_5.size > 0 )
    {
        var_7 = int( max( 1, int( var_5.size * 0.15 ) ) );
        var_5 = self botnodepickmultiple( var_5, var_7, var_7, "node_ambush", self.point_to_ambush );
    }

    var_5 = bot_filter_ambush_inuse( var_5 );

    if ( var_5.size > 0 )
        var_6 = scripts\engine\utility::random_weight_sorted( var_5 );

    if ( !isdefined( var_6 ) || !self botnodeavailable( var_6 ) )
        return 0;

    self.node_ambushing_from = var_6;
    self.ambush_end = gettime() + self.ambush_duration;
    self.node_ambushing_from._id_2D0B = self.ambush_end;
    var_8 = vectornormalize( self.point_to_ambush - self.node_ambushing_from.origin );
    var_9 = vectortoangles( var_8 );
    self.ambush_aw = var_9[1];
    return 1;
}

bot_random_path()
{
    if ( scripts\mp\bots\bots_util::bot_is_remote_or_linked() )
        return 0;

    var_0 = level.bot_random_path_function[self.team];
    return self [[ var_0 ]]();
}

bot_random_path_default()
{
    var_0 = 0;
    var_1 = 50;

    if ( self.personality == "camper" )
        var_1 = 0;

    var_2 = undefined;

    if ( randomint( 100 ) < var_1 )
        var_2 = scripts\mp\bots\bots_util::bot_recent_point_of_interest();

    if ( !isdefined( var_2 ) )
    {
        var_3 = self botfindnoderandom();

        if ( isdefined( var_3 ) )
            var_2 = var_3.origin;
    }

    if ( isdefined( var_2 ) )
        var_0 = self botsetscriptgoal( var_2, 128, "hunt" );

    return var_0;
}

bot_setup_callback_class()
{
    if ( scripts\mp\bots\bots_loadout::bot_setup_loadout_callback() )
        return "callback";
    else
        return "class0";
}

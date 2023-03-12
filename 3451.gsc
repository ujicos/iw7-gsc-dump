// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_2D4C()
{
    var_0 = _id_2D4B( self._id_4B0F );

    if ( isdefined( var_0 ) && var_0.size > 0 )
        return scripts\engine\utility::_id_DC6B( var_0 ).origin;

    return undefined;
}

_id_2D4B( var_0 )
{
    if ( isdefined( self._id_5060 ) )
        return scripts\mp\bots\bots_util::_id_2DA8( var_0, self._id_5060 );

    return [];
}

_id_2E86()
{
    wait 1.0;
    _id_2E87( level._id_2C7A );
    level._id_2E80 = 1;
}

_id_2E8A()
{
    _id_2E87( level._id_DBFE );
}

_id_2E87( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2._id_2EFE ) )
        {
            var_2._id_2EFE = [];
            var_3 = getnodesintrigger( var_2.trigger );

            foreach ( var_5 in var_3 )
            {
                if ( !var_5 nodeisdisconnected() )
                    var_2._id_2EFE = scripts\engine\utility::_id_2279( var_2._id_2EFE, var_5 );
            }
        }
    }
}

_id_2DA3( var_0, var_1, var_2 )
{
    var_3 = [];
    var_4 = [];
    var_4[var_4.size] = var_0;

    if ( isdefined( var_1 ) )
        var_4[var_4.size] = var_1;

    if ( isdefined( var_1 ) )
        var_4[var_4.size] = var_2;

    foreach ( var_6 in var_4 )
    {
        var_3["purpose"] = var_6;
        var_3["item_action"] = scripts\mp\bots\bots_util::_id_2DAA( var_6 );

        if ( isdefined( var_3["item_action"] ) )
            return var_3;
    }
}

_id_2E7E( var_0, var_1, var_2, var_3, var_4 )
{
    self notify( "bot_set_ambush_trap" );
    self endon( "bot_set_ambush_trap" );

    if ( !isdefined( var_0 ) )
        return 0;

    var_5 = undefined;

    if ( !isdefined( var_4 ) && isdefined( var_1 ) && var_1.size > 0 )
    {
        if ( !isdefined( var_2 ) )
            return 0;

        var_6 = [];
        var_7 = undefined;

        if ( isdefined( var_3 ) )
            var_7 = anglestoforward( ( 0, var_3, 0 ) );

        foreach ( var_9 in var_1 )
        {
            if ( !isdefined( var_7 ) )
            {
                var_6[var_6.size] = var_9;
                continue;
            }

            if ( distancesquared( var_9.origin, var_2.origin ) > 90000 )
            {
                if ( vectordot( var_7, vectornormalize( var_9.origin - var_2.origin ) ) < 0.4 )
                    var_6[var_6.size] = var_9;
            }
        }

        if ( var_6.size > 0 )
        {
            var_5 = scripts\engine\utility::_id_DC6B( var_6 );
            var_11 = getnodesinradius( var_5.origin, 300, 50 );
            var_12 = [];

            foreach ( var_14 in var_11 )
            {
                if ( !isdefined( var_14._id_2D0B ) )
                    var_12[var_12.size] = var_14;
            }

            var_11 = var_12;
            var_4 = self botnodepick( var_11, min( var_11.size, 3 ), "node_trap", var_2, var_5 );
        }
    }

    if ( isdefined( var_4 ) )
    {
        var_16 = undefined;

        if ( var_0["purpose"] == "trap_directional" && isdefined( var_5 ) )
        {
            var_17 = vectortoangles( var_5.origin - var_4.origin );
            var_16 = var_17[1];
        }

        if ( self bothasscriptgoal() && self botgetscriptgoaltype() != "critical" && self botgetscriptgoaltype() != "tactical" )
            self botclearscriptgoal();

        var_18 = self botsetscriptgoalnode( var_4, "guard", var_16 );

        if ( var_18 )
        {
            var_19 = scripts\mp\bots\bots_util::_id_2ECB();

            if ( var_19 == "goal" )
            {
                thread scripts\mp\bots\bots_util::_id_2D9C( "stand", 5.0 );

                if ( !isdefined( self._id_010C ) || 0 == self botcanseeentity( self._id_010C ) )
                {
                    if ( isdefined( var_16 ) )
                        self botthrowgrenade( var_5.origin, var_0["item_action"] );
                    else
                        self botthrowgrenade( self.origin + anglestoforward( self.angles ) * 50, var_0["item_action"] );

                    self._id_1E27 = undefined;
                    thread _id_2E7F( "grenade_fire" );
                    thread _id_2E7F( "missile_fire" );
                    var_20 = 3.0;

                    if ( var_0["purpose"] == "tacticalinsertion" )
                        var_20 = 6.0;

                    scripts\engine\utility::_id_13736( var_20, "missile_fire", "grenade_fire" );
                    wait 0.05;
                    self notify( "ambush_trap_ent" );

                    if ( isdefined( self._id_1E27 ) && var_0["purpose"] == "c4" )
                        thread _id_2ED2( self._id_1E27, var_0["item_action"], 300 );

                    self._id_1E27 = undefined;
                    wait( randomfloat( 0.25 ) );
                    self botsetstance( "none" );
                }
            }

            return 1;
        }
    }

    return 0;
}

_id_2E7F( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "bot_set_ambush_trap" );
    self endon( "ambush_trap_ent" );
    level endon( "game_ended" );
    self waittill( var_0, var_1 );
    self._id_1E27 = var_1;
}

_id_2ED2( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_3 = var_2 * var_2;

    for (;;)
    {
        if ( distancesquared( self.origin, var_0.origin ) > var_3 )
        {
            var_4 = self _meth_8111( var_0.origin, 1.0 );

            if ( var_4 < var_3 )
            {
                self botpressbutton( var_1 );
                return;
            }
        }

        wait( randomfloatrange( 0.25, 1.0 ) );
    }
}

_id_2D2B( var_0, var_1, var_2 )
{
    thread _id_2D4F( var_0, var_1, "capture", var_2 );
}

_id_2D2C( var_0, var_1, var_2, var_3 )
{
    var_3["capture_trigger"] = var_2;
    thread _id_2D4F( var_0, var_1, "capture_zone", var_3 );
}

_id_2E57( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) || !isdefined( var_2["min_goal_time"] ) )
        var_2["min_goal_time"] = 12;

    if ( !isdefined( var_2 ) || !isdefined( var_2["max_goal_time"] ) )
        var_2["max_goal_time"] = 18;

    thread _id_2D4F( var_0, var_1, "protect", var_2 );
}

_id_2E3D( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) || !isdefined( var_2["min_goal_time"] ) )
        var_2["min_goal_time"] = 0.0;

    if ( !isdefined( var_2 ) || !isdefined( var_2["max_goal_time"] ) )
        var_2["max_goal_time"] = 0.01;

    thread _id_2D4F( var_0, var_1, "patrol", var_2 );
}

_id_2DC1( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) || !isdefined( var_2["min_goal_time"] ) )
        var_2["min_goal_time"] = 15;

    if ( !isdefined( var_2 ) || !isdefined( var_2["max_goal_time"] ) )
        var_2["max_goal_time"] = 20;

    thread _id_2D4F( var_0, var_1, "bodyguard", var_2 );
}

_id_2D4F( var_0, var_1, var_2, var_3 )
{
    self notify( "started_bot_defend_think" );
    self endon( "started_bot_defend_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "defend_stop" );
    thread _id_508D();

    if ( isdefined( self._id_2D51 ) || self botgetscriptgoaltype() == "camp" )
        self botclearscriptgoal();

    self._id_2D51 = 1;
    self._id_2D57 = var_2;

    if ( var_2 == "capture_zone" )
    {
        self._id_2D55 = undefined;
        self._id_2D53 = var_1;
        self._id_2D56 = var_3["capture_trigger"];
    }
    else
    {
        self._id_2D55 = var_1;
        self._id_2D53 = undefined;
        self._id_2D56 = undefined;
    }

    if ( scripts\mp\utility\game::_id_9E0E( var_0 ) )
    {
        self._id_2D4D = var_0;
        childthread _id_B962();
    }
    else
    {
        self._id_2D4D = undefined;
        self._id_2D52 = var_0;
    }

    self botsetstance( "none" );
    var_4 = undefined;
    var_5 = 6;
    var_6 = 10;

    if ( isdefined( var_3 ) )
    {
        self._id_5060 = var_3["entrance_points_index"];
        self._id_5092 = var_3["score_flags"];
        self._id_2D54 = var_3["override_origin_node"];

        if ( isdefined( var_3["override_goal_type"] ) )
            var_4 = var_3["override_goal_type"];

        if ( isdefined( var_3["min_goal_time"] ) )
            var_5 = var_3["min_goal_time"];

        if ( isdefined( var_3["max_goal_time"] ) )
            var_6 = var_3["max_goal_time"];

        if ( isdefined( var_3["override_entrances"] ) && var_3["override_entrances"].size > 0 )
        {
            self._id_5091 = var_3["override_entrances"];
            self._id_5060 = self.name + " " + gettime();

            foreach ( var_8 in self._id_5091 )
            {
                var_8._id_DA7C[self._id_5060] = scripts\mp\bots\bots_util::_id_6655( var_8.origin, scripts\mp\bots\bots_util::_id_507A(), "prone" );
                wait 0.05;
                var_8._id_4A9C[self._id_5060] = scripts\mp\bots\bots_util::_id_6655( var_8.origin, scripts\mp\bots\bots_util::_id_507A(), "crouch" );
                wait 0.05;
            }
        }
    }

    if ( !isdefined( self._id_2D4D ) )
    {
        var_10 = undefined;

        if ( isdefined( var_3 ) && isdefined( var_3["nearest_node_to_center"] ) )
            var_10 = var_3["nearest_node_to_center"];

        if ( !isdefined( var_10 ) && isdefined( self._id_2D54 ) )
            var_10 = self._id_2D54;

        if ( !isdefined( var_10 ) && isdefined( self._id_2D56 ) && isdefined( self._id_2D56._id_BE7C ) )
            var_10 = self._id_2D56._id_BE7C;

        if ( !isdefined( var_10 ) )
            var_10 = getclosestnodeinsight( scripts\mp\bots\bots_util::_id_507A() );

        if ( !isdefined( var_10 ) )
        {
            var_11 = self _meth_8533();
            var_12 = scripts\mp\bots\bots_util::_id_507A();
            var_13 = getnodesinradiussorted( var_12, 256, 0, 500, "path", var_11 );

            for ( var_14 = 0; var_14 < var_13.size; var_14++ )
            {
                var_15 = vectornormalize( var_13[var_14].origin - var_12 );
                var_16 = var_12 + var_15 * 15;

                if ( sighttracepassed( var_16, var_13[var_14].origin, 0, undefined ) )
                {
                    var_10 = var_13[var_14];
                    break;
                }

                wait 0.05;

                if ( sighttracepassed( var_16 + ( 0, 0, 55 ), var_13[var_14].origin + ( 0, 0, 55 ), 0, undefined ) )
                {
                    var_10 = var_13[var_14];
                    break;
                }

                wait 0.05;
            }
        }

        self._id_C031 = var_10;
    }

    var_17 = level._id_2D76[var_2];

    if ( !isdefined( var_4 ) )
    {
        var_4 = "guard";

        if ( var_2 == "capture" || var_2 == "capture_zone" )
            var_4 = "objective";
    }

    var_18 = scripts\mp\bots\bots_util::_id_2DD5();

    if ( var_2 == "protect" )
        childthread _id_DAA4();

    for (;;)
    {
        self._id_D888 = self._id_4B0D;
        self._id_4B0D = undefined;
        self._id_4B0C = undefined;
        self._id_4B0E = undefined;
        self._id_4B0F = _id_36E6( var_18 );
        var_19 = self botgetscriptgoaltype();
        var_20 = scripts\mp\bots\bots_util::_id_2DBB( var_4, var_19 );

        if ( !var_20 )
        {
            wait 0.25;
            continue;
        }

        var_21 = var_5;
        var_22 = var_6;
        var_23 = 1;

        if ( isdefined( self._id_5090 ) )
        {
            self._id_4B0E = self._id_5090;
            self._id_5090 = undefined;
            var_23 = 0;
            var_21 = 1.0;
            var_22 = 2.0;
        }
        else if ( isdefined( self._id_508E ) )
        {
            self._id_4B0D = self._id_508E;
            self._id_508E = undefined;
        }
        else
            self [[ var_17 ]]();

        self botclearscriptgoal();
        var_24 = "";

        if ( isdefined( self._id_4B0D ) || isdefined( self._id_4B0E ) )
        {
            if ( var_23 && scripts\mp\bots\bots_util::_id_2DDD() && !isplayer( var_0 ) && isdefined( self._id_5060 ) )
            {
                var_25 = _id_2DA3( "trap_directional", "trap", "c4" );

                if ( isdefined( var_25 ) )
                {
                    var_26 = scripts\mp\bots\bots_util::_id_2DA8( undefined, self._id_5060 );
                    _id_2E7E( var_25, var_26, self._id_C031 );
                }
            }

            if ( isdefined( self._id_4B0E ) )
            {
                var_27 = undefined;

                if ( isdefined( self._id_4B0C ) )
                    var_27 = self._id_4B0C[1];

                self botsetscriptgoal( self._id_4B0E, 0, var_4, var_27 );
            }
            else if ( !isdefined( self._id_4B0C ) )
                self botsetscriptgoalnode( self._id_4B0D, var_4 );
            else
                self botsetscriptgoalnode( self._id_4B0D, var_4, self._id_4B0C[1] );

            if ( var_18 )
            {
                if ( !isdefined( self._id_D888 ) || !isdefined( self._id_4B0D ) || self._id_D888 != self._id_4B0D )
                    self botsetstance( "none" );
            }

            var_28 = self botgetscriptgoal();
            self notify( "new_defend_goal" );
            scripts\mp\bots\bots_util::_id_13960();

            if ( var_4 == "objective" )
            {
                _id_508C();
                self botsetawareness( 1.0 );
                self botsetflag( "cautious", 0 );
            }

            if ( self bothasscriptgoal() )
            {
                var_29 = self botgetscriptgoal();

                if ( scripts\mp\bots\bots_util::_id_2EC6( var_29, var_28 ) )
                    var_24 = scripts\mp\bots\bots_util::_id_2ECB( 20, "defend_force_node_recalculation" );
            }

            if ( var_24 == "goal" )
            {
                if ( var_18 )
                    self botsetstance( self._id_4B0F );

                childthread _id_5097();
            }
        }

        if ( var_24 != "goal" )
        {
            wait 0.25;
            continue;
        }

        var_30 = randomfloatrange( var_21, var_22 );
        var_24 = scripts\engine\utility::_id_13736( var_30, "node_relinquished", "goal_changed", "script_goal_changed", "defend_force_node_recalculation", "bad_path" );

        if ( ( var_24 == "node_relinquished" || var_24 == "bad_path" || var_24 == "goal_changed" || var_24 == "script_goal_changed" ) && ( self._id_4B0F == "crouch" || self._id_4B0F == "prone" ) )
            self botsetstance( "none" );
    }
}

_id_36E6( var_0 )
{
    var_1 = "stand";

    if ( var_0 )
    {
        var_2 = 100;
        var_3 = 0;
        var_4 = 0;
        var_5 = self botgetdifficultysetting( "strategyLevel" );

        if ( var_5 == 1 )
        {
            var_2 = 20;
            var_3 = 25;
            var_4 = 55;
        }
        else if ( var_5 >= 2 )
        {
            var_2 = 10;
            var_3 = 20;
            var_4 = 70;
        }

        var_6 = self._id_AE62;

        if ( isdefined( var_6 ) && var_6 == "archetype_heavy" )
            var_4 = 0;

        var_7 = randomint( 100 );

        if ( var_7 < var_3 )
            var_1 = "crouch";
        else if ( var_7 < var_3 + var_4 )
            var_1 = "prone";

        if ( var_1 == "prone" )
        {
            var_8 = _id_2D4B( "prone" );
            var_9 = _id_5064( "prone" );

            if ( var_9.size >= var_8.size )
                var_1 = "crouch";
        }

        if ( var_1 == "crouch" )
        {
            var_10 = _id_2D4B( "crouch" );
            var_11 = _id_5064( "crouch" );

            if ( var_11.size >= var_10.size )
                var_1 = "stand";
        }
    }

    return var_1;
}

_id_FF9A( var_0 )
{
    var_1 = 1250;
    var_2 = var_1 * var_1;

    if ( var_0 )
    {
        if ( self botgetdifficultysetting( "strategyLevel" ) == 0 )
            return 0;

        if ( self._id_2D57 == "capture_zone" && self istouching( self._id_2D56 ) )
            return 0;

        return distancesquared( self.origin, self._id_2D52 ) > var_2 * 0.75 * 0.75;
    }
    else if ( self botpursuingscriptgoal() && distancesquared( self.origin, self._id_2D52 ) < var_2 )
    {
        var_3 = self botgetpathdist();
        return 0 <= var_3 && var_3 <= var_1;
    }
    else
        return 0;
}

_id_F9AE( var_0, var_1 )
{
    var_2 = spawnstruct();

    if ( isdefined( var_1 ) )
        var_2.origin = var_1;
    else
        var_2.origin = var_0.origin;

    var_2._id_0205 = var_0;
    var_2._id_735E = 0;
    return var_2;
}

_id_508C()
{
    self notify( "defense_cautious_approach" );
    self endon( "defense_cautious_approach" );
    level endon( "game_ended" );
    self endon( "defend_force_node_recalculation" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "defend_stop" );
    self endon( "started_bot_defend_think" );

    if ( ![[ level.bot_funcs["should_start_cautious_approach"] ]]( 1 ) )
        return;

    var_0 = self botgetscriptgoal();
    var_1 = self botgetscriptgoalnode();
    var_2 = 1;
    var_3 = 0.2;

    while ( var_2 )
    {
        wait 0.25;

        if ( !self bothasscriptgoal() )
            return;

        var_4 = self botgetscriptgoal();

        if ( !scripts\mp\bots\bots_util::_id_2EC6( var_0, var_4 ) )
            return;

        var_3 += 0.25;

        if ( var_3 >= 0.5 )
        {
            var_3 = 0.0;

            if ( [[ level.bot_funcs["should_start_cautious_approach"] ]]( 0 ) )
                var_2 = 0;
        }
    }

    self botsetawareness( 1.8 );
    self botsetflag( "cautious", 1 );
    var_5 = self botgetnodesonpath();

    if ( !isdefined( var_5 ) || var_5.size <= 2 )
        return;

    self._id_AECF = [];
    var_6 = 1000;

    if ( isdefined( level._id_DAA3 ) )
        var_6 = level._id_DAA3;

    var_7 = var_6 * var_6;
    var_8 = self _meth_8533();
    var_9 = getnodesinradius( self._id_2D52, var_6, 0, 500, "path", var_8 );

    if ( var_9.size <= 0 )
        return;

    var_10 = 5 + self botgetdifficultysetting( "strategyLevel" ) * 2;
    var_11 = int( min( var_10, var_9.size ) );
    var_12 = self botnodepickmultiple( var_9, 15, var_11, "node_protect", scripts\mp\bots\bots_util::_id_507A(), "ignore_occupancy" );

    for ( var_13 = 0; var_13 < var_12.size; var_13++ )
    {
        var_14 = _id_F9AE( var_12[var_13] );
        self._id_AECF = scripts\engine\utility::_id_2279( self._id_AECF, var_14 );
    }

    var_15 = botgetmemoryevents( 0, gettime() - 60000, 1, "death", 0, self );

    foreach ( var_17 in var_15 )
    {
        if ( distancesquared( var_17, self._id_2D52 ) < var_7 )
        {
            var_18 = getclosestnodeinsight( var_17 );

            if ( isdefined( var_18 ) )
            {
                var_14 = _id_F9AE( var_18, var_17 );
                self._id_AECF = scripts\engine\utility::_id_2279( self._id_AECF, var_14 );
            }
        }
    }

    if ( isdefined( self._id_5060 ) )
    {
        var_20 = scripts\mp\bots\bots_util::_id_2DA8( "stand", self._id_5060 );

        for ( var_13 = 0; var_13 < var_20.size; var_13++ )
        {
            var_14 = _id_F9AE( var_20[var_13] );
            self._id_AECF = scripts\engine\utility::_id_2279( self._id_AECF, var_14 );
        }
    }

    if ( self._id_AECF.size == 0 )
        return;

    childthread _id_B959();
    var_21 = self botgetscriptgoaltype();
    var_22 = self botgetscriptgoalradius();
    var_23 = self botgetscriptgoalyaw();
    wait 0.05;

    for ( var_24 = 1; var_24 < var_5.size - 2; var_24++ )
    {
        scripts\mp\bots\bots_util::_id_2ECC();
        var_25 = getlinkednodes( var_5[var_24] );

        if ( var_25.size == 0 )
            continue;

        var_26 = [];

        for ( var_13 = 0; var_13 < var_25.size; var_13++ )
        {
            if ( !scripts\engine\utility::within_fov( self.origin, self.angles, var_25[var_13].origin, 0 ) )
                continue;

            for ( var_27 = 0; var_27 < self._id_AECF.size; var_27++ )
            {
                var_17 = self._id_AECF[var_27];

                if ( nodesvisible( var_17._id_0205, var_25[var_13], 1 ) )
                {
                    var_26 = scripts\engine\utility::_id_2279( var_26, var_25[var_13] );
                    var_27 = self._id_AECF.size;
                }
            }
        }

        if ( var_26.size == 0 )
            continue;

        var_28 = self botnodepick( var_26, 1 + var_26.size * 0.15, "node_hide" );

        if ( isdefined( var_28 ) )
        {
            var_29 = [];

            for ( var_13 = 0; var_13 < self._id_AECF.size; var_13++ )
            {
                if ( nodesvisible( self._id_AECF[var_13]._id_0205, var_28, 1 ) )
                    var_29 = scripts\engine\utility::_id_2279( var_29, self._id_AECF[var_13] );
            }

            self botclearscriptgoal();
            self botsetscriptgoalnode( var_28, "critical" );
            childthread _id_B95A();
            var_30 = scripts\mp\bots\bots_util::_id_2ECB( undefined, "cautious_approach_early_out" );
            self notify( "stop_cautious_approach_early_out_monitor" );

            if ( var_30 == "cautious_approach_early_out" )
                break;

            if ( var_30 == "goal" )
            {
                for ( var_13 = 0; var_13 < var_29.size; var_13++ )
                {
                    for ( var_31 = 0; var_29[var_13]._id_735E < 18 && var_31 < 3.6; var_31 += 0.25 )
                    {
                        self botlookatpoint( var_29[var_13].origin + ( 0, 0, self _meth_8157() ), 0.25, "script_search" );
                        wait 0.25;
                    }
                }
            }
        }

        wait 0.05;
    }

    self notify( "stop_location_monitoring" );
    self botclearscriptgoal();

    if ( isdefined( var_1 ) )
        self botsetscriptgoalnode( var_1, var_21, var_23 );
    else
        self botsetscriptgoal( self._id_4B0E, var_22, var_21, var_23 );
}

_id_B95A()
{
    self endon( "cautious_approach_early_out" );
    self endon( "stop_cautious_approach_early_out_monitor" );
    var_0 = undefined;

    if ( isdefined( self._id_2D55 ) )
        var_0 = self._id_2D55 * self._id_2D55;
    else if ( isdefined( self._id_2D53 ) )
    {
        var_1 = _id_2D2D();
        var_0 = var_1 * var_1;
    }

    wait 0.05;

    for (;;)
    {
        if ( distancesquared( self.origin, self._id_2D52 ) < var_0 )
            self notify( "cautious_approach_early_out" );

        wait 0.05;
    }
}

_id_B959()
{
    self endon( "stop_location_monitoring" );
    var_0 = 10000;

    for (;;)
    {
        var_1 = self getnearestnode();

        if ( isdefined( var_1 ) )
        {
            var_2 = self botgetfovdot();

            for ( var_3 = 0; var_3 < self._id_AECF.size; var_3++ )
            {
                if ( nodesvisible( var_1, self._id_AECF[var_3]._id_0205, 1 ) )
                {
                    var_4 = scripts\engine\utility::within_fov( self.origin, self.angles, self._id_AECF[var_3].origin, var_2 );
                    var_5 = !var_4 || self._id_AECF[var_3]._id_735E < 17;

                    if ( var_5 && distancesquared( self.origin, self._id_AECF[var_3].origin ) < var_0 )
                    {
                        var_4 = 1;
                        self._id_AECF[var_3]._id_735E = 18;
                    }

                    if ( var_4 )
                    {
                        self._id_AECF[var_3]._id_735E++;

                        if ( self._id_AECF[var_3]._id_735E >= 18 )
                        {
                            self._id_AECF[var_3] = self._id_AECF[self._id_AECF.size - 1];
                            self._id_AECF[self._id_AECF.size - 1] = undefined;
                            var_3--;
                        }
                    }
                }
            }
        }

        wait 0.05;
    }
}

_id_DAA4()
{
    self notify( "protect_watch_allies" );
    self endon( "protect_watch_allies" );
    var_0 = [];
    var_1 = 1050;
    var_2 = var_1 * var_1;
    var_3 = 900;

    if ( isdefined( level._id_DAA3 ) )
        var_3 = level._id_DAA3;

    for (;;)
    {
        var_4 = gettime();
        var_5 = _id_2DB7( self._id_2D52, var_3 );

        foreach ( var_7 in var_5 )
        {
            var_8 = var_7.entity_number;

            if ( !isdefined( var_8 ) )
                var_8 = var_7 getentitynumber();

            if ( !isdefined( var_0[var_8] ) )
                var_0[var_8] = var_4 - 1;

            if ( !isdefined( var_7._id_A8D4 ) )
                var_7._id_A8D4 = var_4 - 10001;

            if ( var_7.health == 0 && isdefined( var_7.deathtime ) && var_4 - var_7.deathtime < 5000 )
            {
                if ( var_4 - var_7._id_A8D4 > 10000 && var_4 > var_0[var_8] )
                {
                    if ( isdefined( var_7._id_01B1 ) && isdefined( var_7._id_01B1.team ) && var_7._id_01B1.team == scripts\engine\utility::_id_7984( self.team ) )
                    {
                        if ( distancesquared( var_7.origin, self.origin ) < var_2 )
                        {
                            self botgetimperfectenemyinfo( var_7._id_01B1, var_7.origin );
                            var_9 = getclosestnodeinsight( var_7.origin );

                            if ( isdefined( var_9 ) )
                            {
                                self._id_5090 = var_9.origin;
                                self notify( "defend_force_node_recalculation" );
                            }

                            var_7._id_A8D4 = var_4;
                        }

                        var_0[var_8] = var_4 + 10000;
                    }
                }
            }
        }

        wait( ( randomint( 5 ) + 1 ) * 0.05 );
    }
}

_id_508F()
{
    if ( isdefined( self._id_5091 ) )
        return self._id_5091;
    else if ( scripts\mp\bots\bots_util::_id_2DD5() )
    {
        var_0 = _id_2D4B( self._id_4B0F );

        if ( var_0.size == 0 && !isdefined( self._id_5060 ) )
            var_0 = findentrances( self.origin );

        return var_0;
    }
    else if ( scripts\mp\bots\bots_util::_id_2DDD() || scripts\mp\bots\bots_util::_id_2DD4() )
    {
        var_0 = findentrances( self.origin );
        return var_0;
    }
}

_id_5097()
{
    self notify( "defense_watch_entrances_at_goal" );
    self endon( "defense_watch_entrances_at_goal" );
    self endon( "new_defend_goal" );
    self endon( "script_goal_changed" );
    var_0 = self getnearestnode();
    var_1 = undefined;

    if ( scripts\mp\bots\bots_util::_id_2DD5() )
    {
        var_2 = _id_508F();
        var_1 = [];

        if ( isdefined( var_0 ) )
        {
            foreach ( var_4 in var_2 )
            {
                if ( nodesvisible( var_0, var_4, 1 ) )
                    var_1 = scripts\engine\utility::_id_2279( var_1, var_4 );
            }
        }
    }
    else if ( scripts\mp\bots\bots_util::_id_2DDD() || scripts\mp\bots\bots_util::_id_2DD4() )
    {
        var_1 = _id_508F();

        if ( isdefined( var_0 ) && !issubstr( self getcurrentweapon(), "riotshield" ) )
        {
            if ( !scripts\mp\utility\game::istrue( var_0.ishacknode ) && !scripts\mp\utility\game::istrue( self._id_C031.ishacknode ) )
            {
                if ( nodesvisible( var_0, self._id_C031, 1 ) )
                    var_1 = scripts\engine\utility::_id_2279( var_1, self._id_C031 );
            }
        }
    }

    if ( isdefined( var_1 ) )
    {
        childthread scripts\mp\bots\bots_util::_id_2ED4( var_1 );

        if ( scripts\mp\bots\bots_util::_id_2DD4() )
            childthread _id_2E23();
        else
            childthread _id_2E22();
    }
}

_id_2E22()
{
    self notify( "bot_monitor_watch_entrances_at_goal" );
    self endon( "bot_monitor_watch_entrances_at_goal" );
    self notify( "bot_monitor_watch_entrances" );
    self endon( "bot_monitor_watch_entrances" );

    while ( !isdefined( self._id_1395E ) )
        wait 0.05;

    var_0 = level.bot_funcs["get_watch_node_chance"];

    for (;;)
    {
        foreach ( var_2 in self._id_1395E )
        {
            if ( var_2 == self._id_C031 )
            {
                var_2._id_1395D[self.entity_number] = 0.8;
                continue;
            }

            var_2._id_1395D[self.entity_number] = 1.0;
        }

        var_4 = isdefined( var_0 );

        if ( !var_4 )
            _id_D924( 0.5 );

        foreach ( var_2 in self._id_1395E )
        {
            if ( var_4 )
            {
                var_6 = self [[ var_0 ]]( var_2 );
                var_2._id_1395D[self.entity_number] *= var_6;
            }

            if ( _id_6656( var_2 ) )
                var_2._id_1395D[self.entity_number] *= 0.5;
        }

        wait( randomfloatrange( 0.5, 0.75 ) );
    }
}

_id_2E23()
{
    self notify( "bot_monitor_watch_entrances_bodyguard" );
    self endon( "bot_monitor_watch_entrances_bodyguard" );
    self notify( "bot_monitor_watch_entrances" );
    self endon( "bot_monitor_watch_entrances" );

    while ( !isdefined( self._id_1395E ) )
        wait 0.05;

    for (;;)
    {
        var_0 = anglestoforward( self._id_2D4D.angles ) * ( 1, 1, 0 );
        var_0 = vectornormalize( var_0 );

        foreach ( var_2 in self._id_1395E )
        {
            var_2._id_1395D[self.entity_number] = 1.0;
            var_3 = var_2.origin - self._id_2D4D.origin;
            var_3 = vectornormalize( var_3 );
            var_4 = vectordot( var_0, var_3 );

            if ( var_4 > 0.6 )
                var_2._id_1395D[self.entity_number] *= 0.33;
            else if ( var_4 > 0 )
                var_2._id_1395D[self.entity_number] *= 0.66;

            if ( !_id_6654( var_2 ) )
                var_2._id_1395D[self.entity_number] *= 0.5;
        }

        wait( randomfloatrange( 0.4, 0.6 ) );
    }
}

_id_6654( var_0 )
{
    var_1 = getnodezone( var_0 );
    var_2 = vectornormalize( var_0.origin - self.origin );

    for ( var_3 = 0; var_3 < level._id_13FBD; var_3++ )
    {
        if ( botzonegetcount( var_3, self.team, "enemy_predict" ) > 0 )
        {
            if ( isdefined( var_1 ) && var_3 == var_1 )
                return 1;
            else
            {
                var_4 = vectornormalize( getzoneorigin( var_3 ) - self.origin );
                var_5 = vectordot( var_2, var_4 );

                if ( var_5 > 0.2 )
                    return 1;
            }
        }
    }

    return 0;
}

_id_D924( var_0 )
{
    if ( self._id_1395E.size <= 0 )
        return;

    var_1 = self._id_1395E;

    for ( var_2 = 0; var_2 < level._id_13FBD; var_2++ )
    {
        if ( botzonegetcount( var_2, self.team, "enemy_predict" ) <= 0 )
            continue;

        if ( var_1.size == 0 )
            break;

        var_3 = vectornormalize( getzoneorigin( var_2 ) - self.origin );

        for ( var_4 = 0; var_4 < var_1.size; var_4++ )
        {
            var_5 = getnodezone( var_1[var_4] );
            var_6 = 0;

            if ( isdefined( var_5 ) && var_2 == var_5 )
                var_6 = 1;
            else
            {
                var_7 = vectornormalize( var_1[var_4].origin - self.origin );
                var_8 = vectordot( var_7, var_3 );

                if ( var_8 > 0.2 )
                    var_6 = 1;
            }

            if ( var_6 )
            {
                var_1[var_4]._id_1395D[self.entity_number] *= var_0;
                var_1[var_4] = var_1[var_1.size - 1];
                var_1[var_1.size - 1] = undefined;
                var_4--;
            }
        }
    }
}

_id_6656( var_0 )
{
    var_1 = _id_2DB6( self._id_2D52 );

    foreach ( var_3 in var_1 )
    {
        if ( _id_6657( var_3, var_0 ) )
            return 1;
    }

    return 0;
}

_id_6657( var_0, var_1 )
{
    var_2 = anglestoforward( var_0.angles );
    var_3 = vectornormalize( var_1.origin - var_0.origin );
    var_4 = vectordot( var_2, var_3 );

    if ( var_4 > 0.6 )
        return 1;

    return 0;
}

_id_2DB6( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
    {
        if ( isdefined( level._id_DAA3 ) )
            var_1 = level._id_DAA3;
        else
            var_1 = 900;
    }

    var_2 = [];
    var_3 = _id_2DB7( var_0, var_1 );

    foreach ( var_5 in var_3 )
    {
        if ( !isai( var_5 ) || var_5 scripts\mp\bots\bots_util::_id_2DD8( var_0 ) )
            var_2 = scripts\engine\utility::_id_2279( var_2, var_5 );
    }

    return var_2;
}

_id_2DB7( var_0, var_1 )
{
    var_2 = var_1 * var_1;
    var_3 = [];

    for ( var_4 = 0; var_4 < level._id_C928.size; var_4++ )
    {
        var_5 = level._id_C928[var_4];

        if ( var_5 != self && isdefined( var_5.team ) && var_5.team == self.team && scripts\mp\utility\game::_id_9F9D( var_5 ) )
        {
            if ( distancesquared( var_0, var_5.origin ) < var_2 )
                var_3 = scripts\engine\utility::_id_2279( var_3, var_5 );
        }
    }

    return var_3;
}

_id_508D()
{
    level endon( "game_ended" );
    self endon( "started_bot_defend_think" );
    self endon( "defend_stop" );
    self endon( "disconnect" );
    self waittill( "death" );

    if ( isdefined( self ) )
        thread _id_2D4E();
}

_id_2D4E()
{
    self notify( "defend_stop" );
    self._id_2D51 = undefined;
    self._id_2D52 = undefined;
    self._id_2D55 = undefined;
    self._id_2D53 = undefined;
    self._id_2D57 = undefined;
    self._id_2D56 = undefined;
    self._id_2D54 = undefined;
    self._id_2D4D = undefined;
    self._id_5092 = undefined;
    self._id_C031 = undefined;
    self._id_5090 = undefined;
    self._id_508E = undefined;
    self._id_D888 = undefined;
    self._id_4B0D = undefined;
    self._id_4B0C = undefined;
    self._id_4B0E = undefined;
    self._id_5060 = undefined;
    self._id_5091 = undefined;
    self botclearscriptgoal();
    self botsetstance( "none" );
}

_id_5064( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_C928 )
    {
        if ( !isdefined( var_3.team ) )
            continue;

        if ( var_3.team == self.team && var_3 != self && isai( var_3 ) && var_3 scripts\mp\bots\bots_util::_id_2DD7() && var_3._id_4B0F == var_0 )
        {
            if ( var_3._id_2D57 == self._id_2D57 && scripts\mp\bots\bots_util::_id_2DD8( var_3._id_2D52 ) )
                var_1 = scripts\engine\utility::_id_2279( var_1, var_3 );
        }
    }

    return var_1;
}

_id_B962()
{
    var_0 = 0;
    var_1 = 175;
    var_2 = self._id_2D4D.origin;
    var_3 = 0;
    var_4 = 0;

    for (;;)
    {
        if ( !isdefined( self._id_2D4D ) )
            thread _id_2D4E();

        self._id_2D52 = self._id_2D4D.origin;
        self._id_C031 = self._id_2D4D getnearestnode();

        if ( !isdefined( self._id_C031 ) )
            self._id_C031 = self getnearestnode();

        if ( self botgetscriptgoaltype() != "none" )
        {
            var_5 = self botgetscriptgoal();
            var_6 = self._id_2D4D _meth_816B();
            var_7 = lengthsquared( var_6 );

            if ( var_7 > 100 )
            {
                var_0 = 0;

                if ( distancesquared( var_2, self._id_2D4D.origin ) > var_1 * var_1 )
                {
                    var_2 = self._id_2D4D.origin;
                    var_4 = 1;
                    var_8 = vectornormalize( var_5 - self._id_2D4D.origin );
                    var_9 = vectornormalize( var_6 );

                    if ( vectordot( var_8, var_9 ) < 0.1 )
                    {
                        self notify( "defend_force_node_recalculation" );
                        wait 0.25;
                    }
                }
            }
            else
            {
                var_0 += 0.05;

                if ( var_3 > 100 && var_4 )
                {
                    var_2 = self._id_2D4D.origin;
                    var_4 = 0;
                }

                if ( var_0 > 0.5 )
                {
                    var_10 = distancesquared( var_5, self._id_2D52 );

                    if ( var_10 > self._id_2D55 * self._id_2D55 )
                    {
                        self notify( "defend_force_node_recalculation" );
                        wait 0.25;
                    }
                }
            }

            var_3 = var_7;

            if ( abs( self._id_2D4D.origin[2] - var_5[2] ) >= 50 )
            {
                self notify( "defend_force_node_recalculation" );
                wait 0.25;
            }
        }

        wait 0.05;
    }
}

_id_6C87()
{
    var_0 = _id_2D4C();
    var_1 = scripts\mp\bots\bots_util::_id_2D78( scripts\mp\bots\bots_util::_id_507A(), self._id_2D55, var_0 );

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_0 ) )
        {
            var_2 = vectornormalize( var_0 - var_1.origin );
            self._id_4B0C = vectortoangles( var_2 );
        }
        else
        {
            var_3 = vectornormalize( var_1.origin - scripts\mp\bots\bots_util::_id_507A() );
            self._id_4B0C = vectortoangles( var_3 );
        }

        self._id_4B0D = var_1;
    }
    else if ( isdefined( var_0 ) )
        _id_2DC2( var_0, undefined );
    else
        _id_2DC2( undefined, scripts\mp\bots\bots_util::_id_507A() );
}

_id_6C88()
{
    var_0 = _id_2D4C();
    var_1 = scripts\mp\bots\bots_util::_id_2D79( self._id_2D53, var_0 );

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_0 ) )
        {
            var_2 = vectornormalize( var_0 - var_1.origin );
            self._id_4B0C = vectortoangles( var_2 );
        }
        else
        {
            var_3 = vectornormalize( var_1.origin - scripts\mp\bots\bots_util::_id_507A() );
            self._id_4B0C = vectortoangles( var_3 );
        }

        self._id_4B0D = var_1;
    }
    else if ( isdefined( var_0 ) )
        _id_2DC2( var_0, undefined );
    else
        _id_2DC2( undefined, scripts\mp\bots\bots_util::_id_507A() );
}

_id_6C8A()
{
    var_0 = scripts\mp\bots\bots_util::_id_2D77( scripts\mp\bots\bots_util::_id_507A(), self._id_2D55 );

    if ( isdefined( var_0 ) )
    {
        var_1 = vectornormalize( scripts\mp\bots\bots_util::_id_507A() - var_0.origin );
        self._id_4B0C = vectortoangles( var_1 );
        self._id_4B0D = var_0;
    }
    else
        _id_2DC2( scripts\mp\bots\bots_util::_id_507A(), undefined );
}

_id_6C86()
{
    var_0 = scripts\mp\bots\bots_util::_id_2D7A( scripts\mp\bots\bots_util::_id_507A(), self._id_2D55 );

    if ( isdefined( var_0 ) )
        self._id_4B0D = var_0;
    else
    {
        var_1 = self getnearestnode();

        if ( isdefined( var_1 ) )
            self._id_4B0D = var_1;
        else
            self._id_4B0E = self.origin;
    }
}

_id_6C89()
{
    var_0 = undefined;
    var_1 = self _meth_8533();
    var_2 = getnodesinradius( scripts\mp\bots\bots_util::_id_507A(), self._id_2D55, 0, 520, "path", var_1 );

    if ( isdefined( var_2 ) && var_2.size > 0 )
        var_0 = self botnodepick( var_2, 1 + var_2.size * 0.5, "node_traffic" );

    if ( isdefined( var_0 ) )
        self._id_4B0D = var_0;
    else
        _id_2DC2( undefined, scripts\mp\bots\bots_util::_id_507A() );
}

_id_2DC2( var_0, var_1 )
{
    if ( self._id_2D57 == "capture_zone" )
        self._id_4B0E = scripts\mp\bots\bots_util::_id_2E49( scripts\mp\bots\bots_util::_id_507A(), self._id_2D53, ::_id_2D2A );
    else
        self._id_4B0E = scripts\mp\bots\bots_util::_id_2E4A( scripts\mp\bots\bots_util::_id_507A(), self._id_2D55, ::_id_2D2A, 0.15, 0.9 );

    if ( isdefined( var_0 ) )
    {
        var_2 = vectornormalize( var_0 - self._id_4B0E );
        self._id_4B0C = vectortoangles( var_2 );
    }
    else if ( isdefined( var_1 ) )
    {
        var_2 = vectornormalize( self._id_4B0E - var_1 );
        self._id_4B0C = vectortoangles( var_2 );
    }
}

_id_2D2A( var_0 )
{
    if ( _id_2D2F( var_0, 1, 1, 1 ) )
        return 0;

    return 1;
}

_id_2D2F( var_0, var_1, var_2, var_3 )
{
    for ( var_4 = 0; var_4 < level._id_C928.size; var_4++ )
    {
        var_5 = level._id_C928[var_4];

        if ( var_5.team == self.team && var_5 != self )
        {
            if ( isai( var_5 ) )
            {
                if ( var_2 )
                {
                    if ( distancesquared( var_0, var_5.origin ) < 441 )
                        return 1;
                }

                if ( var_3 && var_5 bothasscriptgoal() )
                {
                    var_6 = var_5 botgetscriptgoal();

                    if ( distancesquared( var_0, var_6 ) < 441 )
                        return 1;
                }

                continue;
            }

            if ( var_1 )
            {
                if ( distancesquared( var_0, var_5.origin ) < 441 )
                    return 1;
            }
        }
    }

    return 0;
}

_id_2D2D()
{
    var_0 = 0;

    if ( isdefined( self._id_2D53 ) )
    {
        foreach ( var_2 in self._id_2D53 )
        {
            var_3 = distance( self._id_2D52, var_2.origin );
            var_0 = max( var_3, var_0 );
        }
    }

    return var_0;
}

bot_think_tactical_goals()
{
    self notify( "bot_think_tactical_goals" );
    self endon( "bot_think_tactical_goals" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_113D0 = [];

    for (;;)
    {
        if ( self._id_113D0.size > 0 && !scripts\mp\bots\bots_util::bot_is_remote_or_linked() )
        {
            var_0 = self._id_113D0[0];

            if ( !isdefined( var_0.abort ) )
            {
                self notify( "start_tactical_goal" );

                if ( isdefined( var_0._id_10D46 ) )
                    self [[ var_0._id_10D46 ]]( var_0 );

                childthread _id_13956( var_0 );
                var_1 = "tactical";

                if ( isdefined( var_0._id_8430 ) )
                    var_1 = var_0._id_8430;

                self botsetscriptgoal( var_0._id_842B, var_0._id_842C, var_1, var_0._id_0159, var_0._id_C293 );
                var_2 = scripts\mp\bots\bots_util::_id_2ECB( undefined, "stop_tactical_goal" );
                self notify( "stop_goal_aborted_watch" );

                if ( var_2 == "goal" )
                {
                    if ( isdefined( var_0._id_157C ) )
                        self [[ var_0._id_157C ]]( var_0 );
                }

                if ( var_2 != "script_goal_changed" )
                    self botclearscriptgoal();

                if ( isdefined( var_0._id_6302 ) )
                    self [[ var_0._id_6302 ]]( var_0 );
            }

            self._id_113D0 = scripts\engine\utility::array_remove( self._id_113D0, var_0 );
        }

        wait 0.05;
    }
}

_id_13956( var_0 )
{
    self endon( "stop_tactical_goal" );
    self endon( "stop_goal_aborted_watch" );
    wait 0.05;

    for (;;)
    {
        if ( isdefined( var_0.abort ) || isdefined( var_0._id_FF0D ) && self [[ var_0._id_FF0D ]]( var_0 ) )
            self notify( "stop_tactical_goal" );

        wait 0.05;
    }
}

_id_2E27( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4.type = var_0;
    var_4._id_842B = var_1;

    if ( isdefined( self._id_C550 ) )
    {
        if ( !scripts\engine\utility::array_contains( self._id_C550, var_0 ) )
            return;
    }

    var_4._id_D925 = var_2;
    var_4._id_C270 = var_3._id_C270;
    var_4._id_8430 = var_3._id_EDCA;
    var_4._id_0159 = var_3._id_EDCC;
    var_4._id_842C = 0;

    if ( isdefined( var_3._id_EDC9 ) )
        var_4._id_842C = var_3._id_EDC9;

    var_4._id_10D46 = var_3._id_10D46;
    var_4._id_6302 = var_3._id_6302;
    var_4._id_FF0D = var_3._id_FF0D;
    var_4._id_157C = var_3._id_157C;
    var_4._id_C293 = var_3._id_C293;

    for ( var_5 = 0; var_5 < self._id_113D0.size; var_5++ )
    {
        if ( var_4._id_D925 > self._id_113D0[var_5]._id_D925 )
            break;
    }

    for ( var_6 = self._id_113D0.size - 1; var_6 >= var_5; var_6-- )
        self._id_113D0[var_6 + 1] = self._id_113D0[var_6];

    self._id_113D0[var_5] = var_4;
}

_id_2DC5( var_0, var_1 )
{
    if ( !isdefined( self._id_113D0 ) )
        return 0;

    if ( isdefined( var_0 ) )
    {
        foreach ( var_3 in self._id_113D0 )
        {
            if ( var_3.type == var_0 )
            {
                if ( isdefined( var_1 ) && isdefined( var_3._id_C270 ) )
                    return var_3._id_C270 == var_1;
                else
                    return 1;
            }
        }

        return 0;
    }
    else
        return self._id_113D0.size > 0;
}

_id_2D02( var_0, var_1 )
{
    if ( !isdefined( self._id_113D0 ) )
        return;

    foreach ( var_3 in self._id_113D0 )
    {
        if ( var_3.type == var_0 )
        {
            if ( isdefined( var_1 ) )
            {
                if ( isdefined( var_3._id_C270 ) && var_3._id_C270 == var_1 )
                    var_3.abort = 1;

                continue;
            }

            var_3.abort = 1;
        }
    }
}

_id_2D5C()
{
    self._id_C550[0] = "map_interactive_object";

    foreach ( var_1 in self._id_113D0 )
    {
        if ( var_1.type != "map_interactive_object" )
            var_1.abort = 1;
    }
}

_id_2D69()
{
    self._id_C550 = undefined;
}

_id_2E1E()
{
    var_0 = gettime();

    if ( !isdefined( self._id_A8E5 ) || var_0 - self._id_A8E5 > 1000 )
    {
        self._id_A8E5 = var_0;
        var_1 = _id_2DA3( "tacticalinsertion" );

        if ( !isdefined( var_1 ) )
            return 0;

        if ( isdefined( self._id_010C ) && self botcanseeentity( self._id_010C ) )
            return 0;

        var_2 = getzonenearest( self.origin );

        if ( !isdefined( var_2 ) )
            return 0;

        var_3 = botzonenearestcount( var_2, self.team, 1, "enemy_predict", ">", 0 );

        if ( !isdefined( var_3 ) )
            return 0;

        var_4 = self _meth_8533();
        var_5 = getnodesinradius( self.origin, 500, 0, 999, "path", var_4 );

        if ( var_5.size <= 0 )
            return 0;

        var_6 = self botnodepick( var_5, var_5.size * 0.15, "node_hide" );

        if ( !isdefined( var_6 ) )
            return 0;

        return _id_2E7E( var_1, undefined, undefined, undefined, var_6 );
    }

    return 0;
}

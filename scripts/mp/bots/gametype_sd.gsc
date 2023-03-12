// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main()
{
    setup_callbacks();
    _id_2E6D();
}

setup_callbacks()
{
    level.bot_funcs["crate_can_use"] = ::_id_4830;
    level.bot_funcs["gametype_think"] = ::_id_2E6E;
    level.bot_funcs["should_start_cautious_approach"] = ::_id_FF9C;
    level.bot_funcs["know_enemies_on_start"] = undefined;
    level.bot_funcs["notify_enemy_bots_bomb_used"] = ::_id_C132;
}

_id_2E6D()
{
    _id_F8DF();
}

_id_4830( var_0 )
{
    if ( isagent( self ) && !isdefined( var_0.boxtype ) )
        return 0;

    if ( isdefined( var_0._id_485F ) && !scripts\mp\bots\bots_killstreaks::_id_2DDB( var_0._id_485F ) )
        return 0;

    if ( !scripts\mp\utility\game::_id_9F9D( self ) )
        return 1;

    if ( !isdefined( self._id_E67C ) )
        return 0;

    switch ( self._id_E67C )
    {
        case "investigate_someone_using_bomb":
        case "bomb_defuser":
        case "atk_bomber":
            return 0;
    }

    return 1;
}

_id_F8DF()
{
    level._id_2EEE = 1;
    level._id_9826 = 3000;
    scripts\mp\bots\bots_strategy::_id_2E86();
    bot_fixup_bombzone_issues();
    scripts\mp\bots\bots_util::_id_2ECA( 1 );
    level._id_2E6C = [];
    level._id_2E6C["axis"] = [];
    level._id_2E6C["allies"] = [];
    level._id_2D4A["atk_bomber"] = ::_id_2415;
    level._id_2D4A["clear_target_zone"] = ::_id_4185;
    level._id_2D4A["defend_planted_bomb"] = ::_id_5072;
    level._id_2D4A["bomb_defuser"] = ::_id_2C45;
    level._id_2D4A["investigate_someone_using_bomb"] = ::_id_9B2A;
    level._id_2D4A["camp_bomb"] = ::_id_37E6;
    level._id_2D4A["defender"] = ::_id_5086;
    level._id_2D4A["backstabber"] = ::_id_2735;
    level._id_2D4A["random_killer"] = ::_id_DC8E;
    var_0 = 0;

    foreach ( var_2 in level._id_2C7A )
    {
        var_3 = getzonenearest( var_2.curorigin );

        if ( isdefined( var_3 ) )
            botzonesetteam( var_3, game["defenders"] );
    }

    if ( !var_0 )
    {
        scripts\mp\bots\bots_util::_id_2D19();
        thread _id_2E6B();
        level._id_2DA1 = 1;
    }
}

_id_2E6E()
{
    self notify( "bot_sd_think" );
    self endon( "bot_sd_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_8BAF = undefined;

    while ( !isdefined( level._id_2DA1 ) )
        wait 0.05;

    self botsetflag( "separation", 0 );
    self botsetflag( "grenade_objectives", 1 );
    self botsetflag( "use_obj_path_style", 1 );
    var_0 = game["attackers"];
    var_1 = 1;

    if ( isdefined( level._id_F013 ) && isdefined( level._id_F013._id_3AA8 ) && level._id_F013._id_3AA8 == self && isdefined( self._id_E67C ) && self._id_E67C == "atk_bomber" )
        var_1 = 0;

    if ( var_1 )
    {
        self._id_E67C = undefined;

        if ( isdefined( level._id_2413 ) && level._id_2413 == self )
            level._id_2413 = undefined;
    }

    self._id_112FD = undefined;
    self._id_8BAF = 0;
    self._id_2414 = 0;
    self._id_EF69 = undefined;
    self._id_5085 = undefined;
    self._id_50A8 = 0;

    if ( !isdefined( level._id_981C ) && !level.multibomb )
    {
        level._id_981C = level._id_F013.curorigin;
        level._id_981D = getclosestnodeinsight( level._id_F013.curorigin );
    }

    if ( self.team == var_0 && !isdefined( level._id_382E ) )
    {
        var_2 = 0;

        if ( !level.multibomb )
        {
            var_3 = _id_7AA1( var_0 );

            foreach ( var_5 in var_3 )
            {
                if ( !isai( var_5 ) )
                    var_2 = 1;
            }
        }

        if ( var_2 )
        {
            var_7 = 6000;
            level._id_382E = gettime() + var_7;
            badplace_cylinder( "bomb", var_7 / 1000, level._id_F013.curorigin, 75, 300, var_0 );
        }
    }

    for (;;)
    {
        wait( randomintrange( 1, 3 ) * 0.05 );

        if ( self.health <= 0 )
            continue;

        self._id_8BAF = 1;

        if ( !isdefined( self._id_E67C ) )
            _id_9871();

        if ( isdefined( self._id_112FD ) )
            continue;

        if ( self.team == var_0 )
        {
            if ( !level.multibomb && isdefined( level._id_382E ) && gettime() < level._id_382E && !isdefined( level._id_F013._id_3AA8 ) )
            {
                if ( !scripts\mp\bots\bots_util::_id_2DD8( level._id_F013.curorigin ) )
                {
                    var_8 = getclosestnodeinsight( level._id_F013.curorigin );

                    if ( isdefined( var_8 ) )
                    {
                        var_9["nearest_node_to_center"] = var_8;
                        scripts\mp\bots\bots_strategy::_id_2E57( level._id_F013.curorigin, 900, var_9 );
                    }
                    else
                        level._id_382E = gettime();
                }
            }
            else
                self [[ level._id_2D4A[self._id_E67C] ]]();

            continue;
        }

        if ( level._id_2C5C )
        {
            if ( isdefined( level._id_F014 ) && distancesquared( self.origin, level._id_F014.origin ) > squared( level._id_DAA3 * 2 ) )
            {
                if ( !isdefined( self._id_5085 ) )
                {
                    self._id_5085 = 1;
                    self botsetpathingstyle( "scripted" );
                }
            }
            else if ( isdefined( self._id_5085 ) && !isdefined( self._id_EF69 ) )
            {
                self._id_5085 = undefined;
                self botsetpathingstyle( undefined );
            }
        }

        if ( level._id_2C5C && isdefined( level._id_F014 ) && isdefined( level._id_2C44 ) && self._id_E67C != "bomb_defuser" )
        {
            if ( !scripts\mp\bots\bots_util::_id_2DD8( level._id_F014.origin ) )
            {
                self botclearscriptgoal();
                scripts\mp\bots\bots_strategy::_id_2E57( level._id_F014.origin, level._id_DAA3 );
            }

            continue;
        }

        self [[ level._id_2D4A[self._id_E67C] ]]();
    }
}

_id_2415()
{
    self endon( "new_role" );

    if ( scripts\mp\bots\bots_util::_id_2DD7() )
        scripts\mp\bots\bots_strategy::_id_2D4E();

    if ( isdefined( level._id_F013 ) && isdefined( level._id_F013._id_3AA8 ) && isalive( level._id_F013._id_3AA8 ) && level._id_F013._id_3AA8 != self )
        wait 0.7;

    if ( !self._id_9D6C && !level.multibomb )
    {
        if ( isdefined( level._id_F013 ) )
        {
            if ( !isdefined( self._id_A88D ) )
                self._id_A88D = level._id_F013.curorigin;

            if ( distancesquared( self._id_A88D, level._id_F013.curorigin ) > 4 )
            {
                self botclearscriptgoal();
                self._id_A88D = level._id_F013.curorigin;
            }
        }

        if ( self._id_2414 >= 2 )
        {
            var_1 = getnodesinradiussorted( level._id_F013.curorigin, 512, 0 );
            var_2 = undefined;

            foreach ( var_4 in var_1 )
            {
                if ( !var_4 nodeisdisconnected() )
                {
                    var_2 = var_4;
                    break;
                }
            }

            if ( isdefined( var_2 ) )
            {
                self botsetscriptgoal( var_2.origin, 20, "critical" );
                scripts\mp\bots\bots_util::_id_2ECB();

                if ( isdefined( level._id_F013 ) && !isdefined( level._id_F013._id_3AA8 ) )
                    level._id_F013 scripts\mp\gameobjects::_id_F7E8( self );
            }
            else
            {

            }

            return;
        }

        if ( !self bothasscriptgoal() )
        {
            var_6 = 15;
            var_7 = 32;
            var_8 = scripts\mp\bots\bots_util::_id_2E58( "BotGetClosestNavigablePoint", scripts\mp\bots\bots_util::_id_74C3, level._id_F013.curorigin, var_6 + var_7, self );

            if ( isdefined( var_8 ) )
            {
                var_9 = self botsetscriptgoal( level._id_F013.curorigin, 0, "critical" );

                if ( var_9 )
                {
                    childthread _id_2C52();
                    return;
                }
            }
            else
            {
                var_1 = getnodesinradiussorted( level._id_F013.curorigin, 512, 0 );

                if ( var_1.size > 0 )
                {
                    self botsetscriptgoal( var_1[0].origin, 0, "critical" );
                    scripts\mp\bots\bots_util::_id_2ECB();
                }

                if ( isdefined( level._id_F013 ) && !isdefined( level._id_F013._id_3AA8 ) )
                {
                    var_8 = scripts\mp\bots\bots_util::_id_2E58( "BotGetClosestNavigablePoint", scripts\mp\bots\bots_util::_id_74C3, level._id_F013.curorigin, var_6 + var_7, self );

                    if ( !isdefined( var_8 ) )
                        level._id_F013 scripts\mp\gameobjects::_id_F7E8( self );
                }
            }
        }
    }
    else
    {
        if ( isdefined( self._id_5949 ) && gettime() < self._id_5949 )
            return;

        if ( !isdefined( level._id_2C47 ) )
            level._id_2C47 = level._id_2C7A[randomint( level._id_2C7A.size )];

        var_10 = level._id_2C47;
        self._id_2C79 = var_10;

        if ( !isdefined( level._id_981E ) || gettime() - level._id_981E < level._id_9826 )
        {
            level._id_981E = gettime() + level._id_9826;
            self botclearscriptgoal();
            self botsetscriptgoal( self.origin, 0, "tactical" );
            wait( level._id_9826 / 1000 );
        }

        self botclearscriptgoal();

        if ( level._id_24B1 == "rush" )
        {
            self botsetpathingstyle( "scripted" );

            if ( issdshiphackmap( level._id_B335 ) )
                var_11 = var_10._id_2EFE;
            else
                var_11 = self botnodescoremultiple( var_10._id_2EFE, "node_exposed" );

            var_12 = self botgetdifficultysetting( "strategyLevel" ) * 0.45;
            var_13 = ( self botgetdifficultysetting( "strategyLevel" ) + 1 ) * 0.15;

            foreach ( var_4 in var_10._id_2EFE )
            {
                if ( !scripts\engine\utility::array_contains( var_11, var_4 ) )
                    var_11[var_11.size] = var_4;
            }

            if ( randomfloat( 1.0 ) < var_12 )
                var_16 = var_11[0];
            else if ( randomfloat( 1.0 ) < var_13 )
                var_16 = var_11[1];
            else
                var_16 = scripts\engine\utility::_id_DC6B( var_11 );

            self botsetscriptgoal( var_16.origin, 0, "critical" );
        }

        var_17 = scripts\mp\bots\bots_util::_id_2ECB();

        if ( var_17 == "goal" )
        {
            var_18 = _id_7C21() - gettime();
            var_19 = var_18 - level._id_CC52 * 2 * 1000;
            var_20 = gettime() + var_19;

            if ( var_19 > 0 )
                scripts\mp\bots\bots_util::_id_2ECC( var_19 );

            var_21 = gettime() >= var_20;
            var_22 = _id_F008( level._id_CC52 + 2, "bomb_planted", var_21 );
            self botclearscriptgoal();

            if ( var_22 )
            {
                scripts\mp\bots\bots_strategy::_id_2D69();
                _id_2E84( "defend_planted_bomb" );
            }
            else if ( var_19 > 5000 )
                self._id_5949 = gettime() + 5000;
        }
    }
}

_id_7C21()
{
    if ( level._id_2C5C )
        return level._id_50A7;
    else
        return gettime() + scripts\mp\gamelogic::_id_81CD();
}

_id_2C52()
{
    self notify( "bomber_monitor_no_path" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "goal" );
    self endon( "bomber_monitor_no_path" );
    level._id_F013 endon( "pickup_object" );

    for (;;)
    {
        self waittill( "no_path" );
        self._id_2414++;
    }
}

_id_4185()
{
    self endon( "new_role" );

    if ( isdefined( level._id_2413 ) )
    {
        if ( level._id_24B1 == "rush" )
        {
            if ( !isdefined( self._id_F41C ) )
            {
                if ( !level.multibomb )
                {
                    var_0["nearest_node_to_center"] = level._id_981D;
                    scripts\mp\bots\bots_strategy::_id_2E57( level._id_981C, 900, var_0 );
                    wait( randomfloatrange( 0.0, 4.0 ) );
                    scripts\mp\bots\bots_strategy::_id_2D4E();
                }

                self._id_F41C = 1;
            }

            if ( self botgetdifficultysetting( "strategyLevel" ) > 0 )
                _id_F3B9();

            if ( isai( level._id_2413 ) && isdefined( level._id_2413._id_2C79 ) )
                var_1 = level._id_2413._id_2C79;
            else if ( isdefined( level._id_2C47 ) )
                var_1 = level._id_2C47;
            else
                var_1 = _id_6C80( level._id_2413 );

            if ( !scripts\mp\bots\bots_util::_id_2DD8( var_1.curorigin ) )
            {
                var_0["min_goal_time"] = 2;
                var_0["max_goal_time"] = 4;
                var_0["override_origin_node"] = scripts\engine\utility::_id_DC6B( var_1._id_2EFE );
                scripts\mp\bots\bots_strategy::_id_2E57( var_1.curorigin, level._id_DAA3, var_0 );
            }
        }
    }
}

_id_5072()
{
    self endon( "new_role" );

    if ( level._id_2C5C && isdefined( level._id_F014 ) )
    {
        if ( level._id_24B1 == "rush" )
            _id_552D();

        if ( !scripts\mp\bots\bots_util::_id_2DD8( level._id_F014.origin ) )
            scripts\mp\bots\bots_strategy::_id_2E57( level._id_F014.origin, level._id_DAA3 );
    }
}

_id_2C45()
{
    self endon( "new_role" );

    if ( level._id_2C4A )
        return;

    var_0 = _id_6CA5();

    if ( !isdefined( var_0 ) )
        return;

    var_1 = scripts\engine\utility::_id_782F( level._id_F014.origin, var_0._id_2EFE );
    var_2 = ( level._id_F014.origin[0], level._id_F014.origin[1], var_1[0].origin[2] );
    var_3 = _id_3BA0( var_2, undefined );

    if ( !var_3 )
        return;

    var_4 = scripts\mp\bots\bots_util::_id_2ECB();

    if ( var_4 == "bad_path" )
    {
        self._id_50A8++;

        if ( self._id_50A8 >= 4 )
        {
            for (;;)
            {
                var_5 = getnodesinradiussorted( var_2, 50, 0 );
                var_6 = self._id_50A8 - 4;

                if ( var_5.size <= var_6 )
                    break;

                self botsetscriptgoal( var_5[var_6].origin, 20, "critical" );
                var_4 = scripts\mp\bots\bots_util::_id_2ECB();

                if ( var_4 == "bad_path" )
                {
                    self._id_50A8++;
                    continue;
                }

                break;
            }
        }
    }

    if ( var_4 == "goal" )
    {
        var_7 = _id_7C21() - gettime();
        var_8 = var_7 - level._id_50AB * 2 * 1000;
        var_9 = gettime() + var_8;

        if ( var_8 > 0 )
            scripts\mp\bots\bots_util::_id_2ECC( var_8 );

        var_10 = gettime() >= var_9;
        _id_F008( level._id_50AB + 2, "bomb_defused", var_10 );
        self botclearscriptgoal();
        scripts\mp\bots\bots_strategy::_id_2D69();
    }
}

_id_9B2A()
{
    self endon( "new_role" );

    if ( scripts\mp\bots\bots_util::_id_2DD7() )
        scripts\mp\bots\bots_strategy::_id_2D4E();

    var_0 = _id_6C80( self );
    self botsetscriptgoalnode( scripts\engine\utility::_id_DC6B( var_0._id_2EFE ), "guard" );
    var_1 = scripts\mp\bots\bots_util::_id_2ECB();

    if ( var_1 == "goal" )
    {
        wait 4;
        _id_2E84( self._id_D88F );
    }
}

_id_37E6()
{
    self endon( "new_role" );

    if ( isdefined( level._id_F013._id_3AA8 ) )
    {
        if ( self._id_D88F == "defender" )
            self._id_5081 = _id_6C80( self );

        _id_2E84( self._id_D88F );
    }
    else if ( !scripts\mp\bots\bots_util::_id_2DD8( level._id_F013.curorigin ) )
    {
        var_0["nearest_node_to_center"] = level._id_F013._id_BE7D;
        scripts\mp\bots\bots_strategy::_id_2E57( level._id_F013.curorigin, level._id_DAA3, var_0 );
    }
}

_id_5086()
{
    self endon( "new_role" );

    if ( !scripts\mp\bots\bots_util::_id_2DD8( self._id_5081.curorigin ) )
    {
        var_0["score_flags"] = "strict_los";
        var_0["override_origin_node"] = scripts\engine\utility::_id_DC6B( self._id_5081._id_2EFE );
        scripts\mp\bots\bots_strategy::_id_2E57( self._id_5081.curorigin, level._id_DAA3, var_0 );
    }
}

_id_2735()
{
    self endon( "new_role" );

    if ( scripts\mp\bots\bots_util::_id_2DD7() )
        scripts\mp\bots\bots_strategy::_id_2D4E();

    if ( !isdefined( self._id_2734 ) )
        self._id_2734 = "1_move_to_midpoint";

    if ( self._id_2734 == "1_move_to_midpoint" )
    {
        var_0 = level._id_2C7A[0].curorigin;
        var_1 = level._id_2C7A[1].curorigin;
        var_2 = ( ( var_0[0] + var_1[0] ) * 0.5, ( var_0[1] + var_1[1] ) * 0.5, ( var_0[2] + var_1[2] ) * 0.5 );
        var_3 = getnodesinradiussorted( var_2, 512, 0 );

        if ( var_3.size == 0 )
        {
            _id_2E84( "random_killer" );
            return;
        }

        var_4 = undefined;
        var_5 = int( var_3.size * ( var_3.size + 1 ) * 0.5 );
        var_6 = randomint( var_5 );

        for ( var_7 = 0; var_7 < var_3.size; var_7++ )
        {
            var_8 = var_3.size - var_7;

            if ( var_6 < var_8 )
            {
                var_4 = var_3[var_7];
                break;
            }

            var_6 -= var_8;
        }

        self botsetpathingstyle( "scripted" );
        var_9 = self botsetscriptgoalnode( var_4, "guard" );

        if ( var_9 )
        {
            var_10 = scripts\mp\bots\bots_util::_id_2ECB();

            if ( var_10 == "goal" )
            {
                wait( randomfloatrange( 1.0, 4.0 ) );
                self._id_2734 = "2_move_to_enemy_spawn";
            }
        }
    }

    if ( self._id_2734 == "2_move_to_enemy_spawn" )
    {
        var_11 = scripts\mp\spawnlogic::getspawnpointarray( "mp_sd_spawn_attacker" );
        var_12 = scripts\engine\utility::_id_DC6B( var_11 );
        self botsetpathingstyle( "scripted" );
        var_9 = self botsetscriptgoal( var_12.origin, 250, "guard" );

        if ( var_9 )
        {
            var_10 = scripts\mp\bots\bots_util::_id_2ECB();

            if ( var_10 == "goal" )
                self._id_2734 = "3_move_to_bombzone";
        }
    }

    if ( self._id_2734 == "3_move_to_bombzone" )
    {
        if ( !isdefined( self._id_2C70 ) )
            self._id_2C70 = randomint( level._id_2C7A.size );

        self botsetpathingstyle( undefined );
        var_9 = self botsetscriptgoal( scripts\engine\utility::_id_DC6B( level._id_2C7A[self._id_2C70]._id_2EFE ).origin, 160, "objective" );

        if ( var_9 )
        {
            var_10 = scripts\mp\bots\bots_util::_id_2ECB();

            if ( var_10 == "goal" )
            {
                self botclearscriptgoal();
                self._id_2734 = "2_move_to_enemy_spawn";
                self._id_2C70 = 1 - self._id_2C70;
            }
        }
    }
}

_id_DC8E()
{
    self endon( "new_role" );

    if ( scripts\mp\bots\bots_util::_id_2DD7() )
        scripts\mp\bots\bots_strategy::_id_2D4E();

    self [[ self.personality_update_function ]]();
}

_id_F3B9()
{
    if ( !isdefined( self._id_1D5C ) )
    {
        self botsetflag( "force_sprint", 1 );
        self._id_1D5C = 1;
    }
}

_id_552D()
{
    if ( isdefined( self._id_1D5C ) )
    {
        self botsetflag( "force_sprint", 0 );
        self._id_1D5C = undefined;
    }
}

_id_F593()
{
    if ( !isdefined( self._id_EF69 ) )
    {
        self botsetpathingstyle( "scripted" );
        self._id_EF69 = 1;
    }
}

_id_3BA0( var_0, var_1 )
{
    var_2 = level._id_3A38;
    var_3["entrance_points_index"] = var_1;
    scripts\mp\bots\bots_strategy::_id_2D2B( var_0, var_2, var_3 );
    wait 0.05;

    while ( distancesquared( self.origin, var_0 ) > var_2 * var_2 && scripts\mp\bots\bots_util::_id_2DD7() )
    {
        if ( _id_7C21() - gettime() < 20000 )
        {
            _id_F593();
            _id_F3B9();
            break;
        }

        wait 0.05;
    }

    if ( scripts\mp\bots\bots_util::_id_2DD7() )
        scripts\mp\bots\bots_strategy::_id_2D4E();

    return self botsetscriptgoal( var_0, 20, "critical" );
}

_id_F008( var_0, var_1, var_2 )
{
    var_3 = 0;

    if ( self botgetdifficultysetting( "strategyLevel" ) == 1 )
        var_3 = 40;
    else if ( self botgetdifficultysetting( "strategyLevel" ) >= 2 )
        var_3 = 80;

    if ( randomint( 100 ) < var_3 )
    {
        self botsetstance( "prone" );
        wait 0.2;
    }

    if ( self botgetdifficultysetting( "strategyLevel" ) > 0 && !var_2 )
    {
        thread _id_C148();
        thread _id_C13F();
    }

    self botpressbutton( "use", var_0 );
    var_4 = scripts\mp\bots\bots_util::_id_2EBE( var_0, var_1, "use_interrupted" );
    self botsetstance( "none" );
    self botclearbutton( "use" );
    var_5 = var_4 == var_1;
    return var_5;
}

_id_C132( var_0 )
{
    var_1 = _id_7AA1( scripts\engine\utility::_id_7984( self.team ), 1 );

    foreach ( var_3 in var_1 )
    {
        var_4 = 0;

        if ( var_0 == "plant" )
            var_4 = 300 + var_3 botgetdifficultysetting( "strategyLevel" ) * 100;
        else if ( var_0 == "defuse" )
            var_4 = 500 + var_3 botgetdifficultysetting( "strategyLevel" ) * 500;

        if ( distancesquared( var_3.origin, self.origin ) < squared( var_4 ) )
            var_3 _id_2E84( "investigate_someone_using_bomb" );
    }
}

_id_C148()
{
    var_0 = _id_6C80( self );
    self waittill( "bulletwhizby", var_1 );

    if ( !isdefined( var_1.team ) || var_1.team != self.team )
    {
        var_2 = var_0._id_130EE - var_0._id_4B30;

        if ( var_2 > 1000 )
            self notify( "use_interrupted" );
    }
}

_id_C13F()
{
    self waittill( "damage", var_0, var_1 );

    if ( !isdefined( var_1.team ) || var_1.team != self.team )
        self notify( "use_interrupted" );
}

_id_FF9C( var_0 )
{
    var_1 = 2000;
    var_2 = var_1 * var_1;

    if ( var_0 )
    {
        if ( _id_7C21() - gettime() < 15000 )
            return 0;

        var_3 = 0;
        var_4 = scripts\engine\utility::_id_7984( self.team );

        foreach ( var_6 in level.players )
        {
            if ( !isdefined( var_6.team ) )
                continue;

            if ( isalive( var_6 ) && var_6.team == var_4 )
                var_3 = 1;
        }

        return var_3;
    }
    else
        return distancesquared( self.origin, self._id_2D52 ) <= var_2 && self botpursuingscriptgoal();
}

_id_6C80( var_0 )
{
    var_1 = undefined;
    var_2 = 999999999;

    foreach ( var_4 in level._id_2C7A )
    {
        var_5 = distancesquared( var_4.curorigin, var_0.origin );

        if ( var_5 < var_2 )
        {
            var_1 = var_4;
            var_2 = var_5;
        }
    }

    return var_1;
}

_id_7BBF( var_0 )
{
    var_1 = [];
    var_2 = _id_7AA1( game["defenders"] );

    foreach ( var_4 in var_2 )
    {
        if ( isai( var_4 ) && isdefined( var_4._id_E67C ) && var_4._id_E67C == "defender" )
        {
            if ( isdefined( var_4._id_5081 ) && var_4._id_5081 == var_0 )
                var_1 = scripts\engine\utility::_id_2279( var_1, var_4 );

            continue;
        }

        if ( distancesquared( var_4.origin, var_0.curorigin ) < level._id_DAA3 * level._id_DAA3 )
            var_1 = scripts\engine\utility::_id_2279( var_1, var_4 );
    }

    return var_1;
}

_id_6CA5()
{
    if ( isdefined( level._id_118A0 ) )
    {
        foreach ( var_1 in level._id_2C7A )
        {
            if ( distancesquared( level._id_118A0.origin, var_1.curorigin ) < 90000 )
                return var_1;
        }
    }

    return undefined;
}

_id_7C93( var_0 )
{
    var_0 = "_" + tolower( var_0 );

    for ( var_1 = 0; var_1 < level._id_2C7A.size; var_1++ )
    {
        if ( level._id_2C7A[var_1]._id_01AD == var_0 )
            return level._id_2C7A[var_1];
    }
}

_id_2C55()
{
    self endon( "stopped_being_bomb_carrier" );
    self endon( "new_role" );
    scripts\engine\utility::waittill_any( "death", "disconnect" );
    level._id_2413 = undefined;
    level._id_A88A = gettime();

    if ( isdefined( self ) )
        self._id_E67C = undefined;

    var_0 = _id_7AA1( game["attackers"], 1 );
    _id_725C( var_0, undefined );
}

_id_2C54()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "stopped_being_bomb_carrier" );
    level._id_F013 endon( "pickup_object" );
    level._id_F013 waittill( "reset" );

    if ( scripts\mp\utility\game::_id_9D36( self ) )
        self botclearscriptgoal();

    _id_2E84( "atk_bomber" );
}

_id_F495()
{
    level._id_2413 = self;
    _id_2E84( "atk_bomber" );
    thread _id_2C55();

    if ( !level.multibomb )
        thread _id_2C54();

    if ( isai( self ) )
    {
        scripts\mp\bots\bots_strategy::_id_2D5C();

        if ( level._id_24B1 == "rush" && self botgetdifficultysetting( "strategyLevel" ) > 0 )
            _id_F3B9();
    }
}

_id_9871()
{
    if ( self.team == game["attackers"] )
    {
        if ( level._id_2C5C )
            _id_2E84( "defend_planted_bomb" );
        else if ( !isdefined( level._id_2413 ) )
            _id_F495();
        else if ( level._id_24B1 == "rush" )
            _id_2E84( "clear_target_zone" );
    }
    else
    {
        var_0 = _id_7BBE( "backstabber" );
        var_1 = _id_7BBE( "defender" );
        var_2 = level._id_2E46[self.personality];
        var_3 = self botgetdifficultysetting( "strategyLevel" );

        if ( var_2 == "active" )
        {
            if ( !isdefined( self._id_E67C ) && level._id_1C3B && var_3 > 0 )
            {
                if ( var_0.size == 0 )
                    _id_2E84( "backstabber" );
                else
                {
                    var_4 = 1;

                    foreach ( var_6 in var_0 )
                    {
                        var_7 = level._id_2E46[var_6.personality];

                        if ( var_7 == "active" )
                        {
                            var_4 = 0;
                            break;
                        }
                    }

                    if ( var_4 )
                    {
                        _id_2E84( "backstabber" );
                        var_0[0] _id_2E84( undefined );
                    }
                }
            }

            if ( !isdefined( self._id_E67C ) )
            {
                if ( var_1.size < 4 )
                    _id_2E84( "defender" );
            }

            if ( !isdefined( self._id_E67C ) )
            {
                var_9 = randomint( 4 );

                if ( var_9 == 3 && level._id_1C61 && var_3 > 0 )
                    _id_2E84( "random_killer" );
                else if ( var_9 == 2 && level._id_1C3B && var_3 > 0 )
                    _id_2E84( "backstabber" );
                else
                    _id_2E84( "defender" );
            }
        }
        else if ( var_2 == "stationary" )
        {
            if ( !isdefined( self._id_E67C ) )
            {
                if ( var_1.size < 4 )
                    _id_2E84( "defender" );
                else
                {
                    foreach ( var_11 in var_1 )
                    {
                        var_12 = level._id_2E46[var_11.personality];

                        if ( var_12 == "active" )
                        {
                            _id_2E84( "defender" );
                            var_11 _id_2E84( undefined );
                            break;
                        }
                    }
                }
            }

            if ( !isdefined( self._id_E67C ) && level._id_1C3B && var_3 > 0 )
            {
                if ( var_0.size == 0 )
                    _id_2E84( "backstabber" );
            }

            if ( !isdefined( self._id_E67C ) )
                _id_2E84( "defender" );
        }

        if ( self._id_E67C == "defender" )
        {
            var_14 = level._id_2C7A;

            if ( _id_8B99( self.team ) )
                var_14 = _id_7B60( self.team );

            if ( var_14.size == 1 )
                self._id_5081 = var_14[0];
            else
            {
                var_15 = _id_7BBF( var_14[0] );
                var_16 = _id_7BBF( var_14[1] );

                if ( var_15.size < var_16.size )
                    self._id_5081 = var_14[0];
                else if ( var_16.size < var_15.size )
                    self._id_5081 = var_14[1];
                else
                    self._id_5081 = scripts\engine\utility::_id_DC6B( var_14 );
            }
        }
    }
}

_id_2E84( var_0 )
{
    if ( isai( self ) )
    {
        scripts\mp\bots\bots_strategy::_id_2D4E();
        self botsetpathingstyle( undefined );
    }

    self._id_D88F = self._id_E67C;
    self._id_E67C = var_0;
    self notify( "new_role" );
}

_id_2E85( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "new_role" );
    wait( var_1 );
    _id_2E84( var_0 );
}

_id_725C( var_0, var_1, var_2 )
{
    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_2 ) )
        {
            var_4 thread _id_2E85( var_1, randomfloatrange( 0.0, var_2 ) );
            continue;
        }

        var_4 thread _id_2E84( var_1 );
    }
}

_id_7B60( var_0 )
{
    return level._id_2E6C[var_0];
}

_id_8B99( var_0 )
{
    var_1 = _id_7B60( var_0 );
    return var_1.size > 0;
}

_id_7BBE( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_C928 )
    {
        if ( isalive( var_3 ) && scripts\mp\utility\game::_id_9F9D( var_3 ) && isdefined( var_3._id_E67C ) && var_3._id_E67C == var_0 )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_7AA1( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in level._id_C928 )
    {
        if ( !isdefined( var_4.team ) )
            continue;

        if ( scripts\mp\utility\game::isreallyalive( var_4 ) && scripts\mp\utility\game::_id_9F9D( var_4 ) && var_4.team == var_0 )
        {
            if ( !isdefined( var_1 ) || var_1 && isai( var_4 ) && isdefined( var_4._id_E67C ) )
                var_2[var_2.size] = var_4;
        }
    }

    return var_2;
}

_id_2E6B()
{
    level notify( "bot_sd_ai_director_update" );
    level endon( "bot_sd_ai_director_update" );
    level endon( "game_ended" );
    level._id_1C3B = randomint( 3 ) <= 1;
    level._id_1C61 = randomint( 3 ) <= 1;
    level._id_24B1 = "rush";
    level._id_DAA3 = 725;
    level._id_3A38 = 140;

    for (;;)
    {
        if ( isdefined( level._id_F013 ) && isdefined( level._id_F013._id_3AA8 ) && !isai( level._id_F013._id_3AA8 ) )
            level._id_2C47 = _id_6C80( level._id_F013._id_3AA8 );

        var_0 = 0;

        if ( !level._id_2C5C )
        {
            var_1 = _id_7AA1( game["attackers"] );

            foreach ( var_3 in var_1 )
            {
                if ( var_3._id_9D6C )
                {
                    level._id_382E = gettime();

                    if ( !isdefined( level._id_2413 ) || var_3 != level._id_2413 )
                    {
                        if ( isdefined( level._id_2413 ) && isalive( level._id_2413 ) )
                        {
                            level._id_2413 _id_2E84( undefined );
                            level._id_2413 notify( "stopped_being_bomb_carrier" );
                        }

                        var_0 = 1;
                        var_3 _id_F495();
                    }
                }
            }

            if ( !level.multibomb && !isdefined( level._id_F013._id_3AA8 ) )
            {
                var_5 = getclosestnodeinsight( level._id_F013.curorigin );

                if ( isdefined( var_5 ) )
                {
                    level._id_F013._id_BE7D = var_5;
                    var_6 = 0;
                    var_7 = _id_7AA1( game["defenders"], 1 );

                    foreach ( var_9 in var_7 )
                    {
                        var_10 = var_9 getnearestnode();
                        var_11 = var_9 botgetdifficultysetting( "strategyLevel" );

                        if ( var_11 > 0 && var_9._id_E67C != "camp_bomb" && isdefined( var_10 ) && nodesvisible( var_5, var_10, 1 ) )
                        {
                            var_12 = var_9 botgetfovdot();

                            if ( scripts\engine\utility::within_fov( var_9.origin, var_9.angles, level._id_F013.curorigin, var_12 ) )
                            {
                                if ( var_11 >= 2 || distancesquared( var_9.origin, level._id_F013.curorigin ) < squared( 700 ) )
                                {
                                    var_6 = 1;
                                    break;
                                }
                            }
                        }
                    }

                    if ( var_6 )
                    {
                        foreach ( var_9 in var_7 )
                        {
                            if ( var_9._id_E67C != "camp_bomb" && var_9 botgetdifficultysetting( "strategyLevel" ) > 0 )
                                var_9 _id_2E84( "camp_bomb" );
                        }
                    }
                }
            }

            var_16 = level._id_2C7A;

            if ( _id_8B99( game["defenders"] ) )
                var_16 = _id_7B60( game["defenders"] );

            for ( var_17 = 0; var_17 < var_16.size; var_17++ )
            {
                for ( var_18 = 0; var_18 < var_16.size; var_18++ )
                {
                    var_19 = _id_7BBF( var_16[var_17] );
                    var_20 = _id_7BBF( var_16[var_18] );

                    if ( var_19.size > var_20.size + 1 )
                    {
                        var_21 = [];

                        foreach ( var_3 in var_19 )
                        {
                            if ( isai( var_3 ) )
                                var_21 = scripts\engine\utility::_id_2279( var_21, var_3 );
                        }

                        if ( var_21.size > 0 )
                        {
                            var_24 = scripts\engine\utility::_id_DC6B( var_21 );
                            var_24 scripts\mp\bots\bots_strategy::_id_2D4E();
                            var_24._id_5081 = var_16[var_18];
                        }
                    }
                }
            }
        }
        else
        {
            if ( isdefined( level._id_2413 ) )
                level._id_2413 = undefined;

            if ( !isdefined( level._id_2C44 ) || !isalive( level._id_2C44 ) )
            {
                var_25 = [];
                var_26 = _id_7BBE( "defender" );
                var_27 = _id_7BBE( "backstabber" );
                var_28 = _id_7BBE( "random_killer" );

                if ( var_26.size > 0 )
                    var_25 = var_26;
                else if ( var_27.size > 0 )
                    var_25 = var_27;
                else if ( var_28.size > 0 )
                    var_25 = var_28;

                if ( var_25.size > 0 && isdefined( level._id_F014 ) )
                {
                    var_29 = scripts\engine\utility::_id_782F( level._id_F014.origin, var_25 );
                    level._id_2C44 = var_29[0];
                    level._id_2C44 _id_2E84( "bomb_defuser" );
                    level._id_2C44 scripts\mp\bots\bots_strategy::_id_2D5C();
                    level._id_2C44 thread _id_50A9();
                }
            }

            if ( !isdefined( level._id_EFFA ) )
            {
                level._id_EFFA = 1;
                var_30 = _id_7AA1( game["attackers"] );

                foreach ( var_3 in var_30 )
                {
                    if ( isdefined( var_3._id_E67C ) )
                    {
                        if ( var_3._id_E67C == "atk_bomber" )
                        {
                            var_3 thread _id_2E84( undefined );
                            continue;
                        }

                        if ( var_3._id_E67C != "defend_planted_bomb" )
                            var_3 thread _id_2E85( "defend_planted_bomb", randomfloatrange( 0.0, 3.0 ) );
                    }
                }
            }
        }

        wait 0.5;
    }
}

_id_50A9()
{
    scripts\engine\utility::waittill_any( "death", "disconnect" );
    level._id_2C44 = undefined;
}

iw7_ship_hack_add_bombzone_node( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2.origin = var_1;
    var_2.angles = ( 0, randomint( 360 ), 0 );
    var_2.ishacknode = 1;
    level._id_2C7A[var_0]._id_2EFE[level._id_2C7A[var_0]._id_2EFE.size] = var_2;
}

bot_fixup_bombzone_issues()
{
    if ( level._id_B335 == "mp_fallen" )
    {
        if ( level._id_2C7A[0]._id_2EFE.size < 3 )
        {
            var_0 = ( 492, -132, 822 );
            iw7_ship_hack_add_bombzone_node( 0, var_0 );
            var_0 = ( 330, -113, 822 );
            iw7_ship_hack_add_bombzone_node( 0, var_0 );
        }

        if ( level._id_2C7A[1]._id_2EFE.size < 3 )
        {
            var_0 = ( -276, 2302, 989 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
            var_0 = ( -200, 2363, 989 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
            var_0 = ( -200, 2434, 989 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
            var_0 = ( -252, 2479, 989 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
        }
    }

    if ( level._id_B335 == "mp_riot" )
    {
        if ( level._id_2C7A[0]._id_2EFE.size < 3 )
        {
            var_0 = ( 496, 592, 326 );
            iw7_ship_hack_add_bombzone_node( 0, var_0 );
            var_0 = ( 603, 670, 310 );
            iw7_ship_hack_add_bombzone_node( 0, var_0 );
            var_0 = ( 517, 753, 296 );
            iw7_ship_hack_add_bombzone_node( 0, var_0 );
            var_0 = ( 434, 672, 313 );
            iw7_ship_hack_add_bombzone_node( 0, var_0 );
        }
    }

    if ( level._id_B335 == "mp_metropolis" )
    {
        if ( level._id_2C7A[1]._id_2EFE.size < 3 )
        {
            var_0 = ( -1473, -784, -3 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
            var_0 = ( -1569, -711, -3 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
            var_0 = ( -1668, -783, -10 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
            var_0 = ( -1574, -876, -3 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
        }
    }

    if ( level._id_B335 == "mp_proto" )
    {
        if ( level._id_2C7A[0]._id_2EFE.size < 3 )
        {
            var_0 = ( -2, 1831, 541 );
            iw7_ship_hack_add_bombzone_node( 0, var_0 );
            var_0 = ( -72, 1924, 541 );
            iw7_ship_hack_add_bombzone_node( 0, var_0 );
            var_0 = ( -156, 1749, 541 );
            iw7_ship_hack_add_bombzone_node( 0, var_0 );
            var_0 = ( -14, 1760, 543 );
            iw7_ship_hack_add_bombzone_node( 0, var_0 );
        }
    }

    if ( level._id_B335 == "mp_divide" )
    {
        if ( level._id_2C7A[1]._id_2EFE.size < 3 )
        {
            var_0 = ( -511, -636, 647 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
            var_0 = ( -557, -625, 667 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
            var_0 = ( -566, -557, 647 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
            var_0 = ( -560, -506, 647 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
            var_0 = ( -503, -485, 647 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
        }
    }

    if ( level._id_B335 == "mp_parkour" )
    {
        if ( level._id_2C7A[0]._id_2EFE.size < 3 )
        {
            var_0 = ( -1598, 75, 249 );
            iw7_ship_hack_add_bombzone_node( 0, var_0 );
            var_0 = ( -1680, 2, 249 );
            iw7_ship_hack_add_bombzone_node( 0, var_0 );
            var_0 = ( -1605, -67, 249 );
            iw7_ship_hack_add_bombzone_node( 0, var_0 );
            var_0 = ( -1523, 4, 249 );
            iw7_ship_hack_add_bombzone_node( 0, var_0 );
        }

        if ( level._id_2C7A[1]._id_2EFE.size < 3 )
        {
            var_0 = ( 492, -1491, 313 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
            var_0 = ( 582, -1411, 312 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
            var_0 = ( 491, -1331, 314 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
            var_0 = ( 403, -1407, 313 );
            iw7_ship_hack_add_bombzone_node( 1, var_0 );
        }
    }
}

issdshiphackmap( var_0 )
{
    switch ( var_0 )
    {
        case "mp_riot":
        case "mp_divide":
        case "mp_metropolis":
        case "mp_proto":
        case "mp_fallen":
        case "mp_parkour":
            return 1;
    }

    return 0;
}

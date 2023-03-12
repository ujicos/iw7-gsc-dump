// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_C530( var_0 )
{
    if ( isdefined( level._id_72F2 ) )
        return;

    level endon( "abort_forfeit" );
    level thread _id_72F3();
    level._id_72F2 = 1;

    if ( !level.teambased && level.players.size > 1 )
        wait 10;
    else
        wait 1.05;

    level._id_72F1 = 0;
    var_1 = 20.0;
    _id_B3EA( var_1 );
    var_2 = &"";

    if ( !isdefined( var_0 ) )
    {
        var_2 = game["end_reason"]["players_forfeited"];
        var_3 = level.players[0];
    }
    else if ( var_0 == "axis" )
    {
        var_2 = game["end_reason"]["allies_forfeited"];
        var_3 = "axis";
    }
    else if ( var_0 == "allies" )
    {
        var_2 = game["end_reason"]["axis_forfeited"];
        var_3 = "allies";
    }
    else if ( level._id_BDCC && issubstr( var_0, "team_" ) )
        var_3 = var_0;
    else
        var_3 = "tie";

    level._id_72B3 = 1;

    if ( isplayer( var_3 ) )
        logstring( "forfeit, win: " + var_3 getxuid() + "(" + var_3.name + ")" );
    else
        logstring( "forfeit, win: " + var_3 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );

    thread endgame( var_3, var_2 );
}

_id_72F3()
{
    level endon( "game_ended" );
    level waittill( "abort_forfeit" );
    level._id_72F1 = 1;
    setomnvar( "ui_match_start_countdown", 0 );
}

_id_B3EB( var_0 )
{
    waittillframeend;
    level endon( "match_forfeit_timer_beginning" );

    while ( var_0 > 0 && !level._id_7669 && !level._id_72F1 && !level.ingraceperiod )
    {
        setomnvar( "ui_match_start_countdown", var_0 );
        var_0--;
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1.0 );
    }

    setomnvar( "ui_match_start_countdown", 0 );
}

_id_B3EA( var_0 )
{
    level notify( "match_forfeit_timer_beginning" );
    var_1 = int( var_0 );
    setomnvar( "ui_match_start_text", "opponent_forfeiting_in" );
    _id_B3EB( var_1 );
}

_id_5007( var_0 )
{
    if ( var_0 == "allies" )
    {
        iprintln( &"MP_FACTION_UNSA_ELIMINATED" );
        logstring( "team eliminated, win: opfor, allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
        thread endgame( "axis", game["end_reason"]["allies_eliminated"] );
    }
    else if ( var_0 == "axis" )
    {
        iprintln( &"MP_FACTION_SDF_ELIMINATED" );
        logstring( "team eliminated, win: allies, allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
        thread endgame( "allies", game["end_reason"]["axis_eliminated"] );
    }
    else
    {
        logstring( "tie, allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );

        if ( level.teambased )
            thread endgame( "tie", game["end_reason"]["tie"] );
        else
            thread endgame( undefined, game["end_reason"]["tie"] );
    }
}

_id_5009( var_0 )
{
    if ( level.teambased )
    {
        var_1 = scripts\mp\utility\game::_id_7F5E( var_0 );

        if ( isdefined( var_1 ) )
            var_1 thread _id_8378();
    }
    else
    {
        var_1 = scripts\mp\utility\game::_id_7F5E();
        logstring( "last one alive, win: " + var_1.name );
        thread endgame( var_1, game["end_reason"]["enemies_eliminated"] );
    }

    return 1;
}

_id_E75E( var_0, var_1 )
{
    _id_3E53( var_0 );

    if ( scripts\mp\utility\game::istrue( var_1 ) )
    {
        level notify( "roundEnd_CheckScoreLimit" );
        level endon( "roundEnd_CheckScoreLimit" );
        scripts\engine\utility::waitframe();
    }

    var_2 = scripts\mp\utility\game::_id_8240();

    if ( scripts\mp\utility\game::_id_9900() )
    {
        if ( scripts\mp\utility\game::_id_9FAA() )
        {
            if ( scripts\mp\utility\game::_id_F88C( var_0 ) )
            {
                foreach ( var_4 in level.players )
                {
                    var_4 setclientomnvar( "ui_friendly_time_to_beat", scripts\engine\utility::ter_op( var_4.team == game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"] ) );
                    var_4 setclientomnvar( "ui_enemy_time_to_beat", scripts\engine\utility::ter_op( var_4.team != game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"] ) );
                }

                thread endgame( var_0, game["end_reason"]["score_limit_reached"] );
            }
        }
        else
            thread endgame( var_0, game["end_reason"]["score_limit_reached"] );
    }
    else
    {
        var_6 = game["teamScores"]["allies"];
        var_7 = game["teamScores"]["axis"];
        var_8 = var_6 >= level._id_E763;
        var_9 = var_7 >= level._id_E763;

        if ( level._id_E763 > 0 )
        {
            if ( var_8 && var_9 )
            {
                if ( var_6 == var_7 )
                    thread endgame( "tie", game["end_reason"]["score_limit_reached"] );
                else if ( var_6 > var_7 )
                    thread endgame( "allies", game["end_reason"]["score_limit_reached"] );
                else
                    thread endgame( "axis", game["end_reason"]["score_limit_reached"] );
            }
            else if ( var_8 )
                thread endgame( "allies", game["end_reason"]["score_limit_reached"] );
            else if ( var_9 )
                thread endgame( "axis", game["end_reason"]["score_limit_reached"] );
        }
    }
}

_id_500A()
{
    var_0 = "tie";

    if ( level.teambased )
    {
        if ( scripts\mp\utility\game::_id_9900() )
        {
            if ( scripts\mp\utility\game::_id_9FAB() )
                var_0 = game["timeToBeatTeam"];
        }
        else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
            var_0 = "axis";
        else if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
            var_0 = "allies";

        logstring( "time limit, win: " + var_0 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
    }
    else
    {
        var_0 = scripts\mp\gamescore::_id_7F00();

        if ( scripts\mp\gamescore::ishighestscoringplayertied() )
            var_0 = "tie";

        if ( isdefined( var_0 ) && isplayer( var_0 ) )
            logstring( "time limit, win: " + var_0.name );
        else
            logstring( "time limit, tie" );
    }

    thread endgame( var_0, game["end_reason"]["time_limit_reached"] );
}

_id_5008()
{
    var_0 = undefined;
    thread endgame( "halftime", game["end_reason"]["time_limit_reached"] );
}

_id_72BE( var_0 )
{
    if ( level._id_90A1 || level._id_72B3 )
        return;

    scripts\mp\gamescore::_id_12EEC();

    if ( level.teambased )
    {
        scripts\mp\gamescore::_id_12F4A( "axis" );
        scripts\mp\gamescore::_id_12F4A( "allies" );
    }

    var_1 = undefined;

    if ( level.teambased )
    {
        if ( game["teamScores"]["allies"] == game["teamScores"]["axis"] )
            var_1 = "tie";
        else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
            var_1 = "axis";
        else
            var_1 = "allies";

        logstring( "host ended game, win: " + var_1 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
    }
    else
    {
        var_1 = scripts\mp\gamescore::_id_7F00();

        if ( isdefined( var_1 ) )
            logstring( "host ended game, win: " + var_1.name );
        else
            logstring( "host ended game, tie" );
    }

    level._id_72B3 = 1;
    level._id_90A1 = 1;

    if ( level._id_10A56 )
        var_2 = game["end_reason"]["ended_game"];
    else
        var_2 = game["end_reason"]["host_ended_game"];

    if ( isdefined( var_0 ) && var_0 == 2 )
        var_2 = game["end_reason"]["allies_forfeited"];

    level notify( "force_end" );
    thread endgame( var_1, var_2 );
}

_id_C587( var_0 )
{
    var_1 = game["end_reason"]["score_limit_reached"];
    var_2 = "tie";

    if ( level._id_BDCC )
    {
        var_2 = scripts\mp\gamescore::_id_8242();

        if ( var_2 == "none" )
            var_2 = "tie";
    }
    else if ( level.teambased )
    {
        if ( game["teamScores"]["axis"] != game["teamScores"]["allies"] )
        {
            if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
                var_2 = "axis";
            else
                var_2 = "allies";
        }

        logstring( "scorelimit, win: " + var_2 + ", allies: " + game["teamScores"]["allies"] + ", opfor: " + game["teamScores"]["axis"] );
    }
    else
    {
        var_2 = scripts\mp\gamescore::_id_7F00();

        if ( scripts\mp\utility\game::istrue( var_0 ) && scripts\mp\gamescore::ishighestscoringplayertied() )
            var_2 = "tie";

        if ( isdefined( var_2 ) && isplayer( var_2 ) )
            logstring( "scorelimit, win: " + var_2.name );
        else
            logstring( "scorelimit, tie" );
    }

    thread endgame( var_2, var_1 );
    return 1;
}

_id_12E9D()
{
    if ( scripts\mp\utility\game::matchmakinggame() && !level.ingraceperiod && ( !isdefined( level._id_55EE ) || !level._id_55EE ) )
    {
        if ( level._id_BDCC )
        {
            var_0 = 0;
            var_1 = 0;

            for ( var_2 = 0; var_2 < level._id_115DA.size; var_2++ )
            {
                var_0 += level._id_115C6[level._id_115DA[var_2]];

                if ( level._id_115C6[level._id_115DA[var_2]] )
                    var_1 += 1;
            }

            for ( var_2 = 0; var_2 < level._id_115DA.size; var_2++ )
            {
                if ( var_0 == level._id_115C6[level._id_115DA[var_2]] && game["state"] == "playing" )
                {
                    thread _id_C530( level._id_115DA[var_2] );
                    return;
                }
            }

            if ( var_1 > 1 )
            {
                level._id_72F2 = undefined;
                level notify( "abort_forfeit" );
            }
        }
        else if ( level.teambased )
        {
            if ( level._id_115C6["allies"] < 1 && level._id_115C6["axis"] > 0 && game["state"] == "playing" )
            {
                thread _id_C530( "axis" );
                return;
            }

            if ( level._id_115C6["axis"] < 1 && level._id_115C6["allies"] > 0 && game["state"] == "playing" )
            {
                thread _id_C530( "allies" );
                return;
            }

            if ( level._id_115C6["axis"] > 0 && level._id_115C6["allies"] > 0 )
            {
                level._id_72F2 = undefined;
                level notify( "abort_forfeit" );
            }
        }
        else
        {
            if ( level._id_115C6["allies"] + level._id_115C6["axis"] == 1 && level._id_B4BC > 1 )
            {
                thread _id_C530();
                return;
            }

            if ( level._id_115C6["axis"] + level._id_115C6["allies"] > 1 )
            {
                level._id_72F2 = undefined;
                level notify( "abort_forfeit" );
            }
        }
    }

    if ( !scripts\mp\utility\game::getgametypenumlives() && ( !isdefined( level._id_5611 ) || !level._id_5611 ) )
        return;

    if ( !scripts\mp\utility\game::_id_7672() )
        return;

    if ( level.ingraceperiod )
        return;

    if ( level._id_BDCC )
        return;

    if ( level.teambased )
    {
        var_3["allies"] = 0;
        var_3["axis"] = 0;

        foreach ( var_5 in level.players )
        {
            if ( var_5.team == "spectator" || !isdefined( var_5._id_8C2A ) || isdefined( var_5._id_8C2A ) && !var_5._id_8C2A )
                continue;

            var_3[var_5.team] += var_5.pers["lives"];
        }

        if ( scripts\mp\utility\game::istrue( level._id_5611 ) )
        {
            var_3["allies"] = 0;
            var_3["axis"] = 0;
        }

        if ( !level._id_1BE6["allies"] && !level._id_1BE6["axis"] && !var_3["allies"] && !var_3["axis"] )
            return [[ level._id_C4E8 ]]( "all" );

        if ( !level._id_1BE6["allies"] && !var_3["allies"] )
            return [[ level._id_C4E8 ]]( "allies" );

        if ( !level._id_1BE6["axis"] && !var_3["axis"] )
            return [[ level._id_C4E8 ]]( "axis" );

        var_7 = level._id_1BE6["allies"] == 1;
        var_8 = level._id_1BE6["axis"] == 1;

        if ( var_7 || var_8 )
        {
            var_9 = 0;
            var_10 = undefined;

            if ( var_7 )
            {
                foreach ( var_5 in level.players )
                {
                    if ( var_5.team == "allies" )
                    {
                        if ( !isalive( var_5 ) )
                            var_9 += var_5.pers["lives"];
                    }
                }

                if ( var_9 == 0 )
                {
                    if ( !isdefined( level._id_C50B["allies"] ) || gettime() > level._id_C50B["allies"] + 5000 )
                    {
                        level._id_C50B["allies"] = gettime();
                        var_13 = [[ level._id_C564 ]]( "allies" );

                        if ( isdefined( var_13 ) )
                        {
                            if ( !isdefined( var_10 ) )
                                var_10 = var_13;

                            var_10 = var_10 || var_13;
                        }
                    }
                }
            }

            if ( var_8 )
            {
                foreach ( var_5 in level.players )
                {
                    if ( var_5.team == "axis" )
                    {
                        if ( !isalive( var_5 ) )
                            var_9 += var_5.pers["lives"];
                    }
                }

                if ( var_9 == 0 )
                {
                    if ( !isdefined( level._id_C50B["axis"] ) || gettime() > level._id_C50B["axis"] + 5000 )
                    {
                        level._id_C50B["axis"] = gettime();
                        var_16 = [[ level._id_C564 ]]( "axis" );

                        if ( isdefined( var_16 ) )
                        {
                            if ( !isdefined( var_10 ) )
                                var_10 = var_16;

                            var_10 = var_10 || var_16;
                        }
                    }
                }
            }

            return var_10;
            return;
        }
    }
    else
    {
        var_3 = 0;

        foreach ( var_5 in level.players )
        {
            if ( var_5.team == "spectator" )
                continue;

            var_3 += var_5.pers["lives"];
        }

        if ( !level._id_1BE6["allies"] && !level._id_1BE6["axis"] && !var_3 )
            return [[ level._id_C4E8 ]]( "all" );

        var_19 = scripts\mp\utility\game::_id_808A();

        if ( var_19.size == 1 )
            return [[ level._id_C564 ]]( "all" );
    }
}

_id_13830()
{
    if ( !isdefined( level._id_6C6F ) )
        return 0;

    level waittill( "final_killcam_done" );
    return 1;
}

_id_118F8( var_0 )
{
    setgameendtime( gettime() + int( var_0 * 1000 ) );
    var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_1 hide();

    if ( var_0 >= 10.0 )
        wait( var_0 - 10.0 );

    for (;;)
    {
        var_1 playsound( "ui_mp_timer_countdown" );
        wait 1.0;
    }
}

_id_136D7( var_0 )
{
    var_1 = gettime();
    var_2 = var_1 + var_0 * 1000 - 200;

    if ( var_0 > 5 )
        var_3 = gettime() + getdvarint( "min_wait_for_players" ) * 1000;
    else
        var_3 = 0;

    var_4 = level._id_4533 / 3;

    for (;;)
    {
        if ( isdefined( game["roundsPlayed"] ) && game["roundsPlayed"] )
            break;

        var_5 = level._id_B4BC;
        var_6 = gettime();

        if ( var_5 >= var_4 && var_6 > var_3 || var_6 > var_2 )
            break;

        wait 0.05;
    }
}

_id_D84D()
{
    level endon( "game_ended" );
    level._id_4533 = getdvarint( "party_partyPlayerCountNum" );

    if ( level._id_D84D > 0 )
        _id_B415();
    else
        _id_B414();

    scripts\mp\hostmigration::waittillhostmigrationdone();

    foreach ( var_1 in level.players )
    {
        scripts\mp\playerlogic::_id_41D1( var_1 );
        var_1 scripts\mp\utility\game::_id_7385( 0, 1 );

        if ( !isdefined( var_1.pers["team"] ) )
            continue;

        var_2 = var_1.pers["team"];
        var_3 = scripts\mp\utility\game::_id_801A( var_2 );

        if ( !isdefined( var_3 ) || !var_1._id_8C2A )
            continue;

        var_4 = 0;

        if ( game["defenders"] == var_2 )
            var_4 = 1;

        var_1 setclientomnvar( "ui_objective_text", var_4 );
    }

    if ( game["state"] != "playing" )
        return;
}

_id_8487()
{
    level endon( "game_ended" );

    if ( !isdefined( game["clientActive"] ) )
    {
        while ( getactiveclientcount() == 0 )
            wait 0.05;

        game["clientActive"] = 1;
    }

    while ( level.ingraceperiod > 0 )
    {
        wait 1.0;
        level.ingraceperiod--;
    }

    level notify( "grace_period_ending" );
    wait 0.05;
    scripts\mp\utility\game::_id_766F( "graceperiod_done" );
    level.ingraceperiod = 0;

    if ( game["state"] != "playing" )
        return;

    if ( scripts\mp\utility\game::getgametypenumlives() )
    {
        var_0 = level.players;

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            var_2 = var_0[var_1];

            if ( !var_2._id_8C2A && var_2._id_0291 != "spectator" && !isalive( var_2 ) )
                var_2._id_02C7 = "hud_status_dead";
        }
    }

    level thread _id_12E9D();
}

_id_F73B( var_0, var_1 )
{
    var_0._id_8BE9 = var_1;
    var_2 = !scripts\mp\utility\game::istrue( var_0.pers["hasDoneAnyCombat"] );

    if ( var_2 && var_1 )
    {
        var_0.pers["hasDoneAnyCombat"] = 1;

        if ( isdefined( var_0.pers["hasMatchLoss"] ) && var_0.pers["hasMatchLoss"] )
            return;

        _id_12EC3( var_0 );
    }
}

_id_12F66( var_0 )
{
    if ( !var_0 scripts\mp\utility\game::_id_DCD5() )
        return;

    if ( !scripts\mp\utility\game::istrue( var_0.pers["hasDoneAnyCombat"] ) )
        return;

    if ( scripts\mp\utility\game::istrue( var_0.pers["recordedLoss"] ) )
        var_0 scripts\mp\persistence::_id_10E12( "losses", -1 );

    var_0 scripts\mp\persistence::_id_10E12( "wins", 1 );
    var_0 scripts\mp\utility\game::updatepersratio( "winLossRatio", "wins", "losses" );
    var_0 scripts\mp\persistence::_id_10E12( "currentWinStreak", 1 );
    var_1 = var_0 scripts\mp\persistence::_id_10E33( "currentWinStreak" );

    if ( var_1 > var_0 scripts\mp\persistence::_id_10E33( "winStreak" ) )
        var_0 scripts\mp\persistence::_id_10E54( "winStreak", var_1 );

    var_0 scripts\mp\persistence::statsetchild( "round", "win", 1 );
    var_0 scripts\mp\persistence::statsetchild( "round", "loss", 0 );
}

_id_12EC3( var_0 )
{
    if ( !var_0 scripts\mp\utility\game::_id_DCD5() )
        return;

    if ( !scripts\mp\utility\game::istrue( var_0.pers["hasDoneAnyCombat"] ) )
        return;

    var_0.pers["hasMatchLoss"] = 1;

    if ( !scripts\mp\utility\game::istrue( self._id_A49D ) )
    {
        var_0 scripts\mp\persistence::_id_10E12( "losses", 1 );
        var_0 scripts\mp\utility\game::updatepersratio( "winLossRatio", "wins", "losses" );
        var_0.pers["recordedLoss"] = 1;
    }

    var_0 scripts\mp\persistence::_id_10E12( "gamesPlayed", 1 );
    var_0 scripts\mp\persistence::statsetchild( "round", "loss", 1 );
}

_id_12F42( var_0 )
{
    if ( !var_0 scripts\mp\utility\game::_id_DCD5() )
        return;

    if ( !scripts\mp\utility\game::istrue( var_0.pers["hasDoneAnyCombat"] ) )
        return;

    if ( scripts\mp\utility\game::istrue( var_0.pers["recordedLoss"] ) )
    {
        var_0 scripts\mp\persistence::_id_10E12( "losses", -1 );
        var_0 scripts\mp\persistence::_id_10E54( "currentWinStreak", 0 );
    }

    var_0 scripts\mp\persistence::_id_10E12( "ties", 1 );
    var_0 scripts\mp\utility\game::updatepersratio( "winLossRatio", "wins", "losses" );
    var_0 scripts\mp\persistence::statsetchild( "round", "loss", 0 );
}

_id_12F65( var_0 )
{
    if ( scripts\mp\utility\game::_id_D957() )
        return;

    if ( !scripts\mp\utility\game::_id_13916() )
        return;

    level.processedwinloss = 1;
    var_1 = level.players;

    foreach ( var_3 in level.players )
    {
        if ( !isdefined( var_3 ) || !var_3 scripts\mp\utility\game::_id_DCD5() )
            continue;

        if ( isai( var_3 ) )
            continue;

        var_3 _meth_817A( "MP_ACHIEVEMENT_1" );
    }

    _id_12EF0();

    if ( !isdefined( var_0 ) || isdefined( var_0 ) && isstring( var_0 ) && var_0 == "tie" )
    {
        foreach ( var_3 in level.players )
        {
            if ( isdefined( var_3._id_4530 ) )
                continue;

            if ( level._id_90A1 && var_3 ishost() )
            {
                var_3 scripts\mp\persistence::_id_10E54( "currentWinStreak", 0 );
                continue;
            }

            _id_12F42( var_3 );
        }
    }
    else if ( isplayer( var_0 ) )
    {
        if ( level._id_90A1 && var_0 ishost() )
        {
            var_0 scripts\mp\persistence::_id_10E54( "currentWinStreak", 0 );
            return;
        }

        for ( var_7 = 0; var_7 < min( level.placement["all"].size, 3 ); var_7++ )
            _id_12F66( level.placement["all"][var_7] );
    }
    else if ( isstring( var_0 ) )
    {
        foreach ( var_3 in level.players )
        {
            if ( isdefined( var_3._id_4530 ) )
                continue;

            if ( level._id_90A1 && var_3 ishost() )
            {
                var_3 scripts\mp\persistence::_id_10E54( "currentWinStreak", 0 );
                continue;
            }

            if ( var_0 == "tie" )
            {
                _id_12F42( var_3 );
                continue;
            }

            if ( var_3.pers["team"] == var_0 )
            {
                _id_12F66( var_3 );
                continue;
            }

            if ( scripts\mp\utility\game::istrue( var_3.pers["recordedLoss"] ) )
                var_3 scripts\mp\persistence::_id_10E54( "currentWinStreak", 0 );
        }
    }
}

_id_12EF0()
{
    if ( level.gametype != "infect" )
        return;

    foreach ( var_1 in level.players )
    {
        if ( var_1.sessionstate == "spectator" && !var_1._id_02B0 )
            continue;
        else if ( scripts\mp\utility\game::istrue( var_1.pers["hasDoneAnyCombat"] ) )
            continue;
        else if ( var_1.team == "axis" )
            continue;
        else
            var_1 _id_F73B( var_1, 1 );
    }
}

_id_7386( var_0 )
{
    self endon( "disconnect" );
    scripts\mp\utility\game::_id_41C5();

    if ( !isdefined( var_0 ) )
        var_0 = 0.05;

    wait( var_0 );
    scripts\mp\utility\game::_id_7385( 1 );
}

_id_12ECA( var_0 )
{
    if ( !game["timePassed"] )
        return;

    if ( !scripts\mp\utility\game::matchmakinggame() )
        return;

    if ( !scripts\mp\utility\game::_id_81CA() || level._id_72B3 )
    {
        var_1 = scripts\mp\utility\game::_id_81CB() / 1000;
        var_1 = min( var_1, 1200 );
    }
    else
        var_1 = scripts\mp\utility\game::_id_81CA() * 60;

    if ( level.teambased )
    {
        if ( var_0 == "allies" )
        {
            var_2 = "allies";
            var_3 = "axis";
        }
        else if ( var_0 == "axis" )
        {
            var_2 = "axis";
            var_3 = "allies";
        }
        else
        {
            var_2 = "tie";
            var_3 = "tie";
        }

        if ( var_2 != "tie" )
            setwinningteam( var_2 );

        foreach ( var_5 in level.players )
        {
            if ( isdefined( var_5._id_4530 ) )
                continue;

            if ( !var_5 scripts\mp\utility\game::_id_DCD5() )
                continue;

            if ( var_5._id_1190E["total"] < 1 || var_5.pers["participation"] < 1 )
                continue;

            if ( level._id_90A1 && var_5 ishost() )
                continue;

            if ( !scripts\mp\utility\game::istrue( var_5.pers["hasDoneAnyCombat"] ) )
                continue;

            if ( var_2 == "tie" )
            {
                var_6 = var_5 _id_3716( "tie", var_1 );
                var_5 thread _id_837D( "tie", var_6 );
                var_5._id_B3DD = var_6;
                continue;
            }

            if ( isdefined( var_5.pers["team"] ) && var_5.pers["team"] == var_2 )
            {
                var_6 = var_5 _id_3716( "win", var_1 );
                var_5 thread _id_837D( "win", var_6 );
                var_5._id_B3DD = var_6;
                continue;
            }

            if ( isdefined( var_5.pers["team"] ) && var_5.pers["team"] == var_3 )
            {
                var_6 = var_5 _id_3716( "loss", var_1 );
                var_5 thread _id_837D( "loss", var_6 );
                var_5._id_B3DD = var_6;
            }
        }
    }
    else
    {
        var_8 = "win";
        var_9 = "loss";

        if ( !isdefined( var_0 ) )
        {
            var_8 = "tie";
            var_9 = "tie";
        }

        foreach ( var_5 in level.players )
        {
            if ( isdefined( var_5._id_4530 ) )
                continue;

            if ( var_5._id_1190E["total"] < 1 || var_5.pers["participation"] < 1 )
                continue;

            if ( !scripts\mp\utility\game::istrue( var_5.pers["hasDoneAnyCombat"] ) )
                continue;

            var_11 = 0;

            for ( var_12 = 0; var_12 < min( level.placement["all"].size, 3 ); var_12++ )
            {
                if ( level.placement["all"][var_12] != var_5 )
                    continue;

                var_11 = 1;
            }

            if ( var_11 )
            {
                var_6 = var_5 _id_3716( var_8, var_1 );
                var_5 thread _id_837D( "win", var_6 );
                var_5._id_B3DD = var_6;
                continue;
            }

            var_6 = var_5 _id_3716( var_9, var_1 );
            var_5 thread _id_837D( "loss", var_6 );
            var_5._id_B3DD = var_6;
        }
    }
}

_id_3716( var_0, var_1 )
{
    var_2 = scripts\mp\rank::getscoreinfovalue( var_0 );
    var_3 = scripts\mp\rank::_id_7F8F();
    var_4 = var_1 / 60 * var_3;
    var_5 = self._id_1190E["total"] / var_1;
    var_6 = int( var_2 * var_4 * var_5 );
    return var_6;
}

_id_837D( var_0, var_1 )
{
    self endon( "disconnect" );
    level waittill( "give_match_bonus" );
    scripts\mp\rank::_id_839A( var_0, var_1 );

    if ( scripts\mp\utility\game::_id_13916() )
    {
        if ( var_0 == "win" )
            thread scripts\mp\awards::givemidmatchaward( "match_complete_win" );
        else
            thread scripts\mp\awards::givemidmatchaward( "match_complete" );
    }
}

_id_FB23( var_0 )
{
    var_1 = level.players;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( !isdefined( var_3.score ) || !isdefined( var_3.pers["team"] ) )
            continue;
    }

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( !isdefined( var_3.kills ) || !isdefined( var_3.deaths ) )
            continue;

        if ( 120 > var_3._id_1190E["total"] )
            continue;

        var_4 = ( var_3.kills - var_3.deaths ) / ( var_3._id_1190E["total"] / 60 );
        setplayerteamrank( var_3, var_3._id_41F0, var_4 );
    }
}

_id_3E54( var_0 )
{
    if ( isdefined( level._id_118FA ) && level._id_118FA )
        return;

    if ( game["state"] != "playing" )
    {
        setgameendtime( 0 );
        return;
    }

    runjiprules();

    if ( scripts\mp\utility\game::_id_81CA() <= 0 )
    {
        if ( isdefined( level._id_10DFF ) )
            setgameendtime( level._id_10DFF );
        else
            setgameendtime( 0 );

        return;
    }

    if ( !scripts\mp\utility\game::_id_766C( "prematch_done" ) )
    {
        setgameendtime( 0 );
        return;
    }

    if ( !isdefined( level._id_10DFF ) )
        return;

    var_1 = _id_81CD();
    setgameendtime( gettime() + int( var_1 ) );

    if ( var_1 > 0 )
        return;

    [[ level.ontimelimit ]]();
}

runjiprules()
{
    if ( !isdefined( level.nojip ) )
        level.nojip = 0;

    if ( !level.nojip )
    {
        if ( scripts\mp\utility\game::_id_9F32() && !level.nojip )
        {
            switch ( level.gametype )
            {
                case "front":
                case "dom":
                    var_0 = checkdomjiprules();
                    break;
                case "sd":
                case "sr":
                case "siege":
                    var_0 = checksdjiprules();
                    break;
                case "ctf":
                    var_0 = checkctfjiprules();
                    break;
                case "ball":
                    var_0 = checkballjiprules();
                    break;
                case "dd":
                    var_0 = checkddjiprules();
                    break;
                default:
                    var_0 = checkdefaultjiprules();
                    break;
            }

            if ( var_0 )
            {
                setnojiptime( 1 );
                level.nojip = 1;
                return;
            }
        }
        else if ( scripts\mp\utility\game::_id_81CC() > level._id_1190B )
        {
            setnojiptime( 1 );
            level.nojip = 1;
        }
    }
}

checkdomjiprules()
{
    if ( !scripts\mp\utility\game::_id_9DF6() )
    {
        if ( getteamscoreint( "axis" ) > 150 || getteamscoreint( "allies" ) > 150 )
            return 1;

        if ( scripts\mp\utility\game::_id_81CC() > 75 )
            return 1;
    }

    return 0;
}

checksdjiprules()
{
    var_0 = scripts\mp\utility\game::_id_80F9( "axis" );
    var_1 = scripts\mp\utility\game::_id_80F9( "allies" );
    var_2 = 3;

    if ( scripts\mp\utility\game::_id_9D46() )
        var_2 = 5;

    if ( var_0 >= var_2 || var_1 >= var_2 )
        return 1;

    return 0;
}

checkctfjiprules()
{
    if ( !scripts\mp\utility\game::_id_9DF6() )
    {
        if ( scripts\mp\utility\game::_id_81CC() > level._id_1190B )
            return 1;
    }

    var_0 = abs( getteamscoreint( "axis" ) - getteamscoreint( "allies" ) );

    if ( var_0 > 10 )
        return 1;

    return 0;
}

checkballjiprules()
{
    if ( !scripts\mp\utility\game::_id_9DF6() )
    {
        if ( scripts\mp\utility\game::_id_81CC() > level._id_1190B )
            return 1;
    }

    var_0 = abs( getteamscoreint( "axis" ) - getteamscoreint( "allies" ) );

    if ( var_0 > 15 )
        return 1;

    return 0;
}

checkddjiprules()
{
    var_0 = scripts\mp\utility\game::_id_80F9( "axis" );
    var_1 = scripts\mp\utility\game::_id_80F9( "allies" );

    if ( var_0 + var_1 >= 3 )
        return 1;

    return 0;
}

checkdefaultjiprules()
{
    if ( scripts\mp\utility\game::_id_BFA7() )
    {
        if ( scripts\mp\utility\game::_id_81CC() > level._id_1190B )
            return 1;
    }

    return 0;
}

getteamscoreint( var_0 )
{
    return int( game["teamScores"][var_0] );
}

_id_81CD()
{
    return scripts\mp\utility\game::_id_81CA() * 60 * 1000 - scripts\mp\utility\game::_id_81CB();
}

_id_81CE()
{
    var_0 = scripts\mp\utility\game::_id_81CA() * 60 * 1000;
    return ( var_0 - scripts\mp\utility\game::_id_81CB() ) / var_0;
}

_id_3E53( var_0 )
{
    if ( level._id_E763 <= 0 || scripts\mp\utility\game::_id_9EBD() )
        return;

    if ( isdefined( level._id_EC3C ) && level._id_EC3C )
        return;

    if ( level.gametype == "conf" || level.gametype == "jugg" )
        return;

    if ( !level.teambased )
        return;

    level._id_CF33 = 0;
    var_1 = 0;

    if ( level.gametype == "dom" || level.gametype == "tdef" )
        var_1 = _id_42AC( var_0 );
    else if ( scripts\mp\utility\game::_id_81CB() > 60000 )
        var_1 = _id_6747( var_0 ) < 1;

    if ( !level._id_CF33 && var_1 )
    {
        level._id_CF33 = 1;
        level notify( "match_ending_soon", "score" );
    }

    if ( !level._id_CF33 && scripts\mp\utility\game::_id_38F3() )
    {
        if ( getteamscore( var_0 ) >= int( level._id_EC3B * level._id_4BFF - level._id_EC3B / 2 ) )
        {
            scripts\mp\utility\game::_id_AAE7( "halfway_friendly_boost", var_0, "status" );
            scripts\mp\utility\game::_id_AAE7( "halfway_enemy_boost", scripts\mp\utility\game::_id_8027( var_0 ), "status" );
            level._id_54BB = 1;
        }
    }
}

checkplayerscorelimitsoon()
{
    if ( level._id_E763 <= 0 || scripts\mp\utility\game::_id_9EBD() )
        return;

    if ( level.teambased )
        return;

    if ( scripts\mp\utility\game::_id_81CB() < 60000 )
        return;

    if ( level.gametype == "gun" )
    {
        if ( self.score == 14 )
            level notify( "match_ending_soon", "score" );
    }
    else
    {
        var_0 = _id_6747();

        if ( var_0 < 2 )
            level notify( "match_ending_soon", "score" );
    }
}

checkscorelimit( var_0 )
{
    if ( scripts\mp\utility\game::cantiebysimultaneouskill() )
        var_0 = 1;

    if ( scripts\mp\utility\game::istrue( var_0 ) )
    {
        level notify( "checkScoreLimit" );
        level endon( "checkScoreLimit" );
        scripts\engine\utility::waitframe();
    }

    if ( scripts\mp\utility\game::_id_9EBD() )
        return 0;

    if ( isdefined( level._id_EC3C ) && level._id_EC3C )
        return 0;

    if ( game["state"] != "playing" )
        return 0;

    if ( level._id_E763 <= 0 )
        return 0;

    var_1 = 0;

    if ( level.teambased )
    {
        for ( var_2 = 0; var_2 < level._id_115DA.size; var_2++ )
        {
            if ( game["teamScores"][level._id_115DA[var_2]] >= level._id_E763 )
            {
                var_1 = 1;
                break;
            }
        }
    }
    else
    {
        foreach ( var_4 in level.players )
        {
            if ( var_4.score >= level._id_E763 )
            {
                var_1 = 1;
                break;
            }
        }
    }

    if ( !var_1 )
        return 0;

    return _id_C587( var_0 );
}

updategametypedvars()
{
    level endon( "game_ended" );

    while ( game["state"] == "playing" )
    {
        if ( isdefined( level._id_10DFF ) )
        {
            if ( _id_81CD() < 3000 )
            {
                wait 0.1;
                continue;
            }
        }

        wait 1;
    }
}

_id_B415()
{
    thread _id_B412( "match_starting_in", level._id_D84D + level._id_D84E );
    _id_136D7( level._id_D84D );

    if ( level._id_D84E > 0 && !isdefined( level._id_90A9 ) )
    {
        var_0 = level._id_D84E;

        if ( scripts\mp\utility\game::_id_9F32() && !scripts\mp\utility\game::_id_9DF6() || scripts\mp\utility\game::_id_9EA6() )
            var_0 = level._id_D84D;

        level notify( "match_start_real_countdown", var_0 );
        _id_B412( "match_starting_in", var_0 );
    }
}

_id_B413( var_0 )
{
    waittillframeend;
    level endon( "match_start_timer_beginning" );

    while ( var_0 > 0 && !level._id_7669 )
    {
        setomnvar( "ui_match_start_countdown", var_0 );

        if ( var_0 == 0 )
            visionsetnaked( "", 0 );

        var_0--;
        wait 1.0;
    }

    setomnvar( "ui_match_start_countdown", 0 );
}

_id_B412( var_0, var_1 )
{
    self notify( "matchStartTimer" );
    self endon( "matchStartTimer" );
    level notify( "match_start_timer_beginning" );
    var_2 = int( var_1 );

    if ( var_2 >= 2 )
    {
        setomnvar( "ui_match_start_text", var_0 );
        _id_B413( var_2 );
    }

    visionsetnaked( "", 0.0 );
}

_id_B414()
{
    visionsetnaked( "", 0 );
}

_id_C585( var_0 )
{
    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( var_0 )
    {
        level._id_8865 = "overtime";

        if ( scripts\mp\utility\game::_id_9E74() )
        {
            var_1 = _id_7E07();

            if ( var_1 != game["defenders"] )
            {
                game["switchedsides"] = !game["switchedsides"];
                level._id_11374 = 1;
                return;
            }

            level._id_11374 = undefined;
            return;
        }
        else
        {
            game["switchedsides"] = !game["switchedsides"];
            level._id_11374 = 1;
        }
    }
    else
    {
        level._id_8865 = "halftime";
        game["switchedsides"] = !game["switchedsides"];
        level._id_11374 = 1;
    }
}

_id_3E43( var_0 )
{
    if ( !level.teambased )
        return 0;

    if ( !isdefined( level._id_E765 ) || !level._id_E765 )
        return 0;

    if ( game["roundsPlayed"] % level._id_E765 == 0 || var_0 )
    {
        _id_C585( var_0 );
        return 1;
    }

    return 0;
}

_id_11939()
{
    if ( level._id_7669 )
    {
        var_0 = ( gettime() - level._id_766B ) / 1000;
        var_1 = level._id_D706 - var_0;

        if ( var_1 < 0 )
            return 0;

        return var_1;
    }

    if ( scripts\mp\utility\game::_id_81CA() <= 0 )
        return undefined;

    if ( !isdefined( level._id_10DFF ) )
        return undefined;

    var_2 = scripts\mp\utility\game::_id_81CA();
    var_0 = ( gettime() - level._id_10DFF ) / 1000;
    var_1 = level._id_561F / 1000 + scripts\mp\utility\game::_id_81CA() * 60 - var_0;

    if ( isdefined( level._id_11909 ) )
        var_1 += level._id_11909;

    return var_1 + level._id_D706;
}

_id_736F()
{
    if ( isdefined( self._id_CA52 ) )
    {
        if ( isdefined( self._id_CA52[0] ) )
        {
            self._id_CA52[0] scripts\mp\hud_util::_id_52DC();
            self._id_CA53[0] scripts\mp\hud_util::_id_52DC();
        }

        if ( isdefined( self._id_CA52[1] ) )
        {
            self._id_CA52[1] scripts\mp\hud_util::_id_52DC();
            self._id_CA53[1] scripts\mp\hud_util::_id_52DC();
        }

        if ( isdefined( self._id_CA52[2] ) )
        {
            self._id_CA52[2] scripts\mp\hud_util::_id_52DC();
            self._id_CA53[2] scripts\mp\hud_util::_id_52DC();
        }
    }

    self notify( "perks_hidden" );

    if ( !level._id_5828 )
    {
        self._id_B0DE scripts\mp\hud_util::_id_52DC();
        self._id_B0E7 scripts\mp\hud_util::_id_52DC();
    }

    if ( isdefined( self._id_DAAE ) )
        self._id_DAAE scripts\mp\hud_util::_id_52DC();

    if ( isdefined( self._id_DAAF ) )
        self._id_DAAF scripts\mp\hud_util::_id_52DC();
}

_id_7F07()
{
    var_0 = getentarray( "player", "classname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( var_0[var_1] ishost() )
            return var_0[var_1];
    }
}

_id_90A2()
{
    var_0 = _id_7F07();

    if ( isdefined( var_0 ) && !var_0._id_8C2A && !isdefined( var_0._id_F1BA ) )
        return 1;

    return 0;
}

_id_E761( var_0, var_1 )
{
    var_2 = 0;

    while ( !var_2 )
    {
        var_3 = level.players;
        var_2 = 1;

        foreach ( var_5 in var_3 )
        {
            if ( !var_5 scripts\mp\hud_message::_id_9DC6() )
                continue;

            var_2 = 0;
        }

        wait 0.5;
    }

    if ( !level._id_5828 )
        setomnvarforallclients( "post_game_state", 2 );

    foreach ( var_5 in level.players )
        var_5 thread scripts\mp\utility\game::_id_F8A0( 0.0 );

    if ( !var_1 )
        wait( var_0 );
    else
    {
        wait( var_0 / 2 );
        level notify( "give_match_bonus" );
        wait( var_0 / 2 );
        var_2 = 0;

        while ( !var_2 )
        {
            var_3 = level.players;
            var_2 = 1;

            foreach ( var_5 in var_3 )
            {
                if ( !var_5 scripts\mp\hud_message::_id_9DC6() )
                    continue;

                var_2 = 0;
            }

            wait 0.5;
        }
    }

    setomnvarforallclients( "post_game_state", 1 );
    level notify( "round_end_finished" );
}

_id_E760( var_0 )
{
    self setdepthoffield( 0, 128, 512, 4000, 6, 1.8 );
}

initwaypointbackgrounds()
{
    level.waypointcolors["koth_enemy"] = "enemy";
    level.waypointbgtype["koth_enemy"] = 2;
    level.waypointcolors["koth_friendly"] = "friendly";
    level.waypointbgtype["koth_friendly"] = 2;
    level.waypointcolors["koth_neutral"] = "neutral";
    level.waypointbgtype["koth_neutral"] = 2;
    level.waypointcolors["waypoint_hardpoint_contested"] = "contest";
    level.waypointbgtype["waypoint_hardpoint_contested"] = 2;
    level.waypointcolors["waypoint_hardpoint_losing"] = "contest";
    level.waypointbgtype["waypoint_hardpoint_losing"] = 2;
    level.waypointcolors["waypoint_hardpoint_target"] = "neutral";
    level.waypointbgtype["waypoint_hardpoint_target"] = 2;
    level.waypointcolors["waypoint_taking_chevron"] = "contest";
    level.waypointbgtype["waypoint_taking_chevron"] = 2;
    level.waypointcolors["waypoint_ball_download"] = "neutral";
    level.waypointbgtype["waypoint_ball_download"] = 1;
    level.waypointcolors["waypoint_ball_pass"] = "friendly";
    level.waypointbgtype["waypoint_ball_pass"] = 1;
    level.waypointcolors["waypoint_ball_upload"] = "neutral";
    level.waypointbgtype["waypoint_ball_upload"] = 1;
    level.waypointcolors["waypoint_neutral_ball"] = "neutral";
    level.waypointbgtype["waypoint_neutral_ball"] = 1;
    level.waypointcolors["waypoint_capture_a"] = "enemy";
    level.waypointbgtype["waypoint_capture_a"] = 2;
    level.waypointcolors["waypoint_capture_b"] = "enemy";
    level.waypointbgtype["waypoint_capture_b"] = 2;
    level.waypointcolors["waypoint_capture_c"] = "enemy";
    level.waypointbgtype["waypoint_capture_c"] = 2;
    level.waypointcolors["waypoint_defend_a"] = "friendly";
    level.waypointbgtype["waypoint_defend_a"] = 2;
    level.waypointcolors["waypoint_defend_b"] = "friendly";
    level.waypointbgtype["waypoint_defend_b"] = 2;
    level.waypointcolors["waypoint_defend_c"] = "friendly";
    level.waypointbgtype["waypoint_defend_c"] = 2;
    level.waypointcolors["waypoint_losing_a"] = "contest";
    level.waypointbgtype["waypoint_losing_a"] = 2;
    level.waypointcolors["waypoint_losing_b"] = "contest";
    level.waypointbgtype["waypoint_losing_b"] = 2;
    level.waypointcolors["waypoint_losing_c"] = "contest";
    level.waypointbgtype["waypoint_losing_c"] = 2;
    level.waypointcolors["waypoint_bomb"] = "neutral";
    level.waypointbgtype["waypoint_bomb"] = 2;
    level.waypointcolors["waypoint_bomb_defusing"] = "contest";
    level.waypointbgtype["waypoint_bomb_defusing"] = 2;
    level.waypointcolors["waypoint_bomb_planting"] = "contest";
    level.waypointbgtype["waypoint_bomb_planting"] = 2;
    level.waypointcolors["waypoint_defuse_a"] = "enemy";
    level.waypointbgtype["waypoint_defuse_a"] = 2;
    level.waypointcolors["waypoint_defuse_b"] = "enemy";
    level.waypointbgtype["waypoint_defuse_b"] = 2;
    level.waypointcolors["waypoint_bank_a"] = "neutral";
    level.waypointbgtype["waypoint_bank_a"] = 2;
    level.waypointcolors["waypoint_bank_b"] = "neutral";
    level.waypointbgtype["waypoint_bank_b"] = 2;
    level.waypointcolors["waypoint_blitz_defend"] = "friendly";
    level.waypointbgtype["waypoint_blitz_defend"] = 2;
    level.waypointcolors["waypoint_blitz_defend_round"] = "friendly";
    level.waypointbgtype["waypoint_blitz_defend_round"] = 1;
    level.waypointcolors["waypoint_defend_round"] = "friendly";
    level.waypointbgtype["waypoint_defend_round"] = 1;
    level.waypointcolors["waypoint_blitz_goal"] = "enemy";
    level.waypointbgtype["waypoint_blitz_goal"] = 2;
    level.waypointcolors["waypoint_uplink_contested"] = "contest";
    level.waypointbgtype["waypoint_uplink_contested"] = 2;
    level.waypointcolors["waypoint_dogtags"] = "enemy";
    level.waypointcolors["waypoint_dogtags_friendlys"] = "friendly";
    level.waypointcolors["waypoint_taking_flag"] = "contest";
    level.waypointbgtype["waypoint_taking_flag"] = 2;
    level.waypointcolors["waypoint_capture_kill"] = "enemy";
    level.waypointbgtype["waypoint_capture_kill"] = 2;
    level.waypointcolors["waypoint_capture_kill_round"] = "enemy";
    level.waypointbgtype["waypoint_capture_kill_round"] = 1;
    level.waypointcolors["waypoint_capture_recover"] = "friendly";
    level.waypointbgtype["waypoint_capture_recover"] = 2;
    level.waypointcolors["waypoint_capture_take"] = "enemy";
    level.waypointbgtype["waypoint_capture_take"] = 2;
    level.waypointcolors["waypoint_captureneutral_a"] = "neutral";
    level.waypointbgtype["waypoint_captureneutral_a"] = 2;
    level.waypointcolors["waypoint_captureneutral_b"] = "neutral";
    level.waypointbgtype["waypoint_captureneutral_b"] = 2;
    level.waypointcolors["waypoint_captureneutral_c"] = "neutral";
    level.waypointbgtype["waypoint_captureneutral_c"] = 2;
    level.waypointcolors["waypoint_contested_a"] = "contest";
    level.waypointbgtype["waypoint_contested_a"] = 2;
    level.waypointcolors["waypoint_contested_b"] = "contest";
    level.waypointbgtype["waypoint_contested_b"] = 2;
    level.waypointcolors["waypoint_contested_c"] = "contest";
    level.waypointbgtype["waypoint_contested_c"] = 2;
    level.waypointcolors["waypoint_escort"] = "friendly";
    level.waypointbgtype["waypoint_escort"] = 1;
    level.waypointcolors["waypoint_reset_marker"] = "contest";
    level.waypointbgtype["waypoint_reset_marker"] = 2;
    level.waypointcolors["waypoint_returning_flag"] = "contest";
    level.waypointbgtype["waypoint_returning_flag"] = 2;
    level.waypointcolors["waypoint_scoring_foe_a"] = "enemy";
    level.waypointbgtype["waypoint_scoring_foe_a"] = 2;
    level.waypointcolors["waypoint_scoring_foe_b"] = "enemy";
    level.waypointbgtype["waypoint_scoring_foe_b"] = 2;
    level.waypointcolors["waypoint_scoring_friend_a"] = "friendly";
    level.waypointbgtype["waypoint_scoring_friend_a"] = 2;
    level.waypointcolors["waypoint_scoring_friend_b"] = "friendly";
    level.waypointbgtype["waypoint_scoring_friend_b"] = 2;
    level.waypointcolors["waypoint_taking_a"] = "contest";
    level.waypointbgtype["waypoint_taking_a"] = 2;
    level.waypointcolors["waypoint_taking_b"] = "contest";
    level.waypointbgtype["waypoint_taking_b"] = 2;
    level.waypointcolors["waypoint_taking_c"] = "contest";
    level.waypointbgtype["waypoint_taking_c"] = 2;
    level.waypointcolors["waypoint_target_a"] = "enemy";
    level.waypointbgtype["waypoint_target_a"] = 2;
    level.waypointcolors["waypoint_target_b"] = "enemy";
    level.waypointbgtype["waypoint_target_b"] = 2;
}

callback_startgametype()
{
    scripts\mp\load::main();
    scripts\mp\utility\game::_id_ABF2( "round_over", 0 );
    scripts\mp\utility\game::_id_ABF2( "game_over", 0 );
    scripts\mp\utility\game::_id_ABF2( "block_notifies", 0 );
    scripts\mp\utility\game::_id_ABF2( "post_game_level_event_active", 0 );
    level._id_D84D = 0;
    level._id_D84E = 0;
    level._id_D701 = 0;
    level._id_018F = 0;
    setdvar( "bg_compassShowEnemies", getdvar( "scr_game_forceuav" ) );

    if ( scripts\mp\utility\game::matchmakinggame() )
        setdvar( "isMatchMakingGame", 1 );
    else
        setdvar( "isMatchMakingGame", 0 );

    if ( level._id_BDCC )
        setdvar( "ui_numteams", level._id_C246 );

    if ( !isdefined( game["gamestarted"] ) )
    {
        game["clientid"] = 0;
        game["truncated_killcams"] = 0;

        if ( !isdefined( game["attackers"] ) || !isdefined( game["defenders"] ) )
            thread scripts\engine\utility::_id_66BD( "No attackers or defenders team defined in level .gsc." );

        if ( !isdefined( game["attackers"] ) )
            game["attackers"] = "allies";

        if ( !isdefined( game["defenders"] ) )
            game["defenders"] = "axis";

        if ( !isdefined( game["state"] ) )
            game["state"] = "playing";

        game["allies"] = "UNSA";
        game["axis"] = "SDF";
        game["strings"]["press_to_spawn"] = &"PLATFORM_PRESS_TO_SPAWN";
        game["strings"]["spawn_next_round"] = &"MP_SPAWN_NEXT_ROUND";
        game["strings"]["spawn_flag_wait"] = &"MP_SPAWN_FLAG_WAIT";
        game["strings"]["spawn_point_capture_wait"] = &"MP_SPAWN_POINT_CAPTURE_WAIT";
        game["strings"]["spawn_tag_wait"] = &"MP_SPAWN_TAG_WAIT";
        game["strings"]["waiting_to_spawn"] = &"MP_WAITING_TO_SPAWN";
        game["strings"]["waiting_to_safespawn"] = &"MP_WAITING_TO_SAFESPAWN";
        game["strings"]["match_starting"] = &"MP_MATCH_STARTING";
        game["strings"]["change_class"] = &"MP_CHANGE_CLASS_NEXT_SPAWN";
        game["strings"]["change_rig"] = &"LUA_MENU_MP_CHANGE_RIG_NEXT_SPAWN";
        game["strings"]["last_stand"] = &"MPUI_LAST_STAND";
        game["strings"]["final_stand"] = &"MPUI_FINAL_STAND";
        game["strings"]["c4_death"] = &"MPUI_C4_DEATH";
        game["strings"]["must_select_loadout_to_spawn"] = &"MP_INGAME_ONLY_SELECT_LOADOUT_TO_SPAWN";
        game["strings"]["cowards_way"] = &"PLATFORM_COWARDS_WAY_OUT";
        game["colors"]["black"] = ( 0, 0, 0 );
        game["colors"]["white"] = ( 1, 1, 1 );
        game["colors"]["grey"] = ( 0.5, 0.5, 0.5 );
        game["colors"]["cyan"] = ( 0.35, 0.7, 0.9 );
        game["colors"]["orange"] = ( 0.9, 0.6, 0 );
        game["colors"]["blue"] = ( 0.2, 0.3, 0.7 );
        game["colors"]["red"] = ( 0.75, 0.25, 0.25 );
        game["colors"]["green"] = ( 0.25, 0.75, 0.25 );
        game["colors"]["yellow"] = ( 0.65, 0.65, 0 );
        game["strings"]["allies_name"] = scripts\mp\teams::_id_81B5( "allies" );
        game["icons"]["allies"] = scripts\mp\teams::_id_81B2( "allies" );
        game["colors"]["allies"] = scripts\mp\teams::_id_81A4( "allies" );
        game["strings"]["axis_name"] = scripts\mp\teams::_id_81B5( "axis" );
        game["icons"]["axis"] = scripts\mp\teams::_id_81B2( "axis" );
        game["colors"]["axis"] = scripts\mp\teams::_id_81A4( "axis" );
        game["colors"]["friendly"] = ( 0.258824, 0.639216, 0.87451 );
        game["colors"]["enemy"] = ( 0.929412, 0.231373, 0.141176 );
        game["colors"]["contest"] = ( 1, 0.858824, 0 );
        game["colors"]["neutral"] = ( 1, 1, 1 );
        initwaypointbackgrounds();

        if ( game["colors"]["allies"] == game["colors"]["black"] )
            game["colors"]["allies"] = game["colors"]["grey"];

        if ( game["colors"]["axis"] == game["colors"]["black"] )
            game["colors"]["axis"] = game["colors"]["grey"];

        [[ level.onprecachegametype ]]();
        setdvarifuninitialized( "min_wait_for_players", 5 );

        if ( level._id_4542 )
        {
            if ( !level._id_10A56 )
            {
                if ( scripts\mp\utility\game::_id_9EA6() || isdedicatedserver() )
                    level._id_D84D = scripts\mp\tweakables::_id_81E7( "game", "graceperiod_comp" );
                else
                    level._id_D84D = scripts\mp\tweakables::_id_81E7( "game", "graceperiod" );

                level._id_D84E = scripts\mp\tweakables::_id_81E7( "game", "matchstarttime" );
            }
        }
        else
        {
            if ( scripts\mp\utility\game::_id_9EA6() || isdedicatedserver() )
                level._id_D84D = scripts\mp\tweakables::_id_81E7( "game", "playerwaittime_comp" );
            else
                level._id_D84D = scripts\mp\tweakables::_id_81E7( "game", "playerwaittime" );

            level._id_D84E = scripts\mp\tweakables::_id_81E7( "game", "matchstarttime" );
        }

        setnojipscore( 0 );
        setnojiptime( 0 );
    }
    else
    {
        setdvarifuninitialized( "min_wait_for_players", 5 );

        if ( level._id_4542 )
        {
            if ( !level._id_10A56 )
            {
                level._id_D84D = 5;
                level._id_D84E = scripts\mp\tweakables::_id_81E7( "game", "matchstarttime" );
            }
        }
        else
        {
            level._id_D84D = 5;
            level._id_D84E = scripts\mp\tweakables::_id_81E7( "game", "matchstarttime" );
        }
    }

    if ( !isdefined( game["status"] ) )
        game["status"] = "normal";

    setdvar( "ui_overtime", scripts\mp\utility\game::_id_9900() );

    if ( game["status"] != "overtime" && game["status"] != "halftime" )
    {
        if ( !( isdefined( game["switchedsides"] ) && game["switchedsides"] == 1 && scripts\mp\utility\game::_id_9EA9() ) )
        {
            game["teamScores"]["allies"] = 0;
            game["teamScores"]["axis"] = 0;
        }

        if ( level._id_BDCC )
        {
            for ( var_0 = 0; var_0 < level._id_115DA.size; var_0++ )
                game["teamScores"][level._id_115DA[var_0]] = 0;
        }
    }

    if ( !isdefined( game["timePassed"] ) )
        game["timePassed"] = 0;

    if ( !isdefined( game["roundsPlayed"] ) )
        game["roundsPlayed"] = 0;

    if ( !isdefined( game["overtimeRoundsPlayed"] ) )
        game["overtimeRoundsPlayed"] = 0;

    if ( !isdefined( game["finalRound"] ) )
        game["finalRound"] = 0;

    setomnvar( "ui_last_round", game["finalRound"] );

    if ( !isdefined( game["roundsWon"] ) )
        game["roundsWon"] = [];

    if ( !isdefined( game["timeToBeat"] ) )
        game["timeToBeat"] = 0;

    if ( !isdefined( game["timeToBeatOld"] ) )
        game["timeToBeatOld"] = 0;

    if ( !isdefined( game["timeToBeatTeam"] ) )
        game["timeToBeatTeam"] = "none";

    if ( !isdefined( game["timeToBeatScore"] ) )
        game["timeToBeatScore"] = 0;

    if ( level.teambased )
    {
        if ( !isdefined( game["roundsWon"]["axis"] ) )
            game["roundsWon"]["axis"] = 0;

        if ( !isdefined( game["roundsWon"]["allies"] ) )
            game["roundsWon"]["allies"] = 0;

        if ( level._id_BDCC )
        {
            for ( var_0 = 0; var_0 < level._id_115DA.size; var_0++ )
            {
                if ( !isdefined( game["roundsWon"][level._id_115DA[var_0]] ) )
                    game["roundsWon"][level._id_115DA[var_0]] = 0;
            }
        }
    }

    level._id_7669 = 0;
    level._id_72B3 = 0;
    level._id_90A1 = 0;
    level._id_8B38 = getdvarint( "g_hardcore" );
    level.tactical = scripts\mp\utility\game::matchmakinggame() && getdvarint( "scr_tactical" ) || getdvarint( "scr_game_tacticalmode" );
    var_1 = scripts\mp\utility\game::_id_9D46() || level.tactical;
    setdvar( "disable_energy_bullet_ricochet", var_1 );

    if ( level.tactical )
    {
        level.modifyplayerdamage = scripts\mp\damage::gamemodemodifyplayerdamage;
        setdvar( "jump_slowdownEnable", 1 );
        setdvar( "sprintLeap_enabled", 0 );
        setdvar( "scr_" + level.gametype + "_doubleJump", 1 );
        setdvar( "scr_game_doubleJump", 1 );
        level._id_112C1 = 1;
    }

    if ( level._id_8B38 )
        logstring( "game mode: hardcore" );

    level._id_54CC = getdvarint( "scr_diehard" );
    level._id_3B1E = getdvarint( "scr_game_casualScoreStreaks" );

    if ( !isdefined( level._id_47EF ) )
        level._id_47EF = getdvarint( "scr_" + level.gametype + "_crankedBombTimer", 0 );

    level._id_112C0 = scripts\engine\utility::ter_op( getdvarint( "scr_" + level.gametype + "_crankedBombTimer" ) > 0, 1, 0 );

    if ( !level.teambased )
        level._id_54CC = 0;

    if ( level._id_54CC )
        logstring( "game mode: diehard" );

    level._id_1C98 = scripts\mp\utility\game::_id_803C( "scr_" + level.gametype + "_allowKillstreaks", "scr_game_allowKillstreaks" );
    level._id_1CA1 = scripts\mp\utility\game::_id_803C( "scr_" + level.gametype + "_allowPerks", "scr_game_allowPerks" );
    level._id_1CAA = scripts\mp\utility\game::_id_803C( "scr_" + level.gametype + "_allowSupers", "scr_game_allowSupers" );
    level._id_11260 = scripts\mp\utility\game::_id_803C( "scr_" + level.gametype + "_superFastChargeRate", "scr_game_superFastChargeRate" );
    level.superpointsmod = scripts\mp\utility\game::_id_803B( "scr_" + level.gametype + "_superPointsMod", "scr_game_superPointsMod" );

    if ( !level.tactical )
        level._id_112C1 = scripts\mp\utility\game::_id_803C( "scr_" + level.gametype + "_doubleJump", "scr_game_doubleJump" );

    level._id_112C6 = scripts\mp\utility\game::_id_803C( "scr_" + level.gametype + "_wallRun", "scr_game_wallRun" );
    level._id_10903 = scripts\mp\utility\game::_id_803B( "scr_" + level.gametype + "_spawnProtectionTimer", "scr_game_spawnProtectionTimer" );
    level._id_EC3D = [];
    level._id_EC3D["kill"] = getdvarint( "scr_" + level.gametype + "_pointsPerKill" );
    level._id_EC3D["death"] = getdvarint( "scr_" + level.gametype + "_pointsPerDeath" );
    level._id_EC3D["headshot"] = getdvarint( "scr_" + level.gametype + "_pointsHeadshotBonus" );
    level._id_B4A1 = 5;
    level._id_B4A0 = 32;
    level._id_130DD = 1;
    level._id_B47A = scripts\mp\utility\game::_id_803C( "scr_" + level.gametype + "_ffPunishLimit", "scr_game_ffPunishLimit" );
    thread _id_0AE1::init();
    thread scripts\mp\healthoverlay::init();
    thread scripts\mp\killcam::init();
    thread scripts\mp\finalkillcam::_id_9807();
    thread scripts\mp\battlechatter_mp::init();
    thread scripts\mp\music_and_dialog::init();
    thread [[ level._id_9994 ]]();
    thread scripts\mp\class::init();
    thread scripts\mp\persistence::init();
    thread scripts\mp\missions::init();
    thread scripts\mp\rank::init();
    thread scripts\mp\playercards::init();
    thread scripts\mp\menus::init();
    thread scripts\mp\hud::init();
    thread scripts\mp\serversettings::init();
    thread scripts\mp\teams::init();
    thread scripts\mp\weapons::init();
    thread scripts\mp\outline::init();
    thread scripts\mp\shellshock::init();
    thread scripts\mp\deathicons::init();
    thread scripts\mp\damagefeedback::init();
    thread scripts\mp\lightarmor::init();
    thread _id_0D8C::_id_3E6E();
    thread scripts\mp\objpoints::init();
    thread scripts\mp\gameobjects::init();
    thread _id_0AF0::init();
    thread scripts\mp\spawnlogic::init();
    thread scripts\mp\matchdata::init();
    thread scripts\mp\clientmatchdata::init();
    thread scripts\mp\awards::init();
    thread scripts\mp\areas::init();
    thread _id_0A83::init();
    thread _id_0AC7::init();
    thread [[ level._id_A6A2 ]]();
    thread scripts\mp\passives::init();
    thread scripts\mp\perks::init();
    thread scripts\mp\events::init();
    thread scripts\mp\defcon::init();
    thread [[ level._id_B3E7 ]]();
    thread scripts\mp\zipline::init();
    thread scripts\mp\archetypes\archcommon::init();
    thread _id_0AE2::init();
    thread _id_0AA3::init();
    thread scripts\mp\whizby::init();
    thread scripts\mp\analyticslog::init();
    thread scripts\mp\loot::init();
    thread scripts\mp\supers::init();
    thread scripts\mp\callouts::init();
    thread _id_1C74();
    thread ismp_init();
    thread scripts\mp\weapons::_id_13AB2();
    thread scripts\mp\supers::_id_13B6B();
    thread scripts\mp\gestures::init();
    thread scripts\mp\sentientpoolmanager::init();
    thread scripts\mp\objidpoolmanager::init();
    thread scripts\mp\contracts::init();
    thread scripts\mp\utility\game::initarbitraryuptriggers();
    thread scripts\mp\broshot::initbroshotfx();

    if ( level.teambased )
        thread scripts\mp\friendicons::init();

    thread scripts\mp\hud_message::init();

    if ( scripts\mp\codcasterclientmatchdata::_id_10036() )
        thread scripts\mp\codcasterclientmatchdata::init();

    game["gamestarted"] = 1;
    level._id_4BFF = game["roundsPlayed"] + 1;
    level._id_B4BC = 0;
    level._id_13BDE["allies"] = 0;
    level._id_13BDE["axis"] = 0;
    level._id_AA44["allies"] = 0;
    level._id_AA44["axis"] = 0;
    level._id_13BE0["allies"] = 0;
    level._id_13BE0["axis"] = 0;
    level._id_1BE7["allies"] = [];
    level._id_1BE7["axis"] = [];
    level._id_1659 = [];

    if ( level._id_BDCC )
    {
        for ( var_0 = 0; var_0 < level._id_115DA.size; var_0++ )
        {
            level._id_1461[level._id_115DA[var_0]] = 0;
            level._id_1301[level._id_115DA[var_0]] = 0;
            level._id_1462[level._id_115DA[var_0]] = 0;
            level._id_1168[level._id_115DA[var_0]] = [];
        }
    }

    setomnvar( "ui_scorelimit", 0 );
    setdvar( "ui_allow_teamchange", 1 );
    setomnvar( "ui_round_hint_override_attackers", 0 );
    setomnvar( "ui_round_hint_override_defenders", 0 );

    if ( scripts\mp\utility\game::getgametypenumlives() )
        setdvar( "g_deadChat", 0 );
    else
        setdvar( "g_deadChat", 1 );

    var_2 = getdvarint( "scr_" + level.gametype + "_waverespawndelay" );

    if ( var_2 )
    {
        level._id_13BDE["allies"] = var_2;
        level._id_13BDE["axis"] = var_2;
        level._id_AA44["allies"] = 0;
        level._id_AA44["axis"] = 0;

        if ( level._id_BDCC )
        {
            for ( var_0 = 0; var_0 < level._id_115DA.size; var_0++ )
            {
                level._id_1461[level._id_115DA[var_0]] = var_2;
                level._id_1301[level._id_115DA[var_0]] = 0;
            }
        }

        level thread _id_13BE6();
    }

    scripts\mp\utility\game::_id_766E( "prematch_done", 0 );
    level._id_8487 = 15;
    level.ingraceperiod = level._id_8487;
    scripts\mp\utility\game::_id_766E( "graceperiod_done", 0 );
    level._id_D4ED = 0;
    level._id_E75F = 6.0;
    level._id_6C71 = 3;
    level._id_8864 = 3;
    level._id_C08A = getentarray( "noragdoll", "targetname" );
    level._id_EC3B = scripts\mp\utility\game::_id_8214( "scorelimit" );
    level._id_E762 = scripts\mp\utility\game::_id_8214( "roundlimit" );
    level._id_13D89 = scripts\mp\utility\game::_id_8214( "winlimit" );

    if ( level._id_E762 != 1 )
        setomnvar( "ui_current_round", level._id_4BFF );

    if ( level._id_EC3B == 1 )
    {
        level._id_E763 = 1;
        level._id_11A3C = level._id_13D89;
    }
    else
    {
        level._id_E763 = level._id_EC3B * ( game["roundsPlayed"] + 1 );
        level._id_11A3C = level._id_EC3B * level._id_E762;
    }

    if ( scripts\mp\utility\game::_id_E269() )
    {
        level._id_E763 = level._id_EC3B;
        level._id_11A3C = level._id_EC3B;
        game["teamScores"][game["attackers"]] = 0;
        setteamscore( game["attackers"], 0 );
        game["teamScores"][game["defenders"]] = 0;
        setteamscore( game["defenders"], 0 );
    }

    if ( scripts\mp\utility\game::_id_9ECF() && scripts\mp\utility\game::_id_9900() )
        scripts\mp\gamescore::_id_12EE5();

    if ( level.teambased )
    {
        scripts\mp\gamescore::_id_12F3B( "axis" );
        scripts\mp\gamescore::_id_12F3B( "allies" );

        if ( level._id_BDCC )
        {
            for ( var_0 = 0; var_0 < level._id_115DA.size; var_0++ )
                scripts\mp\gamescore::_id_12F3B( level._id_115DA[var_0] );
        }
    }

    thread _id_12F54();
    level notify( "update_scorelimit" );

    if ( isdefined( level._id_B3F8 ) )
        level thread [[ level._id_B3F8 ]]();

    [[ level.onstartgametype ]]();
    level._id_EC3F = getdvarint( "scr_" + level.gametype + "_score_percentage_cut_off", 80 );
    level._id_1190B = getdvarint( "scr_" + level.gametype + "_time_percentage_cut_off", 80 );

    if ( !level._id_4542 && ( getdvar( "dedicated" ) == "dedicated LAN server" || getdvar( "dedicated" ) == "dedicated internet server" ) )
        thread _id_132A3();

    thread _id_10D9F();
    level thread scripts\mp\utility\game::_id_12F5B();
    level thread _id_118FB();
    level thread scripts\mp\finalkillcam::_id_5853();
    level thread updateleaderboardstatscontinuous();
}

_id_132A3()
{
    for (;;)
    {
        if ( level.rankedmatch )
            exitlevel( 0 );

        if ( !getdvarint( "xblive_privatematch" ) )
            exitlevel( 0 );

        if ( getdvar( "dedicated" ) != "dedicated LAN server" && getdvar( "dedicated" ) != "dedicated internet server" )
            exitlevel( 0 );

        wait 5;
    }
}

_id_118FB()
{
    level endon( "game_ended" );
    var_0 = scripts\mp\utility\game::_id_81CB();

    while ( game["state"] == "playing" )
    {
        thread _id_3E54( var_0 );
        var_0 = scripts\mp\utility\game::_id_81CB();

        if ( isdefined( level._id_10DFF ) )
        {
            if ( _id_81CD() < 3000 )
            {
                wait 0.1;
                continue;
            }
        }

        wait 1;
    }
}

_id_12F54()
{
    for (;;)
    {
        level scripts\engine\utility::_id_13762( "update_scorelimit", "update_winlimit" );

        if ( scripts\mp\utility\game::_id_9900() )
        {
            if ( scripts\mp\utility\game::_id_9FAA() )
            {
                foreach ( var_1 in level.players )
                {
                    var_1 setclientomnvar( "ui_friendly_time_to_beat", scripts\engine\utility::ter_op( var_1.team == game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"] ) );
                    var_1 setclientomnvar( "ui_enemy_time_to_beat", scripts\engine\utility::ter_op( var_1.team != game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"] ) );
                }

                setomnvar( "ui_scorelimit", scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_9FAB(), game["timeToBeatScore"], 1 ) );
            }
            else if ( scripts\mp\utility\game::_id_A00B() )
            {
                var_3 = game["roundsWon"][game["defenders"]];
                var_4 = game["roundsWon"][game["attackers"]];
                var_5 = 0;

                if ( var_3 == var_4 )
                    var_5 = var_3 + 2;
                else if ( var_3 > var_4 )
                    var_5 = var_3 + 1;
                else
                    var_5 = var_4 + 1;

                setomnvar( "ui_scorelimit", var_5 );
            }
            else
                _id_130AB();

            continue;
        }

        _id_130AB();
    }
}

_id_130AB()
{
    if ( !scripts\mp\utility\game::_id_9F32() || !scripts\mp\utility\game::_id_9EBD() || scripts\mp\utility\game::_id_9EA9() )
    {
        setomnvar( "ui_scorelimit", level._id_11A3C );
        thread checkscorelimit();
    }
    else
        setomnvar( "ui_scorelimit", level._id_13D89 );
}

_id_D54F()
{
    self endon( "death" );
    self endon( "stop_ticking" );
    level endon( "game_ended" );
    var_0 = level._id_2C6C;

    for (;;)
    {
        self playsound( "ui_mp_suitcasebomb_timer" );

        if ( var_0 > 10 )
        {
            var_0 -= 1;
            wait 1;
        }
        else if ( var_0 > 4 )
        {
            var_0 -= 0.5;
            wait 0.5;
        }
        else if ( var_0 > 1 )
        {
            var_0 -= 0.4;
            wait 0.4;
        }
        else
        {
            var_0 -= 0.3;
            wait 0.3;
        }

        scripts\mp\hostmigration::waittillhostmigrationdone();
    }
}

_id_11094()
{
    self notify( "stop_ticking" );
}

_id_118F7()
{
    level endon( "game_ended" );
    wait 0.05;
    var_0 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_0 hide();
    var_1 = scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_9D46(), 5, 2 );

    while ( game["state"] == "playing" )
    {
        if ( !level._id_1191F && scripts\mp\utility\game::_id_81CA() )
        {
            var_2 = _id_81CD() / 1000;
            var_3 = int( var_2 + 0.5 );

            if ( var_3 >= 30 && var_3 <= 60 )
                level notify( "match_ending_soon", "time" );

            if ( var_3 <= 10 || var_3 <= 30 && var_3 % var_1 == 0 )
            {
                level notify( "match_ending_very_soon" );

                if ( var_3 == 0 )
                    break;

                var_0 playsound( "ui_mp_timer_countdown" );
            }

            if ( var_2 - floor( var_2 ) >= 0.05 )
                wait( var_2 - floor( var_2 ) );
        }

        wait 1.0;
    }
}

_id_7687()
{
    level endon( "game_ended" );

    if ( isdefined( game["startTimeFromMatchStart"] ) )
        level._id_10E00 = game["startTimeFromMatchStart"];

    level waittill( "prematch_over" );
    level._id_10DFF = gettime();
    level._id_561F = 0;

    if ( !isdefined( game["startTimeFromMatchStart"] ) )
    {
        game["startTimeFromMatchStart"] = gettime();
        level._id_10E00 = gettime();
        scripts\mp\matchdata::_id_C558();
    }

    if ( isdefined( game["roundMillisecondsAlreadyPassed"] ) )
    {
        level._id_10DFF -= game["roundMillisecondsAlreadyPassed"];
        game["roundMillisecondsAlreadyPassed"] = undefined;
    }

    if ( game["roundsPlayed"] < 24 )
        setmatchdata( "utcRoundStartTimeSeconds", game["roundsPlayed"], getsystemtime() );

    var_0 = gettime();

    while ( game["state"] == "playing" )
    {
        if ( !level._id_1191F )
            game["timePassed"] += gettime() - var_0;

        var_0 = gettime();
        wait 1.0;
    }
}

_id_12F45( var_0 )
{
    var_1 = level._id_11920 || isdefined( level._id_90A9 );

    if ( !scripts\mp\utility\game::_id_766C( "prematch_done" ) )
        var_1 = 0;

    if ( !level._id_1191F && var_1 )
    {
        level._id_1191F = 1;
        level._id_1191E = gettime();
        var_2 = _id_81CD();

        if ( isdefined( var_0 ) )
            setgameendtime( var_0 );
        else
            setgameendtime( gettime() + int( var_2 ) );

        setomnvar( "ui_match_timer_stopped", 1 );
    }
    else if ( level._id_1191F && !var_1 )
    {
        level._id_1191F = 0;
        level._id_561F += gettime() - level._id_1191E;
        var_2 = _id_81CD();

        if ( isdefined( var_0 ) )
            setgameendtime( var_0 );
        else
            setgameendtime( gettime() + int( var_2 ) );

        setomnvar( "ui_match_timer_stopped", 0 );
    }
}

_id_C9D6( var_0 )
{
    level._id_11920 = 1;
    _id_12F45( var_0 );
}

_id_E2FF( var_0 )
{
    level._id_11920 = 0;
    _id_12F45( var_0 );
}

_id_10D9F()
{
    setslowmotion( 1, 1, 0 );
    thread _id_7687();
    level._id_1191F = 0;
    level._id_11920 = 0;
    setomnvar( "ui_prematch_period", 1 );
    _id_D84D();
    _func_26C( "MatchStarted: Completed" );
    thread scripts\mp\analyticslog::_id_AFB1();
    scripts\mp\utility\game::_id_766F( "prematch_done" );
    level notify( "prematch_over" );
    setomnvar( "ui_prematch_period", 0 );
    _id_12F45();

    if ( scripts\mp\utility\game::_id_81CA() > 0 )
        setomnvar( "ui_match_timer_hidden", 0 );
    else
        setomnvar( "ui_match_timer_hidden", 1 );

    thread _id_118F7();
    thread _id_8487();
    thread scripts\mp\missions::_id_E75B();
}

_id_13BE6()
{
    level endon( "game_ended" );

    while ( game["state"] == "playing" )
    {
        var_0 = gettime();

        if ( var_0 - level._id_AA44["allies"] > level._id_13BDE["allies"] * 1000 )
        {
            level notify( "wave_respawn_allies" );
            level._id_AA44["allies"] = var_0;
            level._id_13BE0["allies"] = 0;
        }

        if ( var_0 - level._id_AA44["axis"] > level._id_13BDE["axis"] * 1000 )
        {
            level notify( "wave_respawn_axis" );
            level._id_AA44["axis"] = var_0;
            level._id_13BE0["axis"] = 0;
        }

        if ( level._id_BDCC )
        {
            for ( var_1 = 0; var_1 < level._id_115DA.size; var_1++ )
            {
                if ( var_0 - level._id_AA44[level._id_115DA[var_1]] > level._id_1461[level._id_115DA[var_1]] * 1000 )
                {
                    var_2 = "wave_rewpawn_" + level._id_115DA[var_1];
                    level notify( var_2 );
                    level._id_AA44[level._id_115DA[var_1]] = var_0;
                    level._id_13BE0[level._id_115DA[var_1]] = 0;
                }
            }
        }

        wait 0.05;
    }
}

_id_7E07()
{
    var_0["allies"] = 0;
    var_0["axis"] = 0;
    var_1["allies"] = 0;
    var_1["axis"] = 0;

    foreach ( var_3 in level.players )
    {
        var_4 = var_3.pers["team"];

        if ( isdefined( var_4 ) && ( var_4 == "allies" || var_4 == "axis" ) )
        {
            var_0[var_4] += var_3.kills;
            var_1[var_4] += var_3.deaths;
        }
    }

    if ( var_0["allies"] > var_0["axis"] )
        return "allies";
    else if ( var_0["axis"] > var_0["allies"] )
        return "axis";

    if ( var_1["allies"] < var_1["axis"] )
        return "allies";
    else if ( var_1["axis"] < var_1["allies"] )
        return "axis";

    if ( randomint( 2 ) == 0 )
        return "allies";

    return "axis";
}

_id_DCD3( var_0 )
{
    if ( scripts\mp\utility\game::matchmakinggame() )
    {
        _id_FB23();

        if ( _id_90A2() )
        {
            level._id_90A1 = 1;
            logstring( "host idled out" );
            endlobby();
        }

        _id_12ECA( var_0 );
    }

    _id_12F65( var_0 );
}

_id_56E0( var_0, var_1 )
{
    if ( level._id_8865 == "halftime" && level._id_E762 && game["roundsPlayed"] * 2 == level._id_E762 )
    {
        foreach ( var_3 in level.players )
            var_3 _meth_8461( "mus_mp_halftime" );
    }
    else if ( level._id_D4ED )
    {
        foreach ( var_3 in level.players )
            var_3 _meth_8461( "mus_mp_halftime" );
    }
    else if ( level._id_8865 == "halftime" && !level._id_E762 )
    {
        foreach ( var_3 in level.players )
            var_3 _meth_8461( "mus_mp_halftime" );
    }

    if ( !level._id_5828 && scripts\mp\utility\game::_id_9EA9() && game["finalRound"] == 0 )
        var_0 = "roundend";

    foreach ( var_3 in level.players )
    {
        if ( level.teambased )
        {
            var_3 thread scripts\mp\hud_message::_id_115DD( var_0, 1, var_1 );
            continue;
        }

        var_3 thread scripts\mp\hud_message::_id_C752( var_0, var_1 );
    }
}

_id_56DA( var_0, var_1 )
{
    setomnvar( "ui_match_over", 1 );

    foreach ( var_3 in level.players )
    {
        if ( level.teambased )
        {
            var_3 thread scripts\mp\hud_message::_id_115DD( var_0, 0, var_1 );
            continue;
        }

        var_3 thread scripts\mp\hud_message::_id_C752( var_0, var_1 );
    }

    level notify( "game_win", var_0 );
}

_id_56E1()
{
    level notify( "spawning_intermission" );

    foreach ( var_1 in level.players )
        var_1 thread scripts\mp\playerlogic::_id_108DD();

    var_3 = level._id_8865;

    if ( var_3 == "halftime" )
    {
        if ( level._id_E762 )
        {
            if ( game["roundsPlayed"] * 2 == level._id_E762 )
                var_3 = "halftime";
            else
                var_3 = "intermission";
        }
        else
            var_3 = "intermission";
    }

    level notify( "round_switch", var_3 );

    if ( game["finalRound"] == 1 )
        var_3 = "finalround";

    var_4 = 0;

    if ( isdefined( level._id_11374 ) )
        var_4 = game["end_reason"]["switching_sides"];

    foreach ( var_1 in level.players )
        var_1 thread scripts\mp\hud_message::_id_115DD( var_3, 1, var_4 );

    _id_E761( level._id_8864, 0 );
}

_id_7384( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( var_0 > 0 && var_3 )
        thread _id_1032D( var_0 );

    if ( var_0 > 1 && !scripts\mp\utility\game::istrue( level._id_C1C3 ) )
        thread _id_636B( var_0 );

    thread _id_F22F( var_0 );

    foreach ( var_5 in level.players )
    {
        var_5 thread _id_7386( var_0 );
        var_5 thread _id_E760( 4.0 );
        var_5 _id_736F();
        var_5 setclientdvars( "cg_everyoneHearsEveryone", 1, "cg_drawSpectatorMessages", 0 );

        if ( isdefined( var_1 ) && isdefined( var_2 ) )
        {
            if ( var_1 == "cg_fovScale" && var_5 issplitscreenplayer() )
                var_5 setclientdvars( var_1, 0.75 );

            var_5 setclientdvars( var_1, var_2 );
        }
    }

    foreach ( var_8 in level.agentarray )
        var_8 scripts\mp\utility\game::_id_7385( 1 );
}

_id_636B( var_0 )
{
    var_1 = var_0 * 1.3;
    visionsetfadetoblack( "bw", var_1 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_1 );
}

_id_1032D( var_0 )
{
    setslowmotion( 1.0, 0.4, var_0 );
    _id_F6DF();
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    setslowmotion( 1.0, 1, 0 );
    _id_E26E();
}

_id_F6DF()
{
    soundsettimescalefactor( "music_lr", 0 );
    soundsettimescalefactor( "music_lsrs", 0 );
    soundsettimescalefactor( "voice_air_3d", 0 );
    soundsettimescalefactor( "voice_radio_3d", 0 );
    soundsettimescalefactor( "voice_radio_2d", 0 );
    soundsettimescalefactor( "voice_narration_2d", 0 );
    soundsettimescalefactor( "voice_special_2d", 0 );
    soundsettimescalefactor( "voice_bchatter_1_3d", 0 );
    soundsettimescalefactor( "plr_ui_ingame_unres_2d", 0 );
    soundsettimescalefactor( "hurt_nofilter_2d", 0.15 );
    soundsettimescalefactor( "amb_bed_2d", 0.25 );
    soundsettimescalefactor( "amb_elm_ext_unres_3d", 0.25 );
    soundsettimescalefactor( "amb_elm_int_unres_3d", 0.25 );
    soundsettimescalefactor( "amb_elm_unres_3d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_1_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_2_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_3_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_4_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_overlap_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_lfe_2d", 0 );
    soundsettimescalefactor( "weap_plr_fire_alt_1_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_alt_2_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_alt_3_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_alt_4_2d", 0.25 );
    soundsettimescalefactor( "reload_plr_res_2d", 0.3 );
    soundsettimescalefactor( "reload_plr_unres_2d", 0.3 );
    soundsettimescalefactor( "scn_fx_unres_3d", 0.25 );
    soundsettimescalefactor( "scn_fx_unres_2d", 0.25 );
    soundsettimescalefactor( "scn_lfe_unres_2d", 0 );
    soundsettimescalefactor( "scn_lfe_unres_3d", 0 );
    soundsettimescalefactor( "spear_refl_close_unres_3d_lim", 0.25 );
    soundsettimescalefactor( "spear_refl_unres_3d_lim", 0.25 );
    soundsettimescalefactor( "weap_npc_main_3d", 0.25 );
    soundsettimescalefactor( "weap_npc_mech_3d", 0.25 );
    soundsettimescalefactor( "weap_npc_mid_3d", 0.25 );
    soundsettimescalefactor( "weap_npc_lfe_3d", 0 );
    soundsettimescalefactor( "weap_npc_dist_3d", 0.25 );
    soundsettimescalefactor( "weap_npc_lo_3d", 0.25 );
    soundsettimescalefactor( "melee_npc_3d", 0.25 );
    soundsettimescalefactor( "melee_plr_2d", 0.25 );
    soundsettimescalefactor( "special_hi_unres_1_3d", 0.25 );
    soundsettimescalefactor( "special_lo_unres_1_2d", 0 );
    soundsettimescalefactor( "bulletflesh_npc_1_unres_3d_lim", 0.25 );
    soundsettimescalefactor( "bulletflesh_npc_2_unres_3d_lim", 0.25 );
    soundsettimescalefactor( "bulletflesh_1_unres_3d_lim", 0.25 );
    soundsettimescalefactor( "bulletflesh_2_unres_3d_lim", 0.25 );
    soundsettimescalefactor( "foley_plr_mvmt_unres_2d_lim", 0.3 );
    soundsettimescalefactor( "scn_fx_unres_2d_lim", 0.3 );
    soundsettimescalefactor( "menu_1_2d_lim", 0 );
    soundsettimescalefactor( "shock1_nofilter_3d", 0.25 );
    soundsettimescalefactor( "equip_use_unres_3d", 0.3 );
    soundsettimescalefactor( "explo_1_3d", 0.3 );
    soundsettimescalefactor( "explo_2_3d", 0.3 );
    soundsettimescalefactor( "explo_3_3d", 0.3 );
    soundsettimescalefactor( "explo_4_3d", 0.3 );
    soundsettimescalefactor( "explo_5_3d", 0.3 );
    soundsettimescalefactor( "explo_lfe_3d", 0.3 );
    soundsettimescalefactor( "vehicle_air_loops_3d_lim", 0.3 );
    soundsettimescalefactor( "projectile_loop_close", 0.3 );
    soundsettimescalefactor( "projectile_loop_mid", 0.3 );
    soundsettimescalefactor( "projectile_loop_dist", 0.3 );
}

_id_E26E()
{
    soundsettimescalefactor( "music_lr", 0 );
    soundsettimescalefactor( "music_lsrs", 0 );
    soundsettimescalefactor( "weap_plr_fire_1_2d", 0 );
    soundsettimescalefactor( "weap_plr_fire_2_2d", 0 );
    soundsettimescalefactor( "weap_plr_fire_3_2d", 0 );
    soundsettimescalefactor( "weap_plr_fire_4_2d", 0 );
    soundsettimescalefactor( "weap_plr_fire_overlap_2d", 0 );
    soundsettimescalefactor( "weap_plr_fire_lfe_2d", 0 );
    soundsettimescalefactor( "weap_plr_fire_alt_1_2d", 0 );
    soundsettimescalefactor( "weap_plr_fire_alt_2_2d", 0 );
    soundsettimescalefactor( "weap_plr_fire_alt_3_2d", 0 );
    soundsettimescalefactor( "weap_plr_fire_alt_4_2d", 0 );
    soundsettimescalefactor( "scn_fx_unres_3d", 0 );
    soundsettimescalefactor( "scn_fx_unres_2d", 0 );
    soundsettimescalefactor( "spear_refl_close_unres_3d_lim", 0 );
    soundsettimescalefactor( "spear_refl_unres_3d_lim", 0 );
    soundsettimescalefactor( "weap_npc_main_3d", 0 );
    soundsettimescalefactor( "weap_npc_mech_3d", 0 );
    soundsettimescalefactor( "weap_npc_mid_3d", 0 );
    soundsettimescalefactor( "weap_npc_lfe_3d", 0 );
    soundsettimescalefactor( "weap_npc_dist_3d", 0 );
    soundsettimescalefactor( "weap_npc_lo_3d", 0 );
    soundsettimescalefactor( "melee_npc_3d", 0 );
    soundsettimescalefactor( "melee_plr_2d", 0 );
    soundsettimescalefactor( "special_hi_unres_1_3d", 0 );
    soundsettimescalefactor( "special_lo_unres_1_2d", 0 );
    soundsettimescalefactor( "bulletflesh_npc_1_unres_3d_lim", 0 );
    soundsettimescalefactor( "bulletflesh_npc_2_unres_3d_lim", 0 );
    soundsettimescalefactor( "bulletflesh_1_unres_3d_lim", 0 );
    soundsettimescalefactor( "bulletflesh_2_unres_3d_lim", 0 );
    soundsettimescalefactor( "foley_plr_mvmt_unres_2d_lim", 0 );
    soundsettimescalefactor( "scn_fx_unres_2d_lim", 0 );
    soundsettimescalefactor( "menu_1_2d_lim", 0 );
    soundsettimescalefactor( "equip_use_unres_3d", 0 );
    soundsettimescalefactor( "explo_1_3d", 0 );
    soundsettimescalefactor( "explo_2_3d", 0 );
    soundsettimescalefactor( "explo_3_3d", 0 );
    soundsettimescalefactor( "explo_4_3d", 0 );
    soundsettimescalefactor( "explo_5_3d", 0 );
    soundsettimescalefactor( "explo_lfe_3d", 0 );
    soundsettimescalefactor( "vehicle_air_loops_3d_lim", 0 );
    soundsettimescalefactor( "projectile_loop_close", 0 );
    soundsettimescalefactor( "projectile_loop_mid", 0 );
    soundsettimescalefactor( "projectile_loop_dist", 0 );
}

_id_F22F( var_0 )
{
    wait( var_0 );
    level notify( "game_ended_frozen" );
}

_id_E2A9()
{
    setomnvarforallclients( "post_game_state", 0 );
    level notify( "restarting" );
    game["state"] = "playing";
    map_restart( 1 );
}

endgame( var_0, var_1, var_2 )
{
    if ( isdefined( level.endgame ) )
        [[ level.endgame ]]( var_0, var_1 );
    else
        _id_6322( var_0, var_1, var_2 );
}

_id_6322( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( level._id_7669 )
        return;

    if ( game["roundsPlayed"] < 24 )
        setmatchdata( "utcRoundEndTimeSeconds", game["roundsPlayed"], getsystemtime() );

    scripts\mp\matchdata::_id_C557();
    var_3 = 0;

    if ( level._id_90A1 || level._id_72B3 )
        var_3 = 1;

    if ( scripts\mp\utility\game::_id_9900() )
    {
        if ( game["overtimeRoundsPlayed"] == 0 )
            setmatchdata( "firstOvertimeRoundIndex", game["roundsPlayed"] );

        if ( !var_3 )
            game["overtimeRoundsPlayed"]++;
    }

    if ( level.teambased )
    {
        if ( var_0 == "axis" || var_0 == "allies" )
        {
            if ( !var_3 )
                game["roundsWon"][var_0]++;

            if ( !isdefined( level._id_6C6F ) )
                level._id_6C6F = var_0;
        }
        else if ( !isdefined( level._id_6C6F ) )
            level._id_6C6F = "none";

        scripts\mp\gamescore::_id_12F3B( "axis" );
        scripts\mp\gamescore::_id_12F3B( "allies" );

        if ( scripts\mp\utility\game::_id_9F32() && game["roundsPlayed"] < 24 && level.gametype != "koth" )
        {
            setmatchdata( "alliesRoundScore", game["roundsPlayed"], getteamscore( "allies" ) );
            setmatchdata( "axisRoundScore", game["roundsPlayed"], getteamscore( "axis" ) );
        }
    }
    else
    {
        if ( isdefined( var_0 ) && isplayer( var_0 ) && !var_3 )
            game["roundsWon"][var_0.guid]++;

        if ( !isdefined( level._id_6C6F ) )
        {
            if ( isstring( var_0 ) && var_0 == "tie" )
                level._id_6C6F = "none";
            else
                level._id_6C6F = var_0.guid;
        }
    }

    scripts\mp\gamescore::_id_12EEC();

    if ( !var_3 )
        game["roundsPlayed"]++;

    level._id_D4ED = scripts\mp\utility\game::_id_1004B();

    if ( scripts\mp\utility\game::_id_BFA7() )
        game["finalRound"] = 1;

    if ( scripts\mp\utility\game::_id_13916() )
        var_0 = checkmodeoverridetie( var_0 );

    var_4 = _id_6321( var_0, var_1, var_2 );

    if ( var_4 && scripts\mp\utility\game::_id_13916() )
        _id_6320( var_0, var_1, var_2 );
}

checkmodeoverridetie( var_0 )
{
    if ( level.gametype == "ctf" && var_0 == "tie" && !level._id_13D8D )
    {
        scripts\mp\gamescore::_id_12F4A( "axis" );
        scripts\mp\gamescore::_id_12F4A( "allies" );
        var_1 = getteamscore( "allies" );
        var_2 = getteamscore( "axis" );

        if ( var_1 != var_2 )
            var_0 = scripts\engine\utility::ter_op( var_1 > var_2, "allies", "axis" );
    }

    return var_0;
}

_id_6323()
{
    if ( isdefined( level._id_6C6F ) )
    {
        level.finalkillcam_timegameended[level._id_6C6F] = scripts\mp\utility\game::getsecondspassed();
        level notify( "game_cleanup" );
        level waittill( "final_killcam_done" );
    }
}

_id_6321( var_0, var_1, var_2 )
{
    level._id_766B = gettime();
    level._id_7669 = 1;
    level.ingraceperiod = 0;
    level._id_5828 = 0;

    if ( getdvarint( "scr_eom_combat" ) )
    {
        if ( scripts\mp\utility\game::_id_13916() )
            level._id_5828 = 1;
    }

    scripts\engine\utility::waitframe();
    scripts\mp\gamescore::_id_12EEC();
    level.recordfinalkillcam = 0;
    level.ignorescoring = 1;
    level._id_561D = 1;
    scripts\mp\finalkillcam::preloadfinalkillcam();

    if ( scripts\mp\utility\game::_id_13916() )
        level notify( "round_end_music", var_0 );

    if ( level._id_5828 )
    {
        setomnvarforallclients( "post_game_state", 1 );
        setomnvarforallclients( "post_game_state", 2 );

        foreach ( var_4 in level.players )
        {
            if ( level.teambased )
            {
                var_4 thread scripts\mp\hud_message::_id_115DD( var_0, 0, var_1 );
                continue;
            }

            var_4 thread scripts\mp\hud_message::_id_C752( var_0, var_1 );
        }

        _id_7384( 3, "cg_fovScale", 1, 1 );
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 3 );
        game["state"] = "postgame";
        level notify( "game_ended", var_0 );
        scripts\mp\utility\game::_id_ABF4( "game_over" );
        scripts\mp\utility\game::_id_ABF4( "block_notifies" );
        scripts\engine\utility::waitframe();

        foreach ( var_4 in level.players )
        {
            var_4 setclientdvar( "ui_opensummary", 1 );

            if ( scripts\mp\utility\game::_id_13918() || scripts\mp\utility\game::_id_13916() )
                var_4 scripts\mp\killstreaks\killstreaks::_id_41C0();
        }
    }
    else
    {
        setomnvarforallclients( "post_game_state", 1 );
        game["state"] = "postgame";
        level notify( "game_ended", var_0 );
        scripts\mp\utility\game::_id_ABF4( "game_over" );
        scripts\mp\utility\game::_id_ABF4( "block_notifies" );
        scripts\engine\utility::waitframe();

        foreach ( var_4 in level.players )
        {
            var_4 setclientdvar( "ui_opensummary", 1 );

            if ( scripts\mp\utility\game::_id_13918() || scripts\mp\utility\game::_id_13916() )
                var_4 scripts\mp\killstreaks\killstreaks::_id_41C0();
        }

        _id_7384( 1.0, "cg_fovScale", 1, 0 );
    }

    setgameendtime( 0 );
    thread scripts\mp\analyticslog::_id_AFB1();
    scripts\mp\playerlogic::_id_D919();

    if ( scripts\mp\analyticslog::_id_1E6A() )
        scripts\mp\analyticslog::_id_1E6B();

    if ( isdefined( level._id_B3F0 ) )
        [[ level._id_B3F0 ]]();

    _id_DCD3( var_0 );
    setdvar( "g_deadChat", 1 );
    setdvar( "ui_allow_teamchange", 0 );
    setdvar( "bg_compassShowEnemies", 0 );
    _id_56E0( var_0, var_1 );

    if ( !scripts\mp\utility\game::_id_13916() )
    {
        level notify( "round_win", var_0 );
        _id_E761( level._id_E75F, 1 );
    }
    else
        _id_E761( 0, 1 );

    _id_6323();
    setslowmotion( 1, 1, 0 );
    _id_E26E();

    if ( level.teambased )
    {
        scripts\mp\gamescore::_id_12F4A( "axis" );
        scripts\mp\gamescore::_id_12F4A( "allies" );
    }

    if ( !scripts\mp\utility\game::_id_13918() && !var_2 )
    {
        if ( !scripts\mp\utility\game::_id_13916() )
        {
            if ( level._id_D4ED )
            {
                var_0 = "overtime";
                game["status"] = "overtime";
            }

            scripts\mp\utility\game::_id_ABF1( "block_notifies" );

            if ( _id_3E43( level._id_D4ED ) )
                _id_56E1();

            foreach ( var_4 in level.players )
                var_4.pers["stats"] = var_4._id_10E53;

            _id_E2A9();
            return 0;
        }

        if ( !level._id_72B3 )
            var_1 = _id_12F07( var_0 );
    }

    return 1;
}

_id_6320( var_0, var_1, var_2 )
{
    if ( !scripts\mp\utility\game::istrue( level.processedwinloss ) && ( scripts\mp\utility\game::istrue( level._id_72F2 ) || level._id_72B3 ) )
        _id_12F65( var_0 );

    scripts\mp\missions::_id_E75D( var_0 );
    scripts\mp\intel::updatemissionteamperformancestats();
    _id_3E16();
    _id_12F23();
    scripts\mp\persistence::_id_13E03();
    level notify( "stop_leaderboard_stats" );
    updateleaderboardstats();
    level._id_58D7 = scripts\mp\broshot::_id_97E0( var_0 );

    if ( !level._id_58D7 )
    {
        level notify( "spawning_intermission" );

        foreach ( var_4 in level.players )
        {
            var_4 thread scripts\mp\utility\game::_id_F8A0( 0.0 );
            var_4 thread scripts\mp\playerlogic::_id_108DD();
        }
    }

    if ( scripts\mp\utility\game::istrue( var_2 ) && !scripts\mp\utility\game::istrue( level._id_C1B2 ) )
    {
        scripts\mp\utility\game::_id_144F( level._id_C1D0, 0 );
        visionsetfadetoblack( "", 0.75 );
    }
    else
    {
        scripts\mp\utility\game::_id_144F( "", 0 );
        visionsetfadetoblack( "", 0.75 );
    }

    _id_56DA( var_0, var_1 );
    scripts\mp\utility\game::_id_ABF1( "block_notifies" );
    level._id_018F = 1;

    if ( !level._id_58D7 )
    {
        setomnvarforallclients( "post_game_state", 4 );
        _id_E761( level._id_D706, 1 );
    }

    _id_D9AA();

    if ( level._id_58D7 )
    {
        setomnvarforallclients( "post_game_state", 6 );
        wait 0.1;
        var_6 = scripts\mp\broshot::_id_10D73( var_0 );
        var_7 = undefined;

        foreach ( var_4 in level.players )
        {
            if ( var_4 ishost() )
            {
                var_7 = var_4;
                break;
            }
        }

        if ( isdefined( var_7 ) )
            var_7 scripts\engine\utility::_id_137B7( "dev_skip_broshot", var_6 );
        else
            wait( var_6 );

        scripts\mp\broshot::_id_6311();
    }

    if ( level.teambased )
    {
        if ( var_0 == "axis" || var_0 == "allies" )
            setmatchdata( "victor", var_0 );
        else
            setmatchdata( "victor", "none" );

        setmatchdata( "alliesScore", getteamscore( "allies" ) );
        setmatchdata( "axisScore", getteamscore( "axis" ) );
    }
    else
        setmatchdata( "victor", "none" );

    foreach ( var_4 in level.players )
    {
        var_4 setrankedplayerdata( "common", "round", "endReasonTextIndex", var_1 );

        if ( var_4 scripts\mp\utility\game::_id_DCD5() )
            var_4 scripts\mp\matchdata::_id_AFB9();

        if ( isalive( var_4 ) && isdefined( var_4._id_B3E3 ) )
            var_4 scripts\mp\matchdata::logxpscoreearnedinlife( var_4._id_B3E3 );

        if ( level.teambased )
        {
            if ( var_0 == "axis" || var_0 == "allies" )
            {
                if ( isdefined( var_4.team ) )
                {
                    if ( var_4.team == var_0 )
                        var_4 _meth_859C( var_4._id_41F0, "win" );
                    else
                        var_4 _meth_859C( var_4._id_41F0, "loss" );
                }
                else
                    var_4 _meth_859C( var_4._id_41F0, "none" );
            }
            else if ( getteamscore( "allies" ) == getteamscore( "axis" ) )
                var_4 _meth_859C( var_4._id_41F0, "draw" );
            else
                var_4 _meth_859C( var_4._id_41F0, "none" );

            continue;
        }

        if ( isplayer( var_0 ) && var_0._id_41F0 == var_4._id_41F0 )
        {
            var_4 _meth_859C( var_4._id_41F0, "win" );
            continue;
        }

        var_4 _meth_859C( var_4._id_41F0, "loss" );
    }

    setmatchdata( "host", level._id_90AE );

    if ( scripts\mp\utility\game::matchmakinggame() )
    {
        setmatchdata( "playlistVersion", getplaylistversion() );
        setmatchdata( "playlistID", getplaylistid() );
        setmatchdata( "isDedicated", isdedicatedserver() );
    }

    sendmatchdata();

    foreach ( var_4 in level.players )
        var_4.pers["stats"] = var_4._id_10E53;

    if ( !var_2 && !level._id_D701 )
    {
        if ( !level._id_58D7 )
        {
            if ( !scripts\mp\utility\game::_id_13918() )
                wait 6.0;
            else
                wait( min( 5.0, 4.0 + level._id_D701 ) );
        }
    }
    else
        wait( min( 10.0, 4.0 + level._id_D701 ) );

    if ( isgamebattlematch() )
    {
        for ( var_14 = _func_094(); var_14 != 3 && var_14 != 4; var_14 = _func_094() )
            wait 1;

        setomnvarforallclients( "post_game_state", 5 );
        wait 5;
    }

    setomnvarforallclients( "post_game_state", 1 );
    scripts\mp\utility\game::_id_ABF6( "post_game_level_event_active" );
    setnojipscore( 0 );
    setnojiptime( 0 );
    level notify( "exitLevel_called" );
    exitlevel( 0 );
}

_id_12F07( var_0 )
{
    if ( !level.teambased )
        return 1;

    if ( scripts\mp\utility\game::_id_9EA9() )
    {
        if ( scripts\mp\utility\game::_id_9044() )
            return game["end_reason"]["score_limit_reached"];

        if ( scripts\mp\utility\game::_id_9049() )
            return game["end_reason"]["time_limit_reached"];
    }
    else if ( scripts\mp\utility\game::_id_9041() )
        return game["end_reason"]["round_limit_reached"];

    if ( scripts\mp\utility\game::_id_904A() )
        return game["end_reason"]["score_limit_reached"];

    return game["end_reason"]["objective_completed"];
}

_id_6747( var_0 )
{
    if ( !scripts\mp\utility\game::_id_9EA9() )
    {
        var_1 = _id_8106( var_0 );
        var_2 = _id_8108( var_0 );
        var_3 = 999999;

        if ( var_1 )
            var_3 = var_2 / var_1;

        return var_3;
    }
    else
    {
        var_1 = _id_8106( var_0 );
        var_2 = _id_8106( var_0 );
        var_3 = 999999;

        if ( var_1 )
            var_3 = var_2 / var_1;

        return var_3;
    }
}

_id_42AC( var_0 )
{
    var_1 = 10;
    var_2 = 20;

    if ( level.gametype == "tdef" )
        var_1 = 20;

    if ( level.gametype == "dom" )
        var_2 = 20;

    var_3 = level._id_E763;
    var_4 = getteamscore( var_0 );
    var_5 = var_3 - var_4;

    if ( var_5 <= scripts\engine\utility::ter_op( scripts\mp\utility\game::istrue( game["finalRound"] ), var_2, var_1 ) )
        return 1;

    return 0;
}

_id_8106( var_0 )
{
    var_1 = scripts\mp\utility\game::_id_81CB() / 60000 + 0.0001;

    if ( isplayer( self ) )
        var_2 = self.score / var_1;
    else
        var_2 = getteamscore( var_0 ) / var_1;

    return var_2;
}

_id_8108( var_0 )
{
    var_1 = level._id_E763;

    if ( isplayer( self ) )
        var_2 = var_1 - self.score;
    else
        var_2 = var_1 - getteamscore( var_0 );

    return var_2;
}

_id_8107( var_0 )
{
    var_1 = level._id_E763;

    if ( !game["switchedsides"] )
    {
        var_1 /= 2;
        var_2 = scripts\mp\utility\game::_id_81CB() / 60000 + 0.0001;
        var_3 = getteamscore( var_0 ) / var_2;
    }
    else
    {
        var_1 = int( var_1 / 2 );
        var_2 = scripts\mp\utility\game::_id_81CB() / 60000 + 0.0001;
        var_4 = getteamscore( var_0 );

        if ( var_4 >= var_1 )
            var_3 = ( var_4 - var_1 ) / var_2;
        else
            return 0;
    }

    return var_3;
}

_id_8378()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\mp\utility\game::_id_1383E( 3 );
    thread scripts\mp\utility\game::_id_115DE( "callout_lastteammemberalive", self, self.pers["team"] );

    foreach ( var_1 in level._id_115DA )
    {
        if ( self.pers["team"] != var_1 )
            thread scripts\mp\utility\game::_id_115DE( "callout_lastenemyalive", self, var_1 );
    }

    scripts\mp\music_and_dialog::_id_C54B( self );
}

_id_D9AA()
{
    var_0 = 0;

    foreach ( var_2 in level.players )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_2._id_41F4 = var_0;
        var_0++;

        if ( level._id_DADB && var_2.name.size > level._id_B4B3 )
        {
            var_3 = "";

            for ( var_4 = 0; var_4 < level._id_B4B3 - 3; var_4++ )
                var_3 += var_2.name[var_4];

            var_3 += "...";
        }
        else
            var_3 = var_2.name;

        setclientmatchdata( "players", var_2._id_41F4, "username", var_3 );
        setclientmatchdata( "players", var_2._id_41F4, "clanTag", var_2 getclantag() );
        setclientmatchdata( "players", var_2._id_41F4, "xuidHigh", var_2 _meth_8565() );
        setclientmatchdata( "players", var_2._id_41F4, "xuidLow", var_2 _meth_8566() );
        setclientmatchdata( "players", var_2._id_41F4, "isBot", isbot( var_2 ) );
        setclientmatchdata( "players", var_2._id_41F4, "uniqueClientId", var_2._id_41F0 );
        var_2 setrankedplayerdata( "common", "round", "clientMatchIndex", var_2._id_41F4 );
    }

    scripts\mp\scoreboard::_id_D9AB();
    sendclientmatchdata();

    if ( scripts\mp\codcasterclientmatchdata::_id_10036() )
        thread scripts\mp\codcasterclientmatchdata::_id_F22C();
}

_id_11AF7( var_0, var_1 )
{
    thread _id_117B7( var_0, 1, "deaths" );
}

_id_11AC8( var_0, var_1 )
{
    if ( isdefined( self ) && isplayer( self ) )
    {
        if ( var_1 != "MOD_FALLING" )
        {
            if ( var_1 == "MOD_MELEE" && issubstr( var_0, "tactical" ) )
            {
                scripts\mp\matchdata::_id_AF94( "tactical", "kills", 1 );
                scripts\mp\matchdata::_id_AF94( "tactical", "hits", 1 );
                scripts\mp\persistence::_id_93F9( "tactical", "kills", 1 );
                scripts\mp\persistence::_id_93F9( "tactical", "hits", 1 );
                return;
            }

            if ( var_1 == "MOD_MELEE" && !scripts\mp\weapons::_id_9F2D( var_0 ) && !scripts\mp\weapons::_id_9E6D( var_0 ) && !scripts\mp\weapons::isaxeweapon( var_0 ) )
            {
                scripts\mp\matchdata::_id_AF94( "none", "kills", 1 );
                scripts\mp\matchdata::_id_AF94( "none", "hits", 1 );
                scripts\mp\persistence::_id_93F9( "none", "kills", 1 );
                scripts\mp\persistence::_id_93F9( "none", "hits", 1 );
                return;
            }

            thread _id_117B7( var_0, 1, "kills" );
        }

        if ( var_1 == "MOD_HEAD_SHOT" )
            thread _id_117B7( var_0, 1, "headShots" );
    }
}

_id_FB1D( var_0, var_1, var_2 )
{
    if ( !var_1 )
        return;

    var_3 = scripts\mp\utility\game::_id_8225( var_0 );
    var_4 = getweaponvariantindex( var_0 );

    if ( var_3 == "killstreak" || var_3 == "other" && var_0 != "trophy_mp" || var_3 == "other" && var_0 != "player_trophy_system_mp" || var_3 == "other" && var_0 != "super_trophy_mp" )
        return;

    if ( scripts\mp\utility\game::_id_9DE2( var_0 ) )
        return;

    if ( var_3 == "weapon_grenade" || var_3 == "weapon_explosive" || var_0 == "trophy_mp" || var_0 == "adrenaline_mist_mp" || var_0 == "domeshield_mp" || var_0 == "copycat_grenade_mp" || var_0 == "speed_strip_mp" || var_0 == "forcepush_mp" || var_0 == "portal_generator_mp" )
    {
        var_5 = scripts\mp\utility\game::_id_11150( var_0, "_mp" );
        scripts\mp\persistence::_id_93FC( var_5, var_2, var_1 );
        scripts\mp\matchdata::_id_AFDC( var_5, var_2, var_1, var_4 );
        return;
    }

    if ( !isdefined( self._id_11AF0 ) )
        self._id_11AF0 = var_0;

    if ( var_0 != self._id_11AF0 )
    {
        scripts\mp\persistence::_id_12F5E();
        self._id_11AF0 = var_0;
    }

    switch ( var_2 )
    {
        case "shots":
            self._id_11AF1++;
            break;
        case "hits":
            self._id_11AEE++;
            break;
        case "headShots":
            self._id_11AED++;
            break;
        case "kills":
            self._id_11AEF++;
            break;
    }

    if ( var_2 == "deaths" )
    {
        var_6 = undefined;
        var_7 = scripts\mp\utility\game::_id_8234( var_0 );

        if ( !scripts\mp\utility\game::_id_9D78( var_7 ) && !scripts\mp\utility\game::_id_9D79( var_7 ) )
            return;

        var_8 = scripts\mp\utility\game::_id_821A( var_0 );
        scripts\mp\persistence::_id_93FC( var_7, var_2, var_1 );
        scripts\mp\matchdata::_id_AFDC( var_7, "deaths", var_1, var_4 );

        foreach ( var_10 in var_8 )
        {
            scripts\mp\persistence::_id_93F9( var_10, var_2, var_1 );
            scripts\mp\matchdata::_id_AF94( var_10, var_2, var_1 );
        }
    }
}

_id_F759( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        return;

    if ( !isdefined( var_0 ) )
    {
        var_1 _id_FB1D( var_2, 1, "hits" );
        return;
    }

    if ( !isdefined( var_0._id_D35E ) )
        var_0._id_D35E = [];

    var_3 = 1;

    for ( var_4 = 0; var_4 < var_0._id_D35E.size; var_4++ )
    {
        if ( var_0._id_D35E[var_4] == self )
        {
            var_3 = 0;
            break;
        }
    }

    if ( var_3 )
    {
        var_0._id_D35E[var_0._id_D35E.size] = self;
        var_1 _id_FB1D( var_2, 1, "hits" );
    }
}

_id_117B7( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    waittillframeend;
    _id_FB1D( var_0, var_1, var_2 );
}

_id_12F23()
{
    foreach ( var_1 in level.players )
    {
        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 scripts\mp\utility\game::_id_DCD5() )
        {
            var_2 = getmatchspm( var_1 );
            var_3 = var_1 getrankedplayerdata( "mp", "globalSPM" );
            var_4 = var_1 getrankedplayerdata( "mp", "gamesPlayed" );
            var_5 = var_1 getrankedplayerdata( "mp", "dlcEggStatus" );

            if ( var_5 > 0 )
                var_4 = int( max( var_4 - var_5, 1 ) );

            var_3 *= ( var_4 - 1 );
            var_6 = var_2;

            if ( var_4 > 0 )
                var_6 = ( var_3 + var_2 ) / var_4;

            var_1 setrankedplayerdata( "mp", "globalSPM", int( var_6 ) );
            var_7 = _func_09F( level.gametype );

            if ( var_7 >= 0 && var_7 < level._id_B4A0 )
            {
                var_8 = var_1 getrankedplayerdata( "mp", "gameModeScoreHistory", var_7, "index" );
                var_1 setrankedplayerdata( "mp", "gameModeScoreHistory", var_7, "scores", var_8, int( var_2 ) );
                var_8 = ( var_8 + 1 ) % level._id_B4A1;
                var_1 setrankedplayerdata( "mp", "gameModeScoreHistory", var_7, "index", var_8 );
            }
        }
    }
}

_id_3E16()
{
    foreach ( var_1 in level.players )
    {
        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 scripts\mp\utility\game::_id_DCD5() )
        {
            var_2 = var_1 getrankedplayerdata( "common", "round", "kills" );
            var_3 = var_1 getrankedplayerdata( "common", "round", "deaths" );
            var_4 = var_1.pers["summary"]["xp"];
            var_5 = var_1 getrankedplayerdata( "mp", "bestKills" );
            var_6 = var_1 getrankedplayerdata( "mp", "mostDeaths" );
            var_7 = var_1 getrankedplayerdata( "mp", "mostXp" );
            var_8 = var_1 getrankedplayerdata( "mp", "bestSPM", "score" );
            var_9 = var_1 getrankedplayerdata( "mp", "bestKD", "score" );

            if ( var_2 > var_5 )
                var_1 setrankedplayerdata( "mp", "bestKills", var_2 );

            if ( var_4 > var_7 )
                var_1 setrankedplayerdata( "mp", "mostXp", var_4 );

            if ( var_3 > var_6 )
                var_1 setrankedplayerdata( "mp", "mostDeaths", var_3 );

            var_10 = var_2;

            if ( var_3 > 1 )
                var_10 /= var_3;

            var_10 = int( var_10 * 1000 );

            if ( var_10 > var_9 )
            {
                var_1 setrankedplayerdata( "mp", "bestKD", "score", var_10 );
                var_1 setrankedplayerdata( "mp", "bestKD", "time", getsystemtime() );
            }

            var_11 = getmatchspm( var_1 );

            if ( var_11 > var_8 )
            {
                var_1 setrankedplayerdata( "mp", "bestSPM", "score", int( var_11 ) );
                var_1 setrankedplayerdata( "mp", "bestSPM", "time", getsystemtime() );
            }

            var_1 _id_3E0C();
            var_1 scripts\mp\matchdata::_id_AFD7( var_4, "totalXp" );
            var_1 scripts\mp\matchdata::_id_AFD7( var_1.pers["summary"]["score"], "scoreXp" );
            var_1 scripts\mp\matchdata::_id_AFD7( var_1.pers["summary"]["challenge"], "challengeXp" );
            var_1 scripts\mp\matchdata::_id_AFD7( var_1.pers["summary"]["match"], "matchXp" );
            var_1 scripts\mp\matchdata::_id_AFD7( var_1.pers["summary"]["misc"], "miscXp" );
            var_1 scripts\mp\matchdata::_id_AFD7( var_1.pers["summary"]["medal"], "medalXp" );
            var_1 scripts\mp\matchdata::_id_AFD7( var_1.pers["summary"]["bonusXP"], "bonusXp" );
        }

        if ( isdefined( var_1.pers["confirmed"] ) )
            var_1 scripts\mp\matchdata::_id_AFC6();

        if ( isdefined( var_1.pers["denied"] ) )
            var_1 scripts\mp\matchdata::_id_AFC7();
    }
}

updateleaderboardstatscontinuous()
{
    level endon( "game_ended" );
    level endon( "stop_leaderboard_stats" );
    var_0 = 0;

    for (;;)
    {
        while ( !isdefined( level.players ) || level.players.size == 0 )
            scripts\engine\utility::waitframe();

        if ( var_0 >= level.players.size )
            var_0 = 0;

        var_1 = level.players[var_0];

        if ( !isdefined( var_1 ) || isai( var_1 ) )
            scripts\engine\utility::waitframe();
        else
        {
            if ( var_1 scripts\mp\utility\game::_id_DCD5() )
                var_1 updateplayerleaderboardstats();

            wait 0.1;
        }

        var_0++;
    }
}

updateleaderboardstats()
{
    foreach ( var_1 in level.players )
    {
        if ( !isdefined( var_1 ) || isai( var_1 ) )
            continue;

        if ( var_1 scripts\mp\utility\game::_id_DCD5() )
            var_1 updateplayerleaderboardstats();
    }
}

updateplayerleaderboardstats()
{
    var_0 = undefined;

    if ( level._id_8B38 )
        var_0 = "hc";
    else
        var_0 = "";

    var_0 += level.gametype;
    var_1 = scripts\engine\utility::ter_op( level.teambased, self.score, self.pers["gamemodeScore"] );
    incrementleaderboardstat( var_0 + "Score", var_1 );
    var_2 = scripts\mp\persistence::_id_10E36( "round", "timePlayed", 0 );
    incrementleaderboardstat( var_0 + "TimePlayed", var_2 );
    incrementleaderboardstat( var_0 + "Kills", self.pers["kills"] );
    incrementleaderboardstat( var_0 + "Deaths", self.pers["deaths"] );

    switch ( level.gametype )
    {
        case "war":
            incrementleaderboardstat( var_0 + "Assists", self.pers["assists"] );
            break;
        case "front":
            incrementleaderboardstat( var_0 + "Assists", self.pers["assists"] );
            break;
        case "dm":
            updateleaderboardstatmaximum( var_0 + "Streak", self.pers["killChains"] );
            break;
        case "dom":
            incrementleaderboardstat( var_0 + "Captures", self.pers["captures"] );
            incrementleaderboardstat( var_0 + "Defends", self.pers["defends"] );
            break;
        case "sd":
            incrementleaderboardstat( var_0 + "Plants", self.pers["plants"] );
            incrementleaderboardstat( var_0 + "Defuses", self.pers["defuses"] );
            break;
        case "conf":
            incrementleaderboardstat( var_0 + "Confirms", self.pers["confirmed"] );
            incrementleaderboardstat( var_0 + "Denies", self.pers["denied"] );
            break;
        case "koth":
            incrementleaderboardstat( var_0 + "ObjTime", self.pers["objTime"] );
            incrementleaderboardstat( var_0 + "Defends", self.pers["defends"] );
            break;
        case "tdef":
            incrementleaderboardstat( var_0 + "ObjTime", self.pers["objTime"] );
            incrementleaderboardstat( var_0 + "Captures", self.pers["defends"] );
            break;
        case "ball":
            incrementleaderboardstat( var_0 + "Throws", self.pers["fieldgoals"] );
            incrementleaderboardstat( var_0 + "Carries", self.pers["touchdowns"] );
            break;
        case "ctf":
            incrementleaderboardstat( var_0 + "Captures", self.pers["captures"] );
            incrementleaderboardstat( var_0 + "Returns", self.pers["returns"] );
            break;
        case "sr":
            incrementleaderboardstat( var_0 + "Plants", self.pers["plants"] );
            incrementleaderboardstat( var_0 + "Rescues", self.pers["rescues"] );
            break;
        case "siege":
            incrementleaderboardstat( var_0 + "Captures", self.pers["captures"] );
            incrementleaderboardstat( var_0 + "Revives", self.pers["rescues"] );
            break;
        case "grind":
            incrementleaderboardstat( var_0 + "Banks", self.pers["confirmed"] );
            incrementleaderboardstat( var_0 + "Denies", self.pers["denied"] );
            break;
        case "infect":
            incrementleaderboardstat( var_0 + "Time", scripts\mp\utility\game::getpersstat( "extrascore0" ) );
            incrementleaderboardstat( var_0 + "Infected", self.pers["killsAsInfected"] );
            break;
        case "gun":
            incrementleaderboardstat( var_0 + "Stabs", self.pers["stabs"] );
            incrementleaderboardstat( var_0 + "SetBacks", self.pers["setbacks"] );
            break;
        case "grnd":
            incrementleaderboardstat( var_0 + "ObjTime", self.pers["objTime"] );
            incrementleaderboardstat( var_0 + "Defends", self.pers["defends"] );
            break;
    }
}

incrementleaderboardstat( var_0, var_1 )
{
    if ( !isdefined( self.leaderboardstartvalues ) )
        self.leaderboardstartvalues = [];

    if ( !isdefined( self.leaderboardstartvalues[var_0] ) )
        self.leaderboardstartvalues[var_0] = self getrankedplayerdata( "mp", "leaderBoardData", var_0 );

    var_2 = int( max( self.leaderboardstartvalues[var_0] + var_1, self.leaderboardstartvalues[var_0] ) );
    self setrankedplayerdata( "mp", "leaderBoardData", var_0, var_2 );
}

updateleaderboardstatmaximum( var_0, var_1 )
{
    var_2 = self getrankedplayerdata( "mp", "leaderBoardData", var_0 );

    if ( var_1 > var_2 )
        self setrankedplayerdata( "mp", "leaderBoardData", var_0, var_1 );
}

getmatchspm( var_0 )
{
    var_1 = scripts\engine\utility::ter_op( level.teambased, var_0.score, var_0.pers["gamemodeScore"] );
    var_2 = var_0 scripts\mp\persistence::_id_10E36( "round", "timePlayed", 0 );

    if ( isdefined( var_2 ) && var_2 > 0 )
    {
        var_3 = var_2 / 60;
        var_1 /= var_3;
    }

    return var_1;
}

_id_9FD2( var_0 )
{
    var_1 = scripts\mp\utility\game::_id_8225( var_0 );
    return isdefined( var_0 ) && var_0 != "" && !scripts\mp\utility\game::_id_9E6C( var_0 ) && var_1 != "killstreak" && var_1 != "other";
}

_id_3E0C()
{
    var_0 = scripts\mp\matchdata::_id_322A();
    var_1 = "";
    var_2 = -1;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_0[var_3];
        var_4 = scripts\mp\utility\game::_id_8234( var_4 );

        if ( _id_9FD2( var_4 ) )
        {
            var_5 = self getrankedplayerdata( "mp", "weaponStats", var_4, "kills" );

            if ( var_5 > var_2 )
            {
                var_1 = var_4;
                var_2 = var_5;
            }
        }
    }

    var_6 = self getrankedplayerdata( "mp", "weaponStats", var_1, "shots" );
    var_7 = self getrankedplayerdata( "mp", "weaponStats", var_1, "headShots" );
    var_8 = self getrankedplayerdata( "mp", "weaponStats", var_1, "hits" );
    var_9 = self getrankedplayerdata( "mp", "weaponStats", var_1, "deaths" );
    var_10 = 0;
    self setrankedplayerdata( "mp", "bestWeapon", "kills", var_2 );
    self setrankedplayerdata( "mp", "bestWeapon", "shots", var_6 );
    self setrankedplayerdata( "mp", "bestWeapon", "headShots", var_7 );
    self setrankedplayerdata( "mp", "bestWeapon", "hits", var_8 );
    self setrankedplayerdata( "mp", "bestWeapon", "deaths", var_9 );
    self setrankedplayerdata( "mp", "bestWeaponXP", var_10 );
    var_11 = int( tablelookup( "mp/statstable.csv", 4, var_1, 0 ) );
    self setrankedplayerdata( "mp", "bestWeaponIndex", var_11 );
}

_id_1C73( var_0 )
{
    self notify( "allow_weapon_mp()" );

    if ( var_0 )
    {
        if ( isdefined( self._id_1CB2 ) && !self hasweapon( self._id_1CB2 ) )
            scripts\mp\utility\game::_id_1136C( self._id_A978 );

        self._id_1CB2 = undefined;
    }
    else
    {
        self._id_1CB2 = self getcurrentprimaryweapon();
        thread _id_13AAA();
    }
}

_id_1C74()
{
    level._id_1C73 = ::_id_1C73;
}

_id_13AAA()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "allow_weapon_mp()" );

    for (;;)
    {
        self waittill( "weapon_switch_invalid", var_0 );
        self._id_1CB2 = var_0;
    }
}

ismp_init()
{
    level.ismp = 1;
}

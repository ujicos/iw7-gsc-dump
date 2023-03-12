// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_7F00()
{
    _id_12EEC();

    if ( !level.placement["all"].size )
        return undefined;
    else
        return level.placement["all"][0];
}

ishighestscoringplayertied()
{
    if ( level.placement["all"].size > 1 )
    {
        var_0 = _id_12B4( level.placement["all"][0] );
        var_1 = _id_12B4( level.placement["all"][1] );
        return var_0 == var_1;
    }

    return 0;
}

_id_7F83()
{
    _id_12EEC();
    var_0 = level.placement["all"];
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( var_3 == level.placement["all"][0] )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_8392( var_0, var_1 )
{
    if ( isdefined( level.ignorescoring ) && !issubstr( var_0, "assist" ) )
        return;

    if ( !level.teambased )
    {
        foreach ( var_3 in level.players )
        {
            if ( scripts\mp\utility\game::issimultaneouskillenabled() )
            {
                if ( var_3 != self )
                    continue;

                if ( level._id_E763 > 1 && var_3.pers["score"] >= level._id_E763 )
                    return;
            }
            else if ( level._id_E763 > 1 && var_3.pers["score"] >= level._id_E763 )
                return;
        }
    }

    var_3 = self;

    if ( isdefined( self.owner ) && !isbot( self ) )
        var_3 = self.owner;

    if ( !isplayer( var_3 ) )
        return;

    var_5 = var_1;

    if ( isdefined( level.onplayerscore ) )
        var_1 = [[ level.onplayerscore ]]( var_0, var_3, var_1 );

    if ( var_1 == 0 )
        return;

    var_3.pers["score"] = int( max( var_3.pers["score"] + var_1, 0 ) );
    var_3 scripts\mp\persistence::_id_10E12( "score", var_5 );

    if ( var_3.pers["score"] >= 65000 )
        var_3.pers["score"] = 65000;

    var_3.score = var_3.pers["score"];
    var_6 = var_3.score;
    var_3 scripts\mp\persistence::statsetchild( "round", "score", var_6 );
    var_3 scripts\mp\gamelogic::checkplayerscorelimitsoon();
    thread scripts\mp\gamelogic::checkscorelimit();

    if ( scripts\mp\utility\game::matchmakinggame() && isdefined( level.nojip ) && !level.nojip && level.gametype != "infect" )
        var_3 checkffascorejip();

    var_3 scripts\mp\utility\game::_id_316C( "earned_score_buffered", var_1 );
    scripts\mp\analyticslog::_id_AFAD( var_1, gettime(), scripts\mp\rank::getscoreinfocategory( var_0, "eventID" ) );
    var_3 scripts\mp\matchdata::_id_AFD8( var_0 );
}

_id_13D4( var_0, var_1 )
{
    if ( var_1 == var_0.pers["score"] )
        return;

    if ( var_1 < 0 )
        return;

    var_0.pers["score"] = var_1;
    var_0.score = var_0.pers["score"];
    thread scripts\mp\gamelogic::checkscorelimit();
}

_id_12B4( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self;

    return var_0.pers["score"];
}

checkffascorejip()
{
    if ( level._id_E763 > 0 )
    {
        var_0 = self.score / level._id_E763 * 100;

        if ( var_0 > level._id_EC3F )
        {
            setnojipscore( 1 );
            level.nojip = 1;
        }
    }
}

giveteamscoreforobjective( var_0, var_1, var_2 )
{
    if ( scripts\mp\utility\game::cantiebysimultaneouskill() )
        var_2 = 1;

    if ( isdefined( level.ignorescoring ) )
        return;

    if ( var_2 )
    {
        if ( level._id_E763 > 1 && game["teamScores"][var_0] >= level._id_E763 )
            return;
    }
    else if ( level._id_E763 > 1 && game["teamScores"][var_0] >= level._id_E763 || level._id_E763 > 1 && game["teamScores"][level._id_C74B[var_0]] >= level._id_E763 )
        return;

    _id_13D6( var_0, _id_12B6( var_0 ) + var_1, var_2 );
    level notify( "update_team_score", var_0, _id_12B6( var_0 ) );
    var_3 = _id_8242( var_2 );

    if ( !level._id_10A56 && var_3 != "none" && var_3 != level._id_1391F && gettime() - level._id_AA1E > 5000 && scripts\mp\utility\game::_id_8105() != 1 )
    {
        level._id_AA1E = gettime();
        scripts\mp\utility\game::_id_AAE7( "lead_taken", var_3, "status" );

        if ( level._id_1391F != "none" )
            scripts\mp\utility\game::_id_AAE7( "lead_lost", level._id_1391F, "status" );
    }

    if ( var_3 != "none" )
    {
        level._id_1391F = var_3;
        var_4 = _id_12B6( var_3 );
        var_5 = level._id_E763;

        if ( var_4 == 0 || var_5 == 0 )
            return;

        var_6 = var_4 / var_5 * 100;

        if ( !scripts\mp\utility\game::_id_9F32() && isdefined( level.nojip ) && !level.nojip )
        {
            if ( var_6 > level._id_EC3F )
            {
                setnojipscore( 1 );
                level.nojip = 1;
            }
        }
    }
}

_id_8242( var_0 )
{
    var_1 = level._id_115DA;

    if ( !isdefined( level._id_1391F ) )
        level._id_1391F = "none";

    var_2 = "none";
    var_3 = 0;

    if ( level._id_1391F != "none" )
    {
        var_2 = level._id_1391F;
        var_3 = game["teamScores"][level._id_1391F];
    }

    var_4 = 1;

    foreach ( var_6 in var_1 )
    {
        if ( var_6 == level._id_1391F )
            continue;

        if ( game["teamScores"][var_6] > var_3 )
        {
            var_2 = var_6;
            var_3 = game["teamScores"][var_6];
            var_4 = 1;
            continue;
        }

        if ( game["teamScores"][var_6] == var_3 )
        {
            var_4 += 1;
            var_2 = "none";
        }
    }

    return var_2;
}

_id_13D6( var_0, var_1, var_2 )
{
    if ( var_1 < 0 )
        var_1 = 0;

    if ( var_1 == game["teamScores"][var_0] )
        return;

    game["teamScores"][var_0] = var_1;
    _id_12F3B( var_0 );
    thread scripts\mp\gamelogic::_id_E75E( var_0, var_2 );
}

_id_12F3B( var_0 )
{
    var_1 = 0;

    if ( !scripts\mp\utility\game::_id_9F32() || !scripts\mp\utility\game::_id_9EBD() || scripts\mp\utility\game::_id_9EA9() )
        var_1 = _id_12B6( var_0 );
    else
        var_1 = game["roundsWon"][var_0];

    setteamscore( var_0, int( var_1 ) );
}

_id_12F4A( var_0 )
{
    if ( !isdefined( game["totalScore"] ) )
    {
        game["totalScore"] = [];
        game["totalScore"]["axis"] = 0;
        game["totalScore"]["allies"] = 0;
    }

    var_1 = scripts\mp\utility\game::_id_8240();

    switch ( var_1 )
    {
        case "roundsWon":
            game["teamScores"][var_0] = game["roundsWon"][var_0];
            break;
        case "teamScores":
            if ( scripts\mp\utility\game::_id_9900() )
                game["teamScores"][var_0] = game["preOvertimeScore"][var_0] + game["overtimeScore"][var_0] + game["teamScores"][var_0];
            else if ( scripts\mp\utility\game::_id_E269() )
            {
                game["totalScore"][var_0] += game["teamScores"][var_0];
                game["teamScores"][var_0] = game["totalScore"][var_0];
            }

            break;
    }

    setteamscore( var_0, int( game["teamScores"][var_0] ) );
}

_id_12EE5()
{
    if ( game["overtimeRoundsPlayed"] == 0 )
    {
        if ( !isdefined( game["preOvertimeScore"] ) )
        {
            game["preOvertimeScore"] = [];
            game["preOvertimeScore"]["allies"] = 0;
            game["preOvertimeScore"]["axis"] = 0;
        }

        game["preOvertimeScore"]["allies"] = game["teamScores"]["allies"] + game["totalScore"]["allies"];
        game["preOvertimeScore"]["axis"] = game["teamScores"]["axis"] + game["totalScore"]["axis"];
    }

    if ( !isdefined( game["overtimeScore"] ) )
    {
        game["overtimeScore"] = [];
        game["overtimeScore"]["allies"] = 0;
        game["overtimeScore"]["axis"] = 0;
    }

    game["overtimeScore"]["allies"] += game["teamScores"]["allies"] - game["preOvertimeScore"]["allies"];
    game["overtimeScore"]["axis"] += game["teamScores"]["axis"] - game["preOvertimeScore"]["axis"];

    if ( !scripts\mp\utility\game::_id_A00B() )
    {
        game["teamScores"][game["attackers"]] = 0;
        setteamscore( game["attackers"], 0 );
        game["teamScores"][game["defenders"]] = 0;
        setteamscore( game["defenders"], 0 );

        if ( scripts\mp\utility\game::_id_9FAB() && game["timeToBeatTeam"] == game["attackers"] )
        {
            game["teamScores"][game["attackers"]] = game["timeToBeatScore"];
            _id_12F3B( game["attackers"] );
            game["overtimeScore"][game["attackers"]] -= game["timeToBeatScore"];
        }

        if ( scripts\mp\utility\game::_id_9FAB() && game["timeToBeatTeam"] == game["defenders"] )
        {
            game["teamScores"][game["defenders"]] = game["timeToBeatScore"];
            _id_12F3B( game["defenders"] );
            game["overtimeScore"][game["defenders"]] -= game["timeToBeatScore"];
        }
    }
}

_id_12B6( var_0 )
{
    return int( game["teamScores"][var_0] );
}

_id_E0ED()
{
    var_0 = 0;
    var_1 = level.placement["all"].size;
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        if ( level.placement["all"][var_3] == self )
            var_2 = 1;

        if ( var_2 )
            level.placement["all"][var_3] = level.placement["all"][var_3 + 1];
    }

    if ( !var_2 )
        return;

    level.placement["all"][var_1 - 1] = undefined;

    if ( level._id_BDCC )
        _id_BD7B();

    if ( level.teambased )
    {
        _id_12F3A();
        return;
    }
}

_id_12EEC()
{
    var_0 = [];

    foreach ( var_2 in level.players )
    {
        if ( isdefined( var_2._id_4530 ) )
            continue;

        if ( var_2.pers["team"] == "spectator" || var_2.pers["team"] == "none" )
            continue;

        var_0[var_0.size] = var_2;
    }

    for ( var_4 = 1; var_4 < var_0.size; var_4++ )
    {
        var_2 = var_0[var_4];
        var_5 = var_2.score;

        for ( var_6 = var_4 - 1; var_6 >= 0 && _id_7E06( var_2, var_0[var_6] ) == var_2; var_6-- )
            var_0[var_6 + 1] = var_0[var_6];

        var_0[var_6 + 1] = var_2;
    }

    level.placement["all"] = var_0;

    if ( level._id_BDCC )
        _id_BD7B();
    else if ( level.teambased )
        _id_12F3A();
}

_id_7E06( var_0, var_1 )
{
    if ( var_0.score > var_1.score )
        return var_0;

    if ( var_1.score > var_0.score )
        return var_1;

    if ( var_0.deaths < var_1.deaths )
        return var_0;

    if ( var_1.deaths < var_0.deaths )
        return var_1;

    if ( scripts\engine\utility::_id_4347() )
        return var_0;
    else
        return var_1;
}

_id_12F3A()
{
    var_0["allies"] = [];
    var_0["axis"] = [];
    var_0["spectator"] = [];
    var_1 = level.placement["all"];
    var_2 = var_1.size;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = var_1[var_3];
        var_5 = var_4.pers["team"];
        var_0[var_5][var_0[var_5].size] = var_4;
    }

    level.placement["allies"] = var_0["allies"];
    level.placement["axis"] = var_0["axis"];
}

_id_BD7B()
{
    var_0["spectator"] = [];

    foreach ( var_2 in level._id_115DA )
        var_0[var_2] = [];

    var_4 = level.placement["all"];
    var_5 = var_4.size;

    for ( var_6 = 0; var_6 < var_5; var_6++ )
    {
        var_7 = var_4[var_6];
        var_8 = var_7.pers["team"];
        var_0[var_8][var_0[var_8].size] = var_7;
    }

    foreach ( var_2 in level._id_115DA )
        level.placement[var_2] = var_0[var_2];
}

_id_D98C( var_0, var_1, var_2 )
{
    if ( isdefined( level.assists_disabled ) )
        return;

    _id_D98D( var_0, var_1, var_2 );
}

_id_D98D( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    var_0 endon( "disconnect" );
    var_3 = undefined;
    var_4 = undefined;
    var_5 = undefined;

    if ( isdefined( var_0._id_9E92 ) )
    {
        var_4 = var_0.attackers;
        var_3 = 1;
    }

    if ( isdefined( var_0._id_B370 ) )
        var_5 = var_0._id_B370;

    wait 0.05;
    scripts\mp\utility\game::_id_13842();
    var_6 = self.pers["team"];

    if ( var_6 != "axis" && var_6 != "allies" )
        return;

    if ( var_6 == var_0.pers["team"] && level.teambased )
        return;

    var_7 = undefined;
    var_8 = "assist";

    if ( !level.teambased )
        var_8 = "assist_ffa";

    var_9 = scripts\mp\rank::getscoreinfovalue( var_8 );

    if ( !level.teambased )
    {
        if ( var_2 )
            var_7 = var_9 + var_9;

        thread scripts\mp\utility\game::_id_83B4( "assist_ffa", var_1, var_7 );
    }
    else if ( scripts\mp\utility\game::_id_12D6( "specialty_mark_targets" ) && ( isdefined( var_4 ) && scripts\engine\utility::array_contains( var_4, self ) ) )
    {
        if ( var_2 )
        {
            var_10 = scripts\mp\rank::getscoreinfovalue( "assistMarked" );
            var_7 = var_9 + var_10;
        }

        thread scripts\mp\utility\game::givestreakpointswithtext( "assistMarked", var_1, var_7 );
        _id_8392( "assist", var_9 );
    }
    else if ( isdefined( var_5 ) && scripts\mp\utility\game::_id_2287( var_5, scripts\mp\utility\game::_id_81EC() ) )
        thread scripts\mp\utility\game::givestreakpointswithtext( "assistPing", var_1, undefined );
    else
    {
        if ( var_2 )
            var_7 = var_9 + var_9;

        thread scripts\mp\utility\game::_id_83B4( "assist", var_1, var_7 );
    }

    if ( level.teambased )
    {
        foreach ( var_12 in level.players )
        {
            if ( self.team != var_12.team || self == var_12 )
                continue;

            if ( !scripts\mp\utility\game::isreallyalive( var_12 ) )
                continue;

            if ( distancesquared( self.origin, var_12.origin ) < 90000 )
            {
                self._id_B930["buddy_kill"] = 1;
                break;
            }
        }
    }

    if ( scripts\mp\utility\game::_id_12D6( "specialty_hardline" ) && isdefined( self.hardlineactive ) )
    {
        if ( self.hardlineactive["assists"] == 1 )
            thread scripts\mp\utility\game::givestreakpointswithtext( "assist_hardline", var_1, undefined );

        self notify( "assist_hardline" );
    }

    scripts\mp\utility\game::incperstat( "assists", 1 );
    self.assists = scripts\mp\utility\game::getpersstat( "assists" );
    scripts\mp\persistence::statsetchild( "round", "assists", self.assists );
    scripts\mp\utility\game::_id_316C( "assist_buffered", self._id_B930 );
    thread scripts\mp\missions::_id_D366( var_0 );
    thread scripts\mp\intelchallenges::_id_99B8( var_0 );

    if ( level._id_7669 )
        scripts\mp\utility\game::_id_F7DF( "streakPoints", scripts\engine\utility::ter_op( isdefined( self._id_110EE ), self._id_110EE, 0 ) );
}

_id_D9B5( var_0 )
{
    if ( isdefined( level.assists_disabled ) )
        return;

    _id_D9B6( var_0 );
}

_id_D9B6( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "disconnect" );
    wait 0.05;
    scripts\mp\utility\game::_id_13842();

    if ( self.pers["team"] != "axis" && self.pers["team"] != "allies" )
        return;

    if ( self.pers["team"] == var_0.pers["team"] )
        return;

    thread scripts\mp\utility\game::_id_83B4( "shield_assist" );
    scripts\mp\utility\game::incperstat( "assists", 1 );
    self.assists = scripts\mp\utility\game::getpersstat( "assists" );
    scripts\mp\persistence::statsetchild( "round", "assists", self.assists );
    thread scripts\mp\missions::_id_D366( var_0 );
}

_id_97D2()
{
    self.buffedbyplayers = [];
    self.debuffedbyplayers = [];
}

_id_11ACE( var_0, var_1, var_2 )
{
    if ( isplayer( var_1 ) )
    {
        if ( !isdefined( var_1.debuffedbyplayers[var_2] ) )
            var_1.debuffedbyplayers[var_2] = [];

        var_1.debuffedbyplayers[var_2][var_0 getentitynumber()] = var_0;
    }
}

_id_12D6F( var_0, var_1, var_2 )
{
    if ( isplayer( var_1 ) && isdefined( var_1.debuffedbyplayers[var_2] ) )
        var_1.debuffedbyplayers[var_2][var_0 getentitynumber()] = undefined;
}

_id_11ACF( var_0, var_1, var_2, var_3 )
{
    var_1 endon( "spawned_player" );
    var_1 endon( "disconnect" );
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    _id_11ACE( var_0, var_1, var_2 );
    wait( var_3 );
    _id_12D6F( var_0, var_1, var_2 );
}

_id_8BE1( var_0, var_1 )
{
    if ( isdefined( var_0.debuffedbyplayers[var_1] ) )
    {
        var_0.debuffedbyplayers[var_1] = scripts\engine\utility::_id_22BC( var_0.debuffedbyplayers[var_1] );
        return var_0.debuffedbyplayers[var_1].size > 0;
    }

    return 0;
}

_id_7E64( var_0, var_1 )
{
    if ( isdefined( var_0.debuffedbyplayers[var_1] ) )
    {
        var_0.debuffedbyplayers[var_1] = scripts\engine\utility::_id_22BC( var_0.debuffedbyplayers[var_1] );

        if ( var_0.debuffedbyplayers[var_1].size > 0 )
            return var_0.debuffedbyplayers[var_1];
    }

    return undefined;
}

_id_11AC9( var_0, var_1, var_2 )
{
    if ( var_0 != var_1 )
    {
        var_3 = var_1.buffedbyplayers[var_2];

        if ( !isdefined( var_1.buffedbyplayers[var_2] ) )
            var_1.buffedbyplayers[var_2] = [];

        var_1.buffedbyplayers[var_2][var_0 getentitynumber()] = var_0;
    }
}

_id_12D6E( var_0, var_1, var_2 )
{
    if ( var_0 != var_1 && isdefined( var_1.buffedbyplayers[var_2] ) )
        var_1.buffedbyplayers[var_2][var_0 getentitynumber()] = undefined;
}

_id_11ACA( var_0, var_1, var_2, var_3 )
{
    var_1 endon( "spawned_player" );
    var_1 endon( "disconnect" );
    level endon( "game_ended" );
    _id_11AC9( var_0, var_1, var_2 );
    wait( var_3 );
    _id_12D6E( var_0, var_1, var_2 );
}

awardbuffdebuffassists( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_9, var_4 in var_1.debuffedbyplayers )
    {
        foreach ( var_8, var_6 in var_4 )
        {
            if ( isdefined( var_6 ) && var_6.team != "spectator" && var_6 scripts\mp\utility\game::isenemy( var_1 ) )
            {
                var_7 = var_6.guid;

                if ( !isdefined( var_2[var_7] ) )
                    var_2[var_7] = var_6;
            }
        }
    }

    foreach ( var_4 in var_0.buffedbyplayers )
    {
        foreach ( var_8, var_6 in var_4 )
        {
            if ( isdefined( var_6 ) && var_6.team != "spectator" && var_6 scripts\mp\utility\game::isenemy( var_1 ) )
            {
                var_7 = var_6.guid;

                if ( !isdefined( var_2[var_7] ) )
                    var_2[var_7] = var_6;
            }
        }
    }

    foreach ( var_7, var_6 in var_2 )
    {
        if ( !isdefined( var_1.attackerdata ) || !isdefined( var_1.attackerdata[var_6.guid] ) )
            scripts\mp\damage::addattacker( var_1, var_6, undefined, "none", 0, undefined, undefined, undefined, undefined, undefined );
    }
}

gamemodeusesdeathmatchscoring( var_0 )
{
    return var_0 == "dm" || var_0 == "sotf_ffa";
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_115C1 = getdvarint( "scr_teambalance" );
    level._id_B488 = getmaxclients();
    _id_F7F6();
    level._id_7371 = [];

    if ( level.teambased )
    {
        level thread _id_C56E();
        level thread _id_12F37();
        wait 0.15;
        level thread _id_12EF3();
        level thread finalizeplayertimes();
    }
    else
    {
        level thread _id_C532();
        wait 0.15;
        level thread _id_12E95();
    }

    if ( scripts\mp\utility\game::matchmakinggame() )
        level thread watchafk();
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_C541();
        var_0 thread _id_C540();
        var_0 thread onplayerspawned();
        var_0 thread _id_11B01();
    }
}

_id_C532()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_11B01();
    }
}

_id_C541()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        _id_12F3E();
    }
}

_id_C540()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_spectators" );
        self.pers["teamTime"] = undefined;
    }
}

_id_11B01()
{
    self endon( "disconnect" );
    self._id_1190E["allies"] = 0;
    self._id_1190E["axis"] = 0;
    self._id_1190E["free"] = 0;
    self._id_1190E["other"] = 0;
    self._id_1190E["total"] = 0;
    self._id_1190E["missionTeam"] = 0;

    if ( !isdefined( self.pers["validKickTime"] ) )
        self.pers["validKickTime"] = 0;

    scripts\mp\utility\game::_id_7670( "prematch_done" );

    while ( !level._id_7669 )
    {
        wait 1.0;

        if ( self._id_0291 == "allies" )
        {
            self._id_1190E["allies"]++;
            self._id_1190E["total"]++;
            self._id_1190E["missionTeam"]++;

            if ( scripts\mp\utility\game::isreallyalive( self ) )
                self.pers["validKickTime"]++;

            continue;
        }

        if ( self._id_0291 == "axis" )
        {
            self._id_1190E["axis"]++;
            self._id_1190E["total"]++;
            self._id_1190E["missionTeam"]++;

            if ( scripts\mp\utility\game::isreallyalive( self ) )
                self.pers["validKickTime"]++;

            continue;
        }

        if ( self._id_0291 == "none" )
        {
            if ( isdefined( self.pers["team"] ) && self.pers["team"] == "allies" )
                self._id_1190E["allies"]++;
            else if ( isdefined( self.pers["team"] ) && self.pers["team"] == "axis" )
                self._id_1190E["axis"]++;

            self._id_1190E["total"]++;
            self._id_1190E["missionTeam"]++;

            if ( scripts\mp\utility\game::isreallyalive( self ) )
                self.pers["validKickTime"]++;

            continue;
        }

        if ( self._id_0291 == "spectator" )
            self._id_1190E["other"]++;
    }
}

_id_12EF3()
{
    level endon( "game_ended" );

    for (;;)
    {
        scripts\mp\hostmigration::waittillhostmigrationdone();

        foreach ( var_1 in level.players )
            var_1 _id_12EEE();

        wait 10.0;
    }
}

finalizeplayertimes()
{
    while ( !level._id_7669 )
        wait 2.0;

    foreach ( var_1 in level.players )
    {
        var_1 _id_12EEE();
        var_1 scripts\mp\persistence::_id_13E04();
        var_1 scripts\mp\persistence::_id_12F5E();
    }
}

_id_12EEE()
{
    if ( isai( self ) )
        return;

    if ( !scripts\mp\utility\game::_id_DCD5() )
    {
        if ( self._id_1190E["allies"] )
        {
            scripts\mp\persistence::_id_10E13( "timePlayedAllies", self._id_1190E["allies"], 1 );
            scripts\mp\persistence::_id_10E13( "timePlayedTotal", self._id_1190E["allies"], 1 );
            scripts\mp\persistence::_id_10E16( "round", "timePlayed", self._id_1190E["allies"], 1 );
        }

        if ( self._id_1190E["axis"] )
        {
            scripts\mp\persistence::_id_10E13( "timePlayedOpfor", self._id_1190E["axis"], 1 );
            scripts\mp\persistence::_id_10E13( "timePlayedTotal", self._id_1190E["axis"], 1 );
            scripts\mp\persistence::_id_10E16( "round", "timePlayed", self._id_1190E["axis"], 1 );
        }

        if ( self._id_1190E["other"] )
        {
            scripts\mp\persistence::_id_10E13( "timePlayedOther", self._id_1190E["other"], 1 );
            scripts\mp\persistence::_id_10E13( "timePlayedTotal", self._id_1190E["other"], 1 );
            scripts\mp\persistence::_id_10E16( "round", "timePlayed", self._id_1190E["other"], 1 );
        }
    }
    else
    {
        if ( self._id_1190E["allies"] )
        {
            scripts\mp\persistence::_id_10E13( "timePlayedAllies", self._id_1190E["allies"] );
            scripts\mp\persistence::_id_10E13( "timePlayedTotal", self._id_1190E["allies"] );
            scripts\mp\persistence::_id_10E16( "round", "timePlayed", self._id_1190E["allies"] );
            scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 0, self._id_1190E["allies"], self._id_316A["xpMaxMultiplierTimePlayed"][0] );
            scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 1, self._id_1190E["allies"], self._id_316A["xpMaxMultiplierTimePlayed"][1] );
            scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 2, self._id_1190E["allies"], self._id_316A["xpMaxMultiplierTimePlayed"][2] );
            scripts\mp\persistence::_id_10E17( "challengeXPMultiplierTimePlayed", 0, self._id_1190E["allies"], self._id_316A["challengeXPMaxMultiplierTimePlayed"][0] );
            scripts\mp\persistence::_id_10E17( "weaponXPMultiplierTimePlayed", 0, self._id_1190E["allies"], self._id_316A["weaponXPMaxMultiplierTimePlayed"][0] );
        }

        if ( self._id_1190E["axis"] )
        {
            scripts\mp\persistence::_id_10E13( "timePlayedOpfor", self._id_1190E["axis"] );
            scripts\mp\persistence::_id_10E13( "timePlayedTotal", self._id_1190E["axis"] );
            scripts\mp\persistence::_id_10E16( "round", "timePlayed", self._id_1190E["axis"] );
            scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 0, self._id_1190E["axis"], self._id_316A["xpMaxMultiplierTimePlayed"][0] );
            scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 1, self._id_1190E["axis"], self._id_316A["xpMaxMultiplierTimePlayed"][1] );
            scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 2, self._id_1190E["axis"], self._id_316A["xpMaxMultiplierTimePlayed"][2] );
            scripts\mp\persistence::_id_10E17( "challengeXPMultiplierTimePlayed", 0, self._id_1190E["axis"], self._id_316A["challengeXPMaxMultiplierTimePlayed"][0] );
            scripts\mp\persistence::_id_10E17( "weaponXPMultiplierTimePlayed", 0, self._id_1190E["axis"], self._id_316A["weaponXPMaxMultiplierTimePlayed"][0] );
        }

        if ( self._id_1190E["other"] )
        {
            scripts\mp\persistence::_id_10E13( "timePlayedOther", self._id_1190E["other"] );
            scripts\mp\persistence::_id_10E13( "timePlayedTotal", self._id_1190E["other"] );
            scripts\mp\persistence::_id_10E16( "round", "timePlayed", self._id_1190E["other"] );
            scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 0, self._id_1190E["other"], self._id_316A["xpMaxMultiplierTimePlayed"][0] );
            scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 1, self._id_1190E["other"], self._id_316A["xpMaxMultiplierTimePlayed"][1] );
            scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 2, self._id_1190E["other"], self._id_316A["xpMaxMultiplierTimePlayed"][2] );
            scripts\mp\persistence::_id_10E17( "challengeXPMultiplierTimePlayed", 0, self._id_1190E["other"], self._id_316A["challengeXPMaxMultiplierTimePlayed"][0] );
            scripts\mp\persistence::_id_10E17( "weaponXPMultiplierTimePlayed", 0, self._id_1190E["other"], self._id_316A["weaponXPMaxMultiplierTimePlayed"][0] );
        }

        if ( self._id_1190E["missionTeam"] )
        {
            if ( scripts\mp\utility\game::_id_DCD5() && isdefined( self._id_9978 ) && isdefined( self._id_9978._id_4C0D ) )
            {
                var_0 = self._id_B8D4;
                var_1 = self getrankedplayerdata( "mp", "missionTeamPerformanceData", var_0, "timePlayed" );
                self setrankedplayerdata( "mp", "missionTeamPerformanceData", var_0, "timePlayed", var_1 + self._id_1190E["missionTeam"] );
            }
        }
    }

    if ( game["state"] == "postgame" )
        return;

    self._id_1190E["allies"] = 0;
    self._id_1190E["axis"] = 0;
    self._id_1190E["other"] = 0;
    self._id_1190E["missionTeam"] = 0;
}

_id_12F3E()
{
    if ( game["state"] != "playing" )
        return;

    self.pers["teamTime"] = gettime();
}

_id_12F38()
{
    for (;;)
    {
        var_0 = getdvarint( "scr_teambalance" );

        if ( level._id_115C1 != var_0 )
            level._id_115C1 = getdvarint( "scr_teambalance" );

        wait 1;
    }
}

_id_12F37()
{
    level._id_115D7 = level._id_B488 / 2;
    level thread _id_12F38();
    wait 0.15;

    if ( level._id_115C1 && scripts\mp\utility\game::_id_9F32() )
    {
        if ( isdefined( game["BalanceTeamsNextRound"] ) )
            scripts\mp\hud_message::_id_10123( "MP_AUTOBALANCE_NEXT_ROUND" );

        level waittill( "restarting" );

        if ( isdefined( game["BalanceTeamsNextRound"] ) )
        {
            level _id_2765();
            game["BalanceTeamsNextRound"] = undefined;
        }
        else if ( !_id_81A2() )
            game["BalanceTeamsNextRound"] = 1;
    }
    else
    {
        level endon( "game_ended" );

        for (;;)
        {
            if ( level._id_115C1 )
            {
                if ( !_id_81A2() )
                {
                    scripts\mp\hud_message::_id_10123( "MP_AUTOBALANCE_SECONDS", 15 );
                    wait 15.0;

                    if ( !_id_81A2() )
                        level _id_2765();
                }

                wait 59.0;
            }

            wait 1.0;
        }
    }
}

_id_81A2()
{
    level.team["allies"] = 0;
    level.team["axis"] = 0;
    var_0 = level.players;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        if ( isdefined( var_0[var_1].pers["team"] ) && var_0[var_1].pers["team"] == "allies" )
        {
            level.team["allies"]++;
            continue;
        }

        if ( isdefined( var_0[var_1].pers["team"] ) && var_0[var_1].pers["team"] == "axis" )
            level.team["axis"]++;
    }

    if ( level.team["allies"] > level.team["axis"] + level._id_115C1 || level.team["axis"] > level.team["allies"] + level._id_115C1 )
        return 0;
    else
        return 1;
}

_id_2765()
{
    iprintlnbold( game["strings"]["autobalance"] );
    var_0 = [];
    var_1 = [];
    var_2 = level.players;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( !isdefined( var_2[var_3].pers["teamTime"] ) )
            continue;

        if ( isdefined( var_2[var_3].pers["team"] ) && var_2[var_3].pers["team"] == "allies" )
        {
            var_0[var_0.size] = var_2[var_3];
            continue;
        }

        if ( isdefined( var_2[var_3].pers["team"] ) && var_2[var_3].pers["team"] == "axis" )
            var_1[var_1.size] = var_2[var_3];
    }

    var_4 = undefined;

    while ( var_0.size > var_1.size + 1 || var_1.size > var_0.size + 1 )
    {
        if ( var_0.size > var_1.size + 1 )
        {
            for ( var_5 = 0; var_5 < var_0.size; var_5++ )
            {
                if ( isdefined( var_0[var_5]._id_5940 ) )
                    continue;

                if ( !isdefined( var_4 ) )
                {
                    var_4 = var_0[var_5];
                    continue;
                }

                if ( var_0[var_5].pers["teamTime"] > var_4.pers["teamTime"] )
                    var_4 = var_0[var_5];
            }

            var_4 [[ level._id_C5B1 ]]( "axis" );
        }
        else if ( var_1.size > var_0.size + 1 )
        {
            for ( var_5 = 0; var_5 < var_1.size; var_5++ )
            {
                if ( isdefined( var_1[var_5]._id_5940 ) )
                    continue;

                if ( !isdefined( var_4 ) )
                {
                    var_4 = var_1[var_5];
                    continue;
                }

                if ( var_1[var_5].pers["teamTime"] > var_4.pers["teamTime"] )
                    var_4 = var_1[var_5];
            }

            var_4 [[ level._id_C5B1 ]]( "allies" );
        }

        var_4 = undefined;
        var_0 = [];
        var_1 = [];
        var_2 = level.players;

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
        {
            if ( isdefined( var_2[var_3].pers["team"] ) && var_2[var_3].pers["team"] == "allies" )
            {
                var_0[var_0.size] = var_2[var_3];
                continue;
            }

            if ( isdefined( var_2[var_3].pers["team"] ) && var_2[var_3].pers["team"] == "axis" )
                var_1[var_1.size] = var_2[var_3];
        }
    }
}

_id_F7F6()
{
    _id_F6B8();
}

_id_D3D8( var_0, var_1 )
{

}

_id_46BB()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_115DA.size; var_1++ )
        var_0[level._id_115DA[var_1]] = 0;

    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        if ( level.players[var_1] == self )
            continue;

        if ( level.players[var_1].pers["team"] == "spectator" )
            continue;

        if ( isdefined( level.players[var_1].pers["team"] ) )
            var_0[level.players[var_1].pers["team"]]++;
    }

    return var_0;
}

_id_F6B8()
{
    if ( !isdefined( level._id_503D ) )
    {
        level._id_503D = [];
        level._id_503D["allies"] = "mp_warfighter_head_1_3";
        level._id_503D["axis"] = "mp_warfighter_head_1_3";
    }

    if ( !isdefined( level._id_5033 ) )
    {
        level._id_5033 = [];
        level._id_5033["allies"] = "mp_warfighter_body_1_3";
        level._id_5033["axis"] = "mp_warfighter_body_1_3";
    }

    if ( !isdefined( level._id_5050 ) )
    {
        level._id_5050 = [];
        level._id_5050["allies"] = "viewhands_us_rangers_urban";
        level._id_5050["axis"] = "viewhands_us_rangers_woodland";
    }

    if ( !isdefined( level.dropscavengerfordeath ) )
    {
        level.dropscavengerfordeath = [];
        level.dropscavengerfordeath["allies"] = "delta";
        level.dropscavengerfordeath["axis"] = "delta";
    }
}

_id_F68D( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_8C98 ) )
        self _meth_8096( self._id_8C98 );

    self setmodel( var_0 );
    self setviewmodel( var_2 );
    self attach( var_1, "", 1 );
    self._id_8C98 = var_1;
}

_id_72A5( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;
    var_3 = [];

    switch ( var_0 )
    {
        case 1:
            var_1 = "mp_warfighter_body_1_3";
            var_2 = "mp_warfighter_head_1_3";
            break;
        case 2:
            var_1 = "mp_body_heavy_1_2";
            var_2 = "mp_head_heavy_1_2";
            break;
        case 3:
            if ( level.gametype == "infect" )
            {
                var_1 = "mp_synaptic_body_1_4";
                var_2 = "mp_synaptic_head_1_4";
            }
            else
            {
                var_1 = "mp_synaptic_body_1_1";
                var_2 = "mp_synaptic_head_1_1";
            }

            break;
        case 4:
            var_1 = "mp_ftl_body_3_1";
            var_2 = "mp_ftl_head_5_1";
            break;
        case 5:
            var_1 = "mp_stryker_body_2_1";
            var_2 = "mp_stryker_head_3_1";
            break;
        case 6:
            var_1 = "mp_ghost_body_1_3";
            var_2 = "mp_ghost_head_1_1";
            break;
    }

    self _meth_84FB( var_1, var_2 );
    var_4 = self getcustomizationbody();
    var_5 = self getcustomizationhead();
    var_6 = self getcustomizationviewmodel();
    _id_F68D( var_4, var_5, var_6 );
}

_id_7E55()
{
    var_0 = undefined;
    var_1 = undefined;
    var_2 = [];
    var_3 = _id_8078();
    var_4 = _id_8073();
    self._id_006A = var_3;
    self._id_0171 = var_4;
    var_0 = tablelookupbyrow( "mp/cac/bodies.csv", var_3, 1 );
    var_1 = tablelookupbyrow( "mp/cac/heads.csv", var_4, 1 );
    var_2["body"] = var_0;
    var_2["head"] = var_1;
    return var_2;
}

_id_F7A2()
{
    var_0 = _id_7E55();
    self _meth_84FB( var_0["body"], var_0["head"] );
    var_1 = self getcustomizationbody();
    var_2 = self getcustomizationhead();
    var_3 = self getcustomizationviewmodel();
    _id_F68D( var_1, var_2, var_3 );
}

_id_F6BE()
{
    var_0 = level._id_5033[self.team];
    var_1 = level._id_503D[self.team];
    var_2 = level._id_5050[self.team];
    _id_F68D( var_0, var_1, var_2 );
}

_id_8078()
{
    if ( level.rankedmatch )
        return self getrankedplayerdata( "rankedloadouts", "squadMembers", "body" );
    else
        return self getrankedplayerdata( "privateloadouts", "squadMembers", "body" );
}

_id_8073()
{
    if ( level.rankedmatch )
        return self getrankedplayerdata( "rankedloadouts", "squadMembers", "head" );
    else
        return self getrankedplayerdata( "privateloadouts", "squadMembers", "head" );
}

_id_8070( var_0 )
{
    return tablelookup( "mp/cac/bodies.csv", 0, var_0, 5 );
}

_id_8079( var_0 )
{
    return tablelookup( "mp/cac/bodies.csv", 0, var_0, 1 );
}

_id_FADC()
{
    if ( isai( self ) || level.gametype == "infect" && self.team == "allies" && isdefined( self.infected_archtype ) && self.infected_archtype == "archetype_scout" )
        var_0 = scripts\mp\archetypes\archcommon::_id_80F3( self._id_AE62 ) + 1;
    else if ( isdefined( self._id_3C56 ) )
        var_0 = scripts\mp\archetypes\archcommon::_id_80F3( self._id_3C56._id_2123 ) + 1;
    else
        var_0 = getdvarint( "forceArchetype", 0 );

    if ( level.gametype == "infect" && self.team == "axis" )
        var_0 = 3;

    if ( isplayer( self ) && var_0 == 0 )
        _id_F7A2();
    else
        _id_72A5( var_0 );

    if ( !isai( self ) )
    {
        var_1 = _id_8078();
        self._id_006A = var_1;
        var_2 = _id_8070( var_1 );
    }
    else
        self _meth_82C6( "vestLight" );

    self._id_13525 = level.dropscavengerfordeath[self.team];

    if ( scripts\mp\utility\game::_id_9D46() && !isai( self ) )
    {
        var_3 = _id_8079( _id_8078() );

        if ( issubstr( var_3, "fullbody_sniper" ) )
            thread _id_72B2();
    }

    if ( scripts\mp\utility\game::isjuggernaut() )
    {
        if ( isdefined( self._id_9E5D ) && self._id_9E5D )
            thread [[ game[self.team + "_model"]["JUGGERNAUT_MANIAC"] ]]();
        else if ( isdefined( self._id_9E5C ) && self._id_9E5C )
            thread [[ game[self.team + "_model"]["JUGGERNAUT_CUSTOM"] ]]();
        else
            thread [[ game[self.team + "_model"]["JUGGERNAUT"] ]]();
    }
}

_id_72B2()
{
    if ( self.team == "axis" )
    {
        self setmodel( "mp_fullbody_heavy" );
        self setviewmodel( "viewmodel_mp_warfighter_1" );
    }
    else
    {
        self setmodel( "mp_body_infected_a" );
        self setviewmodel( "viewmodel_mp_warfighter_1" );
    }

    if ( isdefined( self._id_8C98 ) )
    {
        self _meth_8096( self._id_8C98, "" );
        self._id_8C98 = undefined;
    }

    self attach( "head_mp_infected", "", 1 );
    self._id_8C98 = "head_mp_infected";
    self _meth_82C6( "cloth" );
}

_id_12E95()
{
    if ( !level.rankedmatch )
        return;

    var_0 = 0;

    for (;;)
    {
        var_0++;

        if ( var_0 >= level.players.size )
            var_0 = 0;

        if ( isdefined( level.players[var_0] ) )
            level.players[var_0] _id_12E94();

        wait 1.0;
    }
}

_id_12E94()
{
    if ( isai( self ) )
        return;

    if ( !scripts\mp\utility\game::_id_DCD5() )
    {
        if ( self._id_1190E["allies"] )
        {
            scripts\mp\persistence::_id_10E13( "timePlayedAllies", self._id_1190E["allies"], 1 );
            scripts\mp\persistence::_id_10E13( "timePlayedTotal", self._id_1190E["allies"], 1 );
            scripts\mp\persistence::_id_10E16( "round", "timePlayed", self._id_1190E["allies"], 1 );
        }

        if ( self._id_1190E["axis"] )
        {
            scripts\mp\persistence::_id_10E13( "timePlayedOpfor", self._id_1190E["axis"], 1 );
            scripts\mp\persistence::_id_10E13( "timePlayedTotal", self._id_1190E["axis"], 1 );
            scripts\mp\persistence::_id_10E16( "round", "timePlayed", self._id_1190E["axis"], 1 );
        }

        if ( self._id_1190E["other"] )
        {
            scripts\mp\persistence::_id_10E13( "timePlayedOther", self._id_1190E["other"], 1 );
            scripts\mp\persistence::_id_10E13( "timePlayedTotal", self._id_1190E["other"], 1 );
            scripts\mp\persistence::_id_10E16( "round", "timePlayed", self._id_1190E["other"], 1 );
        }

        return;
    }

    if ( self._id_1190E["allies"] )
    {
        scripts\mp\persistence::_id_10E13( "timePlayedAllies", self._id_1190E["allies"] );
        scripts\mp\persistence::_id_10E13( "timePlayedTotal", self._id_1190E["allies"] );
        scripts\mp\persistence::_id_10E16( "round", "timePlayed", self._id_1190E["allies"] );
        scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 0, self._id_1190E["allies"], self._id_316A["xpMaxMultiplierTimePlayed"][0] );
        scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 1, self._id_1190E["allies"], self._id_316A["xpMaxMultiplierTimePlayed"][1] );
        scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 2, self._id_1190E["allies"], self._id_316A["xpMaxMultiplierTimePlayed"][2] );
    }

    if ( self._id_1190E["axis"] )
    {
        scripts\mp\persistence::_id_10E13( "timePlayedOpfor", self._id_1190E["axis"] );
        scripts\mp\persistence::_id_10E13( "timePlayedTotal", self._id_1190E["axis"] );
        scripts\mp\persistence::_id_10E16( "round", "timePlayed", self._id_1190E["axis"] );
        scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 0, self._id_1190E["axis"], self._id_316A["xpMaxMultiplierTimePlayed"][0] );
        scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 1, self._id_1190E["axis"], self._id_316A["xpMaxMultiplierTimePlayed"][1] );
        scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 2, self._id_1190E["axis"], self._id_316A["xpMaxMultiplierTimePlayed"][2] );
    }

    if ( self._id_1190E["other"] )
    {
        scripts\mp\persistence::_id_10E13( "timePlayedOther", self._id_1190E["other"] );
        scripts\mp\persistence::_id_10E13( "timePlayedTotal", self._id_1190E["other"] );
        scripts\mp\persistence::_id_10E16( "round", "timePlayed", self._id_1190E["other"] );
        scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 0, self._id_1190E["other"], self._id_316A["xpMaxMultiplierTimePlayed"][0] );
        scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 1, self._id_1190E["other"], self._id_316A["xpMaxMultiplierTimePlayed"][1] );
        scripts\mp\persistence::_id_10E17( "xpMultiplierTimePlayed", 2, self._id_1190E["other"], self._id_316A["xpMaxMultiplierTimePlayed"][2] );
    }

    self._id_1190E["allies"] = 0;
    self._id_1190E["axis"] = 0;
    self._id_1190E["other"] = 0;
}

watchafk()
{
    var_0 = 0;

    for (;;)
    {
        var_0++;

        if ( var_0 >= level.players.size )
            var_0 = 0;

        if ( isdefined( level.players[var_0] ) )
        {
            if ( isai( level.players[var_0] ) )
                continue;

            level.players[var_0] checkforafk();
        }

        wait 1.0;
        scripts\mp\hostmigration::waittillhostmigrationdone();
    }
}

checkforafk()
{
    if ( scripts\mp\utility\game::istrue( level._id_7669 ) )
        return;

    if ( !isdefined( self.pers["validKickTime"] ) )
        self.pers["validKickTime"] = 0;

    var_0 = self.pers["validKickTime"];
    var_1 = 0;
    var_2 = self.pers["kills"];
    var_3 = self.pers["assists"];
    var_4 = var_2 == 0 && var_3 == 0;

    if ( isdefined( self.pers["stanceTracking"] ) && var_0 > 30 )
    {
        var_5 = self.pers["stanceTracking"]["crouch"] / var_0;

        if ( var_5 > 1.0 )
            var_1 = 1;
    }

    if ( var_4 && var_0 > 60 )
    {
        if ( !isdefined( self.pers["distTrackingPassed"] ) )
        {
            if ( level.gametype == "infect" )
            {
                if ( self.team == "axis" )
                    var_1 = 1;
            }
            else
                var_1 = 1;
        }
    }

    if ( var_4 && var_0 > 120 )
    {
        if ( !isdefined( self._id_A96A ) || self._id_A96A + 60000 < gettime() )
        {
            switch ( level.gametype )
            {
                case "gun":
                    if ( scripts\mp\utility\game::istrue( level.kick_afk_check ) )
                        var_1 = 1;

                    break;
            }
        }
    }

    if ( var_1 && !isgamebattlematch() )
        kick( self getentitynumber(), "EXE_PLAYERKICKED_INACTIVE", 1 );
}

getjointeampermissions( var_0 )
{
    var_1 = 0;
    var_2 = 0;
    var_3 = level.players;

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = var_3[var_4];

        if ( isdefined( var_5.pers["team"] ) && var_5.pers["team"] == var_0 )
        {
            var_1++;

            if ( isbot( var_5 ) )
                var_2++;
        }
    }

    if ( var_1 < level._id_115D7 )
        return 1;
    else if ( var_2 > 0 )
        return 1;
    else if ( !scripts\mp\utility\game::matchmakinggame() )
        return 1;
    else if ( level.gametype == "infect" )
        return 1;
    else
    {
        bbprint( "mp_exceeded_team_max_error", "player_xuid %s isHost %i", self getxuid(), self ishost() );

        if ( self ishost() )
            wait 1.5;

        setnojiptime( 1 );
        level.nojip = 1;
        kick( self getentitynumber(), "EXE_PLAYERKICKED_INVALIDTEAM" );
        return 0;
    }
}

onplayerspawned()
{
    level endon( "game_ended" );

    for (;;)
        self waittill( "spawned_player" );
}

_id_BD73( var_0 )
{
    return tablelookupistring( "mp/MTTable.csv", 0, var_0, 1 );
}

_id_BD72( var_0 )
{
    return tablelookup( "mp/MTTable.csv", 0, var_0, 2 );
}

_id_BD71( var_0 )
{
    return tablelookup( "mp/MTTable.csv", 0, var_0, 3 );
}

_id_81B5( var_0 )
{
    return tablelookupistring( "mp/factionTable.csv", 0, game[var_0], 1 );
}

_id_81B7( var_0 )
{
    return tablelookupistring( "mp/factionTable.csv", 0, game[var_0], 2 );
}

_id_81AF( var_0 )
{
    return tablelookupistring( "mp/factionTable.csv", 0, game[var_0], 4 );
}

_id_81A8( var_0 )
{
    return tablelookupistring( "mp/factionTable.csv", 0, game[var_0], 3 );
}

_id_81B2( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 5 );
}

_id_81B1( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 6 );
}

_id_81B0( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 17 );
}

_id_81BC( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 7 );
}

_id_81B9( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 8 );
}

_id_81BD( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 9 );
}

_id_81AE( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 10 );
}

_id_81AA( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 11 );
}

_id_81AD( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 12 );
}

_id_81AC( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 13 );
}

_id_81A4( var_0 )
{
    return ( scripts\mp\utility\game::_id_1114F( tablelookup( "mp/factionTable.csv", 0, game[var_0], 14 ) ), scripts\mp\utility\game::_id_1114F( tablelookup( "mp/factionTable.csv", 0, game[var_0], 15 ) ), scripts\mp\utility\game::_id_1114F( tablelookup( "mp/factionTable.csv", 0, game[var_0], 16 ) ) );
}

_id_81A5( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 18 );
}

_id_81A6( var_0 )
{
    return tablelookup( "mp/factionTable.csv", 0, game[var_0], 19 );
}

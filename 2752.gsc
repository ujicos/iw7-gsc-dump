// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    game["round_end"]["draw"] = 1;
    game["round_end"]["round_draw"] = 2;
    game["round_end"]["round_win"] = 3;
    game["round_end"]["round_loss"] = 4;
    game["round_end"]["victory"] = 5;
    game["round_end"]["defeat"] = 6;
    game["round_end"]["halftime"] = 7;
    game["round_end"]["overtime"] = 8;
    game["round_end"]["roundend"] = 9;
    game["round_end"]["intermission"] = 10;
    game["round_end"]["side_switch"] = 11;
    game["round_end"]["match_bonus"] = 12;
    game["round_end"]["tie"] = 13;
    game["round_end"]["spectator"] = 14;
    game["round_end"]["final_round"] = 15;
    game["round_end"]["match_point"] = 16;
    game["end_reason"]["score_limit_reached"] = 1;
    game["end_reason"]["time_limit_reached"] = 2;
    game["end_reason"]["players_forfeited"] = 3;
    game["end_reason"]["target_destroyed"] = 4;
    game["end_reason"]["bomb_defused"] = 5;
    game["end_reason"]["allies_eliminated"] = 6;
    game["end_reason"]["axis_eliminated"] = 7;
    game["end_reason"]["allies_forfeited"] = 8;
    game["end_reason"]["axis_forfeited"] = 9;
    game["end_reason"]["enemies_eliminated"] = 10;
    game["end_reason"]["tie"] = 11;
    game["end_reason"]["objective_completed"] = 12;
    game["end_reason"]["objective_failed"] = 13;
    game["end_reason"]["switching_sides"] = 14;
    game["end_reason"]["round_limit_reached"] = 15;
    game["end_reason"]["ended_game"] = 16;
    game["end_reason"]["host_ended_game"] = 17;
    game["end_reason"]["loss_stat_prevented"] = 18;
    game["end_reason"]["time_to_beat_ctf_win"] = 19;
    game["end_reason"]["time_to_beat_ctf_loss"] = 20;
    game["end_reason"]["time_to_beat_uplink_win"] = 21;
    game["end_reason"]["time_to_beat_uplink_loss"] = 22;
    game["end_reason"]["nuke_end"] = 23;
    game["strings"]["overtime"] = &"MP_OVERTIME";
    level thread _id_C56E();
    level.showerrormessagefunc = ::_id_10122;
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_B0E1();
        var_0 thread _id_10A40();
        var_0 thread _id_68B8();
    }
}

_id_10134( var_0, var_1, var_2 )
{
    if ( !isplayer( self ) )
        return;

    var_3 = undefined;

    if ( scripts\mp\utility\game::istrue( var_2 ) )
        var_3 = 1;

    showsplash( var_0, var_1, undefined, var_3 );
}

showsplash( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;

    if ( isdefined( var_2 ) )
        var_4 = var_2 getentitynumber();

    if ( isdefined( self._id_DDCD ) && self._id_DDCD >= 6 )
    {
        _id_DB99( var_0, var_1, var_2, var_4, var_3 );
        return;
    }

    if ( !scripts\mp\utility\game::isreallyalive( self ) && !self ismlgspectator() )
    {
        _id_DB99( var_0, var_1, var_2, var_4, var_3 );
        return;
    }

    _id_10152( var_0, var_1, var_2, var_4, var_3 );
}

_id_10152( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isplayer( self ) )
        return;

    if ( isdefined( var_3 ) )
    {
        if ( !isdefined( var_2 ) )
            return;
    }

    var_5 = tablelookuprownum( _id_814B(), 0, var_0 );

    if ( !isdefined( var_5 ) || var_5 < 0 )
        return;

    if ( !isdefined( self._id_BFAE ) )
        self._id_BFAE = 0;

    if ( !isdefined( self._id_10A37 ) )
        self._id_10A37 = 1;

    var_6 = var_5;

    if ( self._id_10A37 )
        var_6 |= 2048;

    if ( isdefined( var_1 ) )
        self setclientomnvar( "ui_player_splash_param_" + self._id_BFAE, var_1 );
    else
        self setclientomnvar( "ui_player_splash_param_" + self._id_BFAE, -1 );

    if ( isdefined( var_3 ) )
        self setclientomnvar( "ui_player_splash_cardClientId_" + self._id_BFAE, var_3 );
    else
        self setclientomnvar( "ui_player_splash_cardClientId_" + self._id_BFAE, -1 );

    if ( isdefined( var_4 ) )
        self setclientomnvar( "ui_player_splash_use_alt_" + self._id_BFAE, var_4 );
    else
        self setclientomnvar( "ui_player_splash_use_alt_" + self._id_BFAE, 0 );

    self setclientomnvar( "ui_player_splash_id_" + self._id_BFAE, var_6 );

    if ( !isdefined( self._id_DDCD ) )
        self._id_DDCD = 1;
    else
        self._id_DDCD++;

    thread _id_4103();
    self._id_BFAE++;

    if ( self._id_BFAE >= 6 )
    {
        self._id_BFAE = 0;
        self._id_10A37 = !self._id_10A37;
    }
}

_id_DB99( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnstruct();
    var_5._id_DE3F = var_0;
    var_5._id_C6BB = var_1;
    var_5._id_D390 = var_2;
    var_5.playernumforplayercard = var_3;
    var_5.altdisplayindex = var_4;

    if ( !isdefined( self._id_10A3E ) )
    {
        self._id_10A3E = var_5;
        self._id_10A3F = var_5;
        thread _id_89E9();
    }
    else
    {
        var_6 = self._id_10A3F;
        var_6._id_BFAD = var_5;
        self._id_10A3F = var_5;
    }
}

_id_89E9()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );

    while ( isdefined( self._id_10A3E ) )
    {
        scripts\engine\utility::waittill_any( "splash_list_cleared", "spawned_player" );

        for ( var_0 = 0; var_0 < 6; var_0++ )
        {
            var_1 = self._id_10A3E;
            _id_10152( var_1._id_DE3F, var_1._id_C6BB, var_1._id_D390, var_1.playernumforplayercard, var_1.altdisplayindex );
            self._id_10A3E = var_1._id_BFAD;

            if ( !isdefined( self._id_10A3E ) )
                break;
        }
    }

    self._id_10A3F = undefined;
}

_id_B0E1()
{
    self endon( "disconnect" );
    self._id_B0E0 = [];
    var_0 = "default";

    if ( isdefined( level._id_B0DF ) )
        var_0 = level._id_B0DF;

    var_1 = level._id_B0E5;
    var_2 = level._id_B0E4;
    var_3 = 1.25;

    if ( level._id_10A56 || self issplitscreenplayer() && !isai( self ) )
    {
        var_1 -= 40;
        var_2 = level._id_B0E4 * 1.3;
        var_3 *= 1.5;
    }

    self._id_B0DE = scripts\mp\hud_util::_id_49B2( var_0, var_2 );
    self._id_B0DE _meth_834D( "" );
    self._id_B0DE._id_0049 = 0;
    self._id_B0DE._id_02A4 = 10;
    self._id_B0DE._id_0295 = 0;
    self._id_B0DE scripts\mp\hud_util::_id_F801( "CENTER", level._id_B0E6, 0, var_1 );
    self._id_B0E7 = scripts\mp\hud_util::_id_49B2( "default", var_3 );
    self._id_B0E7 scripts\mp\hud_util::_id_F7D6( self._id_B0DE );
    self._id_B0E7 scripts\mp\hud_util::_id_F801( "TOP", "BOTTOM", 0, 0 );
    self._id_B0E7 _meth_834D( "" );
    self._id_B0E7._id_0049 = 0;
    self._id_B0E7._id_02A4 = 10;
    self._id_B0E7._id_0295 = 0;
}

_id_9DC6()
{
    return 0;
}

_id_115DD( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    var_3 = self.pers["team"];

    if ( self ismlgspectator() )
        var_3 = self _meth_813B();

    if ( !isdefined( var_3 ) || var_3 != "allies" && var_3 != "axis" )
        var_3 = "allies";

    if ( var_0 == "halftime" )
    {
        self setclientomnvar( "ui_round_end_title", game["round_end"]["halftime"] );
        var_0 = "allies";
    }
    else if ( var_0 == "intermission" )
    {
        self setclientomnvar( "ui_round_end_title", game["round_end"]["intermission"] );
        var_0 = "allies";
    }
    else if ( var_0 == "roundend" )
    {
        self setclientomnvar( "ui_round_end_title", game["round_end"]["roundend"] );
        var_0 = "allies";
    }
    else if ( var_0 == "overtime" )
    {
        if ( scripts\mp\utility\game::_id_A00B() && game["teamScores"]["allies"] != game["teamScores"]["axis"] )
            self setclientomnvar( "ui_round_end_title", game["round_end"]["match_point"] );
        else
            self setclientomnvar( "ui_round_end_title", game["round_end"]["overtime"] );

        var_0 = "allies";
    }
    else if ( var_0 == "finalround" )
    {
        self setclientomnvar( "ui_round_end_title", game["round_end"]["final_round"] );
        var_0 = "allies";
    }
    else if ( var_0 == "tie" )
    {
        if ( var_1 && !scripts\mp\utility\game::_id_13916() )
            self setclientomnvar( "ui_round_end_title", game["round_end"]["round_draw"] );
        else
            self setclientomnvar( "ui_round_end_title", game["round_end"]["draw"] );

        var_0 = "allies";
    }
    else if ( self ismlgspectator() )
        self setclientomnvar( "ui_round_end_title", game["round_end"]["spectator"] );
    else if ( isdefined( self.pers["team"] ) && var_0 == var_3 )
    {
        if ( var_1 && !scripts\mp\utility\game::_id_13916() )
            self setclientomnvar( "ui_round_end_title", game["round_end"]["round_win"] );
        else
            self setclientomnvar( "ui_round_end_title", game["round_end"]["victory"] );
    }
    else if ( var_1 && !scripts\mp\utility\game::_id_13916() )
        self setclientomnvar( "ui_round_end_title", game["round_end"]["round_loss"] );
    else
    {
        self setclientomnvar( "ui_round_end_title", game["round_end"]["defeat"] );

        if ( scripts\mp\utility\game::istrue( self._id_A49D ) && scripts\mp\utility\game::_id_DCD5() )
            var_2 = game["end_reason"]["loss_stat_prevented"];
    }

    if ( scripts\mp\utility\game::_id_9900() && scripts\mp\utility\game::_id_13916() && scripts\mp\utility\game::_id_9FAA() )
    {
        if ( level.gametype == "ctf" )
        {
            if ( isdefined( self.pers["team"] ) && var_0 == var_3 )
                var_2 = game["end_reason"]["time_to_beat_ctf_win"];
            else if ( isdefined( self.pers["team"] ) && var_0 == level._id_C74B[self.pers["team"]] )
                var_2 = game["end_reason"]["time_to_beat_ctf_loss"];
        }
        else if ( level.gametype == "ball" )
        {
            if ( isdefined( self.pers["team"] ) && var_0 == var_3 )
                var_2 = game["end_reason"]["time_to_beat_uplink_win"];
            else if ( isdefined( self.pers["team"] ) && var_0 == level._id_C74B[self.pers["team"]] )
                var_2 = game["end_reason"]["time_to_beat_uplink_loss"];
        }
    }

    self setclientomnvar( "ui_round_end_reason", var_2 );

    if ( !scripts\mp\utility\game::_id_9F32() || !scripts\mp\utility\game::_id_9EBD() || scripts\mp\utility\game::_id_9EA9() )
    {
        self setclientomnvar( "ui_round_end_friendly_score", scripts\mp\gamescore::_id_12B6( var_3 ) );
        self setclientomnvar( "ui_round_end_enemy_score", scripts\mp\gamescore::_id_12B6( level._id_C74B[var_3] ) );
    }
    else
    {
        self setclientomnvar( "ui_round_end_friendly_score", game["roundsWon"][var_3] );
        self setclientomnvar( "ui_round_end_enemy_score", game["roundsWon"][level._id_C74B[var_3]] );
    }

    if ( isdefined( self._id_B3DD ) )
        self setclientomnvar( "ui_round_end_match_bonus", self._id_B3DD );
}

_id_C752( var_0, var_1 )
{
    self endon( "disconnect" );
    var_2 = level.placement["all"];
    var_3 = var_2[0];
    var_4 = var_2[1];
    var_5 = var_2[2];

    if ( isstring( var_0 ) && var_0 == "tie" )
    {
        if ( isdefined( var_3 ) && self == var_3 || isdefined( var_4 ) && self == var_4 || isdefined( var_5 ) && self == var_5 )
            self setclientomnvar( "ui_round_end_title", game["round_end"]["tie"] );
        else
            self setclientomnvar( "ui_round_end_title", game["round_end"]["defeat"] );
    }
    else if ( isdefined( var_3 ) && self == var_3 || isdefined( var_4 ) && self == var_4 || isdefined( var_5 ) && self == var_5 )
        self setclientomnvar( "ui_round_end_title", game["round_end"]["victory"] );
    else
    {
        self setclientomnvar( "ui_round_end_title", game["round_end"]["defeat"] );

        if ( scripts\mp\utility\game::istrue( self._id_A49D ) && scripts\mp\utility\game::_id_DCD5() )
            var_1 = game["end_reason"]["loss_stat_prevented"];
    }

    self setclientomnvar( "ui_round_end_reason", var_1 );

    if ( isdefined( self._id_B3DD ) )
        self setclientomnvar( "ui_round_end_match_bonus", self._id_B3DD );
}

_id_814B()
{
    return "mp/splashTable.csv";
}

getsplashtablemaxaltdisplays()
{
    return 5;
}

_id_4103()
{
    self endon( "disconnect" );
    self notify( "cleanupLocalPlayerSplashList()" );
    self endon( "cleanupLocalPlayerSplashList()" );
    scripts\engine\utility::_id_137B7( "death", 0.5 );

    while ( !scripts\mp\utility\game::isreallyalive( self ) && !self ismlgspectator() )
        wait 0.15;

    self._id_DDCD = undefined;
    self notify( "splash_list_cleared" );
}

_id_10A40()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 != "splash_shown" )
            continue;

        var_2 = tablelookupbyrow( _id_814B(), var_1, 0 );
        var_3 = tablelookupbyrow( _id_814B(), var_1, 5 );

        switch ( var_3 )
        {
            case "killstreak_splash":
                _id_C549( var_2 );
                break;
        }
    }
}

_id_C549( var_0 )
{
    scripts\mp\utility\game::_id_D4B6( var_0, "killstreak_earned", 1 );
}

_id_10122( var_0, var_1 )
{
    var_2 = tablelookuprownum( "mp/errorMessages.csv", 0, var_0 );

    if ( isdefined( var_1 ) )
        self setclientomnvar( "ui_mp_error_message_param", var_1 );
    else
        self setclientomnvar( "ui_mp_error_message_param", -1 );

    self setclientomnvar( "ui_mp_error_message_id", var_2 );

    if ( !isdefined( self._id_66BF ) )
        self._id_66BF = 0;

    self._id_66BF = !self._id_66BF;
    self setclientomnvar( "ui_mp_error_trigger", scripts\engine\utility::ter_op( self._id_66BF, 2, 1 ) );
}

_id_10123( var_0, var_1 )
{
    foreach ( var_3 in level.players )
        _id_10122( var_0, var_1 );
}

_id_11750( var_0 )
{
    var_1 = tablelookuprownum( "mp/miscMessages.csv", 0, var_0 );

    if ( isdefined( var_1 ) && var_1 >= 0 )
        return 1;

    return 0;
}

_id_1013D( var_0 )
{
    var_1 = tablelookuprownum( "mp/miscMessages.csv", 0, var_0 );
    var_2 = tablelookupbyrow( "mp/miscMessages.csv", var_1, 3 );

    if ( isdefined( var_2 ) && var_2 != "" )
        self playlocalsound( var_2 );

    self setclientomnvar( "ui_misc_message_id", var_1 );
    self setclientomnvar( "ui_misc_message_trigger", 1 );
}

_id_68B8()
{
    self endon( "disconnect" );
    self waittill( "spawned_player" );
    wait 5.0;

    if ( !isdefined( self ) )
        return;

    if ( !scripts\mp\utility\game::matchmakinggame() )
        return;

    var_0 = self _meth_85BE() > 1;

    if ( getdvarint( "online_mp_xpscale" ) == 2 || var_0 && getdvarint( "online_mp_party_xpscale" ) == 2 )
        showsplash( "event_double_xp" );

    if ( getdvarint( "online_mp_weapon_xpscale" ) == 2 || var_0 && getdvarint( "online_mp_party_weapon_xpscale" ) == 2 )
        showsplash( "event_double_weapon_xp" );

    if ( getdvarint( "online_double_keys" ) > 0 )
        showsplash( "event_double_keys" );

    if ( getdvarint( "online_mp_missionteam_xpscale" ) == 2 || var_0 && getdvarint( "online_mp_party_missionteam_xpscale" ) == 2 )
        showsplash( "event_double_xp_teams" );
}

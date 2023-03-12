// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_EC3A = [];
    var_0 = getdvarint( "online_mp_xpscale" );

    if ( var_0 > 4 || var_0 < 0 )
        exitlevel( 0 );

    _id_17CA( var_0, "online_mp_xpscale" );
    level._id_DCD6 = [];
    level._id_13CBD = [];
    level._id_B4C0 = int( tablelookup( "mp/rankTable.csv", 0, "maxrank", 1 ) );

    for ( var_1 = 0; var_1 <= level._id_B4C0; var_1++ )
    {
        level._id_DCD6[var_1]["minXP"] = tablelookup( "mp/rankTable.csv", 0, var_1, 2 );
        level._id_DCD6[var_1]["xpToNext"] = tablelookup( "mp/rankTable.csv", 0, var_1, 3 );
        level._id_DCD6[var_1]["maxXP"] = tablelookup( "mp/rankTable.csv", 0, var_1, 7 );
        level._id_DCD6[var_1]["splash"] = tablelookup( "mp/rankTable.csv", 0, var_1, 15 );
    }

    scripts\mp\weaponrank::init();
    scripts\mp\missions::_id_31D7();
    level.prestigeextras = [];
    var_2 = 0;

    for (;;)
    {
        var_3 = tablelookupbyrow( "mp/unlocks/prestigeExtrasUnlocks.csv", var_2, 0 );

        if ( !isdefined( var_3 ) || var_3 == "" )
            break;

        level.prestigeextras[var_3] = 1;
        var_2++;
    }

    level thread _id_C56E();
}

_id_9F1E( var_0 )
{
    if ( isdefined( level._id_EC3A[var_0] ) )
        return 1;
    else
        return 0;
}

_id_DF0A( var_0, var_1, var_2 )
{
    level._id_EC3A[var_0][var_1] = var_2;

    if ( var_0 == "kill" && var_1 == "value" )
        setomnvar( "ui_game_type_kill_value", int( var_2 ) );
}

getscoreinfovalue( var_0 )
{
    var_1 = "scr_" + level.gametype + "_score_" + var_0;

    if ( getdvar( var_1 ) != "" )
        return getdvarint( var_1 );
    else
        return level._id_EC3A[var_0]["value"];
}

getscoreinfocategory( var_0, var_1 )
{
    switch ( var_1 )
    {
        case "value":
            var_2 = "scr_" + level.gametype + "_score_" + var_0;

            if ( getdvar( var_2 ) != "" )
                return getdvarint( var_2 );
            else
                return level._id_EC3A[var_0]["value"];
        default:
            return level._id_EC3A[var_0][var_1];
    }
}

getrankinfominxp( var_0 )
{
    return int( level._id_DCD6[var_0]["minXP"] );
}

getrankinfoxpamt( var_0 )
{
    return int( level._id_DCD6[var_0]["xpToNext"] );
}

_id_80CE( var_0 )
{
    return int( level._id_DCD6[var_0]["maxXP"] );
}

_id_80D0( var_0 )
{
    var_1 = getdvarint( "scr_beta_max_level", 0 );

    if ( var_1 > 0 && var_0 + 1 >= var_1 )
        return "ranked_up_beta_max";

    return level._id_DCD6[var_0]["splash"];
}

_id_80CB( var_0 )
{
    return tablelookupistring( "mp/rankTable.csv", 0, var_0, 16 );
}

_id_80CC( var_0, var_1 )
{
    return tablelookup( "mp/rankIconTable.csv", 0, var_0, var_1 + 1 );
}

_id_80CD( var_0 )
{
    return int( tablelookup( "mp/rankTable.csv", 0, var_0, 13 ) );
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isai( var_0 ) )
        {
            if ( var_0 scripts\mp\utility\game::_id_DCD5() )
            {
                var_0.pers["rankxp"] = var_0 getrankedplayerdata( "mp", "progression", "playerLevel", "xp" );
                var_1 = var_0 getrankedplayerdata( "mp", "progression", "playerLevel", "prestige" );

                if ( !isdefined( var_0.pers["xpEarnedThisMatch"] ) )
                    var_0.pers["xpEarnedThisMatch"] = 0;
            }
            else
            {
                var_1 = 0;
                var_0.pers["rankxp"] = 0;
            }
        }
        else
        {
            var_1 = 0;
            var_0.pers["rankxp"] = 0;
        }

        var_0.pers["prestige"] = var_1;

        if ( var_0.pers["rankxp"] < 0 )
            var_0.pers["rankxp"] = 0;

        var_2 = var_0 _id_80C9( var_0 _id_80D2() );
        var_0.pers["rank"] = var_2;
        var_0 setrank( var_2, var_1 );

        if ( var_0._id_41F0 < level._id_B4B0 )
        {
            setmatchdata( "players", var_0._id_41F0, "rank", var_2 );
            setmatchdata( "players", var_0._id_41F0, "Prestige", var_1 );

            if ( !isai( var_0 ) && ( scripts\mp\utility\game::_id_D957() || scripts\mp\utility\game::matchmakinggame() ) )
                setmatchdata( "players", var_0._id_41F0, "isSplitscreen", var_0 issplitscreenplayer() );
        }

        var_0.pers["participation"] = 0;
        var_0._id_EC53 = 0;
        var_0._id_EC43 = 0;
        var_0._id_EC30 = [];
        var_0._id_D702 = 0;
        var_0 setclientdvar( "ui_promotion", 0 );

        if ( !isdefined( var_0.pers["summary"] ) )
        {
            var_0.pers["summary"] = [];
            var_0.pers["summary"]["xp"] = 0;
            var_0.pers["summary"]["score"] = 0;
            var_0.pers["summary"]["challenge"] = 0;
            var_0.pers["summary"]["match"] = 0;
            var_0.pers["summary"]["misc"] = 0;
            var_0.pers["summary"]["medal"] = 0;
            var_0.pers["summary"]["bonusXP"] = 0;
        }

        var_0 setclientdvar( "ui_opensummary", 0 );
        var_0 thread scripts\mp\missions::_id_12E71();
        var_0 thread onplayerspawned();
        var_0 thread _id_C575();

        if ( var_0 scripts\mp\utility\game::_id_DCD5() )
        {
            var_3 = getdvarint( "online_mp_party_xpscale" );
            var_4 = var_0 _meth_85BE() > 1;

            if ( var_4 )
                var_0 _id_1817( var_3, "online_mp_party_xpscale" );

            if ( var_0 getrankedplayerdata( "mp", "prestigeDoubleWeaponXp" ) )
                var_0._id_D882 = 1;
            else
                var_0._id_D882 = 0;
        }

        var_0._id_EC29 = 0;
        var_0._id_EC2B = 0;
        var_0 setclientomnvar( "ui_score_event_control", -1 );
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );

        if ( isai( self ) )
            self.pers["rankxp"] = scripts\mp\utility\game::_id_7BF8();
        else if ( !level.rankedmatch )
            self.pers["rankxp"] = 0;
        else
        {

        }

        _id_D458();
    }
}

_id_D458()
{
    if ( self.pers["rankxp"] < 0 )
        self.pers["rankxp"] = 0;

    var_0 = _id_80C9( _id_80D2() );
    self.pers["rank"] = var_0;

    if ( isai( self ) || !isdefined( self.pers["prestige"] ) )
    {
        if ( level.rankedmatch && isdefined( self._id_316E ) )
            var_1 = _id_8098();
        else
            var_1 = 0;

        self setrank( var_0, var_1 );
        self.pers["prestige"] = var_1;
    }

    if ( isdefined( self._id_41F0 ) && self._id_41F0 < level._id_B4B0 )
    {
        setmatchdata( "players", self._id_41F0, "rank", var_0 );
        setmatchdata( "players", self._id_41F0, "Prestige", self.pers["prestige"] );
    }
}

_id_C575()
{
    self endon( "disconnect" );

    for (;;)
    {
        scripts\engine\utility::waittill_any( "giveLoadout", "changed_kit" );

        if ( issubstr( self.class, "custom" ) )
        {
            if ( !level.rankedmatch )
            {
                self.pers["rankxp"] = 0;
                continue;
            }

            if ( isai( self ) )
            {
                self.pers["rankxp"] = 0;
                continue;
            }
        }
    }
}

_id_839A( var_0, var_1, var_2 )
{
    self endon( "disconnect" );

    if ( isdefined( self.owner ) && !isbot( self ) )
    {
        self.owner _id_839A( var_0, var_1, var_2 );
        return;
    }

    if ( isai( self ) || !isplayer( self ) )
        return;

    if ( !scripts\mp\utility\game::_id_DCD5() )
        return;

    if ( !isdefined( var_1 ) || var_1 == 0 )
        return;

    var_3 = getscoreinfocategory( var_0, "group" );

    if ( !isdefined( var_2 ) )
    {
        if ( var_3 == "medal" || var_3 == "kill_killstreak" )
            var_2 = self getcurrentweapon();
    }

    if ( !isdefined( level._id_72DA ) || !level._id_72DA )
    {
        if ( level.teambased && ( !level._id_115C6["allies"] || !level._id_115C6["axis"] ) )
            return;
        else if ( !level.teambased && level._id_115C6["allies"] + level._id_115C6["axis"] < 2 )
            return;
    }

    var_4 = getscoreinfocategory( var_0, "allowBonus" );
    var_5 = 1.0;
    var_6 = var_1;
    var_7 = 0;

    if ( scripts\mp\utility\game::istrue( var_4 ) )
    {
        var_5 = _id_80D4();
        var_6 = int( var_1 * var_5 );
        var_7 = int( max( var_6 - var_1, 0 ) );
    }

    var_8 = _id_80D2();
    _id_93E3( var_6 );

    if ( _id_12EFA( var_8 ) )
        thread _id_12EFB();

    _id_11390();

    if ( isdefined( var_2 ) && scripts\mp\weaponrank::_id_13CCA( var_2 ) )
        thread scripts\mp\weaponrank::_id_8394( var_2, var_0, var_1 );

    _id_DDF7( var_0, var_1, var_7 );
    var_9 = _id_8098();
    var_10 = _id_80C8();
    thread scripts\mp\analyticslog::_id_AFA2( var_9, var_10, var_1, var_0 );
}

_id_DDF7( var_0, var_1, var_2 )
{
    var_3 = var_1 + var_2;
    var_4 = getscoreinfocategory( var_0, "group" );

    if ( !isdefined( var_4 ) || var_4 == "" )
    {
        self.pers["summary"]["misc"] += var_1;
        self.pers["summary"]["bonusXP"] += var_2;
        self.pers["summary"]["xp"] += var_3;
        return;
    }

    switch ( var_4 )
    {
        case "match_bonus":
            self.pers["summary"]["match"] += var_1;
            self.pers["summary"]["bonusXP"] += var_2;
            self.pers["summary"]["xp"] += var_3;
            break;
        case "challenge":
            self.pers["summary"]["challenge"] += var_1;
            self.pers["summary"]["bonusXP"] += var_2;
            self.pers["summary"]["xp"] += var_3;
            break;
        case "medal":
            self.pers["summary"]["medal"] += var_1;
            self.pers["summary"]["bonusXP"] += var_2;
            self.pers["summary"]["xp"] += var_3;
            break;
        default:
            self.pers["summary"]["score"] += var_1;
            self.pers["summary"]["bonusXP"] += var_2;
            self.pers["summary"]["xp"] += var_3;
            break;
    }
}

_id_12EFA( var_0 )
{
    var_1 = _id_80C8();

    if ( var_1 == self.pers["rank"] || self.pers["rank"] == level._id_B4C0 )
        return 0;

    var_2 = self.pers["rank"];
    self.pers["rank"] = var_1;
    self setrank( var_1 );
    return 1;
}

_id_12EFB()
{
    self endon( "disconnect" );
    self notify( "update_rank" );
    self endon( "update_rank" );
    var_0 = self.pers["team"];

    if ( !isdefined( var_0 ) )
        return;

    if ( !scripts\mp\utility\game::_id_ABF0( "game_over" ) )
        level scripts\engine\utility::_id_137B7( "game_over", 0.25 );

    var_1 = self.pers["rank"];
    var_2 = _id_80D0( var_1 );

    if ( isdefined( var_2 ) && var_2 != "" )
        thread scripts\mp\hud_message::showsplash( var_2, var_1 + 1 );

    for ( var_3 = 0; var_3 < level.players.size; var_3++ )
    {
        var_4 = level.players[var_3];
        var_5 = var_4.pers["team"];

        if ( isdefined( var_5 ) && var_5 == var_0 )
            var_4 iprintln( &"RANK_PLAYER_WAS_PROMOTED", self, var_1 + 1 );
    }
}

_id_DB97( var_0 )
{
    self._id_EC43 += var_0;
}

_id_6F78()
{
    _id_EC42( self._id_EC43 );
    self._id_EC43 = 0;
}

_id_6F79()
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    self notify( "flushScorePointsPopupQueueOnSpawn()" );
    self endon( "flushScorePointsPopupQueueOnSpawn()" );
    self waittill( "spawned_player" );
    wait 0.1;
    _id_6F78();
}

_id_EC42( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );

    if ( var_0 == 0 )
        return;

    if ( !scripts\mp\utility\game::isreallyalive( self ) && !self ismlgspectator() )
    {
        if ( !scripts\mp\utility\game::istrue( var_1 ) || scripts\mp\utility\game::_id_9E4A() )
        {
            _id_DB97( var_0 );
            thread _id_6F79();
            return;
        }
    }

    self notify( "scorePointsPopup" );
    self endon( "scorePointsPopup" );
    self._id_EC53 += var_0;
    self setclientomnvar( "ui_points_popup", self._id_EC53 );
    self setclientomnvar( "ui_points_popup_notify", gettime() );
    wait 1.0;
    self._id_EC53 = 0;
}

_id_C16F()
{
    scripts\engine\utility::waitframe();
    level notify( "update_player_score", self, self._id_EC53 );
}

_id_DB96( var_0 )
{
    self._id_EC30[self._id_EC30.size] = var_0;
}

_id_6F76()
{
    foreach ( var_1 in self._id_EC30 )
        scoreeventpopup( var_1 );

    self._id_EC30 = [];
}

_id_6F77()
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    self notify( "flushScoreEventPopupQueueOnSpawn()" );
    self endon( "flushScoreEventPopupQueueOnSpawn()" );
    self waittill( "spawned_player" );
    wait 0.1;
    _id_6F76();
}

scoreeventpopup( var_0 )
{
    if ( isdefined( self.owner ) )
        self.owner scoreeventpopup( var_0 );

    if ( !isplayer( self ) )
        return;

    var_1 = getscoreinfocategory( var_0, "eventID" );
    var_2 = getscoreinfocategory( var_0, "text" );

    if ( !isdefined( var_1 ) || var_1 < 0 || !isdefined( var_2 ) || var_2 == "" )
        return;

    if ( !scripts\mp\utility\game::isreallyalive( self ) && !self ismlgspectator() )
    {
        _id_DB96( var_0 );
        thread _id_6F77();
        return;
    }

    if ( !isdefined( self._id_EC2C ) )
    {
        self._id_EC2C = 1;
        thread _id_41D7();
    }
    else
    {
        self._id_EC2C++;

        if ( self._id_EC2C > 8 )
        {
            self._id_EC2C = 8;
            return;
        }
    }

    self setclientomnvar( "ui_score_event_list_" + self._id_EC2B, var_1 );
    self setclientomnvar( "ui_score_event_control", self._id_EC29 % 16 );
    self._id_EC2B++;
    self._id_EC2B %= 8;
    self._id_EC29++;
}

_id_41D7()
{
    self endon( "disconnect" );
    self notify( "clearScoreEventListAfterWait()" );
    self endon( "clearScoreEventListAfterWait()" );
    scripts\engine\utility::_id_137B7( "death", 0.5 );
    self._id_EC2C = undefined;
}

_id_80C8()
{
    var_0 = self.pers["rankxp"];
    var_1 = self.pers["rank"];

    if ( var_0 < getrankinfominxp( var_1 ) + getrankinfoxpamt( var_1 ) )
        return var_1;
    else
        return _id_80C9( var_0 );
}

_id_80C9( var_0 )
{
    for ( var_1 = level._id_B4C0; var_1 > 0; var_1-- )
    {
        if ( var_0 >= getrankinfominxp( var_1 ) && var_0 < getrankinfominxp( var_1 ) + getrankinfoxpamt( var_1 ) )
            return var_1;
    }

    return var_1;
}

_id_7F8F()
{
    var_0 = _id_80C8() + 1;
    return ( 3 + var_0 * 0.5 ) * 10;
}

_id_8098()
{
    if ( isai( self ) && isdefined( self.pers["prestige_fake"] ) )
        return self.pers["prestige_fake"];
    else
        return self getrankedplayerdata( "mp", "progression", "playerLevel", "prestige" );
}

_id_80D2()
{
    return self.pers["rankxp"];
}

_id_93E3( var_0 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() )
        return;

    if ( isai( self ) )
        return;

    var_1 = getdvarint( "scr_beta_max_level", 0 );

    if ( var_1 > 0 && _id_80C8() + 1 >= var_1 )
        var_0 = 0;

    var_2 = _id_80D2();
    var_3 = int( min( var_2 + var_0, _id_80CE( level._id_B4C0 ) - 1 ) );

    if ( self.pers["rank"] == level._id_B4C0 && var_3 >= _id_80CE( level._id_B4C0 ) )
        var_3 = _id_80CE( level._id_B4C0 );

    self.pers["xpEarnedThisMatch"] += var_0;
    self.pers["rankxp"] = var_3;
}

_id_11390()
{
    var_0 = _id_80D2();
    self setrankedplayerdata( "mp", "progression", "playerLevel", "xp", var_0 );
}

_id_5118( var_0, var_1, var_2 )
{
    wait( var_0 );
    thread scripts\mp\utility\game::_id_83B4( var_1 );
}

_id_17CA( var_0, var_1 )
{
    level _id_1817( var_0, var_1 );
}

_id_7ED9()
{
    var_0 = level _id_80D3();

    if ( var_0 > 4 || var_0 < 0 )
        exitlevel( 0 );

    return var_0;
}

_id_1817( var_0, var_1 )
{
    if ( !isdefined( self._id_DCD7 ) )
        self._id_DCD7 = [];

    if ( isdefined( self._id_DCD7[var_1] ) )
        self._id_DCD7[var_1] = max( self._id_DCD7[var_1], var_0 );
    else
        self._id_DCD7[var_1] = var_0;
}

_id_80D3()
{
    if ( !isdefined( self._id_DCD7 ) )
        return 1.0;

    var_0 = 1.0;

    foreach ( var_2 in self._id_DCD7 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_0 *= var_2;
    }

    return var_0;
}

_id_E125( var_0 )
{
    level _id_E15F( var_0 );
}

_id_E15F( var_0 )
{
    if ( !isdefined( self._id_DCD7 ) )
        return;

    if ( !isdefined( self._id_DCD7[var_0] ) )
        return;

    self._id_DCD7[var_0] = undefined;
}

_id_1835( var_0, var_1, var_2 )
{
    if ( !level.teambased )
        var_1 = "all";

    if ( !isdefined( self._id_115E5 ) )
        level._id_115E5 = [];

    if ( !isdefined( level._id_115E5[var_1] ) )
        level._id_115E5[var_1] = [];

    if ( isdefined( level._id_115E5[var_1][var_2] ) )
        level._id_115E5[var_1][var_2] = max( self._id_115E5[var_1][var_2], var_0 );
    else
        level._id_115E5[var_1][var_2] = var_0;
}

_id_E17C( var_0, var_1 )
{
    if ( !level.teambased )
        var_0 = "all";

    if ( !isdefined( level._id_115E5 ) )
        return;

    if ( !isdefined( level._id_115E5[var_0] ) )
        return;

    if ( !isdefined( level._id_115E5[var_0][var_1] ) )
        return;

    level._id_115E5[var_0][var_1] = undefined;
}

_id_81B6( var_0 )
{
    if ( !level.teambased )
        var_0 = "all";

    if ( !isdefined( level._id_115E5 ) || !isdefined( level._id_115E5[var_0] ) )
        return 1.0;

    var_1 = 1.0;

    foreach ( var_3 in level._id_115E5[var_0] )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_1 *= var_3;
    }

    return var_1;
}

_id_80D4()
{
    var_0 = _id_80D3();
    var_1 = _id_7ED9();
    var_2 = _id_81B6( self.team );
    return var_0 * var_1 * var_2;
}

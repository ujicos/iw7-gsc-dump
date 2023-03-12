// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( !isdefined( game["gamestarted"] ) )
    {
        setmatchdatadef( "mp/matchdata.ddl" );
        setmatchdata( "commonMatchData", "map", level.script );

        if ( level._id_8B38 )
        {
            var_0 = level.gametype + " hc";
            setmatchdata( "commonMatchData", "gametype", var_0 );
        }
        else
            setmatchdata( "commonMatchData", "gametype", level.gametype );

        setmatchdata( "commonMatchData", "buildVersion", getbuildversion() );
        setmatchdata( "commonMatchData", "buildNumber", getbuildnumber() );
        setmatchdataid();
        setmatchdata( "commonMatchData", "isPrivateMatch", scripts\mp\utility\game::_id_D957() );
        setmatchdata( "firstOvertimeRoundIndex", -1 );

        if ( scripts\mp\utility\game::_id_9EA6() )
            setmatchdata( "codESportsRules", 1 );
    }

    level._id_B4AF = 475;
    level._id_B4B3 = 26;
    level._id_B49F = 250;
    level._id_B4A8 = 64;
    level._id_B4A9 = 64;
    level._id_B4B0 = 30;
    level._id_B4B5 = 10;
    level._id_B4B4 = 10;
    level.maxsupersavailable = 50;
    level.maxsupersactivated = 50;
    level.maxsupersexpired = 50;
    level thread _id_766A();
    level thread _id_636A();
}

_id_C558()
{
    setmatchdata( "commonMatchData", "utcStartTimeSeconds", getsystemtime() );
    setmatchdata( "commonMatchData", "playerCountStart", level.players.size );
}

_id_C557()
{
    setmatchdata( "commonMatchData", "utcEndTimeSeconds", getsystemtime() );
    setmatchdata( "commonMatchData", "playerCountEnd", level.players.size );
    setmatchdata( "globalPlayerXpModifier", int( scripts\mp\rank::_id_7ED9() ) );
    setmatchdata( "globalWeaponXpModifier", int( scripts\mp\weaponrank::_id_7EDB() ) );
}

_id_7F93()
{
    return _func_0AD( "commonMatchData", "utcStartTimeSeconds" );
}

_id_81C8( var_0 )
{
    var_1 = var_0;

    if ( isdefined( level._id_10E00 ) )
    {
        var_1 -= level._id_10E00;

        if ( var_1 < 0 )
            var_1 = 0;
    }
    else
        var_1 = 0;

    return var_1;
}

logsupercommoneventdata( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_81C8( gettime() );
    setmatchdata( var_0, var_1, "lifeIndex", var_2 );
    setmatchdata( var_0, var_1, "time_msFromMatchStart", var_4 );
    setmatchdata( var_0, var_1, "playerPos", 0, int( var_3[0] ) );
    setmatchdata( var_0, var_1, "playerPos", 1, int( var_3[1] ) );
    setmatchdata( var_0, var_1, "playerPos", 2, int( var_3[2] ) );
}

logsuperavailableevent( var_0, var_1 )
{
    var_2 = _func_0AD( "supersAvailableCount" );
    var_3 = var_2 + 1;
    setmatchdata( "supersAvailableCount", var_3 );

    if ( var_2 >= level.maxsupersavailable )
        return;

    logsupercommoneventdata( "supersAvailable", var_2, var_0, var_1 );
}

logsuperactivatedevent( var_0, var_1 )
{
    var_2 = _func_0AD( "supersActivatedCount" );
    var_3 = var_2 + 1;
    setmatchdata( "supersActivatedCount", var_3 );

    if ( var_2 >= level.maxsupersactivated )
        return;

    logsupercommoneventdata( "supersActivated", var_2, var_0, var_1 );
    self.scoreatsuperactivation = self.score;
}

logsuperexpiredevent( var_0, var_1, var_2 )
{
    var_3 = _func_0AD( "supersExpiredCount" );
    var_4 = var_3 + 1;
    setmatchdata( "supersExpiredCount", var_4 );

    if ( var_3 >= level.maxsupersexpired )
        return;

    logsupercommoneventdata( "supersExpired", var_3, var_0, var_1 );
    setmatchdata( "supersExpired", var_3, "expirationThroughDeath", var_2 );
    var_5 = 0;

    if ( isdefined( self.scoreatsuperactivation ) )
        var_5 = self.score - self.scoreatsuperactivation;

    setmatchdata( "supersExpired", var_3, "scoreEarned", var_5 );
}

_id_AFC8( var_0 )
{
    if ( scripts\mp\utility\game::_id_9E0E( self ) == 0 )
        return;

    var_1 = _func_0AD( "killstreakAvailableCount" );
    var_2 = var_1 + 1;
    setmatchdata( "killstreakAvailableCount", var_2 );

    if ( !_id_38C6( self ) || var_1 >= level._id_B4A9 )
        return;

    var_3 = _id_81C8( gettime() );
    var_4 = -1;

    if ( isdefined( self._id_B3E3 ) )
        var_4 = self._id_B3E3;

    setmatchdata( "killstreaksAvailable", var_1, "eventType", var_0 );
    setmatchdata( "killstreaksAvailable", var_1, "playerLifeIndex", var_4 );
    setmatchdata( "killstreaksAvailable", var_1, "eventTime_msFromMatchStart", var_3 );
}

_id_AFC9( var_0, var_1 )
{
    if ( scripts\mp\utility\game::_id_9E0E( self ) == 0 )
        return;

    var_1 = self.origin;
    var_2 = _func_0AD( "killstreakCount" );
    var_3 = var_2 + 1;
    setmatchdata( "killstreakCount", var_3 );

    if ( !_id_38C6( self ) || var_2 >= level._id_B4A8 )
        return;

    var_4 = _id_81C8( gettime() );
    var_5 = -1;

    if ( isdefined( self._id_B3E3 ) )
        var_5 = self._id_B3E3;

    setmatchdata( "killstreaks", var_2, "eventType", var_0 );
    setmatchdata( "killstreaks", var_2, "playerLifeIndex", var_5 );
    setmatchdata( "killstreaks", var_2, "eventTime_msFromMatchStart", var_4 );
    setmatchdata( "killstreaks", var_2, "playerPos", 0, int( var_1[0] ) );
    setmatchdata( "killstreaks", var_2, "playerPos", 1, int( var_1[1] ) );
    setmatchdata( "killstreaks", var_2, "playerPos", 2, int( var_1[2] ) );
    self.lastmatchdatakillstreakindex = var_2;
}

_id_AFBA( var_0, var_1 )
{
    if ( isplayer( self ) && !_id_38C6( self ) )
        return;

    var_2 = _func_0AD( "gameEventCount" );
    var_3 = var_2 + 1;
    setmatchdata( "gameEventCount", var_3 );

    if ( var_2 >= level._id_B49F )
        return;

    var_4 = _id_81C8( gettime() );
    var_5 = -1;

    if ( scripts\mp\utility\game::_id_9E0E( self ) == 1 )
    {
        if ( isdefined( self._id_B3E3 ) )
            var_5 = self._id_B3E3;
    }

    setmatchdata( "gameEvents", var_2, "eventType", var_0 );
    setmatchdata( "gameEvents", var_2, "playerLifeIndex", var_5 );
    setmatchdata( "gameEvents", var_2, "eventTime_msFromMatchStart", var_4 );
    setmatchdata( "gameEvents", var_2, "eventPos", 0, int( var_1[0] ) );
    setmatchdata( "gameEvents", var_2, "eventPos", 1, int( var_1[1] ) );
    setmatchdata( "gameEvents", var_2, "eventPos", 2, int( var_1[2] ) );
}

_id_AFC5( var_0, var_1 )
{
    if ( !_id_38CA( var_0 ) )
        return;

    setmatchdata( "lives", var_0, "modifiers", var_1, 1 );
}

_id_AFCB( var_0, var_1 )
{
    if ( !_id_38CA( var_0 ) )
        return;

    setmatchdata( "lives", var_0, "multikill", var_1 );
}

_id_AFD6()
{
    if ( !_id_38C6( self ) )
        return level._id_B4AF - 1;

    var_0 = 0;
    var_1 = ( 0, 0, 0 );
    var_2 = 0;
    var_3 = -1;

    if ( isdefined( self._id_10916 ) )
        var_0 = self._id_10916;

    if ( isdefined( self._id_108FF ) )
        var_1 = self._id_108FF;

    if ( isdefined( self._id_1391E ) )
        var_2 = self._id_1391E;

    if ( isdefined( self._id_AE6D ) )
        var_3 = self._id_AE6D;

    var_4 = _id_81C8( var_0 );
    var_5 = self _meth_81EB( self._id_41F0, var_1, var_4, var_2, var_3 );
    return var_5;
}

_id_AFD7( var_0, var_1 )
{
    if ( !_id_38C6( self ) )
        return;

    setmatchdata( "players", self._id_41F0, var_1, var_0 );
}

_id_AFD5( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !_id_38C6( self ) )
        return;

    if ( var_0 >= level._id_B4AF )
        return;

    if ( var_4 == "agent_mp" )
        var_7 = [];
    else
    {
        var_7 = scripts\mp\utility\game::_id_821A( var_4 );
        var_7 = scripts\mp\utility\game::_id_249F( var_7 );
    }

    var_8 = _id_81C8( gettime() );
    var_9 = undefined;
    var_10 = [];

    if ( isdefined( self._id_AA47 ) )
    {
        var_9 = self._id_AA47;
        var_10 = scripts\mp\utility\game::_id_821A( var_9 );
        var_10 = scripts\mp\utility\game::_id_249F( var_10 );

        if ( scripts\mp\utility\game::ispickedupweapon( var_9 ) )
            setmatchdata( "lives", var_0, "victimCurrentWeaponPickedUp", 1 );
    }

    if ( isdefined( self._id_11234 ) && self._id_11234._id_9E53 )
        setmatchdata( "lives", var_0, "victimSuperActive", 1 );

    var_11 = 0;

    if ( isdefined( self._id_13905 ) )
        var_11 = self._id_13905;

    if ( isplayer( var_1 ) && _id_38C6( var_1 ) )
    {
        var_12 = var_1 scripts\mp\utility\game::_id_9EE8();
        var_13 = 0.4226;
        var_14 = scripts\engine\utility::within_fov( self.origin, self.angles, var_1.origin, var_13 );
        var_15 = scripts\engine\utility::within_fov( var_1.origin, var_1.angles, self.origin, var_13 );
        var_16 = -1;

        if ( isdefined( var_1._id_B3E3 ) )
            var_16 = var_1._id_B3E3;

        if ( var_1 scripts\mp\utility\game::ispickedupweapon( var_4 ) )
            setmatchdata( "lives", var_0, "attackerWeaponPickedUp", 1 );

        if ( isdefined( var_1._id_11234 ) && var_1._id_11234._id_9E53 && var_3 != "MOD_SUICIDE" && var_1._id_41F0 != self._id_41F0 )
        {
            setmatchdata( "lives", var_0, "attackerSuperActive", 1 );

            if ( isdefined( var_1.pers["matchdataSuperKills"] ) )
                var_1.pers["matchdataSuperKills"]++;
            else
                var_1.pers["matchdataSuperKills"] = 1;
        }

        var_17 = scripts\mp\utility\game::_id_9E6C( var_4 );
        self _meth_81E8( var_0, self._id_41F0, var_1, var_1._id_41F0, var_4, var_3, var_17, var_1 scripts\mp\utility\game::isjuggernaut(), var_7, var_8, var_9, var_10, var_11, var_12, var_15, var_14, var_16 );

        if ( var_17 )
        {
            if ( isdefined( var_1.lastmatchdatakillstreakindex ) && var_1.lastmatchdatakillstreakindex != -1 )
                setmatchdata( "lives", var_0, "attackerKillstreakIndex", var_1.lastmatchdatakillstreakindex );
        }
        else
            setmatchdata( "lives", var_0, "attackerKillstreakIndex", -1 );

        if ( isdefined( level._id_B3FB ) )
        {
            var_18 = gettime();
            [[ level._id_B3FB ]]( self._id_41F0, self.team, "DEATH", self.origin[0], self.origin[1], var_18 );

            if ( issubstr( tolower( var_3 ), "bullet" ) && isdefined( var_4 ) && !scripts\mp\utility\game::_id_9E6C( var_4 ) )
                [[ level._id_B3FB ]]( var_1._id_41F0, var_1.team, "BULLET", var_1.origin[0], var_1.origin[1], var_18, undefined, self.origin[0], self.origin[1] );
        }
    }
    else
    {
        self _meth_81E8( var_0, self._id_41F0, undefined, undefined, var_4, var_3, scripts\mp\utility\game::_id_9E6C( var_4 ), 0, var_7, var_8, var_9, var_10, var_11, 0, 0, 0, -1 );
        setmatchdata( "lives", var_0, "attackerKillstreakIndex", -1 );
    }

    logxpscoreearnedinlife( var_0 );
}

logxpscoreearnedinlife( var_0 )
{
    var_1 = self.pers["summary"]["xp"];
    var_2 = var_1 - self.pers["xpAtLastDeath"];
    self.pers["xpAtLastDeath"] = var_1;
    var_3 = self.score - self.pers["scoreAtLastDeath"];
    self.pers["scoreAtLastDeath"] = self.score;
    setmatchdata( "lives", var_0, "scoreEarned", var_3 );
    setmatchdata( "lives", var_0, "xpEarned", var_2 );
}

_id_AFD4()
{
    if ( !_id_38C6( self ) )
        return;

    setmatchdata( "players", self._id_41F0, "score", scripts\mp\utility\game::getpersstat( "score" ) );

    if ( scripts\mp\utility\game::getpersstat( "assists" ) > 255 )
        setmatchdata( "players", self._id_41F0, "assists", 255 );
    else
        setmatchdata( "players", self._id_41F0, "assists", scripts\mp\utility\game::getpersstat( "assists" ) );

    if ( scripts\mp\utility\game::getpersstat( "longestStreak" ) > 255 )
        setmatchdata( "players", self._id_41F0, "longestStreak", 255 );
    else
        setmatchdata( "players", self._id_41F0, "longestStreak", scripts\mp\utility\game::getpersstat( "longestStreak" ) );

    if ( scripts\mp\utility\game::getpersstat( "validationInfractions" ) > 255 )
        setmatchdata( "players", self._id_41F0, "validationInfractions", 255 );
    else
        setmatchdata( "players", self._id_41F0, "validationInfractions", scripts\mp\utility\game::getpersstat( "validationInfractions" ) );

    setmatchdata( "players", self._id_41F0, "kills", scripts\mp\utility\game::getpersstat( "kills" ) );
    setmatchdata( "players", self._id_41F0, "deaths", scripts\mp\utility\game::getpersstat( "deaths" ) );
    self _meth_8572( self._id_41F0 );
    var_0 = 0;
    var_1 = 0;
    var_2 = 0;

    foreach ( var_8, var_4 in self.pers["matchdataWeaponStats"] )
    {
        setmatchdata( "players", self._id_41F0, "weaponStats", var_2, "weapon", var_4.weapon );
        setmatchdata( "players", self._id_41F0, "weaponStats", var_2, "variantID", var_4._id_1318B );

        foreach ( var_7, var_6 in var_4._id_10E53 )
        {
            setmatchdata( "players", self._id_41F0, "weaponStats", var_2, var_7, int( var_6 ) );

            if ( var_7 == "hits" )
                var_0 += var_6;

            if ( var_7 == "shots" )
                var_1 += var_6;
        }

        var_2++;

        if ( var_2 >= 20 )
            break;
    }

    self _meth_859A( self._id_41F0, var_1, var_0 );
    var_9 = 0;

    if ( isdefined( self.pers["matchdataSuperKills"] ) )
        var_9 = self.pers["matchdataSuperKills"];

    var_10 = 0;

    if ( isdefined( self.pers["matchdataLongshotCount"] ) )
        var_10 = self.pers["matchdataLongshotCount"];

    var_11 = 0;

    if ( isdefined( self.pers["matchdataDoubleKillsCount"] ) )
        var_11 = self.pers["matchdataDoubleKillsCount"];

    self _meth_85AC( self._id_41F0, scripts\mp\utility\game::getpersstat( "headshots" ), var_10, var_11, var_9 );

    foreach ( var_8, var_13 in self.pers["matchdataScoreEventCounts"] )
        setmatchdata( "players", self._id_41F0, "scoreEventCount", var_8, var_13 );

    setmatchdata( "players", self._id_41F0, "playerXpModifier", int( scripts\mp\rank::_id_80D3() ) );

    if ( level.teambased )
        setmatchdata( "players", self._id_41F0, "teamXpModifier", int( scripts\mp\rank::_id_81B6( self.team ) ) );

    setmatchdata( "players", self._id_41F0, "weaponXpModifier", int( scripts\mp\weaponrank::_id_8232() ) );
    level scripts\mp\playerlogic::writesegmentdata( self );

    if ( isdefined( self.contracts ) )
    {
        foreach ( var_15 in self.contracts )
        {
            setmatchdata( "players", self._id_41F0, "contracts", var_15._id_10307, "challengeID", var_15._id_92B8 );
            setmatchdata( "players", self._id_41F0, "contracts", var_15._id_10307, "progress", var_15._id_D9D9 );
        }
    }
}

_id_AFD8( var_0 )
{
    if ( scripts\mp\utility\game::_id_9E0E( self ) == 0 )
        return;

    if ( !_id_38C6( self ) )
        return;

    if ( isdefined( self.pers["matchdataScoreEventCounts"][var_0] ) )
        self.pers["matchdataScoreEventCounts"][var_0]++;
    else
        self.pers["matchdataScoreEventCounts"][var_0] = 1;
}

_id_636A()
{
    level waittill( "game_ended" );

    foreach ( var_1 in level.players )
    {
        wait 0.05;

        if ( !isdefined( var_1 ) )
            continue;

        if ( isdefined( var_1._id_13CD5 ) )
        {
            var_1 _id_5ADD();
            var_2 = 0;

            if ( var_1._id_13CD5.size > 3 )
            {
                for ( var_3 = var_1._id_13CD5.size - 1; var_3 > var_1._id_13CD5.size - 3; var_3-- )
                {
                    var_1 setrankedplayerdata( "common", "round", "weaponsUsed", var_2, var_1._id_13CD5[var_3] );
                    var_1 setrankedplayerdata( "common", "round", "weaponXpEarned", var_2, var_1._id_13CE2[var_3] );
                    var_2++;
                }
            }
            else
            {
                for ( var_3 = var_1._id_13CD5.size - 1; var_3 >= 0; var_3-- )
                {
                    var_1 setrankedplayerdata( "common", "round", "weaponsUsed", var_2, var_1._id_13CD5[var_3] );
                    var_1 setrankedplayerdata( "common", "round", "weaponXpEarned", var_2, var_1._id_13CE2[var_3] );
                    var_2++;
                }
            }
        }
        else
        {
            var_1 setrankedplayerdata( "common", "round", "weaponsUsed", 0, "none" );
            var_1 setrankedplayerdata( "common", "round", "weaponsUsed", 1, "none" );
            var_1 setrankedplayerdata( "common", "round", "weaponsUsed", 2, "none" );
            var_1 setrankedplayerdata( "common", "round", "weaponXpEarned", 0, 0 );
            var_1 setrankedplayerdata( "common", "round", "weaponXpEarned", 1, 0 );
            var_1 setrankedplayerdata( "common", "round", "weaponXpEarned", 2, 0 );
        }

        if ( isdefined( var_1._id_3C30 ) )
            var_1 setrankedplayerdata( "common", "round", "challengeNumCompleted", var_1._id_3C30.size );
        else
            var_1 setrankedplayerdata( "common", "round", "challengeNumCompleted", 0 );

        for ( var_3 = 0; var_3 < 20; var_3++ )
        {
            if ( isdefined( var_1._id_3C30 ) && isdefined( var_1._id_3C30[var_3] ) && var_1._id_3C30[var_3] != "ch_prestige" && !issubstr( var_1._id_3C30[var_3], "_daily" ) && !issubstr( var_1._id_3C30[var_3], "_weekly" ) )
            {
                var_1 setrankedplayerdata( "common", "round", "challengesCompleted", var_3, var_1._id_3C30[var_3] );
                continue;
            }

            var_1 setrankedplayerdata( "common", "round", "challengesCompleted", var_3, "ch_none" );
        }

        var_1 setrankedplayerdata( "common", "round", "gameMode", level.gametype );
        var_1 setrankedplayerdata( "common", "round", "map", tolower( getdvar( "mapname" ) ) );
    }
}

_id_5ADD()
{
    var_0 = self._id_13CE2;
    var_1 = self._id_13CE2.size;

    for ( var_2 = var_1 - 1; var_2 > 0; var_2-- )
    {
        for ( var_3 = 1; var_3 <= var_2; var_3++ )
        {
            if ( var_0[var_3 - 1] < var_0[var_3] )
            {
                var_4 = self._id_13CD5[var_3];
                self._id_13CD5[var_3] = self._id_13CD5[var_3 - 1];
                self._id_13CD5[var_3 - 1] = var_4;
                var_5 = self._id_13CE2[var_3];
                self._id_13CE2[var_3] = self._id_13CE2[var_3 - 1];
                self._id_13CE2[var_3 - 1] = var_5;
                var_0 = self._id_13CE2;
            }
        }
    }
}

_id_766A()
{
    level waittill( "game_ended" );

    foreach ( var_1 in level.players )
    {
        var_1 _id_AFD4();

        if ( !isalive( var_1 ) )
            continue;
    }
}

_id_38C6( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;
    else if ( isagent( var_0 ) )
        return 0;
    else if ( !isplayer( var_0 ) )
        return 0;

    return var_0._id_41F0 < level._id_B4B0;
}

_id_38CA( var_0 )
{
    return var_0 < level._id_B4AF;
}

_id_AFDC( var_0, var_1, var_2, var_3 )
{
    if ( !_id_38C6( self ) )
        return;

    if ( scripts\mp\utility\game::_id_9E6C( var_0 ) )
        return;

    var_4 = var_0;

    if ( isdefined( var_3 ) )
        var_4 = var_4 + "+loot" + var_3;

    if ( !isdefined( self.pers["matchdataWeaponStats"][var_4] ) )
    {
        self.pers["matchdataWeaponStats"][var_4] = spawnstruct();
        self.pers["matchdataWeaponStats"][var_4]._id_10E53 = [];
        self.pers["matchdataWeaponStats"][var_4].weapon = var_0;

        if ( isdefined( var_3 ) )
            self.pers["matchdataWeaponStats"][var_4]._id_1318B = var_3;
        else
            self.pers["matchdataWeaponStats"][var_4]._id_1318B = -1;
    }

    if ( !isdefined( self.pers["matchdataWeaponStats"][var_4]._id_10E53[var_1] ) )
        self.pers["matchdataWeaponStats"][var_4]._id_10E53[var_1] = var_2;
    else
        self.pers["matchdataWeaponStats"][var_4]._id_10E53[var_1] += var_2;
}

_id_AF94( var_0, var_1, var_2 )
{
    if ( !_id_38C6( self ) )
        return;

    if ( !scripts\mp\utility\game::_id_2490( var_0 ) )
        return;

    var_3 = _func_0AD( "players", self._id_41F0, "attachmentsStats", var_0, var_1 );
    var_4 = var_3 + var_2;
    setmatchdata( "players", self._id_41F0, "attachmentsStats", var_0, var_1, var_4 );
}

_id_322A()
{
    var_0 = [];
    var_1 = 149;

    for ( var_2 = 0; var_2 <= var_1; var_2++ )
    {
        var_3 = tablelookup( "mp/statstable.csv", 0, var_2, 4 );

        if ( !issubstr( tablelookup( "mp/statsTable.csv", 0, var_2, 2 ), "weapon_" ) )
            continue;

        if ( tablelookup( "mp/statsTable.csv", 0, var_2, 2 ) == "weapon_other" )
            continue;

        var_0[var_0.size] = var_3;
    }

    return var_0;
}

_id_AF99( var_0, var_1 )
{
    if ( !_id_38C6( self ) )
        return;

    if ( issubstr( var_0, "_daily" ) || issubstr( var_0, "_weekly" ) )
        return;

    var_2 = _func_0AD( "players", self._id_41F0, "challengeCount" );

    if ( var_2 < level._id_B4B5 )
    {
        setmatchdata( "players", self._id_41F0, "challenge", var_2, var_0 );
        setmatchdata( "players", self._id_41F0, "challengeCount", var_2 + 1 );
    }
}

_id_AF97( var_0 )
{
    if ( !_id_38C6( self ) )
        return;

    var_1 = _func_0AD( "players", self._id_41F0, "awardCount" );
    var_2 = var_1 + 1;
    setmatchdata( "players", self._id_41F0, "awardCount", var_2 );

    if ( var_1 < level._id_B4B4 )
        setmatchdata( "players", self._id_41F0, "awards", var_1, var_0 );

    if ( var_0 == "double" )
    {
        if ( isdefined( self.pers["matchdataDoubleKillsCount"] ) )
            self.pers["matchdataDoubleKillsCount"]++;
        else
            self.pers["matchdataDoubleKillsCount"] = 1;
    }
    else if ( var_0 == "longshot" )
    {
        if ( isdefined( self.pers["matchdataLongshotCount"] ) )
            self.pers["matchdataLongshotCount"]++;
        else
            self.pers["matchdataLongshotCount"] = 1;
    }
}

_id_AFC6()
{
    if ( !_id_38C6( self ) )
        return;

    setmatchdata( "players", self._id_41F0, "killsConfirmed", self.pers["confirmed"] );
}

_id_AFC7()
{
    if ( !_id_38C6( self ) )
        return;

    setmatchdata( "players", self._id_41F0, "killsDenied", self.pers["denied"] );
}

_id_AFC4()
{
    if ( getdvarint( "mdsd" ) > 0 )
    {
        setmatchdata( "players", self._id_41F0, "startXp", self getrankedplayerdata( "mp", "progression", "playerLevel", "xp" ) );
        setmatchdata( "players", self._id_41F0, "startKills", self getrankedplayerdata( "mp", "kills" ) );
        setmatchdata( "players", self._id_41F0, "startDeaths", self getrankedplayerdata( "mp", "deaths" ) );
        setmatchdata( "players", self._id_41F0, "startWins", self getrankedplayerdata( "mp", "wins" ) );
        setmatchdata( "players", self._id_41F0, "startLosses", self getrankedplayerdata( "mp", "losses" ) );
        setmatchdata( "players", self._id_41F0, "startHits", self getrankedplayerdata( "mp", "hits" ) );
        setmatchdata( "players", self._id_41F0, "startMisses", self getrankedplayerdata( "mp", "misses" ) );
        setmatchdata( "players", self._id_41F0, "startGamesPlayed", self getrankedplayerdata( "mp", "gamesPlayed" ) );
        setmatchdata( "players", self._id_41F0, "startTimePlayedTotal", self getrankedplayerdata( "mp", "timePlayedTotal" ) );
        setmatchdata( "players", self._id_41F0, "startScore", self getrankedplayerdata( "mp", "score" ) );
        setmatchdata( "players", self._id_41F0, "startPrestige", self getrankedplayerdata( "mp", "progression", "playerLevel", "prestige" ) );
    }
}

_id_AFB9()
{
    if ( !self _meth_8592() )
        return;

    if ( getdvarint( "mdsd" ) > 0 )
    {
        setmatchdata( "players", self._id_41F0, "endXp", self getrankedplayerdata( "mp", "progression", "playerLevel", "xp" ) );
        setmatchdata( "players", self._id_41F0, "endKills", self getrankedplayerdata( "mp", "kills" ) );
        setmatchdata( "players", self._id_41F0, "endDeaths", self getrankedplayerdata( "mp", "deaths" ) );
        setmatchdata( "players", self._id_41F0, "endWins", self getrankedplayerdata( "mp", "wins" ) );
        setmatchdata( "players", self._id_41F0, "endLosses", self getrankedplayerdata( "mp", "losses" ) );
        setmatchdata( "players", self._id_41F0, "endHits", self getrankedplayerdata( "mp", "hits" ) );
        setmatchdata( "players", self._id_41F0, "endMisses", self getrankedplayerdata( "mp", "misses" ) );
        setmatchdata( "players", self._id_41F0, "endGamesPlayed", self getrankedplayerdata( "mp", "gamesPlayed" ) );
        setmatchdata( "players", self._id_41F0, "endTimePlayedTotal", self getrankedplayerdata( "mp", "timePlayedTotal" ) );
        setmatchdata( "players", self._id_41F0, "endScore", self getrankedplayerdata( "mp", "score" ) );
        setmatchdata( "players", self._id_41F0, "endPrestige", self getrankedplayerdata( "mp", "progression", "playerLevel", "prestige" ) );
    }
}

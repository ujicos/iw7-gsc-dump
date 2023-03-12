// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_CA70 = [];
    level thread _id_12E6A();
    level thread _id_12F85();
    level thread _id_13E05();
}

_id_97E2()
{
    self._id_316E = [];
    self._id_10AEC = [];

    if ( scripts\mp\utility\game::_id_DCD5() )
    {
        self._id_316E["totalShots"] = self getrankedplayerdata( "mp", "totalShots" );
        self._id_316E["accuracy"] = self getrankedplayerdata( "mp", "accuracy" );
        self._id_316E["misses"] = self getrankedplayerdata( "mp", "misses" );
        self._id_316E["hits"] = self getrankedplayerdata( "mp", "hits" );
    }

    self._id_316E["timePlayedAllies"] = self getrankedplayerdata( "mp", "timePlayedAllies" );
    self._id_316E["timePlayedOpfor"] = self getrankedplayerdata( "mp", "timePlayedOpfor" );
    self._id_316E["timePlayedOther"] = self getrankedplayerdata( "mp", "timePlayedOther" );
    self._id_316E["timePlayedTotal"] = self getrankedplayerdata( "mp", "timePlayedTotal" );
    self._id_3169 = [];
    self._id_3169["round"] = [];
    self._id_3169["round"]["timePlayed"] = self getrankedplayerdata( "common", "round", "timePlayed" );

    if ( scripts\mp\utility\game::_id_DCD5() )
    {
        self._id_3169["xpMultiplierTimePlayed"] = [];
        self._id_3169["xpMultiplierTimePlayed"][0] = self getrankedplayerdata( "mp", "xpMultiplierTimePlayed", 0 );
        self._id_3169["xpMultiplierTimePlayed"][1] = self getrankedplayerdata( "mp", "xpMultiplierTimePlayed", 1 );
        self._id_3169["xpMultiplierTimePlayed"][2] = self getrankedplayerdata( "mp", "xpMultiplierTimePlayed", 2 );
        self._id_316A["xpMaxMultiplierTimePlayed"] = [];
        self._id_316A["xpMaxMultiplierTimePlayed"][0] = self getrankedplayerdata( "mp", "xpMaxMultiplierTimePlayed", 0 );
        self._id_316A["xpMaxMultiplierTimePlayed"][1] = self getrankedplayerdata( "mp", "xpMaxMultiplierTimePlayed", 1 );
        self._id_316A["xpMaxMultiplierTimePlayed"][2] = self getrankedplayerdata( "mp", "xpMaxMultiplierTimePlayed", 2 );
        self._id_3169["challengeXPMultiplierTimePlayed"] = [];
        self._id_3169["challengeXPMultiplierTimePlayed"][0] = self getrankedplayerdata( "mp", "challengeXPMultiplierTimePlayed", 0 );
        self._id_316A["challengeXPMaxMultiplierTimePlayed"] = [];
        self._id_316A["challengeXPMaxMultiplierTimePlayed"][0] = self getrankedplayerdata( "mp", "challengeXPMaxMultiplierTimePlayed", 0 );
        self._id_3169["weaponXPMultiplierTimePlayed"] = [];
        self._id_3169["weaponXPMultiplierTimePlayed"][0] = self getrankedplayerdata( "mp", "weaponXPMultiplierTimePlayed", 0 );
        self._id_316A["weaponXPMaxMultiplierTimePlayed"] = [];
        self._id_316A["weaponXPMaxMultiplierTimePlayed"][0] = self getrankedplayerdata( "mp", "weaponXPMaxMultiplierTimePlayed", 0 );
        self._id_316E["prestigeDoubleWeaponXp"] = self getrankedplayerdata( "mp", "prestigeDoubleWeaponXp" );
        self._id_316E["prestigeDoubleWeaponXpTimePlayed"] = self getrankedplayerdata( "mp", "prestigeDoubleWeaponXpTimePlayed" );
        self._id_316F["prestigeDoubleWeaponXpMaxTimePlayed"] = self getrankedplayerdata( "mp", "prestigeDoubleWeaponXpMaxTimePlayed" );
    }

    _id_97DB();
}

_id_97DB()
{
    var_0 = "mp/bestscorestatsTable.csv";
    self._id_2A98 = [];
    self._id_3168 = [];
    var_1 = 0;

    for (;;)
    {
        var_2 = tablelookupbyrow( var_0, var_1, 0 );

        if ( var_2 == "" )
            break;

        self._id_2A98[var_2] = self getrankedplayerdata( "mp", "bestScores", var_2 );
        var_1++;
    }
}

_id_10E33( var_0 )
{
    return self getrankedplayerdata( "mp", var_0 );
}

_id_10E54( var_0, var_1 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() )
        return;

    self setrankedplayerdata( "mp", var_0, var_1 );
}

_id_10E12( var_0, var_1, var_2 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() )
        return;

    if ( isdefined( var_2 ) )
    {
        var_3 = self getrankedplayerdata( "mp", var_0, var_2 );
        self setrankedplayerdata( "mp", var_0, var_2, var_1 + var_3 );
    }
    else
    {
        var_4 = self getrankedplayerdata( "mp", var_0 ) + var_1;
        self setrankedplayerdata( "mp", var_0, var_4 );
    }
}

_id_10E35( var_0, var_1 )
{
    if ( var_0 == "round" )
        return self getrankedplayerdata( "common", var_0, var_1 );
    else
        return self getrankedplayerdata( "mp", var_0, var_1 );
}

statsetchild( var_0, var_1, var_2, var_3 )
{
    if ( isagent( self ) )
        return;

    if ( isdefined( var_3 ) || !scripts\mp\utility\game::_id_DCD5() )
        return;

    if ( var_0 == "round" )
    {
        self setrankedplayerdata( "common", var_0, var_1, var_2 );
        _id_F662( var_1, var_2 );
    }
    else
        self setrankedplayerdata( "mp", var_0, var_1, var_2 );
}

_id_10E15( var_0, var_1, var_2 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() )
        return;

    var_3 = self getrankedplayerdata( "mp", var_0, var_1 );
    self setrankedplayerdata( "mp", var_0, var_1, var_3 + var_2 );
}

_id_10E36( var_0, var_1, var_2 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() && !scripts\mp\utility\game::istrue( var_2 ) )
        return 0;

    return self._id_3169[var_0][var_1];
}

_id_10E57( var_0, var_1, var_2, var_3 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() && !scripts\mp\utility\game::istrue( var_3 ) )
        return;

    self._id_3169[var_0][var_1] = var_2;
}

_id_10E16( var_0, var_1, var_2, var_3 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() && !scripts\mp\utility\game::istrue( var_3 ) )
        return;

    var_4 = _id_10E36( var_0, var_1, var_3 );
    _id_10E57( var_0, var_1, var_4 + var_2, var_3 );
}

_id_10E14( var_0, var_1, var_2 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() )
        return;

    var_3 = _id_10E34( var_0 ) + var_1;

    if ( var_3 > var_2 )
        var_3 = var_2;

    if ( var_3 < _id_10E34( var_0 ) )
        var_3 = var_2;

    _id_10E55( var_0, var_3 );
}

_id_10E17( var_0, var_1, var_2, var_3 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() )
        return;

    var_4 = _id_10E36( var_0, var_1 ) + var_2;

    if ( var_4 > var_3 )
        var_4 = var_3;

    if ( var_4 < _id_10E36( var_0, var_1 ) )
        var_4 = var_3;

    _id_10E57( var_0, var_1, var_4 );
}

_id_10E34( var_0, var_1 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() && !scripts\mp\utility\game::istrue( var_1 ) )
        return 0;

    return self._id_316E[var_0];
}

_id_10E37( var_0 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() )
        return 0;

    return self._id_10AEC[var_0];
}

_id_10E55( var_0, var_1, var_2 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() && !scripts\mp\utility\game::istrue( var_2 ) )
        return;

    self._id_316E[var_0] = var_1;
}

_id_10E58( var_0, var_1 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() )
        return;

    self._id_10AEC[var_0] = var_1;
}

_id_10E13( var_0, var_1, var_2 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() && !scripts\mp\utility\game::istrue( var_2 ) )
        return;

    var_3 = _id_10E34( var_0, var_2 );
    _id_10E55( var_0, var_3 + var_1, var_2 );
}

_id_10E18( var_0, var_1 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() )
        return;

    var_2 = _id_10E37( var_0 );
    _id_10E58( var_0, var_2 + var_1 );
}

_id_12E6A()
{
    wait 0.15;
    var_0 = 0;

    while ( !level._id_7669 )
    {
        scripts\mp\hostmigration::waittillhostmigrationdone();
        var_0++;

        if ( var_0 >= level.players.size )
            var_0 = 0;

        if ( isdefined( level.players[var_0] ) )
        {
            level.players[var_0] _id_13E04();
            level.players[var_0] _id_12F5E();
        }

        wait 2.0;
    }

    foreach ( var_2 in level.players )
    {
        var_2 _id_13E04();
        var_2 _id_12F5E();
    }
}

_id_F662( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_DCD5();

    if ( !var_2 )
        return;

    if ( isdefined( self._id_2A98[var_0] ) && var_1 > self._id_2A98[var_0] )
    {
        self._id_2A98[var_0] = var_1;
        self._id_3168[var_0] = var_1;
    }
}

_id_13E03()
{
    foreach ( var_1 in level.players )
    {
        if ( isdefined( var_1 ) && var_1 scripts\mp\utility\game::_id_DCD5() )
        {
            foreach ( var_4, var_3 in var_1._id_3168 )
                var_1 setrankedplayerdata( "mp", "bestScores", var_4, var_3 );
        }
    }
}

_id_13E04()
{
    var_0 = scripts\mp\utility\game::_id_DCD5();

    if ( var_0 )
    {
        foreach ( var_3, var_2 in self._id_316E )
            self setrankedplayerdata( "mp", var_3, var_2 );

        if ( !isai( self ) )
        {
            foreach ( var_3, var_2 in self._id_10AEC )
                self setrankedplayerdata( "rankedloadouts", "squadMembers", var_3, var_2 );
        }
    }

    foreach ( var_3, var_2 in self._id_3169 )
    {
        foreach ( var_8, var_7 in var_2 )
        {
            if ( var_3 == "round" )
            {
                self setrankedplayerdata( "common", var_3, var_8, var_7 );
                _id_F662( var_8, var_7 );
                continue;
            }

            if ( var_0 )
                self setrankedplayerdata( "mp", var_3, var_8, var_7 );
        }
    }
}

_id_13E05()
{
    if ( !scripts\mp\utility\game::matchmakinggame() )
        return;

    level waittill( "game_ended" );
    wait 0.1;

    if ( scripts\mp\utility\game::_id_13916() || !scripts\mp\utility\game::_id_9F32() && scripts\mp\utility\game::_id_9049() )
    {
        foreach ( var_1 in level.players )
            var_1 _id_93FB( var_1.kills, var_1.deaths );
    }
}

_id_93FB( var_0, var_1 )
{
    if ( !scripts\mp\utility\game::_id_DCD5() )
        return;

    for ( var_2 = 0; var_2 < 4; var_2++ )
    {
        var_3 = self getrankedplayerdata( "mp", "kdHistoryK", var_2 + 1 );
        self setrankedplayerdata( "mp", "kdHistoryK", var_2, var_3 );
        var_3 = self getrankedplayerdata( "mp", "kdHistoryD", var_2 + 1 );
        self setrankedplayerdata( "mp", "kdHistoryD", var_2, var_3 );
    }

    self setrankedplayerdata( "mp", "kdHistoryK", 4, int( clamp( var_0, 0, 255 ) ) );
    self setrankedplayerdata( "mp", "kdHistoryD", 4, int( clamp( var_1, 0, 255 ) ) );
}

_id_93FC( var_0, var_1, var_2 )
{
    if ( scripts\mp\utility\game::_id_9E6C( var_0 ) )
        return;

    if ( isdefined( level._id_561D ) )
        return;

    if ( scripts\mp\utility\game::_id_DCD5() )
    {
        var_3 = self getrankedplayerdata( "mp", "weaponStats", var_0, var_1 );
        self setrankedplayerdata( "mp", "weaponStats", var_0, var_1, var_3 + var_2 );
    }
}

_id_93F9( var_0, var_1, var_2 )
{
    if ( isdefined( level._id_561D ) )
        return;

    if ( !scripts\mp\utility\game::_id_2490( var_0 ) )
        return;

    if ( scripts\mp\utility\game::_id_DCD5() )
    {
        var_3 = self getrankedplayerdata( "mp", "attachmentsStats", var_0, var_1 );
        self setrankedplayerdata( "mp", "attachmentsStats", var_0, var_1, var_3 + var_2 );
    }
}

_id_12F5E()
{
    if ( !isdefined( self._id_11AF0 ) )
        return;

    if ( self._id_11AF0 == "" || self._id_11AF0 == "none" )
        return;

    if ( scripts\mp\utility\game::_id_9E6C( self._id_11AF0 ) || scripts\mp\utility\game::_id_9DE2( self._id_11AF0 ) || scripts\mp\utility\game::_id_9D6E( self._id_11AF0 ) )
        return;

    var_0 = self._id_11AF0;
    var_1 = undefined;
    var_2 = getsubstr( var_0, 0, 4 );

    if ( var_2 == "alt_" )
    {
        var_3 = scripts\mp\utility\game::_id_821A( var_0 );

        foreach ( var_5 in var_3 )
        {
            if ( var_5 == "shotgun" || var_5 == "gl" )
            {
                var_1 = var_5;
                break;
            }
        }
    }

    if ( !isdefined( var_1 ) )
    {
        if ( var_2 == "alt_" )
        {
            var_0 = getsubstr( var_0, 4 );
            var_2 = getsubstr( var_0, 0, 4 );
        }

        if ( var_2 == "iw6_" || var_2 == "iw7_" )
        {
            var_7 = strtok( var_0, "_" );
            var_1 = var_7[0] + "_" + var_7[1];
        }
    }

    if ( var_1 == "gl" || var_1 == "shotgun" || var_1 == "missglprox" || var_1 == "stickglprox" || var_1 == "shotgunglprox" || var_1 == "shotgunglr" )
    {
        _id_CA72( var_1 );
        _id_CA6D();
        return;
    }

    if ( !scripts\mp\utility\game::_id_9D78( var_1 ) && !scripts\mp\utility\game::_id_9D79( var_1 ) )
        return;

    var_8 = getweaponvariantindex( var_0 );
    _id_CA73( var_1, var_8 );
    var_3 = getweaponattachments( var_0 );

    foreach ( var_5 in var_3 )
    {
        var_10 = scripts\mp\utility\game::_id_2494( var_5 );

        if ( !scripts\mp\utility\game::_id_2490( var_10 ) )
            continue;

        switch ( var_10 )
        {
            case "gl":
            case "shotgun":
                continue;
        }

        _id_CA72( var_10 );
    }

    _id_CA6D();
}

_id_CA6D()
{
    self._id_11AF0 = "none";
    self._id_11AF1 = 0;
    self._id_11AEF = 0;
    self._id_11AEE = 0;
    self._id_11AED = 0;
    self._id_11AEC = 0;
}

_id_CA73( var_0, var_1 )
{
    if ( self._id_11AF1 > 0 )
    {
        _id_93FC( var_0, "shots", self._id_11AF1 );
        scripts\mp\matchdata::_id_AFDC( var_0, "shots", self._id_11AF1, var_1 );
    }

    if ( self._id_11AEF > 0 )
    {
        _id_93FC( var_0, "kills", self._id_11AEF );
        scripts\mp\matchdata::_id_AFDC( var_0, "kills", self._id_11AEF, var_1 );
    }

    if ( self._id_11AEE > 0 )
    {
        _id_93FC( var_0, "hits", self._id_11AEE );
        scripts\mp\matchdata::_id_AFDC( var_0, "hits", self._id_11AEE, var_1 );
    }

    if ( self._id_11AED > 0 )
    {
        _id_93FC( var_0, "headShots", self._id_11AED );
        scripts\mp\matchdata::_id_AFDC( var_0, "headShots", self._id_11AED, var_1 );
    }

    if ( self._id_11AEC > 0 )
    {
        _id_93FC( var_0, "deaths", self._id_11AEC );
        scripts\mp\matchdata::_id_AFDC( var_0, "deaths", self._id_11AEC, var_1 );
    }
}

_id_CA72( var_0 )
{
    if ( !scripts\mp\utility\game::_id_2490( var_0 ) )
        return;

    if ( self._id_11AF1 > 0 && var_0 != "tactical" )
    {
        _id_93F9( var_0, "shots", self._id_11AF1 );
        scripts\mp\matchdata::_id_AF94( var_0, "shots", self._id_11AF1 );
    }

    if ( self._id_11AEF > 0 && var_0 != "tactical" )
    {
        _id_93F9( var_0, "kills", self._id_11AEF );
        scripts\mp\matchdata::_id_AF94( var_0, "kills", self._id_11AEF );
    }

    if ( self._id_11AEE > 0 && var_0 != "tactical" )
    {
        _id_93F9( var_0, "hits", self._id_11AEE );
        scripts\mp\matchdata::_id_AF94( var_0, "hits", self._id_11AEE );
    }

    if ( self._id_11AED > 0 && var_0 != "tactical" )
    {
        _id_93F9( var_0, "headShots", self._id_11AED );
        scripts\mp\matchdata::_id_AF94( var_0, "headShots", self._id_11AED );
    }

    if ( self._id_11AEC > 0 )
    {
        _id_93F9( var_0, "deaths", self._id_11AEC );
        scripts\mp\matchdata::_id_AF94( var_0, "deaths", self._id_11AEC );
    }
}

_id_12F85()
{
    level waittill( "game_ended" );

    if ( !scripts\mp\utility\game::matchmakinggame() )
        return;

    var_0 = 0;
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;
    var_4 = 0;
    var_5 = 0;

    foreach ( var_7 in level.players )
        var_5 += var_7._id_1190E["total"];

    incrementcounter( "global_minutes", int( var_5 / 60 ) );

    if ( scripts\mp\utility\game::_id_9F32() && !scripts\mp\utility\game::_id_13916() )
        return;

    wait 0.05;

    foreach ( var_7 in level.players )
    {
        var_0 += var_7.kills;
        var_1 += var_7.deaths;
        var_2 += var_7.assists;
        var_3 += var_7.headshots;
        var_4 += var_7.suicides;
    }

    incrementcounter( "global_headshots", var_3 );
    incrementcounter( "global_suicides", var_4 );
    incrementcounter( "global_games", 1 );

    if ( !isdefined( level.assists_disabled ) )
        incrementcounter( "global_assists", var_2 );
}

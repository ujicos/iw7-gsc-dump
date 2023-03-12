// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\intelchallenges::_id_DEF9();
    level thread _id_C56E();
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !level.rankedmatch )
            return;

        if ( !var_0 scripts\mp\utility\game::_id_DCD5() )
            return;

        if ( isai( var_0 ) )
            continue;

        var_1 = var_0 getrankedplayerdata( "mp", "activeMissionTeam" );
        var_2 = var_0 getrankedplayerdata( "mp", "missionTeams", var_1, "activeSlot" );
        var_3 = var_0 getrankedplayerdata( "mp", "missionTeams", var_1, "currentMission", var_2 );
        setmatchdata( "players", var_0._id_41F0, "activeMissionTeam", var_1 );
        setmatchdata( "players", var_0._id_41F0, "missionTeamData_activeSlot", var_2 );
        setmatchdata( "players", var_0._id_41F0, "missionTeamData_currentMission", var_3 );

        for ( var_4 = 0; var_4 < 5; var_4++ )
        {
            var_5 = var_0 getrankedplayerdata( "mp", "missionTeams", var_1, "currentMission", var_4 );
            setmatchdata( "players", var_0._id_41F0, "missionTeamData_availableMissions", var_4, var_5 );
        }

        var_6 = var_0 getrankedplayerdata( "mp", "missionTeams", var_1, "level" );
        var_7 = var_0 getrankedplayerdata( "mp", "missionTeams", var_1, "missionXP" );
        setmatchdata( "players", var_0._id_41F0, "missionTeamData_startLevel", var_6 );
        setmatchdata( "players", var_0._id_41F0, "missionTeamData_startMissionXP", var_7 );
        setmatchdata( "players", var_0._id_41F0, "tierComplete", -1 );
        var_0._id_B8D4 = var_1;
        var_0 _id_8370( var_3, var_1 );
    }
}

updatemissionteamperformancestats()
{
    foreach ( var_1 in level.players )
    {
        if ( !isdefined( var_1 ) || !var_1 scripts\mp\utility\game::_id_DCD5() )
            continue;

        if ( isai( var_1 ) )
            continue;

        var_2 = var_1._id_B8D4;
        var_3 = var_1 getrankedplayerdata( "mp", "missionTeamPerformanceData", var_2, "matchesPlayed" );
        var_1 setrankedplayerdata( "mp", "missionTeamPerformanceData", var_2, "matchesPlayed", var_3 + 1 );

        if ( isdefined( var_1._id_9978 ) && isdefined( var_1._id_9978._id_4C0D ) )
        {
            if ( var_1._id_9978._id_4C0D > 0 )
            {
                switch ( var_1._id_9978._id_4C0D )
                {
                    case 1:
                        var_4 = var_1 getrankedplayerdata( "mp", "missionTeamPerformanceData", var_2, "completed" );
                        var_1 setrankedplayerdata( "mp", "missionTeamPerformanceData", var_2, "completed", var_4 + 1 );
                        break;
                    case 2:
                        var_5 = var_1 getrankedplayerdata( "mp", "missionTeamPerformanceData", var_2, "bronze" );
                        var_1 setrankedplayerdata( "mp", "missionTeamPerformanceData", var_2, "bronze", var_5 + 1 );
                        break;
                    case 3:
                        var_6 = var_1 getrankedplayerdata( "mp", "missionTeamPerformanceData", var_2, "silver" );
                        var_1 setrankedplayerdata( "mp", "missionTeamPerformanceData", var_2, "silver", var_6 + 1 );
                        break;
                    case 4:
                        var_7 = var_1 getrankedplayerdata( "mp", "missionTeamPerformanceData", var_2, "gold" );
                        var_1 setrankedplayerdata( "mp", "missionTeamPerformanceData", var_2, "gold", var_7 + 1 );
                        break;
                }

                continue;
            }

            var_8 = var_1 getrankedplayerdata( "mp", "missionTeamPerformanceData", var_2, "failed" );
            var_1 setrankedplayerdata( "mp", "missionTeamPerformanceData", var_2, "failed", var_8 + 1 );
        }
    }
}

_id_AE1D( var_0 )
{
    var_1 = _id_B02D( var_0 );

    if ( !isdefined( var_1 ) )
        return undefined;

    var_2 = spawnstruct();
    var_2._id_DE3F = var_1;
    var_2._id_118A7 = [];

    for ( var_3 = 0; var_3 < 4; var_3++ )
    {
        var_4 = _id_B02E( var_0, var_3 );

        if ( !isdefined( var_4 ) )
            break;

        var_2._id_118A7[var_3]["target"] = var_4;
    }

    var_2._id_4C0D = 0;
    var_2._id_D9D9 = 0;
    return var_2;
}

_id_B02D( var_0 )
{
    var_1 = tablelookup( "mp/intelChallenges.csv", 0, var_0, 1 );

    if ( !isdefined( var_1 ) || var_1 == "" )
        return undefined;

    return var_1;
}

_id_B02E( var_0, var_1 )
{
    var_2 = tablelookup( "mp/intelChallenges.csv", 0, var_0, 5 + var_1 * 2 );

    if ( !isdefined( var_2 ) || var_2 == "" )
        return undefined;

    return int( var_2 );
}

_id_8370( var_0, var_1 )
{
    var_2 = self.pers["intelChallengeInfo"];

    if ( isdefined( var_2 ) )
        var_3 = var_2;
    else
    {
        var_3 = _id_AE1D( var_0 );
        self setrankedplayerdata( "mp", "activeMissionComplete", -1 );
        var_3._id_B8D4 = var_1;
    }

    if ( !isdefined( var_3 ) )
        return;

    self._id_9978 = var_3;
    self thread [[ level._id_9979[var_3._id_DE3F] ]]( var_0 );

    switch ( var_3._id_DE3F )
    {
        case "ch_intel_multiple_weapon_one_life":
        case "ch_intel_kills_this_life":
            thread scripts\mp\intelchallenges::_id_99B9();
            break;
    }

    thread _id_BA09();
    _id_9884( var_0 );
}

_id_F75C()
{
    var_0 = self._id_9978;

    if ( !isdefined( var_0 ) )
        return;

    self setrankedplayerdata( "mp", "activeMissionComplete", var_0._id_4C0D );
    setmatchdata( "players", self._id_41F0, "tierComplete", var_0._id_4C0D );

    if ( var_0._id_4C0D == 0 )
    {
        var_1 = self getrankedplayerdata( "mp", "missionsCompleted" );
        self setrankedplayerdata( "mp", "missionsCompleted", var_1 + 1 );
    }

    if ( var_0._id_4C0D == var_0._id_118A7.size - 1 )
        self notify( "intel_max_tier_complete" );

    thread scripts\mp\hud_message::showsplash( "intel_completed_" + ( var_0._id_4C0D + 1 ) + "_team_" + var_0._id_B8D4 );
    var_0._id_4C0D++;
    _id_12EB8( var_0._id_4C0D );
}

_id_9E94()
{
    if ( !isdefined( self._id_9978 ) )
        return 0;

    if ( self._id_9978._id_4C0D < self._id_9978._id_118A7.size )
        return 0;

    return 1;
}

_id_BA09()
{
    level waittill( "round_switch" );

    if ( isdefined( self._id_9978 ) )
        self.pers["intelChallengeInfo"] = self._id_9978;
}

_id_9884( var_0 )
{
    if ( !_id_9E94() )
    {
        self setclientomnvar( "ui_intel_active_index", var_0 );
        self setclientomnvar( "ui_intel_current_tier", self._id_9978._id_4C0D );
    }
    else
    {
        var_1 = self._id_9978._id_118A7.size;
        var_2 = self._id_9978._id_118A7[self._id_9978._id_118A7.size - 1]["target"];
        self setclientomnvar( "ui_intel_active_index", var_0 );
        self setclientomnvar( "ui_intel_progress_current", int( var_2 ) );
        self setclientomnvar( "ui_intel_current_tier", var_1 );
    }

    self setclientomnvar( "ui_intel_progress_current", int( self._id_9978._id_D9D9 ) );
}

_id_3934()
{
    return scripts\mp\utility\game::isreallyalive( self );
}

_id_12EB7( var_0 )
{
    if ( !_id_3934() )
    {
        self._id_9978._id_DB8F = var_0;
        thread _id_12EF9();
        return;
    }

    self setclientomnvar( "ui_intel_progress_current", int( var_0 ) );
}

_id_12EB8( var_0 )
{
    if ( !_id_3934() )
    {
        self._id_9978._id_DB90 = var_0;
        thread _id_12EF9();
        return;
    }

    self setclientomnvar( "ui_intel_current_tier", var_0 );
}

_id_12EF9()
{
    self endon( "disconnect" );
    self notify( "updateQueuedUIInfoWhenAble()" );
    self endon( "updateQueuedUIInfoWhenAble()" );

    for (;;)
    {
        if ( _id_3934() )
            break;

        wait 0.25;
    }

    if ( isdefined( self._id_9978._id_DB8F ) )
    {
        _id_12EB7( self._id_9978._id_DB8F );
        self._id_9978._id_DB8F = undefined;
    }

    if ( isdefined( self._id_9978._id_DB90 ) )
    {
        _id_12EB8( self._id_9978._id_DB90 );
        self._id_9978._id_DB90 = undefined;
    }
}

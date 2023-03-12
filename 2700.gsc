// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( level.teambased && !isdefined( level.nobuddyspawns ) )
    {
        if ( !isdefined( level._id_28CE ) )
            level._id_28CE = [];

        level thread onplayerspawned();
        level thread _id_C56E();
    }
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_C4C9();
        var_0 thread _id_C4F5();
    }
}

onplayerspawned()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "player_spawned", var_0 );

        if ( !isai( var_0 ) )
        {
            if ( isdefined( var_0._id_9F69 ) )
            {
                var_0._id_9F69 = undefined;

                if ( isdefined( var_0._id_28CC ) && isalive( var_0._id_28CC ) )
                {
                    if ( var_0._id_28CC getstance() != "stand" )
                        var_0 setstance( "crouch" );
                }
            }

            if ( var_0 _id_138DE() )
            {
                if ( !var_0 _id_8BD4() )
                {
                    var_0._id_6DED = 0;
                    var_0 finalkillcam_victim();
                }

                continue;
            }

            var_0 _id_AB2B();
        }
    }
}

_id_C4C9()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 == "battlebuddy_update" )
        {
            var_2 = !_id_138DE();
            self setrankedplayerdata( "common", "enableBattleBuddy", var_2 );

            if ( var_2 )
                finalkillcam_victim();
            else
                _id_AB2B();

            continue;
        }

        if ( var_0 == "team_select" && self._id_8C2A )
        {
            var_3 = _id_138DE();
            _id_AB2B();
            self setrankedplayerdata( "common", "enableBattleBuddy", var_3 );
        }
    }
}

_id_C4F5()
{
    self waittill( "disconnect" );
    _id_AB2C();
}

_id_136D6()
{
    scripts\mp\utility\game::updatesessionstate( "spectator" );
    self._id_0140 = self._id_28CC getentitynumber();
    self forcethirdpersonwhenfollowing();
    self setclientomnvar( "cam_scene_name", "over_shoulder" );
    self setclientomnvar( "cam_scene_lead", self._id_28CC getentitynumber() );
    _id_136AE();
}

_id_13A5F()
{
    self endon( "disconnect" );
    self endon( "abort_battlebuddy_spawn" );
    self endon( "teamSpawnPressed" );
    level endon( "game_ended" );
    self setclientomnvar( "ui_battlebuddy_showButtonPrompt", 1 );
    self notifyonplayercommand( "respawn_random", "+usereload" );
    self notifyonplayercommand( "respawn_random", "+activate" );
    wait 0.5;
    self waittill( "respawn_random" );
    self setclientomnvar( "ui_battlebuddy_timer_ms", 0 );
    self setclientomnvar( "ui_battlebuddy_showButtonPrompt", 0 );
    _id_FAAF();
}

_id_FAAF()
{
    _id_419E();
    self._id_9F69 = undefined;
    self notify( "randomSpawnPressed" );
    _id_40E7();
}

_id_136AE()
{
    self endon( "randomSpawnPressed" );
    level endon( "game_ended" );
    self._id_9F69 = undefined;
    thread _id_13A5F();

    if ( isdefined( self._id_28CD ) )
    {
        var_0 = 4000 - ( gettime() - self._id_28CD );

        if ( var_0 < 2000 )
            var_0 = 2000;
    }
    else
        var_0 = 4000;

    var_1 = _id_3DF5();

    if ( var_1._id_10E5B == 0 )
        self._id_28CC setclientomnvar( "ui_battlebuddy_status", "incoming" );
    else if ( var_1._id_10E5B == -1 || var_1._id_10E5B == -3 )
        self._id_28CC setclientomnvar( "ui_battlebuddy_status", "err_combat" );
    else
        self._id_28CC setclientomnvar( "ui_battlebuddy_status", "err_pos" );

    _id_12F43( var_0 );

    for ( var_1 = _id_3DF5(); var_1._id_10E5B != 0; var_1 = _id_3DF5() )
    {
        if ( var_1._id_10E5B == -1 || var_1._id_10E5B == -3 )
        {
            self setclientomnvar( "ui_battlebuddy_status", "wait_combat" );
            self._id_28CC setclientomnvar( "ui_battlebuddy_status", "err_combat" );
        }
        else if ( var_1._id_10E5B == -2 )
        {
            self setclientomnvar( "ui_battlebuddy_status", "wait_pos" );
            self._id_28CC setclientomnvar( "ui_battlebuddy_status", "err_pos" );
        }
        else if ( var_1._id_10E5B == -4 )
        {
            _id_40E7();
            return;
        }

        wait 0.5;
    }

    self._id_9F69 = 1;
    thread _id_56D5();
    self playlocalsound( "copycat_steal_class" );
    self notify( "teamSpawnPressed" );
}

_id_419E()
{
    self setclientomnvar( "ui_battlebuddy_status", "none" );
    self setclientomnvar( "ui_battlebuddy_showButtonPrompt", 0 );

    if ( isdefined( self._id_28CC ) )
        self._id_28CC setclientomnvar( "ui_battlebuddy_status", "none" );
}

_id_56D6( var_0 )
{
    scripts\mp\utility\game::_id_F78C( "waiting_info", var_0, undefined, undefined, undefined, undefined, undefined, undefined, 1 );
}

_id_56D5()
{
    _id_419E();

    if ( isdefined( self._id_28CC ) )
    {
        self._id_28CC setclientomnvar( "ui_battlebuddy_status", "on_you" );
        wait 1.5;
        self._id_28CC setclientomnvar( "ui_battlebuddy_status", "none" );
    }
}

_id_3DF5()
{
    var_0 = spawnstruct();

    if ( !isdefined( self._id_28CC ) || !isalive( self._id_28CC ) )
    {
        var_0._id_10E5B = -4;
        return var_0;
    }

    return var_0;
}

_id_40E7()
{
    thread _id_0AF0::_id_F857();
    self._id_0140 = -1;
    scripts\mp\utility\game::updatesessionstate( "dead" );
    self disableforcethirdpersonwhenfollowing();
    self setclientomnvar( "cam_scene_name", "unknown" );
    _id_419E();
    self notify( "abort_battlebuddy_spawn" );
}

_id_12F43( var_0 )
{
    self endon( "disconnect" );
    self endon( "abort_battlebuddy_spawn" );
    self endon( "teamSpawnPressed" );
    var_1 = var_0 * 0.001;
    self setclientomnvar( "ui_battlebuddy_timer_ms", var_0 + gettime() );
    wait( var_1 );
    self setclientomnvar( "ui_battlebuddy_timer_ms", 0 );
}

_id_138DE()
{
    return self getrankedplayerdata( "common", "enableBattleBuddy" );
}

_id_8BD4()
{
    return isdefined( self._id_28CC );
}

_id_BE8E()
{
    return _id_138DE() && !_id_8BD4();
}

_id_9FD1( var_0 )
{
    return self != var_0 && self.team == var_0.team && var_0 _id_BE8E();
}

_id_3876()
{
    return _id_8BD4() && scripts\mp\utility\game::isreallyalive( self._id_28CC );
}

_id_C88C( var_0 )
{
    _id_E103( var_0 );
    self._id_28CC = var_0;
    var_0._id_28CC = self;
    self setclientomnvar( "ui_battlebuddy_idx", var_0 getentitynumber() );
    var_0 setclientomnvar( "ui_battlebuddy_idx", self getentitynumber() );
}

_id_8209()
{
    return level._id_28CE[self.team];
}

_id_1848( var_0 )
{
    if ( !isdefined( level._id_28CE[var_0.team] ) )
        level._id_28CE[var_0.team] = var_0;
    else if ( level._id_28CE[var_0.team] != var_0 )
        return;
}

_id_E103( var_0 )
{
    if ( isdefined( var_0.team ) && isdefined( level._id_28CE[var_0.team] ) && var_0 == level._id_28CE[var_0.team] )
        level._id_28CE[var_0.team] = undefined;
}

finalkillcam_victim()
{
    if ( level.onlinegame )
    {
        self._id_6D95 = self getfireteammembers();

        if ( self._id_6D95.size >= 1 )
        {
            foreach ( var_1 in self._id_6D95 )
            {
                if ( _id_9FD1( var_1 ) )
                    _id_C88C( var_1 );
            }
        }
    }

    if ( !_id_8BD4() )
    {
        var_1 = _id_8209();

        if ( isdefined( var_1 ) && _id_9FD1( var_1 ) )
            _id_C88C( var_1 );
        else
        {
            _id_1848( self );
            self setclientomnvar( "ui_battlebuddy_idx", -1 );
        }
    }
}

_id_419D()
{
    if ( !isalive( self ) )
        _id_FAAF();

    self setclientomnvar( "ui_battlebuddy_idx", -1 );
    self._id_28CC = undefined;
}

_id_AB2B()
{
    if ( _id_8BD4() )
    {
        var_0 = self._id_28CC;
        _id_419D();
        self setrankedplayerdata( "common", "enableBattleBuddy", 0 );
        var_0 _id_419D();
        var_0 finalkillcam_victim();
    }
    else
    {
        _id_E103( self );
        self setclientomnvar( "ui_battlebuddy_idx", -1 );
    }
}

_id_AB2C()
{
    if ( _id_8BD4() )
    {
        var_0 = self._id_28CC;
        var_0 _id_419D();
        var_0 finalkillcam_victim();
        var_0 _id_419E();
    }
    else
    {
        foreach ( var_3, var_2 in level._id_28CE )
        {
            if ( var_2 == self )
            {
                level._id_28CE[var_3] = undefined;
                break;
            }
        }
    }
}

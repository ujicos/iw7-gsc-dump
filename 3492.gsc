// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "high_value_target", ::_id_128E9 );
    level._id_9264["axis"] = 0;
    level._id_9264["allies"] = 0;
    game["dialog"]["hvt_gone"] = "hvt_gone";
}

_id_128E9( var_0, var_1 )
{
    return _id_13091( self, var_0 );
}

_id_DD18()
{
    if ( level.teambased )
        return level._id_9264[self.team] >= 4;
    else if ( isdefined( self._id_9264 ) )
        return self._id_9264 >= 2;

    return 0;
}

_id_13091( var_0, var_1 )
{
    if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
        return 0;

    if ( var_0.team == "spectator" )
        return 0;

    if ( _id_DD18() || isdefined( var_0._id_9264 ) && var_0._id_9264 >= 2 )
    {
        self iprintlnbold( &"KILLSTREAKS_HVT_MAX" );
        return 0;
    }

    var_0 thread _id_F745();
    level thread scripts\mp\utility\game::_id_115DE( "used_hvt", var_0, var_0.team );
    return 1;
}

_id_F745()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 = self.team;
    _id_93F0();
    thread _id_13AA6( var_0 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 10 );

    if ( level.teambased )
        scripts\mp\utility\game::_id_AAE7( "hvt_gone", var_0 );
    else
        scripts\mp\utility\game::leaderdialogonplayer( "hvt_gone" );

    if ( level.teambased )
        level _id_4FBA( var_0 );
    else
        _id_4FBA();
}

_id_93F0()
{
    var_0 = 0;

    if ( level.teambased )
    {
        level._id_9264[self.team]++;
        var_0 = level._id_9264[self.team];
        var_1 = self.team;
    }
    else
    {
        if ( !isdefined( self._id_9264 ) )
            self._id_9264 = 1;
        else
            self._id_9264++;

        var_0 = self._id_9264;
        var_1 = self getentitynumber();
    }

    var_2 = 1 + var_0 * 0.5;
    level._id_115F3[var_1] = clamp( var_2, 1, 4 );
}

_id_4FBA( var_0 )
{
    var_1 = 0;

    if ( level.teambased )
    {
        if ( level._id_9264[var_0] > 0 )
            level._id_9264[var_0]--;

        var_1 = level._id_9264[var_0];
        var_2 = var_0;
    }
    else
    {
        if ( self._id_9264 > 0 )
            self._id_9264--;

        var_1 = self._id_9264;
        var_2 = self getentitynumber();
    }

    var_3 = 1 + var_1 * 0.5;
    level._id_115F3[var_2] = clamp( var_3, 1, 4 );
}

_id_13AA6( var_0 )
{
    level endon( "game_ended" );
    var_1 = scripts\engine\utility::_id_13734( "disconnect", "joined_team", "joined_spectators" );

    if ( level.teambased )
        level _id_4FBA( var_0 );
    else if ( isdefined( self ) && var_1 != "disconnect" )
        _id_4FBA();
}

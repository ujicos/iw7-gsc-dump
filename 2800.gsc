// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_10978["allies"] = spawnstruct();
    level._id_10978["axis"] = spawnstruct();
    level thread _id_C56E();

    if ( getdvarint( "cg_mlg_static_cameras", 0 ) != 0 )
        level thread _id_7F6C();
}

_id_49F0( var_0, var_1 )
{
    precacheshader( var_0 );
    var_2 = spawn( "script_model", ( 0, 0, 0 ) );
    var_2 setmodel( "tag_origin" );
    var_2.angles = ( 0, 0, 0 );
    return var_2;
}

_id_F780( var_0, var_1 )
{
    var_2 = var_0;

    if ( var_2 >= 4 )
        var_2 -= 4;

    var_3 = tolower( getdvar( "mapname" ) );
    var_4 = tablelookup( var_1, 0, var_3, var_2 * 2 + 1 );

    if ( var_4 != "" )
    {
        var_5 = var_0 + 1;

        if ( var_0 >= 5 )
            var_5 -= 4;

        level._id_37C3[var_0] = _id_49F0( "compass_icon_codcaster_cam", 1 );
        level._id_C215[var_0] = _id_49F0( "compass_icon_codcaster_num" + var_5, 0 );
        var_6 = tablelookup( var_1, 0, var_3, var_2 * 2 + 2 );
        level._id_37C8[var_0] = _id_7E16( var_4 );
        level._id_37C1[var_0] = _id_7E16( var_6 );
        level.camerahighestindex = var_0;
    }
}

_id_7F6C()
{
    while ( !isdefined( level.objidpool ) )
        wait 0.05;

    var_0 = "mp/CameraPositions";
    var_1 = var_0 + "_" + level.gametype + ".csv";
    var_0 += ".csv";
    level._id_37C3 = [];
    level._id_C215 = [];

    for ( var_2 = 0; var_2 < 4; var_2++ )
        _id_F780( var_2, var_0 );

    for ( var_2 = 4; var_2 < 8; var_2++ )
        _id_F780( var_2, var_1 );
}

_id_7E16( var_0 )
{
    var_1 = strtok( var_0, " " );
    var_2 = ( 0, 0, 0 );

    if ( isdefined( var_1[0] ) && isdefined( var_1[1] ) && isdefined( var_1[2] ) )
        var_2 = ( int( var_1[0] ), int( var_1[1] ), int( var_1[2] ) );

    return var_2;
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_C541();
        var_0 thread _id_C540();
        var_0 thread _id_C5A1();
        var_0 thread _id_C531();
        var_0 thread _id_C5A2();
    }
}

_id_C541()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_team" );
        _id_F857();
    }
}

_id_C540()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "joined_spectators" );
        _id_F857();
        self setclientomnvar( "ui_callout_area_id", -1 );

        if ( self ismlgspectator() || isdefined( self.pers["mlgSpectator"] ) && self.pers["mlgSpectator"] )
        {
            self _meth_830E( 1 );
            self setclientomnvar( "ui_use_mlg_hud", 1 );
            self _meth_85B1( 0 );
            thread updatemlgspectator();
            thread autoattachtoplayer();
        }
    }
}

_id_C5A1()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spectating_cycle" );
        var_0 = self getspectatingplayer();

        if ( self ismlgspectator() || isdefined( var_0 ) )
        {
            var_1 = level._id_377C._id_2138[var_0._id_3779];
            self setclientomnvar( "ui_callout_area_id", var_1 );

            if ( level.gametype == "ball" )
                scripts\mp\gametypes\ball::_id_2796( self );
        }
    }
}

_id_C5A2()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spectating_mlg_camera" );
        var_0 = self _meth_858E();

        if ( self ismlgspectator() || isdefined( self.pers["mlgSpectator"] ) && self.pers["mlgSpectator"] )
        {
            if ( isdefined( var_0 ) )
            {
                self setclientomnvar( "ui_callout_area_id", -1 );
                continue;
            }
        }
    }
}

_id_C531()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 == "mlg_view_change" )
            scripts\mp\playerlogic::_id_E27B();
    }
}

_id_12F21()
{
    level endon( "game_ended" );

    for ( var_0 = 0; var_0 < level.players.size; var_0++ )
        level.players[var_0] _id_F857();
}

linkcameratoball( var_0 )
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );

    for (;;)
    {
        if ( !isdefined( self.codcasterballcamfollow ) )
            break;

        if ( self isspectatingplayer() )
        {
            wait 0.05;
            continue;
        }

        self cameralinkto( self.codcasterballcamfollow, "tag_origin", 1 );
        var_1 = level.codcasterball.origin;
        var_2 = ( 0, 0, 30 );
        var_2 += -80 * var_0;
        var_3 = var_1 + var_2;
        self.codcasterballcamfollow moveto( var_3, 10.5, 5.2, 5.2 );
        self.codcasterballcamfollow.angles = vectortoangles( var_0 );
        break;
    }
}

autoattachtoplayer()
{
    self endon( "disconnect" );
    self endon( "game_ended" );
    self endon( "joined_team" );
    self endon( "joined_spectator" );
    self endon( "spectating_mlg_camera" );

    for (;;)
    {
        wait 1.0;
        var_0 = undefined;

        if ( !self ismlgspectator() || self isspectatingplayer() )
            break;

        if ( level.players.size > 1 )
        {
            var_1 = scripts\mp\utility\game::_id_81A0( "allies", 0 );

            if ( var_1.size > 0 )
                var_0 = scripts\mp\utility\game::getlowestclientnum( var_1, 1 );

            if ( !isdefined( var_0 ) )
            {
                var_1 = scripts\mp\utility\game::_id_81A0( "axis", 0 );

                if ( var_1.size > 0 )
                    var_0 = scripts\mp\utility\game::getlowestclientnum( var_1, 1 );
            }

            if ( isdefined( var_0 ) )
            {
                self spectateclientnum( var_0 );
                break;
            }
        }
    }
}

updatemlgspectator()
{
    self endon( "joined_team" );
    self endon( "disconnect" );
    self.iswatchingcodcasterball = 0;
    self.codcasterballcamfollow = undefined;
    self.spectatingplayerbeforeballcam = undefined;

    for (;;)
    {
        var_0 = isdefined( level.codcasterball );

        if ( !var_0 || !self ismlgfollowdroneactive() )
        {
            if ( self.iswatchingcodcasterball )
            {
                self.iswatchingcodcasterball = 0;
                self.codcasterballcamfollow unlink();
                self.codcasterballcamfollow delete();
                self.codcasterballcamfollow = undefined;

                if ( !self isspectatingplayer() && isdefined( self.spectatingplayerbeforeballcam ) )
                    self spectateclientnum( self.spectatingplayerbeforeballcam getentitynumber() );
                else
                    self cameraunlink();

                self.spectatingplayerbeforeballcam = undefined;
            }
        }
        else if ( !self.iswatchingcodcasterball )
        {
            if ( self ismlgfollowdroneactive() )
            {
                var_1 = self getspectatingplayer();

                if ( isdefined( var_1 ) && isdefined( level.codcasterballowner ) && var_1 == level.codcasterballowner )
                {
                    self.iswatchingcodcasterball = 1;
                    self.spectatingplayerbeforeballcam = var_1;
                    var_2 = vectornormalize( level.codcasterballinitialforcevector );
                    var_3 = var_1 getvieworigin();
                    self.codcasterballcamfollow = spawn( "script_model", var_3 );
                    self.codcasterballcamfollow.angles = vectortoangles( var_2 );
                    self.codcasterballcamfollow setmodel( "tag_origin" );
                    stopspectateplayer( self getentitynumber() );
                    self cameraunlink();
                    thread linkcameratoball( var_2 );
                }
            }
        }
        else if ( isdefined( self.codcasterballcamfollow ) )
        {
            var_4 = level.codcasterball.origin;
            var_5 = self.codcasterballcamfollow.origin;
            var_6 = distance2d( var_4, var_5 );
            var_7 = var_4 - var_5;
            var_8 = ( var_7[0], var_7[1], 0 );
            var_8 = vectornormalize( var_8 );
            var_9 = var_4;
            var_10 = ( 0, 0, 30 );
            var_10 += -80 * var_8;
            var_11 = var_9 + var_10;

            if ( var_6 > 600 )
                self.codcasterballcamfollow.origin = var_11;
            else
                self.codcasterballcamfollow moveto( var_11, 0.5, 0, 0.2 );

            self.codcasterballcamfollow rotateto( vectortoangles( var_7 ), 0.15, 0.05, 0.05 );
        }

        wait 0.05;
    }
}

_id_F857()
{
    if ( level._id_7669 && gettime() - level._id_766B >= 2000 )
    {
        if ( level._id_BDCC )
        {
            for ( var_0 = 0; var_0 < level._id_115DA.size; var_0++ )
                self allowspectateteam( level._id_115DA[var_0], 0 );
        }
        else
        {
            self allowspectateteam( "allies", 0 );
            self allowspectateteam( "axis", 0 );
        }

        self allowspectateteam( "freelook", 0 );
        self allowspectateteam( "none", 1 );
        return;
    }

    var_1 = scripts\mp\tweakables::_id_81E7( "game", "spectatetype" );

    if ( self ismlgspectator() )
        var_1 = 2;

    if ( scripts\mp\utility\game::bot_is_fireteam_mode() )
        var_1 = 1;

    var_2 = self._id_0291;

    switch ( var_1 )
    {
        case 0:
            _id_F6C5();
            break;
        case 1:
            self notify( "waitForGameStartSpectate" );

            if ( var_2 != "spectator" )
                _id_F87A( var_2 );
            else if ( isdefined( self.pers["last_team"] ) )
            {
                var_2 = self.pers["last_team"];
                _id_F87A( var_2 );
            }
            else if ( scripts\mp\utility\game::_id_766C( "prematch_done" ) )
            {
                if ( randomint( 2 ) )
                    var_2 = "allies";
                else
                    var_2 = "axis";

                _id_F87A( var_2 );
            }
            else
            {
                thread waitforgamestartspectate();
                return;
            }

            break;
        case 2:
            _id_F71A();
            break;
        case 3:
            if ( var_2 == "spectator" )
                _id_F71A();
            else
                _id_F87A( var_2 );

            break;
    }

    if ( isdefined( var_2 ) && ( var_2 == "axis" || var_2 == "allies" ) )
    {
        if ( isdefined( level._id_10978[var_2]._id_1C93 ) )
            self allowspectateteam( "freelook", 1 );

        if ( isdefined( level._id_10978[var_2]._id_1C90 ) )
            self allowspectateteam( scripts\mp\utility\game::_id_8027( var_2 ), 1 );
    }
}

waitforgamestartspectate()
{
    self endon( "waitForGameStartSpectate" );
    level waittill( "prematch_over" );
    thread _id_F857();
}

_id_F6C5()
{
    if ( level._id_BDCC )
    {
        for ( var_0 = 0; var_0 < level._id_115DA.size; var_0++ )
            self allowspectateteam( level._id_115DA[var_0], 0 );
    }
    else
    {
        self allowspectateteam( "allies", 0 );
        self allowspectateteam( "axis", 0 );
    }

    self allowspectateteam( "freelook", 0 );
    self allowspectateteam( "none", 0 );
}

_id_F87A( var_0 )
{
    if ( !level.teambased )
    {
        self allowspectateteam( "allies", 1 );
        self allowspectateteam( "axis", 1 );
        self allowspectateteam( "none", 1 );
        self allowspectateteam( "freelook", 0 );
    }
    else if ( isdefined( var_0 ) && ( var_0 == "allies" || var_0 == "axis" ) && !level._id_BDCC )
    {
        self allowspectateteam( var_0, 1 );
        self allowspectateteam( scripts\mp\utility\game::_id_8027( var_0 ), 0 );
        self allowspectateteam( "freelook", 0 );
        self allowspectateteam( "none", 0 );
    }
    else if ( isdefined( var_0 ) && issubstr( var_0, "team_" ) && level._id_BDCC )
    {
        for ( var_1 = 0; var_1 < level._id_115DA.size; var_1++ )
        {
            if ( var_0 == level._id_115DA[var_1] )
            {
                self allowspectateteam( level._id_115DA[var_1], 1 );
                continue;
            }

            self allowspectateteam( level._id_115DA[var_1], 0 );
        }

        self allowspectateteam( "freelook", 0 );
        self allowspectateteam( "none", 0 );
    }
    else
    {
        if ( level._id_BDCC )
        {
            for ( var_1 = 0; var_1 < level._id_115DA.size; var_1++ )
                self allowspectateteam( level._id_115DA[var_1], 0 );
        }
        else
        {
            self allowspectateteam( "allies", 0 );
            self allowspectateteam( "axis", 0 );
        }

        self allowspectateteam( "freelook", 0 );
        self allowspectateteam( "none", 0 );
    }
}

_id_F71A()
{
    if ( level._id_BDCC )
    {
        for ( var_0 = 0; var_0 < level._id_115DA.size; var_0++ )
            self allowspectateteam( level._id_115DA[var_0], 1 );
    }
    else
    {
        self allowspectateteam( "allies", 1 );
        self allowspectateteam( "axis", 1 );
    }

    self allowspectateteam( "freelook", 1 );
    self allowspectateteam( "none", 1 );
}

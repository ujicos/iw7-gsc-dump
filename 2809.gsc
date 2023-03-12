// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_69B1()
{
    if ( isdefined( self._id_027B ) )
        wait( self._id_027B );

    self playsound( level._id_EC94[self._id_EEB0] );
}

_id_1197( var_0, var_1, var_2, var_3 )
{
    self beginlocationselection( var_1, var_2, 0, var_3 );
    self.selectinglocation = 1;
    self setblurforplayer( 10.3, 0.3 );
    thread endselectiononaction( "cancel_location" );
    thread endselectiononaction( "death" );
    thread endselectiononaction( "disconnect" );
    thread endselectiononaction( "used" );
    thread endselectiononaction( "weapon_change" );
    self endon( "stop_location_selection" );
    thread _id_6388();
    thread _id_6387();

    if ( isdefined( var_0 ) && self.team != "spectator" )
    {
        if ( isdefined( self._id_110E9 ) )
            self._id_110E9 destroy();

        if ( self issplitscreenplayer() )
        {
            self._id_110E9 = scripts\mp\hud_util::_id_49B2( "default", 1.3 );
            self._id_110E9 scripts\mp\hud_util::_id_F801( "CENTER", "CENTER", 0, -98 );
        }
        else
        {
            self._id_110E9 = scripts\mp\hud_util::_id_49B2( "default", 1.6 );
            self._id_110E9 scripts\mp\hud_util::_id_F801( "CENTER", "CENTER", 0, -190 );
        }

        var_4 = _id_7F47( var_0 );
        self._id_110E9 _meth_834D( var_4 );
    }
}

_id_11079( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "generic";

    if ( !var_0 )
    {
        self setblurforplayer( 0, 0.3 );
        self _meth_80DE();
        self.selectinglocation = undefined;

        if ( isdefined( self._id_110E9 ) )
            self._id_110E9 destroy();
    }

    self notify( "stop_location_selection", var_1 );
}

_id_6387()
{
    self endon( "stop_location_selection" );

    for (;;)
    {
        level waittill( "emp_update" );

        if ( !scripts\mp\killstreaks\emp_common::_id_9D29() )
            continue;

        thread _id_11079( 0, "emp" );
        return;
    }
}

endselectiononaction( var_0 )
{
    self endon( "stop_location_selection" );
    self waittill( var_0 );
    thread _id_11079( var_0 == "disconnect", var_0 );
}

_id_6388()
{
    self endon( "stop_location_selection" );
    level waittill( "game_ended" );
    thread _id_11079( 0, "end_game" );
}

_id_9D54( var_0 )
{
    var_1 = tablelookup( "mp/attachmentTable.csv", 4, var_0, 0 );

    if ( isdefined( var_1 ) && var_1 != "" )
        return 1;
    else
        return 0;
}

_id_7DE1( var_0 )
{
    var_1 = tablelookup( "mp/attachmentTable.csv", 4, var_0, 2 );
    return var_1;
}

_id_2287( var_0, var_1 )
{
    foreach ( var_4, var_3 in var_0 )
    {
        if ( var_4 == var_1 )
            return 1;
    }

    return 0;
}

_id_806B()
{
    var_0 = self.origin + ( 0, 0, 10 );
    var_1 = 11;
    var_2 = anglestoforward( self.angles );
    var_2 *= var_1;
    var_3[0] = var_0 + var_2;
    var_3[1] = var_0;
    var_4 = bullettrace( var_3[0], var_3[0] + ( 0, 0, -18 ), 0, undefined );

    if ( var_4["fraction"] < 1 )
    {
        var_5 = spawnstruct();
        var_5.origin = var_4["position"];
        var_5.angles = _id_C706( var_4["normal"] );
        return var_5;
    }

    var_4 = bullettrace( var_3[1], var_3[1] + ( 0, 0, -18 ), 0, undefined );

    if ( var_4["fraction"] < 1 )
    {
        var_5 = spawnstruct();
        var_5.origin = var_4["position"];
        var_5.angles = _id_C706( var_4["normal"] );
        return var_5;
    }

    var_3[2] = var_0 + ( 16, 16, 0 );
    var_3[3] = var_0 + ( 16, -16, 0 );
    var_3[4] = var_0 + ( -16, -16, 0 );
    var_3[5] = var_0 + ( -16, 16, 0 );
    var_6 = undefined;
    var_7 = undefined;

    for ( var_8 = 0; var_8 < var_3.size; var_8++ )
    {
        var_4 = bullettrace( var_3[var_8], var_3[var_8] + ( 0, 0, -1000 ), 0, undefined );

        if ( !isdefined( var_6 ) || var_4["fraction"] < var_6 )
        {
            var_6 = var_4["fraction"];
            var_7 = var_4["position"];
        }
    }

    if ( var_6 == 1 )
        var_7 = self.origin;

    var_5 = spawnstruct();
    var_5.origin = var_7;
    var_5.angles = _id_C706( var_4["normal"] );
    return var_5;
}

_id_C706( var_0 )
{
    var_1 = ( var_0[0], var_0[1], 0 );
    var_2 = length( var_1 );

    if ( !var_2 )
        return ( 0, 0, 0 );

    var_3 = vectornormalize( var_1 );
    var_4 = var_0[2] * -1;
    var_5 = ( var_3[0] * var_4, var_3[1] * var_4, var_2 );
    var_6 = vectortoangles( var_5 );
    return var_6;
}

_id_51CD( var_0 )
{
    var_1 = getentarray( var_0, "classname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_1[var_2] delete();
}

_id_D52E( var_0, var_1, var_2 )
{
    if ( level._id_10A56 )
    {
        if ( isdefined( level.players[0] ) )
            level.players[0] playlocalsound( var_0 );
    }
    else if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_2 ) )
        {
            for ( var_3 = 0; var_3 < level.players.size; var_3++ )
            {
                var_4 = level.players[var_3];

                if ( var_4 issplitscreenplayer() && !var_4 isreloading() )
                    continue;

                if ( isdefined( var_4.pers["team"] ) && var_4.pers["team"] == var_1 && !_id_9DE5( var_4, var_2 ) )
                    var_4 playlocalsound( var_0 );
            }

            return;
        }

        for ( var_3 = 0; var_3 < level.players.size; var_3++ )
        {
            var_4 = level.players[var_3];

            if ( var_4 issplitscreenplayer() && !var_4 isreloading() )
                continue;

            if ( isdefined( var_4.pers["team"] ) && var_4.pers["team"] == var_1 )
                var_4 playlocalsound( var_0 );
        }

        return;
    }
    else if ( isdefined( var_2 ) )
    {
        for ( var_3 = 0; var_3 < level.players.size; var_3++ )
        {
            if ( level.players[var_3] issplitscreenplayer() && !level.players[var_3] isreloading() )
                continue;

            if ( !_id_9DE5( level.players[var_3], var_2 ) )
                level.players[var_3] playlocalsound( var_0 );
        }
    }
    else
    {
        for ( var_3 = 0; var_3 < level.players.size; var_3++ )
        {
            if ( level.players[var_3] issplitscreenplayer() && !level.players[var_3] isreloading() )
                continue;

            level.players[var_3] playlocalsound( var_0 );
        }
    }
}

_id_1043D()
{
    for ( var_0 = 1; var_0 < self._id_B0E0.size; var_0++ )
    {
        var_1 = self._id_B0E0[var_0];
        var_2 = var_1._id_D925;

        for ( var_3 = var_0 - 1; var_3 >= 0 && var_2 > self._id_B0E0[var_3]._id_D925; var_3-- )
            self._id_B0E0[var_3 + 1] = self._id_B0E0[var_3];

        self._id_B0E0[var_3 + 1] = var_1;
    }
}

_id_17EE( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = undefined;

    foreach ( var_12 in self._id_B0E0 )
    {
        if ( var_12.name == var_0 )
        {
            if ( var_12._id_1175C == var_1 && var_12._id_D925 == var_3 )
                return;

            var_10 = var_12;
            break;
        }
    }

    if ( !isdefined( var_10 ) )
    {
        var_10 = spawnstruct();
        self._id_B0E0[self._id_B0E0.size] = var_10;
    }

    var_10.name = var_0;
    var_10._id_1175C = var_1;
    var_10.time = var_2;
    var_10._id_1842 = gettime();
    var_10._id_D925 = var_3;
    var_10._id_10157 = var_4;
    var_10._id_10011 = var_5;
    var_10._id_6ABC = var_6;
    var_10._id_6ABD = var_7;
    var_10._id_0176 = var_8;
    var_10._id_0177 = var_9;
    _id_1043D();
}

_id_E13B( var_0 )
{
    if ( isdefined( self._id_B0E0 ) )
    {
        for ( var_1 = self._id_B0E0.size; var_1 > 0; var_1-- )
        {
            if ( self._id_B0E0[var_1 - 1].name != var_0 )
                continue;

            var_2 = self._id_B0E0[var_1 - 1];

            for ( var_3 = var_1; var_3 < self._id_B0E0.size; var_3++ )
            {
                if ( isdefined( self._id_B0E0[var_3] ) )
                    self._id_B0E0[var_3 - 1] = self._id_B0E0[var_3];
            }

            self._id_B0E0[self._id_B0E0.size - 1] = undefined;
        }

        _id_1043D();
    }
}

_id_7F85()
{
    if ( !isdefined( self._id_B0E0 ) )
        return undefined;

    return self._id_B0E0[0];
}

_id_F78C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    if ( !isdefined( var_6 ) )
        var_6 = 0.85;

    if ( !isdefined( var_7 ) )
        var_7 = 3.0;

    if ( !isdefined( var_8 ) )
        var_8 = 0;

    if ( !isdefined( var_9 ) )
        var_9 = 1;

    _id_17EE( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
    _id_12EC4();
}

_id_12EC4()
{
    if ( !isdefined( self ) )
        return;

    var_0 = _id_7F85();

    if ( !isdefined( var_0 ) )
    {
        if ( isdefined( self._id_B0DE ) && isdefined( self._id_B0E7 ) )
        {
            self._id_B0DE.alpha = 0;
            self._id_B0E7.alpha = 0;
        }
    }
    else
    {
        self._id_B0DE _meth_834D( var_0._id_1175C );
        self._id_B0DE.alpha = 0.85;
        self._id_B0E7.alpha = 1;
        self._id_B0DE._id_0176 = var_0._id_0176;
        self._id_B0DE._id_0177 = var_0._id_0177;

        if ( var_0._id_10011 )
        {
            self._id_B0DE fadeovertime( min( var_0._id_6ABD, 60 ) );
            self._id_B0DE.alpha = var_0._id_6ABC;
        }

        if ( var_0.time > 0 && var_0._id_10157 )
            self._id_B0E7 _meth_834F( max( var_0.time - ( gettime() - var_0._id_1842 ) / 1000, 0.1 ) );
        else
        {
            if ( var_0.time > 0 && !var_0._id_10157 )
            {
                self._id_B0E7 _meth_834D( "" );
                self._id_B0DE fadeovertime( min( var_0.time, 60 ) );
                self._id_B0DE.alpha = 0;
                thread _id_41C8( var_0 );
                thread _id_4194( var_0 );
                return;
            }

            self._id_B0E7 _meth_834D( "" );
        }
    }
}

_id_41C8( var_0 )
{
    self notify( "message_cleared" );
    self endon( "message_cleared" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    _id_41C4( var_0.name );
}

_id_4194( var_0 )
{
    wait( var_0.time );
    _id_41C4( var_0.name );
    self notify( "message_cleared" );
}

_id_41C4( var_0 )
{
    _id_E13B( var_0 );
    _id_12EC4();
}

_id_41C5()
{
    for ( var_0 = 0; var_0 < self._id_B0E0.size; var_0++ )
        self._id_B0E0[var_0] = undefined;

    if ( !isdefined( self._id_B0DE ) )
        return;

    _id_12EC4();
}

_id_D917( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( var_3.team != var_1 )
            continue;

        var_3 iprintln( var_0 );
    }
}

_id_D90E( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < level.players.size; var_2++ )
    {
        var_3 = level.players[var_2];

        if ( isdefined( var_3.pers["team"] ) && var_3.pers["team"] == var_1 )
            var_3 iprintlnbold( var_0 );
    }
}

_id_D90F( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < level.players.size; var_3++ )
    {
        var_4 = level.players[var_3];

        if ( isdefined( var_4.pers["team"] ) && var_4.pers["team"] == var_1 )
            var_4 iprintlnbold( var_0, var_2 );
    }
}

_id_D918( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < level.players.size; var_3++ )
    {
        var_4 = level.players[var_3];

        if ( isdefined( var_4.pers["team"] ) && var_4.pers["team"] == var_1 )
            var_4 iprintln( var_0, var_2 );
    }
}

_id_D916( var_0, var_1 )
{
    var_2 = level.players;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( isdefined( var_1 ) )
        {
            if ( isdefined( var_2[var_3].pers["team"] ) && var_2[var_3].pers["team"] == var_1 )
                var_2[var_3] iprintln( var_0 );

            continue;
        }

        var_2[var_3] iprintln( var_0 );
    }
}

_id_D90B( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = isdefined( var_4 );
    var_8 = 0;

    if ( isdefined( var_5 ) )
        var_8 = 1;

    if ( level._id_10A56 || !var_7 )
    {
        for ( var_9 = 0; var_9 < level.players.size; var_9++ )
        {
            var_10 = level.players[var_9];
            var_11 = var_10.team;

            if ( isdefined( var_11 ) )
            {
                if ( var_11 == var_0 && isdefined( var_2 ) )
                {
                    var_10 iprintln( var_2, var_6 );
                    continue;
                }

                if ( var_11 == var_1 && isdefined( var_3 ) )
                    var_10 iprintln( var_3, var_6 );
            }
        }

        if ( var_7 )
            level.players[0] playlocalsound( var_4 );
    }
    else if ( var_8 )
    {
        for ( var_9 = 0; var_9 < level.players.size; var_9++ )
        {
            var_10 = level.players[var_9];
            var_11 = var_10.team;

            if ( isdefined( var_11 ) )
            {
                if ( var_11 == var_0 )
                {
                    if ( isdefined( var_2 ) )
                        var_10 iprintln( var_2, var_6 );

                    var_10 playlocalsound( var_4 );
                    continue;
                }

                if ( var_11 == var_1 )
                {
                    if ( isdefined( var_3 ) )
                        var_10 iprintln( var_3, var_6 );

                    var_10 playlocalsound( var_5 );
                }
            }
        }
    }
    else
    {
        for ( var_9 = 0; var_9 < level.players.size; var_9++ )
        {
            var_10 = level.players[var_9];
            var_11 = var_10.team;

            if ( isdefined( var_11 ) )
            {
                if ( var_11 == var_0 )
                {
                    if ( isdefined( var_2 ) )
                        var_10 iprintln( var_2, var_6 );

                    var_10 playlocalsound( var_4 );
                    continue;
                }

                if ( var_11 == var_1 )
                {
                    if ( isdefined( var_3 ) )
                        var_10 iprintln( var_3, var_6 );
                }
            }
        }
    }
}

_id_D90D( var_0, var_1, var_2 )
{
    foreach ( var_4 in level.players )
    {
        if ( var_4.team != var_0 )
            continue;

        var_4 _id_D90C( var_1, var_2 );
    }
}

_id_D90C( var_0, var_1 )
{
    self iprintln( var_0 );
    self playlocalsound( var_1 );
}

_id_13A7( var_0 )
{
    if ( level._id_10A56 && self getentitynumber() != 0 )
        return;

    self playlocalsound( var_0 );
}

_id_5F6D( var_0, var_1, var_2, var_3 )
{
    var_0 = "scr_" + level.gametype + "_" + var_0;

    if ( getdvar( var_0 ) == "" )
    {
        setdvar( var_0, var_1 );
        return var_1;
    }

    var_4 = getdvarint( var_0 );

    if ( var_4 > var_3 )
        var_4 = var_3;
    else if ( var_4 < var_2 )
        var_4 = var_2;
    else
        return var_4;

    setdvar( var_0, var_4 );
    return var_4;
}

_id_5F6B( var_0, var_1, var_2, var_3 )
{
    var_0 = "scr_" + level.gametype + "_" + var_0;

    if ( getdvar( var_0 ) == "" )
    {
        setdvar( var_0, var_1 );
        return var_1;
    }

    var_4 = getdvarfloat( var_0 );

    if ( var_4 > var_3 )
        var_4 = var_3;
    else if ( var_4 < var_2 )
        var_4 = var_2;
    else
        return var_4;

    setdvar( var_0, var_4 );
    return var_4;
}

_id_CE31( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        playloopsound( self gettagorigin( var_1 ), var_0 );
    else
        playloopsound( self.origin, var_0 );
}

_id_D526( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        playloopsound( var_1, var_0 );
        var_2 = lookupsoundlength( var_0 ) / 1000;
        wait( var_2 );
        return;
    }
    else
    {
        self playsound( var_0 );
        var_2 = lookupsoundlength( var_0 ) / 1000;
        wait( var_2 );
        return;
    }
}

_id_8027( var_0 )
{
    if ( level._id_BDCC )
    {

    }

    if ( var_0 == "allies" )
        return "axis";
    else if ( var_0 == "axis" )
        return "allies";
    else
        return "none";
}

_id_1359E( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    wait( var_0 );
}

_id_98B3( var_0 )
{
    if ( !isdefined( self.pers[var_0] ) )
        self.pers[var_0] = 0;
}

getpersstat( var_0 )
{
    return self.pers[var_0];
}

incperstat( var_0, var_1, var_2 )
{
    if ( isdefined( self ) && isdefined( self.pers ) && isdefined( self.pers[var_0] ) )
    {
        self.pers[var_0] += var_1;

        if ( !isdefined( var_2 ) || var_2 == 0 )
            scripts\mp\persistence::_id_10E12( var_0, var_1 );
    }
}

_id_F7DF( var_0, var_1 )
{
    self.pers[var_0] = var_1;
}

updatepersratio( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) || !_id_DCD5() )
        return;

    var_4 = scripts\mp\persistence::_id_10E33( var_1 );
    var_5 = scripts\mp\persistence::_id_10E33( var_2 );

    if ( var_5 == 0 )
        var_5 = 1;

    scripts\mp\persistence::_id_10E54( var_0, int( var_4 * 1000 / var_5 ) );
}

_id_12EE9( var_0, var_1, var_2 )
{
    if ( !_id_DCD5() )
        return;

    var_3 = scripts\mp\persistence::_id_10E34( var_1 );
    var_4 = scripts\mp\persistence::_id_10E34( var_2 );

    if ( var_4 == 0 )
        var_4 = 1;

    scripts\mp\persistence::_id_10E55( var_0, int( var_3 * 1000 / var_4 ) );
}

_id_13842( var_0 )
{
    if ( level._id_A9F1 == gettime() )
    {
        if ( isdefined( var_0 ) && var_0 )
        {
            while ( level._id_A9F1 == gettime() )
                wait 0.05;
        }
        else
        {
            wait 0.05;

            if ( level._id_A9F1 == gettime() )
            {
                wait 0.05;

                if ( level._id_A9F1 == gettime() )
                {
                    wait 0.05;

                    if ( level._id_A9F1 == gettime() )
                        wait 0.05;
                }
            }
        }
    }

    level._id_A9F1 = gettime();
}

_id_136EF( var_0, var_1 )
{
    self endon( var_1 );
    wait( var_0 );
}

_id_9DE5( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_0 == var_1[var_2] )
            return 1;
    }

    return 0;
}

_id_AAE7( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( game["dialog"][var_0] ) )
        return;

    if ( level.teambased && !isdefined( var_1 ) )
        return;

    for ( var_5 = 0; var_5 < level.players.size; var_5++ )
    {
        var_6 = level.players[var_5];

        if ( isdefined( var_3 ) && _id_9DE5( var_6, var_3 ) )
            continue;

        if ( var_6 issplitscreenplayer() && !var_6 isreloading() )
            continue;

        if ( level.teambased && ( !isdefined( var_6.pers["team"] ) || var_6.pers["team"] != var_1 ) )
            continue;

        var_6 leaderdialogonplayer_internal( var_0, var_2, undefined, var_4 );
    }
}

_id_98D3()
{
    level._id_AA1D["allies"] = 0;
    level._id_AA1D["axis"] = 0;
}

_id_10E60( var_0, var_1, var_2 )
{
    if ( istrue( level._id_7669 ) )
        return;

    var_3 = gettime();

    if ( gettime() < level._id_AA1D[var_1] + 5000 && ( !isdefined( var_2 ) || !var_2 ) )
        return;

    thread _id_5100( var_0, var_1 );
    level._id_AA1D[var_1] = gettime();
}

_id_5100( var_0, var_1 )
{
    level endon( "game_ended" );
    wait 0.1;
    _id_13842();
    _id_AAE7( var_0, var_1 );
}

_id_AAEE( var_0, var_1, var_2, var_3 )
{
    foreach ( var_5 in var_1 )
        var_5 leaderdialogonplayer( var_0, var_2, undefined, var_3 );
}

leaderdialogonplayer( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( game["dialog"][var_0] ) )
        return;

    leaderdialogonplayer_internal( var_0, var_1, var_2, var_3, var_4 );
}

leaderdialogonplayer_internal( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        var_4 *= 1000;

        if ( gettime() < self._id_AA1D["time"] + var_4 && self._id_AA1D["dialog"] == var_0 )
            return;

        self._id_AA1D["time"] = gettime();
        self._id_AA1D["dialog"] = var_0;
    }

    var_5 = self.pers["team"];

    if ( isdefined( var_5 ) && ( var_5 == "axis" || var_5 == "allies" ) )
    {
        var_6 = self getrankedplayerdata( "common", "mp_announcer_type" );

        if ( var_6 > 0 )
        {
            var_7 = _func_1FA( "mp/announcervoicedata.csv", var_6, 3 );
            var_8 = var_7 + "_1mc_" + game["dialog"][var_0];
        }
        else
            var_8 = game["voice"][var_5] + "1mc_" + game["dialog"][var_0];

        var_8 = tolower( var_8 );
        self _meth_8252( var_8, var_0, 2, var_1, var_2, var_3 );
    }
}

_id_98D4()
{
    self._id_AA1D["time"] = 0;
    self._id_AA1D["dialog"] = "";
}

_id_D4B7( var_0 )
{
    var_1 = self.team;
    var_2 = [ self ];
    var_3 = self _meth_81BC();

    if ( isdefined( var_3 ) )
        var_2[var_2.size] = var_3;

    _id_C638( var_0 + "_use" );

    if ( level.teambased )
    {
        _id_AAE7( var_1 + "_friendly_" + var_0 + "_inbound", var_1, undefined, var_2 );

        if ( _id_7F40( var_0 ) )
            _id_AAE7( var_1 + "_enemy_" + var_0 + "_inbound", level._id_C74B[var_1], undefined, var_2 );
    }
    else if ( _id_7F40( var_0 ) )
        _id_AAE7( var_1 + "_enemy_" + var_0 + "_inbound", undefined, undefined, var_2 );
}

_id_D4B6( var_0, var_1, var_2, var_3 )
{
    if ( level.showingfinalkillcam )
        return;

    var_0 = getbasekillstreakdialog( var_0 );

    if ( !isdefined( game["dialog"][var_0] ) )
        return;

    var_4 = game["dialog"][var_0];

    if ( issubstr( var_4, "op_" + var_0 ) || var_4 == "op_" + var_0 )
        _id_C638( var_0, var_1, var_2, var_3 );
    else
        leaderdialogonplayer( var_0, var_1, var_2, var_3 );
}

getbasekillstreakdialog( var_0 )
{
    var_1 = strtok( var_0, "_" );
    var_2 = undefined;

    foreach ( var_6, var_4 in var_1 )
    {
        if ( !isdefined( var_2 ) )
            var_2 = var_4;
        else
            var_2 += var_4;

        var_5 = var_1[var_6 + 1];

        if ( isdefined( var_5 ) )
        {
            if ( var_5 == "rare" || var_5 == "legend" || var_5 == "epic" )
                break;
            else
                var_2 += "_";
        }
    }

    return var_2;
}

_id_C638( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( game["dialog"][var_0] ) )
        return;

    var_4 = game["dialog"][var_0];
    self _meth_8252( var_4, var_0, 2, var_1, var_2, var_3 );
}

_id_7FEB()
{
    for ( var_0 = 0; var_0 < self._id_AAEF.size; var_0++ )
    {
        if ( issubstr( self._id_AAEF[var_0], "losing" ) )
        {
            if ( self.team == "allies" )
            {
                if ( issubstr( level._id_26F4, self._id_AAEF[var_0] ) )
                    return self._id_AAEF[var_0];
                else
                    scripts\engine\utility::array_remove( self._id_AAEF, self._id_AAEF[var_0] );
            }
            else if ( issubstr( level._id_1C28, self._id_AAEF[var_0] ) )
                return self._id_AAEF[var_0];
            else
                scripts\engine\utility::array_remove( self._id_AAEF, self._id_AAEF[var_0] );

            continue;
        }

        return level._id_1C28[self._id_AAEF];
    }
}

_id_C6E4()
{
    self endon( "disconnect" );
    var_0 = [];
    var_0 = self._id_AAEF;

    for ( var_1 = 0; var_1 < self._id_AAEF.size; var_1++ )
    {
        if ( issubstr( self._id_AAEF[var_1], "losing" ) )
        {
            for ( var_2 = var_1; var_2 >= 0; var_2-- )
            {
                if ( !issubstr( self._id_AAEF[var_2], "losing" ) && var_2 != 0 )
                    continue;

                if ( var_2 != var_1 )
                {
                    _id_22DB( var_0, self._id_AAEF[var_1], var_2 );
                    scripts\engine\utility::array_remove( var_0, self._id_AAEF[var_1] );
                    break;
                }
            }
        }
    }

    self._id_AAEF = var_0;
}

_id_12EC8()
{
    if ( self.pers["team"] == "spectator" )
        self setclientdvar( "g_scriptMainMenu", game["menu_team"] );
    else
        self setclientdvar( "g_scriptMainMenu", game["menu_class_" + self.pers["team"]] );
}

_id_12EDC()
{
    if ( self.pers["team"] == "spectator" )
        self setclientdvar( "cg_objectiveText", "" );
    else
    {
        if ( level._id_E763 > 0 && !_id_9EBD() )
        {
            if ( isdefined( _id_801B( self.pers["team"] ) ) )
            {
                if ( level._id_10A56 )
                {
                    self setclientdvar( "cg_objectiveText", _id_801B( self.pers["team"] ) );
                    return;
                }

                self setclientdvar( "cg_objectiveText", _id_801B( self.pers["team"] ), level._id_E763 );
                return;
                return;
            }

            return;
        }

        if ( isdefined( _id_801C( self.pers["team"] ) ) )
            self setclientdvar( "cg_objectiveText", _id_801C( self.pers["team"] ) );
    }
}

setobjectivetext( var_0, var_1 )
{
    game["strings"]["objective_" + var_0] = var_1;
}

setobjectivescoretext( var_0, var_1 )
{
    game["strings"]["objective_score_" + var_0] = var_1;
}

setobjectivehinttext( var_0, var_1 )
{
    game["strings"]["objective_hint_" + var_0] = var_1;
}

_id_801C( var_0 )
{
    return game["strings"]["objective_" + var_0];
}

_id_801B( var_0 )
{
    return game["strings"]["objective_score_" + var_0];
}

_id_801A( var_0 )
{
    return game["strings"]["objective_hint_" + var_0];
}

_id_81CB()
{
    if ( !isdefined( level._id_10DFF ) || !isdefined( level._id_561F ) )
        return 0;

    if ( level._id_1191F )
        return level._id_1191E - level._id_10DFF - level._id_561F;
    else
        return gettime() - level._id_10DFF - level._id_561F;
}

_id_81CC()
{
    var_0 = _id_81CA();

    if ( var_0 == 0 )
        return 0;

    return _id_81CB() / _id_81CA() * 60 * 1000 * 100;
}

getsecondspassed()
{
    return _id_81CB() / 1000;
}

_id_7FB9()
{
    return getsecondspassed() / 60;
}

_id_41BF()
{
    self._id_0140 = -1;
    self._id_01A9 = -1;
    self._id_004A = 0;
    self.psoffsettime = 0;
    self._id_02B0 = 0;
}

_id_9E4A()
{
    if ( isai( self ) )
        return 0;

    if ( self._id_02B0 )
    {
        if ( self._id_0140 == -1 && self._id_01A9 == -1 )
            return 0;
    }

    return self._id_02B0;
}

_id_F8A0( var_0, var_1 )
{
    self endon( "disconnect" );

    if ( !isdefined( self._id_6AB3 ) )
        self._id_6AB3 = 0.0;

    if ( self._id_6AB3 == var_0 )
        return;

    if ( isdefined( var_1 ) )
        wait( var_1 );

    self notify( "setUIPostGameFade" );
    self endon( "setUIPostGameFade" );

    if ( self._id_6AB3 < var_0 )
        self._id_6AB3 = clamp( self._id_6AB3 + 0.5 * abs( self._id_6AB3 - var_0 ), 0.0, 1.0 );
    else
        self._id_6AB3 = clamp( self._id_6AB3 - 0.5 * abs( self._id_6AB3 - var_0 ), 0.0, 1.0 );

    self setclientomnvar( "ui_post_game_fade", self._id_6AB3 );
    wait 0.1;
    self._id_6AB3 = var_0;
    self setclientomnvar( "ui_post_game_fade", self._id_6AB3 );
}

_id_9FD4( var_0 )
{
    return isdefined( var_0 ) && var_0 != "";
}

_id_81FC( var_0, var_1, var_2 )
{
    if ( var_0 > var_2 )
        return var_2;
    else if ( var_0 < var_1 )
        return var_1;
    else
        return var_0;
}

_id_136EE( var_0 )
{
    var_1 = gettime();
    var_2 = ( gettime() - var_1 ) / 1000;

    if ( var_2 < var_0 )
    {
        wait( var_0 - var_2 );
        return var_0;
    }
    else
        return var_2;
}

registerroundswitchdvar( var_0, var_1, var_2, var_3 )
{
    _id_DF17( "roundswitch", var_1 );
    var_0 = "scr_" + var_0 + "_roundswitch";
    level._id_E766 = var_0;
    level._id_E768 = var_2;
    level._id_E767 = var_3;
    level._id_E765 = getdvarint( var_0, var_1 );

    if ( level._id_E765 < var_2 )
        level._id_E765 = var_2;
    else if ( level._id_E765 > var_3 )
        level._id_E765 = var_3;
}

registerroundlimitdvar( var_0, var_1 )
{
    _id_DF17( "roundlimit", var_1 );
}

_id_DF03( var_0, var_1 )
{
    _id_DF17( "numTeams", var_1 );
}

registerwinlimitdvar( var_0, var_1 )
{
    _id_DF17( "winlimit", var_1 );
}

_id_DF18( var_0, var_1 )
{
    _id_DF17( "winbytwoenabled", var_1 );
}

_id_DF19( var_0, var_1 )
{
    _id_DF17( "winbytwomaxrounds", var_1 );
}

_id_DEEB( var_0, var_1 )
{
    _id_DF17( "dogtags", var_1 );
}

registerscorelimitdvar( var_0, var_1 )
{
    _id_DF17( "scorelimit", var_1 );
}

registertimelimitdvar( var_0, var_1 )
{
    _id_DF16( "timelimit", var_1 );
    setdvar( "ui_timelimit", _id_81CA() );
}

registerhalftimedvar( var_0, var_1 )
{
    _id_DF17( "halftime", var_1 );
    setdvar( "ui_halftime", _id_7EEF() );
}

registernumlivesdvar( var_0, var_1 )
{
    _id_DF17( "numlives", var_1 );
}

_id_803C( var_0, var_1 )
{
    return getdvarint( var_0, getdvarint( var_1 ) );
}

_id_803B( var_0, var_1 )
{
    return getdvarfloat( var_0, getdvarfloat( var_1 ) );
}

_id_F7D3( var_0 )
{
    setdvar( "overtimeTimeLimit", var_0 );
}

_id_7920( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_9EE7 = 1;
    var_2._id_9D26 = 0;
    var_2._id_0114 = var_0;
    var_2._id_4D2F = var_1;
    return var_2;
}

_id_7922( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_9EE7 = 0;
    var_2._id_9D26 = 0;
    var_2._id_9F44 = 1;
    var_2._id_0114 = var_0;
    var_2._id_4D2F = var_1;
    return var_2;
}

_id_791D( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_9EE7 = 0;
    var_2._id_9D26 = 0;
    var_2._id_0114 = var_0;
    var_2._id_4D2F = var_1;
    return var_2;
}

_id_791F( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_9EE7 = 0;
    var_2._id_9D26 = 0;
    var_2._id_0114 = var_0;
    var_2._id_4D2F = var_1;
    return var_2;
}

_id_7921( var_0 )
{
    return var_0.origin + ( 0, 0, 32 );
}

_id_815C()
{
    if ( self getstance() == "crouch" )
        var_0 = self.origin + ( 0, 0, 24 );
    else if ( self getstance() == "prone" )
        var_0 = self.origin + ( 0, 0, 10 );
    else
        var_0 = self.origin + ( 0, 0, 32 );

    return var_0;
}

_id_791E( var_0 )
{
    return var_0.origin;
}

_id_7E8A( var_0 )
{
    var_1 = getdvar( var_0 );

    if ( var_1 == "" )
        return ( 0, 0, 0 );

    var_2 = strtok( var_1, " " );

    if ( var_2.size < 3 )
        return ( 0, 0, 0 );

    setdvar( "tempR", var_2[0] );
    setdvar( "tempG", var_2[1] );
    setdvar( "tempB", var_2[2] );
    return ( getdvarfloat( "tempR" ), getdvarfloat( "tempG" ), getdvarfloat( "tempB" ) );
}

_id_11150( var_0, var_1 )
{
    if ( var_0.size <= var_1.size )
        return var_0;

    if ( getsubstr( var_0, var_0.size - var_1.size, var_0.size ) == var_1 )
        return getsubstr( var_0, 0, var_0.size - var_1.size );

    return var_0;
}

_id_141F( var_0 )
{
    var_1 = self _meth_8173();

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0 )
            continue;
        else
            _id_141E( var_3 );
    }
}

_id_13CB( var_0, var_1, var_2 )
{
    self._id_EB6A[var_0].type = var_1;
    self._id_EB6A[var_0]._id_0195 = var_2;
    self _meth_8299( var_0, var_1, var_2 );
}

_id_9DFD( var_0 )
{
    if ( int( var_0 ) != var_0 )
        return 1;

    return 0;
}

_id_DF17( var_0, var_1 )
{
    var_2 = "scr_" + level.gametype + "_" + var_0;
    level._id_13A08[var_2] = spawnstruct();
    level._id_13A08[var_2]._id_13153 = getdvarint( var_2, var_1 );
    level._id_13A08[var_2].type = "int";
    level._id_13A08[var_2]._id_C174 = "update_" + var_0;
}

_id_DF16( var_0, var_1 )
{
    var_2 = "scr_" + level.gametype + "_" + var_0;
    level._id_13A08[var_2] = spawnstruct();
    level._id_13A08[var_2]._id_13153 = getdvarfloat( var_2, var_1 );
    level._id_13A08[var_2].type = "float";
    level._id_13A08[var_2]._id_C174 = "update_" + var_0;
}

_id_DF15( var_0, var_1 )
{
    var_2 = "scr_" + level.gametype + "_" + var_0;
    level._id_13A08[var_2] = spawnstruct();
    level._id_13A08[var_2]._id_13153 = getdvar( var_2, var_1 );
    level._id_13A08[var_2].type = "string";
    level._id_13A08[var_2]._id_C174 = "update_" + var_0;
}

_id_F7D1( var_0, var_1 )
{
    var_0 = "scr_" + level.gametype + "_" + var_0;
    level._id_C827[var_0] = var_1;
}

_id_8214( var_0 )
{
    var_0 = "scr_" + level.gametype + "_" + var_0;

    if ( isdefined( level._id_C827 ) && isdefined( level._id_C827[var_0] ) )
        return level._id_C827[var_0];

    return level._id_13A08[var_0]._id_13153;
}

_id_12F5B()
{
    while ( game["state"] == "playing" )
    {
        var_0 = getarraykeys( level._id_13A08 );

        foreach ( var_2 in var_0 )
        {
            if ( level._id_13A08[var_2].type == "string" )
                var_3 = _id_80A2( var_2, level._id_13A08[var_2]._id_13153 );
            else if ( level._id_13A08[var_2].type == "float" )
                var_3 = _id_7EBF( var_2, level._id_13A08[var_2]._id_13153 );
            else
                var_3 = _id_7F1D( var_2, level._id_13A08[var_2]._id_13153 );

            if ( var_3 != level._id_13A08[var_2]._id_13153 )
            {
                level._id_13A08[var_2]._id_13153 = var_3;
                level notify( level._id_13A08[var_2]._id_C174, var_3 );
            }
        }

        wait 1.0;
    }
}

_id_9F32()
{
    if ( !level.teambased )
        return 0;

    if ( level._id_13D89 != 1 && level._id_E762 != 1 )
        return 1;

    if ( level.gametype == "sr" || level.gametype == "sd" || level.gametype == "siege" )
        return 1;

    return 0;
}

_id_9DF6()
{
    if ( !level.teambased )
        return 1;

    if ( level._id_E762 > 1 && game["roundsPlayed"] == 0 )
        return 1;

    if ( level._id_13D89 > 1 && game["roundsWon"]["allies"] == 0 && game["roundsWon"]["axis"] == 0 )
        return 1;

    return 0;
}

_id_BFA7()
{
    if ( level._id_72B3 )
        return 1;

    if ( !level.teambased )
        return 1;

    if ( level._id_E762 > 1 && game["roundsPlayed"] >= level._id_E762 - 1 && !_id_9FAA() )
        return 1;

    if ( _id_9ECF() && ( _id_9041() || _id_904A() ) )
    {
        if ( _id_1005D() && _id_9E74() )
            return 1;
        else if ( _id_9FAA() )
        {
            if ( game["overtimeRoundsPlayed"] == 1 )
                return 1;
        }
        else if ( !level._id_D4ED )
            return 1;
    }

    var_0 = level._id_13D89 > 0 && ( _id_80F9( "allies" ) == level._id_13D89 - 1 || _id_80F9( "axis" ) == level._id_13D89 - 1 );
    var_1 = abs( _id_80F9( "allies" ) - _id_80F9( "axis" ) );

    if ( var_0 && var_1 == 0 )
    {
        if ( _id_9ECF() )
            return 0;
        else
            return 1;
    }

    return 0;
}

_id_13918()
{
    if ( level._id_D4ED )
        return 0;

    if ( !level.teambased )
        return 1;

    if ( isdefined( level._id_C556 ) )
        return 0;

    if ( level._id_13D89 == 1 && _id_904A() )
        return 1;

    if ( level._id_E762 == 1 )
        return 1;

    return 0;
}

_id_13916()
{
    if ( level._id_72B3 )
        return 1;

    if ( _id_13918() )
        return 1;

    if ( !level.teambased )
        return 1;

    if ( _id_9041() || _id_904A() )
        return !level._id_D4ED;

    return 0;
}

_id_A00B()
{
    switch ( level.gametype )
    {
        case "sd":
        case "sr":
        case "siege":
            return getdvarint( "scr_" + level.gametype + "_winByTwoEnabled", 0 ) == 1;
    }

    return 0;
}

_id_7FA7()
{
    return getdvarint( "scr_" + level.gametype + "_winByTwoMaxRounds", level._id_13D89 );
}

_id_1005D()
{
    var_0 = game["roundsWon"]["allies"];
    var_1 = game["roundsWon"]["axis"];
    return _id_A00B() && abs( var_0 - var_1 ) < 2 && game["overtimeRoundsPlayed"] < _id_7FA7();
}

_id_9E74()
{
    return _id_1005D() && game["overtimeRoundsPlayed"] == _id_7FA7() - 1;
}

_id_9FAA()
{
    switch ( level.gametype )
    {
        case "ball":
        case "ctf":
            return 1;
    }

    return 0;
}

_id_F88C( var_0 )
{
    if ( !_id_9FAA() )
        return 0;

    var_1 = getsecondspassed();
    var_2 = scripts\mp\gamescore::_id_12B6( var_0 );

    if ( !_id_9FAB() || var_1 < game["timeToBeat"] && var_2 >= game["timeToBeatScore"] )
    {
        if ( game["timeToBeatTeam"] != "none" && game["timeToBeatTeam"] != var_0 )
            game["timeToBeatOld"] = game["timeToBeat"];

        game["timeToBeat"] = var_1;
        game["timeToBeatTeam"] = var_0;
        game["timeToBeatScore"] = var_2;
        return 1;
    }

    return 0;
}

_id_9FAB()
{
    return game["timeToBeat"] != 0;
}

forceplaytimetobeat()
{
    return isgamebattlematch() && game["timeToBeat"] == 0;
}

_id_1005B()
{
    if ( isgamebattlematch() && game["overtimeRoundsPlayed"] == 1 )
        return 1;
    else if ( _id_9FAB() && game["overtimeRoundsPlayed"] == 1 )
        return 1;
    else if ( forceplaytimetobeat() && game["overtimeRoundsPlayed"] > 1 )
        return 1;

    return 0;
}

_id_9ECF()
{
    if ( isgamebattlematch() && !_id_A00B() )
        return 1;

    switch ( level.gametype )
    {
        case "ball":
        case "ctf":
            return 1;
        case "sd":
        case "dd":
        case "sr":
        case "siege":
            return _id_A00B();
    }

    return 0;
}

_id_7F9C()
{
    if ( isgamebattlematch() && !_id_A00B() )
        return -1;

    var_0 = 0;

    switch ( level.gametype )
    {
        case "ball":
        case "ctf":
        case "sd":
        case "sr":
        case "siege":
            var_0 = 2;
            break;
        case "dd":
            var_0 = 1;
            break;
    }

    if ( _id_9D46() && !_id_9FAA() )
        return -1;

    return var_0;
}

_id_8240()
{
    if ( !isdefined( level._id_13D7C ) )
    {
        if ( !_id_9F32() || !_id_9EBD() || _id_9EA9() )
            level._id_13D7C = "teamScores";
        else
            level._id_13D7C = "roundsWon";
    }

    return level._id_13D7C;
}

issimultaneouskillenabled()
{
    if ( !isdefined( level.simultaneouskillenabled ) )
        level.simultaneouskillenabled = getdvarint( "killswitch_simultaneous_deaths", 0 ) == 0;

    if ( isgamebattlematch() )
        level.simultaneouskillenabled = 0;

    return level.simultaneouskillenabled;
}

cantiebysimultaneouskill()
{
    if ( !issimultaneouskillenabled() )
        return 0;

    var_0 = 0;

    switch ( level.gametype )
    {
        case "gun":
        case "dm":
        case "war":
        case "front":
            var_0 = 1;
    }

    return var_0;
}

_id_1004B()
{
    if ( !_id_9041() && !_id_904A() )
        return 0;

    if ( !_id_9ECF() )
        return 0;

    var_0 = _id_8240();
    var_1 = game[var_0]["allies"];
    var_2 = game[var_0]["axis"];
    var_3 = var_1 == var_2;

    if ( var_3 && _id_9900() )
    {
        var_4 = _id_7F9C();
        var_3 = scripts\engine\utility::ter_op( var_4 == -1, 1, game["overtimeRoundsPlayed"] < var_4 );
    }

    var_5 = _id_1005D();
    var_6 = _id_1005B();

    if ( isgamebattlematch() && _id_9FAA() )
    {
        if ( game["overtimeRoundsPlayed"] == 0 )
        {
            var_3 = 0;

            if ( var_1 == var_2 )
                var_3 = 1;
        }
        else if ( !var_6 )
            var_3 = 0;
    }

    return !level._id_72B3 && ( var_3 || var_5 || var_6 );
}

_id_E269()
{
    return level.gametype == "ctf" && !_id_9900() && _id_8240() == "roundsWon";
}

_id_38F3()
{
    if ( !isdefined( level._id_54BB ) )
        level._id_54BB = 0;

    if ( level._id_54BB )
        return 0;

    switch ( level.gametype )
    {
        case "tdef":
        case "conf":
        case "dm":
        case "war":
        case "ball":
        case "grnd":
        case "koth":
        case "front":
        case "dd":
        case "grind":
        case "dom":
            return 1;
        case "mp_zomb":
        case "gun":
        case "ctf":
        case "sd":
        case "sr":
        case "siege":
        case "infect":
            return 0;
        default:
            return 0;
    }
}

_id_9049()
{
    if ( _id_8214( "timelimit" ) <= 0 )
        return 0;

    var_0 = scripts\mp\gamelogic::_id_81CD();

    if ( var_0 > 0 )
        return 0;

    return 1;
}

_id_9041()
{
    if ( level._id_E762 <= 0 )
        return 0;

    return game["roundsPlayed"] >= level._id_E762;
}

_id_9044()
{
    if ( _id_9EBD() )
        return 0;

    if ( level._id_E763 <= 0 )
        return 0;

    if ( level.teambased )
    {
        if ( game["teamScores"]["allies"] >= level._id_E763 || game["teamScores"]["axis"] >= level._id_E763 )
            return 1;
    }
    else
    {
        for ( var_0 = 0; var_0 < level.players.size; var_0++ )
        {
            var_1 = level.players[var_0];

            if ( isdefined( var_1.score ) && var_1.score >= level._id_E763 )
                return 1;
        }
    }

    return 0;
}

_id_904A()
{
    if ( level._id_13D89 <= 0 )
        return 0;

    if ( !level.teambased )
        return 1;

    if ( _id_80F9( "allies" ) >= level._id_13D89 || _id_80F9( "axis" ) >= level._id_13D89 )
        return 1;

    return 0;
}

_id_8105()
{
    if ( _id_9F32() )
    {
        if ( level._id_E762 )
            return level._id_E762;
        else
            return level._id_13D89;
    }
    else
        return level._id_E763;
}

_id_80F9( var_0 )
{
    return game["roundsWon"][var_0];
}

_id_9EBD()
{
    return level.objectivebased;
}

_id_81CA()
{
    if ( _id_9900() && ( !isdefined( game["inNukeOvertime"] ) || !game["inNukeOvertime"] ) )
    {
        if ( istrue( game["timeToBeat"] ) )
            return game["timeToBeat"] / 60;
        else
        {
            var_0 = getdvarfloat( "overtimeTimeLimit" );

            if ( var_0 > 0 )
                return var_0;
            else
                return _id_8214( "timelimit" );
        }
    }
    else if ( isdefined( level._id_6A53 ) && level._id_6A53 > 0 )
        return _id_8214( "timelimit" ) + level._id_6A53;
    else
        return _id_8214( "timelimit" );
}

_id_7EEF()
{
    if ( _id_9900() )
        return 0;
    else if ( isdefined( game["inNukeOvertime"] ) && game["inNukeOvertime"] )
        return 0;
    else
        return _id_8214( "halftime" );
}

_id_9900()
{
    return isdefined( game["status"] ) && game["status"] == "overtime";
}

_id_7672()
{
    if ( isdefined( level._id_7672 ) )
        return level._id_7672;

    if ( level.teambased )
        return level._id_8C2A["axis"] && level._id_8C2A["allies"];

    return level._id_B4BC > 1;
}

_id_7DEA( var_0 )
{
    var_1 = ( 0, 0, 0 );

    if ( !var_0.size )
        return undefined;

    foreach ( var_3 in var_0 )
        var_1 += var_3.origin;

    var_5 = int( var_1[0] / var_0.size );
    var_6 = int( var_1[1] / var_0.size );
    var_7 = int( var_1[2] / var_0.size );
    var_1 = ( var_5, var_6, var_7 );
    return var_1;
}

_id_7F7A( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level.players )
    {
        if ( !isalive( var_3 ) )
            continue;

        if ( level.teambased && isdefined( var_0 ) )
        {
            if ( var_0 == var_3.pers["team"] )
                var_1[var_1.size] = var_3;

            continue;
        }

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_FB09( var_0 )
{
    if ( isdefined( self._id_3AF5 ) )
        self._id_3AF5.alpha = 0;

    self._id_13118 = var_0;
    scripts\engine\utility::_id_1C58( 0 );
    self setclientomnvar( "ui_using_killstreak_remote", 1 );
    self playlocalsound( "mp_killstreak_screen_start" );
    self notify( "using_remote" );
}

_id_80E8()
{
    return self._id_13118;
}

_id_7385( var_0, var_1 )
{
    if ( !isdefined( self.pers ) )
        return;

    if ( !isdefined( self.pers["controllerFreezeStack"] ) )
        self.pers["controllerFreezeStack"] = 0;

    if ( var_0 )
        self.pers["controllerFreezeStack"]++;
    else if ( scripts\engine\utility::_id_9CEE( var_1 ) )
        self.pers["controllerFreezeStack"] = 0;
    else
        self.pers["controllerFreezeStack"]--;

    if ( self.pers["controllerFreezeStack"] <= 0 )
    {
        self.pers["controllerFreezeStack"] = 0;
        self _meth_80F9( 0 );
        self._id_45D6 = 0;
    }
    else
    {
        self _meth_80F9( 1 );
        self._id_45D6 = 1;
    }
}

_id_41E9( var_0 )
{
    if ( isdefined( self._id_3AF5 ) )
        self._id_3AF5.alpha = 1;

    self._id_13118 = undefined;

    if ( !isdefined( var_0 ) )
    {
        scripts\engine\utility::_id_1C58( 1 );
        _id_7385( 0 );
    }

    self setclientomnvar( "ui_using_killstreak_remote", 0 );
    self playlocalsound( "mp_killstreak_screen_end" );
    self notify( "stopped_using_remote" );
}

isusingremote()
{
    return isdefined( self._id_13118 );
}

istryingtousekillstreak()
{
    return isdefined( self.tryingtousekillstreak );
}

_id_DB8D( var_0 )
{
    if ( !isdefined( level._id_DB95 ) )
        level._id_DB95 = [];

    level._id_DB95[var_0] = [];
}

_id_DB8B( var_0, var_1 )
{
    level._id_DB95[var_0][level._id_DB95[var_0].size] = var_1;
}

_id_DB94( var_0 )
{
    var_1 = undefined;
    var_2 = [];

    foreach ( var_4 in level._id_DB95[var_0] )
    {
        if ( !isdefined( var_4 ) )
            continue;

        if ( !isdefined( var_1 ) )
        {
            var_1 = var_4;
            continue;
        }

        var_2[var_2.size] = var_4;
    }

    level._id_DB95[var_0] = var_2;
    return var_1;
}

_id_12C6( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_1 ) )
        var_1 = -1;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( issubstr( var_0, "_akimbo" ) || isdefined( var_2 ) && var_2 == 1 )
        self giveweapon( var_0, var_1, 1, -1, var_3 );
    else
        self giveweapon( var_0, var_1, 0, -1, var_3 );
}

_id_141A( var_0 )
{
    _id_4F5B( "___ SwitchToWeapon() - " + var_0 );
    self _meth_83B5( var_0 );
}

_id_141B( var_0 )
{
    _id_4F5B( "___ SwitchToWeaponImmediate() - " + var_0 );
    self _meth_83B6( var_0 );
}

_id_141E( var_0 )
{
    if ( self _meth_856D() == var_0 )
        self _meth_8570( var_0 );

    self _meth_83B8( var_0 );
}

_id_11494( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        if ( !_id_9DA5( var_0 ) )
            break;

        scripts\engine\utility::waitframe();
    }

    _id_141E( var_0 );
}

_id_CA5F()
{
    return level._id_1CA1;
}

_id_12D6( var_0 )
{
    return isdefined( self._id_CA5B ) && isdefined( self._id_CA5B[var_0] );
}

giveperk( var_0 )
{
    scripts\mp\perks::_id_13D1( var_0 );
    scripts\mp\perks::_id_13CC( var_0 );
}

_id_E150( var_0 )
{
    scripts\mp\perks::_id_1430( var_0 );
    scripts\mp\perks::_id_142F( var_0 );
}

_id_2BBB( var_0 )
{
    if ( !isdefined( self._id_CA5D[var_0] ) )
        self._id_CA5D[var_0] = 1;
    else
        self._id_CA5D[var_0]++;

    if ( self._id_CA5D[var_0] == 1 && _id_12D6( var_0 ) )
    {
        scripts\mp\perks::_id_1431( var_0 );

        foreach ( var_6, var_2 in level._id_6A50 )
        {
            if ( var_0 == var_6 )
            {
                foreach ( var_4 in var_2 )
                {
                    if ( !isdefined( self._id_CA5D[var_4] ) )
                        self._id_CA5D[var_4] = 1;
                    else
                        self._id_CA5D[var_4]++;

                    if ( self._id_CA5D[var_4] == 1 )
                        scripts\mp\perks::_id_1431( var_4 );
                }

                break;
            }
        }
    }
}

_id_12B83( var_0 )
{
    self._id_CA5D[var_0]--;

    if ( self._id_CA5D[var_0] == 0 )
    {
        self._id_CA5D[var_0] = undefined;

        if ( _id_12D6( var_0 ) )
        {
            scripts\mp\perks::_id_13D2( var_0 );

            foreach ( var_6, var_2 in level._id_6A50 )
            {
                if ( var_0 == var_6 )
                {
                    foreach ( var_4 in var_2 )
                    {
                        self._id_CA5D[var_4]--;

                        if ( self._id_CA5D[var_4] == 0 )
                        {
                            scripts\mp\perks::_id_13D2( var_4 );
                            self._id_CA5D[var_4] = undefined;
                        }
                    }

                    break;
                }
            }
        }
    }
}

_id_DB9F( var_0, var_1 )
{
    return _id_DBA1( var_0, 0, var_0.size - 1, var_1 );
}

_id_DBA1( var_0, var_1, var_2, var_3 )
{
    var_4 = var_1;
    var_5 = var_2;

    if ( !isdefined( var_3 ) )
        var_3 = ::_id_DBA0;

    if ( var_2 - var_1 >= 1 )
    {
        var_6 = var_0[var_1];

        while ( var_5 > var_4 )
        {
            while ( [[ var_3 ]]( var_0[var_4], var_6 ) && var_4 <= var_2 && var_5 > var_4 )
                var_4++;

            while ( ![[ var_3 ]]( var_0[var_5], var_6 ) && var_5 >= var_1 && var_5 >= var_4 )
                var_5--;

            if ( var_5 > var_4 )
                var_0 = _id_11304( var_0, var_4, var_5 );
        }

        var_0 = _id_11304( var_0, var_1, var_5 );
        var_0 = _id_DBA1( var_0, var_1, var_5 - 1, var_3 );
        var_0 = _id_DBA1( var_0, var_5 + 1, var_2, var_3 );
    }
    else
        return var_0;

    return var_0;
}

_id_DBA0( var_0, var_1 )
{
    return var_0 <= var_1;
}

_id_11304( var_0, var_1, var_2 )
{
    var_3 = var_0[var_1];
    var_0[var_1] = var_0[var_2];
    var_0[var_2] = var_3;
    return var_0;
}

_id_1417()
{
    if ( isusingremote() && !isdefined( self.fauxdeath ) )
        thread scripts\mp\damage::playerkilled_internal( self, self, self, 10000, 0, "MOD_SUICIDE", "none", ( 0, 0, 0 ), "none", 0, 1116, 1 );
    else if ( !isusingremote() && !isdefined( self.fauxdeath ) )
        self suicide();
}

isreallyalive( var_0 )
{
    if ( isalive( var_0 ) && !isdefined( var_0.fauxdeath ) )
        return 1;

    return 0;
}

_id_13738( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();

    if ( isdefined( var_1 ) )
        thread scripts\engine\utility::_id_13807( var_1, var_6 );

    if ( isdefined( var_2 ) )
        thread scripts\engine\utility::_id_13807( var_2, var_6 );

    if ( isdefined( var_3 ) )
        thread scripts\engine\utility::_id_13807( var_3, var_6 );

    if ( isdefined( var_4 ) )
        thread scripts\engine\utility::_id_13807( var_4, var_6 );

    if ( isdefined( var_5 ) )
        thread scripts\engine\utility::_id_13807( var_5, var_6 );

    var_6 thread _id_1429( var_0, self );
    var_6 waittill( "returned", var_7 );
    var_6 notify( "die" );
    return var_7;
}

_id_1429( var_0, var_1 )
{
    self endon( "die" );

    for ( var_2 = 0.05; var_0 > 0; var_0 -= var_2 )
    {
        if ( isplayer( var_1 ) && !isreallyalive( var_1 ) )
            var_1 waittill( "spawned_player" );

        if ( getomnvar( "ui_prematch_period" ) )
            level waittill( "prematch_over" );

        wait( var_2 );
    }

    self notify( "returned", "timeout" );
}

_id_CF16()
{
    var_0 = randomintrange( 1, 8 );
    var_1 = "generic";

    if ( isfemale() )
        var_1 = "female";

    if ( _id_9D48( "archetype_scout" ) )
        self playsound( "c6_death_vox" );
    else if ( self.team == "axis" )
        self playsound( var_1 + "_death_russian_" + var_0 );
    else
        self playsound( var_1 + "_death_american_" + var_0 );
}

_id_DCD5()
{
    if ( !isplayer( self ) )
        return 0;

    return level.rankedmatch && !self._id_13114;
}

_id_D957()
{
    return level.onlinegame && getdvarint( "xblive_privatematch" );
}

_id_AEB6()
{
    return getdvarint( "systemlink" ) || _id_D957() && getdvarint( "lobby_team_select", 0 );
}

matchmakinggame()
{
    return level.onlinegame && !getdvarint( "xblive_privatematch" );
}

_id_F63E( var_0, var_1, var_2, var_3 )
{

}

_id_6383( var_0 )
{
    self endon( "altscene" );
    var_0 waittill( "death" );
    self notify( "end_altScene" );
}

getgametypenumlives()
{
    return _id_8214( "numlives" );
}

_id_835A( var_0 )
{
    self._id_4402 = var_0;
}

_id_22DB( var_0, var_1, var_2 )
{
    if ( var_0.size != 0 )
    {
        for ( var_3 = var_0.size; var_3 >= var_2; var_3-- )
            var_0[var_3 + 1] = var_0[var_3];
    }

    var_0[var_2] = var_1;
}

_id_80A2( var_0, var_1 )
{
    var_2 = var_1;
    var_2 = getdvar( var_0, var_1 );
    return var_2;
}

_id_7F1D( var_0, var_1 )
{
    var_2 = var_1;
    var_2 = getdvarint( var_0, var_1 );
    return var_2;
}

_id_7EBF( var_0, var_1 )
{
    var_2 = var_1;
    var_2 = getdvarfloat( var_0, var_1 );
    return var_2;
}

_id_A679( var_0 )
{
    if ( var_0 == "venomxgun_mp" || var_0 == "venomxproj_mp" )
        return 1;

    if ( _id_12D6( "specialty_explosivebullets" ) )
        return 0;

    if ( isdefined( self._id_9E5E ) && self._id_9E5E == 1 )
        return 0;

    var_1 = self.pers["killstreaks"];

    if ( isdefined( level._id_A6C5[var_0] ) && isdefined( self._id_110F4 ) && self._id_110F4 != "support" )
    {
        for ( var_2 = 1; var_2 < 4; var_2++ )
        {
            if ( isdefined( var_1[var_2] ) && isdefined( var_1[var_2]._id_110EA ) && var_1[var_2]._id_110EA == level._id_A6C5[var_0] && isdefined( var_1[var_2]._id_AC68 ) && var_1[var_2]._id_AC68 == self.pers["deaths"] )
                return _id_110F2( level._id_A6C5[var_0] );
        }

        return 0;
    }

    return !_id_9E6C( var_0 );
}

_id_110F2( var_0 )
{
    var_1 = scripts\mp\killstreaks\killstreaks::_id_817B( var_0 );
    var_2 = scripts\mp\killstreaks\killstreaks::_id_7FEE();
    var_3 = scripts\mp\killstreaks\killstreaks::_id_817B( var_2 );
    return var_1 < var_3;
}

_id_9D48( var_0 )
{
    return isdefined( self._id_AE62 ) && var_0 == self._id_AE62;
}

isjuggernaut()
{
    if ( isdefined( self.isjuggernaut ) && self.isjuggernaut == 1 )
        return 1;

    if ( isdefined( self._id_9E5A ) && self._id_9E5A == 1 )
        return 1;

    if ( isdefined( self._id_9E5B ) && self._id_9E5B == 1 )
        return 1;

    if ( isdefined( self._id_9E5E ) && self._id_9E5E == 1 )
        return 1;

    if ( isdefined( self._id_9E5D ) && self._id_9E5D == 1 )
        return 1;

    if ( isdefined( self._id_9E5C ) && self._id_9E5C == 1 )
        return 1;

    return 0;
}

_id_8238( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( isrc8weapon( var_0 ) )
        return "killstreak";

    if ( _id_9D78( var_0 ) )
        return "primary";

    if ( _id_9D79( var_0 ) )
        return "secondary";

    if ( _id_9E6C( var_0 ) )
        return "killstreak";

    if ( _id_0AE2::_id_9F0A( var_0 ) )
        return "power";

    if ( _id_9F8D( var_0 ) )
        return "super";

    if ( _id_9E0D( var_0 ) )
        return "gamemode";

    if ( _id_9F7C( var_0, "destructible_" ) )
        return "destructible";

    var_1 = _id_7E9D( var_0 );

    if ( isdefined( var_1 ) )
        return var_1;

    if ( var_0 == "none" )
        return "worldspawn";

    if ( var_0 == "bomb_site_mp" )
        return var_0;

    if ( _id_9F7C( var_0, "spaceship_" ) )
        return "spaceship";
}

_id_7E9D( var_0 )
{
    switch ( var_0 )
    {
        case "throwingknife_mp":
        case "wristrocket_proj_mp":
        case "power_exploding_drone_mp":
        case "split_grenade_mp":
        case "trip_mine_mp":
        case "power_spider_grenade_mp":
        case "wristrocket_mp":
        case "splash_grenade_mp":
        case "blackhole_grenade_mp":
        case "throwingknifec4_mp":
        case "cluster_grenade_mp":
        case "c4_mp":
            var_1 = "lethal";
            break;
        case "flare_mp":
        case "deployable_cover_mp":
        case "blackout_grenade_mp":
        case "trophy_mp":
        case "concussion_grenade_mp":
        case "smoke_grenade_mp":
        case "domeshield_mp":
        case "cryo_mine_mp":
            var_1 = "tactical";
            break;
        case "groundpound_mp":
        case "player_trophy_system_mp":
            var_1 = "trait";
            break;
        case "kineticpulse_emp_mp":
        case "kineticpulse_concuss_mp":
        case "kineticpulse_mp":
        case "super_trophy_mp":
        case "blackhat_mp":
        case "coneflash_mp":
        case "distortionfield_grenade_mp":
        case "fear_grenade_mp":
        case "virus_grenade_mp":
        case "ammo_box_mp":
        case "sonic_sensor_mp":
        case "transponder_mp":
        case "portal_generator_mp":
        case "forcepush_mp":
        case "speed_strip_mp":
        case "copycat_grenade_mp":
        case "adrenaline_mist_mp":
        case "proxy_bomb_mp":
        case "gas_grenade_mp":
        case "bulletstorm_device_mp":
        case "proto_ricochet_device_mp":
        case "emp_grenade_mp":
        case "mobile_radar_mp":
        case "motion_sensor_mp":
        case "gravity_grenade_mp":
        case "sensor_grenade_mp":
        case "smoke_grenadejugg_mp":
        case "flash_grenade_mp":
        case "chargemode_mp":
        case "phaseslash_grenade_mp":
        case "power_attack_drone_mp":
        case "armorup_mp":
        case "eng_drone_gun_mp":
        case "portal_grenade_mp":
        case "micro_turret_gun_mp":
        case "pulse_grenade_mp":
        case "thruster_mp":
        case "battleslide_mp":
        case "mortarmount_mp":
        case "shard_ball_mp":
        case "case_bomb_mp":
        case "disc_marker_mp":
        case "frag_grenade_short_mp":
        case "mortar_shelljugg_mp":
        case "proximity_explosive_mp":
        case "bouncingbetty_mp":
        case "throwingreaper_mp":
        case "throwingknifehack_mp":
        case "throwingknifesiphon_mp":
        case "throwingknifesmokewall_mp":
        case "throwingknifeteleport_mp":
        case "claymore_mp":
        case "semtex_mp":
        case "frag_grenade_mp":
            var_1 = "equipment_other";
            break;
        default:
            var_1 = undefined;
            break;
    }

    return var_1;
}

_id_9F93( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isdefined( var_1 ) || var_1 == "MOD_IMPACT" )
        return 0;

    switch ( var_0 )
    {
        case "blackout_grenade_mp":
        case "concussion_grenade_mp":
        case "smoke_grenade_mp":
        case "cryo_mine_mp":
            return 1;
        case "deployable_cover_mp":
        case "trophy_mp":
        case "domeshield_mp":
            return 0;
        default:
            return 0;
    }
}

_id_24ED()
{
    if ( !isdefined( self ) )
        return 0;

    if ( isdefined( level._id_1541 ) && self == level._id_1541 )
        return 1;

    if ( isdefined( level._id_3F14 ) && isdefined( level._id_3F14._id_8712 ) && self == level._id_3F14._id_8712 )
        return 1;

    if ( isdefined( level._id_DF6F ) && isdefined( level._id_DF6F.owner ) && self == level._id_DF6F.owner )
        return 1;

    if ( isdefined( self._id_13107 ) && self._id_13107 )
        return 1;

    if ( isdefined( self._id_13106 ) && self._id_13106 )
        return 1;
    else if ( isdefined( self._id_13105 ) )
        return 1;

    return 0;
}

_id_9DE2( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 == "turret_minigun_mp" )
        return 1;

    return 0;
}

_id_9E60( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "iw6_axe_mp":
        case "throwingknifejugg_mp":
        case "iw6_riotshieldjugg_mp":
        case "iw6_p226jugg_mp":
        case "iw6_magnumjugg_mp":
        case "iw6_minigunjugg_mp":
        case "smoke_grenadejugg_mp":
        case "mortar_shelljugg_mp":
            return 1;
    }

    return 0;
}

_id_9F8D( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_0 = _id_8234( var_0 );

    if ( isdefined( level._id_112A9 ) && isdefined( level._id_112A9[var_0] ) )
        return 1;

    return 0;
}

issuperdamagesource( var_0 )
{
    if ( _id_9F8D( var_0 ) )
        return 1;

    if ( var_0 == "chargemode_mp" )
        return 1;

    if ( var_0 == "micro_turret_gun_mp" )
        return 1;

    if ( var_0 == "super_trophy_mp" )
        return 1;

    return 0;
}

_id_9E0D( var_0 )
{
    if ( _id_9D6E( var_0 ) )
        return 1;

    switch ( var_0 )
    {
        case "iw7_tdefball_mp":
        case "iw7_uplinkball_mp":
            return 1;
        default:
            return 0;
    }

    return 0;
}

isrc8weapon( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "iw7_minigun_c8_mp":
        case "iw7_chargeshot_c8_mp":
        case "iw7_c8offhandshield_mp":
        case "iw7_c8landing_mp":
        case "iw7_c8shutdown_mp":
        case "iw7_c8destruct_mp":
            return 1;
        default:
            return 0;
    }

    return 0;
}

_id_8225( var_0 )
{
    if ( var_0 == "none" || var_0 == "alt_none" )
        return "other";

    var_1 = _id_8234( var_0 );
    var_2 = _id_13C8F( var_1 );

    if ( !isdefined( var_2 ) )
    {
        if ( _id_9F8D( var_0 ) )
            var_2 = "super";
        else if ( _id_9DE2( var_0 ) )
            var_2 = "weapon_mg";
        else if ( _id_9E6C( var_0 ) )
            var_2 = "killstreak";
        else if ( _id_9E0D( var_0 ) )
            var_2 = "gamemode";
        else
            var_2 = "other";
    }

    return var_2;
}

_id_8217( var_0 )
{
    var_0 = _id_8234( var_0 );

    if ( !isdefined( level._id_13C79 ) )
        level._id_13C79 = [];

    if ( !isdefined( level._id_13C79[var_0] ) )
    {
        var_1 = [];

        for ( var_2 = 0; var_2 <= 19; var_2++ )
        {
            var_3 = tablelookup( "mp/statsTable.csv", 4, var_0, 10 + var_2 );

            if ( var_3 == "" )
                break;

            var_1[var_1.size] = var_3;
        }

        level._id_13C79[var_0] = var_1;
    }

    return level._id_13C79[var_0];
}

_id_821B( var_0, var_1 )
{
    var_2 = _id_8217( var_0 );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( _id_7DE1( var_5 ) == var_1 )
            var_3[var_3.size] = var_5;
    }

    return var_3;
}

_id_8219( var_0, var_1 )
{
    var_0 = _id_8234( var_0 );
    return tablelookup( "mp/statsTable.csv", 4, var_0, 10 + var_1 );
}

_id_249D( var_0, var_1 )
{
    if ( _id_248E( var_0 ) && _id_248E( var_1 ) )
        return 0;

    var_0 = _id_2494( var_0 );
    var_1 = _id_2494( var_1 );
    var_2 = 1;

    if ( var_0 == var_1 )
        var_2 = 0;
    else if ( isdefined( level._id_2493 ) )
    {
        var_3 = scripts\engine\utility::_id_1D3A( [ var_0, var_1 ] );
        var_2 = !isdefined( level._id_2493[var_3[0] + "_" + var_3[1]] );
    }
    else if ( var_0 != "none" && var_1 != "none" )
    {
        var_4 = tablelookuprownum( "mp/attachmentcombos.csv", 0, var_1 );

        if ( tablelookup( "mp/attachmentcombos.csv", 0, var_0, var_4 ) == "no" )
            var_2 = 0;
    }

    return var_2;
}

_id_8234( var_0 )
{
    var_1 = strtok( var_0, "_" );

    if ( var_1[0] == "iw6" || var_1[0] == "iw7" )
    {
        var_0 = var_1[0] + "_" + var_1[1];

        if ( var_1[1] == "chargeshot" && isdefined( var_1[2] ) && var_1[2] == "c8" )
            var_0 = var_1[0] + "_" + var_1[1] + "_" + var_1[2];
    }
    else if ( var_1[0] == "alt" )
        var_0 = var_1[1] + "_" + var_1[2];

    return var_0;
}

_id_821D( var_0 )
{
    if ( var_0 != "none" )
        var_0 = getweaponbasename( var_0 );

    return var_0;
}

_id_E0CF( var_0 )
{
    if ( scripts\mp\weapons::_id_9D3E( var_0 ) )
        var_0 = getsubstr( var_0, 4 );

    return var_0;
}

isclassicweapon( var_0 )
{
    var_1 = _id_8234( var_0 );

    if ( var_1 == "iw7_g18c" || var_1 == "iw7_ump45c" || var_1 == "iw7_cheytacc" || var_1 == "iw7_m1c" || var_1 == "iw7_spasc" || var_1 == "iw7_arclassic" )
        return 1;
    else
        return 0;
}

isburstfireweapon( var_0 )
{
    var_1 = _id_8234( var_0 );

    if ( var_1 == "iw7_rvn" || var_1 == "iw7_cheytac" || var_1 == "iw7_tacburst" )
        return 1;

    var_2 = getweaponvariantindex( var_0 );

    if ( isdefined( var_2 ) )
    {
        if ( var_1 == "iw7_sdfar" && var_2 != 3 && var_2 != 35 )
            return 1;

        if ( var_1 == "iw7_revolver" && var_2 != 3 && var_2 != 35 )
            return 1;

        if ( var_1 == "iw7_gauss" && ( var_2 == 1 || var_2 == 33 || var_2 == 2 || var_2 == 34 || var_2 == 3 || var_2 == 35 ) )
            return 1;

        if ( var_1 == "iw7_sonic" && ( var_2 == 4 || var_2 == 36 ) )
            return 1;

        if ( var_1 == "iw7_m8" && ( var_2 == 4 || var_2 == 36 ) )
            return 1;

        if ( var_1 == "iw7_emc" && ( var_2 == 3 || var_2 == 35 ) )
            return 1;
    }
    else if ( var_1 == "iw7_sdfar" || var_1 == "iw7_revolver" )
        return 1;

    return 0;
}

_id_7DF6( var_0 )
{
    if ( isendstr( var_0, "_ks" ) )
        var_0 = getsubstr( var_0, 0, var_0.size - 3 );

    return var_0;
}

_id_81F6()
{
    var_0 = [];
    var_1 = self getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        var_4 = weaponclass( var_3 );

        if ( !_id_9E6C( var_3 ) && var_4 != "grenade" && var_4 != "rocketlauncher" && self getweaponammostock( var_3 ) != 0 )
            var_0[var_0.size] = var_3;
    }

    return var_0;
}

_id_E552()
{
    var_0 = 0;
    var_1 = self getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        if ( scripts\mp\weapons::_id_9F2D( var_3 ) )
        {
            var_0 = 1;
            break;
        }
    }

    return var_0;
}

_id_E551()
{
    var_0 = 0;
    var_1 = self getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        if ( scripts\mp\weapons::_id_9F2D( var_3 ) )
            var_0++;

        if ( var_0 == 2 )
            break;
    }

    return var_0 == 2;
}

_id_E54D( var_0, var_1 )
{
    var_2 = undefined;

    if ( var_0 )
    {
        self.riotshieldmodel = var_1;
        var_2 = "tag_weapon_right";
    }
    else
    {
        self.riotshieldmodelstowed = var_1;
        var_2 = "tag_shield_back";
    }

    self attachshieldmodel( var_1, var_2 );
    self.hasriotshield = _id_E552();
}

_id_E54F( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;

    if ( var_0 )
    {
        var_1 = self.riotshieldmodel;
        var_2 = "tag_weapon_right";
    }
    else
    {
        var_1 = self.riotshieldmodelstowed;
        var_2 = "tag_shield_back";
    }

    self _meth_8098( var_1, var_2 );

    if ( var_0 )
        self.riotshieldmodel = undefined;
    else
        self.riotshieldmodelstowed = undefined;

    self.hasriotshield = _id_E552();
}

_id_E554( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;
    var_3 = undefined;

    if ( var_0 )
    {
        var_3 = self.riotshieldmodel;
        var_1 = "tag_weapon_right";
        var_2 = "tag_shield_back";
    }
    else
    {
        var_3 = self.riotshieldmodelstowed;
        var_1 = "tag_shield_back";
        var_2 = "tag_weapon_right";
    }

    self _meth_820D( var_3, var_1, var_2 );

    if ( var_0 )
    {
        self.riotshieldmodelstowed = var_3;
        self.riotshieldmodel = undefined;
    }
    else
    {
        self.riotshieldmodel = var_3;
        self.riotshieldmodelstowed = undefined;
    }
}

riotshield_clear()
{
    self.hasriotshieldequipped = 0;
    self.hasriotshield = 0;
    self.riotshieldmodelstowed = undefined;
    self.riotshieldmodel = undefined;
}

riotshield_getmodel()
{
    return scripts\engine\utility::ter_op( isjuggernaut(), "weapon_riot_shield_jug_iw6", "weapon_riot_shield_iw6" );
}

_id_C793( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = level.players;
    var_6 = scripts\mp\outline::_id_C78A( var_1 );
    var_7 = scripts\mp\outline::_id_C7A9( var_4 );
    return scripts\mp\outline::_id_C796( var_0, var_6, var_5, var_2, var_3, var_7, "ALL" );
}

_id_C795( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_81A0( var_2, 0 );
    var_7 = scripts\mp\outline::_id_C78A( var_1 );
    var_8 = scripts\mp\outline::_id_C7A9( var_5 );
    return scripts\mp\outline::_id_C796( var_0, var_7, var_6, var_3, var_4, var_8, "TEAM", var_2 );
}

_id_C794( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = scripts\mp\outline::_id_C78A( var_1 );
    var_7 = scripts\mp\outline::_id_C7A9( var_5 );

    if ( isagent( var_2 ) )
        return scripts\mp\outline::_id_C79A();

    return scripts\mp\outline::_id_C796( var_0, var_6, [ var_2 ], var_3, var_4, var_7, "ENTITY" );
}

_id_C78F( var_0, var_1 )
{
    scripts\mp\outline::_id_C790( var_0, var_1 );
}

_id_C7AA( var_0 )
{
    scripts\mp\outline::_id_C7AB( var_0 );
}

_id_98AA()
{
    level._id_C7A1 = [];
    level._id_C7A2 = 0;
}

_id_180C( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_0245 = var_0;
    var_2.radius = var_1;
    var_3 = level._id_C7A2;
    level._id_C7A1[var_3] = var_2;
    level._id_C7A2++;
    return var_3;
}

_id_E14A( var_0 )
{
    level._id_C7A1[var_0] = undefined;
}

_id_C7A0( var_0, var_1 )
{
    foreach ( var_3 in level._id_C7A1 )
    {
        if ( !isdefined( var_3 ) || !isdefined( var_3._id_0245 ) || !isdefined( var_3.radius ) )
            continue;

        if ( scripts\engine\utility::_id_F18C( var_0, var_1, var_3._id_0245, var_3.radius ) )
            return 1;
    }

    return 0;
}

_id_D52A( var_0, var_1 )
{
    playloopsound( var_1, var_0 );
}

_id_ACDD( var_0, var_1 )
{
    var_2 = 1;

    for ( var_3 = 0; var_3 < var_1; var_3++ )
        var_2 *= 10;

    var_4 = var_0 * var_2;
    var_4 = int( var_4 );
    var_4 /= var_2;
    return var_4;
}

_id_E75C( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = "nearest";

    var_3 = 1;

    for ( var_4 = 0; var_4 < var_1; var_4++ )
        var_3 *= 10;

    var_5 = var_0 * var_3;

    if ( var_2 == "up" )
        var_6 = ceil( var_5 );
    else if ( var_2 == "down" )
        var_6 = floor( var_5 );
    else
        var_6 = var_5 + 0.5;

    var_5 = int( var_6 );
    var_5 /= var_3;
    return var_5;
}

_id_D38F( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( var_2._id_41F0 == var_0 )
            return var_2;
    }

    return undefined;
}

_id_1114F( var_0 )
{
    var_1 = strtok( var_0, "." );
    var_2 = int( var_1[0] );

    if ( isdefined( var_1[1] ) )
    {
        var_3 = 1;

        for ( var_4 = 0; var_4 < var_1[1].size; var_4++ )
            var_3 *= 0.1;

        var_2 += int( var_1[1] ) * var_3;
    }

    return var_2;
}

_id_F838( var_0 )
{
    self makeusable();

    foreach ( var_2 in level.players )
    {
        if ( var_2 != var_0 )
        {
            self disableplayeruse( var_2 );
            continue;
        }

        self enableplayeruse( var_2 );
    }
}

_id_F63C()
{
    foreach ( var_1 in level.players )
        self disableplayeruse( var_1 );
}

_id_B2B4( var_0 )
{
    self makeusable();
    thread _id_1438( var_0 );
}

_id_1438( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        foreach ( var_2 in level.players )
        {
            if ( var_2.team == var_0 )
            {
                self enableplayeruse( var_2 );
                continue;
            }

            self disableplayeruse( var_2 );
        }

        level waittill( "joined_team" );
    }
}

_id_B2A0( var_0 )
{
    self makeusable();
    thread _id_1437( var_0 );
}

_id_1437( var_0 )
{
    self endon( "death" );
    var_1 = var_0.team;

    for (;;)
    {
        if ( level.teambased )
        {
            foreach ( var_3 in level.players )
            {
                if ( var_3.team != var_1 )
                {
                    self enableplayeruse( var_3 );
                    continue;
                }

                self disableplayeruse( var_3 );
            }
        }
        else
        {
            foreach ( var_3 in level.players )
            {
                if ( var_3 != var_0 )
                {
                    self enableplayeruse( var_3 );
                    continue;
                }

                self disableplayeruse( var_3 );
            }
        }

        level waittill( "joined_team" );
    }
}

_id_980B()
{
    if ( !isdefined( game["flags"] ) )
        game["flags"] = [];
}

_id_766E( var_0, var_1 )
{
    game["flags"][var_0] = var_1;
}

_id_766C( var_0 )
{
    return game["flags"][var_0];
}

_id_766F( var_0 )
{
    game["flags"][var_0] = 1;
    level notify( var_0 );
}

_id_766D( var_0 )
{
    game["flags"][var_0] = 0;
}

_id_7670( var_0 )
{
    while ( !_id_766C( var_0 ) )
        level waittill( var_0 );
}

_id_9F0D( var_0 )
{
    if ( var_0 == "MOD_RIFLE_BULLET" || var_0 == "MOD_PISTOL_BULLET" )
        return 1;

    return 0;
}

_id_9DFF( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( var_1 ) && scripts\engine\utility::_id_9D74( var_1 ) )
    {
        var_3 = _id_821A( var_0 );

        foreach ( var_5 in var_3 )
        {
            if ( var_5 == "fmj" || var_5 == "reflect" )
            {
                var_2 = 1;
                break;
            }
        }
    }

    return var_2;
}

_id_9892()
{
    if ( !isdefined( level._id_ABF3 ) )
        level._id_ABF3 = [];
}

_id_ABF2( var_0, var_1 )
{
    level._id_ABF3[var_0] = var_1;
}

_id_ABF0( var_0 )
{
    return level._id_ABF3[var_0];
}

_id_ABF4( var_0 )
{
    level._id_ABF3[var_0] = 1;
    level notify( var_0 );
}

_id_ABF1( var_0 )
{
    level._id_ABF3[var_0] = 0;
    level notify( var_0 );
}

_id_ABF5( var_0 )
{
    while ( !_id_ABF0( var_0 ) )
        level waittill( var_0 );
}

_id_ABF6( var_0 )
{
    while ( _id_ABF0( var_0 ) )
        level waittill( var_0 );
}

_id_9E68()
{
    return scripts\mp\killstreaks\emp_common::_id_9D29() || _id_9D31();
}

_id_9D31()
{
    if ( self.team == "spectator" )
        return 0;

    if ( level.teambased )
        return level._id_115C0[self.team];
    else
        return isdefined( level._id_1A94 ) && level._id_1A94 != self;
}

_id_9EBB()
{
    if ( self.team == "spectator" )
        return 0;

    return isdefined( self.nuked );
}

_id_8071( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( var_2.guid == var_0 )
            return var_2;
    }

    return undefined;
}

_id_115DE( var_0, var_1, var_2, var_3 )
{
    if ( level._id_8B38 )
        return;

    foreach ( var_5 in level.players )
    {
        if ( var_5 ismlgspectator() )
        {
            var_6 = var_5 getspectatingplayer();

            if ( isdefined( var_6 ) && isdefined( var_2 ) && var_6.team != var_2 )
                continue;
        }
        else
        {
            if ( isdefined( var_2 ) && var_5.team != var_2 )
                continue;

            if ( !isplayer( var_5 ) )
                continue;
        }

        var_5 thread scripts\mp\hud_message::showsplash( var_0, var_3, var_1 );
    }
}

ispickedupweapon( var_0 )
{
    if ( _id_9D78( var_0 ) || _id_9D79( var_0 ) )
    {
        if ( issubstr( var_0, "alt_" ) && var_0 != "iw7_venomx_mp+venomxalt_burst" )
            var_0 = getsubstr( var_0, 4, var_0.size );

        var_1 = isdefined( self.pers["primaryWeapon"] ) && self.pers["primaryWeapon"] == var_0;
        var_2 = isdefined( self.pers["secondaryWeapon"] ) && self.pers["secondaryWeapon"] == var_0;

        if ( !var_1 && !var_2 )
            return 1;
    }

    return 0;
}

_id_9D78( var_0 )
{
    switch ( _id_8225( var_0 ) )
    {
        case "weapon_riot":
        case "weapon_shotgun":
        case "weapon_sniper":
        case "weapon_dmr":
        case "weapon_lmg":
        case "weapon_assault":
        case "weapon_smg":
            return 1;
        default:
            return 0;
    }
}

_id_9D79( var_0 )
{
    switch ( _id_8225( var_0 ) )
    {
        case "weapon_machine_pistol":
        case "weapon_projectile":
        case "weapon_rail":
        case "weapon_beam":
        case "weapon_pistol":
        case "weapon_melee":
            return 1;
        default:
            return 0;
    }
}

iscacmeleeweapon( var_0 )
{
    return _id_8225( var_0 ) == "weapon_melee";
}

_id_7F5E( var_0 )
{
    var_1 = undefined;

    foreach ( var_3 in level.players )
    {
        if ( isdefined( var_0 ) && var_3.team != var_0 )
            continue;

        if ( !isreallyalive( var_3 ) && !var_3 scripts\mp\playerlogic::_id_B4EE() )
            continue;

        if ( isdefined( var_3.switching_teams ) && var_3.switching_teams )
            continue;

        var_1 = var_3;
    }

    return var_1;
}

_id_808A()
{
    var_0 = [];

    foreach ( var_2 in level.players )
    {
        if ( !isreallyalive( var_2 ) && !var_2 scripts\mp\playerlogic::_id_B4EE() )
            continue;

        if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
        {
            if ( var_2 ismlgspectator() )
                continue;
        }

        var_0[var_0.size] = var_2;
    }

    return var_0;
}

_id_1383E( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_2 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0.05;

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    for (;;)
    {
        if ( self.health != self.maxhealth )
            var_2 = 0;
        else
            var_2 += var_1;

        wait( var_1 );

        if ( self.health == self.maxhealth && var_2 >= var_0 )
            break;
    }

    return;
}

_id_6282()
{
    if ( !isdefined( self._id_13C9E ) )
        self._id_13C9E = 0;

    self._id_13C9E++;
    self laseron();
}

_id_561C()
{
    self._id_13C9E--;

    if ( self._id_13C9E == 0 )
    {
        self laseroff();
        self._id_13C9E = undefined;
    }
}

_id_2496( var_0, var_1 )
{
    var_2 = _id_8234( var_1 );

    if ( var_2 != var_1 )
    {
        var_3 = getweaponbasename( var_1 );

        if ( isdefined( level._id_2492[var_3] ) && isdefined( level._id_2497[var_0] ) && isdefined( level._id_2492[var_3][level._id_2497[var_0]] ) )
        {
            var_4 = level._id_2497[var_0];
            return level._id_2492[var_3][var_4];
        }
        else if ( isdefined( level._id_2492[var_3] ) && isdefined( level._id_2492[var_3][var_0] ) )
            return level._id_2492[var_3][var_0];
        else
        {
            var_5 = strtok( var_3, "_" );

            if ( var_5.size > 3 )
            {
                var_6 = var_5[0] + "_" + var_5[1] + "_" + var_5[2];

                if ( isdefined( level._id_2492[var_6] ) && isdefined( level._id_2492[var_6][var_0] ) )
                    return level._id_2492[var_6][var_0];
            }
        }
    }

    if ( isdefined( level._id_2492[var_2] ) && isdefined( level._id_2492[var_2][var_0] ) )
        return level._id_2492[var_2][var_0];
    else
    {
        var_7 = _id_13C8F( var_2 );

        if ( isdefined( level._id_2492[var_7] ) && isdefined( level._id_2492[var_7][var_0] ) )
            return level._id_2492[var_7][var_0];
    }

    return var_0;
}

_id_2499( var_0 )
{
    if ( isdefined( level._id_2491[var_0] ) )
        return level._id_2491[var_0];

    return undefined;
}

_id_13C75( var_0 )
{
    if ( isdefined( level._id_13CA5[var_0] ) && isdefined( level._id_13CA5[var_0]._id_23B0 ) )
        var_0 = level._id_13CA5[var_0]._id_23B0;

    return var_0;
}

_id_13CB4( var_0 )
{
    if ( isdefined( level._id_13CA5[var_0] ) && isdefined( level._id_13CA5[var_0]._id_CA2E ) )
        return level._id_13CA5[var_0]._id_CA2E;

    return undefined;
}

_id_13C8F( var_0 )
{
    if ( isdefined( level._id_13CA5[var_0] ) && isdefined( level._id_13CA5[var_0]._id_8677 ) )
        return level._id_13CA5[var_0]._id_8677;

    return undefined;
}

_id_13CAC( var_0 )
{
    if ( isdefined( level._id_13CA5[var_0] ) && isdefined( level._id_13CA5[var_0]._id_C211 ) )
        return level._id_13CA5[var_0]._id_C211;
}

_id_13C76( var_0 )
{
    if ( isdefined( level._id_13CA5[var_0] ) && isdefined( level._id_13CA5[var_0]._id_2476 ) )
        return level._id_13CA5[var_0]._id_2476;

    return undefined;
}

_id_13C86( var_0 )
{
    return isdefined( level._id_13CA5[var_0] );
}

_id_13C7A( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isdefined( level._id_248B[var_3] ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_9D55( var_0, var_1 )
{
    var_2 = strtok( var_0, "_" );
    return _id_9D56( var_2, var_1 );
}

_id_9D56( var_0, var_1 )
{
    var_2 = 0;

    if ( var_0.size && isdefined( var_1 ) )
    {
        var_3 = 0;

        if ( var_0[0] == "alt" )
            var_3 = 1;

        if ( var_0.size >= 3 + var_3 && ( var_0[var_3] == "iw6" || var_0[var_3] == "iw7" ) )
        {
            if ( weaponclass( var_0[var_3] + "_" + var_0[var_3 + 1] + "_" + var_0[var_3 + 2] ) == "sniper" )
                var_2 = var_0[var_3 + 1] + "scope" == var_1;
        }
    }

    return var_2;
}

_id_821A( var_0 )
{
    if ( var_0 != "none" )
    {
        var_1 = getweaponattachments( var_0 );

        foreach ( var_4, var_3 in var_1 )
            var_1[var_4] = _id_2494( var_3 );

        return var_1;
    }

    return [];
}

_id_7DDD()
{
    var_0 = [];
    var_1 = 0;

    for ( var_2 = tablelookup( "mp/attachmentTable.csv", 0, var_1, 5 ); var_2 != ""; var_2 = tablelookup( "mp/attachmentTable.csv", 0, var_1, 5 ) )
    {
        var_3 = tablelookup( "mp/attachmentTable.csv", 0, var_1, 2 );

        if ( var_3 != "none" && !scripts\engine\utility::array_contains( var_0, var_2 ) )
            var_0[var_0.size] = var_2;

        var_1++;
    }

    return var_0;
}

_id_2494( var_0 )
{
    if ( isdefined( level._id_2497[var_0] ) )
        var_0 = level._id_2497[var_0];

    return var_0;
}

_id_2495( var_0 )
{
    var_1 = undefined;

    if ( isdefined( level._id_2498[var_0] ) )
        var_1 = level._id_2498[var_0];

    return var_1;
}

_id_13CA1( var_0, var_1, var_2 )
{
    if ( isdefined( var_0 ) )
    {
        switch ( var_0 )
        {
            case "domeshield_plant_mp":
                var_0 = "domeshield_mp";
                break;
            case "power_exploding_drone_transform_mp":
                var_0 = "power_exploding_drone_mp";
                break;
            case "semtexproj_mp":
                var_0 = "iw6_mk32_mp";
                break;
            case "iw6_semtexshards_mp":
                var_0 = "venomproj_mp";
                break;
            case "globproj_mp":
                var_0 = "splash_grenade_mp";
                break;
            case "niagara_mini_mp":
                var_0 = "iw7_niagara_mp";
                break;
            case "wristrocket_proj_mp":
                var_0 = "wristrocket_mp";
                break;
            case "split_grenade_mini_mp":
                var_0 = "split_grenade_mp";
                break;
            case "destructible_toy":
                if ( isdefined( var_1 ) )
                {
                    if ( isdefined( var_1._id_13C2E ) )
                        var_0 = var_1._id_13C2E;
                    else
                        var_0 = "destructible_car";

                    if ( !istrue( var_2 ) )
                        var_0 = _id_13CA1( var_0, var_1, 1 );
                }

                break;
            case "iw7_spas_mpr_focus":
                var_0 = "iw7_spas_mpr";
                break;
            case "iw7_erad_mp_jump_spread":
                var_0 = "iw7_erad_mp";
                break;
            case "gltacburst":
                var_0 = "alt_iw7_tacburst_mp";
                break;
            case "gltacburst_regen":
            case "gltacburst_big":
                var_0 = "alt_iw7_tacburst_mpl";
                break;
            default:
                var_3 = self;

                if ( var_0 != "alt_none" && _id_8234( var_0 ) == "iw7_axe" )
                {
                    if ( isdefined( var_1 ) )
                    {
                        var_3 = var_1;

                        if ( !isplayer( var_1 ) && isdefined( var_1.owner ) )
                            var_3 = var_1.owner;

                        if ( isdefined( var_1.classname ) && var_1.classname != "grenade" && var_3 getweaponammoclip( var_0 ) == 0 )
                            var_0 = "iw7_fists_mp";
                    }
                }

                break;
        }
    }

    return var_0;
}

_id_249F( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( _id_2490( var_3 ) )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_2490( var_0 )
{
    if ( _id_248F( var_0 ) )
        return 0;

    if ( _id_248E( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "glmp28_smoke":
        case "glsmoke_slow":
        case "glsmoke":
        case "shotgunlongshot":
        case "meleervn":
        case "axefists":
        case "arripper":
        case "arm8":
        case "gltacburst_regen":
        case "gltacburst_big":
        case "gltacburst":
        case "scope":
            return 0;
    }

    return 1;
}

_id_13C94( var_0 )
{
    return 0;
}

_id_13C9B( var_0 )
{
    if ( _id_13C91( var_0 ) )
        return 1;
    else
        return _id_13C90( var_0, "firetypeburst" );
}

_id_13C9C( var_0 )
{
    var_1 = _id_8234( var_0 );
    return var_1 == "iw7_spas" || var_1 == "iw7_spasc" || var_1 == "iw7_sonic";
}

_id_13C91( var_0 )
{
    var_1 = _id_8234( var_0 );

    if ( var_1 == "iw7_sdfar" )
    {
        var_2 = _id_821A( var_0 );

        foreach ( var_4 in var_2 )
        {
            if ( var_4 == "firetypeauto" || var_4 == "firetypesingle" )
                return 0;
        }

        return 1;
    }
    else
        return 0;
}

_id_13C93( var_0 )
{
    return var_0 == "iw6_g28";
}

_id_13C92( var_0 )
{
    return var_0 == "iw6_cbjms";
}

_id_13C95( var_0 )
{
    var_1 = _id_8234( var_0 );

    if ( var_1 == "iw6_dlcweap03" )
    {
        var_2 = getweaponattachments( var_0 );

        foreach ( var_4 in var_2 )
        {
            if ( _id_9F7C( var_4, "dlcweap03" ) )
                return 1;
        }
    }

    return 0;
}

_id_13C90( var_0, var_1 )
{
    var_2 = _id_821A( var_0 );

    foreach ( var_4 in var_2 )
    {
        if ( var_4 == var_1 )
            return 1;
    }

    return 0;
}

_id_9EE8()
{
    return self playerads() > 0.5;
}

_id_11A42()
{
    var_0 = getentarray( "trigger_hurt", "classname" );

    foreach ( var_2 in var_0 )
    {
        if ( self istouching( var_2 ) )
            return 1;
    }

    var_4 = getentarray( "radiation", "targetname" );

    foreach ( var_2 in var_4 )
    {
        if ( self istouching( var_2 ) )
            return 1;
    }

    return 0;
}

_id_11A44()
{
    if ( istrue( self.allowedintrigger ) )
        return 0;

    foreach ( var_1 in level._id_C7B3 )
    {
        if ( self istouching( var_1 ) )
            return 1;
    }

    return 0;
}

touchingballallowedtrigger()
{
    if ( !istrue( level.ballallowedtriggers.size ) )
        return 0;

    self.allowedintrigger = 0;

    foreach ( var_1 in level.ballallowedtriggers )
    {
        if ( self istouching( var_1 ) )
        {
            self.allowedintrigger = 1;
            return 1;
        }
    }

    return 0;
}

touchingplayerallowedtrigger()
{
    if ( !istrue( level.playerallowedtriggers.size ) )
        return 0;

    self.allowedintrigger = 0;

    foreach ( var_1 in level.playerallowedtriggers )
    {
        if ( self istouching( var_1 ) )
        {
            self.allowedintrigger = 1;
            return 1;
        }
    }

    return 0;
}

_id_F887( var_0 )
{
    if ( var_0 )
        self setdepthoffield( 0, 110, 512, 4096, 6, 1.8 );
    else
        self setdepthoffield( 0, 0, 512, 512, 4, 0 );
}

_id_A6C9( var_0, var_1, var_2 )
{
    var_3 = spawn( "trigger_radius", var_0, 0, var_1, var_2 );

    for (;;)
    {
        var_3 waittill( "trigger", var_4 );

        if ( !isplayer( var_4 ) )
            continue;

        var_4 suicide();
    }
}

_id_6CB9( var_0, var_1, var_2 )
{
    var_3 = cos( var_2 );
    var_4 = anglestoforward( var_0.angles );
    var_5 = var_1.origin - var_0.origin;
    var_4 *= ( 1, 1, 0 );
    var_5 *= ( 1, 1, 0 );
    var_5 = vectornormalize( var_5 );
    var_4 = vectornormalize( var_4 );
    var_6 = vectordot( var_5, var_4 );

    if ( var_6 >= var_3 )
        return 1;
    else
        return 0;
}

_id_5B75( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = int( var_3 * 20 );

    for ( var_6 = 0; var_6 < var_5; var_6++ )
        wait 0.05;
}

_id_5B7A( var_0, var_1, var_2, var_3 )
{
    var_4 = int( var_2 * 20 );

    for ( var_5 = 0; var_5 < var_4; var_5++ )
        wait 0.05;
}

_id_5B85( var_0, var_1, var_2, var_3 )
{
    var_4 = int( var_2 * 20 );

    for ( var_5 = 0; var_5 < var_4; var_5++ )
        wait 0.05;
}

_id_F817( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( self._id_DDDB ) )
        self._id_DDDB = var_0;
    else
        self._id_DDDB += var_0;

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( self._id_DDDB ) && var_1 < self._id_DDDB )
            var_1 = self._id_DDDB;

        var_2 = 100 - var_1;
    }
    else
        var_2 = 100 - self._id_DDDB;

    if ( var_2 < 0 )
        var_2 = 0;

    if ( var_2 > 100 )
        var_2 = 100;

    if ( var_2 == 100 )
    {
        self _meth_822C();
        return;
    }

    self _meth_822D( var_2 );
}

_id_403F( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_1[var_1.size] = var_0[var_4];
    }

    return var_1;
}

_id_C18A( var_0 )
{
    self notify( "notusablejoiningplayers" );
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    self endon( "notusablejoiningplayers" );
    self endon( "makeExplosiveUnusable" );

    for (;;)
    {
        level waittill( "player_spawned", var_1 );

        if ( isdefined( var_1 ) && var_1 != var_0 )
            self disableplayeruse( var_1 );
    }
}

_id_9F7C( var_0, var_1 )
{
    return getsubstr( var_0, 0, var_1.size ) == var_1;
}

_id_55AC()
{
    level._id_A6AF = 1;
}

_id_625E()
{
    level._id_A6AF = undefined;
}

_id_1314A( var_0, var_1 )
{
    if ( isdefined( level._id_A6AF ) && level._id_A6AF )
        return 0;

    if ( ( !self isonground() || self iswallrunning() ) && ( _id_9F2C( var_0 ) || _id_9D82( var_0 ) || _id_9FB7( var_0 ) || _id_9E90( var_0 ) ) )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_UNAVAILABLE" );
        return 0;
    }

    if ( isusingremote() )
        return 0;

    if ( isdefined( self.selectinglocation ) )
        return 0;

    if ( scripts\mp\killstreaks\emp_common::_id_9D29() )
    {
        if ( _id_9E64( var_0 ) )
        {
            if ( !( isdefined( var_1 ) && var_1 ) )
                scripts\mp\hud_message::_id_10122( "KILLSTREAKS_UNAVAILABLE_WHEN_JAMMED" );

            return 0;
        }
    }

    if ( _id_9D31() )
    {
        if ( _id_9DFE( var_0 ) && var_0 != "air_superiority" )
        {
            if ( !( isdefined( var_1 ) && var_1 ) )
                scripts\mp\hud_message::_id_10122( "KILLSTREAKS_UNAVAILABLE_WHEN_AA" );

            return 0;
        }
    }

    if ( self isusingturret() && ( _id_9F2C( var_0 ) || _id_9D82( var_0 ) || _id_9FB7( var_0 ) ) )
    {
        if ( !( isdefined( var_1 ) && var_1 ) )
            scripts\mp\hud_message::_id_10122( "KILLSTREAKS_UNAVAILABLE_USING_TURRET" );

        return 0;
    }

    if ( isdefined( self.laststand ) && !_id_12D6( "specialty_finalstand" ) )
    {
        if ( !isdefined( level._id_1C99 ) || !level._id_1C99 || var_0 != "agent" )
        {
            if ( !( isdefined( var_1 ) && var_1 ) )
                scripts\mp\hud_message::_id_10122( "KILLSTREAKS_UNAVAILABLE_IN_LASTSTAND" );

            return 0;
        }
    }

    if ( !scripts\engine\utility::_id_9FFD() )
        return 0;

    if ( isdefined( level._id_3FD9 ) && _id_9DFE( var_0 ) )
    {
        if ( !( isdefined( var_1 ) && var_1 ) )
            scripts\mp\hud_message::_id_10122( "KILLSTREAKS_CIVILIAN_AIR_TRAFFIC" );

        return 0;
    }

    if ( isdefined( var_0 ) && var_0 == "sentry_shock" && isinarbitraryup() )
    {
        if ( !( isdefined( var_1 ) && var_1 ) )
            scripts\mp\hud_message::_id_10122( "KILLSTREAKS_UNAVAILABLE" );

        return 0;
    }

    return 1;
}

_id_9F2C( var_0 )
{
    switch ( var_0 )
    {
        case "thor":
        case "minijackal":
        case "drone_hive":
        case "venom":
            return 1;
        default:
            return 0;
    }
}

_id_9E90( var_0 )
{
    switch ( var_0 )
    {
        case "bombardment":
        case "precision_airstrike":
            return 1;
        default:
            return 0;
    }
}

_id_9EF0( var_0 )
{
    if ( !isdefined( var_0._id_165A ) )
        return 0;

    switch ( var_0._id_165A )
    {
        case "remote_c8":
        case "spiderbot":
            return 1;
        default:
            return 0;
    }
}

_id_9D82( var_0 )
{
    switch ( var_0 )
    {
        case "ims":
        case "deployable_exp_ammo":
        case "deployable_grenades":
        case "deployable_ammo":
        case "deployable_vest":
            return 1;
        default:
            return 0;
    }
}

_id_9FBA( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "directional_uav":
        case "counter_uav":
        case "uav":
            var_1 = 1;
            break;
    }

    return var_1;
}

_id_9D35( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "precision_airstrike":
            var_1 = 1;
            break;
    }

    return var_1;
}

_id_9E7F( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "airdrop":
        case "dronedrop":
            var_1 = 1;
            break;
    }

    return var_1;
}

_id_9E2D( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "jammer":
        case "jackal":
            var_1 = 1;
            break;
    }

    return var_1;
}

_id_9F67( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "minijackal":
            var_1 = 1;
            break;
    }

    return var_1;
}

_id_9D61( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "ball_drone_backup":
        case "venom":
            var_1 = 1;
            break;
    }

    return var_1;
}

_id_9FB7( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "super_trophy":
        case "sentry_shock":
            var_1 = 1;
            break;
    }

    return var_1;
}

_id_9F0F( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "bombardment":
        case "thor":
        case "drone_hive":
            var_1 = 1;
            break;
    }

    return var_1;
}

_id_9D80( var_0 )
{
    return isdefined( var_0 ) && isdefined( var_0._id_92B8 ) && var_0._id_92B8 == "care_package";
}

_id_10060( var_0 )
{
    switch ( var_0 )
    {
        case "dronedrop":
        case "directional_uav":
        case "counter_uav":
        case "uav":
            return 0;
        default:
            return 1;
    }
}

_id_9E64( var_0 )
{
    switch ( var_0 )
    {
        case "fleet_swarm":
        case "zerosub_level_killstreak":
        case "dome_seekers":
        case "guard_dog":
        case "recon_agent":
        case "deployable_ammo":
        case "deployable_vest":
        case "precision_airstrike":
        case "minijackal":
        case "agent":
        case "spiderbot":
            return 0;
        default:
            return 1;
    }
}

_id_9E65( var_0 )
{
    return _id_9E64( var_0 ) && !_id_9DFE( var_0 );
}

_id_9E6A( var_0 )
{
    switch ( var_0 )
    {
        case "bombardment":
            return 0;
        default:
            return 1;
    }
}

_id_9DFE( var_0 )
{
    switch ( var_0 )
    {
        case "orbital_deployment":
        case "ac130":
        case "ca_a10_strafe":
        case "vanguard":
        case "odin_assault":
        case "odin_support":
        case "heli_pilot":
        case "airdrop_juggernaut_maniac":
        case "airdrop_assault":
        case "heli_sniper":
        case "airdrop_juggernaut_recon":
        case "airdrop_juggernaut":
        case "airdrop_sentry_minigun":
        case "helicopter":
        case "fleet_swarm":
        case "airdrop":
        case "precision_airstrike":
        case "thor":
        case "drone_hive":
        case "air_superiority":
            return 1;
        default:
            return 0;
    }
}

_id_7F4D( var_0 )
{
    return tablelookuprownum( "mp/killstreakTable.csv", 1, var_0 );
}

_id_7F44( var_0 )
{
    var_1 = tablelookup( "mp/killstreakTable.csv", 1, var_0, 0 );

    if ( var_1 == "" )
        var_2 = -1;
    else
        var_2 = int( var_1 );

    return var_2;
}

_id_7F4B( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 0, var_0, 1 );
}

_id_7F4C( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 12, var_0, 1 );
}

_id_7F47( var_0 )
{
    return tablelookupistring( "mp/killstreakTable.csv", 1, var_0, 2 );
}

_id_7F38( var_0 )
{
    return tablelookupistring( "mp/killstreakTable.csv", 1, var_0, 3 );
}

_id_7F46( var_0 )
{
    var_1 = scripts\engine\utility::ter_op( _id_12D6( "specialty_support_killstreaks" ), 5, 4 );
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, var_1 );
}

_id_8120( var_0 )
{
    var_1 = strtok( var_0, "_" );
    return var_1[1];
}

_id_7F3C( var_0 )
{
    return tablelookupistring( "mp/killstreakTable.csv", 1, var_0, 6 );
}

_id_7F51( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 7 );
}

_id_7F3B( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 8 );
}

_id_7F34( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 9 );
}

_id_7F3E( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 10 );
}

_id_7F40( var_0 )
{
    return int( tablelookup( "mp/killstreakTable.csv", 1, var_0, 11 ) );
}

_id_7F55( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 12 );
}

_id_7F4E( var_0 )
{
    return int( tablelookup( "mp/killstreakTable.csv", 1, var_0, 13 ) );
}

_id_7F43( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 14 );
}

_id_7F49( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 15 );
}

_id_7F39( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 16 );
}

_id_7F53( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 17 );
}

_id_7F4F( var_0 )
{
    return tablelookup( "mp/killstreakTable.csv", 1, var_0, 18 );
}

_id_4BD7( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = var_0;

    if ( isdefined( level._id_8DD3 ) )
        var_1 += level._id_8DD3.size;

    if ( isdefined( level._id_AD8B ) )
        var_1 += level._id_AD8B.size;

    if ( isdefined( level._id_12B14 ) )
        var_1 += level._id_12B14.size;

    return var_1;
}

_id_B4D2()
{
    return 8;
}

_id_6BAA()
{
    return level._id_6BAA;
}

_id_93FA( var_0 )
{
    if ( !isdefined( var_0 ) )
        level._id_6BAA++;
    else
        level._id_6BAA += var_0;
}

_id_4FC1( var_0 )
{
    if ( !isdefined( var_0 ) )
        level._id_6BAA--;
    else
        level._id_6BAA -= var_0;

    if ( level._id_6BAA < 0 )
        level._id_6BAA = 0;
}

_id_ACD8()
{
    return 1.06;
}

_id_1CAD()
{
    if ( level.gametype == "gun" || level.gametype == "infect" )
        return 0;

    if ( !isdefined( self.pers["isBot"] ) )
    {
        if ( isgamebattlematch() )
            return 0;

        if ( getdvarint( "com_codcasterEnabled", 0 ) > 0 )
            return 1;
    }

    if ( getdvarint( "scr_skipclasschoice", 0 ) > 0 || skiploadout() )
        return 0;

    if ( level.gametype == "cranked" || level.gametype == "mp_zomb" )
        return level.teambased;

    var_0 = int( tablelookup( "mp/gametypesTable.csv", 0, level.gametype, 4 ) );
    return var_0;
}

_id_1C7D()
{
    if ( getdvarint( "scr_skipclasschoice", 0 ) > 0 || skiploadout() )
        return 0;

    var_0 = int( tablelookup( "mp/gametypesTable.csv", 0, level.gametype, 5 ) );
    return var_0;
}

skiploadout()
{
    return istrue( level.aonrules );
}

_id_10125()
{
    return 0;
}

_id_F6FF( var_0, var_1 )
{
    var_2 = _id_8234( var_0 );
    var_3 = [];

    if ( var_2 != "iw7_knife" )
        var_3 = getweaponattachments( var_0 );

    if ( isdefined( var_2 ) )
        var_4 = tablelookuprownum( "mp/statsTable.csv", 4, var_2 );
    else
    {

    }

    for ( var_5 = 0; var_5 < 3; var_5++ )
    {
        var_6 = -1;

        if ( isdefined( var_3[var_5] ) )
        {
            if ( !_id_9D55( var_0, var_3[var_5] ) )
                var_6 = tablelookuprownum( "mp/attachmentTable.csv", 4, var_3[var_5] );
        }
    }
}

setcommonrulesfrommatchdata( var_0 )
{
    var_1 = getmatchrulesdata( "commonOption", "timeLimit" );
    setdynamicdvar( "scr_" + level.gametype + "_timeLimit", var_1 );
    registertimelimitdvar( level.gametype, var_1 );
    var_2 = getmatchrulesdata( "commonOption", "scoreLimit" );
    setdynamicdvar( "scr_" + level.gametype + "_scoreLimit", var_2 );
    registerscorelimitdvar( level.gametype, var_2 );
    var_3 = getmatchrulesdata( "commonOption", "winLimit" );
    setdynamicdvar( "scr_" + level.gametype + "_winLimit", var_3 );
    registerwinlimitdvar( level.gametype, var_3 );
    var_4 = getmatchrulesdata( "commonOption", "roundLimit" );
    setdynamicdvar( "scr_" + level.gametype + "_roundLimit", var_4 );
    registerroundlimitdvar( level.gametype, var_4 );
    var_5 = getmatchrulesdata( "commonOption", "roundSwitch" );
    setdynamicdvar( "scr_" + level.gametype + "_roundSwitch", var_5 );
    registerroundswitchdvar( level.gametype, var_5, 0, 9 );
    var_6 = getmatchrulesdata( "commonOption", "winByTwoEnabled" );
    setdynamicdvar( "scr_" + level.gametype + "_winByTwoEnabled", var_6 );
    _id_DF18( level.gametype, var_6 );
    var_7 = getmatchrulesdata( "commonOption", "winByTwoMaxRounds" );
    setdynamicdvar( "scr_" + level.gametype + "_winByTwoMaxRounds", var_7 );
    _id_DF19( level.gametype, var_7 );
    var_8 = getmatchrulesdata( "commonOption", "dogTags" );
    setdynamicdvar( "scr_" + level.gametype + "_dogTags", var_8 );
    _id_DEEB( level.gametype, var_8 );
    var_9 = getmatchrulesdata( "commonOption", "spawnProtectionTimer" );
    setdynamicdvar( "scr_" + level.gametype + "_spawnProtectionTimer", var_9 );
    var_10 = getmatchrulesdata( "commonOption", "numLives" );
    setdynamicdvar( "scr_" + level.gametype + "_numLives", var_10 );
    registernumlivesdvar( level.gametype, var_10 );
    setdynamicdvar( "scr_player_maxhealth", getmatchrulesdata( "commonOption", "maxHealth" ) );
    setdynamicdvar( "scr_player_healthregentime", getmatchrulesdata( "commonOption", "healthRegen" ) );
    level.matchrules_damagemultiplier = 0;
    level.matchrules_vampirism = 0;
    setdynamicdvar( "scr_game_spectatetype", getmatchrulesdata( "commonOption", "spectateModeAllowed" ) );
    setdynamicdvar( "scr_game_allowkillcam", getmatchrulesdata( "commonOption", "showKillcam" ) );
    setdvar( "camera_allow3rdspectate", getmatchrulesdata( "commonOption", "spectate3rdAllowed" ) );
    setdvar( "lobby_team_select", getmatchrulesdata( "commonOption", "teamAssignmentAllowed" ) );
    setdynamicdvar( "scr_game_forceuav", getmatchrulesdata( "commonOption", "radarAlwaysOn" ) );
    setdynamicdvar( "scr_" + level.gametype + "_playerrespawndelay", getmatchrulesdata( "commonOption", "respawnDelay" ) );
    setdynamicdvar( "scr_" + level.gametype + "_waverespawndelay", getmatchrulesdata( "commonOption", "waveRespawnDelay" ) );
    setdynamicdvar( "scr_player_forcerespawn", getmatchrulesdata( "commonOption", "forceRespawn" ) );
    level._id_B409 = getmatchrulesdata( "commonOption", "allowCustomClasses" );
    level._id_112C2 = getmatchrulesdata( "commonOption", "allowIntel" );
    setdynamicdvar( "scr_" + level.gametype + "_allowKillstreaks", getmatchrulesdata( "commonOption", "allowKillstreaks" ) );
    setdynamicdvar( "scr_" + level.gametype + "_allowPerks", getmatchrulesdata( "commonOption", "allowPerks" ) );
    setdynamicdvar( "scr_" + level.gametype + "_allowSupers", getmatchrulesdata( "commonOption", "allowSupers" ) );
    setdynamicdvar( "scr_" + level.gametype + "_ffPunishLimit", getmatchrulesdata( "commonOption", "ffPunishLimit" ) );
    setdynamicdvar( "scr_" + level.gametype + "_doubleJump", getmatchrulesdata( "commonOption", "doubleJumpEnabled" ) );
    setdynamicdvar( "scr_" + level.gametype + "_wallRun", getmatchrulesdata( "commonOption", "wallRunEnabled" ) );
    setdynamicdvar( "scr_game_casualScoreStreaks", getmatchrulesdata( "commonOption", "casualScoreStreaks" ) );
    setdynamicdvar( "scr_game_superFastChargeRate", getmatchrulesdata( "commonOption", "superFastChargeRate" ) );
    setdynamicdvar( "scr_game_superPointsMod", getmatchrulesdata( "commonOption", "superPointsMod" ) );
    setdynamicdvar( "scr_game_spawnProtectionTimer", getmatchrulesdata( "commonOption", "spawnProtectionTimer" ) );
    level._id_47EF = getmatchrulesdata( "commonOption", "crankedBombTimer" );
    setdynamicdvar( "scr_" + level.gametype + "_crankedBombTimer", level._id_47EF );
    _id_DEE9( level.gametype, level._id_47EF );
    setdynamicdvar( "scr_game_tacticalmode", getmatchrulesdata( "commonOption", "tacticalMode" ) );
    setdynamicdvar( "scr_game_cwltuning", getmatchrulesdata( "commonOption", "bulletBounce" ) );
    setdynamicdvar( "scr_game_onlyheadshots", getmatchrulesdata( "commonOption", "headshotsOnly" ) );

    if ( !isdefined( var_0 ) )
        setdynamicdvar( "scr_team_fftype", getmatchrulesdata( "commonOption", "friendlyFire" ) );

    setdvar( "bg_compassShowEnemies", getdvar( "scr_game_forceuav" ) );
    setdynamicdvar( "scr_" + level.gametype + "_pointsPerKill", getmatchrulesdata( "commonOption", "pointsPerKill" ) );
    setdynamicdvar( "scr_" + level.gametype + "_pointsPerDeath", getmatchrulesdata( "commonOption", "pointsPerDeath" ) );
    setdynamicdvar( "scr_" + level.gametype + "_pointsHeadshotBonus", getmatchrulesdata( "commonOption", "pointsHeadshotBonus" ) );
    setdynamicdvar( "scr_modDefense", 0 );
    setdynamicdvar( "scr_devRemoveDomFlag", "" );
    setdynamicdvar( "scr_devPlaceDomFlag", "" );

    if ( _id_D957() || getdvarint( "systemlink" ) )
        setdvar( "com_codcasterEnabled", getmatchrulesdata( "commonOption", "codcasterEnabled" ) );
}

_id_DEE9( var_0, var_1 )
{
    _id_DF17( "crankedBombTimer", var_1 );
}

_id_F6A7()
{

}

_id_B2AC( var_0 )
{
    leaderdialogonplayer( var_0 );
    _id_F6A8( "kill" );
    self.cranked = 1;
    giveperk( "specialty_fastreload" );
    giveperk( "specialty_quickdraw" );
    giveperk( "specialty_fastoffhand" );
    giveperk( "specialty_fastsprintrecovery" );
    giveperk( "specialty_marathon" );
    giveperk( "specialty_quickswap" );
    giveperk( "specialty_stalker" );
    giveperk( "specialty_sprintfire" );
    self._id_BCF6 = 1.2;
    scripts\mp\weapons::_id_12ED5();
}

_id_C4DB( var_0, var_1, var_2 )
{
    if ( isdefined( var_0 ) )
        var_0 _id_40EF();

    self setclientomnvar( "ui_cranked_bomb_timer_final_seconds", 0 );

    if ( isdefined( var_1.cranked ) )
    {
        var_3 = "kill_cranked";
        var_1 thread _id_C4DD( var_3 );
    }
    else if ( isreallyalive( var_1 ) )
    {
        var_1 _id_B2AC( "begin_cranked" );
        var_1 thread scripts\mp\rank::scoreeventpopup( "begin_cranked" );
    }

    var_1 playsoundtoplayer( "mp_bodycount_tick_positive", var_1 );

    if ( isdefined( var_0 ) && isdefined( var_0.attackers ) && !isdefined( level.assists_disabled ) )
    {
        foreach ( var_5 in var_0.attackers )
        {
            if ( !isdefined( _validateattacker( var_5 ) ) )
                continue;

            if ( var_5 == var_1 )
                continue;

            if ( var_0 == var_5 )
                continue;

            if ( !isdefined( var_5.cranked ) )
                continue;

            var_5 thread _id_C4DC( "assist_cranked" );
            var_5 thread scripts\mp\rank::scoreeventpopup( "assist_cranked" );
            var_5 playsoundtoplayer( "mp_bodycount_tick_positive", var_5 );
        }
    }
}

_id_40EF()
{
    self notify( "stop_cranked" );
    self setclientomnvar( "ui_cranked_bomb_timer_final_seconds", 0 );
    self setclientomnvar( "ui_cranked_bomb_timer_end_milliseconds", 0 );
    self.cranked = undefined;
    self.cranked_end_time = undefined;
}

_id_C4DD( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    while ( !isdefined( self.pers ) )
        wait 0.05;

    _id_F6A8( "kill" );
}

_id_C4DC( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    _id_F6A8( "assist" );
}

_id_F6A8( var_0 )
{
    var_1 = level._id_47EF;
    var_2 = 0;

    if ( level.gametype == "conf" || level.gametype == "grind" )
        var_2 = 1;

    if ( isdefined( var_2 ) && var_2 )
    {
        if ( isdefined( self.cranked ) && self.cranked && isdefined( self.cranked_end_time ) )
            var_1 = int( min( ( self.cranked_end_time - gettime() ) / 1000 + level._id_47EF * 0.5, level._id_47EF ) );
        else
            var_1 = int( var_1 * 0.5 );
    }

    if ( var_0 == "assist" && !var_2 )
        var_1 = int( min( ( self.cranked_end_time - gettime() ) / 1000 + level._id_47EF * 0.5, level._id_47EF ) );

    var_3 = var_1 * 1000 + gettime();
    self setclientomnvar( "ui_cranked_bomb_timer_end_milliseconds", var_3 );
    self.cranked_end_time = var_3;
    thread _id_139E3();
    thread _id_139E0( var_1 );
    thread _id_139E1();
}

_id_139E3()
{
    self notify( "watchCrankedHostMigration" );
    self endon( "watchCrankedHostMigration" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "stop_cranked" );
    level waittill( "host_migration_begin" );
    var_0 = scripts\mp\hostmigration::waittillhostmigrationdone();

    if ( self.cranked_end_time + var_0 < 5 )
        self setclientomnvar( "ui_cranked_bomb_timer_final_seconds", 1 );

    if ( var_0 > 0 )
        self setclientomnvar( "ui_cranked_bomb_timer_end_milliseconds", self.cranked_end_time + var_0 );
    else
        self setclientomnvar( "ui_cranked_bomb_timer_end_milliseconds", self.cranked_end_time );
}

_id_139E1()
{
    self notify( "watchEndGame" );
    self endon( "watchEndGame" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "stop_cranked" );

    for (;;)
    {
        if ( game["state"] == "postgame" || level._id_7669 )
        {
            self setclientomnvar( "ui_cranked_bomb_timer_end_milliseconds", 0 );
            break;
        }

        wait 0.1;
    }
}

_id_139E0( var_0 )
{
    self notify( "watchBombTimer" );
    self endon( "watchBombTimer" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "stop_cranked" );
    var_1 = 5;
    scripts\mp\hostmigration::_id_13707( var_0 - var_1 - 1 );
    scripts\mp\hostmigration::_id_13707( 1.0 );
    self setclientomnvar( "ui_cranked_bomb_timer_final_seconds", 1 );

    while ( var_1 > 0 )
    {
        self playsoundtoplayer( "mp_cranked_countdown", self );
        scripts\mp\hostmigration::_id_13707( 1.0 );
        var_1--;
    }

    if ( isdefined( self ) && isreallyalive( self ) && level.gametype != "tdef" )
    {
        self playsound( "frag_grenade_explode" );
        playfx( level._id_B761, self.origin + ( 0, 0, 32 ) );
        _id_1417();
        self setclientomnvar( "ui_cranked_bomb_timer_end_milliseconds", 0 );
    }
}

reinitializematchrulesonmigration()
{
    for (;;)
    {
        level waittill( "host_migration_begin" );
        [[ level.initializematchrules ]]();
    }
}

_id_DF2E( var_0 )
{
    self endon( "disconnect" );

    if ( isdefined( var_0 ) )
        var_0 endon( "death" );

    for (;;)
    {
        level waittill( "host_migration_begin" );

        if ( isdefined( self._id_AA42 ) )
            self _meth_8401( self._id_AA42, 0 );
    }
}

_id_7F92( var_0, var_1 )
{
    var_2 = [];
    var_2["loadoutPrimaryAttachment2"] = "none";
    var_2["loadoutSecondaryAttachment2"] = "none";
    var_3 = [];
    var_2["loadoutPrimary"] = _id_7F91( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "weapon" );
    var_2["loadoutPrimaryAttachment"] = _id_7F91( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "attachment", 0 );
    var_2["loadoutPrimaryAttachment2"] = _id_7F91( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "attachment", 1 );
    var_2["loadoutPrimaryCamo"] = _id_7F91( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "camo" );
    var_2["loadoutPrimaryReticle"] = _id_7F91( "defaultClasses", var_0, var_1, "class", "weaponSetups", 0, "reticle" );
    var_2["loadoutSecondary"] = _id_7F91( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "weapon" );
    var_2["loadoutSecondaryAttachment"] = _id_7F91( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "attachment", 0 );
    var_2["loadoutSecondaryAttachment2"] = _id_7F91( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "attachment", 1 );
    var_2["loadoutSecondaryCamo"] = _id_7F91( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "camo" );
    var_2["loadoutSecondaryReticle"] = _id_7F91( "defaultClasses", var_0, var_1, "class", "weaponSetups", 1, "reticle" );
    var_2["loadoutPerks"] = var_3;
    var_2["loadoutKillstreak1"] = scripts\mp\class::_id_DDD5( var_0, var_1, 0 );
    var_2["loadoutKillstreak2"] = scripts\mp\class::_id_DDD5( var_0, var_1, 1 );
    var_2["loadoutKillstreak3"] = scripts\mp\class::_id_DDD5( var_0, var_1, 2 );
    var_2["loadoutJuggernaut"] = _id_7F91( "defaultClasses", var_0, var_1, "juggernaut" );
    return var_2;
}

_id_DDD9( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( level.ingraceperiod && !self._id_8BE9 )
        self waittill( "giveLoadout" );
    else
        self waittill( "spawned_player" );

    if ( var_0 )
    {
        self notify( "lost_juggernaut" );
        wait 0.5;
    }

    if ( !isdefined( self._id_9E62 ) )
    {
        self._id_BCF6 = 0.7;
        scripts\mp\weapons::_id_12ED5();
    }

    self._id_A4AA = 0.7;
    self _meth_80A9();

    if ( !getdvarint( "camera_thirdPerson" ) )
        self setclientomnvar( "ui_juggernaut", 1 );

    thread scripts\mp\killstreaks\juggernaut::_id_A4A9();

    if ( level.gametype != "jugg" || isdefined( level._id_B40F ) && level._id_B40F )
        self _meth_8320( "specialty_radarjuggernaut", 1 );

    if ( isdefined( self._id_9E61 ) && self._id_9E61 )
        self _meth_81F3( self );

    level notify( "juggernaut_equipped", self );
    thread scripts\mp\killstreaks\juggernaut::_id_A4AC();
}

updatesessionstate( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "intermission":
        case "playing":
            var_1 = "";
            break;
        case "dead":
        case "spectator":
            if ( istrue( level._id_58D7 ) )
                var_1 = "";
            else if ( istrue( level._id_C236 ) )
            {
                if ( istrue( self._id_113EF ) )
                    var_1 = "hud_status_dogtag";
                else
                    var_1 = "hud_status_dead";
            }
            else
                var_1 = "hud_status_dead";

            break;
    }

    if ( !isdefined( var_1 ) )
        var_1 = "";

    self.sessionstate = var_0;
    self._id_02C7 = var_1;
    self setclientomnvar( "ui_session_state", var_0 );
}

_id_7E2B( var_0 )
{
    return level._id_400C[var_0];
}

_id_9F9B()
{
    var_0 = _id_7F7A( self.team );

    foreach ( var_2 in var_0 )
    {
        if ( var_2 != self && ( !isdefined( var_2.laststand ) || !var_2.laststand ) )
            return 0;
    }

    return 1;
}

_id_A6C7( var_0 )
{
    var_1 = _id_7F7A( var_0 );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3.laststand ) && var_3.laststand )
            var_3 thread scripts\mp\damage::_id_54C8( randomintrange( 1, 3 ) );
    }
}

_id_1136C( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isai( self ) )
    {
        if ( isdefined( var_0 ) && _id_9F8D( var_0 ) )
            var_0 = undefined;

        if ( !isdefined( var_0 ) )
        {
            var_0 = scripts\engine\utility::_id_7F62();

            if ( !self hasweapon( var_0 ) )
                var_0 = _id_0DC9::_id_7EB7();

            _id_1136C( var_0, var_1 );
        }

        if ( var_1 )
            _id_141B( var_0 );
        else
            _id_141A( var_0 );
    }
    else
        _id_141A( "none" );
}

_id_9D36( var_0 )
{
    if ( isagent( var_0 ) && var_0._id_18FE == 1 )
        return 1;

    if ( isbot( var_0 ) )
        return 1;

    return 0;
}

_id_9F9D( var_0 )
{
    if ( _id_9D36( var_0 ) )
        return 1;

    if ( isplayer( var_0 ) )
        return 1;

    return 0;
}

isaigameparticipant( var_0 )
{
    if ( isagent( var_0 ) && isdefined( var_0._id_18F2 ) && var_0._id_18F2 == 1 )
        return 1;

    if ( isbot( var_0 ) )
        return 1;

    return 0;
}

_id_9E0E( var_0 )
{
    if ( isaigameparticipant( var_0 ) )
        return 1;

    if ( isplayer( var_0 ) )
        return 1;

    return 0;
}

_id_81B3( var_0 )
{
    var_1 = 0;

    if ( level.teambased )
    {
        switch ( var_0 )
        {
            case "axis":
                var_1 = 1;
                break;
            case "allies":
                var_1 = 2;
                break;
        }
    }

    return var_1;
}

_id_81A0( var_0, var_1 )
{
    var_2 = [];

    if ( !isdefined( var_1 ) || var_1 )
    {
        foreach ( var_4 in level._id_3CB5 )
        {
            if ( isdefined( var_4.team ) && var_4.team == var_0 )
                var_2[var_2.size] = var_4;
        }
    }
    else
    {
        foreach ( var_4 in level.players )
        {
            if ( isdefined( var_4.team ) && var_4.team == var_0 )
                var_2[var_2.size] = var_4;
        }
    }

    return var_2;
}

isheadshot( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
    {
        if ( isdefined( var_3.owner ) )
        {
            if ( var_3.code_classname == "script_vehicle" )
                return 0;

            if ( var_3.code_classname == "misc_turret" )
                return 0;

            if ( var_3.code_classname == "script_model" )
                return 0;
        }

        if ( isdefined( var_3.agent_type ) )
        {
            if ( var_3.agent_type == "dog" || var_3.agent_type == "alien" )
                return 0;
        }
    }

    if ( var_2 == "MOD_EXPLOSIVE" )
        return 0;

    return ( var_1 == "head" || var_1 == "helmet" ) && var_2 != "MOD_MELEE" && var_2 != "MOD_IMPACT" && var_2 != "MOD_SCARAB" && var_2 != "MOD_CRUSH" && !_id_9DE2( var_0 );
}

_id_9E7D( var_0, var_1, var_2, var_3 )
{
    if ( var_3 != "MOD_MELEE" )
        return 0;

    if ( !isdefined( var_1 ) || !isplayer( var_1 ) )
        return 0;

    if ( var_1 scripts\mp\heavyarmor::_id_8BFA() )
        return 0;

    if ( var_0 _id_12D6( "passive_meleekill" ) || var_0 _id_12D6( "passive_meleekill_silent" ) )
        return 1;

    if ( scripts\mp\weapons::_id_9E6D( var_2 ) )
        return 1;

    if ( scripts\mp\weapons::isballweapon( var_2 ) )
        return 1;

    if ( scripts\mp\weapons::isaxeweapon( var_2 ) && var_0 getweaponammoclip( var_2 ) > 0 )
        return 1;

    if ( var_0 _meth_8519( var_2 ) && _id_8234( var_2 ) == "iw7_rvn" )
        return 1;

    if ( issubstr( var_2, "iw7_katana_mp" ) || issubstr( var_2, "iw7_nunchucks_mp" ) )
        return 1;

    return 0;
}

_id_24F0( var_0, var_1 )
{
    if ( isdefined( var_1 ) && isdefined( var_1.owner ) )
        var_1 = var_1.owner;

    if ( !level.teambased )
        return 0;
    else if ( !isdefined( var_1 ) || !isdefined( var_0 ) )
        return 0;
    else if ( !isdefined( var_0.team ) || !isdefined( var_1.team ) )
        return 0;
    else if ( var_0 == var_1 )
        return 0;
    else if ( level.gametype == "infect" && var_0.pers["team"] == var_1.team && isdefined( var_1._id_115C5 ) )
        return 0;
    else if ( level.gametype == "infect" && var_0.pers["team"] != var_1.team && isdefined( var_1._id_115C5 ) )
        return 1;
    else if ( isdefined( var_1._id_EC9B ) && var_1._id_EC9B )
        return 0;
    else if ( _id_9EF6( var_0, var_1 ) )
        return 0;
    else if ( isagent( var_0 ) && isdefined( var_0.owner ) && var_0.owner == var_1 )
        return 0;
    else if ( var_0.team == var_1.team )
        return 1;
    else
        return 0;
}

_id_F401( var_0 )
{
    if ( !( isdefined( self._id_8EE3 ) && scripts\engine\utility::array_contains( self._id_8EE3, var_0 ) ) )
    {
        self._id_8EE3 = scripts\engine\utility::_id_2279( self._id_8EE3, var_0 );
        var_0 notify( "calculate_new_level_targets" );
    }
}

_id_1758( var_0, var_1 )
{
    if ( isdefined( level.bot_funcs["bots_add_to_level_targets"] ) )
    {
        var_0._id_13031 = var_1;
        var_0._id_2DD1 = "use";
        [[ level.bot_funcs["bots_add_to_level_targets"] ]]( var_0 );
    }
}

_id_E016( var_0 )
{
    if ( isdefined( level.bot_funcs["bots_remove_from_level_targets"] ) )
        [[ level.bot_funcs["bots_remove_from_level_targets"] ]]( var_0 );
}

_id_1757( var_0 )
{
    if ( isdefined( level.bot_funcs["bots_add_to_level_targets"] ) )
    {
        var_0._id_2DD1 = "damage";
        [[ level.bot_funcs["bots_add_to_level_targets"] ]]( var_0 );
    }
}

_id_E015( var_0 )
{
    if ( isdefined( level.bot_funcs["bots_remove_from_level_targets"] ) )
        [[ level.bot_funcs["bots_remove_from_level_targets"] ]]( var_0 );
}

_id_C131( var_0 )
{
    if ( isdefined( level.bot_funcs["notify_enemy_bots_bomb_used"] ) )
        self [[ level.bot_funcs["notify_enemy_bots_bomb_used"] ]]( var_0 );
}

_id_7BF8()
{
    if ( isdefined( level.bot_funcs["bot_get_rank_xp"] ) )
        return self [[ level.bot_funcs["bot_get_rank_xp"] ]]();
}

bot_israndom()
{
    return self botisrandomized();
}

_id_9D4E( var_0 )
{
    switch ( var_0 )
    {
        case "uplink":
        case "vanguard":
        case "odin_assault":
        case "heli_pilot":
        case "airdrop_juggernaut_maniac":
        case "airdrop_assault":
        case "airdrop_juggernaut":
        case "airdrop_sentry_minigun":
        case "helicopter":
        case "guard_dog":
        case "ball_drone_backup":
        case "directional_uav":
        case "uav":
        case "ims":
        case "minijackal":
        case "drone_hive":
        case "sentry":
            return 1;
        default:
            return 0;
    }
}

_id_9F25( var_0 )
{
    switch ( var_0 )
    {
        case "uav_3dping":
        case "aa_launcher":
        case "uplink_support":
        case "ball_drone_radar":
        case "sam_turret":
        case "uplink":
        case "orbital_deployment":
        case "odin_support":
        case "heli_sniper":
        case "airdrop_juggernaut_recon":
        case "recon_agent":
        case "ball_drone_backup":
        case "jammer":
        case "deployable_ammo":
        case "deployable_vest":
        case "air_superiority":
            return 1;
        default:
            return 0;
    }
}

_id_9F8E( var_0 )
{
    switch ( var_0 )
    {
        case "deployable_adrenaline_mist":
        case "deployable_speed_strip":
        case "uav_3dping":
        case "aa_launcher":
        case "uplink_support":
        case "ball_drone_radar":
        case "sam_turret":
        case "odin_support":
        case "heli_sniper":
        case "airdrop_juggernaut_recon":
        case "recon_agent":
        case "jammer":
        case "deployable_ammo":
        case "deployable_vest":
        case "sentry_shock":
        case "air_superiority":
            return 1;
        default:
            return 0;
    }
}

_id_9F6F( var_0 )
{
    switch ( var_0 )
    {
        case "specialty_chain_reaction_ks":
        case "specialty_deadeye_ks":
        case "specialty_boom_ks":
        case "specialty_twoprimaries_ks":
        case "specialty_hardline_ks":
        case "specialty_gambler_ks":
        case "specialty_explosivedamage_ks":
        case "specialty_extra_attachment_ks":
        case "specialty_extra_deadly_ks":
        case "specialty_extra_equipment_ks":
        case "specialty_extraammo_ks":
        case "specialty_gunsmith_ks":
        case "specialty_blastshield_ks":
        case "specialty_stun_resistance_ks":
        case "specialty_sharp_focus_ks":
        case "specialty_regenfaster_ks":
        case "specialty_falldamage_ks":
        case "specialty_comexp_ks":
        case "specialty_selectivehearing_ks":
        case "specialty_detectexplosive_ks":
        case "specialty_scavenger_ks":
        case "specialty_paint_ks":
        case "specialty_incog_ks":
        case "specialty_quieter_ks":
        case "specialty_gpsjammer_ks":
        case "specialty_blindeye_ks":
        case "specialty_silentkill_ks":
        case "specialty_sprintreload_ks":
        case "specialty_quickdraw_ks":
        case "specialty_bulletaccuracy_ks":
        case "specialty_pitcher_ks":
        case "specialty_quickswap_ks":
        case "specialty_reducedsway_ks":
        case "specialty_stalker_ks":
        case "specialty_marathon_ks":
        case "specialty_lightweight_ks":
        case "specialty_fastreload_ks":
        case "specialty_fastsprintrecovery_ks":
            return 1;
        default:
            return 0;
    }
}

bot_is_fireteam_mode()
{
    var_0 = botautoconnectenabled() == 2;

    if ( var_0 )
    {
        if ( !level.teambased || level.gametype != "war" && level.gametype != "dom" )
            return 0;

        return 1;
    }

    return 0;
}

_id_F305()
{
    if ( !scripts\engine\utility::_id_16F3( "platform", ::_id_F305 ) )
        return;

    if ( !isdefined( level._id_4542 ) )
        level._id_4542 = getdvar( "consoleGame" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_13E0F ) )
        level._id_13E0F = getdvar( "xenonGame" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_DADB ) )
        level._id_DADB = getdvar( "ps3Game" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_13E0E ) )
        level._id_13E0E = getdvar( "xb3Game" ) == "true";
    else
    {

    }

    if ( !isdefined( level._id_DADC ) )
        level._id_DADC = getdvar( "ps4Game" ) == "true";
    else
    {

    }
}

_id_9BEE()
{
    if ( level._id_13E0E || level._id_DADC || !level._id_4542 )
        return 1;
    else
        return 0;
}

_id_F6DB( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_4542 ) || !isdefined( level._id_13E0E ) || !isdefined( level._id_DADC ) )
        _id_F305();

    if ( _id_9BEE() )
        setdvar( var_0, var_2 );
    else
        setdvar( var_0, var_1 );
}

_id_9FE7( var_0, var_1, var_2 )
{
    return isdefined( var_2.team ) && var_2.team == var_1;
}

_id_9FD8( var_0, var_1, var_2 )
{
    return isdefined( var_2.owner ) && ( !isdefined( var_0 ) || var_2.owner != var_0 );
}

_id_7EF9()
{
    return ( 0, 0, 5000 );
}

_id_7EFA()
{
    return ( 0, 0, 2500 );
}

_id_7F78()
{
    var_0 = [];

    if ( isdefined( self._id_EE01 ) )
    {
        var_1 = strtok( self._id_EE01, " " );

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = getnode( var_1[var_2], "script_linkname" );

            if ( isdefined( var_3 ) )
                var_0[var_0.size] = var_3;
        }
    }

    return var_0;
}

_id_7BC3( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = self getentitynumber();
    var_3 = [];

    foreach ( var_5 in level.players )
    {
        if ( var_5 == self )
            continue;

        var_6 = 0;

        if ( !var_1 )
        {
            if ( isdefined( var_5.team ) && ( var_5.team == "spectator" || var_5.sessionstate == "spectator" ) )
            {
                var_7 = var_5 getspectatingplayer();

                if ( isdefined( var_7 ) && var_7 == self )
                    var_6 = 1;
            }

            if ( var_5._id_0140 == var_2 )
                var_6 = 1;
        }

        if ( !var_0 )
        {
            if ( var_5._id_01A9 == var_2 )
                var_6 = 1;
        }

        if ( var_6 )
            var_3[var_3.size] = var_5;
    }

    return var_3;
}

_id_F607( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_7BC3( var_4, var_5 );

    foreach ( var_8 in var_6 )
    {
        var_8 notify( "changing_watching_visionset" );

        if ( isdefined( var_3 ) && var_3 )
            var_8 _meth_83F9( var_0, var_1 );
        else
            var_8 visionsetnakedforplayer( var_0, var_1 );

        if ( var_0 != "" && isdefined( var_2 ) )
        {
            var_8 thread _id_E23F( self, var_1 + var_2 );
            var_8 thread _id_E23D( self );

            if ( var_8 _id_9E4A() )
                var_8 thread _id_E23E();
        }
    }
}

_id_E23E()
{
    self endon( "disconnect" );
    self waittill( "spawned" );
    self visionsetnakedforplayer( "", 0.0 );
}

_id_E23F( var_0, var_1 )
{
    self endon( "changing_watching_visionset" );
    var_2 = gettime();
    var_3 = self.team;

    while ( gettime() - var_2 < var_1 * 1000 )
    {
        if ( self.team != var_3 || !scripts\engine\utility::array_contains( var_0 _id_7BC3(), self ) )
        {
            self visionsetnakedforplayer( "", 0.0 );
            self notify( "changing_visionset" );
            break;
        }

        wait 0.05;
    }
}

_id_E23D( var_0 )
{
    self endon( "changing_watching_visionset" );
    var_0 waittill( "disconnect" );
    self visionsetnakedforplayer( "", 0.0 );
}

_validateattacker( var_0 )
{
    if ( isagent( var_0 ) && ( !isdefined( var_0._id_9D25 ) || !var_0._id_9D25 ) )
        return undefined;

    if ( isagent( var_0 ) && !isdefined( var_0.classname ) )
        return undefined;

    return var_0;
}

_id_143B( var_0 )
{
    if ( !isreallyalive( var_0 ) )
        return undefined;

    return var_0;
}

_id_1309( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = magicbullet( var_0, var_1, var_2, var_3, var_4 );

    if ( isdefined( var_5 ) && isdefined( var_3 ) )
        var_5 _meth_831F( var_3 );

    return var_5;
}

_id_1302( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = self _meth_8449( var_0, var_1, var_2, var_3, var_5 );

    if ( !isdefined( var_4 ) )
        var_6._id_C187 = 1;
    else
        var_6._id_C187 = var_4;

    var_6 _meth_831F( self );
    return var_6;
}

_id_1377B()
{
    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1, var_2, var_3 );

        if ( !_id_85E0( var_0 ) )
            continue;

        _id_85C6( var_0, var_1, var_2, var_3 );
        self notify( "grenade_throw" );
        return var_0;
    }
}

_id_85E0( var_0 )
{
    return !isdefined( var_0._id_C187 ) || !var_0._id_C187;
}

_id_85C7()
{
    return self _meth_854D() != "none";
}

_id_7EE5()
{
    var_0 = self _meth_854D();

    if ( isdefined( self._id_77C2 ) && var_0 == self._id_77C2 )
        var_0 = "none";

    return var_0;
}

_id_85C6( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0._id_13C2E ) )
        var_0._id_13C2E = var_1;

    if ( !isdefined( var_0.owner ) )
        var_0.owner = self;

    if ( !isdefined( var_0.team ) )
        var_0.team = self.team;

    if ( !isdefined( var_0._id_118A1 ) )
        var_0._id_118A1 = var_2;

    if ( !isdefined( var_0._id_118A2 ) && isdefined( var_0._id_118A1 ) )
        var_0._id_118A2 = _id_E76A( 4 * var_2 );

    var_4 = _id_0AE2::_id_D737( var_1 );

    if ( isdefined( var_4 ) )
    {
        var_0._id_D719 = var_4;
        var_0._id_9F07 = 1;
    }

    var_0._id_117F3 = isdefined( var_3 );
}

_id_137A6()
{
    self waittill( "missile_fire", var_0, var_1 );

    if ( isdefined( var_0 ) )
    {
        if ( !isdefined( var_0._id_13C2E ) )
            var_0._id_13C2E = _id_821D( var_1 );

        if ( !isdefined( var_0.owner ) )
            var_0.owner = self;

        if ( !isdefined( var_0.team ) )
            var_0.team = self.team;
    }

    return var_0;
}

_id_13CE( var_0, var_1 )
{
    if ( !isdefined( self._id_BE4C ) )
    {
        self._id_BE4C = [];
        self._id_D8B9 = [];
    }
    else
    {
        self._id_D8B9[0] = self._id_BE4C[0];
        self._id_D8B9[1] = self._id_BE4C[1];
    }

    self._id_BE4C[0] = var_0;
    self._id_BE4C[1] = var_1;
    self _meth_8315( var_0, var_1 );
}

_id_13B6()
{
    if ( isdefined( self._id_D8B9 ) )
        self _meth_8315( self._id_D8B9[0], self._id_D8B9[1] );
    else
        self _meth_8315( "", "" );

    self._id_BE4C = undefined;
    self._id_D8B9 = undefined;
}

_id_9EF4( var_0 )
{
    if ( isdefined( level._id_2C7A ) )
    {
        foreach ( var_2 in level._id_2C7A )
        {
            if ( self istouching( var_2.noweapondropallowedtrigger ) )
                return 0;
        }
    }

    return 1;
}

_id_13C9A( var_0, var_1 )
{
    if ( _id_9F8D( var_0 ) )
        return 1;

    var_0 = _id_821D( var_0 );

    if ( var_0 == "heli_pilot_turret_mp" || var_0 == "bomb_site_mp" || var_0 == "sentry_shock_mp" || var_0 == "portal_grenade_mp" || var_0 == "blackout_grenade_mp" || var_0 == "concussion_grenade_mp" || var_0 == "cryo_mine_mp" || var_0 == "fear_grenade_mp" || var_0 == "chargemode_mp" || var_0 == "emp_grenade_mp" || var_0 == "minijackal_strike_mp" || var_0 == "bombproj_mp" || var_0 == "iw7_blackholegun_mp" || var_0 == "iw7_cheytac_mpr_projectile" || var_0 == "artillery_mp" || var_0 == "groundpound_mp" || var_0 == "drone_hive_projectile_mp" || var_0 == "swtich_blade_child_mp" || var_0 == "thorproj_mp" || var_0 == "thorproj_zoomed_mp" || var_0 == "thorproj_tracking_mp" )
        return 1;

    if ( var_0 == "iw7_revolver_mpr_explosive" && isdefined( var_1 ) && var_1 != "none" )
        return 1;

    return 0;
}

_id_9F7E( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_1 ) )
        return 0;

    if ( !isdefined( var_1._id_11180 ) )
        return 0;

    if ( var_1._id_11180 != var_0 )
        return 0;

    return 1;
}

_id_9F7F( var_0, var_1, var_2, var_3 )
{
    if ( !_id_9F7E( var_0, var_1, var_2, var_3 ) )
        return 0;

    return 1;
}

restorebasevisionset( var_0 )
{
    self visionsetnakedforplayer( "", var_0 );
}

_id_D4FB( var_0, var_1, var_2 )
{
    var_0 playlocalsound( var_1 );
    var_0 playsoundtoteam( var_2, "allies", var_0 );
    var_0 playsoundtoteam( var_2, "axis", var_0 );
}

isenemy( var_0 )
{
    if ( level.teambased )
        return _id_9EF3( var_0 );
    else
        return _id_9EEB( var_0 );
}

_id_9EF3( var_0 )
{
    return var_0.team != self.team;
}

_id_9EEB( var_0 )
{
    if ( isdefined( var_0.owner ) )
        return var_0.owner != self;
    else
        return var_0 != self;
}

setextrascore0( var_0 )
{
    self._id_011A = var_0;
    _id_F7DF( "extrascore0", var_0 );
}

_id_F6FB( var_0 )
{
    self._id_011B = var_0;
    _id_F7DF( "extrascore1", var_0 );
}

_id_1C9B()
{
    if ( level.gametype == "infect" )
        return 0;

    return 1;
}

_id_81EC()
{
    if ( isdefined( self.pers["guid"] ) )
        return self.pers["guid"];

    var_0 = self _meth_812C();

    if ( var_0 == "0000000000000000" )
    {
        if ( isdefined( level._id_86BF ) )
            level._id_86BF++;
        else
            level._id_86BF = 1;

        var_0 = "script" + level._id_86BF;
    }

    self.pers["guid"] = var_0;
    return self.pers["guid"];
}

_id_80BF()
{
    var_0 = scripts\engine\utility::_id_22BC( level.players );

    for (;;)
    {
        if ( !var_0.size )
            return;

        var_1 = randomintrange( 0, var_0.size );
        var_2 = var_0[var_1];

        if ( !isreallyalive( var_2 ) || var_2.sessionstate != "playing" )
        {
            var_0 = scripts\engine\utility::array_remove( var_0, var_2 );
            continue;
        }

        return var_2;
    }
}

_id_7F8B()
{
    if ( !isdefined( level._id_B335 ) )
        level._id_B335 = getdvar( "mapname" );

    return level._id_B335;
}

_id_9F56( var_0 )
{
    var_0 = _id_821D( var_0 );

    switch ( var_0 )
    {
        case "iw7_chargeshot_mp":
        case "iw7_lockon_mp":
            return 1;
        default:
            return 0;
    }
}

gamehasneutralcrateowner( var_0 )
{
    switch ( var_0 )
    {
        case "sotf_ffa":
        case "sotf":
            return 1;
        default:
            return 0;
    }
}

_id_22B1( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_5, var_4 in var_0 )
    {
        if ( var_4 != var_1 )
            var_2[var_5] = var_4;
    }

    return var_2;
}

_id_22B0( var_0, var_1 )
{
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( var_3 == var_1 )
            continue;

        var_2[var_2.size] = var_0[var_3];
    }

    return var_2;
}

_id_9D46()
{
    if ( getdvarint( "xblive_competitionmatch" ) || getdvarint( "scr_game_cwltuning" ) )
        return 1;

    return 0;
}

_id_9EA8()
{
    if ( getdvarint( "systemlink" ) && ( getdvarint( "xblive_competitionmatch" ) || getdvarint( "scr_game_cwltuning" ) ) )
        return 1;

    return 0;
}

_id_9EA7()
{
    if ( _id_D957() && ( getdvarint( "xblive_competitionmatch" ) || getdvarint( "scr_game_cwltuning" ) ) )
        return 1;

    return 0;
}

_id_9EA6()
{
    if ( _id_9EA8() || _id_9EA7() )
        return 1;

    return 0;
}

_id_F79E( var_0, var_1, var_2, var_3 )
{
    if ( var_1 == "axis" )
        var_0 += 2000;
    else if ( var_1 == "allies" )
        var_0 += 1000;

    if ( isdefined( var_2 ) )
        var_0 += ( var_2 + 1 ) * 10000;

    if ( isdefined( var_3 ) )
    {
        if ( isnumber( var_3 ) )
            var_0 += ( var_3 + 1 ) * 1000000;
        else
            scripts\engine\utility::_id_66BD( "mlg announcement extra data supports numbers only. Invalid extra data: " + var_3 );
    }

    setomnvar( "ui_mlg_announcement", var_0 );
}

_id_9EA9()
{
    if ( level.gametype == "ball" || level.gametype == "dom" || level.gametype == "front" || level.gametype == "ctf" )
        return 1;

    return 0;
}

_id_9FC2( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( var_1 ) )
    {
        if ( isusingmatchrulesdata() && _id_7F91( "defaultClasses", var_0, var_1, "class", "inUse" ) )
            var_2 = 1;
    }
    else
    {
        for ( var_1 = 0; var_1 < 6; var_1++ )
        {
            if ( isusingmatchrulesdata() && _id_7F91( "defaultClasses", var_0, var_1, "class", "inUse" ) )
            {
                var_2 = 1;
                break;
            }
        }
    }

    return var_2;
}

_id_3899( var_0 )
{
    var_1 = 1;

    if ( isdefined( self._id_9E5C ) && self._id_9E5C && ( isdefined( self._id_3938 ) && !self [[ self._id_3938 ]]( var_0 ) ) )
        var_1 = 0;

    return var_1;
}

_id_D911()
{
    if ( isdefined( self._id_A699 ) )
        [[ self._id_A699 ]]();
}

_id_F5C6( var_0, var_1, var_2, var_3 )
{
    var_4 = self _meth_8433( var_0 );
    self._id_116D0 = 1;
    self _meth_8434( var_0, var_1 );

    if ( !isdefined( var_3 ) || !var_3 )
        wait( var_2 );
    else
    {
        var_5 = self _meth_842D( var_0 );

        for (;;)
        {
            if ( self _meth_842B( var_0 ) >= var_5 )
                break;

            wait 0.05;
        }
    }

    self _meth_8434( var_0, var_4 );
    self._id_116D0 = 0;
}

_id_F5C5( var_0, var_1, var_2, var_3 )
{
    var_4 = self _meth_842F( var_0 );
    self._id_116D1 = 1;
    self _meth_8430( var_0, var_1 );

    if ( !isdefined( var_3 ) || !var_3 )
        wait( var_2 );
    else
    {
        var_5 = self _meth_842D( var_0 );

        for (;;)
        {
            if ( self _meth_842B( var_0 ) >= var_5 )
                break;

            wait 0.05;
        }
    }

    self _meth_8430( var_0, var_4 );
    self._id_116D1 = 0;
}

_id_13AF( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !isdefined( var_7 ) )
        var_7 = 0;

    self _meth_8253( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_5106( var_0 )
{
    self endon( "death" );
    wait( var_0 );

    if ( isdefined( self ) )
        self delete();
}

_id_8BF9( var_0 )
{
    return isdefined( var_0 ) && isdefined( var_0._id_8CC8 );
}

_id_7EF7( var_0 )
{
    return int( var_0 * self._id_8CC9 );
}

_id_F741( var_0 )
{
    self._id_8CC8 = 1;

    if ( !isdefined( self._id_8CC9 ) )
        self._id_8CC9 = 1;

    var_0 = int( clamp( var_0, 0, 100 ) );
    var_1 = ( 100 - var_0 ) / 100;

    if ( var_1 < self._id_8CC9 )
        self._id_8CC9 = var_1;
}

_id_41B4()
{
    self._id_8CC8 = undefined;
    self._id_8CC9 = undefined;
}

_id_108CB( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnfx( scripts\engine\utility::_id_7ECB( var_2 ), var_1 );
    triggerfx( var_5 );

    foreach ( var_7 in level.players )
    {
        var_8 = scripts\mp\damage::_id_9E06( var_0, var_7 );

        if ( var_7 == var_0 && isdefined( var_4 ) )
            var_8 = var_4;

        if ( !var_8 )
            var_5 _meth_8429( var_7 );
    }

    var_10 = spawnfx( scripts\engine\utility::_id_7ECB( var_3 ), var_1 );
    triggerfx( var_10 );

    foreach ( var_7 in level.players )
    {
        var_8 = scripts\mp\damage::_id_9E06( var_0, var_7 );

        if ( var_7 == var_0 && isdefined( var_4 ) )
            var_8 = var_4;

        if ( var_8 )
            var_10 _meth_8429( var_7 );
    }

    var_13 = [];
    var_13[0] = var_5;
    var_13[1] = var_10;
    return var_13;
}

_id_D486( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    foreach ( var_9 in level.players )
    {
        if ( !isdefined( var_9 ) )
            continue;

        if ( isdefined( var_7 ) && scripts\engine\utility::array_contains( var_7, var_9 ) )
            continue;

        if ( isdefined( var_5 ) && scripts\engine\utility::array_contains( var_5, var_9 ) )
            var_10 = 1;
        else if ( isdefined( var_6 ) && scripts\engine\utility::array_contains( var_6, var_9 ) )
            var_10 = 0;
        else
            var_10 = _id_9E05( var_2, var_9 );

        if ( var_10 )
        {
            playfxontagforclients( var_3, var_0, var_1, var_9 );
            continue;
        }

        playfxontagforclients( var_4, var_0, var_1, var_9 );
    }
}

_id_11071( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    foreach ( var_9 in level.players )
    {
        if ( !isdefined( var_9 ) )
            continue;

        if ( isdefined( var_7 ) && scripts\engine\utility::array_contains( var_7, var_9 ) )
            continue;

        if ( isdefined( var_5 ) && scripts\engine\utility::array_contains( var_5, var_9 ) )
            var_10 = 1;
        else if ( isdefined( var_6 ) && scripts\engine\utility::array_contains( var_6, var_9 ) )
            var_10 = 0;
        else
            var_10 = _id_9E05( var_2, var_9 );

        if ( var_10 )
        {
            _func_297( var_3, var_0, var_1, var_9 );
            continue;
        }

        _func_297( var_4, var_0, var_1, var_9 );
    }
}

_id_D548( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = undefined;

    if ( self.team != var_0 )
        var_6 = spawnfxforclient( scripts\engine\utility::_id_7ECB( var_3 ), var_1, self );
    else
        var_6 = spawnfxforclient( scripts\engine\utility::_id_7ECB( var_2 ), var_1, self );

    if ( isdefined( var_6 ) )
        triggerfx( var_6 );

    var_6 thread _id_5106( var_4 );

    if ( isdefined( var_5 ) && var_5 )
        var_6 thread _id_51C7( self );

    return var_6;
}

_id_51C7( var_0 )
{
    self endon( "death" );
    var_0 scripts\engine\utility::waittill_any( "death", "disconnect" );
    self delete();
}

_id_7F91( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( var_1 == "axis" )
        var_2 += 6;

    if ( isdefined( var_6 ) )
        return getmatchrulesdata( var_0, var_2, var_3, var_4, var_5, var_6 );
    else if ( isdefined( var_5 ) )
        return getmatchrulesdata( var_0, var_2, var_3, var_4, var_5 );
    else
        return getmatchrulesdata( var_0, var_2, var_3, var_4 );
}

_id_7D91( var_0, var_1 )
{
    return var_0 * 5 + var_1;
}

_id_807C( var_0, var_1, var_2, var_3 )
{
    var_4 = [ "physicscontents_player" ];
    return _id_7E9B( var_0, var_1, var_2, var_3, physics_createcontents( var_4 ) );
}

_id_807D( var_0, var_1, var_2, var_3 )
{
    var_4 = [ "physicscontents_player" ];
    var_5 = [];
    var_6 = _id_7E9B( var_0, var_1, var_2, var_3, physics_createcontents( var_4 ) );

    foreach ( var_8 in var_6 )
    {
        var_9 = undefined;
        var_10 = [ var_8 gettagorigin( "j_head" ), var_8 gettagorigin( "j_mainroot" ), var_8 gettagorigin( "tag_origin" ) ];

        for ( var_11 = 0; var_11 < var_10.size; var_11++ )
        {
            if ( !scripts\engine\trace::_id_DCF1( var_0, var_10[var_11], level._id_3CB5, scripts\engine\trace::_id_48BC( 0, 1, 1, 1, 1, 1 ) ) )
                continue;

            if ( !isdefined( var_9 ) )
            {
                var_5[var_5.size] = spawnstruct();
                var_5[var_5.size - 1].player = var_8;
                var_5[var_5.size - 1].visiblelocations = [];
                var_9 = 1;
            }

            var_5[var_5.size - 1].visiblelocations[var_5[var_5.size - 1].visiblelocations.size] = var_10[var_11];
        }
    }

    return var_5;
}

_id_8047( var_0, var_1, var_2, var_3 )
{
    return _id_7E9B( var_0, var_1, var_2, var_3, scripts\engine\trace::_id_48B1() );
}

_id_7E9B( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_1 <= 0 )
        return [];

    var_5 = undefined;

    if ( isdefined( var_3 ) )
    {
        if ( isarray( var_3 ) )
            var_5 = var_3;
        else
            var_5 = [ var_3 ];
    }

    var_6 = physics_querypoint( var_0, var_1, var_4, var_5, "physicsquery_all" );
    var_7 = [];

    if ( !isdefined( var_2 ) )
    {
        foreach ( var_9 in var_6 )
        {
            var_10 = var_9["entity"];
            var_7[var_7.size] = var_10;
        }
    }
    else
    {
        foreach ( var_9 in var_6 )
        {
            var_10 = var_9["entity"];

            if ( isdefined( var_10.team ) && var_10.team == var_2 )
                var_7[var_7.size] = var_10;
        }
    }

    return var_7;
}

_id_E76A( var_0 )
{
    if ( var_0 - int( var_0 ) >= 0.5 )
        return int( var_0 + 1 );
    else
        return int( var_0 );
}

_id_9E05( var_0, var_1 )
{
    if ( !level.teambased )
        return 0;

    if ( !isplayer( var_1 ) && !isdefined( var_1.team ) )
        return 0;

    if ( var_0 != var_1.team )
        return 0;

    return 1;
}

playersareenemies( var_0, var_1 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return undefined;

    if ( !isdefined( var_0.team ) || !isdefined( var_1.team ) )
        return undefined;

    if ( level.teambased )
        return var_0.team != var_1.team;
    else
        return var_0 != var_1;
}

istrue( var_0 )
{
    return isdefined( var_0 ) && var_0;
}

_id_17C0( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( var_2 )
    {
        if ( !isdefined( self._id_17DF ) )
            self._id_17DF = [];

        self._id_17DF[var_0] = var_1;

        if ( isdefined( var_3 ) )
        {
            if ( !isdefined( self._id_17DE ) )
                self._id_17DE = [];

            self._id_17DE[var_0] = var_3;
        }
    }
    else
    {
        if ( !isdefined( self._id_BDC8 ) )
            self._id_BDC8 = [];

        self._id_BDC8[var_0] = var_1;

        if ( isdefined( var_3 ) )
        {
            if ( !isdefined( self._id_BDC7 ) )
                self._id_BDC7 = [];

            self._id_BDC7[var_0] = var_3;
        }
    }
}

_id_E0E6( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( var_1 )
    {
        if ( !isdefined( self._id_17DF ) )
            return;

        self._id_17DF[var_0] = undefined;

        if ( !isdefined( self._id_17DE ) )
            return;

        self._id_17DE[var_0] = undefined;
    }
    else
    {
        if ( !isdefined( self._id_BDC8 ) )
            return;

        self._id_BDC8[var_0] = undefined;

        if ( !isdefined( self._id_BDC7 ) )
            return;

        self._id_BDC7[var_0] = undefined;
    }
}

_id_7E5C( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = 1.0;

    if ( isdefined( self._id_17DF ) )
    {
        foreach ( var_11, var_9 in self._id_17DF )
        {
            var_10 = 0;

            if ( isdefined( self._id_17DE ) && isdefined( self._id_17DE[var_11] ) )
                var_10 = [[ self._id_17DE[var_11] ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

            if ( !var_10 )
                var_7 += var_9 - 1.0;
        }
    }

    var_12 = 1.0;

    if ( isdefined( self._id_BDC8 ) )
    {
        foreach ( var_11, var_9 in self._id_BDC8 )
        {
            var_10 = 0;

            if ( isdefined( self._id_BDC7 ) && isdefined( self._id_BDC7[var_11] ) )
                var_10 = [[ self._id_BDC7[var_11] ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

            if ( !var_10 )
                var_12 *= var_9;
        }
    }

    return var_7 * var_12;
}

_id_41A6()
{
    self._id_17DF = [];
    self._id_BDC8 = [];
    self._id_17DE = [];
    self._id_BDC7 = [];
}

_id_1253( var_0 )
{
    if ( !isdefined( self._id_6262 ) )
        self._id_6262 = 0;

    if ( var_0 )
    {
        if ( self._id_6262 == 0 )
            self _meth_84CC( 1 );

        self._id_6262++;
    }
    else
    {
        if ( self._id_6262 == 1 )
            self _meth_84CC( 0 );

        self._id_6262--;
    }
}

_id_1C4A( var_0 )
{
    if ( self._id_AE62 != "archetype_heavy" )
        return;

    if ( var_0 )
    {
        if ( !isdefined( self._id_55CB ) )
            self._id_55CB = 0;

        self._id_55CB--;

        if ( !self._id_55CB )
            self _meth_8488( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55CB ) )
            self._id_55CB = 0;

        self._id_55CB++;
        self _meth_8488( 0 );
    }
}

_id_1C41( var_0 )
{
    if ( self._id_AE62 != "archetype_scout" )
        return;

    if ( var_0 )
    {
        if ( !isdefined( self._id_55C4 ) )
            self._id_55C4 = 0;

        self._id_55C4--;

        if ( !self._id_55C4 )
            self _meth_8412( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55C4 ) )
            self._id_55C4 = 0;

        self._id_55C4++;
        self _meth_8412( 0 );
    }
}

_id_1C47( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55C9 ) )
            self._id_55C9 = 0;
        else
            self._id_55C9--;

        if ( !self._id_55C9 )
        {
            if ( scripts\engine\utility::_id_9C70() )
                _id_13CB( 3, "taunt" );
            else
                _id_13CB( 7, "taunt" );
        }
    }
    else
    {
        if ( !isdefined( self._id_55C9 ) )
            self._id_55C9 = 0;

        self._id_55C9++;

        if ( scripts\engine\utility::_id_9C70() )
            _id_13CB( 3, "" );
        else
            _id_13CB( 7, "" );
    }
}

_id_13A1E( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "disconnect" );
    self endon( "end_entities_in_radius" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        var_5 = undefined;

        if ( var_4 )
            var_5 = _id_807C( self.origin, var_0 );
        else
            var_5 = _id_7E9B( self.origin, var_0 );

        if ( var_5.size > 0 )
        {
            if ( !var_3 )
                self notify( var_1, var_5 );
            else
            {
                var_6 = [];

                foreach ( var_8 in var_5 )
                {
                    var_9 = self _meth_814F();
                    var_10 = scripts\engine\utility::ter_op( var_4, var_8 geteye(), var_8.origin );
                    var_11 = physics_createcontents( [ "physicscontents_solid", "physicscontents_structural", "physicscontents_vehicleclip", "physicscontents_item", "physicscontents_canshootclip" ] );
                    var_12 = physics_raycast( var_9, var_10, var_11, undefined, 0, "physicsquery_closest" );

                    if ( var_12.size <= 0 )
                        var_6[var_6.size] = var_8;
                }

                self notify( var_1, var_6 );
            }
        }

        wait( var_2 );
    }
}

_id_3880()
{
    self notify( "end_entities_in_radius" );
}

_id_9E7A( var_0, var_1, var_2 )
{
    var_3 = ( var_0[0], var_0[1], 0 );
    var_4 = ( var_2[0], var_2[1], 0 );
    var_5 = var_4 - var_3;
    var_6 = ( var_1[0], var_1[1], 0 );
    return var_5[0] * var_6[1] - var_5[1] * var_6[0] < 0;
}

_id_DC0B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isdefined( var_9 ) )
        var_9 = 0;

    var_10 = scripts\engine\trace::_id_48B1();
    var_11 = scripts\engine\trace::_id_48BC( 0, 1, 1, 0, 1, 0 );
    var_12 = [];

    foreach ( var_14 in level._id_3CB5 )
    {
        if ( !isdefined( var_14 ) )
            continue;

        if ( !isreallyalive( var_14 ) )
        {
            var_12[var_12.size] = var_14;
            continue;
        }

        if ( var_9 && var_14 == var_5 )
        {
            var_12[var_12.size] = var_14;
            continue;
        }

        if ( level.teambased && var_14.team == var_5.team )
            var_12[var_12.size] = var_14;
    }

    var_16 = physics_querypoint( var_5.origin, var_2, var_10, var_12, "physicsquery_all" );

    if ( isdefined( var_16 ) && var_16.size > 0 )
    {
        for ( var_17 = 0; var_17 < var_16.size; var_17++ )
        {
            var_18 = var_16[var_17]["entity"];
            var_19 = var_16[var_17]["distance"];
            var_20 = var_16[var_17]["position"];
            var_21 = physics_raycast( var_0, var_20, var_11, undefined, 0, "physicsquery_closest" );

            if ( isdefined( var_21 ) && var_21.size > 0 )
                continue;

            var_22 = max( var_19, var_1 ) / var_2;
            var_23 = var_3 + ( var_4 - var_3 ) * var_22;
            var_18 _meth_80B0( var_23, var_0, var_5, var_6, var_7, var_8 );
        }
    }
}

_id_9EAF( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "orbital_deployment":
            return 1;
    }

    return var_1;
}

_id_1824( var_0, var_1, var_2 )
{
    _id_50A5( var_0, var_2 );

    if ( isdefined( var_2 ) )
        self._id_EC52[var_0][var_2] += var_1;
    else
        self._id_EC51[var_0] += var_1;
}

_id_E165( var_0, var_1, var_2 )
{
    _id_50A5( var_0, var_2 );

    if ( isdefined( var_2 ) )
        self._id_EC52[var_0][var_2] -= var_1;
    else
        self._id_EC51[var_0] -= var_1;
}

_id_8101( var_0, var_1 )
{
    _id_50A5( var_0, var_1 );

    if ( isdefined( var_1 ) )
        return self._id_EC52[var_0][var_1];
    else
        return self._id_EC51[var_0];
}

_id_50A5( var_0, var_1 )
{
    if ( !isdefined( self._id_EC52 ) )
        self._id_EC52 = [];

    if ( !isdefined( self._id_EC51 ) )
        self._id_EC51 = [];

    if ( isdefined( var_1 ) )
    {
        if ( !isdefined( self._id_EC52[var_0] ) )
            self._id_EC52[var_0] = [];

        if ( !isdefined( self._id_EC52[var_0][var_1] ) )
            self._id_EC52[var_0][var_1] = 1;
    }
    else if ( !isdefined( self._id_EC51[var_0] ) )
        self._id_EC51[var_0] = 1;
}

_id_DE39( var_0 )
{
    foreach ( var_3, var_2 in self._id_D782 )
        _id_DE38( var_3, var_0 );
}

_id_DE38( var_0, var_1 )
{
    var_2 = self._id_D782[var_0];
    var_3 = level._id_D782[var_0];
    var_4 = var_3._id_461D;
    var_5 = var_2._id_4617;

    if ( !isdefined( var_4 ) || !isdefined( var_5 ) || var_5 <= 0 || var_5 >= var_4 )
        return;

    var_5 += var_1;

    if ( var_5 >= var_4 )
        var_5 = var_4;

    _id_0AE2::_id_D74F( var_0, var_5 );
}

_id_D64B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = var_0 - var_1;
    var_9 = vectordot( var_8, var_2 );
    var_10 = vectordot( var_8, var_3 );

    if ( var_9 > var_4 )
        return 0;

    if ( var_9 < var_5 )
        return 0;

    if ( isdefined( var_7 ) )
    {
        if ( abs( var_10 ) > var_7 )
            return 0;
    }

    if ( scripts\engine\utility::_id_1E7C( var_2, var_8 ) > var_6 )
        return 0;

    return 1;
}

_id_D64A( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_4 - var_2;
    var_6 = vectordot( var_5, var_3 );

    if ( var_6 < 0 || var_6 > var_1 )
        return 0;

    var_5 -= var_6 * var_3;
    var_7 = lengthsquared( var_5 );

    if ( var_7 > var_0 )
        return 0;

    return 1;
}

_id_1319B( var_0, var_1 )
{
    var_2 = vectorcross( var_0, var_1 );
    var_1 = vectorcross( var_2, var_0 );
    var_3 = _func_017( var_0, var_2, var_1 );
    return var_3;
}

_id_9EF6( var_0, var_1 )
{
    var_2 = 0;

    if ( isagent( var_0 ) && isdefined( var_0.agent_type ) && var_0.agent_type == "playerProxy" )
    {
        if ( var_0.owner == var_1 )
            var_2 = 1;
    }

    return var_2;
}

givestreakpointswithtext( var_0, var_1, var_2 )
{
    if ( isdefined( level.ignorescoring ) )
        return;

    if ( isdefined( var_2 ) )
        var_3 = var_2;
    else
        var_3 = scripts\mp\rank::getscoreinfovalue( var_0 );

    var_3 = _id_B93D( var_0, var_3, var_1 );
    scripts\mp\killstreaks\killstreaks::_id_83A7( var_0, var_3 );
    displayscoreeventpoints( var_3, var_0 );

    if ( var_0 == "assist_hardline" )
        scripts\mp\missions::_id_D991( "ch_hardline_extra_score", var_3 );
}

_id_83B4( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( level.ignorescoring ) && !issubstr( var_0, "assist" ) )
        return;

    if ( isdefined( var_2 ) )
        var_6 = var_2;
    else
        var_6 = scripts\mp\rank::getscoreinfovalue( var_0 );

    var_6 = _id_B93D( var_0, var_6, var_1 );
    scripts\mp\gamescore::_id_8392( var_0, var_6 );
    scripts\mp\killstreaks\killstreaks::_id_83A7( var_0, var_6 );

    if ( !istrue( var_5 ) )
        thread scripts\mp\rank::_id_839A( var_0, var_6, var_1 );

    if ( shouldgivesuperpoints( var_0 ) && var_6 > 0 )
        scripts\mp\supers::_id_83AA( var_6 );

    if ( !istrue( var_4 ) )
        displayscoreeventpoints( var_6, var_0 );
}

displayscoreeventpoints( var_0, var_1 )
{
    if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
    {
        foreach ( var_3 in level.players )
        {
            if ( var_3 ismlgspectator() )
            {
                var_4 = var_3 getspectatingplayer();

                if ( isdefined( var_4 ) )
                {
                    var_5 = var_4 getentitynumber();
                    var_6 = self getentitynumber();

                    if ( var_5 == var_6 )
                    {
                        var_3 thread scripts\mp\rank::_id_EC42( var_0 );
                        var_3 thread scripts\mp\rank::scoreeventpopup( var_1 );
                    }
                }
            }
        }
    }

    if ( !isdefined( level._id_10269 ) )
    {
        var_8 = 0;

        if ( issimultaneouskillenabled() )
            var_8 = var_1 == "kill";

        thread scripts\mp\rank::_id_EC42( var_0, var_8 );
    }

    thread scripts\mp\rank::scoreeventpopup( var_1 );
}

_id_B93D( var_0, var_1, var_2 )
{
    var_3 = var_1;

    switch ( var_0 )
    {
        case "damage":
            return 0;
        default:
            break;
    }

    var_4 = 0;
    var_4 += scripts\mp\supers\super_amplify::_id_1E58( var_3 );
    var_5 = _id_8101( var_0, var_2 );
    var_5 -= 1;
    var_4 += var_3 * var_5;
    var_1 += var_4;

    if ( isdefined( level.modifyunifiedpointscallback ) )
        var_1 = [[ level.modifyunifiedpointscallback ]]( var_1, var_0, self, var_2 );

    return int( var_1 );
}

shouldgivesuperpoints( var_0 )
{
    switch ( var_0 )
    {
        case "super_pack":
        case "scorestreak_pack":
        case "battery_pack":
            return 0;
        case "medal_mode_sd_last_defuse_score":
        case "medal_mode_sd_defuse_score":
        case "plant":
            return !_id_9D46();
        default:
            return 1;
    }
}

_id_248F( var_0 )
{
    if ( isdefined( var_0 ) && scripts\engine\utility::string_starts_with( var_0, "mod_" ) )
        return 1;

    return 0;
}

_id_248E( var_0 )
{
    return isdefined( var_0 ) && scripts\engine\utility::string_starts_with( var_0, "cos_" );
}

_id_12E4()
{
    if ( !isreallyalive( self ) )
        return;

    self _meth_8192();
}

_id_12E5( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isplayer( self ) )
    {

    }

    if ( !var_1 && !isreallyalive( self ) )
    {

    }

    if ( var_1 && !isreallyalive( self ) )
    {
        thread _id_91AE( var_0 );
        return;
    }

    self _meth_8191( var_0, var_2 );
}

_id_91AE( var_0 )
{
    level endon( "game_ended" );
    self waittill( "spawned" );

    if ( !isdefined( self ) )
        return;

    if ( !isreallyalive( self ) )
        return;

    if ( !isplayer( self ) )
        return;

    self _meth_8191( var_0 );
}

_id_627A( var_0, var_1 )
{
    if ( var_0 )
    {
        _func_2DC( var_1 );
        level._id_DC24 = 1;
    }
    else
    {
        _func_2DC( 1.0 );
        level._id_DC24 = undefined;
    }
}

_id_9F13()
{
    return istrue( level._id_DC24 );
}

_id_9D6E( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "briefcase_bomb_mp":
        case "bomb_site_mp":
            return 1;
    }

    return 0;
}

isgesture( var_0 )
{
    if ( issubstr( var_0, "ges_plyr" ) )
        return 1;
    else if ( issubstr( var_0, "devilhorns_mp" ) )
        return 1;
    else
        return 0;
}

_id_9E6C( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 == "none" )
        return 0;

    if ( scripts\engine\utility::_id_9DC1( var_0 ) )
        return 0;

    if ( _id_9D6E( var_0 ) )
        return 0;

    if ( isgesture( var_0 ) )
        return 0;

    if ( issubstr( var_0, "killstreak" ) )
        return 1;

    if ( issubstr( var_0, "remote_tank_projectile" ) )
        return 1;

    if ( issubstr( var_0, "minijackal_" ) )
        return 1;

    if ( isdefined( level._id_A6C5 ) && isdefined( level._id_A6C5[var_0] ) )
        return 1;

    var_0 = _id_1717( var_0 );

    if ( scripts\engine\utility::_id_9D33( var_0 ) )
        return 1;

    var_1 = weaponinventorytype( var_0 );

    if ( isdefined( var_1 ) && var_1 == "exclusive" )
        return 1;

    return 0;
}

_id_1717( var_0 )
{
    if ( issubstr( var_0, "iw7" ) || issubstr( var_0, "iw6" ) )
    {
        var_1 = _id_8234( var_0 );
        var_0 = _id_13C75( var_1 );

        if ( var_0 == var_1 )
            var_0 += "_mp";
    }
    else
    {
        var_2 = strtok( var_0, "_" );

        if ( !scripts\engine\utility::string_starts_with( var_2[var_2.size - 1], "mp" ) )
            var_0 += "_mp";
    }

    return var_0;
}

_id_CC16( var_0, var_1, var_2, var_3 )
{
    self playlocalsound( "scavenger_pack_pickup" );

    if ( istrue( var_1 ) )
    {
        var_4 = undefined;

        if ( isdefined( var_3 ) )
            var_4 = spawnfxforclient( scripts\engine\utility::_id_7ECB( "placeEquipmentFailed" ), var_2, self, anglestoforward( var_3 ), anglestoup( var_3 ) );
        else
            var_4 = spawnfxforclient( scripts\engine\utility::_id_7ECB( "placeEquipmentFailed" ), var_2, self );

        triggerfx( var_4 );
        thread _id_CC17( var_4 );
    }

    switch ( var_0 )
    {
        case "micro_turret_mp":
        case "shard_ball_mp":
        case "deployable_cover_mp":
        case "trophy_mp":
        case "domeshield_mp":
        case "cryo_mine_mp":
        case "trip_mine_mp":
        case "blackhole_grenade_mp":
            if ( isplayer( self ) && isreallyalive( self ) )
            {
                self iprintlnbold( "Placement Failed" );
                return;
            }
    }
}

_id_CC18()
{
    level._effect["placeEquipmentFailed"] = loadfx( "vfx/core/mp/killstreaks/vfx_ballistic_vest_death" );
}

_id_CC17( var_0 )
{
    wait 2;
    var_0 delete();
}

_id_316C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    thread _id_316D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

_id_316D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_9 = "bufferedNotify_" + var_0;
    self notify( var_9 );
    self endon( var_9 );

    if ( !isdefined( self._id_316B ) )
        self._id_316B = [];

    if ( !isdefined( self._id_316B[var_0] ) )
        self._id_316B[var_0] = [];

    var_10 = spawnstruct();
    var_10._id_C8E5 = var_1;
    var_10._id_C8E6 = var_2;
    var_10._id_C8E7 = var_3;
    var_10._id_C8E8 = var_4;
    var_10._id_C8E9 = var_5;
    var_10._id_C8EA = var_6;
    var_10._id_C8EB = var_7;
    var_10._id_C8EC = var_8;
    self._id_316B[var_0][self._id_316B[var_0].size] = var_10;
    waittillframeend;

    while ( self._id_316B[var_0].size > 0 )
    {
        var_10 = self._id_316B[var_0][0];
        self notify( var_0, var_10._id_C8E5, var_10._id_C8E6, var_10._id_C8E7, var_10._id_C8E8, var_10._id_C8E9, var_10._id_C8EA, var_10._id_C8EB, var_10._id_C8EC );
        self._id_316B[var_0] = _id_22B0( self._id_316B[var_0], 0 );
        wait 0.05;
    }
}

_id_806F()
{
    if ( level.rankedmatch )
        return "mp";

    return "mp_private";
}

_id_806E()
{
    if ( level.rankedmatch )
        return "rankedloadouts";

    return "privateloadouts";
}

_id_F7F1()
{
    level._id_10E59 = _id_806F();
    level._id_AEA6 = _id_806E();
}

_id_F751()
{
    self._id_9331 = 1;
}

_id_41BA()
{
    self._id_9331 = undefined;
}

_id_C15A( var_0, var_1 )
{
    self waittill( var_0 );
    waittillframeend;
    self notify( var_1 );
}

_id_7F9B()
{
    return 3;
}

getmaxoutofboundscooldown()
{
    return 3;
}

_id_7E4D()
{
    _id_1313F();
    var_0 = self _meth_856D();

    if ( !isdefined( var_0 ) || var_0 == "none" )
        return undefined;

    return var_0;
}

_id_9D47()
{
    return isdefined( _id_7E4D() );
}

_id_9F20( var_0 )
{
    var_1 = _id_7E4D();
    return isdefined( var_1 ) && var_1 == var_0 && !_id_9DA5( var_0 );
}

_id_391B( var_0 )
{
    if ( !self hasweapon( var_0 ) )
        return 0;

    var_1 = _id_7E4D();

    if ( isdefined( var_1 ) )
    {
        var_2 = 0;

        if ( var_0 == "briefcase_bomb_mp" || var_0 == "briefcase_bomb_defuse_mp" || var_0 == "iw7_uplinkball_mp" || var_0 == "iw7_tdefball_mp" )
            var_2 = 1;
        else if ( weaponinventorytype( var_1 ) == "primary" )
            var_2 = 1;

        if ( !var_2 )
            return 0;
    }

    if ( _id_9DA5( var_0 ) )
        return 0;

    return 1;
}

_id_1529( var_0 )
{
    _id_4F5B( "+++ ABORT - " + var_0 );

    if ( self _meth_856D() == var_0 )
        self _meth_8570( var_0 );

    _id_141E( var_0 );
    return;
}

_id_144F( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( isai( var_3 ) )
            continue;

        var_3 visionsetnakedforplayer( var_0, var_1 );
    }

    return;
}

_id_11383( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "death" );
    _id_4F5B( ">>> BEGIN switchToWeaponReliable() - " + var_0 );

    if ( !_id_391B( var_0 ) )
    {
        _id_4F5B( ">>> FAIL (early) switchToWeaponReliable() - " + var_0 );
        return 0;
    }

    if ( _id_9D47() )
        self _meth_8570( _id_7E4D() );

    self _meth_856F( var_0 );

    if ( istrue( var_1 ) )
        _id_141B( var_0 );

    for (;;)
    {
        if ( _id_9DA5( var_0 ) )
        {
            _id_1313F();
            _id_4F5B( ">>> SUCCESS switchToWeaponReliable() - " + var_0 );
            return 1;
        }

        if ( !self _meth_856E( var_0 ) || !self hasweapon( var_0 ) )
        {
            _id_4F5B( ">>> FAIL switchToWeaponReliable() - " + var_0 );
            return 0;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_1313F()
{
    var_0 = self getcurrentweapon();

    if ( self _meth_856E( var_0 ) )
        self _meth_8570( var_0 );
}

_id_80F2( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );

    if ( !self hasweapon( var_0 ) )
        return;

    if ( !_id_9DA5( var_0 ) )
    {
        _id_141E( var_0 );
        return;
    }

    while ( _id_9D47() )
        scripts\engine\utility::waitframe();

    if ( !_id_9DA5( var_0 ) )
    {
        _id_141E( var_0 );
        return;
    }

    var_1 = undefined;

    if ( isbot( self ) )
        var_1 = 1;

    var_2 = _id_11383( self._id_A978, var_1 );
    _id_141E( var_0 );
    self notify( "bomb_allow_offhands" );

    if ( !var_2 )
        _id_72ED();
}

_id_72ED( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );

    while ( self getcurrentweapon() == "none" )
    {
        if ( self _meth_81C2() || _id_9D47() )
        {
            scripts\engine\utility::waitframe();
            continue;
        }

        var_1 = var_0;

        if ( !isdefined( var_1 ) || !self hasweapon( var_1 ) )
        {
            if ( !isdefined( self._id_A978 ) || self._id_A978 == "none" )
                break;

            var_1 = self._id_A978;
        }

        var_2 = getcurrentprimaryweaponsminusalt();

        if ( isdefined( var_1 ) && _id_821D( var_1 ) == "iw7_axe_mp" && self getweaponammoclip( var_1 ) == 0 && var_2.size == 1 )
            var_1 = "iw7_fists_mp";

        _id_11383( var_1 );
        scripts\engine\utility::waitframe();
    }
}

_id_9DA5( var_0 )
{
    var_1 = self getcurrentweapon();

    if ( _id_9F7C( var_0, "alt_" ) )
        var_0 = getsubstr( var_0, 4 );

    if ( _id_9F7C( var_1, "alt_" ) )
        var_1 = getsubstr( var_1, 4 );

    return var_1 == var_0;
}

_id_9F72( var_0 )
{
    return istrue( var_0._id_9F72 );
}

_id_9F22( var_0 )
{
    if ( !isdefined( var_0._id_165A ) )
        return 0;

    return var_0._id_165A == "remote_c8";
}

_id_9F8C( var_0 )
{
    var_1 = var_0 getentitynumber();

    if ( !isdefined( level._id_11267 ) )
        return 0;

    if ( !isdefined( level._id_11267._id_12801 ) )
        return 0;

    if ( !isdefined( level._id_11267._id_12801[var_1] ) )
        return 0;

    return level._id_11267._id_12801[var_1] == var_0;
}

ismicroturret( var_0 )
{
    var_1 = var_0 getentitynumber();

    if ( !isdefined( level._id_B726 ) )
        return 0;

    if ( !isdefined( level._id_B726[var_1] ) )
        return 0;

    return level._id_B726[var_1] == var_0;
}

isjackal( var_0 )
{
    if ( !isdefined( var_0._id_110E8 ) )
        return 0;

    if ( !isdefined( var_0._id_110E8._id_110EA ) )
        return 0;

    return var_0._id_110E8._id_110EA == "jackal";
}

isturret( var_0 )
{
    return isdefined( var_0.classname ) && var_0.classname == "misc_turret";
}

isdronepackage( var_0 )
{
    return isdefined( var_0._id_485F );
}

_enableignoreme()
{
    if ( !isdefined( self._id_6266 ) )
        self._id_6266 = 0;

    if ( self._id_6266 == 0 )
        self._id_0184 = 1;

    self._id_6266++;
}

_disableignoreme()
{
    if ( self._id_6266 == 1 )
        self._id_0184 = 0;

    self._id_6266--;
}

_resetenableignoreme()
{
    self._id_6266 = undefined;
    self._id_0184 = 0;
}

_id_1254()
{
    if ( !isdefined( self._id_6263 ) )
        self._id_6263 = 0;

    if ( self._id_6263 == 0 )
        self _meth_80CD( 1 );

    self._id_6263++;
}

_id_11DB()
{
    if ( self._id_6263 == 1 )
        self _meth_80CD( 0 );

    self._id_6263--;
}

_id_8EC6()
{
    if ( !isdefined( self._id_12B1F ) )
        self._id_8EC7 = 0;

    if ( self._id_8EC7 == 0 )
        self setclientomnvar( "ui_hide_hud", 1 );

    self._id_8EC7++;
}

_id_8EC4()
{
    if ( self._id_8EC7 == 1 )
        self setclientomnvar( "ui_hide_hud", 0 );

    self._id_8EC7--;
}

_id_8ECD()
{
    if ( !isdefined( self._id_8ECE ) )
        self._id_8ECE = 0;

    if ( self._id_8ECE == 0 )
        self setclientomnvar( "ui_hide_minimap", 1 );

    self._id_8ECE++;
}

_id_8ECC()
{
    if ( self._id_8ECE == 1 )
        self setclientomnvar( "ui_hide_minimap", 0 );

    self._id_8ECE--;
}

_id_4F5B( var_0 )
{

}

_id_9D92()
{
    var_0 = 0;

    if ( isdefined( self._id_D3E7 ) && isalive( self._id_D3E7 ) )
        var_0 = 1;

    return var_0;
}

_id_DED0()
{
    self endon( "death" );
    self endon( "stop_phys_sounds" );

    for (;;)
    {
        self waittill( "collision", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
        level notify( "physSnd", self, var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
    }
}

_id_83DA()
{
    level notify( "physics_monitor" );
    level endon( "physics_monitor" );

    for (;;)
    {
        level waittill( "physSnd", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

        if ( isdefined( var_0 ) && isdefined( var_0._id_CAF8 ) )
            level thread [[ var_0._id_CAF8 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
    }
}

_id_DECF( var_0, var_1 )
{
    var_0._id_CAF8 = var_1;
}

_id_9FAE( var_0 )
{
    return istrue( var_0._id_1D44 );
}

istouchingboundsnullify( var_0 )
{
    var_1 = 0;

    if ( isdefined( level.outofboundstriggerpatches ) && level.outofboundstriggerpatches.size > 0 )
    {
        foreach ( var_3 in level.outofboundstriggerpatches )
        {
            if ( isplayer( var_0 ) && var_0 istouching( var_3 ) )
            {
                if ( isdefined( var_3._id_0336 ) && var_3._id_0336 == "apex_unoutofbounds" )
                    break;

                var_1 = 1;
                break;
            }
            else if ( !isplayer( var_0 ) && var_0 istouching( var_3 ) )
            {
                var_1 = 1;
                break;
            }
        }
    }

    return var_1;
}

_id_D915( var_0, var_1 )
{
    if ( getdvarint( "scr_suppress_game_actions", 0 ) == 1 )
        return;

    var_2 = "";

    if ( isdefined( var_1 ) )
        var_2 = "[" + var_1 getentitynumber() + ":" + var_1.name + "] ";
}

delaysetclientomnvar( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    wait( var_0 );
    self setclientomnvar( var_1, var_2 );
}

isfemale()
{
    return self._id_7727 == "female";
}

canrecordcombatrecordstats()
{
    return level.rankedmatch && !istrue( level.ignorescoring ) && level.gametype != "infect" && ( !isdefined( level.aonrules ) || level.aonrules == 0 );
}

getstreakrecordtype( var_0 )
{
    if ( isenumvaluevalid( "mp", "LethalScorestreakStatItems", var_0 ) )
        return "lethalScorestreakStats";

    if ( isenumvaluevalid( "mp", "SupportScorestreakStatItems", var_0 ) )
        return "supportScorestreakStats";

    return undefined;
}

getlowestclientnum( var_0, var_1 )
{
    var_2 = undefined;

    foreach ( var_4 in var_0 )
    {
        if ( var_4.team != "spectator" && ( !var_1 || isreallyalive( var_4 ) ) )
        {
            if ( !isdefined( var_2 ) || var_4 getentitynumber() < var_2 )
                var_2 = var_4 getentitynumber();
        }
    }

    return var_2;
}

isspawnprotected()
{
    return gettime() < self._id_10916 + level.killstreakspawnshielddelayms;
}

getcurrentprimaryweaponsminusalt()
{
    var_0 = [];
    var_1 = self getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        if ( !issubstr( var_3, "alt_" ) )
            var_0[var_0.size] = var_3;
    }

    return var_0;
}

initarbitraryuptriggers()
{
    if ( isdefined( level.arbitraryuptriggers ) )
        return;

    level.arbitraryuptriggers = [];
    level.arbitraryuptriggersstructs = [];

    if ( _id_7F8B() == "mp_junk" )
    {
        var_0 = getentarray( "mag_up", "targetname" );

        if ( !isdefined( var_0 ) || var_0.size == 0 )
            return;

        level.arbitraryuptriggers = var_0;

        foreach ( var_2 in var_0 )
        {
            var_3 = var_2 getentitynumber();
            var_4 = spawnstruct();
            var_4.trigger = var_2;
            var_4._id_2857 = undefined;
            var_4.entsinside = [];

            if ( isdefined( var_2._id_0334 ) )
            {
                var_4._id_2857 = getent( var_2._id_0334, "targetname" );
                var_4.blinkloc = var_4._id_2857.origin + ( 0, 0, -175 );
            }

            level.arbitraryuptriggersstructs[var_3] = var_4;
            thread watcharbitraryuptriggerenter( var_4 );
            thread watcharbitraryuptriggerexit( var_4 );
        }
    }
}

watcharbitraryuptriggerenter( var_0 )
{
    for (;;)
    {
        var_0.trigger waittill( "trigger", var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        if ( !shouldaddtoarbitraryuptrigger( var_0, var_1 ) )
            continue;

        var_2 = var_1 getentitynumber();
        var_0.entsinside[var_2] = var_1;
        var_1.arbitraryuptriggerstruct = var_0;
    }
}

watcharbitraryuptriggerexit( var_0 )
{
    for (;;)
    {
        foreach ( var_2 in var_0.entsinside )
        {
            if ( !isdefined( var_2 ) )
                continue;

            if ( !shouldremovefromarbitraryuptrigger( var_0, var_2 ) )
                continue;

            var_3 = var_2 getentitynumber();
            var_0.entsinside[var_3] = undefined;

            if ( isdefined( var_2.arbitraryuptriggerstruct ) && var_2.arbitraryuptriggerstruct == var_0 )
                var_2.arbitraryuptriggerstruct = undefined;
        }

        scripts\engine\utility::waitframe();
    }
}

shouldaddtoarbitraryuptrigger( var_0, var_1 )
{
    if ( !isplayer( var_1 ) )
        return 0;

    var_2 = var_1 getentitynumber();

    if ( isdefined( var_0.entsinside[var_2] ) )
        return 0;

    return 1;
}

shouldremovefromarbitraryuptrigger( var_0, var_1 )
{
    if ( !var_1 istouching( var_0.trigger ) )
        return 1;

    return 0;
}

getarbitraryuptrigger()
{
    if ( !isdefined( self.arbitraryuptriggerstruct ) )
        return undefined;

    return self.arbitraryuptriggerstruct.trigger;
}

getarbitraryuptriggerbase()
{
    if ( !isdefined( self.arbitraryuptriggerstruct ) )
        return undefined;

    return self.arbitraryuptriggerstruct._id_2857;
}

getarbitraryuptriggerblinkloc()
{
    if ( !isdefined( self.arbitraryuptriggerstruct ) )
        return undefined;

    return self.arbitraryuptriggerstruct.blinkloc;
}

isinarbitraryup()
{
    if ( isplayer( self ) )
    {
        if ( self _meth_8517() != ( 0, 0, 0 ) )
            return 1;
    }

    return 0;
}

isprojectiledamage( var_0 )
{
    var_1 = "MOD_PROJECTILE MOD_IMPACT MOD_GRENADE MOD_HEAD_SHOT";

    if ( issubstr( var_1, var_0 ) )
        return 1;

    return 0;
}

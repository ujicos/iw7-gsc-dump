// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

bot_killstreak_setup()
{
    if ( !isdefined( level._id_A68C ) )
    {
        if ( !isdefined( level._id_A68C ) )
            level._id_A68C = [];

        if ( !isdefined( level._id_A68B ) )
            level._id_A68B = [];

        if ( !isdefined( level._id_A68D ) )
            level._id_A68D = [];

        if ( !isdefined( level._id_2EA4 ) )
            level._id_2EA4 = [];

        _id_2E63( "nuke", ::_id_2DF4 );
        _id_2E63( "ball_drone_backup", ::_id_2DF4 );
        _id_2E63( "jackal", ::_id_2DF4 );
        _id_2E63( "uav", ::_id_2DF4 );
        _id_2E63( "counter_uav", ::_id_2DF4 );
        _id_2E63( "jammer", ::_id_2DF4, ::_id_2D28 );
        _id_2E63( "directional_uav", ::_id_2DF4 );

        if ( isdefined( level._id_B32F ) )
            [[ level._id_B32F ]]();
    }

    thread scripts\mp\bots\bots_killstreaks_remote_vehicle::_id_DF76();
}

_id_2E63( var_0, var_1, var_2, var_3 )
{
    level._id_A68C[var_0] = var_1;
    level._id_A68B[var_0] = var_2;
    level._id_A68D[var_0] = var_3;
    level._id_2EA4[level._id_2EA4.size] = var_0;
}

_id_2DF5( var_0, var_1, var_2 )
{
    if ( scripts\mp\utility\game::bot_is_fireteam_mode() )
        return 1;

    if ( _id_2DEE( var_0, "bots", undefined, var_1 ) )
        return 1;
    else if ( var_2 )
    {

    }

    return 0;
}

_id_2DEE( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;

    if ( var_0 == "specialist" )
        return 1;

    if ( !_id_2DEF( var_0, var_1 ) )
        return 0;

    if ( isdefined( var_3 ) )
    {
        var_4 = getsubstr( var_3, 11 );

        switch ( var_4 )
        {
            case "assault":
                if ( !scripts\mp\utility\game::_id_9D4E( var_0 ) )
                    return 0;

                break;
            case "support":
                if ( !scripts\mp\utility\game::_id_9F8E( var_0 ) )
                    return 0;

                break;
            case "specialist":
                if ( !scripts\mp\utility\game::_id_9F6F( var_0 ) )
                    return 0;

                break;
        }
    }

    return 1;
}

_id_2DEF( var_0, var_1 )
{
    if ( var_1 == "humans" )
        return isdefined( level._id_A6B2[var_0] ) && scripts\mp\utility\game::_id_7F44( var_0 ) != -1;
    else if ( var_1 == "bots" )
        return isdefined( level._id_A68C[var_0] );
}

_id_2ED1()
{
    self notify( "bot_watch_for_killstreak_use" );
    self endon( "bot_watch_for_killstreak_use" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "killstreak_use_finished" );
        scripts\mp\utility\game::_id_141A( "none" );
    }
}

_id_2DDB( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isdefined( level._id_A68C[var_0] ) )
        return 0;

    return 1;
}

_id_2D29( var_0 )
{
    var_1 = level._id_A68B[var_0];

    if ( !isdefined( var_1 ) )
        return 0;

    if ( isdefined( var_1 ) && !self [[ var_1 ]]() )
        return 0;

    return 1;
}

bot_think_killstreak()
{
    self notify( "bot_think_killstreak" );
    self endon( "bot_think_killstreak" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    while ( !isdefined( level._id_A68C ) )
        wait 0.05;

    childthread _id_2EA0();
    childthread _id_2ED1();

    for (;;)
    {
        if ( scripts\mp\bots\bots_util::_id_2D0A() )
        {
            var_0 = self.pers["killstreaks"];

            if ( isdefined( var_0 ) )
            {
                foreach ( var_2 in var_0 )
                {
                    if ( !isdefined( var_2 ) )
                        continue;

                    if ( isdefined( var_2._id_110EA ) && isdefined( self._id_2DF7 ) && isdefined( self._id_2DF7[var_2._id_110EA] ) && gettime() < self._id_2DF7[var_2._id_110EA] )
                        continue;

                    if ( var_2._id_269A )
                    {
                        var_3 = var_2._id_110EA;

                        if ( var_2._id_110EA == "all_perks_bonus" )
                            continue;

                        if ( scripts\mp\utility\game::_id_9F6F( var_2._id_110EA ) )
                        {
                            if ( !var_2._id_9E0B )
                                var_3 = "specialist";
                            else
                                continue;
                        }

                        var_2.weapon = scripts\mp\utility\game::_id_7F55( var_2._id_110EA );
                        var_4 = level._id_A68B[var_3];

                        if ( isdefined( var_4 ) && !self [[ var_4 ]]() )
                            continue;

                        if ( !scripts\mp\utility\game::_id_1314A( var_2._id_110EA, 1 ) )
                            continue;

                        var_5 = level._id_A68C[var_3];

                        if ( isdefined( var_5 ) )
                        {
                            var_6 = self [[ var_5 ]]( var_2, var_0, var_4, level._id_A68D[var_2._id_110EA] );

                            if ( !isdefined( var_6 ) || var_6 == 0 )
                            {
                                if ( !isdefined( self._id_2DF7 ) )
                                    self._id_2DF7 = [];

                                self._id_2DF7[var_2._id_110EA] = gettime() + 5000;
                            }
                        }
                        else
                        {
                            if ( level.gametype != "grnd" )
                            {

                            }

                            var_2._id_269A = 0;
                        }

                        break;
                    }
                }
            }
        }

        wait( randomfloatrange( 1.0, 2.0 ) );
    }
}

_id_2D24()
{
    return 0;
}

_id_2EA0()
{
    var_0 = scripts\mp\killstreaks\aalauncher::_id_7D8F();

    for (;;)
    {
        self waittill( "aa_launcher_fire" );
        var_1 = self getammocount( var_0 );

        if ( var_1 == 0 )
        {
            scripts\mp\utility\game::_id_141A( var_0 );
            var_2 = scripts\engine\utility::_id_13734( "LGM_player_allMissilesDestroyed", "enemy" );
            wait 0.5;
            scripts\mp\utility\game::_id_141A( "none" );
        }
    }
}

_id_2DF0()
{

}

_id_2D25()
{
    if ( !_id_18DB() )
        return 0;

    var_0 = _id_0D84::_id_6CAA( self, self.team );
    var_1 = gettime();

    foreach ( var_3 in var_0 )
    {
        if ( var_1 - var_3._id_0064 > 5000 )
            return 1;
    }

    return 0;
}

_id_18DB()
{
    if ( scripts\mp\utility\game::_id_9D31() )
        return 0;

    if ( _id_1325A() )
        return 0;

    return 1;
}

_id_1325A()
{
    return scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + 1 >= scripts\mp\utility\game::_id_B4D2();
}

_id_2D28()
{
    if ( isdefined( level._id_61AD ) )
        return 0;

    var_0 = level._id_C74B[self.team];

    if ( isdefined( level._id_115C9 ) && isdefined( level._id_115C9[var_0] ) && level._id_115C9[var_0] )
        return 0;

    return 1;
}

_id_2D26()
{
    if ( scripts\mp\utility\game::isusingremote() )
        return 0;

    if ( scripts\mp\killstreaks\ball_drone::_id_68C0() )
        return 0;

    if ( _id_1325A() )
        return 0;

    if ( isdefined( self._id_27D3 ) )
        return 0;

    return 1;
}

_id_2DF4( var_0, var_1, var_2, var_3 )
{
    self endon( "commander_took_over" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait( randomintrange( 3, 5 ) );

    if ( !scripts\mp\bots\bots_util::_id_2D0A() )
        return 1;

    if ( isdefined( var_2 ) && !self [[ var_2 ]]() )
        return 0;

    _id_2EA5( var_0, var_1, var_0.weapon );
    return 1;
}

_id_2DE6( var_0, var_1, var_2, var_3 )
{
    _id_2DE5( var_0, var_1, var_2, var_3, "anywhere" );
}

_id_2DE8( var_0, var_1, var_2, var_3 )
{
    _id_2DE5( var_0, var_1, var_2, var_3, "outside" );
}

_id_2DE7( var_0, var_1, var_2, var_3 )
{
    _id_2DE5( var_0, var_1, var_2, var_3, "hidden" );
}

_id_2DE5( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "commander_took_over" );
    wait( randomintrange( 2, 4 ) );

    if ( !isdefined( var_4 ) )
        var_4 = "anywhere";

    if ( !scripts\mp\bots\bots_util::_id_2D0A() )
        return 1;

    if ( isdefined( var_2 ) && !self [[ var_2 ]]() )
        return 0;

    var_5 = self getweaponammoclip( var_0.weapon ) + self getweaponammostock( var_0.weapon );

    if ( var_5 == 0 )
    {
        foreach ( var_7 in var_1 )
        {
            if ( isdefined( var_7._id_110EA ) && var_7._id_110EA == var_0._id_110EA )
                var_7._id_269A = 0;
        }

        return 1;
    }

    var_9 = undefined;

    if ( var_4 == "outside" )
    {
        var_10 = [];
        var_11 = scripts\mp\bots\bots_util::_id_2DB1( 750, 0.6, 1 );

        foreach ( var_13 in var_11 )
        {
            if ( nodeexposedtosky( var_13 ) )
                var_10 = scripts\engine\utility::_id_2279( var_10, var_13 );
        }

        if ( var_11.size > 5 && var_10.size > var_11.size * 0.6 )
        {
            var_15 = scripts\engine\utility::_id_782F( self.origin, var_10, undefined, undefined, undefined, 150 );

            if ( var_15.size > 0 )
                var_9 = scripts\engine\utility::_id_DC6B( var_15 );
            else
                var_9 = scripts\engine\utility::_id_DC6B( var_10 );
        }
    }
    else if ( var_4 == "hidden" )
    {
        var_16 = getnodesinradius( self.origin, 256, 0, 40 );
        var_17 = self getnearestnode();

        if ( isdefined( var_17 ) )
        {
            var_18 = [];

            foreach ( var_13 in var_16 )
            {
                if ( nodesvisible( var_17, var_13, 1 ) )
                    var_18 = scripts\engine\utility::_id_2279( var_18, var_13 );
            }

            var_9 = self botnodepick( var_18, 1, "node_hide" );
        }
    }

    if ( isdefined( var_9 ) || var_4 == "anywhere" )
    {
        self botsetflag( "disable_movement", 1 );

        if ( isdefined( var_9 ) )
            self botlookatpoint( var_9.origin, 2.45, "script_forced" );

        _id_2EA5( var_0, var_1, var_0.weapon );
        wait 2.0;
        self botpressbutton( "attack" );
        wait 1.5;
        scripts\mp\utility\game::_id_141A( "none" );
        self botsetflag( "disable_movement", 0 );
    }

    return 1;
}

_id_2EA5( var_0, var_1, var_2 )
{
    _id_2E29( var_0, var_1 );
}

_id_2E29( var_0, var_1 )
{
    if ( isdefined( var_0._id_9E10 ) && var_0._id_9E10 )
    {
        self notify( "ks_action_6" );
        return;
    }

    for ( var_2 = 1; var_2 < 4; var_2++ )
    {
        if ( isdefined( var_1[var_2] ) )
        {
            if ( isdefined( var_1[var_2]._id_110EA ) )
            {
                if ( var_1[var_2]._id_110EA == var_0._id_110EA )
                {
                    var_3 = var_2 + 2;
                    self notify( "ks_action_" + var_3 );
                    return;
                }
            }
        }
    }
}

_id_2DE4( var_0, var_1, var_2, var_3 )
{
    self endon( "commander_took_over" );
    wait( randomintrange( 3, 5 ) );

    if ( !scripts\mp\bots\bots_util::_id_2D0A() )
        return;

    var_4 = getzonenearest( self.origin );

    if ( !isdefined( var_4 ) )
        return;

    self botsetflag( "disable_movement", 1 );
    _id_2EA5( var_0, var_1, var_0.weapon );
    wait 2;
    var_5 = level._id_13FBD;
    var_6 = -1;
    var_7 = 0;
    var_8 = [];
    var_9 = randomfloat( 100 ) > 50;

    for ( var_10 = 0; var_10 < var_5; var_10++ )
    {
        if ( var_9 )
            var_11 = var_5 - 1 - var_10;
        else
            var_11 = var_10;

        if ( var_11 != var_4 && botzonegetindoorpercent( var_11 ) < 0.25 )
        {
            var_12 = botzonegetcount( var_11, self.team, "enemy_predict" );

            if ( var_12 > var_7 )
            {
                var_6 = var_11;
                var_7 = var_12;
            }

            var_8 = scripts\engine\utility::_id_2279( var_8, var_11 );
        }
    }

    if ( var_6 >= 0 )
        var_13 = getzoneorigin( var_6 );
    else if ( var_8.size > 0 )
        var_13 = getzoneorigin( scripts\engine\utility::_id_DC6B( var_8 ) );
    else
        var_13 = getzoneorigin( randomint( level._id_13FBD ) );

    var_14 = ( randomfloatrange( -500, 500 ), randomfloatrange( -500, 500 ), 0 );
    self notify( "confirm_location", var_13 + var_14, randomintrange( 0, 360 ) );
    wait 1.0;
    self botsetflag( "disable_movement", 0 );
}

bot_think_watch_aerial_killstreak()
{
    self notify( "bot_think_watch_aerial_killstreak" );
    self endon( "bot_think_watch_aerial_killstreak" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( !isdefined( level._id_A8C2 ) )
        level._id_A8C2 = -10000;

    level._id_A68F["allies"] = [];
    level._id_A68F["axis"] = [];
    var_0 = 0;
    var_1 = randomfloatrange( 0.05, 4.0 );

    for (;;)
    {
        wait( var_1 );
        var_1 = randomfloatrange( 0.05, 4.0 );

        if ( scripts\mp\bots\bots_util::bot_is_remote_or_linked() )
            continue;

        if ( self botgetdifficultysetting( "strategyLevel" ) == 0 )
            continue;

        var_2 = 0;

        if ( isdefined( level._id_3F14 ) && level._id_3F14.team != self.team )
            var_2 = 1;

        if ( isdefined( level._id_AAC8 ) && level._id_AAC8.team != self.team )
            var_2 = 1;

        if ( isdefined( level._id_8D79[scripts\engine\utility::_id_7984( self.team )] ) )
            var_2 = 1;

        if ( _id_64E8( self.team ) )
        {
            var_2 = 1;
            _id_1286B( "mortar_strike", ::_id_64E8 );
        }

        if ( _id_6527( self.team ) )
        {
            var_2 = 1;
            _id_1286B( "switchblade", ::_id_6527 );
        }

        if ( _id_64EC( self.team ) )
        {
            var_2 = 1;
            _id_1286B( "odin_assault", ::_id_64EC );
        }

        var_3 = _id_7985();

        if ( isdefined( var_3 ) )
        {
            var_4 = self geteye();

            if ( scripts\engine\utility::within_fov( var_4, self getplayerangles(), var_3._id_24D1.origin, self botgetfovdot() ) )
            {
                if ( sighttracepassed( var_4, var_3._id_24D1.origin, 0, self, var_3._id_24D1 ) )
                    badplace_cylinder( "vanguard_" + var_3 getentitynumber(), var_1 + 0.5, var_3._id_24D1.origin, 200, 100, self.team );
            }
        }

        if ( !var_0 && var_2 )
        {
            var_0 = 1;
            self botsetflag( "hide_indoors", 1 );
        }

        if ( var_0 && !var_2 )
        {
            var_0 = 0;
            self botsetflag( "hide_indoors", 0 );
        }
    }
}

_id_1286B( var_0, var_1 )
{
    if ( !isdefined( level._id_A68F[self.team][var_0] ) )
        level._id_A68F[self.team][var_0] = 0;

    if ( !level._id_A68F[self.team][var_0] )
    {
        level._id_A68F[self.team][var_0] = 1;
        level thread _id_B96A( self.team, var_0, var_1 );
    }
}

_id_B96A( var_0, var_1, var_2 )
{
    var_3 = 0.5;

    while ( [[ var_2 ]]( var_0 ) )
    {
        if ( gettime() > level._id_A8C2 + 4000 )
        {
            badplace_global( "", 5.0, var_0, "only_sky" );
            level._id_A8C2 = gettime();
        }

        wait( var_3 );
    }

    level._id_A68F[var_0][var_1] = 0;
}

_id_64E8( var_0 )
{
    if ( isdefined( level._id_1A69 ) && level._id_1A69 )
    {
        if ( var_0 != level._id_1A6A )
            return 1;
    }

    return 0;
}

_id_6527( var_0 )
{
    if ( isdefined( level._id_DF80 ) )
    {
        foreach ( var_2 in level._id_E5DE )
        {
            if ( isdefined( var_2.type ) && var_2.type == "remote" && var_2.team != var_0 )
                return 1;
        }
    }

    return 0;
}

_id_64EC( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( !level.teambased || isdefined( var_2.team ) && var_0 != var_2.team )
        {
            if ( isdefined( var_2._id_C2D3 ) && var_2._id_C2D3._id_C322 == "odin_assault" && gettime() - var_2._id_C2D3._id_0064 > 3000 )
                return 1;
        }
    }

    return 0;
}

_id_7985()
{
    foreach ( var_1 in level.players )
    {
        if ( !level.teambased || isdefined( var_1.team ) && self.team != var_1.team )
        {
            if ( isdefined( var_1._id_DF8A ) && var_1._id_DF8A.helitype == "remote_uav" )
                return var_1._id_DF8A;
        }
    }

    return undefined;
}

_id_9E66( var_0 )
{
    return isdefined( level._id_2EDA ) && isdefined( level._id_2EDA[var_0] ) && level._id_2EDA[var_0];
}

_id_2BBA( var_0 )
{
    level._id_2EDA[var_0] = 1;
}

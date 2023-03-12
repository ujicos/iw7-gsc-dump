// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( !isdefined( level._id_D671 ) )
    {
        level._id_D671 = [];
        level._id_773B = [];
    }
}

_id_FB16( var_0 )
{
    var_1 = level._id_D671[var_0];
    self _meth_831D( "flash" );
    scripts\mp\utility\game::_id_12C6( var_1.weaponname, 0 );
    self _meth_817C( var_1.weaponname );

    if ( !isdefined( self._id_522E ) )
        self._id_522E = [];

    thread _id_B9DE( var_0 );
}

_id_12D67( var_0 )
{
    self notify( "end_monitorUse_" + var_0 );
}

_id_51B7( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_3 in level.players )
    {
        if ( isdefined( var_3 ) && isdefined( var_3._id_94C7 ) )
            var_3._id_94C7[var_1] = undefined;
    }

    _id_DEF2( var_0, var_1, undefined );
    var_0 notify( "death" );
    var_0 delete();
}

_id_DEF2( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) && var_2 )
        self._id_522E[var_1] = var_0;
    else
    {
        self._id_522E[var_1] = undefined;
        var_2 = undefined;
    }

    var_3 = level._id_773B[var_1];

    if ( !isdefined( var_3 ) )
    {
        level._id_773B[var_1] = [];
        var_3 = level._id_773B[var_1];
    }

    var_4 = _id_7F0C( var_0 );
    var_3[var_4] = var_2;
}

_id_B9DE( var_0 )
{
    self notify( "end_monitorUse_" + var_0 );
    self endon( "end_monitorUse_" + var_0 );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_1 = level._id_D671[var_0];

    for (;;)
    {
        self waittill( "grenade_fire", var_2, var_3 );

        if ( var_3 == var_1.weaponname || var_3 == var_0 )
        {
            if ( !isalive( self ) )
            {
                var_2 delete();
                return;
            }

            if ( _id_3E1B( var_2, var_1._id_CC26 ) )
            {
                var_4 = self._id_522E[var_0];

                if ( isdefined( var_4 ) )
                    _id_51B7( var_4, var_0 );

                var_5 = _id_108EA( var_0, var_2.origin );
                var_6 = var_2 _meth_8138();

                if ( isdefined( var_6 ) )
                    var_5 linkto( var_6 );

                if ( isdefined( var_2 ) )
                    var_2 delete();

                continue;
            }

            self setweaponammostock( var_1.weaponname, self getweaponammostock( "trophy_mp" ) + 1 );
        }
    }
}

_id_3E1B( var_0, var_1 )
{
    var_0 hide();
    var_0 waittill( "missile_stuck", var_2 );

    if ( var_1 * var_1 < distancesquared( var_0.origin, self.origin ) )
    {
        var_3 = bullettrace( self.origin, self.origin - ( 0, 0, var_1 ), 0, self );

        if ( var_3["fraction"] == 1 )
        {
            var_0 delete();
            return 0;
        }

        var_0.origin = var_3["position"];
    }

    var_0 show();
    return 1;
}

_id_108EA( var_0, var_1 )
{
    var_2 = level._id_D671[var_0];
    var_3 = spawn( "script_model", var_1 );
    var_3.health = var_2.health;
    var_3.team = self.team;
    var_3.owner = self;
    var_3 setcandamage( 1 );
    var_3 setmodel( var_2._id_CC12 );

    if ( level.teambased )
        var_3 scripts\mp\entityheadicons::_id_F877( self.team, ( 0, 0, var_2._id_8C79 ) );
    else
        var_3 scripts\mp\entityheadicons::_id_F7F2( self, ( 0, 0, var_2._id_8C79 ) );

    var_3 thread _id_13AE2( self, var_0 );
    var_3 thread _id_139E5( self, var_0 );
    var_3 thread _id_13B9C( self, var_0 );
    var_3 thread scripts\mp\utility\game::_id_C18A( self );

    if ( isdefined( var_2._id_C4F0 ) )
        var_3 [[ var_2._id_C4F0 ]]( self, var_0 );

    var_3 thread scripts\mp\weapons::_id_4988( var_2._id_2C68, "tag_origin", self );
    _id_DEF2( var_3, var_0, 1 );
    wait 0.05;

    if ( isdefined( var_3 ) && var_3 scripts\mp\utility\game::_id_11A42() )
        var_3 notify( "death" );

    return var_3;
}

_id_13AE2( var_0, var_1 )
{
    self endon( "death" );
    level endon( "game_ended" );

    if ( scripts\mp\utility\game::bot_is_fireteam_mode() )
        var_0 waittill( "killstreak_disowned" );
    else
        var_0 scripts\engine\utility::_id_13762( "killstreak_disowned", "death" );

    var_0 thread _id_51B7( self, var_1 );
}

_id_139E5( var_0, var_1 )
{
    self._id_773C = var_1;
    var_2 = level._id_D671[var_1];
    scripts\mp\damage::monitordamage( var_2.health, var_2._id_4D4A, ::_id_898F, ::_id_B938, 0 );
}

_id_B938( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;
    var_5 = scripts\mp\damage::_id_89C3( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8999( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_89C6( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_89AC( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8975( var_1, var_2, var_5 );
    return var_5;
}

_id_898F( var_0, var_1, var_2 )
{
    var_3 = self.owner;
    var_4 = level._id_D671[self._id_773C];

    if ( isdefined( var_3 ) && var_0 != var_3 )
        var_0 notify( "destroyed_equipment" );

    if ( isdefined( var_4._id_C4F1 ) )
        var_3 [[ var_4._id_C4F1 ]]( self, self._id_773C );

    var_3 thread _id_51B7( self, self._id_773C );
}

_id_13B9C( var_0, var_1 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_2 = level._id_D671[var_1];
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( var_2._id_13092 );
    scripts\mp\utility\game::_id_F838( var_0 );

    for (;;)
    {
        self waittill( "trigger", var_3 );
        var_3 playlocalsound( var_2._id_130D9 );

        if ( var_3 getammocount( var_2.weaponname ) == 0 && !var_3 scripts\mp\utility\game::isjuggernaut() )
            var_3 _id_FB16( var_1 );

        var_3 thread _id_51B7( self, var_1 );
    }
}

_id_7737()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );
    var_0 = randomfloat( 0.5 );
    wait( var_0 );
    self._id_94C7 = [];

    for (;;)
    {
        wait 0.05;

        if ( level._id_773B.size > 0 || self._id_94C7.size > 0 )
        {
            foreach ( var_2 in level._id_D671 )
                _id_3DE7( var_2._id_773C );
        }
    }
}

_id_3DE7( var_0 )
{
    var_1 = level._id_773B[var_0];

    if ( isdefined( var_1 ) )
    {
        var_2 = level._id_D671[var_0];
        var_3 = var_2._id_2044 * var_2._id_2044;
        var_4 = undefined;

        foreach ( var_6 in var_1 )
        {
            if ( isdefined( var_6 ) && scripts\mp\utility\game::isreallyalive( var_6 ) )
            {
                if ( level.teambased && _id_B3E5( var_6.team, self.team, var_2._id_11589 ) || !level.teambased && _id_B3E4( var_6.owner, self, var_2._id_11589 ) )
                {
                    var_7 = distancesquared( var_6.origin, self.origin );

                    if ( var_7 < var_3 )
                    {
                        var_4 = var_6;
                        break;
                    }
                }
            }
        }

        var_9 = isdefined( var_4 );
        var_10 = isdefined( self._id_94C7[var_0] );

        if ( var_9 && !var_10 )
            self [[ var_2._id_C510 ]]();
        else if ( !var_9 && var_10 )
            self [[ var_2._id_C51E ]]();

        self._id_94C7[var_0] = var_4;
    }
}

_id_B3E5( var_0, var_1, var_2 )
{
    return var_2 == "all" || var_2 == "friendly" && var_0 == var_1 || var_2 == "enemy" && var_0 != var_1;
}

_id_B3E4( var_0, var_1, var_2 )
{
    return var_2 == "all" || var_2 == "friendly" && var_0 == var_1 || var_2 == "enemy" && var_0 != var_1;
}

_id_7F0C( var_0 )
{
    return var_0.owner.guid + var_0._id_0064;
}

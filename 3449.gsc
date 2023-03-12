// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_2E53()
{
    level._id_2D1C = [];
    level._id_2D1C["power_domeshield"] = _id_0D77::_id_8995;
    level._id_2D1C["power_overCharge"] = ::_id_5234;
    level._id_2D1C["power_adrenaline"] = ::_id_5234;
    level._id_2D1C["power_deployableCover"] = ::_id_8991;
    level._id_2D1C["power_rewind"] = _id_0D78::_id_89DC;
    level._id_2D1C["power_adrenaline"] = ::_id_5234;
    level._id_2D1C["power_multiVisor"] = ::_id_5234;
    level._id_2D1C["power_blinkKnife"] = ::_id_897E;
}

_id_2D5A()
{
    self notify( "bot_detect_friendly_domeshields" );
    self endon( "bot_detect_friendly_domeshields" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    var_0 = 0;
    self botsetflag( "disable_attack", 0 );

    for (;;)
    {
        if ( var_0 )
            wait 0.05;
        else
            wait 0.5;

        if ( var_0 )
        {
            self botsetflag( "disable_attack", 0 );
            var_0 = 0;
        }

        if ( isdefined( self._id_010C ) )
        {
            var_1 = self geteye();
            var_2 = self._id_010C geteye();
            var_3 = bullettrace( var_1, var_2, 0, self );
            var_4 = var_3["entity"];

            if ( !isdefined( var_4 ) || !isdefined( var_4._id_2B0E ) )
                continue;

            if ( !isdefined( var_4.owner ) )
                continue;

            if ( var_4.owner.team == self.team )
            {
                self botsetflag( "disable_attack", 1 );
                var_0 = 1;
                continue;
            }
        }
    }
}

bot_think_powers()
{
    self notify( "bot_think_powers" );
    self endon( "bot_think_powers" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    thread _id_2D5A();

    if ( isdefined( self._id_D782 ) && self._id_D782.size > 0 )
    {
        if ( isdefined( self._id_AE7B ) && isdefined( self._id_D782[self._id_AE7B] ) )
        {
            if ( isdefined( level._id_2D1C[self._id_AE7B] ) )
                self thread [[ level._id_2D1C[self._id_AE7B] ]]( self._id_AE7B, "primary" );
        }

        if ( isdefined( self._id_AE7D ) && isdefined( self._id_D782[self._id_AE7D] ) )
        {
            if ( isdefined( level._id_2D1C[self._id_AE7D] ) )
                self thread [[ level._id_2D1C[self._id_AE7D] ]]( self._id_AE7D, "secondary" );
        }
    }

    for (;;)
    {
        self waittill( "power_available", var_0, var_1 );

        if ( isdefined( level._id_2D1C[var_0] ) )
            self thread [[ level._id_2D1C[var_0] ]]( var_0, var_1 );
    }
}

_id_1384F( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "powers_cleanUp" );

    for (;;)
    {
        self waittill( "power_activated", var_2, var_3 );

        if ( var_2 == var_0 && var_3 == var_1 )
            break;
    }
}

_id_5234( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "powers_cleanUp" );

    for (;;)
    {
        while ( !isdefined( self._id_010C ) || !isalive( self._id_010C ) )
            wait 0.1;

        if ( !self botcanseeentity( self._id_010C ) )
        {
            wait 0.1;
            continue;
        }

        var_2 = 0;
        var_3 = 1400;
        var_4 = distance( self.origin, self._id_010C.origin );

        if ( self _meth_8520() )
            var_2 = 700;

        if ( var_2 != 0 )
        {
            if ( var_4 < var_2 )
            {
                wait 0.5;
                continue;
            }
        }

        if ( var_4 > var_3 )
        {
            wait 0.5;
            continue;
        }

        break;
    }

    var_5 = var_1 + "_power_ready";
    self botsetflag( var_5, 1 );
    _id_1384F( var_0, var_1 );
    self botsetflag( var_5, 0 );
}

_id_897E( var_0, var_1 )
{
    var_2 = self botgetdifficultysetting( "throwKnifeChance" );
    self botsetdifficultysetting( "throwKnifeChance", 0.25 );
}

_id_8BEE()
{
    if ( !isalive( self ) || !isdefined( self._id_010C ) )
        return 0;

    if ( self botcanseeentity( self._id_010C ) && self _meth_8520() )
        return 1;

    return 0;
}

_id_130C0( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "powers_cleanUp" );
    var_2 = var_1 + "_power_ready";
    self botsetflag( var_2, 1 );
    _id_1384F( var_0, var_1 );
    self botsetflag( var_2, 0 );
}

_id_9D7E()
{
    if ( isdefined( self._id_11A46 ) )
    {
        foreach ( var_1 in self._id_11A46 )
        {
            if ( !isdefined( var_1._id_130AC ) || !isdefined( var_1._id_130AC._id_92B8 ) )
                continue;

            if ( var_1._id_130AC._id_92B8 == "domFlag" )
            {
                if ( scripts\mp\bots\gametype_dom::_id_2DD6( var_1 ) )
                    return 1;
            }
        }
    }

    return 0;
}

_id_130C1( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "domeshield_used" );
    self endon( "powers_cleanUp" );

    if ( !isdefined( var_3 ) )
        var_3 = ::_id_130C0;

    for (;;)
    {
        wait 0.05;

        while ( !_id_8BEE() && !_id_9D7E() )
            wait 0.25;

        if ( !_id_9D7E() )
        {
            for ( var_4 = self getcurrentweaponclipammo(); var_4 > 0; var_4 = self getcurrentweaponclipammo() )
            {
                wait 0.05;

                if ( !_id_8BEE() )
                    break;
            }
        }

        if ( _id_8BEE() || _id_9D7E() )
        {
            if ( isdefined( self._id_010C ) )
            {
                var_5 = distance( self.origin, self._id_010C.origin );

                if ( var_5 < var_2 )
                {
                    wait 0.25;
                    continue;
                }
            }

            self thread [[ var_3 ]]( var_0, var_1 );
            break;
        }
    }
}

_id_130C2( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "domeshield_used" );
    self endon( "powers_cleanUp" );

    if ( !isdefined( var_4 ) )
        var_4 = ::_id_130C0;

    for (;;)
    {
        self waittill( "damage" );

        if ( isdefined( self._id_010C ) )
        {
            var_5 = distancesquared( self.origin, self._id_010C.origin );

            if ( var_5 < var_2 * var_2 )
                continue;
        }

        if ( self.health < var_3 )
        {
            self thread [[ var_4 ]]( var_0, var_1 );
            break;
        }
    }
}

_id_8991( var_0, var_1 )
{
    thread _id_130C1( var_0, var_1, 400, ::_id_130C0 );
    thread _id_130C2( var_0, var_1, 450, 80, ::_id_130C0 );
}

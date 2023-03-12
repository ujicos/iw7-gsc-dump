// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_6EAD( var_0 )
{
    self._id_6EB4 = var_0;
    self._id_6EB3 = [];
    thread _id_A72B();
}

_id_6EAE( var_0 )
{
    var_1 = "tag_origin";

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    playloopsound( self gettagorigin( var_1 ), "ks_warden_flares" );

    for ( var_2 = 0; var_2 < 10; var_2++ )
    {
        if ( !isdefined( self ) )
            return;

        playfxontag( level._effect["vehicle_flares"], self, var_1 );
        wait 0.15;
    }
}

_id_6EA0()
{
    var_0 = spawn( "script_origin", self.origin + ( 0, 0, -256 ) );
    var_0.angles = self.angles;
    var_0 movegravity( ( 0, 0, -1 ), 5.0 );
    self._id_6EB3[self._id_6EB3.size] = var_0;
    var_0 thread _id_6E9F( 5.0, 2.0, self );
    playloopsound( var_0.origin, "veh_helo_flares_npc" );
    return var_0;
}

_id_6E9F( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) && isdefined( var_2 ) )
    {
        var_0 -= var_1;
        wait( var_1 );

        if ( isdefined( var_2 ) )
            var_2._id_6EB3 = scripts\engine\utility::array_remove( var_2._id_6EB3, self );
    }

    wait( var_0 );
    self delete();
}

_id_6EA9( var_0 )
{
    return var_0._id_6EB4;
}

_id_6E9D( var_0 )
{
    _id_6E9E( var_0 );
    return var_0._id_6EB4 > 0 || var_0._id_6EB3.size > 0;
}

_id_6EA8( var_0 )
{
    var_0._id_6EB4--;
    var_0 thread _id_6EAE();
    var_1 = var_0 _id_6EA0();
    return var_1;
}

_id_6E9E( var_0 )
{
    var_0._id_6EB3 = scripts\engine\utility::_id_22BC( var_0._id_6EB3 );
}

_id_6EA7( var_0 )
{
    _id_6E9E( var_0 );
    var_1 = undefined;

    if ( var_0._id_6EB3.size > 0 )
        var_1 = var_0._id_6EB3[var_0._id_6EB3.size - 1];

    return var_1;
}

_id_A72B()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self endon( "helicopter_done" );

    while ( _id_6E9D( self ) )
    {
        level waittill( "laserGuidedMissiles_incoming", var_0, var_1, var_2 );

        if ( !isdefined( var_2 ) || var_2 != self )
            continue;

        if ( !isarray( var_1 ) )
            var_1 = [ var_1 ];

        foreach ( var_4 in var_1 )
        {
            if ( isvalidmissile( var_4 ) )
                level thread _id_A72C( var_4, var_0, var_0.team, var_2 );
        }
    }
}

_id_A72C( var_0, var_1, var_2, var_3 )
{
    var_3 endon( "death" );
    var_0 endon( "death" );
    var_0 endon( "missile_targetChanged" );

    while ( _id_6E9D( var_3 ) )
    {
        if ( !isdefined( var_3 ) || !isvalidmissile( var_0 ) )
            break;

        var_4 = var_3 getpointinbounds( 0, 0, 0 );

        if ( distancesquared( var_0.origin, var_4 ) < 4000000 )
        {
            var_5 = _id_6EA7( var_3 );

            if ( !isdefined( var_5 ) )
                var_5 = _id_6EA8( var_3 );

            var_0 _meth_8206( var_5 );
            var_0 notify( "missile_pairedWithFlare" );
            break;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_6EAA( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self endon( "helicopter_done" );

    for (;;)
    {
        level waittill( "sam_fired", var_1, var_2, var_3 );

        if ( !isdefined( var_3 ) || var_3 != self )
            continue;

        if ( isdefined( var_0 ) )
        {
            level thread [[ var_0 ]]( var_1, var_1.team, var_3, var_2 );
            continue;
        }

        level thread _id_6EB1( var_1, var_1.team, var_3, var_2 );
    }
}

_id_6EB1( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );
    var_2 endon( "death" );

    for (;;)
    {
        var_4 = var_2 getpointinbounds( 0, 0, 0 );
        var_5 = [];

        for ( var_6 = 0; var_6 < var_3.size; var_6++ )
        {
            if ( isdefined( var_3[var_6] ) )
                var_5[var_6] = distance( var_3[var_6].origin, var_4 );
        }

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
        {
            if ( isdefined( var_5[var_6] ) )
            {
                if ( var_5[var_6] < 4000 && var_2._id_6EB4 > 0 )
                {
                    var_2._id_6EB4--;
                    var_2 thread _id_6EAE();
                    var_7 = var_2 _id_6EA0();

                    for ( var_8 = 0; var_8 < var_3.size; var_8++ )
                    {
                        if ( isdefined( var_3[var_8] ) )
                        {
                            var_3[var_8] _meth_8206( var_7 );
                            var_3[var_8] notify( "missile_pairedWithFlare" );
                        }
                    }

                    return;
                }
            }
        }

        wait 0.05;
    }
}

_id_6EAB( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self endon( "helicopter_done" );

    for (;;)
    {
        level waittill( "stinger_fired", var_2, var_3, var_4 );

        if ( !isdefined( var_4 ) || var_4 != self )
            continue;

        if ( isdefined( var_0 ) )
        {
            var_3 thread [[ var_0 ]]( var_2, var_2.team, var_4, var_1 );
            continue;
        }

        var_3 thread _id_6EB2( var_2, var_2.team, var_4, var_1 );
    }
}

_id_6EB2( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );

    for (;;)
    {
        if ( !isdefined( var_2 ) )
            break;

        var_4 = var_2 getpointinbounds( 0, 0, 0 );
        var_5 = distance( self.origin, var_4 );

        if ( var_5 < 4000 && var_2._id_6EB4 > 0 )
        {
            var_2._id_6EB4--;
            var_2 thread _id_6EAE( var_3 );
            var_6 = var_2 _id_6EA0();
            self _meth_8206( var_6 );
            self notify( "missile_pairedWithFlare" );
            return;
        }

        wait 0.05;
    }
}

_id_A730( var_0, var_1, var_2, var_3 )
{
    self._id_6EB4 = var_0;
    self._id_6EB3 = [];

    if ( isdefined( var_2 ) )
        self.owner setclientomnvar( var_2, var_0 );

    thread _id_A72F( var_1, var_2 );
    thread _id_A72D( var_3 );
}

_id_A72F( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self endon( "helicopter_done" );

    if ( !isai( self.owner ) )
        self.owner notifyonplayercommand( "manual_flare_popped", var_0 );

    while ( _id_6EA9( self ) )
    {
        self.owner waittill( "manual_flare_popped" );
        var_2 = _id_6EA8( self );

        if ( isdefined( var_2 ) && isdefined( self.owner ) && !isai( self.owner ) )
        {
            self.owner playlocalsound( "veh_helo_flares_plr" );

            if ( isdefined( var_1 ) )
                self.owner setclientomnvar( var_1, _id_6EA9( self ) );
        }
    }
}

_id_A72D( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self endon( "helicopter_done" );

    while ( _id_6E9D( self ) )
    {
        self waittill( "targeted_by_incoming_missile", var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        self.owner playlocalsound( "missile_incoming" );
        self.owner thread _id_A731( self, "missile_incoming" );

        if ( isdefined( var_0 ) )
        {
            var_2 = vectornormalize( var_1[0].origin - self.origin );
            var_3 = vectornormalize( anglestoright( self.angles ) );
            var_4 = vectordot( var_2, var_3 );
            var_5 = 1;

            if ( var_4 > 0 )
                var_5 = 2;
            else if ( var_4 < 0 )
                var_5 = 3;

            self.owner setclientomnvar( var_0, var_5 );
        }

        foreach ( var_7 in var_1 )
        {
            if ( isvalidmissile( var_7 ) )
                thread _id_A72E( var_7 );
        }
    }
}

_id_A72E( var_0 )
{
    self endon( "death" );
    var_0 endon( "death" );

    for (;;)
    {
        if ( !isdefined( self ) || !isvalidmissile( var_0 ) )
            break;

        var_1 = self getpointinbounds( 0, 0, 0 );

        if ( distancesquared( var_0.origin, var_1 ) < 4000000 )
        {
            var_2 = _id_6EA7( self );

            if ( isdefined( var_2 ) )
            {
                var_0 _meth_8206( var_2 );
                var_0 notify( "missile_pairedWithFlare" );
                self.owner stopolcalsound( "missile_incoming" );
                break;
            }
        }

        scripts\engine\utility::waitframe();
    }
}

_id_A731( var_0, var_1 )
{
    self endon( "disconnect" );
    var_0 waittill( "death" );
    self stopolcalsound( var_1 );
}

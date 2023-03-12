// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{

}

_id_1768( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( var_4 == 0 )
        var_4 = undefined;

    if ( !isdefined( self._id_ACB1 ) || self._id_ACB1.size == 0 )
    {
        var_6 = [];
        var_6[0] = spawnstruct();
        self._id_ACB1 = var_6;
    }
    else
    {
        var_7 = scripts\mp\utility\game::_id_403F( self._id_ACB1 );
        self._id_ACB1 = var_7;
        self._id_ACB1[self._id_ACB1.size] = spawnstruct();
    }

    self._id_ACB1[self._id_ACB1.size - 1]._id_AAC5 = var_0;
    self._id_ACB1[self._id_ACB1.size - 1]._id_DAF8 = var_1;
    self._id_ACB1[self._id_ACB1.size - 1]._id_D925 = var_2;
    self._id_ACB1[self._id_ACB1.size - 1]._id_636E = var_3;
    self._id_ACB1[self._id_ACB1.size - 1]._id_1190D = gettime();
    self._id_ACB1[self._id_ACB1.size - 1]._id_68D9 = 0;
    self._id_ACB1[self._id_ACB1.size - 1]._id_636F = var_5;

    if ( isdefined( var_4 ) )
        self._id_ACB1[self._id_ACB1.size - 1].time = var_4 * 1000;
    else
        self._id_ACB1[self._id_ACB1.size - 1].time = undefined;

    if ( isdefined( var_3 ) && var_3 )
        thread _id_6336( self._id_ACB1[self._id_ACB1.size - 1] );

    if ( isdefined( var_5 ) )
        thread _id_635B( var_5, self._id_ACB1[self._id_ACB1.size - 1] );

    thread _id_B2EE();
}

_id_B2EE()
{
    self notify( "manageLightBarStack" );
    self endon( "manageLightBarStack" );
    self endon( "disconnect" );

    for (;;)
    {
        wait 0.05;

        if ( self._id_ACB1.size > 1 )
        {
            var_0 = _id_E17F( self._id_ACB1 );
            var_1 = scripts\engine\utility::_id_22C3( var_0, ::_id_9BFF );
        }
        else
            var_1 = self._id_ACB1;

        if ( var_1.size == 0 )
            return;

        self._id_ACB1 = var_1;
        var_2 = var_1[0];

        if ( var_2._id_68D9 )
            continue;

        var_3 = !isdefined( self._id_ACB1[self._id_ACB1.size - 1].time );
        var_4 = 0;

        if ( !var_3 )
        {
            var_5 = gettime() - var_2._id_1190D;
            var_4 = var_2.time - var_5;
            var_4 /= 1000;

            if ( var_4 <= 0 )
            {
                self._id_ACB1[0] notify( "removed" );
                self._id_ACB1[0] = undefined;
                _id_4041();
                _id_B2EE();
            }
        }

        if ( var_3 )
        {
            if ( var_2._id_636E )
            {
                var_2 notify( "executing" );
                var_2._id_68D9 = 1;
                thread _id_F464( var_2._id_AAC5, var_2._id_DAF8 );
            }
            else
                thread _id_F463( var_2._id_AAC5, var_2._id_DAF8 );

            continue;
        }

        if ( var_2._id_636E )
        {
            var_2 notify( "executing" );
            var_2._id_68D9 = 1;
            thread _id_F460( var_2._id_AAC5, var_2._id_DAF8, var_4 );
            continue;
        }

        thread _id_F45F( var_2._id_AAC5, var_2._id_DAF8, var_4 );
    }
}

_id_4041()
{
    var_0 = scripts\mp\utility\game::_id_403F( self._id_ACB1 );
    self._id_ACB1 = var_0;
}

_id_E17F( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( !isdefined( var_3.time ) )
        {
            var_1[var_1.size] = var_3;
            continue;
        }

        var_4 = gettime() - var_3._id_1190D;
        var_5 = var_3.time - var_4;
        var_5 /= 1000;

        if ( var_5 > 0 )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_9BFF( var_0, var_1 )
{
    return var_0._id_D925 > var_1._id_D925;
}

_id_F45C( var_0, var_1 )
{
    _id_F465( var_1 );
    _id_F45D( var_0 );
    _id_F462();
}

_id_F45F( var_0, var_1, var_2 )
{
    self notify( "set_lightbar_for_time" );
    self endon( "set_lightbar_for_time" );
    _id_F465( var_1 );
    _id_F45D( var_0 );
    _id_F462();
    wait( var_2 );

    if ( !isdefined( self ) )
        return;

    _id_F461();
    self._id_ACB1 = undefined;
    _id_4041();
}

_id_F463( var_0, var_1 )
{
    self notify( "set_lightbar" );
    self endon( "set_lightbar" );
    _id_F465( var_1 );
    _id_F45D( var_0 );
    _id_F462();
}

_id_F45E( var_0, var_1 )
{
    _id_F465( var_1 );
    _id_F45D( var_0 );
    _id_F462();
    thread _id_1295F();
}

_id_F460( var_0, var_1, var_2 )
{
    self notify( "set_lightbar_for_time_endon_death" );
    self endon( "set_lightbar_for_time_endon_death" );
    _id_F465( var_1 );
    _id_F45D( var_0 );
    _id_F462();
    thread _id_1295F();
    wait( var_2 );

    if ( !isdefined( self ) )
        return;

    _id_F461();
    self._id_ACB1[0] notify( "removed" );
    self._id_ACB1[0] = undefined;
    _id_4041();
}

_id_F464( var_0, var_1 )
{
    self notify( "set_lightbar_endon_death" );
    self endon( "set_lightbar_endon_death" );
    _id_F465( var_1 );
    _id_F45D( var_0 );
    _id_F462();
    thread _id_1295F();
}

_id_6336( var_0 )
{
    self notify( "endInactiveInstructionOnDeath" );
    self endon( "endInactiveInstructionOnDeath" );
    var_0 endon( "executing" );
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    if ( self._id_ACB1.size == 0 )
        return;

    self._id_ACB1[0] notify( "removed" );
    self._id_ACB1[0] = undefined;
    _id_4041();
}

_id_635B( var_0, var_1 )
{
    var_1 endon( "removed" );

    if ( isarray( var_0 ) )
        var_2 = scripts\engine\utility::_id_13730( var_0 );
    else
        self waittill( var_0 );

    if ( !isdefined( self ) )
        return;

    for ( var_3 = 0; var_3 < self._id_ACB1.size; var_3++ )
    {
        if ( var_1 == self._id_ACB1[var_3] )
        {
            if ( var_1._id_68D9 )
                _id_F461();

            self._id_ACB1[var_3] = undefined;
            _id_4041();
            return;
        }
    }
}

_id_1295F()
{
    self notify( "turn_Off_Light_Bar_On_Death" );
    self endon( "turn_Off_Light_Bar_On_Death" );
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    if ( self._id_ACB1.size == 0 )
        return;

    _id_F461();
    self._id_ACB1[0] notify( "removed" );
    self._id_ACB1[0] = undefined;
    _id_4041();
}

_id_F45D( var_0 )
{
    self setclientomnvar( "lb_color", var_0 );
}

_id_F462()
{
    self setclientomnvar( "lb_gsc_controlled", 1 );
}

_id_F461()
{
    self setclientomnvar( "lb_gsc_controlled", 0 );
}

_id_F465( var_0 )
{
    self setclientomnvar( "lb_pulse_time", var_0 );
}

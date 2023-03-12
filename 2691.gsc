// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( getdvarint( "prototype_adrenaline_enabled" ) == 1 && level.rankedmatch )
    {
        _id_97BF();
        level thread _id_C56E();
    }
    else
    {

    }
}

_id_97BF()
{
    precacheshader( "combathigh_overlay" );
}

_id_7D9E()
{
    return getdvarfloat( "adrenaline_winddown_time_sec", 30 );
}

_id_7D9F()
{
    return getdvarint( "adrenaline_xp_multiplier", 4 );
}

_id_7D9D()
{
    return getdvarint( "adrenaline_min_spm_threshold", 80 );
}

_id_7D9C()
{
    return getdvarfloat( "adrenaline_history_mins", 3 );
}

_id_1892()
{
    return getdvarint( "adrenaline_debugging", 0 );
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread onplayerspawned();
    }
}

onplayerspawned()
{
    for (;;)
    {
        if ( _id_1892() )
        {

        }

        self waittill( "spawned_player" );
        _id_FA89();
        thread _id_18AB();
        thread _id_18B1();
        thread _id_18AF();
        thread _id_18B0();
    }
}

_id_18AB()
{
    self endon( "disconnect" );
    self endon( "death" );
    var_0 = 0;

    for (;;)
    {
        _id_1891();
        var_1 = _id_18A9();
        var_2 = self._id_115B;

        if ( _id_1892() && var_1 > 0 && var_1 != var_0 )
        {

        }

        if ( var_0 < var_1 && _id_181E() <= var_1 )
        {
            self._id_115B = _id_7D9E();
            self notify( "adrenaline_update" );
        }

        var_0 = var_1;
        wait 0.3;
    }
}

_id_1896()
{
    var_0 = ( self._id_115B - 5.0 ) / ( _id_7D9E() - 5.0 ) * 0.5;
    var_0 += 0.5;

    if ( var_0 > 1.0 )
        var_0 = 1.0;

    return var_0;
}

_id_1891()
{
    for ( var_0 = 0; var_0 < self._id_115E.size; var_0++ )
    {
        if ( gettime() - self._id_115E[var_0] > _id_7D9C() * 60 * 1000 )
        {
            self._id_115E[var_0] = undefined;
            self._id_115D[var_0] = undefined;
        }
    }

    self._id_115E = scripts\engine\utility::_id_22BC( self._id_115E );
    self._id_115D = scripts\engine\utility::_id_22BC( self._id_115D );
}

_id_18A9()
{
    var_0 = 0;

    foreach ( var_2 in self._id_115D )
        var_0 += var_2;

    return var_0 / _id_7D9C() * 1.0;
}

_id_181E()
{
    var_0 = scripts\mp\persistence::_id_10E33( "score" );
    var_1 = scripts\mp\persistence::_id_10E34( "timePlayedTotal" );

    if ( var_1 > 0 )
        var_2 = var_0 / ( var_1 / 60 ) + 34;
    else
        var_2 = _id_7D9D();

    if ( var_2 < _id_7D9D() )
        var_2 = _id_7D9D();

    if ( _id_1892() )
    {

    }

    return var_2;
}

_id_1890( var_0 )
{
    if ( _id_1892() )
    {

    }

    if ( isdefined( self._id_115A ) )
    {
        self._id_115E[self._id_115E.size] = gettime();
        self._id_115D[self._id_115D.size] = var_0;
    }
}

_id_1897()
{
    var_0 = 0;

    if ( isdefined( self._id_115A ) && self._id_115A )
        var_0 = _id_7D9F();

    return var_0;
}

_id_FA89()
{
    self._id_115B = 0;
    self._id_115E = [];
    self._id_115D = [];
    self._id_115A = 0;
    self._id_115C = 0;
    self._id_18A8 = undefined;
}

_id_18AA()
{
    self._id_115C = 1;
}

_id_1893()
{
    var_0 = 0;

    if ( getdvarint( "prototype_adrenaline_enabled" ) == 1 )
        var_0 = self._id_115C;

    return var_0;
}

_id_1898()
{
    var_0 = 0;

    if ( getdvarint( "prototype_adrenaline_enabled" ) == 1 && isdefined( self._id_115A ) )
        var_0 = self._id_115A;

    return var_0;
}

_id_18AE( var_0 )
{
    if ( var_0 _id_1898() )
    {
        if ( var_0 _id_1893() )
            thread scripts\mp\hud_message::showsplash( "adrenaline_mood_killer", 0 );
        else
            thread scripts\mp\hud_message::showsplash( "adrenaline_iced", 0 );
    }
}

_id_661F()
{
    if ( !self._id_115A )
    {
        self._id_18A8 = newclienthudelem( self );
        self._id_18A8.x = 0;
        self._id_18A8.y = 0;
        self._id_18A8._id_002B = "left";
        self._id_18A8._id_002C = "top";
        self._id_18A8._id_017D = "fullscreen";
        self._id_18A8._id_0382 = "fullscreen";
        self._id_18A8 setshader( "combathigh_overlay", 640, 480 );
        self._id_18A8._id_02A4 = -10;
        self._id_18A8._id_0049 = 1;
        self._id_18A8.alpha = 0;
        self._id_115A = 1;
    }
}

_id_18AF()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "adrenaline_update" );

        if ( !self._id_115A )
        {
            wait 0.05;

            if ( _id_1892() )
            {

            }

            _id_661F();
            thread scripts\mp\hud_message::showsplash( "adrenaline_enter", _id_7D9F() );
        }

        self._id_18A8 fadeovertime( 0.3 );
        self._id_18A8.alpha = 1;
        wait 0.3;
        thread _id_18AC();
    }
}

_id_18AC()
{
    self endon( "adrenaline_update" );
    self endon( "death" );
    self endon( "disconnect" );

    while ( self._id_115B > 5.0 )
    {
        var_0 = _id_1896();

        if ( _id_1892() )
        {

        }

        self._id_18A8 fadeovertime( 0.3 );
        self._id_18A8.alpha = var_0;
        wait 0.3;
        self._id_115B -= 0.3;
    }

    var_1 = 40;

    for ( var_2 = 40; self._id_115B > 0; self._id_115B -= 1 )
    {
        self._id_18A8 fadeovertime( 0.1 );
        self._id_18A8.alpha = 1;
        wait 0.05;
        self._id_18A8 fadeovertime( 0.1 );
        self._id_18A8.alpha = 0.5;
        wait 0.9;
    }

    self._id_18A8 fadeovertime( 0.3 );
    self._id_18A8.alpha = 0;
    wait 0.3;
    self notify( "adrenaline_cleanup" );
}

_id_18B0()
{
    for (;;)
    {
        scripts\engine\utility::_id_13734( "adrenaline_cleanup", "death", "disconnect" );

        if ( self._id_115A )
        {
            self._id_115A = 0;
            self._id_18A8 destroy();
            self._id_18A8 = undefined;
        }
    }
}

_id_18B1()
{
    self waittill( "death" );
    self notify( "adrenaline_cleanup" );
}

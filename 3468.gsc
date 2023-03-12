// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_3E6E()
{
    var_0 = spawnstruct();
    var_0._id_2B9C = [];
    var_0._id_2B9D = [];
    var_0._id_2B97 = [];
    var_0._id_2B9C[0] = "chilledInit";
    var_0._id_2B9D[0] = "activeWeak";
    var_0._id_2B97[0] = 2;
    var_0._id_2B9C[1] = "chilledInit";
    var_0._id_2B9D[1] = "active";
    var_0._id_2B97[1] = 2;
    level._id_3E6B = var_0;
}

_id_3E69( var_0, var_1 )
{
    if ( !isdefined( self._id_3E6B ) )
        self._id_3E6B = spawnstruct();

    var_2 = self._id_3E6B;
    thread _id_3E6A();

    if ( !isdefined( var_2._id_0019 ) )
    {
        self notify( "chill" );
        var_2._id_0019 = 1;
        var_2._id_109AE = 0;
        var_2._id_11921 = [];
        var_1 *= 1000;
        var_3 = gettime();
        var_4 = var_3 + var_1;
        var_2._id_11921[var_0] = ( var_3, var_4, var_1 );
        _id_3E6C();
        self setscriptablepartstate( "chilled", "active", 0 );
        thread _id_3E75();
    }
    else
    {
        if ( !isdefined( var_2._id_11921[var_0] ) )
            var_2._id_0019++;

        var_1 *= 1000;
        var_3 = gettime();
        var_4 = var_3 + var_1;
        var_2._id_11921[var_0] = ( var_3, var_4, var_1 );
    }
}

_id_3E76( var_0 )
{
    var_1 = self._id_3E6B;
    var_1._id_0019--;
    var_1._id_11921[var_0] = undefined;

    if ( var_1._id_0019 == 0 )
    {
        self notify( "chillEnd" );
        _id_3E6D();
        self setscriptablepartstate( "chilled", "neutral", 0 );
        self._id_3E6B = undefined;
        scripts\mp\weapons::_id_12ED5();
    }
}

_id_9D8A()
{
    var_0 = self._id_3E6B;
    return isdefined( var_0 ) && isdefined( var_0._id_0019 );
}

_id_3E70()
{
    self notify( "chillReset" );
    self._id_3E6B = undefined;
}

_id_3E71()
{
    self setscriptablepartstate( "chilled", "neutral", 0 );

    foreach ( var_1 in level._id_3E6B._id_2B9C )
        self setscriptablepartstate( var_1, "neutral", 0 );
}

_id_3E6C()
{
    scripts\engine\utility::_id_1C67( 0 );
    scripts\engine\utility::_id_1C64( 0 );
    scripts\engine\utility::_id_1C70( 0 );

    if ( !level.tactical )
        scripts\engine\utility::_id_1C42( 0 );

    scripts\engine\utility::_id_1C52( 0 );
}

_id_3E6D()
{
    scripts\engine\utility::_id_1C67( 1 );
    scripts\engine\utility::_id_1C64( 1 );
    scripts\engine\utility::_id_1C70( 1 );

    if ( !level.tactical )
        scripts\engine\utility::_id_1C42( 1 );

    scripts\engine\utility::_id_1C52( 1 );
}

_id_3E6A()
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 = self._id_3E6B;
    var_1 = level._id_3E6B;
    var_2 = var_0._id_2B9B;
    var_3 = scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_12D6( "specialty_stun_resistance" ), 0, 1 );
    var_4 = var_1._id_2B9C[var_3];
    var_5 = var_1._id_2B9D[var_3];
    var_6 = var_1._id_2B97[var_3];

    if ( !isdefined( var_2 ) )
    {
        self setscriptablepartstate( var_4, var_5, 0 );
        var_0._id_2B9B = var_3;
    }
    else
    {
        if ( var_2 > var_3 )
            return;

        var_7 = var_1._id_2B9C[var_2];

        if ( var_7 != var_4 )
            self setscriptablepartstate( var_7, "neutral", 0 );

        self setscriptablepartstate( var_4, var_5, 0 );
        var_0._id_2B9B = var_3;
    }

    self notify( "chillBlind" );
    self endon( "chillBlind" );
    scripts\engine\utility::_id_13736( var_6, "chillEnd" );
    self setscriptablepartstate( var_4, "neutral", 0 );
    var_0._id_2B9B = undefined;
}

_id_3E75()
{
    self endon( "disconnect" );
    self endon( "chillReset" );
    self endon( "chillEnd" );
    var_0 = self._id_3E6B;

    for (;;)
    {
        var_1 = gettime();
        var_2 = 0;

        foreach ( var_10, var_4 in var_0._id_11921 )
        {
            var_5 = var_4[0];
            var_6 = var_4[1];
            var_7 = var_4[2];

            if ( var_1 < var_6 )
            {
                var_8 = var_1 - var_5;
                var_9 = 1 - var_8 / var_7;

                if ( var_9 > var_2 )
                    var_2 = var_9;

                continue;
            }

            thread _id_3E76( var_10 );
        }

        var_0._id_109AE = var_2 * -0.55;
        scripts\mp\weapons::_id_12ED5();
        wait 0.1;
    }
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_12F9B()
{
    self setscriptablepartstate( "amplify", "active", 0 );
    self._id_1E57 = 500;
    level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_amplify", undefined, 0.75 );
    return 1;
}

_id_62A3( var_0 )
{
    self notify( "amplify_end" );
    self._id_1E57 = undefined;

    if ( self._id_AE62 == "archetype_assault" )
        self setscriptablepartstate( "amplify", "neutral", 0 );
}

_id_12BF4()
{
    _id_62A3();
}

_id_9D41()
{
    var_0 = scripts\mp\supers::_id_7E4F();

    if ( !isdefined( var_0 ) || var_0 != "super_amplify" )
        return 0;

    if ( !scripts\mp\supers::_id_9F88() )
        return 0;

    return 1;
}

_id_1E58( var_0 )
{
    if ( !_id_9D41() )
        return 0;

    var_1 = int( min( self._id_1E57, var_0 * 1 ) );
    self._id_1E57 -= var_1;
    var_2 = 100;

    if ( self._id_1E57 > 0 )
        var_2 = int( min( floor( var_1 / 10 ), 1 ) );

    for ( var_3 = 0; var_3 <= var_2; var_3++ )
    {
        scripts\mp\supers::_id_1613();

        if ( !scripts\mp\supers::_id_9F88() )
            break;
    }

    return var_1;
}

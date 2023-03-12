// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_B557()
{
    level thread _id_B559();
}

_id_B559()
{
    for (;;)
    {
        level waittill( "player_spawned", var_0 );

        if ( isai( var_0 ) )
            continue;
    }
}

_id_B558()
{

}

_id_B554( var_0 )
{
    self._id_B551 = 1;

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !var_0 )
    {
        self iprintlnbold( "C.E.C.O.T drive active" );
        thread _id_B553();
    }

    var_1 = 450;
    var_2 = 1200;
    var_3 = 350;
    self _meth_842E( 0, var_1 );
    self _meth_842C( 0, var_1 );
    self _meth_8434( 0, var_2 );
    self _meth_8430( 0, var_3 );
    return 1;
}

_id_B552( var_0 )
{
    if ( !isdefined( self ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = 400;
    var_2 = 400;
    self _meth_842E( 0, var_1 );
    self _meth_842C( 0, var_1 );
    self _meth_8434( 0, var_2 );
    self _meth_8430( 0, 900 );

    if ( !var_0 )
    {
        self._id_B551 = 0;
        self setscriptablepartstate( "megaboost", "megaboostOff", 0 );
        self notify( "megaboost_end" );
    }
}

_id_B555()
{
    self endon( "megaboost_end" );
    scripts\engine\utility::waittill_any( "death", "disconnect", "game_ended" );
    thread _id_B552();
}

_id_9E95()
{
    if ( !isdefined( self._id_B551 ) )
        return 0;

    return self._id_B551;
}

_id_B553()
{
    self endon( "disconnect" );
    self endon( "megaboost_end" );
    self _meth_846F( "ges_hold" );
    self setscriptablepartstate( "megaboost", "megaboostOn", 0 );
}

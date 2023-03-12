// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_103E9 = getentarray( "trigger_multiple_softlanding", "classname" );
    var_0 = getentarray( "destructible_vehicle", "targetname" );

    foreach ( var_2 in level._id_103E9 )
    {
        if ( var_2._id_EEFA != "car" )
            continue;

        foreach ( var_4 in var_0 )
        {
            if ( distance( var_2.origin, var_4.origin ) > 64.0 )
                continue;

            var_2._id_5336 = var_4;
        }
    }

    thread _id_C56E();
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_103E8 = undefined;
        var_0 thread _id_103EA();
    }
}

_id_D389( var_0 )
{
    self._id_103E8 = var_0;
}

_id_D3CF( var_0 )
{
    self._id_103E8 = undefined;
}

_id_103EA()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "soft_landing", var_0, var_1 );

        if ( !isdefined( var_0._id_5336 ) )
            continue;
    }
}

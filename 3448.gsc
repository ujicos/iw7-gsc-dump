// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_80F1()
{
    foreach ( var_1 in self._id_E4D7 )
        return var_1;

    return undefined;
}

_id_E4D6()
{
    if ( !isdefined( self._id_E4D7 ) || self._id_E4D7.size < 0 )
        return 0;

    var_0 = _id_80F1();

    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = distancesquared( self.origin, var_0 );

    if ( var_1 < 40000 )
        return 0;

    return 1;
}

_id_89DC( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "powers_cleanUp" );

    for (;;)
    {
        self waittill( "damage" );

        if ( isdefined( self._id_010C ) )
        {
            if ( !self _meth_81B8() && self._id_010C.health < self.health )
                continue;
        }

        if ( !_id_E4D6() )
            continue;

        if ( _id_0D79::_id_8BEE() )
        {
            if ( self.health < 90 )
            {
                _id_0D79::_id_130C0( var_0, var_1 );
                break;
            }
        }
    }
}

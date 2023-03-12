// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_8995( var_0, var_1 )
{
    thread _id_0D79::_id_130C1( var_0, var_1, 450, ::_id_1307D );
    thread _id_0D79::_id_130C2( var_0, var_1, 450, 80, ::_id_1307D );
}

_id_C166( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( var_1 );
    var_0 waittill( "death" );
    self notify( var_1 );
}

_id_10E69()
{
    thread _id_C166( self._id_5906, "StayInShieldElapsed" );
    thread _id_B9D2( 250, "StayInShieldElapsed" );
    var_0 = getclosestpointonnavmesh( self._id_5906.origin, self );
    self._id_5906 = undefined;
    self botsetscriptgoal( var_0, 16, "critical" );
    thread cleanupdomeshield();
}

_id_B9D2( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( var_1 );
    var_2 = var_0 * var_0;

    for (;;)
    {
        if ( isdefined( self._id_010C ) )
        {
            var_3 = distancesquared( self.origin, self._id_010C.origin );

            if ( var_3 < var_2 )
            {
                self notify( var_1 );
                break;
            }
        }

        wait 0.25;
    }
}

_id_1307D( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "domeshield_used" );
    _id_0D79::_id_130C0( var_0, var_1 );

    while ( !isdefined( self._id_5906 ) )
        wait 0.05;

    _id_10E69();
}

cleanupdomeshield()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self waittill( "StayInShieldElapsed" );
    self botclearscriptgoal();
}

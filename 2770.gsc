// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_B774()
{
    var_0 = getentarray( "minefield", "targetname" );

    if ( var_0.size > 0 )
        level._effect["mine_explosion"] = loadfx( "vfx/core/expl/weap/gre/vfx_exp_gre_dirt_cg" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] thread _id_B773();
}

_id_B773()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isplayer( var_0 ) )
            var_0 thread _id_B772( self );
    }
}

_id_B772( var_0 )
{
    if ( isdefined( self._id_B771 ) )
        return;

    self._id_B771 = 1;
    wait 0.5;
    wait( randomfloat( 0.5 ) );

    if ( isdefined( self ) && self istouching( var_0 ) )
    {
        var_1 = self _meth_814F();
        var_2 = 300;
        var_3 = 2000;
        var_4 = 50;
        radiusdamage( var_1, var_2, var_3, var_4 );
    }

    self._id_B771 = undefined;
}

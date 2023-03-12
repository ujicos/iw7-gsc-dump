// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main()
{
    if ( !isdefined( level.anim_prop_models ) )
        level.anim_prop_models = [];

    var_0 = getarraykeys( level.anim_prop_models );

    foreach ( var_2 in var_0 )
    {
        var_3 = getarraykeys( level.anim_prop_models[var_2] );

        foreach ( var_5 in var_3 )
            precachempanim( level.anim_prop_models[var_2][var_5] );
    }

    waittillframeend;
    level._id_94FE = [];
    var_8 = getentarray( "animated_model", "targetname" );
    scripts\engine\utility::_id_22D3( var_8, ::_id_1F9C, 0.05 );
    level._id_94FE = undefined;
}

_id_1F9C()
{
    if ( isdefined( self.animation ) )
        var_0 = self.animation;
    else
    {
        var_1 = getarraykeys( level.anim_prop_models[self._id_01F1] );
        var_2 = var_1[randomint( var_1.size )];
        var_0 = level.anim_prop_models[self._id_01F1][var_2];
    }

    self scriptmodelplayanim( var_0 );
    self willneverchange();
}

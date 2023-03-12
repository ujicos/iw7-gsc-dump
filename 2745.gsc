// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_17CE( var_0 )
{
    var_1 = self._id_8CFC;

    if ( !isdefined( self.struct ) )
    {
        var_1 = spawnstruct( self._id_8CFC );
        var_1.player = self;
        var_1._id_9118 = 0;
        self._id_8CFC = var_1;
        var_1._id_9118 += var_0;
        self notify( "heavyArmor_added" );
    }
    else
        var_1._id_9118 += var_0;
}

_id_111AB( var_0 )
{
    var_1 = self._id_8CFC;

    if ( scripts\mp\utility\game::istrue( var_1._id_9344 ) )
        return;

    if ( var_1._id_9118 > 0 )
    {
        var_1._id_9118 = max( 0, var_1._id_9118 - var_0 );
        scripts\mp\missions::_id_D991( "ch_heavy_armor_absorb", var_0 );

        if ( var_1._id_9118 <= 0 )
            thread _id_8CFD();
    }
}

_id_E12B()
{
    self notify( "heavyArmor_removed" );
    self._id_8CFC = undefined;
}

_id_8D07( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( var_2 <= 0 && var_3 <= 0 )
        return [ 0, var_2, var_3 ];

    if ( var_4 == "MOD_SUICIDE" )
        return [ 0, var_2, var_3 ];

    if ( isdefined( var_1 ) && ( var_1.classname == "trigger_hurt" || var_1.classname == "worldspawn" ) )
        return [ 0, var_2, var_3 ];

    if ( !var_0 _id_8BFA() )
        return [ 0, var_2, var_3 ];

    if ( scripts\mp\utility\game::_id_9D6E( var_5 ) )
        return [ 0, var_2, var_3 ];

    if ( var_0 _id_8BFB() )
        return [ 1, 1, 0 ];

    var_11 = var_0 _id_7EF8();
    var_12 = _id_8D01( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    var_13 = var_2 * var_12;
    var_14 = var_3 * var_12;
    var_15 = var_13 + var_14;

    if ( !var_10 )
        var_0 _id_111AB( var_15 );

    if ( var_0 _id_8BFB() )
        return [ var_11, 1, 0 ];

    return [ var_2 + var_3, 1, 0 ];
}

_id_7EF8()
{
    if ( !_id_8BFA() )
        return 0;

    return self._id_8CFC._id_9118;
}

_id_8BFA()
{
    return isdefined( self._id_8CFC ) && ( self._id_8CFC._id_9118 > 0 || scripts\mp\utility\game::istrue( self._id_8CFC._id_9B30 ) );
}

_id_8BFB()
{
    return isdefined( self._id_8CFC ) && scripts\mp\utility\game::istrue( self._id_8CFC._id_9B30 );
}

_id_8CFD()
{
    self endon( "disconnect" );
    self endon( "heavyArmor_removed" );

    if ( !scripts\mp\utility\game::_id_9D46() )
        self._id_8CFC._id_9B30 = 1;

    self notify( "heavyArmor_broken" );
    waittillframeend;
    thread _id_E12B();
}

_id_8D01( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    var_11 = [];

    if ( scripts\mp\utility\game::_id_9F8D( var_4 ) )
        var_11[var_11.size] = 1.33;

    if ( isexplosivedamagemod( var_4 ) )
        var_11[var_11.size] = 1.5;

    if ( var_4 == "MOD_MELEE" )
        var_11[var_11.size] = 1.5;

    if ( scripts\mp\utility\game::isheadshot( var_5, var_8, var_4, var_1 ) )
        var_11[var_11.size] = 1.5;

    var_12 = 1;

    foreach ( var_14 in var_11 )
    {
        if ( var_14 > var_12 )
            var_14 = var_12;
    }

    return var_12;
}

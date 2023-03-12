// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    _id_AEB1();
    var_0 = getdvarint( "online_mp_weapon_xpscale", 1 );
    _id_17CB( var_0, "online_mp_weapon_xpscale" );
    level thread _id_C56E();
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isai( var_0 ) )
        {
            if ( var_0 scripts\mp\utility\game::_id_DCD5() )
            {
                var_1 = getdvarint( "online_mp_party_weapon_xpscale" );
                var_2 = var_0 _meth_85BE() > 1;

                if ( var_2 )
                    var_0 _id_186A( var_1, "online_mp_party_weapon_xpscale" );
            }
        }
    }
}

_id_AEB1()
{
    level._id_13CBD = spawnstruct();
    level._id_13CBD._id_DCD4 = [];
    var_0 = 0;

    for (;;)
    {
        var_1 = int( tablelookuprownum( "mp/weaponRankTable.csv", 0, var_0 ) );

        if ( !isdefined( var_1 ) || var_1 < 0 )
            break;

        var_2 = spawnstruct();
        level._id_13CBD._id_DCD4[var_0] = var_2;
        var_2._id_B7CF = int( tablelookupbyrow( "mp/weaponRankTable.csv", var_0, 1 ) );
        var_2._id_13E29 = int( tablelookupbyrow( "mp/weaponRankTable.csv", var_0, 2 ) );
        var_2._id_B4D6 = int( tablelookupbyrow( "mp/weaponRankTable.csv", var_0, 3 ) );
        var_0++;
    }

    level._id_13CBD._id_B4C0 = var_0 - 1;
    level._id_13CBD._id_B4D4 = [];
    var_3 = 1;

    for (;;)
    {
        var_1 = int( tablelookuprownum( "mp/statstable.csv", 0, var_3 ) );

        if ( !isdefined( var_1 ) || var_1 < 0 )
            break;

        var_4 = tablelookupbyrow( "mp/statstable.csv", var_1, 4 );
        var_5 = tablelookupbyrow( "mp/statstable.csv", var_1, 42 );

        if ( !isdefined( var_4 ) || var_4 == "" || !isdefined( var_5 ) || var_5 == "" )
        {

        }
        else
        {
            var_5 = int( var_5 );
            level._id_13CBD._id_B4D4[var_4] = var_5;
        }

        var_3++;
    }
}

_id_8085( var_0 )
{
    var_1 = _id_8086( var_0 );
    var_2 = _id_822C( var_1 );
    return var_2;
}

_id_8086( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "all";

    switch ( var_1 )
    {
        case "mp":
            var_2 = self getrankedplayerdata( "common", "sharedProgression", "weaponLevel", var_0, "mpXP" );
            return var_2;
        case "cp":
            var_3 = self getrankedplayerdata( "common", "sharedProgression", "weaponLevel", var_0, "cpXP" );
            return var_3;
        case "all":
            var_2 = self getrankedplayerdata( "common", "sharedProgression", "weaponLevel", var_0, "mpXP" );
            var_3 = self getrankedplayerdata( "common", "sharedProgression", "weaponLevel", var_0, "cpXP" );
            return var_2 + var_3;
    }
}

_id_9EFF( var_0 )
{
    var_1 = _id_8086( var_0 );
    var_2 = _id_8227( var_0 );
    return var_1 >= var_2;
}

_id_13CCA( var_0 )
{
    if ( !self _meth_81A7( "cac", "feature" ) )
        return 0;

    var_1 = scripts\mp\utility\game::_id_8234( var_0 );
    return _id_13C97( var_1 );
}

_id_13C97( var_0 )
{
    if ( !isdefined( level._id_13CBD._id_B4D4[var_0] ) )
        return 0;

    return level._id_13CBD._id_B4D4[var_0] > 0;
}

_id_8227( var_0 )
{
    var_1 = _id_7FA5( var_0 );
    return _id_822D( var_1 );
}

_id_822C( var_0 )
{
    if ( var_0 == 0 )
        return 0;

    for ( var_1 = _id_7FA4() - 1; var_1 >= 0; var_1-- )
    {
        if ( var_0 >= _id_822E( var_1 ) )
            return var_1;
    }

    return var_1;
}

_id_7FA6( var_0 )
{
    var_1 = scripts\mp\utility\game::_id_8234( var_0 );
    return _id_7FA5( var_1 );
}

_id_7FA5( var_0 )
{
    return level._id_13CBD._id_B4D4[var_0];
}

_id_7FA4()
{
    return level._id_13CBD._id_B4C0;
}

_id_822E( var_0 )
{
    return level._id_13CBD._id_DCD4[var_0]._id_B7CF;
}

_id_8230( var_0 )
{
    return level._id_13CBD._id_DCD4[var_0]._id_13E29;
}

_id_822D( var_0 )
{
    return level._id_13CBD._id_DCD4[var_0]._id_B4D6;
}

_id_8394( var_0, var_1, var_2 )
{
    if ( isai( self ) || !isplayer( self ) || !isdefined( var_2 ) || var_2 == 0 || !scripts\mp\utility\game::_id_DCD5() )
        return;

    var_3 = scripts\mp\utility\game::_id_8234( var_0 );

    if ( !self _meth_81A7( var_3, "weapon" ) )
        return;

    if ( !_id_13C97( var_3 ) )
        return;

    var_4 = _id_DF69( var_1 );

    if ( var_4 != var_1 )
    {
        var_1 = var_4;
        var_2 = scripts\mp\rank::getscoreinfovalue( var_1 );
    }

    if ( var_2 < 0 )
        return;

    var_5 = var_2;
    var_2 *= _id_8233();
    var_2 = int( var_2 );

    if ( var_2 > _id_8227( var_3 ) )
        return;

    var_6 = _id_8086( var_3, "mp" );
    var_7 = _id_8086( var_3, "cp" );
    var_8 = var_6 + var_7;
    var_9 = _id_822C( var_8 );
    var_10 = _id_8227( var_3 );
    var_11 = var_10 - var_7;
    var_12 = var_6 + var_2;

    if ( var_12 > var_11 )
        var_12 = var_11;

    var_13 = var_12 + var_7;
    var_14 = _id_7FA5( var_3 );
    var_15 = self getrankedplayerdata( "common", "sharedProgression", "weaponLevel", var_3, "prestige" );
    var_16 = int( min( _id_822C( var_13 ), var_14 ) );
    scripts\mp\analyticslog::_id_AFA1( var_0, var_15, var_16, var_2, var_1 );
    self setrankedplayerdata( "common", "sharedProgression", "weaponLevel", var_3, "mpXP", var_12 );
    var_17 = getweaponvariantindex( var_0 );
    scripts\mp\matchdata::_id_AFDC( var_3, "xp", var_2, var_17 );

    if ( var_9 < var_16 )
    {
        scripts\mp\hud_message::showsplash( "ranked_up_weapon_" + var_3, var_16 + 1 );
        var_18 = "weapon_rank_up_0_4";

        if ( var_16 >= 15 )
            var_18 = "weapon_rank_up_15_plus";
        else if ( var_16 >= 10 )
            var_18 = "weapon_rank_up_10_14";
        else if ( var_16 >= 5 )
            var_18 = "weapon_rank_up_5_9";

        var_19 = scripts\mp\rank::getscoreinfovalue( var_18 );
        scripts\mp\rank::_id_839A( var_18, var_19 );
    }
}

_id_DF69( var_0 )
{
    switch ( var_0 )
    {
        case "kill":
            var_0 = "kill_weapon";
            break;
        case "challenge":
            var_0 = "weapon_challenge";
            break;
    }

    return var_0;
}

_id_17CB( var_0, var_1 )
{
    level _id_186A( var_0, var_1 );
}

_id_7EDB()
{
    return level _id_8232();
}

_id_186A( var_0, var_1 )
{
    if ( !isdefined( self._id_13CBE ) )
        self._id_13CBE = [];

    if ( isdefined( self._id_13CBE[var_1] ) )
        self._id_13CBE[var_1] = max( self._id_13CBE[var_1], var_0 );
    else
        self._id_13CBE[var_1] = var_0;
}

_id_8232()
{
    if ( !isdefined( self._id_13CBE ) )
        return 1.0;

    var_0 = 1.0;

    foreach ( var_2 in self._id_13CBE )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_0 *= var_2;
    }

    return var_0;
}

_id_E126( var_0 )
{
    level _id_E18D( var_0 );
}

_id_E18D( var_0 )
{
    if ( !isdefined( self._id_13CBE ) )
        return;

    if ( !isdefined( self._id_13CBE[var_0] ) )
        return;

    self._id_DCD7[var_0] = undefined;
}

_id_8233()
{
    var_0 = _id_8232();
    var_1 = _id_7EDB();
    return var_0 * var_1;
}

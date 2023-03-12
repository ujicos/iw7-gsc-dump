// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_B09C = [];
    level.lootweaponrefs = [];
    var_0 = 0;

    for (;;)
    {
        var_1 = tablelookupbyrow( "mp/loot/iw7_weapon_loot_master.csv", var_0, 0 );

        if ( !isdefined( var_1 ) || var_1 == "" )
            break;

        var_1 = int( var_1 );
        var_2 = tablelookupbyrow( "mp/loot/iw7_weapon_loot_master.csv", var_0, 1 );
        level.lootweaponrefs[var_1] = var_2;
        var_0++;
    }
}

_id_804C( var_0 )
{
    if ( isplayer( self ) && weaponhasprestigenuke( var_0 ) )
        return [ "passive_nuke" ];

    var_1 = _id_7F82( var_0 );

    if ( isdefined( var_1 ) )
        return var_1._id_C946;

    return undefined;
}

_id_7F82( var_0 )
{
    var_1 = getweaponvariantindex( var_0 );

    if ( !isdefined( var_1 ) )
        return undefined;

    var_2 = scripts\mp\utility\game::_id_8234( var_0 );

    if ( isdefined( level._id_B09C[var_2] ) && isdefined( level._id_B09C[var_2][var_1] ) )
    {
        var_3 = level._id_B09C[var_2][var_1];
        return var_3;
    }

    var_3 = _id_36A4( var_0, var_2, var_1 );

    if ( isdefined( var_3 ) )
        return var_3;

    return undefined;
}

_id_8215( var_0, var_1 )
{
    var_2 = "mp/loot/weapon/" + var_0 + ".csv";
    var_3 = tablelookup( var_2, 0, var_1, 3 );
    return var_3;
}

lookupvariantref( var_0, var_1 )
{
    var_2 = "mp/loot/weapon/" + var_0 + ".csv";
    var_3 = tablelookup( var_2, 0, var_1, 1 );
    return var_3;
}

_id_A001( var_0 )
{
    return var_0 >= 1 && var_0 <= 9999;
}

_id_9E69( var_0 )
{
    return var_0 >= 10000 && var_0 <= 19999;
}

_id_9F08( var_0 )
{
    return var_0 >= 20000 && var_0 <= 29999;
}

_id_9D90( var_0 )
{
    return var_0 >= 30000 && var_0 <= 39999;
}

_id_9D95( var_0 )
{
    return var_0 >= 40000 && var_0 <= 49999;
}

_id_36A4( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_B09C[var_1] ) )
        level._id_B09C[var_1] = [];

    var_3 = getweaponloottable( var_0 );
    var_4 = _id_DD6A( var_3, var_2 );
    level._id_B09C[var_1][var_2] = var_4;
    return var_4;
}

_id_DD6A( var_0, var_1 )
{
    var_2 = tablelookuprownum( var_0, 0, var_1 );
    var_3 = spawnstruct();
    var_3._id_DE3F = tablelookupbyrow( var_0, var_2, 1 );
    var_3._id_13C74 = tablelookupbyrow( var_0, var_2, 1 );
    var_3._id_C946 = [];

    for ( var_4 = 0; var_4 < 3; var_4++ )
    {
        var_5 = tablelookupbyrow( var_0, var_2, 5 + var_4 );

        if ( isdefined( var_5 ) && var_5 != "" )
            var_3._id_C946[var_3._id_C946.size] = var_5;
    }

    var_3._id_DB52 = int( tablelookupbyrow( var_0, var_2, 4 ) );
    var_3._id_1318B = var_1;
    return var_3;
}

getweaponqualitybyid( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 < 0 )
        return 0;

    var_2 = getweaponloottable( var_0 );
    var_3 = int( tablelookup( var_2, 0, var_1, 4 ) );
    return var_3;
}

getlootweaponref( var_0 )
{
    return level.lootweaponrefs[var_0];
}

weaponhasprestigenuke( var_0 )
{
    var_1 = scripts\mp\utility\game::_id_8234( var_0 );
    var_2 = var_1 + "_nuke";

    if ( isdefined( level.prestigeextras[var_2] ) )
        return self _meth_81A7( var_2, "prestigeExtras", 1 );

    return 0;
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_110EC = spawnstruct();
    level._id_110EC._id_C947 = [];
    level._id_110EC._id_110F3 = [];
    level._id_110EC.costoverride = [];
    level._id_110EC.costoverridepersist = [];
    level._id_110EC.rarity = [];
    level._id_110EC._id_E76D = [];
    level._id_110EC.baseref = [];
    level._id_110EC._id_DE3F = [];
    level thread registerkillstreakvariantinfo();
    _id_DF05( "passive_decreased_cost" );
    _id_DF05( "passive_extra_points" );
}

registerkillstreakvariantinfo()
{
    level endon( "game_ended" );
    var_0 = 0;

    for ( var_1 = tablelookupbyrow( "mp/loot/iw7_killstreak_loot_master.csv", var_0, 0 ); var_1 != ""; var_1 = tablelookupbyrow( "mp/loot/iw7_killstreak_loot_master.csv", var_0, 0 ) )
    {
        level._id_110EC.costoverride[int( var_1 )] = int( tablelookup( "mp/loot/iw7_killstreak_loot_master.csv", 0, var_1, 17 ) );
        level._id_110EC.costoverridepersist[int( var_1 )] = int( tablelookup( "mp/loot/iw7_killstreak_loot_master.csv", 0, var_1, 18 ) );
        level._id_110EC.rarity[int( var_1 )] = int( tablelookup( "mp/loot/iw7_killstreak_loot_master.csv", 0, var_1, 2 ) );
        level._id_110EC._id_E76D[int( var_1 )] = var_0;
        level._id_110EC.baseref[int( var_1 )] = tablelookup( "mp/loot/iw7_killstreak_loot_master.csv", 0, var_1, 6 );
        level._id_110EC._id_DE3F[int( var_1 )] = tablelookup( "mp/loot/iw7_killstreak_loot_master.csv", 0, var_1, 1 );
        var_0++;
    }
}

getrandomvariantfrombaseref( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in level._id_110EC.baseref )
    {
        if ( var_3 == var_0 )
            var_1[var_1.size] = var_4;
    }

    if ( var_1.size == 0 )
        return undefined;
    else
        return var_1[randomint( var_1.size )];
}

modifycostforlootitem( var_0, var_1 )
{
    if ( isdefined( var_0 ) && var_0 >= 0 )
    {
        var_2 = scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_12D6( "specialty_support_killstreaks" ), level._id_110EC.costoverridepersist[var_0], level._id_110EC.costoverride[var_0] );

        if ( isdefined( var_2 ) )
            return var_2;
    }

    return var_1;
}

getrarityforlootitem( var_0 )
{
    var_1 = "";
    var_2 = undefined;

    if ( isdefined( var_0 ) )
        var_2 = level._id_110EC.rarity[var_0];

    if ( !isdefined( var_2 ) )
        return var_1;

    if ( var_2 == 1 )
        var_1 = "";
    else if ( var_2 == 2 )
        var_1 = "rare";
    else if ( var_2 == 3 )
        var_1 = "legend";
    else
        var_1 = "epic";

    return var_1;
}

_id_804B( var_0 )
{
    if ( var_0 <= 0 )
        return [];

    var_1 = level._id_110EC._id_C947[var_0];

    if ( !isdefined( var_1 ) )
    {
        var_2 = tablelookuprownum( "mp/loot/iw7_killstreak_loot_master.csv", 0, var_0 );
        var_3 = [ 7, 8, 9 ];
        var_1 = [];

        foreach ( var_5 in var_3 )
        {
            var_6 = _id_B030( var_2, var_5 );

            if ( !isdefined( var_6 ) )
                break;

            var_1[var_1.size] = var_6;
        }

        level._id_110EC._id_C947[var_0] = var_1;
    }

    return var_1;
}

_id_B030( var_0, var_1 )
{
    var_2 = tablelookupbyrow( "mp/loot/iw7_killstreak_loot_master.csv", var_0, var_1 );
    return scripts\engine\utility::ter_op( isdefined( var_2 ) && var_2 != "", var_2, undefined );
}

_id_988A( var_0, var_1 )
{
    var_0._id_C946 = var_1;
}

_id_DF07( var_0, var_1 )
{
    var_2 = level._id_110EC;

    foreach ( var_4 in var_1 )
    {
        if ( !isdefined( var_2._id_110F3[var_4] ) )
            var_2._id_110F3[var_4] = [];

        var_2._id_110F3[var_4][var_0] = 1;
    }
}

_id_DF05( var_0 )
{
    var_1 = level._id_110EC;

    if ( !isdefined( var_1._id_110F3[var_0] ) )
        var_1._id_110F3[var_0] = [];

    var_1._id_110F3[var_0]["all"] = 1;
}

_id_9ED5( var_0, var_1 )
{
    var_2 = level._id_110EC;

    if ( !isdefined( var_2._id_110F3[var_1] ) )
        return 0;

    if ( scripts\mp\utility\game::istrue( var_2._id_110F3[var_1]["all"] ) )
        return 1;

    return scripts\mp\utility\game::istrue( var_2._id_110F3[var_1][var_0] );
}

_id_89BC( var_0 )
{
    if ( _id_0DC9::_id_A69F( var_0, "passive_extra_points" ) )
        thread _id_2A66( self, var_0 );
}

_id_2A66( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 waittill( "killed_enemy" );
    var_0 thread scripts\mp\utility\game::_id_83B4( "extra_points_loot" );
}

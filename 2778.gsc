// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_C943 = [];
    _id_C945();
}

_id_C945()
{
    if ( !isdefined( level._id_C943 ) )
        level._id_C943 = [];

    var_0 = 0;

    for (;;)
    {
        var_1 = tablelookupbyrow( "mp/passivetable.csv", var_0, 0 );

        if ( var_1 == "" )
            break;

        var_2 = tablelookupbyrow( "mp/passivetable.csv", var_0, 1 );
        var_3 = tablelookupbyrow( "mp/passivetable.csv", var_0, 12 );
        var_4 = tablelookupbyrow( "mp/passivetable.csv", var_0, 13 );
        var_5 = tablelookupbyrow( "mp/passivetable.csv", var_0, 14 );
        var_6 = spawnstruct();
        var_6.name = var_2;
        var_6._id_13CDE = scripts\engine\utility::ter_op( tablelookupbyrow( "mp/passivetable.csv", var_0, 8 ) == "", 0, 1 );
        var_6._id_A6BB = scripts\engine\utility::ter_op( tablelookupbyrow( "mp/passivetable.csv", var_0, 9 ) == "", 0, 1 );
        var_6._id_ABCA = scripts\engine\utility::ter_op( tablelookupbyrow( "mp/passivetable.csv", var_0, 10 ) == "", 0, 1 );
        var_6._id_113D1 = scripts\engine\utility::ter_op( tablelookupbyrow( "mp/passivetable.csv", var_0, 11 ) == "", 0, 1 );

        if ( var_3 != "" )
            var_6._id_249B = var_3;

        if ( getdvar( "ui_gametype" ) == "zombie" )
        {
            var_7 = tablelookupbyrow( "mp/passivetable.csv", var_0, 22 );

            if ( var_7 != "" )
                var_6._id_249B = var_7;
        }

        if ( var_4 != "" )
            var_6._id_CA59 = var_4;

        if ( var_5 != "" )
            var_6._id_B689 = var_5;

        if ( !isdefined( level._id_C943[var_2] ) )
            level._id_C943[var_2] = var_6;

        var_0++;
    }
}

_id_804D( var_0 )
{
    if ( !isdefined( level._id_C943[var_0] ) )
        return undefined;

    var_1 = level._id_C943[var_0];
    return var_1;
}

_id_8048( var_0 )
{
    var_1 = _id_804D( var_0 );

    if ( !isdefined( var_1 ) || !isdefined( var_1._id_249B ) )
        return undefined;

    return var_1._id_249B;
}

_id_804A( var_0 )
{
    var_1 = _id_804D( var_0 );

    if ( !isdefined( var_1 ) || !isdefined( var_1._id_CA59 ) )
        return undefined;

    return var_1._id_CA59;
}

_id_8049( var_0 )
{
    var_1 = _id_804D( var_0 );

    if ( !isdefined( var_1 ) || !isdefined( var_1._id_B689 ) )
        return undefined;

    return var_1._id_B689;
}

_id_8239()
{
    var_0 = [];

    foreach ( var_2 in level._id_C943 )
    {
        if ( var_2._id_13CDE )
            var_0[var_0.size] = var_2.name;
    }

    return var_0;
}

_id_7F52()
{
    var_0 = [];

    foreach ( var_2 in level._id_C943 )
    {
        if ( var_2._id_A6BB )
            var_0[var_0.size] = var_2.name;
    }

    return var_0;
}

_id_7F67()
{
    var_0 = [];

    foreach ( var_2 in level._id_C943 )
    {
        if ( var_2._id_ABCA )
            var_0[var_0.size] = var_2.name;
    }

    return var_0;
}

_id_8190()
{
    var_0 = [];

    foreach ( var_2 in level._id_C943 )
    {
        if ( var_2._id_113D1 )
            var_0[var_0.size] = var_2.name;
    }

    return var_0;
}

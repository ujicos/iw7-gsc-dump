// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_90AE = getserverhostname();
    _id_F71B( scripts\mp\tweakables::_id_81E7( "team", "fftype" ) );
    _id_4555( getdvar( "g_gametype" ) );

    for (;;)
    {
        _id_12F18();
        wait 5;
    }
}

_id_12F18()
{
    var_0 = scripts\mp\tweakables::_id_81E7( "team", "fftype" );

    if ( level._id_740A != var_0 )
        _id_F71B( var_0 );
}

_id_4555( var_0 )
{
    var_1 = getentarray();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( var_0 == "dm" )
        {
            if ( isdefined( var_3._id_EDC1 ) && var_3._id_EDC1 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "tdm" )
        {
            if ( isdefined( var_3._id_EDC5 ) && var_3._id_EDC5 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "ctf" )
        {
            if ( isdefined( var_3._id_EDC0 ) && var_3._id_EDC0 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "hq" )
        {
            if ( isdefined( var_3._id_EDC2 ) && var_3._id_EDC2 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "sd" )
        {
            if ( isdefined( var_3._id_EDC4 ) && var_3._id_EDC4 != "1" )
                var_3 delete();

            continue;
        }

        if ( var_0 == "koth" )
        {
            if ( isdefined( var_3._id_EDC3 ) && var_3._id_EDC3 != "1" )
                var_3 delete();
        }
    }
}

_id_F71B( var_0 )
{
    level._id_740A = var_0;
    setdvar( "ui_friendlyfire", var_0 );
    setdvar( "cg_drawFriendlyHUDGrenades", var_0 );
}

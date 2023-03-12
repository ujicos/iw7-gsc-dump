// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_8C07( var_0 )
{
    return _id_7F73( var_0 ) > 0;
}

_id_7F73( var_0 )
{
    if ( isdefined( var_0._id_ACAE ) )
        return var_0._id_ACAE;

    return 0;
}

_id_F786( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( _id_ACA6( var_0 ) )
    {
        var_1 = 0;
        var_2 = 1;
    }

    var_4 = _id_7F73( var_0 );

    if ( !var_2 && var_4 > var_1 )
        var_1 = var_4;

    if ( var_4 <= 0 && var_1 > 0 )
    {
        _id_ACA9( var_0, var_1, var_3 );
        return;
    }

    if ( var_4 > 0 && var_1 <= 0 )
    {
        _id_ACAC( var_0 );
        return;
    }

    var_0._id_ACAE = var_1;

    if ( isplayer( var_0 ) && var_4 <= var_1 && var_1 > 0 && var_3 == 1 )
        thread _id_ACAA( var_0 );

    if ( isplayer( var_0 ) )
        _id_ACAD( var_0 );
}

init()
{
    level._effect["lightArmor_persistent"] = loadfx( "vfx/core/mp/core/vfx_uplink_carrier.vfx" );
}

_id_ACA9( var_0, var_1, var_2 )
{
    var_0 notify( "lightArmor_set" );
    var_0._id_ACAE = var_1;
    _id_ACAD( var_0 );
    thread _id_ACA8( var_0 );

    if ( isplayer( var_0 ) && var_2 == 1 )
        thread _id_ACAA( var_0 );
}

_id_ACAC( var_0 )
{
    var_0 notify( "lightArmor_unset" );
    var_0._id_ACAE = undefined;
    _id_ACAD( var_0 );

    if ( isplayer( var_0 ) )
        var_0 setscriptablepartstate( "light_armor", "neutral", 0 );

    var_0 notify( "remove_light_armor" );
}

_id_ACA7( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    var_11 = 0;
    var_12 = 0;
    var_13 = var_0._id_ACAE;

    if ( !isdefined( var_10 ) )
        var_10 = 1;

    if ( !var_11 )
    {
        if ( var_4 == "MOD_FALLING" || var_4 == "MOD_MELEE" )
            var_11 = 1;
    }

    if ( !var_11 )
    {
        if ( scripts\engine\utility::_id_9D74( var_4 ) && scripts\mp\utility\game::isheadshot( var_5, var_8, var_4, var_1 ) )
            var_11 = 1;
    }

    if ( !var_11 )
    {
        if ( var_4 == "MOD_IMPACT" )
        {
            if ( scripts\mp\weapons::_id_9FA9( var_5 ) || scripts\mp\weapons::isaxeweapon( var_5 ) )
                var_11 = 1;
        }
    }

    if ( !var_11 )
    {
        if ( isexplosivedamagemod( var_4 ) )
        {
            if ( isdefined( var_9 ) && isdefined( var_9._id_11180 ) && var_9._id_11180 == var_0 )
                var_11 = 1;
        }
    }

    if ( !var_11 )
    {
        if ( scripts\mp\utility\game::issuperdamagesource( var_5 ) )
            var_11 = 1;
    }

    if ( !var_11 )
    {
        var_12 = min( var_2 + var_3, var_0._id_ACAE );
        var_13 -= var_2 + var_3;

        if ( !var_10 )
            var_0._id_ACAE -= var_2 + var_3;

        var_2 = 0;
        var_3 = 0;

        if ( var_13 <= 0 )
        {
            var_2 = abs( var_13 );
            var_3 = 0;

            if ( !var_10 )
                _id_ACAC( var_0 );
        }
    }

    if ( !var_10 )
        _id_ACAD( self );

    if ( var_12 > 0 && var_2 == 0 )
        var_2 = 1;

    return [ var_12, var_2, var_3 ];
}

_id_ACA6( var_0 )
{
    if ( var_0 scripts\mp\heavyarmor::_id_8BFA() )
        return 1;

    return 0;
}

_id_ACA8( var_0 )
{
    var_0 endon( "disconnect" );
    var_0 endon( "lightArmor_set" );
    var_0 endon( "lightArmor_unset" );
    var_0 waittill( "death" );
    thread _id_ACAC( var_0 );
}

_id_ACAD( var_0 )
{
    if ( !isplayer( var_0 ) )
        return;

    if ( isdefined( level._id_3AEC ) )
        var_0 setclientomnvar( "ui_uplink_carrier_armor", int( _id_7F73( var_0 ) ) );
}

_id_ACAA( var_0 )
{
    var_0 setscriptablepartstate( "light_armor", "active", 0 );
}

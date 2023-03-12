// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_D790()
{
    var_0 = spawnstruct();
    level._id_D73A = var_0;
    var_0._id_C4A3 = [ "primary", "secondary" ];
    var_0._id_C4A3["primary"][0] = "ui_power_num_charges";
    var_0._id_C4A3["primary"][1] = "ui_power_max_charges";
    var_0._id_C4A3["primary"][2] = "ui_power_recharge";
    var_0._id_C4A3["primary"][3] = "ui_power_id";
    var_0._id_C4A3["primary"][4] = "ui_power_consume";
    var_0._id_C4A3["primary"][5] = "ui_power_disabled";
    var_0._id_C4A3["primary"][6] = "ui_power_state";
    var_0._id_C4A3["secondary"][0] = "ui_power_secondary_num_charges";
    var_0._id_C4A3["secondary"][1] = "ui_power_secondary_max_charges";
    var_0._id_C4A3["secondary"][2] = "ui_power_secondary_recharge";
    var_0._id_C4A3["secondary"][3] = "ui_power_id_secondary";
    var_0._id_C4A3["secondary"][4] = "ui_power_secondary_consume";
    var_0._id_C4A3["secondary"][5] = "ui_power_secondary_disabled";
    var_0._id_C4A3["secondary"][6] = "ui_power_secondary_state";
}

_id_D789( var_0, var_1, var_2, var_3 )
{
    if ( var_0 == "scripted" )
        return;

    self setclientomnvar( _id_D78F( var_0, 3 ), var_1 );
    var_4 = scripts\engine\utility::ter_op( var_2, 1000, 0 );
    self setclientomnvar( _id_D78F( var_0, 2 ), var_4 );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    self setclientomnvar( _id_D78F( var_0, 0 ), var_3 );
    self setclientomnvar( _id_D78F( var_0, 4 ), 0 );
}

_id_D78C( var_0 )
{
    if ( var_0 == "scripted" )
        return;

    self setclientomnvar( _id_D78F( var_0, 3 ), -1 );
    self setclientomnvar( _id_D78F( var_0, 2 ), -1 );
    self setclientomnvar( _id_D78F( var_0, 0 ), 0 );
    self setclientomnvar( _id_D78F( var_0, 4 ), -1 );
}

_id_D791( var_0, var_1 )
{
    self setclientomnvar( _id_D78F( var_0, 0 ), int( var_1 ) );
}

_id_D796( var_0, var_1 )
{
    self setclientomnvar( _id_D78F( var_0, 1 ), int( var_1 ) );
}

_id_D794( var_0, var_1 )
{
    self setclientomnvar( _id_D78F( var_0, 4 ), var_1 );
}

_id_D797( var_0, var_1 )
{
    self setclientomnvar( _id_D78F( var_0, 2 ), int( var_1 ) );
}

_id_D793( var_0, var_1 )
{
    self setclientomnvar( _id_D78F( var_0, 5 ), var_1 );
}

powershud_updatepoweroffcooldown( var_0, var_1 )
{
    var_2 = scripts\engine\utility::ter_op( var_1, 1, 0 );
    self setclientomnvar( _id_D78F( var_0, 6 ), var_2 );
}

_id_D798( var_0, var_1 )
{
    self setclientomnvar( _id_D78F( var_0, 6 ), var_1 );
}

_id_D78B( var_0 )
{
    _id_D794( var_0, 1 );
}

_id_D78D( var_0 )
{
    _id_D794( var_0, 0 );
}

_id_D78A( var_0, var_1 )
{
    _id_D797( var_0, 0 );

    if ( isdefined( var_1 ) && var_1 )
        _id_D793( var_0, 1 );

    _id_D798( var_0, 1 );
}

_id_D78E( var_0, var_1 )
{
    _id_D797( var_0, 1000 );

    if ( isdefined( var_1 ) && var_1 )
        _id_D793( var_0, 0 );

    if ( var_0 == "primary" )
        self playlocalsound( "mp_ability_ready_L1" );
    else
        self playlocalsound( "mp_ability_ready_R1" );

    _id_D798( var_0, 0 );
}

_id_D792( var_0, var_1 )
{
    _id_D797( var_0, 1000 * var_1 );
}

_id_D795( var_0, var_1 )
{
    _id_D797( var_0, 1000 * var_1 );
}

_id_D78F( var_0, var_1 )
{
    if ( var_0 == "scripted" )
        return;

    return level._id_D73A._id_C4A3[var_0][var_1];
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_9539()
{
    if ( !isdefined( level._id_2578 ) )
        level._id_2578 = spawnstruct();

    _id_970C();
    level._id_C56F = ::_id_C56F;
}

_id_C56F()
{
    _id_20B1( "default" );
}

_id_970C()
{
    _id_1736( "default", "generic", 0.15, 0.9, 2 );
}

_id_1736( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    _id_9CAB( var_1 );
    var_5["roomtype"] = var_1;
    var_5["wetlevel"] = var_2;
    var_5["drylevel"] = var_3;
    var_5["fadetime"] = var_4;
    level._id_2578._id_E490[var_0] = var_5;
}

_id_9CAB( var_0 )
{

}

_id_20B1( var_0 )
{
    if ( !isdefined( level._id_2578._id_E490[var_0] ) )
        var_1 = level._id_2578._id_E490["default"];
    else
        var_1 = level._id_2578._id_E490[var_0];
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    var_0 = spawnstruct();
    var_0._id_92B8 = "deployable_speed_strip";
    var_0._id_039B = "deployable_speed_strip_marker_mp";
    var_0._id_110EA = "deployable_speed_strip";
    var_0._id_85E7 = scripts\mp\speedstrip::_id_109C1;
    level._id_2F30["deployable_speed_strip"] = var_0;
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "deployable_speed_strip", ::_id_128DD );
}

_id_128DD( var_0, var_1 )
{
    var_2 = scripts\mp\killstreaks\deployablebox::_id_2A63( var_0, "deployable_speed_strip" );

    if ( !isdefined( var_2 ) || !var_2 )
        return 0;

    scripts\mp\matchdata::_id_AFC9( "deployable_speed_strip", self.origin );
    return 1;
}

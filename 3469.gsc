// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    var_0 = spawnstruct();
    var_0._id_92B8 = "deployable_adrenaline_mist";
    var_0._id_039B = "deployable_adrenaline_mist_marker_mp";
    var_0._id_110EA = "deployable_adrenaline_mist";
    var_0._id_85E7 = scripts\mp\adrenaline::_id_18A5;
    level._id_2F30["deployable_adrenaline_mist"] = var_0;
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "deployable_adrenaline_mist", ::_id_128DD );
}

_id_128DD( var_0, var_1 )
{
    var_2 = scripts\mp\killstreaks\deployablebox::_id_2A63( var_0, "deployable_adrenaline_mist" );

    if ( !isdefined( var_2 ) || !var_2 )
        return 0;

    scripts\mp\matchdata::_id_AFC9( "deployable_adrenaline_mist", self.origin );
    return 1;
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_2AD0()
{
    if ( isdefined( level._id_119E["seeker_mp"] ) )
        return;

    var_0 = spawnstruct();
    var_0._id_1581 = [];
    var_0._id_1581[0] = _id_0C26::_id_98CB;
    var_0._id_1581[1] = _id_0C26::_id_2A74;
    var_0._id_1581[2] = _id_0C26::_id_2A73;
    var_0._id_1581[3] = _id_0C26::_id_3D48;
    var_0._id_1581[4] = _id_0C26::_id_3D47;
    var_0._id_1581[5] = _id_0C26::_id_24D7;
    var_0._id_1581[6] = _id_0C26::_id_24D6;
    var_0._id_1581[7] = _id_0C26::_id_6385;
    var_0._id_1581[8] = _id_0C26::_id_69F4;
    var_0._id_1581[9] = _id_0C26::_id_69F3;
    level._id_119E["seeker_mp"] = var_0;
}

_id_DEE8()
{
    _id_2AD0();
    _func_2D8( "seeker_mp" );
}

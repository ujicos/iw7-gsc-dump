// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_95E2()
{
    if ( !scripts\engine\utility::_id_16F3( "init_flags", ::_id_95E2 ) )
        return;

    level._id_6E25 = [];
    level._id_6E6E = [];
    level._id_7763 = 0;
    scripts\engine\utility::_id_95C6( "sp_stat_tracking_func" );
    level._id_6E46 = spawnstruct();
    level._id_6E46 _id_23D9();
}

_id_23D9()
{
    self._id_12BA3 = "generic" + level._id_7763;
    level._id_7763++;
}

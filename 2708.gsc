// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( !isdefined( game["clientMatchDataDef"] ) )
    {
        game["clientMatchDataDef"] = "mp/clientmatchdata.ddl";
        setclientmatchdatadef( game["clientMatchDataDef"] );
        setclientmatchdata( "map", level.script );
    }

    level._id_B48C = 200;
}

_id_38C6( var_0 )
{
    if ( isagent( var_0 ) )
        return 0;

    return var_0._id_41F0 < level._id_B4B0;
}

_id_38C7( var_0 )
{
    return var_0 < level._id_B48C;
}

_id_AFD5( var_0 )
{
    var_1 = getclientmatchdata( "deathCount" );

    if ( !_id_38C6( self ) || !_id_38C7( var_1 ) )
        return;

    if ( isplayer( var_0 ) && _id_38C6( var_0 ) )
        self _meth_81E9( var_1, self._id_41F0, var_0, var_0._id_41F0 );
    else
        self _meth_81E9( var_1, self._id_41F0, undefined, undefined );
}

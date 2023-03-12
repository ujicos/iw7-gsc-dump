// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_10036()
{
    return getdvarint( "com_codcasterEnabled", 0 ) == 1 && getdvarint( "systemlink" );
}

_id_38C6( var_0 )
{
    if ( isagent( var_0 ) )
        return 0;

    return var_0._id_41F0 < level._id_B4B0;
}

_id_499E( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_4333._id_D38C )
        var_1[var_3[0]] = var_3[1];

    return var_1;
}

_id_E159( var_0 )
{
    level endon( "game_ended" );
    var_0 waittill( "disconnect" );

    if ( !isdefined( level._id_4333.players[var_0._id_41F0] ) )
        return;

    level._id_4333.players[var_0._id_41F0] = undefined;
}

_id_3DFC( var_0 )
{
    if ( !isdefined( level._id_4333.players[var_0._id_41F0] ) )
    {
        var_1 = _id_499E( var_0 );
        level._id_4333.players[var_0._id_41F0] = var_1;
        thread _id_E159( var_0 );
    }
}

init()
{
    setcodcasterclientmatchdata( "map", level.script );
    var_0 = spawnstruct();
    var_0._id_D38C = [ [ "damageDone", 0 ], [ "longestKillstreak", 0 ], [ "shutdowns", 0 ], [ "gametypePoints", 0 ] ];
    var_0.players = [];
    level._id_4333 = var_0;
}

_id_F6B2( var_0 )
{
    foreach ( var_2 in level._id_4333._id_D38C )
        setcodcasterclientmatchdata( "players", var_0._id_4334, var_2[0], level._id_4333.players[var_0._id_41F0][var_2[0]] );

    setcodcasterclientmatchdata( "players", var_0._id_4334, "username", var_0.name );
}

_id_F22C()
{
    var_0 = 0;

    foreach ( var_2 in level.players )
    {
        _id_3DFC( var_2 );
        var_2._id_4334 = var_0;
        _id_F6B2( var_2 );
        var_0++;
    }

    sendcodcasterclientmatchdata();
}

_id_F695( var_0, var_1, var_2 )
{
    if ( !_id_38C6( var_0 ) )
        return;

    _id_3DFC( var_0 );
    var_3 = level._id_4333.players[var_0._id_41F0];

    if ( !isdefined( var_3 ) || !isdefined( var_3[var_1] ) )
        return;

    level._id_4333.players[var_0._id_41F0][var_1] = var_2;
}

_id_7E39( var_0, var_1 )
{
    if ( !_id_38C6( var_0 ) )
        return;

    _id_3DFC( var_0 );
    var_2 = level._id_4333.players[var_0._id_41F0];

    if ( !isdefined( var_2 ) || !isdefined( var_2[var_1] ) )
        return;

    return var_2[var_1];
}

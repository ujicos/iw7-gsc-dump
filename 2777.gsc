// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_C79F = 0;
    level._id_C797 = [];
    level.outlineidspending = [];
    level thread _id_C788();
    level thread _id_C7A4();
    level thread outlineidswatchpending();
}

_id_C796( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !isdefined( var_0._id_C7AE ) )
        var_0._id_C7AE = [];

    var_8 = spawnstruct();
    var_8.isdisabled = 0;
    var_8._id_D925 = var_5;
    var_8._id_43A6 = var_1;
    var_8._id_D432 = var_2;
    var_8.playersvisibletopending = [];
    var_8._id_525C = var_3;
    var_8._id_6C10 = var_4;
    var_8.type = var_6;

    if ( var_6 == "TEAM" )
        var_8.team = var_7;

    var_9 = _id_C79A();
    var_0._id_C7AE[var_9] = var_8;
    _id_C787( var_0 );
    var_10 = [];

    foreach ( var_12 in var_8._id_D432 )
    {
        if ( !canoutlineforplayer( var_12 ) )
        {
            var_8.playersvisibletopending[var_8.playersvisibletopending.size] = var_12;
            level.outlineidspending[var_9] = var_0;
            continue;
        }

        var_13 = _id_C79B( var_0, var_12 );

        if ( !isdefined( var_13 ) || var_13 == var_8 || var_13._id_D925 == var_8._id_D925 )
            var_10[var_10.size] = var_12;
    }

    if ( var_10.size > 0 )
        var_0 _hudoutlineenableforclients( var_10, var_8._id_43A6, var_8._id_525C, var_8._id_6C10 );

    return var_9;
}

_id_C790( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
    {
        level._id_C797 = scripts\engine\utility::_id_22BC( level._id_C797 );
        return;
    }
    else if ( !isdefined( var_1._id_C7AE ) )
    {
        _id_C7AC( var_1 );
        return;
    }

    var_2 = var_1._id_C7AE[var_0];

    if ( !isdefined( var_2 ) || var_2.isdisabled )
        return;

    var_2.isdisabled = 1;

    foreach ( var_4 in var_2._id_D432 )
    {
        if ( !isdefined( var_4 ) )
            continue;

        if ( !canoutlineforplayer( var_4 ) )
        {
            var_2.playersvisibletopending[var_2.playersvisibletopending.size] = var_4;
            level.outlineidspending[var_0] = var_1;
            continue;
        }

        var_5 = _id_C79B( var_1, var_4 );

        if ( isdefined( var_5 ) )
        {
            if ( var_5._id_D925 <= var_2._id_D925 )
                var_1 _hudoutlineenableforclient( var_4, var_5._id_43A6, var_5._id_525C, var_5._id_6C10 );

            continue;
        }

        var_1 _meth_818C( var_4 );
    }

    if ( var_2.playersvisibletopending.size == 0 )
    {
        var_1._id_C7AE[var_0] = undefined;

        if ( var_1._id_C7AE.size == 0 )
            _id_C7AC( var_1 );
    }
}

_id_C7AB( var_0 )
{
    if ( !isdefined( var_0._id_C7AE ) || var_0._id_C7AE.size == 0 )
        return;

    foreach ( var_7, var_2 in var_0._id_C7AE )
    {
        if ( !isdefined( var_2 ) || var_2.isdisabled )
            continue;

        foreach ( var_4 in var_2._id_D432 )
        {
            if ( !isdefined( var_4 ) )
                continue;

            var_5 = _id_C79B( var_0, var_4 );

            if ( isdefined( var_5 ) )
                var_0 _hudoutlineenableforclient( var_4, var_5._id_43A6, var_5._id_525C, var_5._id_6C10 );
        }
    }
}

_id_C788()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        level thread _id_C7A3( var_0 );
    }
}

_id_C7A3( var_0 )
{
    level endon( "game_ended" );
    var_0 waittill( "disconnect" );
    _id_C7AD( var_0 );
    _id_C791( var_0 );
}

_id_C7A4()
{
    for (;;)
    {
        level waittill( "joined_team", var_0 );

        if ( !isdefined( var_0.team ) || var_0.team == "spectator" )
            continue;

        thread _id_C7A5( var_0 );
    }
}

_id_C7A5( var_0 )
{
    var_0 notify( "outlineOnPlayerJoinedTeam_onFirstSpawn" );
    var_0 endon( "outlineOnPlayerJoinedTeam_onFirstSpawn" );
    var_0 endon( "disconnect" );
    var_0 waittill( "spawned_player" );
    _id_C7AD( var_0 );
    _id_C791( var_0 );
    _id_C786( var_0 );
}

_id_C7AD( var_0 )
{
    level._id_C797 = scripts\engine\utility::_id_22BC( level._id_C797 );

    foreach ( var_2 in level._id_C797 )
    {
        var_3 = 0;

        foreach ( var_5 in var_2._id_C7AE )
        {
            var_5._id_D432 = scripts\engine\utility::_id_22BC( var_5._id_D432 );

            if ( isdefined( var_0 ) && scripts\engine\utility::array_contains( var_5._id_D432, var_0 ) )
            {
                var_5._id_D432 = scripts\engine\utility::array_remove( var_5._id_D432, var_0 );
                var_3 = 1;
            }
        }

        if ( var_3 && isdefined( var_2 ) && isdefined( var_0 ) )
            var_2 _meth_818C( var_0 );
    }
}

_id_C786( var_0 )
{
    foreach ( var_2 in level._id_C797 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_3 = undefined;

        foreach ( var_5 in var_2._id_C7AE )
        {
            if ( var_5.type == "ALL" || var_5.type == "TEAM" && var_5.team == var_0.team )
            {
                if ( !scripts\engine\utility::array_contains( var_5._id_D432, var_0 ) )
                    var_5._id_D432[var_5._id_D432.size] = var_0;
                else
                {

                }

                if ( !isdefined( var_3 ) || var_5._id_D925 > var_3._id_D925 )
                    var_3 = var_5;
            }
        }

        if ( isdefined( var_3 ) )
            var_2 _hudoutlineenableforclient( var_0, var_3._id_43A6, var_3._id_525C, var_3._id_6C10 );
    }
}

_id_C791( var_0 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_0._id_C7AE ) || var_0._id_C7AE.size == 0 )
        return;

    foreach ( var_3, var_2 in var_0._id_C7AE )
        _id_C790( var_3, var_0 );
}

_id_C787( var_0 )
{
    if ( !scripts\engine\utility::array_contains( level._id_C797, var_0 ) )
        level._id_C797[level._id_C797.size] = var_0;
}

_id_C7AC( var_0 )
{
    level._id_C797 = scripts\engine\utility::array_remove( level._id_C797, var_0 );
}

_id_C79C( var_0 )
{
    var_1 = -1;

    if ( !isdefined( var_0._id_C7AE ) || var_0.size == 0 )
        return var_1;

    var_2 = undefined;

    foreach ( var_5, var_4 in var_0._id_C7AE )
    {
        if ( !isdefined( var_4 ) || var_4.isdisabled )
            continue;

        if ( !isdefined( var_2 ) || var_4._id_D925 > var_2._id_D925 )
        {
            var_2 = var_4;
            var_1 = var_5;
        }
    }

    return var_1;
}

_id_C79B( var_0, var_1 )
{
    var_2 = undefined;

    if ( !isdefined( var_0._id_C7AE ) || var_0.size == 0 )
        return var_2;

    foreach ( var_5, var_4 in var_0._id_C7AE )
    {
        if ( !isdefined( var_4 ) || var_4.isdisabled )
            continue;

        if ( scripts\engine\utility::array_contains( var_4._id_D432, var_1 ) && ( !isdefined( var_2 ) || var_4._id_D925 > var_2._id_D925 ) )
            var_2 = var_4;
    }

    return var_2;
}

_id_C79A()
{
    level._id_C79F++;
    return level._id_C79F;
}

_id_C7A9( var_0 )
{
    var_0 = tolower( var_0 );
    var_1 = undefined;

    switch ( var_0 )
    {
        case "lowest":
            var_1 = 0;
            break;
        case "level_script":
            var_1 = 1;
            break;
        case "equipment":
            var_1 = 2;
            break;
        case "perk":
            var_1 = 3;
            break;
        case "perk_superior":
            var_1 = 4;
            break;
        case "killstreak":
            var_1 = 5;
            break;
        case "killstreak_personal":
            var_1 = 6;
            break;
        default:
            var_1 = 0;
            break;
    }

    return var_1;
}

_id_C78A( var_0 )
{
    var_0 = tolower( var_0 );
    var_1 = undefined;

    switch ( var_0 )
    {
        case "white":
            var_1 = 0;
            break;
        case "red":
            var_1 = 1;
            break;
        case "green":
            var_1 = 2;
            break;
        case "cyan":
            var_1 = 3;
            break;
        case "orange":
            var_1 = 4;
            break;
        case "yellow":
            var_1 = 5;
            break;
        case "blue":
            var_1 = 6;
            break;
        case "none":
            var_1 = 7;
            break;
        default:
            var_1 = 0;
            break;
    }

    return var_1;
}

outlineidswatchpending()
{
    for (;;)
    {
        waittillframeend;

        foreach ( var_3, var_1 in level.outlineidspending )
        {
            if ( !isdefined( var_1 ) )
                continue;

            if ( !isdefined( var_1._id_C7AE ) )
                continue;

            var_2 = var_1._id_C7AE[var_3];

            if ( !isdefined( var_2 ) )
                continue;

            if ( var_2.playersvisibletopending.size > 0 )
            {
                if ( outlinerefreshpending( var_1, var_3 ) )
                    level.outlineidspending[var_3] = undefined;
            }
        }

        scripts\engine\utility::waitframe();
    }
}

outlinerefreshpending( var_0, var_1 )
{
    var_2 = var_0._id_C7AE[var_1];

    foreach ( var_6, var_4 in var_2.playersvisibletopending )
    {
        if ( !isdefined( var_4 ) )
            continue;

        if ( canoutlineforplayer( var_4 ) )
        {
            var_5 = _id_C79B( var_0, var_4 );

            if ( isdefined( var_5 ) )
                var_0 _meth_818F( var_4, var_5._id_43A6, var_5._id_525C, var_5._id_6C10 );
            else
                var_0 _meth_818C( var_4 );

            var_2.playersvisibletopending[var_6] = undefined;
        }
    }

    var_2.playersvisibletopending = scripts\engine\utility::_id_22BC( var_2.playersvisibletopending );

    if ( var_2.playersvisibletopending.size == 0 )
    {
        if ( var_2.isdisabled )
            var_0._id_C7AE[var_1] = undefined;

        if ( var_0._id_C7AE.size == 0 )
            _id_C7AC( var_0 );

        return 1;
    }

    return 0;
}

canoutlineforplayer( var_0 )
{
    return var_0.sessionstate != "spectator";
}

_hudoutlineenableforclient( var_0, var_1, var_2, var_3 )
{
    if ( var_1 == 7 )
        self _meth_818C( var_0 );
    else
        self _meth_818F( var_0, var_1, var_2, var_3 );
}

_hudoutlineenableforclients( var_0, var_1, var_2, var_3 )
{
    if ( var_1 == 7 )
        self _meth_818D( var_0 );
    else
        self _meth_8190( var_0, var_1, var_2, var_3 );
}

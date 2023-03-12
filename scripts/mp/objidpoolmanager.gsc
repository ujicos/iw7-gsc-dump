// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    var_0 = spawnstruct();
    var_0._id_0019 = [];
    var_0.reclaimed = [];
    var_0.index = 0;
    level.objidpool = var_0;
}

requestminimapid( var_0 )
{
    var_1 = getnext( var_0 );

    if ( var_1 == -1 )
        return -1;

    var_2 = spawnstruct();
    var_2._id_D925 = var_0;
    var_2.requesttime = gettime();
    var_2._id_C2B5 = var_1;
    level.objidpool._id_0019[var_1] = var_2;
    return var_1;
}

removebest( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level.objidpool._id_0019 )
    {
        if ( var_3._id_D925 <= var_0 )
            var_1[var_1.size] = var_3;
    }

    scripts\engine\utility::_id_22C3( var_1, ::comparepriorityandtime );
    return returnminimapid( var_1[0]._id_C2B5 );
}

comparepriorityandtime( var_0, var_1 )
{
    if ( var_0._id_D925 == var_1._id_D925 )
        return var_0.requesttime < var_1.requesttime;
    else
        return var_0._id_D925 < var_1._id_D925;
}

getnext( var_0 )
{
    if ( !level.objidpool.reclaimed.size )
    {
        if ( level.objidpool.index == 32 )
            return -1;
        else
        {
            var_1 = level.objidpool.index;
            level.objidpool.index++;
        }
    }
    else
    {
        var_1 = level.objidpool.reclaimed[level.objidpool.reclaimed.size - 1];
        level.objidpool.reclaimed[level.objidpool.reclaimed.size - 1] = undefined;
    }

    return var_1;
}

returnminimapid( var_0 )
{
    if ( !isdefined( var_0 ) || var_0 == -1 )
        return 0;

    for ( var_1 = 0; var_1 < level.objidpool.reclaimed.size; var_1++ )
    {
        if ( var_0 == level.objidpool.reclaimed[var_1] )
            return 0;
    }

    level.objidpool._id_0019[var_0] = undefined;
    objective_delete( var_0 );
    level.objidpool.reclaimed[level.objidpool.reclaimed.size] = var_0;
    return 1;
}

minimap_objective_add( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_0 == -1 )
        return;

    if ( isdefined( var_2 ) )
    {
        if ( isdefined( var_3 ) )
        {
            if ( isdefined( var_4 ) )
                _func_14E( var_0, var_1, var_2, var_3, var_4 );
            else
                _func_14E( var_0, var_1, var_2, var_3 );
        }
        else
            _func_14E( var_0, var_1, var_2 );
    }
    else
        _func_14E( var_0, var_1 );
}

minimap_objective_state( var_0, var_1 )
{
    if ( var_0 == -1 )
        return;

    objective_state( var_0, var_1 );
}

minimap_objective_position( var_0, var_1 )
{
    if ( var_0 == -1 )
        return;

    objective_position( var_0, var_1 );
}

minimap_objective_icon( var_0, var_1 )
{
    if ( var_0 == -1 )
        return;

    objective_icon( var_0, var_1 );
}

minimap_objective_icon_colortype( var_0, var_1 )
{
    if ( var_0 == -1 )
        return;

    _func_320( var_0, var_1 );
}

minimap_objective_icon_backgroundtype( var_0, var_1 )
{
    if ( var_0 == -1 )
        return;

    _func_31F( var_0, var_1 );
}

minimap_objective_onentity( var_0, var_1 )
{
    if ( var_0 == -1 )
        return;

    objective_onentity( var_0, var_1 );
}

minimap_objective_onentitywithrotation( var_0, var_1 )
{
    if ( var_0 == -1 )
        return;

    objective_onentitywithrotation( var_0, var_1 );
}

minimap_objective_player( var_0, var_1 )
{
    if ( var_0 == -1 )
        return;

    objective_player( var_0, var_1 );
}

minimap_objective_team( var_0, var_1 )
{
    if ( var_0 == -1 )
        return;

    objective_team( var_0, var_1 );
}

minimap_objective_playermask_hidefromall( var_0 )
{
    if ( var_0 == -1 )
        return;

    objective_playermask_hidefromall( var_0 );
}

minimap_objective_playermask_hidefrom( var_0, var_1 )
{
    if ( var_0 == -1 )
        return;

    objective_playermask_hidefrom( var_0, var_1 );
}

minimap_objective_playermask_showto( var_0, var_1 )
{
    if ( var_0 == -1 )
        return;

    objective_playermask_showto( var_0, var_1 );
}

minimap_objective_playermask_showtoall( var_0 )
{
    if ( var_0 == -1 )
        return;

    objective_playermask_showtoall( var_0 );
}

minimap_objective_playerteam( var_0, var_1 )
{
    if ( var_0 == -1 )
        return;

    objective_playerteam( var_0, var_1 );
}

minimap_objective_playerenemyteam( var_0, var_1 )
{
    if ( var_0 == -1 )
        return;

    objective_playerenemyteam( var_0, var_1 );
}

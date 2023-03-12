// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_744A( var_0, var_1 )
{
    level._id_37A6 = spawn( "script_model", var_0 );
    level._id_37A6 setmodel( "tag_origin" );
    level._id_37A6.angles = var_1;
}

_id_37B1( var_0, var_1, var_2 )
{
    level._id_D460 predictstreampos( var_0.origin );
    var_3 = distance( level._id_37A6.origin, var_0.origin );
    var_4 = var_3 / var_1;

    if ( var_4 < 0.05 )
        var_4 = 0.05;

    var_5 = 0;

    if ( var_2 )
        var_5 = var_4 * 0.1;

    level._id_37A6._id_BC77 = var_0;
    level._id_37A6 moveto( var_0.origin, var_4, var_5, var_5 );
    level._id_37A6 rotateto( var_0.angles, var_4, var_5, var_5 );
    wait( var_4 );
}

_id_7449( var_0, var_1, var_2, var_3, var_4 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( isdefined( level._id_37A6._id_BC77 ) )
    {
        level._id_37A6.origin = level._id_37A6._id_BC77.origin;
        level._id_37A6.angles = level._id_37A6._id_BC77.angles;
    }

    level notify( "camera_move" );
    level endon( "camera_move" );

    if ( !isdefined( var_1 ) )
        var_1 = 900;

    var_5 = var_0;

    if ( var_2 )
    {
        level._id_37A6.origin = var_5.origin;
        level._id_37A6.angles = var_5.angles;
    }
    else
        _id_37B1( var_5, var_1, var_3 );

    while ( isdefined( var_5._id_0334 ) )
    {
        if ( !isdefined( var_5._id_0334 ) )
            return;

        var_5 = getent( var_5._id_0334, "targetname" );
        _id_37B1( var_5, var_1, var_3 );
    }

    level._id_37A6._id_BC77 = undefined;

    if ( isdefined( var_4 ) )
        self thread [[ var_4 ]]();
}

_id_744B( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    level notify( "camera_teleport" );
    level endon( "camera_teleport" );
    level._id_D460 predictstreampos( var_0.origin );
    level.transition_interrupted = 1;
    frontendscenecamerafade( 0, var_3 );
    wait( var_3 + 0.05 );
    frontendscenecamerafov( var_1, 0 );
    level._id_37A6 dontinterpolate();
    level._id_37A6.origin = var_0.origin;
    level._id_37A6.angles = var_0.angles;
    level._id_37A6._id_BC77 = undefined;

    if ( isdefined( var_2 ) )
        frontendscenecameracinematic( var_2 );

    wait 0.1;

    if ( isdefined( var_5 ) )
        [[ var_5 ]]();

    frontendscenecamerafade( 1, var_4 );
    level.transition_interrupted = 0;
}

_id_744C( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self cameralinkto( level._id_37A6, "tag_origin" );
    level._id_1642 = frontendscenegetactivesection();
    [[ var_0 ]]( level._id_1642 );
    scripts\engine\utility::waitframe();

    for (;;)
    {
        var_1 = frontendscenegetactivesection();

        if ( var_1.name == level._id_1642.name && var_1.index == level._id_1642.index )
        {
            scripts\engine\utility::waitframe();
            continue;
        }

        level._id_1642 = var_1;
        [[ var_0 ]]( var_1 );
    }
}

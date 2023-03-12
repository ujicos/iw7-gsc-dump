// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main()
{
    level._id_93BC = 0;
    scripts\engine\utility::_id_22A1( getentarray( "wire", "targetname" ), ::_id_13D8E );
    var_0 = getentarray( "shutter_left", "targetname" );
    var_1 = getentarray( "shutter_right_open", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0[var_0.size] = var_1[var_2];

    var_1 = getentarray( "shutter_left_closed", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0[var_0.size] = var_1[var_2];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];
        var_3 rotateto( ( var_3.angles[0], var_3.angles[1] + 180, var_3.angles[2] ), 0.1 );
    }

    wait 0.2;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2]._id_10E0E = var_0[var_2].angles[1];

    var_4 = getentarray( "shutter_right", "targetname" );
    var_1 = getentarray( "shutter_left_open", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_4[var_4.size] = var_1[var_2];

    var_1 = getentarray( "shutter_right_closed", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_4[var_4.size] = var_1[var_2];

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
        var_4[var_2]._id_10E0E = var_4[var_2].angles[1];

    var_1 = undefined;
    var_5 = "left";

    for (;;)
    {
        scripts\engine\utility::_id_22A1( var_0, ::_id_101A1, var_5 );
        scripts\engine\utility::_id_22A1( var_4, ::_id_101A2, var_5 );
        level waittill( "wind blows", var_5 );
    }
}

_id_13D32()
{
    for (;;)
    {
        var_0 = "left";

        if ( randomint( 100 ) > 50 )
            var_0 = "right";

        level notify( "wind blows", var_0 );
        wait( 2 + randomfloat( 10 ) );
    }
}

_id_101A1( var_0, var_1 )
{
    level._id_93BC++;
    level endon( "wind blows" );
    var_2 = var_0._id_10E0E;

    if ( var_1 == "left" )
        var_2 += 179.9;

    var_3 = 0.2;
    var_0 rotateto( ( var_0.angles[0], var_2, var_0.angles[2] ), var_3 );
    wait( var_3 + 0.1 );

    for (;;)
    {
        var_4 = randomint( 80 );

        if ( randomint( 100 ) > 50 )
            var_4 *= -1;

        var_2 = var_0.angles[1] + var_4;
        var_5 = var_0.angles[1] + var_4 * -1;

        if ( var_2 < var_0._id_10E0E || var_2 > var_0._id_10E0E + 179 )
            var_2 = var_5;

        var_6 = abs( var_0.angles[1] - var_2 );
        var_3 = var_6 * 0.02 + randomfloat( 2 );

        if ( var_3 < 0.3 )
            var_3 = 0.3;

        var_0 rotateto( ( var_0.angles[0], var_2, var_0.angles[2] ), var_3, var_3 * 0.5, var_3 * 0.5 );
        wait( var_3 );
    }
}

_id_101A2( var_0, var_1 )
{
    level._id_93BC++;
    level endon( "wind blows" );
    var_2 = var_0._id_10E0E;

    if ( var_1 == "left" )
        var_2 += 179.9;

    var_3 = 0.2;
    var_0 rotateto( ( var_0.angles[0], var_2, var_0.angles[2] ), var_3 );
    wait( var_3 + 0.1 );

    for (;;)
    {
        var_4 = randomint( 80 );

        if ( randomint( 100 ) > 50 )
            var_4 *= -1;

        var_2 = var_0.angles[1] + var_4;
        var_5 = var_0.angles[1] + var_4 * -1;

        if ( var_2 < var_0._id_10E0E || var_2 > var_0._id_10E0E + 179 )
            var_2 = var_5;

        var_6 = abs( var_0.angles[1] - var_2 );
        var_3 = var_6 * 0.02 + randomfloat( 2 );

        if ( var_3 < 0.3 )
            var_3 = 0.3;

        var_0 rotateto( ( var_0.angles[0], var_2, var_0.angles[2] ), var_3, var_3 * 0.5, var_3 * 0.5 );
        wait( var_3 );
    }
}

_id_13D8E( var_0 )
{
    var_1 = getentarray( var_0._id_0334, "targetname" );
    var_2 = var_1[0].origin;
    var_3 = var_1[1].origin;
    var_4 = vectortoangles( var_2 - var_3 );
    var_5 = spawn( "script_model", ( 0, 0, 0 ) );
    var_5.origin = var_2 * 0.5 + var_3 * 0.5;
    var_5.angles = var_4;
    var_0 linkto( var_5 );
    var_6 = 2;
    var_7 = 0.9;
    var_8 = 4 + randomfloat( 2 );
    var_5 _meth_826D( var_8 * 0.5, 0.2 );
    wait 0.2;

    for (;;)
    {
        var_9 = var_6 + randomfloat( var_7 ) - var_7 * 0.5;
        var_5 _meth_826D( var_8, var_9, var_9 * 0.5, var_9 * 0.5 );
        wait( var_9 );
        var_5 _meth_826D( var_8 * -1, var_9, var_9 * 0.5, var_9 * 0.5 );
        wait( var_9 );
    }
}

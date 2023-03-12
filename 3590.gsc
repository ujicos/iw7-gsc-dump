// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{

}

_id_10A54( var_0 )
{
    var_0._id_11832 = gettime();
    var_0._id_1180D = anglestoforward( self getplayerangles() );
    var_0 setscriptablepartstate( "trailDelayed", "active", 0 );
    var_0 thread _id_40FA( undefined, self );
    var_0._id_B79B = [];

    for ( var_1 = 0; var_1 < 2; var_1++ )
    {
        var_2 = scripts\mp\utility\game::_id_1302( "split_grenade_mini_mp", var_0.origin, ( 0, 0, 0 ), 100, 1 );
        scripts\mp\utility\game::_id_85C6( var_2, "split_grenade_mp" );
        var_2._id_69BA = 1;
        var_2.parentinflictor = var_0 getentitynumber();
        var_2 linkto( var_0 );
        var_2 hide( 1 );
        var_2 _meth_8587( 1 );
        var_2 thread _id_40FA( var_0, self );
        var_0._id_B79B[var_1] = var_2;
    }

    thread _id_13A84( var_0, 2 );
    thread _id_13B68( var_0 );
}

_id_13B68( var_0 )
{
    var_0 endon( "death" );
    self notify( "watchStuck" );
    self endon( "watchStuck" );
    var_0 waittill( "missile_stuck", var_1 );

    if ( isplayer( var_1 ) )
        thread _id_C576( var_0, var_1 );
    else
        thread _id_C55D( var_0, var_1 );
}

_id_C576( var_0, var_1 )
{
    if ( var_0._id_13C2E == "split_grenade_mp" )
        scripts\mp\weapons::_id_85DD( var_0, var_1, 1 );

    thread _id_0118( var_0 );
}

_id_C55D( var_0, var_1 )
{
    var_0 endon( "death" );
    var_2 = ( gettime() - var_0._id_11832 ) / 1000;
    var_3 = ( 0, 0, 120 ) + var_0._id_1180D * 940;
    var_4 = ( -0, -0, -800 ) * var_2;
    var_5 = var_3 + var_4;
    var_6 = anglestoup( var_0.angles );
    var_7 = vectordot( var_5, var_6 );
    var_5 += -2 * var_7 * var_6;
    var_8 = anglestoup( vectortoangles( var_5 ) );
    var_0._id_13C2E = "split_grenade_mini_mp";
    var_0._id_B79B[var_0._id_B79B.size] = var_0;
    var_9 = max( 0, 2 ) * 9 / -2;

    for ( var_10 = 0; var_10 < 3; var_10++ )
    {
        var_11 = angleclamp( var_9 + var_10 * 9 );
        var_12 = rotatepointaroundvector( var_8, var_5, var_11 );
        var_12 *= 0.55;
        var_13 = randomfloatrange( 0.75, 1 );
        var_14 = var_0._id_B79B[var_10];
        var_14._id_69BA = 0;
        var_14 show();
        var_14 unlink();
        var_14 _meth_8587( 0 );
        var_14 = scripts\mp\utility\game::_id_1302( "split_grenade_mini_mp", var_0.origin, var_12, 100, 1, var_14 );
        var_14 setscriptablepartstate( "trail", "active", 0 );
        thread _id_13A84( var_14, var_13 );
        thread _id_13B68( var_14 );
        var_14 thread _id_40FA( undefined, self );
    }

    var_0._id_B79B[0] setscriptablepartstate( "split", "active", 0 );
}

_id_13A84( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 notify( "watchFuse" );
    var_0 endon( "watchFuse" );
    wait( var_1 );
    thread _id_0118( var_0 );
}

_id_0118( var_0 )
{
    var_0 notify( "death" );
    var_0._id_69BA = 1;
    var_0.origin = var_0.origin;
    var_0 _meth_8587( 1 );
    var_0 setscriptablepartstate( "explode", "active", "false" );
    wait 5;
    var_0 delete();
}

_id_40FA( var_0, var_1 )
{
    self endon( "death" );
    self notify( "cleanupGrenade" );
    self endon( "cleanupGrenade" );

    if ( isdefined( var_0 ) )
        childthread _id_40FE( var_0 );

    if ( isdefined( var_1 ) )
        childthread _id_40FD( var_1 );
}

_id_40FE( var_0 )
{
    var_0 waittill( "death" );

    if ( isdefined( self ) )
        self delete();
}

_id_40FD( var_0 )
{
    var_0 waittill( "disconnect" );

    if ( isdefined( self ) )
        self delete();
}

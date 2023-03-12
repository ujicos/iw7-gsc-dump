// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( !level.teambased )
        return;

    level thread _id_C56E();
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_F1E9 = [];
    }
}

_id_12E86()
{

}

_id_17C1( var_0, var_1, var_2, var_3 )
{
    if ( !level.teambased )
        return;

    var_4 = var_0.origin;
    var_1 endon( "spawned_player" );
    var_1 endon( "disconnect" );
    wait 0.05;
    scripts\mp\utility\game::_id_13842();

    if ( getdvar( "ui_hud_showdeathicons" ) == "0" )
        return;

    if ( level._id_8B38 )
        return;

    if ( isdefined( self._id_A971 ) )
        self._id_A971 destroy();

    var_5 = newteamhudelem( var_2 );
    var_5.x = var_4[0];
    var_5.y = var_4[1];
    var_5.z = var_4[2] + 54;
    var_5.alpha = 0.61;
    var_5._id_0049 = 0;
    var_5._id_0295 = 0;

    if ( level._id_10A56 )
        var_5 setshader( "hud_icon_death", 14, 14 );
    else
        var_5 setshader( "hud_icon_death", 7, 7 );

    var_5 setwaypoint( 0 );
    self._id_A971 = var_5;
    var_5 thread _id_5323( var_3 );
}

_id_5323( var_0 )
{
    self endon( "death" );
    wait( var_0 );
    self fadeovertime( 1.0 );
    self.alpha = 0;
    wait 1.0;
    self destroy();
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._effect["smokewall"] = loadfx( "vfx/iw7/_requests/mp/vfx_smokewall" );
    _id_0AE1::_id_DF06( "power_smokeWall", [ "passive_increased_range", "passive_increased_radius", "passive_increased_duration" ] );
}

_id_E16E()
{
    self notify( "remove_smoke_wall" );
}

_id_1037D( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "remove_smoke_wall" );
    var_2 = "power_smokeWall";
    var_3 = self.angles;

    if ( isdefined( var_1 ) && var_1 >= 0.2 )
        var_4 = self.origin;
    else
    {
        var_5 = var_0 scripts\engine\utility::_id_13734( "missile_stuck", "death" );

        if ( var_5 != "death" )
        {
            var_4 = var_0.origin;
            var_3 = var_0.angles;
            var_6 = anglestoup( var_3 ) * 64;
            var_4 += var_6;
        }
        else
        {
            var_7 = _id_0AE1::_id_7FC5( "power_smokeWall", 500 );
            var_8 = anglestoforward( self.angles ) * var_7;
            var_4 = self.origin + var_8;
        }
    }

    thread _id_1037C( var_4, self );
    playfx( scripts\engine\utility::_id_7ECB( "smokewall" ), var_4, anglestoforward( var_3 ), anglestoup( var_3 ) );
    thread scripts\engine\utility::_id_CE2B( "synaptic_smokewall", var_4 );
}

_id_1037C( var_0, var_1 )
{
    var_2 = undefined;

    if ( level.teambased )
        var_2 = scripts\mp\utility\game::_id_81A0( scripts\mp\utility\game::_id_8027( var_1.team ) );
    else
        var_2 = level._id_3CB5;

    var_3 = 0;

    foreach ( var_5 in var_2 )
    {
        if ( !isdefined( var_5 ) || var_5 == var_1 || !scripts\mp\utility\game::isreallyalive( var_5 ) )
            continue;

        var_6 = var_1 _id_0AE1::_id_7FC4( "power_smokeWall", 65536 );

        if ( distance2dsquared( var_0, var_5.origin ) > var_6 )
            continue;

        var_7 = scripts\engine\trace::_id_48BC( 0, 1, 1, 0, 0, 0, 0 );
        var_8 = physics_raycast( var_0, var_5 geteye(), var_7, undefined, 0, "physicsquery_closest" );

        if ( isdefined( var_8 ) && var_8.size > 0 )
            continue;

        var_9 = var_1 _id_0AE1::_id_7FC1( "power_smokeWall", 1.0 );

        if ( var_5 sightconetrace( var_0 ) >= 0.75 )
            var_5 shellshock( "flashbang_mp", var_9 );

        if ( !var_5 scripts\mp\utility\game::_id_12D6( "specialty_noplayertarget" ) && !var_5 scripts\mp\utility\game::_id_12D6( "specialty_incog" ) )
        {
            var_5 thread _id_E48C( var_1 );
            var_5 scripts\mp\hud_message::_id_1013D( "spotted" );
        }

        var_3++;
    }

    if ( var_3 == 0 )
        var_1 iprintlnbold( "No Threats Detected" );
    else
        var_1 iprintlnbold( var_3 + " Threats Detected" );
}

_id_E48C( var_0 )
{
    self endon( "disconnect" );
    thread scripts\mp\killstreaks\emp_common::_id_5AA9();
    var_1 = scripts\mp\utility\game::_id_C794( self, "orange", var_0, 0, 0, "level_script" );
    var_2 = var_0 _id_0AE1::_id_7FC1( "power_smokeWall", 1.15 );
    scripts\engine\utility::_id_13736( var_2, "death" );

    if ( isdefined( var_0 ) )
        scripts\mp\utility\game::_id_C78F( var_1, self );
}

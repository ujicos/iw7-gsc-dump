// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    _id_0AE1::_id_DF06( "power_opticWave", [ "passive_increased_duration", "passive_increased_range", "passive_increased_speed" ] );
}

_id_E145()
{
    self notify( "remove_optic_wave" );
}

_id_C6AF()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "remove_optic_wave" );
    var_0 = _id_0AE1::_id_7FC6( "power_opticWave", 0.8 );
    self._id_D782["power_opticWave"]._id_0019 = 1;
    self _meth_84D3( "power_active", "opticwave" );
    self playlocalsound( "ghost_optic_wave" );
    thread _id_C6AE( var_0 );
    _id_C6AD( var_0 );
    self._id_D782["power_opticWave"]._id_0019 = 0;
    scripts\engine\utility::waitframe();
}

_id_C6AD( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );

    if ( level.teambased )
        level._id_1679[self.team]++;
    else
        level._id_1679[self.guid]++;

    var_1 = 0;
    var_2 = _id_0AE1::_id_7FC5( "power_opticWave", 1750 );

    foreach ( var_4 in level._id_C928 )
    {
        if ( !scripts\mp\utility\game::isreallyalive( var_4 ) )
            continue;

        if ( !scripts\mp\utility\game::isenemy( var_4 ) )
            continue;

        if ( var_4 scripts\mp\utility\game::_id_12D6( "specialty_noplayertarget" ) || var_4 scripts\mp\utility\game::_id_12D6( "specialty_noscopeoutline" ) )
            continue;

        var_5 = var_4.origin - self.origin;

        if ( 1 && vectordot( anglestoforward( self.angles ), var_5 ) < 0 )
            continue;

        var_6 = var_2 * var_2;

        if ( length2dsquared( var_5 ) > var_6 )
            continue;

        if ( !self _meth_8409( var_4 geteye(), 65, 75 ) )
        {
            if ( !self _meth_8409( var_4.origin, 65, 75 ) )
            {
                if ( !self _meth_8409( var_4 gettagorigin( "j_mainroot" ), 65, 75 ) )
                    continue;
            }
        }

        thread _id_C7A7( var_4, distance2d( self.origin, var_4.origin ) / var_2, var_0 );
        var_1 = 1;
    }
}

_id_C7A7( var_0, var_1, var_2 )
{
    wait( var_2 * var_1 );
    var_3 = scripts\mp\utility\game::_id_C794( var_0, "orange", self, 0, 1, "level_script" );

    if ( !isai( var_0 ) )
        var_0 scripts\mp\utility\game::_id_12E5( 5 );

    var_4 = _id_0AE1::_id_7FC1( "power_opticWave", 1.35 );
    _id_13AA0( var_3, var_0, var_4 );
}

_id_13AA0( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\engine\utility::_id_13737( var_2, "leave" );

    if ( isdefined( var_1 ) )
    {
        scripts\mp\utility\game::_id_C78F( var_0, var_1 );

        if ( !isai( var_1 ) )
            var_1 scripts\mp\utility\game::_id_12E4();
    }
}

_id_C6AE( var_0 )
{
    self visionsetnakedforplayer( "opticwave_mp", 0.0 );
    var_1 = spawn( "script_model", self gettagorigin( "tag_eye" ) );
    var_1 setmodel( "prop_mp_optic_wave_scr" );
    var_1.angles = self getplayerangles();
    var_1 _meth_831F( self );
    var_1 setscriptablepartstate( "effects", "active", 0 );
    var_2 = var_1.origin + anglestoforward( var_1.angles ) * 1750;
    var_1 moveto( var_2, var_0 );
    wait( var_0 );
    self visionsetnakedforplayer( "", 0.5 );
    var_1 delete();
}

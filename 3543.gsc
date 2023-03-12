// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_2850 = [];
    level._id_2850["wave"] = loadfx( "vfx/iw7/_requests/mp/trail_kinetic_wave" );
    level._id_2850["wedge"] = loadfx( "vfx/iw7/_requests/mp/vfx_kinetic_wave_wedge" );
    level._id_2850["halo"] = loadfx( "vfx/iw7/_requests/mp/vfx_light_barrier_halo" );
    level._id_2850["body"] = loadfx( "vfx/iw7/_requests/mp/vfx_light_barrier_body" );
    level._id_2850["start"] = loadfx( "vfx/iw7/_requests/mp/vfx_barrier_start" );
    level._id_2850["shot"] = loadfx( "vfx/iw7/_requests/mp/vfx_barrier_trail" );
    level._id_2850["activate"] = loadfx( "vfx/iw7/_requests/mp/vfx_barrier_activate" );
}

_id_E0D3()
{
    self notify( "remove_barrier" );
}

_id_E83A()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "remove_barrier" );
    self playlocalsound( "kinetic_pulse" );
    self playsound( "kinetic_pulse_npc" );
    thread _id_284F();
}

_id_284E( var_0, var_1 )
{
    self endon( "disconnect" );
    scripts\mp\gamescore::_id_11AC9( var_0, self, "power_barrier" );
    var_2 = "j_spinelower";
    var_3 = "body";

    if ( var_1 )
    {
        self._id_8BF8 = 1;
        self iprintlnbold( "BARRIER AND HEADGEAR APPLIED" );
        playfxontag( level._id_2850["halo"], self, "j_head" );
    }

    self._id_8BD3 = 1;
    self iprintlnbold( "BARRIER APPLIED" );
    scripts\mp\lightarmor::_id_F786( self, 35 );
    playfxontag( level._id_2850[var_3], self, var_2 );
    thread _id_2852( var_0, var_1 );

    while ( isdefined( self._id_ACAE ) )
        wait 0.05;

    thread _id_2851( var_0, var_1 );
}

_id_2851( var_0, var_1 )
{
    stopfxontag( level._id_2850["halo"], self, "j_head" );
    stopfxontag( level._id_2850["body"], self, "j_spinelower" );

    if ( var_1 )
        self._id_8BF8 = undefined;

    self._id_8BD3 = undefined;
    scripts\mp\gamescore::_id_12D6E( var_0, self, "power_barrier" );
}

_id_2852( var_0, var_1 )
{
    self endon( "disconnect" );
    scripts\engine\utility::waittill_any( "death" );

    if ( scripts\mp\utility\game::isreallyalive() )
        thread _id_2851( var_0, var_1 );
}

_id_284F()
{
    var_0 = 0.2;
    var_1 = undefined;
    var_2 = scripts\engine\utility::_id_107E6( self.origin + ( 0, 0, 64 ) );
    var_3 = spawn( "script_model", var_2.origin );
    var_3 linkto( var_2 );
    scripts\engine\utility::waitframe();
    var_4 = _id_68D8( var_2 );
    playfxontag( level._id_2850["shot"], var_2, "tag_origin" );
    var_2 moveto( var_4["position"], var_0 );
    wait( var_0 );

    if ( isdefined( var_4["entity"] ) && isplayer( var_4["entity"] ) && !isdefined( var_4["entity"]._id_8BD3 ) && var_4["entity"].team == self.team )
    {
        var_5 = self _meth_8409( var_4["entity"] gettagorigin( "tag_eye" ), 65, 25 );
        var_4["entity"] thread _id_284E( self, var_5 );
        playfx( level._id_2850["activate"], var_4["position"] + ( 0, 0, 20 ) );
        self notify( "powers_barrier_used", 1 );
    }
    else
        self notify( "powers_barrier_used", 0 );

    var_3 delete();
    var_2 delete();
}

_id_68D8( var_0 )
{
    var_1 = rotatepointaroundvector( anglestoup( self getplayerangles() ), anglestoforward( self getplayerangles() ), 0 );
    var_2 = self.origin + var_1 * 768;
    var_3 = scripts\mp\utility\game::_id_81A0( scripts\mp\utility\game::_id_8027( self.team ) );
    var_4 = scripts\engine\utility::_id_227F( var_3, _id_7E0D() );
    var_5 = scripts\engine\utility::_id_2279( var_4, self );
    var_6 = scripts\engine\trace::sphere_trace( self.origin + ( 0, 0, 64 ), var_2, 12, var_5 );

    if ( !isdefined( var_6 ) || var_6["hittype"] != "hittype_entity" )
        var_6["position"] = var_2;

    return var_6;
}

_id_7E0D()
{
    var_0 = [];

    foreach ( var_2 in level._id_C928 )
    {
        if ( !isplayer( var_2 ) )
            var_0 = scripts\engine\utility::_id_2279( var_0, var_2 );
    }

    return var_0;
}

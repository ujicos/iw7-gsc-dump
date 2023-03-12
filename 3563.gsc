// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_8C71 = [];
    level._id_8C71["wave"] = loadfx( "vfx/iw7/_requests/mp/trail_kinetic_wave" );
    level._id_8C71["wedge"] = loadfx( "vfx/iw7/_requests/mp/vfx_kinetic_wave_wedge" );
    level._id_8C71["halo"] = loadfx( "vfx/iw7/_requests/mp/vfx_light_headgear_halo" );
}

_id_E129()
{
    self notify( "remove_headgear" );
}

_id_E855()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "remove_headgear" );

    for (;;)
    {
        self waittill( "headgear_save", var_0, var_1, var_2 );

        if ( weaponclass( var_2 ) == "sniper" )
            thread _id_E856();
    }
}

_id_E856()
{
    self shellshock( "concussion_grenade_mp", 2.5, 0, 1 );
}

_id_8C6F( var_0, var_1 )
{
    self._id_8BF8 = 1;
    var_2 = level._id_D782["power_headgear"]._id_5FF3;
    scripts\mp\gamescore::_id_11AC9( var_0, self, "power_headgear" );
    thread scripts\mp\killstreaks\emp_common::_id_5AA9();
    var_3 = "j_spinelower";

    if ( var_1 )
    {
        self iprintlnbold( "HEADGEAR APPLIED" );
        var_3 = "j_head";
    }
    else
        self iprintlnbold( "BARRIER APPLIED" );

    var_4 = playfxontag( level._id_8C71["halo"], self, var_3 );
    thread _id_8C73( var_0, var_2, var_3 );
    wait( var_2 );
    thread _id_8C72( var_0, var_3 );
}

_id_8C72( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    stopfxontag( level._id_8C71["halo"], self, var_1 );
    self._id_8BF8 = undefined;
    scripts\mp\gamescore::_id_12D6E( var_0, self, "power_headgear" );
}

_id_8C73( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self waittill( "death" );
    thread _id_8C72( var_0, var_1, var_2 );
}

_id_8C70( var_0 )
{
    var_1 = [];
    var_2 = [];

    for ( var_3 = 0; var_3 < 5; var_3++ )
    {
        var_1[var_3] = scripts\engine\utility::_id_107E6( self.origin + ( 0, 0, 36 ) );
        var_2[var_3] = spawn( "script_model", var_1[var_3].origin );
        var_2[var_3] linkto( var_1[var_3] );
    }

    scripts\engine\utility::waitframe();
    playfx( level._id_8C71["wedge"], var_1[2].origin, anglestoup( self getplayerangles() ), anglestoforward( self getplayerangles() ) );
    var_4 = [ 16, 8, 0, -8, -16 ];

    for ( var_3 = 0; var_3 < 5; var_3++ )
        thread _id_68D8( var_1[var_3], var_4[var_3] );

    foreach ( var_6 in var_0 )
    {
        if ( distance2dsquared( self.origin, var_6.origin ) < 100000 && isdefined( self _meth_840B( var_6.origin, 65 ) ) )
        {
            var_7 = var_6 _meth_808F( var_1[2].origin );

            if ( var_7 > 0.2 )
            {
                var_8 = self _meth_8409( var_6 gettagorigin( "tag_eye" ), 65, 50 );
                var_6 thread _id_8C6F( self, var_8 );
            }
        }
    }

    wait 3.0;

    foreach ( var_11 in var_2 )
        var_11 delete();

    foreach ( var_14 in var_1 )
        var_14 delete();
}

_id_68D8( var_0, var_1 )
{
    playfxontag( level._id_8C71["wave"], var_0, "tag_origin" );
    var_2 = rotatepointaroundvector( anglestoup( self getplayerangles() ), anglestoforward( self getplayerangles() ), var_1 );
    var_3 = self.origin + var_2 * 100000;
    var_4 = scripts\engine\trace::_id_DCED( self.origin + ( 0, 0, 96 ), var_3 );

    if ( !isdefined( var_4 ) )
    {
        var_5 = 3.0;
        var_4["position"] = var_3;
    }
    else
    {
        var_5 = 3.0 * var_4["fraction"];

        if ( var_5 <= 0 )
            var_5 = 0.05;
    }

    var_0 moveto( var_4["position"], var_5 );
}

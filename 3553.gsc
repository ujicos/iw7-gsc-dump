// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_44F9()
{
    level._effect["coneFlash_wave"] = loadfx( "vfx/iw7/_requests/mp/trail_kinetic_wave" );
    level._effect["coneFlash_wedge"] = loadfx( "vfx/iw7/_requests/mp/vfx_kinetic_wave_wedge" );
    level._effect["coneFlash_explosion"] = loadfx( "vfx/old/_requests/archetypes/vfx_cone_flash_exp" );
    level._effect["coneFlash_explosionScreen"] = loadfx( "vfx/old/_requests/archetypes/vfx_cone_flash_exp_scr" );
}

_id_44FB()
{
    _id_44F1();
}

_id_44FD()
{
    self notify( "coneFlash_unset" );
    _id_44F4();
}

_id_44FF()
{
    thread _id_4500();
    _id_44F5();
}

_id_44F4()
{
    self notify( "coneFlash_end" );
}

_id_4500()
{
    self endon( "coneFlash_end" );
    scripts\engine\utility::waittill_any( "death", "disconnect" );
    thread _id_44F4();
}

_id_44F5()
{
    var_0 = undefined;

    if ( level.teambased )
        var_0 = scripts\mp\utility\game::_id_81A0( scripts\mp\utility\game::_id_8027( self.team ) );
    else
        var_0 = level._id_3CB5;

    var_1 = self gettagorigin( "tag_eye" );
    var_2 = self geteye() + anglestoforward( self getplayerangles() ) * 454;
    var_3 = scripts\engine\trace::_id_48BC( 0, 1, 1, 0, 0, 0, 0 );
    var_4 = physics_raycast( var_1, var_2, var_3, undefined, 0, "physicsquery_closest" );

    if ( isdefined( var_4 ) && var_4.size > 0 )
        var_2 = var_4[0]["position"];

    var_5 = vectortoangles( var_2 - var_1 );
    var_6 = anglestoforward( var_5 );
    var_7 = anglestoup( var_5 );
    var_8 = -96 * var_6;
    var_9 = var_1 + var_8;
    thread _id_44F6( var_1, var_2, var_5 );
    var_10 = 0;

    foreach ( var_12 in var_0 )
    {
        if ( !_id_44FC( var_12 ) )
            continue;

        if ( !scripts\mp\utility\game::_id_D64B( var_12 gettagorigin( "j_spineupper" ), var_9, var_6, var_7, 550, 96, 22, 72 ) )
            continue;

        var_4 = physics_raycast( self geteye(), var_12 geteye(), var_3, undefined, 0, "physicsquery_closest" );

        if ( isdefined( var_4 ) && var_4.size != 0 )
            continue;

        var_13 = var_12 gettagorigin( "j_spineupper" ) - var_9;
        var_14 = vectordot( var_6, var_13 );

        if ( var_14 <= 550 )
        {
            if ( var_14 <= 296 )
                var_12 _meth_80B0( 45, self.origin, self, self, "MOD_IMPACT", "coneflash_mp" );
            else
                var_12 _meth_80B0( 27, self.origin, self, self, "MOD_IMPACT", "coneflash_mp" );
        }

        var_15 = min( max( var_14, 296 ), 550 );
        var_16 = 1 - ( var_15 - 296 ) / 254;
        var_17 = 0.5 * ( 1.0 + vectordot( var_6, vectornormalize( var_13 ) ) );
        thread _id_44F0( var_12, var_9, var_16, var_17 );
        var_10++;
    }

    _id_44F8( var_10 );
}

_id_44F0( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "disconnect" );
    var_0 notify( "flashbang", var_1, var_2, var_3, self, self.team, 1.33 );
    scripts\mp\gamescore::_id_11ACE( self, var_0, "power_coneFlash" );
    var_0 scripts\engine\utility::_id_13736( 1.33, "death" );

    if ( isdefined( self ) )
        scripts\mp\gamescore::_id_12D6F( self, var_0, "power_coneFlash" );
}

_id_44F8( var_0 )
{
    var_1 = scripts\mp\lightarmor::_id_7F73( self );
    var_1 = min( self.maxhealth, var_1 + var_0 * 45 );
    scripts\mp\lightarmor::_id_F786( self, var_1 );
}

_id_44FC( var_0 )
{
    if ( !isplayer( var_0 ) )
        return 0;

    if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
        return 0;

    if ( var_0 == self )
        return 0;

    if ( level.teambased && var_0.team == self.team )
        return 0;

    if ( !scripts\mp\equipment\phase_shift::_id_213D( self, var_0 ) )
        return 0;

    return 1;
}

_id_44F6( var_0, var_1, var_2 )
{
    self playlocalsound( "kinetic_pulse" );
    self playsoundtoteam( "kinetic_pulse_npc", "axis", self );
    self playsoundtoteam( "kinetic_pulse_npc", "allies", self );
    var_3 = _id_44F7();
    var_3.origin = var_0;
    var_3.angles = var_2;
    var_4 = vectordot( var_1 - var_0, anglestoforward( var_2 ) );
    var_5 = max( 0.05, var_4 / 8000 );
    var_3 moveto( var_1, var_5 );
    var_6 = scripts\engine\utility::_id_7ECB( "coneFlash_explosion" );
    playfxontag( var_6, var_3, "tag_origin" );
}

_id_44F1()
{
    self._id_4502 = [];

    for ( var_0 = 0; var_0 < 3; var_0++ )
    {
        var_1 = spawn( "script_model", ( 10000, 10000, 0 ) );
        var_1 setmodel( "tag_origin" );
        self._id_4502[var_0] = var_1;
    }

    thread _id_44FE();
}

_id_44FE()
{
    self endon( "disconnect" );
    self endon( "coneFlash_unset" );

    for (;;)
    {
        self._id_4502[0].origin = self gettagorigin( "tag_eye" );
        self._id_4502[0].angles = self getplayerangles();
        scripts\engine\utility::waitframe();
    }
}

_id_44F2()
{
    if ( !isdefined( self._id_4502 ) )
        return;

    var_0 = scripts\engine\utility::_id_7ECB( "coneFlash_explosion" );

    foreach ( var_2 in self._id_4502 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        stopfxontag( var_0, var_2, "tag_origin" );
        var_2 delete();
    }

    self._id_4502 = undefined;
}

_id_4501()
{
    scripts\engine\utility::waittill_any( "coneflash_unset", "disconnect" );
    _id_44F2();
}

_id_44F7()
{
    var_0 = self._id_4502[0];
    var_1 = [];

    for ( var_2 = 1; var_2 < 3; var_2++ )
        var_1[var_1.size] = self._id_4502[var_2];

    var_1[var_1.size] = var_0;
    self._id_4502 = var_1;
    return var_0;
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_97D0()
{

}

_id_20BB()
{

}

_id_E0D0()
{
    self notify( "removeArchetype" );
}

_id_98AD()
{
    level._effect["adrenaline_worldFX"] = loadfx( "vfx/iw7/_requests/mp/vfx_adrenaline_world_view" );
}

_id_261D()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    self setclientomnvar( "ui_aura_regen", 0 );

    for (;;)
    {
        self waittill( "got_a_kill" );

        foreach ( var_1 in level.players )
        {
            if ( var_1 != self )
            {
                if ( !level.teambased )
                    continue;

                if ( var_1.team != self.team )
                    continue;

                if ( distance2dsquared( var_1.origin, self.origin ) > 147456 )
                    continue;
            }

            var_1 thread _id_2617( self );
        }
    }
}

_id_2617( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( self != var_0 )
        var_0 thread scripts\mp\utility\game::_id_83B4( "buff_teammate" );

    self playlocalsound( "mp_overcharge_on" );
    self setclientomnvar( "ui_aura_regen", 1 );
    thread _id_261A( 2.0 );
    var_1 = gettime();
    thread _id_261B( var_1, 0.6 );
    wait 0.6;
    var_1 = gettime();
    thread _id_261C( var_1, 1.4 );
}

_id_261B( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "force_regeneration" );
    scripts\mp\utility\game::giveperk( "specialty_adrenaline" );
    var_2 = anglestoup( self.angles );
    var_3 = anglestoforward( self.angles );
    var_4 = var_0 + var_1 * 1000;

    while ( gettime() < var_4 )
    {
        playfx( scripts\engine\utility::_id_7ECB( "adrenaline_worldFX" ), self.origin + ( 0, 0, 25 ), var_3, var_2 );
        wait 0.1;
    }

    scripts\mp\utility\game::_id_E150( "specialty_adrenaline" );
}

_id_261C( var_0, var_1 )
{
    self endon( "death" );
    self endon( "damage" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\mp\utility\game::giveperk( "specialty_adrenaline_lite" );
    thread _id_2618( var_1 );
    thread _id_2619( var_1 );
    var_2 = anglestoup( self.angles );
    var_3 = anglestoforward( self.angles );
    var_4 = var_0 + var_1 * 1000;

    while ( gettime() < var_4 )
    {
        var_5 = playfx( scripts\engine\utility::_id_7ECB( "adrenaline_worldFX" ), self.origin + ( 0, 0, 25 ), var_3, var_2 );
        var_5 _meth_8429( self );
        wait 0.1;
    }

    scripts\mp\utility\game::_id_E150( "specialty_adrenaline_lite" );
}

_id_2618( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_1 = scripts\engine\utility::_id_13736( var_0, "damage" );

    if ( isdefined( var_1 ) && var_1 == "damage" )
        scripts\mp\utility\game::_id_E150( "specialty_adrenaline_lite" );
}

_id_2619( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "auraRegen_cleanupLuaDamagePublic" );
    self endon( "auraRegen_cleanupLuaDamagePublic" );
    var_1 = scripts\engine\utility::_id_13736( var_0, "damage" );
    self setclientomnvar( "ui_aura_regen", 0 );
    self notify( "auraRegen_cleanupLuaDeathPublic" );
}

_id_261A( var_0 )
{
    self endon( "disconnect" );
    self notify( "auraRegen_cleanupLuaDeathPublic" );
    self endon( "auraRegen_cleanupLuaDeathPublic" );
    var_1 = scripts\engine\utility::_id_13736( var_0, "death" );
    self setclientomnvar( "ui_aura_regen", 0 );
    self notify( "auraRegen_cleanupLuaDamagePublic" );
}

_id_56E7()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "game_ended" );
    self endon( "removeArchetype" );

    for (;;)
    {
        self waittill( "melee_fired" );
        var_0 = anglestoforward( self getplayerangles() );
        playfx( scripts\engine\utility::_id_7ECB( "disruptor_punch" ), self gettagorigin( "tag_eye" ), var_0 );
        self playlocalsound( "kinetic_pulse" );

        foreach ( var_2 in level.players )
        {
            if ( var_2.team != self.team && distance2d( self.origin, var_2.origin ) < 512 && _id_9F98( var_2 ) && scripts\engine\trace::_id_DCF1( self geteye(), var_2 geteye(), undefined, scripts\engine\trace::_id_48BC( 0, 1, 1, 1, 0, 1, 0 ) ) )
            {
                if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_2 ) )
                {
                    var_2 notify( "phaseshift_interrupted" );
                    var_2 _id_0AE2::_id_C170( "powers_phase_shift_update", 0 );
                }

                var_3 = anglestoright( self getplayerangles() );
                var_4 = rotatepointaroundvector( var_3, var_0, 20 );
                var_2 _meth_84DC( var_4, 512 );
                var_2 shellshock( "concussion_grenade_mp", 2.5, 0, 1 );
                var_2 notify( "flashbang", var_2.origin, 1.0, 30, self, 1 );
                playfx( scripts\engine\utility::_id_7ECB( "disruptor_impact" ), var_2.origin + ( 0, 0, 36 ) );
            }
        }
    }
}

_id_9F98( var_0 )
{
    var_1 = self getplayerangles();
    var_2 = anglestoforward( var_1 );
    var_3 = anglestoup( var_1 );
    var_4 = anglestoright( var_1 );
    var_5 = self geteye() - var_2 * 128;

    if ( !scripts\mp\utility\game::_id_D64B( var_0 gettagorigin( "tag_eye" ), var_5, var_2, var_3, 512, 128, 20 ) )
    {
        if ( !scripts\mp\utility\game::_id_D64B( var_0 gettagorigin( "tag_origin" ), var_5, var_2, var_3, 512, 128, 20 ) )
        {
            if ( !scripts\mp\utility\game::_id_D64B( var_0 gettagorigin( "j_mainroot" ), var_5, var_2, var_3, 512, 128, 20 ) )
                return 0;
        }
    }

    return 1;
}

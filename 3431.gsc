// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_20BB()
{

}

_id_97D0()
{
    level._effect["atomize_body"] = loadfx( "vfx/iw7/_requests/mp/vfx_atomize_body.vfx" );
}

_id_E0D0()
{
    self notify( "removeArchetype" );
    self setclientomnvar( "ui_dodge_charges", 0 );

    if ( isdefined( self._id_1166A ) )
        self._id_1166A delete();
}

_id_CAAF()
{
    self endon( "death" );
    self endon( "removeArchetype" );

    for (;;)
    {
        self setclientomnvar( "ui_dodge_charges", 4 );
        self waittill( "sprint_slide_begin" );

        if ( scripts\mp\equipment\phase_shift::_id_9DDF( self ) )
            continue;

        wait 0.1;
        self setclientomnvar( "ui_dodge_charges", 0 );
        scripts\mp\equipment\phase_shift::_id_6626( 0 );
        _id_CAAE();
        wait 4;
        self setclientomnvar( "ui_dodge_charges", 4 );
    }
}

_id_CAAE()
{
    self endon( "death" );
    self endon( "removeArchetype" );
    self endon( "phase_shift_power_activated" );
    scripts\engine\utility::_id_137B7( "sprint_slide_end", 1.0 );
    scripts\mp\equipment\phase_shift::_id_6978( 0 );
    return;
}

_id_1166B()
{
    self endon( "death" );
    self endon( "removeArchetype" );
    var_0 = spawn( "script_model", self.origin );
    var_0 setmodel( "ks_marker_mp" );
    var_0 _meth_826C( -90, 0.05 );
    self._id_1166A = var_0;

    for (;;)
    {
        self setclientomnvar( "ui_dodge_charges", 4 );
        self waittill( "sprint_slide_begin" );
        var_1 = scripts\engine\utility::_id_13736( 0.1, "sprint_slide_end" );

        if ( var_1 != "timeout" )
            continue;

        if ( scripts\mp\equipment\phase_shift::_id_9DDF( self ) )
            continue;

        var_2 = _id_81C1( 320 );
        var_3 = getdvarint( "teleport_minDrawDistanceForFX", 16 );

        if ( distance2dsquared( var_2, self.origin ) <= var_3 * var_3 )
            continue;

        self setclientomnvar( "ui_dodge_charges", 0 );
        var_4 = var_2 - self.origin;
        wait 0.1;
        var_5 = scripts\engine\trace::_id_48BC( 1, 1, 1, 1, 0, 1, 1 );
        var_6 = scripts\engine\trace::_id_D305( var_2, var_2 - ( 0, 0, 100 ), self.angles, self, var_5 );
        var_7 = var_6["position"] + ( 0, 0, 6 );
        var_8 = scripts\engine\trace::_id_D095( var_7, self.angles, 0, self, var_5, 0 );
        var_9 = var_8["position"];
        var_9 += ( 0, 0, 12 );
        thread _id_10148( var_9 );
        wait 0.2;
        wait 4;
        self setclientomnvar( "ui_dodge_charges", 4 );
    }
}

_id_10148( var_0 )
{
    self._id_1166A.origin = var_0;
    self._id_1166A show();
    wait 0.45;
    self._id_1166A hide();
}

_id_81C1( var_0 )
{
    var_1 = self.origin + ( 0, 0, 0 );
    var_2 = anglestoforward( self.angles );
    var_3 = var_1 + var_2 * var_0;
    var_4 = scripts\engine\trace::_id_48BC( 1, 1, 1, 1, 0, 1, 1 );
    var_5 = scripts\engine\trace::_id_D305( var_1, var_3, self.angles, self, var_4, 0, 35 );
    var_6 = var_5["fraction"];
    var_7 = var_5["position"];

    if ( var_6 != 1 )
    {
        var_8 = var_0 * var_6;
        var_8 -= 32;
        var_7 = var_1 + var_2 * var_8;
    }

    var_9 = _func_2B3( var_7 );

    if ( isdefined( var_9 ) )
        return var_9;
    else
        return var_7;
}

_id_CAA7()
{
    self endon( "death" );
    self endon( "removeArchetype" );

    for (;;)
    {
        self waittill( "doubleJumpBegin" );

        if ( scripts\mp\equipment\phase_shift::_id_9DDF( self ) )
            continue;

        scripts\mp\equipment\phase_shift::_id_6626( 0 );
        _id_CAA6();
    }
}

_id_CAA6()
{
    self endon( "death" );
    self endon( "removeArchetype" );
    self endon( "phase_shift_power_activated" );
    var_0 = 0.0;

    for (;;)
    {
        if ( var_0 >= 0.5 )
        {
            scripts\mp\equipment\phase_shift::_id_6978( 0 );
            return;
        }

        wait 0.05;
        var_0 += 0.05;
    }
}

_id_E88E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );

    for (;;)
    {
        self waittill( "got_a_kill", var_0, var_1, var_2 );

        if ( var_2 != "MOD_MELEE" )
            continue;

        self notify( "phase_slash_entered" );
        wait 0.5;
        wait 0.1;
    }
}

_id_20D9( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    playfx( scripts\engine\utility::_id_7ECB( "phase_slash_spool" ), var_1 + ( 0, 0, 36 ) );
    playloopsound( var_1, "blackhole_grenade_explode_default" );
    scripts\mp\utility\game::_id_1302( "phaseSlash_grenade_mp", var_1 + ( 0, 0, 36 ), ( 0, 0, 0 ), 1.5 );
    wait 1.5;
    playfx( scripts\engine\utility::_id_7ECB( "phase_blast" ), var_1 );
    playloopsound( var_1, "kinetic_pulse_npc" );
}

_id_CAAD()
{
    self endon( "death" );
    self endon( "removeArchetype" );
    self endon( "phase_shift_power_activated" );
    wait 2.5;
    scripts\mp\equipment\phase_shift::_id_6978( 0 );
    return;
}

_id_1091C()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    var_0 = level.players.size - 1;

    for (;;)
    {
        if ( level.players.size != var_0 )
        {
            foreach ( var_2 in level.players )
            {
                if ( var_2 == self )
                    continue;

                if ( var_2.team == self.team )
                    continue;

                if ( var_2 scripts\mp\utility\game::_id_12D6( "specialty_coldblooded" ) )
                    continue;

                var_2 thread _id_BA1A( self );
            }

            var_0 = level.players.size;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_BA1A( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "removearchetype" );
    self endon( "end_spawnview" );

    for (;;)
    {
        self waittill( "spawned_player" );
        wait 0.1;
        _id_C7A6( var_0 );
    }
}

_id_C7A6( var_0 )
{
    var_1 = scripts\mp\utility\game::_id_C794( self, "red", var_0, 0, 1, "level_script" );

    if ( !isai( var_0 ) )
        var_0 scripts\mp\utility\game::_id_12E5( 5 );

    var_0 _id_13AA0( var_1, self, 6 );
}

_id_13AA0( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\engine\utility::_id_13737( var_2, "leave", "end_spawnview" );

    if ( isdefined( var_1 ) )
    {
        scripts\mp\utility\game::_id_C78F( var_0, var_1 );

        if ( !isai( var_1 ) )
            var_1 scripts\mp\utility\game::_id_12E4();
    }
}

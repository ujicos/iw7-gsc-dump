// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._effect["battery_pulse"] = loadfx( "vfx/iw7/_requests/mp/vfx_battery_pulse" );
    level._effect["battery_target"] = loadfx( "vfx/iw7/_requests/mp/vfx_battery_pulse_target" );
    level._effect["battery_screen"] = loadfx( "vfx/iw7/_requests/mp/vfx_battery_pulse_screen" );
    level._effect["battery_cooldown"] = loadfx( "vfx/iw7/_requests/mp/vfx_battery_pulse_cooldown" );
}

_id_E83B( var_0 )
{
    if ( !isagent( self ) )
    {
        _id_0AE2::_id_D740( 2 );
        thread _id_139AC( var_0 );
        thread _id_139AB( 4, "stop_battery_linger" );
        thread _id_CEE7( "battery_cooldown", 0.1, 4, 1, "stop_battery_linger" );

        if ( isdefined( self ) && isdefined( var_0 ) )
            scripts\mp\gamescore::_id_11AC9( var_0, self, "power_battery" );
    }
}

_id_139AB( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\engine\utility::_id_13736( var_0, "death" );

    if ( !isdefined( var_2 ) )
        self notify( var_1 );
    else
        self notify( var_1, var_2 );
}

_id_139AC( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "stop_battery_linger" );
    _id_0AE2::_id_D74E();
    self._id_28C7 = undefined;

    if ( isdefined( self ) && isdefined( var_0 ) )
        scripts\mp\gamescore::_id_12D6E( self, var_0, "power_battery" );
}

_id_CEE7( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( var_4 );
    level endon( "game_ended" );

    if ( !isdefined( var_3 ) || !var_3 )
    {
        var_7 = self.origin;

        if ( isdefined( var_5 ) )
            var_7 = self gettagorigin( var_5 );

        var_8 = spawn( "script_model", var_7 );
        var_8 setmodel( "tag_origin" );
        var_8 linkto( self, "tag_origin", ( 0, 0, 0 ), ( 90, 0, 0 ) );
        var_8 thread scripts\mp\utility\game::_id_5106( var_2 );

        for (;;)
        {
            playfxontagforclients( scripts\engine\utility::_id_7ECB( var_0 ), var_8, "tag_origin", var_6 );
            wait( var_1 );
        }
    }
    else
    {
        for (;;)
        {
            var_9 = spawnfxforclient( scripts\engine\utility::_id_7ECB( var_0 ), self gettagorigin( "tag_eye" ), self );
            triggerfx( var_9 );
            var_9 thread scripts\mp\utility\game::_id_5106( var_1 );
            wait( var_1 );
        }
    }
}

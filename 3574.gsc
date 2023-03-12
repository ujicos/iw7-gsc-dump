// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_C7E4 = loadfx( "vfx/core/mp/ability/vfx_aslt_overcharge_scrn" );
    level._id_C7E5 = loadfx( "vfx/core/mp/ability/vfx_aslt_overcharge_world_view" );
    _id_0AE1::_id_DF06( "power_overCharge", [ "passive_increased_duration", "passive_fire_damage", "passive_overcharge_recoil" ] );
}

_id_E14D( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for ( var_2 = _id_0AE2::_id_808F( var_0 ) / 1000; var_2 > 0; var_2 = _id_0AE2::_id_808F( var_0 ) / 1000 )
        wait( var_2 );

    self playlocalsound( "mp_overcharge_off" );
    _id_E14C( var_1 );
}

_id_E14C( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( isdefined( self._id_C7E6 ) && self._id_C7E6 )
    {
        self notify( "removeOvercharge" );
        self._id_C7E8 = undefined;
        scripts\mp\weapons::_id_12F58();
        _id_E12D();
        self._id_D782["power_overCharge"]._id_0019 = 0;
        self._id_C7E6 = undefined;
        scripts\mp\utility\game::_id_E150( "specialty_overcharge" );
        var_1 = _id_0AE1::_id_D779( "power_overCharge", "passive_overcharge_recoil" );

        if ( var_1 )
            scripts\mp\utility\game::_id_F817( 0 );

        if ( var_0 )
            scripts\mp\utility\game::_id_E150( "passive_fire_damage" );
    }
}

_id_130B8()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeOvercharge" );
    level endon( "game_ended" );
    self._id_C7E6 = 1;
    self._id_D782["power_overCharge"]._id_0019 = 1;
    var_0 = _id_0AE1::_id_7FC1( "power_overCharge", 5.0 );
    var_1 = _id_0AE1::_id_D779( "power_overCharge", "passive_fire_damage" );
    var_2 = scripts\mp\utility\game::_id_12D6( "passive_fire_damage" );
    var_3 = var_1 && !var_2;

    if ( var_3 )
        scripts\mp\utility\game::giveperk( "passive_fire_damage" );

    self playlocalsound( "mp_overcharge_on" );
    thread _id_20CE();
    thread _id_20D3();
    thread _id_20D4();
    scripts\mp\utility\game::giveperk( "specialty_overcharge" );
    var_4 = "power_overCharge_update";
    self._id_C7E8 = 0.0;
    scripts\mp\weapons::_id_12F58();
    thread _id_0AE2::_id_4575( var_0, var_4, "removeOvercharge" );
    thread _id_E14D( var_4, var_3 );
}

_id_20D4()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeOvercharge" );
    level endon( "game_ended" );
    var_0 = anglestoup( self.angles );
    var_1 = anglestoforward( self.angles );

    for (;;)
    {
        playfx( level._id_C7E5, self.origin + ( 0, 0, 25 ), var_1, var_0 );
        wait 0.1;
    }
}

_id_20D3()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeOvercharge" );
    var_0 = _id_0AE1::_id_D779( "power_overCharge", "passive_overcharge_recoil" );

    if ( var_0 )
        scripts\mp\utility\game::_id_F817( 0, 25 );

    for (;;)
    {
        self waittill( "weapon_fired", var_1 );
        var_2 = self getweaponammoclip( var_1 );
        self._id_C7E7.origin = self geteye();
        triggerfx( self._id_C7E7 );
        self playlocalsound( "overcharge_fire_plr" );
        self._id_C7E7 playsoundtoteam( "overcharge_fire_npc", "axis", self );
        self._id_C7E7 playsoundtoteam( "overcharge_fire_npc", "allies", self );
    }
}

_id_ECCD()
{
    wait 0.05;

    if ( isdefined( self ) )
    {
        playfxontagforclients( scripts\engine\utility::_id_7ECB( "vfx_screen_flash" ), self, "tag_eye", self );
        playfx( level._id_CAA3["spawn"], self.origin, anglestoforward( self.angles ), anglestoup( self.angles ) );
    }
}

_id_20CE()
{
    self setclientomnvar( "ui_overchargeOverlay", 1 );
}

_id_E12D()
{
    self setclientomnvar( "ui_overchargeOverlay", 0 );
}

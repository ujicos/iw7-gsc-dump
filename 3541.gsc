// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{

}

_id_1303C()
{
    self endon( "disconnect" );
    self endon( "removeAdrenaline" );
    self notify( "adrenaline_used" );
    self notify( "force_regeneration" );
    self playlocalsound( "mp_adrenaline_on" );
    self playsoundtoteam( "mp_adrenaline_on_npc", "axis", self );
    self playsoundtoteam( "mp_adrenaline_on_npc", "allies", self );
    self playlocalsound( "mp_adrenaline_pulse" );

    if ( self.health < self.maxhealth )
        scripts\mp\missions::_id_D991( "ch_tactical_adrenaline" );
    else
    {
        self._id_13071 = 1;
        thread _id_40E0();
    }

    self._id_8BC2 = 1;
    scripts\mp\utility\game::giveperk( "specialty_adrenaline" );
    thread _id_E0C4();
    thread _id_E0C6();
    thread _id_E0C3();
    thread _id_13A85();
    var_0 = _id_0AE1::_id_7FC1( "power_adrenaline", 5.0 );
    _id_0AE2::_id_4575( var_0, "power_adrenaline_update", "removeAdrenaline" );
    thread _id_E0C2();
}

_id_E0C2( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "";

    if ( isdefined( self._id_8BC2 ) && self._id_8BC2 )
    {
        self notify( "removeAdrenaline" );
        self._id_8BC2 = 0;
        scripts\mp\utility\game::_id_E150( "specialty_adrenaline" );
        self setscriptablepartstate( "adrenaline", "neutral", 0 );
        self setscriptablepartstate( "adrenalineHeal", "neutral", 0 );

        if ( var_0 != "death" )
            self playlocalsound( "mp_adrenaline_off" );
    }
}

_id_E0C4()
{
    self endon( "disconnect" );
    self endon( "removeAdrenaline" );
    self notify( "removeAdrenalineOnDeath" );
    self endon( "removeAdrenalineOnDeath" );
    self waittill( "death" );
    thread _id_E0C2( "death" );
}

_id_E0C6()
{
    self endon( "disconnect" );
    self endon( "removeAdrenaline" );
    self notify( "removeAdrenalineOnGameEnd" );
    self endon( "removeAdrenalineOnGameEnd" );
    level waittill( "game_ended" );
    thread _id_E0C2();
}

_id_E0C3()
{
    self endon( "disconnect" );
    self endon( "removeAdrenaline" );
    self notify( "removeAdrenalineOnCancel" );
    self endon( "removeAdrenalineOnCancel" );
    self waittill( "cancelAdrenaline" );
    thread _id_E0C2();
}

_id_40E0()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "cleanupAdrenalineMissionTracking" );
    self endon( "cleanupAdrenalineMissionTracking" );
    self waittill( "death" );
    self._id_13071 = undefined;
}

_id_7EF5()
{
    return 4;
}

_id_13A85()
{
    self endon( "disconnect" );
    self endon( "removeAdrenaline" );
    self setscriptablepartstate( "adrenaline", "active", 0 );
    self setscriptablepartstate( "adrenalineHeal", "active", 0 );
}

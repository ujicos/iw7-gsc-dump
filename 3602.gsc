// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_8543()
{
    level thread _id_8545();
}

_id_8545()
{
    for (;;)
    {
        level waittill( "player_spawned", var_0 );

        if ( isai( var_0 ) )
            continue;
    }
}

_id_8544()
{

}

_id_8541()
{
    self._id_853E = 1;
    self iprintlnbold( "gravWave" );
    self _meth_8253( self.origin, 256, 50, 33, self, "MOD_EXPLOSIVE", "distortionfield_grenade_mp" );
    thread _id_8542();
    thread _id_8540();
    return 1;
}

_id_8546()
{
    self endon( "gravWave_end" );
    self endon( "death" );

    for (;;)
    {
        self waittill( "gravWaveHit", var_0 );
        var_0 shellshock( "concussion_grenade_mp", 1.5 );
        var_0 thread _id_2025();
    }
}

_id_2025( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    var_1 = spawn( "script_model", self.origin );
    var_1 setmodel( "tag_origin" );
    thread _id_ABFD( var_1, var_0 );
    wait 3;
    var_2 = self getplayerangles( 1 );
    self _meth_8417( undefined );
    self unlink();
    var_1 delete();
    self notify( "dropGravWave" );
}

_id_ABFD( var_0, var_1 )
{
    self endon( "dropGravWave" );
    self endon( "death" );
    self endon( "disconnect" );
    var_2 = _id_2A96( var_0 );
    var_3 = _id_7E1C();
    var_4 = self.origin;
    var_5 = anglestoup( self.angles );
    self _meth_84DC( var_5, 160 );
    self shellshock( "concussion_grenade_mp", 3, 0, 1 );
    self notify( "flashbang", self.origin, 1.0, 30, var_1, 1 );
    var_0.origin = self.origin;
    var_0.angles = self.angles;

    if ( var_0._id_10DD9[2] < var_4[2] )
        var_0._id_10DD9 = self.origin + ( 0, 0, 12 );

    self _meth_823A( var_0 );
    var_0 moveto( var_0._id_10DD9, 0.45, 0.1, 0.1 );
    var_6 = 0;
    var_7 = int( var_2 / 2 );
    var_8 = int( var_2 / 4 );
    var_9 = int( var_8 * -1 );
    wait 0.45;

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        var_10 = randomfloatrange( 0.4, 0.7 );

        if ( self.origin[2] > var_0._id_10DD9[2] + var_7 )
            var_6 = randomintrange( var_9, 0 );
        else if ( self.origin[2] < var_0._id_10DD9[2] - var_7 )
            var_6 = randomintrange( 0, var_8 );
        else
            var_6 = randomintrange( var_9, var_8 );

        var_11 = var_10 / 6;

        if ( var_6 > 0 )
        {
            var_12 = scripts\engine\trace::_id_D307( self.origin, self.origin + ( 0, 0, var_6 ), self.angles, self, var_3, 12 );

            if ( var_12 )
                var_0 _meth_8212( var_6, var_10, var_11, var_11 );
        }
        else if ( var_4[2] + 34 < self.origin[2] + var_6 )
            var_0 _meth_8212( var_6, var_10, var_11, var_11 );

        wait( var_10 );
    }
}

_id_2A96( var_0 )
{
    var_1 = _id_7E1C();
    var_2 = scripts\engine\trace::_id_D305( self.origin, self.origin + ( 0, 0, 256 ), self.angles, self, var_1, 0, 12 );
    var_3 = var_2["position"] - ( 0, 0, 72 );
    var_4 = var_2["position"] - ( 0, 0, 256 );
    var_5 = scripts\engine\trace::_id_D305( var_3, var_4, self.angles, self, var_1, 0, 12 );
    var_6 = var_2["position"][2] - var_5["position"][2];

    if ( var_6 < 4 )
        var_6 = 4;

    var_7 = var_6 / 2;
    var_7 -= 36;
    var_8 = self.origin + ( 0, 0, var_7 );
    var_0._id_10DD9 = var_8;
    return var_6;
}

_id_7E1C()
{
    var_0 = [ "physicscontents_solid", "physicscontents_glass", "physicscontents_item", "physicscontents_clipshot", "physicscontents_actor", "physicscontents_playerclip", "physicscontents_fakeactor", "physicscontents_vehicle", "physicscontents_structural" ];
    var_1 = physics_createcontents( var_0 );
    return var_1;
}

_id_20FE( var_0 )
{
    self endon( "dropGravWave" );
    self endon( "death" );
    var_1 = randomintrange( 90, 270 );
    self setorigin( var_0.origin );
    self setplayerangles( var_0.angles );
    self _meth_8417( var_0 );
    var_2 = var_0.angles;
    var_2 *= ( 1, 1, 0 );
    var_2 += ( 0, 0, var_1 );
    var_3 = 1.5;
    var_0 rotateto( var_2, var_3, 0.1, 0.1 );
}

_id_853F()
{
    if ( !isdefined( self ) )
        return;

    self._id_853E = 0;
    self setscriptablepartstate( "gravWave", "gravwaveOff", 0 );
    self notify( "gravWave_end" );
}

_id_8542()
{
    self endon( "gravWave_end" );
    scripts\engine\utility::waittill_any( "death", "disconnect", "game_ended" );
    thread _id_853F();
}

_id_9E17()
{
    if ( !isdefined( self._id_853E ) )
        return 0;

    return self._id_853E;
}

_id_8540()
{
    self endon( "disconnect" );
    self endon( "gravWave_end" );
    self _meth_846F( "ges_hold" );
    self setscriptablepartstate( "gravWave", "gravwaveOn", 0 );
}

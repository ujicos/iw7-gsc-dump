// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_14FB()
{
    level thread _id_14FD();
}

_id_14FD()
{
    for (;;)
    {
        level waittill( "player_spawned", var_0 );

        if ( isai( var_0 ) )
            continue;
    }
}

_id_14FC()
{

}

_id_14F9()
{
    self._id_14F6 = 1;
    self iprintlnbold( "Anti-Air Blaster" );

    if ( !self isonground() || self isjumping() || self iswallrunning() )
        thread _id_2B64();
    else
        thread _id_2B62();

    thread _id_14FA();
    thread _id_14F8();
    return 1;
}

_id_2B64()
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 = 262144;
    var_1 = 0;

    foreach ( var_3 in level._id_C928 )
    {
        if ( !scripts\mp\utility\game::isreallyalive( var_3 ) )
            continue;

        if ( !scripts\mp\utility\game::isenemy( var_3 ) )
            continue;

        if ( var_3.origin[2] > self.origin[2] )
            continue;

        var_4 = var_3.origin - self.origin;
        var_5 = length2dsquared( var_4 );

        if ( var_5 > var_0 )
            continue;

        thread _id_2B63( var_3, distance2d( var_3.origin, self.origin ) );
        var_1 = 1;
    }

    if ( !var_1 )
    {
        wait 0.5;
        self iprintlnbold( ".No Targets." );
    }
}

_id_2B62()
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 = 262144;
    var_1 = 0;

    foreach ( var_3 in level._id_C928 )
    {
        if ( !scripts\mp\utility\game::isreallyalive( var_3 ) )
            continue;

        if ( !scripts\mp\utility\game::isenemy( var_3 ) )
            continue;

        if ( !var_3 isjumping() && !var_3 iswallrunning() )
            continue;

        if ( var_3.origin[2] < self.origin[2] )
            continue;

        var_4 = var_3.origin - self.origin;
        var_5 = length2dsquared( var_4 );

        if ( var_5 > var_0 )
            continue;

        thread _id_2B63( var_3, distance2d( var_3.origin, self.origin ) );
        var_1 = 1;
    }

    if ( !var_1 )
    {
        wait 0.5;
        self iprintlnbold( ".No Targets." );
    }
}

_id_2B63( var_0, var_1 )
{
    self endon( "death" );
    var_2 = scripts\mp\utility\game::_id_C794( var_0, "orange", self, 0, 1, "level_script" );
    var_3 = var_1 * 0.0001;
    wait( 0.1 * var_3 );

    if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
        return;

    self _meth_844F( 0.2, 0.5, self.origin, 64 );
    var_4 = var_0 gettagorigin( "j_mainroot" );
    var_5 = self gettagorigin( "j_shouldertwist_le" );
    var_6 = scripts\mp\utility\game::_id_1309( "iw7_chargeshot_mp", var_5, var_4, self );

    if ( isdefined( var_0 ) )
        scripts\mp\utility\game::_id_C78F( var_2, var_0 );
}

_id_7E1C()
{
    var_0 = [ "physicscontents_solid", "physicscontents_glass", "physicscontents_item", "physicscontents_clipshot", "physicscontents_actor", "physicscontents_playerclip", "physicscontents_fakeactor", "physicscontents_vehicle", "physicscontents_structural" ];
    var_1 = physics_createcontents( var_0 );
    return var_1;
}

_id_14F7()
{
    wait 0.5;

    if ( !isdefined( self ) )
        return;

    self._id_14F6 = 0;
    self setscriptablepartstate( "aaGun", "aaGunOff", 0 );
    self notify( "aaGun_end" );
}

_id_14FA()
{
    self endon( "aaGun_end" );
    scripts\engine\utility::waittill_any( "death", "disconnect", "game_ended" );
    thread _id_14F7();
}

_id_9D23()
{
    if ( !isdefined( self._id_14F6 ) )
        return 0;

    return self._id_14F6;
}

_id_14F8()
{
    self endon( "disconnect" );
    self endon( "aaGun_end" );
    self _meth_846F( "ges_hold" );
    self setscriptablepartstate( "aaGun", "aaGunOn", 0 );
}

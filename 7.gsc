// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

codecallback_startgametype()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    if ( !isdefined( level.gametypestarted ) || !level.gametypestarted )
    {
        [[ level.callbackstartgametype ]]();
        level.gametypestarted = 1;
    }
}

codecallback_playerconnect()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    self endon( "disconnect" );
    [[ level.callbackplayerconnect ]]();
}

codecallback_playerdisconnect( var_0 )
{
    self notify( "disconnect" );
    [[ level.callbackplayerdisconnect ]]( var_0 );
}

_id_00AE( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    self endon( "disconnect" );

    if ( isdefined( level._id_13CA6 ) )
        var_5 = [[ level._id_13CA6 ]]( var_5, var_0 );

    [[ level.callbackplayerdamage ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

_id_00B4( var_0, var_1, var_2, var_3 )
{
    self endon( "disconnect" );

    if ( isdefined( level._id_13CA6 ) )
        var_0 = [[ level._id_13CA6 ]]( var_0 );

    if ( isdefined( level._id_13CA6 ) )
        var_2 = [[ level._id_13CA6 ]]( var_2 );
}

_id_00B5( var_0, var_1 )
{
    self endon( "disconnect" );

    if ( isdefined( level._id_13CA6 ) )
        var_0 = [[ level._id_13CA6 ]]( var_0 );
}

_id_00B6( var_0, var_1, var_2, var_3 )
{
    self endon( "disconnect" );

    if ( isdefined( level._id_13CA6 ) )
        var_0 = [[ level._id_13CA6 ]]( var_0 );

    if ( isdefined( level._id_13CA6 ) )
        var_2 = [[ level._id_13CA6 ]]( var_2 );

    if ( isdefined( level.callbackfinishweaponchange ) )
        [[ level.callbackfinishweaponchange ]]( var_2, var_0, var_3, var_1 );
}

_id_00B0( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "disconnect" );

    if ( isdefined( level._id_13CA6 ) )
        var_1 = [[ level._id_13CA6 ]]( var_1 );

    [[ level.callbackplayerimpaled ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_00B1( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    self endon( "disconnect" );

    if ( isdefined( level._id_13CA6 ) )
        var_5 = [[ level._id_13CA6 ]]( var_5, var_0 );

    [[ level.callbackplayerkilled ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
}

_id_00B8( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( isdefined( level._id_13CA6 ) )
        var_5 = [[ level._id_13CA6 ]]( var_5, var_0 );

    if ( isdefined( self._id_C1D4 ) )
    {
        var_12 = [[ self._id_C1D4 ]]( var_1 );

        if ( isdefined( var_12 ) && var_12 )
            return;
    }

    if ( isdefined( self._id_4D2E ) )
        self [[ self._id_4D2E ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    else
        self vehicle_finishdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

codecallback_playerlaststand( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    self endon( "disconnect" );

    if ( isdefined( level._id_13CA6 ) )
        var_4 = [[ level._id_13CA6 ]]( var_4, var_0 );

    [[ level.callbackplayerlaststand ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
}

codecallback_playermigrated()
{
    self endon( "disconnect" );
    [[ level.callbackplayermigrated ]]();
}

codecallback_hostmigration()
{
    [[ level.callbackhostmigration ]]();
}

setupdamageflags()
{
    level.idflags_radius = 1;
    level.idflags_no_armor = 2;
    level.idflags_no_knockback = 4;
    level.idflags_penetration = 8;
    level.idflags_stun = 16;
    level.idflags_shield_explosive_impact = 32;
    level.idflags_shield_explosive_impact_huge = 64;
    level.idflags_shield_explosive_splash = 128;
    level.idflags_no_team_protection = 256;
    level.idflags_no_protection = 512;
    level.idflags_passthru = 1024;
    level._id_92C3 = 2048;
}

_id_1528()
{
    level.callbackstartgametype = ::callbackvoid;
    level.callbackplayerconnect = ::callbackvoid;
    level.callbackplayerdisconnect = ::callbackvoid;
    level.callbackplayerdamage = ::callbackvoid;
    level.callbackplayerimpaled = ::callbackvoid;
    level.callbackplayerkilled = ::callbackvoid;
    level.callbackplayerlaststand = ::callbackvoid;
    level.callbackplayermigrated = ::callbackvoid;
    level.callbackhostmigration = ::callbackvoid;
    setdvar( "g_gametype", "dm" );
    exitlevel( 0 );
}

callbackvoid()
{

}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main()
{
    _id_0FFB::main();
    scripts\mp\maps\mp_skyway\gen\mp_skyway_art::main();
    _id_0FFA::main();
    scripts\mp\load::main();
    scripts\mp\compass::setupminimap( "compass_map_mp_skyway" );
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    setdvar( "r_drawsun", 0 );
    setdvar( "r_umbraMinObjectContribution", 8 );
    setdvar( "r_umbraAccurateOcclusionThreshold", 800 );
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    level._id_C7B3 = getentarray( "OutOfBounds", "targetname" );
    thread _id_CDA4( "mp_moon_screen_destinations_v2" );
    thread _id_5364();
    thread securitymetaldetectors();
    thread fix_collision();
    level.modifiedspawnpoints["1339 2045 0"]["mp_koth_spawn"]["remove"] = 1;
    scripts\mp\spawnlogic::addttlosoverride( 589, 1102, 1.0, 1.0 );
    scripts\mp\spawnlogic::addttlosoverride( 589, 907, 1.0, 1.0 );
    scripts\mp\spawnlogic::addttlosoverride( 589, 908, 1.0, 1.0 );
    scripts\mp\spawnlogic::addttlosoverride( 589, 909, 1.0, 1.0 );
    scripts\mp\spawnlogic::addttlosoverride( 589, 217, 1.0, 1.0 );
    scripts\mp\spawnlogic::addttlosoverride( 589, 218, 1.0, 1.0 );
    scripts\mp\spawnlogic::addttlosoverride( 589, 219, 1.0, 1.0 );
    scripts\mp\spawnlogic::addttlosoverride( 177, 1102, 1.0, 1.0 );
    scripts\mp\spawnlogic::addttlosoverride( 177, 907, 1.0, 1.0 );
    scripts\mp\spawnlogic::addttlosoverride( 177, 908, 1.0, 1.0 );
    scripts\mp\spawnlogic::addttlosoverride( 177, 909, 1.0, 1.0 );
    scripts\mp\spawnlogic::addttlosoverride( 177, 217, 1.0, 1.0 );
    scripts\mp\spawnlogic::addttlosoverride( 177, 218, 1.0, 1.0 );
    scripts\mp\spawnlogic::addttlosoverride( 177, 219, 1.0, 1.0 );
}

fix_collision()
{
    var_0 = spawn( "script_model", ( 1856, -736, -112 ) );
    var_0.angles = ( 0, 0, 180 );
    var_0 setmodel( "mp_desert_uplink_col_01" );
    var_1 = getent( "clip32x32x256", "targetname" );
    var_2 = spawn( "script_model", ( 256, -60, -32 ) );
    var_2.angles = ( 0, 0, 90 );
    var_2 clonebrushmodeltoscriptmodel( var_1 );
    var_3 = getent( "clip32x32x256", "targetname" );
    var_4 = spawn( "script_model", ( 368, -60, -32 ) );
    var_4.angles = ( 0, 0, 90 );
    var_4 clonebrushmodeltoscriptmodel( var_3 );
    var_5 = getent( "player256x256x8", "targetname" );
    var_6 = spawn( "script_model", ( 384, -192, 80 ) );
    var_6.angles = ( 0, 60, 90 );
    var_6 clonebrushmodeltoscriptmodel( var_5 );
    var_7 = getent( "player256x256x8", "targetname" );
    var_8 = spawn( "script_model", ( 256, -192, 80 ) );
    var_8.angles = ( 0, -60, 90 );
    var_8 clonebrushmodeltoscriptmodel( var_7 );
    var_9 = getent( "clip64x64x256", "targetname" );
    var_10 = spawn( "script_model", ( 284, 1216, -40 ) );
    var_10.angles = ( 0, 0, 90 );
    var_10 clonebrushmodeltoscriptmodel( var_9 );
    var_11 = getent( "clip64x64x256", "targetname" );
    var_12 = spawn( "script_model", ( 348, 1216, -40 ) );
    var_12.angles = ( 0, 0, 90 );
    var_12 clonebrushmodeltoscriptmodel( var_11 );
    var_13 = getent( "clip64x64x128", "targetname" );
    var_14 = spawn( "script_model", ( 776, 3868, 276 ) );
    var_14.angles = ( 0, 0, 0 );
    var_14 clonebrushmodeltoscriptmodel( var_13 );
    var_15 = spawn( "script_model", ( 2520, 1392, -12 ) );
    var_15.angles = ( 0, 0, 0 );
    var_15 setmodel( "mp_skyway_nosight_v1" );
    var_16 = getent( "clip128x128x256", "targetname" );
    var_17 = spawn( "script_model", ( 88, 2988, 252 ) );
    var_17.angles = ( 0, 270, 90 );
    var_17 clonebrushmodeltoscriptmodel( var_16 );
    var_18 = getent( "player128x128x8", "targetname" );
    var_19 = spawn( "script_model", ( 325, 688, -70 ) );
    var_19.angles = ( 0, 0, 0 );
    var_19 clonebrushmodeltoscriptmodel( var_18 );
    var_20 = getent( "player128x128x8", "targetname" );
    var_21 = spawn( "script_model", ( 328, 560, -70 ) );
    var_21.angles = ( 0, 0, 0 );
    var_21 clonebrushmodeltoscriptmodel( var_20 );
}

_id_CDA4( var_0 )
{
    wait 30;
    _func_30E( var_0 );
}

_id_5364()
{
    wait 5;
    var_0 = getentarray( "destructible_screens", "targetname" );
    scripts\engine\utility::_id_22D2( var_0, ::_id_5365 );
}

_id_5365()
{
    self endon( "death" );
    var_0 = getglass( self._id_0334 );

    if ( !isdefined( var_0 ) )
    {
        iprintlnbold( "GLASS ID AT " + self.origin + "IS UNDEFINED" );
        return;
    }

    while ( !isglassdestroyed( var_0 ) )
        wait 0.05;

    if ( !isdefined( self._id_ED83 ) )
        playfx( scripts\engine\utility::_id_7ECB( "vfx_moon_adscreen_sparks_runner" ), self.origin );

    self delete();
}

securitymetaldetectors()
{
    level endon( "game_ended" );
    var_0 = getent( "audio_metal_detector", "targetname" );

    if ( isdefined( var_0 ) )
    {
        for (;;)
        {
            var_0 waittill( "trigger", var_1 );
            playloopsound( var_1.origin + ( 0, 0, 80 ), "skyway_metal_detector_beep" );
        }
    }
}

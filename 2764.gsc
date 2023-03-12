// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main()
{
    if ( isdefined( level._id_1307 ) )
        return;

    level._id_74C2 = [];
    level._id_1307 = 1;
    level.createfx_enabled = getdvar( "createfx" ) != "";
    level.players_waiting_for_callback = [];
    scripts\engine\utility::_id_1115B();
    scripts\mp\utility\game::_id_980B();
    scripts\mp\utility\game::_id_9892();
    thread scripts\mp\playerlogic::queueconnectednotify();
    level._id_7763 = 0;
    level._id_6E46 = spawnstruct();
    level._id_6E46 scripts\engine\flags::_id_23D9();

    if ( !isdefined( level._id_6E25 ) )
    {
        level._id_6E25 = [];
        level._id_6E6E = [];
    }

    level._id_499A = scripts\mp\hud_util::_id_49B2;
    level._id_91B0 = scripts\mp\hud_util::_id_F801;
    thread scripts\mp\tweakables::init();

    if ( !isdefined( level._id_74C2 ) )
        level._id_74C2 = [];

    level._id_74C2["precacheMpAnim"] = ::precachempanim;
    level._id_74C2["scriptModelPlayAnim"] = ::scriptmodelplayanim;
    level._id_74C2["scriptModelClearAnim"] = ::scriptmodelclearanim;

    if ( !level.createfx_enabled )
    {
        thread scripts\mp\minefields::_id_B774();
        thread scripts\mp\shutter::main();
        thread scripts\mp\movers::init();
        thread scripts\mp\destructables::init();
        thread scripts\common\elevator::init();
        level notify( "interactive_start" );
    }

    game["thermal_vision"] = "thermal_mp";
    visionsetnaked( "", 0 );
    visionsetnight( "default_night_mp" );
    visionsetmissilecam( "missilecam" );
    visionsetthermal( game["thermal_vision"] );
    visionsetpain( "", 0 );
    var_0 = getentarray( "lantern_glowFX_origin", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] thread _id_A84C();

    scripts\mp\audio::_id_9539();
    _id_0A89::main();
    _id_FAAA();
    thread scripts\common\fx::_id_980A();

    if ( level.createfx_enabled )
    {
        scripts\mp\spawnlogic::_id_F78E();
        scripts\mp\createfx::_id_49B4();
    }

    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
    {
        scripts\mp\dev::_id_DE5D();
        scripts\mp\dev::_id_DE5C();
        scripts\mp\spawnlogic::_id_F78E();
        scripts\mp\global_fx::main();
        level waittill( "eternity" );
    }

    thread scripts\mp\global_fx::main();

    for ( var_2 = 0; var_2 < 7; var_2++ )
    {
        switch ( var_2 )
        {
            case 0:
                var_3 = "trigger_multiple";
                break;
            case 1:
                var_3 = "trigger_once";
                break;
            case 2:
                var_3 = "trigger_use";
                break;
            case 3:
                var_3 = "trigger_radius";
                break;
            case 4:
                var_3 = "trigger_lookat";
                break;
            case 5:
                var_3 = "trigger_multiple_arbitrary_up";
                break;
            default:
                var_3 = "trigger_damage";
                break;
        }

        var_4 = getentarray( var_3, "classname" );

        for ( var_1 = 0; var_1 < var_4.size; var_1++ )
        {
            if ( isdefined( var_4[var_1]._id_EE89 ) )
                var_4[var_1].targetname = var_4[var_1]._id_EE89;

            if ( isdefined( var_4[var_1].targetname ) )
                level thread _id_69AA( var_4[var_1] );

            if ( var_3 == "trigger_multiple_arbitrary_up" )
            {
                var_5 = var_4[var_1];
                var_5 _meth_84C0( 1 );

                if ( isdefined( var_5._id_0334 ) )
                {
                    var_6 = getent( var_5._id_0334, "targetname" );
                    var_5 _meth_80D2();
                    var_5 linkto( var_6 );
                }
            }
        }
    }

    thread scripts\mp\animatedmodels::main();
    level._id_74C2["damagefeedback"] = scripts\mp\damagefeedback::updatedamagefeedback;
    level._id_74C2["setTeamHeadIcon"] = scripts\mp\entityheadicons::_id_F877;
    level._id_A879 = ::laseron;
    level._id_A877 = ::laseroff;
    level._id_4537 = ::connectpaths;
    level._id_563A = ::disconnectpaths;
    setdvar( "sm_sunShadowScale", 1 );
    setdvar( "sm_spotLightScoreModelScale", 0 );
    setdvar( "r_specularcolorscale", 1 );
    setdvar( "r_diffusecolorscale", 1 );
    setdvar( "r_lightGridEnableTweaks", 0 );
    setdvar( "r_lightGridIntensity", 1 );
    setdvar( "r_lightGridContrast", 0 );
    setdvar( "ui_showInfo", 1 );
    setdvar( "ui_showMinimap", 1 );
    _id_FAA3();
    precacheitem( "bomb_site_mp" );
    level._id_6BAA = 0;
    level._id_AD86 = "vehicle_aas_72x_killstreak";
}

_id_69AA( var_0 )
{
    level endon( "killexplodertridgers" + var_0.targetname );
    var_0 waittill( "trigger" );

    if ( isdefined( var_0._id_ED28 ) && randomfloat( 1 ) > var_0._id_ED28 )
    {
        if ( isdefined( var_0._id_027B ) )
            wait( var_0._id_027B );
        else
            wait 4;

        level thread _id_69AA( var_0 );
        return;
    }

    scripts\engine\utility::_id_69A3( var_0.targetname );
    level notify( "killexplodertridgers" + var_0.targetname );
}

_id_FAAA()
{
    var_0 = getentarray( "script_brushmodel", "classname" );
    var_1 = getentarray( "script_model", "classname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0[var_0.size] = var_1[var_2];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( isdefined( var_0[var_2]._id_EE89 ) )
            var_0[var_2].targetname = var_0[var_2]._id_EE89;

        if ( isdefined( var_0[var_2].targetname ) )
        {
            if ( var_0[var_2]._id_01F1 == "fx" && ( !isdefined( var_0[var_2]._id_0336 ) || var_0[var_2]._id_0336 != "exploderchunk" ) )
            {
                var_0[var_2] hide();
                continue;
            }

            if ( isdefined( var_0[var_2]._id_0336 ) && var_0[var_2]._id_0336 == "exploder" )
            {
                var_0[var_2] hide();
                var_0[var_2] notsolid();
                continue;
            }

            if ( isdefined( var_0[var_2]._id_0336 ) && var_0[var_2]._id_0336 == "exploderchunk" )
            {
                var_0[var_2] hide();
                var_0[var_2] notsolid();
            }
        }
    }

    var_3 = [];
    var_4 = getentarray( "script_brushmodel", "classname" );

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
    {
        if ( isdefined( var_4[var_2]._id_EE89 ) )
            var_4[var_2].targetname = var_4[var_2]._id_EE89;

        if ( isdefined( var_4[var_2].targetname ) )
            var_3[var_3.size] = var_4[var_2];
    }

    var_4 = getentarray( "script_model", "classname" );

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
    {
        if ( isdefined( var_4[var_2]._id_EE89 ) )
            var_4[var_2].targetname = var_4[var_2]._id_EE89;

        if ( isdefined( var_4[var_2].targetname ) )
            var_3[var_3.size] = var_4[var_2];
    }

    var_4 = getentarray( "item_health", "classname" );

    for ( var_2 = 0; var_2 < var_4.size; var_2++ )
    {
        if ( isdefined( var_4[var_2]._id_EE89 ) )
            var_4[var_2].targetname = var_4[var_2]._id_EE89;

        if ( isdefined( var_4[var_2].targetname ) )
            var_3[var_3.size] = var_4[var_2];
    }

    if ( !isdefined( level.createfxent ) )
        level.createfxent = [];

    var_5 = [];
    var_5["exploderchunk visible"] = 1;
    var_5["exploderchunk"] = 1;
    var_5["exploder"] = 1;

    for ( var_2 = 0; var_2 < var_3.size; var_2++ )
    {
        var_6 = var_3[var_2];
        var_7 = scripts\engine\utility::_id_49AE( var_6._id_EDBB );
        var_7.v = [];
        var_7.v["origin"] = var_6.origin;
        var_7.v["angles"] = var_6.angles;
        var_7.v["delay"] = var_6._id_027B;
        var_7.v["firefx"] = var_6._id_ED93;
        var_7.v["firefxdelay"] = var_6._id_ED94;
        var_7.v["firefxsound"] = var_6._id_ED95;
        var_7.v["firefxtimeout"] = var_6._id_ED96;
        var_7.v["earthquake"] = var_6._id_ED76;
        var_7.v["damage"] = var_6._id_ED41;
        var_7.v["damage_radius"] = var_6._id_EE8F;
        var_7.v["soundalias"] = var_6._id_EEB1;
        var_7.v["repeat"] = var_6._id_EE94;
        var_7.v["delay_min"] = var_6._id_ED50;
        var_7.v["delay_max"] = var_6._id_ED4F;
        var_7.v["target"] = var_6._id_0334;
        var_7.v["ender"] = var_6._id_ED78;
        var_7.v["type"] = "exploder";

        if ( !isdefined( var_6._id_EDBB ) )
            var_7.v["fxid"] = "No FX";
        else
            var_7.v["fxid"] = var_6._id_EDBB;

        var_7.v["exploder"] = var_6.targetname;

        if ( !isdefined( var_7.v["delay"] ) )
            var_7.v["delay"] = 0;

        if ( isdefined( var_6._id_0334 ) )
        {
            var_8 = getent( var_7.v["target"], "targetname" ).origin;
            var_7.v["angles"] = vectortoangles( var_8 - var_7.v["origin"] );
        }

        if ( var_6.classname == "script_brushmodel" || isdefined( var_6._id_01F1 ) )
        {
            var_7._id_01F1 = var_6;
            var_7._id_01F1._id_5635 = var_6._id_ED5D;
        }

        if ( isdefined( var_6._id_0336 ) && isdefined( var_5[var_6._id_0336] ) )
            var_7.v["exploder_type"] = var_6._id_0336;
        else
            var_7.v["exploder_type"] = "normal";

        var_7 scripts\common\createfx::_id_D6CF();
    }
}

_id_A84C()
{
    if ( !isdefined( level._effect["lantern_light"] ) )
        level._effect["lantern_light"] = loadfx( "vfx/props/glow_latern" );

    scripts\common\fx::_id_B052( "lantern_light", self.origin, 0.3, self.origin + ( 0, 0, 1 ) );
}

_id_FAA3()
{
    var_0 = getentarray( "scriptable_destructible_vehicle", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_3 = var_2.origin + ( 0, 0, 5 );
        var_4 = var_2.origin + ( 0, 0, 128 );
        var_5 = bullettrace( var_3, var_4, 0, var_2 );
        var_2._id_A63A = spawn( "script_model", var_5["position"] );
        var_2._id_A63A._id_0336 = "killCamEnt_destructible_vehicle";
        var_2._id_A63A setscriptmoverkillcam( "explosive" );
        var_2 thread _id_51AE();
    }

    var_7 = getentarray( "scriptable_destructible_barrel", "targetname" );

    foreach ( var_2 in var_7 )
    {
        var_3 = var_2.origin + ( 0, 0, 5 );
        var_4 = var_2.origin + ( 0, 0, 128 );
        var_5 = bullettrace( var_3, var_4, 0, var_2 );
        var_2._id_A63A = spawn( "script_model", var_5["position"] );
        var_2._id_A63A._id_0336 = "killCamEnt_explodable_barrel";
        var_2._id_A63A setscriptmoverkillcam( "explosive" );
        var_2 thread _id_51AE();
    }
}

_id_51AE()
{
    level endon( "game_ended" );
    var_0 = self._id_A63A;
    var_0 endon( "death" );
    self waittill( "death" );
    wait 10;

    if ( isdefined( var_0 ) )
        var_0 delete();
}

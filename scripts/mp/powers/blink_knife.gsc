// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

blinkknifeinit()
{
    scripts\mp\utility\game::initarbitraryuptriggers();
}

blinkknifedetonate( var_0, var_1, var_2 )
{
    var_3 = var_1.origin;
    var_4 = var_1.angles;
    var_5 = var_1 getplayerangles();
    var_6 = var_1 getstance();

    if ( !blinkknife_validatestuckto( var_1 ) )
    {
        blinkknife_detonatefailed( var_2 );
        return 0;
    }

    if ( !blinkknife_validateplayer( var_2 ) )
    {
        blinkknife_detonatefailed( var_2 );
        return 0;
    }

    var_7 = var_2 scripts\mp\utility\game::isinarbitraryup();
    var_8 = var_1 scripts\mp\utility\game::isinarbitraryup();

    if ( var_7 && var_8 )
    {
        blinkknife_detonatefailed( var_2 );
        return 0;
    }

    if ( var_8 )
    {
        var_9 = var_1 scripts\mp\utility\game::getarbitraryuptriggerblinkloc();

        if ( !isdefined( var_9 ) )
        {
            blinkknife_detonatefailed( var_2 );
            return 0;
        }

        var_10 = spawnstruct();
        var_10.origin = var_9;
        var_10._id_10B53 = "stand";
        var_10.cleararbup = 0;
        var_11 = anglestoforward( var_2 getplayerangles() );
        var_11 *= ( 1, 1, 0 );
        var_12 = vectortoangles( var_11 );
        var_10.playerangles = var_12;
        var_10.angles = var_12 * ( 0, 1, 0 );

        if ( blinkknife_validatedestination( var_2, var_10 ) )
        {
            thread blinkknife_detonatesuccess( var_2, var_1, var_10, var_0 );
            return 1;
        }
    }
    else if ( var_7 )
    {
        var_10 = spawnstruct();
        var_10.origin = var_3;
        var_10._id_10B53 = "stand";
        var_10.cleararbup = 1;
        var_11 = anglestoforward( var_2 getplayerangles() );
        var_11 *= ( 1, 1, 0 );
        var_12 = vectortoangles( var_11 );
        var_10.playerangles = var_12;
        var_10.angles = var_12 * ( 0, 1, 0 );

        if ( blinkknife_validatedestination( var_2, var_10 ) )
        {
            thread blinkknife_detonatesuccess( var_2, var_1, var_10, var_0 );
            return 1;
        }

        var_10._id_10B53 = "crouch";

        if ( blinkknife_validatedestination( var_2, var_10 ) )
        {
            thread blinkknife_detonatesuccess( var_2, var_1, var_10, var_0 );
            return 1;
        }

        var_10._id_10B53 = var_6;
        var_11 = anglestoforward( var_5 );
        var_11 *= ( 1, 1, 0 );
        var_12 = vectortoangles( var_11 );
        var_10.playerangles = var_12;
        var_10.angles = var_12 * ( 0, 1, 0 );

        if ( blinkknife_validatedestination( var_2, var_10 ) )
        {
            thread blinkknife_detonatesuccess( var_2, var_1, var_10, var_0 );
            return 1;
        }
    }
    else
    {
        var_10 = spawnstruct();
        var_10.origin = var_3;
        var_10.angles = var_2.angles;
        var_10.playerangles = var_2 getplayerangles();
        var_10._id_10B53 = "stand";
        var_10.cleararbup = 0;

        if ( blinkknife_validatedestination( var_2, var_10 ) )
        {
            thread blinkknife_detonatesuccess( var_2, var_1, var_10, var_0 );
            return 1;
        }

        var_10._id_10B53 = "crouch";

        if ( blinkknife_validatedestination( var_2, var_10 ) )
        {
            thread blinkknife_detonatesuccess( var_2, var_1, var_10, var_0 );
            return 1;
        }

        var_10._id_10B53 = var_6;
        var_11 = anglestoforward( var_5 );
        var_11 *= ( 1, 1, 0 );
        var_12 = vectortoangles( var_11 );
        var_10.playerangles = var_12;
        var_10.angles = var_12 * ( 0, 1, 0 );

        if ( blinkknife_validatedestination( var_2, var_10 ) )
        {
            thread blinkknife_detonatesuccess( var_2, var_1, var_10, var_0 );
            return 1;
        }
    }

    blinkknife_detonatefailed( var_2 );
    return 0;
}

blinkknife_detonatesuccess( var_0, var_1, var_2, var_3 )
{
    blinkknife_dropball( var_0 );
    blinkknife_dropflag( var_0 );
    thread blinkknife_watchteleport( var_0 );
    thread blinkknife_victimfx( var_0, var_1 );
    thread blinkknife_startfx( var_0, var_2 );

    if ( var_2.cleararbup )
        var_0 _meth_84EF( ( 0, 0, 0 ), 0 );

    var_0 setorigin( var_2.origin, 1, 1 );
    var_0 setplayerangles( var_2.playerangles );
    var_0 setstance( var_2._id_10B53 );
    thread blinkknife_endfx( var_0 );

    if ( isdefined( var_3 ) )
    {
        var_3 endon( "death" );
        var_0 endon( "death" );
        var_0 endon( "disconnect" );
        waittillframeend;

        if ( scripts\mp\weapons::_id_11827( var_0, "power_blinkKnife" ) )
            var_3 delete();
    }
}

blinkknife_detonatefailed( var_0 )
{
    if ( level._id_7669 )
        return;

    if ( !isdefined( var_0 ) )
        return;

    if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
        return;

    var_0 scripts\mp\hud_message::_id_10122( "MP_BLINK_KNIFE_FAILED" );
}

blinkknife_watchteleport( var_0 )
{
    var_0 endon( "disconnect" );
    var_0.blinkknife_teleporting = 1;
    var_0 scripts\engine\utility::_id_13736( 0.05, "death" );
    var_0.blinkknife_teleporting = undefined;
}

blinkknife_validatestuckto( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isplayer( var_0 ) )
        return 0;

    if ( scripts\mp\utility\game::isreallyalive( var_0 ) )
        return 0;

    if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_0 ) )
        return 0;

    if ( var_0 _meth_8568() )
        return 0;

    if ( var_0 _meth_8569() )
        return 0;

    if ( scripts\mp\utility\game::istrue( var_0.blinkknife_teleporting ) )
        return 0;

    return 1;
}

blinkknife_validateplayer( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
        return 0;

    if ( var_0 _meth_84CA() )
        return 0;

    if ( var_0 scripts\mp\supers\super_reaper::isusingreaper() )
        return 0;

    if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_0 ) )
        return 0;

    if ( var_0 _meth_8568() )
        return 0;

    if ( var_0 _meth_8569() )
        return 0;

    if ( scripts\mp\utility\game::istrue( var_0.blinkknife_teleporting ) )
        return 0;

    return 1;
}

blinkknife_validatedestination( var_0, var_1 )
{
    var_2 = physics_createcontents( [ "physicscontents_solid", "physicscontents_glass", "physicscontents_water", "physicscontents_sky", "physicscontents_vehicle", "physicscontents_sky", "physicscontents_playerclip" ] );
    var_3 = physics_getclosestpointtocharacter( var_1.origin, var_0, 0, var_1.angles, 0, var_2, [ var_0 ], "physicsquery_closest", var_1._id_10B53 );

    if ( isdefined( var_3 ) && var_3.size > 0 )
        return 0;

    return 1;
}

blinkknife_dropball( var_0 )
{
    if ( var_0 scripts\mp\utility\game::_id_12D6( "specialty_ballcarrier" ) )
        var_0 scripts\mp\gametypes\obj_ball::ball_drop_on_ability();
}

blinkknife_dropflag( var_0 )
{
    if ( isdefined( var_0._id_3AF4 ) )
    {
        var_1 = level._id_115CC[scripts\mp\utility\game::_id_8027( var_0.team )];
        var_1 thread scripts\mp\gameobjects::setdropped();
    }
}

blinkknife_startfx( var_0, var_1 )
{
    if ( !isdefined( var_0.blinkknife_startstateid ) )
        var_0.blinkknife_startstateid = 1;
    else
        var_0.blinkknife_startstateid = scripts\engine\utility::ter_op( var_0.blinkknife_startstateid == 1, 2, 1 );

    var_0 setscriptablepartstate( "blinkKnifeStart", "active" + var_0.blinkknife_startstateid );
    var_2 = var_0 gettagorigin( "j_spineupper" );
    var_3 = vectortoangles( var_1.origin - var_0.origin );
    var_4 = spawn( "script_model", var_2 );
    var_4.angles = var_3;
    var_4 setmodel( "power_mp_blinkKnife_scr" );
    var_4 setscriptablepartstate( "effects", "activeBlinkStart" );
    wait 0.2;
    var_4 delete();
}

blinkknife_endfx( var_0 )
{
    scripts\engine\utility::waitframe();

    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0.blinkknife_endstateid ) )
        var_0.blinkknife_endstateid = 1;
    else
        var_0.blinkknife_endstateid = scripts\engine\utility::ter_op( var_0.blinkknife_endstateid == 1, 2, 1 );

    var_0 setscriptablepartstate( "blinkKnifeEnd", "active" + var_0.blinkknife_endstateid );
}

blinkknife_victimfx( var_0, var_1 )
{
    var_2 = var_1 _meth_8113();

    if ( isdefined( var_2 ) )
        var_2 hide();

    var_3 = var_1 gettagorigin( "j_spineupper" );
    var_4 = var_1.angles;
    var_5 = spawn( "script_model", var_3 );
    var_5.angles = var_4;
    var_5 setmodel( "power_mp_blinkKnife_scr" );

    if ( var_1._id_AE62 == "archetype_scout" )
        var_5 setscriptablepartstate( "effects", "activeVictimDeathRobot" );
    else
        var_5 setscriptablepartstate( "effects", "activeVictimDeath" );

    wait 1;
    var_5 delete();
}

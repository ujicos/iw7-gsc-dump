// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_2C78( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;

    if ( isdefined( level._id_4B29 ) )
        level._id_4B29 scripts\mp\gameobjects::_id_51DA();

    var_3 = level._id_C2A8[var_0];

    if ( isdefined( var_3._id_C732 ) )
        var_3.origin = var_3._id_C732;
    else
        var_3._id_C732 = var_3.origin;

    var_4 = getentarray( var_3._id_0334, "targetname" );

    if ( level.gametype == "dd" )
    {
        var_2 = var_3._id_EDF9;
        var_5 = getent( "dd_bombzone_clip" + var_2, "targetname" );

        if ( scripts\mp\utility\game::_id_9900() )
        {
            if ( var_2 == "_a" || var_2 == "_b" )
            {
                var_3 delete();
                var_4[0] delete();
                var_5 delete();
                return;
            }

            var_1 = scripts\mp\gameobjects::createuseobject( "neutral", var_3, var_4, ( 0, 0, 64 ) );
            var_1 scripts\mp\gameobjects::allowuse( "any" );
            var_1.trigger._id_EDF9 = "_a";
        }
        else
        {
            if ( var_2 == "_c" )
            {
                var_3 delete();
                var_4[0] delete();
                var_5 delete();
                return;
            }

            if ( level._id_B335 == "mp_desert" && var_2 == "_b" )
            {
                var_3.origin += ( 0, 0, 8 );
                var_4[0].origin += ( 0, 0, 8 );
                var_5.origin += ( 0, 0, 8 );
            }
        }
    }
    else
        var_3 = postshipmodifiedbombzones( var_4, var_3 );

    if ( !isdefined( var_1 ) )
    {
        var_1 = scripts\mp\gameobjects::createuseobject( game["defenders"], var_3, var_4, ( 0, 0, 64 ) );
        var_1 scripts\mp\gameobjects::allowuse( "enemy" );
    }

    var_1._id_92B8 = "bomb_zone";
    var_1.trigger _meth_8360();
    var_1 scripts\mp\gameobjects::_id_FB08( level._id_CC52 );
    var_1 scripts\mp\gameobjects::_id_FB14( 0 );
    var_1 scripts\mp\gameobjects::_id_FB07( &"MP_PLANTING_EXPLOSIVE" );
    var_1 scripts\mp\gameobjects::_id_FB06( &"PLATFORM_HOLD_TO_PLANT_EXPLOSIVES" );

    if ( !level.multibomb )
        var_1 scripts\mp\gameobjects::_id_F76A( level._id_F013 );

    var_2 = var_1 scripts\mp\gameobjects::_id_7F5A();

    if ( level.gametype == "dd" && scripts\mp\utility\game::_id_9900() )
    {
        var_2 = "_a";
        var_1 scripts\mp\gameobjects::_id_F283( "friendly", "waypoint_target" + var_2 );
        var_1 scripts\mp\gameobjects::_id_F284( "friendly", "waypoint_target" + var_2 );
        var_1 scripts\mp\gameobjects::_id_F283( "enemy", "waypoint_target" + var_2 );
        var_1 scripts\mp\gameobjects::_id_F284( "enemy", "waypoint_target" + var_2 );
    }
    else
    {
        var_1 scripts\mp\gameobjects::_id_F283( "friendly", "waypoint_defend" + var_2 );
        var_1 scripts\mp\gameobjects::_id_F284( "friendly", "waypoint_defend" + var_2 );
        var_1 scripts\mp\gameobjects::_id_F283( "enemy", "waypoint_target" + var_2 );
        var_1 scripts\mp\gameobjects::_id_F284( "enemy", "waypoint_target" + var_2 );
    }

    var_1._id_01AD = var_2;
    var_1 scripts\mp\gameobjects::_id_FB0E( "any" );
    var_1._id_C4CB = ::_id_2C71;
    var_1._id_C50D = ::_id_2C74;
    var_1._id_C5BB = ::_id_2C76;
    var_1._id_C4D4 = ::_id_2C73;
    var_1._id_130F8 = "briefcase_bomb_mp";
    var_1._id_2C5C = 0;
    var_1._id_2C58 = undefined;

    for ( var_6 = 0; var_6 < var_4.size; var_6++ )
    {
        if ( isdefined( var_4[var_6].targetname ) )
        {
            var_1._id_69B6 = var_4[var_6].targetname;
            var_4[var_6] thread _id_FAC9( var_1 );
            break;
        }
    }

    var_1._id_2C4B = getent( var_4[0]._id_0334, "targetname" );
    var_1._id_2C4B.origin += ( 0, 0, -10000 );
    var_1._id_2C4B._id_01AD = var_2;
    var_1.noweapondropallowedtrigger = spawn( "trigger_radius", var_1.trigger.origin, 0, 140, 100 );
    return var_1;
}

_id_FAC9( var_0 )
{
    var_1 = spawn( "script_origin", self.origin );
    var_1.angles = self.angles;
    var_1 _meth_8271( -45, 0.05 );
    wait 0.05;
    var_2 = undefined;
    var_3 = self.origin + ( 0, 0, 45 );
    var_4 = self.origin + anglestoforward( var_1.angles ) * 100 + ( 0, 0, 128 );
    var_5 = [ "physicscontents_clipshot", "physicscontents_corpseclipshot", "physicscontents_missileclip", "physicscontents_solid", "physicscontents_vehicle" ];
    var_6 = physics_createcontents( var_5 );
    var_7 = scripts\engine\trace::_id_DCED( var_3, var_4, self, var_6 );
    var_2 = var_7["position"];

    if ( scripts\mp\utility\game::_id_7F8B() == "mp_skyway" && var_0._id_01AD == "_b" )
        var_2 = ( 326, 595, 85 );

    self._id_A63A = spawn( "script_model", var_2 );
    self._id_A63A setscriptmoverkillcam( "explosive" );
    var_0._id_A63C = self._id_A63A getentitynumber();
    var_1 delete();
}

_id_1C8E( var_0 )
{
    scripts\engine\utility::_id_1C53( var_0 );
    scripts\engine\utility::_id_1C4E( var_0 );
    scripts\mp\utility\game::_id_1C47( var_0 );

    if ( var_0 )
        scripts\engine\utility::_id_13736( 0.8, "bomb_allow_offhands" );

    scripts\engine\utility::_id_1C58( var_0 );
}

_id_2C71( var_0 )
{
    var_0 thread _id_1C8E( 0 );

    if ( scripts\mp\gameobjects::_id_9E07( var_0.pers["team"] ) )
    {
        if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
            var_0 _meth_80C1( 1 );

        var_0 scripts\mp\utility\game::_id_C131( "defuse" );
        var_0 notify( "super_obj_drain" );
        var_0._id_9DBC = 1;
        setomnvar( "ui_bomb_defuser", var_0 getentitynumber() );
        scripts\mp\utility\game::_id_F79E( 4, var_0.team, var_0 getentitynumber() );

        if ( isdefined( level._id_F014 ) )
            level._id_F014 hide();
        else if ( isdefined( level._id_4DA4[self._id_01AD] ) )
            level._id_4DA4[self._id_01AD] hide();

        var_0 thread _id_10DD0( "briefcase_bomb_defuse_mp", "weap_suitcase_defuse_button" );
    }
    else
    {
        var_1 = 2;

        if ( self._id_01AD == "_a" )
            var_1 = 1;

        scripts\mp\utility\game::_id_F79E( 14, var_0.team, var_0 getentitynumber(), var_1 );
        var_0 scripts\mp\utility\game::_id_C131( "plant" );
        var_0 notify( "super_obj_drain" );
        var_0._id_9EE6 = 1;
        var_0._id_2C5E = self._id_130F8;
        var_0 thread _id_10DD0( "briefcase_bomb_mp", "weap_suitcase_raise_button" );
    }
}

_id_2C74( var_0, var_1, var_2 )
{
    setomnvar( "ui_bomb_defuser", -1 );

    if ( !isdefined( var_1 ) )
        return;

    var_1 thread _id_1C8E( 1 );
    var_1._id_2C5E = undefined;

    if ( isalive( var_1 ) )
    {
        var_1._id_9DBC = 0;
        var_1._id_9EE6 = 0;
    }

    if ( isplayer( var_1 ) )
    {
        var_1 setclientomnvar( "ui_objective_state", 0 );
        var_1._id_12B1A = undefined;
    }

    if ( scripts\mp\gameobjects::_id_9E07( var_1.pers["team"] ) )
    {
        if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
            var_1 _meth_80C1( 0 );

        if ( isdefined( level._id_F014 ) && !var_2 )
            level._id_F014 show();
        else if ( isdefined( level._id_4DA4 ) )
        {
            if ( isdefined( level._id_4DA4[self._id_01AD] ) && !var_2 )
                level._id_4DA4[self._id_01AD] show();
        }
    }
}

_id_10DD0( var_0, var_1 )
{
    self endon( "death" );
    self endon( "stopNpcBombSound" );

    if ( scripts\mp\utility\game::_id_9D46() || scripts\mp\utility\game::istrue( level._id_101F7 ) || scripts\mp\utility\game::_id_12D6( "specialty_engineer" ) )
        return;

    var_2 = "";

    while ( var_2 != var_0 )
        self waittill( "weapon_change", var_2 );

    self playsoundtoteam( var_1, self.team, self );
    var_3 = scripts\mp\utility\game::_id_8027( self.team );
    self playsoundtoteam( var_1, var_3 );
    self waittill( "weapon_change" );
    self notify( "stopNpcBombSound" );
}

_id_2C73( var_0 )
{

}

_id_2C76( var_0 )
{
    if ( scripts\mp\utility\game::_id_9900() && self._id_2C5C == 0 || !scripts\mp\gameobjects::_id_9E07( var_0.pers["team"] ) )
    {
        level thread _id_2C72( self, var_0 );
        var_0 playsound( "mp_bomb_plant" );
        var_0 notify( "bomb_planted" );
        var_0 setclientomnvar( "ui_objective_progress", 0.01 );
        var_1 = 2;

        if ( self._id_01AD == "_a" )
            var_1 = 1;

        scripts\mp\utility\game::_id_F79E( 3, var_0.team, var_0 getentitynumber(), var_1 );
        var_0 scripts\mp\utility\game::incperstat( "plants", 1 );
        var_0 scripts\mp\persistence::statsetchild( "round", "plants", var_0.pers["plants"] );
        var_0 scripts\mp\utility\game::setextrascore0( var_0.pers["plants"] );

        if ( isdefined( level._id_F004 ) && isdefined( level._id_F004[var_0.team] ) )
            var_0 thread _id_E0D7();

        if ( scripts\mp\utility\game::_id_9900() )
            scripts\mp\utility\game::_id_10E60( "enemy_bomb_planted", level._id_C74B[var_0.team], 1 );
        else
            scripts\mp\utility\game::_id_10E60( "enemy_bomb" + self._id_01AD, level._id_C74B[var_0.team], 1 );

        scripts\mp\utility\game::_id_10E60( "bomb_planted", var_0.team, 1 );
        level thread scripts\mp\utility\game::_id_115DE( "callout_bombplanted", var_0 );
        level._id_2C5B = var_0;
        var_0 thread scripts\mp\utility\game::_id_83B4( "plant" );
        var_0._id_2C5D = gettime();

        if ( isplayer( var_0 ) )
            var_0 thread scripts\mp\matchdata::_id_AFBA( "plant", var_0.origin );
    }
}

_id_2C75( var_0 )
{
    var_1 = 0;
    var_0 setclientomnvar( "ui_objective_progress", 0.01 );

    foreach ( var_3 in level._id_2C7A )
    {
        if ( var_3._id_01AD == self._id_01AD )
        {
            var_0 notify( "bomb_defused" + var_3._id_01AD );
            level thread _id_2C4A( var_3 );
            break;
        }
    }

    scripts\mp\gameobjects::_id_5603();

    if ( !level._id_8B38 )
        iprintln( &"MP_EXPLOSIVES_DEFUSED_BY", var_0 );

    scripts\mp\utility\game::_id_10E60( "enemy_bomb_defused", level._id_C74B[var_0.team], 1 );
    scripts\mp\utility\game::_id_10E60( "bomb_defused", var_0.team, 1 );
    level thread scripts\mp\utility\game::_id_115DE( "callout_bombdefused", var_0 );
    var_5 = "ninja_defuse";

    if ( scripts\mp\utility\game::getgametypenumlives() >= 1 )
    {
        var_6 = scripts\mp\utility\game::_id_808A();

        if ( var_6.size == 1 && var_6[0] == var_0 )
        {
            var_0 thread scripts\mp\awards::givemidmatchaward( "mode_sd_last_defuse" );
            var_1 = 1;
        }
    }

    if ( !var_1 )
        var_0 thread scripts\mp\awards::givemidmatchaward( "mode_sd_defuse" );

    var_0 scripts\mp\utility\game::incperstat( "defuses", 1 );
    var_0 scripts\mp\persistence::statsetchild( "round", "defuses", var_0.pers["defuses"] );

    if ( level.gametype != "sr" )
        var_0 scripts\mp\utility\game::_id_F6FB( var_0.pers["defuses"] );

    if ( isplayer( var_0 ) )
        var_0 thread scripts\mp\matchdata::_id_AFBA( "defuse", var_0.origin );
}

_id_2C72( var_0, var_1 )
{
    level notify( "bomb_planted", var_0 );
    var_2 = var_1.team;
    level._id_2C4A = 0;
    var_0._id_2C4A = 0;

    if ( level.gametype == "dd" )
    {
        scripts\mp\gamelogic::_id_C9D6();
        level._id_1190A = gettime();
    }

    level._id_2C5C = 1;
    level._id_2C64 += 1;
    level._id_118FA = 1;
    level._id_50A7 = int( gettime() + level._id_2C6C * 1000 );

    if ( var_0._id_01AD == "_a" )
        level._id_209F = 1;
    else
        level._id_2F35 = 1;

    _id_F66F( var_1.team );
    level._id_52D9 = var_0;
    level._id_52D9._id_2C5C = 1;

    if ( level.gametype != "dd" )
    {
        var_1 setclientomnvar( "ui_carrying_bomb", 0 );
        setomnvar( "ui_bomb_carrier", -1 );
        setgameendtime( level._id_50A7 );
    }

    var_0.visuals[0] thread scripts\mp\gamelogic::_id_D54F();
    level._id_118A0 = var_0.visuals[0];

    if ( !level.multibomb )
    {
        level._id_F013 scripts\mp\gameobjects::_id_1C7C( "none" );
        level._id_F013 scripts\mp\gameobjects::_id_FB0E( "none" );
        level._id_F013 scripts\mp\gameobjects::setdropped();
        level._id_F014 = level._id_F013.visuals[0];
        level._id_F014 _meth_8588();
    }
    else if ( level.gametype == "dd" )
    {
        level._id_4DA4[var_0._id_01AD] = spawn( "script_model", var_1.origin );
        level._id_4DA4[var_0._id_01AD].angles = var_1.angles;
        level._id_4DA4[var_0._id_01AD] setmodel( "suitcase_bomb_iw7_wm" );
        level._id_4DA4[var_0._id_01AD] _meth_8588();
    }
    else
    {
        level._id_F014 = spawn( "script_model", var_1.origin );
        level._id_F014.angles = var_1.angles;
        level._id_F014 setmodel( "suitcase_bomb_iw7_wm" );
        level._id_F014 _meth_8588();
    }

    if ( level.gametype != "dd" )
    {
        var_0 scripts\mp\gameobjects::allowuse( "none" );
        var_0 scripts\mp\gameobjects::_id_FB0E( "none" );
    }

    var_3 = var_0 scripts\mp\gameobjects::_id_7F5A();
    var_4 = [];

    if ( level.gametype == "dd" )
    {
        var_5 = var_0.trigger;
        var_5.origin = var_0.visuals[0].origin;
        var_6 = level._id_C74B[var_1.team];
        var_7 = var_0;
    }
    else
    {
        var_5 = var_0._id_2C4B;
        var_5.origin = level._id_F014.origin;
        var_6 = game["defenders"];
        var_7 = scripts\mp\gameobjects::createuseobject( var_6, var_5, var_4, ( 0, 0, 32 ) );
    }

    var_7._id_92B8 = "defuse_object";
    var_7.trigger _meth_8360();
    var_7 scripts\mp\gameobjects::allowuse( "friendly" );

    if ( scripts\mp\utility\game::_id_9900() )
        var_0 scripts\mp\gameobjects::_id_F7D4( level._id_C74B[var_1.team] );

    var_7 scripts\mp\gameobjects::_id_FB08( level._id_50AB );
    var_7 scripts\mp\gameobjects::_id_FB14( 0 );
    var_7 scripts\mp\gameobjects::_id_FB07( &"MP_DEFUSING_EXPLOSIVE" );
    var_7 scripts\mp\gameobjects::_id_FB06( &"PLATFORM_HOLD_TO_DEFUSE_EXPLOSIVES" );
    var_7 scripts\mp\gameobjects::_id_FB0E( "any" );
    var_7 scripts\mp\gameobjects::_id_F283( "friendly", "waypoint_defuse" + var_3 );
    var_7 scripts\mp\gameobjects::_id_F283( "enemy", "waypoint_defend" + var_3 );
    var_7 scripts\mp\gameobjects::_id_F284( "friendly", "waypoint_defuse" + var_3 );
    var_7 scripts\mp\gameobjects::_id_F284( "enemy", "waypoint_defend" + var_3 );
    var_7._id_01AD = var_3;
    var_7._id_C4CB = ::_id_2C71;
    var_7._id_C50D = ::_id_2C74;
    var_7._id_C5BB = ::_id_2C75;
    var_7._id_130F8 = "briefcase_bomb_mp";
    _id_2C6D( var_0 );
    var_0.visuals[0] scripts\mp\gamelogic::_id_11094();

    if ( level._id_7669 )
        return;
    else if ( level.gametype == "sd" && level._id_2C4A || level.gametype == "sr" && level._id_2C4A )
    {
        var_7 scripts\mp\gameobjects::_id_51DA();
        return;
    }

    if ( level.gametype == "dd" )
    {
        if ( var_0._id_2C4A )
        {
            var_0._id_2C5C = 0;
            var_0 thread scripts\mp\gametypes\dd::_id_2C59( var_1, "defused" );
            var_0._id_C5BB = ::_id_2C76;
            level._id_4DA4[var_0._id_01AD] delete();
            return;
        }
        else
        {
            level._id_2C58 += 1;
            var_0 thread scripts\mp\gametypes\dd::_id_2C59( var_1, "explode", var_2 );
        }
    }
    else
        level._id_2C58 += 1;

    level notify( "bomb_exploded" + var_0._id_01AD );
    var_1 thread scripts\mp\awards::givemidmatchaward( "mode_sd_detonate" );

    if ( isdefined( level._id_F007 ) )
        level thread [[ level._id_F007 ]]();

    if ( level.gametype == "dd" )
    {
        var_8 = level._id_4DA4[var_0._id_01AD].origin;
        level._id_4DA4[var_0._id_01AD] delete();
    }
    else
    {
        var_8 = level._id_F014.origin;
        level._id_F014 delete();
    }

    if ( isdefined( var_1 ) )
    {
        var_0.visuals[0] _meth_8253( var_8, 512, 200, 20, var_1, "MOD_EXPLOSIVE", "bomb_site_mp" );
        var_1 scripts\mp\utility\game::incperstat( "destructions", 1 );
        var_1 scripts\mp\persistence::statsetchild( "round", "destructions", var_1.pers["destructions"] );
    }
    else
        var_0.visuals[0] _meth_8253( var_8, 512, 200, 20, undefined, "MOD_EXPLOSIVE", "bomb_site_mp" );

    var_9 = randomfloat( 360 );

    if ( isdefined( var_0.trigger._id_5FDF ) )
        var_10 = var_0.trigger._id_5FDF;
    else
        var_10 = "bomb_explosion";

    var_11 = var_8 + ( 0, 0, 50 );
    var_12 = spawnfx( level._effect[var_10], var_11, ( 0, 0, 1 ), ( cos( var_9 ), sin( var_9 ), 0 ) );
    triggerfx( var_12 );
    physicsexplosionsphere( var_11, 200, 100, 3 );
    scripts\mp\shellshock::_id_13B9( "grenade_rumble", var_8 );
    scripts\mp\shellshock::_id_1245( 0.75, 2.0, var_8, 2000 );
    thread scripts\mp\utility\game::_id_D52A( "exp_suitcase_bomb_main", var_8 );

    if ( isdefined( var_0._id_69B6 ) )
        scripts\engine\utility::_id_69A3( var_0._id_69B6 );

    var_7 scripts\mp\gameobjects::_id_5603();

    if ( isdefined( level._id_C561 ) )
        [[ level._id_C561 ]]( "bombzone", self._id_01AD, var_1, game["attackers"], undefined );
}

_id_98A9( var_0 )
{
    var_1 = undefined;
    var_2 = getentarray( "sd_bombcam_start", "targetname" );

    foreach ( var_4 in var_2 )
    {
        if ( var_4._id_EDF9 == var_0._id_01AD )
        {
            var_1 = var_4;
            break;
        }
    }

    var_6 = [];

    if ( isdefined( var_1 ) && isdefined( var_1._id_0334 ) )
    {
        var_7 = getent( var_1._id_0334, "targetname" );

        while ( isdefined( var_7 ) )
        {
            var_6[var_6.size] = var_7;

            if ( isdefined( var_7._id_0334 ) )
            {
                var_7 = getent( var_7._id_0334, "targetname" );
                continue;
            }

            break;
        }
    }

    if ( isdefined( var_1 ) && var_6.size )
    {
        var_8 = spawn( "script_model", var_1.origin );
        var_8.origin = var_1.origin;
        var_8.angles = var_1.angles;
        var_8._id_C94F = var_6;
        var_8 setmodel( "tag_origin" );
        var_8 hide();
        return var_8;
    }
    else
        return undefined;
}

_id_E882()
{
    level notify( "objective_cam" );

    foreach ( var_1 in level.players )
    {
        if ( !isai( var_1 ) )
        {
            var_1 scripts\mp\utility\game::_id_7385( 1 );
            var_1 visionsetnakedforplayer( "black_bw", 0.5 );
        }
    }

    wait 0.5;

    foreach ( var_1 in level.players )
    {
        if ( !isai( var_1 ) )
        {
            if ( isdefined( var_1._id_55D9 ) )
            {
                var_1 scripts\mp\utility\game::_id_FB09( "objective_cam" );
                var_1 scripts\engine\utility::_id_1C71( 0 );
            }

            var_1 _meth_823E( self, "tag_player", 1, 180, 180, 180, 180, 1 );
            var_1 scripts\mp\utility\game::_id_7385( 1 );
            var_1 setplayerangles( self.angles );
            var_1 visionsetnakedforplayer( "", 0.5 );
        }
    }

    for ( var_5 = 0; var_5 < self._id_C94F.size; var_5++ )
    {
        var_6 = 0;

        if ( var_5 == 0 )
            var_6 = 5 / self._id_C94F.size / 2;

        var_7 = 0;

        if ( var_5 == self._id_C94F.size - 1 )
            var_7 = 5 / self._id_C94F.size / 2;

        self moveto( self._id_C94F[var_5].origin, 5 / self._id_C94F.size, var_6, var_7 );
        self rotateto( self._id_C94F[var_5].angles, 5 / self._id_C94F.size, var_6, var_7 );
        wait( 5 / self._id_C94F.size );
    }
}

_id_2C6D( var_0 )
{
    level endon( "game_ended" );
    level endon( "bomb_defused" + var_0._id_01AD );
    var_1 = int( level._id_2C6C * 1000 + gettime() );
    setomnvar( "ui_bomb_timer_endtime" + var_0._id_01AD, var_1 );
    level thread _id_89B4( var_1, var_0 );
    scripts\mp\hostmigration::_id_13707( level._id_2C6C );
}

_id_89B4( var_0, var_1 )
{
    level endon( "game_ended" );
    level endon( "bomb_defused" + var_1._id_01AD );
    level endon( "game_ended" );
    level endon( "disconnect" );
    level waittill( "host_migration_begin" );
    setomnvar( "ui_bomb_timer_endtime" + var_1._id_01AD, 0 );
    var_2 = scripts\mp\hostmigration::waittillhostmigrationdone();

    if ( var_2 > 0 )
        setomnvar( "ui_bomb_timer_endtime" + var_1._id_01AD, var_0 + var_2 );
}

_id_2C4A( var_0 )
{
    if ( level.gametype != "dd" )
        level._id_2C4A = 1;

    var_0._id_2C4A = 1;
    _id_F66F();
    level notify( "bomb_defused" + var_0._id_01AD );

    if ( isdefined( level._id_C561 ) )
        [[ level._id_C561 ]]( "bombzone", self._id_01AD, undefined, game["defenders"], undefined );
}

_id_12E67( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        if ( var_0 == "allies" )
            setomnvar( "ui_bomb_owner_team", 2 );
        else
            setomnvar( "ui_bomb_owner_team", 1 );
    }

    if ( level._id_209F )
        setomnvar( "ui_bomb_planted_a", 1 );
    else
        setomnvar( "ui_bomb_planted_a", 0 );

    if ( level._id_2F35 )
        setomnvar( "ui_bomb_planted_b", 1 );
    else
        setomnvar( "ui_bomb_planted_b", 0 );
}

_id_F66F( var_0 )
{
    _id_12E67( var_0 );
}

_id_2C77( var_0 )
{
    level._id_2C5C = 0;
    level._id_2C4A = 0;
    level._id_2C58 = 0;
    var_1 = getent( var_0 + "_pickup_trig", "targetname" );

    if ( !isdefined( var_1 ) )
        scripts\engine\utility::_id_66BD( "No " + var_0 + "_pickup_trig trigger found in map." );
    else
    {
        var_1 = postshipadjustbombtriggerspawn( var_1 );
        var_2[0] = getent( var_0, "targetname" );

        if ( !isdefined( var_2[0] ) )
        {
            scripts\engine\utility::_id_66BD( "No " + var_0 + " script_model found in map." );
            return;
        }

        var_2[0] = postshipadjustbombcasespawn( var_2[0] );
        var_2[0] setmodel( "suitcase_bomb_iw7_wm" );

        if ( !level.multibomb )
        {
            level._id_F013 = scripts\mp\gameobjects::_id_4993( game["attackers"], var_1, var_2, ( 0, 0, 32 ) );
            level._id_F013 scripts\mp\gameobjects::_id_1C7C( "friendly" );
            level._id_F013 scripts\mp\gameobjects::_id_F283( "friendly", "waypoint_bomb" );
            level._id_F013 scripts\mp\gameobjects::_id_F284( "friendly", "waypoint_bomb" );
            level._id_F013 scripts\mp\gameobjects::_id_FB0E( "friendly" );
            level._id_F013._id_1CB3 = 1;
            level._id_F013._id_C566 = ::_id_C566;
            level._id_F013._id_C4F9 = ::_id_C4F9;
            level thread _id_2C63();
            level._id_2C61 = level._id_F013.visuals[0].origin;
            level._id_2C60 = level._id_F013.visuals[0].angles;
            level._id_F013._id_1349F = ( 0, 0, 2 );
            return;
        }

        var_1 delete();
        var_2[0] delete();
    }
}

_id_BCAB( var_0, var_1 )
{
    if ( isdefined( level._id_F013 ) )
    {
        level._id_F013.trigger.origin = var_0;
        level._id_F013.visuals[0].origin = var_0;
        level._id_F013.visuals[0].angles = var_1;
        level._id_F013.visuals[0] show();
        level._id_F013 scripts\mp\gameobjects::_id_1C7C( "friendly" );
        level._id_F013 scripts\mp\gameobjects::_id_F283( "friendly", "waypoint_bomb" );
        level._id_F013 scripts\mp\gameobjects::_id_F284( "friendly", "waypoint_bomb" );
        level._id_F013 scripts\mp\gameobjects::_id_FB0E( "friendly" );
        level._id_F013._id_1CB3 = 1;
        level._id_F013._id_C566 = ::_id_C566;
        level._id_F013._id_C4F9 = ::_id_C4F9;
    }
}

_id_2C63()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "bomb_pickup" );

        foreach ( var_1 in level._id_2C7A )
            var_1.trigger enableplayeruse( level._id_F013._id_3AA8 );

        wait 0.05;
    }
}

_id_C566( var_0 )
{
    var_0._id_9D6C = 1;

    if ( isplayer( var_0 ) )
    {
        var_0 thread scripts\mp\matchdata::_id_AFBA( "pickup", var_0.origin );
        scripts\mp\utility\game::_id_F79E( 15, var_0.team, var_0 getentitynumber() );
    }

    var_0 setclientomnvar( "ui_carrying_bomb", 1 );
    setomnvar( "ui_bomb_carrier", var_0 getentitynumber() );
    scripts\mp\gameobjects::_id_F283( "friendly", "waypoint_escort" );
    scripts\mp\gameobjects::_id_F284( "friendly", "waypoint_escort" );

    if ( isdefined( level._id_F004 ) && isdefined( level._id_F004[var_0.team] ) )
        var_0 thread _id_20BE();

    if ( !level._id_2C4A )
    {
        scripts\mp\utility\game::_id_115DE( "callout_bombtaken", var_0, var_0.team );
        scripts\mp\utility\game::_id_AAE7( "bomb_taken", var_0.pers["team"] );
    }

    scripts\mp\utility\game::_id_D52E( game["bomb_recovered_sound"], game["attackers"] );

    if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
        var_0 _meth_80C1( 1 );

    level notify( "bomb_pickup" );
}

_id_C4F9( var_0 )
{
    level notify( "bomb_dropped" );
    setomnvar( "ui_bomb_carrier", -1 );

    if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
    {
        if ( isdefined( var_0 ) )
            var_0 _meth_80C1( 0 );
    }

    scripts\mp\gameobjects::_id_F283( "friendly", "waypoint_bomb" );
    scripts\mp\gameobjects::_id_F284( "friendly", "waypoint_bomb" );
    scripts\mp\utility\game::_id_D52E( game["bomb_dropped_sound"], game["attackers"] );

    if ( !level._id_2C5C && isdefined( level._id_2C5F ) && level._id_2C5F > 0 )
        thread _id_136AD( level._id_2C5F );
}

_id_136AD( var_0 )
{
    level endon( "game_ended" );
    level endon( "bomb_pickup" );
    wait( var_0 );
    playfx( loadfx( "vfx/core/mp/killstreaks/vfx_ballistic_vest_death" ), self.visuals[0].origin, self.visuals[0].angles );
    _id_BCAB( level._id_2C61, level._id_2C60 );
}

_id_6273()
{
    foreach ( var_1 in level.players )
    {
        if ( !isai( var_1 ) )
            var_1 setclientomnvar( "ui_carrying_bomb", var_1.pers["team"] == game["attackers"] );
    }
}

_id_E294()
{
    level endon( "game_ended" );
    wait 5;

    if ( level.multibomb )
        _id_6273();
    else
        _id_BCAB( level._id_2C61, level._id_2C60 );
}

_id_18CF()
{
    level._id_2C5C = 0;
    level._id_2C4A = 0;
    level._id_2C61 = level._id_4B29.visuals[0].origin + ( 0, 0, 48 );
    level._id_2C60 = level._id_4B29.visuals[0].angles;

    if ( level.multibomb )
        _id_6273();
    else
        _id_BCAB( level._id_2C61, level._id_2C60 );
}

_id_20BE()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( isdefined( self._id_9D81 ) && self._id_9D81 == 1 )
    {
        self notify( "force_cancel_placement" );
        wait 0.05;
    }

    while ( self _meth_81AD() )
        wait 0.05;

    while ( !self isonground() )
        wait 0.05;

    if ( scripts\mp\utility\game::isjuggernaut() )
    {
        self notify( "lost_juggernaut" );
        wait 0.05;
    }

    self.pers["gamemodeLoadout"] = level._id_F004[self.team];

    if ( isdefined( self._id_F851 ) )
        scripts\mp\perks\perkfunctions::_id_51D7( self._id_F851 );

    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0._id_D424 = self.origin;
    var_0._id_C188 = 1;
    self._id_F851 = var_0;
    self._id_7673 = self.class;
    self.pers["class"] = "gamemode";
    self.pers["lastClass"] = "gamemode";
    self.class = "gamemode";
    self._id_A95C = "gamemode";
    self notify( "faux_spawn" );
    self._id_767C = 1;
    self._id_6BA6 = self getstance();
    thread scripts\mp\playerlogic::_id_108F2( 1 );
}

_id_E0D7()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( isdefined( self._id_9D81 ) && self._id_9D81 == 1 )
    {
        self notify( "force_cancel_placement" );
        wait 0.05;
    }

    while ( self _meth_81AD() )
        wait 0.05;

    while ( !self isonground() )
        wait 0.05;

    if ( scripts\mp\utility\game::isjuggernaut() )
    {
        self notify( "lost_juggernaut" );
        wait 0.05;
    }

    self.pers["gamemodeLoadout"] = undefined;

    if ( isdefined( self._id_F851 ) )
        scripts\mp\perks\perkfunctions::_id_51D7( self._id_F851 );

    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0._id_D424 = self.origin;
    var_0._id_C188 = 1;
    self._id_F851 = var_0;
    self notify( "faux_spawn" );
    self._id_6BA6 = self getstance();
    thread scripts\mp\playerlogic::_id_108F2( 1 );
}

_id_2C6F( var_0, var_1 )
{
    foreach ( var_3 in level._id_2C7A )
    {
        if ( !isdefined( var_3._id_2C4B.origin ) )
            continue;

        var_4 = scripts\mp\utility\game::istrue( var_3._id_2C5C );
        var_5 = _id_5720( var_0.origin, var_1.origin, scripts\engine\utility::ter_op( var_4, var_3._id_2C4B.origin, var_3.trigger.origin ) );

        if ( var_5 )
        {
            if ( var_1.team == game["defenders"] )
            {
                var_0 thread scripts\mp\awards::givemidmatchaward( scripts\engine\utility::ter_op( var_4, "mode_x_defend", "mode_x_assault" ) );
                continue;
            }

            var_0 thread scripts\mp\awards::givemidmatchaward( scripts\engine\utility::ter_op( var_4, "mode_x_assault", "mode_x_defend" ) );
        }
    }
}

_id_5720( var_0, var_1, var_2 )
{
    var_3 = distancesquared( var_2, var_0 );
    var_4 = distancesquared( var_2, var_1 );

    if ( var_3 < 90000 || var_4 < 90000 )
        return 1;
    else
        return 0;
}

postshipmodifiedbombzones( var_0, var_1 )
{
    var_2 = var_1.origin;
    var_3 = modifiedbombzones( var_1, var_2, var_0 );
    return var_3;
}

modifiedbombzones( var_0, var_1, var_2 )
{
    if ( level._id_B335 == "mp_desert" && var_0._id_EDF9 == "_b" )
    {
        var_2[0].origin = ( -928, 552, 352 );
        var_2[0].angles = ( 0, 0, 0 );
        var_0._id_C732 = ( -928, 552, 361 );
        var_0.origin = var_0._id_C732;
        var_0.angles = ( 0, 90, 0 );
        setmodifiedbombzonescollision( ( 0, 0, 35 ), ( 0, 90, 0 ), var_1, var_2 );
        setexplodermodel( var_1, var_2 );
        return var_0;
    }

    if ( level._id_B335 == "mp_metropolis" && var_0._id_EDF9 == "_b" )
    {
        var_2[0].origin = ( -1570, -785, -64 );
        var_2[0].angles = ( 0, 90, 0 );
        var_0._id_C732 = ( -1570, -785, -64 );
        var_0.origin = var_0._id_C732;
        var_0.angles = ( 0, 0, 0 );
        setmodifiedbombzonescollision( ( 0, 0, 27 ), ( 0, 180, 0 ), var_1, var_2 );
        setexplodermodel( var_1, var_2 );
        return var_0;
    }

    if ( level._id_B335 == "mp_fallen" && var_0._id_EDF9 == "_a" )
    {
        var_2[0].origin = ( 408, -70, 760 );
        var_2[0].angles = ( 0, 0, 0 );
        var_0._id_C732 = ( 408, -70, 760 );
        var_0.origin = var_0._id_C732;
        var_0.angles = ( 0, 90, 0 );
        setmodifiedbombzonescollision( ( 0, 0, 27 ), ( 0, 90, 0 ), var_1, var_2 );
        setexplodermodel( var_1, var_2 );
        return var_0;
    }

    if ( level._id_B335 == "mp_fallen" && var_0._id_EDF9 == "_b" )
    {
        var_2[0].origin = ( -270, 2387, 927 );
        var_2[0].angles = ( 0, 0, 0 );
        var_0._id_C732 = ( -270, 2387, 927 );
        var_0.origin = var_0._id_C732;
        var_0.angles = ( 0, 90, 0 );
        setmodifiedbombzonescollision( ( 0, 0, 27 ), ( 0, 270, 0 ), var_1, var_2 );
        setexplodermodel( var_1, var_2 );
        return var_0;
    }

    if ( level._id_B335 == "mp_riot" && var_0._id_EDF9 == "_a" )
    {
        var_2[0].origin = ( 514, 669, 250 );
        var_2[0].angles = ( 13, 90, 1 );
        var_0._id_C732 = ( 514, 669, 250 );
        var_0.origin = var_0._id_C732;
        var_0.angles = ( 13, 90, 1 );
        setmodifiedbombzonescollision( ( 0, 5, 30 ), ( 13, 90, 1 ), var_1, var_2 );
        setexplodermodel( var_1, var_2 );
        return var_0;
    }

    if ( level._id_B335 == "mp_proto" && var_0._id_EDF9 == "_a" )
    {
        var_2[0].origin = ( -90, 1825, 480 );
        var_2[0].angles = ( 0, 0, 0 );
        var_0._id_C732 = ( -90, 1825, 480 );
        var_0.origin = var_0._id_C732;
        var_0.angles = ( 0, 90, 0 );
        setmodifiedbombzonescollision( ( 0, 0, 27 ), ( 0, 270, 0 ), var_1, var_2 );
        setexplodermodel( var_1, var_2 );
        return var_0;
    }

    if ( level._id_B335 == "mp_divide" && var_0._id_EDF9 == "_b" )
    {
        var_2[0].origin = ( -510, -560, 585 );
        var_2[0].angles = ( 0, 180, 0 );
        var_0._id_C732 = ( -527, -560, 585 );
        var_0.origin = var_0._id_C732;
        var_0.angles = ( 0, 135, 0 );
        setmodifiedbombzonescollision( ( 0, 0, 27 ), ( 0, -45, 0 ), var_1, var_2 );
        setexplodermodel( var_1, var_2 );
        return var_0;
    }

    if ( level._id_B335 == "mp_parkour" && var_0._id_EDF9 == "_a" )
    {
        var_2[0].origin = ( -1602, 3, 184 );
        var_2[0].angles = ( 0, 90, 0 );
        var_0._id_C732 = ( -1602, 3, 186 );
        var_0.origin = var_0._id_C732;
        var_0.angles = ( 0, 0, 0 );
        setmodifiedbombzonescollision( ( 0, 0, 27 ), ( 0, 180, 0 ), var_1, var_2 );
        setexplodermodel( var_1, var_2 );
        return var_0;
    }

    if ( level._id_B335 == "mp_parkour" && var_0._id_EDF9 == "_b" )
    {
        var_2[0].origin = ( 489, -1408, 249 );
        var_2[0].angles = ( 0, 90, 0 );
        var_0._id_C732 = ( 489, -1408, 249 );
        var_0.origin = var_0._id_C732;
        var_0.angles = ( 0, 90, 0 );
        setmodifiedbombzonescollision( ( 0, 0, 27 ), ( 0, 270, 0 ), var_1, var_2 );
        setexplodermodel( var_1, var_2 );
        return var_0;
    }

    return var_0;
}

setmodifiedbombzonescollision( var_0, var_1, var_2, var_3 )
{
    var_4 = getentarray( "script_brushmodel", "classname" );

    foreach ( var_6 in var_4 )
    {
        if ( isdefined( var_6._id_EDBF ) && var_6._id_EDBF == "bombzone" )
        {
            if ( distance( var_6.origin, var_2 ) < 100 )
            {
                var_7 = spawn( "script_model", var_3[0].origin + var_0 );
                var_7.angles = var_1;
                var_7 clonebrushmodeltoscriptmodel( var_6 );
                var_7 disconnectpaths();
                var_6 delete();
                break;
            }
        }
    }
}

setexplodermodel( var_0, var_1 )
{
    var_2 = getentarray( "script_model", "classname" );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( isdefined( var_2[var_3].targetname ) )
        {
            if ( isdefined( var_2[var_3]._id_0336 ) && var_2[var_3]._id_0336 == "exploder" && distance( var_2[var_3].origin, var_0 ) < 100 )
            {
                var_2[var_3].origin = var_1[0].origin;
                var_2[var_3].angles = var_1[0].angles;
            }
        }
    }
}

postshipadjustbombcasespawn( var_0 )
{
    if ( level._id_B335 == "mp_fallen" )
    {
        var_0.origin = ( 2655, 1260, 930 );
        return var_0;
    }

    if ( level._id_B335 == "mp_divide" )
    {
        var_0.origin -= ( 0, 0, 2 );
        return var_0;
    }

    if ( level._id_B335 == "mp_parkour" )
    {
        var_0.origin = ( -56, 3139, 170 );
        return var_0;
    }

    if ( level._id_B335 == "mp_quarry" )
    {
        var_0.origin = ( -2067, 1214, 242 );
        return var_0;
    }

    if ( level._id_B335 == "mp_frontier" )
    {
        var_0.origin += ( 0, 0, 1 );
        return var_0;
    }

    if ( level._id_B335 == "mp_desert" )
    {
        var_0.origin += ( 0, 0, 1 );
        return var_0;
    }

    if ( level._id_B335 == "mp_metropolis" )
    {
        var_0.origin += ( 0, 0, 2 );
        return var_0;
    }

    if ( level._id_B335 == "mp_proto" )
    {
        var_0.origin = ( 2349, 228, 530 );
        return var_0;
    }

    if ( level._id_B335 == "mp_rivet" )
    {
        var_0.origin += ( 0, 0, 1 );
        return var_0;
    }

    if ( level._id_B335 == "mp_breakneck" )
    {
        var_0.origin += ( 0, 0, 2 );
        return var_0;
    }

    if ( level._id_B335 == "mp_dome_iw" )
    {
        var_0.origin += ( 0, 0, 2 );
        return var_0;
    }

    if ( level._id_B335 == "mp_skyway" )
    {
        var_0.origin += ( 0, 0, 2 );
        return var_0;
    }

    return var_0;
}

postshipadjustbombtriggerspawn( var_0 )
{
    if ( level._id_B335 == "mp_proto" )
    {
        var_0.origin = ( 2349, 228, 530 );
        return var_0;
    }

    if ( level._id_B335 == "mp_fallen" )
    {
        var_0.origin = ( 2655, 1260, 930 );
        return var_0;
    }

    if ( level._id_B335 == "mp_quarry" )
    {
        var_0.origin = ( -2067, 1214, 242 );
        return var_0;
    }

    if ( level._id_B335 == "mp_parkour" )
    {
        var_0.origin = ( -56, 3139, 170 );
        return var_0;
    }

    return var_0;
}

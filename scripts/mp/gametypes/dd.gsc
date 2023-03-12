// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "mapname" ) == "mp_background" )
        return;

    scripts\mp\globallogic::init();
    scripts\mp\globallogic::setupcallbacks();

    if ( isusingmatchrulesdata() )
    {
        level.initializematchrules = ::initializematchrules;
        [[ level.initializematchrules ]]();
        level thread scripts\mp\utility\game::reinitializematchrulesonmigration();
    }
    else
    {
        scripts\mp\utility\game::registerroundswitchdvar( level.gametype, 1, 0, 9 );
        scripts\mp\utility\game::registertimelimitdvar( level.gametype, 3 );
        scripts\mp\utility\game::registerscorelimitdvar( level.gametype, 0 );
        scripts\mp\utility\game::registerroundlimitdvar( level.gametype, 3 );
        scripts\mp\utility\game::registerwinlimitdvar( level.gametype, 2 );
        scripts\mp\utility\game::registernumlivesdvar( level.gametype, 0 );
        scripts\mp\utility\game::registerhalftimedvar( level.gametype, 0 );
        scripts\mp\utility\game::_id_F7D3( 2 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    updategametypedvars();
    level.objectivebased = 1;
    level.teambased = 1;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onspawnplayer = ::onspawnplayer;
    level._id_C4E8 = ::_id_C4E8;
    level.ontimelimit = ::ontimelimit;
    level.onnormaldeath = ::onnormaldeath;
    level._id_7677 = scripts\mp\utility\game::_id_9EF4;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = scripts\mp\damage::gamemodemodifyplayerdamage;

    level._id_4DA2 = 1;
    level._id_2C64 = 0;
    level._id_4DA4 = [];
    level._id_209F = 0;
    level._id_2F35 = 0;
    scripts\mp\gametypes\obj_bombzone::_id_F66F();
    game["dialog"]["gametype"] = "demolition";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    else if ( getdvarint( "camera_thirdPerson" ) )
        game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_diehard" ) )
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_" + level.gametype + "_promode" ) )
        game["dialog"]["gametype"] += "_pro";

    game["dialog"]["offense_obj"] = "obj_destroy";
    game["dialog"]["defense_obj"] = "obj_defend";
    setomnvar( "ui_bomb_timer_endtime_a", 0 );
    setomnvar( "ui_bomb_timer_endtime_b", 0 );
    setomnvar( "ui_bomb_planted_a", 0 );
    setomnvar( "ui_bomb_planted_b", 0 );
}

initializematchrules()
{
    scripts\mp\utility\game::setcommonrulesfrommatchdata();
    setdynamicdvar( "scr_dd_bombtimer", getmatchrulesdata( "bombData", "bombTimer" ) );
    setdynamicdvar( "scr_dd_planttime", getmatchrulesdata( "bombData", "plantTime" ) );
    setdynamicdvar( "scr_dd_defusetime", getmatchrulesdata( "bombData", "defuseTime" ) );
    setdynamicdvar( "scr_dd_silentPlant", getmatchrulesdata( "bombData", "silentPlant" ) );
    setdynamicdvar( "scr_dd_extratime", getmatchrulesdata( "demData", "extraTime" ) );
    setdynamicdvar( "scr_dd_overtimeLimit", getmatchrulesdata( "demData", "overtimeLimit" ) );
    setdynamicdvar( "scr_dd_halftime", 0 );
    scripts\mp\utility\game::registerhalftimedvar( "dd", 0 );
    setdynamicdvar( "scr_dd_promode", 0 );
}

onprecachegametype()
{
    game["bomb_dropped_sound"] = "mp_war_objective_lost";
    game["bomb_recovered_sound"] = "mp_war_objective_taken";
}

onstartgametype()
{
    if ( game["roundsPlayed"] == 2 )
    {
        game["status"] = "overtime";
        setdvar( "ui_overtime", 1 );
    }

    if ( scripts\mp\utility\game::_id_9900() )
    {
        setomnvar( "ui_round_hint_override_attackers", 1 );
        setomnvar( "ui_round_hint_override_defenders", 1 );
    }

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    level._id_130DD = 1;
    setclientnamemode( "manual_change" );

    if ( scripts\mp\utility\game::_id_9900() )
        game["dialog"]["defense_obj"] = "obj_destroy";

    level._effect["bomb_explosion"] = loadfx( "vfx/iw7/_requests/mp/vfx_bombardment_strike_explosion" );
    level._effect["vehicle_explosion"] = loadfx( "vfx/core/expl/small_vehicle_explosion_new.vfx" );
    level._effect["building_explosion"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    scripts\mp\utility\game::setobjectivetext( game["attackers"], &"OBJECTIVES_DD_ATTACKER" );
    scripts\mp\utility\game::setobjectivetext( game["defenders"], &"OBJECTIVES_DD_DEFENDER" );

    if ( level._id_10A56 )
    {
        scripts\mp\utility\game::setobjectivescoretext( game["attackers"], &"OBJECTIVES_DD_ATTACKER" );
        scripts\mp\utility\game::setobjectivescoretext( game["defenders"], &"OBJECTIVES_DD_DEFENDER" );
    }
    else
    {
        scripts\mp\utility\game::setobjectivescoretext( game["attackers"], &"OBJECTIVES_DD_ATTACKER_SCORE" );
        scripts\mp\utility\game::setobjectivescoretext( game["defenders"], &"OBJECTIVES_DD_DEFENDER_SCORE" );
    }

    if ( scripts\mp\utility\game::_id_9900() )
    {
        scripts\mp\utility\game::setobjectivehinttext( game["attackers"], &"OBJECTIVES_DD_OVERTIME_HINT" );
        scripts\mp\utility\game::setobjectivehinttext( game["defenders"], &"OBJECTIVES_DD_OVERTIME_HINT" );
    }
    else
    {
        scripts\mp\utility\game::setobjectivehinttext( game["attackers"], &"OBJECTIVES_DD_ATTACKER_HINT" );
        scripts\mp\utility\game::setobjectivehinttext( game["defenders"], &"OBJECTIVES_DD_DEFENDER_HINT" );
    }

    thread _id_13849();
    var_2 = scripts\mp\utility\game::_id_8214( "winlimit" );
    var_3[0] = "dd";
    var_3[1] = "dd_bombzone";
    var_3[2] = "blocker";
    scripts\mp\gameobjects::main( var_3 );
    thread _id_2C62();
    scripts\mp\utility\game::_id_98D3();
}

_id_98CE()
{
    scripts\mp\spawnlogic::_id_F62D( "TDM" );
    level.spawnmins = ( 0, 0, 0 );
    level.spawnmaxs = ( 0, 0, 0 );
    scripts\mp\spawnlogic::addstartspawnpoints( "mp_dd_spawn_attacker" );
    scripts\mp\spawnlogic::addstartspawnpoints( "mp_dd_spawn_defender" );

    if ( !isdefined( level._id_10DF1 ) )
    {
        scripts\mp\spawnlogic::addstartspawnpoints( "mp_sd_spawn_attacker" );
        scripts\mp\spawnlogic::addstartspawnpoints( "mp_sd_spawn_defender" );
    }

    scripts\mp\spawnlogic::addspawnpoints( game["defenders"], "mp_dd_spawn_defender" );
    scripts\mp\spawnlogic::addspawnpoints( game["defenders"], "mp_dd_spawn_defender_a", 1 );
    scripts\mp\spawnlogic::addspawnpoints( game["defenders"], "mp_dd_spawn_defender_b", 1 );
    scripts\mp\spawnlogic::addspawnpoints( game["attackers"], "mp_dd_spawn_attacker" );
    scripts\mp\spawnlogic::addspawnpoints( game["attackers"], "mp_dd_spawn_attacker_a", 1 );
    scripts\mp\spawnlogic::addspawnpoints( game["attackers"], "mp_dd_spawn_attacker_b", 1 );
    scripts\mp\spawnlogic::addspawnpoints( game["attackers"], "mp_tdm_spawn" );
    level._id_1069E = scripts\mp\spawnlogic::getspawnpointarray( "mp_dd_spawn_defender" );
    level._id_1069F = scripts\mp\spawnlogic::getspawnpointarray( "mp_dd_spawn_defender_a" );
    level._id_1069F = scripts\engine\utility::_id_227F( level._id_1069E, level._id_1069F );
    level._id_106A0 = scripts\mp\spawnlogic::getspawnpointarray( "mp_dd_spawn_defender_b" );
    level._id_106A0 = scripts\engine\utility::_id_227F( level._id_1069E, level._id_106A0 );
    level._id_106A1 = scripts\engine\utility::_id_227F( level._id_1069E, level._id_1069F, level._id_106A0 );
    level._id_10644 = scripts\mp\spawnlogic::getspawnpointarray( "mp_dd_spawn_attacker" );
    level._id_10645 = scripts\mp\spawnlogic::getspawnpointarray( "mp_dd_spawn_attacker_a" );
    level._id_10645 = scripts\engine\utility::_id_227F( level._id_10644, level._id_10645 );
    level._id_10646 = scripts\mp\spawnlogic::getspawnpointarray( "mp_dd_spawn_attacker_b" );
    level._id_10646 = scripts\engine\utility::_id_227F( level._id_10644, level._id_10646 );
    level._id_10647 = scripts\engine\utility::_id_227F( level._id_10644, level._id_10645, level._id_10646 );
    level._id_106A2 = scripts\mp\spawnlogic::getspawnpointarray( "mp_dd_spawn_defender_start" );
    level._id_10648 = scripts\mp\spawnlogic::getspawnpointarray( "mp_dd_spawn_attacker_start" );
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
}

_id_8141( var_0, var_1 )
{
    var_2 = getpathdist( var_0.origin, var_1, 16000 );

    if ( var_2 < 0 )
        var_2 = distance( var_0.origin, var_1 );

    return var_2;
}

_id_13849()
{
    level endon( "game_end" );

    for (;;)
    {
        if ( level.ingraceperiod == 0 )
            break;

        wait 0.05;
    }

    level._id_130DD = 0;
}

getspawnpoint()
{
    var_0 = self.pers["team"];

    if ( level._id_130DD )
    {
        if ( var_0 == game["attackers"] )
            var_1 = scripts\mp\spawnlogic::_id_813C( level._id_10648 );
        else
            var_1 = scripts\mp\spawnlogic::_id_813C( level._id_106A2 );
    }
    else
    {
        var_2 = undefined;

        if ( var_0 == game["attackers"] )
        {
            if ( scripts\mp\utility\game::_id_9900() )
                var_2 = level._id_10644;
            else if ( !level._id_209F && !level._id_2F35 )
                var_2 = level._id_10644;
            else if ( level._id_209F && !level._id_2F35 )
                var_2 = level._id_10645;
            else if ( level._id_2F35 && !level._id_209F )
                var_2 = level._id_10646;
            else
                var_2 = level._id_10644;

            var_3 = level._id_10647;
            var_1 = scripts\mp\spawnscoring::getspawnpoint( var_2, var_3 );
        }
        else
        {
            if ( scripts\mp\utility\game::_id_9900() )
                var_2 = level._id_1069E;
            else if ( !level._id_209F && !level._id_2F35 )
                var_2 = level._id_1069E;
            else if ( level._id_209F && !level._id_2F35 )
                var_2 = level._id_1069F;
            else if ( level._id_2F35 && !level._id_209F )
                var_2 = level._id_106A0;
            else
                var_2 = level._id_1069E;

            var_3 = level._id_106A1;
            var_1 = scripts\mp\spawnscoring::getspawnpoint( var_2, var_3 );
        }
    }

    return var_1;
}

onspawnplayer()
{
    if ( scripts\mp\utility\game::matchmakinggame() )
        scripts\mp\gametypes\common::onspawnplayer();

    if ( scripts\mp\utility\game::_id_9900() || self.pers["team"] == game["attackers"] )
    {
        self setclientomnvar( "ui_carrying_bomb", 1 );
        self._id_9EE6 = 0;
        self._id_9DBC = 0;
        self._id_9D6C = 1;
    }
    else
    {
        self._id_9EE6 = 0;
        self._id_9DBC = 0;
        self._id_9D6C = 0;
    }

    if ( isdefined( self.pers["plants"] ) )
        scripts\mp\utility\game::setextrascore0( self.pers["plants"] );
    else
        scripts\mp\utility\game::setextrascore0( 0 );

    if ( isdefined( self.pers["defuses"] ) )
        scripts\mp\utility\game::_id_F6FB( self.pers["defuses"] );
    else
        scripts\mp\utility\game::_id_F6FB( 0 );

    level notify( "spawned_player" );
}

_id_8EBA()
{
    self endon( "disconnect" );
    level waittill( "game_ended" );

    if ( isdefined( self._id_3AF5 ) )
        self._id_3AF5.alpha = 0;
}

_id_4DA3( var_0, var_1 )
{
    thread scripts\mp\gamelogic::endgame( var_0, var_1 );
}

_id_C4E8( var_0 )
{
    if ( level._id_2C58 > 0 || level._id_2C4A )
        return;

    if ( var_0 == "all" )
    {
        if ( level._id_2C5C )
            _id_4DA3( game["attackers"], game["end_reason"][game["defenders"] + "_eliminated"] );
        else
            _id_4DA3( game["defenders"], game["end_reason"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["attackers"] )
    {
        if ( level._id_2C5C )
            return;

        level thread _id_4DA3( game["defenders"], game["end_reason"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["defenders"] )
        level thread _id_4DA3( game["attackers"], game["end_reason"][game["defenders"] + "_eliminated"] );
}

onnormaldeath( var_0, var_1, var_2, var_3, var_4 )
{
    scripts\mp\gametypes\common::onnormaldeath( var_0, var_1, var_2, var_3, var_4 );
    var_5 = var_0.team;

    if ( var_0._id_9EE6 )
    {
        thread scripts\mp\matchdata::_id_AFC5( var_2, "planting" );
        var_1 scripts\mp\utility\game::incperstat( "defends", 1 );
        var_1 scripts\mp\persistence::statsetchild( "round", "defends", var_1.pers["defends"] );
    }
    else if ( var_0._id_9DBC )
    {
        thread scripts\mp\matchdata::_id_AFC5( var_2, "defusing" );
        var_1 scripts\mp\utility\game::incperstat( "defends", 1 );
        var_1 scripts\mp\persistence::statsetchild( "round", "defends", var_1.pers["defends"] );
    }

    scripts\mp\gametypes\obj_bombzone::_id_2C6F( var_1, var_0 );
}

ontimelimit()
{
    if ( scripts\mp\utility\game::_id_9900() )
        _id_4DA3( "tie", game["end_reason"]["time_limit_reached"] );
    else
        _id_4DA3( game["defenders"], game["end_reason"]["time_limit_reached"] );
}

updategametypedvars()
{
    scripts\mp\gametypes\common::updategametypedvars();
    level._id_CC52 = scripts\mp\utility\game::_id_5F6B( "planttime", 5, 0, 20 );
    level._id_50AB = scripts\mp\utility\game::_id_5F6B( "defusetime", 5, 0, 20 );
    level._id_2C6C = scripts\mp\utility\game::_id_5F6D( "bombtimer", 45, 1, 300 );
    level._id_4DA5 = scripts\mp\utility\game::_id_5F6B( "extraTime", 2, 0, 5 );
    level._id_C82B = scripts\mp\utility\game::_id_5F6B( "overtimeLimit", 1, 0, 5 );
    scripts\mp\utility\game::_id_F7D3( level._id_C82B );
    level._id_101F7 = scripts\mp\utility\game::_id_5F6D( "silentPlant", 0, 0, 1 );
}

_id_132A2( var_0 )
{
    var_1 = "";

    if ( var_0.size != 3 )
    {
        var_2 = 0;
        var_3 = 0;
        var_4 = 0;

        foreach ( var_6 in var_0 )
        {
            if ( issubstr( tolower( var_6._id_EDF9 ), "a" ) )
            {
                var_2 = 1;
                continue;
            }

            if ( issubstr( tolower( var_6._id_EDF9 ), "b" ) )
            {
                var_3 = 1;
                continue;
            }

            if ( issubstr( tolower( var_6._id_EDF9 ), "c" ) )
                var_4 = 1;
        }

        if ( !var_2 )
            var_1 += " A ";

        if ( !var_3 )
            var_1 += " B ";

        if ( !var_4 )
            var_1 += " C ";
    }

    if ( var_1 != "" )
        return;
}

_id_2C62()
{
    level._id_2C5C = 0;
    level._id_2C4A = 0;
    level._id_2C58 = 0;
    level.multibomb = 1;
    level._id_2C7A = [];
    var_0 = getentarray( "dd_bombzone", "targetname" );
    level._id_C2A8 = var_0;
    _id_132A2( var_0 );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = scripts\mp\gametypes\obj_bombzone::_id_2C78( var_1 );

        if ( isdefined( var_2 ) )
        {
            var_2._id_C4CB = ::_id_C4CB;
            var_2._id_C50D = ::_id_C50D;
            var_2._id_C5BB = ::_id_C5C6;
            level._id_2C7A[level._id_2C7A.size] = var_2;
        }
    }

    for ( var_1 = 0; var_1 < level._id_2C7A.size; var_1++ )
    {
        var_3 = [];

        for ( var_4 = 0; var_4 < level._id_2C7A.size; var_4++ )
        {
            if ( var_4 != var_1 )
                var_3[var_3.size] = level._id_2C7A[var_4];
        }

        level._id_2C7A[var_1]._id_C749 = var_3;
    }

    thread _id_98CE();
}

_id_C4CB( var_0 )
{
    scripts\mp\gametypes\obj_bombzone::_id_2C71( var_0 );
}

_id_C50D( var_0, var_1, var_2 )
{
    scripts\mp\gametypes\obj_bombzone::_id_2C74( var_0, var_1, var_2 );
}

_id_C5C6( var_0 )
{
    scripts\mp\gametypes\obj_bombzone::_id_2C76( var_0 );
}

_id_FAC9()
{
    var_0 = spawn( "script_origin", self.origin );
    var_0.angles = self.angles;
    var_0 _meth_8271( -45, 0.05 );
    wait 0.05;
    var_1 = self.origin + ( 0, 0, 5 );
    var_2 = self.origin + anglestoforward( var_0.angles ) * 100 + ( 0, 0, 128 );
    var_3 = bullettrace( var_1, var_2, 0, self );
    self._id_A63A = spawn( "script_model", var_3["position"] );
    self._id_A63A setscriptmoverkillcam( "explosive" );
    var_0 delete();
}

_id_E249()
{
    if ( scripts\mp\utility\game::_id_9900() )
    {
        scripts\mp\gameobjects::_id_F7D4( "neutral" );
        scripts\mp\gameobjects::allowuse( "any" );
        var_0 = "waypoint_target_b";
        var_1 = "waypoint_target_b";
    }
    else
    {
        scripts\mp\gameobjects::allowuse( "enemy" );
        var_0 = "waypoint_defend" + self._id_01AD;
        var_1 = "waypoint_target" + self._id_01AD;
    }

    self._id_92B8 = "bomb_zone";
    scripts\mp\gameobjects::_id_FB08( level._id_CC52 );
    scripts\mp\gameobjects::_id_FB07( &"MP_PLANTING_EXPLOSIVE" );
    scripts\mp\gameobjects::_id_FB06( &"PLATFORM_HOLD_TO_PLANT_EXPLOSIVES" );
    scripts\mp\gameobjects::_id_F283( "friendly", var_0 );
    scripts\mp\gameobjects::_id_F284( "friendly", var_0 );
    scripts\mp\gameobjects::_id_F283( "enemy", var_1 );
    scripts\mp\gameobjects::_id_F284( "enemy", var_1 );
    scripts\mp\gameobjects::_id_FB0E( "any" );
    self._id_130F8 = "briefcase_bomb_mp";
    self._id_2C58 = undefined;
}

_id_FAAE()
{
    if ( scripts\mp\utility\game::_id_9900() )
    {
        var_0 = "waypoint_defuse";
        var_1 = "waypoint_defend";
    }
    else
    {
        var_0 = "waypoint_defuse" + self._id_01AD;
        var_1 = "waypoint_defend" + self._id_01AD;
    }

    scripts\mp\gameobjects::allowuse( "friendly" );
    scripts\mp\gameobjects::_id_FB08( level._id_50AB );
    scripts\mp\gameobjects::_id_FB07( &"MP_DEFUSING_EXPLOSIVE" );
    scripts\mp\gameobjects::_id_FB06( &"PLATFORM_HOLD_TO_DEFUSE_EXPLOSIVES" );
    scripts\mp\gameobjects::_id_F76A( undefined );
    scripts\mp\gameobjects::_id_F283( "friendly", var_0 );
    scripts\mp\gameobjects::_id_F284( "friendly", var_0 );
    scripts\mp\gameobjects::_id_F283( "enemy", var_1 );
    scripts\mp\gameobjects::_id_F284( "enemy", var_1 );
    scripts\mp\gameobjects::_id_FB0E( "any" );
}

_id_C4D4( var_0 )
{
    var_0 iprintlnbold( &"MP_BOMBSITE_IN_USE" );
}

_id_C581()
{

}

_id_2C5C( var_0, var_1 )
{
    var_0 endon( "defused" );
    var_2 = var_1.team;
    level._id_2C64 += 1;
    _id_F66E();
    scripts\mp\gamelogic::_id_C9D6();
    level._id_1190A = gettime();
    level._id_118FA = 1;
    level._id_2C5C = 1;
    level._id_52D9 = var_0;

    if ( level._id_52D9._id_01AD == "_a" )
        level._id_209F = 1;
    else
        level._id_2F35 = 1;

    level._id_52D9._id_2C5C = 1;
    level._id_118A0 = var_0.visuals[0];
    _id_5D23( var_1, var_0._id_01AD );
    var_0._id_2C4A = 0;
    var_0 scripts\mp\gameobjects::allowuse( "none" );
    var_0 scripts\mp\gameobjects::_id_FB0E( "none" );

    if ( scripts\mp\utility\game::_id_9900() )
        var_0 scripts\mp\gameobjects::_id_F7D4( level._id_C74B[var_1.team] );

    var_0 _id_FAAE();
    var_0 _id_2C6D( var_0 );
    var_0 thread _id_2C59( var_1, "explode", var_2 );
}

_id_2C59( var_0, var_1, var_2 )
{
    level._id_2C64 -= 1;

    if ( self._id_01AD == "_a" )
        level._id_209F = 0;
    else
        level._id_2F35 = 0;

    _id_E2B5();
    scripts\mp\gametypes\obj_bombzone::_id_F66F();

    if ( level._id_7669 )
        return;

    if ( var_1 == "explode" )
    {
        self._id_2C58 = 1;

        if ( !scripts\mp\utility\game::_id_9900() && level._id_2C58 < 2 && level._id_4DA5 > 0 )
        {
            level._id_6A53 = level._id_2C58 * level._id_4DA5;
            var_3 = scripts\mp\gamelogic::_id_81CD();
            setgameendtime( gettime() + int( var_3 ) );
        }

        wait 2;

        if ( scripts\mp\utility\game::_id_9900() || level._id_2C58 > 1 )
            _id_4DA3( var_2, game["end_reason"]["target_destroyed"] );
        else if ( level._id_4DA5 > 0 )
            level thread scripts\mp\utility\game::_id_115DE( "callout_time_added", var_0 );
    }
    else
    {
        var_0 notify( "bomb_defused" + self._id_01AD );
        self notify( "defused" );
        _id_E249();
    }
}

_id_F66E()
{
    if ( level._id_2C64 == 1 )
        setomnvar( "ui_bomb_timer", 2 );
    else if ( level._id_2C64 == 2 )
        setomnvar( "ui_bomb_timer", 3 );
    else
        setomnvar( "ui_bomb_timer", 0 );
}

_id_5D23( var_0, var_1 )
{
    var_2 = bullettrace( var_0.origin + ( 0, 0, 20 ), var_0.origin - ( 0, 0, 2000 ), 0, var_0 );
    var_3 = randomfloat( 360 );
    var_4 = ( cos( var_3 ), sin( var_3 ), 0 );
    var_4 = vectornormalize( var_4 - var_2["normal"] * vectordot( var_4, var_2["normal"] ) );
    var_5 = vectortoangles( var_4 );
    level._id_4DA4[var_1] = spawn( "script_model", var_2["position"] );
    level._id_4DA4[var_1].angles = var_5;
    level._id_4DA4[var_1] setmodel( "prop_suitcase_bomb" );
}

_id_E2B5()
{
    if ( scripts\mp\utility\game::_id_9900() )
    {
        if ( level._id_2C58 == 1 )
            return;
    }
    else if ( level._id_2C58 > 1 )
        return;

    if ( level._id_2C64 <= 0 )
    {
        scripts\mp\gamelogic::_id_E2FF();
        level._id_11909 = gettime() - level._id_1190A;
        level._id_118FA = 0;
    }
}

_id_2C6D( var_0 )
{
    level endon( "game_ended" );
    level endon( "bomb_defused" + var_0._id_01AD );

    if ( scripts\mp\utility\game::_id_9900() )
        var_0._id_13845 = level._id_2C6C;
    else
        var_0._id_13845 = level._id_2C6C;

    level thread _id_12E43( var_0 );

    while ( var_0._id_13845 >= 0 )
    {
        var_0._id_13845--;

        if ( var_0._id_13845 >= 0 )
            wait 1;

        scripts\mp\hostmigration::waittillhostmigrationdone();
    }
}

_id_12E43( var_0 )
{
    level endon( "game_ended" );
    level endon( "disconnect" );
    level endon( "bomb_defused" + var_0._id_01AD );
    level endon( "bomb_exploded" + var_0._id_01AD );
    var_1 = var_0._id_13845 * 1000 + gettime();
    setdvar( "ui_bombtimer" + var_0._id_01AD, var_1 );
    level waittill( "host_migration_begin" );
    var_2 = scripts\mp\hostmigration::waittillhostmigrationdone();

    if ( var_2 > 0 )
        setdvar( "ui_bombtimer" + var_0._id_01AD, var_1 + var_2 );
}

_id_2C4A( var_0 )
{
    level._id_118A0 scripts\mp\gamelogic::_id_11094();
    var_0._id_2C4A = 1;
    level notify( "bomb_defused" + var_0._id_01AD );
}

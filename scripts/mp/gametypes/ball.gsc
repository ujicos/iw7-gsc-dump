// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main()
{
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
        scripts\mp\utility\game::registerscorelimitdvar( level.gametype, 20 );
        scripts\mp\utility\game::registertimelimitdvar( level.gametype, 5 );
        scripts\mp\utility\game::registerroundlimitdvar( level.gametype, 2 );
        scripts\mp\utility\game::registerroundswitchdvar( level.gametype, 1, 0, 1 );
        scripts\mp\utility\game::registerwinlimitdvar( level.gametype, 0 );
        scripts\mp\utility\game::registernumlivesdvar( level.gametype, 0 );
        level.matchrules_damagemultiplier = 0;
    }

    level._id_3AEC = 100;
    updategametypedvars();
    level.teambased = 1;
    level.objectivebased = 0;
    level._id_112BF = 0;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level._id_C577 = ::_id_C577;
    level.onspawnplayer = ::onspawnplayer;
    level._id_108EB = "mp_ball_spawn";
    level._id_27FC = 1;
    level._id_EC39 = 0;
    level._id_27F9 = 0;

    if ( level.matchrules_damagemultiplier )
        level.modifyplayerdamage = scripts\mp\damage::gamemodemodifyplayerdamage;

    game["dialog"]["gametype"] = "uplink";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];

    game["dialog"]["drone_reset"] = "ul_obj_respawned";
    game["dialog"]["you_own_drone"] = "ally_own_drone";
    game["dialog"]["ally_own_drone"] = "ally_own_drone";
    game["dialog"]["enemy_own_drone"] = "enemy_own_drone";
    game["dialog"]["ally_throw_score"] = "ally_throw_score";
    game["dialog"]["ally_carry_score"] = "ally_carry_score";
    game["dialog"]["enemy_throw_score"] = "enemy_throw_score";
    game["dialog"]["enemy_carry_score"] = "enemy_carry_score";
    game["dialog"]["pass_complete"] = "friendly_pass";
    game["dialog"]["pass_intercepted"] = "pass_intercepted";
    game["dialog"]["ally_drop_drone"] = "ally_drop_drone";
    game["dialog"]["enemy_drop_drone"] = "enemy_drop_drone";
    game["dialog"]["ally_drone_half"] = "halfway_enemy";
    game["dialog"]["enemy_drone_half"] = "halfway_friendly";
    game["dialog"]["offense_obj"] = "capture_obj";
    game["dialog"]["defense_obj"] = "capture_obj";
}

initializematchrules()
{
    scripts\mp\utility\game::setcommonrulesfrommatchdata();
    setdynamicdvar( "scr_ball_scoreCarry", getmatchrulesdata( "ballData", "scoreCarry" ) );
    setdynamicdvar( "scr_ball_scoreThrow", getmatchrulesdata( "ballData", "scoreThrow" ) );
    setdynamicdvar( "scr_ball_satelliteCount", getmatchrulesdata( "ballData", "satelliteCount" ) );
    setdynamicdvar( "scr_ball_practiceMode", getmatchrulesdata( "ballData", "practiceMode" ) );
    setdynamicdvar( "scr_ball_possessionResetCondition", getmatchrulesdata( "ballCommonData", "possessionResetCondition" ) );
    setdynamicdvar( "scr_ball_possessionResetTime", getmatchrulesdata( "ballCommonData", "possessionResetTime" ) );
    setdynamicdvar( "scr_ball_idleResetTime", getmatchrulesdata( "ballCommonData", "idleResetTime" ) );
    setdynamicdvar( "scr_ball_explodeOnExpire", getmatchrulesdata( "ballCommonData", "explodeOnExpire" ) );
    setdynamicdvar( "scr_ball_armorMod", getmatchrulesdata( "ballCommonData", "armorMod" ) );
    setdynamicdvar( "scr_ball_showEnemyCarrier", getmatchrulesdata( "ballCommonData", "showEnemyCarrier" ) );
    setdynamicdvar( "scr_ball_promode", 0 );
}

onprecachegametype()
{
    game["bomb_dropped_sound"] = "mp_uplink_ball_pickedup_enemy";
    game["bomb_recovered_sound"] = "mp_uplink_ball_pickedup_friendly";
}

onstartgametype()
{
    var_0 = scripts\mp\utility\game::_id_9900();
    var_1 = game["overtimeRoundsPlayed"] == 0;
    var_2 = scripts\mp\utility\game::_id_9FAB();

    if ( var_0 )
    {
        if ( var_1 )
        {
            setomnvar( "ui_round_hint_override_attackers", 1 );
            setomnvar( "ui_round_hint_override_defenders", 1 );
        }
        else if ( var_2 )
        {
            setomnvar( "ui_round_hint_override_attackers", scripts\engine\utility::ter_op( game["timeToBeatTeam"] == game["attackers"], 2, 3 ) );
            setomnvar( "ui_round_hint_override_defenders", scripts\engine\utility::ter_op( game["timeToBeatTeam"] == game["defenders"], 2, 3 ) );
        }
        else
        {
            setomnvar( "ui_round_hint_override_attackers", 4 );
            setomnvar( "ui_round_hint_override_defenders", 4 );
        }
    }

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_3 = game["attackers"];
        var_4 = game["defenders"];
        game["attackers"] = var_4;
        game["defenders"] = var_3;
    }

    scripts\mp\utility\game::setobjectivetext( "allies", &"OBJECTIVES_BALL" );
    scripts\mp\utility\game::setobjectivetext( "axis", &"OBJECTIVES_BALL" );

    if ( level._id_10A56 )
    {
        scripts\mp\utility\game::setobjectivescoretext( "allies", &"OBJECTIVES_BALL" );
        scripts\mp\utility\game::setobjectivescoretext( "axis", &"OBJECTIVES_BALL" );
    }
    else
    {
        scripts\mp\utility\game::setobjectivescoretext( "allies", &"OBJECTIVES_BALL_SCORE" );
        scripts\mp\utility\game::setobjectivescoretext( "axis", &"OBJECTIVES_BALL_SCORE" );
    }

    scripts\mp\utility\game::setobjectivehinttext( "allies", &"OBJECTIVES_BALL_HINT" );
    scripts\mp\utility\game::setobjectivehinttext( "axis", &"OBJECTIVES_BALL_HINT" );
    setclientnamemode( "auto_change" );
    scripts\mp\gametypes\obj_ball::_id_2782();
    var_5[0] = level.gametype;
    var_5[1] = "dom";
    var_5[2] = "ball";
    scripts\mp\gameobjects::main( var_5 );
    level thread _id_E7DC();
    level thread _id_C56E();

    if ( level._id_D6AF != 0 )
        scripts\mp\gametypes\obj_ball::_id_97D6();
}

updategametypedvars()
{
    scripts\mp\gametypes\common::updategametypedvars();
    level._id_EC25 = scripts\mp\utility\game::_id_5F6D( "scoreCarry", 2, 1, 9 );
    level._id_EC4F = scripts\mp\utility\game::_id_5F6D( "scoreThrow", 1, 1, 9 );
    level._id_EB50 = scripts\mp\utility\game::_id_5F6D( "satelliteCount", 1, 1, 5 );
    level._id_D7A6 = scripts\mp\utility\game::_id_5F6D( "practiceMode", 0, 0, 1 );
    level._id_D6AF = scripts\mp\utility\game::_id_5F6D( "possessionResetCondition", 0, 0, 2 );
    level._id_D6B0 = scripts\mp\utility\game::_id_5F6B( "possessionResetTime", 0, 0, 150 );
    level._id_69A1 = scripts\mp\utility\game::_id_5F6D( "explodeOnExpire", 0, 0, 1 );
    level._id_92F7 = scripts\mp\utility\game::_id_5F6B( "idleResetTime", 15, 0, 60 );
    level._id_218A = scripts\mp\utility\game::_id_5F6B( "armorMod", 1, 0, 2 );
    level._id_10120 = scripts\mp\utility\game::_id_5F6D( "showEnemyCarrier", 5, 0, 6 );
    level._id_3AEC = int( level._id_3AEC * level._id_218A );
}

_id_2797()
{
    foreach ( var_2, var_1 in level._id_2798 )
    {
        var_1.trigger = spawn( "trigger_radius", var_1.origin - ( 0, 0, var_1.radius ), 0, var_1.radius, var_1.radius * 2 );
        var_1._id_130AD = scripts\mp\gameobjects::createuseobject( var_2, var_1.trigger, [], ( 0, 0, var_1.radius * 2.1 ) );
        var_1._id_130AD._id_0155 = var_1;
        var_1._id_130AD scripts\mp\gameobjects::_id_F283( "friendly", "waypoint_blitz_defend" );
        var_1._id_130AD scripts\mp\gameobjects::_id_F283( "enemy", "waypoint_blitz_goal" );
        var_1._id_130AD scripts\mp\gameobjects::_id_F284( "friendly", "waypoint_blitz_defend" );
        var_1._id_130AD scripts\mp\gameobjects::_id_F284( "enemy", "waypoint_blitz_goal" );
        var_1._id_130AD scripts\mp\gameobjects::_id_FB0E( "any" );
        var_1._id_130AD scripts\mp\gameobjects::allowuse( "enemy" );
        var_1._id_130AD scripts\mp\gameobjects::_id_F76A( level._id_2800 );
        var_1._id_130AD scripts\mp\gameobjects::_id_FB08( 0 );
        var_1._id_130AD scripts\mp\gameobjects::_id_3897( 1 );
        var_1._id_130AD._id_C5BB = ::_id_2779;
        var_1._id_130AD._id_393A = ::_id_2794;
        var_1._id_130AD._id_C4D9 = ::ball_goal_contested;
        var_1._id_130AD._id_C5B9 = ::ball_goal_uncontested;
        var_1._id_A63A = spawn( "script_model", var_1.origin + ( 0, 0, 20 ) );
        var_1._id_A63A setscriptmoverkillcam( "explosive" );
    }
}

_id_2791( var_0, var_1 )
{
    if ( scripts\mp\spawnlogic::_id_9ED7() )
    {
        var_2 = getpathdist( var_0, var_1, 999999 );

        if ( isdefined( var_2 ) && var_2 >= 0 )
            return var_2;
    }

    return distance( var_0, var_1 );
}

_id_2795()
{
    foreach ( var_2, var_1 in level._id_2798 )
    {
        var_1._id_EC1B["friendly"] = spawnfx( scripts\engine\utility::_id_7ECB( "ball_goal_activated_friendly" ), var_1.origin, ( 1, 0, 0 ) );
        var_1._id_EC1B["enemy"] = spawnfx( scripts\engine\utility::_id_7ECB( "ball_goal_activated_enemy" ), var_1.origin, ( 1, 0, 0 ) );
    }

    level thread _id_27B7();

    foreach ( var_4 in level.players )
        _id_2796( var_4 );

    thread goal_watch_game_ended();
}

_id_C56E()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        thread onplayerspawned( var_0 );

        if ( scripts\mp\utility\game::istrue( level._id_D7A6 ) && var_0 ishost() )
        {
            var_0 thread scripts\mp\gametypes\obj_ball::_id_D7A7();
            var_0 thread scripts\mp\gametypes\obj_ball::_id_BCA9();
        }
    }
}

onplayerspawned( var_0 )
{
    var_0 waittill( "spawned" );
    var_0 scripts\mp\utility\game::setextrascore0( 0 );

    if ( isdefined( var_0.pers["touchdowns"] ) )
        var_0 scripts\mp\utility\game::setextrascore0( var_0.pers["touchdowns"] );

    var_0 scripts\mp\utility\game::_id_F6FB( 0 );

    if ( isdefined( var_0.pers["fieldgoals"] ) )
        var_0 scripts\mp\utility\game::_id_F6FB( var_0.pers["fieldgoals"] );
}

_id_98CE()
{
    scripts\mp\spawnlogic::_id_F62D( "Uplink" );
    level.spawnmins = ( 0, 0, 0 );
    level.spawnmaxs = ( 0, 0, 0 );
    scripts\mp\spawnlogic::addstartspawnpoints( "mp_ball_spawn_allies_start" );
    scripts\mp\spawnlogic::addstartspawnpoints( "mp_ball_spawn_axis_start" );
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    var_0 = scripts\mp\spawnlogic::getspawnpointarray( level._id_108EB );
    var_1 = scripts\mp\spawnlogic::getspawnpointarray( level._id_108EB + "_secondary" );
    var_2 = _id_23E3( var_0 );
    var_3 = _id_23E3( var_1 );
    scripts\mp\spawnlogic::_id_DF0D( "allies", var_2["allies"] );
    scripts\mp\spawnlogic::_id_DF0D( "allies", var_3["allies"], 1 );
    scripts\mp\spawnlogic::_id_DF0D( "axis", var_2["axis"] );
    scripts\mp\spawnlogic::_id_DF0D( "axis", var_3["axis"], 1 );
}

_id_23E3( var_0 )
{
    var_1 = [];
    var_1["allies"] = [];
    var_1["axis"] = [];

    if ( !isdefined( level._id_B4C6 ) )
    {
        level._id_B4C6 = [];
        level._id_B4C6["allies"] = 0;
        level._id_B4C6["axis"] = 0;
    }

    var_2 = level._id_2798["allies"].origin;
    var_3 = level._id_2798["axis"].origin;

    foreach ( var_5 in var_0 )
    {
        var_6 = _id_8141( var_5, var_2 );
        var_7 = _id_8141( var_5, var_3 );
        var_5._id_5724 = [];
        var_5._id_5724["allies"] = var_6;
        var_5._id_5724["axis"] = var_7;
        var_8 = max( var_6, var_7 );
        var_9 = min( var_6, var_7 );

        if ( abs( var_8 - var_9 ) / var_8 < 0.2 )
        {
            var_1["allies"][var_1["allies"].size] = var_5;
            var_1["axis"][var_1["axis"].size] = var_5;
        }
        else if ( var_7 < var_6 )
            var_1["axis"][var_1["axis"].size] = var_5;
        else
            var_1["allies"][var_1["allies"].size] = var_5;

        if ( var_6 > level._id_B4C6["allies"] )
            level._id_B4C6["allies"] = var_6;

        if ( var_7 > level._id_B4C6["axis"] )
            level._id_B4C6["axis"] = var_7;
    }

    return var_1;
}

_id_8141( var_0, var_1 )
{
    var_2 = getpathdist( var_0.origin, var_1, 16000 );

    if ( var_2 < 0 )
        var_2 = distance( var_0.origin, var_1 );

    return var_2;
}

getspawnpoint()
{
    var_0 = self.pers["team"];

    if ( scripts\mp\spawnlogic::_id_100BA() )
    {
        if ( game["switchedsides"] )
            var_0 = scripts\mp\utility\game::_id_8027( var_0 );

        var_1 = scripts\mp\spawnlogic::getspawnpointarray( level._id_108EB + "_" + var_0 + "_start" );
        var_2 = scripts\mp\spawnlogic::getspawnpoint_startspawn( var_1 );
    }
    else
    {
        var_1 = scripts\mp\spawnlogic::getteamspawnpoints( var_0 );
        var_3 = scripts\mp\spawnlogic::_id_81A9( var_0 );
        var_4 = [];
        var_5["homeBaseTeam"] = var_0;
        var_5["maxDistToHomeBase"] = level._id_B4C6[var_0];
        var_2 = scripts\mp\spawnscoring::getspawnpoint( var_1, var_3, var_5 );
    }

    return var_2;
}

_id_E7DC()
{
    level._id_27C6 = [];
    level._id_2800 = [];
    level._id_27D2 = [];
    scripts\mp\utility\game::_id_98D3();
    _id_2781( "allies" );
    _id_2781( "axis" );
    level._effect["ball_trail"] = loadfx( "vfx/core/mp/core/vfx_uplink_ball_trail.vfx" );
    level._effect["ball_idle"] = loadfx( "vfx/core/mp/core/vfx_uplink_ball_idle.vfx" );
    level._effect["ball_download_end"] = loadfx( "vfx/core/mp/core/vfx_uplink_ball_download_end.vfx" );
    level._effect["ball_goal_enemy"] = loadfx( "vfx/core/mp/core/vfx_uplink_goal_orng.vfx" );
    level._effect["ball_goal_friendly"] = loadfx( "vfx/core/mp/core/vfx_uplink_goal_cyan.vfx" );
    level._effect["ball_goal_activated_enemy"] = loadfx( "vfx/core/mp/core/vfx_uplink_goal_actv_orng.vfx" );
    level._effect["ball_goal_activated_friendly"] = loadfx( "vfx/core/mp/core/vfx_uplink_goal_actv_cyan.vfx" );
    level._effect["ball_teleport"] = loadfx( "vfx/core/mp/core/vfx_uplink_ball_teleport.vfx" );
    level thread _id_277D();
    scripts\mp\gametypes\obj_ball::_id_279C();
    scripts\mp\gametypes\obj_ball::_id_277F();

    for ( var_0 = 0; var_0 < level._id_EB50; var_0++ )
        scripts\mp\gametypes\obj_ball::_id_27C4( var_0 );

    thread scripts\mp\gametypes\obj_ball::hideballsongameended();
    _id_2797();
    _id_2795();
    _id_98CE();
    thread _id_E189();
    thread _id_CC2B();
    level._id_276E = level._id_2800[0];
}

_id_278A( var_0 )
{
    var_1 = self.origin + ( 0, 0, 32 );
    var_2 = self.origin + ( 0, 0, -1000 );
    var_3 = scripts\engine\trace::_id_48BC( 1, 1, 1, 1, 0, 1, 1 );
    var_4 = [];
    var_5 = scripts\engine\trace::_id_DCED( var_1, var_2, var_4, var_3 );
    self._id_862F = var_5["position"];
    return var_5["fraction"] != 0 && var_5["fraction"] != 1;
}

_id_2781( var_0 )
{
    var_1 = var_0;

    if ( game["switchedsides"] )
        var_1 = scripts\mp\utility\game::_id_8027( var_1 );

    var_2 = scripts\engine\utility::_id_817E( "ball_goal_" + var_1, "targetname" );

    if ( isdefined( var_2 ) )
    {
        var_2 = checkpostshipgoalplacement( var_2, var_0 );
        var_2 _id_278A();
    }
    else
    {
        var_2 = spawnstruct();

        switch ( level.script )
        {
            default:
                break;
        }

        if ( !isdefined( var_2.origin ) )
            var_2.origin = level._id_4FF4[var_0];

        var_2 _id_278A();
    }

    if ( scripts\mp\utility\game::istrue( level.tactical ) )
        var_2.origin = var_2._id_862F + ( 0, 0, 130 );
    else if ( scripts\mp\utility\game::istrue( level._id_112C1 ) )
    {
        if ( level._id_B335 == "mp_frontier" )
            var_2.origin = var_2._id_862F + ( 0, 0, 180 );
        else
            var_2.origin = var_2._id_862F + ( 0, 0, 190 );
    }
    else
        var_2.origin = var_2._id_862F + ( 0, 0, 130 );

    var_2.radius = 60;
    var_2.team = var_0;
    var_2._id_279B = 0;
    var_2._id_8EE8 = 0;
    level._id_2798[var_0] = var_2;
}

checkpostshipgoalplacement( var_0, var_1 )
{
    if ( level._id_B335 == "mp_desert" )
    {
        var_2 = ( 2125, 71, 370.344 );

        if ( !game["switchedsides"] && var_1 == "axis" )
            var_0.origin = var_2;
        else if ( game["switchedsides"] && var_1 == "allies" )
            var_0.origin = var_2;
    }

    if ( level._id_B335 == "mp_metropolis" )
    {
        if ( !game["switchedsides"] && var_1 == "axis" )
            var_0.origin = ( -2039, -1464, 123 );
        else if ( game["switchedsides"] && var_1 == "allies" )
            var_0.origin = ( -2039, -1464, 123 );
    }

    if ( level._id_B335 == "mp_fallen" )
    {
        if ( !game["switchedsides"] && var_1 == "axis" )
            var_0.origin = ( 2752, 1429, 988 );
        else if ( game["switchedsides"] && var_1 == "allies" )
            var_0.origin = ( 2752, 1429, 988 );

        if ( !game["switchedsides"] && var_1 == "allies" )
            var_0.origin = ( -1866, 1698, 988 );
        else if ( game["switchedsides"] && var_1 == "axis" )
            var_0.origin = ( -1866, 1698, 988 );
    }

    return var_0;
}

_id_277D()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread scripts\mp\gametypes\obj_ball::_id_27BA();
    }
}

_id_27B6()
{
    var_0 = self.visuals[0];
    self endon( "pass_end" );
    self endon( "pickup_object" );
    self endon( "physics_finished" );

    if ( level.gametype != "tdef" )
        _id_27C7( var_0 );
}

_id_27AC()
{
    var_0 = self.visuals[0];
    self endon( "pass_end" );

    if ( level.gametype != "tdef" )
        _id_27C7( var_0 );
}

_id_27C7( var_0 )
{
    self endon( "pass_end" );
    self endon( "pickup_object" );
    self endon( "physics_finished" );

    for (;;)
    {
        foreach ( var_5, var_2 in level._id_2798 )
        {
            if ( self._id_A958 == var_5 )
                continue;

            if ( !var_2._id_130AD _id_2794() )
                continue;

            var_3 = distance( var_0.origin, var_2.origin );

            if ( var_3 <= var_2.radius )
            {
                thread _id_27C8( var_2 );
                var_0 notify( "pass_end" );
                return;
            }

            if ( isdefined( var_0._id_C71B ) )
            {
                var_4 = _id_ACE6( var_0._id_C71B, var_0.origin, var_2.origin, var_2.radius );

                if ( var_4 )
                {
                    thread _id_27C8( var_2 );
                    var_0 notify( "pass_end" );
                    return;
                }
            }
        }

        scripts\engine\utility::waitframe();
    }
}

_id_2794( var_0 )
{
    var_1 = self._id_0155;

    if ( var_1._id_279B )
        return 0;

    return 1;
}

ball_goal_contested()
{
    ball_waypoint_contest();
}

ball_goal_uncontested( var_0 )
{
    goal_waypoint();
}

_id_2779( var_0 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_0.carryobject ) )
        return;

    if ( isdefined( level._id_EC39 ) && level._id_EC39 > gettime() )
        return;

    if ( istimeup() )
        return;

    if ( level._id_7669 )
        return;

    var_0 notify( "goal_scored" );
    var_1 = level._id_EC25;
    var_0 thread scripts\mp\awards::givemidmatchaward( "mode_uplink_dunk" );
    _id_277A( var_0, 1 );
    var_0 scripts\mp\utility\game::incperstat( "touchdowns", 1 );
    var_0 scripts\mp\persistence::statsetchild( "round", "touchdowns", var_0.pers["touchdowns"] );

    if ( isplayer( var_0 ) )
    {
        var_0 scripts\mp\utility\game::setextrascore0( var_0.pers["touchdowns"] );
        var_0 thread scripts\mp\matchdata::_id_AFBA( "dunk", var_0.origin );
    }

    var_2 = self._id_0155.team;
    var_3 = scripts\mp\utility\game::_id_8027( var_2 );
    scripts\mp\utility\game::_id_10E60( "enemy_carry_score", var_2, 1 );
    scripts\mp\utility\game::_id_10E60( "ally_carry_score", var_3, 1 );
    _id_27B9( self._id_0155 );
    _id_27C0( var_3, 1 );
    var_4 = var_0.carryobject;
    var_4._id_A957 = 1;
    var_4 scripts\mp\gametypes\obj_ball::_id_27C1( 1, self.trigger.origin, 1 );
    var_4 thread _id_27BF( self._id_0155 );
    _id_2793( var_3, var_1 );
    scripts\mp\utility\game::_id_F79E( 1, var_3, var_0 getentitynumber() );
}

_id_FF82( var_0, var_1 )
{
    var_2 = scripts\mp\gamescore::_id_12B6( var_0 );
    var_3 = scripts\mp\gamescore::_id_12B6( scripts\mp\utility\game::_id_8027( var_0 ) );
    return var_2 + var_1 >= var_3;
}

_id_ACE6( var_0, var_1, var_2, var_3 )
{
    var_4 = vectornormalize( var_1 - var_0 );
    var_5 = vectordot( var_4, var_0 - var_2 );
    var_5 *= var_5;
    var_6 = var_0 - var_2;
    var_6 *= var_6;
    var_7 = var_3 * var_3;
    return var_5 - var_6 + var_7 >= 0;
}

_id_27C8( var_0 )
{
    if ( isdefined( level._id_EC39 ) && level._id_EC39 > gettime() )
        return;

    if ( istimeup() )
        return;

    if ( level._id_7669 )
        return;

    _id_27B9( var_0 );
    var_1 = level._id_EC4F;
    var_2 = var_0.team;
    var_3 = scripts\mp\utility\game::_id_8027( var_2 );
    scripts\mp\utility\game::_id_10E60( "enemy_throw_score", var_2, 1 );
    scripts\mp\utility\game::_id_10E60( "ally_throw_score", var_3, 1 );

    if ( isdefined( self._id_A956 ) )
    {
        self._id_A957 = 1;
        self._id_A956 thread scripts\mp\awards::givemidmatchaward( "mode_uplink_fieldgoal" );
        _id_277A( self._id_A956, 0 );
        self._id_A956 scripts\mp\utility\game::incperstat( "fieldgoals", 1 );
        self._id_A956 scripts\mp\persistence::statsetchild( "round", "fieldgoals", self._id_A956.pers["fieldgoals"] );

        if ( isplayer( self._id_A956 ) )
        {
            self._id_A956 scripts\mp\utility\game::_id_F6FB( self._id_A956.pers["fieldgoals"] );
            self._id_A956 thread scripts\mp\matchdata::_id_AFBA( "fieldgoal", self._id_A956.origin );
        }
    }

    if ( isdefined( self._id_A63A ) )
        self._id_A63A unlink();

    _id_27C0( var_3, 0 );
    thread _id_27BF( var_0 );
    _id_2793( var_3, var_1 );

    if ( isdefined( self._id_A956 ) )
        scripts\mp\utility\game::_id_F79E( 0, var_3, self._id_A956 getentitynumber() );
    else
        scripts\mp\utility\game::_id_F79E( 0, var_3 );
}

istimeup()
{
    var_0 = scripts\mp\utility\game::_id_8214( "timelimit" );

    if ( var_0 != 0 )
    {
        var_1 = scripts\mp\gamelogic::_id_81CD();

        if ( var_1 <= 0 )
            return 1;
    }

    return 0;
}

_id_2793( var_0, var_1 )
{
    level scripts\mp\gamescore::giveteamscoreforobjective( var_0, var_1, 0 );
}

_id_27BF( var_0 )
{
    level thread scorefrozentimer();
    self notify( "score_event" );

    if ( scripts\mp\utility\game::istrue( level._id_D7A6 ) )
    {
        foreach ( var_2 in level.players )
        {
            if ( var_2 ishost() )
            {
                var_2 thread scripts\mp\gametypes\obj_ball::_id_BCA9();
                break;
            }
        }
    }

    self._id_9398 = 1;
    var_0._id_279B = 1;
    var_4 = self.visuals[0];

    if ( isdefined( self._id_DA5A ) )
        self._id_DA5A delete();

    var_4 physicslaunchserver( var_4.origin, ( 0, 0, 0 ) );
    var_4 _meth_851B();
    scripts\mp\gameobjects::_id_1C7C( "none" );
    scripts\mp\gametypes\obj_ball::_id_27CF();
    var_5 = 0.4;
    var_6 = 1.2;
    var_7 = 1.0;
    var_8 = var_5 + var_7;
    var_9 = var_8 + var_6;
    var_4 moveto( var_0.origin, var_5, 0, var_5 );
    var_4 rotatevelocity( ( 1080, 1080, 0 ), var_9, var_9, 0 );
    wait( var_8 );
    var_4 _meth_8212( 4000, var_6, var_6 * 0.1, 0 );
    wait( var_6 );
    var_0._id_279B = 0;
    scripts\mp\gametypes\obj_ball::_id_27BD( 0, 0 );
}

_id_277A( var_0, var_1 )
{
    if ( !isdefined( var_0._id_C94C ) || !isdefined( var_0._id_C94A ) )
        return;

    if ( var_0._id_C94C + 3000 < gettime() )
        return;

    if ( var_1 )
        var_0._id_C94A thread scripts\mp\awards::givemidmatchaward( "mode_uplink_allyoop" );
}

_id_27B9( var_0 )
{
    var_0._id_EC1B["friendly"] hide();
    var_0._id_EC1B["enemy"] hide();

    foreach ( var_2 in level.players )
    {
        var_3 = _id_2792( var_2 );

        if ( var_3 == var_0.team )
        {
            var_0._id_EC1B["friendly"] _meth_8388( var_2 );
            continue;
        }

        var_0._id_EC1B["enemy"] _meth_8388( var_2 );
    }

    triggerfx( var_0._id_EC1B["friendly"] );
    triggerfx( var_0._id_EC1B["enemy"] );
}

ball_waypoint_reset()
{
    scripts\mp\gameobjects::_id_F283( "friendly", "waypoint_reset_marker" );
    scripts\mp\gameobjects::_id_F283( "enemy", "waypoint_reset_marker" );
    scripts\mp\gameobjects::_id_F284( "friendly", "waypoint_reset_marker" );
    scripts\mp\gameobjects::_id_F284( "enemy", "waypoint_reset_marker" );
}

ball_waypoint_contest()
{
    scripts\mp\gameobjects::_id_F283( "friendly", "waypoint_uplink_contested" );
    scripts\mp\gameobjects::_id_F283( "enemy", "waypoint_uplink_contested" );
    scripts\mp\gameobjects::_id_F284( "friendly", "waypoint_uplink_contested" );
    scripts\mp\gameobjects::_id_F284( "enemy", "waypoint_uplink_contested" );
}

goal_waypoint()
{
    scripts\mp\gameobjects::_id_F283( "friendly", "waypoint_blitz_defend" );
    scripts\mp\gameobjects::_id_F283( "enemy", "waypoint_blitz_goal" );
    scripts\mp\gameobjects::_id_F284( "friendly", "waypoint_blitz_defend" );
    scripts\mp\gameobjects::_id_F284( "enemy", "waypoint_blitz_goal" );
}

_id_27C0( var_0, var_1 )
{
    if ( var_1 )
        scripts\mp\gametypes\obj_ball::_id_27B8( var_0, "mp_uplink_goal_carried_friendly", "mp_uplink_goal_carried_enemy" );
    else
        scripts\mp\gametypes\obj_ball::_id_27B8( var_0, "mp_uplink_goal_friendly", "mp_uplink_goal_enemy" );
}

scorefrozentimer()
{
    level endon( "game_ended" );
    level._id_EC39 = gettime() + 10000;

    foreach ( var_1 in level._id_2798 )
        var_1 thread dogoalreset();
}

dogoalreset()
{
    self._id_130AD ball_waypoint_reset();
    level scripts\engine\utility::_id_13736( 10, "goal_ready" );
    self._id_130AD goal_waypoint();
}

_id_27A2()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_2795 = [];
        var_0 thread _id_D210();
    }
}

_id_D210()
{
    self waittill( "disconnect" );
    _id_D017();
}

_id_2796( var_0 )
{
    var_1 = _id_2792( var_0 );
    var_0 _id_D017();

    foreach ( var_6, var_3 in level._id_2798 )
    {
        var_4 = scripts\engine\utility::ter_op( var_6 == var_1, "ball_goal_friendly", "ball_goal_enemy" );
        var_5 = spawnfxforclient( scripts\engine\utility::_id_7ECB( var_4 ), var_3.origin, var_0, ( 1, 0, 0 ) );
        var_5 _meth_82EC();
        var_0._id_2795[var_4] = var_5;
        triggerfx( var_5 );
    }
}

_id_2792( var_0 )
{
    var_1 = var_0.team;

    if ( var_1 != "allies" && var_1 != "axis" )
    {
        if ( var_0 ismlgspectator() )
            var_1 = var_0 _meth_813B();
        else
            var_1 = "allies";
    }

    return var_1;
}

_id_D017()
{
    if ( isdefined( self._id_2795 ) )
    {
        foreach ( var_1 in self._id_2795 )
        {
            if ( isdefined( var_1 ) )
                var_1 delete();
        }
    }
}

goal_watch_game_ended()
{
    level waittill( "bro_shot_start" );

    foreach ( var_1 in level.players )
        var_1 _id_D017();
}

_id_27B7()
{
    for (;;)
    {
        level waittill( "joined_team", var_0 );
        _id_2796( var_0 );
    }
}

_id_C577( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = self;
    var_11 = 0;

    if ( !isdefined( var_1 ) || !isdefined( var_1.team ) || !isdefined( var_10 ) || !isdefined( var_10.team ) )
        return;

    if ( var_1 == var_10 )
        return;

    if ( var_1.team == var_10.team )
        return;

    var_12 = var_1.origin;
    var_13 = 0;

    if ( isdefined( var_0 ) )
    {
        var_12 = var_0.origin;
        var_13 = var_0 == var_1;
    }

    if ( isdefined( var_1 ) && isplayer( var_1 ) && var_1.pers["team"] != var_10.pers["team"] )
    {
        if ( isdefined( var_1._id_2777 ) && var_13 )
        {
            var_1 thread scripts\mp\awards::givemidmatchaward( "mode_uplink_kill_with_ball" );
            var_11 = 1;
        }

        if ( isdefined( var_10._id_2777 ) )
        {
            var_1 thread scripts\mp\awards::givemidmatchaward( "mode_uplink_kill_carrier" );
            var_1 scripts\mp\utility\game::incperstat( "defends", 1 );
            var_1 scripts\mp\persistence::statsetchild( "round", "defends", var_1.pers["defends"] );
            thread scripts\mp\matchdata::_id_AFC5( var_9, "carrying" );
            scripts\mp\gametypes\obj_ball::_id_12F46( "neutral", 1, 0 );
            var_11 = 1;
        }
    }

    if ( !var_11 )
    {
        var_14 = 0;

        foreach ( var_16 in level._id_2800 )
        {
            var_14 = _id_5720( var_12, var_10.origin, var_16.curorigin );

            if ( var_14 && var_1.team != var_10.team )
            {
                if ( var_16._id_C83E == var_10.team )
                    var_1 thread scripts\mp\awards::givemidmatchaward( "mode_x_assault" );
                else if ( var_16._id_C83E == var_1.team )
                    var_1 thread scripts\mp\awards::givemidmatchaward( "mode_x_defend" );

                break;
            }
        }

        if ( !var_14 )
        {
            foreach ( var_21, var_19 in level._id_2798 )
            {
                var_20 = _id_5720( var_12, var_10.origin, var_19.trigger.origin );

                if ( var_20 )
                {
                    if ( var_21 == var_10.team )
                    {
                        var_1 thread scripts\mp\awards::givemidmatchaward( "mode_x_assault" );
                        continue;
                    }

                    var_1 thread scripts\mp\awards::givemidmatchaward( "mode_x_defend" );
                }
            }
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

onspawnplayer()
{
    self._id_1165E = 0;
}

_id_8EC5( var_0 )
{
    level waittill( "game_ended" );

    if ( isdefined( var_0 ) )
        var_0.alpha = 0;
}

_id_E189()
{
    self endon( "game_ended" );

    for (;;)
    {
        if ( getdvar( "scr_devRemoveDomFlag", "" ) != "" )
        {
            var_0 = getdvar( "scr_devRemoveDomFlag", "" );

            if ( var_0 == "_a" )
                var_1 = "allies";
            else
                var_1 = "axis";

            level._id_2798[var_1]._id_130AD scripts\mp\gameobjects::allowuse( "none" );
            level._id_2798[var_1]._id_130AD.trigger = undefined;
            level._id_2798[var_1]._id_130AD notify( "deleted" );

            foreach ( var_3 in level.players )
                var_3 _id_D017();

            level._id_2798[var_1]._id_130AD._id_1343B = "none";
            level._id_2798[var_1]._id_130AD scripts\mp\gameobjects::_id_F283( "friendly", undefined );
            level._id_2798[var_1]._id_130AD scripts\mp\gameobjects::_id_F284( "friendly", undefined );
            level._id_2798[var_1]._id_130AD scripts\mp\gameobjects::_id_F283( "enemy", undefined );
            level._id_2798[var_1]._id_130AD scripts\mp\gameobjects::_id_F284( "enemy", undefined );
            setdynamicdvar( "scr_devRemoveDomFlag", "" );
        }

        wait 1;
    }
}

_id_CC2B()
{
    self endon( "game_ended" );

    for (;;)
    {
        if ( getdvar( "scr_devPlaceDomFlag", "" ) != "" )
        {
            var_0 = getdvar( "scr_devPlaceDomFlag", "" );

            if ( var_0 == "_a" )
                var_1 = "allies";
            else
                var_1 = "axis";

            var_2 = spawnstruct();
            var_2.origin = level.players[0].origin;
            var_2.origin += ( 0, 0, 190 );
            var_2.radius = 50;
            var_2.team = var_1;
            var_2._id_279B = 0;
            var_2._id_8EE8 = 0;
            level._id_2798[var_1] = var_2;
            var_2.trigger = spawn( "trigger_radius", var_2.origin - ( 0, 0, var_2.radius ), 0, var_2.radius, var_2.radius * 2 );
            var_2._id_130AD = scripts\mp\gameobjects::createuseobject( var_1, var_2.trigger, [], ( 0, 0, var_2.radius * 2.1 ) );
            var_2._id_130AD._id_0155 = var_2;
            var_2._id_130AD scripts\mp\gameobjects::_id_F283( "friendly", "waypoint_blitz_defend" );
            var_2._id_130AD scripts\mp\gameobjects::_id_F283( "enemy", "waypoint_blitz_goal" );
            var_2._id_130AD scripts\mp\gameobjects::_id_F284( "friendly", "waypoint_blitz_defend" );
            var_2._id_130AD scripts\mp\gameobjects::_id_F284( "enemy", "waypoint_blitz_goal" );
            var_2._id_130AD scripts\mp\gameobjects::_id_FB0E( "any" );
            var_2._id_130AD scripts\mp\gameobjects::allowuse( "enemy" );
            var_2._id_130AD scripts\mp\gameobjects::_id_F76A( level._id_2800 );
            var_2._id_130AD scripts\mp\gameobjects::_id_FB08( 0 );
            var_2._id_130AD scripts\mp\gameobjects::_id_3897( 1 );
            var_2._id_130AD._id_C5BB = ::_id_2779;
            var_2._id_130AD._id_393A = ::_id_2794;
            var_2._id_130AD._id_C4D9 = ::ball_goal_contested;
            var_2._id_130AD._id_C5B9 = ::ball_goal_uncontested;
            var_2._id_A63A = spawn( "script_model", var_2.origin + ( 0, 0, 20 ) );
            var_2._id_A63A setscriptmoverkillcam( "explosive" );
            _id_2795();
            setdynamicdvar( "scr_devPlaceDomFlag", "" );
        }

        wait 1;
    }
}

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
        scripts\mp\utility\game::registerroundswitchdvar( level.gametype, 0, 0, 9 );
        scripts\mp\utility\game::registertimelimitdvar( level.gametype, 10 );
        scripts\mp\utility\game::registerscorelimitdvar( level.gametype, 7500 );
        scripts\mp\utility\game::registerroundlimitdvar( level.gametype, 1 );
        scripts\mp\utility\game::registerwinlimitdvar( level.gametype, 1 );
        scripts\mp\utility\game::registernumlivesdvar( level.gametype, 0 );
        scripts\mp\utility\game::registerhalftimedvar( level.gametype, 0 );
        setdynamicdvar( "scr_tdef_possessionResetCondition", 1 );
        setdynamicdvar( "scr_tdef_possessionResetTime", 60 );
        level._id_B40C = 1;
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    level._id_3AEC = 100;
    level._id_EB50 = 1;
    updategametypedvars();
    level.teambased = 1;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level._id_C577 = ::_id_C577;
    level._id_C583 = ::_id_80E9;
    level._id_27FC = 1;
    level._id_27C6 = [];
    level._id_2800 = [];
    level._id_27D2 = [];
    level._id_EC39 = 0;
    level._id_27F9 = 0;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = scripts\mp\damage::gamemodemodifyplayerdamage;

    game["dialog"]["gametype"] = "team_defender";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];

    game["strings"]["overtime_hint"] = &"MP_FIRST_BLOOD";
    game["dialog"]["drone_reset"] = "defender_obj_respawned";
    game["dialog"]["ally_own_drone"] = "tdef_ally_own_drone";
    game["dialog"]["enemy_own_drone"] = "tdef_enemy_own_drone";
    game["dialog"]["ally_throw_score"] = "ally_throw_score";
    game["dialog"]["ally_carry_score"] = "ally_carry_score";
    game["dialog"]["enemy_throw_score"] = "enemy_throw_score";
    game["dialog"]["enemy_carry_score"] = "enemy_carry_score";
    game["dialog"]["pass_complete"] = "friendly_pass";
    game["dialog"]["pass_intercepted"] = "tdef_pass_intercepted";
    game["dialog"]["ally_drop_drone"] = "tdef_ally_drop_drone";
    game["dialog"]["enemy_drop_drone"] = "tdef_enemy_drop_drone";
    game["dialog"]["drone_reset_soon"] = "team_defender_reset";
    game["bomb_dropped_sound"] = "mp_uplink_ball_pickedup_enemy";
    game["bomb_recovered_sound"] = "mp_uplink_ball_pickedup_friendly";
    game["dialog"]["offense_obj"] = "capture_obj";
    game["dialog"]["defense_obj"] = "capture_obj";
    thread _id_C56E();
}

initializematchrules()
{
    scripts\mp\utility\game::setcommonrulesfrommatchdata();
    setdynamicdvar( "scr_tdef_scoringTime", getmatchrulesdata( "tdefData", "scoringTime" ) );
    setdynamicdvar( "scr_tdef_scorePerTick", getmatchrulesdata( "tdefData", "scorePerTick" ) );
    setdynamicdvar( "scr_tdef_carrierBonusTime", getmatchrulesdata( "tdefData", "carrierBonusTime" ) );
    setdynamicdvar( "scr_tdef_carrierBonusScore", getmatchrulesdata( "tdefData", "carrierBonusScore" ) );
    setdynamicdvar( "scr_tdef_delayplayer", getmatchrulesdata( "tdefData", "delayPlayer" ) );
    setdynamicdvar( "scr_tdef_spawndelay", getmatchrulesdata( "tdefData", "spawnDelay" ) );
    setdynamicdvar( "scr_tdef_ballActivationDelay", getmatchrulesdata( "tdefData", "ballActivationDelay" ) );
    setdynamicdvar( "scr_tdef_possessionResetCondition", getmatchrulesdata( "ballCommonData", "possessionResetCondition" ) );
    setdynamicdvar( "scr_tdef_possessionResetTime", getmatchrulesdata( "ballCommonData", "possessionResetTime" ) );
    setdynamicdvar( "scr_tdef_idleResetTime", getmatchrulesdata( "ballCommonData", "idleResetTime" ) );
    setdynamicdvar( "scr_tdef_explodeOnExpire", getmatchrulesdata( "ballCommonData", "explodeOnExpire" ) );
    setdynamicdvar( "scr_tdef_armorMod", getmatchrulesdata( "ballCommonData", "armorMod" ) );
    setdynamicdvar( "scr_tdef_showEnemyCarrier", getmatchrulesdata( "ballCommonData", "showEnemyCarrier" ) );
    setdynamicdvar( "scr_tdef_halftime", 0 );
    scripts\mp\utility\game::registerhalftimedvar( "tdef", 0 );
    setdynamicdvar( "scr_tdef_promode", 0 );
}

onstartgametype()
{
    setclientnamemode( "auto_change" );

    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    scripts\mp\utility\game::setobjectivetext( "allies", &"OBJECTIVES_TDEF" );
    scripts\mp\utility\game::setobjectivetext( "axis", &"OBJECTIVES_TDEF" );

    if ( level._id_10A56 )
    {
        scripts\mp\utility\game::setobjectivescoretext( "allies", &"OBJECTIVES_TDEF" );
        scripts\mp\utility\game::setobjectivescoretext( "axis", &"OBJECTIVES_TDEF" );
    }
    else
    {
        scripts\mp\utility\game::setobjectivescoretext( "allies", &"OBJECTIVES_TDEF_SCORE" );
        scripts\mp\utility\game::setobjectivescoretext( "axis", &"OBJECTIVES_TDEF_SCORE" );
    }

    scripts\mp\utility\game::setobjectivehinttext( "allies", &"OBJECTIVES_TDEF_ATTACKER_HINT" );
    scripts\mp\utility\game::setobjectivehinttext( "axis", &"OBJECTIVES_TDEF_ATTACKER_HINT" );
    _id_49B4();
    scripts\mp\gametypes\obj_ball::_id_2782();
    scripts\mp\gametypes\obj_ball::_id_279C();
    scripts\mp\gametypes\obj_ball::_id_277F();
    scripts\mp\gametypes\obj_ball::_id_27C4( 0 );
    thread scripts\mp\gametypes\obj_ball::hideballsongameended();
    thread baseeffectwatchgameended();
    _id_98CE();
    var_2[0] = level.gametype;
    var_2[1] = "tdm";
    var_2[2] = "ball";
    scripts\mp\gameobjects::main( var_2 );
    _id_1159E();

    if ( level._id_D6AF != 0 )
        scripts\mp\gametypes\obj_ball::_id_97D6();
}

updategametypedvars()
{
    scripts\mp\gametypes\common::updategametypedvars();
    level._id_EC54 = scripts\mp\utility\game::_id_5F6B( "scoringTime", 1, 1, 10 );
    level._id_EC41 = scripts\mp\utility\game::_id_5F6D( "scorePerTick", 1, 1, 25 );
    level._id_3AEE = scripts\mp\utility\game::_id_5F6B( "carrierBonusTime", 4, 0, 10 );
    level._id_3AED = scripts\mp\utility\game::_id_5F6D( "carrierBonusScore", 25, 0, 250 );
    level._id_5117 = scripts\mp\utility\game::_id_5F6D( "delayPlayer", 1, 0, 1 );
    level._id_10846 = scripts\mp\utility\game::_id_5F6B( "spawnDelay", 2.5, 0, 30 );
    level._id_27D1 = scripts\mp\utility\game::_id_5F6B( "ballActivationDelay", 10, 0, 30 );
    level._id_D6AF = scripts\mp\utility\game::_id_5F6D( "possessionResetCondition", 0, 0, 2 );
    level._id_D6B0 = scripts\mp\utility\game::_id_5F6B( "possessionResetTime", 0, 0, 150 );
    level._id_69A1 = scripts\mp\utility\game::_id_5F6D( "explodeOnExpire", 0, 0, 1 );
    level._id_92F7 = scripts\mp\utility\game::_id_5F6B( "idleResetTime", 15, 0, 60 );
    level._id_218A = scripts\mp\utility\game::_id_5F6B( "armorMod", 1, 0, 2 );
    level._id_10120 = scripts\mp\utility\game::_id_5F6D( "showEnemyCarrier", 5, 0, 6 );
    level._id_3AEC = int( level._id_3AEC * level._id_218A );
}

_id_98CE()
{
    level.spawnmins = ( 0, 0, 0 );
    level.spawnmaxs = ( 0, 0, 0 );
    scripts\mp\spawnlogic::_id_F62D( "TDef" );
    scripts\mp\spawnlogic::addstartspawnpoints( "mp_ball_spawn_allies_start" );
    scripts\mp\spawnlogic::addstartspawnpoints( "mp_ball_spawn_axis_start" );
    scripts\mp\spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn" );
    scripts\mp\spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn_secondary", 1, 1 );
    scripts\mp\spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn" );
    scripts\mp\spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn_secondary", 1, 1 );
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );

    foreach ( var_1 in level._id_108FB )
        _id_371E( var_1 );
}

_id_371E( var_0 )
{
    var_0._id_571E = undefined;
    var_1 = getpathdist( var_0.origin, level._id_27C6[0]._id_862F, 1000 );

    if ( var_1 < 0 )
        var_1 = scripts\engine\utility::_id_56F4( var_0.origin, level._id_27C6[0]._id_862F );
    else
        var_1 *= var_1;

    var_0._id_571E = var_1;
}

getspawnpoint()
{
    var_0 = self.pers["team"];

    if ( game["switchedsides"] )
        var_0 = scripts\mp\utility\game::_id_8027( var_0 );

    if ( scripts\mp\spawnlogic::_id_100BA() )
    {
        var_1 = scripts\mp\spawnlogic::getspawnpointarray( "mp_ball_spawn_" + var_0 + "_start" );
        var_2 = scripts\mp\spawnlogic::getspawnpoint_startspawn( var_1 );
    }
    else
    {
        var_1 = level._id_108FB;
        var_3 = var_1;
        var_4 = [];
        var_4["ballPosition"] = level._id_2800[0].visuals[0].origin;

        if ( isdefined( level._id_2800[0]._id_3AA8 ) )
            var_4["activeCarrierPosition"] = level._id_2800[0]._id_3AA8.origin;
        else
            var_4["activeCarrierPosition"] = var_4["ballPosition"];

        var_4["avoidBallDeadZoneDistSq"] = 1000000;
        var_2 = scripts\mp\spawnscoring::getspawnpoint( var_1, var_3, var_4 );
    }

    return var_2;
}

_id_49B4()
{
    level._effect["ball_trail"] = loadfx( "vfx/core/mp/core/vfx_uplink_ball_trail.vfx" );
    level._effect["ball_idle"] = loadfx( "vfx/core/mp/core/vfx_uplink_ball_idle_tdef.vfx" );
    level._effect["ball_download"] = loadfx( "vfx/core/mp/core/vfx_uplink_ball_download.vfx" );
    level._effect["ball_download_end"] = loadfx( "vfx/core/mp/core/vfx_uplink_ball_download_end_tdef.vfx" );
    level._effect["ball_teleport"] = loadfx( "vfx/core/mp/core/vfx_uplink_ball_teleport.vfx" );
    level._effect["ball_base_glow"] = loadfx( "vfx/core/mp/core/vfx_uplink_base_glow.vfx" );
}

_id_1159E()
{
    level._id_92A9 = "waypoint_blitz_defend_round";
    level._id_92A8 = "waypoint_blitz_defend_round";
    level._id_92AD = "waypoint_capture_kill_round";
    level._id_92AC = "waypoint_capture_kill_round";
    level._id_929C = "waypoint_capture_take";
    level._id_929B = "waypoint_capture_take";
    scripts\mp\utility\game::_id_98D3();
    level._id_276E = level._id_2800[0];
}

_id_C577( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = self;
    var_11 = var_1.origin;
    var_12 = 0;

    if ( isdefined( var_0 ) )
    {
        var_11 = var_0.origin;
        var_12 = var_0 == var_1;
    }

    if ( isdefined( self.carryobject ) && isdefined( self.carryobject.passtargetoutlineid ) && isdefined( self.carryobject.passtargetent ) )
    {
        scripts\mp\utility\game::_id_C78F( self.carryobject.passtargetoutlineid, self.carryobject.passtargetent );
        self.carryobject.passtargetoutlineid = undefined;
        self.carryobject.passtargetent = undefined;
    }

    if ( isdefined( self.carryobject ) && isdefined( self.carryobject.playeroutlineid ) && isdefined( self.carryobject.playeroutlined ) )
    {
        scripts\mp\utility\game::_id_C78F( self.carryobject.playeroutlineid, self.carryobject.playeroutlined );
        self.carryobject.playeroutlineid = undefined;
        self.carryobject.playeroutlined = undefined;
    }

    if ( isdefined( level._id_276E._id_3AA8 ) )
    {
        if ( isdefined( var_1 ) && isplayer( var_1 ) && var_1.pers["team"] != var_10.pers["team"] )
        {
            if ( isdefined( var_1._id_2777 ) && var_12 )
                var_1 thread scripts\mp\awards::givemidmatchaward( "mode_uplink_kill_with_ball" );
            else if ( isdefined( var_10._id_2777 ) )
            {
                var_1 thread scripts\mp\awards::givemidmatchaward( "mode_uplink_kill_carrier" );
                thread scripts\mp\matchdata::_id_AFC5( var_9, "carrying" );
                scripts\mp\gametypes\obj_ball::_id_12F46( "neutral", 1, 0 );
            }

            if ( var_1.pers["team"] == level._id_276E._id_C83E && var_1 != level._id_276E._id_3AA8 )
            {
                var_13 = distancesquared( level._id_276E._id_3AA8.origin, var_11 );

                if ( var_13 < 90000 )
                {
                    var_1 thread scripts\mp\awards::givemidmatchaward( "mode_x_defend" );
                    var_1 scripts\mp\utility\game::incperstat( "defends", 1 );
                    var_1 scripts\mp\persistence::statsetchild( "round", "defends", var_1.pers["defends"] );
                    var_1 scripts\mp\utility\game::_id_F6FB( var_1.pers["defends"] );
                    thread scripts\mp\matchdata::_id_AFC5( var_9, "defending" );
                }
            }
        }
    }
}

_id_26CE( var_0 )
{
    level endon( "game_ended" );
    level._id_276E endon( "dropped" );
    level._id_276E endon( "reset" );
    level notify( "awardCapturePointsRunning" );
    level endon( "awardCapturePointsRunning" );

    if ( level._id_3AED > 0 )
        level._id_276E._id_3AA8 thread _id_3AEF();

    var_1 = level._id_EC54;
    var_2 = level._id_EC41;

    while ( !level._id_7669 )
    {
        wait( var_1 );
        scripts\mp\hostmigration::waittillhostmigrationdone();

        if ( !level._id_7669 )
        {
            scripts\mp\gamescore::giveteamscoreforobjective( var_0, var_2, 0 );
            level._id_276E._id_3AA8 scripts\mp\utility\game::incperstat( "objTime", 1 );
            level._id_276E._id_3AA8 scripts\mp\persistence::statsetchild( "round", "objTime", level._id_276E._id_3AA8.pers["objTime"] );
            level._id_276E._id_3AA8 scripts\mp\utility\game::setextrascore0( level._id_276E._id_3AA8.pers["objTime"] );
            level._id_276E._id_3AA8 scripts\mp\gamescore::_id_8392( "tdef_hold_obj", 10 );
        }
    }
}

_id_3AEF()
{
    level endon( "game_ended" );
    self endon( "death" );
    level._id_276E endon( "dropped" );
    level._id_276E endon( "reset" );

    for (;;)
    {
        wait( level._id_3AEE );
        thread scripts\mp\utility\game::_id_83B4( "ball_carry", undefined, level._id_3AED );
    }
}

_id_13A3C()
{
    self endon( "dropped_flag" );
    self endon( "disconnect" );
    level waittill( "game_ended" );

    if ( isdefined( self ) )
    {
        if ( isdefined( self._id_1159F ) )
        {
            var_0 = int( gettime() - self._id_1159F );

            if ( var_0 / 100 / 60 < 1 )
                var_1 = 0;
            else
                var_1 = int( var_0 / 100 / 60 );

            scripts\mp\utility\game::incperstat( "destructions", var_1 );
            scripts\mp\persistence::statsetchild( "round", "destructions", self.pers["destructions"] );
        }
    }
}

_id_80E9()
{
    var_0 = level._id_276E scripts\mp\gameobjects::_id_803E();

    if ( isdefined( var_0 ) )
    {
        if ( self.pers["team"] == var_0 )
        {
            if ( !level._id_10846 )
                return undefined;

            if ( level._id_5117 )
                return level._id_10846;
        }
    }
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_1194 = [];
        thread onplayerspawned( var_0 );
    }
}

onplayerspawned( var_0 )
{
    for (;;)
    {
        var_0 waittill( "spawned" );
        level._id_27D2[0] scripts\mp\gametypes\obj_ball::_id_1010F( var_0 );

        if ( level._id_D6AF != 0 )
            var_0 setclientomnvar( "ui_uplink_timer_hud", 0 );

        var_0 scripts\mp\utility\game::setextrascore0( 0 );

        if ( isdefined( var_0.pers["objTime"] ) )
            var_0 scripts\mp\utility\game::setextrascore0( var_0.pers["objTime"] );

        var_0 scripts\mp\utility\game::_id_F6FB( 0 );

        if ( isdefined( var_0.pers["defends"] ) )
            var_0 scripts\mp\utility\game::_id_F6FB( var_0.pers["defends"] );
    }
}

_id_8116()
{
    if ( scripts\mp\utility\game::istrue( self._id_115A0 ) )
    {
        if ( scripts\mp\utility\game::_id_12D6( "specialty_afterburner" ) )
        {
            self _meth_8434( 0, scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_9D46(), 600, 2000 ) );
            self _meth_8430( 0, scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_9D46(), 750, 650 ) );
        }
        else
        {
            self _meth_8434( 0, 400 );
            self _meth_8430( 0, 900 );
        }

        self._id_115A0 = 0;
    }
    else
    {
        if ( scripts\mp\utility\game::_id_12D6( "specialty_afterburner" ) )
        {
            self _meth_8434( 0, 250 );
            self _meth_8430( 0, 1350 );
        }
        else
        {
            self _meth_8434( 0, 200 );
            self _meth_8430( 0, 1800 );
        }

        self._id_115A0 = 1;
    }
}

baseeffectwatchgameended()
{
    level waittill( "bro_shot_start" );

    foreach ( var_1 in level.players )
    {
        if ( isdefined( var_1._id_1194 ) && isdefined( var_1._id_1194[0] ) )
            var_1._id_1194[0] delete();
    }
}

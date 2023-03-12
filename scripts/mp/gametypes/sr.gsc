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
        scripts\mp\utility\game::registerroundswitchdvar( level.gametype, 3, 0, 9 );
        scripts\mp\utility\game::registertimelimitdvar( level.gametype, 2.5 );
        scripts\mp\utility\game::registerscorelimitdvar( level.gametype, 1 );
        scripts\mp\utility\game::registerroundlimitdvar( level.gametype, 0 );
        scripts\mp\utility\game::registerwinlimitdvar( level.gametype, 4 );
        scripts\mp\utility\game::registernumlivesdvar( level.gametype, 1 );
        scripts\mp\utility\game::registerhalftimedvar( level.gametype, 0 );
        scripts\mp\utility\game::_id_DF18( level.gametype, 1 );
        scripts\mp\utility\game::_id_DF19( level.gametype, 4 );
        scripts\mp\utility\game::_id_DEEB( level.gametype, 1 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    updategametypedvars();
    level.objectivebased = 1;
    level.teambased = 1;
    level.nobuddyspawns = 1;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onspawnplayer = ::onspawnplayer;
    level._id_C577 = ::_id_C577;
    level._id_C4E8 = ::_id_C4E8;
    level._id_C564 = ::_id_C564;
    level.ontimelimit = ::ontimelimit;
    level.onnormaldeath = ::onnormaldeath;
    level._id_7677 = scripts\mp\utility\game::_id_9EF4;
    level._id_C561 = ::_id_C4CC;
    level._id_1C9A = 0;
    level._id_2C64 = 0;
    level._id_C060 = 1;
    level._id_209F = 0;
    level._id_2F35 = 0;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = scripts\mp\damage::gamemodemodifyplayerdamage;

    game["dialog"]["gametype"] = "searchrescue";

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
    game["dialog"]["lead_lost"] = "null";
    game["dialog"]["lead_tied"] = "null";
    game["dialog"]["lead_taken"] = "null";
    game["dialog"]["kill_confirmed"] = "kill_confirmed";
    game["dialog"]["revived"] = "sr_rev";
    game["dialog"]["lastalive_revive"] = "lastalive_revive";
    setomnvar( "ui_bomb_timer_endtime_a", 0 );
    setomnvar( "ui_bomb_timer_endtime_b", 0 );
    setomnvar( "ui_bomb_planted_a", 0 );
    setomnvar( "ui_bomb_planted_b", 0 );
    setomnvar( "ui_allies_alive", 0 );
    setomnvar( "ui_axis_alive", 0 );
    level._id_4507["vanish"] = loadfx( "vfx/core/impacts/small_snowhit" );
    level thread _id_C56E();
}

initializematchrules()
{
    scripts\mp\utility\game::setcommonrulesfrommatchdata();
    setdynamicdvar( "scr_sr_bombtimer", getmatchrulesdata( "bombData", "bombTimer" ) );
    setdynamicdvar( "scr_sr_planttime", getmatchrulesdata( "bombData", "plantTime" ) );
    setdynamicdvar( "scr_sr_defusetime", getmatchrulesdata( "bombData", "defuseTime" ) );
    setdynamicdvar( "scr_sr_multibomb", getmatchrulesdata( "bombData", "multiBomb" ) );
    setdynamicdvar( "scr_sr_silentPlant", getmatchrulesdata( "bombData", "silentPlant" ) );
    setdynamicdvar( "scr_sr_halftime", 0 );
    scripts\mp\utility\game::registerhalftimedvar( "sr", 0 );
    setdynamicdvar( "scr_sr_promode", 0 );
}

onprecachegametype()
{
    game["bomb_dropped_sound"] = "mp_war_objective_lost";
    game["bomb_recovered_sound"] = "mp_war_objective_taken";
}

onstartgametype()
{
    if ( !isdefined( game["switchedsides"] ) )
        game["switchedsides"] = 0;

    if ( game["switchedsides"] )
    {
        var_0 = game["attackers"];
        var_1 = game["defenders"];
        game["attackers"] = var_1;
        game["defenders"] = var_0;
    }

    setclientnamemode( "manual_change" );
    level._effect["bomb_explosion"] = loadfx( "vfx/iw7/_requests/mp/vfx_bombardment_strike_explosion" );
    level._effect["vehicle_explosion"] = loadfx( "vfx/core/expl/small_vehicle_explosion_new.vfx" );
    level._effect["building_explosion"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    scripts\mp\utility\game::setobjectivetext( game["attackers"], &"OBJECTIVES_SD_ATTACKER" );
    scripts\mp\utility\game::setobjectivetext( game["defenders"], &"OBJECTIVES_SD_DEFENDER" );

    if ( level._id_10A56 )
    {
        scripts\mp\utility\game::setobjectivescoretext( game["attackers"], &"OBJECTIVES_SD_ATTACKER" );
        scripts\mp\utility\game::setobjectivescoretext( game["defenders"], &"OBJECTIVES_SD_DEFENDER" );
    }
    else
    {
        scripts\mp\utility\game::setobjectivescoretext( game["attackers"], &"OBJECTIVES_SD_ATTACKER_SCORE" );
        scripts\mp\utility\game::setobjectivescoretext( game["defenders"], &"OBJECTIVES_SD_DEFENDER_SCORE" );
    }

    scripts\mp\utility\game::setobjectivehinttext( game["attackers"], &"OBJECTIVES_SD_ATTACKER_HINT" );
    scripts\mp\utility\game::setobjectivehinttext( game["defenders"], &"OBJECTIVES_SD_DEFENDER_HINT" );
    _id_98CE();
    level._id_58BE = ::_id_58BE;
    var_2[0] = "sd";
    var_2[1] = "bombzone";
    var_2[2] = "blocker";
    scripts\mp\gameobjects::main( var_2 );
    setspecialloadout();
    thread _id_2C62();
    scripts\mp\utility\game::_id_98D3();
}

_id_98CE()
{
    scripts\mp\spawnlogic::_id_F62D( "SearchAndRescue" );
    level.spawnmins = ( 0, 0, 0 );
    level.spawnmaxs = ( 0, 0, 0 );
    scripts\mp\spawnlogic::addstartspawnpoints( "mp_sd_spawn_attacker" );
    scripts\mp\spawnlogic::addstartspawnpoints( "mp_sd_spawn_defender" );
    scripts\mp\spawnlogic::addspawnpoints( "attacker", "mp_tdm_spawn" );
    scripts\mp\spawnlogic::addspawnpoints( "attacker", "mp_tdm_spawn_secondary", 1, 1 );
    scripts\mp\spawnlogic::addspawnpoints( "defender", "mp_tdm_spawn" );
    scripts\mp\spawnlogic::addspawnpoints( "defender", "mp_tdm_spawn_secondary", 1, 1 );
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
}

getspawnpoint()
{
    var_0 = "defender";

    if ( self.pers["team"] == game["attackers"] )
        var_0 = "attacker";

    if ( scripts\mp\spawnlogic::_id_100BA() )
    {
        var_1 = scripts\mp\spawnlogic::getspawnpointarray( "mp_sd_spawn_" + var_0 );
        var_2 = scripts\mp\spawnlogic::getspawnpoint_startspawn( var_1 );
    }
    else
    {
        var_1 = scripts\mp\spawnlogic::getteamspawnpoints( var_0 );
        var_3 = scripts\mp\spawnlogic::_id_81A9( var_0 );
        var_2 = scripts\mp\spawnscoring::getspawnpoint( var_1, var_3 );
    }

    return var_2;
}

onspawnplayer()
{
    self._id_9EE6 = 0;
    self._id_9DBC = 0;
    self._id_9D6C = 0;

    if ( level.multibomb && self.pers["team"] == game["attackers"] )
        self setclientomnvar( "ui_carrying_bomb", 1 );
    else
    {
        self setclientomnvar( "ui_carrying_bomb", 0 );

        foreach ( var_1 in level._id_2C7A )
            var_1.trigger disableplayeruse( self );
    }

    _id_12E58();
    level notify( "spawned_player" );

    if ( self._id_0291 == "axis" || self._id_0291 == "allies" )
    {
        level notify( "sr_player_joined", self );
        scripts\mp\utility\game::setextrascore0( 0 );

        if ( isdefined( self.pers["plants"] ) )
            scripts\mp\utility\game::setextrascore0( self.pers["plants"] );

        scripts\mp\utility\game::_id_F6FB( 0 );

        if ( isdefined( self.pers["rescues"] ) )
            scripts\mp\utility\game::_id_F6FB( self.pers["rescues"] );
    }
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_C574();
    }
}

_id_C574()
{
    for (;;)
    {
        self waittill( "disconnect" );
        level _id_12E58();
    }
}

_id_12E58()
{
    if ( isdefined( level._id_1BE5["allies"] ) )
        setomnvar( "ui_allies_alive", level._id_1BE5["allies"].size );

    if ( isdefined( level._id_1BE5["axis"] ) )
        setomnvar( "ui_axis_alive", level._id_1BE5["axis"].size );
}

_id_C577( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    self setclientomnvar( "ui_carrying_bomb", 0 );
    _id_12E58();
    thread _id_3DE9();
}

_id_3DE9()
{
    wait 0.05;
    var_0 = 0;

    if ( !level._id_1BE6[game["attackers"]] )
    {
        level._id_10978[game["attackers"]]._id_1C90 = 1;
        var_0 = 1;
    }

    if ( !level._id_1BE6[game["defenders"]] )
    {
        level._id_10978[game["defenders"]]._id_1C90 = 1;
        var_0 = 1;
    }

    if ( var_0 )
        _id_0AF0::_id_12F21();
}

_id_EFFD( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( !isai( var_3 ) )
            var_3 setclientomnvar( "ui_objective_state", 0 );
    }

    thread scripts\mp\gamelogic::endgame( var_0, var_1 );
}

_id_C4E8( var_0 )
{
    if ( level._id_2C58 > 0 || level._id_2C4A )
        return;

    if ( var_0 == "all" )
    {
        if ( level._id_2C5C )
            _id_EFFD( game["attackers"], game["end_reason"][game["defenders"] + "_eliminated"] );
        else
            _id_EFFD( game["defenders"], game["end_reason"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["attackers"] )
    {
        if ( level._id_2C5C )
            return;

        level thread _id_EFFD( game["defenders"], game["end_reason"][game["attackers"] + "_eliminated"] );
    }
    else if ( var_0 == game["defenders"] )
        level thread _id_EFFD( game["attackers"], game["end_reason"][game["defenders"] + "_eliminated"] );
}

_id_C564( var_0 )
{
    if ( level._id_2C58 > 0 || level._id_2C4A )
        return;

    var_1 = scripts\mp\utility\game::_id_7F5E( var_0 );
    var_1 thread _id_8378();
}

onnormaldeath( var_0, var_1, var_2, var_3, var_4 )
{
    scripts\mp\gametypes\common::onnormaldeath( var_0, var_1, var_2, var_3, var_4 );
    var_5 = scripts\mp\rank::getscoreinfovalue( "kill" );
    var_6 = var_0.team;

    if ( var_0._id_9EE6 )
    {
        thread scripts\mp\matchdata::_id_AFC5( var_2, "planting" );
        var_1 scripts\mp\utility\game::incperstat( "defends", 1 );
        var_1 scripts\mp\persistence::statsetchild( "round", "defends", var_1.pers["defends"] );
    }
    else if ( var_0._id_9D6C )
        thread scripts\mp\matchdata::_id_AFC5( var_2, "carrying" );
    else if ( var_0._id_9DBC )
    {
        thread scripts\mp\matchdata::_id_AFC5( var_2, "defusing" );
        var_1 scripts\mp\utility\game::incperstat( "defends", 1 );
        var_1 scripts\mp\persistence::statsetchild( "round", "defends", var_1.pers["defends"] );
    }

    scripts\mp\gametypes\obj_bombzone::_id_2C6F( var_1, var_0 );
}

_id_8378()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\mp\utility\game::_id_1383E( 3 );
    var_0 = scripts\mp\utility\game::_id_8027( self.pers["team"] );
    level thread scripts\mp\utility\game::_id_115DE( "callout_lastteammemberalive", self, self.pers["team"] );
    level thread scripts\mp\utility\game::_id_115DE( "callout_lastenemyalive", self, var_0 );

    foreach ( var_2 in level.players )
    {
        if ( var_2.pers["team"] == self.pers["team"] )
        {
            if ( isdefined( var_2._id_113EF ) && var_2._id_113EF )
                level._id_C060 = 0;
        }
    }

    scripts\mp\music_and_dialog::_id_C54B( self );
    scripts\mp\missions::_id_A9B5();
}

ontimelimit()
{
    _id_EFFD( game["defenders"], game["end_reason"]["time_limit_reached"] );

    foreach ( var_1 in level.players )
    {
        if ( isdefined( var_1._id_2C5E ) )
        {
            var_1 scripts\mp\utility\game::_id_141E( var_1._id_2C5E );
            break;
        }
    }
}

updategametypedvars()
{
    scripts\mp\gametypes\common::updategametypedvars();
    level._id_CC52 = scripts\mp\utility\game::_id_5F6B( "planttime", 5, 0, 20 );
    level._id_50AB = scripts\mp\utility\game::_id_5F6B( "defusetime", 5, 0, 20 );
    level._id_2C6C = scripts\mp\utility\game::_id_5F6B( "bombtimer", 45, 1, 300 );
    level.multibomb = scripts\mp\utility\game::_id_5F6D( "multibomb", 0, 0, 1 );
    level._id_101F7 = scripts\mp\utility\game::_id_5F6D( "silentPlant", 0, 0, 1 );
}

_id_E0D8( var_0 )
{
    var_1 = [];
    var_2 = getentarray( "script_brushmodel", "classname" );

    foreach ( var_4 in var_2 )
    {
        if ( isdefined( var_4._id_EDBF ) && var_4._id_EDBF == "bombzone" )
        {
            foreach ( var_6 in var_0 )
            {
                if ( distance( var_4.origin, var_6.origin ) < 100 && issubstr( tolower( var_6._id_EDF9 ), "c" ) )
                {
                    var_6._id_DF2F = var_4;
                    var_1[var_1.size] = var_6;
                    break;
                }
            }
        }
    }

    foreach ( var_10 in var_1 )
    {
        var_10._id_DF2F delete();
        var_11 = getentarray( var_10._id_0334, "targetname" );

        foreach ( var_13 in var_11 )
            var_13 delete();

        var_10 delete();
    }

    return scripts\engine\utility::_id_22BC( var_0 );
}

_id_2C62()
{
    scripts\mp\gametypes\obj_bombzone::_id_2C77( "sd_bomb" );
    level._id_2C7A = [];
    var_0 = getentarray( "bombzone", "targetname" );
    var_0 = _id_E0D8( var_0 );
    level._id_C2A8 = var_0;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = scripts\mp\gametypes\obj_bombzone::_id_2C78( var_1 );
        var_2._id_C4CB = ::_id_C4CB;
        var_2._id_C50D = ::_id_C50D;
        var_2._id_C5BB = ::_id_C5C6;
        level._id_2C7A[level._id_2C7A.size] = var_2;
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
}

_id_C4CB( var_0 )
{
    scripts\mp\gametypes\obj_bombzone::_id_2C71( var_0 );

    if ( !scripts\mp\gameobjects::_id_9E07( var_0.pers["team"] ) )
    {
        if ( level.multibomb )
        {
            for ( var_1 = 0; var_1 < self._id_C749.size; var_1++ )
            {
                self._id_C749[var_1] scripts\mp\gameobjects::allowuse( "none" );
                self._id_C749[var_1] scripts\mp\gameobjects::_id_FB0E( "friendly" );
            }
        }
    }
}

_id_C50D( var_0, var_1, var_2 )
{
    scripts\mp\gametypes\obj_bombzone::_id_2C74( var_0, var_1, var_2 );

    if ( !scripts\mp\gameobjects::_id_9E07( var_1.pers["team"] ) )
    {
        if ( level.multibomb && !var_2 )
        {
            for ( var_3 = 0; var_3 < self._id_C749.size; var_3++ )
            {
                self._id_C749[var_3] scripts\mp\gameobjects::allowuse( "enemy" );
                self._id_C749[var_3] scripts\mp\gameobjects::_id_FB0E( "any" );
            }
        }
    }
}

_id_C5C6( var_0 )
{
    if ( !scripts\mp\gameobjects::_id_9E07( var_0.pers["team"] ) )
    {
        for ( var_1 = 0; var_1 < level._id_2C7A.size; var_1++ )
        {
            if ( level._id_2C7A[var_1] == self )
                continue;

            level._id_2C7A[var_1] scripts\mp\gameobjects::_id_5603();
        }
    }

    scripts\mp\gametypes\obj_bombzone::_id_2C76( var_0 );
}

_id_C4CC( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_3 == game["attackers"] )
    {
        setgameendtime( 0 );
        wait 3;
        _id_EFFD( game["attackers"], game["end_reason"]["target_destroyed"] );
    }
    else
    {
        wait 1.5;
        setgameendtime( 0 );
        _id_EFFD( game["defenders"], game["end_reason"]["bomb_defused"] );
    }
}

setspecialloadout()
{
    if ( isusingmatchrulesdata() && scripts\mp\utility\game::_id_7F91( "defaultClasses", game["attackers"], 5, "class", "inUse" ) )
        level._id_F004[game["attackers"]] = scripts\mp\utility\game::_id_7F92( game["attackers"], 5 );
}

_id_58BE( var_0 )
{
    var_0 scripts\mp\utility\game::_id_F6FB( var_0.pers["rescues"] );
}

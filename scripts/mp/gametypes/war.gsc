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
        scripts\mp\utility\game::registerscorelimitdvar( level.gametype, 75 );
        scripts\mp\utility\game::registerroundlimitdvar( level.gametype, 1 );
        scripts\mp\utility\game::registerwinlimitdvar( level.gametype, 1 );
        scripts\mp\utility\game::registernumlivesdvar( level.gametype, 0 );
        scripts\mp\utility\game::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    updategametypedvars();
    level.teambased = 1;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onnormaldeath = ::onnormaldeath;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = scripts\mp\damage::gamemodemodifyplayerdamage;

    game["dialog"]["gametype"] = "team_deathmatch";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    else if ( getdvarint( "camera_thirdPerson" ) )
        game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_diehard" ) )
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_" + level.gametype + "_promode" ) )
        game["dialog"]["gametype"] += "_pro";

    game["strings"]["overtime_hint"] = &"MP_FIRST_BLOOD";
}

initializematchrules()
{
    scripts\mp\utility\game::setcommonrulesfrommatchdata();
    setdynamicdvar( "scr_war_halftime", 0 );
    scripts\mp\utility\game::registerhalftimedvar( level.gametype, 0 );
    setdynamicdvar( "scr_war_promode", 0 );
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

    scripts\mp\utility\game::setobjectivetext( "allies", &"OBJECTIVES_WAR" );
    scripts\mp\utility\game::setobjectivetext( "axis", &"OBJECTIVES_WAR" );

    if ( level._id_10A56 )
    {
        scripts\mp\utility\game::setobjectivescoretext( "allies", &"OBJECTIVES_WAR" );
        scripts\mp\utility\game::setobjectivescoretext( "axis", &"OBJECTIVES_WAR" );
    }
    else
    {
        scripts\mp\utility\game::setobjectivescoretext( "allies", &"OBJECTIVES_WAR_SCORE" );
        scripts\mp\utility\game::setobjectivescoretext( "axis", &"OBJECTIVES_WAR_SCORE" );
    }

    scripts\mp\utility\game::setobjectivehinttext( "allies", &"OBJECTIVES_WAR_HINT" );
    scripts\mp\utility\game::setobjectivehinttext( "axis", &"OBJECTIVES_WAR_HINT" );
    _id_98CE();
    var_2[0] = level.gametype;
    scripts\mp\gameobjects::main( var_2 );
}

updategametypedvars()
{
    scripts\mp\gametypes\common::updategametypedvars();
}

_id_98CE()
{
    level.spawnmins = ( 0, 0, 0 );
    level.spawnmaxs = ( 0, 0, 0 );
    scripts\mp\spawnlogic::_id_F62D( "TDM" );
    scripts\mp\spawnlogic::addstartspawnpoints( "mp_tdm_spawn_allies_start" );
    scripts\mp\spawnlogic::addstartspawnpoints( "mp_tdm_spawn_axis_start" );
    scripts\mp\spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn" );
    scripts\mp\spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn_secondary", 1, 1 );
    scripts\mp\spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn" );
    scripts\mp\spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn_secondary", 1, 1 );
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
}

getspawnpoint()
{
    var_0 = self.pers["team"];

    if ( game["switchedsides"] )
        var_0 = scripts\mp\utility\game::_id_8027( var_0 );

    if ( scripts\mp\spawnlogic::_id_100BA() )
    {
        var_1 = scripts\mp\spawnlogic::getspawnpointarray( "mp_tdm_spawn_" + var_0 + "_start" );
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

onnormaldeath( var_0, var_1, var_2, var_3, var_4 )
{
    scripts\mp\gametypes\common::onnormaldeath( var_0, var_1, var_2, var_3, var_4 );
}

ontimelimit()
{
    if ( game["status"] == "overtime" )
        var_0 = "forfeit";
    else if ( game["teamScores"]["allies"] == game["teamScores"]["axis"] )
        var_0 = "overtime";
    else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
        var_0 = "axis";
    else
        var_0 = "allies";

    thread scripts\mp\gamelogic::endgame( var_0, game["end_reason"]["time_limit_reached"] );
}

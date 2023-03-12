// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    setdvar( "match_running", 1 );
    level._id_10A56 = _func_114();
    scripts\mp\utility\game::_id_F305();
    level.onlinegame = getdvarint( "onlinegame" );
    level.rankedmatch = level.onlinegame && !getdvarint( "xblive_privatematch" ) || getdvarint( "force_ranking" );
    scripts\mp\utility\game::_id_F7F1();
    level.script = tolower( getdvar( "mapname" ) );
    level.gametype = tolower( getdvar( "g_gametype" ) );
    level._id_115DA = [ "axis", "allies" ];
    level._id_C74B["allies"] = "axis";
    level._id_C74B["axis"] = "allies";
    level._id_BDCC = 0;
    level.teambased = 0;
    level.objectivebased = 0;
    level._id_6329 = 1;
    level.showingfinalkillcam = 0;
    level._id_11946 = getdvarint( "scr_tispawndelay" );

    if ( !isdefined( level._id_12AC9 ) )
        scripts\mp\tweakables::init();

    level._id_8865 = "halftime";
    level._id_AA1E = 0;
    level._id_1391F = "none";
    level._id_A9F1 = 0;
    level.placement["allies"] = [];
    level.placement["axis"] = [];
    level.placement["all"] = [];
    level._id_D706 = 3.5;
    level._id_D420 = [];
    _id_DEEC();

    if ( scripts\mp\utility\game::matchmakinggame() )
    {
        var_0 = " LB_MAP_" + getdvar( "ui_mapname" );
        var_1 = "";
        var_2 = "";
        var_2 = "LB_GB_TOTALXP_AT LB_GB_TOTALXP_LT LB_GB_WINS_AT LB_GB_WINS_LT LB_GB_KILLS_AT LB_GB_KILLS_LT LB_GB_ACCURACY_AT LB_ACCOLADES";
        var_1 = " LB_GM_" + level.gametype;

        if ( getdvarint( "g_hardcore" ) )
            var_1 += "_HC";

        precacheleaderboards( var_2 + var_1 + var_0 );
    }

    level._id_115C6["allies"] = 0;
    level._id_115C6["axis"] = 0;
    level._id_115C6["spectator"] = 0;
    level._id_1BE6["allies"] = 0;
    level._id_1BE6["axis"] = 0;
    level._id_1BE6["spectator"] = 0;
    level._id_AD8D["allies"] = 0;
    level._id_AD8D["axis"] = 0;
    level._id_C50B = [];
    level._id_8C2A["allies"] = 0;
    level._id_8C2A["axis"] = 0;
    var_3 = 9;
    _id_9694( var_3 );
}

_id_6360()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( var_0 ishost() )
        {
            var_1 = var_0;
            break;
        }
    }

    var_1 waittill( "disconnect" );
    thread scripts\mp\gamelogic::endgame( "draw", game["end_reason"]["host_ended_game"] );
}

_id_9694( var_0 )
{
    for ( var_1 = 0; var_1 < var_0; var_1++ )
    {
        var_2 = "team_" + var_1;
        level.placement[var_2] = [];
        level._id_115C6[var_2] = 0;
        level._id_1BE6[var_2] = 0;
        level._id_AD8D[var_2] = 0;
        level._id_8C2A[var_2] = 0;
    }
}

_id_DEEC()
{
    setomnvar( "ui_bomb_timer", 0 );

    if ( getdvar( "r_reflectionProbeGenerate" ) != "1" )
        setomnvar( "ui_nuke_end_milliseconds", 0 );

    setdvar( "ui_danger_team", "" );
    setdvar( "ui_inhostmigration", 0 );
    setdvar( "ui_override_halftime", 0 );
    setdvar( "camera_thirdPerson", getdvarint( "scr_thirdPerson" ) );
}

setupcallbacks()
{
    setdefaultcallbacks();
    scripts\mp\callbacksetup::setupdamageflags();
    scripts\mp\gametypes\common::setupcommoncallbacks();
    level.getspawnpoint = ::blank;
    level.onspawnplayer = scripts\mp\gametypes\common::onspawnplayer;
    level._id_C583 = ::blank;
    level.ontimelimit = scripts\mp\gamelogic::_id_500A;
    level._id_C539 = scripts\mp\gamelogic::_id_5008;
    level._id_C4E8 = scripts\mp\gamelogic::_id_5007;
    level._id_C564 = scripts\mp\gamelogic::_id_5009;
    level.onprecachegametype = ::blank;
    level.onstartgametype = ::blank;
    level._id_C577 = ::blank;
    level._id_A6A2 = scripts\mp\killstreaks\killstreaks_init::init;
    level._id_B3E7 = scripts\mp\matchevents::init;
    level._id_9994 = scripts\mp\intel::init;
    level._id_B3F8 = scripts\mp\matchrecording::init;
    level._id_13CA6 = scripts\mp\utility\game::_id_13CA1;
    level._id_97C2 = scripts\mp\agents\agent_utility::_id_97C2;
    level._id_F635 = scripts\mp\agents\agent_utility::_id_F290;
    level._id_190A = scripts\mp\utility\game::_validateattacker;
    level.agentfunc = scripts\mp\agents\agent_utility::agentfunc;
    level._id_7EC5 = scripts\mp\agents\agent_utility::_id_7EC5;
    level._id_184B = scripts\mp\spawnlogic::_id_184B;
}

setdefaultcallbacks()
{
    level.callbackstartgametype = scripts\mp\gamelogic::callback_startgametype;
    level.callbackplayerconnect = scripts\mp\playerlogic::callback_playerconnect;
    level.callbackplayerdisconnect = scripts\mp\playerlogic::callback_playerdisconnect;
    level.callbackplayerdamage = scripts\mp\damage::callback_playerdamage;
    level.callbackplayerimpaled = scripts\mp\damage::callback_playerimpaled;
    level.callbackplayerkilled = scripts\mp\damage::callback_playerkilled;
    level.callbackplayerlaststand = scripts\mp\damage::callback_playerlaststand;
    level.callbackplayermigrated = scripts\mp\playerlogic::callback_playermigrated;
    level.callbackhostmigration = scripts\mp\hostmigration::callback_hostmigration;
    level.callbackfinishweaponchange = scripts\mp\weapons::callback_finishweaponchange;
}

blank( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{

}

_id_11757()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        wait 3.0;
        var_0 = randomint( 6 );

        for ( var_1 = 0; var_1 < var_0; var_1++ )
        {
            iprintlnbold( var_0 );
            self shellshock( "frag_grenade_mp", 0.2 );
            wait 0.1;
        }
    }
}

_id_4F48( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 50; var_2++ )
        wait 0.05;
}

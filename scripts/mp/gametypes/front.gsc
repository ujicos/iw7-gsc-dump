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
        scripts\mp\utility\game::registerscorelimitdvar( level.gametype, 100 );
        scripts\mp\utility\game::registerroundlimitdvar( level.gametype, 2 );
        scripts\mp\utility\game::registerwinlimitdvar( level.gametype, 0 );
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
    level.onspawnplayer = ::onspawnplayer;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = scripts\mp\damage::gamemodemodifyplayerdamage;

    game["dialog"]["gametype"] = "frontline";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];
    else if ( getdvarint( "camera_thirdPerson" ) )
        game["dialog"]["gametype"] = "thirdp_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_diehard" ) )
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    else if ( getdvarint( "scr_" + level.gametype + "_promode" ) )
        game["dialog"]["gametype"] += "_pro";

    game["strings"]["overtime_hint"] = &"MP_FIRST_BLOOD";
    thread _id_C56E();
}

initializematchrules()
{
    scripts\mp\utility\game::setcommonrulesfrommatchdata();
    setdynamicdvar( "scr_front_enemyBaseKillReveal", getmatchrulesdata( "frontData", "enemyBaseKillReveal" ) );
    setdynamicdvar( "scr_front_friendlyBaseScore", getmatchrulesdata( "frontData", "friendlyBaseScore" ) );
    setdynamicdvar( "scr_front_midfieldScore", getmatchrulesdata( "frontData", "midfieldScore" ) );
    setdynamicdvar( "scr_front_enemyBaseScore", getmatchrulesdata( "frontData", "enemyBaseScore" ) );
    setdynamicdvar( "scr_front_promode", 0 );
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

    scripts\mp\utility\game::setobjectivetext( "allies", &"OBJECTIVES_FRONT" );
    scripts\mp\utility\game::setobjectivetext( "axis", &"OBJECTIVES_FRONT" );

    if ( level._id_10A56 )
    {
        scripts\mp\utility\game::setobjectivescoretext( "allies", &"OBJECTIVES_FRONT" );
        scripts\mp\utility\game::setobjectivescoretext( "axis", &"OBJECTIVES_FRONT" );
    }
    else
    {
        scripts\mp\utility\game::setobjectivescoretext( "allies", &"OBJECTIVES_FRONT_SCORE" );
        scripts\mp\utility\game::setobjectivescoretext( "axis", &"OBJECTIVES_FRONT_SCORE" );
    }

    scripts\mp\utility\game::setobjectivehinttext( "allies", &"OBJECTIVES_FRONT_HINT" );
    scripts\mp\utility\game::setobjectivehinttext( "axis", &"OBJECTIVES_FRONT_HINT" );
    level._id_92AD = "waypoint_capture_kill";
    level._id_92AC = "waypoint_capture_kill";
    _id_98CE();
    var_2[0] = level.gametype;
    scripts\mp\gameobjects::main( var_2 );
    _id_2892();
    thread _id_FA91();
    thread setupbaseareabrushes();
    level._id_112BF = 0;
}

updategametypedvars()
{
    scripts\mp\gametypes\common::updategametypedvars();
    level._id_654C = scripts\mp\utility\game::_id_5F6B( "enemyBaseKillReveal", 5, 0, 60 );
    level.friendlybasescore = scripts\mp\utility\game::_id_5F6B( "friendlyBaseScore", 1, 0, 25 );
    level.midfieldscore = scripts\mp\utility\game::_id_5F6B( "midfieldScore", 2, 0, 25 );
    level.enemybasescore = scripts\mp\utility\game::_id_5F6B( "enemyBaseScore", 1, 0, 25 );
}

_id_98CE()
{
    level.spawnmins = ( 0, 0, 0 );
    level.spawnmaxs = ( 0, 0, 0 );
    scripts\mp\spawnlogic::_id_F62D( "TDM" );
    scripts\mp\spawnlogic::addspawnpoints( "allies", "mp_front_spawn_allies" );
    scripts\mp\spawnlogic::addspawnpoints( "axis", "mp_front_spawn_axis" );
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
}

onspawnplayer()
{
    if ( isplayer( self ) )
    {
        scripts\mp\gametypes\common::onspawnplayer();
        self setclientomnvar( "ui_uplink_carrier_hud", 0 );
        self._id_940C = 0;
        self._id_94C5 = 0;
        self._id_C7B1 = 0;

        if ( isdefined( self._id_C79D ) )
            scripts\mp\utility\game::_id_C78F( self._id_C79D, self );

        self._id_130B7 = 0;
        self._id_C79D = undefined;
        thread _id_7402();
        thread _id_654F();

        foreach ( var_1 in level._id_13FC4 )
            var_1 _id_10110( self );
    }
}

getspawnpoint()
{
    var_0 = self.pers["team"];

    if ( game["switchedsides"] )
        var_0 = scripts\mp\utility\game::_id_8027( var_0 );

    if ( scripts\mp\spawnlogic::_id_100BA() )
    {
        var_1 = scripts\mp\spawnlogic::getteamspawnpoints( var_0 );
        var_2 = scripts\mp\spawnscoring::getspawnpoint( var_1 );
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
    var_5 = 0;

    if ( var_0._id_94C5 || var_1._id_940C )
    {
        var_1 thread scripts\mp\utility\game::_id_83B4( "enemy_base_kill", var_4 );
        var_5 = level.enemybasescore;
    }
    else if ( var_1._id_94C5 || var_0._id_940C )
    {
        var_1 thread scripts\mp\utility\game::_id_83B4( "friendly_base_kill", var_4 );
        var_5 = level.friendlybasescore;
    }
    else
    {
        var_1 thread scripts\mp\utility\game::_id_83B4( "midfield_kill", var_4 );
        var_5 = level.midfieldscore;
    }

    var_6 = game["teamScores"][var_1.pers["team"]] + var_5;
    var_7 = var_6 >= level._id_E763;

    if ( var_7 && level._id_E763 != 0 )
        var_5 = level._id_E763 - game["teamScores"][var_1.pers["team"]];

    if ( var_5 > 0 )
    {
        scripts\mp\gamescore::giveteamscoreforobjective( var_1.pers["team"], var_5, 0 );
        var_1 thread scripts\mp\rank::scoreeventpopup( "teamscore_notify_" + var_5 );
    }
}

_id_654C()
{
    level endon( "game_ended" );
    self endon( "death" );
    self notify( "EnemyBaseKillReveal" );
    self endon( "EnemyBaseKillReveal" );

    if ( isdefined( self._id_28A5 ) )
        scripts\mp\utility\game::_id_C78F( self._id_28A5, self );

    self._id_28A5 = scripts\mp\utility\game::_id_C795( self, "orange", scripts\mp\utility\game::_id_8027( self.team ), 0, 0, "perk" );

    if ( !isbot( self ) )
        scripts\mp\utility\game::_id_12E5( 5, 0, 0 );

    self _meth_8496( &"MP_FRONT_REVEALED" );
    wait( level._id_654C );
    scripts\mp\utility\game::_id_C78F( self._id_28A5, self );
    scripts\mp\utility\game::_id_12E4();
    self _meth_8497( 0 );
}

_id_FA91()
{
    level._id_13FC4 = [];

    if ( game["switchedsides"] )
    {
        level._id_1C30 = getentarray( "frontline_zone_allies", "targetname" );

        foreach ( var_1 in level._id_1C30 )
        {
            var_1.team = "axis";
            var_1 thread _id_7402();
            var_1 thread _id_654F();
            var_1 thread _id_654D();
        }

        thread _id_FAF5( level._id_1C30[0] );
        level._id_13FC4[level._id_13FC4.size] = level._id_1C30[0];
        level._id_26FE = getentarray( "frontline_zone_axis", "targetname" );

        if ( level._id_B335 == "mp_junk" )
        {
            var_3 = spawn( "trigger_radius", ( -1410, -2080, 240 ), 0, 1000, 600 );
            level._id_26FE[level._id_26FE.size] = var_3;
        }

        foreach ( var_1 in level._id_26FE )
        {
            var_1.team = "allies";
            var_1 thread _id_7402();
            var_1 thread _id_654F();
            var_1 thread _id_654D();
        }

        thread _id_FAF5( level._id_26FE[0] );
        level._id_13FC4[level._id_13FC4.size] = level._id_26FE[0];
    }
    else
    {
        level._id_1C30 = getentarray( "frontline_zone_allies", "targetname" );

        foreach ( var_1 in level._id_1C30 )
        {
            var_1.team = "allies";
            var_1 thread _id_7402();
            var_1 thread _id_654F();
            var_1 thread _id_654D();
        }

        thread _id_FAF5( level._id_1C30[0] );
        level._id_13FC4[level._id_13FC4.size] = level._id_1C30[0];
        level._id_26FE = getentarray( "frontline_zone_axis", "targetname" );

        if ( level._id_B335 == "mp_junk" )
        {
            var_3 = spawn( "trigger_radius", ( -1410, -2080, 240 ), 0, 1000, 600 );
            level._id_26FE[level._id_26FE.size] = var_3;
        }

        foreach ( var_1 in level._id_26FE )
        {
            var_1.team = "axis";
            var_1 thread _id_7402();
            var_1 thread _id_654F();
            var_1 thread _id_654D();
        }

        thread _id_FAF5( level._id_26FE[0] );
        level._id_13FC4[level._id_13FC4.size] = level._id_26FE[0];
    }
}

_id_FAF5( var_0 )
{
    var_1 = [];
    var_1[0] = var_0;

    if ( isdefined( var_0._id_0334 ) )
    {
        var_2 = getentarray( var_0._id_0334, "targetname" );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
            var_1[var_1.size] = var_2[var_3];
    }

    var_1 = mappatchborders( var_1, var_0._id_0334 );
    var_0.visuals = var_1;
}

mappatchborders( var_0, var_1 )
{
    if ( level._id_B335 == "mp_parkour" && var_1 == "front_vis_axis" )
    {
        var_2 = spawn( "script_origin", ( -1088, -1504, 136 ) );
        var_2.angles = ( 0, 180, 0 );
        var_2._id_0336 = var_1;
        var_0[var_0.size] = var_2;
        var_3 = spawn( "script_origin", ( -1088, -1440, 136 ) );
        var_3.angles = ( 0, 180, 0 );
        var_2._id_0336 = var_1;
        var_0[var_0.size] = var_3;
    }

    return var_0;
}

_id_7402()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !isplayer( var_0 ) )
            continue;

        if ( var_0.team != self.team )
            continue;

        if ( var_0._id_94C5 )
            continue;

        var_0 thread _id_7401( self );
    }
}

_id_7401( var_0 )
{
    self notify( "friendlyTriggerWatcher" );
    self endon( "friendlyTriggerWatcher" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( game["switchedsides"] )
    {
        if ( self.team == "allies" )
            var_1 = level._id_26FE;
        else
            var_1 = level._id_1C30;
    }
    else if ( self.team == "allies" )
        var_1 = level._id_1C30;
    else
        var_1 = level._id_26FE;

    for (;;)
    {
        self._id_94C5 = 0;

        foreach ( var_0 in var_1 )
        {
            if ( self istouching( var_0 ) )
            {
                self._id_94C5 = 1;
                break;
            }
        }

        if ( !self._id_94C5 || scripts\mp\utility\game::isinarbitraryup() )
        {
            if ( scripts\mp\utility\game::istrue( self._id_10902 ) )
                scripts\mp\gametypes\common::_id_E171();

            break;
        }

        wait 0.05;
    }
}

_id_654F()
{
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( isdefined( var_0.team ) && var_0.team == self.team )
            continue;

        if ( isalive( var_0 ) && isdefined( var_0.sessionstate ) && var_0.sessionstate != "spectator" || _id_D376( var_0 ) )
        {
            var_0._id_940C = 1;
            var_0 thread _id_654E( self );
        }
    }
}

_id_654E( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );

    if ( scripts\mp\utility\game::istrue( self._id_130B7 ) )
        return;

    for (;;)
    {
        if ( isdefined( self ) && self istouching( var_0 ) )
        {
            if ( !scripts\mp\utility\game::istrue( self._id_130B7 ) )
                thread _id_6267();
        }
        else
        {
            self._id_130B7 = 0;
            self._id_940C = 0;

            if ( isdefined( self._id_C79D ) )
                thread _id_55EB();

            break;
        }

        wait 0.05;
    }
}

_id_6267()
{
    self._id_130B7 = 1;
    self._id_C7B1 = gettime();
    self._id_C79D = scripts\mp\utility\game::_id_C795( self, "orange", scripts\mp\utility\game::_id_8027( self.team ), 0, 1, "perk" );

    if ( !isbot( self ) )
    {
        if ( isplayer( self ) )
            scripts\mp\utility\game::_id_12E5( 5, 0, 0 );
    }
}

_id_55EB()
{
    self._id_130B7 = 0;
    scripts\mp\utility\game::_id_C78F( self._id_C79D, self );
    self._id_C79D = undefined;

    if ( !isbot( self ) && isplayer( self ) )
        scripts\mp\utility\game::_id_12E4();
}

_id_654D()
{
    level endon( "game_ended" );

    for (;;)
    {
        if ( level._id_12A83.size > 0 )
        {
            foreach ( var_1 in level._id_12A83 )
                _id_89CD( var_1 );
        }

        if ( level._id_27EF.size > 0 )
        {
            foreach ( var_4 in level._id_27EF )
                _id_89CD( var_4 );
        }

        wait 0.1;
    }
}

_id_89CD( var_0 )
{
    if ( var_0.owner.team == self.team )
        return;

    if ( var_0 istouching( self ) )
    {
        if ( !isdefined( var_0._id_C79D ) )
            var_0._id_C79D = scripts\mp\utility\game::_id_C795( var_0, "orange", self.team, 0, 0, "lowest" );
    }
    else if ( isdefined( var_0._id_C79D ) )
    {
        scripts\mp\utility\game::_id_C78F( var_0._id_C79D, var_0 );
        var_0._id_C79D = undefined;
    }
    else
    {

    }
}

_id_D376( var_0 )
{
    if ( isdefined( var_0._id_110EA ) )
    {
        switch ( var_0._id_110EA )
        {
            case "remote_c8":
            case "venom":
            case "minijackal":
                return 1;
            default:
                return 0;
        }
    }

    return 0;
}

_id_10110( var_0 )
{
    var_1 = self.team;
    var_2 = undefined;
    var_3 = var_0.team;

    if ( !isdefined( var_3 ) )
        var_3 = "allies";

    var_4 = var_0 ismlgspectator();

    if ( var_4 )
        var_3 = var_0 _meth_813B();
    else if ( var_3 == "spectator" )
        var_3 = "allies";

    var_5 = level._id_28A0["friendly"];
    var_6 = level._id_28A0["enemy"];

    if ( var_3 == var_1 )
    {
        _id_1012A( self._id_1196, var_0 );
        _id_8EC1( self._id_1195, var_0 );
    }
    else
    {
        _id_1012A( self._id_1195, var_0 );
        _id_8EC1( self._id_1196, var_0 );
    }
}

_id_1012A( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2] _meth_8388( var_1 );
}

_id_8EC1( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_0[var_2] _meth_8429( var_1 );
}

_id_108CC()
{
    self._id_1196 = [];
    self._id_1195 = [];

    for ( var_0 = 1; var_0 < self.visuals.size; var_0++ )
    {
        var_1 = anglestoforward( self.visuals[var_0].angles );
        self._id_1196[self._id_1196.size] = spawnfx( level._id_28A0["friendly"], self.visuals[var_0].origin, var_1 );
        self._id_1196[self._id_1196.size - 1] _meth_82EC();
        triggerfx( self._id_1196[self._id_1196.size - 1] );
    }

    for ( var_0 = 1; var_0 < self.visuals.size; var_0++ )
    {
        var_1 = anglestoforward( self.visuals[var_0].angles );
        self._id_1195[self._id_1195.size] = spawnfx( level._id_28A0["enemy"], self.visuals[var_0].origin, var_1 );
        self._id_1195[self._id_1195.size - 1] _meth_82EC();
        triggerfx( self._id_1195[self._id_1195.size - 1] );
    }
}

_id_2892()
{
    level._id_28A0["friendly"] = loadfx( "vfx/core/mp/core/vfx_front_border_cyan.vfx" );
    level._id_28A0["enemy"] = loadfx( "vfx/core/mp/core/vfx_front_border_orng.vfx" );
}

_id_C56E()
{
    var_0 = 1;

    for (;;)
    {
        level waittill( "connected", var_1 );

        if ( var_0 )
        {
            foreach ( var_3 in level._id_13FC4 )
                var_3 _id_108CC();

            var_0 = 0;
        }

        foreach ( var_3 in level._id_13FC4 )
            var_3 _id_10110( var_1 );
    }
}

setupbaseareabrushes()
{
    var_0 = getbasearray( "front_zone_visual_allies_contest" );
    var_1 = getbasearray( "front_zone_visual_axis_contest" );
    var_2 = getbasearray( "front_zone_visual_allies_friend" );
    var_3 = getbasearray( "front_zone_visual_axis_friend" );
    var_4 = getbasearray( "front_zone_visual_allies_enemy" );
    var_5 = getbasearray( "front_zone_visual_axis_enemy" );
    hidebasebrushes( var_0 );
    hidebasebrushes( var_1 );
    hidebasebrushes( var_2 );
    hidebasebrushes( var_3 );
    hidebasebrushes( var_4 );
    hidebasebrushes( var_5 );
}

hidebasebrushes( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            var_0[var_1] hide();
    }
}

getbasearray( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    if ( !isdefined( var_1 ) || var_1.size == 0 )
        return undefined;

    return var_1;
}

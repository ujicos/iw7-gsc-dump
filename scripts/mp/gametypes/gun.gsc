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
        scripts\mp\utility\game::registertimelimitdvar( level.gametype, 10 );
        scripts\mp\utility\game::registerroundlimitdvar( level.gametype, 1 );
        scripts\mp\utility\game::registerwinlimitdvar( level.gametype, 0 );
        scripts\mp\utility\game::registernumlivesdvar( level.gametype, 0 );
        scripts\mp\utility\game::registerhalftimedvar( level.gametype, 0 );
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    setspecialloadout();
    updategametypedvars();
    _id_F733();
    setteammode( "ffa" );
    level.teambased = 0;
    level.ignorekdrstats = 1;
    level._id_5A62 = 1;
    level._id_112C2 = 0;
    level._id_112C4 = 0;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.onspawnplayer = ::onspawnplayer;
    level.getspawnpoint = ::getspawnpoint;
    level._id_C577 = ::_id_C577;
    level.ontimelimit = ::ontimelimit;
    level.onplayerscore = ::onplayerscore;
    level._id_3328 = ::_id_1D5F;
    level.modifyunifiedpointscallback = ::modifyunifiedpointscallback;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = scripts\mp\damage::gamemodemodifyplayerdamage;

    game["dialog"]["gametype"] = "gungame";
    game["dialog"]["offense_obj"] = "killall_intro";
    game["dialog"]["defense_obj"] = "ffa_intro";
}

_id_1D5F()
{
    return "gamemode";
}

initializematchrules()
{
    scripts\mp\utility\game::setcommonrulesfrommatchdata( 1 );
    setdynamicdvar( "scr_gun_setback", getmatchrulesdata( "gunData", "setback" ) );
    setdynamicdvar( "scr_gun_setbackStreak", getmatchrulesdata( "gunData", "setbackStreak" ) );
    setdynamicdvar( "scr_gun_killsPerWeapon", getmatchrulesdata( "gunData", "killsPerWeapon" ) );
    setdynamicdvar( "scr_gun_ladderIndex", getmatchrulesdata( "gunData", "ladderIndex" ) );
    setdynamicdvar( "scr_gun_promode", 0 );
}

onprecachegametype()
{

}

onstartgametype()
{
    setclientnamemode( "auto_change" );
    scripts\mp\utility\game::setobjectivetext( "allies", &"OBJECTIVES_DM" );
    scripts\mp\utility\game::setobjectivetext( "axis", &"OBJECTIVES_DM" );

    if ( level._id_10A56 )
    {
        scripts\mp\utility\game::setobjectivescoretext( "allies", &"OBJECTIVES_DM" );
        scripts\mp\utility\game::setobjectivescoretext( "axis", &"OBJECTIVES_DM" );
    }
    else
    {
        scripts\mp\utility\game::setobjectivescoretext( "allies", &"OBJECTIVES_DM_SCORE" );
        scripts\mp\utility\game::setobjectivescoretext( "axis", &"OBJECTIVES_DM_SCORE" );
    }

    scripts\mp\utility\game::setobjectivehinttext( "allies", &"OBJECTIVES_DM_HINT" );
    scripts\mp\utility\game::setobjectivehinttext( "axis", &"OBJECTIVES_DM_HINT" );
    _id_F736();
    scripts\mp\spawnlogic::_id_F62D( "FreeForAll" );
    level.spawnmins = ( 0, 0, 0 );
    level.spawnmaxs = ( 0, 0, 0 );
    scripts\mp\spawnlogic::addstartspawnpoints( "mp_dm_spawn_start", 1 );
    scripts\mp\spawnlogic::addspawnpoints( "allies", "mp_dm_spawn" );
    scripts\mp\spawnlogic::addspawnpoints( "allies", "mp_dm_spawn_secondary", 1, 1 );
    scripts\mp\spawnlogic::addspawnpoints( "axis", "mp_dm_spawn" );
    scripts\mp\spawnlogic::addspawnpoints( "axis", "mp_dm_spawn_secondary", 1, 1 );
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    var_0 = [];
    scripts\mp\gameobjects::main( var_0 );
    level.quickmessagetoall = 1;
    level.blockweapondrops = 1;
    level thread _id_C56E();
}

updategametypedvars()
{
    scripts\mp\gametypes\common::updategametypedvars();
    level._id_F654 = scripts\mp\utility\game::_id_5F6D( "setback", 1, 0, 5 );
    level._id_F656 = scripts\mp\utility\game::_id_5F6D( "setbackStreak", 0, 0, 5 );
    level._id_A681 = scripts\mp\utility\game::_id_5F6D( "killsPerWeapon", 1, 1, 5 );
    level._id_A7A4 = scripts\mp\utility\game::_id_5F6D( "ladderIndex", 1, 1, 4 );
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_A581();
        var_0._id_86D1 = 1;
        var_0.pers["class"] = "gamemode";
        var_0.pers["lastClass"] = "";
        var_0.class = var_0.pers["class"];
        var_0._id_A95C = var_0.pers["lastClass"];
        var_0.pers["gamemodeLoadout"] = level._id_86D6["axis"];
        var_0._id_86FB = 0;
        var_0._id_86FC = 0;
        var_0 thread _id_DE4B();
        var_0 thread _id_DE4F();
        var_0 scripts\mp\utility\game::_id_F6FF( level._id_86D4[0], 1 );
    }
}

_id_A581()
{
    self _meth_84ED( [ level._id_86D4[0], level._id_86D4[1] ] );
    var_0 = [];

    for (;;)
    {
        self waittill( "update_loadweapons" );
        var_0[0] = level._id_86D4[int( max( 0, self._id_86FB - level._id_F654 ) )];
        var_0[1] = level._id_86D4[self._id_86FB];
        var_0[2] = level._id_86D4[self._id_86FB + 1];
        self _meth_84ED( var_0 );
    }
}

getspawnpoint()
{
    if ( isplayer( self ) && self._id_86D1 )
    {
        self._id_86D1 = 0;

        if ( scripts\engine\utility::_id_4347() )
            scripts\mp\menus::_id_185F( "axis", 1 );
        else
            scripts\mp\menus::_id_185F( "allies", 1 );
    }

    if ( level.ingraceperiod )
    {
        var_0 = undefined;
        var_1 = scripts\mp\spawnlogic::getspawnpointarray( "mp_dm_spawn_start" );

        if ( var_1.size > 0 )
            var_0 = scripts\mp\spawnlogic::getspawnpoint_startspawn( var_1, 1 );

        if ( !isdefined( var_0 ) )
        {
            var_1 = scripts\mp\spawnlogic::getteamspawnpoints( self.team );
            var_0 = scripts\mp\spawnscoring::getstartspawnpoint_freeforall( var_1 );
        }

        return var_0;
    }

    var_1 = scripts\mp\spawnlogic::getteamspawnpoints( self.pers["team"] );
    var_2 = scripts\mp\spawnlogic::_id_81A9( self.pers["team"] );
    var_0 = scripts\mp\spawnscoring::getspawnpoint( var_1, var_2 );
    return var_0;
}

onspawnplayer()
{
    thread _id_13706();
    level notify( "spawned_player" );
}

_id_13706()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self waittill( "spawned_player" );

    if ( level._id_7669 && self._id_86FB == level._id_86D4.size )
        self._id_86FB = self._id_86FC;

    scripts\mp\utility\game::giveperk( "specialty_bling" );
    thread _id_8381( 1 );
}

_id_C577( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( level._id_7669 )
        return;

    if ( var_3 == "MOD_FALLING" || isdefined( var_1 ) && isplayer( var_1 ) )
    {
        var_10 = scripts\mp\weapons::_id_9F2D( var_4 );
        var_11 = scripts\mp\weapons::_id_9E6D( var_4 ) || scripts\mp\weapons::isaxeweapon( var_4 );

        if ( !isdefined( self._id_A7A3 ) )
            self._id_A7A3 = 1;
        else
            self._id_A7A3++;

        if ( var_3 == "MOD_FALLING" || var_1 == self || var_3 == "MOD_MELEE" && var_11 || self._id_A7A3 == level._id_F656 )
        {
            self._id_A7A3 = 0;
            self playlocalsound( "mp_war_objective_lost" );
            self notify( "update_loadweapons" );
            self._id_86FC = self._id_86FB;
            self._id_86FB = int( max( 0, self._id_86FB - level._id_F654 ) );

            if ( self._id_86FC > self._id_86FB )
            {
                scripts\mp\utility\game::incperstat( "setbacks", 1 );
                scripts\mp\persistence::statsetchild( "round", "setbacks", self.pers["setbacks"] );

                if ( isplayer( self ) )
                    scripts\mp\utility\game::_id_F6FB( self.pers["setbacks"] );

                thread scripts\mp\utility\game::_id_83B4( "dropped_gun_score", var_4, undefined, 0, 1 );
                scripts\mp\utility\game::_id_F6FF( level._id_86D4[self._id_86FB], 1 );
            }

            if ( var_3 == "MOD_MELEE" )
            {
                if ( self._id_86FC )
                    var_1 thread scripts\mp\utility\game::_id_83B4( "dropped_enemy_gun_rank" );

                var_1 updateknivesperminute();
                var_1 scripts\mp\awards::givemidmatchaward( "mode_gun_melee" );
                var_1 scripts\mp\utility\game::incperstat( "stabs", 1 );
                var_1 scripts\mp\persistence::statsetchild( "round", "stabs", var_1.pers["stabs"] );

                if ( isplayer( var_1 ) )
                    var_1 scripts\mp\utility\game::setextrascore0( var_1.pers["stabs"] );
            }

            if ( var_1 == self )
                return;
        }

        if ( var_1 != self && var_3 == "MOD_PISTOL_BULLET" || var_3 == "MOD_RIFLE_BULLET" || var_3 == "MOD_HEAD_SHOT" || var_3 == "MOD_PROJECTILE" || var_3 == "MOD_PROJECTILE_SPLASH" || var_3 == "MOD_IMPACT" || var_3 == "MOD_GRENADE" || var_3 == "MOD_GRENADE_SPLASH" || var_3 == "MOD_EXPLOSIVE" || var_3 == "MOD_MELEE" && !var_11 )
        {
            var_12 = getweaponbasename( var_4 );
            var_13 = getweaponbasename( var_1.primaryweapon );

            if ( var_12 != var_13 && !var_1 _id_9FE8( var_4 ) )
                return;

            if ( !isdefined( var_1._id_A7A5 ) )
                var_1._id_A7A5 = 1;
            else
                var_1._id_A7A5++;

            if ( var_1._id_A7A5 != level._id_A681 )
                return;

            var_1._id_A7A5 = 0;
            var_1._id_A7A3 = 0;
            var_1._id_86FC = var_1._id_86FB;
            var_1._id_86FB++;
            var_1 notify( "update_loadweapons" );
            var_1 thread scripts\mp\utility\game::_id_83B4( "gained_gun_score", var_4, undefined, 0, 1 );

            if ( var_1._id_86FB == level._id_86D4.size - 2 )
                level.kick_afk_check = 1;

            if ( var_1._id_86FB == level._id_86D4.size - 1 )
            {
                scripts\mp\utility\game::_id_D52E( "mp_enemy_obj_captured" );
                level thread scripts\mp\utility\game::_id_115DE( "callout_top_gun_rank", var_1 );
            }

            if ( var_1._id_86FB < level._id_86D4.size )
            {
                var_14 = scripts\mp\rank::getscoreinfovalue( "gained_gun_rank" );
                var_1 thread scripts\mp\rank::_id_EC42( var_14 );
                var_1 thread scripts\mp\rank::scoreeventpopup( "gained_gun_rank" );
                var_1 playlocalsound( "mp_war_objective_taken" );
                var_1 thread _id_8381( 0 );
                var_1 scripts\mp\utility\game::_id_F6FF( level._id_86D4[var_1._id_86FB], 1 );
            }

            if ( isdefined( var_1.lastgunrankincreasetime ) && gettime() - var_1.lastgunrankincreasetime < 5000 )
                var_1 scripts\mp\awards::givemidmatchaward( "mode_gun_quick_kill" );

            var_1.lastgunrankincreasetime = gettime();
        }
    }
}

_id_8381( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( !var_0 )
        scripts\engine\utility::_id_1C76( 0 );

    var_1 = _id_7FE5();
    var_1 = scripts\mp\weapons::_id_12E5C( var_1 );
    scripts\mp\utility\game::_id_12C6( var_1 );

    if ( var_0 )
    {
        self setspawnweapon( var_1 );

        foreach ( var_3 in self._id_13CA0 )
        {
            if ( var_3 != var_1 )
                thread scripts\mp\utility\game::_id_11494( var_3 );
        }
    }

    self.pers["primaryWeapon"] = var_1;
    self.primaryweapon = var_1;
    scripts\mp\utility\game::_id_141A( var_1 );
    var_5 = scripts\mp\weapons::isaxeweapon( var_1 );

    if ( var_5 )
    {
        self setweaponammoclip( var_1, 1 );
        thread _id_11495( "iw7_knife_mp_gg", 0 );
    }
    else if ( self._id_86FB != level._id_86D4.size - 1 )
    {
        self _meth_817C( var_1 );
        self giveweapon( "iw7_knife_mp_gg" );
        self _meth_84E8( "iw7_knife_mp_gg" );
    }

    if ( !var_0 )
    {
        var_6 = self._id_A978;
        thread _id_11495( var_6, 1 );
    }

    _id_8385( var_1 );
    scripts\mp\weapons::_id_12F48( var_1 );
    self._id_86FC = self._id_86FB;
}

_id_11495( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        if ( !scripts\mp\utility\game::_id_9DA5( var_0 ) )
            break;

        scripts\engine\utility::waitframe();
    }

    scripts\mp\utility\game::_id_141E( var_0 );

    if ( var_1 )
        scripts\engine\utility::_id_1C76( 1 );
}

_id_7FE5()
{
    var_0 = level._id_86D4[self._id_86FB];
    return var_0;
}

ontimelimit()
{
    var_0 = _id_7EFF();

    if ( !isdefined( var_0 ) || !var_0.size )
        thread scripts\mp\gamelogic::endgame( "tie", game["end_reason"]["time_limit_reached"] );
    else if ( var_0.size == 1 )
        thread scripts\mp\gamelogic::endgame( var_0[0], game["end_reason"]["time_limit_reached"] );
    else if ( var_0[var_0.size - 1]._id_86FB > var_0[var_0.size - 2]._id_86FB )
        thread scripts\mp\gamelogic::endgame( var_0[var_0.size - 1], game["end_reason"]["time_limit_reached"] );
    else
        thread scripts\mp\gamelogic::endgame( "tie", game["end_reason"]["time_limit_reached"] );
}

_id_7EFF()
{
    var_0 = -1;
    var_1 = [];

    foreach ( var_3 in level.players )
    {
        if ( isdefined( var_3._id_86FB ) && var_3._id_86FB >= var_0 )
        {
            var_0 = var_3._id_86FB;
            var_1[var_1.size] = var_3;
        }
    }

    return var_1;
}

_id_DE4B()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "reload" );
        self _meth_817C( self.primaryweapon );
    }
}

_id_DE4F()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        if ( scripts\mp\utility\game::isreallyalive( self ) && self.team != "spectator" && isdefined( self.primaryweapon ) && self getammocount( self.primaryweapon ) == 0 )
        {
            if ( getweaponbasename( self.primaryweapon ) == "iw7_glprox_mp" )
                self givemaxammo( self.primaryweapon );
            else
            {
                wait 2;
                self notify( "reload" );
                wait 1;
            }

            continue;
        }

        wait 0.05;
    }
}

_id_F733()
{
    level._id_86D4 = [];
    level._id_F1C3 = [];

    switch ( level._id_A7A4 )
    {
        case 1:
            level._id_86D4[0] = "rand_pistol";
            level._id_86D4[1] = "rand_shotgun";
            level._id_86D4[2] = "rand_smg";
            level._id_86D4[3] = "rand_assault";
            level._id_86D4[4] = "rand_lmg";
            level._id_86D4[5] = "rand_sniper";
            level._id_86D4[6] = "rand_smg";
            level._id_86D4[7] = "rand_assault";
            level._id_86D4[8] = "rand_lmg";
            level._id_86D4[9] = "rand_launcher";
            level._id_86D4[10] = "rand_shotgun";
            level._id_86D4[11] = "rand_smg";
            level._id_86D4[12] = "rand_assault";
            level._id_86D4[13] = "rand_shotgun";
            level._id_86D4[14] = "rand_assault";
            level._id_86D4[15] = "rand_sniper";
            level._id_86D4[16] = "iw7_g18_mpr";
            level._id_86D4[17] = "iw7_knife_mp";
            break;
        case 2:
            level._id_86D4[0] = "rand_pistol";
            level._id_86D4[1] = "rand_shotgun";
            level._id_86D4[2] = "rand_smg";
            level._id_86D4[3] = "rand_assault";
            level._id_86D4[4] = "rand_pistol";
            level._id_86D4[5] = "rand_shotgun";
            level._id_86D4[6] = "rand_smg";
            level._id_86D4[7] = "rand_assault";
            level._id_86D4[8] = "rand_pistol";
            level._id_86D4[9] = "rand_shotgun";
            level._id_86D4[10] = "rand_smg";
            level._id_86D4[11] = "rand_assault";
            level._id_86D4[12] = "rand_pistol";
            level._id_86D4[13] = "rand_shotgun";
            level._id_86D4[14] = "rand_smg";
            level._id_86D4[15] = "rand_assault";
            level._id_86D4[16] = "iw7_g18_mpr";
            level._id_86D4[17] = "iw7_knife_mp";
            break;
        case 3:
            level._id_86D4[0] = "rand_pistol";
            level._id_86D4[1] = "rand_assault";
            level._id_86D4[2] = "rand_lmg";
            level._id_86D4[3] = "rand_launcher";
            level._id_86D4[4] = "rand_sniper";
            level._id_86D4[5] = "rand_assault";
            level._id_86D4[6] = "rand_lmg";
            level._id_86D4[7] = "rand_launcher";
            level._id_86D4[8] = "rand_sniper";
            level._id_86D4[9] = "rand_assault";
            level._id_86D4[10] = "rand_lmg";
            level._id_86D4[11] = "rand_launcher";
            level._id_86D4[12] = "rand_sniper";
            level._id_86D4[13] = "rand_assault";
            level._id_86D4[14] = "rand_sniper";
            level._id_86D4[15] = "rand_assault";
            level._id_86D4[16] = "iw7_g18_mpl_single";
            level._id_86D4[17] = "iw7_knife_mp";
            break;
        case 4:
            level._id_86D4[0] = "rand_pistol_epic";
            level._id_86D4[1] = "rand_shotgun";
            level._id_86D4[2] = "rand_smg";
            level._id_86D4[3] = "rand_assault";
            level._id_86D4[4] = "rand_lmg";
            level._id_86D4[5] = "rand_sniper";
            level._id_86D4[6] = "rand_smg";
            level._id_86D4[7] = "rand_assault";
            level._id_86D4[8] = "rand_lmg";
            level._id_86D4[9] = "rand_smg";
            level._id_86D4[10] = "rand_shotgun";
            level._id_86D4[11] = "rand_smg";
            level._id_86D4[12] = "rand_assault";
            level._id_86D4[13] = "rand_shotgun";
            level._id_86D4[14] = "rand_assault";
            level._id_86D4[15] = "rand_sniper";
            level._id_86D4[16] = "rand_pistol_epic2";
            level._id_86D4[17] = "rand_melee_end_epic";
            break;
    }

    var_0 = level._id_86D4.size;
    setdynamicdvar( "scr_gun_scorelimit", var_0 );
    scripts\mp\utility\game::registerscorelimitdvar( level.gametype, var_0 );
}

_id_F736()
{
    level._id_F1C3 = [];
    _id_3218();

    for ( var_0 = 0; var_0 < level._id_86D4.size; var_0++ )
    {
        var_1 = level._id_86D4[var_0];

        if ( scripts\mp\utility\game::_id_9F7C( var_1, "rand_" ) )
        {
            level._id_86D4[var_0] = _id_80C7( var_1 );
            continue;
        }

        var_2 = scripts\mp\utility\game::_id_8234( level._id_86D4[var_0] );
        level._id_F1C3[var_2] = 1;
        var_3 = var_2;
        var_4 = 0;
        var_3 = _id_B93E( var_3, var_4 );
        level._id_86D4[var_0] = var_3;
    }

    level._id_F1C3 = undefined;
}

_id_80AF()
{
    var_0 = randomint( 120 );

    if ( var_0 > 100 )
        return "archetype_heavy";

    if ( var_0 > 80 )
        return "archetype_scout";

    if ( var_0 > 60 )
        return "archetype_assassin";

    if ( var_0 > 40 )
        return "archetype_engineer";

    if ( var_0 > 20 )
        return "archetype_sniper";

    return "archetype_assault";
}

setspecialloadout()
{
    level._id_86D6["axis"]["loadoutPrimary"] = "iw7_revolver";
    level._id_86D6["axis"]["loadoutPrimaryAttachment"] = "none";
    level._id_86D6["axis"]["loadoutPrimaryAttachment2"] = "none";
    level._id_86D6["axis"]["loadoutPrimaryCamo"] = "none";
    level._id_86D6["axis"]["loadoutPrimaryReticle"] = "none";
    level._id_86D6["axis"]["loadoutSecondary"] = "none";
    level._id_86D6["axis"]["loadoutSecondaryAttachment"] = "none";
    level._id_86D6["axis"]["loadoutSecondaryAttachment2"] = "none";
    level._id_86D6["axis"]["loadoutSecondaryCamo"] = "none";
    level._id_86D6["axis"]["loadoutSecondaryReticle"] = "none";
    level._id_86D6["axis"]["loadoutEquipment"] = "specialty_null";
    level._id_86D6["axis"]["loadoutOffhand"] = "none";
    level._id_86D6["axis"]["loadoutStreakType"] = "assault";
    level._id_86D6["axis"]["loadoutKillstreak1"] = "none";
    level._id_86D6["axis"]["loadoutKillstreak2"] = "none";
    level._id_86D6["axis"]["loadoutKillstreak3"] = "none";
    level._id_86D6["axis"]["loadoutPerks"] = [];
    level._id_86D6["axis"]["loadoutGesture"] = "playerData";
    level._id_86D6["axis"]["loadoutJuggernaut"] = 0;
    level._id_86D6["allies"] = level._id_86D6["axis"];
}

_id_3218()
{
    level._id_13C7C = [];
    var_0 = 0;

    for (;;)
    {
        var_1 = tablelookupbyrow( "mp/gunGameWeapons.csv", var_0, 0 );

        if ( var_1 == "" )
            break;

        if ( !isdefined( level._id_13C7C[var_1] ) )
            level._id_13C7C[var_1] = [];

        var_2 = tablelookupbyrow( "mp/gunGameWeapons.csv", var_0, 5 );

        if ( var_2 == "" || getdvarint( var_2, 0 ) == 1 )
        {
            var_3 = [];
            var_3["weapon"] = tablelookupbyrow( "mp/gunGameWeapons.csv", var_0, 1 );
            var_3["min"] = int( tablelookupbyrow( "mp/gunGameWeapons.csv", var_0, 2 ) );
            var_3["max"] = int( tablelookupbyrow( "mp/gunGameWeapons.csv", var_0, 3 ) );
            var_3["perk"] = tablelookupbyrow( "mp/gunGameWeapons.csv", var_0, 4 );
            var_3["variant"] = getlootvariant( var_3["weapon"] );
            var_3["allowed"] = int( tablelookupbyrow( "mp/gunGameWeapons.csv", var_0, 7 ) );

            if ( level._id_A7A4 == 4 && var_3["variant"] == "" )
            {
                var_0++;
                continue;
            }

            level._id_13C7C[var_1][level._id_13C7C[var_1].size] = var_3;
        }

        var_0++;
    }
}

_id_80C7( var_0 )
{
    var_1 = level._id_13C7C[var_0];

    if ( isdefined( var_1 ) && var_1.size > 0 )
    {
        var_2 = "";
        var_3 = undefined;
        var_4 = 0;

        for (;;)
        {
            var_5 = randomintrange( 0, var_1.size );
            var_3 = var_1[var_5];
            var_6 = scripts\mp\utility\game::_id_8234( var_3["weapon"] );
            var_7 = 1;

            if ( level._id_A7A4 == 4 )
                var_7 = var_3["allowed"];

            if ( !isdefined( level._id_F1C3[var_6] ) && var_7 || var_4 > var_1.size )
            {
                level._id_F1C3[var_6] = 1;
                var_2 = var_3["weapon"];

                for ( var_8 = 0; var_8 < level._id_13C7C[var_0].size; var_8++ )
                {
                    if ( level._id_13C7C[var_0][var_8]["weapon"] == var_2 )
                    {
                        level._id_13C7C[var_0] = scripts\mp\utility\game::_id_22B0( level._id_13C7C[var_0], var_8 );
                        break;
                    }
                }

                break;
            }

            var_4++;
        }

        if ( var_2 == var_6 )
        {
            var_9 = randomintrange( var_3["min"], var_3["max"] + 1 );
            var_2 = _id_B93E( var_2, var_9, var_3 );
        }

        return var_2;
    }
    else
        return "none";
}

getlootvariant( var_0 )
{
    var_1 = [];
    var_2 = "";
    var_3 = scripts\mp\utility\game::_id_8234( var_0 );
    var_1 = tablelookup( "mp/gunGameWeapons.csv", 1, var_3, 6 );

    if ( var_1.size > 0 )
    {
        if ( var_1.size > 1 )
        {
            var_1 = strtok( var_1, "+" );
            var_2 = scripts\engine\utility::_id_DC6B( var_1 );
        }
        else
            var_2 = var_1[0];

        var_4 = "mp/loot/weapon/" + var_3 + ".csv";
        var_5 = tablelookup( var_4, 0, int( var_2 ), 1 );
        var_6 = tablelookup( "mp/loot/iw7_weapon_loot_master.csv", 1, var_5, 1 );

        if ( var_6 == "" )
            var_2 = "";
    }

    return var_2;
}

checkmk2variant( var_0, var_1 )
{
    var_2 = tablelookup( var_0, 0, int( var_1 ), 1 );

    if ( issubstr( var_2, "mk2stub" ) )
        return var_1;

    var_3 = randomint( 100 );

    if ( var_3 < 25 )
    {
        var_4 = int( var_1 );
        var_4 += 32;
        var_1 = tablelookup( var_0, 0, var_4, 0 );
    }

    return var_1;
}

_id_B93E( var_0, var_1, var_2 )
{
    var_3 = [];
    var_4 = 0;
    var_5 = level._id_A7A4 == 4;
    var_6 = "";

    if ( isdefined( var_2 ) && var_2["variant"] != "" )
        var_6 = var_2["variant"];

    var_7 = var_6 != "";
    var_8 = "mp/loot/weapon/" + var_0 + ".csv";

    if ( var_1 > 0 )
    {
        var_9 = scripts\mp\utility\game::_id_8217( var_0 );

        if ( var_9.size > 0 )
        {
            var_10 = _id_81F5( var_9, var_5, var_0, var_8, var_6 );
            var_11 = var_10.size;

            for ( var_12 = 0; var_12 < var_1; var_12++ )
            {
                var_13 = "";

                while ( var_13 == "" && var_11 > 0 )
                {
                    var_11--;
                    var_14 = randomint( var_10.size );

                    if ( _id_248A( var_10[var_14], var_3 ) )
                    {
                        var_13 = var_10[var_14];
                        var_3[var_3.size] = var_13;

                        if ( scripts\mp\utility\game::_id_7DE1( var_13 ) == "rail" )
                            var_4 = 1;
                    }
                }
            }
        }
    }

    var_15 = "none";
    var_16 = "none";

    if ( scripts\mp\utility\game::istrue( var_5 ) && var_7 )
        var_17 = scripts\mp\class::_id_3224( var_0, var_3, var_15, var_16, int( var_6 ) );
    else
        var_17 = scripts\mp\class::_id_3224( var_0, var_3, var_15, var_16 );

    return var_17;
}

_id_248A( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_0 == var_1[var_2] || !scripts\mp\utility\game::_id_249D( var_0, var_1[var_2] ) )
            return 0;
    }

    return 1;
}

_id_81F5( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    var_6 = [];
    var_7 = [];

    if ( scripts\mp\utility\game::istrue( var_1 ) && var_4 != "" )
    {
        var_6 = tablelookup( var_3, 0, int( var_4 ), 17 );
        var_6 = strtok( var_6, "+" );
        var_7 = tablelookup( var_3, 0, int( var_4 ), 18 );
        var_7 = strtok( var_7, "+" );

        for ( var_8 = 0; var_8 < var_6.size; var_8++ )
            var_6[var_8] = scripts\mp\utility\game::_id_2494( var_6[var_8] );
    }

    foreach ( var_10 in var_0 )
    {
        var_11 = scripts\mp\utility\game::_id_7DE1( var_10 );

        if ( var_7.size > 0 && scripts\engine\utility::array_contains( var_7, var_11 ) )
            continue;

        if ( var_6.size > 0 && scripts\engine\utility::array_contains( var_6, var_10 ) )
            continue;

        switch ( var_10 )
        {
            case "silencer":
                break;
            default:
                var_5[var_5.size] = var_10;
        }
    }

    return var_5;
}

_id_8385( var_0 )
{
    var_1 = "primary";
    var_2 = _id_0AE2::_id_808C( var_1 );

    if ( isdefined( var_2 ) )
        _id_0AE2::_id_E15E( var_2 );

    if ( scripts\mp\weapons::_id_9E6D( var_0 ) || scripts\mp\weapons::isaxeweapon( var_0 ) )
    {
        scripts\mp\utility\game::giveperk( "specialty_scavenger" );
        scripts\mp\utility\game::giveperk( "specialty_pitcher" );
        _id_0AE2::_id_8397( "power_bioSpike", var_1, undefined, undefined, 1 );
    }
}

_id_9FE8( var_0 )
{
    return var_0 == "throwingknifec4_mp";
}

onplayerscore( var_0, var_1, var_2 )
{
    var_1 scripts\mp\utility\game::incperstat( "gamemodeScore", var_2, 1 );
    var_3 = var_1 scripts\mp\utility\game::getpersstat( "gamemodeScore" );
    var_1 scripts\mp\persistence::statsetchild( "round", "gamemodeScore", var_3 );
    var_4 = 0;

    if ( var_0 == "gained_gun_score" )
        var_4 = 1;
    else if ( var_0 == "dropped_gun_score" )
    {
        var_5 = level._id_F654;
        var_4 = var_5 * -1;
    }
    else if ( var_0 == "assist_ffa" || var_0 == "kill" )
        var_1 scripts\mp\utility\game::_id_316C( "earned_score_buffered", var_2 );

    return var_4;
}

updateknivesperminute()
{
    if ( !isdefined( self.knivesperminute ) )
    {
        self.numknives = 0;
        self.knivesperminute = 0;
    }

    self.numknives++;

    if ( scripts\mp\utility\game::_id_7FB9() < 1 )
        return;

    self.knivesperminute = self.numknives / scripts\mp\utility\game::_id_7FB9();
}

modifyunifiedpointscallback( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) && ( var_3 == "iw7_knife_mp_gg" || var_3 == "iw7_knife_mp" ) )
    {
        if ( isdefined( var_2 ) && isdefined( var_2.knivesperminute ) && var_2.knivesperminute >= 10 )
            return 0;
    }

    return var_0;
}

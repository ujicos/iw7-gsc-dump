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
        scripts\mp\utility\game::registerscorelimitdvar( level.gametype, 65 );
        scripts\mp\utility\game::registertimelimitdvar( level.gametype, 10 );
        scripts\mp\utility\game::registerroundlimitdvar( level.gametype, 1 );
        scripts\mp\utility\game::registerwinlimitdvar( level.gametype, 1 );
        scripts\mp\utility\game::registernumlivesdvar( level.gametype, 0 );
        scripts\mp\utility\game::registerhalftimedvar( level.gametype, 0 );
        level._id_B40E = 0;
        level.matchrules_damagemultiplier = 0;
        level.matchrules_vampirism = 0;
    }

    _id_F7F4();
    level.teambased = 1;
    level._id_C81E = 500;
    level.onprecachegametype = ::onprecachegametype;
    level.onstartgametype = ::onstartgametype;
    level.getspawnpoint = ::getspawnpoint;
    level.onspawnplayer = ::onspawnplayer;
    level.onnormaldeath = ::onnormaldeath;
    level._id_4C85 = ::_id_10449;
    level._id_4854 = ::_id_4854;
    level._id_CB4B = ::_id_CB4B;
    level._id_92B5 = ::_id_92B5;
    level._id_C2C6 = ::_id_C2C6;
    level._id_112C2 = 0;
    level._id_112C4 = 0;
    level._id_13264 = "littlebird_neutral_mp";
    level._id_1307A = [];
    level._id_61C0 = 1;
    level._id_6DE5 = 1;

    if ( level.matchrules_damagemultiplier || level.matchrules_vampirism )
        level.modifyplayerdamage = scripts\mp\damage::gamemodemodifyplayerdamage;

    game["dialog"]["gametype"] = "hunted";

    if ( getdvarint( "g_hardcore" ) )
        game["dialog"]["gametype"] = "hc_" + game["dialog"]["gametype"];

    game["dialog"]["offense_obj"] = "sotf_hint";
    game["dialog"]["defense_obj"] = "sotf_hint";
}

initializematchrules()
{
    scripts\mp\utility\game::setcommonrulesfrommatchdata();
    setdynamicdvar( "scr_sotf_crateamount", getmatchrulesdata( "sotfData", "crateAmount" ) );
    setdynamicdvar( "scr_sotf_crategunamount", getmatchrulesdata( "sotfData", "crateGunAmount" ) );
    setdynamicdvar( "scr_sotf_cratetimer", getmatchrulesdata( "sotfData", "crateDropTimer" ) );
    setdynamicdvar( "scr_sotf_roundlimit", 1 );
    scripts\mp\utility\game::registerroundlimitdvar( "sotf", 1 );
    setdynamicdvar( "scr_sotf_winlimit", 1 );
    scripts\mp\utility\game::registerwinlimitdvar( "sotf", 1 );
    setdynamicdvar( "scr_sotf_halftime", 0 );
    scripts\mp\utility\game::registerhalftimedvar( "sotf", 0 );
    setdynamicdvar( "scr_sotf_promode", 0 );
}

onprecachegametype()
{
    level._effect["signal_chest_drop"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._effect["signal_chest_drop_mover"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
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

    var_2 = &"OBJECTIVES_WAR";
    var_3 = &"OBJECTIVES_WAR_SCORE";
    var_4 = &"OBJECTIVES_WAR_HINT";
    scripts\mp\utility\game::setobjectivetext( "allies", var_2 );
    scripts\mp\utility\game::setobjectivetext( "axis", var_2 );

    if ( level._id_10A56 )
    {
        scripts\mp\utility\game::setobjectivescoretext( "allies", var_2 );
        scripts\mp\utility\game::setobjectivescoretext( "axis", var_2 );
    }
    else
    {
        scripts\mp\utility\game::setobjectivescoretext( "allies", var_3 );
        scripts\mp\utility\game::setobjectivescoretext( "axis", var_3 );
    }

    scripts\mp\utility\game::setobjectivehinttext( "allies", var_4 );
    scripts\mp\utility\game::setobjectivehinttext( "axis", var_4 );
    _id_98CE();
    var_5 = [];
    scripts\mp\gameobjects::main( var_5 );
    level thread _id_10440();
}

_id_98CE()
{
    scripts\mp\spawnlogic::_id_F62D( "TDM" );
    level.spawnmins = ( 0, 0, 0 );
    level.spawnmaxs = ( 0, 0, 0 );
    scripts\mp\spawnlogic::addstartspawnpoints( "mp_tdm_spawn_allies_start" );
    scripts\mp\spawnlogic::addstartspawnpoints( "mp_tdm_spawn_axis_start" );
    scripts\mp\spawnlogic::addspawnpoints( "allies", "mp_tdm_spawn" );
    scripts\mp\spawnlogic::addspawnpoints( "axis", "mp_tdm_spawn" );
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
}

_id_F7F4()
{
    _id_50A2();
    var_0 = _id_80C5( level._id_CBDF );
    var_1 = scripts\mp\utility\game::_id_8234( var_0["name"] );
    var_2 = tablelookup( "mp/sotfWeapons.csv", 2, var_1, 0 );
    setomnvar( "ui_sotf_pistol", int( var_2 ) );
    level._id_10447["axis"]["loadoutPrimary"] = "none";
    level._id_10447["axis"]["loadoutPrimaryAttachment"] = "none";
    level._id_10447["axis"]["loadoutPrimaryAttachment2"] = "none";
    level._id_10447["axis"]["loadoutPrimaryCamo"] = "none";
    level._id_10447["axis"]["loadoutPrimaryReticle"] = "none";
    level._id_10447["axis"]["loadoutSecondary"] = var_0["name"];
    level._id_10447["axis"]["loadoutSecondaryAttachment"] = "none";
    level._id_10447["axis"]["loadoutSecondaryAttachment2"] = "none";
    level._id_10447["axis"]["loadoutSecondaryCamo"] = "none";
    level._id_10447["axis"]["loadoutSecondaryReticle"] = "none";
    level._id_10447["axis"]["loadoutEquipment"] = "throwingknife_mp";
    level._id_10447["axis"]["loadoutOffhand"] = "flash_grenade_mp";
    level._id_10447["axis"]["loadoutStreakType"] = "assault";
    level._id_10447["axis"]["loadoutKillstreak1"] = "none";
    level._id_10447["axis"]["loadoutKillstreak2"] = "none";
    level._id_10447["axis"]["loadoutKillstreak3"] = "none";
    level._id_10447["axis"]["loadoutJuggernaut"] = 0;
    level._id_10447["axis"]["loadoutPerks"] = [ "specialty_longersprint", "specialty_extra_deadly" ];
    level._id_10447["allies"] = level._id_10447["axis"];
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
        var_2 = scripts\mp\spawnscoring::getspawnpoint( var_1 );
    }

    return var_2;
}

onspawnplayer()
{
    self.pers["class"] = "gamemode";
    self.pers["lastClass"] = "";
    self.class = self.pers["class"];
    self._id_A95C = self.pers["lastClass"];
    self.pers["gamemodeLoadout"] = level._id_10447[self.pers["team"]];
    level notify( "sotf_player_spawned", self );
    self._id_C400 = undefined;
    self._id_BF24 = undefined;
    thread _id_13706();
}

_id_13706()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self waittill( "giveLoadout" );
    var_0 = self getcurrentweapon();
    self setweaponammostock( var_0, 0 );
    self._id_C400 = var_0;
    thread _id_CB4B();
}

onplayerscore( var_0, var_1 )
{
    if ( var_0 == "kill" )
    {
        var_2 = scripts\mp\rank::getscoreinfovalue( "score_increment" );
        return var_2;
    }

    return 0;
}

onnormaldeath( var_0, var_1, var_2, var_3, var_4 )
{
    scripts\mp\gametypes\common::onnormaldeath( var_0, var_1, var_2, var_3, var_4 );
    var_1 _id_CA68();
}

_id_10440()
{
    level thread _id_10DF0();
}

_id_10DF0()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 = getdvarint( "scr_sotf_crateamount", 1 );
    var_1 = getdvarint( "scr_sotf_cratetimer", 30 );
    level waittill( "sotf_player_spawned", var_2 );

    for (;;)
    {
        if ( !isalive( var_2 ) )
        {
            var_2 = _id_6CBD( level.players );

            if ( !isdefined( var_2 ) )
                continue;
        }
        else
        {
            while ( isalive( var_2 ) )
            {
                if ( level._id_61C0 )
                {
                    for ( var_3 = 0; var_3 < var_0; var_3++ )
                        level thread _id_10839( var_2 );

                    level thread _id_1011A( "sotf_crate_incoming" );
                    wait( var_1 );
                    continue;
                }

                wait 0.05;
            }
        }
    }
}

_id_1011A( var_0 )
{
    foreach ( var_2 in level.players )
        var_2 thread scripts\mp\hud_message::showsplash( var_0 );
}

_id_6CBD( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( isalive( var_2 ) )
            return var_2;
    }

    level waittill( "sotf_player_spawned", var_4 );
    return var_4;
}

_id_10839( var_0 )
{
    var_1 = scripts\engine\utility::_id_8180( "sotf_chest_spawnpoint", "targetname" );

    if ( level._id_6DE5 )
    {
        var_2 = _id_7E1D( var_1 );
        level._id_6DE5 = 0;
    }
    else
        var_2 = _id_80C0( var_1 );

    if ( isdefined( var_2 ) )
    {
        _id_D482( var_2 );
        level thread scripts\mp\killstreaks\airdrop::_id_5857( var_0, var_2, randomfloat( 360 ), "airdrop_sotf" );
    }
}

_id_D482( var_0 )
{
    var_1 = var_0 + ( 0, 0, 30 );
    var_2 = var_0 + ( 0, 0, -1000 );
    var_3 = bullettrace( var_1, var_2, 0, undefined );
    var_4 = var_3["position"] + ( 0, 0, 1 );
    var_5 = var_3["entity"];

    if ( isdefined( var_5 ) )
    {
        for ( var_6 = var_5 _meth_8138(); isdefined( var_6 ); var_6 = var_5 _meth_8138() )
            var_5 = var_6;
    }

    if ( isdefined( var_5 ) )
    {
        var_7 = spawn( "script_model", var_4 );
        var_7 setmodel( "tag_origin" );
        var_7.angles = ( 90, randomintrange( -180, 179 ), 0 );
        var_7 linkto( var_5 );
        thread _id_D4BE( scripts\engine\utility::_id_7ECB( "signal_chest_drop_mover" ), var_7 );
    }
    else
        playfx( scripts\engine\utility::_id_7ECB( "signal_chest_drop" ), var_4 );
}

_id_D4BE( var_0, var_1 )
{
    level endon( "game_ended" );
    wait 0.05;
    playfxontag( var_0, var_1, "tag_origin" );
    wait 6;
    stopfxontag( var_0, var_1, "tag_origin" );
    wait 0.05;
    var_1 delete();
}

_id_7E1D( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;

    foreach ( var_4 in var_0 )
    {
        var_5 = distance2dsquared( level.mapcenter, var_4.origin );

        if ( !isdefined( var_1 ) || var_5 < var_2 )
        {
            var_1 = var_4;
            var_2 = var_5;
        }
    }

    level._id_1307A[level._id_1307A.size] = var_1.origin;
    return var_1.origin;
}

_id_80C0( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = 0;

        if ( isdefined( level._id_1307A ) && level._id_1307A.size > 0 )
        {
            foreach ( var_5 in level._id_1307A )
            {
                if ( var_0[var_2].origin == var_5 )
                {
                    var_3 = 1;
                    break;
                }
            }

            if ( var_3 )
                continue;

            var_1[var_1.size] = var_0[var_2].origin;
            continue;
        }

        var_1[var_1.size] = var_0[var_2].origin;
    }

    if ( var_1.size > 0 )
    {
        var_7 = randomint( var_1.size );
        var_8 = var_1[var_7];
        level._id_1307A[level._id_1307A.size] = var_8;
        return var_8;
    }

    level._id_61C0 = 0;
    return undefined;
}

_id_50A2()
{
    var_0 = [];
    var_1 = [];

    for ( var_2 = 0; tablelookupbyrow( "mp/sotfWeapons.csv", var_2, 0 ) != ""; var_2++ )
    {
        var_3 = tablelookupbyrow( "mp/sotfWeapons.csv", var_2, 2 );
        var_4 = tablelookupbyrow( "mp/sotfWeapons.csv", var_2, 1 );
        var_5 = _id_9F3D( var_3 );

        if ( isdefined( var_4 ) && var_5 && var_4 == "weapon_pistol" )
        {
            var_6 = 30;
            var_0[var_0.size]["name"] = var_3;
            var_0[var_0.size - 1]["weight"] = var_6;
            continue;
        }

        if ( isdefined( var_4 ) && var_5 && ( var_4 == "weapon_shotgun" || var_4 == "weapon_smg" || var_4 == "weapon_assault" || var_4 == "weapon_sniper" || var_4 == "weapon_dmr" || var_4 == "weapon_lmg" || var_4 == "weapon_projectile" ) )
        {
            var_6 = 0;

            switch ( var_4 )
            {
                case "weapon_shotgun":
                    var_6 = 35;
                    break;
                case "weapon_assault":
                case "weapon_smg":
                    var_6 = 25;
                    break;
                case "weapon_dmr":
                case "weapon_sniper":
                    var_6 = 15;
                    break;
                case "weapon_lmg":
                    var_6 = 10;
                    break;
                case "weapon_projectile":
                    var_6 = 30;
                    break;
            }

            var_1[var_1.size]["name"] = var_3 + "_mp";
            var_1[var_1.size - 1]["group"] = var_4;
            var_1[var_1.size - 1]["weight"] = var_6;
            continue;
        }

        continue;
    }

    var_1 = _id_10437( var_1 );
    level._id_CBDF = var_0;
    level._id_13C73 = var_1;
}

_id_10449( var_0, var_1 )
{
    scripts\mp\killstreaks\airdrop::addcratetype( "airdrop_sotf", "sotf_weapon", 100, ::_id_1044A, var_0, var_0, &"KILLSTREAKS_HINTS_WEAPON_PICKUP" );
}

_id_1044A( var_0 )
{
    self endon( "death" );
    self endon( "restarting_physics" );
    level endon( "game_ended" );

    if ( isdefined( game["strings"][self._id_485F + "_hint"] ) )
        var_1 = game["strings"][self._id_485F + "_hint"];
    else
        var_1 = &"PLATFORM_GET_KILLSTREAK";

    var_2 = "icon_hunted";
    scripts\mp\killstreaks\airdrop::_id_485D( var_1, var_2 );
    thread scripts\mp\killstreaks\airdrop::_id_484E();
    childthread _id_4866( 60 );
    childthread _id_D3C2();
    var_3 = 0;
    var_4 = getdvarint( "scr_sotf_crategunamount", 6 );

    for (;;)
    {
        self waittill( "captured", var_5 );
        var_5 playlocalsound( "ammo_crate_use" );
        var_6 = _id_80C5( level._id_13C73 );
        var_6 = _id_80B1( var_6 );
        var_7 = var_5._id_A978;
        var_8 = var_5 getammocount( var_7 );

        if ( var_6 == var_7 )
        {
            var_5 _meth_817C( var_6 );
            var_5 setweaponammostock( var_6, var_8 );
        }
        else
        {
            if ( isdefined( var_7 ) && var_7 != "none" )
            {
                var_9 = var_5 dropitem( var_7 );

                if ( isdefined( var_9 ) && var_8 > 0 )
                    var_9._id_0336 = "dropped_weapon";
            }

            var_5 giveweapon( var_6, 0, 0, 0, 1 );
            var_5 setweaponammostock( var_6, 0 );
            var_5 scripts\mp\utility\game::_id_141B( var_6 );

            if ( var_5 getweaponammoclip( var_6 ) == 1 )
                var_5 setweaponammostock( var_6, 1 );

            var_5._id_C400 = var_6;
        }

        var_3++;
        var_4 -= 1;

        if ( var_4 > 0 )
        {
            foreach ( var_5 in level.players )
            {
                scripts\mp\entityheadicons::_id_F73D( var_5, "blitz_time_0" + var_4 + "_blue", ( 0, 0, 24 ), 14, 14, undefined, undefined, undefined, undefined, undefined, 0 );
                self._id_4853 = "blitz_time_0" + var_4 + "_blue";
            }
        }

        if ( self._id_485F == "sotf_weapon" && var_3 == getdvarint( "scr_sotf_crategunamount", 6 ) )
            scripts\mp\killstreaks\airdrop::_id_51AA();
    }
}

_id_4866( var_0 )
{
    wait( var_0 );

    while ( isdefined( self._id_9B04 ) && self._id_9B04 )
        scripts\engine\utility::waitframe();

    scripts\mp\killstreaks\airdrop::_id_51AA();
}

_id_D3C2()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isdefined( var_0 ) )
            continue;

        scripts\mp\entityheadicons::_id_F73D( var_0, self._id_4853, ( 0, 0, 24 ), 14, 14, undefined, undefined, undefined, undefined, undefined, 0 );
    }
}

_id_4854( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_1307A.size; var_1++ )
    {
        if ( var_0 != level._id_1307A[var_1] )
            continue;

        level._id_1307A = scripts\engine\utility::array_remove( level._id_1307A, var_0 );
    }

    level._id_61C0 = 1;
}

_id_9F3D( var_0 )
{
    var_1 = tablelookup( "mp/sotfWeapons.csv", 2, var_0, 3 );
    var_2 = tablelookup( "mp/sotfWeapons.csv", 2, var_0, 4 );

    if ( var_1 == "TRUE" && ( var_2 == "" || getdvarint( var_2, 0 ) == 1 ) )
        return 1;

    return 0;
}

_id_80C5( var_0 )
{
    var_1 = _id_F674( var_0 );
    var_2 = randomint( level._id_13CA7["sum"] );
    var_3 = undefined;

    for ( var_4 = 0; var_4 < var_1.size; var_4++ )
    {
        if ( !var_1[var_4]["weight"] )
            continue;

        if ( var_1[var_4]["weight"] > var_2 )
        {
            var_3 = var_1[var_4];
            break;
        }
    }

    return var_3;
}

_id_80B1( var_0 )
{
    var_1 = [];
    var_2 = [];
    var_3 = [];
    var_4 = scripts\mp\utility\game::_id_8234( var_0["name"] );
    var_5 = scripts\mp\utility\game::_id_8217( var_4 );

    if ( var_5.size > 0 )
    {
        var_6 = randomint( 5 );

        for ( var_7 = 0; var_7 < var_6; var_7++ )
        {
            var_1 = _id_81F5( var_0, var_2, var_5 );

            if ( var_1.size == 0 )
                break;

            var_8 = randomint( var_1.size );
            var_2[var_2.size] = var_1[var_8];
            var_9 = scripts\mp\utility\game::_id_2496( var_1[var_8], var_4 );
            var_3[var_3.size] = var_9;
        }

        var_10 = scripts\mp\utility\game::_id_8225( var_0["name"] );

        if ( var_10 == "weapon_dmr" || var_10 == "weapon_sniper" || var_4 == "iw7_ripper" )
        {
            var_11 = 0;

            foreach ( var_13 in var_2 )
            {
                if ( scripts\mp\utility\game::_id_7DE1( var_13 ) == "rail" )
                {
                    var_11 = 1;
                    break;
                }
            }

            if ( !var_11 && var_0["name"] != "iw7_m1_mp" )
            {
                var_15 = strtok( var_4, "_" )[1];
                var_3[var_3.size] = var_15 + "scope";
            }
        }

        if ( var_3.size > 0 )
        {
            var_3 = scripts\engine\utility::_id_1D3A( var_3 );

            foreach ( var_17 in var_3 )
                var_0["name"] = var_0["name"] + "_" + var_17;
        }
    }

    return var_0["name"];
}

_id_81F5( var_0, var_1, var_2 )
{
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        if ( var_5 == "gl" || var_5 == "shotgun" )
            continue;

        var_6 = _id_248A( var_5, var_1 );

        if ( !var_6 )
            continue;

        var_3[var_3.size] = var_5;
    }

    return var_3;
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

_id_3E46( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( var_2 == "thermal" || var_2 == "vzscope" || var_2 == "acog" || var_2 == "ironsight" )
            return 1;
    }

    return 0;
}

_id_CB4B()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        scripts\engine\utility::waitframe();
        var_0 = self getweaponslistprimaries();

        if ( var_0.size > 1 )
        {
            foreach ( var_2 in var_0 )
            {
                if ( var_2 == self._id_C400 )
                {
                    var_3 = self getammocount( var_2 );
                    var_4 = self dropitem( var_2 );

                    if ( isdefined( var_4 ) && var_3 > 0 )
                        var_4._id_0336 = "dropped_weapon";

                    break;
                }
            }

            var_0 = scripts\engine\utility::array_remove( var_0, self._id_C400 );
            self._id_C400 = var_0[0];
        }
    }
}

loginckillchain()
{
    self.pers["killChains"]++;
    scripts\mp\persistence::statsetchild( "round", "killChains", self.pers["killChains"] );
}

_id_CA68()
{
    if ( level._id_1CA1 )
    {
        switch ( self._id_110EE )
        {
            case 2:
                scripts\mp\utility\game::giveperk( "specialty_fastsprintrecovery" );
                thread scripts\mp\hud_message::showsplash( "specialty_fastsprintrecovery_sotf", self._id_110EE );
                thread loginckillchain();
                break;
            case 3:
                scripts\mp\utility\game::giveperk( "specialty_lightweight" );
                thread scripts\mp\hud_message::showsplash( "specialty_lightweight_sotf", self._id_110EE );
                thread loginckillchain();
                break;
            case 4:
                scripts\mp\utility\game::giveperk( "specialty_stalker" );
                thread scripts\mp\hud_message::showsplash( "specialty_stalker_sotf", self._id_110EE );
                thread loginckillchain();
                break;
            case 5:
                scripts\mp\utility\game::giveperk( "specialty_regenfaster" );
                thread scripts\mp\hud_message::showsplash( "specialty_regenfaster_sotf", self._id_110EE );
                thread loginckillchain();
                break;
            case 6:
                scripts\mp\utility\game::giveperk( "specialty_deadeye" );
                thread scripts\mp\hud_message::showsplash( "specialty_deadeye_sotf", self._id_110EE );
                thread loginckillchain();
                break;
        }
    }
}

_id_92B5( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        var_0 scripts\mp\entityheadicons::_id_F73D( var_3, var_1, ( 0, 0, 24 ), 14, 14, undefined, undefined, undefined, undefined, undefined, 0 );
        self._id_4853 = var_1;
    }
}

_id_C2C6( var_0 )
{
    scripts\mp\objidpoolmanager::minimap_objective_playermask_showtoall( var_0 );
}

_id_F674( var_0 )
{
    level._id_13CA7["sum"] = 0;
    var_1 = var_0;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !var_1[var_2]["weight"] )
            continue;

        level._id_13CA7["sum"] += var_1[var_2]["weight"];
        var_1[var_2]["weight"] = level._id_13CA7["sum"];
    }

    return var_1;
}

_id_10437( var_0 )
{
    var_1 = [];
    var_2 = [];

    for ( var_3 = 1; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_0[var_3]["weight"];
        var_1 = var_0[var_3];

        for ( var_5 = var_3 - 1; var_5 >= 0 && _id_9D1D( var_0[var_5]["weight"], var_4 ); var_5-- )
        {
            var_2 = var_0[var_5];
            var_0[var_5] = var_1;
            var_0[var_5 + 1] = var_2;
        }
    }

    return var_0;
}

_id_9D1D( var_0, var_1 )
{
    return var_0 < var_1;
}

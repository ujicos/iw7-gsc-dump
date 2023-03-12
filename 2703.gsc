// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

initbroshotfx()
{
    level._effect["FX_BRO_LIGHT"] = loadfx( "vfx/iw7/_requests/mp/broshot/vfx_bs_light_fill.vfx" );
    level._effect["vfx_taunt_steel_dragon"] = loadfx( "vfx/iw7/_requests/mp/frontend/vfx_taunt_steel_dragon.vfx" );
    level._effect["vfx_bombard_antigrav_pre_expl"] = loadfx( "vfx/iw7/_requests/mp/vfx_bombard_antigrav_pre_expl.vfx" );
    level._effect["vfx_bombard_projectile_trail"] = loadfx( "vfx/iw7/_requests/mp/vfx_bombard_projectile_trail.vfx" );
    level._effect["vfx_bombardment_strike_explosion"] = loadfx( "vfx/iw7/_requests/mp/vfx_bombardment_strike_explosion.vfx" );
    level._effect["vfx_tnt_crate_smk"] = loadfx( "vfx/iw7/levels/mp_frontend/vfx_tnt_crate_smk.vfx" );
}

forceinitbroshot()
{
    level.forcebroshot = 1;
    setomnvar( "ui_broshot_debug", 1 );
    return _id_97E0();
}

_id_97E0( var_0 )
{
    level._id_37A8 = spawnstruct();
    level._id_37A8._id_289A = getent( "camera_mp_broshot", "targetname" );
    level._id_37A8._id_3CAA[0] = getent( "character_loc_broshot", "targetname" );
    level._id_37A8._id_3CAA[2] = getent( "character_loc_broshot_a", "targetname" );
    level._id_37A8._id_3CAA[1] = getent( "character_loc_broshot_b", "targetname" );
    level._id_37A8._id_3CAA[3] = getent( "character_loc_broshot_c", "targetname" );
    level._id_37A8._id_3CAA[4] = getent( "character_loc_broshot_d", "targetname" );
    level._id_37A8._id_3CAA[5] = getent( "character_loc_broshot_e", "targetname" );

    if ( ( !isdefined( self ) || !isdefined( level._id_37A8._id_289A ) || !isdefined( level._id_115D8 ) || !isdefined( level._id_115D8["allies"] ) || !isdefined( level._id_115D8["axis"] ) || level._id_115D8["allies"].size == 0 && level._id_115D8["axis"].size == 0 ) && !scripts\mp\utility\game::istrue( level.forcebroshot ) )
        return 0;

    if ( level.teambased && !scripts\mp\utility\game::istrue( level.forcebroshot ) )
    {
        if ( !isdefined( var_0 ) )
        {
            var_1 = getteamscore( "allies" );
            var_2 = getteamscore( "axis" );

            if ( var_1 == var_2 )
                return 0;
        }
        else if ( var_0 == "tie" || var_0 == "none" || var_0 == "draw" )
            return 0;
    }
    else
    {
        var_3 = scripts\engine\utility::_id_22C3( level.players, ::_id_445C );

        if ( !scripts\mp\utility\game::istrue( level.forcebroshot ) && var_3[0].score <= 0 )
            return 0;
    }

    level._id_37A8._id_BE17 = 40;
    level._id_37A8._id_3CAA[0].origin += anglestoleft( level._id_37A8._id_3CAA[0].angles ) * 6.0;
    level._id_37A8._id_3CAA[2].origin += anglestoleft( level._id_37A8._id_3CAA[2].angles ) * 20.0;
    level._id_37A8._id_3CAA[1].origin += anglestoleft( level._id_37A8._id_3CAA[1].angles ) * 12.0;
    level._id_37A8._id_3CAA[4].origin += anglestoleft( level._id_37A8._id_3CAA[4].angles ) * 6.0;
    level._id_37A8._id_3CAA[3].origin += anglestoright( level._id_37A8._id_3CAA[3].angles ) * 0.0;
    level._id_37A8._id_3CAA[5].origin += anglestoleft( level._id_37A8._id_3CAA[5].angles ) * 18.0;
    level._id_37A8._id_3CAA[4].origin += anglestoforward( level._id_37A8._id_3CAA[4].angles ) * -46.0;
    level._id_37A8._id_3CAA[3].origin += anglestoforward( level._id_37A8._id_3CAA[3].angles ) * -46.0;
    level._id_37A8._id_3CAA[5].origin += anglestoforward( level._id_37A8._id_3CAA[5].angles ) * -46.0;
    setomnvar( "ui_broshot_upside_down", scripts\mp\utility\game::istrue( level.upsidedowntaunts ) );

    for ( var_4 = 3; var_4 < 6; var_4++ )
    {
        if ( scripts\mp\utility\game::istrue( level.upsidedowntaunts ) )
        {
            var_5 = level._id_37A8._id_3CAA[var_4].origin + ( 0, 0, 25 );
            var_6 = ( var_5[0], var_5[1], var_5[2] - 100 );
        }
        else
        {
            var_5 = level._id_37A8._id_3CAA[var_4].origin;
            var_6 = ( var_5[0], var_5[1], var_5[2] + 100 );
        }

        var_7 = scripts\engine\trace::_id_48BC( 0, 1, 1, 1, 1, 0, 0 );
        var_8 = physics_raycast( var_6, var_5, var_7, undefined, 1, "physicsquery_closest" );
        var_9 = isdefined( var_8 ) && var_8.size > 0;

        if ( var_9 )
        {
            var_10 = var_8[0]["position"];
            level._id_37A8._id_3CAA[var_4].origin = var_10;
        }
    }

    self.mvparray = [];
    return 1;
}

_id_10D73( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self;

    level.broshotrunning = 1;
    _id_40F4();
    cleanupgamemodes();
    var_1 = spawnstruct();

    if ( scripts\mp\utility\game::istrue( level.upsidedowntaunts ) )
    {
        var_1.origin = level._id_37A8._id_3CAA[0].origin + ( 30, -15, -95 );
        var_1.angles = level._id_37A8._id_289A.angles + ( 162, 180, 0 );
    }
    else
    {
        var_1.origin = level._id_37A8._id_3CAA[0].origin;
        var_1.angles = level._id_37A8._id_289A.angles;
    }

    foreach ( var_3 in level.players )
    {
        var_3 scripts\mp\playerlogic::_id_E285( var_1.origin, var_1.angles );
        var_3 scripts\mp\gamelogic::_id_7386();
        var_3 playerhide();
    }

    removeallcorpses();
    level._id_1623 = var_1;
    level._id_37A6 = spawn( "script_model", var_1.origin );
    level._id_37A6 setmodel( "tag_origin" );
    level._id_37A6.angles = var_1.angles;
    thread spawnfilllight();

    if ( scripts\mp\utility\game::istrue( level.forcebroshot ) )
    {
        if ( level._id_115D8["allies"].size > 1 )
            level.topplayers = scripts\engine\utility::_id_22C3( level._id_115D8["allies"], ::_id_445C );
        else
        {
            level.topplayers = [];
            level.topplayers[0] = self;
        }
    }
    else if ( level.teambased )
    {
        if ( !isdefined( var_0 ) )
        {
            var_5 = getteamscore( "allies" );
            var_6 = getteamscore( "axis" );
            var_7 = scripts\engine\utility::ter_op( var_5 >= var_6, "allies", "axis" );
        }
        else
            var_7 = var_0;

        level.topplayers = scripts\engine\utility::_id_22C3( level._id_115D8[var_7], ::_id_445C );
    }
    else
        level.topplayers = level.placement["all"];

    level.supergunout = [];
    level.interruptabletaunts = [];
    level.firsttaunttracker = [];

    foreach ( var_3 in level.players )
        var_3 hideeffectsforbroshot();

    for ( var_10 = 0; var_10 < 6; var_10++ )
    {
        if ( !isdefined( level.topplayers[var_10] ) )
            break;

        if ( !isdefined( level.topplayers[var_10]._id_AE62 ) )
            continue;

        self.mvparray[var_10] = spawnstruct();

        if ( level.gametype == "infect" )
        {
            if ( isbot( level.topplayers[var_10] ) )
                var_11 = level.topplayers[var_10]._id_AE62;
            else
                var_11 = level.topplayers[var_10] scripts\mp\class::_id_3676();
        }
        else
            var_11 = level.topplayers[var_10]._id_AE62;

        var_12 = tablelookuprownum( "mp/battleRigTable.csv", 1, var_11 );

        if ( isbot( level.topplayers[var_10] ) || isdefined( level.topplayers[var_10]._id_A93D ) )
        {
            var_13 = level.topplayers[var_10] getcustomizationbody();
            var_14 = level.topplayers[var_10] getcustomizationhead();
            var_15 = tablelookuprownum( "mp/cac/heads.csv", 1, var_14 );
            var_16 = tablelookuprownum( "mp/cac/bodies.csv", 1, var_13 );

            if ( isdefined( level.topplayers[var_10]._id_A93D ) )
                var_12 = tablelookuprownum( "mp/battleRigTable.csv", 1, level.topplayers[var_10]._id_A93D._id_2123 );
        }
        else
        {
            var_16 = level.topplayers[var_10] scripts\mp\teams::_id_8078();
            var_15 = level.topplayers[var_10] scripts\mp\teams::_id_8073();
        }

        self.mvparray[var_10]._id_026A = var_12;
        self.mvparray[var_10]._id_006A = var_16;
        self.mvparray[var_10]._id_0171 = var_15;
        self.mvparray[var_10].weaponname = getdisplayweapon( level.topplayers[var_10] );
        self.mvparray[var_10].clantag = level.topplayers[var_10] getclantag();
        self.mvparray[var_10].name = level.topplayers[var_10].name;
        self.mvparray[var_10].xuid = level.topplayers[var_10] getxuid();
        self.mvparray[var_10]._id_D62C = var_10;
        self.mvparray[var_10].clientnum = level.topplayers[var_10] getentitynumber();
        level.topplayers[var_10] setguntypeforui( var_10 );
        level.topplayers[var_10].bro = _id_B29D( var_10, level._id_37A8._id_3CAA[var_10] );
    }

    foreach ( var_3 in level.players )
    {
        var_3 _meth_84D5( "mp_broshot" );
        var_3 _meth_8500( 0 );
        var_3 dontinterpolate();

        if ( isbot( var_3 ) )
            continue;

        var_3 cameralinkto( level._id_37A6, "tag_origin", 1 );
        var_3 thread scripts\mp\utility\game::_id_F8A0( 0.0 );
        scripts\mp\utility\game::_id_144F( "", 0 );

        if ( !scripts\mp\utility\game::istrue( level.forcebroshot ) )
            var_3 thread fadetoblack( 1.5 );
    }

    level._id_37A6 _meth_8294( "iw7_mp_brodium_cam" );
    thread tauntinputlisten( level.topplayers );
    level thread _id_C56E();
    startpodium( -1, self.mvparray );
    return 13.5;
}

hideeffectsforbroshot()
{
    if ( self._id_0291 == "spectator" )
        return;

    if ( !isdefined( self._id_AE62 ) )
        return;

    self setscriptablepartstate( "cloak", "offImmediate", 1 );
    self setscriptablepartstate( "jet_pack", "off", 1 );
    self setscriptablepartstate( "teamColorPins", "off", 1 );
    self setscriptablepartstate( "armorUpMaterial", "offImmediate", 1 );
    self setscriptablepartstate( "armorUp", "neutral", 1 );
    self setscriptablepartstate( "light_armor", "neutral", 1 );
    self setscriptablepartstate( "adrenaline", "neutral", 1 );
    self setscriptablepartstate( "adrenalineHeal", "neutral", 1 );
    self setscriptablepartstate( "pts_drone", "off", 1 );
}

spawnfilllight()
{
    scripts\engine\utility::waitframe();
    playfxontag( scripts\engine\utility::_id_7ECB( "FX_BRO_LIGHT" ), level._id_37A6, "tag_origin" );
}

fadetoblack( var_0 )
{
    wait 12.0;
    scripts\mp\utility\game::_id_144F( "", 0 );

    foreach ( var_2 in level.players )
    {
        if ( isbot( var_2 ) )
            continue;

        var_2 _meth_83F8( "bw", var_0 );
    }
}

_id_40F4()
{
    self notify( "bro_shot_start" );
    scripts\mp\weapons::_id_51A7();
    var_0 = getweaponarray();

    if ( isdefined( var_0 ) )
    {
        foreach ( var_2 in var_0 )
            var_2 delete();
    }
}

cleanupgamemodes()
{
    if ( isdefined( level._id_115CC ) )
    {
        if ( isdefined( level._id_115CC[game["attackers"]] ) && isdefined( level._id_115CC[game["attackers"]].visuals ) )
        {
            for ( var_0 = 0; var_0 < level._id_115CC[game["attackers"]].visuals.size; var_0++ )
                level._id_115CC[game["attackers"]].visuals[var_0] hide();
        }

        if ( isdefined( level._id_115CC[game["defenders"]] ) && isdefined( level._id_115CC[game["defenders"]].visuals ) )
        {
            for ( var_0 = 0; var_0 < level._id_115CC[game["defenders"]].visuals.size; var_0++ )
                level._id_115CC[game["defenders"]].visuals[var_0] hide();
        }
    }

    if ( ( level.gametype == "dom" || level.gametype == "siege" ) && isdefined( level._id_5913 ) )
    {
        foreach ( var_2 in level._id_5913 )
        {
            if ( isdefined( var_2 ) )
            {
                var_2._id_0289 setscriptablepartstate( "flag", "off" );
                var_2._id_0289 setscriptablepartstate( "pulse", "off" );
            }
        }
    }

    if ( level.gametype == "grind" && isdefined( level._id_13FC1 ) )
    {
        foreach ( var_5 in level._id_13FC1 )
        {
            if ( isdefined( var_5 ) && isdefined( var_5._id_0289 ) )
            {
                var_5._id_0289 setscriptablepartstate( "flag", "off" );
                var_5._id_0289 setscriptablepartstate( "pulse", "off" );
            }
        }
    }

    if ( ( level.gametype == "sr" || level.gametype == "dd" | level.gametype == "sd" ) && isdefined( level._id_2C7A ) )
    {
        foreach ( var_8 in level._id_2C7A )
        {
            if ( isdefined( var_8 ) && isdefined( var_8.visuals ) )
            {
                for ( var_9 = 0; var_9 < var_8.visuals.size; var_9++ )
                {
                    if ( isdefined( var_8.visuals[var_9] ) )
                        var_8.visuals[var_9] hide();
                }
            }
        }
    }

    if ( level.gametype == "front" && isdefined( level._id_13FC4 ) )
    {
        foreach ( var_5 in level._id_13FC4 )
        {
            if ( isdefined( var_5 ) && isdefined( var_5.visuals ) )
            {
                for ( var_9 = 0; var_9 < var_5.visuals.size; var_9++ )
                    var_5.visuals[var_9] hide();
            }
        }
    }

    if ( scripts\mp\utility\game::istrue( level._id_58C2 ) )
    {
        if ( isdefined( level.dogtags ) )
        {
            foreach ( var_14 in level.dogtags )
            {
                if ( isdefined( var_14 ) && isdefined( var_14.visuals ) )
                {
                    for ( var_9 = 0; var_9 < var_14.visuals.size; var_9++ )
                        var_14.visuals[var_9] hide();
                }
            }
        }
    }

    if ( isdefined( level._id_2800 ) )
    {
        foreach ( var_17 in level._id_2800 )
            var_17.visuals[0] setscriptablepartstate( "uplink_drone_hide", "hide", 0 );
    }

    if ( ( level.gametype == "koth" || level.gametype == "grnd" ) && isdefined( level._id_13FC4 ) )
    {
        foreach ( var_5 in level._id_13FC4 )
        {
            if ( isdefined( var_5 ) && isdefined( var_5._id_130AC ) && isdefined( var_5._id_130AC.chevrons ) )
            {
                foreach ( var_21 in var_5._id_130AC.chevrons )
                {
                    for ( var_9 = 0; var_9 < var_21.numchevrons; var_9++ )
                        var_21 setscriptablepartstate( "chevron_" + var_9, "off" );
                }
            }
        }
    }
}

tauntinputlisten( var_0 )
{
    wait 3.0;

    for ( var_1 = 0; var_1 < 3; var_1++ )
    {
        if ( !isdefined( var_0[var_1] ) || isbot( var_0[var_1] ) )
            continue;

        var_0[var_1] thread _id_AD7A( var_1 );
    }
}

getdisplayweapon( var_0 )
{
    var_1 = var_0._id_A978;

    if ( !issubstr( var_1, var_0.pers["primaryWeapon"] ) && !issubstr( var_1, var_0.pers["secondaryWeapon"] ) )
        var_1 = var_0._id_10922;

    if ( issubstr( var_1, "iw7_fists_mp" ) || issubstr( var_1, "iw7_knife" ) || issubstr( var_1, "iw7_axe" ) )
        var_1 = var_0.pers["secondaryWeapon"];

    if ( issubstr( var_1, "nunchucks" ) || issubstr( var_1, "katana" ) )
        var_1 = "iw7_fists_mp";

    return var_1;
}

_id_37B1( var_0, var_1, var_2, var_3 )
{
    self predictstreampos( var_0.origin );
    wait( var_2 );
    level._id_37A6 scriptmodelclearanim();
    var_4 = distance( level._id_37A6.origin, var_0.origin );
    var_5 = var_4 / var_1;

    if ( var_5 < 0.05 )
        var_5 = 0.05;

    level._id_37A6._id_BC77 = var_0;
    level._id_37A6 moveto( var_0.origin, var_5 );
    level._id_37A6 rotateto( var_0.angles, var_5 );

    if ( isdefined( var_3 ) )
    {
        wait( var_5 - var_3 );
        thread scripts\mp\utility\game::_id_F8A0( var_3 );
    }
}

_id_6311()
{
    level.broshotrunning = undefined;
    self notify( "broshot_done" );

    foreach ( var_1 in level.players )
        var_1 _meth_84D6();
}

_id_B29D( var_0, var_1 )
{
    var_2 = spawn( "script_character", var_1.origin, 0, 0, var_0 );
    var_2.angles = var_1.angles;

    if ( scripts\mp\utility\game::istrue( level._id_C1C3 ) && var_0 == 0 )
        playfx( scripts\engine\utility::_id_7ECB( "mons_screen_ash" ), var_1.origin );

    return var_2;
}

_id_AD7A( var_0 )
{
    if ( !isai( self ) && scripts\engine\utility::_id_9C70() )
    {
        self notifyonplayercommand( "bro_action_1", "+actionslot 1" );
        self notifyonplayercommand( "bro_action_2", "+actionslot 2" );
        self notifyonplayercommand( "bro_action_3", "+actionslot 3" );
        self notifyonplayercommand( "bro_action_4", "+actionslot 4" );
    }
    else
    {
        self notifyonplayercommand( "bro_action_1", "+actionslot 3" );
        self notifyonplayercommand( "bro_action_2", "+actionslot 4" );
        self notifyonplayercommand( "bro_action_3", "+actionslot 5" );
        self notifyonplayercommand( "bro_action_4", "+actionslot 6" );
    }

    for (;;)
    {
        thread _id_AD79( var_0, 1 );
        thread _id_AD79( var_0, 2 );
        thread _id_AD79( var_0, 3 );
        thread _id_AD79( var_0, 4 );
        self waittill( "taunt_end" );
    }
}

_id_AD79( var_0, var_1 )
{
    self endon( "taunt_start" );
    self endon( "broshot_done" );

    for (;;)
    {
        self waittill( "bro_action_" + var_1 );
        thread _id_5ABE( var_0, var_1 );
        wait 0.05;
    }
}

_id_5ABE( var_0, var_1 )
{
    self notify( "taunt_start" );
    self endon( "broshot_done" );

    if ( isdefined( self._id_3C56 ) )
    {
        var_2 = level._id_2127[self._id_3C56._id_2123];

        if ( level.rankedmatch )
            var_3 = self getrankedplayerdata( "rankedloadouts", "squadMembers", "archetypePreferences", var_2, "taunts", var_1 - 1 );
        else
            var_3 = self getrankedplayerdata( "privateloadouts", "squadMembers", "archetypePreferences", var_2, "taunts", var_1 - 1 );
    }
    else if ( level.rankedmatch )
        var_3 = self getrankedplayerdata( "rankedloadouts", "squadMembers", "taunts", var_1 - 1 );
    else
        var_3 = self getrankedplayerdata( "privateloadouts", "squadMembers", "taunts", var_1 - 1 );

    if ( isdefined( level.overridebroslot ) )
        var_0 = level.overridebroslot - 1;

    if ( isdefined( level.overridetaunt ) )
        var_3 = tablelookup( "mp/cac/taunts.csv", 0, level.overridetaunt, 1 );

    var_4 = tablelookuprownum( "mp/cac/taunts.csv", 1, var_3 );
    var_5 = tablelookup( "mp/cac/taunts.csv", 0, var_4, 5 );

    if ( var_5 == "" )
        return;

    var_6 = tablelookup( "mp/cac/taunts.csv", 0, var_4, 19 );
    var_7 = tablelookup( "mp/cac/taunts.csv", 0, var_4, 20 );
    var_8 = tablelookup( "mp/cac/taunts.csv", 0, var_4, 21 );
    var_9 = tablelookup( "mp/cac/taunts.csv", 0, var_4, 12 ) == "Y";
    var_10 = tablelookup( "mp/cac/taunts.csv", 0, var_4, 9 );
    var_11 = "ui_broshot_anim_" + var_0;

    if ( isdefined( level.interruptabletaunts[var_0] ) && level.interruptabletaunts[var_0] == var_10 )
    {
        self notify( "taunt_end" );
        return;
    }

    var_12 = getdisplayweapon( self ) == "none" || getdisplayweapon( self ) == "iw7_fists_mp";

    if ( !isdefined( level.firsttaunttracker[var_11] ) && !var_12 )
    {
        if ( !( var_9 && isdefined( level.supergunout[var_11] ) ) )
        {
            level.firsttaunttracker[var_11] = 1;
            _id_DB36( var_11 );
        }

        if ( !var_9 )
            level.supergunout[var_11] = undefined;
    }

    if ( var_9 && !isdefined( level.supergunout[var_11] ) )
    {
        level.firsttaunttracker[var_11] = undefined;
        takesupergunout( var_11, var_5 );
        level.supergunout[var_11] = 1;
    }

    var_13 = tablelookup( "mp/cac/taunts.csv", 0, var_4, 17 );
    var_14 = tablelookup( "mp/cac/taunts.csv", 0, var_4, 18 );

    if ( var_0 > 0 && var_13 != "" && var_14 != "" )
    {
        if ( var_0 == 1 )
            var_10 = var_13;
        else if ( var_0 == 2 )
            var_10 = var_14;
    }

    scripts\mp\broshot_utilities::processepictaunt( var_10, var_0, 1 );
    var_15 = "ui_broshot_anim_" + var_0;
    setomnvar( var_15, var_4 );
    var_16 = float( var_8 ) / 30.0;
    var_17 = var_16;

    if ( var_6 != "" )
        var_17 *= float( var_6 );

    level.interruptabletaunts[var_0] = var_10;
    thread interruptblocker( var_0, var_16 );
    wait( var_17 );
    level.taunts_done = 1;
    self notify( "taunt_end" );
}

interruptblocker( var_0, var_1 )
{
    self notify( "combo_started_" + var_0 );
    self endon( "combo_started_" + var_0 );
    wait( var_1 );
    level.interruptabletaunts[var_0] = undefined;
}

getaltgunanimstring()
{
    var_0 = getdisplayweapon( self );

    if ( issubstr( var_0, "iw7_nrg" ) || issubstr( var_0, "iw7_udm45" ) || issubstr( var_0, "iw7_ump45_mpr_akimbo" ) )
        return "_alt";

    return "";
}

getgunanimstring()
{
    var_0 = getdisplayweapon( self );

    if ( issubstr( var_0, "minilmg_mpl" ) && !issubstr( var_0, "spooled" ) )
        return "augfury";

    if ( issubstr( var_0, "akimbo" ) )
        return "akimbo";

    if ( issubstr( var_0, "mp28" ) )
        return "mp28";

    if ( issubstr( var_0, "chargeshot" ) || issubstr( var_0, "glprox" ) || issubstr( var_0, "venom" ) )
        return "assault_rifle";

    if ( issubstr( var_0, "knife" ) )
        return "knife";

    if ( issubstr( var_0, "axe" ) )
        return "axe";

    var_1 = scripts\mp\utility\game::_id_8225( var_0 );

    switch ( var_1 )
    {
        case "weapon_melee":
            return "melee";
        case "weapon_pistol":
            return "pistol";
        case "weapon_beam":
        case "weapon_smg":
            return "smg";
        case "weapon_assault":
            return "assault_rifle";
        case "weapon_lmg":
            return "lmg";
        case "weapon_rail":
        case "weapon_sniper":
        case "weapon_dmr":
            return "sniper";
        case "weapon_shotgun":
            return "shotgun";
        case "weapon_projectile":
            return "launcher";
        default:
            return "akimbo";
    }
}

getgunanimindex()
{
    var_0 = getdisplayweapon( self );
    var_1 = scripts\mp\utility\game::_id_8225( var_0 );

    if ( issubstr( var_0, "minilmg_mpl" ) && !issubstr( var_0, "spooled" ) )
        return 11;

    if ( issubstr( var_0, "mp28" ) )
        return 12;

    if ( issubstr( var_0, "akimbo" ) && !issubstr( var_0, "akimbofmg" ) && !issubstr( var_0, "mod_akimboshotgun" ) )
    {
        if ( issubstr( var_0, "iw7_nrg" ) || issubstr( var_0, "iw7_udm45" ) || issubstr( var_0, "iw7_ump45_mpr_akimbo" ) )
            return 13;

        return 8;
    }

    if ( issubstr( var_0, "chargeshot" ) || issubstr( var_0, "glprox" ) || issubstr( var_0, "venom" ) )
        return 2;

    if ( issubstr( var_0, "knife" ) )
        return 9;

    if ( issubstr( var_0, "axe" ) )
        return 10;

    if ( issubstr( var_0, "nunchuk" ) || issubstr( var_0, "katana" ) )
        return 7;

    switch ( var_1 )
    {
        case "weapon_pistol":
            return 0;
        case "weapon_beam":
        case "weapon_smg":
            return 1;
        case "weapon_assault":
            return 2;
        case "weapon_lmg":
            return 3;
        case "weapon_rail":
        case "weapon_sniper":
        case "weapon_dmr":
            return 4;
        case "weapon_shotgun":
            return 5;
        case "weapon_projectile":
            return 6;
        case "weapon_melee":
        default:
            return 7;
    }
}

setguntypeforui( var_0 )
{
    var_1 = "ui_broshot_weapon_type_" + var_0;
    setomnvar( var_1, getgunanimindex() );
}

_id_DB36( var_0 )
{
    var_1 = getgunanimstring();
    var_2 = var_1 + "_put_away" + getaltgunanimstring();
    var_3 = tablelookuprownum( "mp/cac/taunts.csv", 1, var_2 );
    setomnvar( var_0, -1 );
    var_4 = getgunputawayduration( var_1 );
    wait( var_4 );
}

takesupergunout( var_0, var_1 )
{
    var_2 = getrigtransstringfromref( var_1 ) + "transout_0";
    var_3 = tablelookuprownum( "mp/cac/taunts.csv", 1, var_2 );
    setomnvar( var_0, var_3 + 30000 );
    var_4 = getrigsupertakeoutdurationfromref( var_1 );
    wait( var_4 );
}

getrigtransstringfromref( var_0 )
{
    var_1 = "";

    switch ( var_0 )
    {
        case "archetype_assault":
        default:
            var_1 = "war_";
            break;
        case "archetype_heavy":
            var_1 = "heavy_";
            break;
        case "archetype_scout":
            var_1 = "c6_";
            break;
        case "archetype_assassin":
            var_1 = "ftl_";
            break;
        case "archetype_engineer":
            var_1 = "stryker_";
            break;
        case "archetype_sniper":
            var_1 = "ghost_";
            break;
    }

    return var_1;
}

getgunputawayduration( var_0 )
{
    var_1 = 0.0;

    switch ( var_0 )
    {
        case "akimbo":
        default:
            var_1 = 1.067;
            break;
        case "launcher":
            var_1 = 1.567;
            break;
        case "lmg":
            var_1 = 1.333;
            break;
        case "pistol":
            var_1 = 2.233;
            break;
        case "shotgun":
            var_1 = 1.233;
            break;
        case "smg":
        case "mp28":
            var_1 = 1.2;
            break;
        case "sniper":
            var_1 = 1.367;
            break;
        case "assault_rifle":
            var_1 = 1.233;
            break;
        case "melee":
            var_1 = 1.233;
            break;
    }

    return var_1 - 0.2;
}

getrigsupertakeoutdurationfromref( var_0 )
{
    var_1 = 0.0;

    switch ( var_0 )
    {
        case "archetype_assault":
        default:
            var_1 = 1.733;
            break;
        case "archetype_heavy":
            var_1 = 1.4;
            break;
        case "archetype_scout":
            var_1 = 0.67;
            break;
        case "archetype_assassin":
            var_1 = 1.133;
            break;
        case "archetype_engineer":
            var_1 = 1.733;
            break;
        case "archetype_sniper":
            var_1 = 1.3;
            break;
    }

    return var_1 - 0.2;
}

getrigsuperputawaydurationfromref( var_0 )
{
    var_1 = 0.0;

    switch ( var_0 )
    {
        case "archetype_assault":
        default:
            var_1 = 1.267;
            break;
        case "archetype_heavy":
            var_1 = 1.5;
            break;
        case "archetype_scout":
            var_1 = 0.67;
            break;
        case "archetype_assassin":
            var_1 = 1.0;
            break;
        case "archetype_engineer":
            var_1 = 1.3;
            break;
        case "archetype_sniper":
            var_1 = 1.167;
            break;
    }

    return var_1 - 0.2;
}

_id_445C( var_0, var_1 )
{
    return var_0.score >= var_1.score;
}

_id_C56E()
{
    self endon( "broshot_done" );

    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isai( var_0 ) )
            thread startlatejoinpodium( var_0 );
    }
}

startlatejoinpodium( var_0 )
{
    var_0 endon( "disconnect" );
    wait 0.25;
    var_0 cameralinkto( level._id_37A6, "tag_origin", 1 );
    var_1 = var_0 getentitynumber();
    startpodium( var_1, self.mvparray );
}

changetestrig( var_0, var_1 )
{
    level.overriderig = var_0;
    var_2 = var_1 - 1;
    var_3 = 0;
    var_4 = 0;
    var_5 = 0;

    switch ( var_0 )
    {
        case 1:
        default:
            var_3 = 4;
            var_4 = 18;
            var_5 = 6;
            break;
        case 2:
            var_3 = 12;
            var_4 = 5;
            var_5 = 1;
            break;
        case 3:
            var_3 = 28;
            var_4 = 1;
            var_5 = 2;
            break;
        case 4:
            var_3 = 57;
            var_4 = 28;
            var_5 = 3;
            break;
        case 5:
            var_3 = 45;
            var_4 = 39;
            var_5 = 4;
            break;
        case 6:
            var_3 = 27;
            var_4 = 31;
            var_5 = 5;
            break;
    }

    self.mvparray = [];
    var_6 = max( var_1, level.topplayers.size );

    for ( var_7 = 0; var_7 < var_6; var_7++ )
    {
        self.mvparray[var_7] = spawnstruct();
        self.mvparray[var_7]._id_026A = var_5;
        self.mvparray[var_7]._id_006A = var_4;
        self.mvparray[var_7]._id_0171 = var_3;
        self.mvparray[var_7].weaponname = getdisplayweapon( level.players[0] );
        self.mvparray[var_7].clantag = level.players[0] getclantag();
        self.mvparray[var_7].name = level.players[0].name;
        self.mvparray[var_7].xuid = level.players[0] getxuid();
        self.mvparray[var_7]._id_D62C = var_1;
        self.mvparray[var_7].clientnum = level.players[0] getentitynumber();

        if ( !isdefined( level.topplayers[var_7] ) )
        {
            self.topplayers[var_7] = spawnstruct();
            level.topplayers[var_7].bro = _id_B29D( var_7, level._id_37A8._id_3CAA[var_7] );
        }
    }

    for ( var_7 = 0; var_7 < var_6; var_7++ )
        level.topplayers[var_7] setguntypeforui( var_7 );

    wait 0.05;
    startpodium( -1, self.mvparray );
}

changetesttaunt( var_0 )
{
    level.overridetaunt = var_0;
}

changetestslot( var_0 )
{
    level.overridebroslot = var_0;

    if ( !isdefined( level.topplayers[var_0 - 1] ) )
    {
        var_1 = 0;

        if ( isdefined( level.overriderig ) )
            var_1 = level.overriderig;

        changetestrig( var_1, var_0 );
    }
}

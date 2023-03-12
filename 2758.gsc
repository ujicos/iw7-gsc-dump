// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_A636 = scripts\mp\tweakables::_id_81E7( "game", "allowkillcam" );
    level._id_A63F = [];
    var_0 = 0;

    for (;;)
    {
        var_1 = tablelookupbyrow( "mp/miscKillcamItems.csv", var_0, 0 );

        if ( !isdefined( var_1 ) || var_1 == "" )
            break;

        var_1 = int( var_1 );
        var_2 = tablelookupbyrow( "mp/miscKillcamItems.csv", var_0, 1 );

        if ( !isdefined( var_2 ) || var_2 == "" )
            break;

        level._id_A63F[var_2] = var_1;
        var_0++;
    }
}

_id_F68F( var_0, var_1, var_2 )
{
    self setclientomnvar( "cam_scene_name", var_0 );
    self setclientomnvar( "cam_scene_lead", var_1 );
    self setclientomnvar( "cam_scene_support", var_2 );
}

_id_7F32( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) || var_0 == var_1 && !isagent( var_0 ) )
        return undefined;

    if ( scripts\mp\utility\game::istrue( var_1.israllytrap ) )
        return var_1._id_A63A;

    switch ( var_2 )
    {
        case "hashima_missiles_mp":
        case "sentry_shock_grenade_mp":
        case "jackal_fast_cannon_mp":
        case "sentry_shock_missile_mp":
        case "bombproj_mp":
        case "sentry_shock_mp":
        case "heli_pilot_turret_mp":
        case "iw7_c8landing_mp":
        case "super_trophy_mp":
        case "micro_turret_gun_mp":
        case "bouncingbetty_mp":
        case "player_trophy_system_mp":
        case "trophy_mp":
        case "power_exploding_drone_mp":
        case "trip_mine_mp":
        case "bomb_site_mp":
            return scripts\engine\utility::ter_op( isdefined( var_1._id_A63A ), var_1._id_A63A, var_1 );
        case "remote_tank_projectile_mp":
        case "jackal_turret_mp":
        case "hind_missile_mp":
        case "hind_bomb_mp":
        case "aamissile_projectile_mp":
        case "jackal_cannon_mp":
            if ( isdefined( var_1._id_131D8 ) && isdefined( var_1._id_131D8._id_A63A ) )
                return var_1._id_131D8._id_A63A;
            else if ( isdefined( var_1._id_131D8 ) )
                return var_1._id_131D8;

            break;
        case "iw7_minigun_c8_mp":
        case "iw7_chargeshot_c8_mp":
        case "iw7_c8offhandshield_mp":
            if ( isdefined( var_0 ) && isdefined( var_0._id_4BE1 ) && var_0._id_4BE1 == "MANUAL" )
                return undefined;

            break;
        case "ball_drone_projectile_mp":
        case "ball_drone_gun_mp":
            if ( isplayer( var_0 ) && isdefined( var_0._id_27D3 ) && isdefined( var_0._id_27D3._id_129B9 ) && isdefined( var_0._id_27D3._id_129B9._id_A63A ) )
                return var_0._id_27D3._id_129B9._id_A63A;

            break;
        case "shockproj_mp":
            if ( isdefined( var_0._id_B7AA._id_A63A ) )
                return var_0._id_B7AA._id_A63A;

            break;
        case "artillery_mp":
        case "none":
            if ( isdefined( var_1._id_0336 ) && var_1._id_0336 == "care_package" || isdefined( var_1._id_A63A ) && ( var_1.classname == "script_brushmodel" || var_1.classname == "trigger_multiple" || var_1.classname == "script_model" ) )
                return var_1._id_A63A;

            break;
        case "switch_blade_child_mp":
        case "drone_hive_projectile_mp":
            if ( isdefined( var_0.extraeffectkillcam ) )
                return var_0.extraeffectkillcam;
            else
                return undefined;
        case "alt_iw7_venomx_mp+venomxalt_burst":
        case "remote_turret_mp":
        case "ugv_turret_mp":
        case "remotemissile_projectile_mp":
        case "osprey_player_minigun_mp":
        case "minijackal_assault_mp":
        case "minijackal_strike_mp":
        case "venomproj_mp":
        case "iw7_venomx_mp+venomxalt_burst":
            return undefined;
    }

    if ( scripts\engine\utility::_id_9DC1( var_2 ) || scripts\mp\utility\game::_id_9D6E( var_2 ) )
    {
        if ( isdefined( var_1._id_A63A ) && !var_0 scripts\mp\utility\game::_id_24ED() )
            return var_1._id_A63A;
        else
            return undefined;
    }

    return var_1;
}

_id_F76C( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_5._id_37CC = "unknown";

    if ( isdefined( var_1 ) && isdefined( var_1.agent_type ) )
    {
        if ( var_1.agent_type == "dog" || var_1.agent_type == "wolf" )
        {
            _id_F68F( "killcam_dog", var_0 getentitynumber(), var_3 getentitynumber() );
            var_5._id_37CC = "killcam_dog";
        }
        else if ( var_1.agent_type == "remote_c8" )
        {
            _id_F68F( "killcam_rc8", var_0 getentitynumber(), var_3 getentitynumber() );
            var_5._id_37CC = "killcam_rc8";
        }
        else
        {
            _id_F68F( "killcam_agent", var_0 getentitynumber(), var_3 getentitynumber() );
            var_5._id_37CC = "killcam_agent";
        }

        return 1;
    }
    else if ( isdefined( var_6 ) && var_6 == "nuke_mp" )
    {
        _id_F68F( "killcam_nuke", var_3 getentitynumber(), var_3 getentitynumber() );
        var_5._id_37CC = "killcam_nuke";
        return 1;
    }
    else if ( var_4 > 0 )
    {
        _id_F68F( "unknown", -1, -1 );
        return 0;
    }
    else
    {
        _id_F68F( "unknown", -1, -1 );
        return 0;
    }

    return 0;
}

_id_127CF( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = var_5 + var_6;

    if ( isdefined( var_8 ) && var_9 > var_8 )
    {
        if ( var_8 < 2 )
            return;

        if ( var_8 - var_5 >= 1 )
            var_6 = var_8 - var_5;
        else
        {
            var_6 = 1;
            var_5 = var_8 - 1;
        }

        var_9 = var_5 + var_6;
    }

    var_10 = var_5 + var_7;

    if ( isdefined( var_1 ) && isdefined( var_1.lastspawntime ) )
        var_11 = var_1.lastspawntime;
    else
    {
        var_11 = var_2.lastspawntime;

        if ( isdefined( var_2.deathtime ) )
        {
            if ( gettime() - var_2.deathtime < var_6 * 1000.0 )
            {
                var_6 = 1.0;
                var_6 -= 0.05;
                var_9 = var_5 + var_6;
            }
        }
    }

    var_12 = ( gettime() - var_11 ) / 1000.0;

    if ( var_10 > var_12 && var_12 > var_7 )
    {
        var_13 = var_12 - var_7;

        if ( var_5 > var_13 )
        {
            var_5 = var_13;
            var_9 = var_5 + var_6;
            var_10 = var_5 + var_7;
        }
    }

    var_14 = spawnstruct();
    var_14._id_37F1 = var_5;
    var_14._id_D6F8 = var_6;
    var_14._id_A63E = var_9;
    var_14._id_A640 = var_10;
    return var_14;
}

_id_D83E( var_0, var_1 )
{
    if ( isdefined( var_1 ) && !isagent( var_1 ) )
    {
        if ( isdefined( self.class ) )
        {
            var_2 = spawnstruct();
            scripts\mp\playerlogic::_id_806C( var_2, self.class );
            scripts\mp\playerlogic::_id_AEAD( var_2, 1 );
        }

        self _meth_81E6( var_1 );
    }
}

_id_A636( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16 )
{
    self endon( "disconnect" );
    self endon( "spawned" );
    level endon( "game_ended" );

    if ( level.showingfinalkillcam )
    {
        setglobalsoundcontext( "atmosphere", "killcam", 0.1 );

        foreach ( var_18 in level.players )
        {
            self playlocalsound( "final_killcam_in" );
            self _meth_82C2( "killcam", "mix" );
        }
    }

    if ( var_2 < 0 || !isdefined( var_12 ) )
        return;

    level._id_C23C++;
    var_20 = 0.05 * ( level._id_C23C - 1 );
    level._id_B4A7 = var_20;

    if ( level._id_C23C > 1 )
        wait( var_20 );

    wait 0.05;
    level._id_C23C--;

    if ( getdvar( "scr_killcam_time" ) == "" )
    {
        if ( var_7 == "artillery_mp" || var_7 == "stealth_bomb_mp" || var_7 == "warhawk_mortar_mp" )
            var_21 = ( gettime() - var_4 ) / 1000 - var_8 - 0.1;
        else if ( var_7 == "remote_mortar_missile_mp" )
            var_21 = 6.5;
        else if ( level.showingfinalkillcam )
            var_21 = 4.0 + level._id_B4A7 - var_20;
        else if ( var_7 == "apache_minigun_mp" )
            var_21 = 3.0;
        else if ( var_7 == "javelin_mp" )
            var_21 = 8;
        else if ( var_7 == "iw7_niagara_mp" )
            var_21 = 5.0;
        else if ( issubstr( var_7, "remotemissile_" ) )
            var_21 = 5;
        else if ( isdefined( var_0._id_F26E ) && var_0._id_F26E == "multiturret" )
            var_21 = 2.0;
        else if ( !var_10 || var_10 > 5.0 )
            var_21 = 5.0;
        else if ( var_7 == "frag_grenade_mp" || var_7 == "frag_grenade_short_mp" || var_7 == "semtex_mp" || var_7 == "semtexproj_mp" || var_7 == "mortar_shell__mp" || var_7 == "cluster_grenade_mp" )
            var_21 = 4.25;
        else
            var_21 = 2.5;
    }
    else
        var_21 = getdvarfloat( "scr_killcam_time" );

    if ( isdefined( var_11 ) )
    {
        if ( var_21 > var_11 )
            var_21 = var_11;

        if ( var_21 < 0.05 )
            var_21 = 0.05;
    }

    if ( getdvar( "scr_killcam_posttime" ) == "" )
    {
        if ( isdefined( var_0 ) && var_0 == var_12 )
            var_22 = 3.5;
        else
            var_22 = 2;
    }
    else
    {
        var_22 = getdvarfloat( "scr_killcam_posttime" );

        if ( var_22 < 0.05 )
            var_22 = 0.05;
    }

    if ( var_2 < 0 || !isdefined( var_12 ) )
        return;

    var_23 = _id_127CF( var_0, var_1, var_12, var_13, var_3, var_21, var_22, var_8, var_11 );

    if ( !isdefined( var_23 ) )
        return;

    self setclientomnvar( "ui_killcam_end_milliseconds", 0 );

    if ( level.showingfinalkillcam )
        self setclientomnvar( "post_game_state", 3 );

    if ( isplayer( var_12 ) )
    {
        self setclientomnvar( "ui_killcam_killedby_id", var_12 getentitynumber() );
        self setclientomnvar( "ui_killcam_victim_id", var_13 getentitynumber() );
        self _meth_81E6( var_12 );
    }

    if ( scripts\mp\utility\game::_id_9E6C( var_7 ) )
        _id_F76E( var_7, var_16 );
    else
        scripts\mp\perks::_id_F7C5( "ui_killcam_killedby_perk", var_15 );

    var_24 = getdvarint( "scr_player_forcerespawn" );

    if ( var_10 && !level._id_7669 || isdefined( self ) && isdefined( self._id_28CC ) && !level._id_7669 || var_24 == 0 && !level._id_7669 )
        self setclientomnvar( "ui_killcam_text", "skip" );
    else if ( !level._id_7669 )
        self setclientomnvar( "ui_killcam_text", "respawn" );
    else
        self setclientomnvar( "ui_killcam_text", "none" );

    var_25 = gettime();
    self notify( "begin_killcam", var_25 );
    scripts\mp\utility\game::updatesessionstate( "spectator" );
    self._id_02B0 = 1;

    if ( isagent( var_12 ) || isagent( var_0 ) )
    {
        var_2 = var_13 getentitynumber();
        var_9 -= 25;
    }

    self._id_0140 = var_2;
    self._id_01A9 = -1;
    var_26 = _id_F76C( var_0, var_1, var_2, var_13, var_3, var_23, var_7 );

    if ( !var_26 )
        thread _id_F76B( var_3, var_23._id_A640, var_4, var_5, var_6 );

    self._id_004A = var_23._id_A640;
    self._id_A63E = var_23._id_A63E;
    self.psoffsettime = var_9;
    self allowspectateteam( "allies", 1 );
    self allowspectateteam( "axis", 1 );
    self allowspectateteam( "freelook", 1 );
    self allowspectateteam( "none", 1 );

    if ( level._id_BDCC )
    {
        foreach ( var_28 in level._id_115DA )
            self allowspectateteam( var_28, 1 );
    }

    thread _id_6315();
    wait 0.05;

    if ( !isdefined( self ) )
        return;

    if ( self._id_004A < var_23._id_A640 )
    {
        var_30 = var_23._id_A640 - self._id_004A;

        if ( game["truncated_killcams"] < 32 )
            game["truncated_killcams"]++;
    }

    var_23._id_37F1 = self._id_004A - 0.05 - var_8;
    var_23._id_A63E = var_23._id_37F1 + var_23._id_D6F8;
    self._id_A63E = var_23._id_A63E;

    if ( var_23._id_37F1 <= 0 )
    {
        scripts\mp\utility\game::updatesessionstate( "dead" );
        scripts\mp\utility\game::_id_41BF();
        self notify( "killcam_ended" );
        return;
    }

    var_31 = level.showingfinalkillcam;
    self setclientomnvar( "ui_killcam_end_milliseconds", int( var_23._id_A63E * 1000 ) + gettime() );

    if ( var_31 )
        self setclientomnvar( "ui_killcam_victim_or_attacker", 1 );

    if ( var_31 )
        thread scripts\mp\finalkillcam::_id_5854( var_23, self._id_01A9, var_12, var_13, var_14 );

    self._id_A636 = 1;

    if ( isdefined( self._id_28CC ) && !level._id_7669 )
        self._id_28CD = gettime();

    thread _id_10855();

    if ( !level.showingfinalkillcam )
        thread _id_13715( var_10 );
    else
        self notify( "showing_final_killcam" );

    thread _id_635D();
    _id_13836();

    if ( level.showingfinalkillcam )
    {
        thread scripts\mp\playerlogic::_id_10857();
        return;
    }

    thread _id_A639( 1 );
}

_id_F770( var_0, var_1, var_2 )
{
    var_3 = getweaponbasename( var_0 );

    if ( !isdefined( var_3 ) || var_3 == "none" )
        _id_41BD();
    else
    {
        var_4 = scripts\mp\utility\game::_id_7E9D( var_3 );

        if ( isdefined( scripts\mp\supers::_id_7F0D( var_3 ) ) )
            _id_F772( var_3 );
        else if ( isdefined( var_4 ) && ( var_4 == "lethal" || var_4 == "tactical" ) )
            _id_F771( var_3 );
        else
        {
            if ( isdefined( level._id_A63F[var_3] ) )
            {
                _id_F76F( level._id_A63F[var_3] );
                return;
            }

            _id_F773( var_0, var_2 );
        }
    }
}

_id_13836()
{
    self endon( "abort_killcam" );

    if ( level.showingfinalkillcam )
        thread scripts\mp\utility\game::_id_F8A0( 1.0, self._id_A63E - 0.5 );

    wait( self._id_A63E - 0.05 );

    if ( level.showingfinalkillcam )
    {
        setglobalsoundcontext( "atmosphere", "", 0.5 );
        self playlocalsound( "final_killcam_out" );
        self _meth_8070( 4 );
    }
}

_id_F76B( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );
    var_5 = gettime() - var_1 * 1000;

    if ( var_2 > var_5 )
    {
        wait 0.05;
        var_1 = self._id_004A;
        var_5 = gettime() - var_1 * 1000;

        if ( var_2 > var_5 )
            wait( ( var_2 - var_5 ) / 1000 );
    }

    self._id_01A9 = var_0;

    if ( isdefined( var_3 ) )
        self.killcamentitylookat = var_3;

    if ( isdefined( var_4 ) )
        self _meth_85C4( var_4 );
}

_id_13715( var_0 )
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );

    if ( !isai( self ) )
    {
        self notifyonplayercommand( "kc_respawn", "+usereload" );
        self notifyonplayercommand( "kc_respawn", "+activate" );

        if ( scripts\mp\killstreaks\orbital_deployment::_id_D39C( "orbital_deployment" ) )
            thread _id_1CA0( var_0 );

        self waittill( "kc_respawn" );
        self._id_3881 = 1;

        if ( var_0 <= 0 )
            scripts\mp\utility\game::_id_41C4( "kc_info" );

        self notify( "abort_killcam" );
    }
}

_id_1CA0( var_0 )
{
    self notifyonplayercommand( "orbital_deployment_action", "+attack" );
    self notifyonplayercommand( "orbital_deployment_action", "+attack_akimbo_accessible" );
    self setclientomnvar( "ui_orbital_deployment_killcam_text", 1 );
    var_1 = scripts\engine\utility::_id_13734( "orbital_deployment_action", "spawned_player" );

    if ( var_1 == "spawned_player" )
    {
        self setclientomnvar( "ui_orbital_deployment_killcam_text", 0 );
        return;
    }

    self._id_3881 = 1;

    if ( var_0 <= 0 )
        scripts\mp\utility\game::_id_41C4( "kc_info" );

    self notify( "abort_killcam" );
    self waittill( "spawned_player" );
    self setclientomnvar( "ui_orbital_deployment_killcam_text", 0 );
    var_2 = scripts\mp\killstreaks\killstreaks::_id_8207( "orbital_deployment" );

    if ( isdefined( var_2 ) )
    {
        var_3 = scripts\mp\killstreaks\killstreaks::_id_7F45( var_2 );
        var_3._id_98F2 = 1;
        scripts\mp\killstreaks\killstreaks::_id_A69A( var_3 );
    }
}

_id_635D()
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );

    for (;;)
    {
        if ( self._id_004A <= 0 )
            break;

        wait 0.05;
    }

    self notify( "abort_killcam" );
}

_id_10855()
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );
    self waittill( "spawned" );
    thread _id_A639( 0 );
}

_id_6315()
{
    self endon( "disconnect" );
    self endon( "killcam_ended" );
    level waittill( "game_ended" );
    thread _id_A639( 1 );
}

clearkillcamomnvars()
{
    _id_41BE();
    self setclientomnvar( "ui_killcam_end_milliseconds", 0 );
    self setclientomnvar( "ui_killcam_killedby_id", -1 );
    self setclientomnvar( "ui_killcam_victim_id", -1 );
    self setclientomnvar( "ui_killcam_killedby_loot_variant_id", -1 );
    self setclientomnvar( "ui_killcam_killedby_weapon_rarity", -1 );
    _id_41BD();

    for ( var_0 = 0; var_0 < 6; var_0++ )
        self setclientomnvar( "ui_killcam_killedby_perk" + var_0, -1 );
}

_id_A639( var_0 )
{
    clearkillcamomnvars();

    if ( level.showingfinalkillcam )
        setomnvarforallclients( "post_game_state", 1 );

    self._id_A636 = undefined;
    var_1 = level.showingfinalkillcam;

    if ( !var_1 )
        _id_F68F( "unknown", -1, -1 );

    if ( !level._id_7669 )
        scripts\mp\utility\game::_id_41C4( "kc_info" );

    thread _id_0AF0::_id_F857();
    self notify( "killcam_ended" );

    if ( !var_0 )
        return;

    scripts\mp\utility\game::updatesessionstate( "dead" );
    scripts\mp\utility\game::_id_41BF();
}

clearlootweaponomnvars()
{
    self setclientomnvar( "ui_killcam_killedby_loot_variant_id", -1 );
    self setclientomnvar( "ui_killcam_killedby_weapon_rarity", -1 );
}

_id_41BE()
{
    self setclientomnvar( "ui_killcam_killedby_item_type", -1 );
    self setclientomnvar( "ui_killcam_killedby_item_id", -1 );
}

_id_F76D( var_0, var_1 )
{
    self setclientomnvar( "ui_killcam_killedby_item_type", var_0 );
    self setclientomnvar( "ui_killcam_killedby_item_id", var_1 );
}

_id_F773( var_0, var_1 )
{
    var_0 = scripts\mp\utility\game::_id_13CA1( var_0, var_1 );
    var_2 = scripts\mp\utility\game::_id_8234( var_0 );
    var_3 = tablelookuprownum( "mp/statsTable.csv", 4, var_2 );

    if ( !isdefined( var_3 ) || var_3 < 0 )
    {
        _id_F76D( -1, -1 );
        return;
    }

    var_4 = scripts\mp\loot::_id_7F82( var_0 );

    if ( isdefined( var_4 ) )
    {
        self setclientomnvar( "ui_killcam_killedby_loot_variant_id", var_4._id_1318B );
        self setclientomnvar( "ui_killcam_killedby_weapon_rarity", var_4._id_DB52 - 1 );
    }
    else
    {
        self setclientomnvar( "ui_killcam_killedby_loot_variant_id", -1 );
        self setclientomnvar( "ui_killcam_killedby_weapon_rarity", -1 );
    }

    self setclientomnvar( "ui_killcam_killedby_weapon_rarity_notify", gettime() );
    _id_F76D( 0, var_3 );

    if ( var_2 != "iw7_knife" )
    {
        var_5 = getweaponattachments( var_0 );

        if ( !isdefined( var_5 ) )
            var_5 = [];

        var_6 = 0;

        for ( var_7 = 0; var_7 < var_5.size; var_7++ )
        {
            var_8 = var_5[var_7];
            var_9 = scripts\mp\utility\game::_id_2494( var_8 );

            if ( scripts\mp\weapons::_id_9F3C( var_2, var_9 ) )
            {
                if ( var_6 >= 6 )
                    break;

                var_10 = tablelookuprownum( "mp/attachmentTable.csv", 4, var_8 );
                self setclientomnvar( "ui_killcam_killedby_attachment" + ( var_6 + 1 ), var_10 );
                var_6++;
            }
        }

        for ( var_7 = var_6; var_7 < 6; var_7++ )
            self setclientomnvar( "ui_killcam_killedby_attachment" + ( var_7 + 1 ), -1 );
    }
}

_id_F772( var_0 )
{
    var_1 = scripts\mp\supers::_id_7F0D( var_0 );
    _id_F76D( 2, var_1 );
    clearlootweaponomnvars();
    _id_41BD();
}

_id_F76E( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_7F44( level._id_A6C5[var_0] );

    if ( isdefined( var_1 ) )
    {
        var_2 = var_1._id_92B8;
        var_3 = var_1.rarity;
        self setclientomnvar( "ui_killcam_killedby_item_type", 1 );
        self setclientomnvar( "ui_killcam_killedby_loot_variant_id", var_2 );
        self setclientomnvar( "ui_killcam_killedby_weapon_rarity", var_3 - 1 );
    }
    else
    {
        _id_F76D( 1, var_2 );
        clearlootweaponomnvars();
    }

    _id_41BD();
}

_id_F771( var_0 )
{
    var_1 = level._id_D7A4[var_0];
    var_2 = level._id_D782[var_1]._id_92B8;
    _id_F76D( 3, var_2 );
    clearlootweaponomnvars();
    _id_41BD();
}

_id_F76F( var_0 )
{
    _id_F76D( 4, var_0 );
    clearlootweaponomnvars();
    _id_41BD();
}

_id_41BD()
{
    for ( var_0 = 0; var_0 < 6; var_0++ )
        self setclientomnvar( "ui_killcam_killedby_attachment" + ( var_0 + 1 ), -1 );
}

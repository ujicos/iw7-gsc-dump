// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    var_0 = [];
    var_0["dm"] = 4;
    var_0["war"] = 5;
    var_0["sd"] = 6;
    var_0["dom"] = 7;
    var_0["conf"] = 8;
    var_0["sr"] = 9;
    var_0["grind"] = 10;
    var_0["ball"] = 11;
    var_0["infect"] = 12;
    var_0["aliens"] = 13;
    var_0["gun"] = 14;
    var_0["grnd"] = 15;
    var_0["siege"] = 16;
    var_0["koth"] = 17;
    var_0["mp_zomb"] = 18;
    var_0["ctf"] = 19;
    var_0["dd"] = 20;
    var_0["tdef"] = 21;
    var_0["front"] = 22;
    var_1 = level.gametype;

    if ( !isdefined( var_1 ) )
        var_1 = getdvar( "g_gametype" );

    var_2 = 0;

    for (;;)
    {
        var_3 = tablelookupbyrow( "mp/score_event_table.csv", var_2, 0 );

        if ( !isdefined( var_3 ) || var_3 == "" )
            break;

        var_4 = tablelookupbyrow( "mp/score_event_table.csv", var_2, var_0[var_1] );

        if ( !isdefined( var_4 ) || var_4 == "" )
        {
            var_2++;
            continue;
        }

        if ( var_3 == "win" || var_3 == "loss" || var_3 == "tie" )
            var_4 = float( var_4 );
        else
            var_4 = int( var_4 );

        if ( var_4 != -1 )
            scripts\mp\rank::_id_DF0A( var_3, "value", var_4 );

        var_5 = tablelookuprownum( "mp/score_event_table.csv", 0, var_3 );
        scripts\mp\rank::_id_DF0A( var_3, "eventID", var_5 );
        var_5 = tablelookupbyrow( "mp/score_event_table.csv", var_2, 1 );
        scripts\mp\rank::_id_DF0A( var_3, "text", var_5 );
        var_6 = tablelookuprownum( "mp/splashTable.csv", 0, var_3 );

        if ( isdefined( var_6 ) && var_6 != -1 )
            scripts\mp\rank::_id_DF0A( var_3, "splashID", var_6 );

        var_7 = tablelookupbyrow( "mp/score_event_table.csv", var_2, 3 );
        scripts\mp\rank::_id_DF0A( var_3, "group", var_7 );
        var_8 = tablelookupbyrow( "mp/score_event_table.csv", var_2, 2 );

        if ( isdefined( var_8 ) && tolower( var_8 ) == "true" )
            scripts\mp\rank::_id_DF0A( var_3, "allowBonus", 1 );

        var_2++;
    }

    level._effect["money"] = loadfx( "vfx/props/cash_player_drop" );
    level._id_C234 = 0;
    level thread _id_C56E();
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_A653 = [];
        var_0._id_A64E = [];
        var_0._id_A9A3 = undefined;
        var_0._id_8549 = 0;
        var_0._id_DDC2 = 0;
        var_0._id_DDC1 = 0;
        var_0._id_A9A9 = 0;
        var_0._id_A9A2 = 0;
        var_0._id_4D44 = [];
        var_0 thread _id_B9C5();
        var_0 thread _id_B9DF();
        var_0 thread events_monitorslide();
    }
}

_id_4D43( var_0, var_1, var_2 )
{
    if ( var_1 < 50 && var_1 > 10 )
    {
        thread scripts\mp\utility\game::_id_83B4( "damage", var_2 );
        level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_damaged_light", undefined, 0.1 );
    }
    else
    {
        thread scripts\mp\utility\game::_id_83B4( "heavy_damage", var_2 );
        level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_damaged_heavy", undefined, 0.1 );
    }
}

_id_A652( var_0, var_1, var_2, var_3 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "killedPlayerNotify" );
    self endon( "killedPlayerNotify" );

    if ( !isdefined( self._id_A67A ) )
        self._id_A67A = 0;

    self._id_A67A++;

    if ( var_3 == "MOD_PISTOL_BULLET" || var_3 == "MOD_RIFLE_BULLET" || var_3 == "MOD_HEAD_SHOT" )
    {
        if ( !isdefined( self._id_3247 ) )
            self._id_3247 = 1;
        else
        {
            self._id_3247++;

            if ( self._id_3247 >= 2 )
            {
                if ( scripts\mp\utility\game::_id_12D6( "passive_collat_streak" ) )
                {
                    var_4 = scripts\mp\perks\weaponpassives::_id_804E( "passive_collat_streak" );
                    self [[ var_4 ]]();
                }
            }

            if ( self._id_3247 == 2 )
            {
                level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_killfirm_twofer", undefined, 0.75 );
                thread scripts\mp\awards::givemidmatchaward( "one_shot_two_kills" );
                thread scripts\mp\missions::_id_D995();
                var_5 = getweaponbasename( var_2 );

                if ( var_5 == "iw7_penetrationrail_mp" )
                    thread scripts\mp\missions::_id_D991( "ch_sniper_ballista_collateral" );
            }

            if ( self._id_3247 == 3 )
                level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_killfirm_threefer", undefined, 0.75 );
        }
    }

    waittillframeend;
    thread _id_C165( var_0, var_1, var_2, var_3, self._id_A67A );
    self._id_A67A = 0;
    self._id_3247 = 0;
}

_id_C165( var_0, var_1, var_2, var_3, var_4 )
{
    for ( var_5 = 0; var_5 < var_4; var_5++ )
    {
        self notify( "got_a_kill", var_1, var_2, var_3 );
        wait 0.05;
    }
}

_id_A651( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = var_1.guid;
    var_7 = self.guid;
    var_8 = gettime();
    thread _id_A652( var_0, var_1, var_2, var_3 );
    thread _id_12EFE( var_0, var_1, var_2 );
    thread _id_12EF8( self );
    self._id_A9A9 = gettime();
    self._id_A9A4 = var_1;

    if ( self.deaths > 0 )
    {
        var_9 = self.kills / self.deaths;

        if ( var_9 > 3.0 )
            level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_kd_high", undefined, 0.75 );
    }
    else if ( self.kills > 5 )
        level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_kd_high", undefined, 0.75 );

    self._id_B930 = [];
    level._id_C234++;
    self._id_4D44[var_6] = undefined;
    _id_3E24( var_2, var_3 );
    var_10 = scripts\mp\utility\game::_id_8225( var_2 );
    var_11 = scripts\mp\utility\game::_id_8234( var_2 );

    if ( !scripts\mp\utility\game::_id_9E6C( var_2 ) && !scripts\mp\utility\game::isjuggernaut() && !scripts\mp\utility\game::_id_12D6( "specialty_explosivebullets" ) )
    {
        if ( var_2 == "none" )
            return 0;

        if ( var_10 == "weapon_sniper" && var_3 != "MOD_MELEE" && gettime() == var_1.attackerdata[self.guid].firsttimedamaged && !( issubstr( var_2, "iw7_longshot_mp" ) && scripts\mp\weapons::_id_9D3E( var_2 ) ) )
        {
            if ( !isdefined( self.pers["oneShotKills"] ) )
                self.pers["oneShotKills"] = 1;
            else
                self.pers["oneShotKills"]++;

            self._id_B930["oneshotkill"] = 1;
            thread scripts\mp\awards::givemidmatchaward( "one_shot_kill" );
        }

        if ( var_10 == "weapon_shotgun" && var_3 != "MOD_MELEE" && gettime() == var_1.attackerdata[self.guid].firsttimedamaged )
            self._id_B930["oneshotkill_shotgun"] = 1;

        if ( var_3 == "MOD_MELEE" && var_2 != "iw7_reaperblade_mp" )
        {
            if ( var_10 != "weapon_melee" )
                thread scripts\mp\awards::givemidmatchaward( "gun_butt" );

            if ( var_11 == "iw7_fists" )
                thread scripts\mp\awards::givemidmatchaward( "fist_kill" );
        }

        var_12 = var_1 _meth_854D();

        if ( var_12 == "frag_grenade_mp" || var_12 == "cluster_grenade_mp" )
            self._id_B930["cooking"] = 1;

        if ( isdefined( self.assistedsuicide ) && self.assistedsuicide )
            assistedsuicide( var_0, var_2, var_3, var_1 );

        if ( level._id_C234 == 1 )
        {
            _id_6DE1( var_0, var_2, var_3, var_1 );

            if ( level.gametype == "sd" )
                scripts\mp\utility\game::_id_F79E( 21, self.team, self getentitynumber() );
        }

        if ( self.pers["cur_death_streak"] > 3 )
            _id_4417( var_0, var_2, var_3, var_1 );

        if ( var_3 == "MOD_HEAD_SHOT" )
        {
            level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_killfirm_headshot", undefined, 0.75 );
            _id_8C9B( var_0, var_2, var_3, var_1 );
        }

        if ( isdefined( self._id_1391E ) && self._id_1391E && gettime() - self._id_10916 <= 5000 )
            self._id_B930["jackintheboxkill"] = 1;

        if ( !scripts\mp\utility\game::isreallyalive( self ) && isdefined( self.deathtime ) )
        {
            var_13 = gettime() - self.deathtime;

            if ( var_13 < 1500 && var_13 > 0 )
                _id_D6F7( var_0, var_1, var_2 );

            if ( scripts\mp\utility\game::issimultaneouskillenabled() )
            {
                if ( var_13 == 0 && isdefined( self._id_01B1 ) && self._id_01B1 == var_1 )
                {
                    thread scripts\mp\awards::givemidmatchaward( "simultaneous_kill", undefined, undefined, 1 );
                    var_1 thread scripts\mp\awards::givemidmatchaward( "simultaneous_kill", undefined, undefined, 1 );
                    thread events_playertracksimultaneouskill();
                    var_1 thread events_playertracksimultaneouskill();
                }
            }
        }

        if ( level.teambased && var_8 - var_1._id_A9A9 < 1500 )
        {
            if ( var_1._id_A9A4 != self )
                _id_26A5( var_0, var_2, var_3, var_1 );
        }

        foreach ( var_16, var_15 in var_1._id_4D44 )
        {
            if ( var_16 == self.guid )
                continue;

            if ( level.teambased && var_8 - var_15 < 1750 )
                _id_5082( var_0, var_2, var_3, var_1 );
        }

        if ( isdefined( var_1._id_2502 ) )
            var_17 = var_1._id_2502;
        else
            var_17 = self.origin;

        var_18 = 1;

        if ( isdefined( var_5 ) )
            var_18 = var_5 == self;

        if ( var_18 )
        {
            if ( _id_9F03( self, var_2, var_3, var_17, var_1 ) )
                thread _id_D63F( var_0, var_2, var_3, var_1 );
            else if ( _id_9E84( self, var_2, var_3, var_17, var_1 ) )
                thread _id_AFEA( var_0, var_2, var_3, var_1 );
        }

        if ( _id_9D5F( self, var_1, var_3 ) )
        {
            if ( var_11 == "iw7_knife" )
                thread scripts\mp\awards::givemidmatchaward( "backstab" );

            self._id_B930["backstab"] = 1;
        }

        if ( var_18 )
        {
            if ( _id_9F90( self ) )
                thread _id_8373( "low_health_kill", var_0, var_2, var_3, var_1, "low_health_kill" );

            if ( scripts\mp\utility\game::_id_9EE8() )
                self._id_B930["ads"] = 1;
            else if ( scripts\engine\utility::_id_9D74( var_3 ) )
                self._id_B930["hipfire"] = 1;

            if ( !self isonground() )
                self._id_B930["airborne"] = 1;

            if ( level.teambased )
            {
                foreach ( var_20 in level.players )
                {
                    if ( self.team != var_20.team || self == var_20 )
                        continue;

                    if ( !scripts\mp\utility\game::isreallyalive( var_20 ) )
                        continue;

                    if ( distancesquared( self.origin, var_20.origin ) < 90000 )
                    {
                        self._id_B930["buddy_kill"] = 1;
                        break;
                    }
                }
            }
        }
        else if ( var_10 == "weapon_projectile" )
        {
            if ( isdefined( var_5 ) && isdefined( var_5.adsfire ) )
            {
                if ( var_5.adsfire )
                    self._id_B930["ads"] = 1;
                else
                    self._id_B930["hipfire"] = 1;
            }
        }

        if ( !var_1 isonground() && !var_1 iswallrunning() && ( !self isonground() && !self iswallrunning() ) )
        {
            if ( var_18 )
                thread _id_8373( "air_to_air_kill", var_0, var_2, var_3, var_1, "air_to_air_kill" );
        }
        else
        {
            if ( var_18 )
            {
                if ( self iswallrunning() )
                    thread _id_8373( "wallkill", var_0, var_2, var_3, var_1, "wallrun_kill" );
                else if ( _id_9DB7( self, var_2, var_3, var_17, var_1 ) )
                    thread _id_8373( "jumpkill", var_0, var_2, var_3, var_1, "air_kill" );
                else if ( events_issliding() )
                {
                    thread _id_8373( "slidekill", var_0, var_2, var_3, var_1, "slide_kill" );
                    self._id_B930["sliding"] = 1;
                }

                var_22 = self getstance();

                switch ( var_22 )
                {
                    case "prone":
                        self._id_B930["prone_kill"] = 1;
                        break;
                    case "crouch":
                        self._id_B930["crouch_kill"] = 1;
                        break;
                }
            }

            if ( var_1 iswallrunning() )
                thread _id_8373( "killonwall", var_0, var_2, var_3, var_1, "kill_wallrunner" );
            else if ( _id_9F58( self, var_2, var_3, var_17, var_1 ) )
                thread _id_8373( "killinair", var_0, var_2, var_3, var_1, "kill_jumper" );
        }

        if ( var_18 )
        {
            if ( scripts\mp\weapons::_id_85BE() )
                self._id_B930["clutchkill"] = 1;
        }

        if ( isdefined( var_1._id_A6AB ) )
        {
            foreach ( var_26, var_24 in var_1._id_A6AB )
            {
                var_25 = var_26 - var_1.score;

                if ( var_25 > 0 && var_25 < 100 )
                    _id_32FA( var_0, var_1, var_2, var_3, var_1 );
            }
        }

        if ( var_18 )
        {
            if ( self _meth_81AD() )
                thread scripts\mp\awards::givemidmatchaward( "mantle_kill" );

            if ( scripts\mp\weapons::_id_9F81() )
                thread scripts\mp\awards::givemidmatchaward( "stunned_kill" );

            if ( isdefined( self._id_119DF[var_2] ) && self._id_119DF[var_2] == var_1 )
                thread scripts\mp\awards::givemidmatchaward( "backfire" );
        }

        if ( isdefined( var_1._id_1117F ) )
            level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_killfirm_semtex", undefined, 0.75 );

        if ( scripts\mp\weapons::_id_9FA9( var_2 ) )
            thread scripts\mp\awards::givemidmatchaward( "throwingknife_kill" );

        if ( level.teambased )
        {
            var_27 = 0;

            foreach ( var_29 in level._id_115D8[scripts\mp\utility\game::_id_8027( self.team )] )
            {
                if ( var_29.score > 0 )
                {
                    var_27 = 1;
                    break;
                }
            }

            if ( var_27 )
            {
                var_31 = scripts\engine\utility::_id_22C3( level._id_115D8[scripts\mp\utility\game::_id_8027( self.team )], ::_id_9CAE );

                if ( isdefined( var_31[0] ) && var_1 == var_31[0] )
                    thread scripts\mp\awards::givemidmatchaward( "first_place_kill" );
            }
        }
        else
        {
            var_27 = 0;

            foreach ( var_29 in level.players )
            {
                if ( var_29.score > 0 )
                {
                    var_27 = 1;
                    break;
                }
            }

            if ( var_27 )
            {
                var_31 = scripts\engine\utility::_id_22C3( level.players, ::_id_9CAE );

                if ( isdefined( var_31[0] ) && var_1 == var_31[0] )
                {
                    thread scripts\mp\awards::givemidmatchaward( "first_place_kill" );

                    if ( level.gametype == "gun" && var_3 == "MOD_MELEE" )
                        thread scripts\mp\awards::givemidmatchaward( "mode_gun_melee_1st_place" );
                }
            }
        }

        var_34 = self.pers["cur_kill_streak"] + 1;

        if ( !( var_34 % 5 ) )
        {
            if ( !isdefined( self._id_A9A6 ) || var_34 != self._id_A9A6 )
            {
                thread scripts\mp\utility\game::_id_115DE( "callout_kill_streaking", self, undefined, var_34 );
                self._id_A9A6 = var_34;
            }

            if ( var_34 <= 30 )
                thread scripts\mp\awards::givemidmatchaward( "streak_" + var_34 );
        }
        else if ( !( var_34 % 7 ) )
            scripts\mp\utility\game::_id_F79E( 17, self.team, self getentitynumber(), 7 );

        if ( var_34 > 30 )
            thread scripts\mp\awards::givemidmatchaward( "streak_max" );

        if ( isdefined( var_5 ) && scripts\mp\utility\game::istrue( var_5._id_9F07 ) && var_3 == "MOD_IMPACT" && !scripts\mp\weapons::_id_9FA9( var_2 ) )
            thread scripts\mp\awards::givemidmatchaward( "item_impact" );

        if ( scripts\mp\utility\game::getgametypenumlives() >= 1 )
        {
            if ( var_1.pers["lives"] == 0 )
                thread scripts\mp\awards::givemidmatchaward( "mode_x_eliminate" );

            var_35 = scripts\mp\utility\game::_id_808A();

            if ( var_35.size == 1 && var_35[0] == self )
                thread scripts\mp\awards::givemidmatchaward( "mode_x_last_alive" );
        }

        if ( var_2 == "groundpound_mp" )
            level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_pound", undefined, 0.75 );

        _id_3E50( var_1, var_5, var_2, var_3 );
        _id_3E51( var_1, var_2, var_3 );
        thread _id_3E27( var_0, var_1, var_2, var_3, var_4 );
    }

    if ( !isdefined( self._id_A653[var_6] ) )
        self._id_A653[var_6] = 0;

    if ( !isdefined( var_1._id_A64E[var_7] ) )
        var_1._id_A64E[var_7] = 0;

    self._id_A653[var_6]++;
    var_1._id_A64E[var_7]++;
    var_1._id_A9A3 = self;
    scripts\mp\utility\game::_id_316C( "kill_event_buffered", var_1, var_2, var_3, self._id_B930 );
}

_id_3E24( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_9E6C( var_0 );

    if ( var_2 )
    {
        var_3 = level._id_A6C5[var_0];

        switch ( var_3 )
        {
            case "sentry_shock":
                thread scripts\mp\awards::givemidmatchaward( "ss_kill_sentry_shock" );
                break;
            case "ball_drone_backup":
                thread scripts\mp\awards::givemidmatchaward( "ss_kill_ball_drone_backup" );
                break;
            case "drone_hive":
                thread scripts\mp\awards::givemidmatchaward( "ss_kill_trinity" );
                break;
            case "precision_airstrike":
                thread scripts\mp\awards::givemidmatchaward( "ss_kill_precision_airstrike" );
                break;
            case "minijackal":
                thread scripts\mp\awards::givemidmatchaward( "ss_kill_minijackal" );
                break;
            case "thor":
                thread scripts\mp\awards::givemidmatchaward( "ss_kill_thor" );
                break;
            case "bombardment":
                thread scripts\mp\awards::givemidmatchaward( "ss_kill_bombardment" );
                break;
            case "remote_c8":
                thread scripts\mp\awards::givemidmatchaward( "ss_kill_remote_c8" );
                break;
            case "venom":
                thread scripts\mp\awards::givemidmatchaward( "ss_kill_venom" );
                break;
            case "jackal":
                thread scripts\mp\awards::givemidmatchaward( "ss_kill_jackal" );
                break;
            default:
                thread scripts\mp\utility\game::_id_83B4( "killstreak_full_score", var_0 );
                break;
        }

        level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_killfirm_killstreak", undefined, 0.75 );
    }
}

_id_3E50( var_0, var_1, var_2, var_3 )
{
    var_4 = scripts\mp\supers::_id_9F88();
    var_5 = scripts\mp\supers::_id_7E4F();
    var_6 = scripts\mp\supers::_id_7E4E();
    var_7 = scripts\mp\utility\game::_id_9F8D( var_2 );
    var_8 = undefined;

    if ( !isdefined( var_5 ) )
        return;

    if ( var_7 && var_2 != "iw7_reaperblade_mp" )
    {
        thread _id_A655( var_0, var_1, var_2, var_3 );

        if ( var_3 != "MOD_MELEE" )
            scripts\mp\utility\game::_id_316C( "super_kill_buffered" );

        var_9 = getweaponbasename( var_2 );

        if ( var_9 == "iw7_claw_mp" )
        {
            var_8 = "super_claw_kill";
            level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_super", undefined, 0.75 );
        }
        else if ( var_9 == "iw7_atomizer_mp" )
        {
            var_8 = "super_eraser_kill";
            level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_super", undefined, 0.75 );
        }
        else if ( var_9 == "iw7_blackholegun_mp" )
        {
            var_8 = "super_blackholegun_kill";
            level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_super_kill", undefined, 0.75 );
        }
        else if ( var_9 == "iw7_penetrationrail_mp" )
        {
            var_8 = "super_railgun_kill";
            level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_railgun", undefined, 0.75 );
        }
        else if ( var_9 == "iw7_steeldragon_mp" )
        {
            var_8 = "super_steeldragon_kill";
            level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_dragon", undefined, 0.75 );
        }
        else if ( var_9 == "iw7_armmgs_mp" )
            var_8 = "super_arm2_kill";

        if ( isdefined( var_8 ) )
            thread scripts\mp\utility\game::_id_83B4( var_8 );
    }

    var_10 = 0;

    if ( isdefined( var_5 ) )
    {
        switch ( var_5 )
        {
            case "super_amplify":
                if ( var_4 == 1 )
                {
                    var_8 = "super_combatfocus_kill";
                    var_10 = 1;
                }

                break;
            case "super_overdrive":
                if ( var_4 == 1 )
                {
                    var_8 = "super_overdrive_kill";
                    var_10 = 1;
                }

                break;
            case "super_chargemode":
                if ( var_4 == 1 )
                {
                    var_8 = "super_bullcharge_kill";
                    level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_charge", undefined, 0.75 );
                    var_10 = 1;
                }

                break;
            case "super_armorup":
                if ( var_4 == 1 )
                {
                    var_8 = "super_armorup_kill";
                    level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_armor", undefined, 0.75 );
                    var_10 = 1;
                }

                break;
            case "super_reaper":
                if ( var_4 == 1 )
                {
                    var_8 = "super_reaper_kill";
                    level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_reaper", undefined, 0.75 );
                    var_10 = 1;
                }

                break;
            case "super_rewind":
                if ( var_4 == 1 || isdefined( var_6._id_A986 ) && gettime() < var_6._id_A986 + 3000 )
                {
                    var_8 = "super_rewind_kill";
                    var_10 = 1;
                }

                break;
            case "super_phaseshift":
                if ( var_4 == 1 || isdefined( var_6._id_A986 ) && gettime() < var_6._id_A986 + 3000 )
                {
                    var_8 = "super_phaseshift_kill";
                    level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_killfirm_shift", undefined, 0.75 );
                    var_10 = 1;
                }

                break;
            case "super_teleport":
                if ( var_4 == 1 || isdefined( var_6._id_A986 ) && gettime() < var_6._id_A986 + 3000 )
                {
                    var_8 = "super_teleport_kill";
                    var_10 = 1;
                }

                break;
            case "super_microturret":
                if ( var_2 == "micro_turret_gun_mp" )
                {
                    var_8 = "super_microturret_kill";
                    level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_turret_kill", undefined, 0.75 );
                    var_10 = 1;
                }

                break;
            case "super_invisible":
                if ( var_4 == 1 || isdefined( var_6._id_A986 ) && gettime() < var_6._id_A986 + 2000 )
                {
                    var_8 = "super_invisible_kill";
                    level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_stealth", undefined, 0.75 );
                    var_10 = 1;
                }

                break;
            case "super_visionpulse":
                if ( scripts\mp\supers\super_visionpulse::_id_9EF9( var_0 ) )
                {
                    var_8 = "super_wallhack_kill";
                    var_10 = 1;
                }

                break;
            case "super_kineticpulse":
                if ( scripts\mp\equipment\kinetic_pulse::isplayertaggedbykineticpulse( var_0 ) )
                {
                    var_8 = "super_kineticpulse_kill";
                    var_10 = 1;
                }

                break;
            default:
                break;
        }

        if ( var_10 )
        {
            thread _id_11262( var_5, var_3 );
            scripts\mp\supers::combatrecordsuperkill( var_5 );

            if ( isdefined( var_8 ) )
                thread scripts\mp\utility\game::_id_83B4( var_8 );

            scripts\mp\utility\game::_id_316C( "super_kill_buffered" );
        }
    }
}

_id_3E51( var_0, var_1, var_2 )
{
    var_3 = var_0 scripts\mp\supers::_id_9F88();
    var_4 = var_0 scripts\mp\supers::_id_7E4F();
    var_5 = var_0 scripts\mp\supers::_id_7E4E();

    if ( !isdefined( var_4 ) )
        return;

    switch ( var_4 )
    {
        case "super_armorup":
            if ( var_3 == 1 || isdefined( var_5._id_A986 ) && gettime() - var_5._id_A986 < 1000 )
            {
                if ( isdefined( var_0._id_219F ) && scripts\engine\utility::array_contains( var_0._id_219F, self ) )
                    thread _id_11265( var_0 );
            }

            break;
        case "super_visionpulse":
            if ( var_0 scripts\mp\supers\super_visionpulse::_id_9EF9( self ) )
                thread _id_11265( var_0 );

            break;
        case "super_phaseshift":
            if ( var_3 == 1 || isdefined( var_5._id_A986 ) && gettime() - var_5._id_A986 < 2000 )
                thread _id_11265( var_0 );

            break;
        case "super_teleport":
            if ( var_3 == 1 || isdefined( var_5._id_A986 ) && gettime() - var_5._id_A986 < 2000 )
                thread _id_11265( var_0 );

            break;
        case "super_invisible":
            if ( var_3 == 1 || isdefined( var_5._id_A986 ) && gettime() - var_5._id_A986 < 2000 )
                thread _id_11265( var_0 );

            break;
        case "super_kineticpulse":
            if ( var_0 scripts\mp\equipment\kinetic_pulse::isplayertaggedbykineticpulse( self ) )
                thread _id_11265( var_0 );

            break;
        case "super_rewind":
            if ( var_3 == 1 || isdefined( var_5._id_A986 ) && gettime() - var_5._id_A986 < 2000 )
                thread _id_11265( var_0 );

            break;
        default:
            if ( var_3 == 1 )
                thread _id_11265( var_0 );

            break;
    }
}

_id_A655( var_0, var_1, var_2, var_3 )
{
    var_4 = scripts\mp\supers::_id_8189( var_2 );
    var_5 = self._id_DDC3[var_2];

    if ( isdefined( var_5 ) && var_5 > 0 && var_5 % 2 == 0 )
        _id_11262( var_4, var_3 );
    else
    {
        var_6 = scripts\mp\supers::_id_7E4E();
        var_6._id_C234++;
    }

    scripts\mp\missions::_id_12F33( var_2, var_1 );
    scripts\mp\supers::combatrecordsuperkill( var_4 );
}

_id_11262( var_0, var_1 )
{
    var_2 = scripts\mp\supers::_id_80F6( var_0 );
    var_3 = "super_kill_" + var_2;

    switch ( var_3 )
    {
        case "super_kill_chargemode":
            var_3 = "super_kill_bull_charge";
            break;
    }

    if ( isdefined( level._id_26D8[var_3] ) )
        thread scripts\mp\awards::givemidmatchaward( var_3 );

    var_4 = scripts\mp\supers::_id_7E4E();
    var_4._id_C234++;
    scripts\mp\missions::updatesuperkills( var_0, var_1, var_4._id_C234 );
    self._id_B930["super_kill_medal"] = var_0;
}

_id_A650( var_0, var_1 )
{
    if ( var_0 != "precision_airstrike" )
    {
        var_2 = "kill_ss_" + var_0;
        var_1 thread scripts\mp\awards::givemidmatchaward( var_2 );
    }

    var_1._id_A6B4[var_1._id_A6B4.size] = var_0;
    level thread scripts\mp\battlechatter_mp::_id_EB87( var_1, "plr_killstreak_destroy", undefined, 0.75 );
}

_id_9CAE( var_0, var_1 )
{
    return var_0.score > var_1.score;
}

_id_9E84( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isalive( var_0 ) && !var_0 scripts\mp\utility\game::isusingremote() && ( var_2 == "MOD_RIFLE_BULLET" || var_2 == "MOD_PISTOL_BULLET" || var_2 == "MOD_HEAD_SHOT" ) && !scripts\mp\utility\game::_id_9E6C( var_1 ) && !isdefined( var_0.assistedsuicide ) )
    {
        var_5 = scripts\mp\utility\game::_id_8225( var_1 );

        switch ( var_5 )
        {
            case "weapon_pistol":
                var_6 = 800;
                break;
            case "weapon_beam":
            case "weapon_smg":
                var_6 = 1200;
                break;
            case "weapon_lmg":
            case "weapon_dmr":
            case "weapon_assault":
                var_6 = 1500;
                break;
            case "weapon_rail":
            case "weapon_sniper":
                var_6 = 2000;
                break;
            case "weapon_shotgun":
                var_6 = 500;
                break;
            case "weapon_projectile":
            default:
                var_6 = 1536;
                break;
        }

        var_7 = var_6 * var_6;

        if ( distancesquared( var_3, var_4.origin ) > var_7 )
            return 1;
    }

    return 0;
}

_id_9F03( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isalive( var_0 ) && !var_0 scripts\mp\utility\game::isusingremote() && ( var_2 == "MOD_RIFLE_BULLET" || var_2 == "MOD_PISTOL_BULLET" || var_2 == "MOD_HEAD_SHOT" ) && !scripts\mp\utility\game::_id_9E6C( var_1 ) && !isdefined( var_0.assistedsuicide ) )
    {
        var_5 = 9216;

        if ( distancesquared( var_3, var_4.origin ) < var_5 )
            return 1;
    }

    return 0;
}

_id_9DB7( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isalive( var_0 ) && var_0 isjumping() && scripts\engine\utility::_id_9D74( var_2 ) )
    {
        var_5 = var_0.origin[2] - var_4.origin[2];
        return var_5 > 60;
    }

    return 0;
}

_id_9F58( var_0, var_1, var_2, var_3, var_4 )
{
    return isalive( var_0 ) && var_4 isjumping() && scripts\engine\utility::_id_9D74( var_2 );
}

_id_9D5F( var_0, var_1, var_2 )
{
    if ( !isplayer( var_0 ) || !isplayer( var_1 ) )
        return 0;

    if ( var_2 != "MOD_RIFLE_BULLET" && var_2 != "MOD_PISTOL_BULLET" && var_2 != "MOD_MELEE" && var_2 != "MOD_HEAD_SHOT" )
        return 0;

    var_3 = var_1 getplayerangles();
    var_4 = var_0 getplayerangles();
    var_5 = angleclamp180( var_3[1] - var_4[1] );

    if ( abs( var_5 ) < 80 )
        return 1;

    return 0;
}

_id_9F90( var_0 )
{
    return var_0.health > 0 && var_0.health < var_0.maxhealth * 0.2;
}

_id_3E27( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( self._id_A9A3 ) && self._id_A9A3 == var_1 )
    {
        self._id_A9A3 = undefined;
        _id_E48D( var_0, var_2 );
    }
}

_id_8373( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self._id_B930[var_0] = 1;

    if ( isdefined( var_5 ) )
        thread scripts\mp\awards::givemidmatchaward( var_5 );
    else
        thread scripts\mp\utility\game::_id_83B4( var_0, var_2 );
}

_id_DAC9( var_0 )
{
    self._id_B930["proximityAssist"] = 1;
    thread scripts\mp\utility\game::_id_83B4( "proximityassist" );
}

_id_DACE( var_0 )
{
    self._id_B930["proximityKill"] = 1;
    thread scripts\mp\utility\game::_id_83B4( "proximitykill" );
}

_id_AFEA( var_0, var_1, var_2, var_3 )
{
    self._id_B930["longshot"] = 1;
    thread scripts\mp\matchdata::_id_AFC5( var_0, "longshot" );
    thread scripts\mp\awards::givemidmatchaward( "longshot" );
}

_id_D63F( var_0, var_1, var_2, var_3 )
{
    self._id_B930["pointblank"] = 1;
    thread scripts\mp\matchdata::_id_AFC5( var_0, "pointblank" );
    thread scripts\mp\awards::givemidmatchaward( "pointblank" );
}

_id_8C9B( var_0, var_1, var_2, var_3 )
{
    self._id_B930["headshot"] = 1;
    thread scripts\mp\matchdata::_id_AFC5( var_0, "headshot" );
    thread scripts\mp\awards::givemidmatchaward( "headshot" );
}

_id_26A5( var_0, var_1, var_2, var_3 )
{
    self._id_B930["avenger"] = 1;
    thread scripts\mp\matchdata::_id_AFC5( var_0, "avenger" );
    thread scripts\mp\awards::givemidmatchaward( "avenger" );
}

assistedsuicide( var_0, var_1, var_2, var_3 )
{
    self._id_B930["assistedsuicide"] = 1;
    thread scripts\mp\utility\game::_id_83B4( "assistedsuicide", var_1 );
    thread scripts\mp\matchdata::_id_AFC5( var_0, "assistedsuicide" );
    thread scripts\mp\awards::givemidmatchaward( "assistedsuicide" );
}

_id_5082( var_0, var_1, var_2, var_3 )
{
    self._id_B930["defender"] = 1;
    thread scripts\mp\matchdata::_id_AFC5( var_0, "defender" );
    thread scripts\mp\awards::givemidmatchaward( "save_teammate" );
}

_id_D6F7( var_0, var_1, var_2 )
{
    self._id_B930["posthumous"] = 1;
    thread scripts\mp\matchdata::_id_AFC5( var_0, "posthumous" );
    thread scripts\mp\awards::givemidmatchaward( "posthumous" );
}

_id_E48D( var_0, var_1, var_2 )
{
    self._id_B930["revenge"] = 1;
    thread scripts\mp\matchdata::_id_AFC5( var_0, "revenge" );
    thread scripts\mp\awards::givemidmatchaward( "revenge" );
}

_id_BDC2( var_0, var_1, var_2 )
{
    var_3 = undefined;

    switch ( var_1 )
    {
        case 2:
            var_3 = "double";
            break;
        case 3:
            var_3 = "triple";
            thread scripts\mp\utility\game::_id_115DE( "callout_3xkill", self );
            break;
        case 4:
            var_3 = "four";
            thread scripts\mp\utility\game::_id_115DE( "callout_4xkill", self );
            scripts\mp\utility\game::_id_F79E( 18, self.team, self getentitynumber(), 4 );
            break;
        case 5:
            var_3 = "five";
            thread scripts\mp\utility\game::_id_115DE( "callout_5xkill", self );
            break;
        case 6:
            var_3 = "six";
            thread scripts\mp\utility\game::_id_115DE( "callout_6xkill", self );
            break;
        case 7:
            var_3 = "seven";
            thread scripts\mp\utility\game::_id_115DE( "callout_7xkill", self );
            break;
        case 8:
            var_3 = "eight";
            thread scripts\mp\utility\game::_id_115DE( "callout_8xkill", self );
            break;
        default:
            var_3 = "multi";
            thread scripts\mp\utility\game::_id_115DE( "callout_9xkill", self );
            break;
    }

    thread scripts\mp\matchdata::_id_AFCB( var_0, var_1 );

    if ( isdefined( var_3 ) )
        thread scripts\mp\awards::givemidmatchaward( var_3 );
}

_id_6DE1( var_0, var_1, var_2, var_3 )
{
    self._id_B930["firstblood"] = 1;
    thread scripts\mp\matchdata::_id_AFC5( var_0, "firstblood" );
    thread scripts\mp\utility\game::_id_115DE( "callout_firstblood", self );
    scripts\mp\missions::_id_D992( "ch_bornready" );
    thread scripts\mp\awards::givemidmatchaward( "firstblood" );
}

_id_13D8C( var_0 )
{

}

_id_32FA( var_0, var_1, var_2, var_3, var_2 )
{
    self._id_B930["buzzkill"] = var_2.pers["cur_kill_streak"];
    thread scripts\mp\matchdata::_id_AFC5( var_1, "buzzkill" );
    thread scripts\mp\awards::givemidmatchaward( "buzzkill" );
}

_id_4417( var_0, var_1, var_2, var_3 )
{
    self._id_B930["comeback"] = 1;
    thread scripts\mp\matchdata::_id_AFC5( var_0, "comeback" );
    thread scripts\mp\awards::givemidmatchaward( "comeback" );
}

_id_11265( var_0 )
{
    var_1 = scripts\mp\supers::_id_80F6( var_0._id_11234._id_10E47._id_DE3F );
    self._id_B930["superShutdown"] = var_0._id_11234._id_10E47._id_DE3F;
    var_2 = "super_shutdown_" + var_1;

    switch ( var_1 )
    {
        case "chargemode":
            var_2 = "super_shutdown_bull_charge";
            break;
    }

    if ( isdefined( level._id_26D8[var_2] ) )
        thread scripts\mp\awards::givemidmatchaward( var_2 );
}

_id_5638()
{
    var_0 = self.guid;

    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        if ( isdefined( level.players[var_1]._id_A653[var_0] ) )
            level.players[var_1]._id_A653[var_0] = undefined;

        if ( isdefined( level.players[var_1]._id_A64E[var_0] ) )
            level.players[var_1]._id_A64E[var_0] = undefined;
    }
}

_id_B9DF()
{
    level endon( "end_game" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "healed" );
        thread scripts\mp\utility\game::_id_83B4( "healed" );
    }
}

_id_12EFE( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "updateRecentKills" );
    self endon( "updateRecentKills" );
    self._id_DDC2++;

    if ( scripts\mp\missions::_id_9DBA( var_1.origin ) )
    {
        self._id_DDC1++;

        if ( scripts\mp\missions::_id_9EBC( self._id_DDC1, 2 ) )
            thread scripts\mp\awards::givemidmatchaward( "mode_x_wipeout" );
    }

    if ( !isdefined( self._id_DDC3 ) )
        self._id_DDC3 = [];

    if ( !isdefined( self._id_DDC3[var_2] ) )
        self._id_DDC3[var_2] = 1;
    else
        self._id_DDC3[var_2]++;

    var_3 = scripts\mp\utility\game::_id_7E9D( var_2 );

    if ( isdefined( var_3 ) && var_3 == "lethal" )
    {
        level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_killfirm_grenade", undefined, 0.75 );
        level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_killfirm_amf", undefined, 0.75 );

        if ( self._id_DDC3[var_2] > 0 && self._id_DDC3[var_2] % 2 == 0 )
            thread scripts\mp\awards::givemidmatchaward( "grenade_double" );
    }

    scripts\mp\utility\game::_id_316C( "update_rapid_kill_buffered", self._id_DDC2 );
    wait 4.0;

    if ( self._id_DDC2 > 1 )
        _id_BDC2( var_0, self._id_DDC2, var_1 );

    self._id_DDC2 = 0;
    self._id_DDC1 = 0;
    self._id_DDC3 = undefined;
}

_id_B9C5()
{
    level endon( "end_game" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "hijacker", var_0, var_1 );
        thread scripts\mp\awards::givemidmatchaward( "ss_use_enemy_dronedrop" );
        var_2 = "hijacked_airdrop";
        var_3 = "ch_hijacker";

        switch ( var_0 )
        {
            case "sentry_shock":
                var_2 = "hijacked_sentry";
                break;
            case "juggernaut":
                var_2 = "hijacked_juggernaut";
                break;
            case "maniac":
                var_2 = "hijacked_maniac";
                break;
            case "juggernaut_swamp_slasher":
                var_2 = "hijacked_juggernaut_swamp_slasher";
                break;
            case "juggernaut_predator":
                var_2 = "hijacked_juggernaut_predator";
                break;
            case "juggernaut_death_mariachi":
                var_2 = "hijacked_juggernaut_death_mariachi";
                break;
            case "remote_tank":
                var_2 = "hijacked_remote_tank";
                break;
            case "emergency_airdrop":
            case "mega":
                var_2 = "hijacked_emergency_airdrop";
                var_3 = "ch_newjack";
                break;
            default:
                break;
        }

        if ( isdefined( var_1 ) )
            var_1 scripts\mp\hud_message::showsplash( var_2, undefined, self );

        self notify( "process", var_3 );
    }
}

_id_12EF8( var_0 )
{
    if ( isdefined( level._id_DB50 ) && gettime() - level._id_DB50._id_10DFF > 5000 )
        level._id_DB50 = undefined;

    if ( !isdefined( level._id_DB50 ) || level._id_DB50.player != var_0 )
    {
        var_1 = spawnstruct();
        var_1.player = var_0;
        var_1._id_10DFF = gettime();
        var_1._id_6BC5 = 1;
        level._id_DB50 = var_1;
    }
    else
    {
        var_1 = level._id_DB50;
        var_1._id_6BC5++;

        if ( var_1._id_6BC5 == 4 )
        {
            var_1.player thread scripts\mp\awards::givemidmatchaward( "quad_feed" );
            level._id_DB50 = undefined;
        }
    }
}

events_monitorslide()
{
    self endon( "disconnect" );
    self notify( "events_monitorSlide" );
    self endon( "events_monitorSlide" );
    self.eventswassliding = self _meth_81BE();
    self.eventsslideendtime = undefined;

    for (;;)
    {
        events_monitorslideupdate();
        wait 0.05;
    }
}

events_monitorslideupdate()
{
    if ( scripts\mp\utility\game::isreallyalive( self ) )
    {
        var_0 = self _meth_81BE();

        if ( self.eventswassliding && !var_0 )
            self.eventsslideendtime = gettime();

        self.eventswassliding = var_0;
    }
    else
    {
        self.eventswassliding = 0;
        self.eventsslideendtime = undefined;
    }
}

events_issliding()
{
    if ( self _meth_81BE() )
        return 1;

    events_monitorslideupdate();

    if ( isdefined( self.eventsslideendtime ) )
    {
        if ( gettime() - self.eventsslideendtime <= 150 )
            return 1;
    }

    return 0;
}

events_playertracksimultaneouskill()
{
    self endon( "disconnect" );
    self.simultaneouskill = 1;
    scripts\engine\utility::waitframe();
    self.simultaneouskill = undefined;
}

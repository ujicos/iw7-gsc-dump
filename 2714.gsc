// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

callback_playerdamage_internal( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 )
{
    if ( isdefined( var_1 ) && scripts\mp\utility\game::istrue( level.jittermodcheck ) && level.jittermodcheck == 2 && scripts\mp\utility\game::istrue( var_1.ismodded ) )
        var_3 = 0;
    else
    {
        if ( isdefined( var_1 ) && var_1.classname == "worldspawn" )
            var_1 = undefined;

        if ( isdefined( var_1 ) && isdefined( var_1._id_8712 ) )
            var_1 = var_1._id_8712;

        if ( !scripts\mp\utility\game::_id_766C( "prematch_done" ) )
            return "finished";

        var_14 = gettime();
        var_15 = var_2.health;

        if ( isplayer( var_2 ) )
        {
            var_2._id_AA47 = var_2 getcurrentweapon();
            var_2._id_13905 = var_2 scripts\mp\utility\game::_id_9EE8();

            if ( var_2._id_13905 )
                var_2._id_A98B = gettime();
        }

        if ( !level.tactical )
            var_4 |= level.idflags_no_knockback;

        if ( _id_B4CA( var_2, var_1, var_6 ) )
            return;

        if ( var_5 == "MOD_FALLING" && isdefined( var_2._id_115FC ) && var_2._id_115FC )
            var_1 = var_2._id_115FD;

        var_16 = 0.0;

        if ( var_4 & level.idflags_stun )
        {
            var_16 = 0.0;
            var_3 = 0;
        }

        var_17 = _id_6C19( var_0, var_1, var_2, var_3, var_5, var_6, var_9 );

        if ( isdefined( var_17 ) )
            return var_17;

        var_18 = scripts\mp\utility\game::_id_24F0( var_2, var_1 );

        if ( var_18 )
        {
            var_3 = _id_89A7( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_16, var_11, var_12 );

            if ( var_3 == 0 )
                return;
        }

        if ( scripts\mp\utility\game::istrue( var_2._id_10902 ) )
        {
            var_19 = isdefined( var_1.classname ) && var_1.classname == "trigger_hurt";

            if ( !var_19 )
            {
                _id_898D( var_0, var_1, var_2, 0, var_5, var_6, var_9, var_4, 1, 1 );
                return "finished";
            }
        }

        var_20 = scripts\mp\utility\game::_id_7E9D( var_6 );

        if ( isdefined( var_20 ) )
        {
            if ( var_20 == "lethal" )
                var_3 = _id_ABC3( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
            else if ( var_20 == "equipment_other" )
            {
                if ( var_6 == "bouncingbetty_mp" )
                {
                    if ( !scripts\mp\weapons::_id_B767( var_0, var_2 ) )
                        var_3 = 0;
                    else if ( var_2 getstance() == "crouch" || var_2 getstance() == "prone" )
                        var_3 = int( var_3 / 2 );
                }

                if ( var_6 == "portal_grenade_mp" && var_3 != 400 )
                    var_2 thread scripts\mp\equipment\portal_grenade::_id_D68E( var_0, var_1 );
            }
        }

        var_21 = scripts\mp\utility\game::_id_8238( var_6 );

        if ( var_21 == "killstreak" )
        {
            var_3 = _id_A696( var_1, var_2, var_3, var_6, var_5 );

            if ( var_3 == 0 )
                return;

            if ( var_6 == "killstreak_jammer_mp" )
                return "sWeapon == killstreak_jammer_mp";

            if ( isdefined( level._id_1541 ) && isdefined( var_1 ) && level._id_1541 == var_1 )
                level notify( "ai_pain", var_2 );
        }

        var_3 = _id_B939( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
        var_3 = _id_89DD( var_0, var_2, var_1, var_3, var_5, var_6, var_7, var_8, var_9, var_4 );

        if ( isstring( var_3 ) )
            return var_3;

        if ( scripts\mp\utility\game::_id_9EF0( var_2 ) )
        {
            var_3 = var_2 _id_0DC9::_id_7FBD( var_1, var_6, var_5, var_3, var_2.maxhealth, 3, 4, 6, 0 );

            if ( isdefined( var_1 ) && isplayer( var_1 ) && scripts\mp\equipment\phase_shift::_id_9DDF( var_1 ) )
                var_3 = 0;
        }

        if ( isplayer( var_1 ) )
            var_1 scripts\mp\perks\weaponpassives::_id_3E01();

        var_22 = _id_3696( var_2, var_1, var_3, var_5, var_6, var_7, var_8, var_9, var_0, 0, var_4 );
        var_3 = var_22[0];
        var_23 = var_22[1];
        var_24 = var_22[2];
        var_25 = var_23 != 0 || var_24 != 0;
        var_9 = var_22[3];

        if ( isdefined( var_2.forcehitlocation ) )
            var_9 = var_2.forcehitlocation;

        scripts\mp\perks\perkfunctions::_id_324B( var_1, var_2, var_6, var_5 );

        if ( var_3 >= var_2.health && scripts\engine\utility::string_starts_with( var_6, "iw7_penetrationrail_mp" ) && var_5 != "MOD_MELEE" || var_3 >= var_2.health && scripts\engine\utility::string_starts_with( var_6, "iw7_nunchucks_mpl" ) && var_5 == "MOD_MELEE" )
        {
            var_26 = scripts\mp\weapons::impale_endpoint( var_7, var_8 );
            var_27 = scripts\mp\weapons::trace_impale( var_7, var_26 );

            if ( var_27["hittype"] != "hittype_world" )
            {
                var_28 = ( var_8[0], var_8[1], var_8[2] );

                if ( var_28[2] > -0.3 && var_28[2] < 0.1 )
                {
                    var_28 = ( var_28[0], var_28[1], 0.1 );
                    vectornormalize( var_28 );
                }

                var_2 _meth_84DC( var_28, 650.0 );
            }
        }

        if ( isai( self ) )
            self [[ level.bot_funcs["on_damaged"] ]]( var_1, var_3, var_5, var_6, var_0, var_9 );

        if ( isplayer( var_1 ) && ( var_6 == "smoke_grenade_mp" || var_6 == "throwingknife_mp" || var_6 == "throwingknifeteleport_mp" || var_6 == "throwingknifesmokewall_mp" || var_6 == "gas_grenade_mp" || var_6 == "throwingreaper_mp" ) )
            var_1 thread scripts\mp\gamelogic::_id_117B7( var_6, 1, "hits" );

        if ( var_5 == "MOD_FALLING" )
            var_2 thread _id_612A( var_3 );

        if ( !isdefined( var_8 ) )
            var_4 |= level.idflags_no_knockback;

        if ( isdefined( var_1 ) && var_1.classname == "script_origin" && isdefined( var_1.type ) && var_1.type == "soft_landing" )
            return "soft_landing";

        _id_AF95( var_2, var_1, var_0, var_6, var_3, var_7, var_8, var_9, var_10, var_5 );

        if ( isdefined( var_0 ) && isdefined( var_0.owner ) && var_0.owner.team != var_2.team )
            var_2._id_A970 = 1;
        else
            var_2._id_A970 = isdefined( var_1 ) && var_1 != var_2;

        if ( var_2._id_A970 )
        {
            var_29 = gettime();
            var_1._id_4D44[var_2.guid] = var_29;
            var_2._id_A965 = var_29;
        }

        var_2 _id_12EFD( var_3, var_1, var_9, var_5 );

        if ( scripts\mp\codcasterclientmatchdata::_id_10036() )
        {
            if ( isplayer( var_1 ) )
            {
                var_30 = scripts\mp\codcasterclientmatchdata::_id_7E39( var_1, "damageDone" );
                scripts\mp\codcasterclientmatchdata::_id_F695( var_1, "damageDone", var_30 + var_3 );
            }
        }

        var_2 thread scripts\mp\missions::_id_D378( var_0, var_1, var_3, var_5, var_6, var_9 );

        if ( isdefined( var_1 ) && var_3 != 0 )
        {
            var_1 notify( "victim_damaged", var_2, var_0, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
            var_1 scripts\mp\contractchallenges::contractplayerdamaged( var_3 );
        }

        var_31 = var_8;

        if ( isdefined( var_4 ) && var_4 & level.idflags_no_team_protection && var_3 < self.health )
            var_31 = var_2.origin - var_1.origin;

        var_2 _id_6CE1( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_31, var_9, var_10, var_16, var_11, var_12, var_25 );

        if ( var_3 > 10 && isdefined( var_0 ) && !var_2 scripts\mp\utility\game::isusingremote() && isplayer( var_2 ) )
        {
            var_2 thread scripts\mp\shellshock::_id_2BC2( var_0.origin );

            if ( isplayer( var_0 ) && var_5 == "MOD_MELEE" )
            {
                if ( isalive( var_2 ) && !var_2 scripts\mp\utility\game::_id_12D6( "specialty_stun_resistance" ) )
                {
                    var_2 thread _id_B645( 0.75 );
                    var_2._id_904B = gettime();
                }

                var_0 thread scripts\mp\shellshock::_id_2BC3( var_6 );
                var_2 playrumbleonentity( "defaultweapon_melee" );
                var_0 playrumbleonentity( "defaultweapon_melee" );
            }
        }

        if ( isagent( self ) )
        {
            if ( scripts\mp\utility\game::_id_9EF0( self ) )
            {
                if ( var_3 >= self.health )
                {
                    var_3 = self.health - 1;

                    if ( isdefined( self.owner ) )
                        self.owner notify( "player_killstreak_agent_death", self, var_0, var_1, var_3, var_4, var_5, var_6 );
                }
                else
                {
                    self [[ scripts\mp\agents\agent_utility::agentfunc( "on_damaged_finished" ) ]]( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

                    if ( self._id_165A == "remote_c8" )
                    {
                        if ( isdefined( self.owner ) && isdefined( self.owner._id_4BE1 ) && self.owner._id_4BE1 == "MANUAL" )
                            self setclientomnvar( "ui_remote_c8_health", self.health / self.maxhealth );
                    }
                }
            }
            else
                self [[ scripts\mp\agents\agent_utility::agentfunc( "on_damaged_finished" ) ]]( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
        }

        _id_898D( var_0, var_1, var_2, var_3, var_5, var_6, var_9, var_4, var_23, var_24 );
        scripts\mp\gamelogic::_id_F73B( var_2, 1 );

        if ( isdefined( var_1 ) && var_1 != var_2 )
            level._id_130DD = 0;

        if ( isplayer( var_1 ) && isdefined( var_1.pers["participation"] ) )
            var_1.pers["participation"]++;
        else if ( isplayer( var_1 ) )
            var_1.pers["participation"] = 1;

        if ( isdefined( level._id_B3FC ) && isplayer( var_2 ) && isdefined( var_0 ) && isplayer( var_0 ) && scripts\engine\utility::_id_9D74( var_5 ) )
        {
            if ( var_15 == var_2.maxhealth && var_2.health != self.maxhealth )
                var_2._id_658D = gettime();
        }

        if ( _id_1C7E( var_1, var_2, var_6, var_5, var_3 ) )
            var_2 _id_1015A();

        if ( isdefined( var_1 ) && var_1 scripts\mp\utility\game::_id_12D6( "specialty_mark_targets" ) && var_3 > 0 )
            var_1 thread _id_0DD0::_id_B382( var_2, var_5 );
    }
}

_id_B645( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_1 = newclienthudelem( self );
    var_1.x = 0;
    var_1.y = 0;
    var_1._id_002B = "left";
    var_1._id_002C = "top";
    var_1._id_02A4 = 1;
    var_1._id_017D = "fullscreen";
    var_1._id_0382 = "fullscreen";
    var_1.alpha = 0;
    var_1._id_0142 = 1;
    var_1 setshader( "black", 640, 480 );
    thread _id_B9F3( var_1 );
    self shellshock( "melee_mp", var_0 );
    self _meth_844F( 0.35, 0.5, self.origin, 100 );
    self setclientomnvar( "ui_hud_shake", 1 );
    var_1 fadeovertime( 0.1 );
    var_1.alpha = 0.2;
    wait 0.1;
    var_1 fadeovertime( 0.3 );
    var_1.alpha = 0.4;
    wait 0.3;
    var_1 fadeovertime( 0.6 );
    var_1.alpha = 0.0;
}

_id_B9F3( var_0 )
{
    scripts\engine\utility::_id_13736( 2.0, "death", "disconnect" );
    var_0 destroy();
}

_id_1C7E( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_4 == 0 )
        return 0;

    if ( _id_112D2( var_0, var_1, var_2, var_3, var_4 ) )
        return 0;

    return 1;
}

_id_112D2( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_2 ) )
    {
        switch ( var_2 )
        {
            case "super_trophy_mp":
                return scripts\mp\supers\super_supertrophy::_id_11286( var_0, var_1, var_2, var_3, var_4 );
        }
    }

    return 0;
}

_id_3696( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( isplayer( var_0 ) && ( var_0 _meth_8568() || var_0 _meth_8569() ) )
        return [ 0, 0, 0, var_7 ];

    var_0 notify( "damage_begin", var_1 );
    var_11 = 0;
    var_12 = 0;

    if ( var_0 scripts\mp\utility\game::isjuggernaut() )
    {
        var_12 = level._id_A4A7;

        if ( isdefined( self._id_9E5D ) && self._id_9E5D )
            var_12 = level._id_A4A6;
    }

    if ( scripts\engine\utility::_id_9D74( var_3 ) )
    {
        if ( isdefined( var_4 ) && ( scripts\mp\utility\game::_id_9D78( var_4 ) || scripts\mp\utility\game::_id_9D79( var_4 ) ) )
        {
            if ( _id_9D67( var_1, var_0 ) && isplayer( var_0 ) )
                level thread scripts\mp\battlechatter_mp::_id_EB87( var_0, "plr_hit_back", undefined, 0.1 );

            if ( isdefined( var_1._id_C7E6 ) && var_1._id_C7E6 )
                var_11 += var_2 * 0.3;
        }

        if ( isdefined( var_4 ) && issubstr( var_4, "iw7_gauss_mpl" ) )
        {
            var_13 = scripts\mp\utility\game::_id_13C90( var_4, "barrelrange" );
            var_14 = scripts\engine\utility::ter_op( var_13, 2073600, 1440000 );
            var_15 = scripts\engine\utility::ter_op( var_13, 5760000, 4000000 );

            if ( distance2dsquared( var_0.origin, var_1.origin ) < var_14 && var_2 >= 70 || distance2dsquared( var_0.origin, var_1.origin ) < var_15 && var_2 >= 54 || distance2dsquared( var_0.origin, var_1.origin ) >= var_15 && var_2 >= 42 )
                var_0.hitbychargedshot = var_1;
        }

        if ( isdefined( var_4 ) && issubstr( var_4, "iw7_ba50cal_mpl_overkill" ) )
        {
            if ( var_2 >= 200 )
                var_0.hitbychargedshot = var_1;
        }

        if ( isdefined( var_10 ) && var_10 & level.idflags_no_team_protection )
        {
            var_16 = scripts\mp\utility\game::_id_821D( var_4 );

            if ( var_16 != "none" && !scripts\mp\utility\game::_id_9F8D( var_16 ) )
                var_2 *= 0.4;
        }

        if ( scripts\mp\utility\game::_id_9DFF( var_4, var_3 ) )
            var_12 *= level._id_218B;

        if ( isplayer( var_1 ) && var_1 scripts\mp\utility\game::_id_12D6( "specialty_paint_pro" ) && !scripts\mp\utility\game::_id_9E6C( var_4 ) )
        {
            if ( !var_0 scripts\mp\perks\perkfunctions::_id_9ED2() )
                var_1 scripts\mp\missions::_id_D992( "ch_bulletpaint" );

            var_0 thread scripts\mp\perks\perkfunctions::_id_F7D5( var_1 );
        }

        if ( isplayer( var_1 ) && ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_bulletdamage" ) && var_0 scripts\mp\utility\game::_id_12D6( "specialty_armorvest" ) ) )
        {

        }
        else if ( isplayer( var_1 ) && ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_bulletdamage" ) || var_1 scripts\mp\utility\game::_id_12D6( "specialty_moredamage" ) ) )
            var_11 += var_2 * level._id_3245;
        else if ( var_0 scripts\mp\utility\game::_id_12D6( "specialty_armorvest" ) )
            var_11 -= var_2 * level._id_21A3;
        else if ( var_0 scripts\mp\utility\game::_id_12D6( "specialty_headgear" ) && scripts\mp\utility\game::isheadshot( var_4, var_7, var_3, var_1 ) && !scripts\mp\utility\game::_id_9DFF( var_4, var_3 ) )
        {
            var_11 -= var_2 * level._id_8C74;
            var_0 notify( "headgear_save", var_1, var_3, var_4 );
        }

        if ( var_0 scripts\mp\utility\game::isjuggernaut() )
        {
            if ( level._id_8B38 && isdefined( var_4 ) && weaponclass( var_4 ) == "spread" )
            {
                var_2 = min( var_2, 25 ) * var_12;
                var_11 = min( var_2, 25 ) * var_12;
            }
            else
            {
                var_2 *= var_12;
                var_11 *= var_12;
            }
        }

        if ( var_1 scripts\mp\utility\game::_id_12D6( "passive_sonic" ) && var_1 _meth_81BE() )
            var_2 *= 1.25;

        if ( var_1 scripts\mp\utility\game::_id_12D6( "passive_below_the_belt" ) )
        {
            var_17 = undefined;

            switch ( var_0._id_AE62 )
            {
                case "archetype_scout":
                    var_17 = "torso_stabilizer";
                    break;
                default:
                    var_17 = "j_crotch";
                    break;
            }

            if ( isdefined( var_17 ) )
            {
                var_18 = var_0 gettagorigin( var_17 );
                var_19 = distance( var_18, var_5 );
                var_20 = 7.5;

                if ( var_19 <= var_20 )
                {
                    var_2 *= 1.35;
                    var_1 scripts\mp\utility\game::giveperk( "specialty_moredamage" );
                }
            }
        }

        if ( scripts\mp\weapons::_id_A008( var_4 ) )
            var_0 thread scripts\mp\weapons::_id_20E4();

        if ( isdefined( var_0._id_FC99 ) )
            var_2 = 0;
    }
    else if ( isexplosivedamagemod( var_3 ) )
    {
        var_2 = _id_0A97::_id_B92C( var_2, var_1, var_0, var_8, var_4 );
        var_2 = scripts\mp\equipment\blackout_grenade::_id_B92C( var_2, var_1, var_0, var_8, var_4 );
        var_2 = _id_0AA4::_id_B92C( var_2, var_1, var_0, var_8, var_4 );
        var_2 = scripts\mp\weapons::glprox_modifieddamage( var_2, var_1, var_0, var_8, var_4, var_3, var_5 );

        if ( var_4 == "proximity_explosive_mp" && isdefined( var_8.origin ) )
        {
            var_21 = var_8.origin[2];
            var_22 = var_0.origin[2] + 24;

            if ( var_21 < var_22 && !var_0 isonground() )
                var_2 *= 0.8;
            else if ( var_21 >= var_22 && var_0 getstance() == "crouch" )
                var_2 *= 0.9;
            else if ( var_21 >= var_22 && var_0 getstance() == "prone" )
                var_2 *= 0.65;
        }

        if ( isplayer( var_1 ) )
        {
            if ( var_1 != var_0 && ( var_1 _meth_81A7( "specialty_paint", "perk" ) && var_1 scripts\mp\utility\game::_id_12D6( "specialty_paint" ) ) && !scripts\mp\utility\game::_id_9E6C( var_4 ) )
                var_0 thread scripts\mp\perks\perkfunctions::_id_F7D5( var_1 );
        }

        if ( isdefined( var_0._id_1177D ) && var_0._id_1177D )
            var_11 += int( var_2 * level._id_1177E );

        if ( isplayer( var_1 ) && weaponinheritsperks( var_4 ) && ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_explosivedamage" ) && var_0 scripts\mp\utility\game::_id_12D6( "specialty_blastshield" ) ) )
        {

        }
        else if ( isplayer( var_1 ) && weaponinheritsperks( var_4 ) && !scripts\mp\utility\game::_id_9E6C( var_4 ) && var_1 scripts\mp\utility\game::_id_12D6( "specialty_explosivedamage" ) )
            var_11 += var_2 * level._id_69FE;
        else if ( var_0 scripts\mp\utility\game::_id_12D6( "specialty_blastshield" ) && !scripts\mp\utility\game::_id_13C9A( var_4, var_7 ) && !scripts\mp\utility\game::_id_9F7E( var_0, var_8, var_4, var_3 ) && !( var_3 == "MOD_PROJECTILE" ) )
        {
            var_23 = scripts\mp\weapons::glprox_modifiedblastshieldconst( level._id_2B68, var_4 );
            var_23 = scripts\mp\equipment\ground_pound::groundpound_modifiedblastshieldconst( var_23, var_4 );
            var_24 = int( var_2 * var_23 );

            if ( var_1 != var_0 )
                var_24 = clamp( var_24, 0, level._id_2B67 );

            var_11 -= ( var_2 - var_24 );
        }

        if ( var_0 scripts\mp\utility\game::isjuggernaut() )
        {
            var_11 *= var_12;

            if ( var_2 < 1000 )
                var_2 *= var_12;
        }

        if ( isdefined( level._id_ABBF ) && !scripts\mp\weapons::_id_ABC1() )
            var_2 *= level._id_8488;

        if ( isdefined( var_0._id_FC99 ) )
            var_2 = 0;
    }
    else if ( var_3 == "MOD_FALLING" )
    {
        if ( isdefined( var_0._id_115FC ) && var_0._id_115FC )
        {
            var_2 = var_0.health + 100;
            var_1 thread scripts\mp\equipment\portal_grenade::_id_468B( var_0, var_0.origin );
            var_0._id_115FC = 0;
            var_0._id_115FD = undefined;
            var_0._id_115FE = undefined;
        }
        else if ( var_0 scripts\mp\utility\game::isjuggernaut() )
            var_2 *= var_12;
        else if ( scripts\mp\equipment\ground_pound::_id_8651( var_0 ) )
            var_2 = 0;
        else
        {
            var_2 = int( max( 33, var_2 ) );

            if ( var_2 >= var_0.health )
                var_2 = int( max( 0, var_0.health - 1 ) );
        }
    }
    else if ( var_3 == "MOD_MELEE" )
    {
        if ( isdefined( var_8 ) && scripts\mp\utility\game::_id_9EF0( var_8 ) && var_8._id_165A == "remote_c8" )
            var_2 = self.health - 1;
        else if ( var_0 scripts\mp\utility\game::isjuggernaut() )
        {
            var_2 = 20;
            var_11 = 0;
        }
        else if ( var_4 == "iw7_reaperblade_mp" )
            var_0 thread scripts\mp\supers\super_reaper::_id_A668();
        else if ( isdefined( var_0 scripts\mp\supers::_id_7E4F() ) && var_0 scripts\mp\supers::_id_7E4F() == "super_reaper" && var_0 scripts\mp\supers::_id_9F88() )
            var_2 = int( min( var_2, scripts\mp\supers\super_reaper::_id_93D9() ) );
        else if ( scripts\mp\utility\game::_id_9E7D( var_8, var_0, var_4, var_3 ) )
            var_2 = var_0.health;
        else if ( _id_9D67( var_1, var_0 ) && ( isdefined( var_8 ) && !scripts\mp\utility\game::_id_9EF0( var_8 ) ) )
            var_2 = int( max( var_2, 100 ) );
        else
            var_2 = 70;
    }
    else if ( var_3 == "MOD_IMPACT" )
    {
        if ( var_0 scripts\mp\utility\game::isjuggernaut() )
        {
            switch ( var_4 )
            {
                case "semtexproj_mp":
                case "gas_grenade_mp":
                case "gravity_grenade_mp":
                case "sensor_grenade_mp":
                case "smoke_grenadejugg_mp":
                case "flash_grenade_mp":
                case "shard_ball_mp":
                case "mortar_shelljugg_mp":
                case "semtex_mp":
                case "frag_grenade_mp":
                case "concussion_grenade_mp":
                case "smoke_grenade_mp":
                case "splash_grenade_mp":
                case "cluster_grenade_mp":
                    var_2 = 5;
                    break;
                default:
                    if ( var_2 < 1000 )
                        var_2 = 25;

                    break;
            }

            var_11 = 0;
        }

        if ( isdefined( var_0._id_FC99 ) )
            var_2 = 0;

        if ( isdefined( var_3 ) && var_3 == "MOD_IMPACT" && getweaponbasename( var_4 ) == "iw7_venomx_mp" )
            var_1 scripts\mp\missions::_id_D991( "ch_iw7_venomx_direct" );
    }
    else if ( var_3 == "MOD_UNKNOWN" || var_3 == "MOD_MELEE_DOG" )
    {
        if ( isagent( var_1 ) && isdefined( var_1.agent_type ) && var_1.agent_type == "dog" && var_0 scripts\mp\utility\game::isjuggernaut() )
        {
            var_0 shellshock( "dog_bite", 2 );
            var_2 *= var_12;
        }
    }

    if ( var_0 scripts\mp\utility\game::_id_12D6( "specialty_combathigh" ) )
    {
        if ( isdefined( self._id_4D2D ) && ( !level.teambased || isdefined( var_1 ) && isdefined( var_1.team ) && var_0.team != var_1.team ) )
        {
            var_25 = var_2 + var_11;
            var_26 = var_25 - var_25 / 3;
            self._id_4D2D += var_26;

            if ( self._id_4D2D >= 101 )
            {
                self notify( "combathigh_survived" );
                self._id_4D2D = undefined;
            }
        }

        if ( var_4 != "throwingknife_mp" && var_4 != "throwingknifejugg_mp" && var_4 != "throwingknifeteleport_mp" && var_4 != "throwingreaper_mp" && !( var_4 == "throwingknife_mp" && var_3 == "MOD_IMPACT" ) )
        {
            switch ( var_3 )
            {
                case "MOD_FALLING":
                case "MOD_MELEE":
                    break;
                default:
                    var_2 = int( var_2 / 3 );
                    var_11 = int( var_11 / 3 );
                    break;
            }
        }
    }

    var_2 = scripts\mp\equipment\charge_mode::chargemode_modifieddamage( var_1, var_0, var_4, var_5, var_2 );
    var_2 = scripts\mp\equipment\exploding_drone::explodingdrone_modifieddamage( var_1, var_0, var_4, var_8, var_2 );
    var_2 = scripts\mp\supers\super_supertrophy::_id_11280( var_1, var_0, var_4, var_2 );
    var_2 = scripts\mp\equipment\ground_pound::_id_8653( var_1, var_0, var_4, var_8, var_2 );
    var_2 = scripts\mp\killstreaks\venom::venommodifieddamage( var_1, var_0, var_4, var_8, var_2 );
    var_27 = _id_0ADF::playertrophy_modifieddamage( var_1, var_0, var_4, var_8, var_2 );
    var_27 = scripts\mp\trophy_system::trophy_modifieddamage( var_1, var_0, var_4, var_2, var_11 );
    var_2 = var_27[0];
    var_11 = var_27[1];
    var_28 = 0;

    if ( var_0 scripts\mp\heavyarmor::_id_8BFA() )
    {
        var_27 = scripts\mp\heavyarmor::_id_8D07( var_0, var_1, var_2, var_11, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
        var_28 = var_27[0] > 0;
        var_2 = var_27[1];
        var_11 = var_27[2];
    }

    var_29 = 0;

    if ( scripts\mp\lightarmor::_id_8C07( var_0 ) )
    {
        var_27 = scripts\mp\lightarmor::_id_ACA7( var_0, var_1, var_2, var_11, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
        var_29 = var_27[0] > 0;
        var_2 = var_27[1];
        var_11 = var_27[2];
    }

    if ( scripts\mp\utility\game::_id_8BF9( var_0 ) )
        var_2 = var_0 scripts\mp\utility\game::_id_7EF7( var_2 );

    if ( var_2 <= 1 )
        var_2 = int( ceil( clamp( var_2, 0, 1 ) ) );
    else
        var_2 = int( var_2 + var_11 );

    if ( isdefined( var_0._id_FC99 ) )
    {
        var_0._id_FC9A = var_2;
        var_2 = 0;
    }
    else if ( var_7 == "shield" && var_0 scripts\mp\utility\game::_id_12D6( "specialty_rearguard" ) && ( var_3 == "MOD_EXPLOSIVE" || var_3 == "MOD_PROJECTILE_SPLASH" || var_3 == "MOD_PROJECTILE" || isdefined( var_8._id_13C2E ) && scripts\mp\utility\game::_id_9E6C( var_8._id_13C2E ) ) )
        var_7 = "none";

    if ( isdefined( var_8 ) && isplayer( var_8 ) && isdefined( var_1 ) && isplayer( var_1 ) && var_1 != var_0 )
        thread scripts\mp\perks\weaponpassives::_id_12F60( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

    return [ var_2, var_29, var_28, var_7 ];
}

_id_B4CA( var_0, var_1, var_2 )
{
    var_3 = 0;

    if ( isdefined( var_1 ) && isdefined( var_0 ) && isdefined( var_2 ) )
    {
        var_4 = getweaponbasename( var_2 ) == "iw7_mauler_mpr" || issubstr( var_2, "iw7_crdb_mp" );
        var_5 = weaponclass( var_2 ) == "spread";

        if ( !var_5 && !var_4 )
            return var_3;

        var_6 = "" + gettime();
        var_7 = undefined;

        if ( var_1 playerads() > 0.8 && var_1 scripts\mp\utility\game::_id_12D6( "passive_shotgun_focus" ) )
            var_7 = 4;
        else if ( var_4 )
            var_7 = 4;
        else if ( var_1 _meth_819C() )
            var_7 = 5;
        else if ( issubstr( var_2, "iw7_mod2187_mpl" ) )
            var_7 = 4;
        else if ( issubstr( var_2, "iw7_longshot_mp" ) )
        {
            var_8 = var_1 playerads() > 0.95;
            var_9 = scripts\mp\weapons::_id_9D3E( var_2 );

            if ( !var_8 && !var_9 )
                var_7 = 1;
            else if ( var_8 && !var_9 )
                var_7 = 4;
            else
                var_7 = 3;
        }
        else
            var_7 = 3;

        if ( !isdefined( var_1._id_CA01 ) || !isdefined( var_1._id_CA01[var_6] ) )
        {
            var_1._id_CA01 = undefined;
            var_1._id_CA01[var_6] = [];
        }

        if ( !isdefined( var_1._id_CA01[var_6][var_0.guid] ) )
            var_1._id_CA01[var_6][var_0.guid] = 1;
        else if ( var_1._id_CA01[var_6][var_0.guid] + 1 > var_7 )
            var_3 = 1;
        else
            var_1._id_CA01[var_6][var_0.guid]++;
    }

    return var_3;
}

_id_9D67( var_0, var_1 )
{
    var_2 = vectornormalize( ( var_1.origin[0], var_1.origin[1], 0 ) - ( var_0.origin[0], var_0.origin[1], 0 ) );
    var_3 = anglestoforward( ( 0, var_1.angles[1], 0 ) );
    return vectordot( var_2, var_3 ) > 0.4;
}

_id_9D68( var_0, var_1 )
{
    var_2 = vectornormalize( ( var_1.origin[0], var_1.origin[1], 0 ) - ( var_0.origin[0], var_0.origin[1], 0 ) );
    var_3 = anglestoforward( ( 0, var_1.angles[1], 0 ) );
    return vectordot( var_2, var_3 ) > 0.2;
}

_id_A696( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_3 == "hind_bomb_mp" || var_3 == "hind_missile_mp" )
    {
        if ( isdefined( var_0 ) && var_1 == var_0 )
            return 0;
    }

    if ( var_1 scripts\mp\utility\game::isspawnprotected() )
    {
        var_5 = int( max( var_1.health / 4, 1 ) );

        if ( var_2 >= var_5 && scripts\mp\utility\game::_id_9E6C( var_3 ) && var_4 != "MOD_MELEE" )
            var_2 = var_5;
    }

    return var_2;
}

friendlyfire_ignoresdamageattacker( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    var_14 = 0;

    if ( isdefined( var_6 ) )
    {
        switch ( var_6 )
        {
            case "none":
                if ( isdefined( var_0 ) && scripts\mp\utility\game::isdronepackage( var_0 ) )
                    var_14 = 1;

                break;
            case "iw7_minigun_c8_mp":
            case "iw7_chargeshot_c8_mp":
            case "iw7_c8offhandshield_mp":
                var_15 = undefined;

                if ( isdefined( var_1 ) && scripts\mp\utility\game::_id_9F22( var_1 ) )
                    var_15 = var_1;
                else if ( isdefined( var_0 ) && scripts\mp\utility\game::_id_9F22( var_0 ) )
                    var_15 = var_0;

                if ( isdefined( var_15 ) && isdefined( var_15.owner ) )
                {
                    if ( !isdefined( var_15.owner._id_4BE1 ) )
                        var_14 = 1;
                    else if ( var_15.owner._id_4BE1 != "MANUAL" )
                        var_14 = 1;
                }

                break;
            case "ball_drone_gun_mp":
            case "jackal_fast_cannon_mp":
            case "jackal_turret_mp":
            case "jackal_cannon_mp":
            case "sentry_shock_mp":
            case "iw7_c8landing_mp":
            case "iw7_c8destruct_mp":
            case "super_trophy_mp":
            case "micro_turret_gun_mp":
            case "player_trophy_system_mp":
            case "trophy_mp":
                var_14 = 1;
                break;
        }
    }

    return var_14;
}

_id_89A7( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    if ( isdefined( var_0 ) && !isplayer( var_0 ) )
    {
        if ( !isdefined( var_1 ) )
        {
            if ( isdefined( var_0.owner ) )
                var_1 = var_0.owner;
        }
        else if ( !isplayer( var_1 ) )
        {
            if ( isdefined( var_0.owner ) )
                var_1 = var_0.owner;
        }
    }

    if ( level._id_8B38 )
    {
        if ( var_1 scripts\mp\utility\game::_id_12D6( "passive_softcore" ) && scripts\engine\utility::_id_9D74( var_5 ) )
            return 0;

        if ( isdefined( var_4 ) && var_4 & level.idflags_no_team_protection && scripts\engine\utility::_id_9D74( var_5 ) )
            var_3 = int( var_3 * 0.2 );
    }

    if ( level._id_740A != 0 )
    {
        if ( scripts\mp\utility\game::istrue( var_2._id_9DBC ) || scripts\mp\utility\game::istrue( var_2._id_9D7F ) )
        {
            var_3 = int( var_3 * 0.5 );

            if ( var_3 < 1 )
                var_3 = 1;

            var_1._id_A970 = 0;
            _id_4D2C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
            return 0;
        }
    }

    if ( level._id_740A == 0 || !isplayer( var_1 ) && level._id_740A != 1 || var_6 == "bomb_site_mp" )
    {
        if ( var_6 == "artillery_mp" || var_6 == "stealth_bomb_mp" )
            var_2 _id_4D67( var_0, var_6, var_5, var_3, var_4, var_1 );

        return 0;
    }
    else if ( level._id_740A == 1 )
    {
        if ( var_3 < 1 )
            var_3 = 1;

        if ( var_2 scripts\mp\utility\game::isjuggernaut() )
        {
            var_14 = _id_3696( var_2, var_1, var_3, var_5, var_6, var_7, var_8, var_9, var_0, 0, var_4 );
            var_3 = var_14[0];
            var_15 = var_14[1];
            var_16 = var_14[2];
            var_9 = var_14[3];
        }

        var_2._id_A970 = 0;
        var_2 _id_6CE1( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
        var_1 _id_898D( var_0, var_1, var_2, var_3, var_5, var_6, var_9, var_4, 0, 0 );
        return 0;
    }
    else if ( level._id_740A == 2 )
    {
        var_3 = int( var_3 * 0.5 );

        if ( var_3 < 1 )
            var_3 = 1;

        var_1._id_A970 = 0;

        if ( !friendlyfire_ignoresdamageattacker( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 ) )
            _id_4D2C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );

        return 0;
    }
    else if ( level._id_740A == 3 )
    {
        var_3 = int( var_3 * 0.5 );

        if ( var_3 < 1 )
            var_3 = 1;

        var_2._id_A970 = 0;
        var_1._id_A970 = 0;
        var_2 _id_6CE1( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );

        if ( !friendlyfire_ignoresdamageattacker( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 ) )
            _id_4D2C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );

        var_1 _id_898D( var_0, var_1, var_2, var_3, var_5, var_6, var_9, var_4, 0, 0 );
        return 0;
    }
    else if ( level._id_740A == 4 )
    {
        var_17 = var_1.pers["teamkills"] >= level._id_B47A;

        if ( var_17 )
        {
            if ( !friendlyfire_ignoresdamageattacker( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 ) )
            {
                var_3 = int( var_3 * 0.5 );

                if ( var_3 < 1 )
                    var_3 = 1;

                var_1._id_A970 = 0;
                _id_4D2C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
            }

            return 0;
        }
    }

    return var_3;
}

_id_4D2C( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    if ( scripts\mp\utility\game::isreallyalive( var_1 ) )
    {
        var_1._id_7408 = 1;
        var_1 _id_6CE1( var_0, var_1, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
        var_1._id_7408 = undefined;
    }
}

_id_B939( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( var_5 == "MOD_EXPLOSIVE_BULLET" && var_3 != 1 )
    {
        var_3 *= getdvarfloat( "scr_explBulletMod" );
        var_3 = int( var_3 );
    }

    if ( isdefined( level.modifyplayerdamage ) )
        var_3 = [[ level.modifyplayerdamage ]]( var_2, var_1, var_3, var_5, var_6, var_7, var_8, var_9 );

    var_3 = int( var_3 * var_2 scripts\mp\utility\game::_id_7E5C( var_0, var_1, var_2, var_3, var_5, var_6, var_9 ) );

    if ( scripts\mp\utility\game::isheadshot( var_6, var_9, var_5, var_1 ) )
        var_5 = "MOD_HEAD_SHOT";

    if ( scripts\mp\tweakables::_id_81E7( "game", "onlyheadshots" ) )
    {
        if ( var_5 == "MOD_HEAD_SHOT" )
        {
            if ( var_2 scripts\mp\utility\game::isjuggernaut() )
                var_3 = 75;
            else
                var_3 = 150;
        }
    }

    return var_3;
}

_id_89DD( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( var_8 != "shield" )
        return var_3;

    if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_rearguard" ) )
    {
        var_10 = scripts\engine\utility::ter_op( isdefined( var_0 ), var_0, var_2 );

        if ( isdefined( var_10 ) )
        {
            if ( isplayer( var_10 ) || scripts\mp\utility\game::_id_9EF0( var_10 ) )
            {
                if ( _id_9D68( var_10, var_1 ) )
                {
                    if ( scripts\engine\utility::_id_9D74( var_4 ) || var_4 == "MOD_EXPLOSIVE_BULLET" )
                        var_2 scripts\mp\damagefeedback::updatedamagefeedback( "hitlightarmor" );
                }
            }
            else if ( isdefined( var_5 ) && ( var_5 == "destructible_car" || scripts\mp\utility\game::_id_9E6C( var_5 ) ) || isexplosivedamagemod( var_4 ) || var_4 == "MOD_PROJECTILE" )
            {
                var_1._id_FC96 += var_3;

                if ( _id_9D68( var_10, var_1 ) && !var_1 scripts\mp\utility\game::_id_12D6( "specialty_blastshield" ) )
                    return var_3 * 3;
                else
                    return var_3;
            }
        }
    }

    var_11 = scripts\mp\utility\game::istrue( var_1._id_9331 );

    if ( isdefined( var_1.owner ) )
    {
        var_1 = var_1.owner;

        if ( var_2 == var_1 )
            return "hit shield";
    }

    if ( var_4 == "MOD_PISTOL_BULLET" || var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_EXPLOSIVE_BULLET" )
    {
        if ( isplayer( var_2 ) )
        {
            var_2._id_A93F = var_1;
            var_2._id_A940 = gettime();
        }

        var_1 notify( "shield_blocked" );

        if ( scripts\mp\utility\game::_id_9DE2( var_5 ) )
            var_12 = 25;
        else if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_rearguard" ) && _id_9D68( var_2, var_1 ) )
            var_12 = var_3;
        else
        {
            var_13 = _id_3696( var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_0, 0, var_9 );
            var_12 = var_13[0];
            var_14 = var_13[1];
            var_15 = var_13[2];
            var_8 = var_13[3];
        }

        var_1._id_FC96 += var_12;
        var_1._id_FC97 += var_12;

        if ( isplayer( var_2 ) && isdefined( var_1.rearguardattackers ) )
        {
            var_16 = var_2 getentitynumber();

            if ( !isdefined( var_1.rearguardattackers[var_16] ) )
                var_1.rearguardattackers[var_16] = var_12;
            else
                var_1.rearguardattackers[var_16] += var_12;
        }

        if ( var_11 )
            return "hit shield";

        if ( !scripts\mp\utility\game::_id_9DE2( var_5 ) || scripts\engine\utility::_id_4347() )
            var_1._id_FC95++;

        if ( var_1._id_FC95 >= level._id_E55D )
        {
            var_17 = 1.0;

            if ( self._id_DDCC > 4 )
                var_17 = 1.0 / self._id_DDCC;

            var_18 = scripts\mp\rank::getscoreinfovalue( "shield_damage" );
            var_19 = var_1 getcurrentweapon();
            var_1 thread scripts\mp\utility\game::_id_83B4( "shield_damage", var_19, var_18 * var_17 );
            var_1 thread _id_839D();
            var_1 thread scripts\mp\missions::_id_D992( "shield_damage", var_1._id_FC97 );
            var_1 thread scripts\mp\missions::_id_D992( "shield_bullet_hits", var_1._id_FC95 );
            var_1._id_FC97 = 0;
            var_1._id_FC95 = 0;
        }
    }

    var_20 = isdefined( var_0 ) && isdefined( var_0._id_11180 ) && var_0._id_11180 == var_1;

    if ( var_9 & level.idflags_shield_explosive_impact && !var_1 scripts\mp\utility\game::_id_12D6( "specialty_rearguard" ) )
    {
        var_1 thread scripts\mp\missions::_id_D992( "shield_explosive_hits", 1 );
        var_8 = "none";

        if ( !( var_9 & level.idflags_shield_explosive_impact_huge ) )
            var_3 = 0;
    }
    else if ( var_9 & level.idflags_shield_explosive_splash )
    {
        if ( scripts\mp\utility\game::_id_9F7F( var_1, var_0, var_5, var_4 ) )
        {
            var_1.forcehitlocation = "none";
            var_3 = var_1.maxhealth;
        }

        if ( !var_1 scripts\mp\utility\game::_id_12D6( "specialty_rearguard" ) )
        {
            var_1 thread scripts\mp\missions::_id_D992( "shield_explosive_hits", 1 );
            var_8 = "none";
        }
    }
    else
        return "hit shield";

    if ( var_4 == "MOD_MELEE" && scripts\mp\weapons::_id_9F2D( var_5 ) )
    {
        var_21 = 0.0;
        var_1 _meth_83B2( 0.0 );
    }

    return var_3;
}

_id_6C19( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( var_5 == "iw7_reaperblade_mp" )
    {
        var_7 = gettime();

        if ( isdefined( var_2._id_A9DA ) )
        {
            if ( var_2._id_A9DA + 200 >= var_7 )
                return "invalidVictim";
        }

        var_2._id_A9DA = var_7;
    }

    if ( !var_3 )
        return "!iDamage";

    if ( isdefined( level._id_90A9 ) )
        return "level.hostMigrationTimer";

    var_1 = scripts\mp\utility\game::_validateattacker( var_1 );

    if ( !isdefined( var_1 ) && var_4 != "MOD_FALLING" )
        return "invalid attacker";

    var_2 = scripts\mp\utility\game::_id_143B( var_2 );

    if ( !isdefined( var_2 ) )
        return "invalidVictim";

    if ( game["state"] == "postgame" )
        return "game[ state ] == postgame";

    if ( var_2._id_0291 == "spectator" )
        return "victim.sessionteam == spectator";

    if ( isdefined( var_2._id_389E ) && !var_2._id_389E )
        return "!victim.canDoCombat";

    if ( isdefined( var_1 ) && isplayer( var_1 ) && isdefined( var_1._id_389E ) && !var_1._id_389E )
        return "!eAttacker.canDoCombat";

    var_8 = isdefined( var_1 ) && isdefined( var_0 ) && isdefined( var_2 ) && isplayer( var_1 ) && var_1 == var_0 && var_1 == var_2 && !isdefined( var_0._id_D64C );

    if ( var_8 )
        return "attackerIsInflictorVictim";

    if ( scripts\mp\tweakables::_id_81E7( "game", "onlyheadshots" ) )
    {
        if ( var_6 != "head" )
        {
            if ( var_4 == "MOD_PISTOL_BULLET" || var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_EXPLOSIVE_BULLET" )
                return "getTweakableValue( game, onlyheadshots )";
        }
    }

    var_9 = isdefined( var_1 ) && !isdefined( var_1._id_8712 ) && ( var_1.classname == "script_vehicle" || var_1.classname == "misc_turret" || var_1.classname == "script_model" );

    if ( !level.teambased && var_9 && isdefined( var_1.owner ) && var_1.owner == var_2 )
    {
        if ( var_4 == "MOD_CRUSH" )
            var_2 scripts\mp\utility\game::_id_1417();

        return "ffa suicide";
    }

    if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_2 ) )
    {
        if ( !isdefined( var_0 ) )
            return "outOfPhase";

        if ( !scripts\mp\equipment\phase_shift::_id_9DDF( var_0 ) )
        {
            if ( !isdefined( var_0.classname ) || var_0.classname != "trigger_hurt" )
                return "outOfPhase";
        }
    }
    else if ( isdefined( var_0 ) && !scripts\mp\equipment\phase_shift::_id_213D( var_0, var_2 ) )
        return "outOfPhase";
}

_id_AF95( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( var_1 ) && isplayer( var_1 ) )
        addattacker( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

    if ( isdefined( var_1 ) && !isplayer( var_1 ) && isdefined( var_1.owner ) && ( !isdefined( var_1._id_EC9B ) || !var_1._id_EC9B ) )
        addattacker( var_0, var_1.owner, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
    else if ( isdefined( var_1 ) && !isplayer( var_1 ) && isdefined( var_1._id_F0C5 ) && isdefined( var_1._id_EC9B ) && var_1._id_EC9B )
        addattacker( var_0, var_1._id_F0C5, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

    if ( isdefined( var_2 ) && isdefined( var_2.owner ) )
    {
        var_10 = var_2.owner.team != var_0.team || level._id_740A == 1;

        if ( var_10 && !isdefined( self.attackerdata[var_2.owner.guid] ) )
            addattacker( var_0, var_2.owner, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
    }

    if ( isdefined( var_1 ) )
        level._id_A9AC = var_1;

    if ( isdefined( var_1 ) && isplayer( var_1 ) && isdefined( var_3 ) )
        var_1 thread scripts\mp\weapons::_id_3E1E( var_3, var_0 );

    if ( isdefined( var_1 ) && isplayer( var_1 ) && isdefined( var_3 ) && var_1 != var_0 )
    {
        var_1 thread scripts\mp\events::_id_4D43( self, var_4, var_3 );
        var_0._id_2502 = var_1.origin;
    }
    else
        var_0._id_2502 = undefined;
}

_id_AF96( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( isdefined( var_2 ) && isplayer( var_2 ) )
        _id_17AD( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

    if ( isdefined( var_2 ) && !isplayer( var_2 ) && isdefined( var_2.owner ) && ( !isdefined( var_2._id_EC9B ) || !var_2._id_EC9B ) )
    {
        var_2 = var_2.owner;
        _id_17AD( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    }
    else if ( isdefined( var_2 ) && !isplayer( var_2 ) && isdefined( var_2._id_F0C5 ) && isdefined( var_2._id_EC9B ) && var_2._id_EC9B )
    {
        var_2 = var_2._id_F0C5;
        _id_17AD( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    }

    if ( isdefined( var_2 ) )
        level._id_A9AC = var_2;

    if ( isdefined( var_2 ) && isplayer( var_2 ) && isdefined( var_10 ) && var_2 != var_0 )
        var_0._id_2502 = var_2.origin;
    else
        var_0._id_2502 = undefined;
}

_id_AFBC( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( ( issubstr( var_4, "MOD_EXPLOSIVE" ) || issubstr( var_4, "MOD_PROJECTILE" ) ) && isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_2._id_6A00 = [];
        var_2._id_6A00["damageTime"] = gettime();
        var_2._id_6A00["damageId"] = var_0 getentitynumber();
        var_2._id_6A00["returnToSender"] = 0;
        var_2._id_6A00["counterKill"] = 0;
        var_2._id_6A00["chainKill"] = 0;
        var_2._id_6A00["cookedKill"] = 0;
        var_2._id_6A00["throwbackKill"] = 0;
        var_2._id_6A00["suicideGrenadeKill"] = 0;
        var_2._id_6A00["weapon"] = var_5;
        var_6 = issubstr( var_5, "frag_" );

        if ( var_1 != var_2 )
        {
            if ( ( issubstr( var_5, "c4_" ) || issubstr( var_5, "proximity_explosive_" ) || issubstr( var_5, "claymore_" ) ) && isdefined( var_0.owner ) )
            {
                var_2._id_6A00["returnToSender"] = var_0.owner == var_2;
                var_2._id_6A00["counterKill"] = isdefined( var_0._id_1390B );
                var_2._id_6A00["chainKill"] = isdefined( var_0._id_13908 );
                var_2._id_6A00["bulletPenetrationKill"] = isdefined( var_0._id_1390E );
                var_2._id_6A00["cookedKill"] = 0;
            }

            if ( isdefined( var_1._id_A991 ) && var_1._id_A991 >= gettime() - 50 && var_6 )
                var_2._id_6A00["suicideGrenadeKill"] = 1;
        }

        if ( var_6 )
        {
            var_2._id_6A00["cookedKill"] = isdefined( var_0._id_9D93 );
            var_2._id_6A00["throwbackKill"] = isdefined( var_0._id_117F3 );
        }

        var_2._id_6A00["stickKill"] = isdefined( var_0._id_9F7D ) && var_0._id_9F7D == "enemy";
        var_2._id_6A00["stickFriendlyKill"] = isdefined( var_0._id_9F7D ) && var_0._id_9F7D == "friendly";

        if ( isplayer( var_1 ) && var_1 != self && level.gametype != "aliens" )
            _id_12EB3( var_0, var_1, var_5 );
    }

    if ( issubstr( var_4, "MOD_IMPACT" ) && var_5 == "iw6_rgm_mp" )
    {
        if ( isplayer( var_1 ) && var_1 != self && level.gametype != "aliens" )
            _id_12EB3( var_0, var_1, var_5 );
    }
}

_id_898D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = isdefined( var_1 ) && !isdefined( var_1._id_8712 ) && ( var_1.classname == "script_vehicle" || var_1.classname == "misc_turret" || var_1.classname == "script_model" );

    if ( var_10 && isdefined( var_1._id_8712 ) )
        var_11 = var_1._id_8712;
    else
        var_11 = var_1;

    var_12 = "standard";

    if ( isdefined( var_11 ) && var_11 != var_2 && var_3 + var_8 + var_9 > 0 && ( !isdefined( var_6 ) || var_6 != "shield" ) )
    {
        var_13 = !scripts\mp\utility\game::isreallyalive( var_2 ) || isagent( var_2 ) && var_3 >= var_2.health;

        if ( var_2 scripts\mp\heavyarmor::_id_8BFA() || var_2 scripts\mp\heavyarmor::_id_8BFB() )
            var_12 = "hitjuggernaut";
        else if ( var_7 & level.idflags_stun )
            var_12 = "stun";
        else if ( isexplosivedamagemod( var_4 ) && ( isdefined( var_2._id_1177D ) && var_2._id_1177D ) )
            var_12 = "thermobaric_debuff";
        else if ( scripts\mp\utility\game::_id_9F93( var_5, var_4 ) && var_2 scripts\mp\utility\game::_id_12D6( "specialty_stun_resistance" ) )
            var_12 = "hittacresist";
        else if ( isexplosivedamagemod( var_4 ) && var_2 scripts\mp\utility\game::_id_12D6( "specialty_blastshield" ) && !scripts\mp\utility\game::_id_13C9A( var_5, var_6 ) && !scripts\mp\utility\game::_id_9F7E( var_2, var_0, var_5, var_4 ) )
            var_12 = "hitblastshield";
        else if ( var_2 scripts\mp\utility\game::_id_12D6( "specialty_combathigh" ) )
            var_12 = "hitendgame";
        else if ( scripts\mp\utility\game::_id_8BF9( var_2 ) )
            var_12 = "hitlightarmor";
        else if ( var_8 > 0 )
            var_12 = "hitlightarmor";
        else if ( var_2 scripts\mp\utility\game::isjuggernaut() )
            var_12 = "hitjuggernaut";
        else if ( var_2 scripts\mp\utility\game::_id_12D6( "specialty_moreHealth" ) )
            var_12 = "hitmorehealth";
        else if ( var_11 scripts\mp\utility\game::_id_12D6( "specialty_moredamage" ) )
        {
            var_12 = "hitcritical";
            var_11 scripts\mp\utility\game::_id_E150( "specialty_moredamage" );
        }
        else if ( var_2 scripts\mp\utility\game::_id_7E5C( var_0, var_1, var_2, var_3, var_4, var_5, var_6 ) < 0.95 )
            var_12 = "hitlowdamage";
        else if ( var_2 scripts\mp\utility\game::isspawnprotected() && scripts\mp\utility\game::_id_9E6C( var_5 ) )
            var_12 = "hitspawnprotection";
        else if ( !_id_100C1( var_5 ) )
            var_12 = "none";

        var_14 = "high_damage";

        if ( var_3 < 20 )
            var_14 = "low_damage";

        var_15 = weaponclass( var_5 ) == "spread" || getweaponbasename( var_5 ) == "iw7_mauler_mpr" || issubstr( var_5, "iw7_crdb_mp" );
        var_16 = !var_15 && scripts\mp\utility\game::isheadshot( var_5, var_6, var_4, var_1 );
        var_17 = 1;
        var_18 = var_4 == "MOD_MELEE";
        var_19 = "" + gettime();

        if ( !var_18 && var_15 && isdefined( var_11._id_CA01 ) && isdefined( var_11._id_CA01[var_19] ) && isdefined( var_11._id_CA01[var_19][var_2.guid] ) && var_11._id_CA01[var_19][var_2.guid] > 1 )
        {
            if ( var_13 )
                var_18 = 1;
            else
                var_17 = 0;
        }

        if ( var_17 )
            var_11 thread scripts\mp\damagefeedback::updatedamagefeedback( var_12, var_13, var_16, var_14, var_18 );
    }
}

_id_ABC3( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( var_0 ) && isdefined( var_0._id_4D3F ) )
        var_1 = var_0._id_4D3F;

    if ( scripts\mp\utility\game::_id_9F7F( var_2, var_0, var_6, var_5 ) )
        var_3 = var_2.maxhealth;

    if ( isdefined( var_5 ) && var_5 != "MOD_IMPACT" )
    {
        if ( var_2 != var_1 && isdefined( var_0 ) && var_0.classname == "grenade" && var_2.lastspawntime + 3500 > gettime() && isdefined( var_2._id_A9F4 ) && distance( var_0.origin, var_2._id_A9F4.origin ) < 500 )
            var_3 = 0;
    }

    if ( var_3 < var_2.health )
        var_2 notify( "survived_explosion", var_1 );

    _id_AFBC( var_0, var_1, var_2, var_3, var_5, var_6 );
    return var_3;
}

_id_1177F()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = gettime() + 5000;
    wait 0.05;
    self._id_1177D = 1;

    for (;;)
    {
        if ( self.health == self.maxhealth )
        {
            self._id_1177D = 0;
            return;
        }

        if ( gettime() >= var_0 )
        {
            self._id_1177D = 0;
            return;
        }

        wait 0.05;
    }
}

playerkilled_internal( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = getweaponbasename( var_6 );

    if ( var_12 == "iw7_spas_mpr_focus" )
        var_12 = "iw7_spas_mpr";
    else if ( var_12 == "iw7_erad_mp_jump_spread" )
        var_12 = "iw7_erad_mp";

    if ( isdefined( var_12 ) )
    {

    }

    scripts\mp\utility\game::_id_D915( "death", var_2 );
    var_2 endon( "spawned" );
    var_2 notify( "killed_player" );
    var_2 _id_1015A();
    var_13 = 0;
    self setblurforplayer( 0, 0 );
    scripts\mp\outline::_id_C791( self );
    var_2._id_1519 = 0;
    var_2._id_CA55 = 0;
    var_2.attacker = var_1;

    if ( scripts\mp\utility\game::gamehasneutralcrateowner( level.gametype ) )
    {
        if ( var_2 != var_1 && var_5 == "MOD_CRUSH" )
        {
            var_0 = var_2;
            var_1 = var_2;
            var_5 = "MOD_SUICIDE";
            var_6 = "none";
            var_8 = "none";
            var_2.attackers = [];
        }
    }

    if ( var_6 == "none" )
    {
        if ( isdefined( var_0 ) && isdefined( var_0._id_28AF ) )
            var_6 = var_0._id_28AF;
    }

    if ( isdefined( var_0 ) && !isplayer( var_0 ) )
    {
        if ( !isdefined( var_1 ) )
        {
            if ( isdefined( var_0.owner ) )
                var_1 = var_0.owner;
        }
        else if ( !isplayer( var_1 ) )
        {
            if ( isdefined( var_0.owner ) )
                var_1 = var_0.owner;
        }
    }

    var_1 = scripts\mp\utility\game::_validateattacker( var_1 );

    if ( isdefined( var_1 ) )
        var_1.assistedsuicide = undefined;

    if ( isdefined( var_2.hasriotshieldequipped ) && var_2.hasriotshieldequipped )
        var_2 launchshield( var_3, var_5 );

    var_2 scripts\mp\utility\game::riotshield_clear();
    scripts\mp\weapons::recordtogglescopestates();

    if ( !var_11 )
    {
        if ( isdefined( var_2.endgame ) )
            scripts\mp\utility\game::restorebasevisionset( 2 );
        else
        {
            scripts\mp\utility\game::restorebasevisionset( 0 );
            var_2 thermalvisionoff();
        }
    }
    else
    {
        var_2.fauxdeath = 1;
        self notify( "death" );
    }

    if ( game["state"] == "postgame" )
        return;

    scripts\mp\perks::updateactiveperks( var_0, var_1, var_2, var_3, var_5, var_6, var_8, var_7 );
    var_14 = 0;

    if ( !isplayer( var_0 ) && isdefined( var_0.primaryweapon ) )
        var_15 = var_0.primaryweapon;
    else if ( isdefined( var_1 ) && isplayer( var_1 ) && var_1 getcurrentprimaryweapon() != "none" )
        var_15 = var_1 getcurrentprimaryweapon();
    else if ( issubstr( var_6, "alt_" ) )
        var_15 = getsubstr( var_6, 4, var_6.size );
    else
        var_15 = undefined;

    if ( isdefined( var_2.uselaststandparams ) || isdefined( var_2.laststandparams ) && var_5 == "MOD_SUICIDE" )
    {
        var_2 ensurelaststandparamsvalidity();
        var_2.uselaststandparams = undefined;
        var_0 = var_2.laststandparams.einflictor;
        var_1 = var_2.laststandparams.attacker;
        var_3 = var_2.laststandparams.idamage;
        var_5 = var_2.laststandparams.smeansofdeath;
        var_6 = var_2.laststandparams.sweapon;
        var_15 = var_2.laststandparams.sprimaryweapon;
        var_7 = var_2.laststandparams.vdir;
        var_8 = var_2.laststandparams.shitloc;
        var_14 = ( gettime() - var_2.laststandparams.laststandstarttime ) / 1000;
        var_2.laststandparams = undefined;
        var_1 = scripts\mp\utility\game::_validateattacker( var_1 );
    }

    if ( !isdefined( var_1 ) || var_1.classname == "trigger_hurt" || var_1.classname == "worldspawn" || var_1 == var_2 )
    {
        var_16 = undefined;

        if ( isdefined( self.attackers ) && self.attackers.size > 0 )
        {
            foreach ( var_18 in self.attackers )
            {
                if ( !isdefined( scripts\mp\utility\game::_validateattacker( var_18 ) ) )
                    continue;

                if ( !isdefined( var_2.attackerdata[var_18.guid].damage ) )
                    continue;

                if ( var_18 == var_2 || level.teambased && var_18.team == var_2.team )
                    continue;

                if ( var_2.attackerdata[var_18.guid].lasttimedamaged + 2500 < gettime() && ( var_1 != var_2 && ( isdefined( var_2.laststand ) && var_2.laststand ) ) )
                    continue;

                if ( var_2.attackerdata[var_18.guid].damage > 1 && !isdefined( var_16 ) )
                {
                    var_16 = var_18;
                    continue;
                }

                if ( isdefined( var_16 ) && var_2.attackerdata[var_18.guid].damage > var_2.attackerdata[var_16.guid].damage )
                    var_16 = var_18;
            }
        }

        if ( !isdefined( var_16 ) )
        {
            if ( isdefined( var_2.debuffedbyplayers ) && var_2.debuffedbyplayers.size > 0 )
            {
                var_20 = [ "chargemode_mp", "cryo_mine_mp", "concussion_grenade_mp", "super_trophy_mp", "blackout_grenade_mp", "blackhole_grenade_mp", "power_spider_grenade_mp", "emp_grenade_mp" ];

                foreach ( var_26, var_22 in var_20 )
                {
                    var_23 = scripts\mp\gamescore::_id_7E64( var_2, var_22 );

                    if ( isdefined( var_23 ) && var_23.size > 0 )
                    {
                        for ( var_24 = var_23.size - 1; var_24 >= 0; var_24-- )
                        {
                            var_25 = var_23[var_24];

                            if ( !isdefined( scripts\mp\utility\game::_validateattacker( var_25 ) ) )
                                continue;

                            if ( !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( var_25, var_2 ) ) )
                                continue;

                            var_16 = var_25;

                            if ( !isdefined( var_2.attackerdata ) || !isdefined( var_2.attackerdata[var_16.guid] ) )
                                addattacker( var_2, var_16, undefined, var_22, 0, undefined, undefined, undefined, undefined, "MOD_EXPLOSIVE" );

                            break;
                        }
                    }

                    if ( isdefined( var_16 ) )
                        break;
                }
            }
        }

        if ( isdefined( var_16 ) )
        {
            var_1 = var_16;
            var_1.assistedsuicide = 1;
            var_6 = var_2.attackerdata[var_16.guid].weapon;
            var_7 = var_2.attackerdata[var_16.guid].vdir;
            var_8 = var_2.attackerdata[var_16.guid].shitloc;
            var_9 = var_2.attackerdata[var_16.guid].psoffsettime;
            var_5 = var_2.attackerdata[var_16.guid].smeansofdeath;
            var_3 = var_2.attackerdata[var_16.guid].damage;
            var_15 = var_2.attackerdata[var_16.guid].sprimaryweapon;
            var_0 = var_1;
            var_13 = 1;
        }
    }

    scripts\mp\equipment\wrist_rocket::_id_13DFA( var_0, var_1, var_2, var_5, var_6 );

    if ( scripts\mp\utility\game::isheadshot( var_6, var_8, var_5, var_1 ) )
        var_5 = "MOD_HEAD_SHOT";
    else if ( !isdefined( var_2.nuked ) )
    {
        if ( isdefined( level._id_4C4A ) )
            [[ level._id_4C4A ]]( var_2, var_5, var_0 );
        else if ( var_5 != "MOD_MELEE" )
            var_2 scripts\mp\utility\game::_id_CF16();
    }

    if ( isdefined( level._id_4C47 ) )
        [[ level._id_4C47 ]]( var_2, var_5, var_0 );

    if ( isdefined( var_1 ) && isdefined( var_2 ) && var_5 == "MOD_MELEE" )
    {
        var_27 = "defaultweapon_melee";

        if ( getweaponbasename( var_6 ) == "iw7_nunchucks" || getweaponbasename( var_6 ) == "iw7_katana" )
            var_27 = "heavy_2s";

        var_2 playrumbleonentity( var_27 );
        var_1 playrumbleonentity( var_27 );
    }

    var_28 = _id_9E06( var_2, var_1 );

    if ( isdefined( var_1 ) )
    {
        if ( var_1.code_classname == "script_vehicle" && isdefined( var_1.owner ) )
            var_1 = var_1.owner;

        if ( var_1.code_classname == "misc_turret" && isdefined( var_1.owner ) )
        {
            if ( isdefined( var_1.vehicle ) )
                var_1.vehicle notify( "killedPlayer", var_2 );

            var_1 = var_1.owner;
        }

        if ( isagent( var_1 ) )
        {
            if ( isdefined( var_1.agent_type ) )
            {
                if ( var_1.agent_type == "dog" )
                    var_6 = "guard_dog_mp";
                else if ( var_1.agent_type == "squadmate" )
                    var_6 = "agent_support_mp";
            }

            if ( isdefined( var_1.owner ) )
                var_1 = var_1.owner;
        }

        if ( var_1.code_classname == "script_model" && isdefined( var_1.owner ) )
        {
            var_1 = var_1.owner;

            if ( !_id_9E06( var_2, var_1 ) && var_1 != var_2 )
                var_1 notify( "crushed_enemy" );
        }
    }

    if ( var_5 != "MOD_SUICIDE" && ( scripts\mp\utility\game::isaigameparticipant( var_2 ) || scripts\mp\utility\game::isaigameparticipant( var_1 ) ) && isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["get_attacker_ent"] ) )
    {
        var_29 = [[ level.bot_funcs["get_attacker_ent"] ]]( var_1, var_0 );

        if ( isdefined( var_29 ) )
        {
            if ( scripts\mp\utility\game::isaigameparticipant( var_2 ) )
                var_2 botmemoryevent( "death", var_6, var_29.origin, var_2.origin, var_29 );

            if ( scripts\mp\utility\game::isaigameparticipant( var_1 ) )
            {
                var_30 = 1;

                if ( var_29.classname == "script_vehicle" && isdefined( var_29.helitype ) || var_29.classname == "rocket" || var_29.classname == "misc_turret" )
                    var_30 = 0;

                if ( var_30 )
                    var_1 botmemoryevent( "kill", var_6, var_29.origin, var_2.origin, var_2 );
            }
        }
    }

    if ( scripts\mp\utility\game::_id_9EF0( var_2 ) )
    {
        var_2._id_D3E7 scripts\mp\weapons::dropscavengerfordeath( var_1 );
        var_2._id_D3E7 [[ level.weapondropfunction ]]( var_1, var_5 );
    }
    else
    {
        var_2 scripts\mp\weapons::dropscavengerfordeath( var_1, var_5 );
        var_2 [[ level.weapondropfunction ]]( var_1, var_5 );
    }

    if ( !var_11 )
    {
        var_2 scripts\mp\utility\game::updatesessionstate( "dead" );

        if ( isplayer( var_1 ) && var_1 != var_2 )
            var_2 setclientomnvar( "ui_killcam_killedby_id", var_1 getentitynumber() );
    }

    var_31 = isdefined( var_2.fauxdeath ) && var_2.fauxdeath && isdefined( var_2.switching_teams ) && var_2.switching_teams;

    if ( !var_31 )
        var_2 scripts\mp\playerlogic::removefromalivecount();

    if ( !isdefined( var_2.switching_teams ) )
    {
        var_32 = var_2;

        if ( isdefined( var_2._id_4447 ) )
            var_32 = var_2._id_4447;

        if ( !isdefined( level.ignorescoring ) && !var_28 )
        {
            var_32 scripts\mp\utility\game::incperstat( "deaths", 1, isdefined( level.ignorekdrstats ) );
            var_32.deaths = var_32 scripts\mp\utility\game::getpersstat( "deaths" );
            var_32 scripts\mp\utility\game::updatepersratio( "kdRatio", "kills", "deaths", level.ignorekdrstats );
            var_32 scripts\mp\persistence::statsetchild( "round", "deaths", var_32.deaths, level.ignorekdrstats );
        }
    }

    if ( isdefined( var_1 ) && isplayer( var_1 ) )
        var_1 checkkillsteal( var_2 );

    var_33 = var_6;
    var_34 = var_5;

    if ( scripts\mp\utility\game::_id_9E6C( var_33 ) || isdefined( var_0._id_110E8 ) )
    {
        var_35 = undefined;

        if ( var_33 == "minijackal_assault_mp" )
            var_35 = 10042;
        else if ( isdefined( var_0._id_110E8 ) )
        {
            if ( isdefined( var_0._id_110E8._id_1318B ) && var_0._id_110E8._id_1318B > 0 )
                var_35 = var_0._id_110E8._id_1318B;
        }

        if ( isdefined( var_35 ) )
        {
            var_36 = level._id_110EC.rarity[var_35];
            var_37 = level._id_110EC._id_E76D[var_35];

            if ( var_33 != "none" )
            {
                var_33 = var_6 + "+loot" + var_37;
                var_34 = "MOD_SCORESTREAK";
            }

            var_2.killsteakvariantattackerinfo = spawnstruct();
            var_2.killsteakvariantattackerinfo._id_92B8 = var_35;
            var_2.killsteakvariantattackerinfo.rarity = var_36;
        }
    }

    if ( isdefined( var_33 ) && scripts\mp\utility\game::_id_821D( var_33 ) == "iw7_axe_mp" && isdefined( var_1 ) && var_1 getweaponammoclip( var_33 ) > 0 )
        var_34 = "MOD_IMPACT";

    obituary( var_2, var_1, var_33, var_34 );
    var_38 = 0;
    var_39 = 1;
    var_2 scripts\mp\clientmatchdata::_id_AFD5( var_1 );
    var_40 = var_2._id_B3E3;

    if ( !isdefined( var_40 ) )
        var_40 = level._id_B4AF - 1;

    var_2 scripts\mp\matchdata::_id_AFD5( var_40, var_1, var_3, var_5, var_6, var_15, var_8 );
    var_2 scripts\mp\analyticslog::_id_AFA7();
    var_2 scripts\mp\analyticslog::_id_AFA9( var_1, var_5, var_6 );

    if ( isplayer( var_1 ) )
        var_1 scripts\mp\analyticslog::_id_AFAA( var_2, var_5, var_6 );

    var_2 _id_12E85( self.attackers, self.attackerdata );
    var_2 _id_41D5();
    var_2.deathspectatepos = undefined;

    if ( var_2 _id_9F91() )
        _id_89F1();
    else if ( !isplayer( var_1 ) || isplayer( var_1 ) && var_5 == "MOD_FALLING" && ( !isdefined( var_2._id_115FC ) && !var_2._id_115FC ) )
    {
        var_2.deathspectatepos = var_2.origin;
        _id_89FC( var_1, var_40, var_5, var_8 );

        if ( isagent( var_1 ) )
            var_38 = 1;
    }
    else if ( var_1 == var_2 || !scripts\mp\utility\game::playersareenemies( var_1, var_2 ) && scripts\mp\utility\game::isdronepackage( var_0 ) )
        _id_89ED( var_5, var_8 );
    else if ( var_28 )
    {
        if ( !( isdefined( var_2.nuked ) || var_6 == "bomb_site_mp" ) )
            handlefriendlyfiredeath( var_1 );
    }
    else
    {
        if ( var_5 == "MOD_GRENADE" && var_0 == var_1 )
            addattacker( var_2, var_1, var_0, var_6, var_3, ( 0, 0, 0 ), var_7, var_8, var_9, var_5 );

        if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_chain_reaction" ) )
        {
            if ( var_5 == "MOD_EXPLOSIVE" || var_5 == "MOD_GRENADE_SPLASH" || var_5 == "MOD_GRENADE" )
                var_2 scripts\mp\perks\perkfunctions::_id_10D79( var_1 );
        }

        if ( var_6 == "case_bomb_mp" )
            var_1 thread scripts\mp\weapons::_id_3B0D( var_2, var_2.origin );

        var_38 = 1;

        if ( isai( var_2 ) && isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["should_do_killcam"] ) )
            var_38 = var_2 [[ level.bot_funcs["should_do_killcam"] ]]();

        if ( isdefined( level.disable_killcam ) && level.disable_killcam )
            var_38 = 0;

        _id_89CA( var_40, var_1, var_0, var_6, var_5, var_2, var_4 );
        var_2 thread scripts\mp\missions::_id_D3C3( var_0, var_1, var_3, var_4, var_5, var_6, var_15, var_8, var_1._id_B930 );
        var_1 thread scripts\mp\intelchallenges::_id_99BA( var_2, var_0, var_6, var_5, var_1._id_B930 );
        var_1 thread scripts\mp\contractchallenges::contractkillsimmediate( var_2, var_0, var_6, var_5, var_1._id_B930 );
        var_2.pers["cur_death_streak"]++;

        if ( isplayer( var_1 ) && var_2 scripts\mp\utility\game::isjuggernaut() )
        {
            if ( isdefined( var_2._id_9E5D ) && var_2._id_9E5D )
            {
                var_1 thread scripts\mp\utility\game::_id_115DE( "callout_killed_maniac", var_1 );

                if ( var_5 == "MOD_MELEE" )
                    var_1 scripts\mp\missions::_id_D992( "ch_thisisaknife" );
            }
            else if ( isdefined( var_2._id_9E5C ) && var_2._id_9E5C )
                var_1 thread scripts\mp\utility\game::_id_115DE( level._id_B332, var_1 );
            else
                var_1 thread scripts\mp\utility\game::_id_115DE( "callout_killed_juggernaut", var_1 );
        }
    }

    var_41 = 0;
    var_42 = undefined;

    if ( isdefined( self._id_D8B0 ) )
    {
        var_41 = 1;
        var_42 = self._id_D8B0;
        self._id_D8B0 = undefined;
    }

    if ( isplayer( var_1 ) && var_1 != self && ( !level.teambased || level.teambased && self.team != var_1.team ) )
    {
        if ( var_41 && isdefined( var_42 ) )
            var_43 = var_42;
        else
            var_43 = self._id_A978;

        var_43 = scripts\mp\utility\game::_id_13CA1( var_43, var_0 );
        thread scripts\mp\gamelogic::_id_11AF7( var_43, var_5 );
        var_1 thread scripts\mp\gamelogic::_id_11AC8( var_6, var_5 );
    }

    var_2 _id_E264();
    var_2 resetplayeromnvarsonspawn();
    var_2._id_01B1 = var_1;
    var_2._id_A972 = var_2.origin;
    var_2.deathtime = gettime();
    var_2._id_138DD = 0;
    var_2._id_E4A8 = 0;
    var_2._id_EB14 = 0;
    var_2._id_110F4 = scripts\mp\class::_id_AE33( var_2._id_110F4 );

    if ( scripts\mp\killstreaks\killstreaks::_id_110F5( var_2._id_110F4 ) )
    {
        if ( !level._id_3B1E && !var_2 scripts\mp\utility\game::_id_12D6( "specialty_support_killstreaks" ) )
            var_2 scripts\mp\killstreaks\killstreaks::_id_E275();
    }

    var_44 = undefined;

    if ( var_13 || level.teambased && isdefined( var_1.team ) && var_1.team == var_2.team )
    {
        var_38 = 0;
        var_39 = 0;
    }

    if ( var_11 )
    {
        var_38 = 0;
        var_10 = var_2 _meth_8231( var_0, var_5, var_6, var_8, var_7 );
    }

    if ( isdefined( var_1 ) && isplayer( var_1 ) && isdefined( var_5 ) && isdefined( var_6 ) && isdefined( var_8 ) && isdefined( var_7 ) )
    {
        var_45 = scripts\mp\utility\game::_id_8234( var_6 );
        var_46 = var_1 _meth_8519( var_6 );

        if ( isdefined( var_45 ) && var_45 == "iw7_rvn" && scripts\mp\utility\game::istrue( var_46 ) && var_5 == "MOD_MELEE" )
        {
            var_10 = var_2 _meth_8231( var_1, "MOD_EXPLOSIVE", var_6, var_8, var_7 );
            var_47 = getweaponvariantindex( var_6 );

            if ( !isdefined( var_47 ) || var_47 != 3 && var_47 != 35 )
                playloopsound( var_2.origin, "melee_user2_human_default_fatal_npc" );
        }
    }

    if ( !isdefined( self._id_C026 ) )
    {
        var_2._id_2C09 = var_2 _meth_8086( var_10 );

        if ( var_2 _meth_84CA() )
            var_2._id_2C09 setscriptablepartstate( "chargeModeShieldDrop", "active", 0 );

        if ( scripts\mp\utility\game::istrue( level._id_DC24 ) )
        {
            thread scripts\mp\weapons::throwingknife_detachknivesfromcorpse( var_2._id_2C09 );
            thread scripts\mp\weapons::axedetachfromcorpse( var_2._id_2C09 );
        }
    }

    if ( !isdefined( self._id_C026 ) && isdefined( var_2._id_2C09 ) )
    {
        var_2._id_2C09._id_0336 = "player_corpse";

        if ( scripts\engine\utility::_id_9D74( var_5 ) && scripts\mp\utility\game::_id_821D( var_6 ) == "iw7_atomizer_mp" || var_6 == "nuke_mp" )
        {
            var_48 = undefined;

            if ( var_6 == "nuke_mp" )
                var_48 = "ks_nuke_death_npc";

            var_2._id_2C09 thread scripts\mp\archetypes\archassassin_utility::_id_CEF1( var_48 );
            var_2._id_2C09 hide( 1 );
        }

        enqueueweapononkillcorpsetablefuncs( var_1, var_2, var_0, var_6, var_5 );
        var_2 thread callcorpsetablefuncs();

        if ( var_11 )
        {
            var_2 playerhide();
            var_2 _meth_8500( 0 );
        }

        if ( var_2 isonladder() || var_2 _meth_81AD() || !var_2 isonground() || isdefined( var_2.nuked ) || isdefined( var_2._id_4C87 ) || scripts\mp\utility\game::_id_9F13() )
        {
            var_49 = 0;

            if ( var_5 == "MOD_MELEE" )
            {
                if ( isdefined( var_2._id_9EE6 ) && var_2._id_9EE6 || isdefined( var_2.nuked ) )
                    var_49 = 1;
            }

            if ( !var_49 || scripts\mp\utility\game::_id_9F13() )
            {
                var_2._id_2C09 startragdoll( 1 );
                var_2 notify( "start_instant_ragdoll", var_5, var_0 );
            }
        }

        if ( !isdefined( var_2.switching_teams ) )
        {
            if ( isdefined( var_1 ) && isplayer( var_1 ) && !var_1 scripts\mp\utility\game::_id_12D6( "specialty_silentkill" ) )
                thread scripts\mp\deathicons::_id_17C1( var_2._id_2C09, var_2, var_2.team, 5.0 );
        }

        thread _id_5124( var_2._id_2C09, var_8, var_7, var_6, var_0, var_5 );
    }
    else if ( isdefined( self._id_C026 ) )
    {
        var_2._id_2C09 = var_2 _meth_8086( var_10 );
        var_2._id_2C09 hide( 1 );

        if ( level._id_B335 == "mp_neon" )
        {
            thread scripts\mp\weapons::throwingknife_detachknivesfromcorpse( var_2._id_2C09 );
            thread scripts\mp\weapons::axedetachfromcorpse( var_2._id_2C09 );
        }
    }

    var_2 thread scripts\mp\supers::_id_898E();
    updatecombatrecordkillstats( var_1, var_2, var_5, var_6 );
    var_2 thread [[ level._id_C577 ]]( var_0, var_1, var_3, var_5, var_6, var_7, var_8, var_9, var_10, var_40 );

    if ( isai( var_2 ) && isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["on_killed"] ) )
        var_2 thread [[ level.bot_funcs["on_killed"] ]]( var_0, var_1, var_3, var_5, var_6, var_7, var_8, var_9, var_10, var_40 );

    if ( scripts\mp\utility\game::_id_9E0E( var_1 ) )
        var_50 = var_1 getentitynumber();
    else
        var_50 = -1;

    if ( !isdefined( var_44 ) )
        var_44 = var_2 scripts\mp\killcam::_id_7F32( var_1, var_0, var_6 );

    if ( isdefined( level._id_B3FC ) && isdefined( var_0 ) && isplayer( var_0 ) && scripts\engine\utility::_id_9D74( var_5 ) )
    {
        var_51 = var_0.origin - self.origin;
        var_52 = vectornormalize( ( var_51[0], var_51[1], 0 ) );
        var_53 = anglestoforward( self.angles );
        var_54 = vectornormalize( ( var_53[0], var_53[1], 0 ) );
        var_55 = clamp( var_54[0] * var_52[0] + var_54[1] * var_52[1], -1.0, 1.0 );
        var_56 = acos( var_55 );

        if ( !isdefined( self._id_D37E ) )
            self._id_D37E = [];

        self._id_D37E[self._id_D37E.size] = var_56;
        var_57 = 0.0;

        if ( isdefined( self._id_658D ) )
            var_57 = gettime() - self._id_658D;

        if ( !isdefined( self._id_658E ) )
            self._id_658E = [];

        self._id_658E[self._id_658E.size] = var_57;
        self._id_658D = undefined;
    }

    var_58 = -1;
    var_59 = 0;

    if ( isdefined( var_44 ) )
    {
        var_58 = var_44 getentitynumber();
        var_59 = var_44._id_0064;

        if ( !isdefined( var_59 ) )
            var_59 = 0;
    }

    var_60 = var_5 == "MOD_IMPACT" || var_5 == "MOD_HEADSHOT" && isdefined( var_0 ) || var_5 == "MOD_GRENADE" || isdefined( var_2 ) && isdefined( var_2._id_1117F ) && isdefined( var_0 ) && var_2._id_1117F == var_0 || var_6 == "throwingknifec4_mp";

    if ( !scripts\mp\utility\game::_id_9E6C( var_6 ) )
        scripts\mp\killcam::_id_F770( var_6, var_5, var_0 );

    if ( level.recordfinalkillcam && var_39 )
    {
        if ( ( !isdefined( level.disable_killcam ) || !level.disable_killcam ) && var_5 != "MOD_SUICIDE" && !( !isdefined( var_1 ) || var_1.classname == "trigger_hurt" || var_1.classname == "worldspawn" || var_1 == var_2 ) )
            scripts\mp\finalkillcam::recordfinalkillcam( 5.0, var_2, var_1, var_50, var_0, var_58, var_59, var_60, var_6, var_14, var_9, var_5 );
    }

    var_2 setrankedplayerdata( "common", "killCamHowKilled", 0 );

    switch ( var_5 )
    {
        case "MOD_HEAD_SHOT":
            var_2 setrankedplayerdata( "common", "killCamHowKilled", 1 );
            break;
        default:
            break;
    }

    var_61 = undefined;

    if ( var_38 )
    {
        var_2 scripts\mp\killcam::_id_D83E( var_0, var_1 );

        if ( isdefined( var_0 ) && isagent( var_0 ) )
        {
            var_61 = spawnstruct();
            var_61.agent_type = var_0.agent_type;
            var_61.lastspawntime = var_0.lastspawntime;
        }
    }

    if ( !var_11 )
    {
        self._id_E29A = gettime() + 1750;
        var_62 = scripts\mp\playerlogic::_id_1193A( 1 );

        if ( var_62 < 1 )
            var_62 = 1;

        var_2 thread scripts\mp\playerlogic::_id_D81E( var_62 );
        wait 1.75;

        if ( var_38 )
            var_38 = !scripts\mp\finalkillcam::_id_10266( 0.5 );

        var_2 notify( "death_delay_finished" );
    }

    var_63 = ( gettime() - var_2.deathtime ) / 1000;
    self._id_E29A = gettime();
    var_38 = var_38 && !var_2 scripts\mp\battlebuddy::_id_3876();

    if ( !( isdefined( var_2._id_3881 ) && var_2._id_3881 ) && var_38 && level._id_A636 && game["state"] == "playing" && !var_2 scripts\mp\utility\game::isusingremote() && !level.showingfinalkillcam )
    {
        var_64 = !( scripts\mp\utility\game::getgametypenumlives() && !var_2.pers["lives"] );
        var_62 = scripts\mp\playerlogic::_id_1193A( 1 );
        var_65 = var_64 && var_62 <= 0;

        if ( !var_64 )
        {
            var_62 = -1;
            level notify( "player_eliminated", var_2 );
        }

        if ( !isdefined( var_1 ) )
            var_66 = [];
        else
            var_66 = var_1.pers["loadoutPerks"];

        var_67 = undefined;

        if ( isdefined( var_2.killsteakvariantattackerinfo ) )
            var_67 = var_2.killsteakvariantattackerinfo;

        var_2 scripts\mp\killcam::_id_A636( var_0, var_61, var_50, var_58, var_59, undefined, var_60, var_6, var_63 + var_14, var_9, var_62, scripts\mp\gamelogic::_id_11939(), var_1, var_2, var_5, var_66, var_67 );
    }

    if ( game["state"] != "playing" )
    {
        if ( !level.showingfinalkillcam )
        {
            var_2 scripts\mp\utility\game::updatesessionstate( "dead" );
            var_2 scripts\mp\utility\game::_id_41BF();
        }

        return;
    }

    var_68 = scripts\mp\utility\game::getgametypenumlives();
    var_69 = self.pers["lives"];

    if ( self == var_2 && isdefined( var_2._id_28CC ) && scripts\mp\utility\game::isreallyalive( var_2._id_28CC ) && ( !scripts\mp\utility\game::getgametypenumlives() || self.pers["lives"] ) && !var_2 scripts\mp\utility\game::isusingremote() )
        scripts\mp\battlebuddy::_id_136D6();

    if ( scripts\mp\utility\game::_id_9FD4( var_2.class ) )
    {
        if ( isdefined( level._id_1674 ) && level._id_1674.team == var_2.team )
            var_2 scripts\mp\killstreaks\orbital_deployment::_id_10DD3( "orbital_deployment", 1 );
        else
            var_2 thread scripts\mp\playerlogic::_id_1083A();
    }

    var_2.attacker = undefined;
}

_id_9F91()
{
    if ( isdefined( self.switching_teams ) )
        return 1;

    return 0;
}

_id_9FA0()
{
    var_0 = scripts\mp\teams::_id_46BB();
    var_0[self._id_AB33]--;
    var_0[self._id_A49E]++;
    return var_0[self._id_A49E] - var_0[self._id_AB33] < 2;
}

_id_9E06( var_0, var_1 )
{
    if ( !level.teambased )
        return 0;

    if ( !isdefined( var_1 ) )
        return 0;

    if ( !isplayer( var_1 ) && !isdefined( var_1.team ) )
        return 0;

    if ( var_0.team != var_1.team )
        return 0;

    if ( var_0 == var_1 )
        return 0;

    return 1;
}

_id_A656( var_0 )
{
    if ( !isplayer( var_0 ) )
        return 0;

    if ( var_0 != self )
        return 0;

    return 1;
}

_id_89F1()
{
    if ( !level.teambased )
        return;

    if ( self._id_A49E == "spectator" || !_id_9FA0() )
    {
        thread scripts\mp\utility\game::_id_83B4( "suicide", undefined, undefined, 1, 1 );
        scripts\mp\utility\game::incperstat( "suicides", 1 );
        self.suicides = scripts\mp\utility\game::getpersstat( "suicides" );
    }

    if ( isdefined( level._id_C5B0 ) )
        [[ level._id_C5B0 ]]( self );
}

_id_89FC( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0.team ) )
    {
        _id_89ED( var_2, var_3 );
        return;
    }

    if ( level.teambased && var_0.team != self.team || !level.teambased )
    {
        if ( isdefined( level.onnormaldeath ) && ( isplayer( var_0 ) || isagent( var_0 ) ) && var_0.team != "spectator" )
        {
            if ( !level._id_7669 )
                [[ level.onnormaldeath ]]( self, var_0, var_1, var_2 );
        }
    }
}

_id_89ED( var_0, var_1 )
{
    thread scripts\mp\utility\game::_id_83B4( "suicide" );
    scripts\mp\utility\game::incperstat( "suicides", 1 );
    self.suicides = scripts\mp\utility\game::getpersstat( "suicides" );
    var_2 = scripts\mp\tweakables::_id_81E7( "game", "suicidepointloss" );
    scripts\mp\gamescore::_id_13D4( self, scripts\mp\gamescore::_id_12B4( self ) - var_2 );

    if ( scripts\mp\weapons::_id_85BE() && var_0 == "MOD_SUICIDE" && var_1 == "none" )
        self._id_A991 = gettime();

    if ( isdefined( level._id_C5AA ) )
        [[ level._id_C5AA ]]( self );

    if ( isdefined( self._id_7408 ) )
        scripts\mp\hud_message::_id_10122( "MP_FRIENDLY_FIRE_WILL_NOT" );
}

handlefriendlyfiredeath( var_0 )
{
    var_0 thread scripts\mp\rank::scoreeventpopup( "teamkill" );
    var_0.pers["teamkills"] += 1.0;
    var_0._id_115D5++;

    if ( scripts\mp\tweakables::_id_81E7( "team", "teamkillpointloss" ) )
    {
        var_1 = scripts\mp\rank::getscoreinfovalue( "kill" );
        scripts\mp\gamescore::_id_13D4( var_0, scripts\mp\gamescore::_id_12B4( var_0 ) - var_1 );
    }

    if ( level._id_B47A < 0 )
        return;

    if ( level.ingraceperiod )
    {
        var_2 = 1;
        var_0.pers["teamkills"] += level._id_B47A;
    }
    else if ( var_0.pers["teamkills"] > 1 && scripts\mp\utility\game::_id_81CB() < level._id_8487 * 1000 + 8000 + var_0.pers["teamkills"] * 1000 )
    {
        var_2 = 1;
        var_0.pers["teamkills"] += level._id_B47A;
    }
    else
        var_2 = var_0 scripts\mp\playerlogic::_id_115D4();

    if ( var_2 > 0 )
    {
        var_0.pers["teamKillPunish"] = 1;
        var_0 scripts\mp\utility\game::_id_1417();
    }
}

_id_89CA( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_1 thread scripts\mp\events::_id_A651( var_0, self, var_3, var_4, var_6, var_2 );

    if ( var_4 == "MOD_HEAD_SHOT" )
    {
        var_1 scripts\mp\utility\game::incperstat( "headshots", 1 );
        var_1.headshots = var_1 scripts\mp\utility\game::getpersstat( "headshots" );

        if ( isdefined( var_1.laststand ) )
            var_7 = scripts\mp\rank::getscoreinfovalue( "kill" ) * 2;
        else
            var_7 = undefined;

        var_1 playlocalsound( "bullet_impact_headshot_plr" );
        self playsound( "bullet_impact_headshot" );
    }
    else if ( isdefined( var_1.laststand ) )
        var_7 = scripts\mp\rank::getscoreinfovalue( "kill" ) * 2;
    else
        var_7 = undefined;

    var_8 = var_1;

    if ( isdefined( var_1._id_4447 ) )
        var_8 = var_1._id_4447;

    if ( !scripts\mp\utility\game::istrue( level.ignorescoring ) && !_id_9E06( var_5, var_1 ) )
    {
        var_8 scripts\mp\utility\game::incperstat( "kills", 1, isdefined( level.ignorekdrstats ) );
        var_8.kills = var_8 scripts\mp\utility\game::getpersstat( "kills" );
        var_8 scripts\mp\utility\game::updatepersratio( "kdRatio", "kills", "deaths", level.ignorekdrstats );
        var_8 scripts\mp\persistence::statsetchild( "round", "kills", var_8.kills, level.ignorekdrstats );
    }

    self _meth_83FF();
    var_1 _meth_83FE();
    var_9 = var_1.pers["cur_kill_streak"];

    if ( !scripts\mp\utility\game::istrue( level.ignorescoring ) && ( isalive( var_1 ) || var_1._id_110F4 == "support" ) )
    {
        if ( var_4 == "MOD_MELEE" && !var_1 scripts\mp\utility\game::isjuggernaut() || var_1 scripts\mp\utility\game::_id_A679( var_3 ) )
            var_1 _id_DEFA( var_3, var_4, 1 );

        if ( var_1.pers["cur_kill_streak"] > var_1 scripts\mp\utility\game::getpersstat( "longestStreak" ) )
            var_1 scripts\mp\utility\game::_id_F7DF( "longestStreak", var_1.pers["cur_kill_streak"] );
    }

    var_1.pers["cur_death_streak"] = 0;

    if ( !scripts\mp\utility\game::istrue( level.ignorescoring ) && var_1.pers["cur_kill_streak"] > var_1 scripts\mp\persistence::_id_10E35( "round", "killStreak" ) )
        var_1 scripts\mp\persistence::statsetchild( "round", "killStreak", var_1.pers["cur_kill_streak"] );

    if ( !scripts\mp\utility\game::istrue( level.ignorescoring ) && var_1 scripts\mp\utility\game::_id_DCD5() )
    {
        if ( var_1.pers["cur_kill_streak"] > var_1._id_A61A )
        {
            var_1 scripts\mp\persistence::_id_10E54( "killStreak", var_1.pers["cur_kill_streak"] );
            var_1._id_A61A = var_1.pers["cur_kill_streak"];
        }
    }

    if ( !scripts\mp\utility\game::_id_9E6C( var_3 ) )
    {
        var_1 thread scripts\mp\utility\game::_id_83B4( "kill", var_3 );

        if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_hardline" ) && isdefined( var_1.hardlineactive ) )
            var_1 thread scripts\mp\utility\game::givestreakpointswithtext( "assist_hardline", var_3, undefined );
    }

    var_10 = scripts\mp\tweakables::_id_81E7( "game", "deathpointloss" );
    scripts\mp\gamescore::_id_13D4( self, scripts\mp\gamescore::_id_12B4( self ) - var_10 );

    if ( isdefined( level._id_1541 ) && level._id_1541 == var_1 )
        level notify( "ai_killed", self, var_1, var_4, var_3 );

    if ( isdefined( var_1._id_C2D3 ) )
        level notify( "odin_killed_player", self );

    level notify( "player_got_killstreak_" + var_1.pers["cur_kill_streak"], var_1 );
    var_1 notify( "got_killstreak", var_1.pers["cur_kill_streak"] );
    var_1 notify( "killed_enemy", self, var_3, var_4 );

    if ( isdefined( level.onnormaldeath ) && var_1.pers["team"] != "spectator" && !isdefined( level.ignorescoring ) )
        [[ level.onnormaldeath ]]( self, var_1, var_0, var_4, var_3 );

    level thread scripts\mp\battlechatter_mp::_id_EB85( var_1, "kill", 0.75 );
    var_11 = undefined;

    switch ( var_5._id_AE62 )
    {
        case "archetype_assault":
            var_11 = "plr_killfirm_warfighter";
            break;
        case "archetype_assassin":
            var_11 = "plr_killfirm_ftl";
            break;
        case "archetype_heavy":
            var_11 = "plr_killfirm_merc";
            break;
        case "archetype_scout":
            var_11 = "plr_killfirm_c6";
            break;
        case "archetype_engineer":
            var_11 = "plr_killfirm_stryker";
            break;
        case "archetype_sniper":
            var_11 = "plr_killfirm_ghost";
            break;
    }

    if ( isdefined( var_11 ) )
        level thread scripts\mp\battlechatter_mp::_id_EB87( var_1, var_11, "plr_killfirm_generic", 0.75 );

    if ( isdefined( self._id_A93F ) && isdefined( self._id_A940 ) && self._id_A93F != var_1 )
    {
        if ( gettime() - self._id_A940 < 2500 )
            self._id_A93F thread scripts\mp\gamescore::_id_D9B5( self );
        else if ( isalive( self._id_A93F ) && gettime() - self._id_A940 < 5000 )
        {
            var_12 = vectornormalize( anglestoforward( self.angles ) );
            var_13 = vectornormalize( self._id_A93F.origin - self.origin );

            if ( vectordot( var_13, var_12 ) > 0.925 )
                self._id_A93F thread scripts\mp\gamescore::_id_D9B5( self );
        }
    }

    scripts\mp\gamescore::awardbuffdebuffassists( var_1, self );

    if ( isdefined( self.attackers ) )
    {
        foreach ( var_15 in self.attackers )
        {
            if ( !isdefined( scripts\mp\utility\game::_validateattacker( var_15 ) ) )
                continue;

            if ( var_15 == var_1 )
                continue;

            if ( self == var_15 )
                continue;

            if ( isdefined( level.assists_disabled ) )
                continue;

            var_16 = undefined;

            if ( isdefined( self.attackerdata ) )
            {
                var_17 = self.attackerdata[var_15.guid];

                if ( isdefined( var_17 ) )
                    var_16 = var_17.weapon;
            }

            var_18 = 0;

            if ( self.attackerdata[var_15.guid].damage >= 75 )
                var_18 = 1;

            var_15 thread scripts\mp\gamescore::_id_D98C( self, var_16, var_18 );

            if ( var_15 scripts\mp\utility\game::_id_12D6( "specialty_boom" ) )
                var_5 thread scripts\mp\perks\perkfunctions::_id_F671( var_15 );
        }
    }

    if ( isdefined( self._id_B370 ) )
    {
        foreach ( var_15 in level.players )
        {
            if ( var_15.team == self.team )
                continue;

            if ( scripts\engine\utility::array_contains( self.attackers, var_15 ) )
                continue;

            if ( scripts\mp\utility\game::_id_2287( self._id_B370, var_15 scripts\mp\utility\game::_id_81EC() ) )
                var_15 thread scripts\mp\gamescore::_id_D98C( self, var_3 );
        }
    }

    if ( level.teambased )
    {
        if ( isdefined( level._id_12AF3[var_1.team] ) && level._id_12AF3[var_1.team].size > 0 )
        {
            var_22 = [];

            foreach ( var_24 in level._id_12AF3[var_1.team] )
            {
                if ( isdefined( var_24 ) && isdefined( var_24.owner ) && var_24.owner != var_1 && !scripts\engine\utility::_id_693B( var_22, var_24._id_12AFA ) )
                {
                    var_25 = undefined;

                    if ( _id_0DC9::_id_A69F( var_24._id_110E8, "passive_extra_assist" ) )
                        var_25 = 20;

                    var_24.owner thread scripts\mp\utility\game::_id_83B4( var_24._id_12AFA + "_assist", undefined, var_25 );
                    var_22[var_22.size] = var_24._id_12AFA;
                    scripts\mp\missions::_id_D9BC( var_24.owner, var_24._id_12AFA );
                    var_24.owner scripts\mp\utility\game::_id_316C( "update_uav_assist_buffered" );
                    var_24.owner combatrecordkillstreakstat( var_24._id_12AFA );
                }
            }
        }
    }

    if ( isdefined( self._id_12AF8 ) )
        self._id_12AF8 = [];
}

_id_9EFE( var_0 )
{
    if ( weaponclass( var_0 ) == "non-player" )
        return 0;

    if ( weaponclass( var_0 ) == "turret" )
        return 0;

    if ( weaponinventorytype( var_0 ) == "primary" || weaponinventorytype( var_0 ) == "altmode" )
        return 1;

    return 0;
}

callback_playerkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    playerkilled_internal( var_0, var_1, self, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, 0 );
}

_id_DB98( var_0 )
{
    var_1 = 5;

    if ( !isdefined( level._id_FCA4 ) )
        level._id_FCA4 = [];

    if ( level._id_FCA4.size >= var_1 )
    {
        var_2 = level._id_FCA4.size - 1;
        level._id_FCA4[0] delete();

        for ( var_3 = 0; var_3 < var_2; var_3++ )
            level._id_FCA4[var_3] = level._id_FCA4[var_3 + 1];

        level._id_FCA4[var_2] = undefined;
    }

    level._id_FCA4[level._id_FCA4.size] = var_0;
}

launchshield( var_0, var_1 )
{
    if ( isdefined( self.hasriotshieldequipped ) && self.hasriotshieldequipped )
    {
        if ( isdefined( self.riotshieldmodel ) )
            scripts\mp\utility\game::_id_E54F( 1 );
        else if ( isdefined( self.riotshieldmodelstowed ) )
            scripts\mp\utility\game::_id_E54F( 0 );
    }
}

_id_3E0D()
{
    if ( level._id_54CC != 1 )
        return 0;

    if ( !scripts\mp\utility\game::getgametypenumlives() )
        return 0;

    if ( level._id_AD8D[self.team] > 0 )
        return 0;

    foreach ( var_1 in level.players )
    {
        if ( !isalive( var_1 ) )
            continue;

        if ( var_1.team != self.team )
            continue;

        if ( var_1 == self )
            continue;

        if ( !var_1._id_98F3 )
            return 0;
    }

    foreach ( var_1 in level.players )
    {
        if ( !isalive( var_1 ) )
            continue;

        if ( var_1.team != self.team )
            continue;

        if ( var_1._id_98F3 && var_1 != self )
            var_1 _id_AA07( 0 );
    }

    return 1;
}

checkkillsteal( var_0 )
{
    if ( scripts\mp\utility\game::matchmakinggame() )
        return;

    var_1 = 0;
    var_2 = undefined;

    if ( isdefined( var_0.attackerdata ) && var_0.attackerdata.size > 1 )
    {
        foreach ( var_4 in var_0.attackerdata )
        {
            if ( var_4.damage > var_1 )
            {
                var_1 = var_4.damage;
                var_2 = var_4.attackerent;
            }
        }
    }
}

_id_E264()
{
    self.switching_teams = undefined;
    self._id_A49E = undefined;
    self._id_AB33 = undefined;
    self.pers["cur_kill_streak"] = 0;
    self.pers["cur_kill_streak_for_nuke"] = 0;
    scripts\mp\gameobjects::_id_5397();
}

resetplayeromnvarsonspawn()
{
    self setclientomnvar( "ui_carrying_bomb", 0 );
    self setclientomnvar( "ui_objective_state", 0 );
    self setclientomnvar( "ui_securing", 0 );
    self setclientomnvar( "ui_light_armor", 0 );
    self setclientomnvar( "ui_juiced_end_milliseconds", 0 );
    self setclientomnvar( "ui_killcam_end_milliseconds", 0 );
    self setclientomnvar( "ui_cranked_bomb_timer_end_milliseconds", 0 );
    self setclientomnvar( "ui_edge_glow", 0 );
}

_id_9039( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];
    var_5[0] = 2;
    var_5[1] = 3;
    var_5[2] = 5;
    var_5[3] = 7;

    if ( !getdvarint( "scr_hitloc_debug" ) )
        return;

    if ( !isdefined( var_0._id_903A ) )
    {
        for ( var_6 = 0; var_6 < 6; var_6++ )
            var_0 setclientdvar( "ui_hitloc_" + var_6, "" );

        var_0._id_903A = 1;
    }

    if ( level._id_10A56 || !isplayer( var_0 ) )
        return;

    var_7 = 6;

    if ( !isdefined( var_0._id_4D53 ) )
    {
        var_0._id_4D53 = [];

        for ( var_6 = 0; var_6 < var_7; var_6++ )
        {
            var_0._id_4D53[var_6] = spawnstruct();
            var_0._id_4D53[var_6].damage = 0;
            var_0._id_4D53[var_6]._id_9038 = "";
            var_0._id_4D53[var_6]._id_2F34 = 0;
            var_0._id_4D53[var_6]._id_A4A1 = 0;
            var_0._id_4D53[var_6]._id_43A6 = 0;
        }

        var_0._id_4D54 = 0;
        var_0._id_4D55 = undefined;
    }

    for ( var_6 = var_7 - 1; var_6 > 0; var_6-- )
    {
        var_0._id_4D53[var_6].damage = var_0._id_4D53[var_6 - 1].damage;
        var_0._id_4D53[var_6]._id_9038 = var_0._id_4D53[var_6 - 1]._id_9038;
        var_0._id_4D53[var_6]._id_2F34 = var_0._id_4D53[var_6 - 1]._id_2F34;
        var_0._id_4D53[var_6]._id_A4A1 = var_0._id_4D53[var_6 - 1]._id_A4A1;
        var_0._id_4D53[var_6]._id_43A6 = var_0._id_4D53[var_6 - 1]._id_43A6;
    }

    var_0._id_4D53[0].damage = var_2;
    var_0._id_4D53[0]._id_9038 = var_3;
    var_0._id_4D53[0]._id_2F34 = var_4 & level.idflags_penetration;
    var_0._id_4D53[0]._id_A4A1 = var_1 scripts\mp\utility\game::isjuggernaut();

    if ( isdefined( var_0._id_4D55 ) && var_0._id_4D55 != var_1 )
    {
        var_0._id_4D54++;

        if ( var_0._id_4D54 == var_5.size )
            var_0._id_4D54 = 0;
    }

    var_0._id_4D55 = var_1;
    var_0._id_4D53[0]._id_43A6 = var_0._id_4D54;

    for ( var_6 = 0; var_6 < var_7; var_6++ )
    {
        var_8 = "^" + var_5[var_0._id_4D53[var_6]._id_43A6];

        if ( var_0._id_4D53[var_6]._id_9038 != "" )
        {
            var_9 = var_8 + var_0._id_4D53[var_6]._id_9038;

            if ( var_0._id_4D53[var_6]._id_2F34 )
                var_9 += " (BP)";

            if ( var_0._id_4D53[var_6]._id_A4A1 )
                var_9 += " (Jugg)";

            var_0 setclientdvar( "ui_hitloc_" + var_6, var_9 );
        }

        var_0 setclientdvar( "ui_hitloc_damage_" + var_6, var_8 + var_0._id_4D53[var_6].damage );
    }
}

_id_839D()
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "giveRecentShieldXP" );
    self endon( "giveRecentShieldXP" );
    self._id_DDCC++;
    wait 20.0;
    self._id_DDCC = 0;
}

_id_12EB3( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_0._id_1D43 ) || !var_0._id_1D43 || !scripts\mp\utility\game::_id_9F56( var_2 ) )
        scripts\mp\gamelogic::_id_F759( var_0, var_1, var_2 );

    if ( isdefined( var_0 ) )
        var_0._id_1D43 = 1;
}

_id_100C1( var_0 )
{
    switch ( var_0 )
    {
        case "stealth_bomb_mp":
        case "artillery_mp":
            return 0;
    }

    return 1;
}

addattacker( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( !isdefined( var_0.attackerdata ) )
        var_0.attackerdata = [];

    if ( !isdefined( var_0.attackerdata[var_1.guid] ) )
    {
        var_0.attackers[var_1.guid] = var_1;
        var_0.attackerdata[var_1.guid] = spawnstruct();
        var_0.attackerdata[var_1.guid].damage = 0;
        var_0.attackerdata[var_1.guid].attackerent = var_1;
        var_0.attackerdata[var_1.guid].firsttimedamaged = gettime();
        var_0.attackerdata[var_1.guid].hits = 1;
    }
    else
        var_0.attackerdata[var_1.guid].hits++;

    if ( scripts\mp\utility\game::_id_9D78( var_3 ) && !scripts\mp\utility\game::_id_9D79( var_3 ) )
        var_0.attackerdata[var_1.guid].isprimary = 1;

    if ( isdefined( var_9 ) && var_9 != "MOD_MELEE" )
        var_0.attackerdata[var_1.guid]._id_54BD = 1;

    var_10 = scripts\mp\utility\game::_id_7E9D( var_3 );

    if ( isdefined( var_10 ) )
    {
        if ( var_10 == "lethal" )
        {
            var_0.attackerdata[var_1.guid]._id_54B3 = 1;
            var_1 scripts\mp\contractchallenges::contractequipmentdamagedplayer( var_0, var_3, var_2 );
        }

        if ( var_10 == "tactical" )
        {
            var_0.attackerdata[var_1.guid]._id_54B5 = 1;
            var_1 scripts\mp\contractchallenges::contractequipmentdamagedplayer( var_0, var_3, var_2 );
        }
    }

    var_0.attackerdata[var_1.guid].damage += var_4;
    var_0.attackerdata[var_1.guid].weapon = var_3;
    var_0.attackerdata[var_1.guid].vpoint = var_5;
    var_0.attackerdata[var_1.guid].vdir = var_6;
    var_0.attackerdata[var_1.guid].shitloc = var_7;
    var_0.attackerdata[var_1.guid].psoffsettime = var_8;
    var_0.attackerdata[var_1.guid].smeansofdeath = var_9;
    var_0.attackerdata[var_1.guid].attackerent = var_1;
    var_0.attackerdata[var_1.guid].lasttimedamaged = gettime();

    if ( isdefined( var_2 ) && !isplayer( var_2 ) && isdefined( var_2.primaryweapon ) )
        var_0.attackerdata[var_1.guid].sprimaryweapon = var_2.primaryweapon;
    else if ( isdefined( var_1 ) && isplayer( var_1 ) && var_1 getcurrentprimaryweapon() != "none" )
        var_0.attackerdata[var_1.guid].sprimaryweapon = var_1 getcurrentprimaryweapon();
    else
        var_0.attackerdata[var_1.guid].sprimaryweapon = undefined;
}

_id_17AD( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( !isdefined( var_0.attackerdata ) )
        var_0.attackerdata = [];

    if ( !isdefined( var_0.attackerdata[var_2.guid] ) )
    {
        var_0.attackers[var_2.guid] = var_2;
        var_0.attackerdata[var_2.guid] = spawnstruct();
        var_0.attackerdata[var_2.guid].damage = 0;
        var_0.attackerdata[var_2.guid].attackerent = var_2;
        var_0.attackerdata[var_2.guid].firsttimedamaged = gettime();
        var_0.attackerdata[var_2.guid].hits = 1;
    }

    var_0.attackerdata[var_2.guid].damage += var_1;
    var_0.attackerdata[var_2.guid].weapon = var_10;
    var_0.attackerdata[var_2.guid].vpoint = var_4;
    var_0.attackerdata[var_2.guid].vdir = var_3;
    var_0.attackerdata[var_2.guid]._id_022A = var_8;
    var_0.attackerdata[var_2.guid].smeansofdeath = var_5;
    var_0.attackerdata[var_2.guid].attackerent = var_2;
    var_0.attackerdata[var_2.guid].lasttimedamaged = gettime();

    if ( isdefined( var_2 ) && isplayer( var_2 ) && var_2 getcurrentprimaryweapon() != "none" )
        var_0.attackerdata[var_2.guid].sprimaryweapon = var_2 getcurrentprimaryweapon();
    else
        var_0.attackerdata[var_2.guid].sprimaryweapon = undefined;
}

_id_E247()
{
    self.attackers = [];
    self.attackerdata = [];
}

_id_E143()
{
    self endon( "damage" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( !isdefined( self.attackers ) )
        return;

    for (;;)
    {
        var_0 = gettime();

        foreach ( var_3, var_2 in self.attackers )
        {
            if ( isdefined( var_2 ) && var_0 - self.attackerdata[var_3].lasttimedamaged < 2000 )
                continue;

            self.attackers[var_3] = undefined;
            self.attackerdata[var_3] = undefined;
        }

        scripts\engine\utility::waitframe();
    }
}

callback_playerdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = callback_playerdamage_internal( var_0, var_1, self, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

_id_6CE1( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    if ( !isdefined( var_10 ) )
        var_10 = 0.0;

    if ( scripts\mp\utility\game::isusingremote() && var_2 >= self.health && !( var_3 & level.idflags_stun ) && _id_1C92() )
    {
        if ( !isdefined( var_7 ) )
            var_7 = ( 0, 0, 0 );

        if ( !isdefined( var_1 ) )
            var_1 = self;

        if ( !isdefined( var_0 ) )
            var_0 = var_1;

        playerkilled_internal( var_0, var_1, self, var_2, var_3, var_4, var_5, var_7, var_8, var_9, 0, 1 );
    }
    else
    {
        if ( !_id_374A( var_0, var_1, var_2 - var_2 * var_10, var_3, var_4, var_5, var_6, var_7, var_8, var_9 ) )
            return;

        if ( !isalive( self ) )
            return;

        if ( isplayer( self ) )
        {
            if ( !isdefined( var_12 ) )
                var_12 = "";

            if ( !isdefined( var_13 ) )
                var_13 = 0;

            self _meth_80EA( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
        }
    }

    if ( var_4 == "MOD_EXPLOSIVE_BULLET" )
        self shellshock( "damage_mp", getdvarfloat( "scr_csmode" ) );

    _id_4D67( var_0, var_5, var_4, var_2, var_3, var_1 );
}

callback_playerimpaled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    thread scripts\mp\weapons::_id_934E( var_0, self, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_1C92()
{
    if ( !isdefined( level._id_1C92 ) )
        level._id_1C92 = 1;

    return level._id_1C92;
}

callback_playerlaststand( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = spawnstruct();
    var_9.einflictor = var_0;
    var_9.attacker = var_1;
    var_9.idamage = var_2;
    var_9._id_2502 = var_1.origin;

    if ( var_1 == self )
        var_9.smeansofdeath = "MOD_SUICIDE";
    else
        var_9.smeansofdeath = var_3;

    var_9.sweapon = var_4;

    if ( isdefined( var_1 ) && isplayer( var_1 ) && var_1 getcurrentprimaryweapon() != "none" )
        var_9.sprimaryweapon = var_1 getcurrentprimaryweapon();
    else
        var_9.sprimaryweapon = undefined;

    var_9.vdir = var_5;
    var_9.shitloc = var_6;
    var_9.laststandstarttime = gettime();
    var_10 = _id_B4DC( var_4, var_3, var_6 );

    if ( isdefined( self.endgame ) )
        var_10 = 0;

    if ( level.teambased && isdefined( var_1.team ) && var_1.team == self.team )
        var_10 = 0;

    if ( level._id_54CC )
    {
        if ( level._id_115C6[self.team] <= 1 )
            var_10 = 0;
        else if ( scripts\mp\utility\game::_id_9F9B() )
        {
            var_10 = 0;
            scripts\mp\utility\game::_id_A6C7( self.team );
        }
    }

    if ( !var_10 )
    {
        self.laststandparams = var_9;
        self.uselaststandparams = 1;
        scripts\mp\utility\game::_id_1417();
    }
    else
    {
        self._id_98F3 = 1;
        var_11 = spawnstruct();

        if ( scripts\mp\utility\game::_id_12D6( "specialty_finalstand" ) )
        {
            var_11._id_119A8 = game["strings"]["final_stand"];
            var_11._id_92AE = "specialty_finalstand";
        }
        else if ( scripts\mp\utility\game::_id_12D6( "specialty_c4death" ) )
        {
            var_11._id_119A8 = game["strings"]["c4_death"];
            var_11._id_92AE = "specialty_c4death";
        }
        else
        {
            var_11._id_119A8 = game["strings"]["last_stand"];
            var_11._id_92AE = "specialty_finalstand";
        }

        var_11._id_0154 = ( 1, 0, 0 );
        var_11._id_10453 = "mp_last_stand";
        var_11._id_5F36 = 2.0;
        self.health = 1;
        var_12 = "frag_grenade_mp";

        if ( isdefined( level._id_1541 ) && isdefined( var_1 ) && level._id_1541 == var_1 )
            level notify( "ai_crawling", self );

        if ( scripts\mp\utility\game::_id_12D6( "specialty_finalstand" ) )
        {
            self.laststandparams = var_9;
            self._id_94A2 = 1;
            var_13 = self _meth_8174();

            foreach ( var_15 in var_13 )
                scripts\mp\utility\game::_id_141E( var_15 );

            scripts\engine\utility::_id_1C6E( 0 );
            thread _id_626F();
            thread _id_AA11( 20, 1 );
        }
        else if ( scripts\mp\utility\game::_id_12D6( "specialty_c4death" ) )
        {
            self._id_D8B0 = self._id_A978;
            self.laststandparams = var_9;
            self takeallweapons();
            self giveweapon( "c4death_mp", 0, 0 );
            scripts\mp\utility\game::_id_141A( "c4death_mp" );
            scripts\engine\utility::_id_1C6E( 0 );
            self._id_93BB = 1;
            thread _id_AA11( 20, 0 );
            thread _id_53D3();
            thread _id_53D2();
        }
        else
        {
            if ( level._id_54CC )
            {
                var_1 thread scripts\mp\utility\game::_id_83B4( "kill", var_4 );
                self.laststandparams = var_9;
                scripts\engine\utility::_id_1C71( 0 );
                thread _id_AA11( 20, 0 );
                scripts\engine\utility::_id_1C6E( 0 );
                return;
            }

            self.laststandparams = var_9;
            var_17 = undefined;
            var_18 = self getweaponslistprimaries();

            foreach ( var_15 in var_18 )
            {
                if ( scripts\mp\weapons::_id_9F54( var_15 ) )
                    var_17 = var_15;
            }

            if ( !isdefined( var_17 ) )
            {
                var_17 = "iw6_p226_mp";
                scripts\mp\utility\game::_id_12C6( var_17 );
            }

            self givemaxammo( var_17 );
            self _meth_80AB();
            scripts\engine\utility::_id_1C6E( 0 );

            if ( !scripts\mp\utility\game::_id_12D6( "specialty_laststandoffhand" ) )
                self _meth_80A4();

            scripts\mp\utility\game::_id_141A( var_17 );
            thread _id_AA11( 10, 0 );
        }
    }
}

_id_54C8( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    wait( var_0 );
    self.uselaststandparams = 1;
    scripts\mp\utility\game::_id_1417();
}

_id_53D3()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    self waittill( "detonate" );
    self.uselaststandparams = 1;
    _id_3345();
}

_id_53D2()
{
    self endon( "detonate" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    self waittill( "death" );
    _id_3345();
}

_id_3345()
{
    self playsound( "detpack_explo_default" );
    radiusdamage( self.origin, 312, 100, 100, self );

    if ( isalive( self ) )
        scripts\mp\utility\game::_id_1417();
}

_id_626F()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\mp\utility\game::_id_7385( 1 );
    wait 0.3;
    scripts\mp\utility\game::_id_7385( 0 );
}

_id_AA11( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "revive" );
    level endon( "game_ended" );
    level notify( "player_last_stand" );
    thread _id_AA16();
    self.laststand = 1;

    if ( !var_1 && ( !isdefined( self._id_93BB ) || !self._id_93BB ) )
    {
        thread _id_AA05();
        scripts\mp\utility\game::_id_F78C( "last_stand", &"PLATFORM_COWARDS_WAY_OUT", undefined, undefined, undefined, undefined, undefined, undefined, 1 );
        thread _id_AA09();
    }

    if ( level._id_54CC == 1 && level._id_54CC != 2 )
    {
        var_2 = spawn( "script_model", self.origin );
        var_2 setmodel( "tag_origin" );
        var_2 setcursorhint( "HINT_NOICON" );
        var_2 sethintstring( &"PLATFORM_REVIVE" );
        var_2 _id_E4AE( self );
        var_2 endon( "death" );
        var_3 = newteamhudelem( self.team );
        var_3 setshader( "waypoint_revive", 8, 8 );
        var_3 setwaypoint( 1, 1 );
        var_3 _meth_8346( self );
        var_3 thread _id_5321( var_2 );
        var_3._id_00B9 = ( 0.33, 0.75, 0.24 );
        scripts\mp\utility\game::_id_CF16();

        if ( var_1 )
        {
            wait( var_0 );

            if ( self._id_94A2 )
                thread _id_AA07( var_1, var_2 );
        }

        return;
    }
    else if ( level._id_54CC == 2 )
    {
        thread _id_AA09();
        var_2 = spawn( "script_model", self.origin );
        var_2 setmodel( "tag_origin" );
        var_2 setcursorhint( "HINT_NOICON" );
        var_2 sethintstring( &"PLATFORM_REVIVE" );
        var_2 _id_E4AE( self );
        var_2 endon( "death" );
        var_3 = newteamhudelem( self.team );
        var_3 setshader( "waypoint_revive", 8, 8 );
        var_3 setwaypoint( 1, 1 );
        var_3 _meth_8346( self );
        var_3 thread _id_5321( var_2 );
        var_3._id_00B9 = ( 0.33, 0.75, 0.24 );
        scripts\mp\utility\game::_id_CF16();

        if ( var_1 )
        {
            wait( var_0 );

            if ( self._id_94A2 )
                thread _id_AA07( var_1, var_2 );
        }

        wait( var_0 / 3 );
        var_3._id_00B9 = ( 1, 0.64, 0 );

        while ( var_2._id_9B04 )
            wait 0.05;

        scripts\mp\utility\game::_id_CF16();
        wait( var_0 / 3 );
        var_3._id_00B9 = ( 1, 0, 0 );

        while ( var_2._id_9B04 )
            wait 0.05;

        scripts\mp\utility\game::_id_CF16();
        wait( var_0 / 3 );

        while ( var_2._id_9B04 )
            wait 0.05;

        wait 0.05;
        thread _id_AA07( var_1 );
        return;
    }

    thread _id_AA09();
    wait( var_0 );
    thread _id_AA07( var_1 );
}

_id_B4A2( var_0, var_1 )
{
    self endon( "stop_maxHealthOverlay" );
    self endon( "revive" );
    self endon( "death" );

    for (;;)
    {
        self.health -= 1;
        self.maxhealth = var_0;
        wait 0.05;
        self.maxhealth = 50;
        self.health += 1;
        wait 0.5;
    }
}

_id_AA07( var_0, var_1 )
{
    if ( var_0 )
    {
        self.laststand = undefined;
        self._id_94A2 = 0;
        self notify( "revive" );
        scripts\mp\utility\game::_id_41C4( "last_stand" );
        scripts\mp\playerlogic::_id_AA0D();

        if ( isdefined( var_1 ) )
            var_1 delete();
    }
    else
    {
        self.uselaststandparams = 1;
        self._id_2A8A = 0;
        scripts\mp\utility\game::_id_1417();
    }
}

_id_AA05()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "game_ended" );
    self endon( "revive" );

    for (;;)
    {
        if ( self usebuttonpressed() )
        {
            var_0 = gettime();

            while ( self usebuttonpressed() )
            {
                wait 0.05;

                if ( gettime() - var_0 > 700 )
                    break;
            }

            if ( gettime() - var_0 > 700 )
                break;
        }

        wait 0.05;
    }

    thread _id_AA07( 0 );
}

_id_AA09()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "revive" );

    while ( !level._id_7669 )
    {
        self.health = 2;
        wait 0.05;
        self.health = 1;
        wait 0.5;
    }

    self.health = self.maxhealth;
}

_id_AA16()
{
    self endon( "disconnect" );
    self endon( "revive" );
    level endon( "game_ended" );
    self waittill( "death" );
    scripts\mp\utility\game::_id_41C4( "last_stand" );
    self.laststand = undefined;
}

_id_B4DC( var_0, var_1, var_2 )
{
    if ( var_1 == "MOD_TRIGGER_HURT" )
        return 0;

    if ( var_1 != "MOD_PISTOL_BULLET" && var_1 != "MOD_RIFLE_BULLET" && var_1 != "MOD_FALLING" && var_1 != "MOD_EXPLOSIVE_BULLET" )
        return 0;

    if ( var_1 == "MOD_IMPACT" && scripts\mp\weapons::_id_9FA9( var_0 ) )
        return 0;

    if ( var_1 == "MOD_IMPACT" && ( var_0 == "m79_mp" || issubstr( var_0, "gl_" ) ) )
        return 0;

    if ( scripts\mp\utility\game::isheadshot( var_0, var_2, var_1 ) )
        return 0;

    if ( scripts\mp\utility\game::isusingremote() )
        return 0;

    return 1;
}

ensurelaststandparamsvalidity()
{
    if ( !isdefined( self.laststandparams.attacker ) )
        self.laststandparams.attacker = self;
}

_id_7F02( var_0 )
{
    switch ( var_0 )
    {
        case "neck":
        case "helmet":
        case "head":
            return 60;
        case "left_hand":
        case "right_hand":
        case "left_arm_lower":
        case "right_arm_lower":
        case "left_arm_upper":
        case "right_arm_upper":
        case "torso_upper":
        case "gun":
            return 48;
        case "torso_lower":
            return 40;
        case "right_leg_upper":
        case "left_leg_upper":
            return 32;
        case "right_leg_lower":
        case "left_leg_lower":
            return 10;
        case "right_foot":
        case "left_foot":
            return 5;
    }

    return 48;
}

_id_5124( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_0 ) )
    {
        var_6 = var_0 _meth_8112();

        if ( animhasnotetrack( var_6, "ignore_ragdoll" ) )
            return;
    }

    if ( isdefined( level._id_C08A ) && level._id_C08A.size )
    {
        foreach ( var_8 in level._id_C08A )
        {
            if ( distancesquared( var_0.origin, var_8.origin ) < 65536 )
                return;
        }
    }

    wait 0.2;

    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 _meth_81B7() )
        return;

    var_6 = var_0 _meth_8112();
    var_10 = 0.35;

    if ( animhasnotetrack( var_6, "start_ragdoll" ) )
    {
        var_11 = getnotetracktimes( var_6, "start_ragdoll" );

        if ( isdefined( var_11 ) )
            var_10 = var_11[0];
    }

    var_12 = var_10 * getanimlength( var_6 );
    wait( var_12 );

    if ( isdefined( var_0 ) )
        var_0 startragdoll();
}

_id_7FCA()
{
    var_0 = "";
    var_1 = 0;
    var_2 = getarraykeys( self._id_A64E );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( self._id_A64E[var_4] <= var_1 )
            continue;

        var_1 = self._id_A64E[var_4];
        var_5 = var_4;
    }

    return var_0;
}

_id_7FC9()
{
    var_0 = "";
    var_1 = 0;
    var_2 = getarraykeys( self._id_A653 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];

        if ( self._id_A653[var_4] <= var_1 )
            continue;

        var_1 = self._id_A653[var_4];
        var_0 = var_4;
    }

    return var_0;
}

_id_4D67( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    thread scripts\mp\weapons::_id_C5CB( var_0, var_1, var_2, var_3, var_5 );

    if ( !isai( self ) && scripts\engine\utility::_id_7E5E( var_2 ) != "bullet" )
        self playrumbleonentity( "damage_heavy" );
}

_id_E4AE( var_0 )
{
    var_1 = var_0.team;
    self linkto( var_0, "tag_origin" );
    self.owner = var_0;
    self._id_9B04 = 0;
    self makeusable();
    _id_12F56( var_1 );
    thread _id_11B0A( var_1 );
    thread _id_E4AF( var_1 );
    thread _id_51C9();
}

_id_51C9()
{
    self endon( "death" );
    self.owner scripts\engine\utility::waittill_any( "death", "disconnect" );
    self delete();
}

_id_12F56( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( var_0 == var_2.team && var_2 != self.owner )
        {
            self enableplayeruse( var_2 );
            continue;
        }

        self disableplayeruse( var_2 );
    }
}

_id_11B0A( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "joined_team" );
        _id_12F56( var_0 );
    }
}

_id_11AF5( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "player_last_stand" );
        _id_12F56( var_0 );
    }
}

_id_E4AF( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_1 );
        self.owner._id_2A8A = 1;

        if ( isdefined( var_1._id_2A8A ) && var_1._id_2A8A )
        {
            self.owner._id_2A8A = 0;
            continue;
        }

        self makeunusable();
        self.owner scripts\mp\utility\game::_id_7385( 1 );
        var_2 = _id_13093( var_1 );
        self.owner._id_2A8A = 0;

        if ( !isalive( self.owner ) )
        {
            self delete();
            return;
        }

        self.owner scripts\mp\utility\game::_id_7385( 0 );

        if ( var_2 )
        {
            var_1 thread scripts\mp\hud_message::showsplash( "reviver", scripts\mp\rank::getscoreinfovalue( "reviver" ) );
            var_1 thread scripts\mp\utility\game::_id_83B4( "reviver" );
            self.owner.laststand = undefined;
            self.owner scripts\mp\utility\game::_id_41C4( "last_stand" );
            self.owner._id_BCF6 = 1;

            if ( self.owner scripts\mp\utility\game::_id_12D6( "specialty_lightweight" ) )
                self.owner._id_BCF6 = scripts\mp\utility\game::_id_ACD8();

            self.owner scripts\engine\utility::_id_1C71( 1 );
            self.owner.maxhealth = 100;
            self.owner scripts\mp\weapons::_id_12ED5();
            self.owner scripts\mp\playerlogic::_id_AA0D();
            self.owner scripts\mp\utility\game::giveperk( "specialty_pistoldeath" );
            self.owner._id_2A8A = 0;
            self delete();
            return;
        }

        self makeusable();
        _id_12F56( var_0 );
    }
}

_id_13093( var_0, var_1 )
{
    var_2 = 3000;
    var_3 = spawn( "script_origin", self.origin );
    var_3 hide();
    var_0 _meth_823A( var_3 );
    var_0 _meth_8234();
    var_0 scripts\engine\utility::_id_1C71( 0 );
    self._id_4B30 = 0;
    self._id_9B04 = 1;
    self._id_130C7 = 0;

    if ( isdefined( var_1 ) )
        self._id_130EE = var_1;
    else
        self._id_130EE = var_2;

    var_4 = _id_13094( var_0 );
    self._id_9B04 = 0;
    var_3 delete();

    if ( isdefined( var_0 ) && scripts\mp\utility\game::isreallyalive( var_0 ) )
    {
        var_0 unlink();
        var_0 scripts\engine\utility::_id_1C71( 1 );
    }

    if ( isdefined( var_4 ) && var_4 )
    {
        self.owner thread scripts\mp\hud_message::showsplash( "revived", undefined, var_0 );
        self.owner._id_98F3 = 0;
        return 1;
    }

    return 0;
}

_id_13094( var_0 )
{
    level endon( "game_ended" );
    self.owner endon( "death" );
    self.owner endon( "disconnect" );

    while ( scripts\mp\utility\game::isreallyalive( var_0 ) && var_0 usebuttonpressed() && self._id_4B30 < self._id_130EE && ( !isdefined( var_0.laststand ) || !var_0.laststand ) )
    {
        self._id_4B30 += 50 * self._id_130C7;
        self._id_130C7 = 1;
        var_0 scripts\mp\gameobjects::_id_12F53( self, 1 );
        self.owner scripts\mp\gameobjects::_id_12F53( self, 1 );

        if ( self._id_4B30 >= self._id_130EE )
        {
            self._id_9B04 = 0;
            var_0 scripts\mp\gameobjects::_id_12F53( self, 0 );
            self.owner scripts\mp\gameobjects::_id_12F53( self, 0 );
            return scripts\mp\utility\game::isreallyalive( var_0 );
        }

        wait 0.05;
    }

    var_0 scripts\mp\gameobjects::_id_12F53( self, 0 );
    self.owner scripts\mp\gameobjects::_id_12F53( self, 0 );
    return 0;
}

_id_374A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( self._id_A970 ) && self._id_A970 && var_2 >= self.health && isdefined( self._id_4402 ) && self._id_4402 == "specialty_endgame" )
    {
        scripts\mp\utility\game::giveperk( "specialty_endgame" );
        return 0;
    }

    return 1;
}

_id_612A( var_0 )
{
    physicsexplosionsphere( self.origin, 64, 64, 1 );
    var_1 = [];

    for ( var_2 = 0; var_2 < 360; var_2 += 30 )
    {
        var_3 = cos( var_2 ) * 16;
        var_4 = sin( var_2 ) * 16;
        var_5 = bullettrace( self.origin + ( var_3, var_4, 4 ), self.origin + ( var_3, var_4, -6 ), 1, self );

        if ( isdefined( var_5["entity"] ) && isdefined( var_5["entity"]._id_0336 ) && ( var_5["entity"]._id_0336 == "destructible_vehicle" || var_5["entity"]._id_0336 == "destructible_toy" ) )
            var_1[var_1.size] = var_5["entity"];
    }

    if ( var_1.size )
    {
        var_6 = spawn( "script_origin", self.origin );
        var_6 hide();
        var_6.type = "soft_landing";
        var_6._id_5379 = var_1;
        radiusdamage( self.origin, 64, 100, 100, var_6 );
        wait 0.1;
        var_6 delete();
    }
}

_id_9DF9( var_0, var_1 )
{
    var_2 = anglestoforward( var_0.angles );
    var_2 = ( var_2[0], var_2[1], 0 );
    var_2 = vectornormalize( var_2 );
    var_3 = var_0.origin - var_1.origin;
    var_3 = ( var_3[0], var_3[1], 0 );
    var_3 = vectornormalize( var_3 );
    var_4 = vectordot( var_2, var_3 );

    if ( var_4 > 0 )
        return 1;
    else
        return 0;
}

_id_5321( var_0 )
{
    var_0 waittill( "death" );
    self destroy();
}

gamemodemodifyplayerdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( isdefined( var_1 ) && isplayer( var_1 ) && isalive( var_1 ) )
    {
        if ( level.matchrules_damagemultiplier )
            var_2 *= level.matchrules_damagemultiplier;

        if ( level.matchrules_vampirism )
            var_1.health = int( min( float( var_1.maxhealth ), float( var_1.health + 20 ) ) );

        if ( level.tactical )
        {
            var_8 = weaponclass( var_4 );

            if ( var_8 == "sniper" || var_8 == "spread" || issubstr( var_4, "iw7_udm45_mpl" ) )
                var_2 *= 0.7;

            switch ( var_7 )
            {
                case "neck":
                case "helmet":
                case "head":
                    if ( var_8 != "spread" )
                        var_2 *= 2;

                    break;
                case "torso_upper":
                    break;
                case "left_hand":
                case "right_hand":
                case "left_arm_lower":
                case "right_arm_lower":
                case "left_arm_upper":
                case "right_arm_upper":
                case "gun":
                    break;
                case "torso_lower":
                    break;
                case "right_leg_upper":
                case "left_leg_upper":
                    break;
                case "right_foot":
                case "right_leg_lower":
                case "left_foot":
                case "left_leg_lower":
                    break;
            }
        }
    }

    return var_2;
}

_id_DEFA( var_0, var_1, var_2 )
{
    var_3 = scripts\mp\utility\game::_id_9E6C( var_0 ) && !( var_1 == "MOD_MELEE" );

    if ( !var_3 )
        self.pers["cur_kill_streak_for_nuke"]++;

    self.pers["cur_kill_streak"]++;

    if ( var_2 )
        self notify( "kill_streak_increased" );

    var_4 = 25;

    if ( scripts\mp\utility\game::_id_12D6( "specialty_hardline" ) )
        var_4--;

    if ( !var_3 && self.pers["cur_kill_streak_for_nuke"] == var_4 && !scripts\mp\utility\game::_id_9D46() )
    {
        if ( !isdefined( level._id_112C4 ) || level._id_112C4 )
            _id_83B3( var_4 );
    }
}

_id_83B3( var_0 )
{

}

monitordamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "death" );
    level endon( "game_ended" );

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    self setcandamage( 1 );
    self.health = 999999;
    self.maxhealth = var_0;

    if ( !isdefined( self._id_00E1 ) || scripts\mp\utility\game::istrue( var_6 ) )
        self._id_00E1 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    var_7 = 1;

    while ( var_7 )
    {
        self waittill( "damage", var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16, var_17, var_18, var_19, var_20, var_21 );
        var_17 = scripts\mp\utility\game::_id_13CA1( var_17, var_21 );

        if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_9 ) )
            continue;

        if ( var_5 )
            self playrumbleonentity( "damage_light" );

        if ( var_4 )
            _id_AF96( self, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16, var_17 );

        if ( isdefined( self.helitype ) && self.helitype == "littlebird" )
        {
            if ( !isdefined( self.attackers ) )
                self.attackers = [];

            var_22 = "";

            if ( isdefined( var_9 ) && isplayer( var_9 ) )
                var_22 = var_9 scripts\mp\utility\game::_id_81EC();

            if ( isdefined( self.attackers[var_22] ) )
                self.attackers[var_22] += var_8;
            else
                self.attackers[var_22] = var_8;
        }

        var_7 = monitordamageoneshot( var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16, var_17, var_1, var_2, var_3, var_4 );
    }
}

monitordamageoneshot( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    if ( !isdefined( self ) )
        return 0;

    if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_1 ) )
        return 0;

    if ( isdefined( var_1 ) && isdefined( var_1.owner ) )
        var_1 = var_1.owner;

    if ( isdefined( var_1 ) && !scripts\mp\utility\game::_id_9E0E( var_1 ) )
        return 1;

    if ( isdefined( var_1 ) && !scripts\mp\weapons::_id_7415( self.owner, var_1 ) )
        return 1;

    if ( isdefined( var_9 ) && scripts\mp\weapons::isballweapon( var_9 ) )
        return 1;

    var_14 = var_0;

    if ( scripts\mp\weapons::_id_66AA( var_9, var_4 ) )
        return 1;

    if ( isdefined( var_9 ) )
    {
        if ( !isdefined( var_12 ) )
            var_12 = ::_id_B938;

        var_14 = self [[ var_12 ]]( var_1, var_9, var_4, var_0, var_8 );
    }

    if ( var_14 <= 0 )
        return 1;

    self._id_1390B = 1;
    self._id_00E1 += var_14;

    if ( isdefined( var_8 ) && var_8 & level.idflags_penetration )
        self._id_1390E = 1;

    if ( isdefined( var_8 ) && var_8 & level.idflags_no_team_protection )
        self._id_1390F = 1;

    if ( var_13 )
        scripts\mp\killstreaks\killstreaks::_id_A6A0( var_1, var_9, self, var_4 );

    if ( isdefined( var_1 ) )
    {
        if ( isplayer( var_1 ) )
            var_1 scripts\mp\damagefeedback::updatedamagefeedback( var_10 );
    }

    if ( self._id_00E1 >= self.maxhealth )
    {
        self thread [[ var_11 ]]( var_1, var_9, var_4, var_0 );
        return 0;
    }

    return 1;
}

_id_B938( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) && ( var_4 && level.idflags_no_team_protection ) )
        var_5 = 0.6 * var_3;
    else
        var_5 = var_3;

    var_5 = _id_8999( var_1, var_2, var_5 );
    var_5 = _id_89C6( var_1, var_2, var_5 );
    var_5 = _id_89AC( var_1, var_2, var_5 );
    var_5 = _id_8975( var_1, var_2, var_5 );
    return var_5;
}

_id_89C6( var_0, var_1, var_2 )
{
    var_0 = scripts\mp\utility\game::_id_821D( var_0 );
    var_3 = var_2;

    switch ( var_0 )
    {
        case "maverick_projectile_mp":
        case "ac130_40mm_mp":
        case "ac130_105mm_mp":
        case "aamissile_projectile_mp":
        case "iw7_chargeshot_mp":
        case "iw7_lockon_mp":
        case "drone_hive_projectile_mp":
        case "bomb_site_mp":
            self._id_A859 = 1;
            var_3 = self.maxhealth + 1;
            break;
        case "remote_tank_projectile_mp":
        case "hind_missile_mp":
        case "hind_bomb_mp":
        case "switch_blade_child_mp":
            self._id_A859 = 0;
            var_3 = self.maxhealth + 1;
            break;
        case "a10_30mm_turret_mp":
        case "heli_pilot_turret_mp":
            self._id_A859 = 0;
            var_3 *= 2;
            break;
        case "sam_projectile_mp":
            self._id_A859 = 1;
            var_3 = var_2;
            break;
    }

    return var_3;
}

_id_89AC( var_0, var_1, var_2 )
{
    if ( isexplosivedamagemod( var_1 ) )
    {
        switch ( var_0 )
        {
            case "iw6_rgm_mp":
            case "proximity_explosive_mp":
            case "c4_mp":
                var_2 *= 3;
                break;
            case "iw6_mk32_mp":
            case "semtexproj_mp":
            case "bouncingbetty_mp":
            case "semtex_mp":
            case "frag_grenade_mp":
                var_2 *= 4;
                break;
            default:
                if ( scripts\mp\utility\game::_id_9F7C( var_0, "alt_" ) )
                    var_2 *= 3;

                break;
        }
    }

    return var_2;
}

_id_89C3( var_0, var_1, var_2 )
{
    if ( var_1 == "MOD_MELEE" )
        return self.maxhealth + 1;

    return var_2;
}

_id_8999( var_0, var_1, var_2 )
{
    return var_2;
}

_id_8975( var_0, var_1, var_2, var_3 )
{
    var_4 = 1.0;
    var_5 = level._id_218B - 1;

    if ( scripts\mp\utility\game::_id_9DFF( var_0, var_1 ) )
        var_4 += var_5;

    var_6 = level.armorpiercingmodks - 1;

    if ( isdefined( var_3 ) && var_3 scripts\mp\utility\game::_id_12D6( "specialty_armorpiercingks" ) && isdefined( self._id_110EA ) && scripts\mp\weapons::_id_9F0E( var_0 ) && scripts\engine\utility::_id_9D74( var_1 ) )
        var_4 += var_6;

    return var_2 * var_4;
}

_id_89E2( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return var_2;

    if ( var_0 == "none" )
        return var_2;

    if ( scripts\mp\utility\game::_id_821D( var_0 ) == "iw7_claw_mp" )
        return var_2;

    if ( weaponclass( var_0 ) != "spread" )
        return var_2;

    return int( min( 150, var_2 ) );
}

_id_C546( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;

    if ( isdefined( var_1 ) && isdefined( self.owner ) )
    {
        if ( isdefined( var_1.owner ) && isplayer( var_1.owner ) )
            var_1 = var_1.owner;

        if ( isplayer( var_1 ) && self.owner scripts\mp\utility\game::isenemy( var_1 ) )
            var_4 = var_1;
    }

    if ( isdefined( var_4 ) )
        thread scripts\mp\missions::_id_A695( var_0, self.owner, var_4, var_2, var_3 );
}

onkillstreakkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = 0;
    var_10 = undefined;

    if ( isdefined( var_1 ) && isdefined( self.owner ) )
    {
        if ( isdefined( var_1.owner ) && isplayer( var_1.owner ) )
            var_1 = var_1.owner;

        if ( self.owner scripts\mp\utility\game::isenemy( var_1 ) )
            var_10 = var_1;
    }

    if ( isdefined( var_10 ) )
    {
        var_10 notify( "destroyed_killstreak", var_2 );

        if ( isdefined( var_7 ) )
            thread scripts\mp\utility\game::_id_115DE( var_7, var_10 );

        scripts\mp\missions::_id_8375( self, var_10 );
        thread scripts\mp\events::_id_A650( var_0, var_10 );
        thread scripts\mp\missions::_id_A6A3( var_0, self.owner, self, undefined, var_10, var_4, var_3, var_2, var_5 );
        var_9 = 1;
    }

    if ( isdefined( self.owner ) && isdefined( var_6 ) )
        self.owner scripts\mp\utility\game::_id_D4B6( var_6, undefined, undefined, self.origin );

    if ( !scripts\mp\utility\game::istrue( var_8 ) )
        self notify( "death" );

    return var_9;
}

_id_12EFD( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self._id_DDBE ) )
        self._id_DDBE = [];

    if ( self.health >= self.maxhealth )
        _id_41D5();

    var_4 = undefined;

    if ( self._id_DDBE.size < 4 )
    {
        var_4 = spawnstruct();
        self._id_DDBE[self._id_DDBE.size] = var_4;
    }
    else
    {
        for ( var_5 = 0; var_5 < 3; var_5++ )
            self._id_DDBE[var_5] = self._id_DDBE[var_5 + 1];

        var_4 = spawnstruct();
        self._id_DDBE[self._id_DDBE.size - 1] = var_4;
    }

    if ( var_3 == "MOD_MELEE" && var_2 == "head" )
        var_2 = "torso_upper";

    var_4.damage = int( min( var_0, self.health ) );
    var_4.attacker = var_1;
    var_4._id_AEC4 = var_2;
}

_id_41D5()
{
    self._id_DDBE = [];
}

_id_12E85( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        foreach ( var_6, var_4 in var_0 )
        {
            if ( !isplayer( var_4 ) )
                continue;

            var_5 = var_4 getentitynumber();
            self setclientomnvar( "ui_death_details_attacker_" + var_2, var_5 );
            self setclientomnvar( "ui_death_details_hits_" + var_2, int( min( var_1[var_6].hits, 10 ) ) );
            var_2++;

            if ( var_2 >= 4 )
                break;
        }
    }

    for ( var_7 = var_2; var_7 < 4; var_7++ )
        self setclientomnvar( "ui_death_details_attacker_" + var_7, -1 );
}

_id_7F18( var_0 )
{
    switch ( var_0 )
    {
        case "torso_upper":
            return 0;
        case "torso_lower":
            return 1;
        case "helmet":
            return 2;
        case "head":
            return 3;
        case "neck":
            return 4;
        case "left_arm_upper":
            return 5;
        case "left_arm_lower":
            return 6;
        case "left_hand":
            return 7;
        case "right_arm_upper":
            return 8;
        case "right_arm_lower":
            return 9;
        case "right_hand":
            return 10;
        case "left_leg_upper":
            return 11;
        case "left_leg_lower":
            return 12;
        case "left_foot":
            return 13;
        case "right_leg_upper":
            return 14;
        case "right_leg_lower":
            return 15;
        case "right_foot":
            return 16;
        case "gun":
            return 17;
        case "none":
            return 18;
    }

    return 0;
}

_id_1015A()
{
    self setclientomnvar( "ui_damage_event", self._id_4D48 );
}

updatecombatrecordkillstats( var_0, var_1, var_2, var_3 )
{
    if ( !scripts\mp\utility\game::canrecordcombatrecordstats() )
        return;

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
    {
        var_0 combatrecordarchetypekill( var_0._id_AE62 );

        if ( isdefined( var_3 ) )
        {
            var_4 = scripts\mp\utility\game::_id_7E9D( var_3 );

            if ( isdefined( var_4 ) && var_4 == "lethal" )
            {
                var_5 = _id_0AE2::_id_D737( var_3 );
                var_0 combatrecordlethalkill( var_5 );
            }
            else
            {
                var_6 = scripts\mp\missions::_id_7F48( var_3 );

                if ( isdefined( var_6 ) )
                {
                    if ( isenumvaluevalid( "mp", "LethalScorestreakStatItems", var_6 ) )
                        var_0 combatrecordkillstreakstat( var_6 );
                }

                if ( scripts\mp\utility\game::istrue( var_0._id_CA7D ) )
                    var_0 combatrecordtacticalstat( "power_periphVis" );

                if ( scripts\mp\utility\game::istrue( var_0._id_8BC2 ) )
                    var_0 combatrecordtacticalstat( "power_adrenaline" );
            }
        }
    }

    if ( isdefined( var_1 ) && isplayer( var_1 ) )
        var_1 combatrecordarchetypedeath( var_1._id_AE62 );
}

combatrecordarchetypekill( var_0 )
{
    if ( !scripts\mp\utility\game::canrecordcombatrecordstats() )
        return;

    var_1 = self getrankedplayerdata( "mp", "archetypeStats", var_0, "kills" );
    self setrankedplayerdata( "mp", "archetypeStats", var_0, "kills", var_1 + 1 );
}

combatrecordarchetypedeath( var_0 )
{
    if ( !scripts\mp\utility\game::canrecordcombatrecordstats() )
        return;

    var_1 = self getrankedplayerdata( "mp", "archetypeStats", var_0, "deaths" );
    self setrankedplayerdata( "mp", "archetypeStats", var_0, "deaths", var_1 + 1 );
}

combatrecordlethalkill( var_0 )
{
    if ( !scripts\mp\utility\game::canrecordcombatrecordstats() )
        return;

    var_1 = self getrankedplayerdata( "mp", "lethalStats", var_0, "kills" );
    self setrankedplayerdata( "mp", "lethalStats", var_0, "kills", var_1 + 1 );
}

combatrecordtacticalstat( var_0, var_1 )
{
    if ( !scripts\mp\utility\game::canrecordcombatrecordstats() )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_2 = self getrankedplayerdata( "mp", "tacticalStats", var_0, "extraStat1" );
    self setrankedplayerdata( "mp", "tacticalStats", var_0, "extraStat1", var_2 + var_1 );
}

combatrecordkillstreakstat( var_0 )
{
    if ( !scripts\mp\utility\game::canrecordcombatrecordstats() )
        return;

    var_1 = scripts\mp\utility\game::getstreakrecordtype( var_0 );

    if ( !isdefined( var_1 ) )
        return;

    var_2 = self getrankedplayerdata( "mp", var_1, var_0, "extraStat1" );
    self setrankedplayerdata( "mp", var_1, var_0, "extraStat1", var_2 + 1 );
}

enqueuecorpsetablefunc( var_0, var_1 )
{
    if ( !isdefined( self.corpsetablefuncs ) )
    {
        self.corpsetablefuncs = [];
        self.corpsetablefunccounts = [];
    }

    if ( !isdefined( self.corpsetablefuncs[var_0] ) )
    {
        self.corpsetablefuncs[var_0] = var_1;
        self.corpsetablefunccounts[var_0] = 0;
    }

    self.corpsetablefunccounts[var_0]++;
}

dequeuecorpsetablefunc( var_0 )
{
    if ( !isdefined( self.corpsetablefuncs ) )
        return;

    if ( !isdefined( self.corpsetablefuncs[var_0] ) )
        return;

    self.corpsetablefunccounts[var_0]--;

    if ( self.corpsetablefunccounts[var_0] <= 0 )
    {
        self.corpsetablefuncs[var_0] = undefined;
        self.corpsetablefunccounts[var_0] = undefined;
    }
}

callcorpsetablefuncs()
{
    if ( !isdefined( self.corpsetablefuncs ) )
        return;

    var_0 = self._id_2C09;

    foreach ( var_2 in self.corpsetablefuncs )
        self thread [[ var_2 ]]( var_0 );

    thread clearcorpsetablefuncs();
}

clearcorpsetablefuncs()
{
    self notify( "clearCorpsetableFuncs" );
    self.corpsetablefuncs = undefined;
    self.corpsetablefunccounts = undefined;
}

enqueueweapononkillcorpsetablefuncs( var_0, var_1, var_2, var_3, var_4 )
{
    if ( scripts\mp\weapons::_id_9F0E( var_3 ) )
    {
        var_5 = scripts\mp\utility\game::_id_8234( var_3 );
        var_6 = getweaponvariantindex( var_3 );
        var_7 = var_0 _meth_8519( var_3 );

        if ( var_5 == "iw7_rvn" && scripts\mp\utility\game::istrue( var_7 ) && var_4 == "MOD_MELEE" )
            var_1 thread enqueuecorpsetablefunc( "passive_melee_cone_expl", scripts\mp\perks\weaponpassives::meleeconeexplodevictimcorpsefx );
    }
}

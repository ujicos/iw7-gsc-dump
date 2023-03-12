// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_248C( var_0 )
{
    return tablelookup( "mp/attachmentTable.csv", 4, var_0, 2 );
}

init()
{
    level._id_EBCF = 1;
    level._id_EBD0 = 1;
    level._effect["item_fx_legendary"] = loadfx( "vfx/iw7/_requests/mp/vfx_weap_loot_legendary.vfx" );
    level._effect["item_fx_rare"] = loadfx( "vfx/iw7/_requests/mp/vfx_weap_loot_rare.vfx" );
    level._effect["item_fx_common"] = loadfx( "vfx/iw7/_requests/mp/vfx_weap_loot_common.vfx" );
    level._effect["shield_metal_impact"] = loadfx( "vfx/iw7/core/impact/weapon/md/vfx_imp_md_metal.vfx" );
    level._id_B4BA = max( scripts\mp\utility\game::_id_7F1D( "scr_maxPerPlayerExplosives", 2 ), 1 );
    level._id_E55D = scripts\mp\utility\game::_id_7F1D( "scr_riotShieldXPBullets", 15 );
    createthreatbiasgroup( "DogsDontAttack" );
    createthreatbiasgroup( "Dogs" );
    setignoremegroup( "DogsDontAttack", "Dogs" );

    switch ( scripts\mp\utility\game::_id_7F1D( "perk_scavengerMode", 0 ) )
    {
        case 1:
            level._id_EBCF = 0;
            break;
        case 2:
            level._id_EBD0 = 0;
            break;
        case 3:
            level._id_EBCF = 0;
            level._id_EBD0 = 0;
            break;
    }

    thread scripts\mp\flashgrenades::main();
    thread scripts\mp\entityheadicons::init();
    _id_97DD();
    _id_31D5();
    _id_3222();
    level._effect["weap_blink_friend"] = loadfx( "vfx/core/mp/killstreaks/vfx_detonator_blink_cyan" );
    level._effect["weap_blink_enemy"] = loadfx( "vfx/core/mp/killstreaks/vfx_detonator_blink_orange" );
    level._effect["emp_stun"] = loadfx( "vfx/core/mp/equipment/vfx_emp_grenade" );
    level._effect["equipment_explode"] = loadfx( "vfx/iw7/_requests/mp/vfx_generic_equipment_exp.vfx" );
    level._effect["equipment_smoke"] = loadfx( "vfx/core/mp/killstreaks/vfx_sg_damage_blacksmoke" );
    level._effect["equipment_sparks"] = loadfx( "vfx/core/mp/killstreaks/vfx_sentry_gun_explosion" );
    level._effect["vfx_sensor_grenade_ping"] = loadfx( "vfx/old/_requests/future_weapons/vfx_sensor_grenade_ping" );
    level._effect["plasmablast_muz_w"] = loadfx( "vfx/old/_requests/mp_weapons/vfx_muz_plasma_blast_w" );
    level._effect["vfx_trail_plyr_knife_tele"] = loadfx( "vfx/old/_requests/mp_weapons/vfx_trail_plyr_knife_tele" );
    level._effect["case_bomb"] = loadfx( "vfx/old/_requests/mp_weapons/expl_plasma_blast" );
    level._effect["corpse_pop"] = loadfx( "vfx/iw7/_requests/mp/vfx_body_expl" );
    level._effect["sniper_glint"] = loadfx( "vfx/iw7/core/mechanics/sniper_glint/vfx_sniper_glint" );
    level._effect["vfx_sonic_sensor_pulse"] = loadfx( "vfx/iw7/_requests/mp/vfx_sonic_sensor_pulse" );
    level._effect["distortion_field_cloud"] = loadfx( "vfx/iw7/_requests/mp/vfx_distortion_field_volume" );
    level._effect["penetration_railgun_impact"] = loadfx( "vfx/iw7/_requests/mp/vfx_penetration_railgun_impact" );
    level._effect["penetration_railgun_pin"] = loadfx( "vfx/iw7/_requests/mp/vfx_penetration_railgun_pin" );
    level._effect["vfx_penetration_railgun_impact"] = loadfx( "vfx/iw7/_requests/mp/vfx_penetration_railgun_impact.vfx" );
    level._effect["vfx_emp_grenade_underbarrel"] = loadfx( "vfx/iw7/_requests/mp/vfx_pulse_grenade_friendly.vfx" );
    _id_11819();
    scripts\mp\utility\game::_id_CC18();
    level._id_13C7D = [];

    if ( !isdefined( level.weapondropfunction ) )
        level.weapondropfunction = ::dropweaponfordeath;

    var_0 = 70;
    level._id_4023 = cos( var_0 );
    level._id_4025 = 20;
    level._id_4024 = 0.5;
    level._id_4027 = 192;
    var_1 = 25;
    level._id_10F8F = cos( var_1 );
    level._id_10F91 = 15;
    level._id_10F90 = 0.35;
    level._id_10F92 = 256;
    level._id_B76D = 0.3;
    level._id_B76F = 100;
    level._id_B76E = 40;
    level._id_B76B = 256;
    level._id_B769 = 70;
    level._id_B768 = 210;
    level._id_B766 = 46;
    level._id_B77B = 120;
    level._id_B762 = loadfx( "vfx/core/impacts/bouncing_betty_launch_dirt" );
    level._id_B761 = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_apex_dest_exp" );
    var_2 = spawnstruct();
    var_2._id_01F1 = "projectile_bouncing_betty_grenade";
    var_2._id_2C68 = "projectile_bouncing_betty_grenade_bombsquad";
    var_2._id_B760["enemy"] = loadfx( "vfx/core/equipment/light_c4_blink.vfx" );
    var_2._id_B760["friendly"] = loadfx( "vfx/misc/light_mine_blink_friendly" );
    var_2._id_B763 = loadfx( "vfx/misc/bouncing_betty_swirl" );
    var_2._id_226E = 2;
    var_2._id_C5B4 = "mine_betty_click";
    var_2._id_C54C = "mine_betty_spin";
    var_2._id_C525 = "frag_grenade_explode";
    var_2._id_AAB0 = 64;
    var_2._id_AAB7 = 0.65;
    var_2._id_C5B3 = ::_id_B764;
    var_2._id_8C7A = 20;
    level._id_13C7D["bouncingbetty_mp"] = var_2;
    level._id_13C7D["alienbetty_mp"] = var_2;
    var_2 = spawnstruct();
    var_2._id_01F1 = "weapon_semtex_grenade_iw6";
    var_2._id_2C68 = "weapon_semtex_grenade_iw6_bombsquad";
    var_2._id_B760["enemy"] = loadfx( "vfx/core/equipment/light_c4_blink.vfx" );
    var_2._id_B760["friendly"] = loadfx( "vfx/misc/light_mine_blink_friendly" );
    var_2._id_226E = 2;
    var_2._id_C5B4 = "mine_betty_click";
    var_2._id_C525 = "frag_grenade_explode";
    var_2._id_C5B3 = ::_id_B764;
    var_2._id_8C7A = 20;
    level._id_13C7D["sticky_mine_mp"] = var_2;
    var_2 = spawnstruct();
    var_2._id_01F1 = "weapon_motion_sensor";
    var_2._id_2C68 = "weapon_motion_sensor_bombsquad";
    var_2._id_B760["enemy"] = scripts\engine\utility::_id_7ECB( "weap_blink_enemy" );
    var_2._id_B760["friendly"] = scripts\engine\utility::_id_7ECB( "weap_blink_friend" );
    var_2._id_B763 = loadfx( "vfx/misc/bouncing_betty_swirl" );
    var_2._id_226E = 2;
    var_2._id_C5B4 = "motion_click";
    var_2._id_C5B3 = ::_id_B77C;
    var_2._id_C54C = "motion_spin";
    var_2._id_AABB = level._id_B762;
    var_2._id_AAB0 = 64;
    var_2._id_AAB7 = 0.65;
    var_2._id_C525 = "motion_explode_default";
    var_2._id_C526 = loadfx( "vfx/core/mp/equipment/vfx_motionsensor_exp" );
    var_2._id_8C7A = 25;
    var_2._id_B371 = 4.0;
    level._id_13C7D["motion_sensor_mp"] = var_2;
    var_2 = spawnstruct();
    var_2._id_01F1 = "weapon_mobile_radar";
    var_2._id_2C68 = "weapon_mobile_radar_bombsquad";
    var_2._id_B760["enemy"] = scripts\engine\utility::_id_7ECB( "weap_blink_enemy" );
    var_2._id_B760["friendly"] = scripts\engine\utility::_id_7ECB( "weap_blink_friend" );
    var_2._id_B763 = loadfx( "vfx/misc/bouncing_betty_swirl" );
    var_2._id_226E = 2;
    var_2._id_C5B4 = "motion_click";
    var_2._id_C5B3 = ::_id_B8F5;
    var_2._id_C54C = "motion_spin";
    var_2._id_AABB = level._id_B762;
    var_2._id_AAB0 = 40;
    var_2._id_AAB7 = 0.35;
    var_2._id_C525 = "motion_explode_default";
    var_2._id_C526 = loadfx( "vfx/core/mp/equipment/vfx_motionsensor_exp" );
    var_2._id_C4C5 = loadfx( "vfx/core/mp/equipment/vfx_motionsensor_exp" );
    var_2._id_8C7A = 25;
    var_2._id_B371 = 4.0;
    level._id_13C7D["mobile_radar_mp"] = var_2;
    var_2 = spawnstruct();
    var_2._id_217C = 1.5;
    var_2._id_53B6 = 232;
    var_2._id_53B5 = 512;
    var_2._id_53B4 = 1;
    var_2._id_8C7A = 20;
    var_2._id_A640 = 12;
    level._id_13C7D["proximity_explosive_mp"] = var_2;
    var_2 = spawnstruct();
    var_3 = 800;
    var_4 = 200;
    var_2._id_DC05 = var_3 * var_3;
    var_2._id_DC06 = var_4 * var_4;
    var_2._id_C526 = loadfx( "vfx/core/mp/equipment/vfx_flashbang.vfx" );
    var_2._id_C525 = "flashbang_explode_default";
    var_2._id_1336F = 72;
    level._id_13C7D["flash_grenade_mp"] = var_2;
    var_2 = spawnstruct();
    var_3 = 800;
    var_4 = 200;
    var_2._id_DC05 = var_3 * var_3;
    var_2._id_DC06 = var_4 * var_4;
    var_2._id_C526 = loadfx( "vfx/core/mp/equipment/vfx_flashbang.vfx" );
    var_2._id_C523 = loadfx( "vfx/iw7/_requests/mp/vfx_disruptor_charge" );
    var_2._id_D828 = loadfx( "vfx/iw7/_requests/mp/vfx_disruptor_laser" );
    var_2._id_C525 = "flashbang_explode_default";
    var_2._id_1336F = 72;
    level._id_13C7D["throwingknifedisruptor_mp"] = var_2;
    var_2 = spawnstruct();
    var_2._id_01F1 = "weapon_sonic_sensor_wm";
    var_2._id_2C68 = "weapon_motion_sensor_bombsquad";
    var_2._id_B760["enemy"] = scripts\engine\utility::_id_7ECB( "weap_blink_enemy" );
    var_2._id_B760["friendly"] = scripts\engine\utility::_id_7ECB( "weap_blink_friend" );
    var_2._id_B763 = loadfx( "vfx/misc/bouncing_betty_swirl" );
    var_2._id_226E = 2;
    var_2._id_C5B4 = "motion_click";
    var_2._id_C54C = "motion_spin";
    var_2._id_AABB = level._id_B762;
    var_2._id_AAB0 = 64;
    var_2._id_AAB7 = 0.65;
    var_2._id_C525 = "motion_explode_default";
    var_2._id_C526 = loadfx( "vfx/core/mp/equipment/vfx_motionsensor_exp" );
    var_2._id_8C7A = 25;
    var_2._id_B371 = 4.0;
    level._id_13C7D["sonic_sensor_mp"] = var_2;
    var_2 = spawnstruct();
    var_2._id_01F1 = "weapon_mobile_radar";
    var_2._id_2C68 = "weapon_mobile_radar_bombsquad";
    var_2._id_B760["enemy"] = loadfx( "vfx/core/equipment/light_c4_blink.vfx" );
    var_2._id_B760["friendly"] = loadfx( "vfx/misc/light_mine_blink_friendly" );
    var_2._id_B763 = loadfx( "vfx/misc/bouncing_betty_swirl" );
    var_2._id_226E = 0.05;
    var_2._id_B769 = 0;
    var_2._id_B768 = 0;
    var_2._id_C5B4 = "motion_click";
    var_2._id_C54C = "motion_spin";
    var_2._id_C525 = "motion_explode_default";
    var_2._id_C526 = loadfx( "vfx/core/mp/equipment/vfx_motionsensor_exp" );
    var_2._id_AAB0 = 64;
    var_2._id_AAB7 = 0.65;
    var_2._id_C5B3 = scripts\mp\equipment\fear_grenade::_id_6BBC;
    var_2._id_C524 = scripts\mp\equipment\fear_grenade::_id_6BBB;
    var_2._id_8C7A = 20;
    var_2._id_B76F = 200;
    var_2._id_B76E = 100;
    level._id_13C7D["fear_grenade_mp"] = var_2;
    var_2 = spawnstruct();
    var_2._id_01F1 = "prop_mp_speed_strip_temp";
    var_2._id_2C68 = "prop_mp_speed_strip_temp";
    var_2._id_226E = 0.05;
    var_2._id_13370 = "tag_origin";
    var_2._id_B769 = 0;
    var_2._id_B768 = 0;
    var_2._id_C5B4 = "motion_click";
    var_2._id_C54C = "motion_spin";
    var_2._id_C525 = "motion_explode_default";
    var_2._id_AAB0 = 64;
    var_2._id_AAB7 = 0.65;
    var_2._id_C5B3 = scripts\mp\blackhole_grenade::_id_2B41;
    var_2._id_C524 = scripts\mp\blackhole_grenade::_id_2B40;
    var_2._id_8C7A = 20;
    var_2._id_B76F = 200;
    var_2._id_B76E = 100;
    level._id_13C7D["blackhole_grenade_mp"] = var_2;
    var_2 = spawnstruct();
    var_2._id_01F1 = "weapon_mobile_radar";
    var_2._id_2C68 = "weapon_mobile_radar_bombsquad";
    var_2._id_226E = 0.05;
    var_2._id_13370 = "tag_origin";
    var_2._id_B769 = 0;
    var_2._id_B768 = 0;
    var_2._id_C5B4 = "motion_click";
    var_2._id_C54C = "motion_spin";
    var_2._id_C525 = "motion_explode_default";
    var_2._id_AAB0 = 64;
    var_2._id_AAB7 = 0.65;
    var_2._id_C5B3 = scripts\mp\shardball::_id_FC5A;
    var_2._id_C524 = scripts\mp\shardball::_id_FC59;
    var_2._id_8C7A = 20;
    var_2._id_B76F = 200;
    var_2._id_B76E = 100;
    level._id_13C7D["shard_ball_mp"] = var_2;
    var_2 = spawnstruct();
    var_2._id_B760["enemy"] = loadfx( "vfx/core/equipment/light_c4_blink.vfx" );
    var_2._id_B760["friendly"] = loadfx( "vfx/misc/light_mine_blink_friendly" );
    level._id_13C7D["c4_mp"] = var_2;
    var_2 = spawnstruct();
    var_2._id_B760["enemy"] = loadfx( "vfx/core/equipment/light_c4_blink.vfx" );
    var_2._id_B760["friendly"] = loadfx( "vfx/misc/light_mine_blink_friendly" );
    level._id_13C7D["claymore_mp"] = var_2;
    level._id_5113 = 3.0;
    level._id_F240 = loadfx( "vfx/core/muzflash/shotgunflash" );
    level._id_10FA1 = loadfx( "vfx/iw7/_requests/mp/power/vfx_wrist_rocket_exp.vfx" );
    level._id_D8D4 = [];
    level._id_101AE = [];
    level._id_857E = [];
    level._id_B7E0 = [];
    level._id_9B16 = [];
    level._id_B779 = [];
    level._effect["glow_stick_glow_red"] = loadfx( "vfx/misc/glow_stick_glow_red" );
    scripts\mp\protoricochet::_id_E4E3();
    scripts\mp\bulletstorm::_id_3258();
    scripts\mp\shardball::_id_FC58();
    scripts\mp\splashgrenade::_id_10A34();
    level thread _id_C56E();
    level._id_334B = 0;
    scripts\engine\utility::_id_22D2( getentarray( "misc_turret", "classname" ), ::_id_12A13 );
    scripts\mp\utility\game::_id_98AA();
}

_id_5F30()
{
    wait 5.0;
}

_id_97DD()
{
    level._id_2C46 = [];
}

_id_2C6A()
{
    self endon( "disconnect" );

    for (;;)
    {
        var_0 = scripts\mp\utility\game::_id_137A6();

        if ( !isdefined( var_0 ) )
            continue;

        if ( var_0._id_13C2E == "iw6_mk32_mp" )
            var_0 thread _id_4988( "projectile_semtex_grenade_bombsquad", "tag_weapon", self );
    }
}

_id_4988( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", ( 0, 0, 0 ) );
    var_3 hide();
    wait 0.05;

    if ( !isdefined( self ) )
        return;

    self._id_2C68 = var_3;
    var_3 thread _id_2C69( var_2 );
    var_3 setmodel( var_0 );
    var_3 linkto( self, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_3 _meth_82C7( 0 );
    scripts\engine\utility::waittill_any( "death", "trap_death" );

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    var_3 delete();
}

_id_561A( var_0 )
{
    self _meth_818F( var_0, 6, 1, 0 );
}

_id_6281( var_0 )
{
    self _meth_818C( var_0 );
}

_id_2C69( var_0 )
{
    self endon( "death" );
    self endon( "trap_death" );

    if ( !isdefined( var_0 ) )
        return;

    var_1 = var_0.team;

    for (;;)
    {
        self hide();

        foreach ( var_3 in level.players )
        {
            _id_6281( var_3 );

            if ( !var_3 scripts\mp\utility\game::_id_12D6( "specialty_detectexplosive" ) )
                continue;

            if ( level.teambased )
            {
                if ( var_3.team == "spectator" || var_3.team == var_1 )
                    continue;
            }
            else if ( isdefined( var_0 ) && var_3 == var_0 )
                continue;

            self _meth_8388( var_3 );
            _id_561A( var_3 );
        }

        level scripts\engine\utility::waittill_any( "joined_team", "player_spawned", "changed_kit", "update_bombsquad" );
    }
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_9042 = 0;
        scripts\mp\gamelogic::_id_F73B( var_0, 0 );
        var_0 thread onplayerspawned();
        var_0 thread _id_2C6A();
        var_0 thread _id_13AD5();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        self._id_4C16 = self._id_10922;
        self._id_61A0 = 0;
        self._id_44ED = 0;
        self._id_9042 = 0;
        scripts\mp\gamelogic::_id_F73B( self, 0 );

        if ( !isdefined( self._id_11AF0 ) )
        {
            self._id_11AF0 = "";
            self._id_11AF0 = "none";
            self._id_11AF1 = 0;
            self._id_11AEF = 0;
            self._id_11AEE = 0;
            self._id_11AED = 0;
            self._id_11AEC = 0;
        }

        thread _id_13BAE();
        thread _id_13BA5();
        thread _id_13B4C();
        thread _id_13A9B();
        thread _id_13A1F();
        thread _id_13A93();
        thread scripts\mp\flashgrenades::_id_10DC6();
        thread _id_13AC3();
        thread _id_13B38();
        thread scripts\mp\class::_id_11B04();
        thread watchdropweapons();
        self._id_A99F = [];
        self._id_5D39 = undefined;
        self._id_119DF = [];
        self.ismodded = undefined;
        thread _id_12F0A();
        self._id_4C16 = undefined;
        self._id_12839 = undefined;
        scripts\mp\gamescore::_id_97D2();
        var_0 = self getcurrentweapon();
        var_1 = self _meth_8519( var_0 );
        var_2 = getweaponcamoname( var_0 );
        thread runcamoscripts( var_0, var_2 );
        thread runweaponscriptvfx( var_0, var_1 );
    }
}

recordtogglescopestates()
{
    self.pers["altScopeStates"] = [];

    if ( isdefined( self.primaryweapon ) && self.primaryweapon != "none" && self hasweapon( self.primaryweapon ) && _id_7DB8( self.primaryweapon ) != "" && self _meth_8519( self.primaryweapon ) )
    {
        var_0 = getweaponbasename( self.primaryweapon );
        var_1 = _id_7DB8( self.primaryweapon );
        var_2 = var_0 + "+" + var_1;
        self.pers["altScopeStates"][var_2] = 1;
    }

    if ( isdefined( self._id_F0C4 ) && self._id_F0C4 != "none" && self hasweapon( self._id_F0C4 ) && _id_7DB8( self._id_F0C4 ) != "" && self _meth_8519( self._id_F0C4 ) )
    {
        var_0 = getweaponbasename( self._id_F0C4 );
        var_1 = _id_7DB8( self._id_F0C4 );
        var_2 = var_0 + "+" + var_1;
        self.pers["altScopeStates"][var_2] = 1;
    }
}

_id_DDF6()
{
    if ( isdefined( self.primaryweapon ) && self.primaryweapon != "none" && self hasweapon( self.primaryweapon ) && _id_8206( self.primaryweapon ) != "" && self _meth_8519( self.primaryweapon ) )
    {
        var_0 = getweaponbasename( self.primaryweapon );
        var_1 = _id_8206( self.primaryweapon );
        var_2 = var_0 + "+" + var_1;
        var_3 = _id_7DB8( self.primaryweapon );
        var_4 = var_0 + "+" + var_3;
        self.pers["altScopeStates"][var_2] = 1;
        self.pers["altScopeStates"][var_4] = 1;
    }

    if ( isdefined( self._id_F0C4 ) && self._id_F0C4 != "none" && self hasweapon( self._id_F0C4 ) && _id_8206( self._id_F0C4 ) != "" && self _meth_8519( self._id_F0C4 ) )
    {
        var_0 = getweaponbasename( self._id_F0C4 );
        var_1 = _id_8206( self._id_F0C4 );
        var_2 = var_0 + "+" + var_1;
        var_3 = _id_7DB8( self._id_F0C4 );
        var_4 = var_0 + "+" + var_3;
        self.pers["altScopeStates"][var_2] = 1;
        self.pers["altScopeStates"][var_4] = 1;
    }
}

_id_DDF4()
{
    self.pers["toggleScopeStates"] = [];
    var_0 = self getweaponslistprimaries();

    foreach ( var_2 in var_0 )
    {
        if ( var_2 == self.primaryweapon || var_2 == self._id_F0C4 )
        {
            var_3 = getweaponattachments( var_2 );

            foreach ( var_5 in var_3 )
            {
                if ( _id_9FAC( var_5 ) )
                {
                    self.pers["toggleScopeStates"][var_2] = self _meth_812E( var_2 );
                    break;
                }
            }
        }
    }
}

_id_12F48( var_0 )
{
    if ( isdefined( self.pers["toggleScopeStates"] ) && isdefined( self.pers["toggleScopeStates"][var_0] ) )
        self _meth_82F8( var_0, self.pers["toggleScopeStates"][var_0] );
}

_id_12E5C( var_0 )
{
    var_1 = _id_8206( var_0 );
    var_2 = _id_7DB8( var_0 );
    var_3 = getweaponbasename( var_0 );
    var_4 = var_3 + "+" + var_1;
    var_5 = var_3 + "+" + var_2;

    if ( isdefined( self.pers["altScopeStates"] ) && scripts\mp\utility\game::istrue( isdefined( self.pers["altScopeStates"][var_5] ) || isdefined( self.pers["altScopeStates"][var_4] ) ) )
        return "alt_" + var_0;

    return var_0;
}

_id_9FAC( var_0 )
{
    return 0;
}

_id_7DB8( var_0 )
{
    var_1 = getweaponattachments( var_0 );

    foreach ( var_3 in var_1 )
    {
        if ( _id_9D3C( var_3 ) )
            return var_3;
    }

    return "";
}

_id_8206( var_0 )
{
    var_1 = getweaponattachments( var_0 );

    foreach ( var_3 in var_1 )
    {
        if ( _id_9FF3( var_3 ) )
            return var_3;
    }

    return "";
}

_id_9D3C( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "shotgunlongshot_burst":
        case "longshotlscope_burst":
        case "acogm4selector":
        case "firetypeselectorsingle":
        case "shotgunlongshotl":
        case "longshotlscope":
        case "longshotscope":
        case "ripperscopeb_camo":
        case "ripperlscope_camo":
        case "ripperscope_camo":
        case "m8lchargescope_camo":
        case "m8lscope_camo":
        case "m8rscope_camo":
        case "m8scope_camo":
        case "ripperrscope_camo":
        case "shotgunlongshot":
        case "meleervn":
        case "arripper":
        case "arm8":
        case "mod_akimboshotgun":
        case "akimbofmg":
            var_1 = 1;
            break;
        default:
            var_2 = scripts\mp\utility\game::_id_2494( var_0 );

            if ( var_2 == "hybrid" || var_2 == "acog" )
                var_1 = 1;

            break;
    }

    return var_1;
}

_id_9FF3( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "ripperlscope":
        case "ripperrscope":
        case "ripperscope":
        case "m8lscope":
        case "m8rscope":
        case "m8scope":
        case "akimbofmg":
            var_1 = 1;
            break;
        case "arripper":
        case "arm8":
        default:
            var_2 = scripts\mp\utility\game::_id_2494( var_0 );

            if ( var_2 == "hybrid" || var_2 == "acog" )
                var_1 = 1;

            break;
    }

    return var_1;
}

_id_13AC3()
{
    scripts\mp\missilelauncher::_id_10FAD();
}

_id_13AAC()
{
    scripts\mp\javelin::_id_A448();
}

weaponperkupdate( var_0, var_1 )
{
    if ( isdefined( var_1 ) && var_1 != "none" )
    {
        var_1 = scripts\mp\utility\game::_id_8234( var_1 );
        var_2 = scripts\mp\utility\game::_id_13CB4( var_1 );

        if ( isdefined( var_2 ) )
            scripts\mp\utility\game::_id_E150( var_2 );
    }

    if ( isdefined( var_0 ) && var_0 != "none" )
    {
        var_0 = scripts\mp\utility\game::_id_8234( var_0 );
        var_3 = scripts\mp\utility\game::_id_13CB4( var_0 );

        if ( isdefined( var_3 ) )
            scripts\mp\utility\game::giveperk( var_3 );
    }

    if ( isdefined( var_1 ) && issubstr( var_1, "iw7_nunchucks" ) && var_0 != var_1 )
        scripts\mp\utility\game::_id_12B83( "specialty_sprintfire" );

    if ( isdefined( var_1 ) && issubstr( var_0, "iw7_nunchucks" ) )
        scripts\mp\utility\game::_id_2BBB( "specialty_sprintfire" );
}

_id_12F5D( var_0 )
{
    var_1 = 1;

    if ( isdefined( var_0 ) && var_0 != "none" )
    {
        var_2 = weaponclass( var_0 );

        if ( ( var_2 == "sniper" || issubstr( var_0, "iw7_longshot" ) && !_id_9D3E( var_0 ) ) && !scripts\mp\utility\game::_id_12D6( "passive_scope_radar" ) || getweaponbasename( var_0 ) == "iw7_m1c_mp" && scripts\mp\utility\game::_id_13C90( var_0, "thermal" ) )
            var_1 = 0;
    }

    self setclientomnvar( "ui_ads_minimap", var_1 );
}

_id_13C78( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = undefined;

    if ( isdefined( var_1 ) && var_1 != "none" )
    {
        var_3 = getweaponattachments( var_1 );

        if ( isdefined( var_3 ) && var_3.size > 0 )
        {
            foreach ( var_5 in var_3 )
            {
                var_6 = scripts\mp\utility\game::_id_2499( var_5 );

                if ( !isdefined( var_6 ) )
                    continue;

                scripts\mp\utility\game::_id_E150( var_6 );
            }
        }
    }

    if ( isdefined( var_0 ) && var_0 != "none" )
    {
        var_2 = getweaponattachments( var_0 );

        if ( isdefined( var_2 ) && var_2.size > 0 )
        {
            foreach ( var_9 in var_2 )
            {
                var_6 = scripts\mp\utility\game::_id_2499( var_9 );

                if ( !isdefined( var_6 ) )
                    continue;

                scripts\mp\utility\game::giveperk( var_6 );
            }
        }
    }
}

_id_13B2E( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        var_2 = self getcurrentweapon();

        if ( var_2 == var_0 )
            childthread _id_13BAC( var_0, var_1 );

        self waittill( "weapon_change" );
    }
}

_id_13BAC( var_0, var_1 )
{
    self endon( "weapon_change" );

    for (;;)
    {
        var_2 = scripts\mp\utility\game::_id_137A6();

        if ( !isdefined( var_2._id_9E8F ) )
            thread _id_13BAB( var_0, var_2, anglestoforward( var_2.angles ), 0, var_1 );
    }
}

_id_13BAB( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_3 >= var_4 )
        return;

    var_5 = var_1 scripts\engine\utility::_id_13737( 2, "death" );

    if ( var_5 != "death" )
        return;

    if ( !isdefined( var_1 ) )
        return;

    var_6 = var_1.origin + -8 * var_2;
    var_7 = var_6 + var_2 * 15;
    var_8 = physics_createcontents( [ "physicscontents_solid", "physicscontents_structural", "physicscontents_player", "physicscontents_vehicleclip" ] );
    var_9 = physics_raycast( var_6, var_7, var_8, self, 0, "physicsquery_closest" );

    if ( var_9.size == 0 )
        return;

    var_10 = var_9[0]["entity"];
    var_11 = var_9[0]["normal"];
    var_12 = var_9[0]["position"];

    if ( isdefined( var_10 ) && isplayer( var_10 ) )
        return;
    else
    {
        var_13 = var_2 - 2 * vectordot( var_2, var_11 ) * var_11;
        var_13 = vectornormalize( var_13 );
        var_14 = var_12 + var_13 * 2;
        var_1 = scripts\mp\utility\game::_id_1309( var_0, var_14, var_14 + var_13, self );
        var_1.owner = self;
        var_1._id_9E8F = 1;
    }

    thread _id_13BAB( var_0, var_1, var_13, var_3 + 1, var_4 );
}

_id_13BA9()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self endon( "giveLoadout_start" );
    var_0 = undefined;
    var_1 = self getcurrentweapon();

    for (;;)
    {
        var_1 = self getcurrentweapon();
        _id_13C78( var_1, var_0 );
        weaponperkupdate( var_1, var_0 );
        var_0 = var_1;
        self waittill( "weapon_change" );
    }
}

_id_13BA5()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self._id_A978 = self._id_4C16;
    self._id_9045 = [];
    var_0 = scripts\mp\utility\game::_id_E0CF( self getcurrentweapon() );
    _id_9047( var_0 );

    for (;;)
    {
        self waittill( "weapon_change", var_0 );
        var_0 = scripts\mp\utility\game::_id_E0CF( var_0 );

        if ( !_id_B4E0( var_0 ) )
            continue;

        if ( scripts\mp\utility\game::_id_9E6C( var_0 ) )
            continue;

        _id_9047( var_0 );

        if ( scripts\mp\utility\game::_id_9D78( var_0 ) || scripts\mp\utility\game::_id_9D79( var_0 ) )
            self._id_A978 = var_0;
    }
}

_id_12F11( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    if ( var_1 )
        wait 0.05;

    if ( var_0 == "iw7_fhr_mp" )
        self setscriptablepartstate( "chargeVFX", "chargeVFXOn", 0 );
    else
        self setscriptablepartstate( "chargeVFX", "chargeVFXOff", 0 );
}

_id_13B4C()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        var_0 = self getcurrentweapon();

        if ( _id_103B9( var_0 ) )
            childthread _id_103B7();

        self waittill( "weapon_change" );
    }
}

_id_103B9( var_0 )
{
    return var_0 != "none" && ( weaponclass( var_0 ) == "sniper" || issubstr( var_0, "iw7_udm45_mpl" ) || issubstr( var_0, "iw7_longshot_mp" ) && !_id_9D3E( var_0 ) ) && !issubstr( var_0, "iw7_m8_mpr" );
}

_id_103B7()
{
    self notify( "manageSniperGlint" );
    self endon( "managerSniperGlint" );
    self endon( "weapon_change" );
    scripts\engine\utility::waitframe();
    thread _id_103B6();
    self._id_83D0 = 0;

    for (;;)
    {
        if ( self playerads() > 0.5 && !scripts\mp\equipment\cloak::_id_9FC1() )
        {
            if ( !self._id_83D0 )
                _id_103B5();
        }
        else if ( self._id_83D0 )
            _id_103B8();

        scripts\engine\utility::waitframe();
    }
}

_id_103B6()
{
    scripts\engine\utility::waittill_any( "death", "disconnect", "weapon_change" );

    if ( isdefined( self._id_83D0 ) && self._id_83D0 )
    {
        _id_103B8();
        self._id_83D0 = undefined;
    }
}

_id_103B5()
{
    self setscriptablepartstate( "sniperGlint", "sniperGlintOn", 0 );
    self._id_83D0 = 1;
}

_id_103B8()
{
    if ( isdefined( self ) )
    {
        self setscriptablepartstate( "sniperGlint", "sniperGlintOff", 0 );
        self._id_83D0 = 0;
    }
}

_id_13B4A()
{
    self endon( "death" );
    self endon( "disconnect" );
    thread _id_13B4B();

    if ( !isdefined( self.pers["recoilReduceKills"] ) )
        self.pers["recoilReduceKills"] = 0;

    self setclientomnvar( "weap_sniper_display_state", self.pers["recoilReduceKills"] );

    for (;;)
    {
        self waittill( "got_a_kill", var_0, var_1, var_2 );

        if ( _id_9F1C( var_1 ) )
        {
            var_3 = self.pers["recoilReduceKills"] + 1;
            self.pers["recoilReduceKills"] = int( min( var_3, 4 ) );
            self setclientomnvar( "weap_sniper_display_state", self.pers["recoilReduceKills"] );

            if ( var_3 <= 4 )
                _id_10B5F( self getstance() );
        }
    }
}

_id_13B4B()
{
    self notify( "watchSniperBoltActionKills_onDeath" );
    self endon( "watchSniperBoltActionKills_onDeath" );
    self endon( "disconnect" );
    self waittill( "death" );
    self.pers["recoilReduceKills"] = 0;
}

_id_9F1C( var_0 )
{
    if ( !isdefined( var_0 ) || var_0 == "none" )
        return 0;

    var_1 = 0;

    if ( issubstr( var_0, "l115a3scope" ) || issubstr( var_0, "l115a3vzscope" ) || issubstr( var_0, "usrscope" ) || issubstr( var_0, "usrvzscope" ) )
        var_1 = 1;

    return var_1;
}

_id_80E2()
{
    if ( !isdefined( self.pers["recoilReduceKills"] ) )
        self.pers["recoilReduceKills"] = 0;

    return self.pers["recoilReduceKills"] * 3;
}

_id_83F3( var_0 )
{
    if ( var_0 != "none" && getweaponbasename( var_0 ) == "iw7_glprox_mp" )
    {
        if ( _id_9D3E( var_0 ) )
        {
            var_1 = getweaponattachments( var_0 );
            var_0 = var_1[0];
        }
        else
            var_0 = getweaponbasename( var_0 );
    }

    return var_0;
}

glprox_modifieddamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = var_0;
    var_4 = scripts\mp\utility\game::_id_821D( var_4 );

    if ( !isplayer( var_2 ) )
        return var_7;

    if ( var_4 != "iw7_glprox_mp" )
        return var_7;

    if ( !isexplosivedamagemod( var_5 ) )
        return var_7;

    var_8 = 2500;

    if ( level._id_8B38 )
        var_8 = 11025;
    else if ( level.tactical )
        var_8 = 9216;

    var_9 = 105;

    if ( level._id_8B38 )
        var_9 = 35;
    else if ( level.tactical )
        var_9 = 105;

    var_10 = 55;

    if ( level._id_8B38 )
        var_10 = 25;
    else if ( level.tactical )
        var_10 = 55;

    var_11 = undefined;
    var_12 = undefined;

    if ( isdefined( var_6 ) )
    {
        var_11 = distancesquared( var_6, var_2 geteye() );
        var_12 = distancesquared( var_6, var_2.origin );
    }
    else if ( isdefined( var_3 ) )
    {
        var_11 = distancesquared( var_3.origin, var_2 geteye() );
        var_12 = distancesquared( var_3.origin, var_2.origin );
    }

    if ( isdefined( var_11 ) && var_11 <= var_8 )
        var_7 = var_9;
    else if ( isdefined( var_12 ) && var_12 <= var_8 )
        var_7 = var_9;
    else
        var_7 = var_10;

    return var_7;
}

glprox_modifiedblastshieldconst( var_0, var_1 )
{
    if ( level._id_8B38 )
    {
        if ( scripts\mp\utility\game::_id_821D( var_1 ) == "iw7_glprox_mp" )
            var_0 = 0.65;
    }

    return var_0;
}

_id_9E1E( var_0 )
{
    if ( var_0 == "radar_mp" || var_0 == "airstrike_mp" || var_0 == "helicopter_mp" )
        return 1;

    if ( var_0 == "briefcase_bomb_mp" )
        return 1;

    return 0;
}

_id_9DF7( var_0 )
{
    var_0 = scripts\mp\utility\game::_id_8234( var_0 );
    return var_0 == "iw7_fists";
}

_id_9D6D( var_0 )
{
    return var_0 == "briefcase_bomb_mp" || var_0 == "briefcase_bomb_defuse_mp";
}

_id_B4E0( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( _id_9DF7( var_0 ) )
        return 0;

    if ( _id_9D6D( var_0 ) )
        return 0;

    if ( _id_0AE2::_id_9F0A( var_0 ) )
        return 0;

    if ( issubstr( var_0, "ac130" ) )
        return 0;

    if ( issubstr( var_0, "uav" ) )
        return 0;

    if ( issubstr( var_0, "killstreak" ) )
        return 0;

    if ( scripts\mp\utility\game::_id_9F8D( var_0 ) )
        return 0;

    var_1 = weaponinventorytype( var_0 );

    if ( var_1 != "primary" )
        return 0;

    return 1;
}

dropweaponfordeath( var_0, var_1 )
{
    if ( isdefined( level.blockweapondrops ) )
        return;

    if ( isdefined( self._id_5D39 ) )
        return;

    if ( isdefined( var_0 ) && var_0 == self || var_1 == "MOD_SUICIDE" )
        return;

    var_2 = self._id_A978;

    if ( !isdefined( var_2 ) )
        return;

    if ( var_2 == "none" )
        return;

    if ( !self hasweapon( var_2 ) )
        return;

    if ( scripts\mp\utility\game::isjuggernaut() )
        return;

    if ( isdefined( level._id_7677 ) && !self [[ level._id_7677 ]]( var_2 ) )
        return;

    if ( _id_9D3E( var_2 ) )
        var_2 = scripts\mp\utility\game::_id_E0CF( var_2 );

    var_3 = 0;
    var_4 = 0;
    var_5 = 0;

    if ( var_2 != "iw6_riotshield_mp" )
    {
        if ( !self anyammoforweaponmodes( var_2 ) )
            return;

        var_3 = self getweaponammoclip( var_2, "right" );
        var_4 = self getweaponammoclip( var_2, "left" );

        if ( !var_3 && !var_4 )
            return;

        var_5 = self getweaponammostock( var_2 );
        var_6 = weaponmaxammo( var_2 );

        if ( var_5 > var_6 )
            var_5 = var_6;

        var_7 = self dropitem( var_2 );

        if ( !isdefined( var_7 ) )
            return;

        var_7 itemweaponsetammo( var_3, var_5, var_4 );
    }
    else
    {
        var_7 = self dropitem( var_2 );

        if ( !isdefined( var_7 ) )
            return;

        var_7 itemweaponsetammo( 1, 1, 0 );
    }

    self._id_5D39 = 1;
    var_7.owner = self;
    var_7._id_0336 = "dropped_weapon";
    var_7 thread watchpickup();
    var_7 thread deletepickupafterawhile();
}

_id_1175A( var_0, var_1, var_2, var_3 )
{
    self.owner endon( "disconnect" );

    if ( !isdefined( self ) || !isdefined( self.owner ) )
        return;

    var_4 = self.origin;

    for (;;)
    {
        wait 0.25;

        if ( !isdefined( self ) )
            return;

        var_5 = self.origin;

        if ( var_4 == var_5 )
            break;

        var_4 = var_5;
    }

    if ( !isdefined( self ) || !isdefined( self.owner ) )
        return;

    if ( var_1 <= 0 && var_2 <= 0 )
        return;

    var_6 = self.origin;
    var_7 = self.angles;
    var_8 = 2;
    var_9 = weaponfiretime( var_0 ) * var_8;

    while ( isdefined( self ) && ( var_1 > 0 || var_2 > 0 ) )
    {
        var_10 = ( randomfloatrange( -1, 1 ), randomfloatrange( -1, 1 ), randomfloatrange( 0, 1 ) );
        var_11 = var_10 * 180;
        var_12 = var_10 * 1000;
        self.origin = var_6 + ( 0, 0, 10 );
        self.angles = var_11;
        thread scripts\mp\utility\game::_id_5B7A( self.origin, self.origin + var_12, 2, ( 0, 1, 0 ) );
        thread _id_1174C( self.origin, var_12, self.owner, var_0 );
        wait( var_9 );

        if ( !isdefined( self ) )
            break;

        var_1 -= var_8;
        var_2 -= var_8;

        if ( var_1 <= 0 )
            var_1 = 0;

        if ( var_2 <= 0 )
            var_2 = 0;

        self itemweaponsetammo( var_1, var_3, var_2 );
    }

    if ( !isdefined( self ) )
        return;

    self.origin = var_6;
    self.angles = var_7;
}

_id_1174C( var_0, var_1, var_2, var_3 )
{
    var_2 endon( "disconnect" );
    var_4 = var_0 + var_1;
    var_5 = scripts\mp\utility\game::_id_1309( var_3, var_0, var_4, var_2 );
}

_id_1015B()
{
    wait 0.1;

    if ( !isdefined( self ) )
        return;

    var_0 = _id_7F22();
    var_1 = getweaponbasename( var_0 );
    var_2 = _id_822A( var_1 );

    switch ( var_2 )
    {
        case 4:
            playfxontag( scripts\engine\utility::_id_7ECB( "item_fx_epic" ), self, "j_gun" );
            break;
        case 3:
            playfxontag( scripts\engine\utility::_id_7ECB( "item_fx_legendary" ), self, "j_gun" );
            break;
        case 2:
            playfxontag( scripts\engine\utility::_id_7ECB( "item_fx_rare" ), self, "j_gun" );
            break;
        case 1:
            playfxontag( scripts\engine\utility::_id_7ECB( "item_fx_common" ), self, "j_gun" );
            break;
    }
}

_id_822A( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = strtok( var_0, "_" );

    foreach ( var_3 in var_1 )
    {
        switch ( var_3 )
        {
            case "mpe":
                return 4;
            case "mpl":
                return 3;
            case "mpr":
                return 2;
            case "mp":
                return 1;
        }
    }

    return 0;
}

_id_5393( var_0, var_1 )
{
    var_2 = self getattachsize();

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        var_4 = self getattachmodelname( var_3 );

        if ( var_4 != var_0 )
            continue;

        var_5 = self getattachtagname( var_3 );
        self _meth_8096( var_0, var_5 );

        if ( var_5 != var_1 )
        {
            var_2 = self getattachsize();

            for ( var_3 = 0; var_3 < var_2; var_3++ )
            {
                var_5 = self getattachtagname( var_3 );

                if ( var_5 != var_1 )
                    continue;

                var_0 = self getattachmodelname( var_3 );
                self _meth_8096( var_0, var_5 );
                break;
            }
        }

        return 1;
    }

    return 0;
}

deletepickupafterawhile()
{
    self endon( "death" );
    wait 60;

    if ( !isdefined( self ) )
        return;

    self delete();
}

_id_7F22()
{
    var_0 = self.classname;
    var_1 = getsubstr( var_0, 7 );
    return var_1;
}

watchpickup()
{
    self endon( "death" );
    var_0 = _id_7F22();

    for (;;)
    {
        self waittill( "trigger", var_1, var_2 );
        var_3 = fixupplayerweapons( var_1, var_0 );

        if ( isdefined( var_2 ) || var_3 )
            break;
    }

    if ( isdefined( var_2 ) )
    {
        var_4 = var_2 _id_7F22();

        if ( isdefined( var_1._id_119DF[var_4] ) )
        {
            var_2.owner = var_1._id_119DF[var_4];
            var_1._id_119DF[var_4] = undefined;
        }

        var_2._id_0336 = "dropped_weapon";
        var_2 thread watchpickup();
    }

    var_1._id_119DF[var_0] = self.owner;
}

fixupplayerweapons( var_0, var_1 )
{
    var_2 = var_0 getweaponslistprimaries();
    var_3 = 1;
    var_4 = 1;

    foreach ( var_6 in var_2 )
    {
        if ( var_0.primaryweapon == var_6 )
        {
            var_3 = 0;
            continue;
        }

        if ( var_0._id_F0C4 == var_6 )
            var_4 = 0;
    }

    if ( var_3 )
        var_0.primaryweapon = var_1;
    else if ( var_4 )
        var_0._id_F0C4 = var_1;

    return var_3 || var_4;
}

_id_A036()
{
    var_0 = _id_7F22();
    var_1 = weaponaltweaponname( var_0 );

    for ( var_2 = 1; var_1 != "none" && var_1 != var_0; var_2++ )
    {
        self itemweaponsetammo( 0, 0, 0, var_2 );
        var_1 = weaponaltweaponname( var_1 );
    }
}

_id_89DF( var_0, var_1 )
{
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "scavenger", var_2 );
    var_2 notify( "scavenger_pickup" );
    _id_EBD2( var_2 );
    _id_0AE2::_id_EBD4( var_2 );
    var_2 scripts\mp\damagefeedback::_id_917F( "scavenger" );
}

_id_EBD2( var_0 )
{
    var_1 = var_0 getweaponslistprimaries();

    foreach ( var_3 in var_1 )
    {
        if ( !scripts\mp\utility\game::_id_9D78( var_3 ) && !level._id_EBD0 )
            continue;

        if ( _id_9D3E( var_3 ) && weaponclass( var_3 ) == "grenade" )
            continue;

        if ( scripts\mp\utility\game::_id_8225( var_3 ) == "weapon_projectile" )
            continue;

        if ( var_3 == "venomxgun_mp" )
            continue;

        var_4 = var_0 getweaponammostock( var_3 );
        var_5 = weaponclipsize( var_3 );

        if ( issubstr( var_3, "akimbo" ) && scripts\mp\utility\game::_id_8234( var_3 ) != "iw7_fmg" )
            var_5 *= 2;

        var_0 setweaponammostock( var_3, var_4 + var_5 );
    }
}

_id_EBD3( var_0 )
{
    if ( isdefined( var_0._id_D782 ) )
    {
        foreach ( var_2 in var_0._id_D782 )
        {
            var_0 notify( "scavenged_ammo", var_2._id_13CE0 );
            scripts\engine\utility::waitframe();
        }
    }
}

dropscavengerfordeath( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 == self )
        return;

    var_2 = self _meth_80B9( "scavenger_bag_mp" );

    if ( !isdefined( var_2 ) )
        return;

    var_2 thread _id_89DF( self, var_1 );

    if ( isdefined( level.bot_funcs["bots_add_scavenger_bag"] ) )
        [[ level.bot_funcs["bots_add_scavenger_bag"] ]]( var_2 );
}

weaponcanstoreaccuracystats( var_0 )
{
    if ( scripts\mp\utility\game::iscacmeleeweapon( var_0 ) )
        return 0;

    return scripts\mp\utility\game::_id_9D78( var_0 ) || scripts\mp\utility\game::_id_9D79( var_0 );
}

_id_FB1D( var_0, var_1, var_2 )
{
    scripts\mp\gamelogic::_id_FB1D( var_0, var_1, var_2 );
}

_id_13BAE( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "weapon_fired", var_1 );
        var_1 = self getcurrentweapon();
        thread scripts\mp\perks\weaponpassives::_id_12F62( self, var_1 );
        scripts\mp\gamelogic::_id_F73B( self, 1 );
        var_2 = gettime();

        if ( !isdefined( self._id_A9EE ) )
            self._id_A9EE = 0;

        var_3 = gettime() - self._id_A9EE;
        self._id_A9EE = var_2;

        if ( scripts\mp\utility\game::istrue( level.jittermodcheck ) )
            jittermodcheck( var_1 );
        else
            level.jittermodcheck = getdvarint( "scr_modDefense", 0 );

        if ( !issubstr( var_1, "silence" ) && var_3 > 500 && level._id_768F )
            thread scripts\mp\killstreaks\uplink::_id_B37E();

        if ( isai( self ) )
            continue;

        if ( !weaponcanstoreaccuracystats( var_1 ) )
            continue;

        var_4 = var_1;

        if ( scripts\mp\perks\weaponpassives::doesshareammo( var_1 ) )
            var_4 = scripts\mp\utility\game::_id_E0CF( var_1 );

        if ( isdefined( self._id_9045[var_4] ) )
            thread _id_9048( var_4 );

        var_5 = scripts\mp\persistence::_id_10E34( "totalShots" ) + 1;
        var_6 = scripts\mp\persistence::_id_10E34( "hits" );
        var_7 = clamp( float( var_6 ) / float( var_5 ), 0.0, 1.0 ) * 10000.0;
        scripts\mp\persistence::_id_10E55( "totalShots", var_5 );
        scripts\mp\persistence::_id_10E55( "accuracy", int( var_7 ) );
        scripts\mp\persistence::_id_10E55( "misses", int( var_5 - var_6 ) );

        if ( isdefined( self.laststandparams ) && self.laststandparams.laststandstarttime == gettime() )
        {
            self._id_9042 = 0;
            return;
        }

        var_8 = 1;
        _id_FB1D( var_1, var_8, "shots" );
        _id_FB1D( var_1, self._id_9042, "hits" );
        self._id_9042 = 0;
    }
}

jittermodcheck( var_0 )
{
    var_1 = gettime();
    var_2 = self getcurrentweaponclipammo();
    var_3 = self getcurrentweaponclipammo( "left" );
    var_4 = undefined;
    var_5 = undefined;

    if ( !isdefined( self.lastshot ) )
    {
        self.lastshot = [];
        self.lastshot["time"] = var_1;
        self.lastshot["time_left"] = var_1;
        self.lastshot["ammo"] = self getcurrentweaponclipammo();
        self.lastshot["ammo_left"] = self getcurrentweaponclipammo( "left" );
        self.lastshot["weapon"] = var_0;
        return;
    }

    if ( var_0 == self.lastshot["weapon"] && !self _meth_81AD() )
    {
        var_4 = var_1 - self.lastshot["time"];
        var_5 = var_1 - self.lastshot["time_left"];
        var_6 = getweaponjittertime( var_0 );

        if ( self.lastshot["ammo"] != var_2 )
        {
            if ( var_4 < var_6 )
                self.ismodded = 1;

            if ( self.lastshot["ammo"] > var_2 )
                self.lastshot["time"] = var_1;

            self.lastshot["ammo"] = var_2;
        }

        if ( self.lastshot["ammo_left"] != var_3 )
        {
            if ( var_5 < var_6 )
                self.ismodded = 1;

            if ( self.lastshot["ammo_left"] > var_3 )
                self.lastshot["time_left"] = var_1;

            self.lastshot["ammo_left"] = var_3;
        }
    }
    else
        self.lastshot["weapon"] = var_0;

    if ( scripts\mp\utility\game::istrue( self.ismodded ) )
    {
        self setweaponammoclip( var_0, 0 );
        self setweaponammoclip( var_0, 0, "left" );
        self setweaponammostock( var_0, 0 );
        scripts\mp\utility\game::_id_2BBB( "specialty_scavenger" );
        self _meth_80A9();
        self.lastshot = undefined;
    }
}

getweaponjittertime( var_0 )
{
    var_1 = getweaponbasename( var_0 );
    var_2 = 1;
    var_3 = scripts\engine\utility::ter_op( issubstr( var_0, "akimbo" ), 1, 0 );

    switch ( var_1 )
    {
        case "iw7_devastator_mp":
            var_2 = 140;
            break;
        case "iw7_mod2187_mp":
            if ( var_3 )
                var_2 = 1000;
            else
                var_2 = 1200;

            break;
        case "iw7_sonic_mpr":
        case "iw7_sonic_mp":
            var_2 = 700;
            break;
        case "iw7_spas_mpl_slug":
        case "iw7_spas_mpr":
        case "iw7_spas_mpr_focus":
            var_2 = 900;
            break;
        case "iw7_longshot_mpl":
        case "iw7_longshot_mp":
            var_2 = 800;
            break;
        case "iw7_m1_mpr_silencer":
        case "iw7_m1_mpr":
        case "iw7_m1_mp":
            var_2 = 230;
            break;
        case "iw7_ake_mp_single":
            var_2 = 190;
            break;
        case "iw7_emc_mpl_spread":
            var_2 = 130;
            break;
        case "iw7_fmg_mpl_shotgun":
            if ( _id_9D3E( var_0 ) )
                var_2 = 130;

            break;
    }

    return var_2;
}

_id_9047( var_0 )
{
    if ( var_0 == "none" )
        return;

    if ( ( scripts\mp\utility\game::_id_9D78( var_0 ) || scripts\mp\utility\game::_id_9D79( var_0 ) ) && !isdefined( self._id_9045[var_0] ) )
        self._id_9045[var_0] = weaponclipsize( var_0 );
}

_id_9048( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "updateMagShots_" + var_0 );
    self._id_9045[var_0]--;
    wait 0.05;
    self notify( "shot_missed", var_0 );
    self._id_453C[var_0] = 0;
    self._id_9045[var_0] = weaponclipsize( var_0 );
}

_id_9046( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "updateMagShots_" + var_0 );
    waittillframeend;

    if ( isdefined( self._id_9045[var_0] ) && self._id_9045[var_0] == 0 )
    {
        var_1 = scripts\mp\utility\game::_id_8225( var_0 );
        scripts\mp\missions::_id_D992( var_1 );
        self._id_9045[var_0] = weaponclipsize( var_0 );
    }
}

_id_3E1E( var_0, var_1 )
{
    self endon( "disconnect" );

    if ( scripts\mp\utility\game::_id_9F7C( var_0, "alt_" ) )
    {
        var_2 = scripts\mp\utility\game::_id_821A( var_0 );

        if ( scripts\engine\utility::array_contains( var_2, "shotgun" ) || scripts\engine\utility::array_contains( var_2, "gl" ) )
            self._id_9042 = 1;
        else
            var_0 = getsubstr( var_0, 4 );
    }

    if ( !weaponcanstoreaccuracystats( var_0 ) )
        return;

    if ( self meleebuttonpressed() && var_0 != "iw7_knife_mp" )
        return;

    switch ( weaponclass( var_0 ) )
    {
        case "mg":
        case "rifle":
        case "sniper":
        case "smg":
        case "pistol":
            self._id_9042++;
            break;
        case "spread":
            self._id_9042 = 1;
            break;
        default:
            break;
    }

    if ( _id_9F2D( var_0 ) || var_0 == "iw7_knife_mp" )
    {
        thread scripts\mp\gamelogic::_id_117B7( var_0, self._id_9042, "hits" );
        self._id_9042 = 0;
    }

    waittillframeend;

    if ( isdefined( self._id_9045[var_0] ) )
        thread _id_9046( var_0 );

    if ( !isdefined( self._id_A99F[var_0] ) )
        self._id_A99F[var_0] = 0;

    if ( self._id_A99F[var_0] == gettime() )
        return;

    self._id_A99F[var_0] = gettime();

    if ( !isdefined( self._id_453C ) || !isdefined( self._id_453C[var_0] ) )
        self._id_453C[var_0] = 1;
    else
        self._id_453C[var_0]++;

    var_3 = scripts\mp\persistence::_id_10E34( "totalShots" );
    var_4 = scripts\mp\persistence::_id_10E34( "hits" ) + 1;

    if ( var_4 <= var_3 )
    {
        scripts\mp\persistence::_id_10E55( "hits", var_4 );
        scripts\mp\persistence::_id_10E55( "misses", int( var_3 - var_4 ) );
        var_5 = clamp( float( var_4 ) / float( var_3 ), 0.0, 1.0 ) * 10000.0;
        scripts\mp\persistence::_id_10E55( "accuracy", int( var_5 ) );
    }

    thread scripts\mp\missions::_id_C5A8( var_0 );
    thread scripts\mp\contractchallenges::contractshotslanded( var_0 );
    self._id_A96A = gettime();
    var_6 = scripts\mp\utility\game::_id_8225( var_0 );

    if ( var_6 == "weapon_lmg" )
    {
        if ( !isdefined( self.shotslandedlmg ) )
            self.shotslandedlmg = 1;
        else
            self.shotslandedlmg++;
    }
}

_id_24E2( var_0, var_1 )
{
    return _id_7415( var_1, var_0 );
}

_id_7415( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        return 1;

    if ( !level.teambased )
        return 1;

    var_4 = level._id_740A;

    if ( isdefined( var_2 ) )
        var_4 = var_2;

    if ( var_4 != 0 )
        return 1;

    if ( var_1 == var_0 || isdefined( var_1.owner ) && var_1.owner == var_0 )
        return 1;

    var_5 = undefined;

    if ( isdefined( var_1.owner ) )
        var_5 = var_1.owner.team;
    else if ( isdefined( var_1.team ) )
        var_5 = var_1.team;

    if ( !isdefined( var_5 ) )
        return 1;

    if ( var_5 != var_0.team )
        return 1;

    return 0;
}

_id_13A1F()
{
    self notify( "watchEquipmentOnSpawn" );
    self endon( "watchEquipmentOnSpawn" );
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    if ( !isdefined( self._id_CC4C ) )
        self._id_CC4C = [];

    if ( !isdefined( self._id_CC4D ) )
        self._id_CC4D = [];

    _id_51AF();
    var_0 = scripts\mp\utility\game::_id_7F1D( "scr_deleteexplosivesonspawn", 1 ) && ( !scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" ) || !checkequipforrugged() );

    if ( var_0 )
        _id_51CE();

    var_1 = self._id_CC4D.size;
    var_2 = self._id_CC4C.size;
    var_3 = var_1 && var_2;

    if ( scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" ) && var_3 )
        thread scripts\mp\perks\perkfunctions::_id_6BC4( var_2, var_1 );
}

checkequipforrugged()
{
    var_0 = scripts\engine\utility::_id_227F( self._id_CC4D, self._id_CC4C );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2.hasruggedeqp ) )
            return 1;
    }

    return 0;
}

_id_13A9B()
{
    self notify( "watchGrenadeUsage" );
    self endon( "watchGrenadeUsage" );
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
        _id_13A97();
}

_id_13A97()
{
    var_0 = scripts\mp\utility\game::_id_1377B();

    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0._id_13C2E ) )
        return;

    _id_FB1D( var_0._id_13C2E, 1, "shots" );
    scripts\mp\gamelogic::_id_F73B( self, 1 );

    if ( isdefined( level._id_2C46[var_0._id_13C2E] ) )
        var_0 thread _id_4988( level._id_2C46[var_0._id_13C2E]._id_01F1, level._id_2C46[var_0._id_13C2E]._id_02DD, self );

    if ( getweaponbasename( var_0._id_13C2E ) == "iw7_glprox_mp" )
    {
        var_1 = _id_83F3( var_0._id_13C2E );

        if ( var_1 == "stickglprox" )
            _id_F21A( var_0 );

        return;
    }

    if ( getweaponbasename( var_0._id_13C2E ) == "iw7_venomx_mp" )
    {
        var_0._id_FF03 = self _meth_84D9();
        return;
    }

    if ( isaxeweapon( var_0._id_13C2E ) )
    {
        var_0._id_FF03 = self _meth_84D9();
        var_0 thread watchgrenadeaxepickup( self );
        return;
    }

    switch ( var_0._id_13C2E )
    {
        case "frag_grenade_mp":
            if ( var_0._id_118A2 >= 1 )
                var_0._id_9D93 = 1;

            var_0._id_C731 = self;
            var_0 thread scripts\mp\shellshock::_id_858A();
            break;
        case "cluster_grenade_mp":
            var_0._id_42E0 = var_0._id_118A2;

            if ( var_0._id_118A2 >= 1 )
                var_0._id_9D93 = 1;

            var_0._id_C731 = self;
            thread _id_42DE( var_0 );
            var_0 thread scripts\mp\shellshock::_id_858A();
            break;
        case "wristrocket_mp":
            if ( var_0._id_118A2 >= 1 )
                var_0._id_9D93 = 1;

            var_0._id_C731 = self;
            thread scripts\mp\equipment\wrist_rocket::_id_13DFC( var_0 );
            var_0 thread scripts\mp\shellshock::_id_858A( 0.6 );
            break;
        case "iw6_aliendlc22_mp":
            var_0 thread scripts\mp\shellshock::_id_858A();
            var_0._id_C731 = self;
            break;
        case "semtex_mp":
            thread _id_F21A( var_0 );
            break;
        case "cryo_mine_mp":
            thread scripts\mp\equipment\cryo_mine::_id_4ADA( var_0 );
            break;
        case "c4_mp":
            thread scripts\mp\equipment\c4::_id_333E( var_0 );
            break;
        case "proximity_explosive_mp":
            thread _id_DACD( var_0 );
            break;
        case "flash_grenade_mp":
            var_0._id_BFD5 = var_0._id_118A2;

            if ( var_0._id_118A2 >= 1 )
                var_0._id_9D93 = 1;

            var_0 thread _id_BFD3();
            break;
        case "throwingknifedisruptor_mp":
            thread _id_56E6( var_0 );
            break;
        case "smoke_grenadejugg_mp":
        case "smoke_grenade_mp":
            var_0 thread _id_1037B();
            break;
        case "gas_grenade_mp":
            var_0 thread _id_13A8A();
            break;
        case "concussion_grenade_mp":
            thread _id_0A97::_id_44EE( var_0 );
            break;
        case "alientrophy_mp":
        case "trophy_mp":
            thread scripts\mp\trophy_system::_id_12827( var_0 );
            break;
        case "claymore_mp":
            thread _id_402D( var_0 );
            break;
        case "alienbetty_mp":
        case "bouncingbetty_mp":
            thread _id_B780( var_0, ::_id_108E3 );
            break;
        case "motion_sensor_mp":
            thread _id_B780( var_0, ::_id_108E7 );
            break;
        case "mobile_radar_mp":
            thread _id_B780( var_0, ::_id_108E5 );
            break;
        case "distortionfield_grenade_mp":
            var_0 thread _id_139F5();
            break;
        case "throwingknifejugg_mp":
        case "throwingknifehack_mp":
        case "throwingknifesiphon_mp":
        case "throwingknifesmokewall_mp":
        case "throwingknifeteleport_mp":
        case "throwingknife_mp":
        case "throwingknifec4_mp":
            level thread _id_11824( self, var_0, var_0._id_13C2E );
            break;
        case "sensor_grenade_mp":
            break;
        case "sonic_sensor_mp":
            thread _id_B780( var_0, ::_id_10910 );
            break;
        case "proto_ricochet_device_mp":
            thread scripts\mp\protoricochet::_id_E4E9( var_0 );
            break;
        case "proxy_bomb_mp":
            thread _id_DAD5( self, var_0 );
            break;
        case "disc_marker_mp":
            thread _id_562B( self, var_0 );
            break;
        case "adrenaline_mist_mp":
            break;
        case "case_bomb_mp":
            thread _id_3B0E( self, var_0 );
            break;
        case "domeshield_mp":
            thread scripts\mp\domeshield::_id_5910( var_0 );
            break;
        case "blackhole_grenade_mp":
            thread scripts\mp\blackhole_grenade::_id_2B3D( var_0 );
            break;
        case "portal_grenade_mp":
            break;
        case "copycat_grenade_mp":
            break;
        case "speed_strip_mp":
            break;
        case "shard_ball_mp":
            if ( _id_0AE1::_id_D779( var_0._id_D719, "passive_grenade_to_mine" ) )
                thread _id_B780( var_0, ::_id_1090D, scripts\mp\shardball::_id_CC21 );
            else
                thread scripts\mp\shardball::_id_FC5B( var_0 );

            break;
        case "splash_grenade_mp":
            var_0 thread scripts\mp\shellshock::_id_858A();
            thread scripts\mp\splashgrenade::_id_10A35( var_0 );
            break;
        case "forcepush_mp":
            break;
        case "portal_generator_mp":
            break;
        case "transponder_mp":
            break;
        case "throwingreaper_mp":
            break;
        case "pulse_grenade_mp":
            thread scripts\mp\equipment\pulse_grenade::_id_DAF5( var_0 );
            break;
        case "ammo_box_mp":
            break;
        case "virus_grenade_mp":
            break;
        case "fear_grenade_mp":
            thread _id_B780( var_0, ::_id_10884 );
            break;
        case "deployable_cover_mp":
            break;
        case "power_spider_grenade_mp":
            thread scripts\mp\equipment\spider_grenade::spidergrenade_used( var_0 );
            break;
        case "split_grenade_mp":
            thread scripts\mp\equipment\split_grenade::_id_10A54( var_0 );
            break;
        case "trip_mine_mp":
            thread scripts\mp\equipment\trip_mine::_id_127F2( var_0 );
            break;
        case "power_exploding_drone_mp":
            thread scripts\mp\equipment\exploding_drone::_id_69D4( var_0 );
            break;
    }
}

_id_562B( var_0, var_1 )
{
    var_1 waittill( "missile_stuck" );
    var_0 notify( "markerPlanted", var_1 );
}

_id_3B0E( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    var_1 endon( "death" );
    var_1 waittill( "missile_stuck" );

    if ( !isdefined( var_1.origin ) )
        return;
}

_id_3B0D( var_0, var_1 )
{
    level endon( "game_ended" );
    wait 0.05;
    var_2 = var_0 _meth_8113();
    wait( randomfloatrange( 0.5, 0.8 ) );

    if ( !isdefined( var_2 ) )
        return;

    var_3 = var_2.origin;
    self playsound( "frag_grenade_explode" );
    earthquake( 0.5, 1.5, var_3, 120 );
    playfx( level._effect["case_bomb"], var_3 + ( 0, 0, 12 ) );
    thread scripts\mp\utility\game::_id_13AF( var_3, 256, 400, 50, self, "MOD_EXPLOSIVE", "case_bomb_mp", 0 );
    wait 0.1;
    playfx( level._effect["corpse_pop"], var_3 + ( 0, 0, 12 ) );

    if ( isdefined( var_2 ) )
        var_2 hide();
}

_id_DAD5( var_0, var_1 )
{
    level endon( "game_ended" );
    var_1 endon( "death" );
    var_1 waittill( "missile_stuck", var_2 );

    if ( isdefined( var_2 ) && ( isplayer( var_2 ) || isagent( var_2 ) ) )
        var_1 _meth_8099( var_0 );
}

_id_11824( var_0, var_1, var_2 )
{
    var_1 makeunusable();

    if ( var_2 == "throwingknifehack_mp" )
    {

    }
    else if ( var_2 == "throwingknifec4_mp" )
        var_1 thread _id_DDF3();

    var_3 = undefined;
    var_4 = undefined;

    if ( var_2 == "throwingknifesmokewall_mp" )
    {
        var_1 _id_1181E( var_0 );
        return;
    }
    else
        var_1 waittill( "missile_stuck", var_3, var_4 );

    var_5 = isdefined( var_4 ) && var_4 == "tag_flicker";
    var_6 = isdefined( var_4 ) && var_4 == "tag_weapon";

    if ( isdefined( var_3 ) && ( isplayer( var_3 ) || isagent( var_3 ) ) && var_5 )
        var_3 notify( "shield_hit", var_1 );

    if ( isdefined( var_3 ) && ( isplayer( var_3 ) || isagent( var_3 ) ) && !var_6 && !var_5 )
    {
        if ( !scripts\mp\equipment\phase_shift::_id_213D( var_3, var_1 ) )
        {
            var_1 delete();
            return;
        }
        else if ( var_2 == "throwingknifeteleport_mp" )
        {

        }
        else if ( var_2 == "throwingknifec4_mp" )
            _id_11818( var_1, var_3, var_0 );
        else if ( var_2 == "throwingknifesiphon_mp" )
        {
            scripts\mp\equipment\siphon_knife::_id_1181D( var_1, var_3, var_0 );
            return;
        }
        else if ( var_2 == "throwingknifehack_mp" )
            return;
    }

    thread _id_11825( var_0, var_1 );
    var_1 endon( "death" );
    var_1 makeunusable();
    var_7 = spawn( "trigger_radius", var_1.origin, 0, 64, 64 );
    var_7 _meth_80D2();
    var_7 linkto( var_1 );
    var_7._id_0336 = "dropped_knife";
    var_1._id_A702 = var_7;
    var_1 thread _id_13A90();

    for (;;)
    {
        scripts\engine\utility::waitframe();

        if ( !isdefined( var_7 ) )
            return;

        var_7 waittill( "trigger", var_8 );

        if ( !isplayer( var_8 ) || !scripts\mp\utility\game::isreallyalive( var_8 ) )
            continue;

        if ( !var_8 hasweapon( var_2 ) )
            continue;

        if ( _id_11827( var_8, var_1._id_D719 ) )
        {
            var_1 delete();
            break;
        }
    }
}

_id_DDF3()
{
    level endon( "game_ended" );
    self.owner endon( "disconnect" );
    self._id_5726 = 0;
    var_0 = self.origin;

    for (;;)
    {
        var_1 = scripts\engine\utility::_id_13736( 0.15, "death", "missile_stuck" );

        if ( !isdefined( self ) )
            break;

        var_2 = distance( var_0, self.origin );
        self._id_5726 += var_2;
        var_0 = self.origin;

        if ( var_1 != "timeout" )
            break;
    }
}

_id_11825( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_C794( var_1, "white", var_0, 1, 0, "equipment" );
    var_1 waittill( "death" );
    scripts\mp\utility\game::_id_C78F( var_2, var_1 );
}

_id_11827( var_0, var_1 )
{
    if ( var_0 _id_0AE2::_id_D734( var_1 ) == var_0 _id_0AE2::_id_D736( var_1 ) )
        return 0;

    var_0 _id_0AE2::_id_D74C( var_1 );
    var_0 scripts\mp\hud_message::_id_1013D( "throwingknife" );
    return 1;
}

throwingknife_detachknivesfromcorpse( var_0 )
{
    var_1 = var_0 _meth_8137();

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_4 = var_3._id_13C2E;

        if ( isdefined( var_4 ) && _id_9FA9( var_4 ) )
        {
            var_3 unlink();
            var_5 = throwingknife_getdudknifeweapon( var_4 );
            var_3 = var_3.owner scripts\mp\utility\game::_id_1302( var_5, var_3.origin, ( 0, 0, 0 ), 100, 1, var_3 );

            if ( isdefined( var_3.owner ) )
                var_3 _meth_82DD( var_3.owner );

            thread throwingknife_triggerlinkto( var_3 );
            var_3 _meth_85AE();
        }
    }
}

throwingknife_triggerlinkto( var_0 )
{
    var_0 endon( "death" );

    while ( !isdefined( var_0._id_A702 ) )
        scripts\engine\utility::waitframe();

    var_1 = var_0._id_A702;
    var_1 endon( "death" );
    var_1 unlink();
    throwingknife_triggerlinktointernal( var_1, var_0 );
    var_1 dontinterpolate();
    var_1.origin = var_0.origin;
    var_1.angles = var_0.angles;
    var_1 linkto( var_0 );
}

throwingknife_triggerlinktointernal( var_0, var_1 )
{
    var_1 endon( "missile_stuck" );

    for (;;)
    {
        var_0.origin = var_1.origin;
        scripts\engine\utility::waitframe();
    }
}

throwingknife_getdudknifeweapon( var_0 )
{
    var_1 = undefined;

    switch ( var_0 )
    {
        case "throwingknifec4_mp":
            var_1 = "throwingknifec4dud_mp";
            break;
        case "throwingknifeteleport_mp":
            var_1 = "throwingknifeteleportdud_mp";
            break;
        default:
            var_1 = "throwingknifec4dud_mp";
    }

    return var_1;
}

_id_11819()
{
    level._effect["throwingknifec4_explode"] = loadfx( "vfx/iw7/_requests/mp/power/vfx_bio_spike_exp.vfx" );
}

_id_11818( var_0, var_1, var_2 )
{
    scripts\mp\missions::_id_2AEA( var_0, var_2, var_1 );
    var_1 playsound( "biospike_explode" );
    playfx( scripts\engine\utility::_id_7ECB( "throwingknifec4_explode" ), var_0.origin );
    var_0 _meth_8253( var_0.origin, 180, 140, 70, var_2, "MOD_EXPLOSIVE", var_0._id_13C2E );
    var_0 thread scripts\mp\shellshock::_id_858A();
    var_0 notify( "explode", var_0.origin );
}

_id_1181E( var_0 )
{
    var_0 thread scripts\mp\equipment\smoke_wall::_id_1037D( self );
}

_id_F235( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_3 = spawnstruct();
    var_3._id_C78B = [];
    var_4 = 0;
    thread _id_F233( var_0, var_1 );

    while ( isdefined( var_1 ) )
    {
        foreach ( var_6 in level._id_3CB5 )
        {
            if ( !isdefined( var_6 ) )
                continue;

            if ( !var_0 scripts\mp\utility\game::isenemy( var_6 ) )
                continue;

            if ( var_6 scripts\mp\utility\game::_id_12D6( "specialty_incog" ) )
                continue;

            if ( isdefined( var_3._id_C78B[var_6 getentitynumber()] ) )
                continue;

            if ( distancesquared( var_1.origin, var_6.origin ) > 90000 )
                continue;

            var_3._id_C78B[var_6 getentitynumber()] = var_6;
            thread _id_F234( var_0, var_6, var_3 );
        }

        scripts\engine\utility::waitframe();
    }
}

_id_10413( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_1 endon( "death" );
    var_3 = spawnstruct();
    var_3._id_C78B = [];
    var_4 = 0;
    thread _id_F233( var_0, var_1 );

    while ( isdefined( var_1 ) )
    {
        foreach ( var_6 in level._id_3CB5 )
        {
            if ( !isdefined( var_6 ) )
                continue;

            if ( !var_0 scripts\mp\utility\game::isenemy( var_6 ) )
                continue;

            if ( var_6 scripts\mp\utility\game::_id_12D6( "specialty_quieter" ) )
                continue;

            if ( isdefined( var_3._id_C78B[var_6 getentitynumber()] ) )
                continue;

            if ( distancesquared( var_1.origin, var_6.origin ) > 90000 )
                continue;

            var_7 = scripts\engine\utility::_id_1756( level.players, var_1 );

            if ( !scripts\engine\trace::_id_DCF1( var_1.origin, var_6.origin + ( 0, 0, 32 ), var_7 ) )
                continue;

            var_3._id_C78B[var_6 getentitynumber()] = var_6;
            thread _id_F234( var_0, var_6, var_3 );
        }

        wait 2.0;
    }
}

_id_F233( var_0, var_1 )
{
    var_1 endon( "death" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    scripts\engine\utility::waitframe();
    scripts\mp\utility\game::_id_C794( var_1, "cyan", var_0, 0, 0, "equipment" );

    if ( var_1._id_13C2E == "sonic_sensor_mp" )
        playfxontag( scripts\engine\utility::_id_7ECB( "vfx_sonic_sensor_pulse" ), var_1, "tag_origin" );
    else
        playfxontagforclients( scripts\engine\utility::_id_7ECB( "vfx_sensor_grenade_ping" ), var_1, "tag_origin", var_0 );
}

_id_F234( var_0, var_1, var_2 )
{
    var_0 endon( "disconnect" );
    var_3 = var_1 getentitynumber();
    var_4 = undefined;
    var_1 scripts\mp\damagefeedback::updatedamagefeedback( "hitmotionsensor" );
    var_4 = scripts\mp\utility\game::_id_C794( var_1, "orange", var_0, 0, 0, "equipment" );
    wait 0.5;

    if ( isdefined( var_1 ) && isdefined( var_4 ) )
        scripts\mp\utility\game::_id_C78F( var_4, var_1 );

    var_2._id_C78B[var_3] = undefined;
}

_id_13A90()
{
    self waittill( "death" );

    if ( isdefined( self._id_A702 ) )
        self._id_A702 delete();

    if ( isdefined( self.useobj_trigger ) )
        self.useobj_trigger delete();
}

_id_1037B()
{
    thread scripts\mp\utility\game::_id_C15A( "death", "end_explode" );
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    thread _id_10377( var_0 );

    if ( isdefined( self.owner ) )
        self.owner thread _id_BA19();
}

_id_10377( var_0 )
{
    wait 1;
    thread _id_10378( var_0 );
    var_1 = scripts\mp\utility\game::_id_180C( var_0, 200 );
    wait 8.25;
    scripts\mp\utility\game::_id_E14A( var_1 );
}

smokeunderbarrelused( var_0 )
{
    self endon( "disconnect" );
    var_0 waittill( "explode", var_1 );
    self _meth_8449( "smoke_grenade_mp", var_1, ( 0, 0, 0 ) );
    var_0 thread _id_10377( var_1 );
}

_id_10378( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_2B98 = [];
    _id_10379( var_1, var_0 );

    foreach ( var_3 in var_1._id_2B98 )
    {
        if ( isdefined( var_3 ) && scripts\mp\utility\game::isreallyalive( var_3 ) )
            var_3 scripts\mp\utility\game::_id_E150( "specialty_blindeye" );
    }
}

_id_10379( var_0, var_1 )
{
    level endon( "game_ended" );
    var_2 = gettime() + 8250.0;
    var_3 = [];

    while ( gettime() < var_2 )
    {
        var_3 = scripts\mp\utility\game::_id_807C( var_1, 200 );

        foreach ( var_7, var_5 in var_0._id_2B98 )
        {
            if ( !isdefined( var_5 ) )
            {
                var_0._id_2B98[var_7] = undefined;
                continue;
            }

            var_6 = scripts\engine\utility::_id_2291( var_3, var_5 );

            if ( !isdefined( var_6 ) || !scripts\mp\utility\game::isreallyalive( var_5 ) || scripts\mp\equipment\phase_shift::_id_9DDF( var_5 ) )
            {
                var_5 scripts\mp\utility\game::_id_E150( "specialty_blindeye" );
                var_0._id_2B98[var_7] = undefined;
            }

            if ( isdefined( var_6 ) )
                var_3[var_6] = undefined;
        }

        foreach ( var_9 in var_3 )
        {
            if ( !isdefined( var_9 ) )
                continue;

            if ( isdefined( var_0._id_2B98[var_9 getentitynumber()] ) )
                continue;

            if ( !scripts\mp\utility\game::isreallyalive( var_9 ) || scripts\mp\equipment\phase_shift::_id_9DDF( var_9 ) || scripts\mp\utility\game::_id_9F72( var_9 ) )
                continue;

            var_9 scripts\mp\utility\game::giveperk( "specialty_blindeye" );
            var_0._id_2B98[var_9 getentitynumber()] = var_9;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_BA19()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "monitorSmokeActive()" );
    self endon( "monitorSmokeActive()" );
    scripts\mp\utility\game::_id_D915( "smoke grenade activated", self );
    self._id_8BC1 = 1;
    var_0 = scripts\engine\utility::_id_13736( 9.25, "death" );
    self._id_8BC1 = 0;
    scripts\mp\utility\game::_id_D915( "smoke grenade deactivated", self );
}

_id_13A8A()
{
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    self waittill( "explode", var_1 );
    thread _id_C534( var_0, var_1 );
}

_id_C534( var_0, var_1 )
{
    var_2 = spawn( "trigger_radius", var_1, 0, 128, 160 );
    var_2.owner = var_0;
    var_3 = 128;
    var_4 = spawnfx( scripts\engine\utility::_id_7ECB( "gas_grenade_smoke_enemy" ), var_1 );
    triggerfx( var_4 );
    wait 1.0;
    var_5 = 3.0;
    var_6 = spawn( "script_model", var_1 + ( 0, 0, 60 ) );
    var_6 linkto( var_2 );

    for ( var_2._id_A63A = var_6; var_5 > 0.0; var_5 -= 0.2 )
    {
        foreach ( var_8 in level._id_3CB5 )
            var_8 _id_20CC( var_0, var_1, var_2, var_2, 4 );

        wait 0.2;
    }

    var_4 delete();
    wait 2.0;
    var_6 delete();
    var_2 delete();
}

_id_20CC( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isalive( self ) && self istouching( var_2 ) )
    {
        if ( var_0 scripts\mp\utility\game::isenemy( self ) || self == var_0 )
            var_3 _meth_8253( self.origin, 1, var_4, var_4, var_0, "MOD_RIFLE_BULLET", "gas_grenade_mp" );
    }
}

_id_AF2B( var_0 )
{
    var_1 = [];

    if ( level.teambased )
    {
        if ( isdefined( var_0 ) && var_0 == 1 )
        {
            foreach ( var_3 in level._id_3CB5 )
            {
                if ( isdefined( var_3 ) && isalive( var_3 ) && var_3.team != self.team )
                    var_1[var_1.size] = var_3;
            }
        }

        if ( isdefined( level._id_1655 ) )
        {
            foreach ( var_6 in level._id_1655 )
            {
                if ( isdefined( var_6._id_18DE ) && var_6.team != self.team )
                    var_1[var_1.size] = var_6;
            }
        }

        if ( isdefined( level._id_11267 ) && isdefined( level._id_11267._id_12801 ) )
        {
            foreach ( var_9 in level._id_11267._id_12801 )
            {
                if ( isdefined( var_9 ) && isdefined( var_9.team ) && var_9.team != self.team )
                    var_1[var_1.size] = var_9;
            }
        }

        if ( isdefined( level._id_B726 ) )
        {
            foreach ( var_12 in level._id_B726 )
            {
                if ( isdefined( var_12 ) && isdefined( var_12.team ) && var_12.team != self.team )
                    var_1[var_1.size] = var_12;
            }
        }
    }
    else
    {
        if ( isdefined( var_0 ) && var_0 == 1 )
        {
            foreach ( var_3 in level._id_3CB5 )
            {
                if ( !isdefined( var_3 ) || !isalive( var_3 ) )
                    continue;

                var_1[var_1.size] = var_3;
            }
        }

        if ( isdefined( level._id_1655 ) )
        {
            foreach ( var_6 in level._id_1655 )
            {
                if ( isdefined( var_6._id_18DE ) && isdefined( var_6.owner ) && var_6.owner != self )
                    var_1[var_1.size] = var_6;
            }
        }

        if ( isdefined( level._id_11267 ) && isdefined( level._id_11267._id_12801 ) )
        {
            foreach ( var_9 in level._id_11267._id_12801 )
            {
                if ( isdefined( var_9 ) && isdefined( var_9.owner ) && var_9.owner != self )
                    var_1[var_1.size] = var_9;
            }
        }

        if ( isdefined( level._id_B726 ) )
        {
            foreach ( var_12 in level._id_B726 )
            {
                if ( isdefined( var_12 ) && isdefined( var_12.owner ) && var_12.owner != self )
                    var_1[var_1.size] = var_12;
            }
        }
    }

    return var_1;
}

_id_13AD5()
{
    self endon( "disconnect" );

    for (;;)
    {
        var_0 = scripts\mp\utility\game::_id_137A6();

        if ( !isdefined( var_0 ) )
            continue;

        switch ( var_0._id_13C2E )
        {
            case "stinger_mp":
            case "iw7_lockon_mp":
                level notify( "stinger_fired", self, var_0, self._id_10FAA );
                break;
            case "javelin_mp":
            case "lasedStrike_missile_mp":
            case "remote_mortar_missile_mp":
                level notify( "stinger_fired", self, var_0, self._id_A445 );
                break;
            case "iw7_blackholegun_mp":
                thread scripts\mp\supers\super_blackholegun::_id_B8B1( var_0._id_13C2E, var_0 );
                break;
            case "iw7_unsalmg_mpl_auto":
            case "iw7_unsalmg_mp":
            case "iw7_unsalmg_mpl":
                var_0._id_13C2E = "power_smoke_drone_mp";
                thread scripts\mp\equipment\exploding_drone::_id_69D4( var_0, 1 );
                break;
            case "iw7_tacburst_mpl":
            case "iw7_tacburst_mp":
                var_0 thread _id_0AA4::_id_13A12();
                break;
            case "iw7_tacburst_mpl_epic2":
                var_0 thread scripts\mp\perks\weaponpassives::cryogl_watchforexplode( self );
                break;
            case "iw7_mp28_mpl_fasthip":
                thread smokeunderbarrelused( var_0 );
                break;
            default:
                break;
        }

        if ( isplayer( self ) )
            var_0.adsfire = scripts\mp\utility\game::_id_9EE8();

        if ( _id_9DE7( var_0._id_13C2E ) )
        {
            var_1 = 1.0;

            if ( _id_9F5C( var_0._id_13C2E ) )
                var_1 = 0.65;

            var_0 thread scripts\mp\shellshock::_id_858A( var_1 );
        }

        var_0._id_FF03 = self _meth_84D9();
    }
}

_id_9F5C( var_0 )
{
    var_0 = getweaponbasename( var_0 );
    var_1 = 0;

    switch ( var_0 )
    {
        case "iw7_venomx_mp":
        case "iw7_glprox_mp":
            var_1 = 1;
            break;
        default:
            break;
    }

    return var_1;
}

_id_9DE7( var_0 )
{
    var_0 = getweaponbasename( var_0 );

    switch ( var_0 )
    {
        case "iw7_cheytac_mpr_projectile":
        case "wristrocket_proj_mp":
            return 0;
    }

    return 1;
}

_id_13B38()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "sentry_placement_finished", var_0 );
        thread scripts\mp\utility\game::_id_F63E( var_0, "tag_flash", 65 );
    }
}

_id_42D8( var_0 )
{
    thread scripts\mp\utility\game::_id_C15A( "death", "end_explode" );
    self endon( "end_explode" );
    self waittill( "explode", var_1 );
}

_id_42DE( var_0 )
{
    if ( isalive( self ) )
    {
        var_1 = anglestoforward( self _meth_857C() ) * 940;
        var_2 = ( 0, 0, 120 );
        var_3 = var_1 + var_2;
    }
    else
    {
        var_1 = anglestoforward( self _meth_857C() ) * 50;
        var_2 = ( 0, 0, 10 );
        var_3 = var_1 + var_2;
    }

    var_0 = scripts\mp\utility\game::_id_1302( "cluster_grenade_mp", var_0.origin, var_3, 100, 1, var_0 );
    var_0 thread _id_4107();
    thread _id_42DF( var_0 );
}

_id_42DF( var_0, var_1 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    var_2 = ( 1 - var_0._id_118A1 ) * 3.5;
    wait( var_2 );
    thread _id_42DA( var_0 );
}

_id_42DA( var_0 )
{
    var_0 notify( "death" );
    var_0._id_69BA = 1;
    var_0.origin = var_0.origin;
    var_1 = spawn( "script_model", var_0.origin );
    var_1 _meth_831F( var_0.owner );
    var_1 setmodel( "prop_mp_cluster_grenade_scr" );
    _id_42DB( var_0, var_1 );

    if ( isdefined( var_0 ) )
        var_0 _meth_8587( 1 );

    wait 2;

    if ( isdefined( var_1 ) )
        var_1 delete();

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_42DB( var_0, var_1 )
{
    self endon( "disconnect" );
    scripts\mp\utility\game::_id_D915( "cluster grenade explode", self );
    var_2 = scripts\engine\trace::_id_48BC( 0, 1, 1, 0, 1, 0, 0 );
    var_3 = var_0.origin;
    var_4 = 0;
    var_5 = var_3 + ( 0, 0, 3 );
    var_6 = var_5 + ( 0, 0, -5 );
    var_7 = physics_raycast( var_5, var_6, var_2, undefined, 0, "physicsquery_closest" );

    if ( isdefined( var_7 ) && var_7.size > 0 )
        var_4 = 1;

    var_8 = scripts\engine\utility::ter_op( var_4, ( 0, 0, 32 ), ( 0, 0, 2 ) );
    var_9 = var_3 + var_8;
    var_10 = randomint( 90 ) - 45;
    var_2 = scripts\engine\trace::_id_48BC( 0, 1, 1, 0, 1, 1, 0 );

    for ( var_11 = 0; var_11 < 4; var_11++ )
    {
        var_12 = "explode" + ( var_11 + 1 );
        var_0 setscriptablepartstate( var_12, "active", 0 );
        var_13 = scripts\engine\utility::ter_op( var_11 < 4, 90 * var_11 + var_10, randomint( 360 ) );
        var_14 = scripts\engine\utility::ter_op( var_4, 110, 90 );
        var_15 = scripts\engine\utility::ter_op( var_4, 12, 45 );
        var_16 = var_14 + randomint( var_15 * 2 ) - var_15;
        var_17 = randomint( 60 ) + 30;
        var_18 = cos( var_13 ) * sin( var_16 );
        var_19 = sin( var_13 ) * sin( var_16 );
        var_20 = cos( var_16 );
        var_21 = ( var_18, var_19, var_20 ) * var_17;
        var_5 = var_9;
        var_6 = var_9 + var_21;
        var_7 = physics_raycast( var_5, var_6, var_2, undefined, 0, "physicsquery_closest" );

        if ( isdefined( var_7 ) && var_7.size > 0 )
            var_6 = var_7[0]["position"];

        var_1 dontinterpolate();
        var_1.origin = var_6;
        var_1 setscriptablepartstate( var_12, "active", 0 );
        wait 0.175;
    }
}

_id_4107()
{
    self endon( "death" );
    self.owner waittill( "disconnect" );
    self delete();
}

_id_10D85( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( !isdefined( var_4 ) )
        return;

    if ( var_6 )
    {
        var_11 = spawnfx( var_7, self.origin );
        playloopsound( self.origin, var_8 );
        triggerfx( var_11 );
        wait 2;
        var_11 delete();
    }
    else
        wait( var_0 );

    if ( !isdefined( var_4 ) )
        return;

    radiusdamage( self.origin + ( 0, 0, 50 ), var_1, var_2, var_3, var_4, "MOD_EXPLOSIVE", var_10 );
    playfx( var_5, self.origin + ( 0, 0, 50 ) );
    playloopsound( self.origin, var_9 );
    self delete();
}

_id_BFD3()
{
    thread scripts\mp\utility\game::_id_C15A( "death", "end_explode" );
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    thread _id_5925( var_0, self.owner, self._id_BFD5 );
    _id_BFD2( var_0, self.owner, self._id_BFD5 );
}

_id_BFD2( var_0, var_1, var_2 )
{
    if ( var_2 >= 5 || _id_CBED( var_1, var_2 ) )
    {
        playloopsound( var_0, "emp_grenade_explode_default" );
        var_3 = _id_7E8C( var_0, 512, 0, undefined );

        foreach ( var_5 in var_3 )
        {
            if ( isdefined( var_5.owner ) && !_id_7415( var_1, var_5.owner ) )
                continue;

            var_5 notify( "emp_damage", self.owner, 8.0 );
        }
    }
}

_id_CBED( var_0, var_1 )
{
    if ( var_0 scripts\mp\utility\game::_id_12D6( "specialty_pitcher" ) )
    {
        if ( var_1 >= 4 )
            return 1;
    }

    return 0;
}

_id_5925( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    var_3 = level._id_13C7D[self._id_13C2E];
    wait( randomfloatrange( 0.25, 0.5 ) );

    for ( var_4 = 1; var_4 < var_2; var_4++ )
    {
        var_5 = _id_7FF0( var_0, var_3._id_1336F );
        playloopsound( var_5, var_3._id_C525 );
        playfx( var_3._id_C526, var_5 );

        foreach ( var_7 in level.players )
        {
            if ( !scripts\mp\utility\game::isreallyalive( var_7 ) || var_7.sessionstate != "playing" )
                continue;

            var_8 = var_7 geteye();
            var_9 = distancesquared( var_0, var_8 );

            if ( var_9 > var_3._id_DC05 )
                continue;

            if ( !bullettracepassed( var_0, var_8, 0, var_7 ) )
                continue;

            if ( var_9 <= var_3._id_DC06 )
                var_10 = 1.0;
            else
                var_10 = 1.0 - ( var_9 - var_3._id_DC06 ) / ( var_3._id_DC05 - var_3._id_DC06 );

            var_11 = anglestoforward( var_7 getplayerangles() );
            var_12 = var_0 - var_8;
            var_12 = vectornormalize( var_12 );
            var_13 = 0.5 * ( 1.0 + vectordot( var_11, var_12 ) );
            var_14 = 1;
            var_7 notify( "flashbang", var_0, var_10, var_13, var_1, var_14 );
        }

        wait( randomfloatrange( 0.25, 0.5 ) );
    }
}

_id_7FF0( var_0, var_1 )
{
    var_2 = ( randomfloatrange( -1.0 * var_1, var_1 ), randomfloatrange( -1.0 * var_1, var_1 ), 0 );
    var_3 = var_0 + var_2;
    var_4 = bullettrace( var_0, var_3, 0, self, 0, 0, 0, 0, 0 );

    if ( var_4["fraction"] < 1 )
        var_3 = var_0 + var_4["fraction"] * var_2;

    return var_3;
}

_id_56E6( var_0 )
{
    var_0 waittill( "missile_stuck", var_1 );
    var_0 thread _id_56E5( self, 1 );
}

_id_56E5( var_0, var_1 )
{
    level endon( "game_ended" );
    var_2 = level._id_13C7D[self._id_13C2E];
    playfx( var_2._id_C523, self.origin );

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        foreach ( var_5 in level.players )
        {
            if ( !scripts\mp\utility\game::isreallyalive( var_5 ) || var_5.sessionstate != "playing" )
                continue;

            if ( var_5.team == self.owner.team )
                continue;

            if ( var_5 == self.owner )
                continue;

            var_6 = var_5 geteye();

            if ( !scripts\engine\trace::_id_DCF1( self.origin, var_6, level.players ) )
                continue;

            thread _id_56E4( var_5, var_0, var_2, var_6 );
        }

        wait 0.75;
        playloopsound( self.origin, var_2._id_C525 );
        playfx( var_2._id_C526, self.origin );
    }

    self delete();
}

_id_56E4( var_0, var_1, var_2, var_3 )
{
    var_4 = self.origin;
    var_5 = anglestoforward( var_0 getplayerangles() );
    var_6 = var_4 - var_3;
    var_7 = vectornormalize( var_6 );
    playfx( var_2._id_D828, var_4, rotatevector( var_6, ( 0, 180, 0 ) ) * ( 1, 1, -1 ) );
    wait 0.75;

    if ( var_0 adsbuttonpressed() && var_0 _meth_8409( var_4, 65, 300 ) )
        var_0 shellshock( "disruptor_mp", 2.5, 0, 1 );
    else
    {
        var_8 = distancesquared( var_4, var_3 );

        if ( var_8 < var_2._id_DC05 )
        {
            if ( var_8 <= var_2._id_DC06 )
                var_9 = 1.0;
            else
                var_9 = 1.0 - ( var_8 - var_2._id_DC06 ) / ( var_2._id_DC05 - var_2._id_DC06 );

            var_10 = 0.65 * ( 1.0 + vectordot( var_5, var_7 ) );
            var_11 = 1;
            var_0 notify( "flashbang", var_4, var_9, var_10, var_1, var_11 );
        }
    }
}

_id_3350( var_0 )
{
    if ( !scripts\mp\utility\game::isreallyalive( self ) )
    {
        var_0 delete();
        return;
    }

    self notify( "c4_update", 0 );
    var_0 thread _id_C4F4();
    thread _id_139C5();
    thread _id_139C4();
    thread _id_139C3();
    var_0 _meth_831F( self );
    var_0._id_1604 = 0;
    _id_C54E( var_0, "power_c4" );
    var_1 = level._id_13C7D["c4_mp"];
    var_0 thread _id_57EB( "tag_fx", var_1._id_B760["friendly"], var_1._id_B760["enemy"] );
    var_0 thread scripts\mp\shellshock::_id_3337();
    var_0 thread _id_3341();
    var_0 thread _id_3343();
    var_0 thread _id_66B4( 1 );
    var_0 thread _id_139C7();
    level thread _id_B9CA( self, var_0 );
}

_id_139C6()
{
    self.owner endon( "disconnect" );
    var_0 = self.owner;
    var_1 = scripts\engine\utility::_id_107E6();
    var_1 linkto( self );
    thread _id_334D( var_1 );
    thread scripts\mp\utility\game::_id_C15A( "death", "end_explode" );
    self endon( "end_explode" );
    self waittill( "explode", var_2 );
    thread _id_334C( var_2, var_0, var_1 );
}

_id_334C( var_0, var_1, var_2 )
{
    var_1 endon( "disconnect" );
    wait 0.5;
    var_2 _meth_8253( var_0, 256, 140, 70, var_1, "MOD_EXPLOSIVE", "c4_mp" );
    scripts\mp\shellshock::_id_858B( var_0 );
}

_id_334D( var_0 )
{
    var_0 endon( "death" );
    self waittill( "death" );
    wait 1;
    var_0 delete();
}

_id_BD4F( var_0 )
{
    if ( !isdefined( var_0._id_AA33 ) || !isdefined( var_0._id_AA33._id_5318 ) || var_0._id_AA33._id_5318 )
        self notify( "detonateExplosive" );
}

_id_139C7()
{
    self endon( "death" );
    self waittill( "missile_stuck", var_0 );
    self _meth_8317( 1 );
    self._id_334F = 1;
    thread scripts\mp\perks\perk_equipmentping::_id_E84B();
    thread _id_C798( self, self.owner );
    scripts\mp\sentientpoolmanager::registersentient( "Lethal_Static", self.owner, 1 );
    _id_69FF( var_0 );
    _id_B2A5();
}

_id_334A()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        _id_66A9();
        self._id_55BA = 1;
        self notify( "disabled" );
        wait( var_1 );
        self._id_55BA = undefined;
        self notify( "enabled" );
    }
}

_id_DACD( var_0 )
{
    if ( !scripts\mp\utility\game::isreallyalive( self ) )
    {
        var_0 delete();
        return;
    }

    var_0 waittill( "missile_stuck", var_1 );

    if ( !scripts\mp\utility\game::isreallyalive( self ) )
    {
        var_0 delete();
        return;
    }

    if ( !isdefined( var_0.owner.team ) )
    {
        var_0 delete();
        return;
    }

    var_2 = anglestoup( var_0.angles );
    var_0.origin -= var_2;
    var_3 = level._id_13C7D[var_0._id_13C2E];
    var_4 = spawn( "script_model", var_0.origin + var_3._id_A640 * var_2 );
    var_4 setscriptmoverkillcam( "explosive" );
    var_4 linkto( var_0 );
    var_0._id_A63A = var_4;
    var_0 _id_69FF( var_1 );
    var_0 _id_B2A5();
    var_0 scripts\mp\sentientpoolmanager::registersentient( "Lethal_Static", var_0.owner, 1 );
    _id_C54E( var_0 );
    var_0 thread _id_C4F4();
    var_0 thread _id_3343();
    var_0 thread _id_66B4( 1 );
    var_0 thread _id_DACC( var_1 );
    var_0 thread _id_F692( self.team, 20 );
    level thread _id_B9CA( self, var_0 );
}

_id_DACC( var_0 )
{
    self endon( "death" );
    self endon( "disabled" );
    var_1 = level._id_13C7D[self._id_13C2E];
    wait( var_1._id_217C );
    self playloopsound( "ied_explo_beeps" );
    thread _id_57EB( "tag_fx" );
    var_2 = self.origin * ( 1, 1, 0 );
    var_3 = var_1._id_53B5 / 2;
    var_4 = self.origin[2] - var_3;
    var_2 += ( 0, 0, var_4 );
    var_5 = spawn( "trigger_radius", var_2, 0, var_1._id_53B6, var_1._id_53B5 );
    var_5.owner = self;

    if ( isdefined( var_0 ) )
    {
        var_5 _meth_80D2();
        var_5 linkto( self );
    }

    self._id_4D2A = var_5;
    thread _id_51BF( var_5 );
    var_6 = undefined;

    for (;;)
    {
        var_5 waittill( "trigger", var_6 );

        if ( !isdefined( var_6 ) )
            continue;

        if ( getdvarint( "scr_minesKillOwner" ) != 1 )
        {
            if ( isdefined( self.owner ) )
            {
                if ( var_6 == self.owner )
                    continue;

                if ( isdefined( var_6.owner ) && var_6.owner == self.owner )
                    continue;
            }

            if ( !_id_7415( self.owner, var_6, 0 ) )
                continue;
        }

        if ( lengthsquared( var_6 getentityvelocity() ) < 10 )
            continue;

        if ( var_6 _meth_808F( self.origin, self ) > 0 )
            break;
    }

    self stoploopsound( "ied_explo_beeps" );
    self playsound( "ied_warning" );
    _id_6A08( var_6, var_1._id_53B4, "proxExplosive" );
    self notify( "detonateExplosive" );
}

_id_DACB()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        _id_66A9();
        self._id_55BA = 1;
        self notify( "disabled" );
        _id_DACA();
        wait( var_1 );

        if ( isdefined( self ) )
        {
            self._id_55BA = undefined;
            self notify( "enabled" );
            var_2 = self _meth_8138();
            thread _id_DACC( var_2 );
        }
    }
}

_id_DACA()
{
    _id_11061();

    if ( isdefined( self._id_4D2A ) )
        self._id_4D2A delete();
}

_id_F692( var_0, var_1 )
{
    self endon( "death" );
    wait 0.05;

    if ( level.teambased )
        scripts\mp\entityheadicons::_id_F877( var_0, ( 0, 0, var_1 ) );
    else if ( isdefined( self.owner ) )
        scripts\mp\entityheadicons::_id_F7F2( self.owner, ( 0, 0, var_1 ) );
}

_id_402D( var_0 )
{
    if ( !isalive( self ) )
    {
        var_0 delete();
        return;
    }

    var_0 hide();
    var_0 scripts\engine\utility::_id_13736( 0.05, "missile_stuck" );

    if ( !isdefined( self ) || !isalive( self ) )
    {
        var_0 delete();
        return;
    }

    var_1 = 60;
    var_2 = ( 0, 0, 4 );
    var_3 = distancesquared( self.origin, var_0.origin );
    var_4 = distancesquared( self geteye(), var_0.origin );
    var_3 += 600;
    var_5 = var_0 _meth_8138();

    if ( isdefined( var_5 ) )
        var_0 unlink();

    if ( var_3 < var_4 )
    {
        if ( var_1 * var_1 < distancesquared( var_0.origin, self.origin ) )
        {
            var_6 = bullettrace( self.origin, self.origin - ( 0, 0, var_1 ), 0, self );

            if ( var_6["fraction"] == 1 )
            {
                var_0 delete();
                self setweaponammostock( var_0._id_13C2E, self getweaponammostock( var_0._id_13C2E ) + 1 );
                return;
            }
            else
            {
                var_0.origin = var_6["position"];
                var_5 = var_6["entity"];
            }
        }
        else
        {

        }
    }
    else if ( var_1 * var_1 < distancesquared( var_0.origin, self geteye() ) )
    {
        var_6 = bullettrace( self.origin, self.origin - ( 0, 0, var_1 ), 0, self );

        if ( var_6["fraction"] == 1 )
        {
            var_0 delete();
            self setweaponammostock( var_0._id_13C2E, self getweaponammostock( var_0._id_13C2E ) + 1 );
            return;
        }
        else
        {
            var_0.origin = var_6["position"];
            var_5 = var_6["entity"];
        }
    }
    else
    {
        var_2 = ( 0, 0, -5 );
        var_0.angles += ( 0, 180, 0 );
    }

    var_0.angles *= ( 0, 1, 1 );
    var_0.origin += var_2;
    var_0 _id_69FF( var_5 );
    var_0 show();
    var_0 _id_B2A5();
    var_0 scripts\mp\sentientpoolmanager::registersentient( "Lethal_Static", var_0.owner, 1 );
    _id_C54E( var_0, "power_claymore" );
    var_0 thread _id_C4F4();
    var_0 thread _id_3343();
    var_0 thread _id_66B4( 1 );
    var_0 thread _id_4028( var_5 );
    var_0 thread _id_F692( self.pers["team"], 20 );
    level thread _id_B9CA( self, var_0 );
}

_id_4028( var_0 )
{
    self endon( "death" );
    var_1 = spawn( "trigger_radius", self.origin + ( 0, 0, 0 - level._id_4027 ), 0, level._id_4027, level._id_4027 * 2 );

    if ( isdefined( var_0 ) )
    {
        var_1 _meth_80D2();
        var_1 linkto( var_0 );
    }

    thread _id_51BF( var_1 );

    for (;;)
    {
        var_1 waittill( "trigger", var_2 );

        if ( getdvarint( "scr_claymoredebug" ) != 1 )
        {
            if ( isdefined( self.owner ) )
            {
                if ( var_2 == self.owner )
                    continue;

                if ( isdefined( var_2.owner ) && var_2.owner == self.owner )
                    continue;
            }

            if ( !_id_7415( self.owner, var_2, 0 ) )
                continue;
        }

        if ( lengthsquared( var_2 getentityvelocity() ) < 10 )
            continue;

        var_3 = abs( var_2.origin[2] - self.origin[2] );

        if ( var_3 > 128 )
            continue;

        if ( !var_2 _id_FFB9( self ) )
            continue;

        if ( var_2 _meth_808F( self.origin, self ) > 0 )
            break;
    }

    self playsound( "claymore_activated" );
    _id_6A08( var_2, level._id_4024, "claymore" );

    if ( isdefined( self.owner ) )
        self.owner thread scripts\mp\utility\game::leaderdialogonplayer( "claymore_destroyed", undefined, undefined, self.origin );

    self notify( "detonateExplosive" );
}

_id_FFB9( var_0 )
{
    if ( isdefined( var_0._id_55BA ) )
        return 0;

    var_1 = self.origin + ( 0, 0, 32 );
    var_2 = var_1 - var_0.origin;
    var_3 = anglestoforward( var_0.angles );
    var_4 = vectordot( var_2, var_3 );

    if ( var_4 < level._id_4025 )
        return 0;

    var_2 = vectornormalize( var_2 );
    var_5 = vectordot( var_2, var_3 );
    return var_5 > level._id_4023;
}

_id_51BF( var_0 )
{
    self waittill( "death" );
    wait 0.05;

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0.trigger ) )
            var_0.trigger delete();

        var_0 delete();
    }
}

_id_3341()
{
    self endon( "death" );
    self waittill( "missile_stuck", var_0 );
    wait 0.05;
    self notify( "activated" );
    self._id_1604 = 1;
}

_id_139C3()
{
    self notify( "watchC4AltDetonate" );
    self endon( "watchC4AltDetonate" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "detonated" );
    level endon( "game_ended" );
    var_0 = 0;

    for (;;)
    {
        if ( self usebuttonpressed() )
        {
            var_0 = 0;

            while ( self usebuttonpressed() )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.5 )
                continue;

            var_0 = 0;

            while ( !self usebuttonpressed() && var_0 < 0.5 )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.5 )
                continue;

            if ( !self._id_CC4C.size )
                return;

            if ( !scripts\mp\equipment\phase_shift::_id_9DDF( self ) && !scripts\mp\utility\game::isusingremote() )
                self notify( "alt_detonate" );
        }

        wait 0.05;
    }
}

_id_139C5( var_0 )
{
    self notify( "watchC4Detonation" );
    self endon( "watchC4Detonation" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittillmatch( "detonate", "c4_mp" );
        _id_3349();
    }
}

_id_139C4()
{
    self notify( "watchC4AltDetonation" );
    self endon( "watchC4AltDetonation" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "alt_detonate" );
        var_0 = self getcurrentweapon();

        if ( var_0 != "c4_mp" )
            _id_3349();
    }
}

_id_3349()
{
    foreach ( var_1 in self._id_CC4C )
    {
        if ( isdefined( var_1 ) && var_1._id_13C2E == "c4_mp" )
            var_1 thread _id_1369A( 0.1 );
    }

    self._id_CC4C = [];
    self notify( "c4_update", 0 );
    self notify( "detonated" );
}

_id_1369A( var_0 )
{
    self endon( "death" );
    wait( var_0 );
    _id_1382F();
    self notify( "detonateExplosive" );
}

_id_3343()
{
    self endon( "death" );
    self endon( "detonated" );
    self setcandamage( 1 );
    self.maxhealth = 100000;
    self.health = self.maxhealth;
    var_0 = undefined;
    var_1 = 1;

    if ( self.owner scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" ) )
        var_1++;

    for (;;)
    {
        self waittill( "damage", var_2, var_0, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( !isplayer( var_0 ) && !isagent( var_0 ) )
            continue;

        if ( !_id_7415( self.owner, var_0 ) )
            continue;

        if ( _id_66AA( var_10, var_5 ) )
            continue;

        var_11 = scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_9DFF( var_10, var_5 ), 2, 1 );
        var_1 -= var_11;

        if ( var_1 <= 0 )
            break;

        if ( var_1 <= 0 )
            break;
        else
            var_0 scripts\mp\damagefeedback::updatedamagefeedback( "bouncing_betty" );
    }

    if ( level._id_334B )
        wait( 0.1 + randomfloat( 0.4 ) );
    else
        wait 0.05;

    if ( !isdefined( self ) )
        return;

    level._id_334B = 1;
    thread _id_E24B();

    if ( isdefined( var_5 ) && ( issubstr( var_5, "MOD_GRENADE" ) || issubstr( var_5, "MOD_EXPLOSIVE" ) ) )
        self._id_13908 = 1;

    if ( isdefined( var_9 ) && var_9 & level.idflags_penetration )
        self._id_1390E = 1;

    if ( isdefined( var_9 ) && var_9 & level.idflags_no_team_protection )
        self._id_1390F = 1;

    self._id_1390B = 1;

    if ( isdefined( var_0 ) )
        self._id_4D3F = var_0;

    if ( isplayer( var_0 ) )
    {
        var_0 scripts\mp\damagefeedback::updatedamagefeedback( "c4" );

        if ( var_0 != self.owner && var_0.team != self.owner.team )
        {
            if ( var_10 != "trophy_mp" )
                var_0 scripts\mp\killstreaks\killstreaks::_id_83A0();
        }
    }

    if ( level.teambased )
    {
        if ( isdefined( var_0 ) && isdefined( self.owner ) )
        {
            var_12 = var_0.pers["team"];
            var_13 = self.owner.pers["team"];

            if ( isdefined( var_12 ) && isdefined( var_13 ) && var_12 != var_13 )
                var_0 notify( "destroyed_equipment" );
        }
    }
    else if ( isdefined( self.owner ) && isdefined( var_0 ) && var_0 != self.owner )
        var_0 notify( "destroyed_equipment" );

    if ( getdvarint( "showArchetypes", 0 ) > 0 )
    {
        if ( self._id_13C2E == "c4_mp" )
            self.owner notify( "c4_update", 0 );
    }

    self notify( "detonateExplosive", var_0 );
}

_id_E24B()
{
    wait 0.05;
    level._id_334B = 0;
}

_id_EB82( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 60; var_2++ )
        wait 0.05;
}

_id_1382F()
{
    if ( !isdefined( self._id_55BA ) )
        return;

    self waittill( "enabled" );
}

_id_3347( var_0 )
{
    self waittill( "activated" );
    var_1 = spawn( "trigger_radius", self.origin - ( 0, 0, 128 ), 0, 512, 256 );
    var_1._id_53B1 = "trigger" + gettime() + randomint( 1000000 );
    var_1.owner = self;
    var_1 thread _id_53B0( level._id_C74B[var_0] );
    self waittill( "death" );
    var_1 notify( "end_detection" );

    if ( isdefined( var_1._id_2C65 ) )
        var_1._id_2C65 destroy();

    var_1 delete();
}

_id_4026( var_0 )
{
    var_1 = spawn( "trigger_radius", self.origin - ( 0, 0, 128 ), 0, 512, 256 );
    var_1._id_53B1 = "trigger" + gettime() + randomint( 1000000 );
    var_1.owner = self;
    var_1 thread _id_53B0( level._id_C74B[var_0] );
    self waittill( "death" );
    var_1 notify( "end_detection" );

    if ( isdefined( var_1._id_2C65 ) )
        var_1._id_2C65 destroy();

    var_1 delete();
}

_id_53B0( var_0 )
{
    self endon( "end_detection" );
    level endon( "game_ended" );

    while ( !level._id_7669 )
    {
        self waittill( "trigger", var_1 );

        if ( !var_1._id_53AD )
            continue;

        if ( level.teambased && var_1.team != var_0 )
            continue;
        else if ( !level.teambased && var_1 == self.owner.owner )
            continue;

        if ( isdefined( var_1._id_2C67[self._id_53B1] ) )
            continue;

        var_1 thread _id_1012C( self );
    }
}

_id_B9CA( var_0, var_1 )
{
    level endon( "game_ended" );
    var_1 endon( "death" );
    var_0 scripts\engine\utility::waittill_any( "joined_team", "joined_spectators", "disconnect" );
    var_1 _id_51B5();
}

monitordisownedgrenade( var_0, var_1 )
{
    level endon( "game_ended" );
    var_1 endon( "death" );
    var_1 endon( "mine_planted" );
    var_0 scripts\engine\utility::waittill_any( "joined_team", "joined_spectators", "disconnect" );

    if ( isdefined( var_1 ) )
        var_1 delete();
}

_id_9EE5( var_0 )
{
    return isdefined( level._id_B779[var_0 getentitynumber()] ) || scripts\mp\utility\game::istrue( var_0.planted );
}

_id_7F9A( var_0 )
{
    var_1 = 0;
    var_2 = _id_0AE2::_id_808C( "primary" );

    if ( isdefined( var_2 ) )
    {
        var_1 += _id_0AE2::_id_D736( var_2 );

        if ( scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" ) )
            var_1++;
    }

    return var_1;
}

_id_7FA3( var_0 )
{
    var_1 = 0;
    var_2 = _id_0AE2::_id_808C( "secondary" );

    if ( isdefined( var_2 ) )
    {
        var_1 += _id_0AE2::_id_D736( var_2 );

        if ( scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" ) )
            var_1++;
    }

    return var_1;
}

_id_C54E( var_0, var_1, var_2 )
{
    var_0._id_D77A = var_1;
    var_0._id_51B6 = var_2;
    var_0.planted = 1;

    if ( self._id_CC4C.size )
    {
        self._id_CC4C = scripts\engine\utility::_id_22BC( self._id_CC4C );

        if ( self._id_CC4C.size && self._id_CC4C.size >= _id_7F9A( self ) )
            self._id_CC4C[0] _id_51B5();
    }

    self._id_CC4C[self._id_CC4C.size] = var_0;
    var_3 = var_0 getentitynumber();
    level._id_B779[var_3] = var_0;
    level notify( "mine_planted" );
}

_id_C5AC( var_0, var_1, var_2 )
{
    var_0._id_D77A = var_1;
    var_0._id_51B6 = var_2;
    var_0.planted = 1;

    if ( self._id_CC4D.size )
    {
        self._id_CC4D = scripts\engine\utility::_id_22BC( self._id_CC4D );

        if ( self._id_CC4D.size && self._id_CC4D.size >= _id_7FA3( self ) )
            self._id_CC4D[0] _id_51B5();
    }

    self._id_CC4D[self._id_CC4D.size] = var_0;
    var_3 = var_0 getentitynumber();
    level._id_B779[var_3] = var_0;
    level notify( "mine_planted" );
}

_id_5608()
{
    if ( isdefined( self._id_CC4C ) && self._id_CC4C.size > 0 )
    {
        foreach ( var_1 in self._id_CC4C )
        {
            if ( isdefined( var_1.trigger ) && isdefined( var_1.owner ) )
                var_1.trigger disableplayeruse( var_1.owner );
        }
    }

    if ( isdefined( self._id_CC4D ) && self._id_CC4D.size > 0 )
    {
        foreach ( var_1 in self._id_CC4D )
        {
            if ( isdefined( var_1.trigger ) && isdefined( var_1.owner ) )
                var_1.trigger disableplayeruse( var_1.owner );
        }
    }
}

_id_40F4( var_0, var_1, var_2, var_3 )
{
    if ( getdvarint( "showArchetypes", 0 ) > 0 )
    {
        if ( isdefined( self._id_13C2E ) )
        {
            if ( self._id_13C2E == "c4_mp" )
                self.owner notify( "c4_update", 0 );
            else if ( self._id_13C2E == "bouncingbetty_mp" )
                self.owner notify( "bouncing_betty_update", 0 );
            else if ( self._id_13C2E == "trip_mine_mp" )
                self.owner notify( "trip_mine_update", 0 );
            else if ( self._id_13C2E == "cryo_mine_mp" )
                self.owner notify( "cryo_mine_update", 0 );
            else if ( self._id_13C2E == "fear_grenade_mp" )
                self.owner notify( "restart_fear_grenade_cooldown", 0 );
            else if ( self._id_13C2E == "trophy_mp" )
                self.owner notify( "trophy_update", 0 );
        }
    }

    if ( isdefined( var_0 ) )
        level._id_B779[var_0] = undefined;

    if ( isdefined( var_1 ) )
        var_1 delete();

    if ( isdefined( var_2 ) )
        var_2 delete();

    if ( isdefined( var_3 ) )
        var_3 delete();
}

_id_51B5()
{
    if ( !isdefined( self ) )
        return;

    scripts\mp\sentientpoolmanager::unregistersentient( self.sentientpool, self.sentientpoolindex );
    var_0 = self getentitynumber();
    level._id_B779[var_0] = undefined;

    if ( isdefined( self._id_51B6 ) )
    {
        self thread [[ self._id_51B6 ]]();
        self notify( "deleted_equipment" );
    }
    else
    {
        var_1 = self._id_A63A;
        var_2 = self.trigger;
        var_3 = self._id_F232;
        _id_40F4( var_0, var_1, var_2, var_3 );
        self notify( "deleted_equipment" );
        self delete();
    }
}

_id_C4F4()
{
    self endon( "death" );
    level endon( "game_ended" );
    thread _id_40F5();
    self waittill( "detonateExplosive" );
    self _meth_8099( self.owner );
}

_id_40F5()
{
    self endon( "deleted_equipment" );
    level endon( "game_ended" );
    var_0 = self getentitynumber();
    var_1 = self._id_A63A;
    var_2 = self.trigger;
    var_3 = self._id_F232;
    self waittill( "death" );
    _id_40F4( var_0, var_1, var_2, var_3 );
}

_id_B2A5( var_0 )
{
    self _meth_831F( self.owner );

    if ( !isdefined( var_0 ) )
        var_0 = 10;

    var_1 = spawn( "script_origin", self.origin + var_0 * anglestoup( self.angles ) );
    var_1 linkto( self );
    self.trigger = var_1;
    var_1.owner = self;
    thread _id_B2A6();
    return var_1;
}

_id_B2A6()
{
    self endon( "makeExplosiveUnusable" );
    var_0 = self.trigger;
    _id_13A23();

    if ( isdefined( self ) )
    {
        var_0 = self.trigger;
        self.trigger = undefined;
    }

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_B2A3()
{
    self notify( "makeExplosiveUnusable" );
    var_0 = self.trigger;
    self.trigger = undefined;

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_13A23()
{
    var_0 = self.owner;
    var_1 = self.trigger;
    self endon( "death" );
    var_1 endon( "death" );
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    var_1 setcursorhint( "HINT_NOICON" );
    var_1 scripts\mp\utility\game::_id_F838( var_0 );
    var_1 childthread scripts\mp\utility\game::_id_C18A( var_0 );

    switch ( self._id_13C2E )
    {
        case "c4_mp":
            var_1 sethintstring( &"MP_PICKUP_C4" );
            break;
        case "cryo_mine_mp":
            var_1 sethintstring( &"MP_PICKUP_CRYO_MINE" );
            break;
        case "trip_mine_mp":
            var_1 sethintstring( &"MP_PICKUP_TRIP_MINE" );
            break;
        case "trophy_mp":
            var_1 sethintstring( &"MP_PICKUP_TROPHY" );
            break;
    }

    for (;;)
    {
        var_1 waittillmatch( "trigger", var_0 );

        if ( isdefined( self._id_13C2E ) )
        {
            switch ( self._id_13C2E )
            {
                case "trophy_mp":
                    thread scripts\mp\trophy_system::_id_12818();
            }

            var_0 thread scripts\mp\equipment\c4::c4_resetaltdetonpickup();
        }

        var_0 playlocalsound( "scavenger_pack_pickup" );
        var_0 notify( "scavenged_ammo", self._id_13C2E );
        thread _id_51B5();
        return;
    }
}

_id_B2A7( var_0, var_1 )
{
    self endon( "death" );
    self endon( "makeExplosiveUnusable" );
    var_2 = self.owner;
    var_3 = self._id_13C2E;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( var_1 )
        self _meth_858A( 1 );
    else
        self setcursorhint( "HINT_NOICON" );

    self _meth_84A7( var_0 );

    switch ( var_3 )
    {
        case "c4_mp":
            self sethintstring( &"MP_PICKUP_C4" );
            break;
        case "cryo_mine_mp":
            self sethintstring( &"MP_PICKUP_CRYO_MINE" );
            break;
        case "trip_mine_mp":
            self sethintstring( &"MP_PICKUP_TRIP_MINE" );
            break;
        case "trophy_mp":
            self sethintstring( &"MP_PICKUP_TROPHY" );
            break;
    }

    scripts\mp\utility\game::_id_F838( var_2 );
    childthread scripts\mp\utility\game::_id_C18A( var_2 );

    for (;;)
    {
        self waittillmatch( "trigger", var_2 );

        if ( isdefined( var_3 ) )
        {
            switch ( var_3 )
            {
                case "trophy_mp":
                    thread scripts\mp\trophy_system::_id_12818();
            }

            var_2 thread scripts\mp\equipment\c4::c4_resetaltdetonpickup();
        }

        var_2 playlocalsound( "scavenger_pack_pickup" );
        var_2 notify( "scavenged_ammo", var_3 );
        thread _id_51B5();
        return;
    }
}

_id_B2A4()
{
    self notify( "makeExplosiveUnusable" );
    self makeunusable();
}

_id_69FF( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_AD39 = var_0;
    var_2._id_4E53 = ::_id_BD4F;
    var_2._id_6371 = "death";

    if ( !isdefined( var_1 ) || !var_1 )
        var_2._id_9B11 = scripts\mp\movers::_id_BD3C;

    thread scripts\mp\movers::_id_892F( var_2 );
}

_id_6A08( var_0, var_1, var_2 )
{
    if ( isplayer( var_0 ) && var_0 scripts\mp\utility\game::_id_12D6( "specialty_delaymine" ) )
    {
        var_0 thread scripts\mp\missions::_id_127BC();
        var_0 notify( "triggeredExpl", var_2 );
        var_1 = level._id_5113;
    }

    wait( var_1 );
}

_id_FA95()
{
    self._id_2C67 = [];

    if ( self._id_53AD && !self._id_2C66.size )
    {
        for ( var_0 = 0; var_0 < 4; var_0++ )
        {
            self._id_2C66[var_0] = newclienthudelem( self );
            self._id_2C66[var_0].x = 0;
            self._id_2C66[var_0].y = 0;
            self._id_2C66[var_0].z = 0;
            self._id_2C66[var_0].alpha = 0;
            self._id_2C66[var_0]._id_0049 = 1;
            self._id_2C66[var_0] setshader( "waypoint_bombsquad", 14, 14 );
            self._id_2C66[var_0] setwaypoint( 0, 0 );
            self._id_2C66[var_0]._id_53B1 = "";
        }
    }
    else if ( !self._id_53AD )
    {
        for ( var_0 = 0; var_0 < self._id_2C66.size; var_0++ )
            self._id_2C66[var_0] destroy();

        self._id_2C66 = [];
    }
}

_id_1012C( var_0 )
{
    var_1 = var_0._id_53B1;
    var_2 = -1;

    for ( var_3 = 0; var_3 < 4; var_3++ )
    {
        var_4 = self._id_2C66[var_3]._id_53B1;

        if ( var_4 == var_1 )
            return;

        if ( var_4 == "" )
            var_2 = var_3;
    }

    if ( var_2 < 0 )
        return;

    self._id_2C67[var_1] = 1;
    self._id_2C66[var_2].x = var_0.origin[0];
    self._id_2C66[var_2].y = var_0.origin[1];
    self._id_2C66[var_2].z = var_0.origin[2] + 24 + 128;
    self._id_2C66[var_2] fadeovertime( 0.25 );
    self._id_2C66[var_2].alpha = 1;
    self._id_2C66[var_2]._id_53B1 = var_0._id_53B1;

    while ( isalive( self ) && isdefined( var_0 ) && self istouching( var_0 ) )
        wait 0.05;

    if ( !isdefined( self ) )
        return;

    self._id_2C66[var_2]._id_53B1 = "";
    self._id_2C66[var_2] fadeovertime( 0.25 );
    self._id_2C66[var_2].alpha = 0;
    self._id_2C67[var_1] = undefined;
}

_id_7E58( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5 = var_1 * var_1;
    var_6 = level.players;

    for ( var_7 = 0; var_7 < var_6.size; var_7++ )
    {
        if ( !isalive( var_6[var_7] ) || var_6[var_7].sessionstate != "playing" )
            continue;

        var_8 = scripts\mp\utility\game::_id_7921( var_6[var_7] );
        var_9 = distancesquared( var_0, var_8 );

        if ( var_9 < var_5 && ( !var_2 || _id_13C7E( var_0, var_8, var_3, var_6[var_7] ) ) )
            var_4[var_4.size] = scripts\mp\utility\game::_id_7920( var_6[var_7], var_8 );
    }

    var_10 = getentarray( "grenade", "classname" );

    for ( var_7 = 0; var_7 < var_10.size; var_7++ )
    {
        var_11 = scripts\mp\utility\game::_id_791E( var_10[var_7] );
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_13C7E( var_0, var_11, var_3, var_10[var_7] ) ) )
            var_4[var_4.size] = scripts\mp\utility\game::_id_791D( var_10[var_7], var_11 );
    }

    var_12 = getentarray( "destructible", "targetname" );

    for ( var_7 = 0; var_7 < var_12.size; var_7++ )
    {
        var_11 = var_12[var_7].origin;
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_13C7E( var_0, var_11, var_3, var_12[var_7] ) ) )
        {
            var_13 = spawnstruct();
            var_13._id_9EE7 = 0;
            var_13._id_9D26 = 0;
            var_13._id_0114 = var_12[var_7];
            var_13._id_4D2F = var_11;
            var_4[var_4.size] = var_13;
        }
    }

    var_14 = getentarray( "destructable", "targetname" );

    for ( var_7 = 0; var_7 < var_14.size; var_7++ )
    {
        var_11 = var_14[var_7].origin;
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_13C7E( var_0, var_11, var_3, var_14[var_7] ) ) )
        {
            var_13 = spawnstruct();
            var_13._id_9EE7 = 0;
            var_13._id_9D26 = 1;
            var_13._id_0114 = var_14[var_7];
            var_13._id_4D2F = var_11;
            var_4[var_4.size] = var_13;
        }
    }

    var_15 = getentarray( "misc_turret", "classname" );

    foreach ( var_17 in var_15 )
    {
        var_11 = var_17.origin + ( 0, 0, 32 );
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_13C7E( var_0, var_11, var_3, var_17 ) ) )
        {
            switch ( var_17._id_01F1 )
            {
                case "vehicle_ugv_talon_gun_mp":
                case "mp_remote_turret":
                case "mp_scramble_turret":
                case "mp_sam_turret":
                case "sentry_minigun_weak":
                    var_4[var_4.size] = scripts\mp\utility\game::_id_7922( var_17, var_11 );
                    break;
            }
        }
    }

    var_19 = getentarray( "script_model", "classname" );

    foreach ( var_21 in var_19 )
    {
        if ( var_21._id_01F1 != "projectile_bouncing_betty_grenade" && var_21._id_01F1 != "ims_scorpion_body" )
            continue;

        var_11 = var_21.origin + ( 0, 0, 32 );
        var_9 = distancesquared( var_0, var_11 );

        if ( var_9 < var_5 && ( !var_2 || _id_13C7E( var_0, var_11, var_3, var_21 ) ) )
            var_4[var_4.size] = scripts\mp\utility\game::_id_791F( var_21, var_11 );
    }

    return var_4;
}

_id_7E8C( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_5 = var_1 * var_1;
    level._id_B779 = scripts\engine\utility::_id_22BC( level._id_B779 );

    foreach ( var_7 in level._id_B779 )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) )
            var_4[var_4.size] = var_7;
    }

    var_9 = getentarray( "misc_turret", "classname" );

    foreach ( var_7 in var_9 )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) )
            var_4[var_4.size] = var_7;
    }

    foreach ( var_7 in level._id_12F81 )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) )
            var_4[var_4.size] = var_7;
    }

    foreach ( var_7 in level._id_DF74 )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) )
            var_4[var_4.size] = var_7;
    }

    foreach ( var_7 in level._id_27EF )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) )
            var_4[var_4.size] = var_7;
    }

    foreach ( var_7 in level._id_CC11 )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) )
            var_4[var_4.size] = var_7;
    }

    foreach ( var_7 in level._id_B726 )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) )
            var_4[var_4.size] = var_7;
    }

    foreach ( var_7 in level._id_105EA )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) )
            var_4[var_4.size] = var_7;
    }

    foreach ( var_7 in level._id_69D6 )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) )
            var_4[var_4.size] = var_7;
    }

    foreach ( var_7 in level.spidergrenade.activeagents )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) )
            var_4[var_4.size] = var_7;
    }

    foreach ( var_7 in level.spidergrenade.proxies )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) )
            var_4[var_4.size] = var_7;
    }

    foreach ( var_7 in level._id_2ABD )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) )
            var_4[var_4.size] = var_7;
    }

    foreach ( var_7 in level._id_590F )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) )
            var_4[var_4.size] = var_7;
    }

    foreach ( var_7 in level._id_AD8B )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) )
            var_4[var_4.size] = var_7;
    }

    foreach ( var_7 in level._id_D3CC )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) )
            var_4[var_4.size] = var_7;
    }

    foreach ( var_7 in level.players )
    {
        if ( _id_619A( var_7, var_0, var_5, var_2, var_3 ) && scripts\mp\utility\game::_id_9EF0( var_7 ) )
            var_4[var_4.size] = var_7;
    }

    return var_4;
}

_id_619A( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_0.origin;
    var_6 = distancesquared( var_1, var_5 );
    return var_6 < var_2 && ( !var_3 || _id_13C7E( var_1, var_5, var_4, var_0 ) );
}

_id_13C7E( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;
    var_5 = var_1 - var_0;

    if ( lengthsquared( var_5 ) < var_2 * var_2 )
        return 1;

    var_6 = vectornormalize( var_5 );
    var_4 = var_0 + ( var_6[0] * var_2, var_6[1] * var_2, var_6[2] * var_2 );
    var_7 = bullettrace( var_4, var_1, 0, var_3 );

    if ( getdvarint( "scr_damage_debug" ) != 0 || getdvarint( "scr_debugMines" ) != 0 )
    {
        thread _id_4F51( var_0, ".dmg" );

        if ( isdefined( var_3 ) )
            thread _id_4F51( var_1, "." + var_3.classname );
        else
            thread _id_4F51( var_1, ".undefined" );

        if ( var_7["fraction"] == 1 )
            thread _id_4F48( var_4, var_1, ( 1, 1, 1 ) );
        else
        {
            thread _id_4F48( var_4, var_7["position"], ( 1, 0.9, 0.8 ) );
            thread _id_4F48( var_7["position"], var_1, ( 1, 0.4, 0.3 ) );
        }
    }

    return var_7["fraction"] == 1;
}

_id_66B4( var_0 )
{
    self endon( "death" );
    self waittill( "emp_damage", var_1, var_2, var_3, var_4, var_5 );

    if ( isdefined( var_4 ) && var_4 == "emp_grenade_mp" )
    {
        if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_1 ) ) )
            var_1 scripts\mp\missions::_id_D991( "ch_tactical_emp_eqp" );
    }

    _id_66A9();

    if ( isdefined( self.owner ) && isdefined( var_1 ) && self.owner != var_1 )
        var_1 scripts\mp\killstreaks\killstreaks::_id_83A0();

    if ( isdefined( var_0 ) && var_0 )
        _id_51B5();
    else
        self notify( "detonateExplosive" );
}

_id_4D47( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( self._id_9EE7 )
    {
        self._id_4D5B = var_5;
        self._id_0114 thread [[ level.callbackplayerdamage ]]( var_0, var_1, var_2, 0, var_3, var_4, var_5, var_6, "none", 0 );
    }
    else
    {
        if ( self._id_9D26 && ( var_4 == "artillery_mp" || var_4 == "claymore_mp" || var_4 == "stealth_bomb_mp" ) )
            return;

        self._id_0114 notify( "damage", var_2, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ), "MOD_EXPLOSIVE", "", "", "", undefined, var_4 );
    }
}

_id_4F48( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < 600; var_3++ )
        wait 0.05;
}

_id_4F3A( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 16;

    var_4 = 360 / var_3;
    var_5 = [];

    for ( var_6 = 0; var_6 < var_3; var_6++ )
    {
        var_7 = var_4 * var_6;
        var_8 = cos( var_7 ) * var_1;
        var_9 = sin( var_7 ) * var_1;
        var_10 = var_0[0] + var_8;
        var_11 = var_0[1] + var_9;
        var_12 = var_0[2];
        var_5[var_5.size] = ( var_10, var_11, var_12 );
    }

    for ( var_6 = 0; var_6 < var_5.size; var_6++ )
    {
        var_13 = var_5[var_6];

        if ( var_6 + 1 >= var_5.size )
            var_14 = var_5[0];
        else
            var_14 = var_5[var_6 + 1];

        thread _id_4F48( var_13, var_14, var_2 );
    }
}

_id_4F51( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < 600; var_2++ )
        wait 0.05;
}

_id_C5CB( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    self endon( "disconnect" );

    if ( !scripts\mp\utility\game::isreallyalive( self ) )
        return;

    if ( isdefined( var_1 ) && var_1 != "none" )
        var_1 = getweaponbasename( var_1 );

    switch ( var_1 )
    {
        case "cluster_grenade_mp":
            if ( isdefined( var_0 ) && scripts\mp\utility\game::istrue( var_0._id_FC6A ) )
                scripts\mp\shellshock::_id_FC6A( var_2, var_3 );

            break;
        case "concussion_grenade_mp":
            if ( var_3 > 0 )
                thread _id_0A97::_id_C5CB( var_0, var_1, var_2, var_3, var_4 );

            break;
        case "blackout_grenade_mp":
            if ( var_3 > 0 )
            {
                if ( var_2 != "MOD_IMPACT" )
                    scripts\mp\equipment\blackout_grenade::_id_10D6F( var_0.owner, var_0.origin );
            }

            break;
        case "gltacburst_regen":
        case "venomproj_mp":
        case "cryo_mine_mp":
            if ( var_3 > 0 )
            {
                if ( var_2 != "MOD_IMPACT" )
                {
                    if ( isdefined( var_0 ) )
                    {
                        if ( isdefined( var_0._id_110E8 ) )
                        {
                            if ( _id_0DC9::_id_A69F( var_0._id_110E8, "passive_increased_frost" ) )
                                scripts\mp\equipment\cryo_mine::_id_4ACF( var_4, 3 );
                            else
                                scripts\mp\equipment\cryo_mine::_id_4ACF( var_4 );
                        }
                        else
                            scripts\mp\equipment\cryo_mine::_id_4ACF( var_4 );
                    }
                }
            }

            break;
        case "weapon_cobra_mk19_mp":
            break;
        case "iw7_glprox_mp":
            break;
        case "shard_ball_mp":
            break;
        case "splash_grenade_mp":
            break;
        case "pulse_grenade_mp":
            scripts\mp\equipment\pulse_grenade::_id_DAF4();
            break;
        case "minijackal_strike_mp":
            break;
        case "groundpound_mp":
            scripts\mp\equipment\ground_pound::groundpound_victimimpacteffects( var_4, self, var_1, var_0 );
            break;
        case "gltacburst_big":
        case "gltacburst":
            if ( var_3 > 0 )
                thread _id_0AA4::_id_C5CB( var_0, var_1, var_2, var_3, var_4 );

            break;
        default:
            scripts\mp\shellshock::_id_FC6A( var_2, var_3 );
            break;
    }
}

_id_9F0E( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( weaponinventorytype( var_0 ) != "primary" )
        return 0;

    switch ( weaponclass( var_0 ) )
    {
        case "mg":
        case "rifle":
        case "spread":
        case "rocketlauncher":
        case "sniper":
        case "smg":
        case "pistol":
            return 1;
        default:
            return 0;
    }
}

_id_9D75( var_0 )
{
    if ( var_0 == "none" || _id_9F2D( var_0 ) || _id_9E6D( var_0 ) )
        return 0;

    switch ( weaponclass( var_0 ) )
    {
        case "mg":
        case "rifle":
        case "spread":
        case "sniper":
        case "smg":
        case "pistol":
            return 1;
        default:
            return 0;
    }
}

_id_9E6D( var_0 )
{
    return scripts\mp\utility\game::_id_8234( var_0 ) == "iw7_knife";
}

isballweapon( var_0 )
{
    return scripts\mp\utility\game::_id_8234( var_0 ) == "iw7_uplinkball" || scripts\mp\utility\game::_id_8234( var_0 ) == "iw7_tdefball";
}

isaxeweapon( var_0 )
{
    return scripts\mp\utility\game::_id_8234( var_0 ) == "iw7_axe";
}

_id_9D3E( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return weaponinventorytype( var_0 ) == "altmode";
}

_id_9E56( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return weaponinventorytype( var_0 ) == "item";
}

_id_9F5D( var_0 )
{
    return isdefined( var_0 ) && scripts\mp\utility\game::_id_8234( var_0 ) == "iw7_emc";
}

_id_9F2D( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return weapontype( var_0 ) == "riotshield";
}

_id_9EC0( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return weaponinventorytype( var_0 ) == "offhand";
}

_id_9F54( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( weaponinventorytype( var_0 ) != "primary" )
        return 0;

    return weaponclass( var_0 ) == "pistol";
}

_id_9E18( var_0 )
{
    var_1 = weaponclass( var_0 );

    if ( var_1 != "grenade" )
        return 0;

    var_2 = weaponinventorytype( var_0 );

    if ( var_2 != "offhand" )
        return 0;

    return 1;
}

_id_9FA9( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    return issubstr( var_0, "throwingknife" );
}

_id_12F0A()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    var_0 = self._id_4C16;

    if ( isdefined( self._id_EB6D ) )
        var_0 = self._id_EB6D;

    self._id_EB6B = var_0;
    self._id_EB6C = var_0;

    for (;;)
    {
        self waittill( "weapon_change", var_1 );
        self._id_EB6C = var_1;

        if ( var_1 == "none" )
            continue;
        else if ( scripts\mp\utility\game::_id_9F8D( var_1 ) )
        {
            _id_12ED5();
            continue;
        }
        else if ( scripts\mp\utility\game::_id_9E6C( var_1 ) )
            continue;
        else
        {
            var_2 = weaponinventorytype( var_1 );

            if ( var_2 != "primary" && var_2 != "altmode" )
                continue;
        }

        _id_12ED5();
        self._id_EB6B = var_0;
        var_0 = var_1;
    }
}

_id_61AD( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    thread _id_41AB();
}

_id_41AB()
{
    self endon( "disconnect" );
    self waittill( "death" );
}

_id_8237()
{
    var_0 = 2.0;
    self._id_13CA0 = self getweaponslistprimaries();

    if ( self._id_13CA0.size )
    {
        foreach ( var_2 in self._id_13CA0 )
        {
            if ( scripts\mp\utility\game::_id_9F8D( var_2 ) )
                var_3 = scripts\mp\supers::_id_7FD0( var_2 );
            else if ( scripts\mp\utility\game::_id_9E0D( var_2 ) )
                var_3 = _id_7ECD( var_2 );
            else
                var_3 = _id_8236( var_2 );

            if ( !isdefined( var_3 ) || var_3 == 0 )
                continue;

            if ( var_3 < var_0 )
                var_0 = var_3;
        }
    }
    else
        var_0 = 0.94;

    var_0 = _id_4001( var_0 );
    return var_0;
}

_id_8236( var_0 )
{
    var_1 = scripts\mp\utility\game::_id_8234( var_0 );
    return level._id_13CA5[var_1]._id_02B3;
}

_id_7ECD( var_0 )
{
    return 1.0;
}

_id_4001( var_0 )
{
    return clamp( var_0, 0.0, 1.0 );
}

_id_12F58( var_0 )
{
    if ( isdefined( var_0 ) )
        self._id_1339E = var_0;

    if ( isdefined( self._id_C7E8 ) )
        var_0 = self._id_C7E8;
    else if ( scripts\mp\utility\game::_id_12D6( "specialty_distance_kit" ) )
        var_0 = 0.05;
    else if ( isdefined( self._id_C826 ) )
    {
        if ( ( weaponclass( self getcurrentweapon() ) == "sniper" || issubstr( self getcurrentweapon(), "iw7_udm45_mpl" ) || issubstr( self getcurrentweapon(), "iw7_longshot_mp" ) ) && isdefined( self.overrideviewkickscalesniper ) )
            var_0 = self.overrideviewkickscalesniper;
        else
            var_0 = self._id_C826;
    }
    else if ( isdefined( self._id_1339E ) )
        var_0 = self._id_1339E;
    else
        var_0 = 1.0;

    var_0 = clamp( var_0, 0.0, 1.0 );
    self _meth_8368( var_0 );
}

_id_12ED5()
{
    var_0 = undefined;

    if ( isdefined( self._id_D42F ) )
    {
        var_0 = 1.0;
        var_0 += self._id_D42F;
    }
    else
    {
        var_0 = _id_807F( self );

        if ( isdefined( self._id_C829 ) )
            var_0 = self._id_C829;

        var_1 = self._id_3E6B;

        if ( isdefined( var_1 ) && isdefined( var_1._id_109AE ) )
            var_0 += var_1._id_109AE;

        if ( isdefined( self._id_13CB2 ) )
            var_0 += self._id_13CB2;

        if ( isdefined( self._id_13CB3 ) )
            var_0 += self._id_13CB3;

        var_0 += scripts\mp\perks\weaponpassives::passivecolddamagegetspeedmod( self );

        if ( isdefined( self.weaponpassivefastrechamberspeedmod ) )
            var_0 += self.weaponpassivefastrechamberspeedmod;

        if ( isdefined( self.speedonkillmod ) )
            var_0 += self.speedonkillmod;
    }

    self._id_13CCF = var_0;

    if ( !isdefined( self._id_440B ) )
        self._id_440B = 1;

    var_0 += self._id_BCF6 - 1.0;
    var_0 += self._id_440B - 1.0;
    var_0 = clamp( var_0, 0.0, 1.08 );

    if ( isdefined( self.fastcrouchspeedmod ) )
        var_0 += self.fastcrouchspeedmod;

    self setmovespeedscale( var_0 );
}

_id_807F( var_0 )
{
    var_1 = 1.0;
    self._id_13CA0 = self getweaponslistprimaries();

    if ( !self._id_13CA0.size )
        var_1 = 0.94;
    else
    {
        var_2 = self getcurrentweapon();

        if ( scripts\mp\utility\game::_id_9F8D( var_2 ) )
            var_1 = scripts\mp\supers::_id_7FD0( var_2 );
        else if ( scripts\mp\utility\game::_id_9E0D( var_2 ) )
            var_1 = _id_7ECD( var_2 );
        else if ( scripts\mp\utility\game::_id_9E6C( var_2 ) )
            var_1 = 0.94;
        else if ( issubstr( var_2, "iw7_mauler_mpl_damage" ) )
            var_1 = 0.87;
        else if ( issubstr( var_2, "iw7_udm45_mpl" ) )
            var_1 = 0.95;
        else if ( issubstr( var_2, "iw7_rvn" ) && self _meth_8519( var_2 ) )
            var_1 = 1.0;
        else if ( issubstr( var_2, "iw7_longshot" ) && self _meth_8519( var_2 ) )
            var_1 = 0.98;
        else
        {
            var_3 = weaponinventorytype( var_2 );

            if ( var_3 != "primary" && var_3 != "altmode" )
            {
                if ( isdefined( self._id_EB6B ) )
                    var_2 = self._id_EB6B;
                else
                    var_2 = undefined;
            }

            if ( !isdefined( var_2 ) || !self hasweapon( var_2 ) )
                var_1 = _id_8237();
            else
                var_1 = _id_8236( var_2 );
        }
    }

    var_1 = _id_4001( var_1 );
    return var_1;
}

_id_10B5E()
{
    if ( !isplayer( self ) )
        return;

    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self notifyonplayercommand( "adjustedStance", "+stance" );
    self notifyonplayercommand( "adjustedStance", "+goStand" );

    if ( !level._id_4542 && !isai( self ) )
    {
        self notifyonplayercommand( "adjustedStance", "+togglecrouch" );
        self notifyonplayercommand( "adjustedStance", "toggleprone" );
        self notifyonplayercommand( "adjustedStance", "+movedown" );
        self notifyonplayercommand( "adjustedStance", "-movedown" );
        self notifyonplayercommand( "adjustedStance", "+prone" );
        self notifyonplayercommand( "adjustedStance", "-prone" );
    }

    for (;;)
    {
        scripts\engine\utility::waittill_any( "adjustedStance", "sprint_begin", "weapon_change" );
        wait 0.5;

        if ( isdefined( self._id_C53B ) && self._id_C53B )
            continue;

        var_0 = self getstance();
        _id_10B5F( var_0 );
    }
}

_id_10B5F( var_0 )
{
    var_1 = self getcurrentprimaryweapon();
    var_2 = 0;

    if ( _id_9F1C( var_1 ) )
        var_2 = _id_80E2();

    if ( var_0 == "prone" )
    {
        var_3 = scripts\mp\utility\game::_id_8225( var_1 );

        if ( var_3 == "weapon_lmg" )
        {
            scripts\mp\utility\game::_id_F817( 0, 0 );
            return;
        }

        if ( var_3 == "weapon_sniper" )
        {
            if ( issubstr( var_1, "barrelbored" ) )
            {
                scripts\mp\utility\game::_id_F817( 0, 0 + var_2 );
                return;
            }

            scripts\mp\utility\game::_id_F817( 0, 0 + var_2 );
            return;
            return;
        }

        scripts\mp\utility\game::_id_F817();
        return;
        return;
    }
    else if ( var_0 == "crouch" )
    {
        var_3 = scripts\mp\utility\game::_id_8225( var_1 );

        if ( var_3 == "weapon_lmg" )
        {
            scripts\mp\utility\game::_id_F817( 0, 0 );
            return;
        }

        if ( var_3 == "weapon_sniper" )
        {
            if ( issubstr( var_1, "barrelbored" ) )
            {
                scripts\mp\utility\game::_id_F817( 0, 0 + var_2 );
                return;
            }

            scripts\mp\utility\game::_id_F817( 0, 0 + var_2 );
            return;
            return;
        }

        scripts\mp\utility\game::_id_F817();
        return;
        return;
    }
    else if ( var_2 > 0 )
        scripts\mp\utility\game::_id_F817( 0, var_2 );
    else
        scripts\mp\utility\game::_id_F817();
}

_id_F21A( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_0._id_13C2E ) )
        return;

    var_0._id_C731 = self;
    var_0 waittill( "missile_stuck", var_1 );
    var_0 thread scripts\mp\shellshock::_id_858A();

    if ( isplayer( var_1 ) || isagent( var_1 ) )
        _id_85DD( var_0, var_1 );

    var_0 _id_69FF( undefined );
}

_id_12A13()
{
    for (;;)
    {
        self waittill( "trigger", var_0 );
        thread _id_12A1F( var_0 );
    }
}

_id_12A1F( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 notify( "weapon_change", "none" );
    self waittill( "turret_deactivate" );
    var_0 notify( "weapon_change", var_0 getcurrentweapon() );
}

_id_108E3( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = ( 0, randomfloat( 360 ), 0 );

    var_5 = level._id_13C7D[var_2];
    var_6 = spawn( "script_model", var_0 );
    var_6.angles = var_4;
    var_6 setmodel( var_5._id_01F1 );
    var_6.owner = var_1;
    var_6 _meth_831F( var_1 );
    var_6._id_13C2E = var_2;
    var_6._id_451C = var_5;
    var_6._id_A640 = ( 0, 0, 4 );
    var_6._id_A63A = spawn( "script_model", var_6.origin + var_6._id_A640 );
    var_6._id_A63A setscriptmoverkillcam( "explosive" );
    var_7 = scripts\mp\utility\game::_id_7E9D( var_2 );

    if ( !isdefined( var_7 ) )
        var_7 = "lethal";

    if ( var_7 == "lethal" )
        var_1 _id_C54E( var_6, var_3 );
    else if ( var_7 == "tactical" )
        var_1 _id_C5AC( var_6, var_3 );
    else
    {

    }

    if ( isdefined( var_5._id_2C68 ) )
        var_6 thread _id_4988( var_5._id_2C68, "tag_origin", var_1 );

    if ( isdefined( var_5._id_B760 ) )
        var_6 thread _id_57EB( "tag_fx", var_5._id_B760["friendly"], var_5._id_B760["enemy"] );

    var_6 thread _id_F692( var_1.pers["team"], var_5._id_8C7A );
    var_8 = undefined;

    if ( self != level )
        var_8 = self _meth_8138();

    var_6 _id_69FF( var_8 );
    var_6 thread _id_B778( var_8 );
    var_6 thread scripts\mp\shellshock::_id_858A();
    var_6 thread _id_B77A();
    var_6 scripts\mp\sentientpoolmanager::registersentient( "Lethal_Static", var_1, 1 );
    var_6 thread _id_B770();
    var_6 thread _id_66B4( 1 );
    var_6 thread scripts\mp\perks\perk_equipmentping::_id_E84B();
    thread _id_C798( var_6, var_1 );
    level thread _id_B9CA( var_1, var_6 );
    return var_6;
}

_id_108E7( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = ( 0, randomfloat( 360 ), 0 );

    var_5 = level._id_13C7D[var_2];
    var_6 = spawn( "script_model", var_0 );
    var_6.angles = var_4;
    var_6 setmodel( var_5._id_01F1 );
    var_6.owner = var_1;
    var_6 _meth_831F( var_1 );
    var_6._id_13C2E = var_2;
    var_6._id_451C = var_5;
    var_1 _id_C5AC( var_6, var_3 );
    var_6 thread _id_4988( var_5._id_2C68, "tag_origin", var_1 );
    var_6 thread _id_F692( var_1.pers["team"], var_5._id_8C7A );
    var_7 = undefined;

    if ( self != level )
        var_7 = self _meth_8138();

    var_6 _id_69FF( var_7, 1 );
    var_6 thread _id_B778( var_7 );
    var_6 thread scripts\mp\shellshock::_id_858A();
    var_6 thread _id_BBC4();
    var_6 scripts\mp\sentientpoolmanager::registersentient( "Lethal_Static", var_1 );
    var_6 thread _id_B77D();
    level thread _id_B9CA( var_1, var_6 );
    return var_6;
}

_id_108E5( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_4 ) )
        var_4 = ( 0, randomfloat( 360 ), 0 );

    var_7 = level._id_13C7D[var_2];
    var_8 = spawn( "script_model", var_0 );
    var_8.angles = var_4;
    var_8 setmodel( var_7._id_01F1 );
    var_8.owner = var_1;
    var_8 _meth_831F( var_1 );
    var_8._id_13C2E = var_2;
    var_8._id_451C = var_7;

    if ( isdefined( var_5 ) )
        var_8._id_AC75 = var_5;
    else
        var_8._id_AC75 = 45;

    var_1 _id_C5AC( var_8, var_3 );
    var_8 thread _id_4988( var_7._id_2C68, "tag_origin", var_1 );
    var_8 thread _id_F692( var_1.pers["team"], var_7._id_8C7A );
    var_9 = undefined;

    if ( self != level )
        var_9 = self _meth_8138();

    var_8 _id_69FF( var_9, 1 );
    var_8 thread _id_B778( var_9 );
    var_8 thread scripts\mp\shellshock::_id_858A();
    var_8 scripts\mp\sentientpoolmanager::registersentient( "Tactical_Static", var_1 );
    var_8 thread _id_B8F6();
    level thread _id_B9CA( var_1, var_8 );
    var_8 thread _id_D501();
    var_8 thread _id_139F0();

    if ( isdefined( var_6 ) && var_6 )
    {
        var_8 _id_B2A5();
        var_8 thread _id_B76A();
    }

    return var_8;
}

_id_139F5()
{
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    self waittill( "missile_stuck" );
    thread _id_E845( var_0, self.origin );
}

_id_E845( var_0, var_1 )
{
    var_2 = spawn( "trigger_radius", var_1, 0, 128, 135 );
    var_2.owner = var_0;
    var_3 = 128;
    var_4 = spawnfx( scripts\engine\utility::_id_7ECB( "distortion_field_cloud" ), var_1 );
    triggerfx( var_4 );
    var_5 = 8.0;

    foreach ( var_7 in level.players )
    {
        var_7._id_9E44 = 0;
        var_7 thread _id_20C2( var_2 );
    }

    while ( var_5 > 0.0 )
    {
        foreach ( var_7 in level.players )
        {
            if ( var_7 istouching( var_2 ) && !var_7._id_9E44 )
                var_7 thread _id_20C2( var_2 );
        }

        wait 0.2;
        var_5 -= 0.2;
    }

    foreach ( var_7 in level.players )
    {
        var_7 notify( "distortion_field_ended" );

        foreach ( var_14 in level.players )
            var_7 _meth_8388( var_14 );
    }

    var_4 delete();
    self delete();
    wait 2.0;
    var_2 delete();
}

_id_20C2( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );

    while ( isdefined( var_0 ) && self istouching( var_0 ) && !scripts\mp\killstreaks\emp_common::_id_9D29() )
    {
        self setblurforplayer( 4, 1 );
        self._id_9E44 = 1;
        thread _id_B9CF();

        foreach ( var_2 in level.players )
            self _meth_8429( var_2 );

        scripts\engine\utility::_id_13736( 1.4, "emp_damage" );

        foreach ( var_2 in level.players )
            self _meth_8388( var_2 );

        wait 0.1;
    }

    self setblurforplayer( 0, 0.25 );
    self._id_9E44 = 0;

    foreach ( var_2 in level.players )
        var_2 _meth_8388( var_2 );
}

_id_B9CF()
{
    self endon( "distortion_field_ended" );
    var_0 = 0;

    while ( !var_0 )
    {
        var_0 = scripts\mp\killstreaks\emp_common::_id_9D29();
        scripts\engine\utility::waitframe();
    }

    self notify( "emp_damage" );
}

_id_10910( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = ( 0, randomfloat( 360 ), 0 );

    var_5 = level._id_13C7D[var_2];
    var_6 = spawn( "script_model", var_0 );
    var_6.angles = var_4;
    var_6 setmodel( var_5._id_01F1 );
    var_6.owner = var_1;
    var_6 _meth_831F( var_1 );
    var_6._id_13C2E = var_2;
    var_6._id_451C = var_5;
    var_1 _id_C5AC( var_6, var_3 );
    var_6 thread _id_4988( var_5._id_2C68, "tag_origin", var_1 );
    var_6 thread _id_F692( var_1.pers["team"], var_5._id_8C7A );
    var_6 thread _id_10413( var_1, var_6, var_6._id_13C2E );
    var_6._id_AC75 = 15;
    var_6 thread _id_139F0( 0 );
    var_1 notify( "sonic_sensor_used" );
    var_7 = undefined;

    if ( self != level )
        var_7 = self _meth_8138();

    var_6 _id_69FF( var_7, 1 );
    var_6 thread scripts\mp\shellshock::_id_858A();
    var_6 thread _id_BBC4();
    var_6 scripts\mp\sentientpoolmanager::registersentient( "Tactical_Static", var_1 );
    var_6 thread _id_B77D();
    var_6 thread _id_10412();
    level thread _id_B9CA( var_1, var_6 );
    return var_6;
}

_id_10412()
{
    scripts\engine\utility::waittill_any( "death", "mine_destroyed" );
    self.owner notify( "sonic_sensor_update" );

    foreach ( var_1 in self.owner._id_CC4D )
    {
        if ( isdefined( var_1 ) && var_1._id_13C2E == "sonic_sensor_mp" )
        {
            var_1 _id_51B5();
            scripts\engine\utility::array_remove( self.owner._id_CC4D, var_1 );
        }
    }
}

_id_139F0( var_0 )
{
    self endon( "death" );

    while ( self._id_AC75 > 0 )
    {
        self._id_AC75--;
        wait 1;
    }

    self playsound( self._id_451C._id_C525 );
    var_1 = self gettagorigin( "tag_origin" );
    playfx( self._id_451C._id_C526, var_1 );

    if ( isdefined( self._id_451C._id_127BF ) )
    {
        self._id_451C._id_127BF._id_DBD8 = undefined;
        self._id_451C._id_127BF = undefined;
    }

    if ( !isdefined( var_0 ) || var_0 )
        self _meth_8079();

    _id_51B5();
}

_id_66AA( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        switch ( var_0 )
        {
            case "cryo_mine_mp":
                return 1;
        }

        if ( var_1 == "MOD_IMPACT" )
        {
            switch ( var_0 )
            {
                case "trip_mine_mp":
                case "splash_grenade_mp":
                case "c4_mp":
                    return 1;
            }
        }
        else
        {
            switch ( var_0 )
            {
                case "gltacburst_regen":
                case "gltacburst_big":
                case "gltacburst":
                case "blackout_grenade_mp":
                case "concussion_grenade_mp":
                    return 1;
            }
        }
    }

    return 0;
}

_id_51A7()
{
    if ( isdefined( level._id_85D5 ) )
    {
        foreach ( var_1 in level._id_85D5 )
        {
            if ( isdefined( var_1 ) && !scripts\mp\utility\game::istrue( var_1._id_69BA ) && !_id_9EE5( var_1 ) )
                var_1 delete();
        }
    }

    if ( isdefined( level._id_B898 ) )
    {
        foreach ( var_4 in level._id_B898 )
        {
            if ( isdefined( var_4 ) && !scripts\mp\utility\game::istrue( var_4._id_69BA ) && !_id_9EE5( var_4 ) )
                var_4 delete();
        }
    }
}

minegettwohitthreshold()
{
    return 80;
}

_id_B76A()
{
    self endon( "mine_triggered" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self setcandamage( 1 );
    self.maxhealth = 100000;
    self.health = self.maxhealth;
    var_0 = undefined;
    var_1 = self.owner scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" );
    var_2 = scripts\engine\utility::ter_op( var_1, 2, 1 );
    var_3 = scripts\engine\utility::ter_op( var_1, "hitequip", "" );

    for (;;)
    {
        self waittill( "damage", var_4, var_0, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16 );
        var_12 = scripts\mp\utility\game::_id_13CA1( var_12, var_16 );

        if ( !isplayer( var_0 ) && !isagent( var_0 ) )
            continue;

        if ( isdefined( var_12 ) && isendstr( var_12, "betty_mp" ) )
            continue;

        if ( !_id_7415( self.owner, var_0 ) )
            continue;

        if ( isballweapon( var_12 ) )
            continue;

        if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_0 ) )
            continue;

        if ( _id_66AA( var_12, var_7 ) )
            continue;

        var_17 = scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_9DFF( var_12, var_7 ) || var_4 >= 80, 2, 1 );
        var_2 -= var_17;
        _id_0AE2::equipmenthit( self.owner, var_0, var_12, var_7 );

        if ( var_2 <= 0 )
            break;
        else
            var_0 scripts\mp\damagefeedback::updatedamagefeedback( var_3 );
    }

    self notify( "mine_destroyed" );

    if ( isdefined( var_7 ) && ( issubstr( var_7, "MOD_GRENADE" ) || issubstr( var_7, "MOD_EXPLOSIVE" ) ) )
        self._id_13908 = 1;

    if ( isdefined( var_11 ) && var_11 & level.idflags_penetration )
        self._id_1390E = 1;

    if ( isdefined( var_11 ) && var_11 & level.idflags_no_team_protection )
        self._id_1390F = 1;

    self._id_1390B = 1;

    if ( isdefined( var_0 ) )
        self._id_4D3F = var_0;

    if ( isdefined( self._id_A63A ) )
        self._id_A63A._id_4D3F = var_0;

    if ( isplayer( var_0 ) )
    {
        var_0 scripts\mp\damagefeedback::updatedamagefeedback( var_3 );

        if ( var_0 != self.owner && var_0.team != self.owner.team )
            var_0 scripts\mp\killstreaks\killstreaks::_id_83A0();
    }

    if ( level.teambased )
    {
        if ( isdefined( var_0 ) && isdefined( var_0.pers["team"] ) && isdefined( self.owner ) && isdefined( self.owner.pers["team"] ) )
        {
            if ( var_0.pers["team"] != self.owner.pers["team"] )
                var_0 notify( "destroyed_equipment" );
        }
    }
    else if ( isdefined( self.owner ) && isdefined( var_0 ) && var_0 != self.owner )
        var_0 notify( "destroyed_equipment" );

    scripts\mp\missions::minedestroyed( self, var_0, var_7 );
    self notify( "detonateExplosive", var_0 );
}

_id_B778( var_0, var_1 )
{
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self endon( "disabled" );
    var_2 = self._id_451C;
    wait( var_2._id_226E );

    if ( isdefined( var_2._id_B760 ) )
        thread _id_57EB( "tag_fx", var_2._id_B760["friendly"], var_2._id_B760["enemy"] );

    var_3 = scripts\engine\utility::ter_op( isdefined( var_2._id_B76F ), var_2._id_B76F, level._id_B76F );
    var_4 = scripts\engine\utility::ter_op( isdefined( var_2._id_B76E ), var_2._id_B76E, level._id_B76E );
    var_5 = spawn( "trigger_radius", self.origin, 0, var_3, var_4 );
    var_5.owner = self;
    thread _id_B76C( var_5 );

    if ( isdefined( var_0 ) )
    {
        var_5 _meth_80D2();
        var_5 linkto( var_0 );
    }

    self._id_4D2A = var_5;
    var_6 = undefined;

    for (;;)
    {
        var_5 waittill( "trigger", var_6 );

        if ( !isdefined( var_6 ) )
            continue;

        if ( !scripts\mp\equipment\phase_shift::_id_213D( self, var_6 ) )
            continue;

        if ( getdvarint( "scr_minesKillOwner" ) != 1 )
        {
            if ( isdefined( self.owner ) )
            {
                if ( var_6 == self.owner )
                    continue;

                if ( isdefined( var_6.owner ) && var_6.owner == self.owner )
                    continue;
            }

            if ( !_id_7415( self.owner, var_6, 0 ) )
                continue;
        }

        if ( lengthsquared( var_6 getentityvelocity() ) < 10 )
            continue;

        if ( self._id_13C2E == "mobile_radar_mp" && !_id_B8F7( var_6 ) )
            continue;

        if ( isdefined( var_1 ) && var_1 || var_6 _meth_808F( self.origin, self ) > 0 )
            break;
    }

    self notify( "mine_triggered" );
    self._id_451C._id_127BF = var_6;

    if ( isdefined( self._id_451C._id_C5B4 ) )
        self playsound( self._id_451C._id_C5B4 );

    _id_6A08( var_6, level._id_B76D, "mine" );
    self thread [[ self._id_451C._id_C5B3 ]]();
}

_id_B76C( var_0 )
{
    scripts\engine\utility::waittill_any( "mine_triggered", "mine_destroyed", "mine_selfdestruct", "death" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_BBC4()
{
    self endon( "mine_triggered" );
    self endon( "death" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        _id_66A9();
        _id_11061();

        if ( isdefined( self._id_4D2A ) )
            self._id_4D2A delete();

        self._id_55BA = 1;
        self notify( "disabled" );
        wait( var_1 );

        if ( isdefined( self ) )
        {
            self._id_55BA = undefined;
            self notify( "enabled" );
            var_2 = self _meth_8138();
            thread _id_B778( var_2 );
        }
    }
}

_id_B77A()
{
    self endon( "mine_triggered" );
    self endon( "mine_destroyed" );
    self endon( "death" );
    wait( level._id_B77B + randomfloat( 0.4 ) );
    self notify( "mine_selfdestruct" );
    self notify( "detonateExplosive" );
}

_id_B764()
{
    self playsound( self._id_451C._id_C54C );
    playfx( level._id_B762, self.origin );

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    var_0 = self.origin + ( 0, 0, 64 );
    self moveto( var_0, 0.7, 0, 0.65 );
    self._id_A63A moveto( var_0 + self._id_A640, 0.7, 0, 0.65 );
    self rotatevelocity( ( 0, 750, 32 ), 0.7, 0, 0.65 );
    thread _id_D537();
    wait 0.65;
    self notify( "detonateExplosive" );
}

_id_B770()
{
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "detonateExplosive", var_0 );

    if ( !isdefined( self ) || !isdefined( self.owner ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = self.owner;

    var_1 = self._id_451C;
    var_2 = var_1._id_13370;

    if ( !isdefined( var_2 ) )
        var_2 = "tag_fx";

    var_3 = self gettagorigin( var_2 );

    if ( !isdefined( var_3 ) )
        var_3 = self gettagorigin( "tag_origin" );

    self notify( "explode", var_3 );
    wait 0.05;

    if ( !isdefined( self ) || !isdefined( self.owner ) )
        return;

    self hide();

    if ( isdefined( var_1._id_C524 ) )
        self thread [[ var_1._id_C524 ]]();

    if ( isdefined( var_1._id_C525 ) )
        self playsound( var_1._id_C525 );

    var_4 = scripts\engine\utility::ter_op( isdefined( var_1._id_C526 ), var_1._id_C526, level._id_B761 );
    playfx( var_4, var_3 );
    var_5 = scripts\engine\utility::ter_op( isdefined( var_1._id_B769 ), var_1._id_B769, level._id_B769 );
    var_6 = scripts\engine\utility::ter_op( isdefined( var_1._id_B768 ), var_1._id_B768, level._id_B768 );
    var_7 = scripts\engine\utility::ter_op( isdefined( var_1._id_B76B ), var_1._id_B76B, level._id_B76B );

    if ( var_6 > 0 )
        self _meth_8253( self.origin, var_7, var_6, var_5, var_0, "MOD_EXPLOSIVE", self._id_13C2E );

    if ( isdefined( self.owner ) )
        self.owner thread scripts\mp\utility\game::leaderdialogonplayer( "mine_destroyed", undefined, undefined, self.origin );

    wait 0.2;
    _id_51B5();
}

_id_B77C()
{
    self playsound( self._id_451C._id_C54C );
    playfx( self._id_451C._id_AABB, self.origin );

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    self _meth_8187( "tag_sensor" );
    _id_11061();
    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0 setmodel( self._id_451C._id_01F1 );
    var_0 _meth_8187( "tag_base" );
    var_0._id_451C = self._id_451C;
    self._id_F232 = var_0;
    var_1 = self.origin + ( 0, 0, self._id_451C._id_AAB0 );
    var_2 = self._id_451C._id_AAB7;
    var_3 = self._id_451C._id_AAB7 + 0.1;
    var_0 moveto( var_1, var_3, 0, var_2 );
    var_0 rotatevelocity( ( 0, 1100, 32 ), var_3, 0, var_2 );
    var_0 thread _id_D537();
    wait( var_2 );
    self notify( "detonateExplosive" );
}

_id_B77D()
{
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "detonateExplosive", var_0 );

    if ( !isdefined( self ) || !isdefined( self.owner ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = self.owner;

    self playsound( self._id_451C._id_C525 );
    var_1 = undefined;

    if ( isdefined( self._id_F232 ) )
        var_1 = self._id_F232 gettagorigin( "tag_sensor" );
    else
        var_1 = self gettagorigin( "tag_origin" );

    playfx( self._id_451C._id_C526, var_1 );
    scripts\engine\utility::waitframe();

    if ( !isdefined( self ) || !isdefined( self.owner ) )
        return;

    if ( isdefined( self._id_F232 ) )
        self._id_F232 delete();
    else
        self _meth_8187( "tag_sensor" );

    self.owner thread scripts\mp\damagefeedback::updatedamagefeedback( "hitmotionsensor" );
    var_2 = [];

    foreach ( var_4 in level._id_3CB5 )
    {
        if ( var_4.team == self.owner.team )
            continue;

        if ( !scripts\mp\utility\game::isreallyalive( var_4 ) )
            continue;

        if ( var_4 scripts\mp\utility\game::_id_12D6( "specialty_heartbreaker" ) )
            continue;

        if ( distance2d( self.origin, var_4.origin ) < 300 )
            var_2[var_2.size] = var_4;
    }

    foreach ( var_7 in var_2 )
    {
        thread _id_B37F( var_7, self.owner );
        level thread _id_F236( var_7, self.owner );
    }

    if ( var_2.size > 0 )
    {
        self.owner scripts\mp\missions::_id_D992( "ch_motiondetected", var_2.size );
        self.owner thread scripts\mp\gamelogic::_id_117B7( "motion_sensor", 1, "hits" );
    }

    if ( isdefined( self.owner ) )
        self.owner thread scripts\mp\utility\game::leaderdialogonplayer( "mine_destroyed", undefined, undefined, self.origin );

    wait 0.2;
    _id_51B5();
}

_id_B37F( var_0, var_1 )
{
    if ( var_0 == var_1 )
        return;

    var_0 endon( "disconnect" );
    var_2 = undefined;

    if ( level.teambased )
        var_2 = scripts\mp\utility\game::_id_C795( var_0, "orange", var_1.team, 0, 0, "equipment" );
    else
        var_2 = scripts\mp\utility\game::_id_C794( var_0, "orange", var_1, 0, 0, "equipment" );

    var_0 thread scripts\mp\damagefeedback::updatedamagefeedback( "hitmotionsensor" );
    scripts\mp\gamescore::_id_11ACE( var_1, var_0, "motion_sensor_mp" );
    var_0 scripts\engine\utility::_id_13736( self._id_451C._id_B371, "death" );
    scripts\mp\gamescore::_id_12D6F( var_1, var_0, "motion_sensor_mp" );
    scripts\mp\utility\game::_id_C78F( var_2, var_0 );
}

_id_F236( var_0, var_1 )
{
    if ( var_0 == var_1 )
        return;

    if ( isai( var_0 ) )
        return;

    var_2 = "coup_sunblind";
    var_0 setclientomnvar( "ui_hud_shake", 1 );
    var_0 visionsetnakedforplayer( var_2, 0.05 );
    wait 0.05;
    var_0 visionsetnakedforplayer( var_2, 0 );
    var_0 visionsetnakedforplayer( "", 0.5 );
}

_id_B8F5()
{
    self playsound( self._id_451C._id_C54C );
    playfx( self._id_451C._id_AABB, self.origin );

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    _id_11061();
    var_0 = self.origin + ( 0, 0, self._id_451C._id_AAB0 );
    var_1 = self._id_451C._id_AAB7;
    var_2 = self._id_451C._id_AAB7 + 0.1;
    self moveto( var_0, var_2, 0, var_1 );
    self rotatevelocity( ( 0, 1100, 32 ), var_2, 0, var_1 );
    thread _id_D537();
    wait( var_1 );
    self notify( "detonateExplosive" );
}

_id_B8F6()
{
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "detonateExplosive", var_0 );

    if ( !isdefined( self ) || !isdefined( self.owner ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = self.owner;

    self playsound( self._id_451C._id_C525 );
    var_1 = self gettagorigin( "tag_origin" );
    playfx( self._id_451C._id_C526, var_1 );
    scripts\engine\utility::waitframe();

    if ( !isdefined( self ) || !isdefined( self.owner ) )
        return;

    if ( isdefined( self._id_451C._id_127BF ) )
    {
        var_2 = self._id_451C._id_127BF;
        var_2._id_DBD8 = 1;
        var_2 _id_10DC5( self );
    }

    if ( isdefined( self.owner ) )
    {
        self.owner thread scripts\mp\utility\game::leaderdialogonplayer( "mine_destroyed", undefined, undefined, self.origin );
        self.owner scripts\mp\damagefeedback::updatedamagefeedback( "hitmotionsensor" );
    }

    wait 0.2;
    _id_51B5();
}

_id_10DC5( var_0 )
{
    var_1 = self gettagorigin( "tag_shield_back" );
    var_2 = spawn( "script_model", var_1 );
    var_2 setmodel( "weapon_mobile_radar_back" );
    var_2._id_AC75 = var_0._id_AC75;
    var_2.owner = var_0.owner;
    var_2._id_451C = var_0._id_451C;
    var_2 linkto( self, "tag_shield_back", ( 0, 0, 0 ), ( 0, 90, 90 ) );
    var_2 thread _id_D501( self );
    var_2 thread _id_4988( var_0._id_451C._id_2C68, "tag_origin", var_0.owner );
    var_2 thread _id_B76A();
    var_2 thread _id_13B1A( self, var_0 );
    var_2 thread _id_13B1B( self, var_0 );
    var_2 thread _id_139F0();
}

_id_D501( var_0 )
{
    self endon( "death" );
    var_1 = self gettagorigin( "tag_fx" );
    var_2 = spawn( "script_model", var_1 );
    var_2 setmodel( "tag_origin" );
    var_2 linkto( self, "tag_fx", ( 0, 0, 0 ), ( 90, 0, -90 ) );
    var_2 thread _id_13A0F( self );

    for (;;)
    {
        wait 2;
        playfxontag( self._id_451C._id_C4C5, var_2, "tag_origin" );

        if ( isdefined( var_0 ) )
        {
            var_0 scripts\mp\damagefeedback::updatedamagefeedback( "hitmotionsensor" );
            var_0 playsoundonmovingent( "ball_drone_3Dping" );
        }
        else
            self playsound( "ball_drone_3Dping" );

        foreach ( var_4 in level.players )
        {
            if ( var_4.team != self.owner.team )
                continue;

            triggerportableradarping( self.origin, var_4 );
        }
    }
}

_id_13A0F( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );
    self delete();
}

_id_13B1A( var_0, var_1 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "detonateExplosive", var_2 );
        var_0._id_DBD8 = undefined;
        self._id_451C._id_127BF = undefined;
        self playsound( self._id_451C._id_C525 );
        var_3 = self gettagorigin( "tag_origin" );
        playfx( self._id_451C._id_C526, var_3 );
        self delete();
    }
}

_id_13B1B( var_0, var_1 )
{
    self endon( "death" );
    var_2 = var_1.owner;
    var_3 = var_1.angles;
    var_4 = var_1._id_AC75;
    var_0 waittill( "death" );
    var_0._id_DBD8 = undefined;
    self._id_451C._id_127BF = undefined;
    _id_108E5( var_0.origin, var_2, "mobile_radar_mp", var_3, var_4, 1 );
    self delete();
}

_id_B8F7( var_0 )
{
    var_1 = 1;

    if ( isdefined( var_0._id_DBD8 ) )
        var_1 = 0;

    if ( !isplayer( var_0 ) )
        var_1 = 0;

    return var_1;
}

_id_D537()
{
    if ( isdefined( self._id_451C._id_B763 ) )
    {
        self endon( "death" );
        var_0 = gettime() + 1000;

        while ( gettime() < var_0 )
        {
            wait 0.05;
            playfxontag( self._id_451C._id_B763, self, "tag_fx_spin1" );
            playfxontag( self._id_451C._id_B763, self, "tag_fx_spin3" );
            wait 0.05;
            playfxontag( self._id_451C._id_B763, self, "tag_fx_spin2" );
            playfxontag( self._id_451C._id_B763, self, "tag_fx_spin4" );
        }
    }
}

_id_B765( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6[0] = ( 1, 0, 0 );
    var_6[1] = ( 0, 1, 0 );

    if ( var_1[2] < var_5 )
        var_7 = 0;
    else
        var_7 = 1;

    var_8 = ( var_0[0], var_0[1], var_5 );
    var_9 = ( var_1[0], var_1[1], var_5 );
    thread _id_4F3A( var_8, level._id_B76B, var_6[var_7], 32 );
    var_10 = distancesquared( var_0, var_1 );

    if ( var_10 > var_2 )
        var_7 = 0;
    else
        var_7 = 1;

    thread _id_4F48( var_8, var_9, var_6[var_7] );
}

_id_B767( var_0, var_1 )
{
    if ( isplayer( var_1 ) && isalive( var_1 ) && var_1.sessionstate == "playing" )
        var_2 = var_1 scripts\mp\utility\game::_id_815C();
    else if ( var_1.classname == "misc_turret" )
        var_2 = var_1.origin + ( 0, 0, 32 );
    else
        var_2 = var_1.origin;

    var_3 = 0;
    var_4 = var_0.origin[2] + var_3 - level._id_B766;

    if ( var_2[2] < var_4 )
        return 0;

    return 1;
}

_id_B780( var_0, var_1, var_2 )
{
    if ( !isalive( self ) )
    {
        var_0 delete();
        return;
    }

    scripts\mp\gamelogic::_id_F73B( self, 1 );
    var_0 thread _id_B77F( self, var_0._id_13C2E, var_0._id_D719, var_0._id_1088C, var_2 );
}

_id_B77F( var_0, var_1, var_2, var_3, var_4 )
{
    self.owner = var_0;
    self waittill( "missile_stuck", var_5 );

    if ( var_1 != "trip_mine_mp" )
    {
        if ( isdefined( var_5 ) && isdefined( var_5.owner ) )
        {
            if ( isdefined( var_4 ) )
                self.owner [[ var_4 ]]( self );

            self delete();
            return;
        }
    }

    self.owner notify( "bouncing_betty_update", 0 );

    if ( !isdefined( var_0 ) )
        return;

    if ( var_1 != "sonic_sensor_mp" )
        var_6 = bullettrace( self.origin + ( 0, 0, 4 ), self.origin - ( 0, 0, 4 ), 0, self );
    else
        var_6 = scripts\engine\trace::_id_DCED( self.origin, self.origin + anglestoup( self.angles * 2 ) );

    var_7 = var_6["position"];

    if ( var_6["fraction"] == 1 && var_1 != "sonic_sensor_mp" )
    {
        var_7 = getgroundposition( self.origin, 12, 0, 32 );
        var_6["normal"] *= -1;
    }

    if ( var_1 != "sonic_sensor_mp" )
    {
        var_8 = vectornormalize( var_6["normal"] );
        var_9 = vectortoangles( var_8 );
        var_9 += ( 90, 0, 0 );
    }
    else
        var_9 = self.angles;

    var_10 = self [[ var_3 ]]( var_7, var_0, var_1, var_2, var_9 );
    var_10 _id_B2A5();
    var_10 thread _id_B76A();
    self delete();
}

_id_51CE()
{
    if ( isdefined( self._id_CC4C ) )
    {
        foreach ( var_1 in self._id_CC4C )
        {
            if ( isdefined( var_1 ) )
                var_1 _id_51B5();
        }
    }

    if ( isdefined( self._id_CC4D ) )
    {
        foreach ( var_1 in self._id_CC4D )
        {
            if ( isdefined( var_1 ) )
                var_1 _id_51B5();
        }
    }

    self._id_CC4C = [];
    self._id_CC4D = [];
}

_id_51AF()
{
    var_0 = _id_0AE2::_id_808C( "primary" );

    foreach ( var_2 in self._id_CC4C )
    {
        if ( isdefined( var_2 ) )
        {
            if ( !isdefined( var_2._id_D77A ) || !isdefined( var_0 ) || var_2._id_D77A != var_0 )
                var_2 _id_51B5();
        }
    }

    var_4 = _id_0AE2::_id_808C( "secondary" );

    foreach ( var_2 in self._id_CC4D )
    {
        if ( isdefined( var_2 ) )
        {
            if ( !isdefined( var_2._id_D77A ) || !isdefined( var_4 ) || var_2._id_D77A != var_4 )
                var_2 _id_51B5();
        }
    }
}

_id_57EB( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = scripts\engine\utility::_id_7ECB( "weap_blink_friend" );

    if ( !isdefined( var_2 ) )
        var_2 = scripts\engine\utility::_id_7ECB( "weap_blink_enemy" );

    self._id_2BA2["friendly"] = var_1;
    self._id_2BA2["enemy"] = var_2;
    self._id_2BA3 = var_0;
    thread _id_12E66( var_1, var_2, var_0 );
    self waittill( "death" );
    _id_11061();
}

_id_12E66( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "carried" );
    self endon( "emp_damage" );
    var_3 = ::_id_3E52;

    if ( !level.teambased )
        var_3 = ::_id_3E34;

    var_4 = randomfloatrange( 0.05, 0.25 );
    wait( var_4 );
    childthread _id_C542( var_0, var_1, var_2, var_3 );

    foreach ( var_6 in level.players )
    {
        if ( isdefined( var_6 ) )
        {
            if ( self.owner [[ var_3 ]]( var_6 ) )
                playfxontagforclients( var_0, self, var_2, var_6 );
            else
                playfxontagforclients( var_1, self, var_2, var_6 );

            wait 0.05;
        }
    }
}

_id_C542( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    level endon( "game_ended" );
    self endon( "emp_damage" );

    for (;;)
    {
        level waittill( "joined_team", var_4 );

        if ( self.owner [[ var_3 ]]( var_4 ) )
        {
            playfxontagforclients( var_0, self, var_2, var_4 );
            continue;
        }

        playfxontagforclients( var_1, self, var_2, var_4 );
    }
}

_id_11061()
{
    if ( isalive( self ) && isdefined( self._id_2BA2 ) )
    {
        stopfxontag( self._id_2BA2["friendly"], self, self._id_2BA3 );
        stopfxontag( self._id_2BA2["enemy"], self, self._id_2BA3 );
        self._id_2BA2 = undefined;
        self._id_2BA3 = undefined;
    }
}

_id_3E52( var_0 )
{
    return self.team == var_0.team;
}

_id_3E34( var_0 )
{
    return self == var_0;
}

_id_66A6( var_0 )
{
    playfx( scripts\engine\utility::_id_7ECB( "equipment_sparks" ), self.origin );

    if ( !isdefined( var_0 ) || var_0 == 0 )
        self playsound( "sentry_explode" );
}

_id_66A8( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_1 ) )
        {
            var_2 = anglestoforward( var_1 );
            var_3 = anglestoup( var_1 );
            playfx( scripts\engine\utility::_id_7ECB( "equipment_explode" ), var_0, var_2, var_3 );
            playfx( scripts\engine\utility::_id_7ECB( "equipment_smoke" ), var_0, var_2, var_3 );
        }
        else
        {
            playfx( scripts\engine\utility::_id_7ECB( "equipment_explode" ), var_0 );
            playfx( scripts\engine\utility::_id_7ECB( "equipment_smoke" ), var_0 );
        }

        playloopsound( var_0, "mp_killstreak_disappear" );
    }
    else if ( isdefined( self ) )
    {
        var_4 = self.origin;
        var_2 = anglestoforward( self.angles );
        var_3 = anglestoup( self.angles );
        playfx( scripts\engine\utility::_id_7ECB( "equipment_explode" ), var_4, var_2, var_3 );
        playfx( scripts\engine\utility::_id_7ECB( "equipment_smoke" ), var_4, var_2, var_3 );
        self playsound( "mp_killstreak_disappear" );
    }
}

_id_66A9()
{
    playfxontag( scripts\engine\utility::_id_7ECB( "emp_stun" ), self, "tag_origin" );
}

_id_31D5()
{
    var_0 = _id_7DDF();
    level._id_2497 = [];
    level._id_2498 = [];
    level._id_248B = [];

    foreach ( var_2 in var_0 )
    {
        var_3 = tablelookup( "mp/attachmenttable.csv", 4, var_2, 5 );

        if ( var_2 != var_3 )
            level._id_2497[var_2] = var_3;

        var_4 = tablelookup( "mp/attachmenttable.csv", 4, var_2, 13 );

        if ( var_4 != "" )
        {
            level._id_2498[var_2] = var_4;
            level._id_248B[var_4] = 1;
        }
    }

    var_6 = [];
    var_7 = 1;

    for ( var_8 = tablelookupbyrow( "mp/attachmentmap.csv", var_7, 0 ); var_8 != ""; var_8 = tablelookupbyrow( "mp/attachmentmap.csv", var_7, 0 ) )
    {
        var_6[var_6.size] = var_8;
        var_7++;
    }

    var_9 = [];
    var_10 = 1;

    for ( var_11 = tablelookupbyrow( "mp/attachmentmap.csv", 0, var_10 ); var_11 != ""; var_11 = tablelookupbyrow( "mp/attachmentmap.csv", 0, var_10 ) )
    {
        var_9[var_11] = var_10;
        var_10++;
    }

    level._id_2492 = [];

    foreach ( var_8 in var_6 )
    {
        foreach ( var_16, var_14 in var_9 )
        {
            var_15 = tablelookup( "mp/attachmentmap.csv", 0, var_8, var_14 );

            if ( var_15 == "" )
                continue;

            if ( !isdefined( level._id_2492[var_8] ) )
                level._id_2492[var_8] = [];

            level._id_2492[var_8][var_16] = var_15;
        }
    }

    level._id_2491 = [];

    foreach ( var_19 in var_0 )
    {
        var_20 = tablelookup( "mp/attachmenttable.csv", 4, var_19, 12 );

        if ( var_20 == "" )
            continue;

        level._id_2491[var_19] = var_20;
    }

    level._id_2493 = [];
    var_22 = 1;

    for ( var_23 = tablelookupbyrow( "mp/attachmentcombos.csv", var_22, 0 ); var_23 != ""; var_23 = tablelookupbyrow( "mp/attachmentcombos.csv", var_22, 0 ) )
    {
        var_24 = 1;

        for ( var_25 = tablelookupbyrow( "mp/attachmentcombos.csv", 0, var_24 ); var_25 != ""; var_25 = tablelookupbyrow( "mp/attachmentcombos.csv", 0, var_24 ) )
        {
            if ( var_23 != var_25 )
            {
                var_26 = tablelookupbyrow( "mp/attachmentcombos.csv", var_22, var_24 );
                var_27 = scripts\engine\utility::_id_1D3A( [ var_23, var_25 ] );
                var_28 = var_27[0] + "_" + var_27[1];

                if ( var_26 == "no" && !isdefined( level._id_2493[var_28] ) )
                    level._id_2493[var_28] = 1;
            }

            var_24++;
        }

        var_22++;
    }
}

_id_7DDF()
{
    var_0 = [];
    var_1 = 0;

    for ( var_2 = tablelookup( "mp/attachmentTable.csv", 0, var_1, 4 ); var_2 != ""; var_2 = tablelookup( "mp/attachmentTable.csv", 0, var_1, 4 ) )
    {
        var_0[var_2] = var_2;
        var_1++;
    }

    return var_0;
}

_id_3222()
{
    level._id_13CA5 = [];

    for ( var_0 = 1; tablelookup( "mp/statstable.csv", 0, var_0, 0 ) != ""; var_0++ )
    {
        var_1 = tablelookup( "mp/statstable.csv", 0, var_0, 4 );

        if ( var_1 != "" )
        {
            level._id_13CA5[var_1] = spawnstruct();
            var_2 = tablelookup( "mp/statstable.csv", 0, var_0, 0 );

            if ( var_2 != "" )
                level._id_13CA5[var_1]._id_C211 = var_2;

            var_3 = tablelookup( "mp/statstable.csv", 0, var_0, 1 );

            if ( var_3 != "" )
                level._id_13CA5[var_1]._id_8677 = var_3;

            var_4 = tablelookup( "mp/statstable.csv", 0, var_0, 5 );

            if ( var_4 != "" )
                level._id_13CA5[var_1]._id_23B0 = var_4;

            var_5 = tablelookup( "mp/statstable.csv", 0, var_0, 44 );

            if ( var_5 != "" )
                level._id_13CA5[var_1]._id_CA2E = var_5;

            var_6 = tablelookup( "mp/statstable.csv", 0, var_0, 9 );

            if ( var_6 != "" )
                level._id_13CA5[var_1]._id_2476 = strtok( var_6, " " );

            level._id_13CA5[var_1]._id_F1A8 = [];
            level._id_13CA5[var_1]._id_F1A9 = [];

            for ( var_7 = 0; var_7 < 20; var_7++ )
            {
                var_8 = tablelookup( "mp/statstable.csv", 0, var_0, 10 + var_7 );

                if ( isdefined( var_8 ) && var_8 != "" )
                {
                    var_9 = level._id_13CA5[var_1]._id_F1A8.size;
                    level._id_13CA5[var_1]._id_F1A8[var_9] = var_8;
                    level._id_13CA5[var_1]._id_F1A9[var_8] = 1;
                }
            }

            if ( level.tactical )
                var_10 = tablelookup( "mp/statstable.csv", 0, var_0, 50 );
            else
                var_10 = tablelookup( "mp/statstable.csv", 0, var_0, 8 );

            if ( var_10 != "" )
            {
                var_10 = float( var_10 );
                level._id_13CA5[var_1]._id_02B3 = var_10;
            }
        }
    }
}

_id_464F()
{
    level endon( "game_ended" );
    self endon( "end_explode" );
    self.owner endon( "disconnect" );
    self waittill( "explode", var_0 );
    _id_464D( var_0 );
}

_id_464D( var_0 )
{
    thread scripts\mp\utility\game::_id_C15A( "death", "end_explode" );
    var_1 = self.owner;
    var_2 = var_1 scripts\mp\utility\game::_id_8027( var_1.team );
    var_3 = undefined;
    var_4 = 0;

    if ( level.teambased )
        var_3 = scripts\mp\utility\game::_id_81A0( var_2 );
    else
        var_3 = level._id_3CB5;

    var_5 = [];
    var_6 = _id_7E8C( var_0, 256, 0, undefined );

    if ( var_6.size >= 1 )
    {
        foreach ( var_8 in var_6 )
        {
            if ( isdefined( var_8.owner ) && !_id_7415( self.owner, var_8.owner ) )
                continue;

            var_8 notify( "emp_damage", self.owner, 5.0 );

            foreach ( var_10 in var_3 )
            {
                if ( var_8 == var_10 || var_8 == self.owner )
                {
                    var_8 thread _id_464E();
                    var_5[var_5.size] = var_8;
                    break;
                }
            }
        }

        foreach ( var_14 in var_5 )
        {
            if ( var_14 == self.owner )
            {
                var_4 = 1;
                break;
            }
        }

        if ( !var_4 )
        {
            var_14 = var_5[var_5.size - 1];

            if ( isdefined( var_14 ) && var_14 != var_1 )
            {
                var_16 = "primary";
                var_17 = "none";
                var_18 = getarraykeys( var_1._id_D782 );

                foreach ( var_20 in var_18 )
                {
                    if ( var_1._id_D782[var_20]._id_10307 == var_16 )
                        var_17 = var_20;
                }

                var_22 = var_14._id_AE7B;

                if ( isdefined( var_22 ) && var_22 != "none" )
                {
                    var_1 notify( "corpse_steal" );
                    var_1 notify( "start_copycat" );
                    var_1 _id_0AE2::_id_E15E( var_17 );
                    var_1 _id_0AE2::_id_8397( var_22, var_16, 1 );
                    var_1 thread _id_139D7( var_22, var_16 );
                }
            }
        }
    }
}

_id_139D7( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "corpse_steal" );
    self waittill( "copycat_reset" );
    self notify( "start_copycat" );
    _id_0AE2::_id_E15E( var_0 );
    _id_0AE2::_id_8397( self._id_AE7B, var_1, 1 );
    self setclientomnvar( "ui_juggernaut", 0 );
}

_id_464E()
{
    self endon( "disconnect" );
    self endon( "death" );
    var_0 = gettime() + 5000.0;
    _id_0AE2::_id_D740( 0.0 );

    if ( isdefined( self._id_38A1 ) && self._id_38A1 )
        _id_0AE2::_id_12C9F();

    thread _id_0AE2::_id_D729();

    while ( gettime() < var_0 )
        wait 0.1;

    _id_0AE2::_id_D74E();

    if ( isdefined( self._id_38A1 ) && !self._id_38A1 )
        _id_0AE2::_id_F6B1();

    thread _id_0AE2::_id_D72F();
}

_id_85DD( var_0, var_1, var_2 )
{
    if ( !isdefined( self ) )
    {
        var_0._id_11180 = var_1;
        var_1._id_1117F = var_0;
    }
    else if ( level.teambased && isdefined( var_1.team ) && var_1.team == self.team )
        var_0._id_9F7D = "friendly";
    else
    {
        var_3 = undefined;

        if ( _id_83F3( var_0._id_13C2E ) == "stickglprox" )
            var_3 = "stickglprox_stuck";
        else
        {
            switch ( var_0._id_13C2E )
            {
                case "semtex_mp":
                    var_3 = "semtex_stuck";
                    break;
                case "splash_grenade_mp":
                    var_3 = "splash_grenade_stuck";
                    break;
                case "power_spider_grenade_mp":
                    var_3 = "spider_grenade_stuck";
                    break;
                case "wristrocket_proj_mp":
                    var_3 = "wrist_rocket_stuck";
            }
        }

        var_0._id_9F7D = "enemy";
        var_0._id_11180 = var_1;

        if ( var_0._id_13C2E == "split_grenade_mp" )
            var_1._id_1117F = undefined;
        else
        {
            var_1._id_1117F = var_0;
            self notify( "grenade_stuck_enemy" );
        }

        if ( !scripts\mp\utility\game::istrue( var_2 ) )
            _id_85DE( var_3, var_1 );
    }
}

_id_85DE( var_0, var_1 )
{
    if ( isplayer( var_1 ) && isdefined( var_0 ) )
        var_1 scripts\mp\hud_message::showsplash( var_0, undefined, self );

    thread scripts\mp\awards::givemidmatchaward( "explosive_stick" );
}

_id_66A5( var_0, var_1 )
{
    if ( var_0 _id_0AE2::_id_D734( var_1 ) > 0 )
        return 0;

    var_2 = undefined;

    switch ( var_1 )
    {
        case "power_explodingDrone":
            var_2 = var_0._id_69D6;
            break;
        case "power_c4":
            var_2 = var_0._id_CC4C;
            break;
        case "power_transponder":
            var_2 = var_0._id_CC4D;
            break;
    }

    if ( !isdefined( var_2 ) || var_2.size == 0 )
        return 0;

    return 1;
}

_id_10884( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = _id_108E3( var_0, var_1, var_2, var_3, var_4 );
    var_5._id_76CF = spawn( "script_model", var_5._id_A63A.origin );
    var_5._id_76CF setscriptmoverkillcam( "explosive" );
    thread _id_40F6( var_5._id_76CF, var_5 );
    return var_5;
}

_id_40F6( var_0, var_1 )
{
    var_1 waittill( "death" );
    wait 20.0;
    var_0 delete();
}

_id_10832( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = _id_108E3( var_0, var_1, var_2, var_3, var_4 );
    var_5._id_76CF = spawn( "script_model", var_5._id_A63A.origin );
    var_5._id_76CF setscriptmoverkillcam( "explosive" );
    thread _id_40E6( var_5._id_76CF, var_5 );
    var_1 notify( "powers_blackholeGrenade_used", 1 );
    return var_5;
}

_id_40E6( var_0, var_1 )
{
    var_1 waittill( "death" );
    wait 20.0;
    var_0 delete();
}

_id_1082C( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = _id_108E3( var_0, var_1, var_2, var_3, var_4 );
    var_5._id_76CF = spawn( "script_model", var_5._id_A63A.origin );
    var_5._id_76CF setscriptmoverkillcam( "explosive" );
    thread _id_40E4( var_5._id_76CF, var_5 );
    return var_5;
}

_id_40E4( var_0, var_1 )
{
    var_1 waittill( "death" );
    wait 20.0;
    var_0 delete();
}

_id_10843( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = _id_108E3( var_0, var_1, var_2, var_3, var_4 );
    var_5._id_4ACD = spawn( "script_model", var_5._id_A63A.origin );
    var_5._id_4ACD setscriptmoverkillcam( "explosive" );
    thread _id_40F1( var_5._id_4ACD, var_5 );
    var_1 notify( "powers_cryoGrenade_used", 1 );
    return var_5;
}

_id_40F1( var_0, var_1 )
{
    var_1 waittill( "death" );
    wait 20.0;
    var_0 delete();
}

_id_1090D( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = _id_108E3( var_0, var_1, var_2, var_3, var_4 );
    var_5._id_76CF = spawn( "script_model", var_5._id_A63A.origin );
    var_5._id_76CF setscriptmoverkillcam( "explosive" );
    thread _id_4117( var_5._id_76CF, var_5 );
    self notify( "powers_shardBall_used", 1 );
    return var_5;
}

_id_4117( var_0, var_1 )
{
    var_1 waittill( "death" );
    wait 20.0;
    var_0 delete();
}

_id_C798( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_C794( var_0, "white", var_1, 0, 0, "equipment" );
    var_0 waittill( "death" );
    scripts\mp\utility\game::_id_C78F( var_2, var_0 );
}

outlinesuperequipment( var_0, var_1 )
{
    if ( level.teambased )
        thread _id_C7B0( var_0, var_1 );
    else
        thread outlinesuperequipmentforplayer( var_0, var_1 );
}

_id_C7B0( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_C795( var_0, "cyan", var_1.team, 0, 0, "killstreak" );
    var_0 waittill( "death" );
    scripts\mp\utility\game::_id_C78F( var_2, var_0 );
}

outlinesuperequipmentforplayer( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_C794( var_0, "cyan", var_1, 0, 0, "killstreak" );
    var_0 waittill( "death" );
    scripts\mp\utility\game::_id_C78F( var_2, var_0 );
}

_id_85BE()
{
    if ( !isdefined( self._id_85BE ) || self._id_85BE == "none" )
        return 0;

    return 1;
}

_id_7EE4()
{
    if ( !isdefined( self._id_85BE ) )
        return "none";
    else
        return self._id_85BE;
}

_id_13A93()
{
    self notify( "watchGrenadeHeldAtDeath" );
    self endon( "watchGrenadeHeldAtDeath" );
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self._id_85BE = scripts\mp\utility\game::_id_7EE5();
        scripts\engine\utility::waitframe();
    }
}

trace_impale( var_0, var_1 )
{
    var_2 = physics_createcontents( [ "physicscontents_solid", "physicscontents_glass", "physicscontents_missileclip", "physicscontents_vehicle", "physicscontents_item" ] );
    var_3 = scripts\engine\trace::_id_DCEE( var_0, var_1, level.players, var_2, undefined, 1 );
    return var_3;
}

impale_endpoint( var_0, var_1 )
{
    var_2 = var_0 + var_1 * 4096;
    return var_2;
}

_id_934E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_1 endon( "death" );
    var_1 endon( "disconnect" );

    if ( !isdefined( var_1._id_2C09 ) )
        return;

    var_9 = var_0 scripts\mp\utility\game::_id_12D6( "passive_power_melee" );

    if ( var_9 )
        var_6 = "torso";
    else
        playfx( scripts\engine\utility::_id_7ECB( "penetration_railgun_impact" ), var_4 );

    var_10 = impale_endpoint( var_4, var_5 );
    var_11 = trace_impale( var_4, var_10 );
    var_10 = var_11["position"] - var_5 * 12;
    var_12 = length( var_10 - var_4 );
    var_13 = var_12 / scripts\engine\utility::ter_op( var_9, 600, 1000 );
    var_13 = max( var_13, 0.05 );

    if ( var_11["hittype"] != "hittype_world" )
        var_13 = 0;

    var_14 = var_13 > 0.05;

    if ( isdefined( var_1 ) )
        var_1._id_2C09 startragdoll();

    wait 0.05;

    if ( var_14 )
    {
        var_15 = var_5;
        var_16 = anglestoup( var_0.angles );
        var_17 = vectorcross( var_15, var_16 );
        var_18 = scripts\engine\utility::_id_107E6( var_4, _func_017( var_15, var_17, var_16 ) );
        var_18 moveto( var_10, var_13 );
        var_19 = spawnragdollconstraint( var_1._id_2C09, var_6, var_7, var_8 );
        var_19.origin = var_18.origin;
        var_19.angles = var_18.angles;
        var_19 linkto( var_18 );

        if ( var_13 > scripts\engine\utility::ter_op( var_9, 0.075, 1 ) )
            thread _id_9350( var_19, scripts\engine\utility::ter_op( var_9, 0.075, 1 ) );

        thread _id_934F( var_1, var_18, var_13 + 0.25 );

        if ( !var_9 )
            var_18 thread _id_9351( var_10, var_13 );
    }
}

_id_9350( var_0, var_1 )
{
    wait( var_1 );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_9351( var_0, var_1 )
{
    wait( clamp( var_1 - 0.05, 0.05, 20 ) );
    playfx( scripts\engine\utility::_id_7ECB( "vfx_penetration_railgun_impact" ), var_0 );
}

_id_934F( var_0, var_1, var_2 )
{
    if ( isdefined( var_0 ) )
        var_0 scripts\engine\utility::_id_13736( var_2, "death", "disconnect" );

    var_1 delete();
}

_id_00AA( var_0, var_1 )
{
    return [ 1.0, 1.0 ];
}

_id_9F3C( var_0, var_1 )
{
    return isdefined( level._id_13CA5[var_0]._id_F1A9[var_1] );
}

_id_F7FC()
{
    if ( !isdefined( self._id_9F80 ) )
        self._id_9F80 = 1;
    else
        self._id_9F80++;
}

_id_F800()
{
    self._id_9F80--;
}

_id_9F80()
{
    return isdefined( self._id_9F80 ) && self._id_9F80 > 0;
}

_id_F7EE()
{
    if ( !isdefined( self._id_9D6B ) )
        self._id_9D6B = 1;
    else
        self._id_9D6B++;
}

_id_F7FF()
{
    self._id_9D6B--;
}

_id_9D6B()
{
    return isdefined( self._id_9D6B ) && self._id_9D6B > 0;
}

_id_9F81()
{
    return _id_9D6B() || _id_9F80();
}

_id_40EA( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait( var_0 );
    _id_F800();
}

_id_A008( var_0 )
{
    var_1 = getweaponbasename( var_0 );

    switch ( var_1 )
    {
        case "iw7_sonic_mp":
            return 1;
    }

    return 0;
}

_id_20E4()
{
    self endon( "death" );
    self endon( "disconnect" );
    wait 0.1;

    if ( isdefined( self ) && isplayer( self ) && !isbot( self ) )
    {
        self playlocalsound( "sonic_shotgun_debuff" );
        self _meth_84D5( "sonic_shotgun_impact" );
    }
}

_id_13AB2()
{
    level endon( "lethal_delay_end" );
    level endon( "round_end" );
    level endon( "game_ended" );
    level waittill( "prematch_over" );
    level._id_ABBF = getdvarfloat( "scr_lethalDelay", 0 );

    if ( level._id_ABBF == 0 )
    {
        level._id_ABC2 = scripts\mp\utility\game::_id_81CB();
        level._id_ABC0 = level._id_ABC2;
        level notify( "lethal_delay_end" );
    }

    level._id_ABC2 = scripts\mp\utility\game::_id_81CB();
    level._id_ABC0 = level._id_ABC2 + level._id_ABBF * 1000;
    level notify( "lethal_delay_start" );

    while ( scripts\mp\utility\game::_id_81CB() < level._id_ABC0 )
        scripts\engine\utility::waitframe();

    level notify( "lethal_delay_end" );
}

_id_13AB5( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    level endon( "round_end" );
    level endon( "game_ended" );

    if ( _id_ABC1() )
        return;

    self notify( "watchLethalDelayPlayer_" + var_2 );
    self endon( "watchLethalDelayPlayer_" + var_2 );
    self endon( "power_removed_" + var_1 );
    var_0 _id_0AE2::_id_D727( var_1 );
    _id_13AB4( var_0, var_2 );
    var_0 _id_0AE2::_id_D72D( var_1 );
}

_id_13AB4( var_0, var_1 )
{
    level endon( "lethal_delay_end" );

    if ( !scripts\mp\utility\game::istrue( scripts\mp\utility\game::_id_766C( "prematch_done" ) ) )
        level waittill( "lethal_delay_start" );

    var_2 = "+frag";

    if ( var_1 != "primary" )
        var_2 = "+smoke";

    if ( !isbot( var_0 ) )
        var_0 notifyonplayercommand( "lethal_attempt_" + var_1, var_2 );

    for (;;)
    {
        self waittill( "lethal_attempt_" + var_1 );
        var_3 = ( level._id_ABC0 - scripts\mp\utility\game::_id_81CB() ) / 1000;
        var_3 = int( max( 0, ceil( var_3 ) ) );
        var_0 scripts\mp\hud_message::_id_10122( "MP_LETHALS_UNAVAILABLE_FOR_N", var_3 );
    }
}

_id_3882()
{
    level._id_ABBF = 0;
    level._id_ABC2 = scripts\mp\utility\game::_id_81CB();
    level._id_ABC0 = level._id_ABC2;
    level notify( "lethal_delay_end" );
}

_id_ABC1( var_0 )
{
    if ( isdefined( level._id_ABBF ) && level._id_ABBF == 0 )
        return 1;

    return isdefined( level._id_ABC0 ) && scripts\mp\utility\game::_id_81CB() > level._id_ABC0;
}

_id_13AA9()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "weapon_switch_invalid", var_0 );
        var_1 = self getcurrentweapon();
        var_2 = weaponinventorytype( var_1 );

        if ( var_2 == "item" || var_2 == "exclusive" )
            scripts\mp\utility\game::_id_141A( self._id_A978 );
    }
}

_id_13C98( var_0 )
{
    var_1 = scripts\mp\utility\game::_id_8234( var_0 );
    var_2 = getweaponattachments( var_0 );

    foreach ( var_4 in var_2 )
    {
        var_5 = _id_248C( var_4 );

        if ( var_5 == "rail" )
        {
            var_6 = scripts\mp\utility\game::_id_2494( var_4 );

            if ( _id_9F3C( var_1, var_6 ) )
                return 1;
        }
    }

    return 0;
}

watchdropweapons()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "weapon_dropped", var_0, var_1 );

        if ( isdefined( var_0 ) && isdefined( var_1 ) )
        {

        }
    }
}

watchgrenadeaxepickup( var_0, var_1 )
{
    self endon( "death" );
    level endon( "game_ended" );

    if ( !isdefined( self._id_13C2E ) && isdefined( var_1 ) )
        self._id_13C2E = var_1;

    self.inphase = 0;

    if ( isdefined( var_0 ) )
        self.inphase = var_0 _meth_84D9();

    self waittill( "missile_stuck", var_2, var_3 );

    if ( isdefined( var_2 ) && ( isplayer( var_2 ) || isagent( var_2 ) ) )
    {
        var_4 = var_3 == "tag_flicker";
        var_5 = var_3 == "tag_top_flicker";
        var_6 = var_2 scripts\mp\utility\game::_id_12D6( "specialty_rearguard" ) && var_3 == "tag_origin";
        var_7 = isdefined( var_3 ) && ( var_4 || var_5 || var_6 );
        var_8 = isdefined( var_3 ) && var_3 == "tag_weapon";

        if ( var_7 )
        {
            playfx( scripts\engine\utility::_id_7ECB( "shield_metal_impact" ), self.origin );

            if ( isdefined( self.owner ) )
            {
                var_9 = self.owner;
                relaunchaxe( self._id_13C2E, var_9, 1 );
                return;
            }
        }
        else if ( !scripts\mp\utility\game::istrue( var_7 ) && isplayer( var_2 ) && !scripts\mp\utility\game::isreallyalive( var_2 ) && ( level._id_B335 == "mp_neon" || scripts\mp\utility\game::istrue( level._id_DC24 ) ) )
            return;
    }

    var_0 thread _id_11825( var_0, self );
    var_10 = 45;
    thread watchaxetimeout( var_10 );
    thread _id_13A90();
    thread watchaxeuse( var_0, self._id_13C2E );
    thread watchaxeautopickup( var_0, self._id_13C2E );
}

axedetachfromcorpse( var_0 )
{
    level endon( "game_ended" );
    var_1 = var_0 _meth_8137();

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_4 = var_3._id_13C2E;
        var_5 = var_3.owner;
        var_6 = var_3.origin;

        if ( isdefined( var_4 ) && isaxeweapon( var_4 ) )
            var_3 relaunchaxe( var_4, var_5, 1 );
    }
}

relaunchaxe( var_0, var_1, var_2 )
{
    self unlink();
    var_3 = scripts\mp\utility\game::_id_821D( var_0 );
    var_4 = getsubstr( var_0, var_3.size );
    var_5 = var_1 scripts\mp\utility\game::_id_1302( "iw7_axe_mp_dummy" + var_4, self.origin, ( 0, 0, 0 ), 100, 1, self );
    var_5 _meth_82DD( var_1 );
    var_5 thread watchgrenadeaxepickup( var_1, self._id_13C2E );

    if ( scripts\mp\utility\game::istrue( var_2 ) )
    {
        self.inphase = 0;
        self._id_FF03 = 0;
    }
}

watchaxetimeout( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    self delete();
}

watchaxeautopickup( var_0, var_1 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_2 = spawn( "trigger_radius", self.origin - ( 0, 0, 40 ), 0, 64, 64 );
    var_2 _meth_80D2();
    var_2 linkto( self );
    self._id_A702 = var_2;
    var_2 endon( "death" );

    for (;;)
    {
        var_2 waittill( "trigger", var_0 );

        if ( !isplayer( var_0 ) )
            continue;

        if ( var_0 playercanautopickupaxe( self ) )
        {
            var_0 playerpickupaxe( var_1, 1 );
            self delete();
            break;
        }
    }
}

watchaxeuse( var_0, var_1 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_2 = spawn( "script_model", self.origin );
    var_2 linkto( self );
    self.useobj_trigger = var_2;
    var_2 makeusable();
    var_2 setcursorhint( "HINT_NOICON" );
    var_2 _meth_84A9( "show" );
    var_2 sethintstring( &"WEAPON_PICKUP_AXE" );
    var_2 _meth_84A6( 360 );
    var_2 _meth_84A5( 360 );
    var_2 _meth_84A4( 64 );
    var_2 _meth_84A2( 64 );
    var_2 _meth_835F( 0 );
    thread watchallplayerphasestates( var_2 );
    var_2 waittill( "trigger", var_0 );
    var_0 playerpickupaxe( var_1, 0 );
    self delete();
}

watchallplayerphasestates( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        foreach ( var_2 in level.players )
        {
            if ( !scripts\mp\utility\game::isreallyalive( var_2 ) )
                continue;

            if ( !axeinsamephaseplayerstate( self, var_2 ) )
            {
                var_0 disableplayeruse( var_2 );
                continue;
            }

            var_0 enableplayeruse( var_2 );
        }

        scripts\engine\utility::waitframe();
    }
}

axeinsamephaseplayerstate( var_0, var_1 )
{
    var_2 = 1;

    if ( scripts\mp\utility\game::istrue( var_0.inphase ) && !var_1 _meth_84D9() )
        var_2 = 0;
    else if ( !scripts\mp\utility\game::istrue( var_0.inphase ) && var_1 _meth_84D9() )
        var_2 = 0;

    return var_2;
}

playercanautopickupaxe( var_0 )
{
    if ( isdefined( var_0.owner ) && self != var_0.owner )
        return 0;

    var_1 = self getweaponslistprimaries();
    var_2 = 0;
    var_3 = 0;

    foreach ( var_5 in var_1 )
    {
        if ( isaxeweapon( var_5 ) && self getweaponammoclip( var_5 ) == 0 )
        {
            var_2 = 1;
            break;
        }

        if ( issubstr( var_5, "iw7_fists_mp" ) )
        {
            var_2 = 1;
            break;
        }

        if ( !issubstr( var_5, "alt_" ) )
            var_3++;
    }

    if ( var_3 < 2 )
        var_2 = 1;

    if ( scripts\mp\utility\game::istrue( var_2 ) )
    {
        if ( !axeinsamephaseplayerstate( var_0, self ) )
            var_2 = 0;
    }

    return var_2;
}

playerpickupaxe( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_E0CF( var_0 );
    var_3 = self getcurrentweapon();
    var_4 = self getweaponslistprimaries();

    if ( self hasweapon( var_0 ) )
    {
        var_5 = self getweaponammoclip( var_0 );

        if ( !var_1 && var_5 > 0 )
        {
            self dropitem( var_0 );
            scripts\mp\utility\game::_id_12C6( var_2 );
        }
        else if ( !issubstr( var_3, var_0 ) )
        {
            scripts\mp\utility\game::_id_141E( var_0 );
            scripts\mp\utility\game::_id_12C6( var_2 );
        }

        var_6 = self getweaponammoclip( var_3 ) == 0 && isaxeweapon( var_3 );
        var_7 = issubstr( var_3, "iw7_fists_mp" );

        if ( !var_1 || var_7 || var_6 )
            scripts\mp\utility\game::_id_141A( var_2 );

        self setweaponammoclip( var_2, 1 );
        scripts\mp\hud_message::_id_1013D( "axe" );
        return;
    }

    var_8 = undefined;
    var_9 = 0;

    foreach ( var_11 in var_4 )
    {
        if ( issubstr( var_11, "alt_" ) )
            continue;

        if ( issubstr( var_11, "uplinkball" ) )
            continue;

        var_12 = self getweaponammoclip( var_11 ) == 0 && isaxeweapon( var_11 );

        if ( !isdefined( var_8 ) && ( weaponispreferreddrop( var_11 ) || var_12 ) )
            var_8 = var_11;

        var_9++;
    }

    var_14 = undefined;

    if ( isdefined( var_8 ) )
        var_14 = var_8;
    else if ( var_9 >= 2 )
        var_14 = var_3;

    var_15 = !var_1 || isdefined( var_14 ) && issubstr( var_3, var_14 );

    if ( isdefined( var_14 ) )
    {
        var_12 = self getweaponammoclip( var_14 ) == 0 && isaxeweapon( var_14 );
        var_16 = var_14 == "iw7_fists_mp";
        var_17 = weaponcandrop( var_14 ) && !var_12;

        if ( var_17 )
        {
            var_18 = self dropitem( var_14 );

            if ( isdefined( var_18 ) )
            {
                if ( isdefined( self._id_119DF[var_14] ) )
                {
                    var_18.owner = self._id_119DF[var_14];
                    self._id_119DF[var_14] = undefined;
                }
                else
                    var_18.owner = self;

                var_18._id_0336 = "dropped_weapon";
                var_18 thread watchpickup();
                var_18 thread deletepickupafterawhile();
            }
        }
        else if ( !var_17 && !( var_16 && var_9 < 2 ) && !( var_12 && var_9 < 2 ) )
            self _meth_83B8( var_14 );
    }

    scripts\mp\utility\game::_id_12C6( var_2 );
    self setweaponammoclip( var_2, 1 );

    if ( var_15 )
        scripts\mp\utility\game::_id_141A( var_2 );

    scripts\mp\hud_message::_id_1013D( "axe" );
    fixupplayerweapons( self, var_2 );
}

callback_finishweaponchange( var_0, var_1, var_2, var_3 )
{
    updatecamoscripts( var_0, var_1, var_2, var_3 );
    updateholidayweaponsounds( var_0, var_1, var_2, var_3 );
    updateweaponscriptvfx( var_0, var_1, var_2, var_3 );

    if ( level.ingraceperiod > 0 )
        thread watchrigchangeforweaponfx( var_0, var_1, var_2, var_3 );

    scripts\mp\missions::monitorweaponpickup( var_0 );
}

watchrigchangeforweaponfx( var_0, var_1, var_2, var_3 )
{
    self notify( "rigChangedDuringGraceperiod" );
    self endon( "rigChangedDuringGraceperiod" );
    self endon( "graceperiod_done" );

    while ( level.ingraceperiod > 0 )
    {
        self waittill( "changed_kit" );

        if ( isdefined( var_1 ) && var_1 != "none" )
            updateweaponscriptvfx( var_0, var_1, var_2, var_3 );
    }
}

updateholidayweaponsounds( var_0, var_1, var_2, var_3 )
{
    var_4 = getweaponvariantindex( var_0 );

    if ( scripts\mp\class::isholidayweapon( var_0, var_4 ) )
        self _meth_8460( "special_foley", "bells", 2 );
    else
        self _meth_8460( "special_foley", "", 0.1 );
}

updateweaponscriptvfx( var_0, var_1, var_2, var_3 )
{
    if ( ( var_1 == "none" || var_1 == "alt_none" ) && isdefined( self._id_A978 ) )
    {
        if ( var_1 == "alt_none" )
            var_3 = 1;
        else
            var_3 = 0;

        var_1 = self._id_A978;
    }

    clearweaponscriptvfx( var_1, var_3 );
    runweaponscriptvfx( var_0, var_2 );
}

runweaponscriptvfx( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( var_1 ) && var_1 == 1 )
        var_2 = "alt_" + scripts\mp\utility\game::_id_821D( var_0 );
    else
        var_2 = scripts\mp\utility\game::_id_821D( var_0 );

    switch ( var_2 )
    {
        case "alt_iw7_rvn_mp":
            self setscriptablepartstate( "rvnFXView", "VFX_base", 0 );

            if ( scripts\mp\equipment\phase_shift::_id_9DDF( self ) )
                self setscriptablepartstate( "rvnFXWorld", "activePhase", 0 );
            else
                self setscriptablepartstate( "rvnFXWorld", "active", 0 );

            break;
        case "alt_iw7_rvn_mpl_burst6":
        case "alt_iw7_rvn_mpl":
            self setscriptablepartstate( "rvnFXView", "VFX_epic", 0 );

            if ( scripts\mp\equipment\phase_shift::_id_9DDF( self ) )
                self setscriptablepartstate( "rvnFXWorld", "activePhase", 0 );
            else
                self setscriptablepartstate( "rvnFXWorld", "active", 0 );

            break;
        case "alt_iw7_gauss_mpl":
        case "alt_iw7_gauss_mp_burst3":
        case "alt_iw7_gauss_mp_burst2":
        case "alt_iw7_gauss_mp":
        case "iw7_gauss_mp_burst3":
        case "iw7_gauss_mp_burst2":
        case "iw7_gauss_mp":
        case "iw7_gauss_mpl":
            self setscriptablepartstate( "gaussFXView", "VFX_base", 0 );

            if ( scripts\mp\equipment\phase_shift::_id_9DDF( self ) )
                self setscriptablepartstate( "gaussFXWorld", "activePhase", 0 );
            else
                self setscriptablepartstate( "gaussFXWorld", "active", 0 );

            thread chargefxwatcher();
            break;
    }
}

clearweaponscriptvfx( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( var_1 ) && var_1 == 1 )
        var_2 = "alt_" + scripts\mp\utility\game::_id_821D( var_0 );
    else
        var_2 = scripts\mp\utility\game::_id_821D( var_0 );

    switch ( var_2 )
    {
        case "alt_iw7_rvn_mp":
            self setscriptablepartstate( "rvnFXView", "neutral", 0 );
            self setscriptablepartstate( "rvnFXWorld", "neutral", 0 );
            break;
        case "alt_iw7_rvn_mpl_burst6":
        case "alt_iw7_rvn_mpl":
            self setscriptablepartstate( "rvnFXView", "neutral", 0 );
            self setscriptablepartstate( "rvnFXWorld", "neutral", 0 );
            break;
        case "alt_iw7_gauss_mpl":
        case "alt_iw7_gauss_mp_burst3":
        case "alt_iw7_gauss_mp_burst2":
        case "alt_iw7_gauss_mp":
        case "iw7_gauss_mp_burst3":
        case "iw7_gauss_mp_burst2":
        case "iw7_gauss_mp":
        case "iw7_gauss_mpl":
            self setscriptablepartstate( "gaussFXView", "neutral", 0 );
            self setscriptablepartstate( "gaussFXWorld", "neutral", 0 );
            self notify( "clear_chargeFXWatcher" );
            break;
    }
}

chargefxwatcher()
{
    self endon( "clear_chargeFXWatcher" );
    self setscriptablepartstate( "gaussFXWorld", "neutral", 0 );
    thread chargedeathwatcher();

    for (;;)
    {
        if ( !scripts\mp\utility\game::isreallyalive( self ) )
            break;

        self waittill( "weapon_charge_update_tag_count", var_0 );

        if ( var_0 >= 7 )
        {
            self setscriptablepartstate( "gaussFXWorld", "active", 0 );
            self waittill( "weapon_charge_update_tag_count", var_0 );
            self setscriptablepartstate( "gaussFXWorld", "neutral", 0 );
        }

        wait 0.1;
    }
}

chargedeathwatcher()
{
    self endon( "clear_chargeFXWatcher" );
    self waittill( "death" );
    self setscriptablepartstate( "gaussFXWorld", "neutral", 0 );
    self notify( "clear_chargeFXWatcher" );
}

updatecamoscripts( var_0, var_1, var_2, var_3 )
{
    var_4 = getweaponcamoname( var_0 );
    var_5 = getweaponcamoname( var_1 );

    if ( !isdefined( var_4 ) )
        var_4 = "none";

    if ( !isdefined( var_5 ) )
        var_5 = "none";

    clearcamoscripts( var_1, var_5 );
    runcamoscripts( var_0, var_4 );
}

runcamoscripts( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return;

    switch ( var_1 )
    {
        case "camo31":
            thread mw2_camo_31();
            break;
        case "camo84":
            thread blood_camo_84();
            break;
    }
}

clearcamoscripts( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return;

    switch ( var_1 )
    {
        case "camo31":
            self notify( "mw2_camo_31" );
            break;
        case "camo84":
            self notify( "blood_camo_84" );
            break;
    }
}

mw2_camo_31()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "mw2_camo_31" );

    if ( !isdefined( self.pers["mw2CamoKillCount"] ) )
        self.pers["mw2CamoKillCount"] = 0;

    self setscriptablepartstate( "camo_31", self.pers["mw2CamoKillCount"] + "_kills" );

    for (;;)
    {
        self waittill( "kill_event_buffered" );
        self.pers["mw2CamoKillCount"] += 1;

        if ( self.pers["mw2CamoKillCount"] > 7 )
            self.pers["mw2CamoKillCount"] = 0;

        self setscriptablepartstate( "camo_31", self.pers["mw2CamoKillCount"] + "_kills" );
    }
}

blood_camo_84()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "blood_camo_84" );

    if ( isdefined( self.bloodcamokillcount ) )
        self setscriptablepartstate( "camo_84", self.bloodcamokillcount + "_kills" );
    else
        self.bloodcamokillcount = 0;

    while ( self.bloodcamokillcount < 13 )
    {
        self waittill( "kill_event_buffered" );
        self.bloodcamokillcount += 1;
        self setscriptablepartstate( "camo_84", self.bloodcamokillcount + "_kills" );
    }
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level thread scripts\mp\perks\weaponpassives::_id_13CB1();
    level._id_CA51 = [];
    level._id_108D3["enemy"] = "tactical_insertion_marker_wm_dropmodel";
    level._id_108D3["friendly"] = "tactical_insertion_marker_wm_dropmodel";
    level._id_108D2["enemy"] = loadfx( "vfx/core/mp/core/vfx_flare_glow_en.vfx" );
    level._id_108D2["friendly"] = loadfx( "vfx/core/mp/core/vfx_flare_glow_fr.vfx" );
    level._id_10888 = loadfx( "vfx/props/barrelexp.vfx" );
    level._effect["ricochet"] = loadfx( "vfx/core/impacts/large_metalhit_1" );
    level._effect["tracker_cloak_tag"] = loadfx( "vfx/iw7/_requests/mp/vfx_tesla_shock_sparks_tracker.vfx" );
    level._id_B674 = [];
    level._id_EF86 = [];
    level._id_CA60 = [];
    level._id_CA66 = [];
    level._id_6A50 = [];
    level._id_B676 = [];
    level._id_EF86["specialty_afterburner"] = 1;
    level._id_EF86["specialty_blastshield"] = 1;
    level._id_EF86["specialty_autospot"] = 1;
    level._id_EF86["specialty_boom"] = 1;
    level._id_EF86["specialty_delaymine"] = 1;
    level._id_EF86["specialty_dexterity"] = 1;
    level._id_EF86["specialty_empimmune"] = 1;
    level._id_EF86["specialty_engineer"] = 1;
    level._id_EF86["specialty_explosivedamage"] = 1;
    level._id_EF86["specialty_extraammo"] = 1;
    level._id_EF86["specialty_falldamage"] = 1;
    level._id_EF86["specialty_ghost"] = 1;
    level._id_EF86["specialty_hard_shell"] = 1;
    level._id_EF86["specialty_hardline"] = 1;
    level._id_EF86["specialty_powercell"] = 1;
    level._id_EF86["specialty_hunter"] = 1;
    level._id_EF86["specialty_incog"] = 1;
    level._id_EF86["specialty_localjammer"] = 1;
    level._id_EF86["specialty_overclock"] = 1;
    level._id_EF86["specialty_outlinekillstreaks"] = 1;
    level._id_EF86["specialty_pitcher"] = 1;
    level._id_EF86["specialty_regenfaster"] = 1;
    level._id_EF86["specialty_stun_resistance"] = 1;
    level._id_EF86["specialty_tracker"] = 1;
    level._id_EF86["specialty_twoprimaries"] = 1;
    level._id_EF86["specialty_bullet_outline"] = 1;
    level._id_EF86["specialty_activereload"] = 1;
    level._id_EF86["specialty_sixth_sense"] = 1;
    level._id_EF86["specialty_enhanced_sixth_sense"] = 1;
    level._id_EF86["specialty_meleekill"] = 1;
    level._id_EF86["specialty_gung_ho"] = 1;
    level._id_EF86["specialty_man_at_arms"] = 1;
    level._id_EF86["specialty_blast_suppressor"] = 1;
    level._id_EF86["specialty_momentum"] = 1;
    level._id_EF86["specialty_improvedmelee"] = 1;
    level._id_EF86["specialty_thief"] = 1;
    level._id_EF86["specialty_silentkill"] = 1;
    level._id_EF86["specialty_armorpiercingks"] = 1;
    level._id_EF86["specialty_fastcrouch"] = 1;
    level._id_EF86["specialty_battleslide"] = 1;
    level._id_EF86["specialty_battleslide_offense"] = 1;
    level._id_EF86["specialty_battleslide_shield"] = 1;
    level._id_EF86["specialty_disruptor_punch"] = 1;
    level._id_EF86["specialty_ground_pound"] = 1;
    level._id_EF86["specialty_ground_pound_shield"] = 1;
    level._id_EF86["specialty_ground_pound_shock"] = 1;
    level._id_EF86["specialty_thruster"] = 1;
    level._id_EF86["specialty_dodge"] = 1;
    level._id_EF86["specialty_extra_dodge"] = 1;
    level._id_EF86["specialty_extend_dodge"] = 1;
    level._id_EF86["specialty_phase_slide"] = 1;
    level._id_EF86["specialty_tele_slide"] = 1;
    level._id_EF86["specialty_phaseslash"] = 1;
    level._id_EF86["specialty_phaseslash_rephase"] = 1;
    level._id_EF86["specialty_phase_fall"] = 1;
    level._id_EF86["specialty_aura_regen"] = 1;
    level._id_EF86["specialty_aura_quickswap"] = 1;
    level._id_EF86["specialty_aura_speed"] = 1;
    level._id_EF86["specialty_mark_targets"] = 1;
    level._id_EF86["specialty_batterypack"] = 1;
    level._id_EF86["specialty_camo_elite"] = 1;
    level._id_EF86["specialty_scorestreakpack"] = 1;
    level._id_EF86["specialty_superpack"] = 1;
    level._id_EF86["specialty_dodge_defense"] = 1;
    level._id_EF86["specialty_spawncloak"] = 1;
    level._id_EF86["specialty_commando"] = 1;
    level._id_EF86["specialty_personal_trophy"] = 1;
    level._id_EF86["specialty_equipment_ping"] = 1;
    level._id_EF86["specialty_rugged_eqp"] = 1;
    level._id_EF86["specialty_cloak"] = 1;
    level._id_EF86["specialty_wall_lock"] = 1;
    level._id_EF86["specialty_rush"] = 1;
    level._id_EF86["specialty_hover"] = 1;
    level._id_EF86["specialty_scavenger_eqp"] = 1;
    level._id_EF86["specialty_spawnview"] = 1;
    level._id_EF86["specialty_headgear"] = 1;
    level._id_EF86["specialty_ftlslide"] = 1;
    level._id_EF86["specialty_improved_prone"] = 1;
    level._id_EF86["specialty_support_killstreaks"] = 1;
    level._id_EF86["specialty_overrideweaponspeed"] = 1;
    level._id_EF86["specialty_ballcarrier"] = 1;
    level._id_EF86["specialty_cloak_aerial"] = 1;
    level._id_EF86["specialty_spawn_radar"] = 1;
    level._id_EF86["specialty_ads_awareness"] = 1;
    level._id_EF86["specialty_rearguard"] = 1;
    level._id_EF86["specialty_sharp_focus"] = 1;
    level._id_EF86["specialty_bling"] = 1;
    level._id_EF86["specialty_moredamage"] = 1;
    level._id_EF86["specialty_comexp"] = 1;
    level._id_EF86["specialty_paint"] = 1;
    level._id_EF86["specialty_paint_pro"] = 1;
    level._id_EF86["specialty_adrenaline"] = 1;
    level._id_EF86["specialty_adrenaline_lite"] = 1;
    level._id_EF86["specialty_block_health_regen"] = 1;
    level._id_EF86["specialty_rshieldradar"] = 1;
    level._id_EF86["specialty_rshieldscrambler"] = 1;
    level._id_EF86["specialty_combathigh"] = 1;
    level._id_EF86["specialty_finalstand"] = 1;
    level._id_EF86["specialty_c4death"] = 1;
    level._id_EF86["specialty_juiced"] = 1;
    level._id_EF86["specialty_revenge"] = 1;
    level._id_EF86["specialty_light_armor"] = 1;
    level._id_EF86["specialty_carepackage"] = 1;
    level._id_EF86["specialty_stopping_power"] = 1;
    level._id_EF86["specialty_uav"] = 1;
    level._id_EF86["specialty_viewkickoverride"] = 1;
    level._id_EF86["specialty_affinityspeedboost"] = 1;
    level._id_EF86["specialty_affinityextralauncher"] = 1;
    level._id_EF86["bouncingbetty_mp"] = 1;
    level._id_EF86["c4_mp"] = 1;
    level._id_EF86["claymore_mp"] = 1;
    level._id_EF86["frag_grenade_mp"] = 1;
    level._id_EF86["semtex_mp"] = 1;
    level._id_EF86["cluster_grenade_mp"] = 1;
    level._id_EF86["throwingknife_mp"] = 1;
    level._id_EF86["throwingknifec4_mp"] = 1;
    level._id_EF86["throwingknifeteleport_mp"] = 1;
    level._id_EF86["throwingknifejugg_mp"] = 1;
    level._id_EF86["throwingknifesmokewall_mp"] = 1;
    level._id_EF86["proximity_explosive_mp"] = 1;
    level._id_EF86["mortar_shelljugg_mp"] = 1;
    level._id_EF86["case_bomb_mp"] = 1;
    level._id_EF86["blackhole_grenade_mp"] = 1;
    level._id_EF86["throwingreaper_mp"] = 1;
    level._id_EF86["transponder_mp"] = 1;
    level._id_EF86["sonic_sensor_mp"] = 1;
    level._id_EF86["sticky_mine_mp"] = 1;
    level._id_EF86["throwingknifedisruptor_mp"] = 1;
    level._id_EF86["pulse_grenade_mp"] = 1;
    level._id_EF86["portal_grenade_mp"] = 1;
    level._id_EF86["virus_grenade_mp"] = 1;
    level._id_EF86["concussion_grenade_mp"] = 1;
    level._id_EF86["sensor_grenade_mp"] = 1;
    level._id_EF86["gravity_grenade_mp"] = 1;
    level._id_EF86["flash_grenade_mp"] = 1;
    level._id_EF86["smoke_grenade_mp"] = 1;
    level._id_EF86["smoke_grenadejugg_mp"] = 1;
    level._id_EF86["emp_grenade_mp"] = 1;
    level._id_EF86["specialty_tacticalinsertion"] = 1;
    level._id_EF86["trophy_mp"] = 1;
    level._id_EF86["motion_sensor_mp"] = 1;
    level._id_EF86["proto_ricochet_device_mp"] = 1;
    level._id_EF86["bulletstorm_device_mp"] = 1;
    level._id_EF86["mobile_radar_mp"] = 1;
    level._id_EF86["gas_grenade_mp"] = 1;
    level._id_EF86["blackout_grenade_mp"] = 1;
    level._id_EF86["proxy_bomb_mp"] = 1;
    level._id_EF86["adrenaline_mist_mp"] = 1;
    level._id_EF86["domeshield_mp"] = 1;
    level._id_EF86["copycat_grenade_mp"] = 1;
    level._id_EF86["speed_strip_mp"] = 1;
    level._id_EF86["shard_ball_mp"] = 1;
    level._id_EF86["splash_grenade_mp"] = 1;
    level._id_EF86["forcepush_mp"] = 1;
    level._id_EF86["portal_generator_mp"] = 1;
    level._id_EF86["ammo_box_mp"] = 1;
    level._id_EF86["blackhat_mp"] = 1;
    level._id_EF86["flare_mp"] = 1;
    var_0 = scripts\mp\passives::_id_8239();

    foreach ( var_2 in var_0 )
    {
        level._id_EF86[var_2] = 1;
        var_3 = scripts\mp\passives::_id_804A( var_2 );

        if ( isdefined( var_3 ) )
            level._id_6A50[var_2] = [ var_3 ];
    }

    level._id_EF86["specialty_null"] = 1;
    level._id_CA60["specialty_afterburner"] = scripts\mp\perks\perkfunctions::_id_F634;
    level._id_CA66["specialty_afterburner"] = scripts\mp\perks\perkfunctions::_id_12C6E;
    level._id_CA60["specialty_blastshield"] = scripts\mp\perks\perkfunctions::_id_F667;
    level._id_CA66["specialty_blastshield"] = scripts\mp\perks\perkfunctions::_id_12C82;
    level._id_CA60["specialty_falldamage"] = scripts\mp\perks\perkfunctions::_id_F719;
    level._id_CA66["specialty_falldamage"] = scripts\mp\perks\perkfunctions::_id_12CC1;
    level._id_CA60["specialty_localjammer"] = scripts\mp\perks\perkfunctions::_id_F78A;
    level._id_CA66["specialty_localjammer"] = scripts\mp\perks\perkfunctions::_id_12CE9;
    level._id_CA60["specialty_thermal"] = scripts\mp\perks\perkfunctions::_id_F885;
    level._id_CA66["specialty_thermal"] = scripts\mp\perks\perkfunctions::_id_12D49;
    level._id_CA60["specialty_lightweight"] = scripts\mp\perks\perkfunctions::_id_F788;
    level._id_CA66["specialty_lightweight"] = scripts\mp\perks\perkfunctions::_id_12CE6;
    level._id_CA60["specialty_steelnerves"] = scripts\mp\perks\perkfunctions::_id_F862;
    level._id_CA66["specialty_steelnerves"] = scripts\mp\perks\perkfunctions::_id_12D39;
    level._id_CA60["specialty_delaymine"] = scripts\mp\perks\perkfunctions::_id_F6C1;
    level._id_CA66["specialty_delaymine"] = scripts\mp\perks\perkfunctions::_id_12CA1;
    level._id_CA60["specialty_saboteur"] = scripts\mp\perks\perkfunctions::_id_F827;
    level._id_CA66["specialty_saboteur"] = scripts\mp\perks\perkfunctions::_id_12D21;
    level._id_CA60["specialty_endgame"] = scripts\mp\perks\perkfunctions::_id_F6DE;
    level._id_CA66["specialty_endgame"] = scripts\mp\perks\perkfunctions::_id_12CAA;
    level._id_CA60["specialty_onemanarmy"] = scripts\mp\perks\perkfunctions::_id_F7C6;
    level._id_CA66["specialty_onemanarmy"] = scripts\mp\perks\perkfunctions::_id_12CF9;
    level._id_CA60["specialty_tacticalinsertion"] = scripts\mp\perks\perkfunctions::_id_F870;
    level._id_CA66["specialty_tacticalinsertion"] = scripts\mp\perks\perkfunctions::_id_12D41;
    level._id_CA60["specialty_weaponlaser"] = scripts\mp\perks\perkfunctions::_id_FB17;
    level._id_CA66["specialty_weaponlaser"] = scripts\mp\perks\perkfunctions::_id_12D68;
    level._id_CA60["specialty_steadyaimpro"] = scripts\mp\perks\perkfunctions::_id_F860;
    level._id_CA66["specialty_steadyaimpro"] = scripts\mp\perks\perkfunctions::_id_12D37;
    level._id_CA60["specialty_stun_resistance"] = scripts\mp\perks\perkfunctions::_id_F869;
    level._id_CA66["specialty_stun_resistance"] = scripts\mp\perks\perkfunctions::_id_12D3C;
    level._id_CA60["specialty_marksman"] = scripts\mp\perks\perkfunctions::_id_F78F;
    level._id_CA66["specialty_marksman"] = scripts\mp\perks\perkfunctions::_id_12CEC;
    level._id_CA60["specialty_rshieldradar"] = scripts\mp\perks\perkfunctions::_id_F821;
    level._id_CA66["specialty_rshieldradar"] = scripts\mp\perks\perkfunctions::_id_12D1D;
    level._id_CA60["specialty_rshieldscrambler"] = scripts\mp\perks\perkfunctions::_id_F823;
    level._id_CA66["specialty_rshieldscrambler"] = scripts\mp\perks\perkfunctions::_id_12D1E;
    level._id_CA60["specialty_double_load"] = scripts\mp\perks\perkfunctions::_id_F6D7;
    level._id_CA66["specialty_double_load"] = scripts\mp\perks\perkfunctions::_id_12CA8;
    level._id_CA60["specialty_sharp_focus"] = scripts\mp\perks\perkfunctions::_id_F83C;
    level._id_CA66["specialty_sharp_focus"] = scripts\mp\perks\perkfunctions::_id_12D29;
    level._id_CA60["specialty_hard_shell"] = scripts\mp\perks\perkfunctions::_id_F73A;
    level._id_CA66["specialty_hard_shell"] = scripts\mp\perks\perkfunctions::_id_12CCC;
    level._id_CA60["specialty_regenfaster"] = scripts\mp\perks\perkfunctions::_id_F81B;
    level._id_CA66["specialty_regenfaster"] = scripts\mp\perks\perkfunctions::_id_12D19;
    level._id_CA60["specialty_autospot"] = scripts\mp\perks\perkfunctions::_id_F650;
    level._id_CA66["specialty_autospot"] = scripts\mp\perks\perkfunctions::_id_12C76;
    level._id_CA60["specialty_empimmune"] = scripts\mp\perks\perkfunctions::_id_F6DC;
    level._id_CA66["specialty_empimmune"] = scripts\mp\perks\perkfunctions::_id_12CA9;
    level._id_CA60["specialty_overkill_pro"] = scripts\mp\perks\perkfunctions::_id_F7D0;
    level._id_CA66["specialty_overkill_pro"] = scripts\mp\perks\perkfunctions::_id_12D01;
    level._id_CA60["specialty_refill_grenades"] = scripts\mp\perks\perkfunctions::_id_F819;
    level._id_CA66["specialty_refill_grenades"] = scripts\mp\perks\perkfunctions::_id_12D17;
    level._id_CA60["specialty_refill_ammo"] = scripts\mp\perks\perkfunctions::_id_F818;
    level._id_CA66["specialty_refill_ammo"] = scripts\mp\perks\perkfunctions::_id_12D16;
    level._id_CA60["specialty_combat_speed"] = scripts\mp\perks\perkfunctions::_id_F698;
    level._id_CA66["specialty_combat_speed"] = scripts\mp\perks\perkfunctions::_id_12C95;
    level._id_CA60["specialty_gambler"] = scripts\mp\perks\perkfunctions::_id_F71F;
    level._id_CA66["specialty_gambler"] = scripts\mp\perks\perkfunctions::_id_12CC5;
    level._id_CA60["specialty_comexp"] = scripts\mp\perks\perkfunctions::_id_F69B;
    level._id_CA66["specialty_comexp"] = scripts\mp\perks\perkfunctions::_id_12C97;
    level._id_CA60["specialty_gunsmith"] = scripts\mp\perks\perkfunctions::_id_F737;
    level._id_CA66["specialty_gunsmith"] = scripts\mp\perks\perkfunctions::_id_12CCB;
    level._id_CA60["specialty_tagger"] = scripts\mp\perks\perkfunctions::_id_F871;
    level._id_CA66["specialty_tagger"] = scripts\mp\perks\perkfunctions::_id_12D42;
    level._id_CA60["specialty_pitcher"] = scripts\mp\perks\perkfunctions::_id_F7E9;
    level._id_CA66["specialty_pitcher"] = scripts\mp\perks\perkfunctions::_id_12D0C;
    level._id_CA60["specialty_boom"] = scripts\mp\perks\perkfunctions::_id_F670;
    level._id_CA66["specialty_boom"] = scripts\mp\perks\perkfunctions::_id_12C87;
    level._id_CA60["specialty_triggerhappy"] = scripts\mp\perks\perkfunctions::_id_F897;
    level._id_CA66["specialty_triggerhappy"] = scripts\mp\perks\perkfunctions::_id_12D51;
    level._id_CA60["specialty_incog"] = scripts\mp\perks\perkfunctions::_id_F754;
    level._id_CA66["specialty_incog"] = scripts\mp\perks\perkfunctions::_id_12CD7;
    level._id_CA60["specialty_blindeye"] = scripts\mp\perks\perkfunctions::_id_F668;
    level._id_CA66["specialty_blindeye"] = scripts\mp\perks\perkfunctions::_id_12C83;
    level._id_CA60["specialty_quickswap"] = scripts\mp\perks\perkfunctions::_id_F810;
    level._id_CA66["specialty_quickswap"] = scripts\mp\perks\perkfunctions::_id_12D13;
    level._id_CA60["specialty_extraammo"] = scripts\mp\perks\perkfunctions::_id_F6F4;
    level._id_CA66["specialty_extraammo"] = scripts\mp\perks\perkfunctions::_id_12CB3;
    level._id_CA60["specialty_extra_equipment"] = scripts\mp\perks\perkfunctions::_id_F6F8;
    level._id_CA66["specialty_extra_equipment"] = scripts\mp\perks\perkfunctions::_id_12CB7;
    level._id_CA60["specialty_extra_deadly"] = scripts\mp\perks\perkfunctions::_id_F6F6;
    level._id_CA66["specialty_extra_deadly"] = scripts\mp\perks\perkfunctions::_id_12CB5;
    level._id_CA60["specialty_fastcrouch"] = scripts\mp\perks\perkfunctions::setfastcrouch;
    level._id_CA66["specialty_fastcrouch"] = scripts\mp\perks\perkfunctions::unsetfastcrouch;
    level._id_CA60["specialty_battleslide"] = scripts\mp\perks\perkfunctions::_id_F65B;
    level._id_CA66["specialty_battleslide"] = scripts\mp\perks\perkfunctions::_id_12C7B;
    level._id_CA60["specialty_battleslide_shield"] = scripts\mp\perks\perkfunctions::_id_F65D;
    level._id_CA66["specialty_battleslide_shield"] = scripts\mp\perks\perkfunctions::_id_12C7D;
    level._id_CA60["specialty_bullet_outline"] = scripts\mp\perks\perkfunctions::_id_F675;
    level._id_CA66["specialty_bullet_outline"] = scripts\mp\perks\perkfunctions::_id_12C88;
    level._id_CA60["specialty_twoprimaries"] = scripts\mp\perks\perkfunctions::_id_F7CF;
    level._id_CA66["specialty_twoprimaries"] = scripts\mp\perks\perkfunctions::_id_12D00;
    level._id_CA60["specialty_activereload"] = scripts\mp\perks\perkfunctions::_id_F62C;
    level._id_CA66["specialty_activereload"] = scripts\mp\perks\perkfunctions::_id_12C66;
    level._id_CA60["specialty_lifepack"] = scripts\mp\perks\perkfunctions::_id_F782;
    level._id_CA66["specialty_lifepack"] = scripts\mp\perks\perkfunctions::_id_12CE4;
    level._id_CA60["specialty_toughenup"] = scripts\mp\perks\perkfunctions::_id_F891;
    level._id_CA66["specialty_toughenup"] = scripts\mp\perks\perkfunctions::_id_12D4D;
    level._id_CA60["specialty_scoutping"] = scripts\mp\perks\perkfunctions::_id_F82D;
    level._id_CA66["specialty_scoutping"] = scripts\mp\perks\perkfunctions::_id_12D26;
    level._id_CA60["specialty_corpse_steal"] = scripts\mp\perks\perkfunctions::_id_F6A1;
    level._id_CA66["specialty_corpse_steal"] = scripts\mp\perks\perkfunctions::_id_12C9A;
    level._id_CA60["specialty_phase_speed"] = scripts\mp\perks\perkfunctions::_id_F7E6;
    level._id_CA66["specialty_phase_speed"] = scripts\mp\perks\perkfunctions::_id_12D0A;
    level._id_CA60["specialty_dodge"] = scripts\mp\perks\perkfunctions::_id_F6CC;
    level._id_CA66["specialty_dodge"] = scripts\mp\perks\perkfunctions::_id_12CA4;
    level._id_CA60["specialty_extra_dodge"] = scripts\mp\perks\perkfunctions::_id_F6F7;
    level._id_CA66["specialty_extra_dodge"] = scripts\mp\perks\perkfunctions::_id_12CB6;
    level._id_CA60["specialty_ground_pound"] = scripts\mp\perks\perkfunctions::_id_F72D;
    level._id_CA66["specialty_ground_pound"] = scripts\mp\perks\perkfunctions::_id_12CC7;
    level._id_CA60["specialty_ground_pound_shock"] = scripts\mp\perks\perkfunctions::_id_F730;
    level._id_CA66["specialty_ground_pound_shock"] = scripts\mp\perks\perkfunctions::_id_12CCA;
    level._id_CA60["specialty_ground_pound_shield"] = scripts\mp\perks\perkfunctions::_id_F72F;
    level._id_CA66["specialty_ground_pound_shield"] = scripts\mp\perks\perkfunctions::_id_12CC9;
    level._id_CA60["specialty_thruster"] = scripts\mp\perks\perkfunctions::_id_F888;
    level._id_CA66["specialty_thruster"] = scripts\mp\perks\perkfunctions::_id_12D4B;
    level._id_CA60["specialty_phase_slide"] = scripts\mp\perks\perkfunctions::_id_F7E5;
    level._id_CA66["specialty_phase_slide"] = scripts\mp\perks\perkfunctions::_id_12D09;
    level._id_CA60["specialty_tele_slide"] = scripts\mp\perks\perkfunctions::_id_F880;
    level._id_CA66["specialty_tele_slide"] = scripts\mp\perks\perkfunctions::_id_12D46;
    level._id_CA60["specialty_phaseslash_rephase"] = scripts\mp\perks\perkfunctions::_id_F7E4;
    level._id_CA66["specialty_phaseslash_rephase"] = scripts\mp\perks\perkfunctions::_id_12D08;
    level._id_CA60["specialty_phase_fall"] = scripts\mp\perks\perkfunctions::_id_F7E0;
    level._id_CA66["specialty_phase_fall"] = scripts\mp\perks\perkfunctions::_id_12D05;
    level._id_CA60["specialty_sixth_sense"] = scripts\mp\perks\perkfunctions::_id_F846;
    level._id_CA66["specialty_sixth_sense"] = scripts\mp\perks\perkfunctions::_id_12D2E;
    level._id_CA60["specialty_enchanced_sixth_sense"] = scripts\mp\perks\perkfunctions::_id_F6E9;
    level._id_CA66["specialty_enhanced_sixth_sense"] = scripts\mp\perks\perkfunctions::_id_12CAD;
    level._id_CA60["specialty_adrenaline"] = scripts\mp\perks\perkfunctions::_id_F62F;
    level._id_CA66["specialty_adrenaline"] = scripts\mp\perks\perkfunctions::_id_12C68;
    level._id_CA60["specialty_adrenaline_lite"] = scripts\mp\perks\perkfunctions::_id_F630;
    level._id_CA66["specialty_adrenaline_lite"] = scripts\mp\perks\perkfunctions::_id_12C69;
    level._id_CA60["specialty_extend_dodge"] = scripts\mp\perks\perkfunctions::_id_F6F1;
    level._id_CA66["specialty_extend_dodge"] = scripts\mp\perks\perkfunctions::_id_12CB1;
    level._id_CA60["specialty_aura_regen"] = scripts\mp\perks\perkfunctions::_id_F64E;
    level._id_CA66["specialty_aura_regen"] = scripts\mp\perks\perkfunctions::_id_12C74;
    level._id_CA60["specialty_aura_quickswap"] = scripts\mp\perks\perkfunctions::_id_F64D;
    level._id_CA66["specialty_aura_quickswap"] = scripts\mp\perks\perkfunctions::_id_12C73;
    level._id_CA60["specialty_aura_speed"] = scripts\mp\perks\perkfunctions::_id_F64F;
    level._id_CA66["specialty_aura_speed"] = scripts\mp\perks\perkfunctions::_id_12C75;
    level._id_CA60["specialty_mark_targets"] = scripts\mp\perks\perkfunctions::_id_F790;
    level._id_CA66["specialty_mark_targets"] = scripts\mp\perks\perkfunctions::_id_12CED;
    level._id_CA60["specialty_batterypack"] = scripts\mp\perks\perkfunctions::_id_F65A;
    level._id_CA66["specialty_batterypack"] = scripts\mp\perks\perkfunctions::_id_12C7A;
    level._id_CA60["specialty_camo_clone"] = scripts\mp\perks\perkfunctions::_id_F67A;
    level._id_CA66["specialty_camo_clone"] = scripts\mp\perks\perkfunctions::_id_12C8B;
    level._id_CA60["specialty_camo_elite"] = scripts\mp\perks\perkfunctions::_id_F67B;
    level._id_CA66["specialty_camo_elite"] = scripts\mp\perks\perkfunctions::_id_12C8C;
    level._id_CA60["specialty_block_health_regen"] = scripts\mp\perks\perkfunctions::_id_F669;
    level._id_CA66["specialty_block_health_regen"] = scripts\mp\perks\perkfunctions::_id_12C84;
    level._id_CA60["specialty_scorestreakpack"] = scripts\mp\perks\perkfunctions::_id_F82C;
    level._id_CA66["specialty_scorestreakpack"] = scripts\mp\perks\perkfunctions::_id_12D25;
    level._id_CA60["specialty_superpack"] = scripts\mp\perks\perkfunctions::_id_F86B;
    level._id_CA66["specialty_superpack"] = scripts\mp\perks\perkfunctions::_id_12D3E;
    level._id_CA60["specialty_dodge_defense"] = scripts\mp\perks\perkfunctions::_id_F6CE;
    level._id_CA66["specialty_dodge_defense"] = scripts\mp\perks\perkfunctions::_id_12CA5;
    level._id_CA60["specialty_battleslide_offense"] = scripts\mp\perks\perkfunctions::_id_F65C;
    level._id_CA66["specialty_battleslide_offense"] = scripts\mp\perks\perkfunctions::_id_12C7C;
    level._id_CA60["specialty_spawncloak"] = scripts\mp\perks\perkfunctions::_id_F84F;
    level._id_CA66["specialty_spawncloak"] = scripts\mp\perks\perkfunctions::_id_12D32;
    level._id_CA60["specialty_meleekill"] = scripts\mp\perks\perkfunctions::_id_F793;
    level._id_CA66["specialty_meleekill"] = scripts\mp\perks\perkfunctions::_id_12CEE;
    level._id_CA60["specialty_powercell"] = scripts\mp\perks\perkfunctions::_id_F807;
    level._id_CA66["specialty_powercell"] = scripts\mp\perks\perkfunctions::_id_12D0F;
    level._id_CA60["specialty_hardline"] = scripts\mp\perks\perkfunctions::sethardline;
    level._id_CA66["specialty_hardline"] = scripts\mp\perks\perkfunctions::unsethardline;
    level._id_CA60["specialty_hunter"] = scripts\mp\perks\perkfunctions::_id_F74A;
    level._id_CA66["specialty_hunter"] = scripts\mp\perks\perkfunctions::_id_12CD3;
    level._id_CA60["specialty_overclock"] = scripts\mp\perks\perkfunctions::_id_F7CD;
    level._id_CA66["specialty_overclock"] = scripts\mp\perks\perkfunctions::_id_12CFE;
    level._id_CA60["specialty_tracker"] = scripts\mp\perks\perkfunctions::_id_F894;
    level._id_CA66["specialty_tracker"] = scripts\mp\perks\perkfunctions::_id_12D4E;
    level._id_CA60["specialty_personal_trophy"] = scripts\mp\perks\perkfunctions::_id_F7DE;
    level._id_CA66["specialty_personal_trophy"] = scripts\mp\perks\perkfunctions::_id_12D04;
    level._id_CA60["specialty_disruptor_punch"] = scripts\mp\perks\perkfunctions::_id_F6CA;
    level._id_CA66["specialty_disruptor_punch"] = scripts\mp\perks\perkfunctions::_id_12CA3;
    level._id_CA60["specialty_equipment_ping"] = scripts\mp\perks\perkfunctions::_id_F6EB;
    level._id_CA66["specialty_equipment_ping"] = scripts\mp\perks\perkfunctions::_id_12CAE;
    level._id_CA60["specialty_rugged_eqp"] = scripts\mp\perks\perkfunctions::_id_F825;
    level._id_CA66["specialty_rugged_eqp"] = scripts\mp\perks\perkfunctions::_id_12D1F;
    level._id_CA60["specialty_man_at_arms"] = scripts\mp\perks\perkfunctions::_id_F78D;
    level._id_CA66["specialty_man_at_arms"] = scripts\mp\perks\perkfunctions::_id_12CEB;
    level._id_CA60["specialty_outlinekillstreaks"] = scripts\mp\perks\perkfunctions::_id_F7CB;
    level._id_CA66["specialty_outlinekillstreaks"] = scripts\mp\perks\perkfunctions::_id_12CFC;
    level._id_CA60["specialty_engineer"] = scripts\mp\perks\perkfunctions::_id_F6E4;
    level._id_CA66["specialty_engineer"] = scripts\mp\perks\perkfunctions::_id_12CAB;
    level._id_CA60["specialty_cloak"] = scripts\mp\perks\perkfunctions::_id_F693;
    level._id_CA66["specialty_cloak"] = scripts\mp\perks\perkfunctions::_id_12C90;
    level._id_CA60["specialty_wall_lock"] = scripts\mp\perks\perkfunctions::_id_FB15;
    level._id_CA66["specialty_wall_lock"] = scripts\mp\perks\perkfunctions::_id_12D66;
    level._id_CA60["specialty_momentum"] = scripts\mp\perks\perkfunctions::_id_F7A4;
    level._id_CA66["specialty_momentum"] = scripts\mp\perks\perkfunctions::_id_12CF2;
    level._id_CA60["specialty_hover"] = scripts\mp\perks\perkfunctions::_id_F747;
    level._id_CA66["specialty_hover"] = scripts\mp\perks\perkfunctions::_id_12CD2;
    level._id_CA60["specialty_rush"] = scripts\mp\perks\perkfunctions::_id_F826;
    level._id_CA66["specialty_rush"] = scripts\mp\perks\perkfunctions::_id_12D20;
    level._id_CA60["specialty_scavenger_eqp"] = scripts\mp\perks\perkfunctions::_id_F829;
    level._id_CA66["specialty_scavenger_eqp"] = scripts\mp\perks\perkfunctions::_id_12D22;
    level._id_CA60["specialty_spawnview"] = scripts\mp\perks\perkfunctions::_id_F854;
    level._id_CA66["specialty_spawnview"] = scripts\mp\perks\perkfunctions::_id_12D34;
    level._id_CA60["specialty_headgear"] = scripts\mp\perks\perkfunctions::_id_F73C;
    level._id_CA66["specialty_headgear"] = scripts\mp\perks\perkfunctions::_id_12CCD;
    level._id_CA60["specialty_ftlslide"] = scripts\mp\perks\perkfunctions::_id_F71D;
    level._id_CA66["specialty_ftlslide"] = scripts\mp\perks\perkfunctions::_id_12CC3;
    level._id_CA60["specialty_improved_prone"] = scripts\mp\perks\perkfunctions::_id_F753;
    level._id_CA66["specialty_improved_prone"] = scripts\mp\perks\perkfunctions::_id_12CD6;
    level._id_CA60["specialty_ghost"] = scripts\mp\perks\perkfunctions::_id_F721;
    level._id_CA66["specialty_ghost"] = scripts\mp\perks\perkfunctions::_id_12CC6;
    level._id_CA60["specialty_support_killstreaks"] = scripts\mp\perks\perkfunctions::_id_F86D;
    level._id_CA66["specialty_support_killstreaks"] = scripts\mp\perks\perkfunctions::_id_12D40;
    level._id_CA60["specialty_overrideweaponspeed"] = scripts\mp\perks\perkfunctions::_id_F7D2;
    level._id_CA66["specialty_overrideweaponspeed"] = scripts\mp\perks\perkfunctions::_id_12D02;
    level._id_CA60["specialty_ballcarrier"] = scripts\mp\perks\perkfunctions::_id_F657;
    level._id_CA66["specialty_ballcarrier"] = scripts\mp\perks\perkfunctions::_id_12C77;
    level._id_CA60["specialty_cloak_aerial"] = scripts\mp\perks\perkfunctions::_id_F694;
    level._id_CA66["specialty_cloak_aerial"] = scripts\mp\perks\perkfunctions::_id_12C91;
    level._id_CA60["specialty_spawn_radar"] = scripts\mp\perks\perkfunctions::_id_F852;
    level._id_CA66["specialty_spawn_radar"] = scripts\mp\perks\perkfunctions::_id_12D33;
    level._id_CA60["specialty_improvedmelee"] = scripts\mp\perks\perkfunctions::_id_F752;
    level._id_CA66["specialty_improvedmelee"] = scripts\mp\perks\perkfunctions::_id_12CD5;
    level._id_CA60["specialty_thief"] = scripts\mp\perks\perkfunctions::_id_F886;
    level._id_CA66["specialty_thief"] = scripts\mp\perks\perkfunctions::_id_12D4A;
    level._id_CA60["specialty_ads_awareness"] = scripts\mp\perks\perkfunctions::_id_F631;
    level._id_CA66["specialty_ads_awareness"] = scripts\mp\perks\perkfunctions::_id_12C6B;
    level._id_CA60["specialty_rearguard"] = scripts\mp\perks\perkfunctions::_id_F815;
    level._id_CA66["specialty_rearguard"] = scripts\mp\perks\perkfunctions::_id_12D14;
    level._id_CA60["specialty_combathigh"] = scripts\mp\perks\perkfunctions::_id_F696;
    level._id_CA66["specialty_combathigh"] = scripts\mp\perks\perkfunctions::_id_12C92;
    level._id_CA60["specialty_light_armor"] = scripts\mp\perks\perkfunctions::_id_F785;
    level._id_CA66["specialty_light_armor"] = scripts\mp\perks\perkfunctions::_id_12CE5;
    level._id_CA60["specialty_revenge"] = scripts\mp\perks\perkfunctions::_id_F81D;
    level._id_CA66["specialty_revenge"] = scripts\mp\perks\perkfunctions::_id_12D1A;
    level._id_CA60["specialty_c4death"] = scripts\mp\perks\perkfunctions::_id_F678;
    level._id_CA66["specialty_c4death"] = scripts\mp\perks\perkfunctions::_id_12C8A;
    level._id_CA60["specialty_finalstand"] = scripts\mp\perks\perkfunctions::_id_F704;
    level._id_CA66["specialty_finalstand"] = scripts\mp\perks\perkfunctions::_id_12CBD;
    level._id_CA60["specialty_juiced"] = scripts\mp\perks\perkfunctions::_id_F769;
    level._id_CA66["specialty_juiced"] = scripts\mp\perks\perkfunctions::_id_12CDC;
    level._id_CA60["specialty_carepackage"] = scripts\mp\perks\perkfunctions::_id_F67E;
    level._id_CA66["specialty_carepackage"] = scripts\mp\perks\perkfunctions::_id_12C8D;
    level._id_CA60["specialty_stopping_power"] = scripts\mp\perks\perkfunctions::_id_F864;
    level._id_CA66["specialty_stopping_power"] = scripts\mp\perks\perkfunctions::_id_12D3A;
    level._id_CA60["specialty_uav"] = scripts\mp\perks\perkfunctions::_id_F89F;
    level._id_CA66["specialty_uav"] = scripts\mp\perks\perkfunctions::_id_12D53;
    level._id_CA60["specialty_viewkickoverride"] = scripts\mp\perks\perkfunctions::_id_FB0D;
    level._id_CA66["specialty_viewkickoverride"] = scripts\mp\perks\perkfunctions::_id_12D64;
    level._id_CA60["specialty_affinityspeedboost"] = scripts\mp\perks\perkfunctions::_id_F633;
    level._id_CA66["specialty_affinityspeedboost"] = scripts\mp\perks\perkfunctions::_id_12C6D;
    level._id_CA60["specialty_affinityextralauncher"] = scripts\mp\perks\perkfunctions::_id_F632;
    level._id_CA66["specialty_affinityextralauncher"] = scripts\mp\perks\perkfunctions::_id_12C6C;
    level._id_CA60["passive_minimap_decoys"] = scripts\mp\perks\weaponpassives::_id_F79A;
    level._id_CA66["passive_minimap_decoys"] = scripts\mp\perks\weaponpassives::_id_12CF0;
    level._id_CA60["passive_headshot_ammo"] = scripts\mp\perks\weaponpassives::_id_F73F;
    level._id_CA66["passive_headshot_ammo"] = scripts\mp\perks\weaponpassives::_id_12CCE;
    level._id_CA60["passive_scrambler"] = scripts\mp\perks\weaponpassives::_id_F82F;
    level._id_CA66["passive_scrambler"] = scripts\mp\perks\weaponpassives::_id_12D27;
    level._id_CA60["passive_last_shots_ammo"] = scripts\mp\perks\weaponpassives::_id_F77D;
    level._id_CA66["passive_last_shots_ammo"] = scripts\mp\perks\weaponpassives::_id_12CE2;
    level._id_CA60["passive_health_on_kill"] = scripts\mp\perks\weaponpassives::_id_F740;
    level._id_CA66["passive_health_on_kill"] = scripts\mp\perks\weaponpassives::_id_12CCF;
    level._id_CA60["passive_double_kill_reload"] = scripts\mp\perks\weaponpassives::_id_F6D6;
    level._id_CA66["passive_double_kill_reload"] = scripts\mp\perks\weaponpassives::_id_12CA7;
    level._id_CA60["passive_explosive_kills"] = scripts\mp\perks\weaponpassives::_id_F6F0;
    level._id_CA66["passive_explosive_kills"] = scripts\mp\perks\weaponpassives::_id_12CB0;
    level._id_CA60["passive_miss_refund"] = scripts\mp\perks\weaponpassives::_id_F79B;
    level._id_CA66["passive_miss_refund"] = scripts\mp\perks\weaponpassives::_id_12CF1;
    level._id_CA60["passive_move_speed"] = scripts\mp\perks\weaponpassives::_id_F7AA;
    level._id_CA66["passive_move_speed"] = scripts\mp\perks\weaponpassives::_id_12CF5;
    level._id_CA60["passive_fast_rechamber_move_speed"] = scripts\mp\perks\weaponpassives::setrechambermovespeedpassive;
    level._id_CA66["passive_fast_rechamber_move_speed"] = scripts\mp\perks\weaponpassives::unsetrechambermovespeedpassive;
    level._id_CA60["passive_extra_xp"] = scripts\mp\perks\weaponpassives::_id_F6FD;
    level._id_CA66["passive_extra_xp"] = scripts\mp\perks\weaponpassives::_id_12CBA;
    level._id_CA60["passive_nuke"] = scripts\mp\perks\weaponpassives::_id_F7BD;
    level._id_CA66["passive_nuke"] = scripts\mp\perks\weaponpassives::_id_12CF8;
    level._id_CA60["passive_berserk"] = scripts\mp\perks\weaponpassives::setquadfeederpassive;
    level._id_CA66["passive_berserk "] = scripts\mp\perks\weaponpassives::unsetquadfeederpassive;
    level._id_CA60["passive_streak_ammo"] = scripts\mp\perks\weaponpassives::_id_F865;
    level._id_CA66["passive_streak_ammo"] = scripts\mp\perks\weaponpassives::_id_12D3B;
    level._id_CA60["passive_score_bonus_kills"] = scripts\mp\perks\weaponpassives::_id_F82A;
    level._id_CA66["passive_score_bonus_kills"] = scripts\mp\perks\weaponpassives::_id_12D23;
    level._id_CA60["passive_score_bonus_objectives"] = scripts\mp\perks\weaponpassives::_id_F82B;
    level._id_CA66["passive_score_bonus_objectives"] = scripts\mp\perks\weaponpassives::_id_12D24;
    level._id_CA60["passive_hivemind"] = scripts\mp\perks\weaponpassives::_id_F746;
    level._id_CA66["passive_hivemind"] = scripts\mp\perks\weaponpassives::_id_12CD1;
    level._id_CA60["passive_scoutping"] = scripts\mp\perks\perkfunctions::_id_F82D;
    level._id_CA66["passive_scoutping"] = scripts\mp\perks\perkfunctions::_id_12D26;
    level._id_CA60["passive_hunter_killer"] = scripts\mp\perks\weaponpassives::_id_F74B;
    level._id_CA66["passive_hunter_killer"] = scripts\mp\perks\weaponpassives::_id_12CD4;
    level._id_CA66["passive_double_kill_super"] = scripts\mp\perks\weaponpassives::unsetdoublekillsuperpassive;
    level._id_CA60["passive_wallrun_quieter"] = scripts\mp\perks\weaponpassives::setwallrunquieterpassive;
    level._id_CA66["passive_wallrun_quieter"] = scripts\mp\perks\weaponpassives::unsetwallrunquieterpassive;
    level._id_CA60["passive_slide_blastshield"] = scripts\mp\perks\weaponpassives::setslideblastshield;
    level._id_CA66["passive_slide_blastshield"] = scripts\mp\perks\weaponpassives::unsetslideblastshield;
    level._id_CA60["passive_prone_blindeye"] = scripts\mp\perks\weaponpassives::setproneblindeye;
    level._id_CA66["passive_prone_blindeye"] = scripts\mp\perks\weaponpassives::unsetproneblindeye;
    level._id_CA60["passive_stationary_engineer"] = scripts\mp\perks\weaponpassives::setstationaryengineer;
    level._id_CA66["passive_stationary_engineer"] = scripts\mp\perks\weaponpassives::unsetstationaryengineer;
    level._id_CA60["passive_doppleganger"] = scripts\mp\perks\weaponpassives::setdoppleganger;
    level._id_CA66["passive_doppleganger"] = scripts\mp\perks\weaponpassives::unsetdoppleganger;
    level._id_CA60["passive_collat_streak"] = scripts\mp\perks\weaponpassives::setcollatstreak;
    level._id_CA66["passive_collat_streak"] = scripts\mp\perks\weaponpassives::unsetcollatstreak;
    level._id_6A50["specialty_coldblooded"] = [ "specialty_spygame", "specialty_heartbreaker", "specialty_radarringresist" ];
    level._id_6A50["specialty_blindeye"] = [ "specialty_noplayertarget" ];
    level._id_6A50["specialty_quickswap"] = [ "specialty_fastoffhand" ];
    level._id_6A50["specialty_improvedgunkick"] = [ "specialty_reducedsway" ];
    level._id_6A50["specialty_dexterity"] = [ "specialty_fastreload", "specialty_quickswap" ];
    level._id_6A50["specialty_engineer"] = [ "specialty_detectexplosive", "specialty_delaymine", "specialty_outlinekillstreaks", "specialty_drawenemyturrets" ];
    level._id_6A50["specialty_empimmune"] = [ "specialty_tracker_jammer", "specialty_noscopeoutline" ];
    level._id_6A50["specialty_afterburner"] = [ "specialty_thruster" ];
    level._id_6A50["specialty_man_at_arms"] = [ "specialty_extraammo", "specialty_overrideweaponspeed" ];
    level._id_6A50["specialty_phaseslash"] = [ "specialty_phaseslash_rephase" ];
    level._id_6A50["specialty_ghost"] = [ "specialty_gpsjammer" ];
    level._id_6A50["specialty_equipment_ping"] = [ "specialty_paint" ];
    level._id_6A50["specialty_blast_suppressor"] = [ "specialty_silentdoublejump", "specialty_silentdoublejump_audio" ];
    level._id_6A50["specialty_quieter"] = [ "specialty_silentdoublejump_audio" ];
    level._id_6A50["specialty_improvedmelee"] = [ "specialty_extendedmelee", "specialty_fastermelee", "specialty_thief" ];
    level._id_6A50["specialty_marksman"] = [ "specialty_viewkickoverride" ];
    level._id_6A50["specialty_tracker"] = [ "specialty_selectivehearing", "specialty_tracker_pro" ];
    level._id_6A50["specialty_sprintfire"] = [ "specialty_fastsprintrecovery" ];
    _id_98B0();
    _id_B675();
    _id_B673();
    _id_98B2();
    level thread _id_C56E();
}

_id_B675()
{
    if ( !isdefined( level._id_B676 ) )
        level._id_B676 = [];

    var_0 = 0;

    for (;;)
    {
        var_1 = tablelookupbyrow( "mp/menuRigPerks.csv", var_0, 0 );

        if ( var_1 == "" )
            break;

        var_2 = tablelookupbyrow( "mp/menuRigPerks.csv", var_0, 1 );
        var_3 = tablelookupbyrow( "mp/menuRigPerks.csv", var_0, 2 );
        var_4 = spawnstruct();
        var_4._id_92B8 = var_1;
        var_4._id_DE3F = var_3;
        var_4._id_2123 = var_2;

        if ( !isdefined( level._id_B676[var_3] ) )
            level._id_B676[var_3] = var_4;

        var_0++;
    }
}

_id_B673()
{
    if ( !isdefined( level._id_B674 ) )
        level._id_B674 = [];

    var_0 = 0;

    for (;;)
    {
        var_1 = tablelookupbyrow( "mp/menuPerks.csv", var_0, 0 );

        if ( var_1 == "" )
            break;

        var_2 = tablelookupbyrow( "mp/menuPerks.csv", var_0, 1 );
        var_3 = tablelookupbyrow( "mp/menuPerks.csv", var_0, 2 );
        var_4 = spawnstruct();
        var_4.name = var_3;
        var_4._id_DE3F = var_3;
        var_4._id_10307 = var_2;

        if ( !isdefined( level._id_B674[var_3] ) )
            level._id_B674[var_3] = var_4;

        var_0++;
    }
}

_id_98B2()
{
    if ( !isdefined( level._id_CA63 ) )
        level._id_CA63 = [];

    level._id_CA5E = [];
    var_0 = 0;

    for (;;)
    {
        var_1 = tablelookupbyrow( "mp/perkTable.csv", var_0, 0 );

        if ( var_1 == "" )
            break;

        var_2 = tablelookupbyrow( "mp/perkTable.csv", var_0, 1 );
        var_3 = spawnstruct();
        var_3._id_DE3F = var_2;
        var_3._id_92B8 = int( var_1 );

        if ( !isdefined( level._id_CA63[var_2] ) )
            level._id_CA63[var_2] = var_3;

        level._id_CA5E[var_3._id_92B8] = var_3._id_DE3F;
        var_0++;
    }
}

_id_7DE8()
{
    var_0 = [];

    foreach ( var_2 in level._id_B674 )
    {
        if ( scripts\mp\utility\game::_id_12D6( var_2.name ) )
            continue;

        var_0[var_0.size] = var_2.name;
    }

    return var_0;
}

_id_805C( var_0 )
{
    var_1 = level._id_B674[var_0];

    if ( !isdefined( var_1 ) )
        return undefined;

    return int( var_1._id_10307 );
}

_id_13144( var_0 )
{
    if ( !scripts\mp\utility\game::_id_CA5F() )
        var_0 = "specialty_null";
    else
    {
        switch ( var_0 )
        {
            case "specialty_deadeye":
            case "specialty_scavenger":
            case "specialty_bulletaccuracy":
            case "specialty_lightweight":
            case "specialty_selectivehearing":
            case "specialty_gpsjammer":
            case "specialty_detectexplosive":
            case "specialty_reducedsway":
            case "specialty_silentkill":
            case "specialty_chain_reaction":
            case "specialty_corpse_steal":
            case "specialty_extra_deadly":
            case "specialty_gambler":
            case "specialty_explosivedamage":
            case "specialty_paint":
            case "specialty_comexp":
            case "specialty_superpack":
            case "specialty_scorestreakpack":
            case "specialty_batterypack":
            case "specialty_extend_dodge":
            case "specialty_extra_dodge":
            case "specialty_gung_ho":
            case "specialty_activereload":
            case "specialty_twoprimaries":
            case "specialty_pitcher":
            case "specialty_falldamage":
            case "specialty_extraammo":
            case "specialty_battleslide":
            case "specialty_blindeye":
            case "specialty_sixth_sense":
            case "specialty_quieter":
            case "specialty_stun_resistance":
            case "specialty_blastshield":
            case "specialty_regenfaster":
            case "specialty_boom":
            case "specialty_sharp_focus":
            case "specialty_null":
            case "specialty_hardline":
            case "specialty_stalker":
            case "specialty_quickswap":
            case "specialty_marathon":
            case "specialty_fastsprintrecovery":
            case "specialty_quickdraw":
            case "specialty_fastreload":
                break;
            default:
                var_0 = "specialty_null";
                break;
        }
    }

    return var_0;
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread onplayerspawned();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );
    self._id_CA5B = [];
    self._id_CA5D = [];
    self._id_11B2C = undefined;
    self._id_13CA0 = [];
    self._id_C47E = 0;

    for (;;)
    {
        self waittill( "spawned_player" );
        self._id_C47E = 0;
        thread scripts\mp\killstreaks\portableaoegenerator::_id_7737();
    }
}

_id_98B0()
{
    level._id_8488 = 0.08;
    level._id_A4A7 = 0.08;
    level._id_A4A6 = 0.08;
    level._id_218B = 1.5;
    level.armorpiercingmodks = 1.25;
    level._id_DE8A = scripts\mp\utility\game::_id_7F1D( "perk_fastRegenWaitMS", 800 ) / 1000;
    level._id_DE89 = scripts\mp\utility\game::_id_7F1D( "perk_fastRegenRate", 2 );
    level._id_3245 = scripts\mp\utility\game::_id_7F1D( "perk_bulletDamage", 40 ) / 100;
    level._id_69FE = scripts\mp\utility\game::_id_7F1D( "perk_explosiveDamage", 40 ) / 100;
    level._id_2B68 = scripts\mp\utility\game::_id_7F1D( "perk_blastShieldScale", 65 ) / 100;
    level._id_2B67 = scripts\mp\utility\game::_id_7F1D( "perk_blastShieldClampHP", 80 );
    level._id_1177E = scripts\mp\utility\game::_id_7F1D( "weap_thermoDebuffMod", 185 ) / 100;
    level._id_E559 = scripts\mp\utility\game::_id_7F1D( "perk_riotShield", 100 ) / 100;
    level._id_21A3 = scripts\mp\utility\game::_id_7F1D( "perk_armorVest", 75 ) / 100;
    level._id_8C74 = scripts\mp\utility\game::_id_7F1D( "perk_headgear", 55 ) / 100;
    level._id_848A = scripts\mp\utility\game::_id_7F1D( "perk_gpsjammer_graceperiods", 4 );
    level._id_B7CB = scripts\mp\utility\game::_id_7F1D( "perk_gpsjammer_min_speed", 100 );
    level._id_B75C = scripts\mp\utility\game::_id_7F1D( "perk_gpsjammer_min_distance", 10 );
    level._id_1190C = scripts\mp\utility\game::_id_7F1D( "perk_gpsjammer_time_period", 200 ) / 1000;
    level._id_B7CC = level._id_B7CB * level._id_B7CB;
    level._id_B75E = level._id_B75C * level._id_B75C;

    if ( isdefined( level._id_8B38 ) && level._id_8B38 )
    {
        level._id_2B68 = scripts\mp\utility\game::_id_7F1D( "perk_blastShieldScale_HC", 20 ) / 100;
        level._id_2B67 = scripts\mp\utility\game::_id_7F1D( "perk_blastShieldClampHP_HC", 20 );
    }

    if ( level.tactical )
    {
        level._id_2B68 = 0.65;
        level._id_2B67 = 50;
    }
}

_id_838A( var_0, var_1 )
{
    var_1 = scripts\engine\utility::ter_op( isdefined( var_1 ), var_1, 1 );

    foreach ( var_3 in var_0 )
    {
        if ( var_1 )
            var_3 = _id_13144( var_3 );

        scripts\mp\utility\game::giveperk( var_3 );
    }
}

_id_13D1( var_0 )
{
    if ( !isdefined( self._id_CA5B[var_0] ) )
        self._id_CA5B[var_0] = 1;
    else
        self._id_CA5B[var_0]++;

    if ( self._id_CA5B[var_0] == 1 && !isdefined( self._id_CA5D[var_0] ) )
        _id_13D2( var_0 );
}

_id_13D2( var_0 )
{
    var_1 = level._id_CA60[var_0];

    if ( isdefined( var_1 ) )
        self thread [[ var_1 ]]();

    self _meth_8320( var_0, !isdefined( level._id_EF86[var_0] ) );
}

_id_13CC( var_0 )
{
    foreach ( var_6, var_2 in level._id_6A50 )
    {
        if ( var_0 == var_6 )
        {
            foreach ( var_4 in var_2 )
                _id_13D1( var_4 );

            break;
        }
    }
}

_id_142F( var_0 )
{
    foreach ( var_6, var_2 in level._id_6A50 )
    {
        if ( var_0 == var_6 )
        {
            foreach ( var_4 in var_2 )
                _id_1430( var_4 );

            break;
        }
    }
}

_id_1430( var_0 )
{
    if ( !isdefined( self._id_CA5B[var_0] ) )
        return;

    self._id_CA5B[var_0]--;

    if ( self._id_CA5B[var_0] == 0 )
    {
        if ( !isdefined( self._id_CA5D[var_0] ) )
            _id_1431( var_0 );

        self._id_CA5B[var_0] = undefined;
    }
}

_id_1431( var_0 )
{
    if ( isdefined( level._id_CA66[var_0] ) )
        self thread [[ level._id_CA66[var_0] ]]();

    self _meth_83CC( var_0, !isdefined( level._id_EF86[var_0] ) );
}

_id_11AA()
{
    foreach ( var_2, var_1 in self._id_CA5B )
    {
        if ( isdefined( level._id_CA66[var_2] ) )
            self [[ level._id_CA66[var_2] ]]();
    }

    self._id_CA5B = [];
    self._id_CA5D = [];
    self _meth_8077();
}

_id_E130( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( _id_13144( var_3 ) != "specialty_null" )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_838B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "giveLoadout_start" );
    scripts\mp\utility\game::giveperk( "specialty_blindeye" );
    scripts\mp\utility\game::giveperk( "specialty_gpsjammer" );
    scripts\mp\utility\game::giveperk( "specialty_noscopeoutline" );

    while ( self._id_26B9 > 0 )
    {
        self._id_26B9 -= 0.05;
        wait 0.05;
    }

    if ( scripts\mp\utility\game::_id_9EF0( self ) && isdefined( self._id_D3E7 ) && isalive( self._id_D3E7 ) )
        return;
    else
    {
        scripts\mp\utility\game::_id_E150( "specialty_blindeye" );
        scripts\mp\utility\game::_id_E150( "specialty_gpsjammer" );
        scripts\mp\utility\game::_id_E150( "specialty_noscopeoutline" );
        self notify( "removed_spawn_perks" );
    }
}

updateactiveperks( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = isdefined( var_0 ) && isplayer( var_0 );
    var_9 = scripts\mp\utility\game::_id_8234( var_5 );
    var_10 = isdefined( var_9 ) && var_9 == "iw7_axe";
    var_11 = isdefined( var_9 ) && var_9 == "iw7_tacburst" && var_1 _meth_8519( var_5 );
    var_12 = var_10 && isdefined( var_0 ) && isdefined( var_0.classname ) && var_0.classname == "grenade";
    var_13 = isdefined( var_1 ) && isplayer( var_1 ) && var_1 != var_2;

    if ( var_13 && ( var_8 || var_12 || var_11 ) )
    {
        thread scripts\mp\perks\weaponpassives::_id_12F61( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );

        if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_triggerhappy" ) )
            var_1 thread scripts\mp\perks\perkfunctions::_id_F898();

        if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_boom" ) )
            var_2 thread scripts\mp\perks\perkfunctions::_id_F671( var_1 );

        if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_deadeye" ) )
            var_1._id_4DF0++;

        var_14 = var_1.pers["abilityRecharging"];

        if ( isdefined( var_14 ) && var_14 )
            var_1 notify( "abilityFastRecharge" );

        var_15 = var_1.pers["abilityOn"];

        if ( isdefined( var_15 ) && var_15 )
            var_1 notify( "abilityExtraTime" );
    }
}

_id_F7C5( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_1 )
    {
        if ( !isdefined( level._id_CA63[var_4] ) )
            continue;

        var_5 = _id_805C( var_4 );

        if ( !isdefined( var_5 ) )
            continue;

        if ( !isdefined( var_2[var_5] ) )
            var_2[var_5] = [];

        var_2[var_5][var_2[var_5].size] = level._id_CA63[var_4]._id_92B8;
    }

    var_7 = [];

    for ( var_5 = 1; var_5 < 4; var_5++ )
    {
        if ( isdefined( var_2[var_5] ) )
        {
            foreach ( var_4 in var_2[var_5] )
                var_7[var_7.size] = var_4;
        }
    }

    for ( var_10 = 0; var_10 < 6; var_10++ )
    {
        var_11 = var_7[var_10];

        if ( !isdefined( var_11 ) )
            var_11 = -1;

        self setclientomnvar( var_0 + var_10, var_11 );
    }
}

_id_9EDF( var_0 )
{
    var_1 = self.pers["loadoutPerks"];

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0 )
            return 1;
    }

    return 0;
}

_id_805A( var_0 )
{
    if ( !isdefined( var_0 ) || !isdefined( level._id_CA63[var_0] ) )
        return 0;

    return level._id_CA63[var_0]._id_92B8;
}

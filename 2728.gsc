// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_9807()
{
    level.finalkillcam_delay = [];
    level._id_6C6E = [];
    level.finalkillcam_attacker = [];
    level.finalkillcam_attackernum = [];
    level._id_6C64 = [];
    level._id_6C65 = [];
    level._id_6C66 = [];
    level._id_6C67 = [];
    level._id_6C68 = [];
    level.finalkillcam_killcamentitystickstovictim = [];
    level._id_6C6B = [];
    level._id_6C62 = [];
    level._id_6C69 = [];
    level.finalkillcam_timerecorded = [];
    level.finalkillcam_timegameended = [];
    level._id_6C6A = [];
    level.finalkillcam_attackers = [];
    level.finalkillcam_attackerdata = [];
    level.finalkillcam_attackerperks = [];
    level.finalkillcam_killstreakvariantinfo = [];

    if ( level._id_BDCC )
    {
        foreach ( var_1 in level._id_115DA )
        {
            level.finalkillcam_delay[var_1] = undefined;
            level._id_6C6E[var_1] = undefined;
            level.finalkillcam_attacker[var_1] = undefined;
            level.finalkillcam_attackernum[var_1] = undefined;
            level._id_6C64[var_1] = undefined;
            level._id_6C65[var_1] = undefined;
            level._id_6C66[var_1] = undefined;
            level._id_6C67[var_1] = undefined;
            level._id_6C68[var_1] = undefined;
            level.finalkillcam_killcamentitystickstovictim[var_1] = undefined;
            level._id_6C6B[var_1] = undefined;
            level._id_6C62[var_1] = undefined;
            level._id_6C69[var_1] = undefined;
            level.finalkillcam_timerecorded[var_1] = undefined;
            level.finalkillcam_timegameended[var_1] = undefined;
            level._id_6C6A[var_1] = undefined;
            level.finalkillcam_attackers[var_1] = undefined;
            level.finalkillcam_attackerdata[var_1] = undefined;
            level.finalkillcam_attackerperks[var_1] = undefined;
            level.finalkillcam_killstreakvariantinfo[var_1] = undefined;
        }
    }
    else
    {
        level.finalkillcam_delay["axis"] = undefined;
        level._id_6C6E["axis"] = undefined;
        level.finalkillcam_attacker["axis"] = undefined;
        level.finalkillcam_attackernum["axis"] = undefined;
        level._id_6C64["axis"] = undefined;
        level._id_6C65["axis"] = undefined;
        level._id_6C66["axis"] = undefined;
        level._id_6C67["axis"] = undefined;
        level._id_6C68["axis"] = undefined;
        level.finalkillcam_killcamentitystickstovictim["axis"] = undefined;
        level._id_6C6B["axis"] = undefined;
        level._id_6C62["axis"] = undefined;
        level._id_6C69["axis"] = undefined;
        level.finalkillcam_timerecorded["axis"] = undefined;
        level.finalkillcam_timegameended["axis"] = undefined;
        level._id_6C6A["axis"] = undefined;
        level.finalkillcam_attackers["axis"] = undefined;
        level.finalkillcam_attackerdata["axis"] = undefined;
        level.finalkillcam_attackerperks["axis"] = undefined;
        level.finalkillcam_killstreakvariantinfo["axis"] = undefined;
        level.finalkillcam_delay["allies"] = undefined;
        level._id_6C6E["allies"] = undefined;
        level.finalkillcam_attacker["allies"] = undefined;
        level.finalkillcam_attackernum["allies"] = undefined;
        level._id_6C64["allies"] = undefined;
        level._id_6C65["allies"] = undefined;
        level._id_6C66["allies"] = undefined;
        level._id_6C67["allies"] = undefined;
        level._id_6C68["allies"] = undefined;
        level.finalkillcam_killcamentitystickstovictim["allies"] = undefined;
        level._id_6C6B["allies"] = undefined;
        level._id_6C62["allies"] = undefined;
        level._id_6C69["allies"] = undefined;
        level.finalkillcam_timerecorded["allies"] = undefined;
        level.finalkillcam_timegameended["allies"] = undefined;
        level._id_6C6A["allies"] = undefined;
        level.finalkillcam_attackers["allies"] = undefined;
        level.finalkillcam_attackerdata["allies"] = undefined;
        level.finalkillcam_attackerperks["allies"] = undefined;
        level.finalkillcam_killstreakvariantinfo["allies"] = undefined;
    }

    level.finalkillcam_delay["none"] = undefined;
    level._id_6C6E["none"] = undefined;
    level.finalkillcam_attacker["none"] = undefined;
    level.finalkillcam_attackernum["none"] = undefined;
    level._id_6C64["none"] = undefined;
    level._id_6C65["none"] = undefined;
    level._id_6C66["none"] = undefined;
    level._id_6C67["none"] = undefined;
    level._id_6C68["none"] = undefined;
    level.finalkillcam_killcamentitystickstovictim["none"] = undefined;
    level._id_6C6B["none"] = undefined;
    level._id_6C62["none"] = undefined;
    level._id_6C69["none"] = undefined;
    level.finalkillcam_timerecorded["none"] = undefined;
    level.finalkillcam_timegameended["none"] = undefined;
    level._id_6C6A["none"] = undefined;
    level.finalkillcam_attackers["none"] = undefined;
    level.finalkillcam_attackerdata["none"] = undefined;
    level.finalkillcam_attackerperks["none"] = undefined;
    level.finalkillcam_killstreakvariantinfo["none"] = undefined;
    level._id_6C6F = undefined;
    level.recordfinalkillcam = 1;
}

_id_66BC()
{
    if ( level._id_BDCC )
    {
        for ( var_0 = 0; var_0 < level._id_115DA.size; var_0++ )
        {
            level.finalkillcam_delay[level._id_115DA[var_0]] = undefined;
            level._id_6C6E[level._id_115DA[var_0]] = undefined;
            level.finalkillcam_attacker[level._id_115DA[var_0]] = undefined;
            level.finalkillcam_attackernum[level._id_115DA[var_0]] = undefined;
            level._id_6C64[level._id_115DA[var_0]] = undefined;
            level._id_6C65[level._id_115DA[var_0]] = undefined;
            level._id_6C66[level._id_115DA[var_0]] = undefined;
            level._id_6C67[level._id_115DA[var_0]] = undefined;
            level._id_6C68[level._id_115DA[var_0]] = undefined;
            level.finalkillcam_killcamentitystickstovictim[level._id_115DA[var_0]] = undefined;
            level._id_6C6B[level._id_115DA[var_0]] = undefined;
            level._id_6C62[level._id_115DA[var_0]] = undefined;
            level._id_6C69[level._id_115DA[var_0]] = undefined;
            level.finalkillcam_timerecorded[level._id_115DA[var_0]] = undefined;
            level.finalkillcam_timegameended[level._id_115DA[var_0]] = undefined;
            level._id_6C6A[level._id_115DA[var_0]] = undefined;
            level.finalkillcam_attackers[level._id_115DA[var_0]] = undefined;
            level.finalkillcam_attackerdata[level._id_115DA[var_0]] = undefined;
            level.finalkillcam_attackerperks[level._id_115DA[var_0]] = undefined;
            level.finalkillcam_killstreakvariantinfo[level._id_115DA[var_0]] = undefined;
        }
    }
    else
    {
        level.finalkillcam_delay["axis"] = undefined;
        level._id_6C6E["axis"] = undefined;
        level.finalkillcam_attacker["axis"] = undefined;
        level.finalkillcam_attackernum["axis"] = undefined;
        level._id_6C64["axis"] = undefined;
        level._id_6C65["axis"] = undefined;
        level._id_6C66["axis"] = undefined;
        level._id_6C67["axis"] = undefined;
        level._id_6C68["axis"] = undefined;
        level.finalkillcam_killcamentitystickstovictim["axis"] = undefined;
        level._id_6C6B["axis"] = undefined;
        level._id_6C62["axis"] = undefined;
        level._id_6C69["axis"] = undefined;
        level.finalkillcam_timerecorded["axis"] = undefined;
        level.finalkillcam_timegameended["axis"] = undefined;
        level._id_6C6A["axis"] = undefined;
        level.finalkillcam_attackers["axis"] = undefined;
        level.finalkillcam_attackerdata["axis"] = undefined;
        level.finalkillcam_attackerperks["axis"] = undefined;
        level.finalkillcam_killstreakvariantinfo["axis"] = undefined;
        level.finalkillcam_delay["allies"] = undefined;
        level._id_6C6E["allies"] = undefined;
        level.finalkillcam_attacker["allies"] = undefined;
        level.finalkillcam_attackernum["allies"] = undefined;
        level._id_6C64["allies"] = undefined;
        level._id_6C65["allies"] = undefined;
        level._id_6C66["allies"] = undefined;
        level._id_6C67["allies"] = undefined;
        level._id_6C68["allies"] = undefined;
        level.finalkillcam_killcamentitystickstovictim["allies"] = undefined;
        level._id_6C6B["allies"] = undefined;
        level._id_6C62["allies"] = undefined;
        level._id_6C69["allies"] = undefined;
        level.finalkillcam_timerecorded["allies"] = undefined;
        level.finalkillcam_timegameended["allies"] = undefined;
        level._id_6C6A["allies"] = undefined;
        level.finalkillcam_attackers["allies"] = undefined;
        level.finalkillcam_attackerdata["allies"] = undefined;
        level.finalkillcam_attackerperks["allies"] = undefined;
        level.finalkillcam_killstreakvariantinfo["allies"] = undefined;
    }

    level.finalkillcam_delay["none"] = undefined;
    level._id_6C6E["none"] = undefined;
    level.finalkillcam_attacker["none"] = undefined;
    level.finalkillcam_attackernum["none"] = undefined;
    level._id_6C64["none"] = undefined;
    level._id_6C65["none"] = undefined;
    level._id_6C66["none"] = undefined;
    level._id_6C67["none"] = undefined;
    level._id_6C68["none"] = undefined;
    level.finalkillcam_killcamentitystickstovictim["none"] = undefined;
    level._id_6C6B["none"] = undefined;
    level._id_6C62["none"] = undefined;
    level._id_6C69["none"] = undefined;
    level.finalkillcam_timerecorded["none"] = undefined;
    level.finalkillcam_timegameended["none"] = undefined;
    level._id_6C6A["none"] = undefined;
    level.finalkillcam_attackers["none"] = undefined;
    level.finalkillcam_attackerdata["none"] = undefined;
    level.finalkillcam_attackerperks["none"] = undefined;
    level.finalkillcam_killstreakvariantinfo["none"] = undefined;
    level._id_6C6F = undefined;
}

preloadfinalkillcam()
{
    var_0 = level.finalkillcam_attacker[level._id_6C6F];

    if ( isdefined( var_0 ) )
    {
        foreach ( var_2 in level.players )
            var_2 _meth_81E6( var_0 );
    }
}

_id_5853()
{
    level waittill( "round_end_finished" );
    level.showingfinalkillcam = 1;
    var_0 = "none";

    if ( isdefined( level._id_6C6F ) )
        var_0 = level._id_6C6F;

    var_1 = level.finalkillcam_delay[var_0];
    var_2 = level._id_6C6E[var_0];
    var_3 = level.finalkillcam_attacker[var_0];
    var_4 = level.finalkillcam_attackernum[var_0];
    var_5 = level._id_6C64[var_0];
    var_6 = level._id_6C65[var_0];
    var_7 = level._id_6C66[var_0];
    var_8 = level._id_6C67[var_0];
    var_9 = level._id_6C68[var_0];
    var_10 = level.finalkillcam_killcamentitystickstovictim[var_0];
    var_11 = level._id_6C6B[var_0];
    var_12 = level._id_6C62[var_0];
    var_13 = level._id_6C69[var_0];
    var_14 = level.finalkillcam_timerecorded[var_0];
    var_15 = level.finalkillcam_timegameended[var_0];
    var_16 = level._id_6C6A[var_0];
    var_17 = level.finalkillcam_attackers[var_0];
    var_18 = level.finalkillcam_attackerdata[var_0];
    var_19 = level.finalkillcam_attackerperks[var_0];
    var_20 = level.finalkillcam_killstreakvariantinfo[var_0];

    if ( !isdefined( var_2 ) || !isdefined( var_3 ) )
    {
        level.showingfinalkillcam = 0;
        level notify( "final_killcam_done" );
        return;
    }

    var_21 = 20;
    var_22 = var_15 - var_14;

    if ( var_22 > var_21 )
    {
        level.showingfinalkillcam = 0;
        level notify( "final_killcam_done" );
        return;
    }

    if ( isdefined( var_3 ) )
    {
        if ( level.teambased )
            var_23 = var_3.team;
        else
            var_23 = var_3.guid;

        if ( isdefined( level.finalkillcam_attacker[var_23] ) && level.finalkillcam_attacker[var_23] == var_3 )
            scripts\mp\missions::processfinalkillchallenges( var_3, var_2 );
    }

    var_24 = spawnstruct();
    var_24.agent_type = var_6;
    var_24.lastspawntime = var_7;
    var_25 = ( gettime() - var_2.deathtime ) / 1000;

    foreach ( var_27 in level.players )
    {
        var_27 scripts\mp\utility\game::restorebasevisionset( 0 );
        var_27.killcamentitylookat = var_2 getentitynumber();
        var_27 scripts\mp\damage::_id_12E85( var_17, var_18 );

        if ( !scripts\mp\utility\game::_id_9E6C( var_11 ) )
            var_27 scripts\mp\killcam::_id_F770( var_11, var_16, var_5 );

        var_27 thread scripts\mp\killcam::_id_A636( var_5, var_24, var_4, var_8, var_9, var_2 getentitynumber(), var_10, var_11, var_25 + var_12, var_13, 0, 12, var_3, var_2, var_16, var_19, var_20 );
    }

    wait( 0.15 + level._id_B4A7 );

    while ( anyplayersinkillcam() )
        wait 0.05;

    level notify( "final_killcam_done" );
    level.showingfinalkillcam = 0;
}

recordfinalkillcam( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( level.teambased && isdefined( var_2.team ) )
    {
        level.finalkillcam_delay[var_2.team] = var_0;
        level._id_6C6E[var_2.team] = var_1;
        level.finalkillcam_attacker[var_2.team] = var_2;
        level.finalkillcam_attackernum[var_2.team] = var_3;
        level._id_6C64[var_2.team] = var_4;
        level._id_6C67[var_2.team] = var_5;
        level._id_6C68[var_2.team] = var_6;
        level.finalkillcam_killcamentitystickstovictim[var_2.team] = var_7;
        level._id_6C6B[var_2.team] = var_8;
        level._id_6C62[var_2.team] = var_9;
        level._id_6C69[var_2.team] = var_10;
        level.finalkillcam_timerecorded[var_2.team] = scripts\mp\utility\game::getsecondspassed();
        level.finalkillcam_timegameended[var_2.team] = scripts\mp\utility\game::getsecondspassed();
        level._id_6C6A[var_2.team] = var_11;
        level.finalkillcam_attackers[var_2.team] = var_1.attackers;
        level.finalkillcam_attackerdata[var_2.team] = var_1.attackerdata;
        level.finalkillcam_attackerperks[var_2.team] = var_2.pers["loadoutPerks"];
        level.finalkillcam_killstreakvariantinfo[var_2.team] = var_1.killsteakvariantattackerinfo;

        if ( isdefined( var_4 ) && isagent( var_4 ) )
        {
            level._id_6C65[var_2.team] = var_4.agent_type;
            level._id_6C66[var_2.team] = var_4.lastspawntime;
        }
        else
        {
            level._id_6C65[var_2.team] = undefined;
            level._id_6C66[var_2.team] = undefined;
        }
    }
    else if ( !level.teambased )
    {
        level.finalkillcam_delay[var_2.guid] = var_0;
        level._id_6C6E[var_2.guid] = var_1;
        level.finalkillcam_attacker[var_2.guid] = var_2;
        level.finalkillcam_attackernum[var_2.guid] = var_3;
        level._id_6C64[var_2.guid] = var_4;
        level._id_6C67[var_2.guid] = var_5;
        level._id_6C68[var_2.guid] = var_6;
        level.finalkillcam_killcamentitystickstovictim[var_2.guid] = var_7;
        level._id_6C6B[var_2.guid] = var_8;
        level._id_6C62[var_2.guid] = var_9;
        level._id_6C69[var_2.guid] = var_10;
        level.finalkillcam_timerecorded[var_2.guid] = scripts\mp\utility\game::getsecondspassed();
        level.finalkillcam_timegameended[var_2.guid] = scripts\mp\utility\game::getsecondspassed();
        level._id_6C6A[var_2.guid] = var_11;
        level.finalkillcam_attackers[var_2.guid] = var_1.attackers;
        level.finalkillcam_attackerdata[var_2.guid] = var_1.attackerdata;
        level.finalkillcam_attackerperks[var_2.guid] = var_2.pers["loadoutPerks"];
        level.finalkillcam_killstreakvariantinfo[var_2.guid] = var_1.killsteakvariantattackerinfo;

        if ( isdefined( var_4 ) && isagent( var_4 ) )
        {
            level._id_6C65[var_2.guid] = var_4.agent_type;
            level._id_6C66[var_2.guid] = var_4.lastspawntime;
        }
        else
        {
            level._id_6C65[var_2.guid] = undefined;
            level._id_6C66[var_2.guid] = undefined;
        }
    }

    level.finalkillcam_delay["none"] = var_0;
    level._id_6C6E["none"] = var_1;
    level.finalkillcam_attacker["none"] = var_2;
    level.finalkillcam_attackernum["none"] = var_3;
    level._id_6C64["none"] = var_4;
    level._id_6C67["none"] = var_5;
    level._id_6C68["none"] = var_6;
    level.finalkillcam_killcamentitystickstovictim["none"] = var_7;
    level._id_6C6B["none"] = var_8;
    level._id_6C62["none"] = var_9;
    level._id_6C69["none"] = var_10;
    level.finalkillcam_timerecorded["none"] = scripts\mp\utility\game::getsecondspassed();
    level.finalkillcam_timegameended["none"] = scripts\mp\utility\game::getsecondspassed();
    level.finalkillcam_timegameended["none"] = scripts\mp\utility\game::getsecondspassed();
    level._id_6C6A["none"] = var_11;
    level.finalkillcam_attackers["none"] = var_1.attackers;
    level.finalkillcam_attackerdata["none"] = var_1.attackerdata;
    level.finalkillcam_attackerperks["none"] = var_2.pers["loadoutPerks"];
    level.finalkillcam_killstreakvariantinfo["none"] = var_1.killsteakvariantattackerinfo;

    if ( isdefined( var_4 ) && isagent( var_4 ) )
    {
        level._id_6C65["none"] = var_4.agent_type;
        level._id_6C66["none"] = var_4.lastspawntime;
    }
    else
    {
        level._id_6C65["none"] = undefined;
        level._id_6C66["none"] = undefined;
    }
}

_id_13716()
{
    self endon( "disconnect" );
    self endon( "killcam_death_done_waiting" );
    self notifyonplayercommand( "death_respawn", "+usereload" );
    self notifyonplayercommand( "death_respawn", "+activate" );
    self waittill( "death_respawn" );
    self notify( "killcam_death_button_cancel" );
}

_id_13717( var_0 )
{
    self endon( "disconnect" );
    self endon( "killcam_death_button_cancel" );
    wait( var_0 );
    self notify( "killcam_death_done_waiting" );
}

_id_10266( var_0 )
{
    self endon( "disconnect" );

    if ( level.showingfinalkillcam )
        return 0;

    if ( !isai( self ) )
    {
        thread _id_13716();
        thread _id_13717( var_0 );
        var_1 = scripts\engine\utility::_id_13734( "killcam_death_done_waiting", "killcam_death_button_cancel" );

        if ( var_1 == "killcam_death_done_waiting" )
            return 0;
        else
            return 1;
    }

    return 0;
}

_id_5854( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "killcam_ended" );

    if ( isdefined( level._id_58D8 ) )
        return;

    level._id_58D8 = 1;
    var_5 = var_0._id_37F1;
    var_6 = 0;
    var_7 = var_3 getentitynumber();

    if ( !isdefined( var_0._id_24FF ) )
        var_0._id_24FF = var_2 getentitynumber();

    var_8 = var_5;

    if ( var_8 > 1.0 )
    {
        var_8 = 1.0;
        var_6 += 1.0;
        wait( var_5 - var_6 );
    }

    soundsettimescalefactor( "music_lr", 0 );
    soundsettimescalefactor( "music_lsrs", 0 );
    soundsettimescalefactor( "voice_air_3d", 0 );
    soundsettimescalefactor( "voice_radio_3d", 0 );
    soundsettimescalefactor( "voice_radio_2d", 0 );
    soundsettimescalefactor( "voice_narration_2d", 0 );
    soundsettimescalefactor( "voice_special_2d", 0 );
    soundsettimescalefactor( "voice_bchatter_1_3d", 0 );
    soundsettimescalefactor( "plr_ui_ingame_unres_2d", 0 );
    soundsettimescalefactor( "weap_plr_fire_1_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_2_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_3_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_4_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_overlap_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_lfe_2d", 0 );
    soundsettimescalefactor( "weap_plr_fire_alt_1_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_alt_2_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_alt_3_2d", 0.25 );
    soundsettimescalefactor( "weap_plr_fire_alt_4_2d", 0.25 );
    soundsettimescalefactor( "reload_plr_res_2d", 0.3 );
    soundsettimescalefactor( "reload_plr_unres_2d", 0.3 );
    soundsettimescalefactor( "hurt_nofilter_2d", 0.15 );
    soundsettimescalefactor( "scn_fx_unres_3d", 0.15 );
    soundsettimescalefactor( "scn_lfe_unres_2d", 0 );
    soundsettimescalefactor( "scn_lfe_unres_3d", 0 );
    soundsettimescalefactor( "scn_fx_unres_2d", 0.15 );
    soundsettimescalefactor( "spear_refl_close_unres_3d_lim", 0.15 );
    soundsettimescalefactor( "spear_refl_unres_3d_lim", 0.15 );
    soundsettimescalefactor( "weap_npc_main_3d", 0.25 );
    soundsettimescalefactor( "weap_npc_mech_3d", 0.25 );
    soundsettimescalefactor( "weap_npc_mid_3d", 0.25 );
    soundsettimescalefactor( "weap_npc_lfe_3d", 0 );
    soundsettimescalefactor( "weap_npc_dist_3d", 0.25 );
    soundsettimescalefactor( "weap_npc_lo_3d", 0.25 );
    soundsettimescalefactor( "melee_npc_3d", 0.25 );
    soundsettimescalefactor( "melee_plr_2d", 0.25 );
    soundsettimescalefactor( "special_hi_unres_1_3d", 0.15 );
    soundsettimescalefactor( "special_lo_unres_1_2d", 0 );
    soundsettimescalefactor( "bulletflesh_npc_1_unres_3d_lim", 0.15 );
    soundsettimescalefactor( "bulletflesh_npc_2_unres_3d_lim", 0.15 );
    soundsettimescalefactor( "bulletflesh_1_unres_3d_lim", 0.15 );
    soundsettimescalefactor( "bulletflesh_2_unres_3d_lim", 0.15 );
    soundsettimescalefactor( "foley_plr_mvmt_unres_2d_lim", 0.2 );
    soundsettimescalefactor( "scn_fx_unres_2d_lim", 0.2 );
    soundsettimescalefactor( "menu_1_2d_lim", 0 );
    soundsettimescalefactor( "equip_use_unres_3d", 0.15 );
    soundsettimescalefactor( "shock1_nofilter_3d", 0.15 );
    soundsettimescalefactor( "explo_1_3d", 0.15 );
    soundsettimescalefactor( "explo_2_3d", 0.15 );
    soundsettimescalefactor( "explo_3_3d", 0.15 );
    soundsettimescalefactor( "explo_4_3d", 0.15 );
    soundsettimescalefactor( "explo_5_3d", 0.15 );
    soundsettimescalefactor( "explo_lfe_3d", 0.15 );
    soundsettimescalefactor( "vehicle_air_loops_3d_lim", 0.15 );
    soundsettimescalefactor( "projectile_loop_close", 0.15 );
    soundsettimescalefactor( "projectile_loop_mid", 0.15 );
    soundsettimescalefactor( "projectile_loop_dist", 0.15 );
    setslowmotion( 1.0, 0.25, var_8 );
    wait( var_8 + 0.5 );
    setslowmotion( 0.25, 1, 1 );
    level._id_58D8 = undefined;
}

anyplayersinkillcam()
{
    foreach ( var_1 in level.players )
    {
        if ( isdefined( var_1._id_A636 ) )
            return 1;
    }

    return 0;
}

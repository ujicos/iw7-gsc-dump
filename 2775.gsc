// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( !isdefined( game["music"] ) )
    {
        var_0 = randomint( 100 );
        var_1 = getdvar( "mapname" );

        if ( getdvarint( "scr_vo_selection_test", 0 ) != 0 )
        {
            var_2 = getdvarint( "scr_vo_selection_test", 0 );

            switch ( var_2 )
            {
                case 1:
                    var_3 = "S1_";
                    var_4 = "U1_";
                    break;
                case 2:
                    var_3 = "S2_";
                    var_4 = "U2_";
                    break;
                case 3:
                    var_3 = "MR_";
                    var_4 = "JV_";
                    break;
                default:
                    var_3 = "S1_";
                    var_4 = "U1_";
                    break;
            }
        }
        else if ( level.gametype == "tdef" )
        {
            if ( var_0 < 50 )
                var_4 = "JV_";
            else
                var_4 = "U1_";

            var_3 = "S1_";
        }
        else if ( var_0 <= 33 )
        {
            var_4 = "JV_";
            var_3 = "MR_";
        }
        else if ( var_0 > 33 && var_0 <= 66 )
        {
            var_4 = "U1_";
            var_3 = "S1_";
        }
        else
        {
            var_4 = "U2_";
            var_3 = "S2_";
        }

        game["voice"]["allies"] = var_4;
        game["music"]["allies_used_nuke"] = "mus_us_nuke_fired";
        game["music"]["allies_hit_by_nuke"] = "mus_us_nuke_hit";
        game["music"]["draw_allies"] = "mus_us_draw";
        game["music"]["spawn_axis"] = "mus_fd_spawn";
        game["music"]["defeat_axis"] = "mus_fd_defeat";
        game["music"]["victory_axis"] = "mus_fd_victory";
        game["music"]["winning_axis"] = "mus_fd_winning";
        game["music"]["losing_axis"] = "mus_fd_losing";
        game["music"]["spawn_allies"] = "mus_us_spawn";
        game["music"]["defeat_allies"] = "mus_us_defeat";
        game["music"]["victory_allies"] = "mus_us_victory";
        game["music"]["winning_allies"] = "mus_us_winning";
        game["music"]["losing_allies"] = "mus_us_losing";
        game["voice"]["axis"] = var_3;
        game["music"]["axis_used_nuke"] = "mus_fd_nuke_fired";
        game["music"]["axis_hit_by_nuke"] = "mus_fd_nuke_hit";
        game["music"]["draw_axis"] = "mus_fd_draw";
        game["music"]["losing_time"] = "mp_time_running_out_losing";
        game["music"]["allies_suspense"] = [];
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_110_scar_suspense_01";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_138_scar_suspense_03";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_140_scar_suspense_04";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_111_general_suspense_01";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_113_general_suspense_03";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_115_general_suspense_04";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_120_general_suspense_07";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_122_general_suspense_09";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_123_general_suspense_10";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_127_general_suspense_11";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_130_general_suspense_12";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_135_general_suspense_13";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_139_general_suspense_14";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_497_general_suspense";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_496_general_suspense";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_495_general_suspense";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_506_general_suspense";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_510_general_suspense";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_507_general_suspense";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_518_general_suspense";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_519_general_suspense";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_520_general_suspense";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_521_general_suspense";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_528_general_suspense";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_524_general_suspense";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_523_general_suspense";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_529_general_suspense";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_494_general_suspense";
        game["music"]["allies_suspense"][game["music"]["allies_suspense"].size] = "mp_487_general_suspense";
        game["music"]["axis_suspense"] = [];
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_117_setdef_suspense_01";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_119_setdef_suspense_02";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_136_setdef_suspense_04";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_111_general_suspense_01";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_112_general_suspense_02";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_113_general_suspense_03";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_115_general_suspense_04";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_120_general_suspense_07";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_122_general_suspense_09";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_123_general_suspense_10";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_127_general_suspense_11";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_135_general_suspense_13";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_139_general_suspense_14";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_487_general_suspense";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_494_general_suspense";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_495_general_suspense";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_496_general_suspense";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_497_general_suspense";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_506_general_suspense";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_507_general_suspense";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_510_general_suspense";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_518_general_suspense";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_519_general_suspense";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_520_general_suspense";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_521_general_suspense";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_523_general_suspense";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_524_general_suspense";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_528_general_suspense";
        game["music"]["axis_suspense"][game["music"]["axis_suspense"].size] = "mp_529_general_suspense";
        game["dialog"]["mission_success"] = "mission_success";
        game["dialog"]["mission_failure"] = "mission_fail";
        game["dialog"]["mission_draw"] = "draw";
        game["dialog"]["round_success"] = "round_end_win";
        game["dialog"]["round_failure"] = "round_end_lose";
        game["dialog"]["round_draw"] = "draw";
        game["dialog"]["timesup"] = "timesup";
        game["dialog"]["winning_time"] = "winning";
        game["dialog"]["losing_time"] = "losing";
        game["dialog"]["winning_score"] = "winning_fight";
        game["dialog"]["losing_score"] = "losing_fight";
        game["dialog"]["lead_lost"] = "lead_lost";
        game["dialog"]["lead_tied"] = "tied";
        game["dialog"]["lead_taken"] = "lead_taken";
        game["dialog"]["last_alive"] = "lastalive";
        game["dialog"]["halfway_enemy_boost"] = "halfway_enemy";
        game["dialog"]["halfway_friendly_boost"] = "halfway_friendly";
        game["dialog"]["boost"] = "boost";

        if ( !isdefined( game["dialog"]["offense_obj"] ) )
            game["dialog"]["offense_obj"] = "boost";

        if ( !isdefined( game["dialog"]["defense_obj"] ) )
            game["dialog"]["defense_obj"] = "boost";

        game["dialog"]["hardcore"] = "hardcore";
        game["dialog"]["challenge"] = "challengecomplete";
        game["dialog"]["promotion"] = "promotion";
        game["dialog"]["bomb_taken"] = "acheive_bomb";
        game["dialog"]["bomb_lost"] = "bomb_taken";
        game["dialog"]["bomb_defused"] = "bomb_defused";
        game["dialog"]["bomb_planted"] = "bomb_planted";
        game["dialog"]["enemy_bomb_a"] = "enemy_bomb_a";
        game["dialog"]["enemy_bomb_b"] = "enemy_bomb_b";
        game["dialog"]["enemy_bomb_defused"] = "enemy_bomb_defused";
        game["dialog"]["enemy_bomb_planted"] = "enemy_bomb_planted";
        game["dialog"]["obj_defend"] = "obj_defend";
        game["dialog"]["obj_destroy"] = "obj_destroy";
        game["dialog"]["obj_capture"] = "capture_obj";
        game["dialog"]["objs_capture"] = "capture_objs";
        game["dialog"]["enemy_zone_control"] = "enemy_zone_control";
        game["dialog"]["friendly_zone_control"] = "friendly_zone_control";
        game["dialog"]["hp_new_location"] = "hp_new_location";
        game["dialog"]["hp_captured_enemy"] = "hp_captured_enemy";
        game["dialog"]["hp_captured_friendly"] = "hp_captured_friendly";
        game["dialog"]["hp_contested"] = "hp_contested";
        game["dialog"]["hp_move_soon"] = "hp_move_soon";
        game["dialog"]["hp_capturing_enemy"] = "hp_capturing_enemy";
        game["dialog"]["hp_capturing_friendly"] = "hp_capturing_friendly";
        game["dialog"]["hp_lost_enemy"] = "hp_lost_enemy";
        game["dialog"]["halftime"] = "halftime";
        game["dialog"]["overtime"] = "overtime";
        game["dialog"]["side_switch"] = "switching";
        game["dialog"]["flag_taken"] = "ourflag";
        game["dialog"]["flag_dropped"] = "ourflag_drop";
        game["dialog"]["flag_returned"] = "ourflag_return";
        game["dialog"]["flag_captured"] = "ourflag_capt";
        game["dialog"]["flag_getback"] = "getback_ourflag";
        game["dialog"]["enemy_flag_bringhome"] = "enemyflag_tobase";
        game["dialog"]["enemy_flag_taken"] = "enemyflag";
        game["dialog"]["enemy_flag_dropped"] = "enemyflag_drop";
        game["dialog"]["enemy_flag_returned"] = "enemyflag_return";
        game["dialog"]["enemy_flag_captured"] = "enemyflag_capt";
        game["dialog"]["capturing_a"] = "capturing_a";
        game["dialog"]["capturing_b"] = "capturing_b";
        game["dialog"]["capturing_c"] = "capturing_c";
        game["dialog"]["captured_a"] = "capture_a";
        game["dialog"]["captured_b"] = "capture_c";
        game["dialog"]["captured_c"] = "capture_b";
        game["dialog"]["securing_a"] = "securing_a";
        game["dialog"]["securing_b"] = "securing_b";
        game["dialog"]["securing_c"] = "securing_c";
        game["dialog"]["secured_a"] = "secure_a";
        game["dialog"]["secured_b"] = "secure_b";
        game["dialog"]["secured_c"] = "secure_c";
        game["dialog"]["losing_a"] = "losing_a";
        game["dialog"]["losing_b"] = "losing_b";
        game["dialog"]["losing_c"] = "losing_c";
        game["dialog"]["lost_a"] = "lost_a";
        game["dialog"]["lost_b"] = "lost_b";
        game["dialog"]["lost_c"] = "lost_c";
        game["dialog"]["enemy_taking_a"] = "enemy_take_a";
        game["dialog"]["enemy_taking_b"] = "enemy_take_b";
        game["dialog"]["enemy_taking_c"] = "enemy_take_c";
        game["dialog"]["enemy_has_a"] = "enemy_has_a";
        game["dialog"]["enemy_has_b"] = "enemy_has_b";
        game["dialog"]["enemy_has_c"] = "enemy_has_c";
        game["dialog"]["lost_all"] = "take_positions";
        game["dialog"]["secure_all"] = "positions_lock";
        game["music"]["nuke_music"] = "nuke_music";
        game["dialog"]["ti_destroyed"] = "ti_blocked";
        game["dialog"]["jackal_destroyed"] = "destroyed_jackal";
        game["dialog"]["uav_use"] = "op_uav_use";
        game["dialog"]["uav_destroyed"] = "op_uav_destroyed";
        game["dialog"]["uav_timeout"] = "op_uav_timeout";
        game["dialog"]["counter_uav_use"] = "op_counter_uav_use";
        game["dialog"]["counter_uav_destroyed"] = "op_counter_uav_destroyed";
        game["dialog"]["counter_uav_timeout"] = "op_counter_uav_timeout";
        game["dialog"]["dronedrop_use"] = "op_dronedrop_use";
        game["dialog"]["dronedrop_destroyed"] = "op_dronedrop_destroyed";
        game["dialog"]["drone_hive_use"] = "op_orbital_deployment_use";
        game["dialog"]["bombardment_use"] = "op_bombardment_use";
        game["dialog"]["thor_use"] = "op_thor_use";
        game["dialog"]["thor_end"] = "op_thor_end";
        game["dialog"]["thor_destroyed"] = "op_thor_destroyed";
        game["dialog"]["thor_timeout"] = "op_thor_timeout";
        game["dialog"]["jackal_use"] = "op_jackal_use";
        game["dialog"]["jackal_fire"] = "op_jackal_fire";
        game["dialog"]["jackal_guard"] = "op_jackal_guard";
        game["dialog"]["jackal_follow"] = "op_jackal_follow";
        game["dialog"]["jackal_target_dead"] = "op_jackal_target_dead";
        game["dialog"]["jackal_target_lost"] = "op_jackal_target_lost";
        game["dialog"]["jackal_end"] = "op_jackal_end";
        game["dialog"]["jackal_destroyed"] = "op_jackal_destroyed";
        game["dialog"]["precision_airstrike_use"] = "op_precision_airstrike_use";
        game["dialog"]["precision_airstrike_end"] = "op_precision_airstrike_end";
        game["dialog"]["jammer_use"] = "op_jammer_use";
        game["dialog"]["jammer_destroyed"] = "op_jammer_destroyed";
        game["dialog"]["sentry_shock_use"] = "op_sentry_shock_use";
        game["dialog"]["sentry_shock_destroy"] = "op_sentry_shock_destroy";
        game["dialog"]["sentry_shock_timeout"] = "op_sentry_shock_timeout";
        game["dialog"]["ball_drone_backup_use"] = "op_ball_drone_backup_use";
        game["dialog"]["ball_drone_backup_destroy"] = "op_ball_drone_backup_destroy";
        game["dialog"]["ball_drone_backup_timeout"] = "op_ball_drone_backup_timeout";
        game["dialog"]["minijackal_use"] = "op_minijackal_use";
        game["dialog"]["minijackal_destroy"] = "op_minijackal_destroy";
        game["dialog"]["minijackal_timeout"] = "op_minijackal_timeout";
        game["dialog"]["remote_c8_use"] = "op_remote_c8_use";
        game["dialog"]["remote_c8_ai"] = "op_remote_c8_ai";
        game["dialog"]["remote_c8_user"] = "op_remote_c8_user";
        game["dialog"]["remote_c8_destroy"] = "op_remote_c8_destroy";
        game["dialog"]["remote_c8_end"] = "op_remote_c8_end";
        game["dialog"]["remote_c8_timeout"] = "op_remote_c8_timeout";
        game["dialog"]["siege_ship_use"] = "op_siege_ship_use";
        game["dialog"]["siege_ship_destroy"] = "op_siege_ship_destroy";
        game["dialog"]["nuke_use"] = "op_nuke_use";
        game["dialog"]["directional_uav_use"] = "op_directional_uav_use";
        game["dialog"]["directional_uav_destroyed"] = "op_directional_uav_destroyed";
        game["dialog"]["directional_uav_timeout"] = "op_directional_uav_timeout";
        game["dialog"]["venom_use"] = "op_venom_use";
        game["dialog"]["venom_destroyed"] = "op_venom_destroyed";
        game["dialog"]["venom_timeout"] = "op_venom_timeout";
    }

    level thread _id_C56E();
    level thread _id_BDEF();
    level thread _id_C533();
    level thread post_match_music();
    level thread _id_C585();
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread playflyoveraudioline();
        var_0 thread onplayerspawned();
        var_0 thread _id_6C70();
        var_0 thread _id_13AA1();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    if ( !isai( self ) )
    {
        self waittill( "spawned_player" );
        thread _id_58E1();
    }
}

waitcountdown()
{
    self endon( "rigBootFinished" );
    level endon( "host_migration_begin" );
    self endon( "disconnect" );

    for (;;)
    {
        if ( scripts\mp\utility\game::_id_766C( "prematch_done" ) )
        {
            self notify( "luinotifyserver", "matchReady" );
            return;
        }

        wait 1;
    }
}

playflyoveraudioline()
{
    level endon( "host_migration_begin" );
    self endon( "disconnect" );
    var_0 = scripts\mp\utility\game::_id_81CB() / 1000 + 6;

    if ( var_0 >= level._id_D84D )
        return;

    if ( !level.rankedmatch )
        return;

    if ( !scripts\mp\utility\game::_id_DCD5() )
        return;

    var_1 = self getrankedplayerdata( "mp", "activeMissionTeam" );

    if ( !self issplitscreenplayer() || self isreloading() )
    {
        if ( self._id_0291 == "allies" )
        {
            switch ( var_1 )
            {
                case 0:
                    self _meth_85BF( "jtfw_mtc1_un_flyover" );
                    break;
                case 1:
                    self _meth_85BF( "oi_mtc3_un_flyover" );
                    break;
                case 2:
                    self _meth_85BF( "st7_mtc4_prematch_flyover" );
                    break;
                case 3:
                    self _meth_85BF( "wr_mtc5_un_flyover" );
                    break;
                case 4:
                    self _meth_85BF( "ba_mtc2_un_flyover" );
                    break;
                default:
                    break;
            }
        }
        else if ( self._id_0291 == "axis" )
        {
            switch ( var_1 )
            {
                case 0:
                    self _meth_85BF( "jtfw_mtc1_sdf_flyover" );
                    break;
                case 1:
                    self _meth_85BF( "oi_mtc3_sdf_flyover" );
                    break;
                case 2:
                    self _meth_85BF( "st7_mtc4_prematch_flyover" );
                    break;
                case 3:
                    self _meth_85BF( "wr_mtc5_sdf_flyover" );
                    break;
                case 4:
                    self _meth_85BF( "ba_mtc2_sdf_flyover" );
                    break;
                default:
                    break;
            }
        }
    }
}

_id_58E1()
{
    level endon( "host_migration_begin" );
    self endon( "disconnect" );

    while ( level.ingraceperiod > 15 )
        wait 0.05;

    var_0 = !scripts\mp\utility\game::_id_766C( "prematch_done" ) && ( !scripts\mp\utility\game::_id_9F32() || scripts\mp\utility\game::_id_9DF6() );

    if ( var_0 )
    {
        thread waitcountdown();

        for (;;)
        {
            self waittill( "luinotifyserver", var_1, var_2 );

            if ( var_1 == "rig_boot_started" )
            {
                level notify( "rigBootFinished" );
                self notify( "rigBootFinished" );
                break;
            }
            else if ( var_1 == "matchReady" )
                break;
        }
    }

    if ( !level._id_10A56 || level._id_10A56 && !isdefined( level._id_CF34 ) )
    {
        if ( !self issplitscreenplayer() || self isreloading() )
        {
            self _meth_8461( "" );

            if ( isdefined( self.team ) && self.team != "spectator" )
                self playlocalsound( game["music"]["spawn_" + self.team] );
        }

        if ( level._id_10A56 )
            level._id_CF34 = 1;
    }

    if ( isdefined( game["dialog"]["gametype"] ) && ( !level._id_10A56 || self == level.players[0] ) )
    {
        if ( isdefined( game["dialog"]["allies_gametype"] ) && self.team == "allies" )
            scripts\mp\utility\game::leaderdialogonplayer( "allies_gametype" );
        else if ( isdefined( game["dialog"]["axis_gametype"] ) && self.team == "axis" )
            scripts\mp\utility\game::leaderdialogonplayer( "axis_gametype" );
        else if ( !self issplitscreenplayer() || self isreloading() )
            scripts\mp\utility\game::leaderdialogonplayer( "gametype" );
    }

    scripts\mp\utility\game::_id_7670( "prematch_done" );

    if ( self.team == game["attackers"] )
    {
        if ( !self issplitscreenplayer() || self isreloading() )
            scripts\mp\utility\game::leaderdialogonplayer( "offense_obj", "introboost" );
    }
    else if ( !self issplitscreenplayer() || self isreloading() )
        scripts\mp\utility\game::leaderdialogonplayer( "defense_obj", "introboost" );
}

_id_13AA1()
{
    self endon( "disconnect" );
    level endon( "grace_period_ending" );

    for (;;)
    {
        level waittill( "host_migration_begin" );
        var_0 = level.ingraceperiod;
        level waittill( "host_migration_end" );

        if ( var_0 )
            thread _id_58E1();
    }
}

_id_C54B( var_0 )
{
    if ( level._id_7669 )
        return;

    if ( !isalive( var_0 ) )
        return;

    if ( scripts\mp\utility\game::istrue( var_0.playedlastmanstandingvo ) )
        return;

    var_0.playedlastmanstandingvo = 1;

    if ( level.gametype == "siege" )
        var_0 scripts\mp\utility\game::leaderdialogonplayer( "lastalive_zones" );
    else if ( level.gametype == "sr" && !level._id_C060 )
        var_0 scripts\mp\utility\game::leaderdialogonplayer( "lastalive_revive" );
    else
        var_0 scripts\mp\utility\game::leaderdialogonplayer( "last_alive" );
}

_id_C585()
{
    level waittill( "round_switch", var_0 );

    switch ( var_0 )
    {
        case "halftime":
            foreach ( var_2 in level.players )
            {
                if ( var_2 issplitscreenplayer() && !var_2 isreloading() )
                    continue;

                var_2 scripts\mp\utility\game::leaderdialogonplayer( "halftime" );
            }

            break;
        case "overtime":
            foreach ( var_2 in level.players )
            {
                if ( var_2 issplitscreenplayer() && !var_2 isreloading() )
                    continue;

                var_2 scripts\mp\utility\game::leaderdialogonplayer( "overtime" );
            }

            break;
        default:
            foreach ( var_2 in level.players )
            {
                if ( var_2 issplitscreenplayer() && !var_2 isreloading() )
                    continue;

                var_2 scripts\mp\utility\game::leaderdialogonplayer( "side_switch" );
            }

            break;
    }
}

post_match_music()
{
    level waittill( "round_end_music", var_0 );

    foreach ( var_2 in level.players )
    {
        if ( var_2 issplitscreenplayer() && !var_2 isreloading() )
            continue;

        if ( level._id_6C6F != "none" )
            var_2 _meth_8461( "mus_mp_killcam" );
    }
}

_id_C533()
{
    level thread _id_E76B();
    level thread _id_7690();
    level waittill( "game_win", var_0 );

    if ( level.teambased )
    {
        if ( level._id_10A56 )
        {
            if ( var_0 == "allies" )
            {
                foreach ( var_2 in level.players )
                {
                    if ( var_2 issplitscreenplayer() && !var_2 isreloading() )
                        continue;

                    var_2 _meth_8461( game["music"]["victory_allies"] );
                }
            }
            else if ( var_0 == "axis" )
            {
                foreach ( var_2 in level.players )
                {
                    if ( var_2 issplitscreenplayer() && !var_2 isreloading() )
                        continue;

                    var_2 _meth_8461( game["music"]["victory_axis"] );
                }
            }
            else
            {
                scripts\mp\utility\game::_id_D52E( game["music"]["nuke_music"] );

                foreach ( var_2 in level.players )
                    var_2 _meth_8461( "" );
            }
        }
        else if ( var_0 == "allies" )
        {
            foreach ( var_2 in level.players )
            {
                if ( isdefined( var_2.team ) && var_2.team == "allies" )
                {
                    var_2 _meth_8461( game["music"]["victory_allies"] );
                    continue;
                }

                var_2 _meth_8461( game["music"]["defeat_axis"] );
            }
        }
        else if ( var_0 == "axis" )
        {
            foreach ( var_2 in level.players )
            {
                if ( isdefined( var_2.team ) && var_2.team == "axis" )
                {
                    var_2 _meth_8461( game["music"]["victory_axis"] );
                    continue;
                }

                var_2 _meth_8461( game["music"]["defeat_allies"] );
            }
        }
        else
        {
            foreach ( var_2 in level.players )
            {
                if ( isdefined( var_2.team ) && var_2.team == "allies" )
                {
                    var_2 _meth_8461( game["music"]["draw_allies"] );
                    continue;
                }

                var_2 _meth_8461( game["music"]["draw_axis"] );
            }
        }
    }
    else
    {
        foreach ( var_2 in level.players )
        {
            var_2 _meth_8461( "" );

            if ( var_2 issplitscreenplayer() && !var_2 isreloading() )
                continue;

            if ( !isdefined( var_2.pers["team"] ) )
                continue;

            if ( var_2.pers["team"] != "allies" && var_2.pers["team"] != "axis" )
            {
                var_2 playlocalsound( game["music"]["nuke_music"] );
                continue;
            }

            if ( isdefined( var_0 ) && isplayer( var_0 ) && var_2 == var_0 )
            {
                var_2 _meth_8461( game["music"]["victory_" + var_2.pers["team"]] );
                continue;
            }

            if ( !level._id_10A56 )
                var_2 _meth_8461( game["music"]["defeat_" + var_2.pers["team"]] );
        }
    }
}

_id_E76B()
{
    level waittill( "round_win", var_0 );
    wait 0.5;
    var_1 = game["teamScores"]["allies"];
    var_2 = game["teamScores"]["axis"];

    if ( !isdefined( var_0 ) || isplayer( var_0 ) )
        return;

    if ( var_0 == "allies" )
    {
        scripts\mp\utility\game::_id_AAE7( "round_success", "allies" );
        scripts\mp\utility\game::_id_AAE7( "round_failure", "axis" );
    }
    else if ( var_0 == "axis" )
    {
        scripts\mp\utility\game::_id_AAE7( "round_success", "axis" );
        scripts\mp\utility\game::_id_AAE7( "round_failure", "allies" );
    }
    else if ( var_2 > var_1 )
    {
        scripts\mp\utility\game::_id_AAE7( "round_success", "axis" );
        scripts\mp\utility\game::_id_AAE7( "round_failure", "allies" );
    }
    else if ( var_1 > var_2 )
    {
        scripts\mp\utility\game::_id_AAE7( "round_success", "allies" );
        scripts\mp\utility\game::_id_AAE7( "round_failure", "axis" );
    }
    else
        scripts\mp\utility\game::_id_AAE7( "lead_tied" );
}

_id_7690()
{
    level waittill( "game_win", var_0 );
    var_1 = level._id_D706 / 2;

    if ( var_1 > 0 )
        wait( var_1 );

    if ( !isdefined( var_0 ) )
        return;

    if ( isplayer( var_0 ) && !level.teambased )
    {
        for ( var_2 = 0; var_2 < level.placement["all"].size; var_2++ )
        {
            var_3 = level.placement["all"][var_2];

            if ( var_3 issplitscreenplayer() && !var_3 isreloading() )
                continue;

            if ( var_2 < 3 )
            {
                var_3 scripts\mp\utility\game::leaderdialogonplayer( "mission_success" );
                continue;
            }

            var_3 scripts\mp\utility\game::leaderdialogonplayer( "mission_failure" );
        }
    }
    else if ( var_0 == "allies" )
    {
        scripts\mp\utility\game::_id_AAE7( "mission_success", "allies" );
        scripts\mp\utility\game::_id_AAE7( "mission_failure", "axis" );
    }
    else if ( var_0 == "axis" )
    {
        scripts\mp\utility\game::_id_AAE7( "mission_success", "axis" );
        scripts\mp\utility\game::_id_AAE7( "mission_failure", "allies" );
    }
    else
        scripts\mp\utility\game::_id_AAE7( "mission_draw" );
}

_id_BDEF()
{
    level endon( "game_ended" );
    level._id_BDF0 = 1;
    thread _id_112FE();
    level waittill( "match_ending_soon", var_0 );

    if ( level._id_E762 == 1 || game["roundsPlayed"] == level._id_E762 - 1 || scripts\mp\utility\game::_id_9EA9() )
    {
        if ( !level._id_10A56 )
        {
            if ( var_0 == "time" )
            {
                if ( level.teambased )
                {
                    if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
                    {
                        if ( _id_9EAE() )
                            thread _id_118F9( "allies" );

                        scripts\mp\utility\game::_id_AAE7( "winning_time", "allies" );
                        scripts\mp\utility\game::_id_AAE7( "losing_time", "axis" );
                    }
                    else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
                    {
                        if ( _id_9EAE() )
                            thread _id_118F9( "axis" );

                        scripts\mp\utility\game::_id_AAE7( "winning_time", "axis" );
                        scripts\mp\utility\game::_id_AAE7( "losing_time", "allies" );
                    }
                }
                else
                {
                    if ( _id_9EAE() )
                    {
                        scripts\mp\utility\game::_id_D52E( game["music"]["losing_time"] );

                        foreach ( var_2 in level.players )
                            var_2 _meth_8461( "" );
                    }

                    scripts\mp\utility\game::_id_AAE7( "timesup" );
                }
            }
            else if ( var_0 == "score" )
            {
                if ( level.teambased )
                {
                    if ( game["teamScores"]["allies"] > game["teamScores"]["axis"] )
                    {
                        if ( _id_9EAE() )
                        {
                            scripts\mp\utility\game::_id_D52E( game["music"]["winning_allies"], "allies" );
                            scripts\mp\utility\game::_id_D52E( game["music"]["losing_axis"], "axis" );

                            foreach ( var_2 in level.players )
                                var_2 _meth_8461( "" );
                        }

                        scripts\mp\utility\game::_id_AAE7( "winning_score", "allies" );
                        scripts\mp\utility\game::_id_AAE7( "losing_score", "axis" );
                    }
                    else if ( game["teamScores"]["axis"] > game["teamScores"]["allies"] )
                    {
                        if ( _id_9EAE() )
                        {
                            scripts\mp\utility\game::_id_D52E( game["music"]["winning_axis"], "axis" );
                            scripts\mp\utility\game::_id_D52E( game["music"]["losing_allies"], "allies" );

                            foreach ( var_2 in level.players )
                                var_2 _meth_8461( "" );
                        }

                        scripts\mp\utility\game::_id_AAE7( "winning_score", "axis" );
                        scripts\mp\utility\game::_id_AAE7( "losing_score", "allies" );
                    }
                }
                else
                {
                    var_8 = scripts\mp\gamescore::_id_7F00();
                    var_9 = scripts\mp\gamescore::_id_7F83();
                    var_10[0] = var_8;

                    if ( _id_9EAE() )
                    {
                        var_8 playlocalsound( game["music"]["winning_" + var_8.pers["team"]] );
                        var_8 _meth_8461( "" );

                        foreach ( var_12 in level.players )
                        {
                            if ( var_12 == var_8 )
                                continue;

                            if ( var_12 ismlgspectator() )
                                continue;

                            var_12 playlocalsound( game["music"]["losing_" + var_12.pers["team"]] );
                            var_12 _meth_8461( "" );
                        }
                    }

                    var_8 scripts\mp\utility\game::leaderdialogonplayer( "winning_score" );
                    scripts\mp\utility\game::_id_AAEE( "losing_score", var_9 );
                }
            }

            level waittill( "match_ending_very_soon" );
            scripts\mp\utility\game::_id_AAE7( "timesup" );
        }
    }
    else
    {
        if ( !level._id_8B38 )
        {
            scripts\mp\utility\game::_id_D52E( game["music"]["losing_allies"] );

            foreach ( var_2 in level.players )
                var_2 _meth_8461( "" );
        }

        scripts\mp\utility\game::_id_AAE7( "timesup" );
    }
}

_id_118F9( var_0 )
{
    self endon( "game_ended" );
    level waittill( "match_ending_very_soon" );

    if ( var_0 == "allies" )
    {
        scripts\mp\utility\game::_id_D52E( game["music"]["winning_allies"], "allies" );
        scripts\mp\utility\game::_id_D52E( game["music"]["losing_axis"], "axis" );
    }
    else
    {
        scripts\mp\utility\game::_id_D52E( game["music"]["winning_axis"], "axis" );
        scripts\mp\utility\game::_id_D52E( game["music"]["losing_allies"], "allies" );
    }

    foreach ( var_2 in level.players )
        var_2 _meth_8461( "" );
}

_id_112FE( var_0 )
{
    if ( !_id_9EAE() )
        return;

    level endon( "game_ended" );
    level endon( "match_ending_soon" );
    level endon( "stop_suspense_music" );

    if ( isdefined( level._id_C0AF ) && level._id_C0AF )
        return;

    var_1 = game["music"]["allies_suspense"].size;
    var_2 = game["music"]["axis_suspense"].size;
    level._id_4C2A = [];

    if ( isdefined( var_0 ) && var_0 )
        wait 120;

    for (;;)
    {
        wait( randomfloatrange( 60, 150 ) );
        level._id_4C2A["allies"] = randomint( var_1 );
        level._id_4C2A["axis"] = randomint( var_2 );

        foreach ( var_4 in level.players )
        {
            var_5 = var_4.team;

            if ( var_4.team == "allies" )
            {
                var_4 _meth_8461( game["music"]["allies_suspense"][level._id_4C2A["allies"]] );
                continue;
            }

            var_4 _meth_8461( game["music"]["axis_suspense"][level._id_4C2A["axis"]] );
        }
    }
}

_id_1108F()
{
    level notify( "stop_suspense_music" );

    if ( isdefined( level._id_4C2A ) && level._id_4C2A.size == 2 )
    {
        foreach ( var_1 in level.players )
            var_1 _meth_8461( "" );
    }
}

_id_6C70()
{
    self waittill( "showing_final_killcam" );
}

_id_6274()
{
    if ( level._id_BDF0 == 0 )
        thread _id_112FE();

    level._id_BDF0++;
}

_id_5601()
{
    if ( level._id_BDF0 > 0 )
    {
        level._id_BDF0--;

        if ( level._id_BDF0 == 0 )
            _id_1108F();
    }
    else
    {

    }
}

_id_9EAE()
{
    return !level._id_8B38 && level._id_BDF0 > 0;
}

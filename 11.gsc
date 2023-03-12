// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main()
{
    if ( isdefined( level.createfx_enabled ) && level.createfx_enabled )
        return;

    setup_callbacks();
    scripts\mp\bots\bots_personality::_id_F9FD();
    level._id_274F = ::badplace_cylinder;
    level._id_2750 = ::badplace_delete;
    scripts\mp\bots\bots_killstreaks::bot_killstreak_setup();
    _id_0D79::_id_2E53();
    scripts\mp\bots\bots_loadout::init();
    level thread init();
}

setup_callbacks()
{
    level.bot_funcs = [];
    level.bot_funcs["bots_spawn"] = ::spawn_bots;
    level.bot_funcs["bots_add_scavenger_bag"] = ::_id_2D04;
    level.bot_funcs["bots_add_to_level_targets"] = scripts\mp\bots\bots_util::_id_2D06;
    level.bot_funcs["bots_remove_from_level_targets"] = scripts\mp\bots\bots_util::_id_2E64;
    level.bot_funcs["bots_make_entity_sentient"] = ::_id_2E16;
    level.bot_funcs["think"] = ::bot_think;
    level.bot_funcs["on_killed"] = ::on_bot_killed;
    level.bot_funcs["should_do_killcam"] = ::bot_should_do_killcam;
    level.bot_funcs["get_attacker_ent"] = scripts\mp\bots\bots_util::bot_get_known_attacker;
    level.bot_funcs["should_pickup_weapons"] = ::bot_should_pickup_weapons;
    level.bot_funcs["on_damaged"] = ::bot_damage_callback;
    level.bot_funcs["gametype_think"] = ::_id_4FF3;
    level.bot_funcs["leader_dialog"] = scripts\mp\bots\bots_util::_id_2DFB;
    level.bot_funcs["player_spawned"] = ::_id_2E4D;
    level.bot_funcs["should_start_cautious_approach"] = scripts\mp\bots\bots_strategy::_id_FF9A;
    level.bot_funcs["know_enemies_on_start"] = ::_id_2DF8;
    level.bot_funcs["bot_get_rank_xp"] = ::_id_2DB3;
    level.bot_funcs["ai_3d_sighting_model"] = ::bot_3d_sighting_model;
    level.bot_funcs["dropped_weapon_think"] = ::bot_think_seek_dropped_weapons;
    level.bot_funcs["dropped_weapon_cancel"] = ::_id_FFA0;
    level.bot_funcs["crate_can_use"] = ::crate_can_use_always;
    level.bot_funcs["crate_low_ammo_check"] = ::_id_483E;
    level.bot_funcs["crate_should_claim"] = ::_id_484B;
    level.bot_funcs["crate_wait_use"] = ::_id_484D;
    level.bot_funcs["crate_in_range"] = ::_id_483B;
    level.bot_funcs["post_teleport"] = ::_id_2E50;
    level.bot_random_path_function = [];
    level.bot_random_path_function["allies"] = scripts\mp\bots\bots_personality::bot_random_path_default;
    level.bot_random_path_function["axis"] = scripts\mp\bots\bots_personality::bot_random_path_default;
    level._id_2D27["deployable_vest"] = ::_id_2E93;
    level._id_2D27["deployable_ammo"] = ::_id_2E92;
    level._id_2D27["scavenger_bag"] = ::_id_2E96;
    level._id_2D27["deployable_grenades"] = ::_id_2E94;
    level._id_2D27["deployable_juicebox"] = ::_id_2E95;
    level._id_2E55["deployable_ammo"] = ::_id_2E54;
    level._id_2E52["deployable_ammo"] = ::_id_2E51;
    level._id_2D76["capture"] = scripts\mp\bots\bots_strategy::_id_6C87;
    level._id_2D76["capture_zone"] = scripts\mp\bots\bots_strategy::_id_6C88;
    level._id_2D76["protect"] = scripts\mp\bots\bots_strategy::_id_6C8A;
    level._id_2D76["bodyguard"] = scripts\mp\bots\bots_strategy::_id_6C86;
    level._id_2D76["patrol"] = scripts\mp\bots\bots_strategy::_id_6C89;
    scripts\mp\bots\gametype_war::setup_callbacks();

    if ( scripts\mp\utility\game::bot_is_fireteam_mode() )
        _id_0D71::_id_2D92();
}

_id_00AC( var_0, var_1 )
{
    if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["leader_dialog"] ) )
        self [[ level.bot_funcs["leader_dialog"] ]]( var_0, var_1 );
}

init()
{
    thread _id_B9A3();
    thread _id_2EBB();
    _id_97DE();

    if ( !_id_10082() )
        return;

    _id_DE6C();
    var_0 = botautoconnectenabled();

    if ( var_0 > 0 )
    {
        setmatchdata( "hasBots", 1 );

        if ( scripts\mp\utility\game::bot_is_fireteam_mode() )
        {
            level thread _id_0D71::_id_2D8E();
            level thread scripts\mp\bots\bots_fireteam_commander::init();
        }
        else
            level thread _id_2D3A();
    }
}

_id_97DE()
{
    if ( !isdefined( level._id_485C ) )
        level._id_485C = 500;

    if ( !isdefined( level._id_4859 ) )
        level._id_4859 = 3000;

    level._id_2E3C = 3000;
    level._id_2E66 = "iw6_panzerfaust3";
    level._id_2D70 = "iw7_knife";
    level._id_13FBD = getzonecount();
    level._id_2413 = undefined;
    _id_97DF();
}

_id_97DF()
{
    if ( isdefined( level._id_1165C ) )
        var_0 = [[ level._id_1165C ]]();
    else
        var_0 = getallnodes();

    level._id_2E1B = 0;
    level._id_2E18 = 0;
    level._id_2E1C = 0;
    level._id_2E19 = 0;
    level._id_2E1D = 0;
    level._id_2E1A = 0;

    if ( var_0.size > 1 )
    {
        level._id_2E1B = var_0[0].origin[0];
        level._id_2E18 = var_0[0].origin[0];
        level._id_2E1C = var_0[0].origin[1];
        level._id_2E19 = var_0[0].origin[1];
        level._id_2E1D = var_0[0].origin[2];
        level._id_2E1A = var_0[0].origin[2];

        for ( var_1 = 1; var_1 < var_0.size; var_1++ )
        {
            var_2 = var_0[var_1].origin;

            if ( var_2[0] < level._id_2E1B )
                level._id_2E1B = var_2[0];

            if ( var_2[0] > level._id_2E18 )
                level._id_2E18 = var_2[0];

            if ( var_2[1] < level._id_2E1C )
                level._id_2E1C = var_2[1];

            if ( var_2[1] > level._id_2E19 )
                level._id_2E19 = var_2[1];

            if ( var_2[2] < level._id_2E1D )
                level._id_2E1D = var_2[2];

            if ( var_2[2] > level._id_2E1A )
                level._id_2E1A = var_2[2];
        }
    }

    level._id_2E17 = ( ( level._id_2E1B + level._id_2E18 ) / 2, ( level._id_2E1C + level._id_2E19 ) / 2, ( level._id_2E1D + level._id_2E1A ) / 2 );
    level._id_2EC5 = 1;
}

_id_2E50()
{
    level._id_2EC5 = undefined;
    level._id_2DD0 = undefined;
    _id_97DF();
    scripts\mp\bots\bots_killstreaks_remote_vehicle::_id_DF76();
}

_id_10082()
{
    return 1;
}

_id_DE6C()
{
    wait 1;

    foreach ( var_1 in level.players )
    {
        if ( isbot( var_1 ) )
        {
            if ( isalive( var_1 ) )
            {
                var_1._id_6695 = 1;
                var_1.bot_team = var_1.team;
                var_1.bot_spawned_before = 1;
                var_1 thread [[ level.bot_funcs["think"] ]]();
                continue;
            }
        }
    }
}

_id_2E4D()
{
    bot_set_loadout_class();

    if ( isdefined( self._id_D88E ) )
    {
        scripts\mp\bots\bots_util::bot_set_personality( self._id_D88E );
        self._id_D88E = undefined;
    }
}

bot_set_loadout_class()
{
    if ( !isdefined( self.bot_class ) )
    {
        if ( !bot_gametype_chooses_class() )
        {
            while ( !isdefined( level._id_2E14 ) )
                wait 0.05;

            if ( isdefined( self._id_C80E ) )
                self.bot_class = [[ self._id_C80E ]]();
            else
                self.bot_class = scripts\mp\bots\bots_personality::bot_setup_callback_class();
        }
        else
            self.bot_class = self.class;
    }
}

_id_13968()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isai( var_0 ) && level.players.size > 0 )
        {
            level._id_D40C = scripts\engine\utility::_id_2279( level._id_D40C, var_0 );
            childthread _id_2EF7( var_0 );
            childthread _id_2EF6( var_0 );
            childthread _id_2EF8( var_0 );
        }
    }
}

_id_2EF7( var_0 )
{
    var_0 endon( "bots_human_disconnected" );

    while ( !scripts\engine\utility::array_contains( level.players, var_0 ) )
        wait 0.05;

    var_0 notify( "bots_human_spawned" );
}

_id_2EF6( var_0 )
{
    var_0 endon( "bots_human_spawned" );
    var_0 waittill( "disconnect" );
    var_0 notify( "bots_human_disconnected" );
}

_id_2EF8( var_0 )
{
    var_0 scripts\engine\utility::waittill_any( "bots_human_spawned", "bots_human_disconnected" );
    level._id_D40C = scripts\engine\utility::array_remove( level._id_D40C, var_0 );
}

_id_B985()
{
    level._id_D40C = [];
    childthread _id_13968();

    for (;;)
    {
        if ( level._id_D40C.size > 0 )
            level._id_C9D7 = 1;
        else
            level._id_C9D7 = 0;

        wait 0.5;
    }
}

_id_2D22( var_0 )
{
    if ( scripts\mp\utility\game::matchmakinggame() )
        return 1;

    if ( !level.teambased )
        return 1;

    if ( scripts\mp\teams::getjointeampermissions( var_0 ) )
        return 1;

    return 0;
}

_id_2D3A( var_0, var_1 )
{
    level endon( "game_ended" );
    self notify( "bot_connect_monitor" );
    self endon( "bot_connect_monitor" );
    level._id_C9D7 = 0;
    childthread _id_B985();
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.5 );
    var_2 = 1.5;

    if ( !isdefined( level._id_2D36 ) )
        level._id_2D36 = 0;

    if ( !isdefined( level._id_2D37 ) )
        level._id_2D37 = 0;

    if ( !isdefined( level._id_2D35 ) )
        level._id_2D35 = 0;

    for (;;)
    {
        if ( level._id_C9D7 )
        {
            scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_2 );
            continue;
        }

        var_3 = isdefined( level._id_2EF5 ) || !level.teambased;
        var_4 = botgetteamlimit( 0 );
        var_5 = botgetteamlimit( 1 );

        if ( level.rankedmatch )
        {
            var_6 = "default";
            var_7 = "default";
        }
        else
        {
            var_6 = botgetteamdifficulty( 0 );
            var_7 = botgetteamdifficulty( 1 );
        }

        var_8 = "allies";
        var_9 = "axis";
        var_10 = _id_2D34();
        var_11 = _id_3B22( var_10, "humans" );

        if ( var_11 > 1 )
        {
            var_12 = _id_2DAD();

            if ( !scripts\mp\utility\game::matchmakinggame() && isdefined( var_12 ) && var_12 != "spectator" )
            {
                var_8 = var_12;
                var_9 = scripts\mp\utility\game::_id_8027( var_12 );
            }
            else
            {
                var_13 = _id_3B22( var_10, "humans_allies" );
                var_14 = _id_3B22( var_10, "humans_axis" );

                if ( var_14 > var_13 )
                {
                    var_8 = "axis";
                    var_9 = "allies";
                }
            }
        }
        else
        {
            var_15 = get_human_player();

            if ( isdefined( var_15 ) )
            {
                var_16 = var_15 _id_2DB2();

                if ( isdefined( var_16 ) && var_16 != "spectator" )
                {
                    var_8 = var_16;
                    var_9 = scripts\mp\utility\game::_id_8027( var_16 );
                }
            }
        }

        var_17 = scripts\mp\bots\bots_util::_id_2DB5();
        var_18 = scripts\mp\bots\bots_util::_id_2DB5();

        if ( var_17 + var_18 < scripts\mp\bots\bots_util::bot_get_client_limit() )
        {
            if ( var_17 < var_4 )
                var_17++;
            else if ( var_18 < var_5 )
                var_18++;
        }

        var_19 = _id_3B22( var_10, "humans_" + var_8 );
        var_20 = _id_3B22( var_10, "humans_" + var_9 );
        var_21 = var_19 + var_20;
        var_22 = _id_3B22( var_10, "spectator" );
        var_23 = 0;

        for ( var_24 = 0; var_22 > 0; var_22-- )
        {
            var_25 = var_19 + var_23 + 1 <= var_17;
            var_26 = var_20 + var_24 + 1 <= var_18;

            if ( var_25 && !var_26 )
            {
                var_23++;
                continue;
            }

            if ( !var_25 && var_26 )
            {
                var_24++;
                continue;
            }

            if ( var_25 && var_26 )
            {
                if ( var_22 % 2 == 1 )
                {
                    var_23++;
                    continue;
                }

                var_24++;
            }
        }

        var_27 = _id_3B22( var_10, "bots_" + var_8 );
        var_28 = _id_3B22( var_10, "bots_" + var_9 );
        var_29 = var_27 + var_28;

        if ( var_29 > 0 )
            level._id_2D36 = 1;

        var_30 = 0;

        if ( !level._id_2D35 )
        {
            var_30 = !_id_2DAE();

            if ( !var_30 )
                level._id_2D35 = 1;
        }

        if ( var_30 )
        {
            var_31 = !getdvarint( "systemlink" ) && !getdvarint( "onlinegame" );
            var_32 = !var_3 && var_5 != var_4 && !level._id_2D36 && ( level._id_2D37 < 10 || !scripts\mp\utility\game::_id_766C( "prematch_done" ) );

            if ( var_31 || var_32 )
            {
                level._id_2D37 += var_2;
                scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_2 );
                continue;
            }
        }

        var_33 = int( min( var_17 - var_19 - var_23, var_4 ) );
        var_34 = int( min( var_18 - var_20 - var_24, var_5 ) );
        var_35 = 1;
        var_36 = var_33 + var_34 + var_11;
        var_37 = var_4 + var_5 + var_11;

        for ( var_38 = [ -1, -1 ]; var_36 < scripts\mp\bots\bots_util::bot_get_client_limit() && var_36 < var_37; var_35 = !var_35 )
        {
            if ( var_35 && var_33 < var_4 && _id_2D22( var_8 ) )
                var_33++;
            else if ( !var_35 && var_34 < var_5 && _id_2D22( var_9 ) )
                var_34++;

            var_36 = var_33 + var_34 + var_11;

            if ( var_38[var_35] == var_36 )
                break;

            var_38[var_35] = var_36;
        }

        if ( var_4 == var_5 && !var_3 && var_23 == 1 && var_24 == 0 && var_34 > 0 )
        {
            if ( !isdefined( level._id_2E56 ) && scripts\mp\utility\game::_id_766C( "prematch_done" ) )
                level._id_2E56 = gettime();

            if ( var_30 && ( !isdefined( level._id_2E56 ) || gettime() - level._id_2E56 < 10000 ) )
                var_34--;
        }

        var_39 = var_33 - var_27;
        var_40 = var_34 - var_28;
        var_41 = 1;

        if ( var_3 )
        {
            var_42 = var_17 + var_18;
            var_43 = var_4 + var_5;
            var_44 = var_19 + var_20;
            var_45 = var_27 + var_28;
            var_46 = int( min( var_42 - var_44, var_43 ) );
            var_47 = var_46 - var_45;

            if ( var_47 == 0 )
                var_41 = 0;
            else if ( var_47 > 0 )
            {
                var_39 = int( var_47 / 2 ) + var_47 % 2;
                var_40 = int( var_47 / 2 );
            }
            else if ( var_47 < 0 )
            {
                var_48 = var_47 * -1;
                var_39 = -1 * int( min( var_48, var_27 ) );
                var_40 = -1 * ( var_48 + var_39 );
            }
        }
        else if ( !scripts\mp\utility\game::matchmakinggame() && ( var_39 * var_40 < 0 && scripts\mp\utility\game::_id_766C( "prematch_done" ) && !isdefined( level._id_2EEE ) ) )
        {
            var_49 = int( min( abs( var_39 ), abs( var_40 ) ) );

            if ( var_39 > 0 )
                _id_BC13( var_49, var_9, var_8, var_6 );
            else if ( var_40 > 0 )
                _id_BC13( var_49, var_8, var_9, var_7 );

            var_41 = 0;
        }

        if ( var_41 )
        {
            if ( var_40 < 0 )
                _id_5CE4( var_40 * -1, var_9 );

            if ( var_39 < 0 )
                _id_5CE4( var_39 * -1, var_8 );

            if ( var_40 > 0 )
                level thread spawn_bots( var_40, var_9, undefined, undefined, "spawned_enemies", var_7 );

            if ( var_39 > 0 )
                level thread spawn_bots( var_39, var_8, undefined, undefined, "spawned_allies", var_6 );

            if ( var_40 > 0 && var_39 > 0 )
                level scripts\engine\utility::_id_137AC( "spawned_enemies", "spawned_allies" );
            else if ( var_40 > 0 )
                level waittill( "spawned_enemies" );
            else if ( var_39 > 0 )
                level waittill( "spawned_allies" );
        }

        if ( var_7 != var_6 )
        {
            _id_2EF9( var_9, var_7 );
            _id_2EF9( var_8, var_6 );
        }

        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_2 );
    }
}

_id_2DB2()
{
    if ( isdefined( self.team ) )
        return self.team;

    if ( isdefined( self.pers["team"] ) )
        return self.pers["team"];

    return undefined;
}

_id_2DAD()
{
    foreach ( var_1 in level.players )
    {
        if ( !isai( var_1 ) && var_1 ishost() )
            return var_1 _id_2DB2();
    }

    return "spectator";
}

_id_2DAE()
{
    var_0 = 0;
    var_1 = 0;
    var_2 = 0;

    foreach ( var_4 in level.players )
    {
        if ( !isai( var_4 ) )
        {
            if ( var_4 ishost() )
                var_0 = 1;

            if ( _id_D229( var_4 ) )
            {
                var_1 = 1;

                if ( var_4 ishost() )
                    var_2 = 1;
            }
        }
    }

    return var_2 || var_1 && !var_0;
}

_id_D229( var_0 )
{
    if ( isdefined( var_0.team ) && var_0.team != "spectator" )
        return 1;

    if ( isdefined( var_0._id_1097B ) && var_0._id_1097B )
        return 1;

    if ( var_0 ismlgspectator() && isdefined( var_0.team ) && var_0.team == "spectator" )
        return 1;

    return 0;
}

_id_2D34()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        var_2 = level.players[var_1];

        if ( isdefined( var_2 ) && isdefined( var_2.team ) )
        {
            var_0 = _id_3B21( var_0, "all" );
            var_0 = _id_3B21( var_0, var_2.team );

            if ( isbot( var_2 ) )
            {
                var_0 = _id_3B21( var_0, "bots" );
                var_0 = _id_3B21( var_0, "bots_" + var_2.team );
                continue;
            }

            var_0 = _id_3B21( var_0, "humans" );
            var_0 = _id_3B21( var_0, "humans_" + var_2.team );
        }
    }

    return var_0;
}

_id_3B21( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = [];

    if ( !isdefined( var_0[var_1] ) )
        var_0[var_1] = 0;

    var_0[var_1] += 1;
    return var_0;
}

_id_3B22( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isdefined( var_0[var_1] ) )
        return 0;

    return var_0[var_1];
}

_id_BC13( var_0, var_1, var_2, var_3 )
{
    foreach ( var_5 in level.players )
    {
        if ( !isdefined( var_5.team ) )
            continue;

        if ( isdefined( var_5.connected ) && var_5.connected && isbot( var_5 ) && var_5.team == var_1 )
        {
            var_5.bot_team = var_2;

            if ( isdefined( var_3 ) )
                var_5 scripts\mp\bots\bots_util::bot_set_difficulty( var_3 );

            var_5 notify( "luinotifyserver", "team_select", bot_lui_convert_team_to_int( var_2 ) );
            wait 0.05;
            var_5 notify( "luinotifyserver", "class_select", var_5.bot_class );
            var_0--;

            if ( var_0 <= 0 )
                break;
            else
                wait 0.1;
        }
    }
}

_id_2EF9( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( !isdefined( var_3.team ) )
            continue;

        if ( isdefined( var_3.connected ) && var_3.connected && isbot( var_3 ) && var_3.team == var_0 )
        {
            if ( var_1 != var_3 botgetdifficulty() )
                var_3 scripts\mp\bots\bots_util::bot_set_difficulty( var_1 );
        }
    }
}

bot_drop()
{
    kick( self.entity_number, "EXE_PLAYERKICKED_BOT_BALANCE" );
    wait 0.1;
}

_id_5CE4( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in level.players )
    {
        if ( isdefined( var_4.connected ) && var_4.connected && isbot( var_4 ) && ( !isdefined( var_1 ) || isdefined( var_4.team ) && var_4.team == var_1 ) )
            var_2[var_2.size] = var_4;
    }

    for ( var_6 = var_2.size - 1; var_6 >= 0; var_6-- )
    {
        if ( var_0 <= 0 )
            break;

        if ( !scripts\mp\utility\game::isreallyalive( var_2[var_6] ) )
        {
            var_2[var_6] bot_drop();
            var_2 = scripts\engine\utility::array_remove( var_2, var_2[var_6] );
            var_0--;
        }
    }

    for ( var_6 = var_2.size - 1; var_6 >= 0; var_6-- )
    {
        if ( var_0 <= 0 )
            break;

        var_2[var_6] bot_drop();
        var_0--;
    }
}

bot_lui_convert_team_to_int( var_0 )
{
    if ( var_0 == "axis" )
        return 0;
    else if ( var_0 == "allies" )
        return 1;
    else if ( var_0 == "autoassign" || var_0 == "random" )
        return 2;
    else
        return 3;
}

spawn_bot_latent( var_0, var_1, var_2 )
{
    var_3 = gettime() + 60000;

    while ( !self canspawntestclient() )
    {
        if ( gettime() >= var_3 )
        {
            kick( self.entity_number, "EXE_PLAYERKICKED_BOT_BALANCE" );
            var_2.abort = 1;
            return;
        }

        wait 0.05;

        if ( !isdefined( self ) )
        {
            var_2.abort = 1;
            return;
        }
    }

    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( randomfloatrange( 0.25, 2.0 ) );

    if ( !isdefined( self ) )
    {
        var_2.abort = 1;
        return;
    }

    self spawntestclient();
    self.pers["isBot"] = 1;
    self._id_6695 = 1;
    self.bot_team = var_0;

    if ( isdefined( var_2.difficulty ) )
        scripts\mp\bots\bots_util::bot_set_difficulty( var_2.difficulty );

    if ( isdefined( var_1 ) )
        self [[ var_1 ]]();

    self thread [[ level.bot_funcs["think"] ]]();
    var_2.ready = 1;
}

find_squad_member_index( var_0, var_1 )
{
    var_2 = 0;
    var_3 = 0;
    var_4 = 0;

    while ( var_4 < 10 )
    {
        var_3 = 0;
        var_5 = var_0 getrankedplayerdata( "mp", "squadHQ", "aiSquadMembers", var_4 );

        if ( var_5 == var_2 )
        {
            var_4++;
            continue;
        }

        if ( !isdefined( level.human_team_bot_added ) || !isdefined( level.human_team_bot_added[var_5] ) || level.human_team_bot_added[var_5] == 0 )
            return var_5;

        var_4++;
    }

    return -1;
}

spawn_bots( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = gettime() + 10000;
    var_7 = [];
    var_8 = var_7.size;

    while ( level.players.size < scripts\mp\bots\bots_util::bot_get_client_limit() && var_7.size < var_0 && gettime() < var_6 )
    {
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.05 );
        var_9 = undefined;

        if ( isbotmatchmakingenabled() )
        {
            if ( level.teambased )
                var_9 = addmpbottoteam( var_1 );
            else
                var_9 = addmpbottoteam( "none" );
        }
        else
            var_9 = addbot( "", 0, 0, 0 );

        if ( !isdefined( var_9 ) )
        {
            if ( isdefined( var_3 ) && var_3 )
            {
                if ( isdefined( var_4 ) )
                    self notify( var_4 );

                return;
            }

            scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1 );
            continue;
        }
        else
        {
            var_10 = spawnstruct();
            var_10.bot = var_9;
            var_10.ready = 0;
            var_10.abort = 0;
            var_10.index = var_8;
            var_10.difficulty = var_5;
            var_7[var_7.size] = var_10;
            var_10.bot thread spawn_bot_latent( var_1, var_2, var_10 );
            var_8++;
        }
    }

    var_11 = 0;
    var_6 = gettime() + 60000;

    while ( var_11 < var_7.size && gettime() < var_6 )
    {
        var_11 = 0;

        foreach ( var_10 in var_7 )
        {
            if ( var_10.ready || var_10.abort )
                var_11++;
        }

        wait 0.05;
    }

    if ( isdefined( var_4 ) )
        self notify( var_4 );
}

bot_gametype_chooses_team()
{
    if ( !level.teambased )
        return 1;

    if ( isdefined( level.bots_gametype_handles_team_choice ) && level.bots_gametype_handles_team_choice )
        return 1;

    return 0;
}

bot_gametype_chooses_class()
{
    return isdefined( level.bots_gametype_handles_class_choice ) && level.bots_gametype_handles_class_choice;
}

_id_2DDF()
{
    if ( !isdefined( self._id_4009 ) )
        return 0;

    return 1;
}

bot_think()
{
    self notify( "bot_think" );
    self endon( "bot_think" );
    self endon( "disconnect" );

    while ( !isdefined( self.pers["team"] ) )
        wait 0.05;

    level.hasbots = 1;

    if ( bot_gametype_chooses_team() )
        self.bot_team = self.pers["team"];

    var_0 = self.bot_team;

    if ( !isdefined( var_0 ) )
        var_0 = self.pers["team"];

    scripts\mp\bots\bots_killstreaks::bot_killstreak_setup();
    self.entity_number = self getentitynumber();
    var_1 = 0;

    if ( !isdefined( self.bot_spawned_before ) )
    {
        var_1 = 1;
        self.bot_spawned_before = 1;

        if ( !bot_gametype_chooses_team() )
        {
            self notify( "luinotifyserver", "team_select", bot_lui_convert_team_to_int( var_0 ) );
            wait 0.5;

            if ( self.pers["team"] == "spectator" )
            {
                bot_drop();
                return;
            }
        }
    }

    for (;;)
    {
        scripts\mp\bots\bots_util::bot_set_difficulty( self botgetdifficulty() );
        var_2 = self botgetdifficultysetting( "advancedPersonality" );

        if ( var_1 && isdefined( var_2 ) && var_2 != 0 )
            scripts\mp\bots\bots_personality::bot_balance_personality();

        scripts\mp\bots\bots_personality::bot_assign_personality_functions();

        if ( var_1 )
        {
            bot_set_loadout_class();

            if ( !bot_gametype_chooses_class() )
                self notify( "luinotifyserver", "class_select", self.bot_class );

            if ( self.health == 0 )
            {
                self._id_331E = 1;
                self notify( "bot_ready_to_spawn" );
                self waittill( "spawned_player" );
                self._id_331E = undefined;
                self.bot_team = var_0;
            }

            if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["know_enemies_on_start"] ) )
                self thread [[ level.bot_funcs["know_enemies_on_start"] ]]();

            var_1 = 0;
        }

        bot_restart_think_threads();
        wait 0.1;
        self waittill( "death" );
        respawn_watcher();
        self waittill( "spawned_player" );
    }
}

respawn_watcher()
{
    self endon( "started_spawnPlayer" );

    while ( !self.waitingtospawn )
        wait 0.05;

    if ( scripts\mp\playerlogic::needsbuttontorespawn() )
    {
        while ( self.waitingtospawn )
        {
            if ( self.sessionstate == "spectator" )
            {
                if ( getdvarint( "numlives" ) == 0 || self.pers["lives"] > 0 )
                    self botpressbutton( "use", 0.5 );
            }

            wait 1.0;
        }
    }
}

_id_2DB3()
{
    if ( scripts\mp\utility\game::bot_israndom() == 0 )
    {
        if ( !isdefined( self.pers["rankxp"] ) )
            self.pers["rankxp"] = 0;

        return self.pers["rankxp"];
    }

    var_0 = self botgetdifficulty();
    var_1 = "bot_rank_" + var_0;

    if ( isdefined( self.pers[var_1] ) && self.pers[var_1] > 0 )
        return self.pers[var_1];

    var_2 = bot_random_ranks_for_difficulty( var_0 );
    var_3 = var_2["rank"];
    var_4 = var_2["prestige"];
    var_5 = scripts\mp\rank::getrankinfominxp( var_3 );
    var_6 = var_5 + scripts\mp\rank::getrankinfoxpamt( var_3 );
    var_7 = randomintrange( var_5, var_6 + 1 );
    self.pers[var_1] = var_7;
    return var_7;
}

bot_3d_sighting_model( var_0 )
{
    thread bot_3d_sighting_model_thread( var_0 );
}

bot_3d_sighting_model_thread( var_0 )
{
    var_0 endon( "disconnect" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( isalive( self ) && !self botcanseeentity( var_0 ) && scripts\engine\utility::within_fov( self.origin, self.angles, var_0.origin, self botgetfovdot() ) )
            self botgetimperfectenemyinfo( var_0, var_0.origin );

        wait 0.1;
    }
}

bot_random_ranks_for_difficulty( var_0 )
{
    var_1 = [];
    var_1["rank"] = 0;
    var_1["prestige"] = 0;

    if ( var_0 == "default" )
        return var_1;

    if ( !isdefined( level.bot_rnd_rank ) )
    {
        level.bot_rnd_rank = [];
        level.bot_rnd_rank["recruit"][0] = 0;
        level.bot_rnd_rank["recruit"][1] = 5;
        level.bot_rnd_rank["regular"][0] = 6;
        level.bot_rnd_rank["regular"][1] = 9;
        level.bot_rnd_rank["hardened"][0] = 10;
        level.bot_rnd_rank["hardened"][1] = 19;
        level.bot_rnd_rank["veteran"][0] = 20;
        level.bot_rnd_rank["veteran"][1] = 29;
    }

    if ( !isdefined( level._id_2E68 ) )
    {
        level._id_2E68 = [];
        level._id_2E68["recruit"][0] = 0;
        level._id_2E68["recruit"][1] = 0;
        level._id_2E68["regular"][0] = 0;
        level._id_2E68["regular"][1] = 0;
        level._id_2E68["hardened"][0] = 0;
        level._id_2E68["hardened"][1] = 0;
        level._id_2E68["veteran"][0] = 0;
        level._id_2E68["veteran"][1] = 9;
    }

    if ( isdefined( level.bot_rnd_rank[var_0][0] ) && isdefined( level.bot_rnd_rank[var_0][1] ) )
        var_1["rank"] = randomintrange( level.bot_rnd_rank[var_0][0], level.bot_rnd_rank[var_0][1] + 1 );

    if ( isdefined( level._id_2E68[var_0][0] ) && isdefined( level._id_2E68[var_0][1] ) )
        var_1["prestige"] = randomintrange( level._id_2E68[var_0][0], level._id_2E68[var_0][1] + 1 );

    return var_1;
}

crate_can_use_always( var_0 )
{
    if ( isagent( self ) && !isdefined( var_0.boxtype ) )
        return 0;

    if ( isdefined( var_0._id_485F ) && !scripts\mp\bots\bots_killstreaks::_id_2DDB( var_0._id_485F ) )
        return 0;

    return 1;
}

get_human_player()
{
    var_0 = undefined;
    var_1 = getentarray( "player", "classname" );

    if ( isdefined( var_1 ) )
    {
        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            if ( isdefined( var_1[var_2] ) && isdefined( var_1[var_2].connected ) && var_1[var_2].connected && !isai( var_1[var_2] ) && ( !isdefined( var_0 ) || var_0.team == "spectator" ) )
                var_0 = var_1[var_2];
        }
    }

    return var_0;
}

bot_damage_callback( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( self ) || !isalive( self ) )
        return;

    if ( var_2 == "MOD_FALLING" || var_2 == "MOD_SUICIDE" )
        return;

    if ( var_1 <= 0 )
        return;

    if ( !isdefined( var_4 ) )
    {
        if ( !isdefined( var_0 ) )
            return;

        var_4 = var_0;
    }

    if ( isdefined( var_4 ) )
    {
        if ( isdefined( self._id_7197 ) )
            self [[ self._id_7197 ]]( var_0, var_1, var_2, var_3, var_4, var_5 );

        if ( level.teambased )
        {
            if ( isdefined( var_4.team ) && var_4.team == self.team )
                return;
            else if ( isdefined( var_0 ) && isdefined( var_0.team ) && var_0.team == self.team )
                return;
        }

        var_6 = scripts\mp\bots\bots_util::bot_get_known_attacker( var_0, var_4 );

        if ( isdefined( var_6 ) )
            self botsetattacker( var_6 );
    }
}

on_bot_killed( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    self botclearscriptenemy();
    self botclearscriptgoal();
    var_10 = scripts\mp\bots\bots_util::bot_get_known_attacker( var_1, var_0 );

    if ( !scripts\mp\utility\game::bot_is_fireteam_mode() && isdefined( var_10 ) && var_10.classname == "script_vehicle" && isdefined( var_10.helitype ) )
    {
        var_11 = self botgetdifficultysetting( "launcherRespawnChance" );

        if ( randomfloat( 1.0 ) < var_11 )
            self.respawn_with_launcher = 1;
    }
}

bot_should_do_killcam()
{
    if ( scripts\mp\utility\game::bot_is_fireteam_mode() )
        return 0;

    var_0 = 0.0;
    var_1 = self botgetdifficulty();

    if ( var_1 == "recruit" )
        var_0 = 0.1;
    else if ( var_1 == "regular" )
        var_0 = 0.4;
    else if ( var_1 == "hardened" )
        var_0 = 0.7;
    else if ( var_1 == "veteran" )
        var_0 = 1.0;

    return randomfloat( 1.0 ) < 1.0 - var_0;
}

bot_should_pickup_weapons()
{
    if ( scripts\mp\utility\game::isjuggernaut() )
        return 0;

    return 1;
}

bot_restart_think_threads()
{
    thread bot_think_watch_enemy();
    thread scripts\mp\bots\bots_strategy::bot_think_tactical_goals();
    self thread [[ level.bot_funcs["dropped_weapon_think"] ]]();
    thread bot_think_level_acrtions();
    thread bot_think_crate();
    thread scripts\mp\bots\bots_supers::bot_think_supers();
    thread _id_0D79::bot_think_powers();
    thread bot_think_crate_blocking_path();
    thread scripts\mp\bots\bots_killstreaks::bot_think_killstreak();
    thread scripts\mp\bots\bots_killstreaks::bot_think_watch_aerial_killstreak();
    thread bot_think_gametype();
}

bot_think_watch_enemy( var_0 )
{
    var_1 = "spawned_player";

    if ( isdefined( var_0 ) && var_0 )
        var_1 = "death";

    self notify( "bot_think_watch_enemy" );
    self endon( "bot_think_watch_enemy" );
    self endon( var_1 );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_A8BA = gettime();

    for (;;)
    {
        if ( isdefined( self._id_010C ) )
        {
            if ( self botcanseeentity( self._id_010C ) )
                self._id_A8BA = gettime();
        }

        wait 0.05;
    }
}

bot_think_seek_dropped_weapons()
{
    self notify( "bot_think_seek_dropped_weapons" );
    self endon( "bot_think_seek_dropped_weapons" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = "throwingknife_mp";

    for (;;)
    {
        var_1 = 0;

        if ( scripts\mp\bots\bots_util::_id_2E3B() && self [[ level.bot_funcs["should_pickup_weapons"] ]]() && !scripts\mp\bots\bots_util::bot_is_remote_or_linked() )
        {
            var_2 = getentarray( "dropped_weapon", "targetname" );
            var_3 = scripts\engine\utility::_id_782F( self.origin, var_2 );

            if ( var_3.size > 0 )
            {
                var_4 = var_3[0];
                _id_2E6F( var_4 );
            }
        }

        if ( !scripts\mp\bots\bots_util::_id_2DCA() && !scripts\mp\bots\bots_util::bot_is_remote_or_linked() && self botgetdifficultysetting( "strategyLevel" ) > 0 )
        {
            var_5 = self hasweapon( var_0 );
            var_6 = var_5 && self getammocount( var_0 ) == 0;

            if ( var_6 )
            {
                if ( isdefined( self._id_8444 ) )
                {
                    wait 5.0;
                    continue;
                }

                var_7 = getentarray( "dropped_knife", "targetname" );
                var_8 = scripts\engine\utility::_id_782F( self.origin, var_7 );

                foreach ( var_10 in var_8 )
                {
                    if ( !isdefined( var_10 ) )
                        continue;

                    if ( !isdefined( var_10._id_370D ) )
                    {
                        var_11 = scripts\mp\bots\bots_util::_id_2E58( "BotGetClosestNavigablePoint", scripts\mp\bots\bots_util::_id_74C3, var_10.origin, 32, self );

                        if ( isdefined( var_10 ) )
                        {
                            var_10._id_429A = var_11;
                            var_10._id_370D = 1;
                        }
                        else
                            continue;
                    }

                    if ( isdefined( var_10._id_429A ) )
                    {
                        self._id_8444 = 1;
                        _id_2E6F( var_10 );
                    }
                }
            }
            else if ( var_5 )
                self._id_8444 = undefined;
        }

        wait( randomfloatrange( 0.25, 0.75 ) );
    }
}

_id_2E6F( var_0 )
{
    if ( scripts\mp\bots\bots_strategy::_id_2DC5( "seek_dropped_weapon", var_0 ) == 0 )
    {
        var_1 = undefined;

        if ( var_0._id_0336 == "dropped_weapon" )
        {
            var_2 = 1;
            var_3 = self getweaponslistprimaries();

            foreach ( var_5 in var_3 )
            {
                if ( var_0._id_01F1 == getweaponmodel( var_5 ) )
                    var_2 = 0;
            }

            if ( var_2 )
                var_1 = ::_id_2E4C;
        }

        var_7 = spawnstruct();
        var_7._id_C270 = var_0;
        var_7._id_EDC9 = 12;
        var_7._id_FF0D = level.bot_funcs["dropped_weapon_cancel"];
        var_7._id_157C = var_1;
        scripts\mp\bots\bots_strategy::_id_2E27( "seek_dropped_weapon", var_0.origin, 100, var_7 );
    }
}

_id_2E4C( var_0 )
{
    self botpressbutton( "use", 2 );
    wait 2;
}

_id_FFA0( var_0 )
{
    if ( !isdefined( var_0._id_C270 ) )
        return 1;

    if ( var_0._id_C270._id_0336 == "dropped_weapon" )
    {
        if ( scripts\mp\bots\bots_util::_id_2DB8() > 0 )
            return 1;
    }
    else if ( var_0._id_C270._id_0336 == "dropped_knife" )
    {
        if ( scripts\mp\bots\bots_util::_id_2DCA() )
        {
            self._id_8444 = undefined;
            return 1;
        }
    }

    return 0;
}

bot_think_level_acrtions( var_0 )
{
    self notify( "bot_think_level_actions" );
    self endon( "bot_think_level_actions" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        scripts\engine\utility::_id_137B7( "calculate_new_level_targets", randomfloatrange( 2, 10 ) );

        if ( !isdefined( level._id_ABE5 ) || level._id_ABE5.size == 0 )
            continue;

        if ( scripts\mp\bots\bots_strategy::_id_2DC5( "map_interactive_object" ) )
            continue;

        if ( scripts\mp\bots\bots_util::_id_2DCA() || scripts\mp\bots\bots_util::bot_is_remote_or_linked() )
            continue;

        var_1 = undefined;

        foreach ( var_3 in level._id_ABE5 )
        {
            if ( scripts\engine\utility::array_contains( var_3._id_8EE3, self ) )
            {
                var_1 = var_3;
                break;
            }
        }

        if ( !isdefined( var_1 ) )
        {
            if ( randomint( 100 ) > 25 )
                continue;

            var_5 = scripts\engine\utility::_id_782F( self.origin, level._id_ABE5 );
            var_6 = 256;

            if ( isdefined( var_0 ) )
                var_6 = var_0;
            else if ( self botgetscriptgoaltype() == "hunt" && self botpursuingscriptgoal() )
                var_6 = 512;

            if ( distancesquared( self.origin, var_5[0].origin ) > var_6 * var_6 )
                continue;

            var_1 = var_5[0];
        }

        var_7 = 0;

        if ( var_1._id_2DD1 == "damage" )
        {
            var_7 = _id_2E8F( var_1 );

            if ( var_7 )
            {
                var_8 = var_1.origin[2] - var_1._id_2EAA[0].origin[2] + 55;
                var_9 = var_1.origin[2] - var_1._id_2EAA[1].origin[2] + 55;

                if ( var_8 > 55 && var_9 > 55 )
                {
                    if ( scripts\engine\utility::array_contains( var_1._id_8EE3, self ) )
                        var_1._id_8EE3 = scripts\engine\utility::array_remove( var_1._id_8EE3, self );

                    continue;
                }
            }

            var_10 = weaponclass( self getcurrentweapon() );

            if ( var_10 == "spread" )
            {
                var_11 = var_1._id_2EAA[0].origin - var_1.origin;
                var_12 = var_1._id_2EAA[1].origin - var_1.origin;
                var_13 = lengthsquared( var_11 );
                var_14 = lengthsquared( var_12 );

                if ( var_13 > 22500 && var_14 > 22500 )
                {
                    if ( scripts\engine\utility::array_contains( var_1._id_8EE3, self ) )
                        var_1._id_8EE3 = scripts\engine\utility::array_remove( var_1._id_8EE3, self );

                    continue;
                }
            }
        }

        var_15 = spawnstruct();
        var_15._id_C270 = var_1;

        if ( var_1._id_2DD1 == "damage" )
        {
            if ( var_7 )
                var_15._id_FF0D = ::_id_ABEC;
            else
                var_15._id_FF0D = ::_id_ABED;
        }

        if ( var_1._id_2DD1 == "use" )
        {
            var_15._id_157C = ::_id_13036;
            var_15._id_FF0D = ::_id_ABEB;
            var_15._id_EDCC = vectortoangles( var_1.origin - var_1._id_2EA8.origin )[1];
            scripts\mp\bots\bots_strategy::_id_2E27( "map_interactive_object", var_1._id_2EA8.origin, 10, var_15 );
            continue;
        }

        if ( var_1._id_2DD1 == "damage" )
        {
            if ( var_7 )
            {
                var_15._id_157C = ::_id_B57B;
                var_15._id_EDC9 = 20;
            }
            else
            {
                var_15._id_157C = ::_id_24B3;
                var_15._id_EDC9 = 50;
            }

            var_16 = undefined;
            var_17 = scripts\mp\bots\bots_util::_id_2E58( "GetPathDistLevelAction", scripts\mp\bots\bots_util::_id_74C9, self.origin, var_1._id_2EAA[0].origin );
            var_18 = scripts\mp\bots\bots_util::_id_2E58( "GetPathDistLevelAction", scripts\mp\bots\bots_util::_id_74C9, self.origin, var_1._id_2EAA[1].origin );

            if ( !isdefined( var_1 ) )
                continue;

            if ( var_17 <= 0 && var_18 <= 0 )
                continue;

            if ( var_17 > 0 )
            {
                if ( var_18 < 0 || var_17 <= var_18 )
                    var_16 = var_1._id_2EAA[0];
            }

            if ( var_18 > 0 )
            {
                if ( var_17 < 0 || var_18 <= var_17 )
                    var_16 = var_1._id_2EAA[1];
            }

            if ( !var_7 )
                childthread _id_B981( var_16 );

            scripts\mp\bots\bots_strategy::_id_2E27( "map_interactive_object", var_16.origin, 10, var_15 );
        }
    }
}

_id_2E8F( var_0 )
{
    var_1 = self getcurrentweapon();
    var_2 = scripts\mp\bots\bots_util::_id_2E3B() || self.hasriotshieldequipped || isdefined( self._id_9E5D ) && self._id_9E5D == 1 || weaponclass( var_1 ) == "grenade" || scripts\mp\weapons::_id_9E6D( var_1 );
    return var_2;
}

_id_B981( var_0 )
{
    self endon( "goal" );
    wait 0.1;

    for (;;)
    {
        if ( weaponclass( self getcurrentweapon() ) == "spread" )
        {
            if ( distancesquared( self.origin, var_0.origin ) > 90000 )
            {
                wait 0.05;
                continue;
            }
        }

        var_1 = self getnearestnode();

        if ( isdefined( var_1 ) )
        {
            if ( nodesvisible( var_1, var_0 ) )
            {
                if ( sighttracepassed( self.origin + ( 0, 0, 55 ), var_0.origin + ( 0, 0, 55 ), 0, self ) )
                    self notify( "goal" );
            }
        }

        wait 0.05;
    }
}

_id_24B3( var_0 )
{
    if ( var_0._id_C270.origin[2] - self geteye()[2] > 55 )
    {
        if ( distance2dsquared( var_0._id_C270.origin, self.origin ) < 225 )
            return;
    }

    self botsetflag( "disable_movement", 1 );
    _id_AFF0( var_0._id_C270, 0.3 );
    self botpressbutton( "ads", 0.3 );
    wait 0.25;
    var_1 = gettime();

    while ( isdefined( var_0._id_C270 ) && !isdefined( var_0._id_C270._id_1D3F ) && gettime() - var_1 < 5000 )
    {
        _id_AFF0( var_0._id_C270, 0.15 );
        self botpressbutton( "ads", 0.15 );
        self botpressbutton( "attack" );
        wait 0.1;
    }

    self botsetflag( "disable_movement", 0 );
}

_id_B57B( var_0 )
{
    self botsetflag( "disable_movement", 1 );
    _id_AFF0( var_0._id_C270, 0.3 );
    wait 0.25;
    var_1 = gettime();

    while ( isdefined( var_0._id_C270 ) && !isdefined( var_0._id_C270._id_1D3F ) && gettime() - var_1 < 5000 )
    {
        _id_AFF0( var_0._id_C270, 0.15 );
        self botpressbutton( "melee" );
        wait 0.1;
    }

    self botsetflag( "disable_movement", 0 );
}

_id_AFF0( var_0, var_1 )
{
    var_2 = var_0.origin;

    if ( distance2dsquared( self.origin, var_2 ) < 100 )
        var_2 = ( var_2[0], var_2[1], self geteye()[2] );

    self botlookatpoint( var_2, var_1, "script_forced" );
}

_id_13036( var_0 )
{
    if ( isagent( self ) )
    {
        scripts\engine\utility::_id_1C6E( 1 );
        var_0._id_C270 enableplayeruse( self );
        wait 0.05;
    }

    var_1 = var_0._id_C270._id_13031;
    self botpressbutton( "use", var_1 );
    wait( var_1 );

    if ( isagent( self ) )
    {
        scripts\engine\utility::_id_1C6E( 0 );

        if ( isdefined( var_0._id_C270 ) )
            var_0._id_C270 disableplayeruse( self );
    }
}

_id_ABEC( var_0 )
{
    if ( _id_ABEB( var_0 ) )
        return 1;

    if ( !_id_2E8F( var_0._id_C270 ) )
        return 1;

    return 0;
}

_id_ABED( var_0 )
{
    if ( _id_ABEB( var_0 ) )
        return 1;

    if ( _id_2E8F( var_0._id_C270 ) )
        return 1;

    return 0;
}

_id_ABEB( var_0 )
{
    if ( !isdefined( var_0._id_C270 ) )
        return 1;

    if ( isdefined( var_0._id_C270._id_1D3F ) )
        return 1;

    if ( scripts\mp\bots\bots_util::_id_2DCA() )
        return 1;

    return 0;
}

_id_483B( var_0 )
{
    if ( !isdefined( var_0.owner ) || var_0.owner != self )
    {
        if ( distancesquared( self.origin, var_0.origin ) > 4194304 )
            return 0;
    }

    return 1;
}

_id_2D45( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = self [[ level.bot_funcs["crate_can_use"] ]]( var_0 );

    if ( !var_1 )
    {
        if ( level.gametype == "grnd" )
            var_1 = 1;
    }

    if ( !var_1 )
        return 0;

    if ( !_id_483D( var_0 ) )
        return 0;

    if ( level.teambased && isdefined( var_0._id_2C43 ) && isdefined( var_0.team ) && var_0.team == self.team )
        return 0;

    if ( !self [[ level.bot_funcs["crate_in_range"] ]]( var_0 ) )
        return 0;

    if ( isdefined( var_0.boxtype ) )
    {
        if ( isdefined( level._id_2F30[var_0.boxtype] ) && ![[ level._id_2F30[var_0.boxtype]._id_3936 ]]() )
            return 0;

        if ( isdefined( var_0._id_55BC ) && isdefined( var_0._id_55BC[self getentitynumber()] ) && var_0._id_55BC[self getentitynumber()] )
            return 0;

        if ( !self [[ level._id_2D27[var_0.boxtype] ]]( var_0 ) )
            return 0;
    }

    return isdefined( var_0 );
}

_id_483D( var_0 )
{
    if ( !_id_483A( var_0 ) )
        return 0;

    if ( !_id_483C( var_0 ) )
        return 0;

    return isdefined( var_0 );
}

_id_483A( var_0 )
{
    if ( isdefined( var_0.boxtype ) )
        return gettime() > var_0._id_0064 + 1000;
    else
        return isdefined( var_0._id_5D44 ) && !var_0._id_5D44;
}

_id_483C( var_0 )
{
    if ( !isdefined( var_0._id_C4B7 ) )
        _id_482F( var_0 );

    return isdefined( var_0 ) && var_0._id_C4B7;
}

_id_C042( var_0, var_1 )
{
    if ( isdefined( var_1.boxtype ) && var_1.boxtype == "scavenger_bag" )
        return abs( var_0.origin[0] - var_1.origin[0] ) < 36 && abs( var_0.origin[0] - var_1.origin[0] ) < 36 && abs( var_0.origin[0] - var_1.origin[0] ) < 18;
    else
    {
        var_2 = getdvarfloat( "player_useRadius" );
        var_3 = distancesquared( var_1.origin, var_0.origin + ( 0, 0, 40 ) );
        return var_3 <= var_2 * var_2;
    }
}

_id_482F( var_0 )
{
    var_0 thread _id_483F();
    var_0._id_C4B7 = 0;
    var_1 = undefined;
    var_2 = undefined;

    if ( isdefined( var_0._id_72B6 ) )
    {
        var_1 = var_0._id_72B6;
        var_2 = gettime() + 30000;
        var_0._id_72B6 = var_2;
        var_0 notify( "path_disconnect" );
    }

    wait 0.05;

    if ( !isdefined( var_0 ) )
        return;

    var_3 = _id_4839( var_0 );

    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( var_3 ) && var_3.size > 0 )
    {
        var_0._id_BE7E = var_3;
        var_0._id_C4B7 = 1;
    }
    else
    {
        var_4 = getdvarfloat( "player_useRadius" );
        var_5 = getnodesinradiussorted( var_0.origin, var_4 * 2, 0 )[0];
        var_6 = var_0 getpointinbounds( 0, 0, -1 );
        var_7 = undefined;

        if ( isdefined( var_0.boxtype ) && var_0.boxtype == "scavenger_bag" )
        {
            if ( scripts\mp\bots\bots_util::_id_2E4E( var_0.origin ) )
                var_7 = var_0.origin;
        }
        else
            var_7 = botgetclosestnavigablepoint( var_0.origin, var_4 );

        if ( isdefined( var_5 ) && !var_5 nodeisdisconnected() && isdefined( var_7 ) && abs( var_5.origin[2] - var_6[2] ) < 30 )
        {
            var_0._id_BE80 = [ var_7 ];
            var_0._id_BE7E = [ var_5 ];
            var_0._id_C4B7 = 1;
        }
    }

    if ( isdefined( var_0._id_72B6 ) )
    {
        if ( var_0._id_72B6 == var_2 )
            var_0._id_72B6 = var_1;
    }
}

_id_4839( var_0 )
{
    var_1 = getnodesinradiussorted( var_0.origin, 256, 0 );

    for ( var_2 = var_1.size; var_2 > 0; var_2-- )
        var_1[var_2] = var_1[var_2 - 1];

    var_1[0] = getclosestnodeinsight( var_0.origin );
    var_3 = undefined;

    if ( isdefined( var_0._id_72B6 ) )
        var_3 = getallnodes();

    var_4 = [];
    var_5 = 1;

    if ( !isdefined( var_0.boxtype ) )
        var_5 = 2;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_6 = var_1[var_2];

        if ( !isdefined( var_6 ) || !isdefined( var_0 ) )
            continue;

        if ( var_6 nodeisdisconnected() )
            continue;

        if ( !_id_C042( var_6, var_0 ) )
        {
            if ( var_2 == 0 )
                continue;
            else
                break;
        }

        wait 0.05;

        if ( !isdefined( var_0 ) )
            break;

        if ( sighttracepassed( var_0.origin, var_6.origin + ( 0, 0, 55 ), 0, var_0 ) )
        {
            wait 0.05;

            if ( !isdefined( var_0 ) )
                break;

            if ( !isdefined( var_0._id_72B6 ) )
            {
                var_4[var_4.size] = var_6;

                if ( var_4.size == var_5 )
                    return var_4;
                else
                    continue;
            }

            var_7 = undefined;
            var_8 = 0;

            while ( !isdefined( var_7 ) && var_8 < 100 )
            {
                var_8++;
                var_9 = scripts\engine\utility::_id_DC6B( var_3 );

                if ( distancesquared( var_6.origin, var_9.origin ) > 250000 )
                    var_7 = var_9;
            }

            if ( isdefined( var_7 ) )
            {
                var_10 = scripts\mp\bots\bots_util::_id_2E58( "GetNodesOnPathCrate", scripts\mp\bots\bots_util::_id_74C8, var_6.origin, var_7.origin );

                if ( isdefined( var_10 ) )
                {
                    var_4[var_4.size] = var_6;

                    if ( var_4.size == var_5 )
                        return var_4;
                    else
                        continue;
                }
            }
        }
    }

    return undefined;
}

_id_4837( var_0 )
{
    if ( isdefined( var_0._id_BE80 ) )
        return var_0._id_BE80[0];

    if ( isdefined( var_0._id_BE7E ) )
    {
        if ( var_0._id_BE7E.size > 1 )
        {
            var_1 = scripts\engine\utility::_id_22BD( self botnodescoremultiple( var_0._id_BE7E, "node_exposed" ) );
            return scripts\engine\utility::random_weight_sorted( var_1 ).origin;
        }
        else
            return var_0._id_BE7E[0].origin;
    }
}

_id_4838( var_0, var_1 )
{
    var_2 = _id_4837( var_0 );
    var_2 = getclosestpointonnavmesh( var_2, self );
    var_3 = var_1 * 0.9;
    var_3 *= var_3;

    if ( distancesquared( var_0.origin, var_2 ) <= var_3 )
        return var_2;
    else
        return undefined;
}

bot_think_crate()
{
    self notify( "bot_think_crate" );
    self endon( "bot_think_crate" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = getdvarfloat( "player_useRadius" );

    for (;;)
    {
        var_1 = randomfloatrange( 2, 4 );
        scripts\engine\utility::_id_137B7( "new_crate_to_take", var_1 );

        if ( isdefined( self._id_2F2B ) && self._id_2F2B.size == 0 )
            self._id_2F2B = undefined;

        var_2 = level._id_3A59;

        if ( !scripts\mp\bots\bots_util::_id_2DCA() && isdefined( self._id_2F2B ) )
            var_2 = scripts\engine\utility::_id_227F( var_2, self._id_2F2B );

        if ( isdefined( level._id_2E6A ) && scripts\mp\utility\game::_id_12D6( "specialty_scavenger" ) )
            var_2 = scripts\engine\utility::_id_227F( var_2, level._id_2E6A );

        var_2 = scripts\engine\utility::_id_22BC( var_2 );

        if ( var_2.size == 0 )
            continue;

        if ( scripts\mp\bots\bots_strategy::_id_2DC5( "airdrop_crate" ) || self botgetscriptgoaltype() == "tactical" || scripts\mp\bots\bots_util::bot_is_remote_or_linked() )
            continue;

        var_3 = [];

        foreach ( var_5 in var_2 )
        {
            if ( _id_2D45( var_5 ) )
                var_3[var_3.size] = var_5;
        }

        var_3 = scripts\engine\utility::_id_22AF( var_3 );

        if ( var_3.size == 0 )
            continue;

        var_3 = scripts\engine\utility::_id_782F( self.origin, var_3 );
        var_7 = self getnearestnode();

        if ( !isdefined( var_7 ) )
            continue;

        var_8 = self [[ level.bot_funcs["crate_low_ammo_check"] ]]();
        var_9 = ( var_8 || randomint( 100 ) < 50 ) && !scripts\mp\killstreaks\emp_common::_id_9D29();
        var_10 = undefined;

        foreach ( var_5 in var_3 )
        {
            var_12 = 0;

            if ( ( !isdefined( var_5.owner ) || var_5.owner != self ) && !isdefined( var_5.boxtype ) )
            {
                var_13 = [];

                foreach ( var_15 in level.players )
                {
                    if ( !isdefined( var_15.team ) )
                        continue;

                    if ( !isai( var_15 ) && level.teambased && var_15.team == self.team )
                    {
                        if ( distancesquared( var_15.origin, var_5.origin ) < 490000 )
                            var_13[var_13.size] = var_15;
                    }
                }

                if ( var_13.size > 0 )
                {
                    var_17 = var_13[0] getnearestnode();

                    if ( isdefined( var_17 ) )
                    {
                        var_12 = 0;

                        foreach ( var_19 in var_5._id_BE7E )
                            var_12 |= nodesvisible( var_17, var_19, 1 );
                    }
                }
            }

            if ( !var_12 )
            {
                var_21 = isdefined( var_5._id_2EEB ) && isdefined( var_5._id_2EEB[self.team] ) && var_5._id_2EEB[self.team] > 0;
                var_22 = 0;

                foreach ( var_19 in var_5._id_BE7E )
                    var_22 |= nodesvisible( var_7, var_19, 1 );

                if ( var_22 || var_9 && !var_21 )
                {
                    var_10 = var_5;
                    break;
                }
            }
        }

        if ( isdefined( var_10 ) )
        {
            if ( self [[ level.bot_funcs["crate_should_claim"] ]]() )
            {
                if ( !isdefined( var_10.boxtype ) )
                {
                    if ( !isdefined( var_10._id_2EEB ) )
                        var_10._id_2EEB = [];

                    var_10._id_2EEB[self.team] = 1;
                }
            }

            var_26 = spawnstruct();
            var_26._id_C270 = var_10;
            var_26._id_10D46 = ::_id_1392B;
            var_26._id_FF0D = ::_id_4841;
            var_27 = undefined;

            if ( isdefined( var_10.boxtype ) )
            {
                if ( isdefined( var_10._id_2F32 ) && var_10._id_2F32 )
                {
                    var_26._id_EDC9 = 16;
                    var_26._id_157C = undefined;
                    var_27 = var_10.origin;
                }
                else
                {
                    var_26._id_EDC9 = 50;
                    var_26._id_157C = ::_id_12FAF;
                    var_28 = _id_4838( var_10, var_0 );

                    if ( !isdefined( var_28 ) )
                        continue;

                    var_28 -= var_10.origin;
                    var_29 = length( var_28 ) * randomfloat( 1.0 );
                    var_27 = var_10.origin + vectornormalize( var_28 ) * var_29 + ( 0, 0, 12 );
                }
            }
            else
            {
                var_26._id_157C = ::_id_12FBF;
                var_26._id_6302 = ::_id_11052;
                var_27 = _id_4838( var_10, var_0 );

                if ( !isdefined( var_27 ) )
                    continue;

                var_26._id_EDC9 = var_0 - distance( var_10.origin, var_27 + ( 0, 0, 40 ) );
                var_27 += ( 0, 0, 24 );
            }

            if ( isdefined( var_26._id_EDC9 ) )
            {

            }

            var_10 notify( "path_disconnect" );
            wait 0.05;

            if ( !isdefined( var_10 ) )
                continue;

            scripts\mp\bots\bots_strategy::_id_2E27( "airdrop_crate", var_27, 30, var_26 );
        }
    }
}

_id_2E93( var_0 )
{
    return 1;
}

_id_484B()
{
    return 1;
}

_id_483E()
{
    return 0;
}

_id_2E92( var_0 )
{
    if ( self getcurrentweapon() == level._id_2F30[var_0.boxtype]._id_B7A8 )
        return 0;

    return 1;
}

_id_2E54( var_0 )
{
    scripts\mp\utility\game::_id_141A( self._id_F0C4 );
    wait 1.0;
}

_id_2E51( var_0 )
{
    scripts\mp\utility\game::_id_141A( "none" );
    self._id_F0C4 = self getcurrentweapon();
}

_id_2E96( var_0 )
{
    if ( scripts\mp\bots\bots_util::_id_2DB0( 0.66 ) )
    {
        var_1 = self getnearestnode();

        if ( isdefined( var_0._id_BE7E ) && isdefined( var_0._id_BE7E[0] ) && isdefined( var_1 ) )
        {
            if ( nodesvisible( var_1, var_0._id_BE7E[0], 1 ) )
            {
                if ( scripts\engine\utility::within_fov( self.origin, self.angles, var_0.origin, self botgetfovdot() ) )
                    return 1;
            }
        }
    }

    return 0;
}

_id_2E94( var_0 )
{
    var_1 = self getweaponslistall();

    foreach ( var_3 in var_1 )
    {
        if ( self getweaponammostock( var_3 ) == 0 )
            return 1;
    }

    return 0;
}

_id_2E95( var_0 )
{
    return 1;
}

_id_483F()
{
    self notify( "crate_monitor_position" );
    self endon( "crate_monitor_position" );
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = self.origin;
        wait 0.5;

        if ( !isalive( self ) )
            return;

        if ( !scripts\mp\bots\bots_util::_id_2EC6( self.origin, var_0 ) )
        {
            self._id_C4B7 = undefined;
            self._id_BE7E = undefined;
            self._id_BE80 = undefined;
        }
    }
}

_id_484D()
{

}

_id_4841( var_0 )
{
    if ( !isdefined( var_0._id_C270 ) )
        return 1;

    return 0;
}

_id_12FBF( var_0 )
{
    if ( isagent( self ) )
    {
        scripts\engine\utility::_id_1C6E( 1 );
        var_0._id_C270 enableplayeruse( self );
        wait 0.05;
    }

    self [[ level.bot_funcs["crate_wait_use"] ]]();

    if ( isdefined( var_0._id_C270.owner ) && var_0._id_C270.owner == self )
        var_1 = level._id_485C / 1000 + 0.5;
    else
        var_1 = level._id_4859 / 1000 + 1.0;

    self botpressbutton( "use", var_1 );
    wait( var_1 );

    if ( isagent( self ) )
    {
        scripts\engine\utility::_id_1C6E( 0 );

        if ( isdefined( var_0._id_C270 ) )
            var_0._id_C270 disableplayeruse( self );
    }

    if ( isdefined( var_0._id_C270 ) )
    {
        if ( !isdefined( var_0._id_C270._id_2EFA ) )
            var_0._id_C270._id_2EFA = [];

        var_0._id_C270._id_2EFA[var_0._id_C270._id_2EFA.size] = self;
    }
}

_id_12FAF( var_0 )
{
    if ( isagent( self ) )
    {
        scripts\engine\utility::_id_1C6E( 1 );
        var_0._id_C270 enableplayeruse( self );
        wait 0.05;
    }

    if ( isdefined( var_0._id_C270 ) && isdefined( var_0._id_C270.boxtype ) )
    {
        var_1 = var_0._id_C270.boxtype;

        if ( isdefined( level._id_2E55[var_1] ) )
            self [[ level._id_2E55[var_1] ]]( var_0._id_C270 );

        if ( isdefined( var_0._id_C270 ) )
        {
            var_2 = level._id_2F30[var_0._id_C270.boxtype]._id_130EE / 1000 + 0.5;
            self botpressbutton( "use", var_2 );
            wait( var_2 );

            if ( isdefined( level._id_2E52[var_1] ) )
                self [[ level._id_2E52[var_1] ]]( var_0._id_C270 );
        }
    }

    if ( isagent( self ) )
    {
        scripts\engine\utility::_id_1C6E( 0 );

        if ( isdefined( var_0._id_C270 ) )
            var_0._id_C270 disableplayeruse( self );
    }
}

_id_1392B( var_0 )
{
    thread _id_2ED0( var_0._id_C270 );
}

_id_11052( var_0 )
{
    if ( isdefined( var_0._id_C270 ) )
        var_0._id_C270._id_2EEB[self.team] = 0;
}

_id_2ED0( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "revived" );
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    var_1 = self.team;
    scripts\engine\utility::waittill_any( "death", "disconnect" );

    if ( isdefined( var_0 ) )
        var_0._id_2EEB[var_1] = 0;
}

bot_think_crate_blocking_path()
{
    self notify( "bot_think_crate_blocking_path" );
    self endon( "bot_think_crate_blocking_path" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = getdvarfloat( "player_useRadius" );

    for (;;)
    {
        wait 3;

        if ( self usebuttonpressed() )
            continue;

        if ( scripts\mp\utility\game::isusingremote() )
            continue;

        var_1 = level._id_3A59;

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = var_1[var_2];

            if ( !isdefined( var_3 ) )
                continue;

            if ( distancesquared( self.origin, var_3.origin ) < var_0 * var_0 )
            {
                if ( var_3.owner == self )
                {
                    self botpressbutton( "use", level._id_485C / 1000 + 0.5 );
                    continue;
                }

                self botpressbutton( "use", level._id_4859 / 1000 + 0.5 );
            }
        }
    }
}

bot_think_revive()
{
    self notify( "bot_think_revive" );
    self endon( "bot_think_revive" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( !level.teambased )
        return;

    for (;;)
    {
        var_0 = 2.0;
        var_1 = getentarray( "revive_trigger", "targetname" );

        if ( var_1.size > 0 )
            var_0 = 0.05;

        level scripts\engine\utility::_id_137B7( "player_last_stand", var_0 );

        if ( !_id_2D23() )
            continue;

        var_1 = getentarray( "revive_trigger", "targetname" );

        if ( var_1.size > 1 )
        {
            var_1 = sortbydistance( var_1, self.origin );

            if ( isdefined( self.owner ) )
            {
                for ( var_2 = 0; var_2 < var_1.size; var_2++ )
                {
                    if ( var_1[var_2].owner != self.owner )
                        continue;

                    if ( var_2 == 0 )
                        break;

                    var_3 = var_1[var_2];
                    var_1[var_2] = var_1[0];
                    var_1[0] = var_3;
                    break;
                }
            }
        }

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_4 = var_1[var_2];
            var_5 = var_4.owner;

            if ( !isdefined( var_5 ) )
                continue;

            if ( var_5 == self )
                continue;

            if ( !isalive( var_5 ) )
                continue;

            if ( var_5.team != self.team )
                continue;

            if ( !isdefined( var_5._id_98F3 ) || !var_5._id_98F3 )
                continue;

            if ( isdefined( var_5._id_2EEB ) && isdefined( var_5._id_2EEB[self.team] ) && var_5._id_2EEB[self.team] > 0 )
                continue;

            if ( distancesquared( self.origin, var_5.origin ) < 4194304 )
            {
                var_6 = spawnstruct();
                var_6._id_C270 = var_4;
                var_6._id_EDC9 = 64;

                if ( isdefined( self._id_A8FB ) && gettime() - self._id_A8FB < 1000 )
                    var_6._id_EDC9 = 32;

                var_6._id_10D46 = ::_id_1392C;
                var_6._id_6302 = ::_id_11039;
                var_6._id_FF0D = ::_id_D261;
                var_6._id_157C = ::_id_E4A0;
                scripts\mp\bots\bots_strategy::_id_2E27( "revive", var_5.origin, 60, var_6 );
                break;
            }
        }
    }
}

_id_1392C( var_0 )
{
    thread _id_2ED0( var_0._id_C270.owner );
}

_id_11039( var_0 )
{
    if ( isdefined( var_0._id_C270.owner ) )
        var_0._id_C270.owner._id_2EEB[self.team] = 0;
}

_id_D261( var_0 )
{
    if ( !isdefined( var_0._id_C270.owner ) || var_0._id_C270.owner.health <= 0 )
        return 1;

    if ( !isdefined( var_0._id_C270.owner._id_98F3 ) || !var_0._id_C270.owner._id_98F3 )
        return 1;

    return 0;
}

_id_E4A0( var_0 )
{
    if ( distancesquared( self.origin, var_0._id_C270.owner.origin ) > 4096 )
    {
        self._id_A8FB = gettime();
        return;
    }

    if ( isagent( self ) )
    {
        scripts\engine\utility::_id_1C6E( 1 );
        var_0._id_C270 enableplayeruse( self );
        wait 0.05;
    }

    var_1 = self.team;
    self botpressbutton( "use", level._id_AA15 / 1000 + 0.5 );
    wait( level._id_AA15 / 1000 + 1.5 );

    if ( isdefined( var_0._id_C270.owner ) )
        var_0._id_C270._id_2EEB[var_1] = 0;

    if ( isagent( self ) )
    {
        scripts\engine\utility::_id_1C6E( 0 );

        if ( isdefined( var_0._id_C270 ) )
            var_0._id_C270 disableplayeruse( self );
    }
}

_id_2D23()
{
    if ( isdefined( self.laststand ) && self.laststand == 1 )
        return 0;

    if ( scripts\mp\bots\bots_strategy::_id_2DC5( "revive" ) )
        return 0;

    if ( scripts\mp\bots\bots_util::bot_is_remote_or_linked() )
        return 0;

    if ( scripts\mp\bots\bots_util::_id_2DD4() )
        return 1;

    var_0 = self botgetscriptgoaltype();

    if ( var_0 == "none" || var_0 == "hunt" || var_0 == "guard" )
        return 1;

    return 0;
}

_id_E4A7( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "bad_path" );
    self endon( "goal" );
    var_0 scripts\engine\utility::waittill_any( "death", "revived" );
    self notify( "bad_path" );
}

_id_2DF8()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( gettime() > 15000 )
        return;

    while ( !scripts\mp\utility\game::_id_7672() || !scripts\mp\utility\game::_id_766C( "prematch_done" ) )
        wait 0.05;

    var_0 = undefined;
    var_1 = undefined;

    for ( var_2 = 0; var_2 < level.players.size; var_2++ )
    {
        var_3 = level.players[var_2];

        if ( isdefined( var_3 ) && isdefined( self.team ) && isdefined( var_3.team ) && isenemyteam( self.team, var_3.team ) )
        {
            if ( !isdefined( var_3._id_2EA2 ) )
                var_0 = var_3;

            if ( isai( var_3 ) && !isdefined( var_3._id_2EA1 ) )
                var_1 = var_3;
        }
    }

    if ( isdefined( var_0 ) )
    {
        self._id_2EA1 = 1;
        var_0._id_2EA2 = 1;
        self getenemyinfo( var_0 );
    }

    if ( isdefined( var_1 ) )
    {
        var_1._id_2EA1 = 1;
        self._id_2EA2 = 1;
        var_1 getenemyinfo( self );
    }
}

_id_2E16( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        return self makeentitysentient( var_0, var_1 );
    else
        return self makeentitysentient( var_0 );
}

bot_think_gametype()
{
    self notify( "bot_think_gametype" );
    self endon( "bot_think_gametype" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\mp\utility\game::_id_7670( "prematch_done" );
    self thread [[ level.bot_funcs["gametype_think"] ]]();
}

_id_4FF3()
{

}

_id_B9A3()
{
    for (;;)
    {
        level waittill( "smoke", var_0, var_1 );

        if ( var_1 == "smoke_grenade_mp" )
            var_0 thread _id_B9A2();
    }
}

_id_B9A2()
{
    self endon( "late_death" );
    thread _id_1036D();
    self waittill( "explode", var_0 );
    wait 1;
    var_1 = spawn( "script_model", var_0 );
    var_1 show();
    var_2 = getent( "smoke_grenade_sight_clip_256", "targetname" );

    if ( isdefined( var_2 ) )
        var_1 clonebrushmodeltoscriptmodel( var_2 );

    wait 9.25;
    var_1 delete();
}

_id_1036D()
{
    self endon( "explode" );
    self waittill( "death" );
    waittillframeend;
    self notify( "late_death" );
}

_id_2D04( var_0 )
{
    var_1 = 0;
    var_0.boxtype = "scavenger_bag";
    var_0._id_2F32 = 1;

    if ( !isdefined( level._id_2E6A ) )
        level._id_2E6A = [];

    foreach ( var_4, var_3 in level._id_2E6A )
    {
        if ( !isdefined( var_3 ) )
        {
            var_1 = 1;
            level._id_2E6A[var_4] = var_0;
            break;
        }
    }

    if ( !var_1 )
        level._id_2E6A[level._id_2E6A.size] = var_0;

    foreach ( var_6 in level._id_C928 )
    {
        if ( isai( var_6 ) && var_6 scripts\mp\utility\game::_id_12D6( "specialty_scavenger" ) )
            var_6 notify( "new_crate_to_take" );
    }
}

_id_2EBB()
{
    var_0 = getentarray( "bot_flag_set", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2.script_noteworthy ) )
            continue;

        var_2 thread _id_2D94( var_2.script_noteworthy );
    }
}

_id_2D94( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( scripts\mp\utility\game::isaigameparticipant( var_1 ) )
        {
            var_1 notify( "flag_trigger_set_" + var_0 );
            var_1 botsetflag( var_0, 1 );
            var_1 thread _id_2D95( var_0 );
        }
    }
}

_id_2D95( var_0 )
{
    self endon( "flag_trigger_set_" + var_0 );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\engine\utility::waitframe();
    waittillframeend;
    self botsetflag( var_0, 0 );
}

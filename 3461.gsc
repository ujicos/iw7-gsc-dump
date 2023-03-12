// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._effect["airdrop_crate_destroy"] = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_dp_pickup_dust.vfx" );
    level._effect["airdrop_dust_kickup"] = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_dp_pickup_dust.vfx" );
    level._effect["drone_explode"] = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_dp_exp.vfx" );
    level._effect["crate_explode"] = loadfx( "vfx/iw7/_requests/mp/killstreak/vfx_drone_pkg_exp_vari.vfx" );
    precachempanim( "juggernaut_carepackage" );
    _id_F638( "airdrop_crate" );
    _id_F638( "care_package" );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "dronedrop", ::_id_1AA2, undefined, undefined, ::_id_1288F, undefined, ::_id_1A9F );
    var_0 = [ "passive_bomb_trap", "passive_decreased_cost", "passive_increased_cost", "passive_reroll", "passive_high_roller", "passive_low_roller" ];
    _id_0AC7::_id_DF07( "dronedrop", var_0 );
    level._id_C223 = 0;
    level._id_AD8B = [];
    level._id_4860 = [];
    level._id_4855 = [];
    addcratetype( "dronedrop", "venom", 85, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_VENOM_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop", "uav", 85, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_UAV_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop", "counter_uav", 70, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_COUNTER_UAV_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop", "drone_hive", 70, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_ORBITAL_DEPLOYMENT_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop", "ball_drone_backup", 65, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_BALL_DRONE_BACKUP_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop", "bombardment", 65, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_BOMBARDMENT_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop", "precision_airstrike", 65, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_PRECISION_AIRSTRIKE_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop", "sentry_shock", 45, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_SENTRY_SHOCK_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop", "jackal", 25, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_JACKAL_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop", "thor", 10, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_THOR_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop", "directional_uav", 5, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_DIRECTIONAL_UAV_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop", "remote_c8", 5, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_RC8_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop", "minijackal", 5, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_MINI_JACKAL_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_grnd", "venom", 35, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_VENOM_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_grnd", "uav", 30, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_UAV_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_grnd", "counter_uav", 25, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_COUNTER_UAV_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_grnd", "drone_hive", 25, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_ORBITAL_DEPLOYMENT_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_grnd", "ball_drone_backup", 25, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_BALL_DRONE_BACKUP_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_grnd", "bombardment", 20, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_BOMBARDMENT_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_grnd", "precision_airstrike", 20, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_PRECISION_AIRSTRIKE_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_grnd", "sentry_shock", 15, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_SENTRY_SHOCK_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_trap", "bomb_trap", 100, ::killstreakbombcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", undefined, undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_reroll", "venom", 85, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", undefined, &"KILLSTREAKS_HINTS_VENOM_REROLL", "care_package_iw7_dummy" );
    addcratetype( "dronedrop_reroll", "uav", 85, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", undefined, &"KILLSTREAKS_HINTS_UAV_REROLL", "care_package_iw7_dummy" );
    addcratetype( "dronedrop_reroll", "counter_uav", 70, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", undefined, &"KILLSTREAKS_HINTS_COUNTER_UAV_REROLL", "care_package_iw7_dummy" );
    addcratetype( "dronedrop_reroll", "drone_hive", 70, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", undefined, &"KILLSTREAKS_HINTS_ORBITAL_DEPLOYMENT_REROLL", "care_package_iw7_dummy" );
    addcratetype( "dronedrop_reroll", "ball_drone_backup", 65, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", undefined, &"KILLSTREAKS_HINTS_BALL_DRONE_BACKUP_REROLL", "care_package_iw7_dummy" );
    addcratetype( "dronedrop_reroll", "bombardment", 65, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", undefined, &"KILLSTREAKS_HINTS_BOMBARDMENT_REROLL", "care_package_iw7_dummy" );
    addcratetype( "dronedrop_reroll", "precision_airstrike", 65, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", undefined, &"KILLSTREAKS_HINTS_PRECISION_AIRSTRIKE_REROLL", "care_package_iw7_dummy" );
    addcratetype( "dronedrop_reroll", "sentry_shock", 5, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", undefined, &"KILLSTREAKS_HINTS_SENTRY_SHOCK_REROLL", "care_package_iw7_dummy" );
    addcratetype( "dronedrop_reroll", "jackal", 5, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", undefined, &"KILLSTREAKS_HINTS_JACKAL_REROLL", "care_package_iw7_dummy" );
    addcratetype( "dronedrop_reroll", "thor", 5, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", undefined, &"KILLSTREAKS_HINTS_THOR_REROLL", "care_package_iw7_dummy" );
    addcratetype( "dronedrop_reroll", "directional_uav", 1, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", undefined, &"KILLSTREAKS_HINTS_DIRECTIONAL_UAV_REROLL", "care_package_iw7_dummy" );
    addcratetype( "dronedrop_reroll", "remote_c8", 1, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", undefined, &"KILLSTREAKS_HINTS_RC8_REROLL", "care_package_iw7_dummy" );
    addcratetype( "dronedrop_reroll", "minijackal", 1, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", undefined, &"KILLSTREAKS_HINTS_MINI_JACKAL_REROLL", "care_package_iw7_dummy" );
    addcratetype( "dronedrop_highroll", "sentry_shock", 15, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_SENTRY_SHOCK_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_highroll", "jackal", 15, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_JACKAL_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_highroll", "thor", 10, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_THOR_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_highroll", "directional_uav", 10, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_DIRECTIONAL_UAV_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_highroll", "remote_c8", 5, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_RC8_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_highroll", "minijackal", 5, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_MINI_JACKAL_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "jackaldrop", "venom", 85, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_VENOM_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "jackaldrop", "uav", 85, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_UAV_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "jackaldrop", "counter_uav", 70, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_COUNTER_UAV_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "jackaldrop", "drone_hive", 70, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_ORBITAL_DEPLOYMENT_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "jackaldrop", "ball_drone_backup", 65, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_BALL_DRONE_BACKUP_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "jackaldrop", "bombardment", 65, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_BOMBARDMENT_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "jackaldrop", "precision_airstrike", 65, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_PRECISION_AIRSTRIKE_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "jackaldrop", "sentry_shock", 5, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_SENTRY_SHOCK_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "jackaldrop", "jackal", 5, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_JACKAL_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "jackaldrop", "thor", 5, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_THOR_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "jackaldrop", "directional_uav", 1, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_DIRECTIONAL_UAV_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "jackaldrop", "remote_c8", 1, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_RC8_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "jackaldrop", "minijackal", 1, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_MINI_JACKAL_PICKUP", undefined, "care_package_iw7_dummy" );

    if ( isdefined( level._id_4C85 ) )
        [[ level._id_4C85 ]]( "care_package_iw7_un_wm", "care_package_iw7_ca_wm" );

    if ( isdefined( level._id_B330 ) )
        [[ level._id_B330 ]]();

    _id_7730();
    var_1 = spawnstruct();
    var_1._id_EC44 = "destroyed_airdrop";
    var_1._id_13523 = "dronedrop_destroyed";
    var_1._id_3774 = "callout_destroyed_airdrop";
    var_1._id_EB11 = 0.09;
    level._id_8DA6["airdrop"] = var_1;
    scripts\mp\rank::_id_DF0A( "little_bird", "value", 200 );
    level _id_FA9A();
    level._id_3A58 = getentarray( "carepackage_drop_area", "targetname" );
}

_id_7730()
{
    foreach ( var_6, var_1 in level._id_4860 )
    {
        level._id_4855[var_6] = 0;

        foreach ( var_3 in var_1 )
        {
            var_4 = var_3.type;

            if ( !level._id_4860[var_6][var_4]._id_DCEC )
            {
                level._id_4860[var_6][var_4]._id_13CE8 = level._id_4860[var_6][var_4]._id_DCEC;
                continue;
            }

            level._id_4855[var_6] += level._id_4860[var_6][var_4]._id_DCEC;
            level._id_4860[var_6][var_4]._id_13CE8 = level._id_4855[var_6];
        }
    }
}

_id_3C54( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_4860[var_0] ) || !isdefined( level._id_4860[var_0][var_1] ) )
        return;

    level._id_4860[var_0][var_1]._id_DCEC = var_2;
    _id_7730();
}

_id_F638( var_0 )
{
    var_1 = getentarray( var_0, "targetname" );

    if ( !isdefined( var_1 ) || var_1.size == 0 )
        return;

    level._id_1A9B = getent( var_1[0]._id_0334, "targetname" );

    foreach ( var_3 in var_1 )
        var_3 _id_51AA();
}

addcratetype( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !isdefined( var_4 ) )
        var_4 = "care_package_iw7_un_wm";

    if ( !isdefined( var_5 ) )
        var_5 = "care_package_iw7_ca_wm";

    if ( !isdefined( var_8 ) )
        var_8 = "care_package_iw7_dummy";

    level._id_4860[var_0][var_1] = spawnstruct();
    level._id_4860[var_0][var_1]._id_5EF1 = var_0;
    level._id_4860[var_0][var_1].type = var_1;
    level._id_4860[var_0][var_1]._id_DCEC = var_2;
    level._id_4860[var_0][var_1]._id_13CE8 = var_2;
    level._id_4860[var_0][var_1]._id_74C2 = var_3;
    level._id_4860[var_0][var_1]._id_B916 = var_4;
    level._id_4860[var_0][var_1]._id_B915 = var_5;
    level._id_4860[var_0][var_1]._id_B914 = var_8;

    if ( isdefined( var_6 ) )
        game["strings"][var_1 + "_hint"] = var_6;

    if ( isdefined( var_7 ) )
        game["strings"][var_1 + "_rerollHint"] = var_7;
}

_id_80B6( var_0 )
{
    var_1 = randomint( level._id_4855[var_0] );
    var_2 = undefined;

    foreach ( var_4 in level._id_4860[var_0] )
    {
        var_5 = var_4.type;

        if ( !level._id_4860[var_0][var_5]._id_13CE8 )
            continue;

        var_2 = var_5;

        if ( level._id_4860[var_0][var_5]._id_13CE8 > var_1 )
            break;
    }

    return var_2;
}

_id_7E43( var_0 )
{
    switch ( var_0 )
    {
        case "airdrop_sentry_minigun":
            return "sentry";
        case "airdrop_predator_missile":
            return "predator_missile";
        case "airdrop_juggernaut":
            return "airdrop_juggernaut";
        case "airdrop_juggernaut_def":
            return "airdrop_juggernaut_def";
        case "airdrop_juggernaut_gl":
            return "airdrop_juggernaut_gl";
        case "airdrop_juggernaut_recon":
            return "airdrop_juggernaut_recon";
        case "airdrop_juggernaut_maniac":
            return "airdrop_juggernaut_maniac";
        case "airdrop_remote_tank":
            return "remote_tank";
        case "airdrop_lase":
            return "lasedStrike";
        case "dronedrop_trap":
            return "bomb_trap";
        case "airdrop_sotf":
        case "airdrop_grnd_mega":
        case "airdrop_grnd":
        case "airdrop_mega":
        case "airdrop_escort":
        case "airdrop_support":
        case "dronedrop_highroll":
        case "jackaldrop":
        case "dronedrop_reroll":
        case "dronedrop_grnd":
        case "airdrop_assault":
        case "airdrop":
        case "dronedrop":
        default:
            if ( isdefined( level._id_80B7 ) )
                return [[ level._id_80B7 ]]( var_0 );

            return _id_80B6( var_0 );
    }
}

_id_1288F( var_0 )
{
    var_1 = var_0._id_110EA;
    var_2 = var_1;
    var_3 = undefined;

    if ( !isdefined( var_2 ) )
        var_2 = "airdrop";

    var_4 = 1;

    if ( ( level._id_AD8B.size >= 4 || level._id_6BAA >= 4 ) && var_2 != "airdrop_mega" && !issubstr( tolower( var_2 ), "juggernaut" ) )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }
    else if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + var_4 >= scripts\mp\utility\game::_id_B4D2() )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_TOO_MANY_VEHICLES" );
        return 0;
    }
    else if ( var_2 == "airdrop_lase" && isdefined( level._id_A85F ) && level._id_A85F )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }

    return 1;
}

_id_1AA2( var_0 )
{
    var_0._id_1AA0 = var_0._id_110EA;
    scripts\mp\utility\game::_id_93FA();
    var_1 = scripts\mp\killstreaks\target_marker::_id_819B( var_0 );

    if ( !isdefined( var_1._id_AEC4 ) )
    {
        scripts\mp\utility\game::_id_4FC1();
        return 0;
    }

    scripts\mp\matchdata::_id_AFC9( var_0._id_1AA0, self.origin );
    _id_1AA1( var_1, var_0._id_1AA0, var_0 );
    return 1;
}

_id_1AA1( var_0, var_1, var_2 )
{
    switch ( var_1 )
    {
        case "dronedrop":
            level _id_581F( self, var_0, randomfloat( 360 ), var_1, var_2 );
            break;
    }
}

_id_1A9E( var_0, var_1 )
{
    var_1 thread _id_1A9C();
    var_1.owner = self;
    var_0._id_1AA0 = var_0._id_110EA;
    scripts\mp\utility\game::_id_93FA();
    thread _id_4FC3();
    var_1 thread _id_1A9D( var_0._id_1AA0 );
    scripts\mp\matchdata::_id_AFC9( var_0._id_1AA0, self.origin );
    var_0._id_1A9E = 1;
    return 1;
}

_id_1A9D( var_0, var_1 )
{
    level endon( "game_ended" );
    self notify( "airDropMarkerActivate" );
    self endon( "airDropMarkerActivate" );
    self waittill( "explode", var_2 );
    var_3 = self.owner;

    if ( !isdefined( var_3 ) )
        return;

    if ( var_3 scripts\mp\utility\game::_id_9E68() )
        return;

    if ( issubstr( tolower( var_0 ), "escort_airdrop" ) && isdefined( level._id_3F14 ) )
        return;

    wait 0.05;

    if ( issubstr( tolower( var_0 ), "juggernaut" ) )
        level _id_57EF( var_3, var_2, randomfloat( 360 ), var_0 );
    else if ( issubstr( tolower( var_0 ), "escort_airdrop" ) )
        var_3 scripts\mp\killstreaks\escort_airdrop::_id_6CE4( var_1, var_2, randomfloat( 360 ), "escort_airdrop" );
    else if ( var_0 == "dronedrop" )
        level _id_581F( var_3, var_2, randomfloat( 360 ), var_0 );
    else
        level _id_5857( var_3, var_2, randomfloat( 360 ), var_0 );
}

_id_1A9F( var_0 )
{
    if ( isdefined( var_0._id_1AA0 ) && !issubstr( var_0._id_1AA0, "juggernaut" ) && !scripts\mp\utility\game::istrue( var_0._id_1A9E ) )
        scripts\mp\utility\game::_id_4FC1();
}

_id_4FC3()
{
    self endon( "airDropMarkerActivate" );
    self waittill( "death" );
    scripts\mp\utility\game::_id_4FC1();
}

_id_97C4()
{
    self._id_9B04 = 0;
    self hide();

    if ( isdefined( self._id_0334 ) )
    {
        self._id_4381 = getent( self._id_0334, "targetname" );
        self._id_4381 notsolid();
    }
    else
        self._id_4381 = undefined;
}

_id_51C5( var_0 )
{
    wait 0.25;
    self linkto( var_0, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0 waittill( "death" );
    self delete();
}

_id_485E()
{
    self endon( "death" );
    self hide();

    foreach ( var_1 in level.players )
    {
        if ( var_1.team != "spectator" )
            self _meth_8388( var_1 );
    }

    for (;;)
    {
        level waittill( "joined_team" );
        self hide();

        foreach ( var_1 in level.players )
        {
            if ( var_1.team != "spectator" )
                self _meth_8388( var_1 );
        }
    }
}

_id_4858( var_0 )
{
    self endon( "death" );
    self hide();

    foreach ( var_2 in level.players )
    {
        if ( var_2.team == "spectator" )
        {
            if ( var_0 == "allies" )
                self _meth_8388( var_2 );

            continue;
        }

        if ( var_2.team == var_0 )
            self _meth_8388( var_2 );
    }

    for (;;)
    {
        level waittill( "joined_team" );
        self hide();

        foreach ( var_2 in level.players )
        {
            if ( var_2.team == "spectator" )
            {
                if ( var_0 == "allies" )
                    self _meth_8388( var_2 );

                continue;
            }

            if ( var_2.team == var_0 )
                self _meth_8388( var_2 );
        }
    }
}

_id_4856( var_0 )
{
    self endon( "death" );
    self hide();

    foreach ( var_2 in level.players )
    {
        if ( var_2.team != var_0 )
            self _meth_8388( var_2 );
    }

    for (;;)
    {
        level waittill( "joined_team" );
        self hide();

        foreach ( var_2 in level.players )
        {
            if ( var_2.team != var_0 )
                self _meth_8388( var_2 );
        }
    }
}

_id_4857( var_0, var_1 )
{
    self endon( "death" );
    self hide();

    foreach ( var_3 in level.players )
    {
        if ( var_1 && isdefined( var_0 ) && var_3 != var_0 )
            continue;

        if ( !var_1 && isdefined( var_0 ) && var_3 == var_0 )
            continue;

        self _meth_8388( var_3 );
    }

    for (;;)
    {
        level waittill( "joined_team" );
        self hide();

        foreach ( var_3 in level.players )
        {
            if ( var_1 && isdefined( var_0 ) && var_3 != var_0 )
                continue;

            if ( !var_1 && isdefined( var_0 ) && var_3 == var_0 )
                continue;

            self _meth_8388( var_3 );
        }
    }
}

_id_4864( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        _id_FB03( var_0 );
        level waittill( "joined_team" );
    }
}

_id_4865( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        _id_FB02( var_0 );
        level waittill( "joined_team" );
    }
}

_id_4862()
{
    if ( !issubstr( self._id_485F, "juggernaut" ) )
        return;

    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "juggernaut_equipped", var_0 );
        self disableplayeruse( var_0 );
        thread _id_4863( var_0 );
    }
}

_id_4863( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 waittill( "death" );
    self enableplayeruse( var_0 );
}

_id_4982( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawn( "script_model", var_3 );
    var_6._id_4B30 = 0;
    var_6._id_130EE = 0;
    var_6._id_130C7 = 0;
    var_6.team = self.team;
    var_6._id_5293 = var_4;
    var_6._id_92B8 = "care_package";
    var_6 _meth_8317( 1 );

    if ( isdefined( var_0 ) )
    {
        var_6.owner = var_0;
        var_6 _meth_831F( var_0 );
    }
    else
        var_6.owner = undefined;

    var_6._id_485F = var_2;
    var_6._id_5EF1 = var_1;
    var_6._id_0336 = "care_package";
    var_6 _meth_85C8( 1 );
    var_7 = "care_package_iw7_dummy";

    if ( isdefined( level._id_4C4D ) )
        var_7 = level._id_4C4D;

    var_6 setmodel( var_7 );

    if ( var_2 == "airdrop_jackpot" )
    {
        var_6._id_741D = spawn( "script_model", var_3 );
        var_6._id_741D setmodel( level._id_4860[var_1][var_2]._id_B916 );
        var_6._id_741D thread _id_51C5( var_6 );
    }
    else
    {
        var_6._id_741D = spawn( "script_model", var_3 );
        var_6._id_741D setmodel( level._id_4860[var_1][var_2]._id_B916 );

        if ( isdefined( level._id_8EF3 ) && level._id_8EF3 )
        {
            if ( !isdefined( var_5 ) )
                var_5 = 2;

            var_6._id_741D _meth_818E( var_5, 0, 0 );
            var_6._id_C789 = var_5;
        }

        var_6._id_6564 = spawn( "script_model", var_3 );
        var_6._id_6564 setmodel( level._id_4860[var_1][var_2]._id_B915 );
        var_6._id_741D _meth_82DD( var_6 );
        var_6._id_6564 _meth_82DD( var_6 );
        var_6._id_741D thread _id_51C5( var_6 );

        if ( level.teambased )
            var_6._id_741D thread _id_4858( var_6.team );
        else
            var_6._id_741D thread _id_4857( var_0, 1 );

        var_6._id_6564 thread _id_51C5( var_6 );

        if ( level._id_BDCC )
            var_6._id_6564 thread _id_4856( var_6.team );
        else if ( level.teambased )
            var_6._id_6564 thread _id_4858( level._id_C74B[var_6.team] );
        else
            var_6._id_6564 thread _id_4857( var_0, 0 );
    }

    var_6._id_9B04 = 0;
    var_6._id_A63A = spawn( "script_model", var_6.origin + ( 0, 0, 300 ), 0, 1 );
    var_6._id_A63A setscriptmoverkillcam( "explosive" );
    var_6._id_A63A linkto( var_6 );
    level._id_C223++;
    var_6 thread _id_5D27( var_4 );
    level notify( "createAirDropCrate", var_6 );
    return var_6;
}

_id_5D27( var_0 )
{
    level endon( "game_ended" );
    self waittill( "death" );

    if ( isdefined( level._id_4854 ) )
        [[ level._id_4854 ]]( var_0 );

    level._id_C223--;
}

_id_485D( var_0, var_1, var_2, var_3 )
{
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( var_0 );
    self _meth_84A7( "none" );
    self makeusable();

    if ( isdefined( var_3 ) )
        self _meth_835F( var_3 );

    if ( scripts\mp\utility\game::istrue( var_2 ) )
    {
        thread watchcratereroll( self.owner );
        thread watchcratererollcommand( self.owner );
        thread fakererollcratesetupforuse( self.owner, var_3 );
    }

    var_4 = "icon_minimap_drone_package_friendly";

    if ( isdefined( level._id_C2C6 ) )
        var_5 = "icon_minimap_drone_package_friendly";

    if ( !isdefined( self.minimapid ) )
        self.minimapid = _id_49F7( var_4, undefined, 1, 1, 0 );

    thread _id_4864();
    thread _id_4862();

    if ( issubstr( self._id_485F, "juggernaut" ) )
    {
        foreach ( var_7 in level.players )
        {
            if ( var_7 scripts\mp\utility\game::isjuggernaut() )
                thread _id_4863( var_7 );
        }
    }

    var_9 = undefined;

    if ( level.teambased )
        var_9 = scripts\mp\entityheadicons::_id_F73D( self.team, var_1, ( 0, 0, 24 ), 14, 14, 0, undefined, undefined, undefined, undefined, 0 );
    else if ( isdefined( self.owner ) )
        var_9 = scripts\mp\entityheadicons::_id_F73D( self.owner, var_1, ( 0, 0, 24 ), 14, 14, 0, undefined, undefined, undefined, undefined, 0 );

    if ( isdefined( var_9 ) )
        var_9._id_0295 = 0;

    if ( isdefined( level._id_92B5 ) )
        [[ level._id_92B5 ]]( self, var_1 );
    else
    {
        foreach ( var_7 in level.players )
        {
            if ( var_7.team == "spectator" )
                var_9 = scripts\mp\entityheadicons::_id_F73D( var_7, var_1, ( 0, 0, 24 ), 14, 14, 0, undefined, undefined, undefined, undefined, 0 );
        }
    }
}

fakererollcratesetupforuse( var_0, var_1 )
{
    var_2 = &"PLATFORM_GET_KILLSTREAK";

    if ( isdefined( game["strings"][self._id_485F + "_hint"] ) )
        var_2 = game["strings"][self._id_485F + "_hint"];

    var_3 = 128;
    var_4 = 360;
    var_5 = 128;
    var_6 = 360;
    var_7 = -10000;

    if ( isdefined( var_1 ) )
        var_7 = var_1;

    var_8 = spawn( "script_model", self.origin );
    var_8._id_4B30 = 0;
    var_8._id_130EE = 0;
    var_8._id_130C7 = 3000;
    var_8._id_9B04 = 0;
    var_8._id_92B8 = self._id_92B8;
    var_8 linkto( self );
    var_8 makeusable();
    var_8 disableplayeruse( var_0 );
    var_8 setcursorhint( "HINT_NOICON" );
    var_8 _meth_84A9( "show" );
    var_8 sethintstring( var_2 );
    var_8 _meth_84A6( var_4 );
    var_8 _meth_84A5( var_6 );
    var_8 _meth_84A4( var_3 );
    var_8 _meth_84A2( var_5 );
    var_8 _meth_835F( var_7 );
    var_8 thread _id_51D9( self );
    self.fakeuseobj = var_8;
}

watchcratereroll( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );
    self waittill( "crate_reroll" );
    var_0 playlocalsound( "mp_killconfirm_tags_drop" );
    var_1 = level._id_4860[self._id_5EF1][self._id_485F]._id_DCEC;
    _id_3C54( self._id_5EF1, self._id_485F, 0 );
    var_2 = _id_7E43( self._id_5EF1 );
    _id_3C54( self._id_5EF1, self._id_485F, var_1 );
    self._id_485F = var_2;
    var_3 = &"PLATFORM_GET_KILLSTREAK";

    if ( isdefined( game["strings"][self._id_485F + "_hint"] ) )
        var_3 = game["strings"][self._id_485F + "_hint"];

    self sethintstring( var_3 );

    if ( isdefined( self.fakeuseobj ) )
        self.fakeuseobj sethintstring( var_3 );

    var_4 = scripts\mp\utility\game::_id_7F49( self._id_485F );
    var_5 = undefined;

    if ( level.teambased )
        var_5 = scripts\mp\entityheadicons::_id_F73D( self.team, var_4, ( 0, 0, 24 ), 14, 14, 0, undefined, undefined, undefined, undefined, 0 );
    else if ( isdefined( self.owner ) )
        var_5 = scripts\mp\entityheadicons::_id_F73D( self.owner, var_4, ( 0, 0, 24 ), 14, 14, 0, undefined, undefined, undefined, undefined, 0 );

    if ( isdefined( var_5 ) )
        var_5._id_0295 = 0;

    if ( isdefined( level._id_92B5 ) )
        [[ level._id_92B5 ]]( self, var_4 );
    else
    {
        foreach ( var_7 in level.players )
        {
            if ( var_7.team == "spectator" )
                var_5 = scripts\mp\entityheadicons::_id_F73D( var_7, var_4, ( 0, 0, 24 ), 14, 14, 0, undefined, undefined, undefined, undefined, 0 );
        }
    }
}

watchcratererollcommand( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_1 = 0;
    var_2 = 16384;

    for (;;)
    {
        if ( var_0 usebuttonpressed() )
        {
            var_1 = 0;

            while ( var_0 usebuttonpressed() )
            {
                var_1 += 0.05;
                wait 0.05;
            }

            if ( var_1 >= 0.5 )
                continue;

            var_1 = 0;

            while ( !var_0 usebuttonpressed() && var_1 < 0.5 )
            {
                var_1 += 0.05;
                wait 0.05;
            }

            if ( var_1 >= 0.5 )
                continue;

            if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
                continue;

            if ( distance2dsquared( var_0.origin, self.origin ) > var_2 )
                continue;

            self notify( "crate_reroll" );
        }

        wait 0.05;
    }
}

_id_49F7( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = scripts\mp\objidpoolmanager::requestminimapid( 10 );

    if ( var_5 == -1 )
        return -1;

    scripts\mp\objidpoolmanager::minimap_objective_add( var_5, "invisible", ( 0, 0, 0 ) );

    if ( !isdefined( self _meth_8138() ) && !scripts\mp\utility\game::istrue( var_3 ) )
        scripts\mp\objidpoolmanager::minimap_objective_position( var_5, self.origin );
    else if ( scripts\mp\utility\game::istrue( var_3 ) && scripts\mp\utility\game::istrue( var_4 ) )
        scripts\mp\objidpoolmanager::minimap_objective_onentitywithrotation( var_5, self );
    else
        scripts\mp\objidpoolmanager::minimap_objective_onentity( var_5, self );

    scripts\mp\objidpoolmanager::minimap_objective_state( var_5, "active" );
    scripts\mp\objidpoolmanager::minimap_objective_icon( var_5, var_0 );

    if ( isdefined( var_1 ) )
    {
        if ( !level.teambased && isdefined( self.owner ) )
        {
            if ( scripts\mp\utility\game::istrue( var_2 ) )
                scripts\mp\objidpoolmanager::minimap_objective_playerteam( var_5, self.owner getentitynumber() );
            else
                scripts\mp\objidpoolmanager::minimap_objective_playerenemyteam( var_5, self.owner getentitynumber() );
        }
        else
            scripts\mp\objidpoolmanager::minimap_objective_team( var_5, var_1 );
    }
    else
        scripts\mp\objidpoolmanager::minimap_objective_playermask_showtoall( var_5 );

    if ( isdefined( level._id_C2C6 ) )
        [[ level._id_C2C6 ]]( var_5 );

    return var_5;
}

_id_49F8( var_0, var_1, var_2 )
{
    var_3 = scripts\mp\objidpoolmanager::requestminimapid( 10 );

    if ( var_3 == -1 )
        return -1;

    scripts\mp\objidpoolmanager::minimap_objective_add( var_3, "invisible", ( 0, 0, 0 ) );

    if ( !isdefined( self _meth_8138() ) && !scripts\mp\utility\game::istrue( var_1 ) )
        scripts\mp\objidpoolmanager::minimap_objective_position( var_3, self.origin );
    else if ( scripts\mp\utility\game::istrue( var_1 ) && scripts\mp\utility\game::istrue( var_2 ) )
        scripts\mp\objidpoolmanager::minimap_objective_onentitywithrotation( var_3, self );
    else
        scripts\mp\objidpoolmanager::minimap_objective_onentity( var_3, self );

    scripts\mp\objidpoolmanager::minimap_objective_state( var_3, "active" );
    scripts\mp\objidpoolmanager::minimap_objective_icon( var_3, var_0 );
    scripts\mp\objidpoolmanager::minimap_objective_playermask_hidefromall( var_3 );
    return var_3;
}

_id_FB03( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( issubstr( self._id_485F, "juggernaut" ) && var_2 scripts\mp\utility\game::isjuggernaut() )
        {
            self disableplayeruse( var_2 );
            continue;
        }

        if ( issubstr( self._id_485F, "lased" ) && isdefined( var_2._id_8C29 ) && var_2._id_8C29 )
        {
            self disableplayeruse( var_2 );
            continue;
        }

        if ( issubstr( self._id_485F, "trap" ) && scripts\mp\utility\game::istrue( level.teambased ) && var_2.team == self.owner.team )
        {
            self disableplayeruse( var_2 );
            continue;
        }

        if ( issubstr( self._id_485F, "trap" ) && !scripts\mp\utility\game::istrue( level.teambased ) && var_2 == self.owner )
        {
            self disableplayeruse( var_2 );
            continue;
        }

        if ( issubstr( self._id_5EF1, "reroll" ) && var_2 != self.owner )
        {
            self disableplayeruse( var_2 );
            continue;
        }

        if ( !isdefined( var_0 ) || var_0 == var_2.team )
        {
            self enableplayeruse( var_2 );
            continue;
        }

        self disableplayeruse( var_2 );
    }
}

_id_FB02( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( issubstr( self._id_485F, "juggernaut" ) && var_2 scripts\mp\utility\game::isjuggernaut() )
        {
            self disableplayeruse( var_2 );
            continue;
        }

        if ( !isdefined( var_0 ) || var_0 != var_2.team )
        {
            self enableplayeruse( var_2 );
            continue;
        }

        self disableplayeruse( var_2 );
    }
}

_id_5EEC( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = [];
    self.owner endon( "disconnect" );

    if ( !isdefined( var_4 ) )
    {
        if ( isdefined( var_7 ) )
        {
            var_10 = undefined;
            var_11 = undefined;

            for ( var_12 = 0; var_12 < 100; var_12++ )
            {
                var_11 = _id_7E43( var_1 );
                var_10 = 0;

                for ( var_13 = 0; var_13 < var_7.size; var_13++ )
                {
                    if ( var_11 == var_7[var_13] )
                    {
                        var_10 = 1;
                        break;
                    }
                }

                if ( var_10 == 0 )
                    break;
            }

            if ( var_10 == 1 )
                var_11 = _id_7E43( var_1 );
        }
        else
            var_11 = _id_7E43( var_1 );
    }
    else
        var_11 = var_4;

    var_6 = ( 0, 0, 0 );

    if ( !isdefined( var_6 ) )
        var_6 = ( randomint( 5 ), randomint( 5 ), randomint( 5 ) );

    var_9 = _id_4982( self.owner, var_1, var_11, var_5, var_0 );

    switch ( var_1 )
    {
        case "nuke_drop":
        case "airdrop_mega":
        case "airdrop_juggernaut_maniac":
        case "airdrop_juggernaut_recon":
        case "airdrop_juggernaut":
            var_9 linkto( self, "tag_ground", ( 64, 32, -128 ), ( 0, 0, 0 ) );
            break;
        case "airdrop_osprey_gunner":
        case "airdrop_escort":
            var_9 linkto( self, var_8, ( 0, 0, 0 ), ( 0, 0, 0 ) );
            break;
        default:
            var_9 linkto( self, "tag_ground", ( 32, 0, 5 ), ( 0, 0, 0 ) );
            break;
    }

    var_9.angles = ( 0, 0, 0 );
    var_9 show();
    var_14 = self._id_037A;

    if ( issubstr( var_11, "juggernaut" ) )
        var_6 = ( 0, 0, 0 );

    thread _id_136BB( var_9, var_6, var_1, var_11 );
    var_9._id_5D44 = 1;
    return var_11;
}

_id_A66D( var_0 )
{
    if ( !scripts\mp\utility\game::istrue( level._id_C020 ) )
        var_0 _meth_80B0( 1000, var_0.origin, self, self, "MOD_CRUSH" );

    self endon( "death" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );

    if ( scripts\mp\utility\game::isreallyalive( var_0 ) )
        childthread scripts\mp\movers::_id_12BEA( var_0, undefined, self );
}

_id_A66E()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "player_pushed", var_0, var_1 );

        if ( isplayer( var_0 ) || isagent( var_0 ) )
        {
            if ( var_1[2] < -20 )
                _id_A66D( var_0 );
        }

        wait 0.05;
    }
}

_id_1A98( var_0 )
{
    if ( isdefined( var_0._id_AA33._id_52CB ) && var_0._id_AA33._id_52CB )
    {
        playfx( scripts\engine\utility::_id_7ECB( "airdrop_crate_destroy" ), self.origin );
        _id_51AA();
    }
}

_id_4066()
{
    var_0 = self _meth_8137( 1 );

    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_2 in var_0 )
    {
        if ( !isplayer( var_2 ) )
            continue;

        if ( isdefined( var_2._id_9D7F ) && var_2._id_9D7F )
        {
            var_3 = var_2 _meth_8138();

            if ( isdefined( var_3 ) )
            {
                var_2 scripts\mp\gameobjects::_id_12F53( var_3, 0 );
                var_2 unlink();
            }

            if ( isalive( var_2 ) )
                var_2 scripts\engine\utility::_id_1C71( 1 );

            var_2._id_9D7F = 0;
        }
    }
}

_id_1A99( var_0 )
{
    wait 0.05;
    self notify( "restarting_physics" );
    _id_4066();
    self physicslaunchserver( ( 0, 0, 0 ), var_0._id_5D2A, var_0._id_1A97 );
    thread _id_CB14( var_0._id_5EF1, var_0._id_485F, var_0._id_5D2A, var_0._id_1A97 );
}

_id_136BB( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_0 endon( "death" );

    if ( !isdefined( var_5 ) || !var_5 )
        self waittill( "drop_crate" );

    var_6 = 1200;

    if ( isdefined( var_4 ) )
        var_6 = var_4;

    var_0 unlink();
    var_0 physicslaunchserver( ( 0, 0, 0 ), var_1, var_6 );
    var_0 thread _id_CB14( var_2, var_3, var_1, var_6 );
    var_0 thread _id_A66E();
    var_0._id_12BE7 = ::_id_A66D;

    if ( isdefined( var_0._id_A63A ) )
    {
        if ( isdefined( var_0._id_3A5A ) )
            var_7 = -2100;
        else
            var_7 = 0;

        var_0._id_A63A unlink();
        var_8 = bullettrace( var_0.origin, var_0.origin + ( 0, 0, -10000 ), 0, var_0 );
        var_9 = distance( var_0.origin, var_8["position"] );
        var_10 = var_9 / 800;
        var_0._id_A63A moveto( var_8["position"] + ( 0, 0, 300 ) + ( var_7, 0, 0 ), var_10 );
    }
}

_id_13698()
{
    self endon( "death" );
    wait 0.035;
    playfx( level._effect["airdrop_dust_kickup"], self.origin + ( 0, 0, 5 ), ( 0, 0, 1 ) );
    self._id_741D scriptmodelplayanim( "juggernaut_carepackage" );
    self._id_6564 scriptmodelplayanim( "juggernaut_carepackage" );
}

_id_CB14( var_0, var_1, var_2, var_3, var_4 )
{
    if ( scripts\mp\utility\game::istrue( var_4 ) )
        self endon( "death" );

    self endon( "restarting_physics" );
    _id_136A7();
    self._id_5D44 = 0;
    self thread [[ level._id_4860[var_0][var_1]._id_74C2 ]]( var_0 );
    level thread _id_5EEE( self, self.owner, var_1 );
    var_5 = spawnstruct();
    var_5._id_6371 = "restarting_physics";
    var_5._id_4E53 = ::_id_1A98;
    var_5._id_9B11 = ::_id_1A99;
    var_5._id_5EF1 = var_0;
    var_5._id_485F = var_1;
    var_5._id_5D2A = var_2;
    var_5._id_1A97 = var_3;
    thread scripts\mp\movers::_id_892F( var_5 );

    if ( self._id_741D scripts\mp\utility\game::_id_11A42() )
    {
        _id_51AA();
        return;
    }

    if ( isdefined( self.owner ) && abs( self.origin[2] - self.owner.origin[2] ) > 3000 )
        _id_51AA();
}

_id_136A7()
{
    wait 0.5;

    for (;;)
    {
        var_0 = self physics_getbodyid( 0 );
        var_1 = physics_getbodylinvel( var_0 );

        if ( lengthsquared( var_1 ) > 0.5 )
        {
            wait 0.1;
            continue;
        }

        break;
    }
}

_id_5EEE( var_0, var_1, var_2 )
{
    if ( isdefined( level._id_C028 ) && level._id_C028 )
        return;

    level endon( "game_ended" );
    var_0 endon( "death" );

    if ( var_0._id_5EF1 == "nuke_drop" )
        return;

    var_3 = 90.0;

    if ( var_2 == "supply" )
        var_3 = 20.0;
    else if ( var_2 == "bomb_trap" )
        var_3 = 60.0;

    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_3 );

    while ( var_0._id_4B30 != 0 )
        wait 1;

    var_0 _id_51AA();
}

_id_8054( var_0, var_1 )
{
    var_2 = 100;
    var_3 = 15000;
    var_4 = ( 0, var_1, 0 );
    var_5 = var_0 + anglestoforward( var_4 ) * ( -1 * var_3 );
    var_5 += ( ( randomfloat( 2 ) - 1 ) * var_2, ( randomfloat( 2 ) - 1 ) * var_2, 0 );
    return var_5;
}

_id_8051( var_0, var_1 )
{
    var_2 = 150;
    var_3 = 15000;
    var_4 = ( 0, var_1, 0 );
    var_5 = var_0 + anglestoforward( var_4 + ( 0, 90, 0 ) ) * var_3;
    var_5 += ( ( randomfloat( 2 ) - 1 ) * var_2, ( randomfloat( 2 ) - 1 ) * var_2, 0 );
    return var_5;
}

_id_7EC0( var_0 )
{
    var_1 = 850;
    var_2 = getent( "airstrikeheight", "targetname" );

    if ( !isdefined( var_2 ) )
    {
        if ( isdefined( level._id_1AF8 ) )
        {
            if ( level._id_1AF8 > 2 )
            {
                var_1 = 1500;
                return var_1 * level._id_1AF8;
            }

            return var_1 * level._id_1AF8 + 256 + var_0[2];
        }
        else
            return var_1 + var_0[2];
    }
    else
        return var_2.origin[2];
}

_id_581F( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() )
        return;

    if ( var_3 == "dronedrop_grnd" )
        var_5 = var_1.droporigin;
    else
        var_5 = var_1._id_AEC4;

    var_6 = _id_7EC0( var_5 );
    var_7 = var_5 * ( 1, 1, 0 ) + ( 0, 0, var_6 );
    var_8 = _id_8054( var_7, var_2 );
    var_9 = _id_8051( var_7, var_2 );
    var_7 += anglestoforward( ( 0, var_2, 0 ) ) * -50;
    var_10 = _id_5CC7( var_0, var_8, var_7, var_3, var_1, var_4 );
    var_11 = undefined;
    var_12 = 999999;
    var_13 = scripts\engine\trace::_id_DCED( var_5, var_5 + ( 0, 0, 10000 ), level._id_3CB5, scripts\engine\trace::_id_48BC( 0, 1, 0, 1, 0, 1, 0 ) );
    var_14 = undefined;
    var_15 = 0;

    if ( var_13["hittype"] == "hittype_none" )
    {
        var_14 = var_5 * ( 1, 1, 0 ) + ( 0, 0, var_6 );
        var_15 = 1;
    }
    else
    {
        if ( isdefined( level._id_3A58 ) && level._id_3A58.size > 0 )
        {
            foreach ( var_17 in level._id_3A58 )
            {
                var_18 = distance( var_17.origin, var_5 );

                if ( var_18 < var_12 )
                {
                    var_11 = var_17;
                    var_12 = var_18;
                }
            }
        }
        else
        {

        }

        var_14 = var_11.origin * ( 1, 1, 0 ) + ( 0, 0, var_6 );
    }

    var_20 = "";
    var_21 = "used_dronedrop";

    if ( isdefined( var_4 ) )
    {
        var_20 = _id_0AC7::getrarityforlootitem( var_4._id_1318B );
        var_21 = "used_" + var_4._id_110EA;
    }

    if ( var_20 != "" && var_20 != "rare" )
        var_21 = var_21 + "_" + var_20;

    if ( level.gametype != "grnd" )
        level thread scripts\mp\utility\game::_id_115DE( var_21, var_0 );

    var_10 setvehgoalpos( var_14, 1 );
    var_10 setscriptablepartstate( "lights", "idle" );
    var_10 setscriptablepartstate( "thrusters", "fly", 0 );
    var_10 thread _id_13A04( var_14, var_5, var_15 );
}

_id_5CC7( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = vectortoangles( var_2 - var_1 );
    var_7 = "veh_mil_air_un_delivery_drone";
    var_8 = "";

    if ( isdefined( var_5 ) )
        var_8 = _id_0AC7::getrarityforlootitem( var_5._id_1318B );

    if ( var_8 != "" )
        var_7 = var_7 + "_" + var_8;

    if ( isdefined( var_5 ) )
    {
        if ( _id_0DC9::_id_A69F( var_5, "passive_bomb_trap" ) )
            var_3 = "dronedrop_trap";

        if ( _id_0DC9::_id_A69F( var_5, "passive_reroll" ) )
            var_3 = "dronedrop_reroll";

        if ( _id_0DC9::_id_A69F( var_5, "passive_high_roller" ) )
            var_3 = "dronedrop_highroll";
    }

    var_9 = spawnhelicopter( var_0, var_1, var_6, "delivery_drone_mp", var_7 );

    if ( !isdefined( var_9 ) )
        return;

    var_9.maxhealth = 100;
    var_9.owner = var_0;
    var_9.team = var_0.team;
    var_9._id_9D32 = 1;
    var_9 setmaxpitchroll( 35, 35 );
    var_9 vehicle_setspeed( 1600, 200, 200 );
    var_9 setyawspeed( 250, 100 );
    var_9 setneargoalnotifydist( 1000 );
    var_9 sethoverparams( 5, 5, 2 );
    var_9 setcandamage( 1 );
    var_9 _meth_8354( 1.0 );
    var_9 _meth_84E1( 1 );
    var_9 _meth_84E0( 1 );
    var_9._id_110E8 = var_5;
    var_9.helitype = "dronedrop";
    var_9 _id_0DC9::_id_1843( var_9.helitype, "Killstreak_Air", var_0, 1 );
    var_10 = _id_7E43( var_3 );
    var_11 = var_9 _id_4982( var_0, var_3, var_10, var_9.origin );
    var_11 linkto( var_9, "tag_origin", ( 0, 0, 5 ), ( 0, 0, 0 ) );
    var_11._id_110E8 = var_5;
    var_9._id_5D26 = var_11;
    var_9 thread _id_13B7E( 60 );
    var_9 thread _id_13A01( var_11, var_3, var_10, var_4 );
    var_9 thread scripts\mp\killstreaks\helicopter::_id_8D40( "dronedrop", undefined, 1 );
    var_9 thread _id_13A10();

    if ( var_3 == "dronedrop_trap" )
        var_9 thread watchownerdisconnect( var_11, var_4 );

    var_9 setscriptablepartstate( "dust", "active", 0 );
    var_9 thread dronewatchgameover();
    return var_9;
}

_id_13A01( var_0, var_1, var_2, var_3 )
{
    self waittill( "death" );

    if ( !isdefined( var_0 ) )
        return;

    var_4 = ( 0, 0, 0 );
    var_5 = 1200;
    var_6 = undefined;

    if ( var_1 == "dronedrop_trap" )
        var_6 = 1;

    var_0 unlink();
    var_0 physicslaunchserver( ( 0, 0, 0 ), var_4, var_5 );
    var_0 thread _id_CB14( var_1, var_2, var_4, var_5, var_6 );
    var_0 thread _id_A66E();
    var_0._id_12BE7 = ::_id_A66D;

    if ( isdefined( var_0._id_A63A ) )
        var_0._id_A63A unlink();

    if ( isdefined( var_3._id_1349C ) )
        var_3._id_1349C delete();

    var_0 thread handlenavobstacle();
    _id_5CAC();
    scripts\mp\utility\game::_id_D915( "killstreak ended - dronedrop", self.owner );
}

handlenavobstacle()
{
    self endon( "death" );
    self endon( "nav_obstacle_destroyed" );
    wait 1;
    self._id_BE6F = _func_27A( self.origin, ( 30, 10, 64 ), self.angles );
    var_0 = self.origin;

    while ( isdefined( self ) && isdefined( self._id_BE6F ) )
    {
        if ( distance2dsquared( var_0, self.origin ) > 64 )
        {
            _func_27C( self._id_BE6F );
            self._id_BE6F = _func_27A( self.origin, ( 30, 10, 64 ), self.angles );
            var_0 = self.origin;
        }

        wait 1;
    }
}

_id_13A10()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1, var_2, var_3, var_4 );

        if ( isdefined( var_3 ) && var_3 == "concussion_grenade_mp" )
        {
            if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0 ) ) )
                var_0 scripts\mp\missions::_id_D991( "ch_tactical_emp_eqp" );
        }

        _id_0DC9::dodamagetokillstreak( 100, var_0, var_0, self.team, var_2, var_4, var_3 );
    }
}

watchownerdisconnect( var_0, var_1 )
{
    self endon( "death" );
    self.owner waittill( "disconnect" );

    if ( isdefined( var_1._id_1349C ) )
        var_1._id_1349C delete();

    var_0 _id_51AA();
    _id_5CAC();
}

_id_5CAC()
{
    playfx( scripts\engine\utility::_id_7ECB( "drone_explode" ), self.origin );
    self playsound( "sentry_explode" );
    scripts\mp\utility\game::_id_4FC1();
    self delete();
}

_id_13A04( var_0, var_1, var_2 )
{
    self endon( "death" );
    self waittill( "goal" );
    thread watchmantledisable();
    var_3 = ( 0, 0, -30 );
    var_4 = ( 0, 0, 12 );
    self setscriptablepartstate( "thrusters", "descend", 0 );
    thread watchfailsafe( var_0 );
    var_5 = undefined;

    if ( !scripts\mp\utility\game::istrue( var_2 ) )
    {
        if ( _func_2C5() )
        {
            var_6 = var_1 + ( 0, 0, 12 );
            var_5 = _func_271( self.origin, var_6 );
        }
        else
        {
            var_7 = scripts\engine\trace::_id_4956();
            var_8 = scripts\engine\trace::_id_DCED( self.origin, self.origin - ( 0, 0, 500 ), self, var_7 );
            var_9 = getclosestpointonnavmesh( var_8["position"], self );
            var_5 = self.owner _meth_8428( var_9, var_1 );
            self.owner iprintlnbold( "3D Nav Volume is not present, using 2D path instead" );
        }
    }
    else
        var_5 = [ var_1 + ( 0, 0, 12 ) ];

    var_10 = 0;
    var_11 = self.origin;

    foreach ( var_16, var_13 in var_5 )
    {
        if ( var_16 == var_5.size - 1 )
            var_10 = 1;

        if ( var_10 )
            var_14 = var_4;
        else
            var_14 = var_3;

        var_15 = 50;
        self setneargoalnotifydist( var_15 );
        var_11 = var_13;

        if ( !var_10 )
            thread _id_BA1C( var_13 + var_14, var_5[var_16 + 1] + var_14 );
        else
            thread _id_BA1D( var_13 + var_14 );

        self setscriptablepartstate( "thrusters", "navigate", 0 );
        self setvehgoalpos( var_13 + var_14, var_10 );

        if ( !var_10 || scripts\mp\utility\game::istrue( var_2 ) )
        {
            self waittill( "near_goal" );
            continue;
        }

        self waittill( "goal" );
    }

    self notify( "death" );
}

watchmantledisable()
{
    self endon( "death" );

    for (;;)
    {
        foreach ( var_1 in level.players )
        {
            if ( !scripts\mp\utility\game::isreallyalive( var_1 ) )
                continue;

            if ( distancesquared( self.origin, var_1.origin ) <= 10000 && !isdefined( var_1.cratemantle ) )
            {
                var_1.cratemantle = 0;
                var_1 scripts\engine\utility::_id_1C52( 0 );
                var_1 thread watchdistancefromcrate( self );
            }
        }

        scripts\engine\utility::waitframe();
    }
}

watchdistancefromcrate( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    while ( isdefined( var_0 ) )
    {
        if ( distancesquared( var_0.origin, self.origin ) > 10000 )
            break;

        scripts\engine\utility::waitframe();
    }

    self.cratemantle = undefined;
    scripts\engine\utility::_id_1C52( 1 );
}

watchfailsafe( var_0 )
{
    self endon( "death" );
    self endon( "near_goal" );
    var_1 = 3;
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_1 );

    if ( distancesquared( self.origin, var_0 ) < 2500 )
        self notify( "death" );
}

_id_7E84( var_0 )
{
    var_1 = abs( var_0[0] );
    var_2 = abs( var_0[1] );
    var_3 = abs( var_0[2] );
    return int( max( var_3, max( var_1, var_2 ) ) );
}

_id_BA00( var_0, var_1 )
{
    self notify( "stop_MonitorPath" );
    self endon( "death" );
    self endon( "stop_MonitorPath" );
    self endon( "goal" );
    self endon( "near_goal" );
    var_2[0] = self;
    var_2[1] = self._id_5D26;

    for (;;)
    {
        var_3 = scripts\engine\trace::sphere_trace( self.origin, var_1, 16, var_2 );

        if ( var_3["fraction"] == 1.0 )
            self notify( "near_goal" );

        wait 0.25;
    }
}

_id_FA9B( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();
    var_6._id_B75B = var_1;
    var_6._id_B491 = var_2;
    var_6._id_B7CB = var_3;
    var_6._id_B4C9 = var_4;
    var_6._id_1545 = var_5;
    level._id_109C4[var_0] = var_6;
}

_id_FA9A()
{
    _id_FA9B( "far", 500, 750, 45, 70, 100 );
    _id_FA9B( "medium", 250, 500, 35, 45, 100 );
    _id_FA9B( "near", 50, 250, 15, 30, 100 );
    _id_FA9B( "medium_sharpturn", 250, 500, 10, 30, 100 );
    _id_FA9B( "near_sharpturn", 50, 250, 10, 20, 100 );
    _id_FA9B( "final", 50, 1000, 10, 45, 100 );
}

_id_12F22( var_0, var_1 )
{
    var_2 = 9999;
    var_3 = level._id_109C4[var_0];

    if ( var_1 < var_3._id_B75B )
        var_1 = var_3._id_B75B;

    if ( var_1 > var_3._id_B491 )
        var_1 = var_3._id_B491;

    var_4 = ( var_1 - var_3._id_B75B ) / ( var_3._id_B491 - var_3._id_B75B );
    var_5 = var_3._id_B7CB + var_4 * ( var_3._id_B4C9 - var_3._id_B7CB );
    var_6 = var_3._id_1545;

    if ( var_6 > var_5 )
        var_6 = var_5;

    self vehicle_setspeed( var_5, var_6, var_2 );
}

_id_BA1D( var_0 )
{
    self notify( "stop_MonitorSpeed" );
    self endon( "death" );
    self endon( "stop_MonitorSpeed" );
    self endon( "goal" );
    var_1 = "none";

    for (;;)
    {
        var_2 = distance( self.origin, var_0 );
        _id_12F22( "final", var_2 );
        scripts\engine\utility::waitframe();
    }
}

_id_BA1C( var_0, var_1 )
{
    self notify( "stop_MonitorSpeed" );
    self endon( "death" );
    self endon( "stop_MonitorSpeed" );
    var_2 = "none";
    var_3 = vectornormalize( var_1 - var_0 );
    var_4 = distance( var_0, var_1 );

    for (;;)
    {
        var_5 = distance( self.origin, var_0 );
        var_6 = vectornormalize( var_0 - self.origin );
        var_7 = vectordot( var_3, var_6 );
        var_8 = 0;

        if ( var_7 < 0.707 || var_4 < 300 )
            var_8 = 1;

        if ( var_8 )
        {
            if ( var_5 < level._id_109C4["medium_sharpturn"]._id_B75B )
                _id_12F22( "near_sharpturn", var_5 );
            else
                _id_12F22( "medium_sharpturn", var_5 );
        }
        else if ( var_5 < level._id_109C4["near"]._id_B491 )
            _id_12F22( "near", var_5 );
        else if ( var_5 < level._id_109C4["medium"]._id_B491 )
            _id_12F22( "medium", var_5 );
        else
            _id_12F22( "far", var_5 );

        scripts\engine\utility::waitframe();
    }
}

_id_5857( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() )
        return;

    var_6 = _id_7EC0( var_1 );

    if ( isdefined( var_4 ) )
        var_6 += var_4;

    foreach ( var_8 in level._id_AD8B )
    {
        if ( isdefined( var_8._id_5EF1 ) )
            var_6 += 128;
    }

    var_10 = var_1 * ( 1, 1, 0 ) + ( 0, 0, var_6 );
    var_11 = _id_8054( var_10, var_2 );
    var_12 = _id_8051( var_10, var_2 );
    var_10 += anglestoforward( ( 0, var_2, 0 ) ) * -50;
    var_13 = _id_8DD4( var_0, var_11, var_10 );

    if ( isdefined( level._id_8EF3 ) && level._id_8EF3 )
        var_13 _meth_818E( 3, 0, 0 );

    var_13 endon( "death" );
    var_13 thread _id_4FC2();
    var_13._id_5EF1 = var_3;
    var_13 setvehgoalpos( var_10, 1 );
    var_13 thread _id_5EEC( var_1, var_3, var_6, 0, var_5, var_11 );
    wait 2;
    var_13 vehicle_setspeed( 75, 40 );
    var_13 setyawspeed( 180, 180, 180, 0.3 );
    var_13 waittill( "goal" );
    wait 0.1;
    var_13 notify( "drop_crate" );
    var_13 setvehgoalpos( var_12, 1 );
    var_13 vehicle_setspeed( 300, 75 );
    var_13._id_AB32 = 1;
    var_13 waittill( "goal" );
    var_13 notify( "leaving" );
    var_13 notify( "delete" );
    var_13 delete();
}

_id_4FC2()
{
    self waittill( "death" );
    waittillframeend;
    scripts\mp\utility\game::_id_4FC1();
}

_id_58FC( var_0, var_1, var_2, var_3 )
{
    level thread _id_5857( var_0, var_1, var_2, var_3, 0 );
    wait( randomintrange( 1, 2 ) );
    level thread _id_5857( var_0, var_1 + ( 128, 128, 0 ), var_2, var_3, 128 );
    wait( randomintrange( 1, 2 ) );
    level thread _id_5857( var_0, var_1 + ( 172, 256, 0 ), var_2, var_3, 256 );
    wait( randomintrange( 1, 2 ) );
    level thread _id_5857( var_0, var_1 + ( 64, 0, 0 ), var_2, var_3, 0 );
}

_id_57EF( var_0, var_1, var_2, var_3 )
{
    var_4 = 18000;
    var_5 = 3000;
    var_6 = vectortoyaw( var_1 - var_0.origin );
    var_7 = ( 0, var_6, 0 );
    var_8 = _id_7EC0( var_1 );
    var_9 = var_1 + anglestoforward( var_7 ) * ( -1 * var_4 );
    var_9 = var_9 * ( 1, 1, 0 ) + ( 0, 0, var_8 );
    var_10 = var_1 + anglestoforward( var_7 ) * var_4;
    var_10 = var_10 * ( 1, 1, 0 ) + ( 0, 0, var_8 );
    var_11 = length( var_9 - var_10 );
    var_12 = var_11 / var_5;
    var_13 = _id_365E( var_0, var_9, var_10 );
    var_13._id_037A = var_5;
    var_13._id_5EF1 = var_3;
    var_13 playloopsound( "veh_ac130_dist_loop" );
    var_13.angles = var_7;
    var_14 = anglestoforward( var_7 );
    var_13 moveto( var_10, var_12, 0, 0 );
    var_15 = distance2d( var_13.origin, var_1 );
    var_16 = 0;

    for (;;)
    {
        var_17 = distance2d( var_13.origin, var_1 );

        if ( var_17 < var_15 )
            var_15 = var_17;
        else if ( var_17 > var_15 )
            break;

        if ( var_17 < 320 )
            break;
        else if ( var_17 < 768 )
        {
            scripts\mp\shellshock::_id_1245( 0.15, 1.5, var_1, 1500 );

            if ( !var_16 )
            {
                var_13 playsound( "veh_ac130_sonic_boom" );
                var_16 = 1;
            }
        }

        wait 0.05;
    }

    wait 0.05;
    var_18 = ( 0, 0, 0 );
    var_19[0] = var_13 thread _id_5EEC( var_1, var_3, var_8, 0, undefined, var_9, var_18 );
    wait 0.05;
    var_13 notify( "drop_crate" );
    var_20 = var_1 + anglestoforward( var_7 ) * ( var_4 * 1.5 );
    var_13 moveto( var_20, var_12 / 2, 0, 0 );
    wait 6;
    var_13 delete();
}

_id_58FB( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = 24000;
    var_6 = 2000;
    var_7 = vectortoyaw( var_1 - var_0.origin );
    var_8 = ( 0, var_7, 0 );
    var_9 = anglestoforward( var_8 );

    if ( isdefined( var_4 ) )
        var_1 += var_9 * var_4;

    var_10 = _id_7EC0( var_1 );
    var_11 = var_1 + anglestoforward( var_8 ) * ( -1 * var_5 );
    var_11 = var_11 * ( 1, 1, 0 ) + ( 0, 0, var_10 );
    var_12 = var_1 + anglestoforward( var_8 ) * var_5;
    var_12 = var_12 * ( 1, 1, 0 ) + ( 0, 0, var_10 );
    var_13 = length( var_11 - var_12 );
    var_14 = var_13 / var_6;
    var_15 = _id_365E( var_0, var_11, var_12 );
    var_15._id_037A = var_6;
    var_15._id_5EF1 = var_3;
    var_15 playloopsound( "veh_ac130_dist_loop" );
    var_15.angles = var_8;
    var_9 = anglestoforward( var_8 );
    var_15 moveto( var_12, var_14, 0, 0 );
    var_16 = distance2d( var_15.origin, var_1 );
    var_17 = 0;

    for (;;)
    {
        var_18 = distance2d( var_15.origin, var_1 );

        if ( var_18 < var_16 )
            var_16 = var_18;
        else if ( var_18 > var_16 )
            break;

        if ( var_18 < 256 )
            break;
        else if ( var_18 < 768 )
        {
            scripts\mp\shellshock::_id_1245( 0.15, 1.5, var_1, 1500 );

            if ( !var_17 )
            {
                var_15 playsound( "veh_ac130_sonic_boom" );
                var_17 = 1;
            }
        }

        wait 0.05;
    }

    wait 0.05;
    var_19[0] = var_15 thread _id_5EEC( var_1, var_3, var_10, 0, undefined, var_11 );
    wait 0.05;
    var_15 notify( "drop_crate" );
    wait 0.05;
    var_19[1] = var_15 thread _id_5EEC( var_1, var_3, var_10, 0, undefined, var_11, undefined, var_19 );
    wait 0.05;
    var_15 notify( "drop_crate" );
    wait 0.05;
    var_19[2] = var_15 thread _id_5EEC( var_1, var_3, var_10, 0, undefined, var_11, undefined, var_19 );
    wait 0.05;
    var_15 notify( "drop_crate" );
    wait 0.05;
    var_19[3] = var_15 thread _id_5EEC( var_1, var_3, var_10, 0, undefined, var_11, undefined, var_19 );
    wait 0.05;
    var_15 notify( "drop_crate" );
    wait 4;
    var_15 delete();
}

_id_5D2D( var_0, var_1, var_2 )
{
    var_3 = 24000;
    var_4 = 2000;
    var_5 = randomint( 360 );
    var_6 = ( 0, var_5, 0 );
    var_7 = _id_7EC0( var_0 );
    var_8 = var_0 + anglestoforward( var_6 ) * ( -1 * var_3 );
    var_8 = var_8 * ( 1, 1, 0 ) + ( 0, 0, var_7 );
    var_9 = var_0 + anglestoforward( var_6 ) * var_3;
    var_9 = var_9 * ( 1, 1, 0 ) + ( 0, 0, var_7 );
    var_10 = length( var_8 - var_9 );
    var_11 = var_10 / var_4;
    var_12 = _id_365E( var_1, var_8, var_9 );
    var_12._id_037A = var_4;
    var_12._id_5EF1 = var_2;
    var_12 playloopsound( "veh_ac130_dist_loop" );
    var_12.angles = var_6;
    var_13 = anglestoforward( var_6 );
    var_12 moveto( var_9, var_11, 0, 0 );
    var_14 = 0;
    var_15 = distance2d( var_12.origin, var_0 );

    for (;;)
    {
        var_16 = distance2d( var_12.origin, var_0 );

        if ( var_16 < var_15 )
            var_15 = var_16;
        else if ( var_16 > var_15 )
            break;

        if ( var_16 < 256 )
            break;
        else if ( var_16 < 768 )
        {
            scripts\mp\shellshock::_id_1245( 0.15, 1.5, var_0, 1500 );

            if ( !var_14 )
            {
                var_12 playsound( "veh_ac130_sonic_boom" );
                var_14 = 1;
            }
        }

        wait 0.05;
    }

    var_12 thread _id_5EEC( var_0, var_2, var_7, 0, "nuke", var_8 );
    wait 0.05;
    var_12 notify( "drop_crate" );
    wait 4;
    var_12 delete();
}

_id_1107A( var_0 )
{
    self endon( "death" );
    wait( var_0 );
    self stoploopsound();
}

_id_D4C7( var_0 )
{
    var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_1 hide();
    var_1 endon( "death" );
    thread scripts\engine\utility::_id_5179( var_1 );
    var_1.origin = self.origin;
    var_1.angles = self.angles;
    var_1 linkto( self );
    var_1 playloopsound( var_0 );
    self waittill( "stop sound" + var_0 );
    var_1 stoploopsound( var_0 );
    var_1 delete();
}

_id_365E( var_0, var_1, var_2 )
{
    var_3 = vectortoangles( var_2 - var_1 );
    var_4 = spawnplane( var_0, "script_model", var_1, "compass_objpoint_c130_friendly", "compass_objpoint_c130_enemy" );
    var_4 setmodel( "vehicle_ac130_low_mp" );

    if ( !isdefined( var_4 ) )
        return;

    var_4.owner = var_0;
    var_4.team = var_0.team;
    level._id_365D = var_4;
    return var_4;
}

_id_8DD4( var_0, var_1, var_2 )
{
    var_3 = vectortoangles( var_2 - var_1 );
    var_4 = "littlebird_mp";

    if ( isdefined( level._id_13264 ) )
        var_4 = level._id_13264;

    var_5 = spawnhelicopter( var_0, var_1, var_3, var_4, "vehicle_aas_72x_killstreak" );

    if ( !isdefined( var_5 ) )
        return;

    var_5.maxhealth = 500;
    var_5.owner = var_0;
    var_5.team = var_0.team;
    var_5._id_9D32 = 1;
    var_5 thread _id_13B7E();
    var_5 thread _id_8D4A();
    var_5 thread _id_8DB5();
    var_5 thread scripts\mp\killstreaks\helicopter::_id_8D40( "airdrop" );
    var_5 setmaxpitchroll( 45, 85 );
    var_5 vehicle_setspeed( 250, 175 );
    var_5.helitype = "airdrop";
    var_5 _id_0DC9::_id_1843( var_5.helitype, "Killstreak_Air", var_0, 1 );
    var_5 _meth_8187( "tag_wings" );
    return var_5;
}

_id_13B7E( var_0 )
{
    level endon( "game_ended" );
    self endon( "leaving" );
    self endon( "helicopter_gone" );
    self endon( "death" );
    var_1 = 25.0;

    if ( isdefined( var_0 ) )
        var_1 = var_0;

    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_1 );
    self notify( "death" );
}

_id_8D4A()
{
    scripts\engine\utility::waittill_any( "crashing", "leaving" );
    self notify( "helicopter_gone" );
}

_id_8DB5()
{
    self endon( "leaving" );
    self endon( "helicopter_gone" );
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    self vehicle_setspeed( 25, 5 );
    thread _id_AAC9( randomintrange( 180, 220 ) );
    wait( randomfloatrange( 0.5, 1.5 ) );
    self notify( "drop_crate" );
    _id_AAC6();
}

_id_AAC6()
{
    var_0 = self.origin + ( 0, 0, 1 ) - self.origin;
    playfx( level._id_3F19["explode"]["death"]["cobra"], self.origin, var_0 );
    self playsound( "exp_helicopter_fuel" );
    self notify( "explode" );
    scripts\mp\utility\game::_id_4FC1();
    self delete();
}

_id_AAC9( var_0 )
{
    self endon( "explode" );
    playfxontag( level._id_3F19["explode"]["medium"], self, "tail_rotor_jnt" );
    playfxontag( level._id_3F19["fire"]["trail"]["medium"], self, "tail_rotor_jnt" );
    self setyawspeed( var_0, var_0, var_0 );

    while ( isdefined( self ) )
    {
        self _meth_8348( self.angles[1] + var_0 * 0.9 );
        wait 1;
    }
}

_id_C1B4()
{
    while ( isdefined( self ) )
    {
        self waittill( "trigger", var_0 );

        if ( !var_0 isonground() )
            continue;

        if ( !_id_13093( var_0 ) )
            continue;

        self notify( "captured", var_0 );
    }
}

_id_485A( var_0, var_1 )
{
    self endon( "restarting_physics" );
    var_2 = self;
    var_3 = undefined;

    if ( scripts\mp\utility\game::istrue( var_1 ) )
    {
        var_2 = self.fakeuseobj;
        var_3 = self.fakeuseobj;
    }

    while ( isdefined( self ) )
    {
        var_2 waittill( "trigger", var_4 );

        if ( isdefined( self.owner ) && var_4 == self.owner )
            continue;

        if ( !_id_13143( var_4 ) )
            continue;

        if ( isdefined( level._id_C81E ) )
            var_5 = level._id_C81E;
        else
            var_5 = undefined;

        var_4._id_9D7F = 1;

        if ( !scripts\mp\utility\game::istrue( var_1 ) )
            var_3 = _id_4A2D();

        var_6 = var_3 _id_13093( var_4, var_5, var_0 );

        if ( !scripts\mp\utility\game::istrue( var_1 ) )
        {
            if ( isdefined( var_3 ) )
                var_3 delete();
        }

        if ( !isdefined( var_4 ) )
            return;

        if ( !var_6 )
        {
            var_4._id_9D7F = 0;
            continue;
        }

        var_4._id_9D7F = 0;
        self notify( "captured", var_4 );
    }
}

_id_485B( var_0 )
{
    self endon( "restarting_physics" );

    while ( isdefined( self ) )
    {
        self waittill( "trigger", var_1 );

        if ( isdefined( self.owner ) && var_1 != self.owner )
            continue;

        if ( !_id_13143( var_1 ) )
            continue;

        var_1._id_9D7F = 1;

        if ( !_id_13093( var_1, 500, var_0 ) )
        {
            var_1._id_9D7F = 0;
            continue;
        }

        var_1._id_9D7F = 0;
        self notify( "captured", var_1 );
    }
}

_id_484E( var_0 )
{
    self endon( "restarting_physics" );
    self._id_4861 = [];

    while ( isdefined( self ) )
    {
        self waittill( "trigger", var_1 );

        if ( !_id_13143( var_1 ) )
            continue;

        if ( isdefined( level._id_C81E ) )
            var_2 = level._id_C81E;
        else
            var_2 = undefined;

        childthread _id_4850( var_1, var_2, var_0 );
    }
}

_id_4850( var_0, var_1, var_2 )
{
    var_0._id_9D7F = 1;
    self._id_4861[var_0.name] = _id_4A2D();
    var_3 = self._id_4861[var_0.name];
    var_4 = self._id_4861[var_0.name] _id_13093( var_0, var_1, var_2, self );

    if ( isdefined( self._id_4861 ) && isdefined( var_3 ) )
    {
        self._id_4861 = scripts\mp\utility\game::_id_22B1( self._id_4861, var_3 );
        var_3 delete();
    }

    if ( !isdefined( var_0 ) )
        return;

    var_0._id_9D7F = 0;

    if ( var_4 )
        self notify( "captured", var_0 );
}

_id_12E80()
{
    self._id_9B04 = 0;

    foreach ( var_1 in self._id_4861 )
    {
        if ( var_1._id_9B04 )
        {
            self._id_9B04 = 1;
            break;
        }
    }
}

_id_13143( var_0 )
{
    if ( ( self._id_485F == "airdrop_juggernaut_recon" || self._id_485F == "airdrop_juggernaut" || self._id_485F == "airdrop_juggernaut_maniac" ) && var_0 scripts\mp\utility\game::isjuggernaut() )
        return 0;

    if ( isdefined( var_0._id_C53B ) && var_0._id_C53B )
        return 0;

    var_1 = var_0 getcurrentweapon();

    if ( scripts\mp\utility\game::_id_9E6C( var_1 ) && !scripts\mp\utility\game::_id_9E60( var_1 ) )
        return 0;

    if ( isbot( var_0 ) )
    {
        if ( level.gametype != "grnd" && !scripts\mp\bots\bots_killstreaks::_id_2DDB( self._id_485F ) )
            return 0;

        if ( scripts\mp\bots\bots_killstreaks::_id_9E66( self._id_485F ) )
            return 0;
    }

    return 1;
}

killstreakcratethink( var_0 )
{
    self endon( "restarting_physics" );
    self endon( "death" );

    if ( isdefined( game["strings"][self._id_485F + "_hint"] ) )
        var_1 = game["strings"][self._id_485F + "_hint"];
    else
        var_1 = &"PLATFORM_GET_KILLSTREAK";

    var_2 = -10000;
    var_3 = undefined;

    if ( !scripts\mp\utility\game::istrue( level._id_7669 ) )
    {
        if ( var_0 == "dronedrop_reroll" )
        {
            var_3 = 1;

            if ( isdefined( game["strings"][self._id_485F + "_rerollHint"] ) )
                var_1 = game["strings"][self._id_485F + "_rerollHint"];
        }

        _id_485D( var_1, scripts\mp\utility\game::_id_7F49( self._id_485F ), var_3, var_2 );
    }

    thread _id_485A( undefined, var_3 );
    thread _id_485B();
    thread cratewatchgameover();

    for (;;)
    {
        self waittill( "captured", var_4 );

        if ( isplayer( var_4 ) )
        {
            var_4 setclientomnvar( "ui_securing", 0 );
            var_4._id_12B26 = undefined;
        }

        if ( isdefined( self.owner ) )
        {
            if ( var_4 == self.owner )
                var_4 thread scripts\mp\missions::_id_D991( "ch_scorestreak_uses_dronepackage" );
            else if ( !level.teambased || var_4.team != self.team )
            {
                switch ( var_0 )
                {
                    case "airdrop_osprey_gunner":
                    case "airdrop_escort":
                    case "airdrop_support":
                    case "airdrop_assault":
                        var_4 thread scripts\mp\missions::_id_D992( "hijacker_airdrop" );
                        var_4 thread _id_8EFC( self, "airdrop" );
                        break;
                    case "airdrop_sentry_minigun":
                        var_4 thread scripts\mp\missions::_id_D992( "hijacker_airdrop" );
                        var_4 thread _id_8EFC( self, "sentry" );
                        break;
                    case "airdrop_remote_tank":
                        var_4 thread scripts\mp\missions::_id_D992( "hijacker_airdrop" );
                        var_4 thread _id_8EFC( self, "remote_tank" );
                        break;
                    case "airdrop_mega":
                        var_4 thread scripts\mp\missions::_id_D992( "hijacker_airdrop_mega" );
                        var_4 thread _id_8EFC( self, "emergency_airdrop" );
                        break;
                    case "dronedrop_highroll":
                    case "jackaldrop":
                    case "dronedrop_reroll":
                    case "dronedrop":
                        var_4 thread _id_8EFC( self, "dronedrop" );
                        var_4 thread scripts\mp\missions::_id_D991( "ch_hijack" );
                        break;
                }
            }
            else if ( level.gametype != "grnd" )
            {
                self.owner thread scripts\mp\awards::givemidmatchaward( "ss_use_dronedrop" );
                self.owner thread scripts\mp\missions::_id_D991( "ch_package_share" );
            }
        }

        var_4 playlocalsound( "ammo_crate_use" );
        var_5 = undefined;

        if ( scripts\mp\utility\game::istrue( level.enablevariantdrops ) )
            var_5 = _id_0AC7::getrandomvariantfrombaseref( self._id_485F );

        if ( isdefined( var_5 ) )
        {
            var_6 = _id_0AC7::_id_804B( var_5 );
            var_4 thread scripts\mp\killstreaks\killstreaks::_id_26D4( self._id_485F, self.owner, var_6, var_5 );
            var_7 = _id_0AC7::getrarityforlootitem( var_5 );
            var_8 = self._id_485F + "_" + var_7;
            var_4 scripts\mp\hud_message::_id_10134( var_8, undefined, 1 );
        }
        else
        {
            var_4 thread scripts\mp\killstreaks\killstreaks::_id_8374( self._id_485F, 0, 0, self.owner );
            var_4 scripts\mp\hud_message::_id_10134( self._id_485F, undefined, 1 );
        }

        if ( scripts\mp\killstreaks\killstreaks::_id_817B( self._id_485F ) > 1000 )
            var_4 thread scripts\mp\missions::_id_D991( "ch_dronepackage_jackpot" );

        _id_51AA();
    }
}

killstreakbombcratethink( var_0 )
{
    self endon( "restarting_physics" );
    self endon( "death" );

    if ( isdefined( self.owner ) )
        self.owner endon( "disconnect" );

    var_1 = [ &"KILLSTREAKS_HINTS_SENTRY_SHOCK_PICKUP", &"KILLSTREAKS_HINTS_JACKAL_PICKUP", &"KILLSTREAKS_HINTS_THOR_PICKUP", &"KILLSTREAKS_HINTS_RC8_PICKUP", &"KILLSTREAKS_HINTS_MINI_JACKAL_PICKUP" ];
    var_2 = scripts\engine\utility::_id_DC6B( var_1 );
    var_3 = undefined;

    if ( level.gametype == "grnd" )
        var_3 = -10000;

    if ( !scripts\mp\utility\game::istrue( level._id_7669 ) )
        _id_485D( var_2, "hud_icon_trap_package", 0, var_3 );

    thread _id_485A();
    thread cratewatchgameover();
    thread cratewatchownerdisconnect();

    if ( isdefined( self._id_A63A ) )
    {
        self._id_A63A unlink();
        self._id_A63A moveto( self.origin + ( 0, 0, 30 ), 0.05 );
    }

    self waittill( "captured", var_4 );

    if ( isplayer( var_4 ) )
    {
        var_4 setclientomnvar( "ui_securing", 0 );
        var_4._id_12B26 = undefined;
    }

    var_4 playlocalsound( "ammo_crate_use" );
    var_5 = self.owner scripts\mp\utility\game::_id_1302( "dummy_spike_mp", self.origin, self.origin, 2 );

    if ( !isdefined( var_5._id_13C2E ) )
        var_5._id_13C2E = "dummy_spike_mp";

    var_5 linkto( self );
    var_6 = 0.1;
    var_7 = 0;

    while ( var_7 < 0.8 )
    {
        playloopsound( self.origin + ( 0, 0, 10 ), "mp_dronepackage_trap_warning" );
        var_7 += var_6;
        wait( var_6 );
    }

    playfx( scripts\engine\utility::_id_7ECB( "crate_explode" ), self.origin );
    playloopsound( self.origin, "mp_equip_destroyed" );
    scripts\mp\shellshock::_id_22FF( 1.0, 0.7, 800 );

    if ( isdefined( self.owner ) )
        self _meth_8253( self.origin, 256, 200, 100, self.owner, "MOD_EXPLOSIVE", "jackal_fast_cannon_mp" );

    _id_51AA();
}

cratewatchownerdisconnect()
{
    self endon( "death" );
    self.owner waittill( "disconnect" );
    _id_51AA();
}

cratewatchgameover()
{
    self endon( "death" );
    level scripts\engine\utility::waittill_any( "bro_shot_start", "game_ended" );

    if ( isdefined( self ) )
        _id_51AA();
}

dronewatchgameover()
{
    self endon( "death" );
    level scripts\engine\utility::waittill_any( "bro_shot_start", "game_ended" );

    if ( isdefined( self ) )
        self notify( "death" );
}

_id_C1B6( var_0 )
{
    self endon( "restarting_physics" );
    self endon( "death" );
    _id_485D( &"PLATFORM_CALL_NUKE", scripts\mp\utility\game::_id_7F49( self._id_485F ) );
    thread _id_C1B4();

    for (;;)
    {
        self waittill( "captured", var_1 );
        var_1 thread scripts\mp\killstreaks\killstreaks::_id_729F( self._id_485F );
        level notify( "nukeCaptured", var_1 );

        if ( isdefined( level._id_86AD ) && level._id_86AD )
            var_1._id_3A3E = 1;

        var_1 playlocalsound( "ammo_crate_use" );
        _id_51AA();
    }
}

_id_A4A5( var_0 )
{
    self endon( "restarting_physics" );
    self endon( "death" );
    _id_485D( game["strings"][self._id_485F + "_hint"], scripts\mp\utility\game::_id_7F49( self._id_485F ) );
    thread _id_485A();
    thread _id_485B();

    for (;;)
    {
        self waittill( "captured", var_1 );

        if ( isdefined( self.owner ) && var_1 != self.owner )
        {
            if ( !level.teambased || var_1.team != self.team )
            {
                if ( self._id_485F == "airdrop_juggernaut_maniac" )
                    var_1 thread _id_8EFC( self, "maniac" );
                else if ( scripts\mp\utility\game::_id_9F7C( self._id_485F, "juggernaut_" ) )
                    var_1 thread _id_8EFC( self, self._id_485F );
                else
                    var_1 thread _id_8EFC( self, "juggernaut" );
            }
            else if ( self._id_485F == "airdrop_juggernaut_maniac" )
                self.owner scripts\mp\hud_message::showsplash( "giveaway_juggernaut_maniac", undefined, var_1 );
            else if ( scripts\mp\utility\game::_id_9F7C( self._id_485F, "juggernaut_" ) )
                self.owner scripts\mp\hud_message::showsplash( "giveaway_" + self._id_485F, undefined, var_1 );
            else
                self.owner scripts\mp\hud_message::showsplash( "giveaway_juggernaut", undefined, var_1 );
        }

        var_1 playlocalsound( "ammo_crate_use" );
        var_2 = "juggernaut";

        switch ( self._id_485F )
        {
            case "airdrop_juggernaut":
                var_2 = "juggernaut";
                break;
            case "airdrop_juggernaut_recon":
                var_2 = "juggernaut_recon";
                break;
            case "airdrop_juggernaut_maniac":
                var_2 = "juggernaut_maniac";
                break;
            default:
                if ( scripts\mp\utility\game::_id_9F7C( self._id_485F, "juggernaut_" ) )
                    var_2 = self._id_485F;

                break;
        }

        var_1 thread scripts\mp\killstreaks\juggernaut::_id_8371( var_2 );
        _id_51AA();
    }
}

_id_F264( var_0 )
{
    self endon( "death" );
    _id_485D( game["strings"]["sentry_hint"], scripts\mp\utility\game::_id_7F49( self._id_485F ) );
    thread _id_485A();
    thread _id_485B();

    for (;;)
    {
        self waittill( "captured", var_1 );

        if ( isdefined( self.owner ) && var_1 != self.owner )
        {
            if ( !level.teambased || var_1.team != self.team )
            {
                if ( issubstr( var_0, "airdrop_sentry" ) )
                    var_1 thread _id_8EFC( self, "sentry" );
                else
                    var_1 thread _id_8EFC( self, "emergency_airdrop" );
            }
            else
            {
                self.owner thread scripts\mp\utility\game::_id_83B4( "killstreak_giveaway", undefined, int( scripts\mp\killstreaks\killstreaks::_id_817B( "sentry" ) / 10 ) * 50 );
                self.owner scripts\mp\hud_message::showsplash( "giveaway_sentry", undefined, var_1 );
            }
        }

        var_1 playlocalsound( "ammo_crate_use" );
        var_1 thread _id_F26F();
        _id_51AA();
    }
}

_id_51AA()
{
    self notify( "crate_deleting" );

    if ( isdefined( self._id_13074 ) )
    {
        foreach ( var_1 in self._id_13074 )
        {
            var_1 setclientomnvar( "ui_securing", 0 );
            var_1._id_12B26 = undefined;
        }
    }

    if ( isdefined( self.minimapid ) )
        scripts\mp\objidpoolmanager::returnminimapid( self.minimapid );

    if ( isdefined( self._id_2C43 ) && isdefined( self._id_2C43._id_A63A ) )
        self._id_2C43._id_A63A delete();

    if ( isdefined( self._id_2C43 ) )
        self._id_2C43 delete();

    if ( isdefined( self._id_A63A ) )
        self._id_A63A delete();

    if ( isdefined( self._id_5EF1 ) )
        playfx( scripts\engine\utility::_id_7ECB( "airdrop_crate_destroy" ), self.origin );

    if ( isdefined( self._id_BE6F ) )
    {
        self notify( "nav_obstacle_destroyed" );
        _func_27C( self._id_BE6F );
        self._id_BE6F = undefined;
    }

    self delete();
}

_id_F26F()
{
    if ( !scripts\mp\killstreaks\autosentry::_id_83A3( "sentry_minigun", 0, 0 ) )
        scripts\mp\killstreaks\killstreaks::_id_8374( "sentry" );
}

_id_8EFC( var_0, var_1 )
{
    self notify( "hijacker", var_1, var_0.owner );
}

_id_DE4B( var_0 )
{
    var_1 = self _meth_8173();

    if ( var_0 )
    {

    }

    foreach ( var_3 in var_1 )
    {
        if ( issubstr( var_3, "grenade" ) || getsubstr( var_3, 0, 2 ) == "gl" )
        {
            if ( !var_0 || self getammocount( var_3 ) >= 1 )
                continue;
        }

        self givemaxammo( var_3 );
    }
}

_id_13093( var_0, var_1, var_2, var_3 )
{
    scripts\mp\movers::_id_EE3E( var_0 );
    var_0 scripts\engine\utility::_id_1C71( 0 );
    self._id_4B30 = 0;
    self._id_9B04 = 1;
    self._id_130C7 = 0;

    if ( isdefined( var_3 ) )
        var_3 _id_12E80();

    if ( isdefined( var_1 ) )
        self._id_130EE = var_1;
    else
        self._id_130EE = 3000;

    var_4 = _id_13094( var_0 );

    if ( isalive( var_0 ) )
        var_0 scripts\engine\utility::_id_1C71( 1 );

    if ( isdefined( var_0 ) )
        scripts\mp\movers::_id_EE4D( var_0 );

    if ( !isdefined( self ) )
        return 0;

    self._id_9B04 = 0;
    self._id_4B30 = 0;

    if ( isdefined( var_3 ) )
        var_3 _id_12E80();

    return var_4;
}

_id_13094( var_0 )
{
    while ( var_0 scripts\mp\killstreaks\deployablebox::_id_9EFD( self ) )
    {
        if ( !var_0 scripts\mp\movers::_id_EE4E( self ) )
        {
            var_0 scripts\mp\gameobjects::_id_12F53( self, 0 );
            return 0;
        }

        self._id_4B30 += 50 * self._id_130C7;

        if ( isdefined( self._id_C2AD ) )
            self._id_130C7 = 1 * self._id_C2AD;
        else
            self._id_130C7 = 1;

        var_0 scripts\mp\gameobjects::_id_12F53( self, 1 );

        if ( self._id_4B30 >= self._id_130EE )
        {
            var_0 scripts\mp\gameobjects::_id_12F53( self, 0 );
            return scripts\mp\utility\game::isreallyalive( var_0 );
        }

        wait 0.05;
    }

    if ( isdefined( self ) )
        var_0 scripts\mp\gameobjects::_id_12F53( self, 0 );

    return 0;
}

_id_4A2D()
{
    var_0 = spawn( "script_origin", self.origin );
    var_0._id_4B30 = 0;
    var_0._id_130EE = 0;
    var_0._id_130C7 = 3000;
    var_0._id_9B04 = 0;
    var_0._id_92B8 = self._id_92B8;
    var_0 linkto( self );
    var_0 thread _id_51D9( self );
    return var_0;
}

_id_51D9( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );

    if ( isdefined( self._id_13074 ) )
    {
        foreach ( var_2 in self._id_13074 )
        {
            var_2 setclientomnvar( "ui_securing", 0 );
            var_2._id_12B26 = undefined;
        }
    }

    self delete();
}

_id_1A9C()
{
    self endon( "death" );
    self waittill( "missile_stuck" );
    self _meth_8099();
}

_id_117FE( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level._id_3A59 ) )
    {
        foreach ( var_5 in level._id_3A59 )
        {
            if ( isdefined( var_5._id_9B04 ) && var_5._id_9B04 )
                continue;

            var_6 = var_5 _meth_8138();

            if ( isdefined( var_6 ) && var_6 == var_0 )
            {
                thread _id_1077C( var_5, var_1, var_2 );

                if ( isdefined( var_3 ) )
                    scripts\engine\utility::delaythread( 1.0, ::_id_DFD5, var_3 );
            }
        }
    }
}

_id_1077C( var_0, var_1, var_2 )
{
    var_3 = var_0.owner;
    var_4 = var_0._id_5EF1;
    var_5 = var_0._id_485F;
    var_6 = var_0.origin;
    var_0 _id_51AA();
    var_7 = var_3 _id_4982( var_3, var_4, var_5, var_6 + var_1, var_6 + var_1 );
    var_7._id_5D44 = 1;
    var_7 thread [[ level._id_4860[var_7._id_5EF1][var_7._id_485F]._id_74C2 ]]( var_7._id_5EF1 );
    scripts\engine\utility::waitframe();
    var_7 physicslaunchserver( var_7.origin, var_2 );

    if ( isbot( var_7.owner ) )
    {
        wait 0.1;
        var_7.owner notify( "new_crate_to_take" );
    }
}

_id_DFD5( var_0 )
{
    if ( isdefined( level._id_3A59 ) )
    {
        foreach ( var_2 in level._id_3A59 )
        {
            if ( isdefined( var_2 ) && isdefined( var_2._id_741D ) && var_2._id_741D istouching( var_0 ) )
                var_2 _id_51AA();
        }
    }
}

_id_7971()
{
    return "care_package_iw7_dummy";
}

_id_797B()
{
    return "care_package_iw7_ca_wm";
}

_id_79D1()
{
    return "care_package_iw7_un_wm";
}

dropzoneaddcratetypes()
{
    addcratetype( "dronedrop_grnd", "jackal", 15, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_JACKAL_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_grnd", "thor", 10, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_THOR_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_grnd", "directional_uav", 10, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_DIRECTIONAL_UAV_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_grnd", "remote_c8", 5, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_RC8_PICKUP", undefined, "care_package_iw7_dummy" );
    addcratetype( "dronedrop_grnd", "minijackal", 5, ::killstreakcratethink, "care_package_iw7_un_wm", "care_package_iw7_ca_wm", &"KILLSTREAKS_HINTS_MINI_JACKAL_PICKUP", undefined, "care_package_iw7_dummy" );
    _id_7730();
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_1AF7 = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_1AFD = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_1AF6 = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_A87D = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_BB68 = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_2C6B = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_1A8D = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_A3BA = loadfx( "vfx/iw7/core/vehicle/jackal/vfx_jackal_death_01_cheap.vfx" );
    level._effect["jackal_explosion"] = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_veh_exp_warden.vfx" );
    level._id_A412 = [];
    level._id_4D82["precision_airstrike"] = 550;
    level._id_4D83["precision_airstrike"] = 300;
    level._id_4D81["precision_airstrike"] = 2.0;
    level._id_4D84["precision_airstrike"] = 6.0;
    level._id_2300 = [];
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "precision_airstrike", ::_id_128D4, undefined, undefined, undefined, ::_id_13C8A );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "jackal", ::_id_128D4, undefined, undefined, ::triggerjackalweapon, ::_id_13C8A );
    var_0 = [ "passive_precision_strike", "passive_increased_speed", "passive_decreased_damage", "passive_split_strike", "passive_increased_cost", "passive_one_plane", "passive_speed_cost" ];
    _id_0AC7::_id_DF07( "precision_airstrike", var_0 );
    var_1 = [ "passive_extra_flare", "passive_decreased_duration", "passive_moving_fortress", "passive_no_cannon", "passive_slow_turret", "passive_support_drop" ];
    _id_0AC7::_id_DF07( "jackal", var_1 );
    level._id_CC46 = [];
    level thread _id_7DE9();
}

_id_7DE9()
{
    var_0 = scripts\mp\spawnlogic::getspawnpointarray( "mp_tdm_spawn_allies_start" );
    var_1 = 0;
    var_2 = 0;

    foreach ( var_4 in var_0 )
    {
        var_1++;
        var_2 += var_4.origin[2];
    }

    level._id_26A6 = var_2 / var_1;
}

_id_13C8A( var_0 )
{
    var_1 = undefined;

    if ( var_0._id_110EA == "precision_airstrike" )
    {
        if ( scripts\mp\utility\game::istrue( level._id_1AF9 ) )
        {
            scripts\mp\hud_message::_id_10122( "KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
            return 0;
        }

        if ( _id_0DC9::_id_A69F( var_0, "passive_precision_strike" ) || _id_0DC9::_id_A69F( var_0, "passive_split_strike" ) )
            var_1 = 1;

        _id_0DAC::_id_10DC2( 0, 1, var_1 );
    }

    return 1;
}

_id_128D4( var_0 )
{
    if ( var_0._id_110EA == "jackal" && ( isdefined( level._id_A22D ) || level._id_A412.size > 0 ) )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );

        if ( _id_0DC9::_id_A69F( var_0, "passive_support_drop" ) )
        {
            if ( isdefined( var_0.weapon ) && var_0.weapon != "none" )
                self notify( "killstreak_finished_with_weapon_" + var_0.weapon );
        }

        return 0;
    }

    var_1 = _id_F1AA( var_0._id_AC68, var_0._id_110EA, var_0 );

    if ( !isdefined( var_1 ) || !var_1 )
        return 0;

    return 1;
}

_id_57DD( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( var_5 == "precision_airstrike" )
    {
        level._id_1AF9 = 1;
        thread _id_1399E();
    }

    var_8 = scripts\engine\trace::_id_DCED( var_1, var_1 + ( 0, 0, -1000000.0 ) );
    var_9 = var_8["position"];
    var_10 = spawnstruct();
    var_10.origin = var_9;
    var_10._id_0143 = anglestoforward( ( 0, var_2, 0 ) );
    var_10._id_110EA = var_5;
    var_10.team = var_4;
    _id_3785( var_0, var_3, var_9, var_2, var_5, var_6, var_7 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 7.5 );
    var_11 = 0;
    var_12 = [];

    if ( var_5 == "precision_airstrike" )
        level._id_1AF9 = undefined;

    self notify( "airstrike_finished" );

    if ( var_5 == "precision_airstrike" )
        scripts\mp\utility\game::_id_D915( "killstreak ended - precision_airstrike", var_3 );
}

_id_1399E()
{
    self endon( "airstrike_finished" );
    level endon( "game_ended" );
    scripts\engine\utility::waittill_any( "disconnect", "joined_team" );

    if ( scripts\mp\utility\game::istrue( level._id_1AF9 ) )
        level._id_1AF9 = undefined;
}

_id_41D3( var_0 )
{
    wait 2.0;
    level._id_1AF9 = undefined;
}

_id_7DAA( var_0 )
{
    var_1 = 0;

    for ( var_2 = 0; var_2 < level._id_2300.size; var_2++ )
    {
        var_3 = level._id_2300[var_2].origin;
        var_4 = level._id_2300[var_2]._id_0143;
        var_5 = level._id_2300[var_2]._id_110EA;
        var_1 += _id_8124( var_0, var_3, var_4, var_5 );
    }

    return var_1;
}

_id_8124( var_0, var_1, var_2, var_3 )
{
    if ( scripts\mp\utility\game::_id_9F0F( var_3 ) )
    {
        if ( distancesquared( var_0, var_1 ) < level._id_4D82[var_3] )
            return 1;
        else
            return 0;
    }

    var_4 = var_1 + level._id_4D81[var_3] * level._id_4D82[var_3] * var_2;
    var_5 = var_0 - var_4;
    var_5 = ( var_5[0], var_5[1], 0 );
    var_6 = vectordot( var_5, var_2 ) * var_2;
    var_7 = var_5 - var_6;
    var_8 = var_7 + var_6 / level._id_4D84[var_3];
    var_9 = lengthsquared( var_8 );

    if ( var_9 > level._id_4D82[var_3] * level._id_4D82[var_3] )
        return 0;

    if ( var_9 < level._id_4D83[var_3] * level._id_4D83[var_3] )
        return 1;

    var_10 = sqrt( var_9 );
    var_11 = ( var_10 - level._id_4D83[var_3] ) / ( level._id_4D82[var_3] - level._id_4D83[var_3] );
    return 1 - var_11;
}

_id_D644( var_0, var_1, var_2, var_3 )
{
    return distance2d( var_0, var_1 ) <= level._id_4D82[var_3] * 1.25;
}

_id_B09E( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = scripts\mp\weapons::_id_7E58( var_0, var_1, 1 );
    glassradiusdamage( var_0, var_1, var_2, var_3 );

    for ( var_8 = 0; var_8 < var_7.size; var_8++ )
    {
        if ( var_7[var_8]._id_0114 == self )
            continue;

        var_9 = distance( var_0, var_7[var_8]._id_4D2F );

        if ( var_7[var_8]._id_9EE7 || isdefined( var_7[var_8]._id_9F44 ) && var_7[var_8]._id_9F44 )
        {
            var_10 = !bullettracepassed( var_7[var_8]._id_0114.origin, var_7[var_8]._id_0114.origin + ( 0, 0, 130 ), 0, undefined );

            if ( var_10 )
            {
                var_10 = !bullettracepassed( var_7[var_8]._id_0114.origin + ( 0, 0, 130 ), var_0 + ( 0, 0, 114 ), 0, undefined );

                if ( var_10 )
                {
                    var_9 *= 4;

                    if ( var_9 > var_1 )
                        continue;
                }
            }
        }

        var_7[var_8].damage = int( var_2 + ( var_3 - var_2 ) * var_9 / var_1 );
        var_7[var_8]._id_D699 = var_0;
        var_7[var_8]._id_4D5C = var_4;
        var_7[var_8].einflictor = var_5;
        level._id_1AF2[level._id_1AF3] = var_7[var_8];
        level._id_1AF3++;
    }

    thread _id_1AF5( var_6 );
}

_id_1AF5( var_0 )
{
    self notify( "airstrikeDamageEntsThread" );
    self endon( "airstrikeDamageEntsThread" );

    while ( level._id_1AF4 < level._id_1AF3 )
    {
        if ( !isdefined( level._id_1AF2[level._id_1AF4] ) )
        {

        }
        else
        {
            var_1 = level._id_1AF2[level._id_1AF4];

            if ( !isdefined( var_1._id_0114 ) )
            {

            }
            else if ( !var_1._id_9EE7 || isalive( var_1._id_0114 ) )
            {
                var_1 scripts\mp\weapons::_id_4D47( var_1.einflictor, var_1._id_4D5C, var_1.damage, "MOD_PROJECTILE_SPLASH", var_0, var_1._id_D699, vectornormalize( var_1._id_4D2F - var_1._id_D699 ) );
                level._id_1AF2[level._id_1AF4] = undefined;

                if ( var_1._id_9EE7 )
                    wait 0.05;
            }
            else
                level._id_1AF2[level._id_1AF4] = undefined;
        }

        level._id_1AF4++;
    }
}

_id_DC09( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = level.players;

    foreach ( var_7 in level.players )
    {
        if ( !isalive( var_7 ) )
            continue;

        if ( var_7.team == var_4 || var_7.team == "spectator" )
            continue;

        var_8 = var_7.origin + ( 0, 0, 32 );
        var_9 = distance( var_0, var_8 );

        if ( var_9 > var_1 )
            continue;

        var_10 = int( var_2 + ( var_3 - var_2 ) * var_9 / var_1 );
        var_7 thread _id_2301( "default", var_10 );
    }
}

_id_2301( var_0, var_1 )
{
    self endon( "disconnect" );

    if ( isdefined( self._id_2A87 ) && self._id_2A87 )
        return;

    self._id_2A87 = 1;
    self shellshock( var_0, var_1 );
    wait( var_1 + 1 );
    self._id_2A87 = 0;
}

_id_3786( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_1 ) || var_1 scripts\mp\utility\game::_id_9E68() )
    {
        self notify( "stop_bombing" );
        return;
    }

    var_4 = 512;
    var_5 = ( 0, randomint( 360 ), 0 );
    var_6 = var_0 + anglestoforward( var_5 ) * randomfloat( var_4 );
    var_7 = bullettrace( var_6, var_6 + ( 0, 0, -10000 ), 0, undefined );
    var_6 = var_7["position"];
    var_8 = distance( var_0, var_6 );

    if ( var_8 > 5000 )
        return;

    wait( 0.85 * var_8 / 2000 );

    if ( !isdefined( var_1 ) || var_1 scripts\mp\utility\game::_id_9E68() )
    {
        self notify( "stop_bombing" );
        return;
    }

    if ( var_3 )
    {
        playfx( level._id_BB68, var_6 );
        level thread scripts\mp\shellshock::_id_10F44( var_6 );
    }

    thread scripts\mp\utility\game::_id_D52A( "exp_airstrike_bomb", var_6 );
    _id_DC09( var_6, 512, 8, 4, var_1.team );
    _id_B09E( var_6 + ( 0, 0, 16 ), 896, 300, 50, var_1, self, "stealth_bomb_mp" );
}

_id_5A60( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( !isdefined( var_1 ) )
        return;

    var_12 = 100;
    var_13 = 150;
    var_14 = var_4;
    var_15 = var_5;
    var_16 = "veh_mil_air_ca_jackal_drone_atmos_periph_mp";
    var_17 = _id_0AC7::getrarityforlootitem( var_11._id_1318B );

    if ( var_17 != "" )
        var_16 = var_16 + "_" + var_17;

    var_18 = spawn( "script_model", var_14 );
    var_18 setmodel( var_16 );
    var_18.owner = var_1;
    var_18.origin = var_14;
    var_18.angles = var_8;
    var_18.team = var_1.team;
    var_18._id_AC68 = var_0;
    var_18._id_110E8 = var_11;
    var_18 _meth_831F( var_1 );
    var_18 _meth_8549();
    var_18 _meth_8594();
    var_18 _meth_8548();
    var_18 _id_0DC9::_id_1843( var_9, "Killstreak_Air", var_1, 1, "kill_outline" );
    var_18 thread _id_8998( var_1 );

    if ( var_9 == "precision_airstrike" )
    {
        var_19 = "jackal_airstrike_turret_mp";
        var_20 = "vehicle_battle_hind_mg_mp";
        var_21 = "tag_bottom_light";
        var_22 = "icon_minimap_scorcher_friendly";

        if ( _id_0DC9::_id_A69F( var_11, "passive_speed_cost" ) )
            var_7 -= 1;

        var_18.minimapid = var_18 scripts\mp\killstreaks\airdrop::_id_49F7( var_22, undefined, undefined, 1, 1 );
        var_18._id_129B9 = spawnturret( "misc_turret", var_18 gettagorigin( var_21 ), var_19 );
        var_18._id_129B9 setmodel( var_20 );
        var_18._id_129B9.owner = var_1;
        var_18._id_129B9.angles = var_18.angles;
        var_18._id_129B9 linkto( var_18, var_21, ( 0, 0, 30 ), ( 0, 0, 0 ) );
        var_18._id_129B9 _meth_835B( 0 );
        var_18._id_129B9 _meth_830F( "manual_target" );
        var_18._id_129B9 _meth_8336( var_1 );
        var_18._id_12A95 = spawn( "script_model", var_18.origin + anglestoforward( var_18.angles ) * 1000 - ( 0, 0, 10000 ) );
        var_18._id_12A95 linkto( var_18 );
        var_18._id_A87B = spawn( "script_model", var_18._id_12A95.origin );
        var_18._id_A87B setmodel( "ks_scorchers_target_mp" );
        var_18._id_A87B _meth_82DD( var_1 );
        var_18._id_A87B._id_13C2E = "artillery_mp";
        var_18._id_A87B._id_110E8 = var_11;
        var_18._id_129B9 settargetentity( var_18._id_12A95 );
    }

    var_18 moveto( var_15, var_7, 0, 0 );

    if ( var_9 == "precision_airstrike" )
    {
        var_18 setscriptablepartstate( "thrusters", "idle", 0 );
        thread _id_3788( var_18, var_15, var_7, var_6 - 1.5, var_1 );
        wait( var_6 + 1 );
    }
    else
    {
        var_18 setscriptablepartstate( "thrusters", "idle", 0 );
        thread _id_3787( var_18, var_15, var_7, var_6 - 1.0, var_1, var_2, var_9, var_10 );
        wait( var_6 - 0.75 );
    }

    if ( var_9 != "jackal" )
        var_18 _meth_8294( "airstrike_mp_roll", 1 );

    var_18 thread _id_5115( 2.5, "kill_outline" );
    var_18 endon( "death" );
    wait( var_7 - var_6 );
    var_18 setscriptablepartstate( "thrusters", "neutral", 0 );

    if ( isdefined( var_18.minimapid ) )
        scripts\mp\objidpoolmanager::returnminimapid( var_18.minimapid );

    var_18 notify( "delete" );

    if ( isdefined( var_18._id_129B9 ) )
        var_18._id_129B9 delete();

    if ( isdefined( var_18._id_12A95 ) )
        var_18._id_12A95 delete();

    if ( isdefined( var_18._id_A87B ) )
    {
        var_18._id_A87B delete();

        if ( isdefined( var_18._id_A87B._id_A63A ) )
            var_18._id_A87B._id_A63A delete();
    }

    if ( isdefined( var_18 ) )
        var_18 delete();
}

_id_5115( var_0, var_1 )
{
    self endon( "death" );
    wait( var_0 );
    self notify( var_1 );
}

_id_898E()
{
    level endon( "game_ended" );
    self endon( "delete" );
    self waittill( "death" );
    var_0 = anglestoforward( self.angles ) * 200;
    playfx( level._id_8B57, self.origin, var_0 );
    self delete();
}

_id_180E( var_0 )
{
    level._id_CC46[level._id_CC46.size] = var_0;
}

_id_E157( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_CC46.size; var_1++ )
    {
        if ( isdefined( level._id_CC46[var_1] ) && level._id_CC46[var_1] == var_0 )
            level._id_CC46[var_1] = undefined;
    }
}

_id_3787( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_0 endon( "death" );
    wait( var_3 );

    if ( !isdefined( var_4 ) || var_4 scripts\mp\utility\game::_id_9E68() )
        return;

    var_8 = anglestoforward( var_0.angles );
    var_9 = _id_10836( var_0.origin, var_0.angles );
    var_9 movegravity( anglestoforward( var_0.angles ) * 4666.67, 3.0 );
    var_9._id_AC68 = var_5;
    var_10 = spawn( "script_model", var_0.origin + ( 0, 0, 100 ) - var_8 * 200 );
    var_9._id_A63A = var_10;
    var_9._id_A63A setscriptmoverkillcam( "airstrike" );
    var_9._id_1AFE = var_6;
    var_10._id_10DFF = gettime();
    var_10 thread _id_51A6( 15.0 );
    var_10.angles = var_8;
    var_10 moveto( var_1 + ( 0, 0, 100 ), var_2, 0, 0 );
    wait 0.4;
    var_10 moveto( var_10.origin + var_8 * 4000, 1, 0, 0 );
    wait 0.45;
    var_10 moveto( var_10.origin + ( var_8 + ( 0, 0, -0.2 ) ) * 3500, 2, 0, 0 );
    wait 0.15;
    var_11 = spawn( "script_model", var_9.origin );
    var_11 setmodel( "tag_origin" );
    var_11.origin = var_9.origin;
    var_11.angles = var_9.angles;
    var_9 setmodel( "tag_origin" );
    wait 0.1;
    var_12 = var_11.origin;
    var_13 = var_11.angles;

    if ( level._id_10A56 )
        playfxontag( level._id_1AFD, var_11, "tag_origin" );
    else
        playfxontag( level._id_1AF7, var_11, "tag_origin" );

    wait 0.05;
    var_10 moveto( var_10.origin + ( var_8 + ( 0, 0, -0.25 ) ) * 2500, 2, 0, 0 );
    wait 0.25;
    var_10 moveto( var_10.origin + ( var_8 + ( 0, 0, -0.35 ) ) * 2000, 2, 0, 0 );
    wait 0.2;
    var_10 moveto( var_10.origin + ( var_8 + ( 0, 0, -0.45 ) ) * 1500, 2, 0, 0 );
    wait 0.5;

    if ( isdefined( var_7 ) )
        var_7 delete();

    var_14 = 12;
    var_15 = 5;
    var_16 = 55;
    var_17 = ( var_16 - var_15 ) / var_14;
    var_18 = ( 0, 0, 0 );

    for ( var_19 = 0; var_19 < var_14; var_19++ )
    {
        var_20 = anglestoforward( var_13 + ( var_16 - var_17 * var_19, randomint( 10 ) - 5, 0 ) );
        var_21 = var_12 + var_20 * 10000;
        var_22 = bullettrace( var_12, var_21, 0, undefined );
        var_23 = var_22["position"];
        var_18 += var_23;
        playfx( level._id_1AF6, var_23 );
        thread _id_B09E( var_23 + ( 0, 0, 16 ), 512, 200, 30, var_4, var_9, "artillery_mp" );

        if ( var_19 % 3 == 0 )
        {
            thread scripts\mp\utility\game::_id_D52A( "jackal_missile_impact", var_23 );
            level thread scripts\mp\shellshock::_id_1AF0( var_23 );
        }

        wait 0.05;
    }

    var_18 = var_18 / var_14 + ( 0, 0, 128 );
    var_10 moveto( var_9._id_A63A.origin * 0.35 + var_18 * 0.65, 1.5, 0, 0.5 );
    wait 5.0;
    var_11 delete();
    var_9 delete();
}

_id_10836( var_0, var_1 )
{
    var_2 = spawn( "script_model", var_0 );
    var_2.angles = var_1;
    var_2 setmodel( "projectile_cbu97_clusterbomb" );
    return var_2;
}

_id_3788( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 endon( "death" );
    wait( var_3 );

    if ( !isdefined( var_4 ) || var_4 scripts\mp\utility\game::_id_9E68() )
        return;

    var_5 = anglestoforward( var_0.angles );
    var_6 = spawn( "script_model", var_0.origin - ( 0, 0, 100 ) - var_5 * 200 );
    var_6 linkto( var_0 );
    var_0._id_A87B._id_A63A = var_6;
    wait 0.5;
    var_7 = 50;
    var_8 = ( 0, 0, 0 );
    var_9 = var_8;
    var_0._id_129B9 setscriptablepartstate( "fire", "start", 0 );
    var_0._id_A87B setscriptablepartstate( "beam impact", "active", 0 );
    var_10 = [ "explode1", "explode2", "explode3", "explode4", "explode5" ];
    var_11 = 0;

    for ( var_12 = 0; var_12 < var_7; var_12++ )
    {
        if ( !isdefined( var_4 ) )
            break;

        var_13 = scripts\engine\trace::_id_DCED( var_0._id_129B9 gettagorigin( "tag_flash" ), var_0._id_12A95.origin, level._id_3CB5, scripts\engine\trace::_id_48BC( 0, 1, 0, 1, 0, 1, 0 ) );
        var_14 = var_13["position"];
        var_8 = var_14 + ( 0, 0, 2 );
        var_0._id_A87B thread _id_BCA4( var_11, var_8, var_10 );
        var_0._id_129B9 shootturret();
        var_9 = var_8;

        if ( var_11 < 4 )
            var_11++;
        else
            var_11 = 0;

        wait 0.05;
    }

    var_0._id_129B9 setscriptablepartstate( "fire", "stop", 0 );
}

_id_BCA4( var_0, var_1, var_2 )
{
    self endon( "death" );
    self.origin = var_1;
    self setscriptablepartstate( var_2[var_0], "active", 0 );
    wait 0.1;
    self setscriptablepartstate( var_2[var_0], "neutral", 0 );
}

_id_511D( var_0, var_1 )
{
    wait( var_0 );
    self playloopsound( var_1 );
}

_id_D4BD( var_0, var_1, var_2 )
{
    var_3 = 100;

    if ( var_2 != ( 0, 0, 0 ) )
    {
        for ( var_4 = 0; var_4 < 3; var_4++ )
        {
            var_5 = vectornormalize( var_1 - var_2 );
            var_5 *= var_3;
            playfx( var_0, var_2 + var_5 );
            var_3 += 100;
        }

        playfx( var_0, var_1 );
    }
}

_id_51A6( var_0 )
{
    self endon( "death" );
    wait 10.0;
    self delete();
}

_id_D4FA()
{
    self endon( "death" );
    wait 0.5;
    playfxontag( level._id_7545, self, "tag_engine_right" );
    wait 0.5;
    playfxontag( level._id_7545, self, "tag_engine_left" );
    wait 0.5;
    playfxontag( level._id_7546, self, "tag_right_wingtip" );
    wait 0.5;
    playfxontag( level._id_7546, self, "tag_left_wingtip" );
}

callstrike_explosivebullets( var_0, var_1, var_2, var_3, var_4 )
{
    var_0 endon( "death" );
    wait( var_3 );

    if ( !isdefined( var_4 ) || var_4 scripts\mp\utility\game::_id_9E68() )
        return;

    var_5 = anglestoforward( var_0.angles );
    var_6 = spawn( "script_model", var_0.origin - ( 0, 0, 100 ) - var_5 * 200 );
    var_6 linkto( var_0 );
    var_0._id_A87B._id_A63A = var_6;
    wait 0.5;
    var_7 = 50;
    var_8 = ( 0, 0, 0 );
    var_9 = var_8;
    var_10 = [ "explode1", "explode2", "explode3", "explode4", "explode5" ];
    var_11 = 0;

    for ( var_12 = 0; var_12 < var_7; var_12++ )
    {
        if ( !isdefined( var_4 ) )
            break;

        var_13 = scripts\engine\trace::_id_DCED( var_0._id_129B9 gettagorigin( "tag_flash" ), var_0._id_12A95.origin, level._id_3CB5, scripts\engine\trace::_id_48BC( 0, 1, 0, 1, 0, 1, 0 ) );
        var_14 = var_13["position"];
        var_8 = var_14 + ( 0, 0, 2 );
        var_0._id_A87B thread _id_BCA4( var_11, var_8, var_10 );
        var_0._id_129B9 shootturret();
        var_9 = var_8;

        if ( var_11 < 4 )
            var_11++;
        else
            var_11 = 0;

        wait 0.1;
    }
}

_id_3785( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = undefined;
    var_8 = 0;
    var_9 = ( 0, var_3, 0 );
    var_7 = getent( "airstrikeheight", "targetname" );

    if ( var_4 == "stealth_airstrike" )
    {
        var_10 = 12000;
        var_11 = 4000;

        if ( !isdefined( var_7 ) )
        {
            var_12 = 950;
            var_8 = 1500;

            if ( isdefined( level._id_1AF8 ) )
                var_12 *= level._id_1AF8;
        }
        else
        {
            var_12 = var_7.origin[2];

            if ( getdvar( "mapname" ) == "mp_exchange" )
                var_12 += 1024;

            if ( getdvar( "mapname" ) == "mp_rally" )
                var_12 += 2500;

            var_8 = _id_7EA5( var_12 );
        }
    }
    else
    {
        var_10 = 24000;
        var_11 = 6500;

        if ( !isdefined( var_7 ) )
        {
            var_12 = 850;
            var_8 = 1500;

            if ( isdefined( level._id_1AF8 ) )
                var_12 *= level._id_1AF8;
        }
        else
        {
            var_12 = var_7.origin[2];

            if ( getdvar( "mapname" ) == "mp_rally" )
                var_12 += 2500;

            var_8 = _id_7EA5( var_12 );
        }
    }

    var_1 endon( "disconnect" );
    var_13 = var_0;
    level._id_1AF2 = [];
    level._id_1AF3 = 0;
    level._id_1AF4 = 0;

    if ( var_4 == "jackal" )
    {
        var_2 = var_1.origin;
        var_14 = _id_7EBE( var_2, var_9, var_10, var_7, var_12, var_11, var_8, var_4 );
        var_1 scripts\mp\killstreaks\jackal::_id_2A6B( var_0, var_14["startPoint"], var_2, var_6 );
    }
    else if ( var_4 == "precision_airstrike" )
    {
        var_14 = _id_7EBE( var_2, var_9, var_10, var_7, var_12, var_11, var_8, var_4 );
        var_15 = anglestoright( var_9 );

        if ( _id_0DC9::_id_A69F( var_6, "passive_precision_strike" ) )
        {
            level thread _id_5A60( var_0, var_1, var_13, var_2, var_14["startPoint"], var_14["endPoint"], var_14["bombTime"], var_14["flyTime"], var_9, var_4, var_5, var_6 );
            playloopsound( var_14["startPoint"], "ks_scorchers_init" );
            wait( randomfloatrange( 0.8, 1.0 ) );
            scripts\mp\hostmigration::waittillhostmigrationdone();
            level thread _id_5A60( var_0, var_1, var_13, var_2, var_14["startPoint"], var_14["endPoint"], var_14["bombTime"], var_14["flyTime"], var_9, var_4, var_5, var_6 );
            wait( randomfloatrange( 0.8, 1.0 ) );
            scripts\mp\hostmigration::waittillhostmigrationdone();
            level thread _id_5A60( var_0, var_1, var_13, var_2, var_14["startPoint"], var_14["endPoint"], var_14["bombTime"], var_14["flyTime"], var_9, var_4, var_5, var_6 );
            return;
        }

        if ( _id_0DC9::_id_A69F( var_6, "passive_split_strike" ) )
        {
            level thread _id_5A60( var_0, var_1, var_13, var_2, var_14["startPoint"], var_14["endPoint"], var_14["bombTime"], var_14["flyTime"], var_9, var_4, var_5, var_6 );
            playloopsound( var_14["startPoint"], "ks_scorchers_init" );
            return;
        }

        level thread _id_5A60( var_0, var_1, var_13, var_2, var_14["startPoint"], var_14["endPoint"], var_14["bombTime"], var_14["flyTime"], var_9, var_4, var_5, var_6 );
        playloopsound( var_14["startPoint"], "ks_scorchers_init" );
        wait( randomfloatrange( 0.5, 0.7 ) );
        scripts\mp\hostmigration::waittillhostmigrationdone();
        level thread _id_5A60( var_0, var_1, var_13, var_2, var_14["startPoint"] + var_15 * 175, var_14["endPoint"] + var_15 * 175, var_14["bombTime"], var_14["flyTime"], var_9, var_4, var_5, var_6 );
        wait( randomfloatrange( 0.5, 0.7 ) );
        scripts\mp\hostmigration::waittillhostmigrationdone();
        level thread _id_5A60( var_0, var_1, var_13, var_2, var_14["startPoint"] - var_15 * 175, var_14["endPoint"] - var_15 * 175, var_14["bombTime"], var_14["flyTime"], var_9, var_4, var_5, var_6 );
        return;
        return;
    }
    else
    {
        var_14 = _id_7EBE( var_2, var_9, var_10, var_7, var_12, var_11, var_8, var_4 );
        level thread _id_5A60( var_0, var_1, var_13, var_2, var_14["startPoint"] + ( 0, 0, randomint( 500 ) ), var_14["endPoint"] + ( 0, 0, randomint( 500 ) ), var_14["bombTime"], var_14["flyTime"], var_9, var_4, var_5, var_6 );
        wait( randomfloatrange( 1.5, 2.5 ) );
        scripts\mp\hostmigration::waittillhostmigrationdone();
        level thread _id_5A60( var_0, var_1, var_13, var_2, var_14["startPoint"] + ( 0, 0, randomint( 200 ) ), var_14["endPoint"] + ( 0, 0, randomint( 200 ) ), var_14["bombTime"], var_14["flyTime"], var_9, var_4, var_5, var_6 );
        wait( randomfloatrange( 1.5, 2.5 ) );
        scripts\mp\hostmigration::waittillhostmigrationdone();
        level thread _id_5A60( var_0, var_1, var_13, var_2, var_14["startPoint"] + ( 0, 0, randomint( 200 ) ), var_14["endPoint"] + ( 0, 0, randomint( 200 ) ), var_14["bombTime"], var_14["flyTime"], var_9, var_4, var_5, var_6 );

        if ( var_4 == "super_airstrike" )
        {
            wait( randomfloatrange( 2.5, 3.5 ) );
            scripts\mp\hostmigration::waittillhostmigrationdone();
            level thread _id_5A60( var_0, var_1, var_13, var_2, var_14["startPoint"] + ( 0, 0, randomint( 200 ) ), var_14["endPoint"] + ( 0, 0, randomint( 200 ) ), var_14["bombTime"], var_14["flyTime"], var_9, var_4, var_5, var_6 );
        }
    }
}

_id_7EBE( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = var_0 + anglestoforward( var_1 ) * ( -1 * var_2 );

    if ( isdefined( var_3 ) )
        var_8 *= ( 1, 1, 0 );

    var_8 += ( 0, 0, var_4 );
    var_9 = var_0 + anglestoforward( var_1 ) * var_2;

    if ( isdefined( var_3 ) )
        var_9 *= ( 1, 1, 0 );

    var_9 += ( 0, 0, var_4 );
    var_10 = length( var_8 - var_9 );
    var_11 = var_10 / var_5;
    var_10 = abs( var_10 / 2 + var_6 );
    var_12 = var_10 / var_5;
    var_13["startPoint"] = var_8;
    var_13["endPoint"] = var_9;
    var_13["bombTime"] = var_12;
    var_13["flyTime"] = var_11;
    return var_13;
}

_id_7EA5( var_0 )
{
    var_1 = 850;
    var_2 = 1500;
    var_3 = var_1 / var_0;
    var_4 = var_3 * var_2;
    return var_4;
}

_id_11561( var_0, var_1 )
{
    var_2 = _id_1156E( var_0, var_1 );

    if ( var_2 )
        var_3 = 1;
    else
        var_3 = -1;

    var_4 = scripts\engine\utility::_id_6EE3( var_0.origin );
    var_5 = var_4 + anglestoforward( scripts\engine\utility::_id_6EE1( var_0.angles ) ) * ( var_3 * 100000 );
    var_6 = pointonsegmentnearesttopoint( var_4, var_5, var_1 );
    var_7 = distance( var_4, var_6 );
    return var_7;
}

_id_1156D( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 3000;

    var_3 = _id_1156E( var_0, var_1 );

    if ( var_3 )
        var_4 = 1;
    else
        var_4 = -1;

    var_5 = scripts\engine\utility::_id_6EE3( var_0.origin );
    var_6 = var_5 + anglestoforward( scripts\engine\utility::_id_6EE1( var_0.angles ) ) * ( var_4 * 100000 );
    var_7 = pointonsegmentnearesttopoint( var_5, var_6, var_1 );
    var_8 = distance( var_5, var_7 );

    if ( var_8 < var_2 )
        return 1;
    else
        return 0;
}

_id_1156E( var_0, var_1 )
{
    var_2 = anglestoforward( scripts\engine\utility::_id_6EE1( var_0.angles ) );
    var_3 = vectornormalize( scripts\engine\utility::_id_6EE3( var_1 ) - var_0.origin );
    var_4 = vectordot( var_2, var_3 );

    if ( var_4 > 0 )
        return 1;
    else
        return 0;
}

_id_136A8()
{
    self waittill( "cancel_location" );
    self setblurforplayer( 0, 0.3 );
}

_id_F1AA( var_0, var_1, var_2 )
{
    var_3 = ( 0, 0, 0 );
    var_4 = undefined;
    var_5 = self.angles[1];
    var_6 = undefined;
    var_7 = undefined;

    if ( !isdefined( level._id_B339 ) )
        return;

    var_8 = level._id_B339 / 6.46875;

    if ( level._id_10A56 )
        var_8 *= 1.5;

    var_9 = spawn( "script_origin", self.origin );
    var_10 = "used_" + var_1;
    var_11 = _id_0AC7::getrarityforlootitem( var_2._id_1318B );

    if ( var_11 != "" )
        var_10 = var_10 + "_" + var_11;

    if ( var_1 == "precision_airstrike" )
    {
        var_12 = 1;
        var_7 = 1;

        if ( _id_0DC9::_id_A69F( var_2, "passive_split_strike" ) )
            var_12 = 3;

        scripts\engine\utility::_id_1C76( 0 );

        if ( self.team == "allies" )
            var_13 = "UN_";
        else
            var_13 = "PD_";

        self playlocalsound( "bombardment_killstreak_bootup" );
        var_9 playloopsound( "bombardment_killstreak_hud_loop" );
        self _meth_84D5( "mp_killstreak_overlay" );
        var_4 = _id_0DAC::_id_8112( var_1, var_12, 1 );
        scripts\engine\utility::_id_1C76( 1 );
    }
    else if ( var_1 == "jackal" && ( isdefined( level._id_A056 ) || level._id_A412.size > 1 ) )
    {
        self notify( "cancel_location" );
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );

        if ( isdefined( var_9 ) )
        {
            var_9 stoploopsound( "" );
            var_9 delete();
        }

        self _meth_84D6();
        return 0;
    }

    if ( isdefined( var_4 ) )
    {
        if ( scripts\mp\utility\game::istrue( level._id_1AF9 ) )
        {
            scripts\mp\hud_message::_id_10122( "KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
            return 0;
        }

        thread _id_6CDD( var_4, var_7, var_0, var_3, var_5, var_1, var_6, var_2 );
        self playlocalsound( "bombardment_killstreak_shutdown" );
        self _meth_84D6();
    }
    else if ( !isdefined( var_4 ) && scripts\mp\utility\game::_id_9E90( var_1 ) )
    {
        if ( isdefined( var_9 ) )
        {
            var_9 stoploopsound( "" );
            var_9 delete();
        }

        self playlocalsound( "bombardment_killstreak_shutdown" );
        self _meth_84D6();
        return 0;
    }
    else
    {
        if ( var_1 == "jackal" )
        {
            if ( scripts\mp\killstreaks\jackal::_id_8013( self ) >= 1 )
            {
                scripts\mp\hud_message::_id_10122( "KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );

                if ( isdefined( var_9 ) )
                {
                    var_9 stoploopsound( "" );
                    var_9 delete();
                }

                self _meth_84D6();
                return 0;
            }
        }

        _id_6CD3( var_0, var_3, var_5, var_1, var_6, var_2 );

        if ( var_1 == "jackal" && _id_0DC9::_id_A69F( var_2, "passive_support_drop" ) )
        {
            var_14 = scripts\engine\utility::_id_13734( "called_in_jackal", "cancel_jackal" );

            if ( !isdefined( var_14 ) || var_14 == "cancel_jackal" )
                return 0;
        }
    }

    if ( isdefined( var_9 ) )
    {
        var_9 stoploopsound( "" );
        var_9 delete();
    }

    thread scripts\mp\utility\game::_id_115DE( var_10, self );
    scripts\mp\matchdata::_id_AFC9( var_1, var_3 );
    return 1;
}

_id_6CDD( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "disconnect" );

    foreach ( var_10, var_9 in var_0 )
    {
        var_3 = var_9._id_AEC4;

        if ( scripts\mp\utility\game::istrue( var_1 ) )
            var_4 = var_9.angles;

        _id_6CD3( var_2, var_3, var_4, var_5, var_6, var_7 );

        if ( var_0.size > 1 && var_10 < var_0.size - 1 )
            wait( randomfloatrange( 0.8, 1.0 ) );
    }
}

_id_6CD3( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self notify( "used" );
    var_6 = bullettrace( level.mapcenter + ( 0, 0, 1000000.0 ), level.mapcenter, 0, undefined );
    var_1 = ( var_1[0], var_1[1], var_6["position"][2] - 514 );
    thread _id_57DD( var_0, var_1, var_2, self, self.pers["team"], var_3, var_4, var_5 );
}

_id_1303E( var_0, var_1, var_2 )
{

}

_id_8998( var_0 )
{
    self endon( "death" );

    if ( var_0 scripts\mp\killstreaks\emp_common::_id_9D29() )
    {
        self notify( "death" );
        return;
    }

    for (;;)
    {
        level waittill( "emp_update" );

        if ( !var_0 scripts\mp\killstreaks\emp_common::_id_9D29() )
            continue;

        self notify( "death" );
    }
}

_id_1AFB( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );

    switch ( var_0 )
    {
        case "precision_airstrike":
            self playlocalsound( game["voice"][self.team] + "KS_ast_inbound" );
            break;
    }
}

_id_1AFA( var_0, var_1, var_2, var_3 )
{
    var_4 = var_3 * 20;

    for ( var_5 = 0; var_5 < var_4; var_5++ )
        wait 0.05;
}

_id_11A82()
{
    self endon( "death" );
    var_0 = self.origin;

    for (;;)
    {
        thread _id_1AFA( var_0, self.origin, ( 0.5, 1, 0 ), 40 );
        var_0 = self.origin;
        wait 0.2;
    }
}

triggerjackalweapon( var_0 )
{
    if ( _id_0DC9::_id_A69F( var_0, "passive_support_drop" ) )
    {
        var_0._id_EF88 = "no_fire_weapon";
        var_0.weapon = "deploy_warden_mp";
    }

    return 1;
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_B3DA["smoke"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_B3DA["tracer"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_B3DA["explosion"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_B3E6["mortar"] = ::_id_5915;
    level._id_B3E6["smoke"] = ::_id_5AAF;
    level._id_B3E6["airstrike"] = ::_id_57DD;
    level._id_B3E6["pavelow"] = ::_id_5A5C;
}

_id_C56E()
{
    if ( level._id_D84D > 0 && level.teambased )
    {
        level._id_9918 = [];
        thread _id_FAC7( "allies" );
        thread _id_FAC7( "axis" );

        for (;;)
        {
            level waittill( "connected", var_0 );
            var_0 thread onplayerspawned();
        }
    }
}

onplayerspawned()
{
    self endon( "disconnect" );
    level endon( "prematch_over" );
    self waittill( "spawned_player" );
    _id_BBF2( self );
}

_id_7F8A()
{
    if ( isdefined( level.mapcenter ) )
        return level.mapcenter;

    var_0 = getspawnarray( "mp_tdm_spawn_allies_start" );
    var_1 = getspawnarray( "mp_tdm_spawn_axis_start" );

    if ( isdefined( var_0 ) && isdefined( var_0[0] ) && isdefined( var_1 ) && isdefined( var_1[0] ) )
    {
        var_2 = distance( var_0[0].origin, var_1[0].origin ) / 2;
        var_3 = vectortoangles( var_0[0].origin - var_1[0].origin );
        var_3 = vectornormalize( var_3 );
        return var_0[0].origin + var_3 * var_2;
    }

    return ( 0, 0, 0 );
}

_id_8168()
{
    var_0 = getspawnarray( "mp_tdm_spawn_allies_start" );
    var_1 = getspawnarray( "mp_tdm_spawn_axis_start" );

    if ( isdefined( var_0 ) && isdefined( var_0[0] ) && isdefined( var_1 ) && isdefined( var_1[0] ) )
    {
        var_2 = [];
        var_2["axis"] = var_1;
        var_2["allies"] = var_0;
        return var_2;
    }
    else
        return undefined;
}

_id_BBF2( var_0 )
{
    var_1 = var_0.team;
    var_2 = level._id_9918[var_1];

    if ( isdefined( var_2 ) && !var_2._id_5D3C && level._id_D84D > 0 )
    {
        var_3 = var_2._id_AD31.size % 6;
        var_4 = "tag_ride" + var_3;
        var_5 = var_2 gettagorigin( var_4 );
        var_0 setorigin( var_5 );

        if ( var_3 < 3 )
            var_0 setstance( "crouch" );

        var_0 setplayerangles( var_2 gettagangles( var_4 ) );
        var_0 _meth_823D( var_2, var_4, 1.0, 90, 90, 30, 60, 0 );
        var_2._id_AD31[var_2._id_AD31.size] = var_0;
        var_0 _meth_8441( "ges_hold" );
    }
}

_id_56A7( var_0 )
{
    var_0 _meth_8442();
    var_0 unlink();
}

_id_FAC7( var_0, var_1, var_2 )
{
    var_3 = undefined;

    for (;;)
    {
        level waittill( "player_spawned", var_4 );

        if ( scripts\mp\utility\game::_id_766C( "prematch_done" ) )
            return;

        if ( var_4.team == var_0 )
        {
            var_3 = var_4;
            break;
        }
    }

    var_5 = _id_8168();
    var_6 = 1200;
    var_7 = 1200;
    var_8 = 1000;
    var_9 = var_5[var_0][0];
    var_10 = undefined;

    if ( !isdefined( var_2 ) )
    {
        var_11 = anglestoforward( var_9.angles );
        var_12 = anglestoup( var_9.angles );
        var_13 = anglestoright( var_9.angles );
        var_10 = 300 * var_11 + var_6 * var_12 + 3200 * var_13;
        var_2 = var_9.origin + var_10;
    }
    else
        var_10 = var_9 - var_2;

    if ( !isdefined( var_1 ) )
        var_1 = "veh_mil_air_ca_dropship_mp";

    var_14 = spawnhelicopter( var_3, var_2, vectortoangles( var_10 ), "veh_jackal_mp", var_1 );

    if ( !isdefined( var_14 ) )
        return;

    level._id_9918[var_0] = var_14;
    var_14._id_5D3C = 0;
    var_14._id_AD31 = [];
    var_14 vehicle_setspeed( 50, 15 );
    var_14 setvehgoalpos( var_9.origin + ( 0, 0, var_7 / 2 ), 1 );
    var_14 waittill( "goal" );
    var_14 setyawspeed( 0, 1, 1 );
    var_14 setvehgoalpos( var_9.origin + ( 0, 0, var_7 / 8 ), 1 );
    var_14 waittill( "goal" );
    var_14._id_5D3C = 1;

    foreach ( var_4 in var_14._id_AD31 )
        _id_56A7( var_4 );

    wait 2;
    var_14 setyawspeed( 60, 40, 40, 0.3 );
    var_14 setvehgoalpos( var_9.origin + ( 0, 0, var_7 ), 1 );
    var_14 waittill( "goal" );
    var_14 vehicle_setspeed( 80, 60 );
    var_14 setvehgoalpos( var_9.origin + ( 0, 0, var_8 ) + var_10, 1 );
    var_14 waittill( "goal" );
    var_14 vehicle_setspeed( 120, 120 );
    var_14 setvehgoalpos( var_9.origin + 2 * var_10, 1 );
    var_14 waittill( "goal" );
    var_14 delete();
}

_id_5915()
{
    var_0 = _id_7F8A();
    var_1 = 1;

    for ( var_2 = 0; var_2 < 5; var_2++ )
    {
        var_3 = var_0 + ( randomintrange( 100, 600 ) * var_1, randomintrange( 100, 600 ) * var_1, 0 );
        var_4 = bullettrace( var_3 + ( 0, 0, 500 ), var_3 - ( 0, 0, 500 ), 0 );

        if ( isdefined( var_4["position"] ) )
        {
            playfx( level._id_B3DA["tracer"], var_3 );
            thread scripts\mp\utility\game::_id_D52A( "fast_artillery_round", var_3 );
            wait( randomfloatrange( 0.5, 1.5 ) );
            playfx( level._id_B3DA["explosion"], var_3 );
            playrumbleonentity( "grenade_rumble", var_3 );
            earthquake( 1.0, 0.6, var_3, 2000 );
            thread scripts\mp\utility\game::_id_D52A( "exp_suitcase_bomb_main", var_3 );
            physicsexplosionsphere( var_3 + ( 0, 0, 30 ), 250, 125, 2 );
            var_1 *= -1;
        }
    }
}

_id_5AAF()
{
    var_0 = _id_7F8A();
    var_1 = 1;

    for ( var_2 = 0; var_2 < 3; var_2++ )
    {
        var_3 = var_0 + ( randomintrange( 100, 600 ) * var_1, randomintrange( 100, 600 ) * var_1, 0 );
        playfx( level._id_B3DA["smoke"], var_3 );
        var_1 *= -1;
        wait 2;
    }
}

_id_57DD()
{
    level endon( "game_ended" );
    var_0 = 1;
    var_1 = _id_7F8A();

    for ( var_2 = 0; var_2 < 3; var_2++ )
    {
        var_3 = var_1 + ( randomintrange( 100, 600 ) * var_0, randomintrange( 100, 600 ) * var_0, 0 );
        var_4 = bullettrace( var_3 + ( 0, 0, 500 ), var_3 - ( 0, 0, 500 ), 0 );

        if ( isdefined( var_4["position"] ) )
        {
            thread _id_57DE( var_4["position"] );
            var_0 *= -1;
            wait( randomintrange( 2, 4 ) );
        }
    }
}

_id_57DE( var_0 )
{
    var_1 = randomint( level._id_108FB.size - 1 );
    var_2 = level._id_108FB[var_1].origin * ( 1, 1, 0 );
    var_3 = 8000;
    var_4 = 8000;
    var_5 = getent( "airstrikeheight", "targetname" );
    var_6 = ( 0, 0, var_5.origin[2] + randomintrange( -100, 600 ) );
    var_7 = anglestoforward( ( 0, randomint( 45 ), 0 ) );
    var_8 = var_2 + var_6 + var_7 * var_3 * -1;
    var_9 = var_2 + var_6 + var_7 * var_4;
    var_10 = var_8 + ( randomintrange( 400, 500 ), randomintrange( 400, 500 ), randomintrange( 200, 300 ) );
    var_11 = var_9 + ( randomintrange( 400, 500 ), randomintrange( 400, 500 ), randomintrange( 200, 300 ) );
    var_12 = spawnplane( self, "script_model", var_8 );
    var_13 = spawnplane( self, "script_model", var_10 );

    if ( scripts\engine\utility::_id_4347() )
    {
        var_12 setmodel( "vehicle_av8b_harrier_jet_mp" );
        var_13 setmodel( "vehicle_av8b_harrier_jet_mp" );
    }
    else
    {
        var_12 setmodel( "vehicle_av8b_harrier_jet_opfor_mp" );
        var_13 setmodel( "vehicle_av8b_harrier_jet_opfor_mp" );
    }

    var_12.angles = vectortoangles( var_9 - var_8 );
    var_12 playloopsound( "veh_mig29_dist_loop" );
    var_12 thread _id_D4FA();
    var_13.angles = vectortoangles( var_9 - var_10 );
    var_13 playloopsound( "veh_mig29_dist_loop" );
    var_13 thread _id_D4FA();
    var_14 = distance( var_8, var_9 );
    var_12 moveto( var_9 * 2, var_14 / 2000, 0, 0 );
    wait( randomfloatrange( 0.25, 0.5 ) );
    var_13 moveto( var_11 * 2, var_14 / 2000, 0, 0 );
    wait( var_14 / 2000 );
    var_12 delete();
    var_13 delete();
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

_id_5A5C()
{
    var_0 = _id_7F8A();
    var_1 = bullettrace( var_0 + ( 0, 0, 500 ), var_0 - ( 0, 0, 500 ), 0 );

    if ( isdefined( var_1["position"] ) )
    {
        if ( scripts\engine\utility::_id_4347() )
            var_2 = "vehicle_pavelow";
        else
            var_2 = "vehicle_pavelow_opfor";

        var_3 = spawnhelicopter( self, var_1["position"] + ( 0, 0, 1000 ), ( 0, 0, 0 ), "pavelow_mp", var_2 );

        if ( !isdefined( var_3 ) )
            return;

        var_3.team = self.pers["team"];
        var_3._id_8DA0 = level._id_8DA1[var_2];
        var_3 thread [[ level._id_ACB5[level._id_8DA1[var_2]] ]]();
        var_3._id_13F0A = ( 0, 0, var_3 gettagorigin( "tag_origin" )[2] - var_3 gettagorigin( "tag_ground" )[2] );
        wait 1;
        playfxontag( level._id_3F19["damage"]["on_fire"], var_3, "tag_engine_left" );
        var_3 thread scripts\mp\killstreaks\helicopter::_id_8D33();
    }
}

_id_5A59()
{
    var_0 = _id_8168();

    if ( isdefined( var_0 ) )
    {
        var_1 = 200;
        var_2 = 200;
        var_3 = 1000;
        var_4 = anglestoforward( var_0["allies"][0].angles ) * 300;
        var_5 = anglestoup( var_0["allies"][0].angles ) * var_1;
        var_6 = var_0["allies"][0].origin + var_4 + var_5;
        var_7 = spawnhelicopter( self, var_6, var_0["allies"][0].angles, "osprey_minigun_mp", "vehicle_v22_osprey_body_mp" );

        if ( !isdefined( var_7 ) )
            return;

        var_8 = anglestoforward( var_0["axis"][0].angles ) * 300;
        var_9 = anglestoup( var_0["axis"][0].angles ) * var_1;
        var_10 = var_0["axis"][0].origin + var_8 + var_9;
        var_11 = spawnhelicopter( self, var_10, var_0["axis"][0].angles, "osprey_minigun_mp", "vehicle_v22_osprey_body_mp" );

        if ( !isdefined( var_11 ) )
        {
            var_7 delete();
            return;
        }

        var_7 thread scripts\mp\killstreaks\escort_airdrop::_id_1AEE();
        var_11 thread scripts\mp\killstreaks\escort_airdrop::_id_1AEE();
        var_7 thread scripts\mp\killstreaks\escort_airdrop::_id_1AEB();
        var_11 thread scripts\mp\killstreaks\escort_airdrop::_id_1AEB();
        var_7 vehicle_setspeed( 20, 10 );
        var_7 setyawspeed( 3, 3, 3, 0.3 );
        var_7 setvehgoalpos( var_6 + ( 0, 0, var_2 ), 1 );
        var_11 vehicle_setspeed( 20, 10 );
        var_11 setyawspeed( 3, 3, 3, 0.3 );
        var_11 setvehgoalpos( var_10 + ( 0, 0, var_2 ), 1 );
        var_7 waittill( "goal" );
        var_7 thread scripts\mp\killstreaks\escort_airdrop::_id_1AEC();
        var_11 thread scripts\mp\killstreaks\escort_airdrop::_id_1AEC();
        wait 2;
        var_7 vehicle_setspeed( 80, 60 );
        var_7 setyawspeed( 30, 15, 15, 0.3 );
        var_7 setvehgoalpos( var_6 + ( 0, 0, var_3 ), 1 );
        var_11 vehicle_setspeed( 80, 60 );
        var_11 setyawspeed( 30, 15, 15, 0.3 );
        var_11 setvehgoalpos( var_10 + ( 0, 0, var_3 ), 1 );
        var_7 waittill( "goal" );
        var_7 thread scripts\mp\killstreaks\escort_airdrop::_id_1AED();
        var_11 thread scripts\mp\killstreaks\escort_airdrop::_id_1AED();
        var_7 vehicle_setspeed( 120, 120 );
        var_7 setyawspeed( 100, 100, 40, 0.3 );
        var_7 setvehgoalpos( var_6 + ( 0, 0, var_3 ) + var_4 * -20, 1 );
        var_11 vehicle_setspeed( 120, 120 );
        var_11 setyawspeed( 100, 100, 40, 0.3 );
        var_11 setvehgoalpos( var_10 + ( 0, 0, var_3 ) + var_8 * -20, 1 );
        var_7 waittill( "goal" );
        var_7 delete();
        var_11 delete();
    }
}

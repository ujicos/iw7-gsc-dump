// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    var_0 = spawnstruct();
    var_0._id_B923 = [];
    var_0._id_B923["allies"] = "veh_mil_air_ca_jackal_drone_atmos_periph_mp";
    var_0._id_B923["axis"] = "veh_mil_air_ca_jackal_drone_atmos_periph_mp";
    var_0._id_93B9 = "veh_mig29_dist_loop";
    var_0._id_4464 = "compass_objpoint_airstrike_friendly";
    var_0._id_4463 = "compass_objpoint_airstrike_busy";
    var_0._id_02B3 = 4000;
    var_0._id_8863 = 20000;
    var_0._id_5715 = 4000;
    var_0._id_8D13 = 250;
    var_0._id_C23A = 3;
    var_0._id_C74F = "airstrike_mp_roll";
    var_0._id_10407 = "veh_mig29_sonic_boom";
    var_0._id_C4C6 = ::_id_24D8;
    var_0._id_C52E = ::_id_40F7;
    var_0._id_EC44 = "destroyed_air_superiority";
    var_0._id_3774 = "callout_destroyed_air_superiority";
    var_0._id_13523 = undefined;
    var_0._id_A640 = ( -800, 0, 200 );
    level._id_CC43["air_superiority"] = var_0;
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "air_superiority", ::_id_C5BB );
    level._id_115C0["axis"] = 0;
    level._id_115C0["allies"] = 0;
}

_id_C5BB( var_0 )
{
    var_1 = scripts\mp\utility\game::_id_8027( self.team );

    if ( level.teambased && level._id_115C0[var_1] || !level.teambased && isdefined( level._id_1A94 ) && level._id_1A94 == self )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }
    else
    {
        thread _id_5AB7( var_0._id_AC68, "air_superiority" );
        scripts\mp\matchdata::_id_AFC9( "air_superiority", self.origin );
        thread scripts\mp\utility\game::_id_115DE( "used_air_superiority", self );
        return 1;
    }
}

_id_5AB7( var_0, var_1 )
{
    var_2 = level._id_CC43[var_1];
    var_3 = scripts\mp\killstreaks\plane::_id_8069( var_2._id_5715 );
    wait 1;
    var_4 = scripts\mp\utility\game::_id_8027( self.team );
    level._id_115C0[var_4] = 1;
    level._id_1A94 = self;
    _id_5976( var_1, var_0, var_3._id_1157A, var_3._id_6F25, var_3.height );
    self waittill( "aa_flyby_complete" );
    wait 2;
    scripts\mp\hostmigration::waittillhostmigrationdone();

    if ( isdefined( self ) )
    {
        _id_5976( var_1, var_0, var_3._id_1157A, -1 * var_3._id_6F25, var_3.height );
        self waittill( "aa_flyby_complete" );
    }

    level._id_115C0[var_4] = 0;
    level._id_1A94 = undefined;
}

_id_5976( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = level._id_CC43[var_0];
    var_6 = scripts\mp\killstreaks\plane::_id_7EBE( var_2, var_3, var_5._id_8863, 1, var_4, var_5._id_02B3, -0.5 * var_5._id_8863, var_0 );
    level thread scripts\mp\killstreaks\plane::_id_5857( var_1, self, var_1, var_6["startPoint"] + ( 0, 0, randomint( var_5._id_8D13 ) ), var_6["endPoint"] + ( 0, 0, randomint( var_5._id_8D13 ) ), var_6["attackTime"], var_6["flyTime"], var_3, var_0 );
}

_id_24D8( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    self.owner endon( "killstreak_disowned" );
    level endon( "game_ended" );
    wait( var_2 );
    var_5 = _id_6CAA( self.owner, self.team );
    var_6 = level._id_CC43[var_4];
    var_7 = var_6._id_C23A;

    for ( var_8 = var_5.size - 1; var_8 >= 0 && var_7 > 0; var_8-- )
    {
        var_9 = var_5[var_8];

        if ( isdefined( var_9 ) && isalive( var_9 ) )
        {
            _id_6D58( var_9 );
            var_7--;
            wait 1;
        }
    }
}

_id_40F7( var_0, var_1, var_2 )
{
    var_0 notify( "aa_flyby_complete" );
}

_id_6CC8( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_3 )
        {
            if ( [[ var_2 ]]( var_0, var_1, var_6 ) )
                var_4._id_1157E[var_4._id_1157E.size] = var_6;
        }
    }

    return var_4;
}

_id_6CAA( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_1157E = [];
    var_3 = undefined;

    if ( level.teambased )
        var_3 = scripts\mp\utility\game::_id_9FE7;
    else
        var_3 = scripts\mp\utility\game::_id_9FD8;

    var_4 = undefined;

    if ( isdefined( var_1 ) )
        var_4 = scripts\mp\utility\game::_id_8027( var_1 );

    _id_6CC8( var_0, var_4, var_3, level._id_8D79, var_2 );

    if ( isdefined( level._id_AAC8 ) )
    {
        if ( [[ var_3 ]]( var_0, var_4, level._id_AAC8 ) )
            var_2._id_1157E[var_2._id_1157E.size] = level._id_AAC8;
    }

    _id_6CC8( var_0, var_4, var_3, level._id_CC46, var_2 );
    _id_6CC8( var_0, var_4, var_3, level._id_AD8B, var_2 );
    _id_6CC8( var_0, var_4, var_3, level._id_8DD3, var_2 );
    return var_2._id_1157E;
}

_id_6D58( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_1 = undefined;

    if ( isdefined( self.owner ) )
        var_1 = self.owner;

    var_2 = 384 * anglestoforward( self.angles );
    var_3 = self gettagorigin( "tag_missile_1" ) + var_2;
    var_4 = scripts\mp\utility\game::_id_1309( "aamissile_projectile_mp", var_3, var_3 + var_2, var_1 );
    var_4._id_131D8 = self;
    var_3 = self gettagorigin( "tag_missile_2" ) + var_2;
    var_5 = scripts\mp\utility\game::_id_1309( "aamissile_projectile_mp", var_3, var_3 + var_2, var_1 );
    var_5._id_131D8 = self;
    var_6 = [ var_4, var_5 ];
    var_0 notify( "targeted_by_incoming_missile", var_6 );
    thread _id_10DC4( var_0, 0.25, var_6 );
}

_id_10DC4( var_0, var_1, var_2 )
{
    wait( var_1 );

    if ( isdefined( var_0 ) )
    {
        var_3 = undefined;

        if ( var_0._id_01F1 != "vehicle_av8b_harrier_jet_mp" )
            var_3 = var_0 gettagorigin( "tag_missile_target" );

        if ( !isdefined( var_3 ) )
            var_3 = var_0 gettagorigin( "tag_body" );

        var_4 = var_3 - var_0.origin;

        foreach ( var_6 in var_2 )
        {
            if ( isvalidmissile( var_6 ) )
            {
                var_6 _meth_8206( var_0, var_4 );
                var_6 _meth_8204();
            }
        }
    }
}

_id_52CA( var_0, var_1 )
{
    scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, "aamissile_projectile_mp", level._id_8DD3 );
    scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, "aamissile_projectile_mp", level._id_AD8B );
    scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, "aamissile_projectile_mp", level._id_8D79 );

    if ( isdefined( level._id_AAC8 ) )
    {
        var_2 = [];
        var_2[0] = level._id_AAC8;
        scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, "aamissile_projectile_mp", var_2 );
    }

    scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, "aamissile_projectile_mp", level._id_DF74 );
    scripts\mp\killstreaks\killstreaks::_id_532A( var_0, var_1, "aamissile_projectile_mp", level._id_CC46 );
}

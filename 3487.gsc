// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    var_0 = getentarray( "heli_start", "targetname" );
    var_1 = getentarray( "heli_loop_start", "targetname" );

    if ( !var_0.size && !var_1.size )
        return;

    level._id_3F14 = undefined;
    level._id_8D96 = getentarray( "heli_start", "targetname" );
    level._id_8D6F = getentarray( "heli_loop_start", "targetname" );
    level._id_110D1 = scripts\engine\utility::_id_8180( "strafe_path", "targetname" );
    level._id_8D67 = getentarray( "heli_leave", "targetname" );
    level._id_8D3E = getentarray( "heli_crash_start", "targetname" );
    level._id_8D75 = 5;
    level._id_8D73 = 2000;
    level._id_8D43 = 0;
    level._id_8D9A = 0.5;
    level._id_8D9F = 1.5;
    level._id_8D9E = 60;
    level._id_8DA2 = 3700;
    level._id_8D98 = 5;
    level._id_8D97 = 0.5;
    level._id_8D74 = 256;
    level._id_8D76 = 0.3;
    level._id_8D2C = 0.3;
    level._id_8D2E = 1000;
    level._id_8D2D = 4096;
    level._id_8D2B = 90;
    level._id_8D56 = 0;
    level _id_D80F();
    level._id_3F19["damage"]["light_smoke"] = loadfx( "vfx/core/smktrail/smoke_trail_white_heli_emitter" );
    level._id_3F19["damage"]["heavy_smoke"] = loadfx( "vfx/core/mp/killstreaks/vfx_helo_damage.vfx" );
    level._id_3F19["damage"]["on_fire"] = loadfx( "vfx/core/expl/fire_smoke_trail_l_emitter" );
    level._id_3F19["light"]["left"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_3F19["light"]["right"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_3F19["light"]["belly"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_3F19["light"]["tail"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_3F19["explode"]["medium"] = loadfx( "vfx/core/expl/aerial_explosion" );
    level._id_3F19["explode"]["large"] = loadfx( "vfx/core/expl/helicopter_explosion_secondary_small" );
    level._id_3F19["smoke"]["trail"] = loadfx( "vfx/core/smktrail/smoke_trail_white_heli" );
    level._id_3F19["explode"]["death"] = [];
    level._id_3F19["explode"]["death"]["apache"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_3F19["explode"]["air_death"]["apache"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_ACB5["apache"] = ::_id_503F;
    level._id_ACB5["cobra"] = ::_id_503F;
    level._id_3F19["explode"]["death"]["littlebird"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_3F19["explode"]["air_death"]["littlebird"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_ACB5["littlebird"] = ::_id_503F;
    level._effect["vehicle_flares"] = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_warden_em_flares.vfx" );
    level._id_3F19["fire"]["trail"]["medium"] = loadfx( "vfx/core/expl/fire_smoke_trail_l_emitter" );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "helicopter", ::_id_13090 );
    level._id_8DB6["tracking"][0] = "ac130_fco_moreenemy";
    level._id_8DB6["tracking"][1] = "ac130_fco_getthatguy";
    level._id_8DB6["tracking"][2] = "ac130_fco_guyrunnin";
    level._id_8DB6["tracking"][3] = "ac130_fco_gotarunner";
    level._id_8DB6["tracking"][4] = "ac130_fco_personnelthere";
    level._id_8DB6["tracking"][5] = "ac130_fco_rightthere";
    level._id_8DB6["tracking"][6] = "ac130_fco_tracking";
    level._id_8DB6["locked"][0] = "ac130_fco_lightemup";
    level._id_8DB6["locked"][1] = "ac130_fco_takehimout";
    level._id_8DB6["locked"][2] = "ac130_fco_nailthoseguys";
    level._id_A99A = 0;
    level._id_8DA6 = [];
    var_2 = spawnstruct();
    var_2._id_EC44 = "destroyed_helicopter";
    var_2._id_3774 = "callout_destroyed_helicopter";
    var_2._id_EB11 = 0.09;
    var_2._id_65D0 = "tag_engine_left";
    level._id_8DA6["helicopter"] = var_2;
    var_2 = spawnstruct();
    var_2._id_EC44 = "destroyed_little_bird";
    var_2._id_3774 = "callout_destroyed_little_bird";
    var_2._id_EB11 = 0.09;
    var_2._id_65D0 = "tag_engine_left";
    level._id_8DA6["airdrop"] = var_2;
    var_2 = spawnstruct();
    var_2._id_EC44 = "destroyed_dronedrop";
    var_2._id_52DA = "dronedrop_destroyed";
    var_2._id_3774 = "callout_destroyed_dronedrop";
    level._id_8DA6["dronedrop"] = var_2;
    var_2 = spawnstruct();
    var_2._id_EC44 = "destroyed_pavelow";
    var_2._id_3774 = "callout_destroyed_helicopter_flares";
    var_2._id_EB11 = 0.07;
    var_2._id_65D0 = "tag_engine_left";
    level._id_8DA6["flares"] = var_2;
    scripts\mp\utility\game::_id_DB8D( "helicopter" );
}

_id_B2A8( var_0, var_1, var_2 )
{
    level._id_3F19["explode"]["death"][var_0] = loadfx( var_1 );
    level._id_ACB5[var_0] = var_2;
}

_id_179D( var_0, var_1 )
{
    level._id_3F19["explode"]["air_death"][var_0] = loadfx( var_1 );
}

_id_503F()
{
    playfxontag( level._id_3F19["light"]["left"], self, "tag_light_L_wing" );
    wait 0.05;
    playfxontag( level._id_3F19["light"]["right"], self, "tag_light_R_wing" );
    wait 0.05;
    playfxontag( level._id_3F19["light"]["belly"], self, "tag_light_belly" );
    wait 0.05;
    playfxontag( level._id_3F19["light"]["tail"], self, "tag_light_tail" );
}

_id_13090( var_0, var_1 )
{
    return _id_128E6( var_0, "helicopter" );
}

_id_128E6( var_0, var_1 )
{
    var_2 = 1;

    if ( isdefined( level._id_3F14 ) )
        var_3 = 1;
    else
        var_3 = 0;

    if ( isdefined( level._id_3F14 ) && var_3 )
    {
        self iprintlnbold( &"KILLSTREAKS_HELI_IN_QUEUE" );

        if ( isdefined( var_1 ) && var_1 != "helicopter" )
            var_4 = "helicopter_" + var_1;
        else
            var_4 = "helicopter";

        var_5 = spawn( "script_origin", ( 0, 0, 0 ) );
        var_5 hide();
        var_5 thread _id_51C2( self, "disconnect" );
        var_5.player = self;
        var_5._id_AC68 = var_0;
        var_5.helitype = var_1;
        var_5._id_110EA = var_4;
        scripts\mp\utility\game::_id_DB8B( "helicopter", var_5 );
        var_6 = undefined;

        if ( !self hasweapon( scripts\engine\utility::_id_7F62() ) )
            var_6 = _id_0DC9::_id_7EB7();
        else
            var_6 = scripts\engine\utility::_id_7F62();

        var_7 = scripts\mp\utility\game::_id_7F55( "helicopter" );
        return 0;
    }
    else if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + var_2 >= scripts\mp\utility\game::_id_B4D2() )
    {
        self iprintlnbold( &"KILLSTREAKS_TOO_MANY_VEHICLES" );
        return 0;
    }

    var_2 = 1;
    _id_10DA2( var_0, var_1 );
    return 1;
}

_id_51C2( var_0, var_1 )
{
    self endon( "death" );
    var_0 waittill( var_1 );
    self delete();
}

_id_10DA2( var_0, var_1 )
{
    scripts\mp\utility\game::_id_93FA();
    var_2 = undefined;

    if ( !isdefined( var_1 ) )
        var_1 = "";

    var_3 = "helicopter";
    var_4 = self.pers["team"];
    var_2 = level._id_8D96[randomint( level._id_8D96.size )];
    scripts\mp\matchdata::_id_AFC9( var_3, self.origin );
    thread _id_8D9B( var_0, self, var_2, self.pers["team"], var_1 );
}

_id_D80F()
{
    level._id_8D8A["allies"]["hit"] = "cobra_helicopter_hit";
    level._id_8D8A["allies"]["hitsecondary"] = "cobra_helicopter_secondary_exp";
    level._id_8D8A["allies"]["damaged"] = "cobra_helicopter_damaged";
    level._id_8D8A["allies"]["spinloop"] = "cobra_helicopter_dying_loop";
    level._id_8D8A["allies"]["spinstart"] = "cobra_helicopter_dying_layer";
    level._id_8D8A["allies"]["crash"] = "exp_helicopter_fuel";
    level._id_8D8A["allies"]["missilefire"] = "weap_cobra_missile_fire";
    level._id_8D8A["axis"]["hit"] = "cobra_helicopter_hit";
    level._id_8D8A["axis"]["hitsecondary"] = "cobra_helicopter_secondary_exp";
    level._id_8D8A["axis"]["damaged"] = "cobra_helicopter_damaged";
    level._id_8D8A["axis"]["spinloop"] = "cobra_helicopter_dying_loop";
    level._id_8D8A["axis"]["spinstart"] = "cobra_helicopter_dying_layer";
    level._id_8D8A["axis"]["crash"] = "exp_helicopter_fuel";
    level._id_8D8A["axis"]["missilefire"] = "weap_cobra_missile_fire";
}

_id_8D5C()
{
    var_0 = self.team;

    if ( level._id_BDCC )
        var_0 = "axis";

    return var_0;
}

_id_1072E( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnhelicopter( var_0, var_1, var_2, var_3, var_4 );

    if ( !isdefined( var_5 ) )
        return undefined;

    if ( var_4 == "vehicle_battle_hind" )
        var_5._id_8DA0 = "cobra";
    else
        var_5._id_8DA0 = level._id_8DA1[var_4];

    var_5 thread [[ level._id_ACB5[var_5._id_8DA0] ]]();
    var_5 _id_184E();
    var_5._id_13F0A = ( 0, 0, var_5 gettagorigin( "tag_origin" )[2] - var_5 gettagorigin( "tag_ground" )[2] );
    var_5._id_2550 = missile_createattractorent( var_5, level._id_8D2E, level._id_8D2D );
    return var_5;
}

_id_8DB6( var_0 )
{
    if ( gettime() - level._id_A99A < 6000 )
        return;

    level._id_A99A = gettime();
    var_1 = randomint( level._id_8DB6[var_0].size );
    var_2 = level._id_8DB6[var_0][var_1];
    var_3 = scripts\mp\teams::_id_81BC( self.team ) + var_2;
    self playlocalsound( var_3 );
}

_id_12E60( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_3._id_1314F = [];
        var_3._id_C056 = 0;
    }

    foreach ( var_6 in level.players )
    {
        if ( !isalive( var_6 ) )
            continue;

        if ( var_6.team == self.team )
            continue;

        foreach ( var_3 in var_0 )
        {
            if ( distancesquared( var_6.origin, var_3.origin ) > 1048576 )
                continue;

            var_3._id_1314F[var_3._id_1314F.size] = var_6;
        }
    }

    var_10 = var_0[0];

    foreach ( var_3 in var_0 )
    {
        var_12 = getent( var_3._id_0334, "targetname" );

        foreach ( var_6 in var_3._id_1314F )
        {
            var_3._id_C056 += 1;

            if ( bullettracepassed( var_6.origin + ( 0, 0, 32 ), var_12.origin, 0, var_6 ) )
                var_3._id_C056 += 3;
        }

        if ( var_3._id_C056 > var_10._id_C056 )
            var_10 = var_3;
    }

    return getent( var_10._id_0334, "targetname" );
}

_id_8D9B( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_2.origin;
    var_6 = var_2.angles;
    var_7 = "cobra_mp";
    var_8 = "vehicle_battle_hind";
    var_9 = _id_1072E( var_1, var_5, var_6, var_7, var_8 );

    if ( !isdefined( var_9 ) )
        return;

    level._id_3F14 = var_9;

    if ( var_3 == "allies" )
        level._id_1C29 = var_9;
    else
        level._id_26F5 = var_9;

    var_9.helitype = var_4;
    var_9._id_AC68 = var_0;
    var_9.team = var_3;
    var_9.pers["team"] = var_3;
    var_9.owner = var_1;
    var_9 _meth_831F( var_1 );
    var_9._id_10DCD = var_2;
    var_9.maxhealth = level._id_8D73;
    var_9._id_11568 = level._id_8D9A;
    var_9._id_D8DF = undefined;
    var_9._id_F0C3 = undefined;
    var_9.attacker = undefined;
    var_9._id_4C07 = "ok";
    var_9 scripts\mp\sentientpoolmanager::registersentient( "Killstreak_Air", var_1 );
    var_9._id_61A3 = 0;

    if ( var_4 == "flares" || var_4 == "minigun" )
        var_9 thread _id_0D9B::_id_6EAD( 1 );

    var_9 thread _id_8D69( var_1 );
    var_9 thread _id_8D68( var_1 );
    var_9 thread _id_8D6A( var_1 );
    var_9 thread _id_8D40( var_4 );
    var_9 thread _id_8DA5();
    var_9 thread _id_8DA4();
    var_9 thread _id_8D49();
    var_9 endon( "helicopter_done" );
    var_9 endon( "crashing" );
    var_9 endon( "leaving" );
    var_9 endon( "death" );
    var_10 = getentarray( "heli_attack_area", "targetname" );
    var_11 = undefined;
    var_11 = level._id_8D6F[randomint( level._id_8D6F.size )];
    var_9 _id_8D53( var_2 );
    var_9 thread _id_8D99();
    var_9 thread _id_8D6D( 60.0 );
    var_9 thread _id_8D52( var_11 );
}

_id_8D49()
{
    var_0 = self getentitynumber();
    scripts\engine\utility::waittill_any( "death", "crashing", "leaving" );
    _id_E109( var_0 );
    self notify( "helicopter_done" );
    self notify( "helicopter_removed" );
    var_1 = undefined;
    var_2 = scripts\mp\utility\game::_id_DB94( "helicopter" );

    if ( !isdefined( var_2 ) )
        level._id_3F14 = undefined;
    else
    {
        var_1 = var_2.player;
        var_3 = var_2._id_AC68;
        var_4 = var_2._id_110EA;
        var_5 = var_2.helitype;
        var_2 delete();

        if ( isdefined( var_1 ) && ( var_1.sessionstate == "playing" || var_1.sessionstate == "dead" ) )
        {
            var_1 _id_10DA2( var_3, var_5 );
            return;
        }

        level._id_3F14 = undefined;
    }
}

_id_8D99()
{
    self notify( "heli_targeting" );
    self endon( "heli_targeting" );
    self endon( "death" );
    self endon( "helicopter_done" );

    for (;;)
    {
        var_0 = [];
        self._id_D8DF = undefined;
        self._id_F0C3 = undefined;

        foreach ( var_2 in level._id_3CB5 )
        {
            wait 0.05;

            if ( !_id_3922( var_2 ) )
                continue;

            var_0[var_0.size] = var_2;
        }

        if ( var_0.size )
        {
            for ( var_4 = _id_7E00( var_0 ); !isdefined( var_4 ); var_4 = _id_7E00( var_0 ) )
                wait 0.05;

            self._id_D8DF = var_4;
            self notify( "primary acquired" );
        }

        if ( isdefined( self._id_D8DF ) )
        {
            _id_6D7A( self._id_D8DF );
            continue;
        }

        wait 0.25;
    }
}

_id_3922( var_0 )
{
    var_1 = 1;

    if ( !isalive( var_0 ) || isdefined( var_0.sessionstate ) && var_0.sessionstate != "playing" )
        return 0;

    if ( self.helitype == "remote_mortar" )
    {
        if ( var_0 sightconetrace( self.origin, self ) < 1 )
            return 0;
    }

    if ( distance( var_0.origin, self.origin ) > level._id_8DA2 )
        return 0;

    if ( !self.owner scripts\mp\utility\game::isenemy( var_0 ) )
        return 0;

    if ( isdefined( var_0._id_10916 ) && ( gettime() - var_0._id_10916 ) / 1000 <= 5 )
        return 0;

    if ( var_0 scripts\mp\utility\game::_id_12D6( "specialty_blindeye" ) )
        return 0;

    var_2 = self.origin + ( 0, 0, -160 );
    var_3 = anglestoforward( self.angles );
    var_4 = var_2 + 144 * var_3;

    if ( var_0 sightconetrace( var_4, self ) < level._id_8D97 )
        return 0;

    return var_1;
}

_id_7E00( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        _id_12E10( var_2 );
    }

    var_4 = 0;
    var_5 = undefined;
    var_6 = getentarray( "minimap_corner", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        if ( var_6.size == 2 )
        {
            var_8 = var_6[0].origin;
            var_9 = var_6[0].origin;

            if ( var_6[1].origin[0] > var_9[0] )
                var_9 = ( var_6[1].origin[0], var_9[1], var_9[2] );
            else
                var_8 = ( var_6[1].origin[0], var_8[1], var_8[2] );

            if ( var_6[1].origin[1] > var_9[1] )
                var_9 = ( var_9[0], var_6[1].origin[1], var_9[2] );
            else
                var_8 = ( var_8[0], var_6[1].origin[1], var_8[2] );

            if ( var_2.origin[0] < var_8[0] || var_2.origin[0] > var_9[0] || var_2.origin[1] < var_8[1] || var_2.origin[1] > var_9[1] )
                continue;
        }

        if ( var_2._id_117E9 < var_4 )
            continue;

        if ( !bullettracepassed( var_2.origin + ( 0, 0, 32 ), self.origin, 0, self ) )
        {
            wait 0.05;
            continue;
        }

        var_4 = var_2._id_117E9;
        var_5 = var_2;
    }

    return var_5;
}

_id_12E10( var_0 )
{
    var_0._id_117E9 = 0;
    var_1 = distance( var_0.origin, self.origin );
    var_0._id_117E9 += ( level._id_8DA2 - var_1 ) / level._id_8DA2 * 100;

    if ( isdefined( self.attacker ) && var_0 == self.attacker )
        var_0._id_117E9 += 100;

    if ( isplayer( var_0 ) )
        var_0._id_117E9 += var_0.score * 4;

    if ( isdefined( var_0._id_202C ) )
        var_0._id_117E9 -= var_0._id_202C;

    if ( var_0._id_117E9 <= 0 )
        var_0._id_117E9 = 1;
}

_id_8D82()
{
    self _meth_807F();
    self _meth_8075();
    self vehicle_setspeed( 80, 35 );
    self setyawspeed( 75, 45, 45 );
    self setmaxpitchroll( 30, 30 );
    self setneargoalnotifydist( 256 );
    self _meth_8354( 0.9 );
}

_id_181D( var_0 )
{
    self endon( "death" );
    self._id_DDBF += var_0;
    wait 4.0;
    self._id_DDBF -= var_0;
}

_id_B938( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_0 ) )
    {
        if ( isdefined( self.owner ) && var_0 == self.owner && self._id_110EA == "heli_sniper" || isdefined( var_0.class ) && var_0.class == "worldspawn" || var_0 == self )
            return -1;
    }

    var_5 = var_3;
    var_6 = 2;
    var_7 = 3;
    var_8 = 4;

    if ( isdefined( self.helitype ) && self.helitype == "dronedrop" )
    {
        var_6 = 1;
        var_7 = 1;
        var_8 = 2;
    }

    var_5 = _id_0DC9::_id_7FBD( var_0, var_1, var_2, var_5, self.maxhealth, var_6, var_7, var_8 );
    thread _id_181D( var_5 );
    self notify( "heli_damage_fx" );

    if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_0 ) )
        var_5 = 0;

    return var_5;
}

_id_898F( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0 ) )
    {
        var_4 = level._id_8DA6[self._id_110EA];
        var_5 = "";

        if ( isdefined( self._id_110E8 ) )
            var_5 = _id_0AC7::getrarityforlootitem( self._id_110E8._id_1318B );

        var_6 = var_4._id_3774;

        if ( var_5 != "" )
            var_6 = var_6 + "_" + var_5;

        var_7 = scripts\mp\damage::onkillstreakkilled( self._id_110EA, var_0, var_1, var_2, var_3, var_4._id_EC44, var_4._id_52DA, var_6 );

        if ( var_7 )
        {
            var_0 notify( "destroyed_helicopter" );
            self._id_A667 = var_0;
        }

        if ( var_1 == "heli_pilot_turret_mp" )
            var_0 scripts\mp\missions::_id_D992( "ch_enemy_down" );

        scripts\mp\missions::_id_3DE3( var_0, self, var_1 );
    }
}

_id_8D40( var_0, var_1, var_2 )
{
    self endon( "crashing" );
    self endon( "leaving" );
    self._id_110EA = var_0;
    self._id_DDBF = 0;

    if ( !scripts\mp\utility\game::istrue( var_2 ) )
        thread _id_8D61();

    scripts\mp\damage::monitordamage( self.maxhealth, "helicopter", ::_id_898F, ::_id_B938, 1, var_1 );
}

_id_8DA5()
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "crashing" );
    self.owner endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        self._id_61A3 = 1;

        if ( isdefined( self._id_B6C0 ) )
            self._id_B6C0 notify( "stop_shooting" );

        if ( isdefined( self._id_B6C1 ) )
            self._id_B6C1 notify( "stop_shooting" );

        wait( var_1 );
        self._id_61A3 = 0;

        if ( isdefined( self._id_B6C0 ) )
            self._id_B6C0 notify( "turretstatechange" );

        if ( isdefined( self._id_B6C1 ) )
            self._id_B6C1 notify( "turretstatechange" );
    }
}

_id_8D61()
{
    self endon( "leaving" );
    self endon( "crashing" );
    self._id_4C07 = "ok";
    self._id_AA1B = "ok";
    self _meth_82CE( 3 );
    var_0 = 3;
    self _meth_82CE( var_0 );
    var_1 = level._id_8DA6[self._id_110EA];

    for (;;)
    {
        self waittill( "heli_damage_fx" );

        if ( var_0 > 0 && self._id_00E1 >= self.maxhealth )
        {
            var_0 = 0;
            self _meth_82CE( var_0 );
            stopfxontag( level._id_3F19["damage"]["heavy_smoke"], self, var_1._id_65D0 );
            self notify( "death" );
            break;
        }
        else
        {
            if ( var_0 > 1 && self._id_00E1 >= self.maxhealth * 0.66 )
            {
                var_0 = 1;
                self _meth_82CE( var_0 );
                self._id_4C07 = "heavy smoke";
                stopfxontag( level._id_3F19["damage"]["light_smoke"], self, var_1._id_65D0 );
                playfxontag( level._id_3F19["damage"]["heavy_smoke"], self, var_1._id_65D0 );
                continue;
            }

            if ( var_0 > 2 && self._id_00E1 >= self.maxhealth * 0.33 )
            {
                var_0 = 2;
                self _meth_82CE( var_0 );
                self._id_4C07 = "light smoke";
                playfxontag( level._id_3F19["damage"]["light_smoke"], self, var_1._id_65D0 );
            }
        }
    }
}

_id_8DA4()
{
    level endon( "game_ended" );
    self endon( "gone" );
    self waittill( "death" );

    if ( isdefined( self._id_A859 ) && self._id_A859 )
        thread _id_8D4C( 1 );
    else
    {
        var_0 = level._id_8DA6[self._id_110EA];
        playfxontag( level._id_3F19["damage"]["on_fire"], self, var_0._id_65D0 );
        thread _id_8D33();
    }
}

_id_8D33()
{
    self notify( "crashing" );
    self _meth_8076();
    var_0 = level._id_8D3E[randomint( level._id_8D3E.size )];

    if ( isdefined( self._id_B6C0 ) )
        self._id_B6C0 notify( "stop_shooting" );

    if ( isdefined( self._id_B6C1 ) )
        self._id_B6C1 notify( "stop_shooting" );

    thread _id_8D8B( 180 );
    thread _id_8D83();
    _id_8D53( var_0 );
    thread _id_8D4C();
}

_id_8D83()
{
    var_0 = _id_8D5C();
    var_1 = level._id_8DA6[self._id_110EA];
    playfxontag( level._id_3F19["explode"]["large"], self, var_1._id_65D0 );
    self playsound( level._id_8D8A[var_0]["hitsecondary"] );
    wait 3.0;

    if ( !isdefined( self ) )
        return;

    playfxontag( level._id_3F19["explode"]["large"], self, var_1._id_65D0 );
    self playsound( level._id_8D8A[var_0]["hitsecondary"] );
}

_id_8D8B( var_0 )
{
    self endon( "death" );
    var_1 = _id_8D5C();
    self playsound( level._id_8D8A[var_1]["hit"] );
    thread _id_10A11();
    self setyawspeed( var_0, var_0, var_0 );

    while ( isdefined( self ) )
    {
        self _meth_8348( self.angles[1] + var_0 * 0.9 );
        wait 1;
    }
}

_id_10A11()
{
    self endon( "death" );
    wait 0.25;
    var_0 = _id_8D5C();
    self stoploopsound();
    wait 0.05;
    self playloopsound( level._id_8D8A[var_0]["spinloop"] );
    wait 0.05;
    self playloopsound( level._id_8D8A[var_0]["spinstart"] );
}

_id_8D4C( var_0 )
{
    self notify( "death" );

    if ( isdefined( var_0 ) && isdefined( level._id_3F19["explode"]["air_death"][self._id_8DA0] ) )
    {
        var_1 = self gettagangles( "tag_deathfx" );
        playfx( level._id_3F19["explode"]["air_death"][self._id_8DA0], self gettagorigin( "tag_deathfx" ), anglestoforward( var_1 ), anglestoup( var_1 ) );
    }
    else
    {
        var_2 = self.origin;
        var_3 = self.origin + ( 0, 0, 1 ) - self.origin;
        playfx( level._id_3F19["explode"]["death"][self._id_8DA0], var_2, var_3 );
    }

    var_4 = _id_8D5C();
    self playsound( level._id_8D8A[var_4]["crash"] );
    wait 0.05;

    if ( isdefined( self._id_A63A ) )
        self._id_A63A delete();

    scripts\mp\utility\game::_id_4FC1();
    self delete();
}

_id_3DBF()
{
    if ( !isdefined( self.owner ) || !isdefined( self.owner.pers["team"] ) || self.owner.pers["team"] != self.team )
    {
        thread _id_8D66();
        return 0;
    }

    return 1;
}

_id_8D69( var_0 )
{
    self endon( "death" );
    self endon( "helicopter_done" );
    var_0 waittill( "disconnect" );
    thread _id_8D66();
}

_id_8D68( var_0 )
{
    self endon( "death" );
    self endon( "helicopter_done" );

    if ( scripts\mp\utility\game::bot_is_fireteam_mode() )
        return;

    var_0 scripts\engine\utility::waittill_any( "joined_team", "joined_spectators" );
    thread _id_8D66();
}

_id_8D6C( var_0 )
{
    self endon( "death" );
    self endon( "helicopter_done" );
    var_0 waittill( "spawned" );
    thread _id_8D66();
}

_id_8D6A( var_0 )
{
    self endon( "death" );
    self endon( "helicopter_done" );
    level waittill( "game_ended" );
    thread _id_8D66();
}

_id_8D6D( var_0 )
{
    self endon( "death" );
    self endon( "helicopter_done" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    thread _id_8D66();
}

_id_6D7A( var_0 )
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    var_1 = 15;
    var_2 = 0;
    var_3 = 0;

    foreach ( var_5 in level._id_8D6F )
    {
        var_2++;
        var_3 += var_5.origin[2];
    }

    var_7 = var_3 / var_2;
    self notify( "newTarget" );

    if ( isdefined( self._id_F0C3 ) && self._id_F0C3._id_00E1 < self._id_F0C3.maxhealth )
        return;

    if ( isdefined( self._id_9EDC ) && self._id_9EDC )
        return;

    var_8 = self._id_D8DF;
    var_8._id_202C = 0;
    var_9 = self._id_D8DF.origin * ( 1, 1, 0 );
    var_10 = self.origin * ( 0, 0, 1 );
    var_11 = var_9 + var_10;
    var_12 = distance2d( self.origin, var_8.origin );

    if ( var_12 < 1000 )
        var_1 = 600;

    var_13 = anglestoforward( var_8.angles );
    var_13 *= ( 1, 1, 0 );
    var_14 = var_11 + var_1 * var_13;
    var_15 = var_14 - var_11;
    var_16 = vectortoangles( var_15 );
    var_16 *= ( 1, 1, 0 );
    thread _id_2513( var_8 );
    self vehicle_setspeed( 80 );

    if ( distance2d( self.origin, var_14 ) < 1000 )
        var_14 *= 1.5;

    var_14 *= ( 1, 1, 0 );
    var_14 += ( 0, 0, var_7 );
    _id_13E0( var_14, 1, 1 );
    self waittill( "near_goal" );

    if ( !isdefined( var_8 ) || !isalive( var_8 ) )
        return;

    self setlookatent( var_8 );
    thread _id_9DEC( 10, var_8 );
    scripts\engine\utility::_id_13736( 4, "facing" );

    if ( !isdefined( var_8 ) || !isalive( var_8 ) )
        return;

    self _meth_8076();
    var_17 = var_11 + var_1 * anglestoforward( var_16 );
    self setmaxpitchroll( 40, 30 );
    _id_13E0( var_17, 1, 1 );
    self setmaxpitchroll( 30, 30 );

    if ( isdefined( var_8 ) && isalive( var_8 ) )
    {
        if ( isdefined( var_8._id_202C ) )
            var_8._id_202C += 100;
        else
            var_8._id_202C = 100;
    }

    scripts\engine\utility::_id_13736( 3, "near_goal" );
}

_id_2513( var_0 )
{
    self notify( "attackGroundTarget" );
    self endon( "attackGroundTarget" );
    self stoploopsound();
    self._id_9D5A = 1;
    self setturrettargetent( var_0 );
    _id_1370A( var_0, 3.0 );

    if ( !isalive( var_0 ) )
        self._id_9D5A = 0;
    else
    {
        var_1 = distance2dsquared( self.origin, var_0.origin );

        if ( var_1 < 640000 )
        {
            thread _id_5D24( var_0 );
            self._id_9D5A = 0;
            return;
        }
        else
        {
            if ( _id_3E21( 50, var_0 ) && scripts\engine\utility::_id_4347() )
            {
                thread _id_6D75( var_0 );
                self._id_9D5A = 0;
                return;
                return;
            }

            var_2 = weaponfiretime( "cobra_20mm_mp" );
            var_3 = 0;
            var_4 = 0;

            for ( var_5 = 0; var_5 < level._id_8D9E; var_5++ )
            {
                if ( !isdefined( self ) )
                    break;

                if ( self._id_61A3 )
                    break;

                if ( !isdefined( var_0 ) )
                    break;

                if ( !isalive( var_0 ) )
                    break;

                if ( self._id_00E1 >= self.maxhealth )
                    continue;

                if ( !_id_3E21( 55, var_0 ) )
                {
                    self stoploopsound();
                    var_4 = 0;
                    wait( var_2 );
                    var_5--;
                    continue;
                }

                if ( var_5 < level._id_8D9E - 1 )
                    wait( var_2 );

                if ( !isdefined( var_0 ) || !isalive( var_0 ) )
                    break;

                if ( !var_4 )
                {
                    self playloopsound( "weap_hind_20mm_fire_npc" );
                    var_4 = 1;
                }

                self _meth_8365( "cobra_20mm_mp" );
                self fireweapon( "tag_flash", var_0 );
            }

            if ( !isdefined( self ) )
                return;

            self stoploopsound();
            var_4 = 0;
            self._id_9D5A = 0;
        }
    }
}

_id_3E21( var_0, var_1 )
{
    self endon( "death" );
    self endon( "leaving" );

    if ( !isdefined( var_0 ) )
        var_0 = 10;

    var_2 = anglestoforward( self.angles );
    var_3 = var_1.origin - self.origin;
    var_2 *= ( 1, 1, 0 );
    var_3 *= ( 1, 1, 0 );
    var_3 = vectornormalize( var_3 );
    var_2 = vectornormalize( var_2 );
    var_4 = vectordot( var_3, var_2 );
    var_5 = cos( var_0 );

    if ( var_4 >= var_5 )
        return 1;
    else
        return 0;
}

_id_9DEC( var_0, var_1 )
{
    self endon( "death" );
    self endon( "leaving" );

    if ( !isdefined( var_0 ) )
        var_0 = 10;

    while ( isalive( var_1 ) )
    {
        var_2 = anglestoforward( self.angles );
        var_3 = var_1.origin - self.origin;
        var_2 *= ( 1, 1, 0 );
        var_3 *= ( 1, 1, 0 );
        var_3 = vectornormalize( var_3 );
        var_2 = vectornormalize( var_2 );
        var_4 = vectordot( var_3, var_2 );
        var_5 = cos( var_0 );

        if ( var_4 >= var_5 )
        {
            self notify( "facing" );
            break;
        }

        wait 0.1;
    }
}

_id_1370A( var_0, var_1 )
{
    self endon( "death" );
    self endon( "helicopter_done" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    scripts\engine\utility::_id_137B7( "turret_on_target", var_1 );
}

_id_6D75( var_0 )
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    if ( level._id_DADB )
        var_1 = 1;
    else
        var_1 = 2;

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        if ( !isdefined( var_0 ) )
            return;

        if ( scripts\engine\utility::_id_4347() )
        {
            var_3 = scripts\mp\utility\game::_id_1309( "hind_missile_mp", self gettagorigin( "tag_missile_right" ) - ( 0, 0, 64 ), var_0.origin, self.owner );
            var_3._id_131D8 = self;
        }
        else
        {
            var_3 = scripts\mp\utility\game::_id_1309( "hind_missile_mp", self gettagorigin( "tag_missile_left" ) - ( 0, 0, 64 ), var_0.origin, self.owner );
            var_3._id_131D8 = self;
        }

        var_3 _meth_8206( var_0 );
        var_3.owner = self;
        var_3 _meth_8204();
        wait( 0.5 / var_1 );
    }
}

_id_5D24( var_0 )
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    if ( !isdefined( var_0 ) )
        return;

    for ( var_1 = 0; var_1 < randomintrange( 2, 5 ); var_1++ )
    {
        if ( scripts\engine\utility::_id_4347() )
        {
            var_2 = scripts\mp\utility\game::_id_1309( "hind_bomb_mp", self gettagorigin( "tag_missile_left" ) - ( 0, 0, 45 ), var_0.origin, self.owner );
            var_2._id_131D8 = self;
        }
        else
        {
            var_2 = scripts\mp\utility\game::_id_1309( "hind_bomb_mp", self gettagorigin( "tag_missile_right" ) - ( 0, 0, 45 ), var_0.origin, self.owner );
            var_2._id_131D8 = self;
        }

        wait( randomfloatrange( 0.35, 0.65 ) );
    }
}

_id_8025( var_0 )
{
    var_1 = self.origin;
    var_2 = var_0.origin;
    var_3 = 0;
    var_4 = 40;
    var_5 = ( 0, 0, -196 );

    for ( var_6 = bullettrace( var_1 + var_5, var_2 + var_5, 0, self ); distancesquared( var_6["position"], var_2 + var_5 ) > 10 && var_3 < var_4; var_6 = bullettrace( var_1 + var_5, var_2 + var_5, 0, self ) )
    {
        if ( var_1[2] < var_2[2] )
            var_1 += ( 0, 0, 128 );
        else if ( var_1[2] > var_2[2] )
            var_2 += ( 0, 0, 128 );
        else
        {
            var_1 += ( 0, 0, 128 );
            var_2 += ( 0, 0, 128 );
        }

        var_3++;
    }

    var_7 = [];
    var_7["start"] = var_1;
    var_7["end"] = var_2;
    return var_7;
}

_id_126C2( var_0 )
{
    var_1 = _id_8025( var_0 );

    if ( var_1["start"] != self.origin )
    {
        self vehicle_setspeed( 75, 35 );
        _id_13E0( var_1["start"] + ( 0, 0, 30 ), 0 );
        self _meth_82F2( var_0.angles[1] + level._id_8D2B );
        self waittill( "goal" );
    }

    if ( var_1["end"] != var_0.origin )
    {
        if ( isdefined( var_0._id_ECEA ) && isdefined( var_0._id_ECE2 ) )
        {
            var_2 = var_0._id_ECEA;
            var_3 = var_0._id_ECE2;
        }
        else
        {
            var_2 = 30 + randomint( 20 );
            var_3 = 15 + randomint( 15 );
        }

        self vehicle_setspeed( 75, 35 );
        _id_13E0( var_1["end"] + ( 0, 0, 30 ), 0 );
        self _meth_82F2( var_0.angles[1] + level._id_8D2B );
        self waittill( "goal" );
    }
}

_id_13E0( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = 0;

    if ( var_2 )
        thread _id_13E2( var_0, var_1 );
    else
        self setvehgoalpos( var_0, var_1 );
}

_id_13E2( var_0, var_1 )
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "crashing" );
    var_2 = var_0;

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        if ( scripts\engine\utility::_id_56F4( self.origin, var_2 ) < 65536 )
        {
            self setvehgoalpos( var_2, var_1 );
            break;
        }

        var_3 = vectortoangles( var_2 - self.origin );
        var_4 = anglestoforward( var_3 );
        var_5 = self.origin + var_4 * ( 1, 1, 0 ) * 250;
        var_6 = ( 0, 0, 2500 );
        var_7 = var_5 + ( scripts\mp\utility\game::_id_7EF9() + var_6 );
        var_8 = var_5 + scripts\mp\utility\game::_id_7EF9() - var_6;
        var_9 = bullettrace( var_7, var_8, 0, self, 0, 0, 1 );
        var_10 = var_9;

        if ( isdefined( var_9["entity"] ) && var_9["entity"] == self && var_9["normal"][2] > 0.1 )
        {
            var_11 = var_9["position"][2] - 4400;
            var_12 = var_11 - self.origin[2];

            if ( var_12 > 256 )
            {
                var_9["position"] *= ( 1, 1, 0 );
                var_9["position"] += ( 0, 0, self.origin[2] + 256 );
            }
            else if ( var_12 < -256 )
            {
                var_9["position"] *= ( 1, 1, 0 );
                var_9["position"] += ( 0, 0, self.origin[2] - 256 );
            }

            var_10 = var_9["position"] - scripts\mp\utility\game::_id_7EF9() + ( 0, 0, 600 );
        }
        else
            var_10 = var_2;

        self setvehgoalpos( var_10, 0 );
        wait 0.15;
    }
}

_id_8D53( var_0 )
{
    self endon( "death" );
    self endon( "leaving" );
    self notify( "flying" );
    self endon( "flying" );
    _id_8D82();
    var_1 = var_0;

    while ( isdefined( var_1._id_0334 ) )
    {
        var_2 = getent( var_1._id_0334, "targetname" );

        if ( isdefined( var_1._id_ECEA ) && isdefined( var_1._id_ECE2 ) )
        {
            var_3 = var_1._id_ECEA;
            var_4 = var_1._id_ECE2;
        }
        else
        {
            var_3 = 30 + randomint( 20 );
            var_4 = 15 + randomint( 15 );
        }

        if ( isdefined( self._id_9D5A ) && self._id_9D5A )
        {
            wait 0.05;
            continue;
        }

        if ( isdefined( self._id_9EDC ) && self._id_9EDC )
        {
            wait 0.05;
            continue;
        }

        self vehicle_setspeed( 75, 35 );

        if ( !isdefined( var_2._id_0334 ) )
        {
            _id_13E0( var_2.origin + self._id_13F0A, 1 );
            self waittill( "near_goal" );
        }
        else
        {
            _id_13E0( var_2.origin + self._id_13F0A, 0 );
            self waittill( "near_goal" );
            self _meth_82F2( var_2.angles[1] );
            self waittillmatch( "goal" );
        }

        var_1 = var_2;
    }
}

_id_8D52( var_0 )
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self notify( "flying" );
    self endon( "flying" );
    _id_8D82();
    thread _id_8D71( var_0 );
    var_1 = var_0;

    while ( isdefined( var_1._id_0334 ) )
    {
        var_2 = getent( var_1._id_0334, "targetname" );

        if ( isdefined( self._id_9EDC ) && self._id_9EDC )
        {
            wait 0.25;
            continue;
        }

        if ( isdefined( self._id_9D5A ) && self._id_9D5A )
        {
            wait 0.1;
            continue;
        }

        if ( isdefined( var_1._id_ECEA ) && isdefined( var_1._id_ECE2 ) )
        {
            self._id_5275 = var_1._id_ECEA;
            self._id_526F = var_1._id_ECE2;
        }
        else
        {
            self._id_5275 = 30 + randomint( 20 );
            self._id_526F = 15 + randomint( 15 );
        }

        if ( self.helitype == "flares" )
        {
            self._id_5275 *= 0.5;
            self._id_526F *= 0.5;
        }

        if ( isdefined( var_2._id_027B ) && isdefined( self._id_D8DF ) && !_id_8D64() )
        {
            _id_13E0( var_2.origin + self._id_13F0A, 1, 1 );
            self waittill( "near_goal" );
            wait( var_2._id_027B );
        }
        else
        {
            _id_13E0( var_2.origin + self._id_13F0A, 0, 1 );
            self waittill( "near_goal" );
            self _meth_82F2( var_2.angles[1] );
            self waittillmatch( "goal" );
        }

        var_1 = var_2;
    }
}

_id_8D71( var_0 )
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    if ( isdefined( var_0._id_ECEA ) && isdefined( var_0._id_ECE2 ) )
    {
        self._id_5275 = var_0._id_ECEA;
        self._id_526F = var_0._id_ECE2;
    }
    else
    {
        self._id_5275 = 30 + randomint( 20 );
        self._id_526F = 15 + randomint( 15 );
    }

    var_1 = 0;
    var_2 = 0;

    for (;;)
    {
        var_3 = self._id_5275;
        var_4 = self._id_526F;

        if ( isdefined( self._id_9D5A ) && self._id_9D5A )
        {
            wait 0.05;
            continue;
        }

        if ( self.helitype != "flares" && isdefined( self._id_D8DF ) && !_id_8D64() )
            var_3 *= 0.25;

        if ( var_1 != var_3 || var_2 != var_4 )
        {
            self vehicle_setspeed( 75, 35 );
            var_1 = var_3;
            var_2 = var_4;
        }

        wait 0.05;
    }
}

_id_8D64()
{
    if ( self._id_DDBF > 50 )
        return 1;

    if ( self._id_4C07 == "heavy smoke" )
        return 1;

    return 0;
}

_id_8D55( var_0 )
{
    self notify( "flying" );
    self endon( "flying" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );

    for (;;)
    {
        if ( isdefined( self._id_9D5A ) && self._id_9D5A )
        {
            wait 0.05;
            continue;
        }

        var_1 = _id_785E( var_0 );
        _id_126C2( var_1 );

        if ( isdefined( var_1._id_ECEA ) && isdefined( var_1._id_ECE2 ) )
        {
            var_2 = var_1._id_ECEA;
            var_3 = var_1._id_ECE2;
        }
        else
        {
            var_2 = 30 + randomint( 20 );
            var_3 = 15 + randomint( 15 );
        }

        self vehicle_setspeed( 75, 35 );
        _id_13E0( var_1.origin + self._id_13F0A, 1 );
        self _meth_82F2( var_1.angles[1] + level._id_8D2B );

        if ( level._id_8D56 != 0 )
        {
            self waittill( "near_goal" );
            wait( level._id_8D56 );
            continue;
        }

        if ( !isdefined( var_1._id_027B ) )
        {
            self waittill( "near_goal" );
            wait( 5 + randomint( 5 ) );
            continue;
        }

        self waittillmatch( "goal" );
        wait( var_1._id_027B );
    }
}

_id_785E( var_0 )
{
    return _id_12E60( var_0 );
}

_id_8D66( var_0 )
{
    self notify( "leaving" );
    self _meth_8076();

    if ( isdefined( self.helitype ) && self.helitype == "osprey" && isdefined( self._id_C96C ) )
    {
        _id_13E0( self._id_C96C, 1 );
        scripts\engine\utility::_id_13736( 5, "goal" );
    }

    if ( !isdefined( var_0 ) )
    {
        var_1 = level._id_8D67[randomint( level._id_8D67.size )];
        var_0 = var_1.origin;
    }

    var_2 = spawn( "script_origin", var_0 );

    if ( isdefined( var_2 ) )
    {
        self setlookatent( var_2 );
        var_2 thread _id_13589( 3.0 );
    }

    var_3 = ( var_0 - self.origin ) * 2000;
    _id_8D82();
    self vehicle_setspeed( 180, 45 );
    _id_13E0( var_3, 1 );
    scripts\engine\utility::_id_13736( 12, "goal" );
    self notify( "gone" );
    self notify( "death" );
    wait 0.05;

    if ( isdefined( self._id_A63A ) )
        self._id_A63A delete();

    scripts\mp\utility\game::_id_4FC1();
    self delete();
}

_id_13589( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    wait( var_0 );
    self delete();
}

_id_4F09( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( level._id_8D43 ) && level._id_8D43 == 1.0 )
        thread _id_5B64( var_0, var_1, var_2, var_3, var_4 );
}

_id_4F0A( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level._id_8D43 ) && level._id_8D43 == 1.0 )
    {
        if ( isdefined( var_3 ) )
            thread _id_5B64( var_0, ( 0.8, 0.8, 0.8 ), var_1, var_2, var_3 );
        else
            thread _id_5B64( var_0, ( 0.8, 0.8, 0.8 ), var_1, var_2, 0 );
    }
}

_id_4EEE( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( level._id_8D43 ) && level._id_8D43 == 1.0 && !isdefined( var_3 ) )
        thread _id_5B4A( var_0, var_1, var_2 );
    else if ( isdefined( level._id_8D43 ) && level._id_8D43 == 1.0 )
        thread _id_5B4A( var_0, var_1, var_2, var_3 );
}

_id_5B64( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_4 == 0 )
    {
        while ( isdefined( var_2 ) )
            wait 0.05;
    }
    else
    {
        for ( var_5 = 0; var_5 < var_4; var_5++ )
        {
            if ( !isdefined( var_2 ) )
                break;

            wait 0.05;
        }
    }
}

_id_5B4A( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
    {
        for ( var_4 = 0; var_4 < var_3; var_4++ )
            wait 0.05;
    }
    else
    {
        for (;;)
            wait 0.05;
    }
}

_id_184E()
{
    level._id_8DD3[self getentitynumber()] = self;
}

_id_E109( var_0 )
{
    level._id_8DD3[var_0] = undefined;
}

_id_1852( var_0 )
{
    if ( isdefined( var_0 ) && var_0 == "lbSniper" )
        level._id_AAC8 = self;

    level._id_AD8B[self getentitynumber()] = self;
}

_id_E111( var_0 )
{
    var_1 = self getentitynumber();
    self waittill( "death" );

    if ( isdefined( var_0 ) && var_0 == "lbSniper" )
        level._id_AAC8 = undefined;

    level._id_AD8B[var_1] = undefined;
}

_id_68C3( var_0 )
{
    if ( level._id_AD8B.size >= 4 || level._id_AD8B.size >= 2 && var_0 == "littlebird_flock" )
        return 1;
    else
        return 0;
}

_id_C9D8()
{
    self endon( "death" );
    self endon( "disconnect" );
    self playlocalsound( game["voice"][self.team] + "KS_hqr_pavelow" );
    wait 3.5;
    self playlocalsound( game["voice"][self.team] + "KS_pvl_inbound" );
}

_id_AAC7()
{
    self endon( "gone" );

    if ( !isdefined( self ) )
        return;

    self notify( "crashing" );

    if ( isdefined( self._id_A859 ) && self._id_A859 )
        scripts\engine\utility::waitframe();
    else
    {
        self vehicle_setspeed( 25, 5 );
        thread _id_AAC9( randomintrange( 180, 220 ) );
        wait( randomfloatrange( 1.0, 2.0 ) );
    }

    _id_AAC6();
}

_id_AAC9( var_0 )
{
    self endon( "explode" );
    playfxontag( level._id_3F19["explode"]["medium"], self, "tail_rotor_jnt" );
    thread _id_11B0F( level._id_3F19["smoke"]["trail"], "tail_rotor_jnt", "stop tail smoke" );
    self setyawspeed( var_0, var_0, var_0 );

    while ( isdefined( self ) )
    {
        self _meth_8348( self.angles[1] + var_0 * 0.9 );
        wait 1;
    }
}

_id_AAC6()
{
    var_0 = self.origin + ( 0, 0, 1 ) - self.origin;
    var_1 = self gettagangles( "tag_deathfx" );
    playfx( level._id_3F19["explode"]["air_death"]["littlebird"], self gettagorigin( "tag_deathfx" ), anglestoforward( var_1 ), anglestoup( var_1 ) );
    self playsound( "exp_helicopter_fuel" );
    self notify( "explode" );
    _id_E139();
}

_id_11B0F( var_0, var_1, var_2 )
{
    self notify( var_2 );
    self endon( var_2 );
    self endon( "death" );

    for (;;)
    {
        playfxontag( var_0, self, var_1 );
        wait 0.05;
    }
}

_id_E139()
{
    if ( isdefined( self._id_B6C0 ) )
    {
        if ( isdefined( self._id_B6C0._id_A63A ) )
            self._id_B6C0._id_A63A delete();

        self._id_B6C0 delete();
    }

    if ( isdefined( self._id_B6C1 ) )
    {
        if ( isdefined( self._id_B6C1._id_A63A ) )
            self._id_B6C1._id_A63A delete();

        self._id_B6C1 delete();
    }

    if ( isdefined( self._id_B377 ) )
        self._id_B377 delete();

    if ( isdefined( level._id_8D79[self.team] ) && level._id_8D79[self.team] == self )
        level._id_8D79[self.team] = undefined;

    scripts\mp\utility\game::_id_4FC1();
    self delete();
}

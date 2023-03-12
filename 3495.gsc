// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_2A6B( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;

    if ( _id_0DC9::_id_A69F( var_3, "passive_support_drop" ) )
    {
        var_4 = scripts\mp\killstreaks\target_marker::_id_819B( var_3 );

        if ( !isdefined( var_4._id_AEC4 ) )
        {
            self notify( "cancel_jackal" );
            return 0;
        }
        else if ( isdefined( level._id_A22D ) || level._id_A412.size > 0 )
        {
            if ( isdefined( var_4._id_1349C ) )
                var_4._id_1349C delete();

            scripts\mp\hud_message::_id_10122( "KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );

            if ( isdefined( var_3.weapon ) && var_3.weapon != "none" )
                self notify( "killstreak_finished_with_weapon_" + var_3.weapon );

            self notify( "cancel_jackal" );
            return 0;
        }
    }

    self notify( "called_in_jackal" );
    level._id_A22D = 1;
    var_5 = getent( "airstrikeheight", "targetname" );

    if ( isdefined( var_5 ) )
        var_6 = var_5.origin[2] + 100;
    else if ( isdefined( level._id_1AF8 ) )
        var_6 = 850 * level._id_1AF8;
    else
        var_6 = 850;

    if ( isdefined( var_4 ) && isdefined( var_4._id_AEC4 ) )
        var_2 = var_4._id_AEC4;

    var_2 *= ( 1, 1, 0 );
    var_7 = var_2 + ( 0, 0, var_6 );
    var_8 = _id_108DE( var_0, self, var_1, var_7, var_3 );
    var_9 = var_7;
    var_10 = var_7 + anglestoright( self.angles ) * 2000;
    var_11 = var_7 - anglestoright( self.angles ) * 2000;
    var_12 = [ var_9, var_10, var_11 ];

    foreach ( var_14 in var_12 )
    {
        if ( !jackalcanseelocation( var_8, var_14 ) )
            continue;

        var_7 = var_14;
        break;
    }

    var_8._id_C96C = var_7;
    thread _id_5088( var_8, var_4 );
    self.pers["wardenKSCount"]++;

    if ( self.pers["wardenKSCount"] % 2 == 0 )
        scripts\mp\missions::_id_D991( "ch_warden_double" );
}

_id_108DE( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = vectortoangles( var_3 - var_2 );
    var_6 = "veh_mil_air_ca_dropship_mp";
    var_7 = 1;
    var_8 = "jackal_turret_mp";
    var_9 = "veh_mil_air_ca_dropship_mp_turret";
    var_10 = 1;
    var_11 = "jackal_cannon_mp";
    var_12 = "veh_mil_air_ca_dropship_turret_missile";
    var_13 = 1;
    var_14 = 250;
    var_15 = 175;
    var_16 = 3000;
    var_17 = &"KILLSTREAKS_HINTS_JACKAL_GUARD";
    var_18 = "follow_player";
    var_19 = _id_0AC7::getrarityforlootitem( var_4._id_1318B );

    if ( var_19 != "" )
        var_6 = var_6 + "_" + var_19;

    if ( _id_0DC9::_id_A69F( var_4, "passive_extra_flare" ) )
        var_7 += 1;

    if ( _id_0DC9::_id_A69F( var_4, "passive_moving_fortress" ) )
    {
        var_11 = "jackal_turret_mp";
        var_12 = "veh_mil_air_ca_dropship_mp_turret";
    }

    if ( _id_0DC9::_id_A69F( var_4, "passive_support_drop" ) )
        var_18 = "guard_location";

    var_20 = spawnhelicopter( var_1, var_2, var_5, "veh_jackal_mp", var_6 );

    if ( !isdefined( var_20 ) )
        return;

    var_20 thread _id_8992();
    var_20._id_4D2E = ::_id_3758;
    var_20._id_02B3 = var_14;
    var_20._id_1545 = var_15;
    var_20.health = var_16;
    var_20.maxhealth = var_20.health;
    var_20.team = var_1.team;
    var_20.owner = var_1;
    var_20 setcandamage( 1 );
    var_20._id_5087 = var_3;
    var_20._id_AC68 = var_0;
    var_20._id_A056 = 1;
    var_20._id_110E8 = var_4;
    var_20._id_110EA = var_4._id_110EA;
    var_20._id_67E3 = 0;
    var_20._id_00BC = var_18;
    var_20._id_4C08 = var_17;
    var_20._id_110E8 = var_4;
    var_20._id_6EB4 = var_7;
    var_20.turreton = var_10;
    var_20.turretweapon = var_8;
    var_20.cannonweapon = var_11;
    var_20.cannonon = var_13;
    var_20 _id_0DC9::_id_1843( var_4._id_110EA, "Killstreak_Air", var_1, 1 );
    var_20 setmaxpitchroll( 0, 90 );
    var_20 vehicle_setspeed( var_20._id_02B3, var_20._id_1545 );
    var_20 sethoverparams( 50, 100, 50 );
    var_20 _meth_8354( 0.05 );
    var_20 setyawspeed( 45, 25, 25, 0.5 );
    var_20 _meth_831F( var_1 );
    var_21 = anglestoforward( var_20.angles );
    var_20._id_129B9 = spawnturret( "misc_turret", var_20 gettagorigin( "tag_turret" ), var_8 );
    var_20._id_129B9 setmodel( var_9 );
    var_20._id_129B9.owner = var_1;
    var_20._id_129B9.team = var_1.team;
    var_20._id_129B9.angles = var_20.angles;
    var_20._id_129B9.type = "Machine_Gun";
    var_20._id_129B9._id_110E8 = var_4;
    var_20._id_129B9 linkto( var_20, "tag_turret" );
    var_20._id_129B9 _meth_835B( 0 );
    var_20._id_129B9 _meth_830F( "manual_target" );
    var_20._id_129B9 _meth_8336( var_1 );
    var_20._id_38D3 = spawnturret( "misc_turret", var_20 gettagorigin( "tag_origin" ), var_11 );
    var_20._id_38D3 setmodel( var_12 );
    var_20._id_38D3.owner = var_1;
    var_20._id_38D3.team = var_1.team;
    var_20._id_38D3.angles = var_20.angles;
    var_20._id_38D3.type = "Cannon";
    var_20._id_38D3._id_110E8 = var_4;
    var_20._id_38D3 linkto( var_20, "tag_origin", ( -300, 0, 30 ), ( 0, 0, 0 ) );
    var_20._id_38D3 _meth_835B( 0 );
    var_20._id_38D3 _meth_830F( "manual_target" );
    var_20._id_38D3 _meth_8336( var_1 );
    var_20._id_130AC = spawn( "script_model", var_20 gettagorigin( "tag_origin" ) );
    var_20._id_130AC linkto( var_20, "tag_origin" );
    level._id_A412[level._id_A412.size] = var_20;
    level._id_A412 = scripts\engine\utility::_id_22BC( level._id_A412 );
    level._id_A22D = undefined;
    var_20 _meth_84BE( "killstreak_jackal_mp" );
    var_20 thread _id_0D9B::_id_6EAB( undefined, "j_body" );
    var_20 thread _id_A3BD();
    var_20 thread _id_510C( 0.05, "dropship_enemy_hover_world_grnd" );
    var_20 thread _id_50BE();
    var_20 thread _id_0D9B::_id_6EAD( var_20._id_6EB4 );
    var_20._id_129B9._id_131D8 = var_20;
    var_20._id_38D3._id_131D8 = var_20;
    var_22 = anglestoforward( var_20.angles );
    var_20._id_129B9._id_131D8._id_A63A = spawn( "script_model", var_20 gettagorigin( "tag_turret_front" ) );
    var_20._id_129B9._id_131D8._id_A63A linkto( var_20, "tag_turret_front" );
    var_20._id_38D3._id_131D8._id_A63A = var_20._id_129B9._id_131D8._id_A63A;

    if ( _id_0DC9::_id_A69F( var_4, "passive_moving_fortress" ) )
        var_20._id_38D3._id_131D8._id_A63A linkto( var_20, "tag_turret_rear" );

    if ( _id_0DC9::_id_A69F( var_4, "passive_support_drop" ) )
    {
        var_23 = -120;
        var_24 = "jackaldrop";
        var_20.dropcrates = [];

        for ( var_25 = 0; var_25 < 3; var_25++ )
        {
            var_26 = scripts\mp\killstreaks\airdrop::_id_7E43( var_24 );
            var_27 = var_20 scripts\mp\killstreaks\airdrop::_id_4982( var_1, var_24, var_26, var_20.origin );
            var_27 linkto( var_20, "tag_origin", ( var_23, 0, 0 ), ( 0, 0, 0 ) );
            var_20.dropcrates[var_20.dropcrates.size] = var_27;
            var_23 += 60;
        }
    }

    var_20 setscriptablepartstate( "thrusters", "fly", 0 );
    return var_20;
}

_id_8013( var_0 )
{
    var_1 = 0;

    if ( level.teambased )
    {
        foreach ( var_3 in level._id_A412 )
        {
            if ( var_3.team != var_0.team )
                continue;

            var_1++;
        }
    }
    else
    {
        foreach ( var_3 in level._id_A412 )
        {
            if ( var_3.owner != var_0 )
                continue;

            var_1++;
        }
    }

    return var_1;
}

_id_50BE()
{
    self endon( "death" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 6 );
    self playsoundonmovingent( "dropship_killstreak_flyby" );
}

_id_510C( var_0, var_1 )
{
    self endon( "death" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    self playloopsound( var_1 );
}

_id_5088( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "leaving" );
    var_0 setvehgoalpos( var_0._id_C96C, 1 );
    var_0 playsoundonmovingent( "dropship_killstreak_thrust_change" );
    var_0 thread _id_42AB( var_0._id_C96C );
    var_0 thread _id_B9FF();

    if ( isdefined( var_0.dropcrates ) )
        var_0 thread watchdropcratesearly( var_1 );

    var_0 waittill( "goal" );

    if ( isdefined( var_1 ) && isdefined( var_0.dropcrates ) )
    {
        var_0 thread _id_A426();
        var_0 thread _id_13A86();
        var_0 thread _id_658F();
        var_0 thread _id_6590();
        var_0 setscriptablepartstate( "thrusters", "slow", 0 );
        var_0 vehicle_setspeed( var_0._id_02B3 - 215, var_0._id_1545 - 160 );
        var_0 jackalmovetolocation( var_1._id_AEC4 );
        var_0 thread dropcrates( var_0.dropcrates, var_1 );
        var_0 thread watchjackalcratepickup();
        var_0 scripts\engine\utility::_id_13736( 10, "all_crates_gone" );
        var_0._id_00BC = "follow_player";
    }
    else
    {
        var_0 thread _id_A426();
        var_0 thread _id_13A86();
        var_0 thread _id_658F();
        var_0 thread _id_6590();
    }

    var_0._id_130AC _id_0DC9::_id_F774( var_0.owner, var_0._id_4C08, 360, 360, 30000, 30000, 2 );
    var_0 thread patrolfield();
    var_0 thread _id_13AD6( _id_8026( var_0._id_00BC ), var_0._id_4C08 );
}

_id_658F()
{
    self notify( "engagePrimary" );
    self endon( "engagePrimary" );
    self endon( "leaving" );
    self endon( "death" );
    self._id_A930 = undefined;

    if ( scripts\mp\utility\game::istrue( self.turreton ) )
    {
        for (;;)
        {
            var_0 = _id_A3F3();

            if ( isdefined( var_0 ) && var_0.size > 0 )
            {
                _id_1573( var_0 );
                self._id_129B9 waittill( "stop_firing" );

                if ( self._id_00BC == "follow_player" )
                    thread patrolfield();
            }
            else
                self._id_A930 = "noTargetsFound";

            wait 0.05;
        }
    }
}

_id_6590()
{
    self notify( "engageSecondary" );
    self endon( "engageSecondary" );
    self endon( "leaving" );
    self endon( "death" );
    var_0 = weaponfiretime( self.cannonweapon );

    if ( scripts\mp\utility\game::istrue( self.cannonon ) )
    {
        for (;;)
        {
            var_1 = _id_A3F3();

            if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_moving_fortress" ) )
            {
                if ( isdefined( var_1 ) && var_1.size > 0 )
                {
                    _id_156F( var_1 );

                    if ( isdefined( self._id_38DD ) )
                        self._id_38D3 waittill( "stop_firing" );
                }

                wait 0.05;
                continue;
            }

            if ( !isdefined( var_1 ) || var_1.size < 2 )
            {
                wait 0.05;
                continue;
            }

            _id_156F( var_1 );
            scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
        }
    }
}

_id_7246()
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "guard_location" );
    self endon( "priority_target" );
    self endon( "jackal_crashing" );
    self.owner endon( "disconnect" );
    self notify( "following_player" );
    self vehicle_setspeed( self._id_02B3 - 215, self._id_1545 - 160 );
    self setscriptablepartstate( "thrusters", "slow", 0 );

    for (;;)
    {
        var_0 = undefined;

        if ( scripts\mp\utility\game::istrue( self._id_67E3 ) )
        {
            var_1 = self.owner.origin[0];
            var_2 = self.owner.origin[1];
            var_3 = var_1 + randomintrange( -500, 500 );
            var_4 = var_2 + randomintrange( -500, 500 );
            var_5 = _id_7E3E( var_3, var_4, 350 );
            var_0 = ( var_3, var_4, var_5 );
        }
        else
        {
            var_1 = self.owner.origin[0];
            var_2 = self.owner.origin[1];
            var_5 = _id_7E3E( var_1, var_2, 20 );
            var_0 = ( var_1, var_2, var_5 );
        }

        self setlookatent( self.owner );
        self setvehgoalpos( var_0, 1 );
        self._id_A930 = "following_player";
        scripts\engine\utility::waittill_any( "goal", "begin_evasive_maneuvers" );
        self _meth_8076();
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.1 );
    }
}

guardposition( var_0 )
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "follow_player" );
    self endon( "jackal_crashing" );
    self.owner endon( "disconnect" );
    self vehicle_setspeed( self._id_02B3 - 215, self._id_1545 - 160 );
    self setscriptablepartstate( "thrusters", "slow", 0 );
    var_1 = undefined;

    if ( scripts\mp\utility\game::istrue( self._id_67E3 ) )
    {
        var_2 = self.owner.origin[0];
        var_3 = self.owner.origin[1];
        var_4 = var_2 + randomintrange( -500, 500 );
        var_5 = var_3 + randomintrange( -500, 500 );
        var_6 = _id_7E3E( var_4, var_5, 350 );
        var_1 = ( var_4, var_5, var_6 );
    }
    else
    {
        var_2 = self.owner.origin[0];
        var_3 = self.owner.origin[1];
        var_6 = _id_7E3E( var_2, var_3, 20 );
        var_1 = ( var_2, var_3, var_6 );
    }

    self setlookatent( self.owner );
    self setvehgoalpos( var_1, 1 );
    self._id_A930 = "following_player";
    scripts\engine\utility::waittill_any( "goal", "begin_evasive_maneuvers" );
    self _meth_8076();
}

patrolfield()
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "guard_location" );
    self endon( "priority_target" );
    self endon( "jackal_crashing" );
    self.owner endon( "disconnect" );
    self vehicle_setspeed( self._id_02B3 - 215, self._id_1545 - 160 );
    self setscriptablepartstate( "thrusters", "slow", 0 );

    for (;;)
    {
        var_0 = undefined;

        if ( isdefined( self.patroltarget ) && isalive( self.patroltarget ) && isplayer( self.patroltarget ) && !self.patroltarget _meth_8181( "specialty_blindeye" ) )
        {
            if ( !jackalcanseeenemy( self.patroltarget ) || distance2dsquared( self.origin, self.patroltarget.origin ) > 4194304 )
                jackalmovetoenemy( self.patroltarget );
        }
        else
        {
            var_1 = jackalfindclosestenemy();

            if ( isdefined( var_1 ) )
            {
                self.patroltarget = var_1;
                thread watchpatroltarget();
                jackalmovetoenemy( var_1 );
            }
            else
            {
                self.patroltarget = undefined;
                var_2 = jackalfindfirstopenpoint();

                if ( isdefined( var_2 ) )
                    jackalmovetolocation( var_2.origin );
            }
        }

        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.1 );
    }
}

jackalfindfirstopenpoint()
{
    var_0 = undefined;

    if ( isdefined( level._id_3A58 ) && level._id_3A58.size > 0 )
    {
        foreach ( var_2 in level._id_3A58 )
        {
            if ( isdefined( var_2._id_014A ) && !var_2._id_014A )
                continue;

            if ( !jackalcanseelocation( self, var_2.origin ) )
                continue;

            var_2._id_014A = 0;
            var_0 = var_2;

            if ( !isdefined( self.initialpatrolpoint ) )
                self.initialpatrolpoint = var_0;

            break;
        }

        if ( !isdefined( var_0 ) )
        {
            if ( isdefined( self.initialpatrolpoint ) )
            {
                foreach ( var_2 in level._id_3A58 )
                {
                    if ( var_2 != self.initialpatrolpoint )
                        var_2._id_014A = undefined;
                }

                var_0 = self.initialpatrolpoint;
            }
        }
    }

    return var_0;
}

jackalcanseelocation( var_0, var_1 )
{
    var_2 = 0;
    var_3 = scripts\engine\trace::_id_48BC( 0, 1, 1, 1, 1, 1, 0 );

    if ( scripts\engine\trace::_id_DCF1( var_0.origin, var_1, var_0, var_3 ) )
        var_2 = 1;

    return var_2;
}

jackalcanseeenemy( var_0 )
{
    var_1 = 0;
    var_2 = scripts\engine\trace::_id_48BC( 0, 1, 0, 1, 1, 0 );
    var_3 = [ var_0 gettagorigin( "j_head" ), var_0 gettagorigin( "j_mainroot" ), var_0 gettagorigin( "tag_origin" ) ];

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( !scripts\engine\trace::_id_DCF1( self.origin, var_3[var_4], self, var_2 ) )
            continue;

        var_1 = 1;
        break;
    }

    return var_1;
}

jackalmovetoenemy( var_0 )
{
    if ( isdefined( self.patroltarget ) )
        var_0 = self.patroltarget;

    if ( jackalcanseeenemy( var_0 ) )
        self setlookatent( var_0 );

    var_1 = undefined;

    if ( scripts\mp\utility\game::istrue( self._id_67E3 ) )
    {
        var_2 = var_0.origin[0];
        var_3 = var_0.origin[1];
        var_4 = var_2 + randomintrange( -500, 500 );
        var_5 = var_3 + randomintrange( -500, 500 );
        var_6 = _id_7E3E( var_4, var_5, 350 );
        var_1 = ( var_4, var_5, var_6 );
    }
    else
    {
        var_2 = var_0.origin[0];
        var_3 = var_0.origin[1];
        var_6 = _id_7E3E( var_2, var_3, 20 );
        var_1 = ( var_2, var_3, var_6 );
    }

    var_7 = scripts\engine\trace::_id_48BC( 0, 1, 1, 1, 1, 1, 0 );
    var_8 = scripts\engine\trace::_id_DCED( self.origin, var_1, level._id_3CB5, var_7 );

    if ( var_8["hittype"] != "hittype_none" )
    {
        var_9 = _id_7E3E( var_8["position"][0], var_8["position"][1], 20 );
        var_1 = ( var_8["position"][0], var_8["position"][1], var_9 );
    }

    self setvehgoalpos( var_1, 2 );
    self._id_A930 = "patrol";
    scripts\engine\utility::waittill_any( "goal", "begin_evasive_maneuvers" );
    self _meth_8076();
}

jackalfindclosestenemy()
{
    var_0 = [];

    foreach ( var_2 in level.players )
    {
        if ( var_2._id_0184 || isdefined( var_2.owner ) && var_2.owner._id_0184 )
            continue;

        if ( !isalive( var_2 ) )
            continue;

        if ( isdefined( level.teambased ) && isdefined( var_2.team ) && self.team == var_2.team )
            continue;

        if ( var_2 _meth_8181( "specialty_blindeye" ) )
            continue;

        if ( var_2 isjackalenemyindoors() )
            continue;

        var_0[var_0.size] = var_2;
        scripts\engine\utility::waitframe();
    }

    var_4 = undefined;

    if ( var_0.size > 0 )
        var_4 = sortbydistance( var_0, self.origin );

    if ( isdefined( var_4 ) && var_4.size > 0 )
        return var_4[0];

    return undefined;
}

isjackalenemyindoors()
{
    var_0 = 0;
    var_1 = scripts\engine\trace::_id_48BC( 0, 1, 0, 1, 1, 0 );

    if ( !scripts\engine\trace::_id_DCF1( self.origin, self.origin + ( 0, 0, 10000 ), self, var_1 ) )
        var_0 = 1;

    return var_0;
}

watchpatroltarget()
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "jackal_crashing" );
    self.owner endon( "disconnect" );
    var_0 = self.patroltarget scripts\engine\utility::_id_13736( 5, "death", "disconnect" );
    self.patroltarget = undefined;
}

jackalmovetolocation( var_0 )
{
    var_1 = undefined;

    if ( scripts\mp\utility\game::istrue( self._id_67E3 ) )
    {
        var_2 = var_0[0];
        var_3 = var_0[1];
        var_4 = var_2 + randomintrange( -500, 500 );
        var_5 = var_3 + randomintrange( -500, 500 );
        var_6 = _id_7E3E( var_4, var_5, 350 );
        var_1 = ( var_4, var_5, var_6 );
    }
    else
    {
        var_2 = var_0[0];
        var_3 = var_0[1];
        var_6 = _id_7E3E( var_2, var_3, 20 );
        var_1 = ( var_2, var_3, var_6 );
    }

    self _meth_8076();
    self setvehgoalpos( var_1, 10 );
    scripts\engine\utility::waittill_any( "goal", "begin_evasive_maneuvers" );
}

_id_A406()
{
    self endon( "death" );
    self setmaxpitchroll( 0, 0 );
    self notify( "leaving" );
    self _meth_8076();
    self._id_129B9 _meth_8336( undefined );

    if ( isdefined( self._id_12A95 ) && isdefined( self._id_11576 ) )
        scripts\mp\utility\game::_id_C78F( self._id_11576, self._id_12A95 );

    self vehicle_setspeed( self._id_02B3 - 215, self._id_1545 - 150 );
    var_0 = self.origin + anglestoforward( ( 0, randomint( 360 ), 0 ) ) * 500;
    var_0 += ( 0, 0, 1000 );
    self setscriptablepartstate( "thrusters", "fast", 0 );

    if ( !scripts\mp\utility\game::istrue( level._id_7669 ) )
        self playsoundonmovingent( "dropship_killstreak_flyby" );

    self setvehgoalpos( var_0, 1 );

    if ( isdefined( self._id_130AC ) )
        self._id_130AC delete();

    self waittill( "goal" );
    self setscriptablepartstate( "thrusters", "fly", 0 );
    var_1 = _id_8051();
    self vehicle_setspeed( 250, 75 );
    self setvehgoalpos( var_1, 1 );

    if ( !scripts\mp\utility\game::istrue( level._id_7669 ) )
        self playsoundonmovingent( "dropship_killstreak_flyby" );

    self waittill( "goal" );
    self stoploopsound();
    level._id_A412[level._id_A412.size - 1] = undefined;
    self notify( "jackal_gone" );
    thread _id_A3BC();
}

_id_A3BC()
{
    scripts\mp\utility\game::_id_D915( "killstreak ended - jackal", self.owner );

    if ( isdefined( self._id_129B9 ) )
        self._id_129B9 delete();

    if ( isdefined( self._id_38D3 ) )
        self._id_38D3 delete();

    if ( isdefined( self._id_130AC ) )
        self._id_130AC delete();

    foreach ( var_1 in level._id_3A58 )
        var_1._id_014A = undefined;

    self delete();
}

_id_A426()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = 60;

    if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_extra_flare" ) )
        var_0 -= 10;

    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );

    if ( isdefined( self.owner ) )
        self.owner scripts\mp\utility\game::_id_D4B6( "jackal_end", undefined, undefined, self.owner.origin );

    thread _id_A406();
}

_id_13A86()
{
    self endon( "death" );
    self endon( "leaving" );
    level waittill( "game_ended" );
    thread _id_A406();
}

_id_DCBB()
{
    self notify( "randomJackalMovement" );
    self endon( "randomJackalMovement" );
    self endon( "death" );
    self endon( "acquiringTarget" );
    self endon( "leaving" );
    self._id_A930 = "randomMovement";
    var_0 = self._id_5087;
    var_1 = _id_80C0( self.origin );
    self setvehgoalpos( var_1, 1 );
    thread scripts\mp\utility\game::_id_5B7A( self.origin, var_1, 5, ( 1, 0, 1 ) );
    self waittill( "goal" );
}

_id_80C0( var_0 )
{
    self _meth_8076();

    if ( distance2dsquared( self.origin, self.owner.origin ) > 4194304 )
    {
        var_1 = self.owner.origin[0];
        var_2 = self.owner.origin[1];
        var_3 = _id_7E3E( var_1, var_2, 20 );
        var_4 = ( var_1, var_2, var_3 );
        self setlookatent( self.owner );
        return var_4;
    }
    else
    {
        var_5 = self.angles[1];
        var_6 = int( var_5 - 60 );
        var_7 = int( var_5 + 60 );
        var_8 = randomintrange( var_6, var_7 );
        var_9 = ( 0, var_8, 0 );
        var_10 = self.origin + anglestoforward( var_9 ) * randomintrange( 400, 800 );
        var_11 = var_10[0];
        var_12 = var_10[1];
        var_13 = _id_7E3E( var_11, var_12, 20 );
        var_14 = _id_11A8A( var_11, var_12, var_13 );

        if ( var_14 != 0 )
            return var_14;

        var_11 = randomfloatrange( var_0[0] - 1200, var_0[0] + 1200 );
        var_12 = randomfloatrange( var_0[1] - 1200, var_0[1] + 1200 );
        var_15 = ( var_11, var_12, var_13 );
        return var_15;
    }
}

_id_7FE2( var_0, var_1 )
{
    self endon( "death" );
    self endon( "acquiringTarget" );
    self endon( "leaving" );

    if ( !isdefined( var_1 ) )
        return;

    var_2 = [];

    foreach ( var_4 in level.players )
    {
        if ( var_4 == self )
            continue;

        if ( !level.teambased || var_4.team != self.team )
            var_2[var_2.size] = var_4.origin;
    }

    if ( var_2.size > 0 )
    {
        var_6 = averagepoint( var_2 );
        var_7 = var_6[0];
        var_8 = var_6[1];
    }
    else
    {
        var_9 = level.mapcenter;
        var_10 = level._id_B339 / 4;
        var_7 = randomfloatrange( var_9[0] - var_10, var_9[0] + var_10 );
        var_8 = randomfloatrange( var_9[1] - var_10, var_9[1] + var_10 );
    }

    var_11 = _id_7E3E( var_7, var_8, 20 );
    var_12 = _id_11A8A( var_7, var_8, var_11 );

    if ( var_12 != 0 )
        return var_12;

    var_7 = randomfloatrange( var_0[0] - 1200, var_0[0] + 1200 );
    var_8 = randomfloatrange( var_0[1] - 1200, var_0[1] + 1200 );
    var_11 = _id_7E3E( var_7, var_8, 20 );
    var_13 = ( var_7, var_8, var_11 );
    return var_13;
}

_id_8054( var_0 )
{
    var_1 = 100;
    var_2 = 15000;
    var_3 = randomfloat( 360 );
    var_4 = ( 0, var_3, 0 );
    var_5 = var_0 + anglestoforward( var_4 ) * ( -1 * var_2 );
    var_5 += ( ( randomfloat( 2 ) - 1 ) * var_1, ( randomfloat( 2 ) - 1 ) * var_1, 0 );
    return var_5;
}

_id_8051()
{
    var_0 = 150;
    var_1 = 15000;
    var_2 = self.angles[1];
    var_3 = ( 0, var_2, 0 );
    var_4 = self.origin + anglestoforward( var_3 ) * var_1;
    return var_4;
}

_id_6D7B( var_0 )
{
    self endon( "leaving" );
    self endon( "explode" );
    self endon( "death" );
    self endon( "target_timeout" );

    if ( scripts\mp\utility\game::istrue( var_0 ) && scripts\mp\utility\game::isreallyalive( self.owner ) && ( !isdefined( self._id_A987 ) || self._id_A987 + 10000 <= gettime() ) )
    {
        self.owner scripts\mp\utility\game::_id_C638( "jackal_fire" );
        self._id_A987 = gettime();
    }

    var_1 = scripts\mp\utility\game::_id_C794( self._id_12A95, "orange", self.owner, 1, 0, "killstreak_personal" );
    self._id_11576 = var_1;
    var_2 = 3;
    thread _id_13A4B( self._id_129B9, self._id_12A95, "target_timeout", var_2 );
    self._id_129B9 waittill( "turret_on_target" );
    level thread scripts\mp\battlechatter_mp::_id_EB87( self._id_12A95, "plr_killstreak_target" );
    self._id_129B9 notify( "start_firing" );
    var_3 = weaponfiretime( self.turretweapon );

    if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_moving_fortress" ) )
        var_3 += 0.13;

    while ( isdefined( self._id_12A95 ) && scripts\mp\utility\game::isreallyalive( self._id_12A95 ) && isdefined( self._id_129B9 getturrettarget( 1 ) ) && self._id_129B9 getturrettarget( 1 ) == self._id_12A95 )
    {
        self._id_129B9 shootturret();
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_3 );
    }
}

_id_6D79( var_0 )
{
    self endon( "leaving" );
    self endon( "explode" );
    self endon( "death" );
    self endon( "target_cannon_timeout" );
    var_1 = 3;
    thread _id_13A4B( self._id_38D3, self._id_38DD, "target_cannon_timeout", var_1 );
    self._id_38D3 waittill( "turret_on_target" );
    level thread scripts\mp\battlechatter_mp::_id_EB87( self._id_38DD, "plr_killstreak_target" );

    if ( !_id_0DC9::_id_A69F( self._id_110E8, "passive_moving_fortress" ) )
        thread setmissilekillcament();

    self._id_38D3 notify( "start_firing" );
    var_2 = weaponfiretime( self.cannonweapon );

    if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_moving_fortress" ) )
    {
        var_2 += 0.13;

        while ( isdefined( self._id_38DD ) && scripts\mp\utility\game::isreallyalive( self._id_38DD ) && isdefined( self._id_38D3 getturrettarget( 1 ) ) && self._id_38D3 getturrettarget( 1 ) == self._id_38DD )
        {
            self._id_38D3 shootturret();
            scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_2 );
        }
    }
    else if ( isdefined( self._id_38DD ) && scripts\mp\utility\game::isreallyalive( self._id_38DD ) && isdefined( self._id_38D3 getturrettarget( 1 ) ) && self._id_38D3 getturrettarget( 1 ) == self._id_38DD )
    {
        self._id_38D3 thread watchmissilelaunch();
        self._id_38D3 shootturret();
    }
}

watchmissilelaunch()
{
    self endon( "death" );
    self waittill( "missile_fire", var_0 );
    var_0._id_110E8 = self._id_110E8;
}

setmissilekillcament()
{
    self endon( "leaving" );
    self endon( "explode" );
    self endon( "death" );
    self endon( "target_cannon_timeout" );
    self._id_38D3 waittill( "missile_fire", var_0 );
    var_0._id_131D8 = self;
    var_0._id_131D8._id_A63A = self._id_38D3._id_131D8._id_A63A;
}

_id_13A4B( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self endon( "leaving" );
    var_0 endon( "stop_firing" );
    var_4 = self._id_11576;
    var_5 = var_1 scripts\engine\utility::_id_13736( var_3, "death", "disconnect" );

    if ( var_5 == "timeout" )
        self notify( var_2 );

    if ( var_0.type == "Machine_Gun" )
    {
        if ( isdefined( var_4 ) && isdefined( var_1 ) )
            scripts\mp\utility\game::_id_C78F( var_4, var_1 );

        self _meth_8076();
    }

    var_0 cleartargetentity();
    var_0 notify( "stop_firing" );
}

_id_9F16( var_0 )
{
    self endon( "death" );
    self endon( "leaving" );

    if ( !isdefined( var_0 ) )
        var_0 = 10;

    var_1 = anglestoforward( self.angles );
    var_2 = self._id_12A95.origin - self.origin;
    var_1 *= ( 1, 1, 0 );
    var_2 *= ( 1, 1, 0 );
    var_2 = vectornormalize( var_2 );
    var_1 = vectornormalize( var_1 );
    var_3 = vectordot( var_2, var_1 );
    var_4 = cos( var_0 );

    if ( var_3 >= var_4 )
        return 1;
    else
        return 0;
}

_id_1573( var_0 )
{
    self endon( "death" );
    self endon( "leaving" );
    self notify( "priority_target" );

    if ( isdefined( self._id_C78D ) && isdefined( self._id_12A95 ) )
        scripts\mp\utility\game::_id_C78F( self._id_C78D, self._id_12A95 );

    if ( var_0.size == 1 )
        self._id_12A95 = var_0[0];
    else
        self._id_12A95 = _id_7E05( var_0 );

    if ( isdefined( self._id_12A95 ) )
    {
        self _meth_8076();
        self setlookatent( self._id_12A95 );
        self._id_129B9 settargetentity( self._id_12A95 );
        self._id_A930 = "attackTarget";
        thread _id_6D7B( 1 );
    }
}

_id_156F( var_0 )
{
    self endon( "death" );
    self endon( "leaving" );
    self._id_38DD = _id_7E05( var_0 );

    if ( isdefined( self._id_38DD ) )
    {
        self._id_38D3 settargetentity( self._id_38DD );
        thread _id_6D79( 0 );
    }
}

_id_A3F3()
{
    self endon( "death" );
    self endon( "leaving" );
    var_0 = [];
    var_1 = level.players;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( _id_9F97( var_3 ) )
        {
            if ( isdefined( var_1[var_2] ) )
                var_0[var_0.size] = var_1[var_2];
        }
        else
            continue;

        wait 0.05;
    }

    return var_0;
}

_id_9F97( var_0 )
{
    self endon( "death" );

    if ( !isalive( var_0 ) || var_0.sessionstate != "playing" )
        return 0;

    if ( isdefined( self.owner ) && var_0 == self.owner )
        return 0;

    if ( !isdefined( var_0.pers["team"] ) )
        return 0;

    if ( level.teambased && var_0.pers["team"] == self.team )
        return 0;

    if ( var_0.pers["team"] == "spectator" )
        return 0;

    if ( isdefined( var_0._id_10916 ) && ( gettime() - var_0._id_10916 ) / 1000 <= 5 )
        return 0;

    if ( var_0 scripts\mp\utility\game::_id_12D6( "specialty_blindeye" ) )
        return 0;

    if ( distance2dsquared( self.origin, var_0.origin ) > 4194304 )
        return 0;

    var_1 = ( 0, 0, 35 );
    var_2 = var_0.origin + rotatevector( var_1, var_0 _meth_8517() );
    var_3 = [ self ];
    var_4 = scripts\engine\trace::_id_DCED( self.origin, var_2, var_3, undefined, 1 );

    if ( !isdefined( var_4["entity"] ) )
        return 0;

    return 1;
}

_id_7E05( var_0 )
{
    self endon( "death" );
    var_1 = undefined;
    var_2 = undefined;

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( self._id_12A95 ) && self._id_12A95 == var_4 )
            continue;

        var_5 = abs( vectortoangles( var_4.origin - self.origin )[1] );
        var_6 = abs( self gettagangles( "tag_origin" )[1] );
        var_5 = abs( var_5 - var_6 );
        var_7 = var_4 getweaponlistitems();

        foreach ( var_9 in var_7 )
        {
            if ( issubstr( var_9, "chargeshot" ) || issubstr( var_9, "lockon" ) )
                var_5 -= 40;
        }

        if ( distance( self.origin, var_4.origin ) > 4000 )
            var_5 += 40;

        if ( !isdefined( var_1 ) )
        {
            var_1 = var_5;
            var_2 = var_4;
            continue;
        }

        if ( var_1 > var_5 )
        {
            var_1 = var_5;
            var_2 = var_4;
        }
    }

    if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_moving_fortress" ) )
    {
        if ( !isdefined( var_2 ) && isdefined( self._id_12A95 ) )
            var_2 = self._id_12A95;
    }

    return var_2;
}

_id_8992()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
        var_9 = scripts\mp\utility\game::_id_13CA1( var_9, var_13 );

        if ( ( var_9 == "aamissile_projectile_mp" || var_9 == "nuke_mp" ) && var_4 == "MOD_EXPLOSIVE" && var_0 >= self.health )
            _id_3758( var_1, var_1, 9001, 0, var_4, var_9, var_3, var_2, var_3, 0, 0, var_7 );
    }
}

_id_3758( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_1.owner ) )
            var_1 = var_1.owner;
    }

    if ( ( var_1 == self || isdefined( var_1.pers ) && var_1.pers["team"] == self.team && !level._id_740A && level.teambased ) && var_1 != self.owner )
        return;

    if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_1 ) )
        return;

    if ( self.health <= 0 )
        return;

    var_2 = _id_0DC9::_id_7FBD( var_1, var_5, var_4, var_2, self.maxhealth, 3, 4, 5 );
    scripts\mp\killstreaks\killstreaks::_id_A6A0( var_1, var_5, self, var_4 );
    var_1 scripts\mp\damagefeedback::updatedamagefeedback( "" );
    scripts\mp\damage::_id_AF96( self, var_2, var_1, var_7, var_6, var_4, var_10, undefined, var_11, var_3, var_5 );

    if ( self.health <= var_2 )
    {
        if ( isplayer( var_1 ) && ( !isdefined( self.owner ) || var_1 != self.owner ) )
        {
            var_12 = _id_0AC7::getrarityforlootitem( self._id_110E8._id_1318B );
            var_13 = "callout_destroyed_harrier";

            if ( var_12 != "" )
                var_13 = var_13 + "_" + var_12;

            scripts\mp\damage::onkillstreakkilled( "jackal", var_1, var_5, var_4, var_2, "destroyed_jackal", "jackal_destroyed", var_13 );
        }
    }

    if ( self.health - var_2 <= 900 && ( !isdefined( self._id_1037E ) || !self._id_1037E ) )
        self._id_1037E = 1;

    self vehicle_finishdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

_id_7E3E( var_0, var_1, var_2 )
{
    var_3 = 600;
    var_4 = _id_11A87( var_0, var_1 );
    var_5 = var_4 + var_3;
    var_5 += randomint( var_2 );
    return var_5;
}

_id_CF0B()
{
    self endon( "death" );
    stopfxontag( level._id_8B56, self, "tag_engine_left" );
    playfxontag( level._id_8B59, self, "tag_engine_left" );
    stopfxontag( level._id_8B56, self, "tag_engine_right" );
    playfxontag( level._id_8B59, self, "tag_engine_right" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.15 );
    stopfxontag( level._id_8B56, self, "tag_engine_left2" );
    playfxontag( level._id_8B59, self, "tag_engine_left2" );
    stopfxontag( level._id_8B56, self, "tag_engine_right2" );
    playfxontag( level._id_8B59, self, "tag_engine_right2" );
    playfxontag( level._id_3F19["damage"]["heavy_smoke"], self, "tag_engine_left" );
}

_id_A3BD()
{
    self endon( "jackal_gone" );
    var_0 = self.owner;
    self waittill( "death" );

    if ( isdefined( self._id_12A95 ) && isdefined( self._id_11576 ) )
        scripts\mp\utility\game::_id_C78F( self._id_11576, self._id_12A95 );

    if ( !isdefined( self ) )
        return;

    self.owner scripts\mp\utility\game::_id_41C4( _id_8026( self._id_00BC ) );

    if ( !isdefined( self._id_A859 ) )
    {
        self vehicle_setspeed( 25, 5 );
        thread _id_A3B8( 75 );
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 2.7 );
    }

    _id_A3BF();
}

_id_A3BF()
{
    self playsound( "dropship_explode_mp" );
    level._id_A412[level._id_A412.size - 1] = undefined;
    self notify( "explode" );
    playfxontag( scripts\engine\utility::_id_7ECB( "jackal_explosion" ), self, "j_body" );
    wait 0.35;
    thread _id_A3BC();
}

_id_A3B8( var_0 )
{
    self endon( "explode" );
    self _meth_8076();
    self notify( "jackal_crashing" );
    self setvehgoalpos( self.origin + ( 0, 0, 100 ), 1 );
    self setscriptablepartstate( "engine", "explode", 0 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1.5 );
    self setyawspeed( var_0, var_0, var_0 );
    self _meth_8348( self.angles[1] + var_0 * 2.5 );
}

_id_11A8A( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "acquiringTarget" );
    self endon( "leaving" );
    self endon( "randMove" );
    var_3 = scripts\engine\trace::sphere_trace( self.origin, ( var_0, var_1, var_2 ), 256, self, undefined, 1 );

    if ( var_3["surfacetype"] != "surftype_none" )
        return 0;

    var_4 = ( var_0, var_1, var_2 );
    return var_4;
}

_id_11A87( var_0, var_1 )
{
    self endon( "death" );
    self endon( "acquiringTarget" );
    self endon( "leaving" );
    var_2 = -99999;
    var_3 = self.origin[2] + 2000;
    var_4 = level._id_26A6;
    var_5 = [ self ];

    if ( isdefined( self.dropcrates ) )
    {
        foreach ( var_7 in self.dropcrates )
            var_5[var_5.size] = var_7;
    }

    var_9 = scripts\engine\trace::sphere_trace( ( var_0, var_1, var_3 ), ( var_0, var_1, var_2 ), 256, var_5, undefined, 1 );

    if ( var_9["position"][2] < var_4 )
        var_10 = var_4;
    else
        var_10 = var_9["position"][2];

    return var_10;
}

_id_42AB( var_0 )
{
    self endon( "goal" );
    self endon( "death" );

    for (;;)
    {
        if ( distance2d( self.origin, var_0 ) < 768 )
        {
            self setmaxpitchroll( 10, 25 );
            break;
        }

        wait 0.05;
    }
}

_id_B9FF()
{
    self endon( "death" );
    self endon( "leaving" );

    if ( !isdefined( self.owner ) || self.owner.team != self.team )
    {
        thread _id_A3BF();
        return;
    }

    self.owner scripts\engine\utility::waittill_any( "joined_team", "disconnect" );
    _id_A3BF();
}

_id_13AD6( var_0, var_1 )
{
    self.owner endon( "disconnect" );
    self endon( "death" );
    self endon( "leaving" );
    level endon( "game_ended" );

    for (;;)
    {
        self._id_130AC waittill( "trigger", var_2 );

        if ( var_2 != self.owner )
            continue;

        if ( self.owner scripts\mp\utility\game::isusingremote() )
            continue;

        if ( isdefined( self.owner._id_55E4 ) && self.owner._id_55E4 > 0 )
            continue;

        if ( scripts\mp\utility\game::_id_9FAE( self.owner ) )
            continue;

        var_3 = 0;

        while ( self.owner usebuttonpressed() )
        {
            var_3 += 0.05;

            if ( var_3 > 0.1 )
            {
                var_4 = _id_8026( self._id_00BC );

                if ( var_4 == "guard_location" )
                {
                    var_5 = self.owner.origin[0];
                    var_6 = self.owner.origin[1];
                    var_7 = self.origin[2];
                    var_8 = ( var_5, var_6, var_7 );
                    var_9 = scripts\engine\trace::_id_48BC( 0, 1, 1, 1, 1, 1, 0 );

                    if ( !scripts\engine\trace::_id_DCF1( self.origin, var_8, self, var_9 ) )
                    {
                        self.owner scripts\mp\hud_message::_id_10122( "KILLSTREAKS_CANNOT_BE_CALLED" );
                        break;
                    }
                }

                self._id_00BC = var_4;
                self notify( self._id_00BC );

                if ( self._id_00BC == "guard_location" )
                {
                    var_0 = "follow_player";
                    var_1 = &"KILLSTREAKS_HINTS_JACKAL_FOLLOW";
                    self.owner scripts\mp\utility\game::_id_C638( "jackal_guard" );
                    self.owner playlocalsound( "mp_killstreak_warden_switch_mode" );
                    thread _id_5D8F();
                    thread guardposition( self.owner.origin );
                }
                else
                {
                    var_0 = "guard_location";
                    var_1 = &"KILLSTREAKS_HINTS_JACKAL_GUARD";
                    self.owner playlocalsound( "mp_killstreak_warden_switch_mode" );
                    thread patrolfield();
                    thread _id_5D8F();
                }

                self._id_130AC makeunusable();
                scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1 );
                self._id_4C08 = var_1;
                self._id_130AC _id_0DC9::_id_F774( self.owner, self._id_4C08, 360, 360, 30000, 30000, 2 );
                break;
            }

            wait 0.05;
        }

        wait 0.05;
    }
}

_id_5D8F()
{
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.3 );
    self playsoundonmovingent( "dropship_killstreak_thrust_change" );
}

_id_8026( var_0 )
{
    if ( var_0 == "follow_player" )
        var_0 = "guard_location";
    else
        var_0 = "follow_player";

    return var_0;
}

_id_B06C( var_0, var_1 )
{
    level endon( "game_ended" );

    for (;;)
    {
        triggerfx( var_0 );
        wait 0.05;

        if ( !isdefined( var_1 ) || !isdefined( var_0 ) )
            break;
    }

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_2526( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = undefined;
    var_4 = 6000;
    var_5 = ( 0, 0, var_4 );
    var_6 = 3000;
    var_7 = anglestoforward( self.angles );
    var_8 = self.origin;
    var_9 = var_8 + var_5 + var_7 * var_6 * -1;
    var_10 = [ self ];
    var_11 = 0;
    var_12 = scripts\engine\trace::_id_DCED( var_0 + ( 0, 0, var_4 ), var_0 );

    if ( var_12["fraction"] > 0.99 )
    {
        var_11 = 1;
        var_9 = var_0 + ( 0, 0, var_4 );
    }

    if ( !var_11 )
    {
        var_12 = scripts\engine\trace::_id_DCED( var_0 + ( 300, 0, var_4 ), var_0 );

        if ( var_12["fraction"] > 0.99 )
        {
            var_11 = 1;
            var_9 = var_0 + ( 300, 0, var_4 );
        }
    }

    if ( !var_11 )
    {
        var_12 = scripts\engine\trace::_id_DCED( var_0 + ( 0, 300, var_4 ), var_0 );

        if ( var_12["fraction"] > 0.99 )
        {
            var_11 = 1;
            var_9 = var_0 + ( 0, 300, var_4 );
        }
    }

    if ( !var_11 )
    {
        var_12 = scripts\engine\trace::_id_DCED( var_0 + ( 0, -300, var_4 ), var_0 );

        if ( var_12["fraction"] > 0.99 )
        {
            var_11 = 1;
            var_9 = var_0 + ( 0, -300, var_4 );
        }
    }

    if ( !var_11 )
    {
        var_12 = scripts\engine\trace::_id_DCED( var_0 + ( 300, 300, var_4 ), var_0 );

        if ( var_12["fraction"] > 0.99 )
        {
            var_11 = 1;
            var_9 = var_0 + ( 300, 300, var_4 );
        }
    }

    if ( !var_11 )
    {
        var_12 = scripts\engine\trace::_id_DCED( var_0 + ( -300, 0, var_4 ), var_0 );

        if ( var_12["fraction"] > 0.99 )
        {
            var_11 = 1;
            var_9 = var_0 + ( -300, 0, var_4 );
        }
    }

    if ( !var_11 )
    {
        var_12 = scripts\engine\trace::_id_DCED( var_0 + ( -300, -300, var_4 ), var_0 );

        if ( var_12["fraction"] > 0.99 )
        {
            var_11 = 1;
            var_9 = var_0 + ( -300, -300, var_4 );
        }
    }

    if ( !var_11 )
    {
        var_12 = scripts\engine\trace::_id_DCED( var_0 + ( 300, -300, var_4 ), var_0 );

        if ( var_12["fraction"] > 0.99 )
        {
            var_11 = 1;
            var_9 = var_0 + ( 300, -300, var_4 );
        }
    }

    if ( !var_11 )
    {
        for ( var_13 = 0; var_13 < 5; var_13++ )
        {
            var_4 /= 2;
            var_5 = ( 0, 0, var_4 );
            var_9 = var_8 + var_5 + var_7 * var_6 * -1;
            var_14 = scripts\engine\trace::_id_DCED( var_0, var_9, var_10 );

            if ( var_14["fraction"] > 0.99 )
            {
                var_11 = 1;
                break;
            }

            wait 0.05;
        }
    }

    if ( !var_11 )
    {
        for ( var_13 = 0; var_13 < 5; var_13++ )
        {
            var_4 *= 2.5;
            var_5 = ( 0, 0, var_4 );
            var_9 = var_8 + var_5 + var_7 * var_6 * -1;
            var_14 = scripts\engine\trace::_id_DCED( var_0, var_9, var_10 );

            if ( var_14["fraction"] > 0.99 )
            {
                var_11 = 1;
                break;
            }

            wait 0.05;
        }
    }
}

_id_D4C1()
{
    if ( isdefined( self._id_D4AD ) && self._id_D4AD )
        return;

    scripts\engine\utility::_id_CD86( "javelin_clu_lock", self.origin );
    self._id_D4AD = 1;
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.75 );
    self stoploopsound( "javelin_clu_lock" );
    self._id_D4AD = 0;
}

_id_D4C0()
{
    if ( isdefined( self._id_D4AD ) && self._id_D4AD )
        return;

    self playlocalsound( "javelin_clu_aquiring_lock" );
    self._id_D4AD = 1;
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.75 );
    self stopolcalsound( "javelin_clu_aquiring_lock" );
    self._id_D4AD = 0;
}

_id_2A65()
{
    self endon( "death" );
    self notify( "begin_evasive_maneuvers" );
    self endon( "begin_evasive_maneuvers" );
    self._id_67E3 = 1;
    var_0 = scripts\engine\utility::_id_13736( 3.0, "death" );

    if ( var_0 == "timeout" )
        self._id_67E3 = 0;
}

_id_13A9C()
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "following_player" );

    for (;;)
    {
        var_0 = undefined;

        if ( scripts\mp\utility\game::istrue( self._id_67E3 ) )
        {
            var_1 = self.owner.origin[0];
            var_2 = self.owner.origin[1];
            var_3 = var_1 + randomintrange( -500, 500 );
            var_4 = var_2 + randomintrange( -500, 500 );
            var_5 = _id_7E3E( var_3, var_4, 350 );
            var_0 = ( var_3, var_4, var_5 );
        }

        if ( isdefined( var_0 ) )
            self setvehgoalpos( var_0, 1 );

        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.1 );
    }
}

watchdropcratesearly( var_0 )
{
    self endon( "dropped_crates" );
    var_1 = self.dropcrates;
    self waittill( "death" );
    thread dropcrates( var_1, var_0 );
}

dropcrates( var_0, var_1 )
{
    var_2 = ( 0, 0, 0 );
    var_3 = 1200;

    foreach ( var_6, var_5 in var_0 )
    {
        var_5 unlink();
        var_5 physicslaunchserver( ( 0, 0, 0 ), var_2, var_3 );
        var_5 thread scripts\mp\killstreaks\airdrop::_id_CB14( var_5._id_5EF1, var_5._id_485F, var_2, var_3 );
        var_5 thread scripts\mp\killstreaks\airdrop::_id_A66E();
        var_5._id_12BE7 = scripts\mp\killstreaks\airdrop::_id_A66D;
        var_5 thread scripts\mp\killstreaks\airdrop::handlenavobstacle();
        var_5 thread watchforcapture( self, var_6 );
        wait 0.1;
    }

    if ( isdefined( var_1._id_1349C ) )
        var_1._id_1349C delete();

    self notify( "dropped_crates" );
}

watchforcapture( var_0, var_1 )
{
    scripts\engine\utility::waittill_any( "captured", "death" );
    var_0 notify( "crate_captured_" + var_1 );
}

watchjackalcratepickup()
{
    self endon( "death" );
    self endon( "leaving" );
    var_0 = 0;

    for (;;)
    {
        scripts\engine\utility::waittill_any( "crate_captured_0", "crate_captured_1", "crate_captured_2" );
        var_0++;

        if ( var_0 == self.dropcrates.size )
        {
            self notify( "all_crates_gone" );
            break;
        }
    }
}

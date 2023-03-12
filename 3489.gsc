// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "littlebird_support", ::_id_128EE );
    level._id_8DBA = [];
    level._id_8DBA["littlebird_support"] = spawnstruct();
    level._id_8DBA["littlebird_support"]._id_11901 = 60.0;
    level._id_8DBA["littlebird_support"].health = 999999;
    level._id_8DBA["littlebird_support"].maxhealth = 2000;
    level._id_8DBA["littlebird_support"]._id_110EA = "littlebird_support";
    level._id_8DBA["littlebird_support"]._id_13260 = "attack_littlebird_mp";
    level._id_8DBA["littlebird_support"]._id_039B = "littlebird_guard_minigun_mp";
    level._id_8DBA["littlebird_support"]._id_13CA9 = "vehicle_little_bird_minigun_left";
    level._id_8DBA["littlebird_support"]._id_13CAA = "vehicle_little_bird_minigun_right";
    level._id_8DBA["littlebird_support"]._id_13CD9 = "tag_flash";
    level._id_8DBA["littlebird_support"]._id_13CDA = "tag_flash_2";
    level._id_8DBA["littlebird_support"]._id_F267 = "auto_nonai";
    level._id_8DBA["littlebird_support"]._id_B91A = "vehicle_aas_72x_killstreak";
    level._id_8DBA["littlebird_support"]._id_115EB = "used_littlebird_support";
    _id_AADA();
    _id_AAD8();
}

_id_128EE( var_0, var_1 )
{
    var_2 = "littlebird_support";
    var_3 = 1;

    if ( isdefined( level._id_AD89 ) || scripts\mp\killstreaks\helicopter::_id_68C3( var_2 ) )
    {
        self iprintlnbold( &"KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }
    else if ( !level._id_1A66.size )
    {
        self iprintlnbold( &"KILLSTREAKS_UNAVAILABLE_IN_LEVEL" );
        return 0;
    }
    else if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + var_3 >= scripts\mp\utility\game::_id_B4D2() )
    {
        self iprintlnbold( &"KILLSTREAKS_TOO_MANY_VEHICLES" );
        return 0;
    }

    scripts\mp\utility\game::_id_93FA();
    var_4 = _id_49E1( var_2 );

    if ( !isdefined( var_4 ) )
    {
        scripts\mp\utility\game::_id_4FC1();
        return 0;
    }

    thread _id_10DBE( var_4 );
    level thread scripts\mp\utility\game::_id_115DE( level._id_8DBA[var_2]._id_115EB, self, self.team );
    return 1;
}

_id_49E1( var_0 )
{
    var_1 = _id_AAD2( self.origin );

    if ( isdefined( var_1.angles ) )
        var_2 = var_1.angles;
    else
        var_2 = ( 0, 0, 0 );

    var_3 = scripts\mp\killstreaks\airdrop::_id_7EC0( self.origin );
    var_4 = _id_AAD1( self.origin );
    var_5 = anglestoforward( self.angles );
    var_6 = var_4.origin * ( 1, 1, 0 ) + ( 0, 0, 1 ) * var_3 + var_5 * -100;
    var_7 = var_1.origin;
    var_8 = spawnhelicopter( self, var_7, var_2, level._id_8DBA[var_0]._id_13260, level._id_8DBA[var_0]._id_B91A );

    if ( !isdefined( var_8 ) )
        return;

    var_8 scripts\mp\killstreaks\helicopter::_id_1852();
    var_8 thread scripts\mp\killstreaks\helicopter::_id_E111();
    var_8.health = level._id_8DBA[var_0].health;
    var_8.maxhealth = level._id_8DBA[var_0].maxhealth;
    var_8._id_00E1 = 0;
    var_8._id_02B3 = 100;
    var_8._id_7247 = 40;
    var_8.owner = self;
    var_8 _meth_831F( self );
    var_8.team = self.team;
    var_8 setmaxpitchroll( 45, 45 );
    var_8 vehicle_setspeed( var_8._id_02B3, 100, 40 );
    var_8 setyawspeed( 120, 60 );
    var_8 setneargoalnotifydist( 512 );
    var_8._id_A644 = 0;
    var_8.helitype = "littlebird";
    var_8._id_8DBB = "littlebird_support";
    var_8._id_11587 = 2000;
    var_8 scripts\mp\sentientpoolmanager::registersentient( "Killstreak_Air", self );
    var_8._id_1157A = var_6;
    var_8._id_4BF7 = var_4;
    var_9 = spawnturret( "misc_turret", var_8.origin, level._id_8DBA[var_0]._id_039B );
    var_9 linkto( var_8, level._id_8DBA[var_0]._id_13CD9, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_9 setmodel( level._id_8DBA[var_0]._id_13CA9 );
    var_9.angles = var_8.angles;
    var_9.owner = var_8.owner;
    var_9.team = self.team;
    var_9 maketurretinoperable();
    var_9.vehicle = var_8;
    var_8._id_B6C0 = var_9;
    var_8._id_B6C0 setdefaultdroppitch( 0 );
    var_10 = var_8.origin + ( anglestoforward( var_8.angles ) * -100 + anglestoright( var_8.angles ) * -100 ) + ( 0, 0, 50 );
    var_9._id_A63A = spawn( "script_model", var_10 );
    var_9._id_A63A setscriptmoverkillcam( "explosive" );
    var_9._id_A63A linkto( var_8, "tag_origin" );
    var_9 = spawnturret( "misc_turret", var_8.origin, level._id_8DBA[var_0]._id_039B );
    var_9 linkto( var_8, level._id_8DBA[var_0]._id_13CDA, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_9 setmodel( level._id_8DBA[var_0]._id_13CAA );
    var_9.angles = var_8.angles;
    var_9.owner = var_8.owner;
    var_9.team = self.team;
    var_9 maketurretinoperable();
    var_9.vehicle = var_8;
    var_8._id_B6C1 = var_9;
    var_8._id_B6C1 setdefaultdroppitch( 0 );
    var_10 = var_8.origin + ( anglestoforward( var_8.angles ) * -100 + anglestoright( var_8.angles ) * 100 ) + ( 0, 0, 50 );
    var_9._id_A63A = spawn( "script_model", var_10 );
    var_9._id_A63A setscriptmoverkillcam( "explosive" );
    var_9._id_A63A linkto( var_8, "tag_origin" );

    if ( level.teambased )
    {
        var_8._id_B6C0 _meth_835E( self.team );
        var_8._id_B6C1 _meth_835E( self.team );
    }

    var_8._id_B6C0 _meth_830F( level._id_8DBA[var_0]._id_F267 );
    var_8._id_B6C1 _meth_830F( level._id_8DBA[var_0]._id_F267 );
    var_8._id_B6C0 _meth_8336( self );
    var_8._id_B6C1 _meth_8336( self );
    var_8._id_B6C0 thread _id_AACB();
    var_8._id_B6C1 thread _id_AACB();
    var_8._id_254D = 10000;
    var_8._id_254C = 150;
    var_8._id_2550 = missile_createattractorent( var_8, var_8._id_254D, var_8._id_254C );
    var_8._id_8BE5 = 0;
    var_8._id_61A3 = 0;
    var_8 thread _id_AAD4();
    var_8 thread _id_AADB();
    var_8 thread _id_AAE1();
    var_8 thread _id_AADD();
    var_8 thread _id_AADC();
    var_8 thread _id_AADE();
    var_8 thread _id_AAD6();
    level._id_AD89 = var_8;
    var_8.owner scripts\mp\matchdata::_id_AFC9( level._id_8DBA[var_8._id_8DBB]._id_110EA, var_8._id_1157A );
    return var_8;
}

_id_AAD6()
{
    playfxontag( level._id_3F19["light"]["left"], self, "tag_light_nose" );
    wait 0.05;
    playfxontag( level._id_3F19["light"]["belly"], self, "tag_light_belly" );
    wait 0.05;
    playfxontag( level._id_3F19["light"]["tail"], self, "tag_light_tail1" );
    wait 0.05;
    playfxontag( level._id_3F19["light"]["tail"], self, "tag_light_tail2" );
}

_id_10DBE( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 setlookatent( self );
    var_0 setvehgoalpos( var_0._id_1157A );
    var_0 waittill( "near_goal" );
    var_0 vehicle_setspeed( var_0._id_02B3, 60, 30 );
    var_0 waittill( "goal" );
    var_0 setvehgoalpos( var_0._id_4BF7.origin, 1 );
    var_0 waittill( "goal" );
    var_0 thread _id_AACF();
    var_0 thread _id_0D9B::_id_6EAA( ::_id_AADF );
    var_0 thread _id_0D9B::_id_6EAB( ::_id_AAE0 );
}

_id_AACF()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );

    if ( !isdefined( self.owner ) )
    {
        thread _id_AAD5();
        return;
    }

    self.owner endon( "disconnect" );
    self endon( "owner_gone" );
    self vehicle_setspeed( self._id_7247, 20, 20 );

    for (;;)
    {
        if ( isdefined( self.owner ) && isalive( self.owner ) )
        {
            var_0 = _id_AAD0( self.owner.origin );

            if ( isdefined( var_0 ) && var_0 != self._id_4BF7 )
            {
                self._id_4BF7 = var_0;
                _id_AAD7();
                continue;
            }
        }

        wait 1;
    }
}

_id_AAD7()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "death" );
    self.owner endon( "disconnect" );
    self endon( "owner_gone" );
    self notify( "lbSupport_moveToPlayer" );
    self endon( "lbSupport_moveToPlayer" );
    self._id_9A95 = 1;
    self setvehgoalpos( self._id_4BF7.origin + ( 0, 0, 100 ), 1 );
    self waittill( "goal" );
    self._id_9A95 = 0;
    self notify( "hit_goal" );
}

_id_AADB()
{
    level endon( "game_ended" );
    self endon( "gone" );
    self waittill( "death" );
    thread scripts\mp\killstreaks\helicopter::_id_AAC7();
}

_id_AAE1()
{
    level endon( "game_ended" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    self endon( "owner_gone" );
    var_0 = level._id_8DBA[self._id_8DBB]._id_11901;
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    thread _id_AAD5();
}

_id_AADD()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner waittill( "killstreak_disowned" );
    self notify( "owner_gone" );
    thread _id_AAD5();
}

_id_AADC()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "disconnect" );
    self endon( "owner_gone" );

    for (;;)
    {
        self.owner waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
        var_9 = scripts\mp\utility\game::_id_13CA1( var_9, var_13 );

        if ( isplayer( var_1 ) )
        {
            if ( var_1 != self.owner && distance2d( var_1.origin, self.origin ) <= self._id_11587 && !var_1 scripts\mp\utility\game::_id_12D6( "specialty_blindeye" ) && !( level._id_8B38 && level.teambased && var_1.team == self.team ) )
            {
                self setlookatent( var_1 );

                if ( isdefined( self._id_B6C0 ) )
                    self._id_B6C0 settargetentity( var_1 );

                if ( isdefined( self._id_B6C1 ) )
                    self._id_B6C1 settargetentity( var_1 );
            }
        }
    }
}

_id_AADE()
{
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "disconnect" );
    self endon( "owner_gone" );
    level scripts\engine\utility::waittill_any( "round_end_finished", "game_ended" );
    thread _id_AAD5();
}

_id_AAD5()
{
    self endon( "death" );
    self notify( "leaving" );
    level._id_AD89 = undefined;
    self _meth_8076();
    var_0 = scripts\mp\killstreaks\airdrop::_id_7EC0( self.origin );
    var_1 = self.origin + ( 0, 0, var_0 );
    self vehicle_setspeed( self._id_02B3, 60 );
    self setmaxpitchroll( 45, 180 );
    self setvehgoalpos( var_1 );
    self waittill( "goal" );
    var_1 += anglestoforward( self.angles ) * 15000;
    var_2 = spawn( "script_origin", var_1 );

    if ( isdefined( var_2 ) )
    {
        self setlookatent( var_2 );
        var_2 thread _id_13589( 3.0 );
    }

    self setvehgoalpos( var_1 );
    self waittill( "goal" );
    self notify( "gone" );
    scripts\mp\killstreaks\helicopter::_id_E139();
}

_id_13589( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    wait( var_0 );
    self delete();
}

_id_AAD4()
{
    self endon( "death" );
    level endon( "game_ended" );
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
        var_9 = scripts\mp\utility\game::_id_13CA1( var_9, var_13 );

        if ( !scripts\mp\weapons::_id_7415( self.owner, var_1 ) )
            continue;

        if ( !isdefined( self ) )
            return;

        if ( isdefined( var_8 ) && var_8 & level.idflags_penetration )
            self._id_1390E = 1;

        if ( isdefined( var_8 ) && var_8 & level.idflags_no_team_protection )
            self._id_1390F = 1;

        self._id_1390B = 1;
        var_14 = var_0;

        if ( isplayer( var_1 ) )
        {
            if ( var_1 != self.owner && distance2d( var_1.origin, self.origin ) <= self._id_11587 && !var_1 scripts\mp\utility\game::_id_12D6( "specialty_blindeye" ) && !( level._id_8B38 && level.teambased && var_1.team == self.team ) )
            {
                self setlookatent( var_1 );

                if ( isdefined( self._id_B6C0 ) )
                    self._id_B6C0 settargetentity( var_1 );

                if ( isdefined( self._id_B6C1 ) )
                    self._id_B6C1 settargetentity( var_1 );
            }

            var_1 scripts\mp\damagefeedback::updatedamagefeedback( "helicopter" );

            if ( var_4 == "MOD_RIFLE_BULLET" || var_4 == "MOD_PISTOL_BULLET" )
            {
                if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_armorpiercing" ) )
                    var_14 += var_0 * level._id_218B;
            }
        }

        if ( isdefined( var_1.owner ) && isplayer( var_1.owner ) )
            var_1.owner scripts\mp\damagefeedback::updatedamagefeedback( "helicopter" );

        if ( isdefined( var_9 ) )
        {
            switch ( var_9 )
            {
                case "remotemissile_projectile_mp":
                case "javelin_mp":
                case "remote_mortar_missile_mp":
                case "stinger_mp":
                case "ac130_40mm_mp":
                case "ac130_105mm_mp":
                    self._id_A859 = 1;
                    var_14 = self.maxhealth + 1;
                    break;
                case "sam_projectile_mp":
                    self._id_A859 = 1;
                    var_14 = self.maxhealth * 0.25;
                    break;
                case "emp_grenade_mp":
                    var_14 = 0;
                    thread _id_AACE();
                    break;
                case "osprey_player_minigun_mp":
                    self._id_A859 = 0;
                    var_14 *= 2;
                    break;
            }

            scripts\mp\killstreaks\killstreaks::_id_A6A0( var_1, var_9, self );
        }

        self._id_00E1 += var_14;

        if ( self._id_00E1 >= self.maxhealth )
        {
            if ( isplayer( var_1 ) && ( !isdefined( self.owner ) || var_1 != self.owner ) )
            {
                var_1 notify( "destroyed_helicopter" );
                var_1 notify( "destroyed_killstreak", var_9 );
                thread scripts\mp\utility\game::_id_115DE( "callout_destroyed_little_bird", var_1 );
                var_1 thread scripts\mp\utility\game::_id_83B4( "kill", var_9, 300 );
                var_1 thread scripts\mp\rank::scoreeventpopup( "destroyed_little_bird" );
            }

            if ( isdefined( self.owner ) )
                self.owner thread scripts\mp\utility\game::leaderdialogonplayer( "lbguard_destroyed" );

            self notify( "death" );
            return;
        }
    }
}

_id_AACE()
{
    self notify( "lbSupport_EMPGrenaded" );
    self endon( "lbSupport_EMPGrenaded" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    level endon( "game_ended" );
    self._id_61A3 = 1;

    if ( isdefined( self._id_B6C1 ) )
        self._id_B6C1 notify( "stop_shooting" );

    if ( isdefined( self._id_B6C0 ) )
        self._id_B6C0 notify( "stop_shooting" );

    if ( isdefined( level._effect["ims_sensor_explode"] ) )
    {
        if ( isdefined( self._id_B6C1 ) )
            playfxontag( scripts\engine\utility::_id_7ECB( "ims_sensor_explode" ), self._id_B6C1, "tag_aim" );

        if ( isdefined( self._id_B6C0 ) )
            playfxontag( scripts\engine\utility::_id_7ECB( "ims_sensor_explode" ), self._id_B6C0, "tag_aim" );
    }

    wait 3.5;
    self._id_61A3 = 0;

    if ( isdefined( self._id_B6C1 ) )
        self._id_B6C1 notify( "turretstatechange" );

    if ( isdefined( self._id_B6C0 ) )
        self._id_B6C0 notify( "turretstatechange" );
}

_id_AADF( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );
    var_2 endon( "death" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( isdefined( var_3[var_4] ) && !var_2._id_8BE5 )
        {
            var_2._id_8BE5 = 1;
            var_5 = spawn( "script_origin", var_2.origin );
            var_5.angles = var_2.angles;
            var_5 movegravity( anglestoright( var_3[var_4].angles ) * -1000, 0.05 );
            var_5 thread _id_0D9B::_id_6E9F( 5.0 );

            for ( var_6 = 0; var_6 < var_3.size; var_6++ )
            {
                if ( isdefined( var_3[var_6] ) )
                    var_3[var_6] _meth_8206( var_5 );
            }

            var_7 = var_2.origin + anglestoright( var_3[var_4].angles ) * 200;
            var_2 vehicle_setspeed( var_2._id_02B3, 100, 40 );
            var_2 setvehgoalpos( var_7, 1 );
            wait 2.0;
            var_2 vehicle_setspeed( var_2._id_7247, 20, 20 );
            break;
        }
    }
}

_id_AAE0( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    var_2 endon( "death" );

    if ( isdefined( self ) && !var_2._id_8BE5 )
    {
        var_2._id_8BE5 = 1;
        var_3 = spawn( "script_origin", var_2.origin );
        var_3.angles = var_2.angles;
        var_3 movegravity( anglestoright( self.angles ) * -1000, 0.05 );
        var_3 thread _id_0D9B::_id_6E9F( 5.0 );
        self _meth_8206( var_3 );
        var_4 = var_2.origin + anglestoright( self.angles ) * 200;
        var_2 vehicle_setspeed( var_2._id_02B3, 100, 40 );
        var_2 setvehgoalpos( var_4, 1 );
        wait 2.0;
        var_2 vehicle_setspeed( var_2._id_7247, 20, 20 );
    }
}

_id_AAD2( var_0 )
{
    var_1 = undefined;
    var_2 = 999999;

    foreach ( var_4 in level._id_1A6B )
    {
        var_5 = distance( var_4.origin, var_0 );

        if ( var_5 < var_2 )
        {
            var_1 = var_4;
            var_2 = var_5;
        }
    }

    return var_1;
}

_id_AAD1( var_0 )
{
    var_1 = undefined;
    var_2 = 999999;

    foreach ( var_4 in level._id_1A66 )
    {
        var_5 = distance( var_4.origin, var_0 );

        if ( var_5 < var_2 )
        {
            var_1 = var_4;
            var_2 = var_5;
        }
    }

    return var_1;
}

_id_AAD0( var_0 )
{
    var_1 = undefined;
    var_2 = distance2d( self._id_4BF7.origin, var_0 );
    var_3 = var_2;

    foreach ( var_5 in self._id_4BF7._id_BEAA )
    {
        var_6 = distance2d( var_5.origin, var_0 );

        if ( var_6 < var_2 && var_6 < var_3 )
        {
            var_1 = var_5;
            var_3 = var_6;
        }
    }

    return var_1;
}

_id_AACA( var_0, var_1 )
{
    if ( var_0.size <= 0 )
        return 0;

    foreach ( var_3 in var_0 )
    {
        if ( var_3 == var_1 )
            return 1;
    }

    return 0;
}

_id_AAD3()
{
    var_0 = [];

    if ( isdefined( self._id_EE01 ) )
    {
        var_1 = scripts\engine\utility::_id_7A9C();

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = scripts\engine\utility::_id_817E( var_1[var_2], "script_linkname" );

            if ( isdefined( var_3 ) )
                var_0[var_0.size] = var_3;
        }
    }

    return var_0;
}

_id_AADA()
{
    level._id_1A6B = scripts\engine\utility::_id_8180( "chopper_boss_path_start", "targetname" );

    foreach ( var_1 in level._id_1A6B )
        var_1._id_BEAA = var_1 _id_AAD3();
}

_id_AAD9()
{
    level._id_1A67 = scripts\engine\utility::_id_8180( "chopper_boss_path", "targetname" );

    foreach ( var_1 in level._id_1A67 )
        var_1._id_BEAA = var_1 _id_AAD3();
}

_id_AAD8()
{
    level._id_1A66 = scripts\engine\utility::_id_8180( "so_chopper_boss_path_struct", "script_noteworthy" );

    foreach ( var_1 in level._id_1A66 )
    {
        var_1._id_BEAA = var_1 _id_AAD3();

        foreach ( var_3 in level._id_1A66 )
        {
            if ( var_1 == var_3 )
                continue;

            if ( !_id_AACA( var_1._id_BEAA, var_3 ) && _id_AACA( var_3 _id_AAD3(), var_1 ) )
                var_1._id_BEAA[var_1._id_BEAA.size] = var_3;
        }
    }
}

_id_AACB()
{
    self.vehicle endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "turretstatechange" );

        if ( self _meth_81A0() && !self.vehicle._id_61A3 )
        {
            thread _id_AACC();
            continue;
        }

        thread _id_AACD();
    }
}

_id_AACC()
{
    self.vehicle endon( "death" );
    self.vehicle endon( "leaving" );
    self endon( "stop_shooting" );
    level endon( "game_ended" );
    var_0 = 0.1;
    var_1 = 40;
    var_2 = 80;
    var_3 = 1.0;
    var_4 = 2.0;

    for (;;)
    {
        var_5 = randomintrange( var_1, var_2 + 1 );

        for ( var_6 = 0; var_6 < var_5; var_6++ )
        {
            var_7 = self getturrettarget( 0 );

            if ( isdefined( var_7 ) && ( !isdefined( var_7._id_10916 ) || ( gettime() - var_7._id_10916 ) / 1000 > 5 ) && ( isdefined( var_7.team ) && var_7.team != "spectator" ) && scripts\mp\utility\game::isreallyalive( var_7 ) )
            {
                self.vehicle setlookatent( var_7 );
                self shootturret();
            }

            wait( var_0 );
        }

        wait( randomfloatrange( var_3, var_4 ) );
    }
}

_id_AACD()
{
    self notify( "stop_shooting" );

    if ( isdefined( self.vehicle.owner ) )
        self.vehicle setlookatent( self.vehicle.owner );
}

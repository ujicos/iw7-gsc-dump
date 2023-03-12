// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\helicopter_guard::_id_AADA();
    scripts\mp\killstreaks\helicopter_guard::_id_AAD8();
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "heli_sniper", ::_id_128E8 );
    var_0 = spawnstruct();
    var_0._id_EC44 = "destroyed_helo_scout";
    var_0._id_3774 = "callout_destroyed_helo_scout";
    var_0._id_EB11 = 0.09;
    var_0._id_65D0 = "tag_engine_right";
    level._id_8DA6["heli_sniper"] = var_0;
}

_id_128E8( var_0, var_1 )
{
    var_2 = _id_7E37( self.origin );
    var_3 = _id_7E34( self.origin );
    var_4 = vectortoangles( var_3.origin - var_2.origin );

    if ( isdefined( self._id_12B90 ) && self._id_12B90 )
        return 0;

    if ( isdefined( self._id_9E5C ) && self._id_9E5C == 1 )
        return 0;
    else if ( !isdefined( level._id_1A66 ) || !isdefined( var_2 ) || !isdefined( var_3 ) )
    {
        self iprintlnbold( &"KILLSTREAKS_UNAVAILABLE_IN_LEVEL" );
        return 0;
    }

    var_5 = 1;

    if ( _id_68C2() )
    {
        self iprintlnbold( &"KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }

    if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + var_5 >= scripts\mp\utility\game::_id_B4D2() )
    {
        self iprintlnbold( &"KILLSTREAKS_TOO_MANY_VEHICLES" );
        return 0;
    }

    if ( isdefined( self._id_9D7F ) && self._id_9D7F )
        return 0;

    if ( isdefined( self._id_9F28 ) && self._id_9F28 )
        return 0;

    var_6 = _id_49D1( self, var_2, var_3, var_4, var_1, var_0 );

    if ( !isdefined( var_6 ) )
        return 0;

    var_7 = _id_8DC0( var_6, var_1 );

    if ( isdefined( var_7 ) && var_7 == "fail" )
        return 0;

    return 1;
}

_id_68C2()
{
    return isdefined( level._id_AAC8 );
}

_id_7E37( var_0 )
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

_id_49D1( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = getent( "airstrikeheight", "targetname" );
    var_7 = var_2.origin;
    var_8 = anglestoforward( var_3 );
    var_9 = var_1.origin;
    var_10 = spawnhelicopter( var_0, var_9, var_8, "attack_littlebird_mp", "vehicle_aas_72x_killstreak" );

    if ( !isdefined( var_10 ) )
        return;

    var_11 = scripts\mp\utility\game::_id_7EFA();
    var_12 = var_7 + ( scripts\mp\utility\game::_id_7EF9() + var_11 );
    var_13 = var_7 + scripts\mp\utility\game::_id_7EF9() - var_11;
    var_14 = bullettrace( var_12, var_13, 0, 0, 0, 0, 1 );

    if ( isdefined( var_14["entity"] ) && var_14["normal"][2] > 0.1 )
        var_7 = var_14["position"] - scripts\mp\utility\game::_id_7EF9() + ( 0, 0, 384 );

    var_10 scripts\mp\killstreaks\helicopter::_id_1852( "lbSniper" );
    var_10 thread scripts\mp\killstreaks\helicopter::_id_E111();
    var_10 thread _id_136B6();
    var_10._id_AC68 = var_5;
    var_10._id_0143 = var_8;
    var_10._id_C973 = var_9;
    var_10._id_C96C = var_7;
    var_10._id_C96B = var_1.origin;
    var_10._id_7003 = var_7[2];
    var_10._id_B4A3 = var_6.origin;
    var_10._id_C537 = var_1.origin;
    var_10._id_CB45 = var_10._id_C537 + ( 0, 0, 300 );
    var_10._id_90F1 = var_10._id_C537 + ( 0, 0, 600 );
    var_10._id_7338 = var_8[1];
    var_10._id_273E = var_8[1] + 180;

    if ( var_10._id_273E > 360 )
        var_10._id_273E -= 360;

    var_10.helitype = "littlebird";
    var_10._id_8DA0 = "littlebird";
    var_10._id_AED3 = var_1._id_C6F9;
    var_10._id_1CA6 = 1;
    var_10._id_2550 = missile_createattractorent( var_10, level._id_8D2E, level._id_8D2D );
    var_10._id_9DBF = 0;
    var_10.maxhealth = level._id_8D73;
    var_10 thread _id_0D9B::_id_6EAD( 1 );
    var_10 thread scripts\mp\killstreaks\helicopter::_id_8D40( "heli_sniper", 1 );
    var_10 thread _id_8DB4( var_4 );
    var_10.owner = var_0;
    var_10.team = var_0.team;
    var_10 thread _id_AB2F();
    var_10._id_02B3 = 100;
    var_10._id_1E2D = 100;
    var_10._id_7247 = 40;
    var_10 setcandamage( 1 );
    var_10 setmaxpitchroll( 45, 45 );
    var_10 vehicle_setspeed( var_10._id_02B3, 100, 40 );
    var_10 setyawspeed( 120, 60 );
    var_10 sethoverparams( 10, 10, 60 );
    var_10 setneargoalnotifydist( 512 );
    var_10._id_A644 = 0;
    var_10._id_110EA = "heli_sniper";
    var_10._id_1C79 = 0;
    var_10._id_C834 = 0;
    var_10 _meth_8187( "tag_wings" );
    return var_10;
}

_id_7DFC( var_0 )
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "helicopter_removed" );
    self endon( "heightReturned" );
    var_1 = getent( "airstrikeheight", "targetname" );

    if ( isdefined( var_1 ) )
        var_2 = var_1.origin[2];
    else if ( isdefined( level._id_1AF8 ) )
        var_2 = 850 * level._id_1AF8;
    else
        var_2 = 850;

    var_3 = bullettrace( var_0, var_0 - ( 0, 0, 10000 ), 0, self, 0, 0, 0, 0 );
    var_4 = var_3["position"][2];
    var_5 = 0;
    var_6 = 0;

    for ( var_7 = 0; var_7 < 30; var_7++ )
    {
        wait 0.05;
        var_8 = var_7 % 8;
        var_9 = var_7 * 7;

        switch ( var_8 )
        {
            case 0:
                var_5 = var_9;
                var_6 = var_9;
                break;
            case 1:
                var_5 = var_9 * -1;
                var_6 = var_9 * -1;
                break;
            case 2:
                var_5 = var_9 * -1;
                var_6 = var_9;
                break;
            case 3:
                var_5 = var_9;
                var_6 = var_9 * -1;
                break;
            case 4:
                var_5 = 0;
                var_6 = var_9 * -1;
                break;
            case 5:
                var_5 = var_9 * -1;
                var_6 = 0;
                break;
            case 6:
                var_5 = var_9;
                var_6 = 0;
                break;
            case 7:
                var_5 = 0;
                var_6 = var_9;
                break;
            default:
                break;
        }

        var_10 = bullettrace( var_0 + ( var_5, var_6, 1000 ), var_0 - ( var_5, var_6, 10000 ), 0, self, 0, 0, 0, 0, 0 );

        if ( isdefined( var_10["entity"] ) )
            continue;

        if ( var_10["position"][2] + 145 > var_4 )
            var_4 = var_10["position"][2] + 145;
    }

    return var_4;
}

_id_8DC0( var_0, var_1 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 endon( "crashing" );
    var_0 endon( "owner_disconnected" );
    var_0 endon( "killstreakExit" );
    var_2 = _id_7E37( self.origin );
    level thread scripts\mp\utility\game::_id_115DE( "used_heli_sniper", self, self.team );

    if ( isdefined( var_2.angles ) )
        var_3 = var_2.angles;
    else
        var_3 = ( 0, 0, 0 );

    scripts\engine\utility::_id_1C6E( 0 );
    var_4 = var_0._id_7003;

    if ( isdefined( var_2._id_BEAA[0] ) )
        var_5 = var_2._id_BEAA[0];
    else
        var_5 = _id_7E34( self.origin );

    var_6 = anglestoforward( self.angles );
    var_7 = var_5.origin * ( 1, 1, 0 ) + ( 0, 0, 1 ) * var_4 + var_6 * -100;
    var_0._id_1157A = var_7;
    var_0._id_4BF7 = var_5;
    var_8 = _id_BCD7( var_0 );

    if ( isdefined( var_8 ) && var_8 == "fail" )
    {
        var_0 thread _id_8DBE();
        return var_8;
    }
    else
    {
        thread _id_C53A( var_0 );
        return var_8;
    }
}

_id_C53A( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 endon( "crashing" );
    var_0 endon( "owner_disconnected" );
    var_0 endon( "killstreakExit" );

    if ( isdefined( self._id_9382 ) )
        _id_52CD();

    var_0 thread _id_835D();
    var_0 setyawspeed( 1, 1, 1, 0.1 );
    var_0 notify( "picked_up_passenger" );
    scripts\engine\utility::_id_1C6E( 1 );
    var_0 vehicle_setspeed( var_0._id_02B3, 100, 40 );
    self._id_C53B = 1;
    self._id_8DD6 = var_0;
    var_0 endon( "owner_death" );
    var_0 thread _id_DB16();
    var_0 thread _id_AB2E();
    var_0 setvehgoalpos( var_0._id_1157A, 1 );
    var_0 thread _id_8DB3();
    var_0 waittill( "near_goal" );
    var_0 thread _id_8DBF();
    thread _id_13A0D( var_0 );
    wait 45;
    self notify( "heli_sniper_timeout" );
    _id_5820( var_0 );
}

_id_5820( var_0 )
{
    var_0 notify( "dropping" );
    var_0 thread _id_8DD1();
    var_0 waittill( "at_dropoff" );
    var_0 vehicle_setspeed( 60 );
    var_0 setyawspeed( 180, 180, 180, 0.3 );
    wait 1;

    if ( !scripts\mp\utility\game::isreallyalive( self ) )
        return;

    thread _id_F881();
    self stopridingvehicle();
    self allowjump( 1 );
    self setstance( "stand" );
    self._id_C53B = 0;
    self._id_8DD6 = undefined;
    var_0._id_C834 = 0;
    scripts\mp\utility\game::_id_141E( "iw6_gm6helisnipe_mp_gm6scope" );
    self enableweaponswitch();
    scripts\mp\utility\game::_id_F817();
    var_1 = scripts\engine\utility::_id_7F62();

    if ( !self hasweapon( var_1 ) )
        var_1 = _id_0DC9::_id_7EB7();

    scripts\mp\utility\game::_id_1136C( var_1 );
    wait 1;

    if ( isdefined( var_0 ) )
        var_0 thread _id_8DBE();
}

_id_13A0D( var_0 )
{
    self endon( "heli_sniper_timeout" );
    var_0 thread scripts\mp\killstreaks\killstreaks::_id_1CA5( "dropping" );
    var_0 waittill( "killstreakExit" );
    _id_5820( var_0 );
}

_id_BCD7( var_0 )
{
    self endon( "disconnect" );
    self visionsetnakedforplayer( "black_bw", 0.5 );
    scripts\mp\utility\game::_id_F607( "black_bw", 0.5, 1.0 );
    var_1 = scripts\engine\utility::_id_13736( 0.5, "death" );
    scripts\mp\hostmigration::waittillhostmigrationdone();

    if ( var_1 == "death" )
    {
        thread scripts\mp\killstreaks\killstreaks::_id_41D6( 1.0 );
        return "fail";
    }

    self _meth_805B();

    if ( var_1 != "disconnect" )
    {
        thread scripts\mp\killstreaks\killstreaks::_id_41D6( 1.0, 0.75 );

        if ( self.team == "spectator" )
            return "fail";
    }

    var_0 _id_24A6();

    if ( !isalive( self ) )
        return "fail";

    level._id_8DD7 = var_0;
    level notify( "update_uplink" );
}

_id_52CD()
{
    foreach ( var_1 in self._id_9382 )
    {
        if ( isdefined( var_1._id_3A9D ) && var_1._id_3A9D == self )
        {
            self _meth_80F3();
            self._id_9D81 = undefined;
            self._id_3AA0 = undefined;

            if ( isdefined( var_1._id_2C68 ) )
                var_1._id_2C68 delete();

            var_1 delete();
            self enableweapons();
        }
    }
}

_id_8DB3()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self.owner endon( "death" );
    var_0 = self.origin + anglestoright( self.owner.angles ) * 1000;
    self._id_B00E = spawn( "script_origin", var_0 );
    self setlookatent( self._id_B00E );
    self setyawspeed( 360, 120 );

    for (;;)
    {
        wait 0.25;
        var_0 = self.origin + anglestoright( self.owner.angles ) * 1000;
        self._id_B00E.origin = var_0;
    }
}

_id_24A6()
{
    self.owner notify( "force_cancel_sentry" );
    self.owner notify( "force_cancel_ims" );
    self.owner notify( "force_cancel_placement" );
    self.owner notify( "cancel_carryRemoteUAV" );
    self.owner setplayerangles( self gettagangles( "TAG_RIDER" ) );
    self.owner ridevehicle( self, 40, 70, 10, 70, 1 );
    self.owner setstance( "crouch" );
    self.owner allowjump( 0 );
    thread _id_DE3E();
    self._id_C834 = 1;
    self notify( "boarded" );
    self.owner._id_3F14 = self;
}

_id_8DD1()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "owner_disconnected" );
    self endon( "owner_death" );
    var_0 = undefined;
    var_1 = undefined;
    var_2 = undefined;
    var_3 = 0;

    foreach ( var_5 in level._id_1A66 )
    {
        if ( !isdefined( var_5._id_EE79 ) || !issubstr( var_5._id_EE79, "pickupNode" ) )
            continue;

        var_6 = distancesquared( var_5.origin, self.origin );

        if ( !isdefined( var_2 ) || var_6 < var_2 )
        {
            var_1 = var_5;
            var_2 = var_6;

            if ( var_5._id_EE79 == "pickupNodehigh" )
            {
                var_3 = 1;
                continue;
            }

            var_3 = 0;
        }
    }

    if ( scripts\mp\utility\game::_id_7F8B() == "mp_chasm" )
    {
        if ( var_1.origin == ( -224, -1056, 2376 ) )
            var_1.origin = ( -304, -896, 2376 );
    }

    if ( var_3 && !bullettracepassed( self.origin, var_1.origin, 0, self ) )
    {
        self setvehgoalpos( self.origin + ( 0, 0, 2300 ), 1 );
        _id_137AB( "near_goal", "goal", 5 );
        var_8 = var_1.origin;
        var_8 += ( 0, 0, 1500 );
    }
    else if ( var_1.origin[2] > self.origin[2] )
        var_8 = var_1.origin;
    else
    {
        var_8 = var_1.origin * ( 1, 1, 0 );
        var_8 += ( 0, 0, self.origin[2] );
    }

    self setvehgoalpos( var_8, 1 );
    var_9 = _id_7DFC( var_8 );
    var_10 = var_8 * ( 1, 1, 0 );
    var_11 = var_10 + ( 0, 0, var_9 );
    _id_137AB( "near_goal", "goal", 5 );
    self._id_BCB4 = 0;
    self setvehgoalpos( var_11 + ( 0, 0, 200 ), 1 );
    self._id_5D43 = 1;
    _id_137AB( "near_goal", "goal", 5 );
    self._id_BCB4 = 1;
    self notify( "at_dropoff" );
}

_id_137AB( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    self endon( var_0 );
    self endon( var_1 );
    wait( var_2 );
}

_id_8DBF()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self.owner endon( "death" );
    self.owner endon( "disconnect" );
    self endon( "dropping" );
    self vehicle_setspeed( 60, 45, 20 );
    self setneargoalnotifydist( 8 );

    for (;;)
    {
        var_0 = self.owner _meth_814C();

        if ( var_0[0] >= 0.15 || var_0[1] >= 0.15 || var_0[0] <= -0.15 || var_0[1] <= -0.15 )
            thread _id_B31F( var_0 );

        wait 0.05;
    }
}

_id_8DB8()
{
    self vehicle_setspeed( 80, 60, 20 );
    self setneargoalnotifydist( 8 );

    for (;;)
    {
        var_0 = self.owner _meth_814C();

        if ( var_0[0] >= 0.15 || var_0[1] >= 0.15 || var_0[0] <= -0.15 || var_0[1] <= -0.15 )
            thread _id_B320( var_0 );

        wait 0.05;
    }
}

_id_B320( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self.owner endon( "death" );
    self.owner endon( "disconnect" );
    self endon( "dropping" );
    self notify( "manualMove" );
    self endon( "manualMove" );
    var_1 = anglestoforward( self.owner.angles ) * ( 350 * var_0[0] );
    var_2 = anglestoright( self.owner.angles ) * ( 250 * var_0[1] );
    var_3 = var_1 + var_2;
    var_4 = self.origin + var_3;
    var_4 *= ( 1, 1, 0 );
    var_4 += ( 0, 0, self._id_B4A3[2] );

    if ( distance2dsquared( ( 0, 0, 0 ), var_4 ) > 8000000 )
        return;

    self setvehgoalpos( var_4, 1 );
    self waittill( "goal" );
}

_id_B31F( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self.owner endon( "death" );
    self.owner endon( "disconnect" );
    self endon( "dropping" );
    self notify( "manualMove" );
    self endon( "manualMove" );
    var_1 = anglestoforward( self.owner.angles ) * ( 250 * var_0[0] );
    var_2 = anglestoright( self.owner.angles ) * ( 250 * var_0[1] );
    var_3 = var_1 + var_2;
    var_4 = 256;
    var_5 = self.origin + var_3;
    var_6 = scripts\mp\utility\game::_id_7EFA();
    var_7 = var_5 + ( scripts\mp\utility\game::_id_7EF9() + var_6 );
    var_8 = var_5 + scripts\mp\utility\game::_id_7EF9() - var_6;
    var_9 = bullettrace( var_7, var_8, 0, 0, 0, 0, 1 );

    if ( isdefined( var_9["entity"] ) && var_9["normal"][2] > 0.1 )
    {
        var_5 = var_9["position"] - scripts\mp\utility\game::_id_7EF9() + ( 0, 0, var_4 );
        var_10 = var_5[2] - self.origin[2];

        if ( var_10 > 1000 )
            return;

        self setvehgoalpos( var_5, 1 );
        self waittill( "goal" );
    }
}

_id_8DBE()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self notify( "end_disconnect_check" );
    self notify( "end_death_check" );
    self notify( "leaving" );

    if ( isdefined( self._id_A79F ) )
        self._id_A79F delete();

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    if ( isdefined( self._id_129B9 ) )
        self._id_129B9 delete();

    if ( isdefined( self._id_BD6D ) )
        self._id_BD6D scripts\mp\hud_util::_id_52DC();

    if ( isdefined( self._id_1137A ) )
        self._id_1137A scripts\mp\hud_util::_id_52DC();

    if ( isdefined( self._id_BCCF ) )
        self._id_BCCF scripts\mp\hud_util::_id_52DC();

    self _meth_8076();
    level._id_8DD7 = undefined;
    level notify( "update_uplink" );
    self setyawspeed( 220, 220, 220, 0.3 );
    self vehicle_setspeed( 120, 60 );
    self setvehgoalpos( self.origin + ( 0, 0, 1200 ), 1 );
    self waittill( "goal" );
    var_0 = ( self._id_C96B - self._id_C96C ) * 5000;
    self setvehgoalpos( var_0, 1 );
    self vehicle_setspeed( 300, 75 );
    self._id_AB32 = 1;
    scripts\engine\utility::_id_13736( 5, "goal" );

    if ( isdefined( level._id_AAC8 ) && level._id_AAC8 == self )
        level._id_AAC8 = undefined;

    self notify( "delete" );
    self delete();
}

_id_8DB4( var_0 )
{
    level endon( "game_ended" );
    self endon( "leaving" );
    self waittill( "death" );
    scripts\mp\hostmigration::waittillhostmigrationdone();
    thread scripts\mp\killstreaks\helicopter::_id_AAC7();

    if ( isdefined( self._id_A79F ) )
        self._id_A79F delete();

    if ( isdefined( self.trigger ) )
        self.trigger delete();

    if ( isdefined( self._id_129B9 ) )
        self._id_129B9 delete();

    if ( isdefined( self._id_BD6D ) )
        self._id_BD6D scripts\mp\hud_util::_id_52DC();

    if ( isdefined( self._id_1137A ) )
        self._id_1137A scripts\mp\hud_util::_id_52DC();

    if ( isdefined( self._id_BCCF ) )
        self._id_BCCF scripts\mp\hud_util::_id_52DC();

    if ( isdefined( self.owner ) && isalive( self.owner ) && self._id_C834 == 1 )
    {
        self.owner stopridingvehicle();
        var_1 = undefined;
        var_2 = undefined;

        if ( isdefined( self.attackers ) )
        {
            var_3 = 0;

            foreach ( var_6, var_5 in self.attackers )
            {
                if ( var_5 >= var_3 )
                {
                    var_3 = var_5;
                    var_1 = var_6;
                }
            }
        }

        if ( isdefined( var_1 ) )
        {
            foreach ( var_8 in level._id_C928 )
            {
                if ( var_8 scripts\mp\utility\game::_id_81EC() == var_1 )
                    var_2 = var_8;
            }
        }

        var_10 = getdvarint( "scr_team_fftype" );

        if ( isdefined( self._id_A667 ) && isdefined( self._id_A667._id_9E20 ) )
            self._id_A667 _meth_8253( self.owner.origin, 200, 2600, 2600, self._id_A667 );
        else if ( isdefined( var_2 ) && var_10 != 2 )
            radiusdamage( self.owner.origin, 200, 2600, 2600, var_2 );
        else if ( var_10 == 2 && isdefined( var_2 ) && scripts\mp\utility\game::_id_24F0( var_2, self.owner ) )
        {
            radiusdamage( self.owner.origin, 200, 2600, 2600, var_2 );
            radiusdamage( self.owner.origin, 200, 2600, 2600 );
        }
        else
            radiusdamage( self.owner.origin, 200, 2600, 2600 );

        self.owner._id_C53B = 0;
        self.owner._id_8DD6 = undefined;
    }
}

_id_F881()
{
    if ( !scripts\mp\utility\game::_id_12D6( "specialty_falldamage" ) )
    {
        level endon( "game_ended" );
        self endon( "death" );
        self endon( "disconnect" );
        scripts\mp\utility\game::giveperk( "specialty_falldamage" );
        wait 2;
        scripts\mp\utility\game::_id_E150( "specialty_falldamage" );
    }
}

_id_DE3E()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self.owner endon( "death" );
    self.owner endon( "disconnect" );
    self endon( "dropping" );
    var_0 = 0;

    for (;;)
    {
        wait 0.05;

        if ( !isdefined( self.owner._id_ACAE ) && !self.owner scripts\mp\utility\game::isjuggernaut() )
        {
            self.owner scripts\mp\perks\perkfunctions::_id_F785();
            var_0++;

            if ( var_0 >= 2 )
                break;
        }
    }
}

_id_A576()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self.owner endon( "death" );
    self.owner endon( "disconnect" );
    self endon( "dropping" );

    for (;;)
    {
        if ( self.owner getstance() != "crouch" )
            self.owner setstance( "crouch" );

        wait 0.05;
    }
}

_id_835D()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "dropping" );
    self.owner endon( "disconnect" );

    for (;;)
    {
        if ( !isalive( self.owner ) )
            return "fail";

        if ( self.owner getcurrentprimaryweapon() != "iw6_gm6helisnipe_mp_gm6scope" )
        {
            self.owner giveweapon( "iw6_gm6helisnipe_mp_gm6scope" );
            self.owner scripts\mp\utility\game::_id_141B( "iw6_gm6helisnipe_mp_gm6scope" );
            self.owner _meth_80AB();
            self.owner scripts\mp\utility\game::_id_F817( 0, 100 );
            self.owner givemaxammo( "iw6_gm6helisnipe_mp_gm6scope" );
        }
        else
            return;

        wait 0.05;
    }
}

_id_E2B9()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self.owner endon( "death" );
    self.owner endon( "disconnect" );
    self.owner endon( "dropping" );

    for (;;)
    {
        self.owner waittill( "weapon_fired" );
        self.owner givemaxammo( "iw6_gm6helisnipe_mp_gm6scope" );
    }
}

_id_DB16()
{
    level endon( "game_ended" );
    self.owner endon( "disconnect" );
    self endon( "death" );
    self endon( "crashing" );
    self.owner waittill( "death" );
    self.owner._id_C53B = 0;
    self.owner._id_8DD6 = undefined;
    self._id_C834 = 0;

    if ( isdefined( self.origin ) )
        physicsexplosionsphere( self.origin, 200, 200, 1 );
}

_id_AB2F()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "end_disconnect_check" );
    self.owner waittill( "disconnect" );
    self notify( "owner_disconnected" );
    thread _id_8DBE();
}

_id_AB2E()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "crashing" );
    self endon( "end_death_check" );
    self.owner waittill( "death" );
    self notify( "owner_death" );
    thread _id_8DBE();
}

_id_7E34( var_0 )
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

_id_136B6()
{
    var_0 = self getentitynumber();
    self waittill( "death" );
    level._id_AAC8 = undefined;

    if ( isdefined( level._id_8DD7 ) )
    {
        level._id_8DD7 = undefined;
        level notify( "update_uplink" );
    }
}

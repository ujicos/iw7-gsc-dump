// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "heli_pilot", ::_id_128E7 );
    level._id_8D79 = [];
    level._id_8DCE = [];
    level._id_8DCE["heli_pilot"] = spawnstruct();
    level._id_8DCE["heli_pilot"]._id_11901 = 60.0;
    level._id_8DCE["heli_pilot"].maxhealth = 2000;
    level._id_8DCE["heli_pilot"]._id_110EA = "heli_pilot";
    level._id_8DCE["heli_pilot"]._id_13260 = "heli_pilot_mp";
    level._id_8DCE["heli_pilot"]._id_B91A = "vehicle_aas_72x_killstreak";
    level._id_8DCE["heli_pilot"]._id_115EB = "used_heli_pilot";
    _id_8DC7();
    level._id_8D7C = getent( "heli_pilot_mesh", "targetname" );

    if ( !isdefined( level._id_8D7C ) )
    {

    }
    else
        level._id_8D7C.origin += scripts\mp\utility\game::_id_7EF9();

    var_0 = spawnstruct();
    var_0._id_EC44 = "destroyed_helo_pilot";
    var_0._id_13523 = undefined;
    var_0._id_3774 = "callout_destroyed_helo_pilot";
    var_0._id_EB11 = 0.09;
    var_0._id_65D0 = "tag_engine_right";
    level._id_8DA6["heli_pilot"] = var_0;
}

_id_128E7( var_0, var_1 )
{
    var_2 = "heli_pilot";
    var_3 = 1;

    if ( isdefined( self._id_12B90 ) && self._id_12B90 )
        return 0;
    else if ( _id_68C1( self.team ) )
    {
        self iprintlnbold( &"KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }
    else if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + var_3 >= scripts\mp\utility\game::_id_B4D2() )
    {
        self iprintlnbold( &"KILLSTREAKS_TOO_MANY_VEHICLES" );
        return 0;
    }

    scripts\mp\utility\game::_id_93FA();
    var_4 = _id_49D2( var_2 );

    if ( !isdefined( var_4 ) )
    {
        scripts\mp\utility\game::_id_4FC1();
        return 0;
    }

    level._id_8D79[self.team] = var_4;
    var_5 = _id_10DA3( var_4 );

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    return var_5;
}

_id_68C1( var_0 )
{
    if ( level.gametype == "dm" )
    {
        if ( isdefined( level._id_8D79[var_0] ) || isdefined( level._id_8D79[level._id_C74B[var_0]] ) )
            return 1;
        else
            return 0;
    }
    else if ( isdefined( level._id_8D79[var_0] ) )
        return 1;
    else
        return 0;
}

_id_13AA2( var_0 )
{
    var_0 endon( "killstreak_disowned" );
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "death" );

    for (;;)
    {
        level waittill( "host_migration_end" );
        var_0 setclientomnvar( "ui_heli_pilot", 1 );
    }
}

_id_49D2( var_0 )
{
    var_1 = _id_8DC3( self.origin );
    var_2 = _id_8DC4( var_1 );
    var_3 = vectortoangles( var_2.origin - var_1.origin );
    var_4 = anglestoforward( self.angles );
    var_5 = var_2.origin + var_4 * -100;
    var_6 = var_1.origin;
    var_7 = spawnhelicopter( self, var_6, var_3, level._id_8DCE[var_0]._id_13260, level._id_8DCE[var_0]._id_B91A );

    if ( !isdefined( var_7 ) )
        return;

    var_7 makevehiclesolidcapsule( 18, -9, 18 );
    var_7 scripts\mp\killstreaks\helicopter::_id_1852();
    var_7 thread scripts\mp\killstreaks\helicopter::_id_E111();
    var_7.maxhealth = level._id_8DCE[var_0].maxhealth;
    var_7._id_02B3 = 40;
    var_7.owner = self;
    var_7 _meth_831F( self );
    var_7.team = self.team;
    var_7.helitype = "littlebird";
    var_7._id_8DCF = "heli_pilot";
    var_7 setmaxpitchroll( 45, 45 );
    var_7 vehicle_setspeed( var_7._id_02B3, 40, 40 );
    var_7 setyawspeed( 120, 60 );
    var_7 setneargoalnotifydist( 32 );
    var_7 sethoverparams( 100, 100, 100 );
    var_7 scripts\mp\sentientpoolmanager::registersentient( "Killstreak_Air", self );
    var_7._id_1157A = var_5;
    var_7._id_4BF7 = var_2;
    var_7._id_254D = 10000;
    var_7._id_254C = 150;
    var_7._id_2550 = missile_createattractorent( var_7, var_7._id_254D, var_7._id_254C );
    var_7 thread scripts\mp\killstreaks\helicopter::_id_8D40( "heli_pilot" );
    var_7 thread _id_8DC6();
    var_7 thread _id_8DCD();
    var_7 thread _id_8DCB();
    var_7 thread _id_8DCC();
    var_7 thread _id_8DCA();
    var_7 thread _id_8DC9();
    var_7 thread _id_13AA2( self );
    var_7.owner scripts\mp\matchdata::_id_AFC9( level._id_8DCE[var_7._id_8DCF]._id_110EA, var_7._id_1157A );
    return var_7;
}

_id_8DC6()
{
    playfxontag( level._id_3F19["light"]["left"], self, "tag_light_nose" );
    wait 0.05;
    playfxontag( level._id_3F19["light"]["belly"], self, "tag_light_belly" );
    wait 0.05;
    playfxontag( level._id_3F19["light"]["tail"], self, "tag_light_tail1" );
    wait 0.05;
    playfxontag( level._id_3F19["light"]["tail"], self, "tag_light_tail2" );
}

_id_10DA3( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    scripts\mp\utility\game::_id_FB09( var_0._id_8DCF );

    if ( getdvarint( "camera_thirdPerson" ) )
        scripts\mp\utility\game::_id_F887( 0 );

    self._id_E2D7 = self.angles;
    var_0 thread _id_0D9B::_id_A730( 2, "+smoke", "ui_heli_pilot_flare_ammo", "ui_heli_pilot_warn" );
    thread _id_13AA8( var_0 );
    scripts\mp\utility\game::_id_7385( 1 );
    var_1 = scripts\mp\killstreaks\killstreaks::_id_98C2( var_0._id_8DCF );

    if ( var_1 != "success" )
    {
        if ( isdefined( self._id_55E6 ) && self._id_55E6 )
            scripts\engine\utility::_id_1C71( 1 );

        var_0 notify( "death" );
        return 0;
    }

    scripts\mp\utility\game::_id_7385( 0 );
    var_2 = scripts\mp\utility\game::_id_7EFA();
    var_3 = var_0._id_4BF7.origin + ( scripts\mp\utility\game::_id_7EF9() + var_2 );
    var_4 = var_0._id_4BF7.origin + scripts\mp\utility\game::_id_7EF9() - var_2;
    var_5 = bullettrace( var_3, var_4, 0, undefined, 0, 0, 1 );

    if ( !isdefined( var_5["entity"] ) )
    {

    }

    var_6 = var_5["position"] - scripts\mp\utility\game::_id_7EF9() + ( 0, 0, 250 );
    var_7 = spawn( "script_origin", var_6 );
    self remotecontrolvehicle( var_0 );
    var_0 thread _id_8DB9( var_7 );
    var_0 thread _id_8DC8();
    level thread scripts\mp\utility\game::_id_115DE( level._id_8DCE[var_0._id_8DCF]._id_115EB, self );
    var_0._id_A63A = spawn( "script_origin", self getvieworigin() );
    return 1;
}

_id_8DB9( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    self _meth_825E( var_0 );
    self waittill( "goal_reached" );
    self _meth_825F();
    var_0 delete();
}

_id_13AA8( var_0 )
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    self waittill( "intro_cleared" );
    self setclientomnvar( "ui_heli_pilot", 1 );
    var_1 = scripts\mp\utility\game::_id_C794( self, "cyan", self, 0, 0, "killstreak" );
    _id_E146( var_1, var_0 );

    foreach ( var_3 in level._id_C928 )
    {
        if ( !scripts\mp\utility\game::isreallyalive( var_3 ) || var_3.sessionstate != "playing" )
            continue;

        if ( scripts\mp\utility\game::isenemy( var_3 ) )
        {
            if ( !var_3 scripts\mp\utility\game::_id_12D6( "specialty_noplayertarget" ) )
            {
                var_1 = scripts\mp\utility\game::_id_C794( var_3, "orange", self, 0, 0, "killstreak" );
                var_3 _id_E146( var_1, var_0 );
                continue;
            }

            var_3 thread _id_13A56( var_0 );
        }
    }

    var_0 thread _id_13B0D();
    thread _id_13A0D( var_0 );
}

_id_13A56( var_0 )
{
    self notify( "watchForPerkRemoval" );
    self endon( "watchForPerkRemoval" );
    self endon( "death" );
    self waittill( "removed_specialty_noplayertarget" );
    var_1 = scripts\mp\utility\game::_id_C794( self, "orange", var_0.owner, 0, 0, "killstreak" );
    _id_E146( var_1, var_0 );
}

_id_13B0D()
{
    self endon( "leaving" );
    self endon( "death" );

    for (;;)
    {
        level waittill( "player_spawned", var_0 );

        if ( var_0.sessionstate == "playing" && self.owner scripts\mp\utility\game::isenemy( var_0 ) )
            var_0 thread _id_13A56( self );
    }
}

_id_E146( var_0, var_1 )
{
    thread _id_8DD0( var_0, var_1 );
    thread _id_D3E9( var_0, var_1 );
}

_id_8DD0( var_0, var_1 )
{
    self notify( "heliRemoveOutline" );
    self endon( "heliRemoveOutline" );
    self endon( "outline_removed" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_2 = [ "leaving", "death" ];
    var_1 scripts\engine\utility::_id_13731( var_2 );

    if ( isdefined( self ) )
    {
        scripts\mp\utility\game::_id_C78F( var_0, self );
        self notify( "outline_removed" );
    }
}

_id_D3E9( var_0, var_1 )
{
    self notify( "playerRemoveOutline" );
    self endon( "playerRemoveOutline" );
    self endon( "outline_removed" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_2 = [ "death" ];
    scripts\engine\utility::_id_13731( var_2 );
    scripts\mp\utility\game::_id_C78F( var_0, self );
    self notify( "outline_removed" );
}

_id_8DC9()
{
    level endon( "game_ended" );
    self endon( "gone" );
    self waittill( "death" );

    if ( isdefined( self.owner ) )
        self.owner _id_8DC1( self );

    if ( isdefined( self._id_A63A ) )
        self._id_A63A delete();

    thread scripts\mp\killstreaks\helicopter::_id_AAC7();
}

_id_8DCA()
{
    level endon( "game_ended" );
    self endon( "gone" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    level waittill( "objective_cam" );
    thread scripts\mp\killstreaks\helicopter::_id_AAC7();

    if ( isdefined( self.owner ) )
        self.owner _id_8DC1( self );
}

_id_8DCD()
{
    level endon( "game_ended" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    var_0 = level._id_8DCE[self._id_8DCF]._id_11901;
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    thread _id_8DC5();
}

_id_8DCB()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner scripts\engine\utility::waittill_any( "disconnect", "joined_team", "joined_spectators" );
    thread _id_8DC5();
}

_id_8DCC()
{
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    level scripts\engine\utility::waittill_any( "round_end_finished", "game_ended" );
    thread _id_8DC5();
}

_id_8DC5()
{
    self endon( "death" );
    self notify( "leaving" );

    if ( isdefined( self.owner ) )
        self.owner _id_8DC1( self );

    var_0 = scripts\mp\killstreaks\airdrop::_id_7EC0( self.origin );
    var_1 = self.origin + ( 0, 0, var_0 );
    self vehicle_setspeed( 140, 60 );
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

_id_8DC1( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        self setclientomnvar( "ui_heli_pilot", 0 );
        var_0 notify( "end_remote" );

        if ( scripts\mp\utility\game::isusingremote() )
            scripts\mp\utility\game::_id_41E9();

        if ( getdvarint( "camera_thirdPerson" ) )
            scripts\mp\utility\game::_id_F887( 1 );

        self remotecontrolvehicleoff( var_0 );
        self setplayerangles( self._id_E2D7 );
        thread _id_8DC2();
    }
}

_id_8DC2()
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    scripts\mp\utility\game::_id_7385( 1 );
    wait 0.5;
    scripts\mp\utility\game::_id_7385( 0 );
}

_id_8DC8()
{
    self endon( "leaving" );
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = 0;

    for (;;)
    {
        if ( isdefined( self.owner ) )
        {
            if ( self.owner adsbuttonpressed() )
            {
                if ( !var_0 )
                {
                    self.owner setclientomnvar( "ui_heli_pilot", 2 );
                    var_0 = 1;
                }
            }
            else if ( var_0 )
            {
                self.owner setclientomnvar( "ui_heli_pilot", 1 );
                var_0 = 0;
            }
        }

        wait 0.1;
    }
}

_id_8DC7()
{
    level._id_1A6B = scripts\engine\utility::_id_8180( "chopper_boss_path_start", "targetname" );
}

_id_8DC4( var_0 )
{
    if ( isdefined( var_0._id_EE01 ) )
    {
        var_1 = var_0 scripts\engine\utility::_id_7A9C();

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = scripts\engine\utility::_id_817E( var_1[var_2], "script_linkname" );

            if ( isdefined( var_3 ) )
                return var_3;
        }
    }

    return undefined;
}

_id_8DC3( var_0 )
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

_id_13A0D( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    self endon( "leaving" );
    var_0 thread scripts\mp\killstreaks\killstreaks::_id_1CA5();
    var_0 waittill( "killstreakExit" );
    var_0 thread _id_8DC5();
}

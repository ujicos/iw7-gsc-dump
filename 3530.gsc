// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    _id_FAB1();
    _id_FAC4();
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "vanguard", ::_id_1290D );
    level._id_DF74 = [];
    level._id_13167 = 0;
    level._id_1317F = ::_id_13160;
    level._id_A864 = loadfx( "vfx/misc/laser_glow" );
}

_id_FAB1()
{

}

_id_FAC4()
{
    level._id_13182 = getentarray( "remote_heli_range", "targetname" );
    level._id_13181 = getent( "airstrikeheight", "targetname" );

    if ( isdefined( level._id_13181 ) )
    {
        level._id_13180 = level._id_13181.origin[2];
        level._id_13183 = 163840000;
    }

    level._id_9C46 = 0;

    if ( scripts\mp\utility\game::_id_7F8B() == "mp_descent" || scripts\mp\utility\game::_id_7F8B() == "mp_descent_new" )
    {
        level._id_13180 = level._id_13182[0].origin[2] + 360;
        level._id_9C46 = 1;
    }
}

_id_1290D( var_0, var_1 )
{
    return _id_130F5( var_0, var_1 );
}

_id_130F5( var_0, var_1 )
{
    if ( scripts\mp\utility\game::isusingremote() || self isusingturret() )
        return 0;

    if ( isdefined( self._id_12B90 ) && self._id_12B90 )
        return 0;

    if ( _id_68C5( self.team ) || level._id_AD8B.size >= 4 )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        return 0;
    }
    else if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + 1 >= scripts\mp\utility\game::_id_B4D2() )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_TOO_MANY_VEHICLES" );
        return 0;
    }
    else if ( isdefined( self._id_5CC4 ) )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_UNAVAILABLE" );
        return 0;
    }

    scripts\mp\utility\game::_id_93FA();
    var_2 = _id_8356( var_0, var_1 );

    if ( !isdefined( var_2 ) )
    {
        scripts\mp\utility\game::_id_4FC1();
        return 0;
    }

    scripts\mp\matchdata::_id_AFC9( var_1, self.origin );
    return _id_10E0A( var_2, var_1, var_0 );
}

_id_68C5( var_0 )
{
    if ( level.teambased )
        return isdefined( level._id_DF74[var_0] );
    else
        return isdefined( level._id_DF74[var_0] ) || isdefined( level._id_DF74[level._id_C74B[var_0]] );
}

_id_6CCC( var_0, var_1 )
{
    var_2 = anglestoforward( self.angles );
    var_3 = anglestoright( self.angles );
    var_4 = self geteye();
    var_5 = var_4 + ( 0, 0, var_1 );
    var_6 = var_5 + var_0 * var_2;

    if ( _id_3E5C( var_4, var_6 ) )
        return var_6;

    var_6 = var_5 - var_0 * var_2;

    if ( _id_3E5C( var_4, var_6 ) )
        return var_6;

    var_6 += var_0 * var_3;

    if ( _id_3E5C( var_4, var_6 ) )
        return var_6;

    var_6 = var_5 - var_0 * var_3;

    if ( _id_3E5C( var_4, var_6 ) )
        return var_6;

    var_6 = var_5;

    if ( _id_3E5C( var_4, var_6 ) )
        return var_6;

    scripts\engine\utility::waitframe();
    var_6 = var_5 + 0.707 * var_0 * ( var_2 + var_3 );

    if ( _id_3E5C( var_4, var_6 ) )
        return var_6;

    var_6 = var_5 + 0.707 * var_0 * ( var_2 - var_3 );

    if ( _id_3E5C( var_4, var_6 ) )
        return var_6;

    var_6 = var_5 + 0.707 * var_0 * ( var_3 - var_2 );

    if ( _id_3E5C( var_4, var_6 ) )
        return var_6;

    var_6 = var_5 + 0.707 * var_0 * ( -1 * var_2 - var_3 );

    if ( _id_3E5C( var_4, var_6 ) )
        return var_6;

    return undefined;
}

_id_3E5C( var_0, var_1 )
{
    var_2 = 0;

    if ( capsuletracepassed( var_1, 20, 40.01, undefined, 1, 1 ) )
        var_2 = bullettracepassed( var_0, var_1, 0, undefined );

    return var_2;
}

_id_8356( var_0, var_1, var_2 )
{
    var_3 = scripts\mp\spawnscoring::_id_6CB5( self, 90, 20, 192 );

    if ( !isdefined( var_3 ) )
    {
        var_3 = scripts\mp\spawnscoring::_id_6CB5( self, 0, 20, 192 );

        if ( !isdefined( var_3 ) )
        {
            var_3 = _id_6CCC( 80, 35 );

            if ( !isdefined( var_3 ) )
                var_3 = _id_6CCC( 80, 0 );
        }
    }

    if ( isdefined( var_3 ) )
    {
        var_4 = self.angles;
        var_5 = _id_4A30( var_0, self, var_1, var_3, var_4, var_2 );

        if ( !isdefined( var_5 ) )
            scripts\mp\hud_message::_id_10122( "KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );

        return var_5;
    }
    else
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_VANGUARD_NO_SPAWN_POINT" );
        return undefined;
    }
}

_id_10E0A( var_0, var_1, var_2 )
{
    scripts\mp\utility\game::_id_FB09( var_1 );
    scripts\mp\utility\game::_id_7385( 1 );
    self._id_E2D7 = self.angles;

    if ( getdvarint( "camera_thirdPerson" ) )
        scripts\mp\utility\game::_id_F887( 0 );

    thread _id_13AA8( var_0 );
    var_3 = scripts\mp\killstreaks\killstreaks::_id_98C2( "vanguard" );

    if ( var_3 != "success" )
    {
        var_0 notify( "death" );
        return 0;
    }
    else if ( !isdefined( var_0 ) )
        return 0;

    scripts\mp\utility\game::_id_7385( 0 );
    var_0._id_D3D3 = 1;
    self cameralinkto( var_0, "tag_origin" );
    self remotecontrolvehicle( var_0 );
    var_0._id_1E41 = 100;
    self._id_DF75 = var_2;
    self._id_DF8A = var_0;
    thread scripts\mp\utility\game::_id_115DE( "used_vanguard", self );
    return 1;
}

_id_1316F( var_0 )
{
    if ( !isdefined( var_0._id_AA33._id_52CF ) || var_0._id_AA33._id_52CF || !isdefined( self._id_108D4 ) || gettime() > self._id_108D4 )
        thread _id_898F( undefined, undefined, undefined, undefined );
    else
    {
        wait 1.0;
        thread scripts\mp\movers::_id_892E( var_0 );
    }
}

_id_4A30( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnhelicopter( var_1, var_3, var_4, "remote_uav_mp", "veh_mil_air_un_pocketdrone_mp" );

    if ( !isdefined( var_6 ) )
        return undefined;

    var_6 scripts\mp\killstreaks\helicopter::_id_1852();
    var_6 thread scripts\mp\killstreaks\helicopter::_id_E111();
    var_6 makevehiclesolidcapsule( 20, -5, 10 );
    var_6._id_24D1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_6._id_24D1 setmodel( "tag_origin" );
    var_6._id_24D1.angles = ( -90, 0, 0 );
    var_6._id_24D1._id_C364 = 4;
    var_7 = spawnturret( "misc_turret", var_6.origin, "ball_drone_gun_mp", 0 );
    var_7 linkto( var_6, "tag_turret_attach", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_7 setmodel( "veh_mil_air_un_pocketdrone_gun_mp" );
    var_7 maketurretinoperable();
    var_6._id_129B9 = var_7;
    var_7 makeunusable();
    var_6._id_AC68 = var_0;
    var_6.team = var_1.team;
    var_6.pers["team"] = var_1.team;
    var_6.owner = var_1;
    var_6 scripts\mp\sentientpoolmanager::registersentient( "Killstreak_Air", var_1 );

    if ( issentient( var_6 ) )
        var_6 setthreatbiasgroup( "DogsDontAttack" );

    var_6.health = 999999;
    var_6.maxhealth = 750;
    var_6._id_00E1 = 0;
    var_6._id_1037E = 0;
    var_6._id_94D1 = 0;
    var_6.helitype = "remote_uav";
    var_7.owner = var_1;
    var_7 _meth_82DD( var_6 );
    var_7 thread scripts\mp\weapons::_id_57EB( "tag_fx1" );
    var_7._id_C8F2 = var_6;
    var_7.health = 999999;
    var_7.maxhealth = 250;
    var_7._id_00E1 = 0;
    level thread _id_1316B( var_6 );
    level thread _id_1316E( var_6, var_5 );
    level thread _id_13169( var_6 );
    level thread _id_1316D( var_6 );
    var_6 thread _id_1317D();
    var_6 thread _id_1317E();
    var_6 thread _id_13164();
    var_6._id_129B9 thread _id_1317B();
    var_6 thread _id_13A10();
    var_8 = spawn( "script_model", var_6.origin );
    var_8 setscriptmoverkillcam( "explosive" );
    var_8 linkto( var_6, "tag_player", ( -10, 0, 20 ), ( 0, 0, 0 ) );
    var_6._id_A63A = var_8;
    var_6._id_108D4 = gettime() + 2000;
    var_9 = spawnstruct();
    var_9._id_13139 = 1;
    var_9._id_4E53 = ::_id_1316F;
    var_6 thread scripts\mp\movers::_id_892F( var_9 );
    level._id_DF74[var_6.team] = var_6;
    return var_6;
}

_id_13AA2( var_0 )
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    level endon( "game_ended" );
    var_0 endon( "death" );

    for (;;)
    {
        level waittill( "host_migration_end" );
        _id_98DE();
        var_0 thread _id_13175();
    }
}

_id_13AA8( var_0 )
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    self waittill( "intro_cleared" );
    _id_98DE();
    var_0 _meth_80C7();
    thread _id_1317A( var_0 );
    thread _id_1316A( var_0 );
    thread _id_1316C( var_0 );
    thread _id_1317C( var_0 );
    var_0 thread _id_13175();

    if ( !level._id_8B38 )
        var_0 thread _id_13176();

    thread _id_13AA2( var_0 );
    scripts\mp\utility\game::_id_7385( 0 );
}

_id_98DE()
{
    self _meth_83BE();
    self setclientomnvar( "ui_vanguard", 1 );
}

_id_1316C( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_0 endon( "end_remote" );
    var_0 thread scripts\mp\killstreaks\killstreaks::_id_1CA5();
    var_0 waittill( "killstreakExit" );

    if ( isdefined( var_0.owner ) )
        var_0.owner scripts\mp\utility\game::leaderdialogonplayer( "gryphon_gone" );

    var_0 notify( "death" );
}

_id_1317C( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_0 endon( "end_remote" );

    while ( !isdefined( var_0._id_24D1 ) )
        wait 0.05;

    var_0 _meth_831F( var_0._id_24D1 );
    var_0 setturrettargetent( var_0._id_24D1 );
}

_id_1317A( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_0 endon( "end_remote" );

    for (;;)
    {
        if ( var_0 scripts\mp\utility\game::_id_11A42( "gryphon" ) )
            var_0 notify( "damage", 1019, self, self.angles, self.origin, "MOD_EXPLOSIVE", undefined, undefined, undefined, undefined, "c4_mp" );

        self._id_AEF8 = var_0._id_24D1.origin;
        scripts\engine\utility::waitframe();
    }
}

_id_13175()
{
    playfxontagforclients( level._id_13162["target_marker_circle"], self._id_24D1, "tag_origin", self.owner );
    thread _id_13179();
}

_id_13176()
{
    self endon( "death" );
    self endon( "end_remote" );

    for (;;)
    {
        level waittill( "joined_team", var_0 );
        stopfxontag( level._id_13162["target_marker_circle"], self._id_24D1, "tag_origin" );
        scripts\engine\utility::waitframe();
        _id_13175();
    }
}

_id_13179()
{
    self endon( "death" );
    self endon( "end_remote" );

    if ( !level._id_8B38 )
    {
        foreach ( var_1 in level.players )
        {
            if ( self.owner scripts\mp\utility\game::isenemy( var_1 ) )
            {
                scripts\engine\utility::waitframe();
                playfxontagforclients( level._id_13162["target_marker_circle"], self._id_24D1, "tag_origin", var_1 );
            }
        }
    }
}

_id_13178( var_0 )
{
    var_1 = _id_819C( var_0.owner, var_0 );

    if ( isdefined( var_1 ) )
    {
        var_0._id_24D1.origin = var_1[0] + ( 0, 0, 4 );
        return var_1[0];
    }

    return undefined;
}

_id_819C( var_0, var_1 )
{
    var_2 = var_1._id_129B9 gettagorigin( "tag_flash" );
    var_3 = var_0 getplayerangles();
    var_4 = anglestoforward( var_3 );
    var_5 = var_2 + var_4 * 15000;
    var_6 = bullettrace( var_2, var_5, 0, var_1 );

    if ( var_6["surfacetype"] == "none" )
        return undefined;

    if ( var_6["surfacetype"] == "default" )
        return undefined;

    var_7 = var_6["entity"];
    var_8 = [];
    var_8[0] = var_6["position"];
    var_8[1] = var_6["normal"];
    return var_8;
}

_id_1316A( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 endon( "end_remote" );
    self notifyonplayercommand( "vanguard_fire", "+attack" );
    self notifyonplayercommand( "vanguard_fire", "+attack_akimbo_accessible" );
    var_0._id_6D7F = gettime();

    for (;;)
    {
        self waittill( "vanguard_fire" );
        scripts\mp\hostmigration::waittillhostmigrationdone();

        if ( isdefined( level._id_90A9 ) )
            continue;

        if ( isdefined( self._id_AEF8 ) && gettime() >= var_0._id_6D7F )
            self thread [[ level._id_1317F ]]( var_0, self._id_AEF8 );
    }
}

_id_13177( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 endon( "end_remote" );
    var_0 notify( "end_rumble" );
    var_0 endon( "end_rumble" );

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        self playrumbleonentity( var_1 );
        scripts\engine\utility::waitframe();
    }
}

_id_B06C( var_0, var_1 )
{
    var_1 endon( "death" );
    level endon( "game_ended" );
    self endon( "death" );

    for (;;)
    {
        triggerfx( var_0 );
        wait 0.25;
    }
}

_id_13160( var_0, var_1 )
{
    level endon( "game_ended" );

    if ( var_0._id_1E41 <= 0 )
        return;

    var_2 = var_0._id_129B9 gettagorigin( "tag_fire" );
    var_2 += ( 0, 0, -25 );

    if ( distancesquared( var_2, var_1 ) < 10000 )
    {
        var_0 playsoundtoplayer( "weap_vanguard_fire_deny", self );
        return;
    }

    var_0._id_1E41--;
    self playlocalsound( "weap_gryphon_fire_plr" );
    scripts\mp\utility\game::_id_D52A( "weap_gryphon_fire_npc", var_0.origin );
    thread _id_13177( var_0, "shotgun_fire", 1 );
    earthquake( 0.3, 0.25, var_0.origin, 60 );
    var_3 = scripts\mp\utility\game::_id_1309( "remote_tank_projectile_mp", var_2, var_1, self );
    var_3._id_131D8 = var_0;
    var_4 = 1500;
    var_0._id_6D7F = gettime() + var_4;
    thread _id_12F63( var_0, var_4 * 0.001 );
    var_3 scripts\mp\hostmigration::_id_137B8( "death", 4 );
    earthquake( 0.3, 0.75, var_1, 128 );

    if ( isdefined( var_0 ) )
    {
        earthquake( 0.25, 0.75, var_0.origin, 60 );
        thread _id_13177( var_0, "damage_heavy", 3 );

        if ( var_0._id_1E41 == 0 )
        {
            wait 0.75;
            var_0 notify( "death" );
        }
    }
}

_id_12F63( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_0 endon( "end_remote" );
    self setclientomnvar( "ui_vanguard_ammo", -1 );
    wait( var_1 );
    self setclientomnvar( "ui_vanguard_ammo", var_0._id_1E41 );
}

_id_8166( var_0, var_1 )
{
    var_2 = ( 3000, 3000, 3000 );
    var_3 = vectornormalize( var_0.origin - var_1 + ( 0, 0, -400 ) );
    var_4 = rotatevector( var_3, ( 0, 25, 0 ) );
    var_5 = var_1 + var_4 * var_2;

    if ( _id_9FE6( var_5, var_1 ) )
        return var_5;

    var_4 = rotatevector( var_3, ( 0, -25, 0 ) );
    var_5 = var_1 + var_4 * var_2;

    if ( _id_9FE6( var_5, var_1 ) )
        return var_5;

    var_5 = var_1 + var_3 * var_2;

    if ( _id_9FE6( var_5, var_1 ) )
        return var_5;

    return var_1 + ( 0, 0, 3000 );
}

_id_9FE6( var_0, var_1 )
{
    var_2 = bullettrace( var_0, var_1, 0 );

    if ( var_2["fraction"] > 0.99 )
        return 1;

    return 0;
}

_id_1317D()
{
    self endon( "death" );
    var_0 = self.origin;
    self._id_DCCE = 0;

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        if ( !isdefined( self.owner ) )
            return;

        if ( !_id_13165() )
        {
            while ( !_id_13165() )
            {
                if ( !isdefined( self ) )
                    return;

                if ( !isdefined( self.owner ) )
                    return;

                if ( !self._id_DCCE )
                {
                    self._id_DCCE = 1;
                    thread _id_13173();
                }

                if ( isdefined( self._id_8DBD ) )
                    var_1 = distance( self.origin, self._id_8DBD.origin );
                else if ( isdefined( level._id_5618 ) )
                    var_1 = 467.5;
                else
                    var_1 = distance( self.origin, var_0 );

                var_2 = _id_8123( var_1 );
                self.owner setclientomnvar( "ui_vanguard", var_2 );
                wait 0.1;
            }

            self notify( "in_range" );
            self._id_DCCE = 0;
            self.owner setclientomnvar( "ui_vanguard", 1 );
        }

        var_3 = int( angleclamp( self.angles[1] ) );
        self.owner setclientomnvar( "ui_vanguard_heading", var_3 );
        var_4 = self.origin[2] * 0.0254;
        var_4 = int( clamp( var_4, -250, 250 ) );
        self.owner setclientomnvar( "ui_vanguard_altitude", var_4 );
        var_5 = distance2d( self.origin, self._id_24D1.origin ) * 0.0254;
        var_5 = int( clamp( var_5, 0, 256 ) );
        self.owner setclientomnvar( "ui_vanguard_range", var_5 );
        var_0 = self.origin;
        wait 0.1;
    }
}

_id_8123( var_0 )
{
    var_0 = clamp( var_0, 50, 550 );
    return 2 + int( 8 * ( var_0 - 50 ) / 500 );
}

_id_13165()
{
    if ( !isdefined( level._id_13183 ) || !isdefined( level._id_13180 ) )
        return 0;

    if ( isdefined( self._id_94D1 ) && self._id_94D1 )
        return 0;

    if ( isdefined( level._id_5618 ) )
        return 0;

    if ( isdefined( level._id_13182[0] ) )
    {
        foreach ( var_1 in level._id_13182 )
        {
            if ( self istouching( var_1 ) )
                return 0;
        }

        if ( level._id_9C46 )
            return self.origin[2] < level._id_13180;
        else
            return 1;
    }
    else if ( distance2dsquared( self.origin, level.mapcenter ) < level._id_13183 && self.origin[2] < level._id_13180 )
        return 1;

    return 0;
}

_id_13173()
{
    self endon( "death" );
    self endon( "in_range" );

    if ( isdefined( self._id_8DBD ) )
        var_0 = 3;
    else
        var_0 = 6;

    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    self notify( "death", "range_death" );
}

_id_1316B( var_0 )
{
    var_0 endon( "death" );
    var_0.owner scripts\engine\utility::waittill_any( "killstreak_disowned" );
    var_0 notify( "death" );
}

_id_1316E( var_0, var_1 )
{
    var_0 endon( "death" );
    var_2 = 60;
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_2 );

    if ( isdefined( var_0.owner ) )
        var_0.owner scripts\mp\utility\game::leaderdialogonplayer( "gryphon_gone" );

    var_0 notify( "death" );
}

_id_13169( var_0 )
{
    level endon( "game_ended" );
    level endon( "objective_cam" );
    var_1 = var_0._id_129B9;
    var_0 waittill( "death" );
    var_0 scripts\mp\weapons::_id_11061();
    stopfxontag( level._id_13162["target_marker_circle"], var_0._id_24D1, "tag_origin" );
    playfx( level._id_13162["explode"], var_0.origin );
    var_0 playsound( "ball_drone_explode" );
    var_1 delete();

    if ( isdefined( var_0._id_1155D ) )
        var_0._id_1155D delete();

    _id_1315F( var_0.owner, var_0 );
}

_id_1316D( var_0 )
{
    var_0 endon( "death" );
    level scripts\engine\utility::waittill_any( "objective_cam", "game_ended" );
    playfx( level._id_13162["explode"], var_0.origin );
    var_0 playsound( "ball_drone_explode" );
    _id_1315F( var_0.owner, var_0 );
}

_id_1315F( var_0, var_1 )
{
    var_1 notify( "end_remote" );
    var_1._id_D3D3 = 0;
    var_1 _meth_831F( undefined );
    _id_13174( var_0, var_1 );
    stopfxontag( level._id_13162["smoke"], var_1, "tag_origin" );
    level._id_DF74[var_1.team] = undefined;
    scripts\mp\utility\game::_id_4FC1();

    if ( isdefined( var_1._id_A63A ) )
        var_1._id_A63A delete();

    var_1._id_24D1 delete();
    var_1 delete();
}

_id_E2E5()
{
    self visionsetnakedforplayer( "", 1 );
    scripts\mp\utility\game::_id_F607( "", 1 );
}

_id_13174( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_0 scripts\mp\utility\game::_id_41E9();
    var_0 _id_E2E5();
    var_0 setclientomnvar( "ui_vanguard", 0 );

    if ( getdvarint( "camera_thirdPerson" ) )
        var_0 scripts\mp\utility\game::_id_F887( 1 );

    var_0 cameraunlink( var_1 );
    var_0 remotecontrolvehicleoff( var_1 );
    var_0 thermalvisionfofoverlayoff();
    var_0 setplayerangles( var_0._id_E2D7 );
    var_0._id_DF8A = undefined;

    if ( var_0.team == "spectator" )
        return;

    level thread _id_13161( var_0 );
}

_id_13161( var_0 )
{
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_0 scripts\mp\utility\game::_id_7385( 1 );
    wait 0.5;
    var_0 scripts\mp\utility\game::_id_7385( 0 );
}

_id_1317E()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "end_remote" );

    for (;;)
    {
        var_0 = 0;

        foreach ( var_2 in level._id_8DD3 )
        {
            if ( distance( var_2.origin, self.origin ) < 300 )
            {
                var_0 = 1;
                self._id_8DBD = var_2;
            }
        }

        foreach ( var_5 in level._id_AD8B )
        {
            if ( var_5 != self && ( !isdefined( var_5.helitype ) || var_5.helitype != "remote_uav" ) && distance( var_5.origin, self.origin ) < 300 )
            {
                var_0 = 1;
                self._id_8DBD = var_5;
            }
        }

        if ( !self._id_94D1 && var_0 )
            self._id_94D1 = 1;
        else if ( self._id_94D1 && !var_0 )
        {
            self._id_94D1 = 0;
            self._id_8DBD = undefined;
        }

        wait 0.05;
    }
}

_id_13164()
{
    self endon( "death" );
    level endon( "game_ended" );
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
        scripts\mp\damage::monitordamageoneshot( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, "remote_uav", ::_id_898F, ::_id_B938, 1 );
    }
}

_id_1317B()
{
    self endon( "death" );
    level endon( "game_ended" );
    self _meth_81F7();
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( isdefined( self._id_C8F2 ) )
            self._id_C8F2 scripts\mp\damage::monitordamageoneshot( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, "remote_uav", ::_id_898F, ::_id_B938, 1 );
    }
}

_id_B938( var_0, var_1, var_2, var_3 )
{
    var_4 = var_3;
    var_4 = scripts\mp\damage::_id_8999( var_1, var_2, var_4 );
    var_4 = scripts\mp\damage::_id_89C6( var_1, var_2, var_4 );
    var_4 = scripts\mp\damage::_id_89AC( var_1, var_2, var_4 );
    var_4 = scripts\mp\damage::_id_8975( var_1, var_2, var_4 );

    if ( var_2 == "MOD_MELEE" )
        var_4 = self.maxhealth * 0.34;

    playfxontagforclients( level._id_13162["hit"], self, "tag_origin", self.owner );

    if ( self._id_1037E == 0 && self._id_00E1 >= self.maxhealth / 2 )
    {
        self._id_1037E = 1;
        playfxontag( level._id_13162["smoke"], self, "tag_origin" );
    }

    return var_4;
}

_id_898F( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self.owner ) )
        self.owner scripts\mp\utility\game::leaderdialogonplayer( "gryphon_destroyed" );

    scripts\mp\damage::onkillstreakkilled( "vanguard", var_0, var_1, var_2, var_3, "destroyed_vanguard", undefined, "callout_destroyed_vanguard" );

    if ( isdefined( var_0 ) )
    {
        var_0 scripts\mp\missions::_id_D992( "ch_gryphondown" );
        scripts\mp\missions::_id_3DE3( var_0, self, var_1 );
    }
}

_id_13A10()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        stopfxontag( level._id_13162["target_marker_circle"], self._id_24D1, "tag_origin" );
        scripts\engine\utility::waitframe();
        thread _id_13179();
        playfxontag( scripts\engine\utility::_id_7ECB( "emp_stun" ), self, "tag_origin" );
        wait( var_1 );
        stopfxontag( level._id_13162["target_marker_circle"], self._id_24D1, "tag_origin" );
        scripts\engine\utility::waitframe();
        thread _id_13175();
    }
}

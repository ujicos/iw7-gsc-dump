// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "venom", ::_id_1288B, undefined, undefined, undefined, ::_id_13C17 );
    var_0 = [ "passive_increased_debuff", "passive_decreased_damage", "passive_increased_speed", "passive_decreased_duration", "passive_quiet_vehicle", "passive_decreased_speed", "passive_heavy", "passive_increased_frost", "passive_speed_heavy", "passive_stealth_speed" ];
    _id_0AC7::_id_DF07( "venom", var_0 );
    level._effect["venom_gas"] = loadfx( "vfx/iw7/_requests/mp/vfx_venom_gas_cloud" );
    level._effect["venom_trail"] = loadfx( "vfx/iw7/_requests/mp/vfx_venom_gas_trail" );
    level._effect["venom_eyeglow"] = loadfx( "vfx/iw7/_requests/mp/vfx_venom_glint" );
    level._effect["venom_kamikaze_boost"] = loadfx( "vfx/iw7/_requests/mp/vfx_venom_kamikaze_boost" );
    level._effect["venom_kamikaze_trail"] = loadfx( "vfx/iw7/_requests/mp/vfx_venom_kamikaze_trail" );
    level.venoms = 0;
}

_id_13C17( var_0 )
{
    var_1 = 0;

    if ( isdefined( level.venoms ) && level.venoms > 0 )
    {
        if ( level.venoms >= 6 )
            var_1 = 1;
    }

    if ( scripts\mp\utility\game::istrue( var_1 ) )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_VENOM_MAX" );
        return 0;
    }

    self setclientomnvar( "ui_remote_control_sequence", 1 );
}

_id_1288B( var_0 )
{
    var_1 = scripts\mp\killstreaks\killstreaks::_id_D507( var_0 );

    if ( !var_1 )
        return 0;

    var_2 = _id_6C9B( 80, 20, 10 );

    if ( !isdefined( var_2 ) )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_NOT_ENOUGH_SPACE" );
        thread scripts\mp\killstreaks\killstreaks::_id_11086();
        return 0;
    }

    scripts\engine\utility::_id_1C6E( 0 );
    scripts\engine\utility::_id_1C76( 0 );
    var_3 = "venom_drone_wm";
    var_4 = 30;
    var_5 = 10;
    var_6 = "veh_venom_mp";
    var_7 = "used_venom";
    var_8 = _id_0AC7::getrarityforlootitem( var_0._id_1318B );

    if ( var_8 != "" )
    {
        var_3 = var_3 + "_" + var_8;
        var_7 = var_7 + "_" + var_8;
    }

    if ( _id_0DC9::_id_A69F( var_0, "passive_increased_frost" ) )
        var_4 -= 10;

    if ( _id_0DC9::_id_A69F( var_0, "passive_speed_heavy" ) )
        var_6 = "veh_venom_mp_fast";

    if ( _id_0DC9::_id_A69F( var_0, "passive_stealth_speed" ) )
        var_6 = "veh_venom_mp_slow";

    var_9 = spawnvehicle( var_3, var_0._id_110EA, var_6, var_2, self.angles, self );
    var_9.team = self.team;
    var_9.owner = self;
    var_9.health = 99999;
    var_9.maxhealth = var_5;
    var_9._id_EDD7 = var_5;
    var_9._id_110EA = var_0._id_110EA;
    var_9._id_AC75 = var_4;
    var_9._id_108FF = var_2;
    var_9._id_C1D4 = _id_0DC9::_id_C1D3;
    var_9._id_13C2E = "venomproj_mp";
    var_9._id_110E8 = var_0;
    var_9 _meth_8491( "fly" );
    var_9 _meth_849F( 0 );
    var_9 _meth_8317( 1 );
    var_9 _meth_80C7();
    var_9 _meth_831F( self );
    var_9 _meth_82DD( self );
    level.venoms++;
    var_9 setscriptablepartstate( "body", "show", 0 );
    var_9 setscriptablepartstate( "dust", "active", 0 );
    var_9 setscriptablepartstate( "eye", "idle", 0 );

    if ( _id_0DC9::_id_A69F( var_0, "passive_stealth_speed" ) )
    {
        var_9 setscriptablepartstate( "stealth", "active", 0 );
        var_9 setscriptablepartstate( "center_disc", "hide_fx", 0 );
        var_9 setscriptablepartstate( "side_discs", "hide_fx", 0 );
        var_9 setscriptablepartstate( "lights", "hide_fx", 0 );
    }
    else
    {
        var_9 setscriptablepartstate( "center_disc", "idle", 0 );
        var_9 setscriptablepartstate( "side_discs", "idle", 0 );
        var_9 setscriptablepartstate( "lights", "idle", 0 );
    }

    self setplayerangles( var_9.angles );
    self remotecontrolvehicle( var_9 );
    self _meth_8490( "disable_mode_switching", 1 );
    self _meth_8490( "disable_juke", 0 );
    self _meth_8490( "disable_guns", 1 );
    self _meth_8490( "disable_boost", 1 );
    thread _id_F673();
    var_9 _id_0DC9::_id_1843( var_0._id_110EA, "Killstreak_Ground", var_9.owner, 1 );
    var_9 _id_0DC9::_id_FAE4( "venom_end" );
    var_9 thread _id_13285();
    var_9 thread _id_1327E();
    var_9 thread _id_1327D();
    var_9 thread _id_1327B();
    var_9 thread _id_13279();
    var_9 thread _id_1327A();
    var_10 = var_9._id_AC75;

    if ( scripts\mp\utility\game::_id_9D46() )
        var_10 = int( var_10 / 2 );

    var_9 thread _id_13281( var_10 );
    var_9 thread _id_13283();
    var_9 thread _id_1327C();
    var_9 thread venom_watchempdamage();
    scripts\mp\matchdata::_id_AFC9( var_0._id_110EA, var_9.origin );

    if ( getdvarint( "camera_thirdPerson" ) )
        scripts\mp\utility\game::_id_F887( 0 );

    self._id_E2D7 = self.angles;
    thread _id_5130( var_9, var_10 );
    level thread scripts\mp\utility\game::_id_115DE( var_7, self );
    return 1;
}

_id_5130( var_0, var_1 )
{
    self endon( "disconnect" );
    var_0 endon( "venom_end" );
    level endon( "game_ended" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.1 );
    self setclientomnvar( "ui_venom_controls", 1 );
    self setclientomnvar( "ui_killstreak_countdown", gettime() + int( var_1 * 1000 ) );
    self setclientomnvar( "ui_killstreak_health", var_0._id_EDD7 / 10 );
    self _meth_83BE();
}

_id_F673()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = 0;
    var_1 = self _meth_842D( var_0 );
    var_2 = self _meth_8433( var_0 );
    var_3 = self _meth_842F( var_0 );
    self _meth_842E( var_0, 140 );
    self _meth_8434( var_0, 600 );
    self _meth_8430( var_0, 500 );
    thread _id_E2DE( var_1, var_2, var_3 );
}

_id_E2DE( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "restore_old_values" );
    var_3 = 0;
    self _meth_842E( var_3, var_0 );
    self _meth_8434( var_3, 1000 );
    self _meth_8430( var_3, 0 );
    wait 0.5;
    self _meth_8434( var_3, var_1 );
    self _meth_8430( var_3, var_2 );
}

_id_13285()
{
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    self endon( "venom_end" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "spaceship_thrusting", var_1 );

        if ( scripts\mp\utility\game::istrue( var_1 ) )
        {
            self setscriptablepartstate( "center_disc", "thrust", 0 );
            continue;
        }

        if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_stealth_speed" ) )
        {
            self setscriptablepartstate( "center_disc", "hide_fx", 0 );
            continue;
        }

        self setscriptablepartstate( "center_disc", "idle", 0 );
    }
}

_id_1327E()
{
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    self endon( "venom_end" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "spaceship_juking", var_1, var_2 );

        if ( scripts\mp\utility\game::istrue( var_2 ) )
        {
            self setscriptablepartstate( "side_discs", "thrust", 0 );
            continue;
        }

        if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_stealth_speed" ) )
        {
            self setscriptablepartstate( "side_discs", "hide_fx", 0 );
            continue;
        }

        self setscriptablepartstate( "side_discs", "idle", 0 );
    }
}

_id_1327D()
{
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    self endon( "venom_end" );
    level endon( "game_ended" );

    for (;;)
    {
        var_0 waittill( "energy_depleted", var_1 );

        if ( var_1 == 0 )
        {
            if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_stealth_speed" ) )
            {
                self setscriptablepartstate( "center_disc", "hide_fx", 0 );
                continue;
            }

            self setscriptablepartstate( "center_disc", "idle", 0 );
        }
    }
}

_id_1327B()
{
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    self endon( "venom_end" );
    level endon( "game_ended" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.5 );

    for (;;)
    {
        if ( var_0 attackbuttonpressed() )
        {
            var_1 = distancesquared( self._id_108FF, self.origin );

            if ( var_1 >= 5760000 )
                var_0 scripts\mp\missions::_id_D991( "ch_venom_distance" );

            self notify( "venom_end", self.origin );
        }

        scripts\engine\utility::waitframe();
    }
}

_id_0118( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        self _meth_8593();
        self setscriptablepartstate( "Explosion", "explode", 0 );
    }
}

_id_13279()
{
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    self endon( "venom_end" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14 );
        var_10 = scripts\mp\utility\game::_id_13CA1( var_10, var_14 );

        if ( isdefined( var_2 ) && var_2.classname != "trigger_hurt" )
        {
            if ( isdefined( var_2.owner ) )
                var_2 = var_2.owner;

            if ( isdefined( var_2.team ) && var_2.team == self.team && var_2 != self.owner )
                continue;
        }

        if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_2 ) )
            continue;

        if ( isdefined( var_10 ) )
            var_1 = _id_0DC9::_id_7FBD( var_2, var_10, var_5, var_1, self.maxhealth, 1, 1, 1 );

        self._id_EDD7 -= var_1;

        if ( self._id_EDD7 < 0 )
            self._id_EDD7 = 0;

        var_0 setclientomnvar( "ui_killstreak_health", self._id_EDD7 / 10 );

        if ( isplayer( var_2 ) )
        {
            scripts\mp\killstreaks\killstreaks::_id_A6A0( var_2, var_10, self, var_5 );

            if ( isdefined( var_10 ) && var_10 == "concussion_grenade_mp" )
            {
                if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_2 ) ) )
                    var_2 scripts\mp\missions::_id_D991( "ch_tactical_emp_eqp" );
            }

            var_2 scripts\mp\damagefeedback::updatedamagefeedback( "" );

            if ( self._id_EDD7 <= 0 )
            {
                var_2 notify( "destroyed_killstreak", var_10 );
                var_15 = _id_0AC7::getrarityforlootitem( self._id_110E8._id_1318B );
                var_16 = "callout_destroyed_" + self._id_110EA;

                if ( var_15 != "" )
                    var_16 = var_16 + "_" + var_15;

                scripts\mp\damage::onkillstreakkilled( self._id_110EA, var_2, var_10, var_5, var_1, "destroyed_" + self._id_110EA, "venom_destroyed", var_16, 1 );
                self notify( "venom_end", self.origin );
            }

            continue;
        }

        if ( self._id_EDD7 <= 0 )
            self notify( "venom_end", self.origin, 1 );
    }
}

_id_1327A()
{
    var_0 = self.owner;
    level endon( "game_ended" );
    self waittill( "venom_end", var_1, var_2 );
    scripts\mp\utility\game::_id_D915( "killstreak ended - venom", var_0 );

    if ( getdvarint( "camera_thirdPerson" ) )
        scripts\mp\utility\game::_id_F887( 1 );

    self setscriptablepartstate( "body", "hide", 0 );
    self setscriptablepartstate( "center_disc", "hide_fx", 0 );
    self setscriptablepartstate( "side_discs", "hide_fx", 0 );
    self setscriptablepartstate( "eye", "hide_fx", 0 );
    self setscriptablepartstate( "lights", "hide_fx", 0 );
    self setscriptablepartstate( "stealth", "neutral", 0 );
    thread _id_0118( var_0, var_1 );
    level.venoms--;

    if ( level.venoms < 0 )
        level.venoms = 0;

    if ( isdefined( var_0 ) )
    {
        if ( !scripts\mp\utility\game::istrue( var_2 ) )
        {
            var_0 scripts\mp\utility\game::_id_7385( 1 );
            scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1 );
            var_0 scripts\mp\utility\game::_id_7385( 0 );
        }

        var_0 setclientomnvar( "ui_out_of_bounds_countdown", 0 );
        var_0 remotecontrolvehicleoff();
        var_0 setclientomnvar( "ui_venom_controls", 0 );
        var_0 setclientomnvar( "ui_killstreak_countdown", 0 );
        var_0 setclientomnvar( "ui_killstreak_health", 0 );
        var_0 setclientomnvar( "ui_killstreak_missile_warn", 0 );
        var_0 setplayerangles( var_0._id_E2D7 );
        var_0 thermalvisionfofoverlayoff();
        var_0._id_E2D7 = undefined;
        var_0 thread scripts\mp\killstreaks\killstreaks::_id_11086();
        var_0 scripts\engine\utility::_id_1C6E( 1 );
        var_0 scripts\engine\utility::_id_1C76( 1 );
        var_0 notify( "restore_old_values" );
    }

    self delete();
}

_id_13281( var_0 )
{
    var_1 = self.owner;
    var_1 endon( "disconnect" );
    self endon( "venom_end" );
    self endon( "host_migration_lifetime_update" );
    level endon( "game_ended" );
    thread _id_0DC9::watchhostmigrationlifetime( "venom_end", var_0, ::_id_13281 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    var_1 scripts\mp\utility\game::_id_D4B6( "venom_timeout", undefined, undefined, var_1.origin );
    self notify( "venom_end", self.origin );
}

_id_13283()
{
    var_0 = self.owner;
    self endon( "venom_end" );
    level endon( "game_ended" );
    var_0 scripts\engine\utility::waittill_any( "joined_team", "disconnect", "joined_spectators" );
    self notify( "venom_end", self.origin );
}

_id_1327C()
{
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    self endon( "venom_end" );
    level endon( "game_ended" );
    thread scripts\mp\killstreaks\killstreaks::_id_1CA5( "venom_end" );
    self waittill( "killstreakExit" );
    self notify( "venom_end", self.origin );
}

venom_watchempdamage()
{
    level endon( "game_ended" );
    self endon( "venom_end" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1, var_2, var_3, var_4 );
        _id_0DC9::dodamagetokillstreak( 100, var_0, var_0, self.team, var_2, var_4, var_3 );
    }
}

_id_13284()
{
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    self endon( "venom_end" );
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_1 );
        thread _id_13276( var_1 );
    }
}

_id_13275()
{
    var_0 = self.owner;

    foreach ( var_2 in level.players )
    {
        if ( var_2.team == var_0.team && var_2 != var_0 )
            continue;

        _id_0DC9::_id_20CF( var_2, "venom_end" );
    }
}

_id_13276( var_0 )
{
    var_1 = self.owner;
    var_1 endon( "disconnect" );
    self endon( "venom_end" );
    var_0 endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        var_0 waittill( "removed_spawn_perks" );

        if ( var_0.team == var_1.team )
            break;

        _id_0DC9::_id_20CF( var_0, "venom_end" );
    }
}

_id_6C9B( var_0, var_1, var_2 )
{
    var_3 = anglestoforward( self.angles );
    var_4 = anglestoright( self.angles );
    var_5 = self geteye();
    var_6 = var_5 + ( 0, 0, var_1 );
    var_7 = var_6 + var_0 * var_3;

    if ( _id_3DCF( var_5, var_7, var_2 ) )
        return var_7;

    var_7 = var_6 - var_0 * var_3;

    if ( _id_3DCF( var_5, var_7, var_2 ) )
        return var_7;

    var_7 += var_0 * var_4;

    if ( _id_3DCF( var_5, var_7, var_2 ) )
        return var_7;

    var_7 = var_6 - var_0 * var_4;

    if ( _id_3DCF( var_5, var_7, var_2 ) )
        return var_7;

    var_7 = var_6;

    if ( _id_3DCF( var_5, var_7, var_2 ) )
        return var_7;

    scripts\engine\utility::waitframe();
    var_7 = var_6 + 0.707 * var_0 * ( var_3 + var_4 );

    if ( _id_3DCF( var_5, var_7, var_2 ) )
        return var_7;

    var_7 = var_6 + 0.707 * var_0 * ( var_3 - var_4 );

    if ( _id_3DCF( var_5, var_7, var_2 ) )
        return var_7;

    var_7 = var_6 + 0.707 * var_0 * ( var_4 - var_3 );

    if ( _id_3DCF( var_5, var_7, var_2 ) )
        return var_7;

    var_7 = var_6 + 0.707 * var_0 * ( -1 * var_3 - var_4 );

    if ( _id_3DCF( var_5, var_7, var_2 ) )
        return var_7;

    return undefined;
}

_id_3DCF( var_0, var_1, var_2 )
{
    var_3 = 0;

    if ( capsuletracepassed( var_1, var_2, var_2 * 2 + 0.01, undefined, 1, 1 ) )
    {
        var_4 = [ self ];
        var_5 = physics_createcontents( [ "physicscontents_solid", "physicscontents_glass", "physicscontents_vehicleclip", "physicscontents_missileclip", "physicscontents_clipshot" ] );
        var_6 = physics_raycast( var_0, var_1, var_5, var_4, 0, "physicsquery_closest" );

        if ( var_6.size == 0 )
            var_3 = 1;
    }

    return var_3;
}

isvenom()
{
    return isdefined( self._id_110EA ) && self._id_110EA == "venom";
}

makedamageimmune( var_0 )
{
    if ( !isdefined( self.entsimmune ) )
        self.entsimmune = [];

    self.entsimmune[var_0 getentitynumber()] = var_0;
}

isdamageimmune( var_0 )
{
    if ( !isvenom() )
        return 0;

    if ( !isdefined( self.entsimmune ) )
        return 0;

    return isdefined( self.entsimmune[var_0 getentitynumber()] );
}

venommodifieddamage( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_0 ) && isdefined( var_3 ) && isdefined( var_1 ) )
    {
        if ( var_3 isvenom() && _id_0DC9::_id_A69F( var_3._id_110E8, "passive_decreased_damage" ) )
        {
            var_5 = distance2dsquared( var_1.origin, var_3.origin );

            if ( var_5 >= 22500 && var_4 > 10 )
                var_4 = 0;
        }

        if ( var_3 isdamageimmune( var_1 ) )
            var_4 = 0;
    }

    return var_4;
}

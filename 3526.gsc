// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "thor", ::_id_12909, undefined, undefined, undefined, ::_id_13C8E, undefined, ::_id_13099, ::_id_13CD7 );
    level._effect["thor_clouds"] = loadfx( "vfx/core/mp/killstreaks/odin/odin_parallax_clouds" );
    level._effect["thor_fisheye"] = loadfx( "vfx/iw7/_requests/mp/vfx_scrnfx_thor_fisheye.vfx" );
    level._effect["thor_targeting"] = loadfx( "vfx/core/mp/killstreaks/odin/vfx_marker_odin_cyan" );
    level._effect["thor_target_mark"] = loadfx( "vfx/iw7/_requests/mp/vfx_marker_map_target" );
    level._effect["thor_explode"] = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_veh_exp_thor.vfx" );
    level._id_117B0 = [];
    level._id_117B0["thor"] = spawnstruct();
    level._id_117B0["thor"]._id_11901 = 60;
    level._id_117B0["thor"].maxhealth = 2600;
    level._id_117B0["thor"]._id_110EA = "thor";
    level._id_117B0["thor"]._id_13260 = "thor_mp";
    level._id_117B0["thor"]._id_B91A = "veh_mil_air_thor_wm";
    level._id_117B0["thor"]._id_115EB = "used_thor";
    level._id_117B0["thor"]._id_13553 = "loki_gone";
    level._id_117B0["thor"]._id_1352D = "odin_target_killed";
    level._id_117B0["thor"]._id_1352C = "odin_targets_killed";
    level._id_117B0["thor"]._id_12B20 = 4;
    level._id_117B0["thor"]._id_12B80 = &"KILLSTREAKS_LOKI_UNAVAILABLE";
    level._id_117B0["thor"]._id_73BE = "compass_objpoint_airstrike_friendly";
    level._id_117B0["thor"]._id_6485 = "compass_objpoint_airstrike_busy";
    level._id_117B0["thor"].weapon["missile"] = spawnstruct();
    level._id_117B0["thor"].weapon["missile"].weaponname = "thorproj_mp";
    level._id_117B0["thor"].weapon["missile"]._id_13FCB = "thorproj_zoomed_mp";
    level._id_117B0["thor"].weapon["missile"]._id_DA5A = "thorproj_mp";
    level._id_117B0["thor"].weapon["missile"]._id_E7BA = "heavygun_fire";
    level._id_117B0["thor"].weapon["missile"]._id_DF5C = 0.1;
    level._id_117B0["thor"].weapon["missile"]._id_B47C = 5;
    level._id_117B0["thor"].weapon["missile"]._id_D5E4 = "null";
    level._id_117B0["thor"].weapon["missile"]._id_D5DD = "null";
    level._id_117B0["thor"].weapon["missile"]._id_C195 = "null";
    level._id_C20D = 0;
    var_0 = [ "passive_increased_armor", "passive_decreased_duration", "passive_seek_cluster", "passive_no_cursor", "passive_switch_thruster", "passive_armor_duration" ];
    _id_0AC7::_id_DF07( "thor", var_0 );
}

_id_13C8E( var_0 )
{
    var_1 = 1;

    if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + var_1 >= scripts\mp\utility\game::_id_B4D2() )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_TOO_MANY_VEHICLES" );
        return 0;
    }

    level._id_C20D++;

    if ( level._id_C20D > 1 )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_TOO_MANY_THORS" );
        level._id_C20D--;
        return 0;
    }

    thread _id_13B73();
    self setclientomnvar( "ui_remote_control_sequence", 1 );
    return 1;
}

_id_13B73()
{
    self endon( "thor_weapon_switch_ended" );
    level endon( "game_ended" );
    scripts\engine\utility::waittill_any( "death", "disconnect" );

    if ( isdefined( level._id_C20D ) && level._id_C20D > 0 )
        level._id_C20D--;

    if ( isdefined( self ) )
        self setclientomnvar( "ui_remote_control_sequence", 0 );
}

_id_13CD7( var_0, var_1 )
{
    self notify( "thor_weapon_switch_ended" );

    if ( !scripts\mp\utility\game::istrue( var_1 ) )
    {
        if ( isdefined( level._id_C20D ) && level._id_C20D > 0 )
            level._id_C20D--;

        self setclientomnvar( "ui_remote_control_sequence", 0 );
    }
}

_id_13099( var_0 )
{
    level._id_C20D--;
    self setclientomnvar( "ui_remote_control_sequence", 0 );
}

_id_12909( var_0 )
{
    var_1 = scripts\mp\killstreaks\killstreaks::_id_D507( var_0 );

    if ( !var_1 )
    {
        level._id_C20D--;
        return 0;
    }

    var_1 = _id_10DFC( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    return var_1;
}

_id_10DFC( var_0 )
{
    self._id_117AF = spawn( "script_model", level._id_12AF6 );
    self._id_117AF setmodel( "tag_origin" );
    self._id_117AF.angles = ( 0, 115, 0 );
    self._id_117AF.owner = self;
    self._id_117AF hide();
    self._id_117AF thread _id_E731( -360, 60, "thor_fire_thrusters", "thor_switch_thrusters" );
    self.thorrigangle = -360;
    self._id_E2D7 = vectortoangles( anglestoforward( self.angles ) );
    scripts\mp\utility\game::_id_93FA();
    var_1 = _id_4A26( var_0._id_110EA, var_0 );

    if ( !isdefined( var_1 ) )
    {
        level._id_C20D--;
        scripts\mp\utility\game::_id_4FC1();
        thread scripts\mp\killstreaks\killstreaks::_id_11086();
        return 0;
    }

    return 1;
}

_id_E731( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self.owner endon( "disconnect" );

    if ( isdefined( var_2 ) )
        self.owner endon( var_2 );

    if ( isdefined( var_3 ) )
        self.owner endon( var_3 );

    if ( !isdefined( var_0 ) )
        var_0 = -360;

    if ( !isdefined( var_1 ) )
        var_1 = 60;

    for (;;)
    {
        self _meth_8271( var_0, var_1 );
        wait( var_1 );
    }
}

_id_4A26( var_0, var_1 )
{
    var_2 = level._id_117B0[var_0];
    var_3 = randomint( 360 );
    var_4 = 7000;
    var_5 = 10000;
    var_6 = cos( var_3 ) * var_4;
    var_7 = sin( var_3 ) * var_4;
    var_8 = vectornormalize( ( var_6, var_7, var_5 ) );
    var_8 *= var_4;
    var_9 = self._id_117AF.origin + var_8 + ( 0, 0, 1000 );
    var_10 = self._id_117AF.origin + var_8;
    var_11 = var_2._id_B91A;
    var_12 = _id_0AC7::getrarityforlootitem( var_1._id_1318B );

    if ( var_12 != "" )
        var_11 = var_11 + "_" + var_12;

    var_13 = spawn( "script_model", var_9 );

    if ( !isdefined( var_13 ) )
        return undefined;

    var_13 setmodel( var_11 );
    var_13.team = self.team;
    var_13.owner = self;
    var_13.health = 99999;
    var_13._id_C22B = 1;
    var_13._id_C239 = var_2.weapon["missile"]._id_B47C;
    var_13._id_C238 = 0;
    var_13._id_B88C = _id_989D( "ID" );
    var_13._id_B888 = _id_989D( "Distance" );
    var_13._id_B47C = var_2.weapon["missile"]._id_B47C;
    var_13._id_DF5C = var_2.weapon["missile"]._id_DF5C;
    var_13._id_13F0A = 10000;
    var_13._id_110EA = var_0;
    var_13._id_117B2 = 1;
    var_13._id_110E8 = var_1;
    var_13.basemodel = var_11;
    var_13 setcandamage( 1 );
    var_13 _meth_831F( self );
    var_13 setscriptablepartstate( "body", "hide", 0 );
    var_13.angles = vectortoangles( self._id_117AF.origin - ( var_13.origin[0], var_13.origin[1], self._id_117AF.origin[2] ) );
    var_13._id_10E4C = _id_495B();
    thread _id_117AE( var_13, var_10 );
    return var_13;
}

_id_117AE( var_0, var_1 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_0.owner playlocalsound( "thor_init_plr" );
    var_0 moveto( var_1, 1 );
    var_0 scriptmodelplayanim( "iw7_mp_killstreak_thor_idle", 1 );
    var_0 setscriptablepartstate( "thrusters", "drop", 0 );
    scripts\mp\shellshock::_id_1245( 0.15, 2, var_0.origin, 2000 );
    var_2 = level._id_117B0[var_0._id_110EA];

    if ( getdvarint( "camera_thirdPerson" ) )
        scripts\mp\utility\game::_id_F887( 0 );

    var_3 = var_2.weapon["missile"].weaponname;
    var_4 = var_2.weapon["missile"]._id_13FCB;
    var_0.primaryweapon = var_3;
    var_0._id_F0C4 = var_4;
    var_0.owner scripts\mp\utility\game::_id_12C6( var_3 );
    var_0.owner scripts\mp\utility\game::_id_12C6( var_4 );
    var_0.owner scripts\mp\utility\game::_id_141B( var_3 );
    var_0.owner _meth_823E( var_0, "tag_player", 0.0, 180, 180, 45, 180 );
    var_0.owner _meth_8236( 0 );
    var_0.owner _meth_85A2( getthormapvisionset( level._id_B335 ) );
    var_0.owner thread _id_B011( var_0 );
    var_0.owner setclientomnvar( "ui_thor_show", 1 );
    var_0.owner setclientomnvar( "ui_thor_missiles_loaded", var_2.weapon["missile"]._id_B47C );
    var_0.owner _meth_83BE();
    var_0.owner _meth_83C0();

    for ( var_5 = 0; var_5 < 5; var_5++ )
    {
        var_0.owner setclientomnvar( var_0._id_B88C[var_5]._id_C4A1, undefined );
        var_0.owner setclientomnvar( var_0._id_B888[var_5]._id_C4A1, -1 );
    }

    var_0.owner _meth_82C0( "thor_killstreak", 1 );
    var_6 = var_2._id_115EB;
    var_7 = _id_0AC7::getrarityforlootitem( var_0._id_110E8._id_1318B );

    if ( var_7 != "" )
        var_6 = var_6 + "_" + var_7;

    level thread scripts\mp\utility\game::_id_115DE( var_6, self );
    var_0.owner scripts\engine\utility::_id_1C76( 0 );
    var_0 _id_8ED7( var_0.basemodel );
    var_0 thread _id_117A7();
    var_0 thread _id_117A0();
    var_0 thread _id_117A9();
    wait 0.5;
    var_0 scriptmodelplayanim( "iw7_mp_killstreak_thor_extend", 1 );
    wait 0.5;
    var_0 scriptmodelplayanim( "iw7_mp_killstreak_thor_extend_idle", 1 );
    var_0 setscriptablepartstate( "thrusters", "idle", 0 );
    scripts\mp\shellshock::_id_1245( 0.2, 0.76, var_0.origin, 1000 );
    var_0 linkto( self._id_117AF, "tag_origin" );
    var_0 _id_0DC9::_id_1843( var_0._id_110EA, undefined, var_0.owner, 1 );
    var_8 = "icon_minimap_thor_friendly";
    var_0.minimapid = var_0 scripts\mp\killstreaks\airdrop::_id_49F7( var_8, undefined, 1, 1, 1 );
    var_9 = var_2._id_11901;

    if ( _id_0DC9::_id_A69F( var_0._id_110E8, "passive_armor_duration" ) )
        var_9 -= 5;

    var_0 thread _id_1179D( var_0.owner );
    var_0 thread _id_117AC( var_9 );
    var_0 thread _id_117AA();
    var_0 thread _id_1179F();
    var_0 thread _id_117AD();
    var_0 thread _id_117AB();
    var_0 thread _id_117A2();

    if ( _id_0DC9::_id_A69F( var_0._id_110E8, "passive_switch_thruster" ) )
        var_0 thread thor_watchswitchthrust( var_0.owner );

    var_0 thread _id_117A3();
    var_0 thread _id_1179E();
    var_0 thread _id_117A5();
    var_0 thread _id_117A1();
    var_0 thread _id_117A8();
    var_0 thread _id_11790();
    var_0 thread _id_13AA2( self, var_2 );
    var_0.owner scripts\mp\matchdata::_id_AFC9( var_0._id_110EA, self.origin );
    var_0.owner scripts\engine\utility::_id_1C6E( 0 );
    var_0.owner setclientomnvar( "ui_killstreak_countdown", gettime() + int( var_9 * 1000 ) );
    var_0.owner setclientomnvar( "ui_killstreak_health", var_2.maxhealth / 2600 );
}

_id_8ED7( var_0 )
{
    self _meth_8187( "j_backend", var_0 );
    self _meth_8187( "j_shield_1", var_0 );
    self _meth_8187( "j_shield_2", var_0 );
    self _meth_8187( "j_shield_3", var_0 );
    self _meth_8187( "j_shield_4", var_0 );
    self _meth_8187( "j_nose", var_0 );
}

_id_989D( var_0 )
{
    var_1 = [];

    switch ( var_0 )
    {
        case "ID":
            for ( var_2 = 0; var_2 < 5; var_2++ )
            {
                var_3 = spawnstruct();
                var_3._id_C4A1 = "ui_thor_missile_" + var_2;
                var_3._id_9B04 = 0;
                var_1[var_1.size] = var_3;
            }

            break;
        case "Distance":
            for ( var_2 = 0; var_2 < 5; var_2++ )
            {
                var_3 = spawnstruct();
                var_3._id_C4A1 = "ui_thor_missile_" + var_2 + "_dist";
                var_3._id_9B04 = 0;
                var_1[var_1.size] = var_3;
            }

            break;
    }

    return var_1;
}

_id_13AA2( var_0, var_1 )
{
    var_0 endon( "disconnect" );
    var_0 endon( "joined_team" );
    var_0 endon( "joined_spectators" );
    var_0 endon( "killstreak_disowned" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );

    for (;;)
    {
        level waittill( "host_migration_end" );
        var_0 _meth_83BE();

        if ( scripts\mp\utility\game::istrue( self._id_117B2 ) )
        {
            var_0 _meth_83C0();
            continue;
        }

        var_0 thermalvisionoff();
    }
}

_id_B011( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    wait 0.05;
    var_1 = vectortoangles( level._id_12AF5.origin - var_0 gettagorigin( "tag_player" ) );
    self setplayerangles( var_1 );
}

_id_1369B( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1.0 );
    var_1 = scripts\mp\utility\game::_id_C794( self, "cyan", self, 0, 0, "killstreak" );
    var_0 thread _id_E146( var_1, self );
}

_id_13699( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    self delete();
}

_id_1179A( var_0 )
{
    scripts\mp\utility\game::_id_FB09( var_0._id_110EA );
}

_id_1178F( var_0 )
{
    if ( isdefined( self ) )
        scripts\mp\utility\game::_id_41E9();
}

_id_1179C( var_0 )
{
    while ( isdefined( self._id_9BE2 ) && var_0 > 0 )
    {
        wait 0.05;
        var_0 -= 0.05;
    }
}

_id_1179D( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        var_1 = scripts\engine\utility::_id_13734( "start_fire", "start_reload", "death", "leaving" );

        if ( var_1 == "death" || var_1 == "leaving" )
            break;

        var_0 scripts\engine\utility::_id_1C46( 0 );
        scripts\engine\utility::waittill_any( "finished_single_fire", "finished_reload", "death", "leaving" );
        var_0 scripts\engine\utility::_id_1C46( 1 );
    }
}

_id_117A0()
{
    level endon( "game_ended" );
    self endon( "leaving" );
    self waittill( "death" );

    if ( isdefined( self.owner ) )
    {
        self.owner _id_11791( self );
        self.owner setclientomnvar( "ui_thor_show", 0 );
        self.owner setclientomnvar( "ui_killstreak_countdown", 0 );
        self.owner setclientomnvar( "ui_killstreak_health", 0 );
        self.owner setclientomnvar( "ui_killstreak_missile_warn", 0 );
        self.owner _meth_8070( 1 );
        self.owner _meth_83A9( "thor_thrust_rumble" );

        foreach ( var_1 in self._id_B88C )
            self.owner setclientomnvar( var_1._id_C4A1, undefined );

        foreach ( var_4 in self._id_B888 )
            self.owner setclientomnvar( var_4._id_C4A1, -1 );
    }

    _id_4074();
    scripts\mp\utility\game::_id_4FC1();
    playfx( scripts\engine\utility::_id_7ECB( "thor_explode" ), self.origin );
    self delete();
}

_id_117AC( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self endon( "host_migration_lifetime_update" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    thread _id_0DC9::watchhostmigrationlifetime( "leaving", var_0, ::_id_117AC );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    _id_1179C( 3 );
    var_1 = [ "thor_end", "thor_timeout" ];
    var_2 = randomint( var_1.size );
    var_3 = var_1[var_2];
    self.owner scripts\mp\utility\game::_id_D4B6( var_3, undefined, undefined, self.owner.origin );
    thread _id_11795();
}

_id_117A7()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner scripts\engine\utility::waittill_any( "disconnect", "joined_team", "joined_spectators" );
    self notify( "death" );
}

_id_117A5()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    level waittill( "objective_cam" );
    thread _id_11795();
}

_id_117A9()
{
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    level scripts\engine\utility::waittill_any( "round_end_finished", "game_ended" );
    var_0 = 1;
    thread _id_11795( var_0 );
}

_id_11795( var_0 )
{
    self endon( "death" );
    self notify( "leaving" );
    var_1 = level._id_117B0[self._id_110EA];
    scripts\mp\utility\game::_id_AAE7( var_1._id_13553 );

    if ( isdefined( self.owner ) )
    {
        self.owner _id_11791( self, var_0 );
        self.owner setclientomnvar( "ui_thor_show", 0 );
        self.owner setclientomnvar( "ui_killstreak_countdown", 0 );
        self.owner setclientomnvar( "ui_killstreak_health", 0 );
        self.owner setclientomnvar( "ui_killstreak_missile_warn", 0 );
        self.owner _meth_8070( 1 );
        self.owner _meth_83A9( "thor_thrust_rumble" );

        foreach ( var_3 in self._id_B88C )
            self.owner setclientomnvar( var_3._id_C4A1, undefined );

        foreach ( var_6 in self._id_B888 )
            self.owner setclientomnvar( var_6._id_C4A1, -1 );
    }

    self notify( "gone" );
    self scriptmodelplayanim( "iw7_mp_killstreak_thor_extend_to_up", 1 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1 );
    self moveto( self.origin + ( 0, 0, 15000 ), 5, 3.5 );
    self scriptmodelplayanim( "iw7_mp_killstreak_thor_extend_up", 1 );
    self setscriptablepartstate( "thrusters", "leave", 0 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 5 );
    _id_4074();
    scripts\mp\utility\game::_id_4FC1();
    self delete();
}

_id_11791( var_0, var_1 )
{
    var_2 = level._id_117B0[var_0._id_110EA];
    scripts\mp\utility\game::_id_D915( "killstreak ended - thor", self );

    if ( isdefined( var_0 ) )
    {
        var_0 notify( "end_remote" );
        self notify( "thor_ride_ended" );
        scripts\engine\utility::_id_1C6E( 1 );

        if ( getdvarint( "camera_thirdPerson" ) )
            scripts\mp\utility\game::_id_F887( 1 );

        self thermalvisionfofoverlayoff();
        self thermalvisionoff();
        self _meth_85A2( "" );
        self unlink();
        self setplayerangles( self._id_E2D7 );

        if ( scripts\mp\utility\game::istrue( var_1 ) )
            scripts\mp\utility\game::_id_1136C( scripts\engine\utility::_id_7F62(), 1 );
        else
            thread _id_11794();

        self stopolcalsound( "odin_negative_action" );
        self stopolcalsound( "odin_positive_action" );

        foreach ( var_4 in level._id_117B0[var_0._id_110EA].weapon )
        {
            if ( isdefined( var_4._id_D5E4 ) )
                self stopolcalsound( var_4._id_D5E4 );

            if ( isdefined( var_4._id_D5DD ) )
                self stopolcalsound( var_4._id_D5DD );
        }

        thread scripts\mp\killstreaks\killstreaks::_id_11086();

        if ( isdefined( self._id_117AF ) )
            self._id_117AF delete();

        thread scripts\mp\utility\game::_id_141E( var_0.primaryweapon );
        thread scripts\mp\utility\game::_id_141E( var_0._id_F0C4 );
        scripts\engine\utility::_id_1C76( 1 );
    }
}

_id_11794()
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    scripts\mp\utility\game::_id_7385( 1 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.5 );
    scripts\mp\utility\game::_id_7385( 0 );
}

_id_117AA()
{
    self endon( "death" );
    self endon( "leaving" );
    level endon( "game_ended" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    var_1 = spawn( "script_model", ( 0, 0, 0 ) );
    var_1.angles = vectortoangles( ( 0, 0, 1 ) );
    var_1 setmodel( "tag_origin" );
    var_1 hide();
    self._id_1156A = var_1;
    self _meth_8549();
    self _meth_8594();

    for (;;)
    {
        var_2 = var_0 getvieworigin() - ( 0, 0, 50 );
        var_3 = var_2 + anglestoforward( var_0 getplayerangles() ) * 50000;
        var_4 = [ "physicscontents_clipshot", "physicscontents_corpseclipshot", "physicscontents_missileclip", "physicscontents_solid", "physicscontents_vehicle" ];
        var_5 = physics_createcontents( var_4 );
        var_6 = scripts\engine\trace::_id_DCED( var_2, var_3, level._id_3CB5, var_5 );
        var_1.origin = var_6["position"] + ( 0, 0, 50 );
        scripts\engine\utility::waitframe();
    }
}

_id_1179F()
{
    self endon( "death" );
    self endon( "leaving" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    var_1 = level._id_117B0[self._id_110EA];
    var_2 = var_1.maxhealth;
    var_3 = 0;
    var_4 = 3;
    var_5 = 4;
    var_6 = 5;

    if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_armor_duration" ) )
    {
        var_4++;
        var_5++;
        var_6++;
    }

    for (;;)
    {
        self waittill( "damage", var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16, var_17, var_18, var_19, var_20 );
        var_16 = scripts\mp\utility\game::_id_13CA1( var_16, var_20 );

        if ( isdefined( var_8 ) )
        {
            if ( isdefined( var_8.owner ) )
                var_8 = var_8.owner;

            if ( isdefined( var_8.team ) && var_8.team == self.team && var_8 != self.owner )
                continue;
        }

        if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_8 ) )
            continue;

        if ( isdefined( var_11 ) )
            var_0 _id_4CF1( self, var_11 );

        if ( isdefined( var_16 ) )
        {
            var_7 = _id_0DC9::_id_7FBD( var_8, var_16, var_11, var_7, var_1.maxhealth, var_4, var_5, var_6 );

            if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_armor_duration" ) )
            {
                if ( _id_0DC9::isexplosiveantikillstreakweapon( var_16 ) )
                    var_8 scripts\mp\damagefeedback::updatedamagefeedback( "hitblastshield" );
            }
        }

        var_2 -= var_7;
        var_0 setclientomnvar( "ui_killstreak_health", var_2 / var_1.maxhealth );

        if ( isplayer( var_8 ) )
        {
            var_8 scripts\mp\damagefeedback::updatedamagefeedback( "" );
            scripts\mp\killstreaks\killstreaks::_id_A6A0( var_8, var_16, self, var_11 );
            scripts\mp\damage::_id_AF96( self, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16 );

            if ( var_2 <= 0 )
            {
                var_8 notify( "destroyed_killstreak", var_16 );
                var_21 = "callout_destroyed_thor";
                var_22 = _id_0AC7::getrarityforlootitem( self._id_110E8._id_1318B );

                if ( var_22 != "" )
                    var_21 = var_21 + "_" + var_22;

                scripts\mp\damage::onkillstreakkilled( "thor", var_8, var_16, var_11, var_7, "destroyed_thor", "thor_destroyed", var_21 );
                return;
            }
        }
    }
}

_id_4CF1( var_0, var_1 )
{
    switch ( var_1 )
    {
        case "MOD_GRENADE_SPLASH":
        case "MOD_GRENADE":
        case "MOD_PROJECTILE":
        case "MOD_EXPLOSIVE_BULLET":
        case "MOD_PISTOL_BULLET":
        case "MOD_RIFLE_BULLET":
            _id_3239( var_0 );
            break;
        case "MOD_PROJECTILE_SPLASH":
        case "MOD_IMPACT":
        case "MOD_EXPLOSIVE":
            _id_69E6( var_0 );
            break;
        default:
    }
}

_id_3239( var_0 )
{
    self _meth_844F( 0.15, 0.25, var_0 gettagorigin( "tag_player" ), 50 );
    self playrumbleonentity( "damage_light" );
    thread _id_1349D( var_0, 0.4 );
}

_id_69E6( var_0 )
{
    self _meth_844F( 0.4, 0.45, var_0 gettagorigin( "tag_player" ), 1000 );
    self playrumbleonentity( "damage_heavy" );
    thread _id_1349D( var_0, 0.7 );
}

_id_1349D( var_0, var_1 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );

    for ( var_0._id_10E4C.alpha = var_1; var_1 > 0; var_0._id_10E4C.alpha = var_1 )
    {
        scripts\engine\utility::waitframe();
        var_1 -= 0.1;
    }
}

_id_495B()
{
    var_0 = newclienthudelem( self );
    var_0.x = 0;
    var_0.y = 0;
    var_0 setshader( "white", 640, 480 );
    var_0._id_002B = "left";
    var_0._id_002C = "top";
    var_0._id_02A4 = 1;
    var_0._id_017D = "fullscreen";
    var_0._id_0382 = "fullscreen";
    var_0.alpha = 0;
    var_0._id_0142 = 1;
    return var_0;
}

_id_117AD()
{
    self endon( "death" );
    self endon( "leaving" );
    level endon( "game_ended" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    var_1 = level._id_117B0[self._id_110EA];

    if ( !isai( var_0 ) )
        var_0 notifyonplayercommand( "thor_missile_zoom_on", "+weapnext" );

    for (;;)
    {
        var_0 waittill( "thor_missile_zoom_on" );
        var_0 scripts\engine\utility::_id_1C76( 1 );

        if ( !isdefined( self._id_117B3 ) )
        {
            var_0 scripts\mp\utility\game::_id_141B( self._id_F0C4 );
            self._id_117B3 = 1;
            var_0 setclientomnvar( "ui_thor_show", 2 );
        }
        else
        {
            var_0 scripts\mp\utility\game::_id_141B( self.primaryweapon );
            self._id_117B3 = undefined;
            var_0 setclientomnvar( "ui_thor_show", 1 );
        }

        var_0 scripts\engine\utility::_id_1C76( 0 );
    }
}

_id_117AB()
{
    self endon( "death" );
    self endon( "leaving" );
    level endon( "game_ended" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    var_1 = level._id_117B0[self._id_110EA];

    if ( !isai( var_0 ) )
    {
        if ( var_0 scripts\engine\utility::_id_9C70() )
            var_0 notifyonplayercommand( "thor_thermal_toggle", "+usereload" );

        var_0 notifyonplayercommand( "thor_thermal_toggle", "+activate" );
    }

    for (;;)
    {
        var_0 waittill( "thor_thermal_toggle" );

        if ( !isdefined( self._id_117B2 ) )
        {
            var_0 _meth_83C0();
            self._id_117B2 = 1;
            continue;
        }

        var_0 thermalvisionoff();
        self._id_117B2 = undefined;
    }
}

_id_117A2()
{
    self endon( "death" );
    self endon( "leaving" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );

    if ( !isai( var_0 ) )
    {
        var_0 notifyonplayercommand( "thor_fire_thrusters", "+smoke" );
        var_0 notifyonplayercommand( "thor_release_thrusters", "-smoke" );
    }

    for (;;)
    {
        var_1 = var_0 scripts\engine\utility::_id_13734( "thor_fire_thrusters", "thor_release_thrusters" );

        if ( !isdefined( var_1 ) )
            continue;

        if ( var_1 == "thor_fire_thrusters" )
        {
            var_0._id_117AF thread _id_E731( var_0.thorrigangle, 30, "thor_release_thrusters", "thor_switch_thrusters" );
            thread _id_B06B( var_0 );

            if ( var_0.thorrigangle == -360 )
                self scriptmodelplayanim( "iw7_mp_killstreak_thor_extend_thrust", 1 );
            else
                self scriptmodelplayanim( "iw7_mp_killstreak_thor_extend_rev_thrust", 1 );

            self setscriptablepartstate( "thrusters", "boost", 0 );
            continue;
        }

        var_0._id_117AF thread _id_E731( var_0.thorrigangle, 60, "thor_fire_thrusters", "thor_switch_thrusters" );
        var_0 _meth_83A9( "thor_thrust_rumble" );

        if ( var_0.thorrigangle == -360 )
            self scriptmodelplayanim( "iw7_mp_killstreak_thor_extend_idle", 1 );
        else
            self scriptmodelplayanim( "iw7_mp_killstreak_thor_extend_rev_idle", 1 );

        self setscriptablepartstate( "thrusters", "idle", 0 );
    }
}

_id_B06B( var_0 )
{
    self endon( "death" );
    var_0 endon( "thor_release_thrusters" );
    var_0 _meth_8244( "thor_thrust_rumble" );

    for (;;)
    {
        scripts\mp\shellshock::_id_1245( 0.15, 0.05, self.origin, 1000 );
        scripts\engine\utility::waitframe();
    }
}

_id_B9F2( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1.5 );
    var_1 = [];

    for (;;)
    {
        var_2 = var_0 scripts\mp\utility\game::_id_7BC3();

        foreach ( var_4 in var_1 )
        {
            if ( !scripts\engine\utility::array_contains( var_2, var_4 ) )
            {
                var_1 = scripts\engine\utility::array_remove( var_1, var_4 );
                self hide();
                self _meth_8388( var_0 );
            }
        }

        foreach ( var_4 in var_2 )
        {
            self _meth_8388( var_4 );

            if ( !scripts\engine\utility::array_contains( var_1, var_4 ) )
            {
                var_1 = scripts\engine\utility::_id_2279( var_1, var_4 );
                stopfxontag( level._effect["thor_targeting"], self, "tag_origin" );
                wait 0.05;
                playfxontag( level._effect["thor_targeting"], self, "tag_origin" );
            }
        }

        wait 0.25;
    }
}

thor_watchswitchthrust( var_0 )
{
    self endon( "death" );
    self endon( "leaving" );
    level endon( "game_ended" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );

    if ( !isai( var_0 ) )
    {
        var_0 notifyonplayercommand( "thor_switch_thrusters", "+speed_throw" );
        var_0 notifyonplayercommand( "thor_switch_thrusters", "+toggleads_throw" );
        var_0 notifyonplayercommand( "thor_switch_thrusters", "+ads_akimbo_accessible" );
    }

    for (;;)
    {
        var_1 = var_0 scripts\engine\utility::_id_13734( "thor_switch_thrusters" );

        if ( var_0.thorrigangle == -360 )
        {
            self scriptmodelplayanim( "iw7_mp_killstreak_thor_extend_rev_idle", 1 );
            var_0.thorrigangle = 360;
        }
        else
        {
            self scriptmodelplayanim( "iw7_mp_killstreak_thor_extend_idle", 1 );
            var_0.thorrigangle = -360;
        }

        var_0._id_117AF thread _id_E731( var_0.thorrigangle, 60, "thor_fire_thrusters", "thor_switch_thrusters" );
    }
}

thor_watchdebugtogglemovement( var_0 )
{
    self endon( "death" );
    self endon( "leaving" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );

    if ( !isai( var_0 ) )
    {
        var_0 notifyonplayercommand( "thor_toggle_movement", "+speed_throw" );
        var_0 notifyonplayercommand( "thor_toggle_movement", "+toggleads_throw" );
        var_0 notifyonplayercommand( "thor_toggle_movement", "+ads_akimbo_accessible" );
    }

    var_1 = 1;

    for (;;)
    {
        var_2 = var_0 scripts\engine\utility::_id_13734( "thor_toggle_movement" );

        if ( scripts\mp\utility\game::istrue( var_1 ) )
        {
            self unlink();
            var_1 = 0;
            continue;
        }

        self linkto( var_0._id_117AF, "tag_origin" );
        var_1 = 1;
    }
}

_id_117A3()
{
    self endon( "death" );
    self endon( "leaving" );
    level endon( "game_ended" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    var_1 = "missile";
    var_2 = level._id_117B0[self._id_110EA].weapon[var_1];

    for (;;)
    {
        var_0 waittill( "missile_fire", var_3, var_4 );

        if ( scripts\mp\utility\game::istrue( self._id_9BE2 ) )
            continue;

        if ( scripts\mp\utility\game::istrue( self._id_9C9F ) )
            continue;

        if ( isdefined( level._id_90A9 ) )
            continue;

        if ( isdefined( self._id_C239 ) && self._id_C239 < 1 )
            continue;

        if ( isdefined( var_4 ) && ( var_4 != "thorproj_mp" && var_4 != "thorproj_zoomed_mp" ) )
            continue;

        self setscriptablepartstate( "muzzle", "fire", 0 );
        thread _id_5104( 0.1 );
        var_3._id_110E8 = self._id_110E8;

        if ( isdefined( var_4 ) && var_4 == "thorproj_mp" )
        {
            var_3 thread _id_139D1( var_0, var_1, self );
            continue;
        }

        var_3 thread _id_13B42( var_0, self );
    }
}

_id_5104( var_0 )
{
    self endon( "death" );
    wait( var_0 );
    self setscriptablepartstate( "muzzle", "neutral", 0 );
}

_id_139D1( var_0, var_1, var_2 )
{
    var_0 endon( "disconnect" );
    var_2 endon( "death" );
    var_3 = var_2._id_1156A;
    var_4 = var_2._id_B88C;
    var_5 = var_2._id_B888;
    var_6 = self.angles;
    var_2._id_9BE2 = 1;
    var_2 notify( "start_fire" );
    var_7 = var_3.origin;
    var_8 = _id_0DC9::_id_7E92( var_0 );
    var_9 = [];

    foreach ( var_11 in var_8 )
    {
        if ( !_id_0DC9::manualmissilecantracktarget( var_11 ) )
            continue;

        if ( var_0 _meth_8409( var_11.origin, 65, 55 ) )
            var_9[var_9.size] = var_11;
    }

    self waittill( "explode", var_13 );
    var_14 = var_2._id_C239;
    var_15 = "thorproj_tracking_mp";

    for ( var_16 = 0; var_16 < var_14; var_16++ )
    {
        if ( !isdefined( var_2 ) )
            break;

        var_17 = randomint( 360 );
        var_18 = anglestoright( var_6 ) * cos( var_17 );
        var_19 = anglestoforward( var_6 ) * 3;
        var_20 = anglestoup( var_6 ) * sin( var_17 );
        var_21 = var_18 + var_19 + var_20;
        var_22 = scripts\mp\utility\game::_id_1309( var_15, var_13, var_13 + var_21, var_0 );
        var_22.owner = var_0;
        var_22._id_13F0A = var_13[2];
        var_22._id_92B8 = _id_7FBA( var_4 );
        var_22._id_5716 = _id_7FBA( var_5 );
        var_22._id_C79D = scripts\mp\utility\game::_id_C794( var_22, "white", var_22.owner, 0, 0, "killstreak_personal" );
        var_22._id_110E8 = var_2._id_110E8;
        var_22.owner setclientomnvar( var_22._id_92B8._id_C4A1, var_22 );
        var_22.owner setclientomnvar( var_22._id_5716._id_C4A1, int( var_22._id_13F0A ) );

        if ( _id_0DC9::_id_A69F( var_2._id_110E8, "passive_seek_cluster" ) )
            var_22 thread delayseekopentargetinview( 0.3, var_22.owner, var_7, var_9 );
        else
            var_22 thread _id_50E6( 0.3, var_3 );

        var_22 thread _id_139F6( var_22.owner, var_2 );
        var_22 thread _id_13A22( var_22.owner, var_2 );
        var_22 thread _id_0DC9::watchsupertrophynotify( var_22.owner );
        var_2._id_C239--;
        var_0 setclientomnvar( "ui_thor_missiles_loaded", var_2._id_C239 );
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.1 );
    }

    var_2 scriptmodelplayanim( "iw7_mp_killstreak_thor_extend_reload", 1 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 2 );
    var_2 notify( "start_reload" );
    var_2._id_9BE2 = undefined;
}

delayseekopentargetinview( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;
    wait( var_0 );

    foreach ( var_6 in var_3 )
    {
        if ( !_id_0DC9::manualmissilecantracktarget( var_6 ) )
            continue;

        if ( scripts\mp\utility\game::istrue( var_6.thortargetted ) )
            continue;

        var_4 = var_6;
        break;
    }

    if ( isdefined( var_4 ) )
    {
        self _meth_8206( var_4 );
        self _meth_8204();
        var_4.thortargetted = 1;
        var_4 thread watchtarget( self );
    }
    else
    {
        self _meth_8207( var_2 );
        self _meth_8204();
    }
}

watchtarget( var_0 )
{
    self endon( "disconnect" );

    for (;;)
    {
        if ( !_id_0DC9::manualmissilecantracktarget( self ) )
            break;

        if ( !isdefined( var_0 ) )
            break;

        scripts\engine\utility::waitframe();
    }

    self.thortargetted = undefined;

    if ( isdefined( var_0 ) )
        var_0 _meth_8203();
}

_id_390B( var_0 )
{
    var_1 = 0;
    var_2 = scripts\engine\trace::_id_48BC( 0, 1, 1, 1, 1, 1, 0 );
    var_3 = var_0 gettagorigin( "j_head" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( !scripts\engine\trace::_id_DCF1( self.origin, var_3[var_4], self, var_2 ) )
            continue;

        var_1 = 1;
        break;
    }

    return var_1;
}

_id_50E6( var_0, var_1 )
{
    self.owner endon( "disconnect" );
    wait( var_0 );

    if ( isdefined( var_1 ) )
        self _meth_8206( var_1 );

    self _meth_8204();
}

_id_139F6( var_0, var_1 )
{
    self endon( "explode" );
    self endon( "death" );

    for (;;)
    {
        if ( isdefined( var_1._id_9C9F ) )
            break;

        self._id_13F0A = self.origin[2];
        var_2 = scripts\engine\trace::_id_DCED( self.origin, self.origin + ( 0, 0, -1000000.0 ) );
        var_3 = var_2["position"];
        self._id_13F0A = self.origin - var_2["position"];
        self._id_13F0A = self._id_13F0A[2];
        var_0 setclientomnvar( self._id_5716._id_C4A1, int( max( 0.0, self._id_13F0A ) ) );
        scripts\engine\utility::waitframe();
    }
}

_id_13A22( var_0, var_1 )
{
    self waittill( "explode", var_2 );

    if ( isdefined( self._id_C79D ) )
        scripts\mp\utility\game::_id_C78F( self._id_C79D, self );

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( self._id_92B8._id_C4A1 ) )
            var_0 setclientomnvar( self._id_92B8._id_C4A1, undefined );
    }
}

_id_13B42( var_0, var_1 )
{
    var_0 endon( "disconnect" );
    var_1 endon( "death" );
    var_1._id_9BE2 = 1;
    var_1 notify( "start_fire" );
    var_2 = var_1._id_B88C;
    var_3 = var_1._id_B888;
    self._id_13F0A = self.origin[2];
    self._id_92B8 = _id_7FBA( var_2 );
    self._id_5716 = _id_7FBA( var_3 );
    self._id_C79D = scripts\mp\utility\game::_id_C794( self, "white", var_0, 0, 0, "killstreak_personal" );
    var_0 setclientomnvar( self._id_92B8._id_C4A1, self );
    var_0 setclientomnvar( self._id_5716._id_C4A1, int( self._id_13F0A ) );
    thread _id_139F6( var_0, var_1 );
    thread _id_13A22( var_0, var_1 );
    thread _id_0DC9::watchsupertrophynotify( var_0 );
    var_1._id_C239--;
    var_0 setclientomnvar( "ui_thor_missiles_loaded", var_1._id_C239 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.1 );

    if ( var_1._id_C239 > 0 )
        var_1 notify( "finished_single_fire" );
    else
    {
        var_1 scriptmodelplayanim( "iw7_mp_killstreak_thor_extend_reload", 1 );
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 2 );
        var_1 notify( "start_reload" );
    }

    var_1._id_9BE2 = undefined;
}

_id_1179E()
{
    self endon( "death" );
    self endon( "leaving" );
    var_0 = 0;

    for (;;)
    {
        self waittill( "start_reload" );

        if ( var_0 == 20 )
        {
            _id_1179C( 3 );
            self notify( "death" );
        }

        thread _id_1179B();
        var_0++;
    }
}

_id_1179B()
{
    self endon( "death" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    var_0 endon( "thor_missile_fire_success" );
    level endon( "game_ended" );
    _id_1179C( 3 );

    if ( self._id_C239 < self._id_B47C )
    {
        self._id_9C9F = 1;
        var_0 playlocalsound( "thor_missile_reload" );
        thread _id_510A( 1 );

        while ( self._id_C239 < self._id_B47C )
        {
            self._id_C239++;
            var_0 setclientomnvar( "ui_thor_missiles_loaded", self._id_C239 );
            self._id_B88C[self._id_C239 - 1]._id_9B04 = 0;
            self._id_B888[self._id_C239 - 1]._id_9B04 = 0;
            var_0 setclientomnvar( self._id_B888[self._id_C239 - 1]._id_C4A1, -1 );
        }
    }
    else
        self notify( "finished_reload" );
}

_id_510A( var_0 )
{
    self endon( "death" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    self._id_9C9F = undefined;
    self notify( "finished_reload" );
}

_id_12F01( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "thor_missile_fire_success" );
    level endon( "game_ended" );
    var_1 = gettime();
    var_2 = var_1 + self._id_DF5C * 1000;
    var_3 = var_1;

    while ( var_3 < var_2 )
    {
        var_3 = gettime();
        var_4 = ( var_3 - var_1 ) / ( var_2 - var_1 );
        var_4 = clamp( var_4, 0.0, 1.0 );
        scripts\engine\utility::waitframe();
    }
}

_id_13AD4()
{
    self endon( "death" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1 );
    self delete();
}

_id_117A6()
{
    self endon( "death" );
    level endon( "game_ended" );

    foreach ( var_1 in level._id_C928 )
        _id_20D2( var_1 );
}

_id_20D2( var_0 )
{
    if ( level.teambased && var_0.team != self.team )
        return;
    else if ( !level.teambased )
        return;

    var_1 = scripts\mp\utility\game::_id_C794( var_0, "cyan", self.owner, 1, 1, "killstreak" );
    thread _id_E146( var_1, var_0 );
}

_id_6567( var_0 )
{
    return var_0 scripts\mp\utility\game::_id_12D6( "specialty_noplayertarget" );
}

_id_E146( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        var_1 endon( "disconnect" );

    level endon( "game_ended" );
    var_3 = [ "leave", "death" ];

    if ( isdefined( var_2 ) )
        scripts\engine\utility::_id_1372F( var_3, var_2 );
    else
        scripts\engine\utility::_id_13731( var_3 );

    scripts\mp\utility\game::_id_C78F( var_0, var_1 );
}

_id_117A8()
{
    self endon( "death" );
    self endon( "leaving" );
    level endon( "game_ended" );
    self._id_63AB = 0;

    for (;;)
    {
        level waittill( "thor_killed_player", var_0 );
        self._id_63AB++;
        self notify( "thor_enemy_killed" );
    }
}

_id_11790( var_0 )
{
    self endon( "death" );
    self endon( "leaving" );
    level endon( "game_ended" );
    var_1 = level._id_117B0[self._id_110EA];
    var_2 = 1.0;

    for (;;)
    {
        self waittill( "thor_enemy_killed" );
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_2 );

        if ( self._id_63AB > 1 )
            self.owner scripts\mp\utility\game::leaderdialogonplayer( var_1._id_1352C );
        else
            self.owner scripts\mp\utility\game::leaderdialogonplayer( var_1._id_1352D );

        self._id_63AB = 0;
    }
}

_id_11796()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_11797( self );
    }
}

_id_11797( var_0 )
{
    self endon( "disconnect" );
    self waittill( "spawned_player" );
    var_0 _id_20D2( self );
}

_id_4074()
{
    if ( isdefined( self._id_1156A ) )
        self._id_1156A delete();

    if ( isdefined( self._id_C7FF ) )
        self._id_C7FF delete();

    if ( isdefined( self._id_10E4C ) )
        self._id_10E4C destroy();

    if ( isdefined( self.minimapid ) )
        scripts\mp\objidpoolmanager::returnminimapid( self.minimapid );

    level._id_C20D--;
}

_id_117A1()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    thread scripts\mp\killstreaks\killstreaks::_id_1CA5();
    self waittill( "killstreakExit" );
    var_0 = level._id_117B0[self._id_110EA];
    scripts\mp\utility\game::_id_AAE7( var_0._id_13553 );
    thread _id_11795();
}

_id_7FBA( var_0 )
{
    var_1 = undefined;

    for ( var_2 = 4; var_2 + 1 > 0; var_2-- )
    {
        if ( !var_0[var_2]._id_9B04 )
        {
            var_1 = var_0[var_2];
            var_0[var_2]._id_9B04 = 1;
            break;
        }
    }

    return var_1;
}

getthormapvisionset( var_0 )
{
    var_1 = "";

    switch ( var_0 )
    {
        case "mp_depot":
        case "mp_hawkwar":
        case "mp_paris":
        case "mp_overflow":
        case "mp_flip":
        case "mp_geneva":
        case "mp_dome_dusk":
        case "mp_rivet":
        case "mp_skyway":
        case "mp_quarry":
        case "mp_breakneck":
        case "mp_junk":
            var_1 = "thorbright_mp";
            break;
        default:
            var_1 = "thor_mp";
            break;
    }

    return var_1;
}

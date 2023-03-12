// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "odin_support", ::_id_128F1 );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "odin_assault", ::_id_128F1 );
    level._effect["odin_clouds"] = loadfx( "vfx/core/mp/killstreaks/odin/odin_parallax_clouds" );
    level._effect["odin_fisheye"] = loadfx( "vfx/code/screen/vfx_scrnfx_odin_fisheye.vfx" );
    level._effect["odin_targeting"] = loadfx( "vfx/core/mp/killstreaks/odin/vfx_marker_odin_cyan" );
    level._id_C321 = [];
    level._id_C321["odin_support"] = spawnstruct();
    level._id_C321["odin_support"]._id_11901 = 60.0;
    level._id_C321["odin_support"]._id_110EA = "odin_support";
    level._id_C321["odin_support"]._id_13260 = "odin_mp";
    level._id_C321["odin_support"]._id_B91A = "vehicle_odin_mp";
    level._id_C321["odin_support"]._id_115EB = "used_odin_support";
    level._id_C321["odin_support"]._id_13553 = "odin_gone";
    level._id_C321["odin_support"]._id_1352D = "odin_target_killed";
    level._id_C321["odin_support"]._id_1352C = "odin_targets_killed";
    level._id_C321["odin_support"]._id_12B20 = 1;
    level._id_C321["odin_support"]._id_12B80 = &"KILLSTREAKS_ODIN_UNAVAILABLE";
    level._id_C321["odin_support"].weapon["airdrop"] = spawnstruct();
    level._id_C321["odin_support"].weapon["airdrop"]._id_DA5A = "odin_projectile_airdrop_mp";
    level._id_C321["odin_support"].weapon["airdrop"]._id_E7BA = "smg_fire";
    level._id_C321["odin_support"].weapon["airdrop"]._id_1E44 = "ui_odin_airdrop_ammo";
    level._id_C321["odin_support"].weapon["airdrop"]._id_1AA0 = "airdrop_support";
    level._id_C321["odin_support"].weapon["airdrop"]._id_DF5D = 20;
    level._id_C321["odin_support"].weapon["airdrop"]._id_12B22 = -1;
    level._id_C321["odin_support"].weapon["airdrop"]._id_13521 = "odin_carepackage";
    level._id_C321["odin_support"].weapon["airdrop"]._id_D5E4 = "odin_carepack_ready";
    level._id_C321["odin_support"].weapon["airdrop"]._id_D5DD = "odin_carepack_launch";
    level._id_C321["odin_support"].weapon["marking"] = spawnstruct();
    level._id_C321["odin_support"].weapon["marking"]._id_DA5A = "odin_projectile_marking_mp";
    level._id_C321["odin_support"].weapon["marking"]._id_E7BA = "heavygun_fire";
    level._id_C321["odin_support"].weapon["marking"]._id_1E44 = "ui_odin_marking_ammo";
    level._id_C321["odin_support"].weapon["marking"]._id_DF5D = 4;
    level._id_C321["odin_support"].weapon["marking"]._id_12B22 = -1;
    level._id_C321["odin_support"].weapon["marking"]._id_1354C = "odin_marking";
    level._id_C321["odin_support"].weapon["marking"]._id_1354B = "odin_marked";
    level._id_C321["odin_support"].weapon["marking"]._id_1354A = "odin_m_marked";
    level._id_C321["odin_support"].weapon["marking"]._id_D5E4 = "odin_flash_ready";
    level._id_C321["odin_support"].weapon["marking"]._id_D5DD = "odin_flash_launch";
    level._id_C321["odin_support"].weapon["smoke"] = spawnstruct();
    level._id_C321["odin_support"].weapon["smoke"]._id_DA5A = "odin_projectile_smoke_mp";
    level._id_C321["odin_support"].weapon["smoke"]._id_E7BA = "smg_fire";
    level._id_C321["odin_support"].weapon["smoke"]._id_1E44 = "ui_odin_smoke_ammo";
    level._id_C321["odin_support"].weapon["smoke"]._id_DF5D = 7;
    level._id_C321["odin_support"].weapon["smoke"]._id_12B22 = -1;
    level._id_C321["odin_support"].weapon["smoke"]._id_13551 = "odin_smoke";
    level._id_C321["odin_support"].weapon["smoke"]._id_D5E4 = "odin_smoke_ready";
    level._id_C321["odin_support"].weapon["smoke"]._id_D5DD = "odin_smoke_launch";
    level._id_C321["odin_support"].weapon["juggernaut"] = spawnstruct();
    level._id_C321["odin_support"].weapon["juggernaut"]._id_DA5A = "odin_projectile_smoke_mp";
    level._id_C321["odin_support"].weapon["juggernaut"]._id_E7BA = "heavygun_fire";
    level._id_C321["odin_support"].weapon["juggernaut"]._id_1E44 = "ui_odin_juggernaut_ammo";
    level._id_C321["odin_support"].weapon["juggernaut"]._id_A4AF = "juggernaut_recon";
    level._id_C321["odin_support"].weapon["juggernaut"]._id_DF5D = level._id_C321["odin_support"]._id_11901;
    level._id_C321["odin_support"].weapon["juggernaut"]._id_12B22 = -1;
    level._id_C321["odin_support"].weapon["juggernaut"]._id_12B23 = -2;
    level._id_C321["odin_support"].weapon["juggernaut"]._id_12B21 = -3;
    level._id_C321["odin_support"].weapon["juggernaut"]._id_1352B = "odin_moving";
    level._id_C321["odin_support"].weapon["juggernaut"]._id_D5E4 = "null";
    level._id_C321["odin_support"].weapon["juggernaut"]._id_D5DD = "odin_jugg_launch";
    level._id_C321["odin_assault"] = spawnstruct();
    level._id_C321["odin_assault"]._id_11901 = 60.0;
    level._id_C321["odin_assault"]._id_110EA = "odin_assault";
    level._id_C321["odin_assault"]._id_13260 = "odin_mp";
    level._id_C321["odin_assault"]._id_B91A = "vehicle_odin_mp";
    level._id_C321["odin_assault"]._id_115EB = "used_odin_assault";
    level._id_C321["odin_assault"]._id_13553 = "loki_gone";
    level._id_C321["odin_assault"]._id_1352D = "odin_target_killed";
    level._id_C321["odin_assault"]._id_1352C = "odin_targets_killed";
    level._id_C321["odin_assault"]._id_12B20 = 2;
    level._id_C321["odin_assault"]._id_12B80 = &"KILLSTREAKS_LOKI_UNAVAILABLE";
    level._id_C321["odin_assault"].weapon["airdrop"] = spawnstruct();
    level._id_C321["odin_assault"].weapon["airdrop"]._id_DA5A = "odin_projectile_airdrop_mp";
    level._id_C321["odin_assault"].weapon["airdrop"]._id_E7BA = "smg_fire";
    level._id_C321["odin_assault"].weapon["airdrop"]._id_1E44 = "ui_odin_airdrop_ammo";
    level._id_C321["odin_assault"].weapon["airdrop"]._id_1AA0 = "airdrop_assault";
    level._id_C321["odin_assault"].weapon["airdrop"]._id_DF5D = 20;
    level._id_C321["odin_assault"].weapon["airdrop"]._id_12B22 = -1;
    level._id_C321["odin_assault"].weapon["airdrop"]._id_13521 = "odin_carepackage";
    level._id_C321["odin_assault"].weapon["airdrop"]._id_D5E4 = "odin_carepack_ready";
    level._id_C321["odin_assault"].weapon["airdrop"]._id_D5DD = "odin_carepack_launch";
    level._id_C321["odin_assault"].weapon["large_rod"] = spawnstruct();
    level._id_C321["odin_assault"].weapon["large_rod"]._id_DA5A = "odin_projectile_large_rod_mp";
    level._id_C321["odin_assault"].weapon["large_rod"]._id_E7BA = "heavygun_fire";
    level._id_C321["odin_assault"].weapon["large_rod"]._id_1E44 = "ui_odin_marking_ammo";
    level._id_C321["odin_assault"].weapon["large_rod"]._id_DF5D = 4;
    level._id_C321["odin_assault"].weapon["large_rod"]._id_12B22 = -2;
    level._id_C321["odin_assault"].weapon["large_rod"]._id_D5E4 = "null";
    level._id_C321["odin_assault"].weapon["large_rod"]._id_D5DD = "ac130_105mm_fire";
    level._id_C321["odin_assault"].weapon["large_rod"]._id_C195 = "ac130_105mm_fire_npc";
    level._id_C321["odin_assault"].weapon["small_rod"] = spawnstruct();
    level._id_C321["odin_assault"].weapon["small_rod"]._id_DA5A = "odin_projectile_small_rod_mp";
    level._id_C321["odin_assault"].weapon["small_rod"]._id_E7BA = "smg_fire";
    level._id_C321["odin_assault"].weapon["small_rod"]._id_1E44 = "ui_odin_smoke_ammo";
    level._id_C321["odin_assault"].weapon["small_rod"]._id_DF5D = 2;
    level._id_C321["odin_assault"].weapon["small_rod"]._id_12B22 = -2;
    level._id_C321["odin_assault"].weapon["small_rod"]._id_D5E4 = "null";
    level._id_C321["odin_assault"].weapon["small_rod"]._id_D5DD = "ac130_40mm_fire";
    level._id_C321["odin_assault"].weapon["small_rod"]._id_C195 = "ac130_40mm_fire_npc";
    level._id_C321["odin_assault"].weapon["juggernaut"] = spawnstruct();
    level._id_C321["odin_assault"].weapon["juggernaut"]._id_DA5A = "odin_projectile_smoke_mp";
    level._id_C321["odin_assault"].weapon["juggernaut"]._id_E7BA = "heavygun_fire";
    level._id_C321["odin_assault"].weapon["juggernaut"]._id_1E44 = "ui_odin_juggernaut_ammo";
    level._id_C321["odin_assault"].weapon["juggernaut"]._id_A4AF = "juggernaut";
    level._id_C321["odin_assault"].weapon["juggernaut"]._id_DF5D = level._id_C321["odin_assault"]._id_11901;
    level._id_C321["odin_assault"].weapon["juggernaut"]._id_12B22 = -1;
    level._id_C321["odin_assault"].weapon["juggernaut"]._id_12B23 = -2;
    level._id_C321["odin_assault"].weapon["juggernaut"]._id_12B21 = -3;
    level._id_C321["odin_assault"].weapon["juggernaut"]._id_1352B = "odin_moving";
    level._id_C321["odin_assault"].weapon["juggernaut"]._id_D5E4 = "null";
    level._id_C321["odin_assault"].weapon["juggernaut"]._id_D5DD = "odin_jugg_launch";

    if ( !isdefined( level._id_8D7C ) )
    {
        level._id_8D7C = getent( "heli_pilot_mesh", "targetname" );

        if ( !isdefined( level._id_8D7C ) )
        {

        }
        else
            level._id_8D7C.origin += scripts\mp\utility\game::_id_7EF9();
    }

    scripts\mp\agents\agents::_id_13672();
    level.agent_funcs["odin_juggernaut"] = level.agent_funcs["player"];
    level.agent_funcs["odin_juggernaut"]["think"] = scripts\engine\utility::_id_61B9;
    level._id_C2FF = 800;
    level._id_C300 = 200;
    level._id_1639 = [];
}

_id_128F1( var_0, var_1 )
{
    if ( isdefined( self._id_12B90 ) && self._id_12B90 )
        return 0;

    var_2 = var_1;
    var_3 = 1;

    if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + var_3 >= scripts\mp\utility\game::_id_B4D2() )
    {
        self iprintlnbold( &"KILLSTREAKS_TOO_MANY_VEHICLES" );
        return 0;
    }

    if ( isdefined( level._id_1639[var_2] ) )
    {
        self iprintlnbold( level._id_C321[var_2]._id_12B80 );
        return 0;
    }

    scripts\mp\utility\game::_id_93FA();
    var_4 = _id_49F9( var_2 );

    if ( !isdefined( var_4 ) )
    {
        scripts\mp\utility\game::_id_4FC1();
        return 0;
    }

    var_5 = _id_10DD2( var_4 );

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    return var_5;
}

_id_13AA2( var_0 )
{
    var_0 endon( "disconnect" );
    var_0 endon( "joined_team" );
    var_0 endon( "joined_spectators" );
    var_0 endon( "killstreak_disowned" );
    level endon( "game_ended" );
    self endon( "death" );

    for (;;)
    {
        level waittill( "host_migration_end" );
        var_0 setclientomnvar( "ui_odin", level._id_C321[self._id_C322]._id_12B20 );
        var_0 _meth_83BE();
        playfxontag( level._effect["odin_targeting"], self._id_1156A, "tag_origin" );
        self._id_1156A _meth_8388( var_0 );
    }
}

_id_49F9( var_0 )
{
    var_1 = self.origin * ( 1, 1, 0 ) + ( level._id_8D7C.origin - scripts\mp\utility\game::_id_7EF9() ) * ( 0, 0, 1 );
    var_2 = ( 0, 0, 0 );
    var_3 = spawnhelicopter( self, var_1, var_2, level._id_C321[var_0]._id_13260, level._id_C321[var_0]._id_B91A );

    if ( !isdefined( var_3 ) )
        return;

    var_3._id_02B3 = 40;
    var_3.owner = self;
    var_3.team = self.team;
    var_3._id_C322 = var_0;
    level._id_1639[var_0] = 1;
    self._id_C2D3 = var_3;
    var_3 thread _id_C318();
    var_3 thread _id_C31F();
    var_3 thread _id_C31B();
    var_3 thread _id_C31D();
    var_3 thread _id_C31E();
    var_3 thread _id_C319();
    var_3 thread _id_C31A();
    var_3 thread _id_C31C();
    var_3 thread _id_C2DD();
    var_3 thread _id_C303();
    var_3.owner scripts\mp\matchdata::_id_AFC9( level._id_C321[var_0]._id_110EA, var_1 );
    return var_3;
}

_id_10DD2( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    self._id_E2D7 = vectortoangles( anglestoforward( self.angles ) );
    _id_C30E( var_0 );

    if ( getdvarint( "camera_thirdPerson" ) )
        scripts\mp\utility\game::_id_F887( 0 );

    thread _id_13AA8( var_0 );
    scripts\mp\utility\game::_id_7385( 1 );
    _id_C320( var_0 );
    thread scripts\mp\killstreaks\juggernaut::_id_55F4();
    var_1 = scripts\mp\killstreaks\killstreaks::_id_98C2( var_0._id_C322 );

    if ( var_1 != "success" )
    {
        if ( isdefined( self._id_55E6 ) && self._id_55E6 )
            scripts\engine\utility::_id_1C71( 1 );

        var_0 notify( "death" );
        return 0;
    }

    scripts\mp\utility\game::_id_7385( 0 );
    self remotecontrolvehicle( var_0 );
    var_0 thread _id_13AA2( self );
    var_0._id_C305 = spawnfxforclient( level._effect["odin_fisheye"], self geteye(), self );
    triggerfx( var_0._id_C305 );
    var_0._id_C305 _meth_82EC();
    level thread scripts\mp\utility\game::_id_115DE( level._id_C321[var_0._id_C322]._id_115EB, self );
    self _meth_83BE();
    thread _id_1369B( var_0 );
    return 1;
}

_id_1369B( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    wait 1.0;
    var_1 = scripts\mp\utility\game::_id_C794( self, "cyan", self, 0, 0, "killstreak" );
    var_0 thread _id_E146( var_1, self );
}

_id_C320( var_0 )
{
    var_1 = spawn( "script_model", var_0.origin + ( 0, 0, 3000 ) );
    var_1.angles = vectortoangles( ( 0, 0, 1 ) );
    var_1 setmodel( "tag_origin" );
    var_1 thread _id_13699( 5 );
    var_2 = "odin_zoom_up";
    var_3 = var_1 getentitynumber();
    var_4 = self getentitynumber();
    var_5 = bullettrace( self.origin, var_0.origin, 0, self );

    if ( var_5["surfacetype"] != "none" )
    {
        var_2 = "odin_zoom_down";
        var_3 = var_0 getentitynumber();
        var_4 = var_1 getentitynumber();
    }

    var_6 = scripts\engine\utility::_id_2279( scripts\mp\utility\game::_id_7BC3(), self );

    foreach ( var_8 in var_6 )
    {
        var_8 setclientomnvar( "cam_scene_name", var_2 );
        var_8 setclientomnvar( "cam_scene_lead", var_3 );
        var_8 setclientomnvar( "cam_scene_support", var_4 );
        var_8 thread _id_42CF();
    }
}

_id_13699( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    wait( var_0 );
    self delete();
}

_id_42CF()
{
    level endon( "game_ended" );
    var_0 = spawn( "script_model", self.origin + ( 0, 0, 250 ) );
    var_0.angles = vectortoangles( ( 0, 0, 1 ) );
    var_0 setmodel( "tag_origin" );
    var_0 thread _id_13699( 2 );
    wait 0.1;
    playfxontagforclients( level._effect["odin_clouds"], var_0, "tag_origin", self );
}

_id_C30E( var_0 )
{
    scripts\mp\utility\game::_id_FB09( var_0._id_C322 );
    self._id_C2D3 = var_0;
}

_id_C2DA( var_0 )
{
    var_0._id_C2F8 = undefined;
    var_0._id_C301 = undefined;
    var_0._id_C311 = undefined;
    var_0._id_C2D4 = undefined;
    var_0._id_C2FA = undefined;
    var_0._id_C310 = undefined;

    if ( isdefined( self ) )
    {
        scripts\mp\utility\game::_id_41E9();
        self._id_C2D3 = undefined;
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
    self setclientomnvar( "ui_odin", level._id_C321[var_0._id_C322]._id_12B20 );
    _id_13A0D( var_0 );
}

_id_C317( var_0 )
{
    while ( isdefined( self._id_9BE2 ) && var_0 > 0 )
    {
        wait 0.05;
        var_0 -= 0.05;
    }
}

_id_C318()
{
    level endon( "game_ended" );
    self endon( "gone" );
    self waittill( "death" );

    if ( isdefined( self.owner ) )
        self.owner _id_C2E3( self );

    _id_4074();
    _id_C317( 3.0 );
    scripts\mp\utility\game::_id_4FC1();
    level._id_1639[self._id_C322] = undefined;
    self delete();
}

_id_C31F()
{
    level endon( "game_ended" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    var_0 = level._id_C321[self._id_C322];
    var_1 = var_0._id_11901;
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_1 );
    thread _id_C2FC();
}

_id_C31B()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner scripts\engine\utility::waittill_any( "disconnect", "joined_team", "joined_spectators" );
    thread _id_C2FC();
}

_id_C319()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    level waittill( "objective_cam" );
    thread _id_C2FC();
}

_id_C31D()
{
    self endon( "death" );
    self endon( "leaving" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    level scripts\engine\utility::waittill_any( "round_end_finished", "game_ended" );
    thread _id_C2FC();
}

_id_C2FC()
{
    self endon( "death" );
    self notify( "leaving" );
    var_0 = level._id_C321[self._id_C322];
    scripts\mp\utility\game::_id_AAE7( var_0._id_13553 );

    if ( isdefined( self.owner ) )
        self.owner _id_C2E3( self );

    self notify( "gone" );
    _id_4074();
    _id_C317( 3.0 );
    scripts\mp\utility\game::_id_4FC1();
    level._id_1639[self._id_C322] = undefined;
    self delete();
}

_id_C2E3( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        self setclientomnvar( "ui_odin", -1 );
        var_0 notify( "end_remote" );
        self notify( "odin_ride_ended" );
        _id_C2DA( var_0 );

        if ( getdvarint( "camera_thirdPerson" ) )
            scripts\mp\utility\game::_id_F887( 1 );

        self thermalvisionfofoverlayoff();
        self remotecontrolvehicleoff( var_0 );
        self setplayerangles( self._id_E2D7 );
        thread _id_C2EB();
        self stopolcalsound( "odin_negative_action" );
        self stopolcalsound( "odin_positive_action" );

        foreach ( var_2 in level._id_C321[var_0._id_C322].weapon )
        {
            if ( isdefined( var_2._id_D5E4 ) )
                self stopolcalsound( var_2._id_D5E4 );

            if ( isdefined( var_2._id_D5DD ) )
                self stopolcalsound( var_2._id_D5DD );
        }

        if ( isdefined( var_0._id_A4A3 ) )
            var_0._id_A4A3 scripts\mp\bots\bots_strategy::_id_2DC1( self, 350 );
    }
}

_id_C2EB()
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    scripts\mp\utility\game::_id_7385( 1 );
    wait 0.5;
    scripts\mp\utility\game::_id_7385( 0 );
}

_id_C31E()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    var_1 = var_0 getvieworigin();
    var_2 = var_1 + anglestoforward( self gettagangles( "tag_player" ) ) * 10000;
    var_3 = bullettrace( var_1, var_2, 0, self );
    var_4 = spawn( "script_model", var_3["position"] );
    var_4.angles = vectortoangles( ( 0, 0, 1 ) );
    var_4 setmodel( "tag_origin" );
    self._id_1156A = var_4;
    var_4 endon( "death" );
    var_5 = bullettrace( var_4.origin + ( 0, 0, 50 ), var_4.origin + ( 0, 0, -100 ), 0, var_4 );
    var_4.origin = var_5["position"] + ( 0, 0, 50 );
    var_4 hide();
    var_4 _meth_8388( var_0 );
    var_4 childthread _id_B9F2( var_0 );
    thread _id_10129();
    thread _id_1399C();
    thread _id_13AAF();

    switch ( self._id_C322 )
    {
        case "odin_support":
            thread _id_13B49();
            thread _id_13ACA();
            break;
        case "odin_assault":
            thread _id_13AB1();
            thread _id_13B47();
            break;
    }

    self _meth_831F( var_4 );
}

_id_B9F2( var_0 )
{
    wait 1.5;
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
                stopfxontag( level._effect["odin_targeting"], self, "tag_origin" );
                wait 0.05;
                playfxontag( level._effect["odin_targeting"], self, "tag_origin" );
            }
        }

        wait 0.25;
    }
}

_id_1399C()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    var_1 = level._id_C321[self._id_C322].weapon["airdrop"];
    self._id_C2D4 = 0;
    var_0 setclientomnvar( var_1._id_1E44, level._id_C321[self._id_C322]._id_12B20 );

    if ( !isai( var_0 ) )
        var_0 notifyonplayercommand( "airdrop_action", "+smoke" );

    for (;;)
    {
        var_0 waittill( "airdrop_action" );

        if ( isdefined( level._id_90A9 ) )
            continue;

        if ( !isdefined( var_0._id_C2D3 ) )
            return;

        if ( gettime() >= self._id_C2D4 )
        {
            if ( level.teambased )
                scripts\mp\utility\game::_id_AAE7( var_1._id_13521, self.team );
            else
                var_0 scripts\mp\utility\game::leaderdialogonplayer( var_1._id_13521 );

            self._id_C2D4 = _id_C2E6( "airdrop" );
            var_1 = level._id_C321[self._id_C322].weapon["airdrop"];
            level thread scripts\mp\killstreaks\airdrop::_id_5857( var_0, self._id_1156A.origin, randomfloat( 360 ), var_1._id_1AA0 );
        }
        else
            var_0 scripts\mp\utility\game::_id_13A7( "odin_negative_action" );

        wait 1.0;
    }
}

_id_13B49()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    var_1 = level._id_C321[self._id_C322].weapon["smoke"];
    self._id_C311 = 0;
    var_0 setclientomnvar( var_1._id_1E44, level._id_C321[self._id_C322]._id_12B20 );

    if ( !isai( var_0 ) )
    {
        var_0 notifyonplayercommand( "smoke_action", "+speed_throw" );
        var_0 notifyonplayercommand( "smoke_action", "+ads_akimbo_accessible" );

        if ( !level._id_4542 )
            var_0 notifyonplayercommand( "smoke_action", "+toggleads_throw" );
    }

    for (;;)
    {
        var_0 waittill( "smoke_action" );

        if ( isdefined( level._id_90A9 ) )
            continue;

        if ( !isdefined( var_0._id_C2D3 ) )
            return;

        if ( gettime() >= self._id_C311 )
        {
            if ( level.teambased )
                scripts\mp\utility\game::_id_AAE7( var_1._id_13551, self.team );
            else
                var_0 scripts\mp\utility\game::leaderdialogonplayer( var_1._id_13551 );

            self._id_C311 = _id_C2E6( "smoke" );
        }
        else
            var_0 scripts\mp\utility\game::_id_13A7( "odin_negative_action" );

        wait 1.0;
    }
}

_id_13ACA()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    var_1 = level._id_C321[self._id_C322].weapon["marking"];
    self._id_C301 = 0;
    var_0 setclientomnvar( var_1._id_1E44, level._id_C321[self._id_C322]._id_12B20 );

    if ( !isai( var_0 ) )
    {
        var_0 notifyonplayercommand( "marking_action", "+attack" );
        var_0 notifyonplayercommand( "marking_action", "+attack_akimbo_accessible" );
    }

    for (;;)
    {
        var_0 waittill( "marking_action" );

        if ( isdefined( level._id_90A9 ) )
            continue;

        if ( !isdefined( var_0._id_C2D3 ) )
            return;

        if ( gettime() >= self._id_C301 )
        {
            self._id_C301 = _id_C2E6( "marking" );
            thread _id_58EE( self._id_1156A.origin + ( 0, 0, 10 ) );
        }
        else
            var_0 scripts\mp\utility\game::_id_13A7( "odin_negative_action" );

        wait 1.0;
    }
}

_id_13AAF()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    var_0 endon( "juggernaut_dead" );
    var_1 = level._id_C321[self._id_C322].weapon["juggernaut"];
    self._id_C2F8 = 0;
    var_0 setclientomnvar( var_1._id_1E44, level._id_C321[self._id_C322]._id_12B20 );

    if ( !isai( var_0 ) )
        var_0 notifyonplayercommand( "juggernaut_action", "+frag" );

    for (;;)
    {
        var_0 waittill( "juggernaut_action" );

        if ( isdefined( level._id_90A9 ) )
            continue;

        if ( !isdefined( var_0._id_C2D3 ) )
            return;

        if ( gettime() >= self._id_C2F8 )
        {
            var_2 = _id_7F26( self._id_1156A.origin );

            if ( isdefined( var_2 ) )
            {
                self._id_C2F8 = _id_C2E6( "juggernaut" );
                thread _id_1369E( var_2 );
            }
            else
                var_0 scripts\mp\utility\game::_id_13A7( "odin_negative_action" );
        }
        else if ( isdefined( self._id_A4A3 ) )
        {
            var_2 = _id_7F25( self._id_1156A.origin );

            if ( isdefined( var_2 ) )
            {
                var_0 scripts\mp\utility\game::leaderdialogonplayer( var_1._id_1352B );
                var_0 scripts\mp\utility\game::_id_13A7( "odin_positive_action" );
                var_0 playrumbleonentity( "pistol_fire" );
                self._id_A4A3 scripts\mp\bots\bots_strategy::_id_2E57( var_2.origin, 128 );
                var_0 setclientomnvar( var_1._id_1E44, level._id_C321[self._id_C322]._id_12B20 );
            }
            else
                var_0 scripts\mp\utility\game::_id_13A7( "odin_negative_action" );
        }

        wait 1.1;

        if ( isdefined( self._id_A4A3 ) )
            var_0 setclientomnvar( var_1._id_1E44, var_1._id_12B23 );
    }
}

_id_13AB1()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    var_1 = level._id_C321[self._id_C322].weapon["large_rod"];
    self._id_C2FA = 0;
    var_0 setclientomnvar( var_1._id_1E44, level._id_C321[self._id_C322]._id_12B20 );

    if ( !isai( var_0 ) )
    {
        var_0 notifyonplayercommand( "large_rod_action", "+attack" );
        var_0 notifyonplayercommand( "large_rod_action", "+attack_akimbo_accessible" );
    }

    for (;;)
    {
        var_0 waittill( "large_rod_action" );

        if ( isdefined( level._id_90A9 ) )
            continue;

        if ( !isdefined( var_0._id_C2D3 ) )
            return;

        if ( gettime() >= self._id_C2FA )
            self._id_C2FA = _id_C2E6( "large_rod" );
        else
            var_0 scripts\mp\utility\game::_id_13A7( "odin_negative_action" );

        wait 1.0;
    }
}

_id_13B47()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = self.owner;
    var_0 endon( "disconnect" );
    var_1 = level._id_C321[self._id_C322].weapon["small_rod"];
    self._id_C310 = 0;
    var_0 setclientomnvar( var_1._id_1E44, level._id_C321[self._id_C322]._id_12B20 );

    if ( !isai( var_0 ) )
    {
        var_0 notifyonplayercommand( "small_rod_action", "+speed_throw" );
        var_0 notifyonplayercommand( "small_rod_action", "+ads_akimbo_accessible" );

        if ( !level._id_4542 )
            var_0 notifyonplayercommand( "small_rod_action", "+toggleads_throw" );
    }

    for (;;)
    {
        var_0 waittill( "small_rod_action" );

        if ( isdefined( level._id_90A9 ) )
            continue;

        if ( !isdefined( var_0._id_C2D3 ) )
            return;

        if ( gettime() >= self._id_C310 )
            self._id_C310 = _id_C2E6( "small_rod" );
        else
            var_0 scripts\mp\utility\game::_id_13A7( "odin_negative_action" );

        wait 1.0;
    }
}

_id_C2E6( var_0 )
{
    self._id_9BE2 = 1;
    var_1 = self.owner;
    var_2 = level._id_C321[self._id_C322].weapon[var_0];
    var_3 = anglestoforward( var_1 getplayerangles() );
    var_4 = self.origin + var_3 * 100;
    var_1 setclientomnvar( var_2._id_1E44, var_2._id_12B22 );
    thread _id_13B21( var_2 );
    var_5 = self._id_1156A.origin;
    var_6 = gettime() + var_2._id_DF5D * 1000;

    if ( var_0 == "large_rod" )
    {
        wait 0.5;
        var_1 playrumbleonentity( var_2._id_E7BA );
        earthquake( 0.3, 1.5, self.origin, 1000 );
        var_1 playsoundtoplayer( var_2._id_D5DD, var_1 );
        playloopsound( self.origin, var_2._id_C195 );
        wait 1.5;
    }
    else if ( var_0 == "small_rod" )
    {
        wait 0.5;
        var_1 playrumbleonentity( var_2._id_E7BA );
        earthquake( 0.2, 1, self.origin, 1000 );
        var_1 playsoundtoplayer( var_2._id_D5DD, var_1 );
        playloopsound( self.origin, var_2._id_C195 );
        wait 0.3;
    }
    else
    {
        if ( isdefined( var_2._id_D5DD ) )
            var_1 playsoundtoplayer( var_2._id_D5DD, var_1 );

        if ( isdefined( var_2._id_C195 ) )
            playloopsound( self.origin, var_2._id_C195 );

        var_1 playrumbleonentity( var_2._id_E7BA );
    }

    var_7 = scripts\mp\utility\game::_id_1309( var_2._id_DA5A, var_4, var_5, var_1 );
    var_7.type = "odin";
    var_7 thread _id_13A22( var_0 );

    if ( var_0 == "smoke" || var_0 == "juggernaut" || var_0 == "large_rod" )
        level notify( "smoke", var_7, var_2._id_DA5A );

    self._id_9BE2 = undefined;
    return var_6;
}

_id_13A22( var_0 )
{
    self waittill( "explode", var_1 );

    if ( var_0 == "small_rod" )
    {
        playrumbleonentity( "grenade_rumble", var_1 );
        earthquake( 0.7, 1.0, var_1, 1000 );
    }
    else if ( var_0 == "large_rod" )
    {
        playrumbleonentity( "artillery_rumble", var_1 );
        earthquake( 1.0, 1.0, var_1, 2000 );
    }
}

_id_7F26( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_1 = getnodesinradiussorted( var_0, 256, 0, 128, "Path" );

    if ( !isdefined( var_1[0] ) )
        return;

    return var_1[0];
}

_id_7F25( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_1 = getnodesinradiussorted( var_0, 128, 0, 64, "Path" );

    if ( !isdefined( var_1[0] ) )
        return;

    return var_1[0];
}

_id_1369E( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_1 = self.owner;
    var_1 endon( "disconnect" );
    var_2 = self._id_1156A.origin;
    wait 3.0;
    var_3 = scripts\mp\agents\agents::_id_16F2( "odin_juggernaut", var_1.team, "class1", var_0.origin, vectortoangles( var_2 - var_0.origin ), var_1, 0, 0, "veteran" );

    if ( isdefined( var_3 ) )
    {
        var_4 = level._id_C321[self._id_C322].weapon["juggernaut"];
        var_3 thread scripts\mp\killstreaks\juggernaut::_id_8371( var_4._id_A4AF );
        var_3 thread scripts\mp\killstreaks\agent_killstreak::_id_F22B();
        var_3 scripts\mp\bots\bots_strategy::_id_2E57( var_0.origin, 128 );
        self._id_A4A3 = var_3;
        thread _id_13AAE();
        var_1 setclientomnvar( var_4._id_1E44, var_4._id_12B23 );
        var_5 = scripts\mp\utility\game::_id_C794( var_3, "cyan", self.owner, 0, 0, "killstreak" );
        thread _id_E146( var_5, var_3 );
        var_3 scripts\mp\utility\game::_id_13CE( "player_name_bg_green_agent", "player_name_bg_red_agent" );
    }
    else
        var_1 iprintlnbold( &"KILLSTREAKS_AGENT_MAX" );
}

_id_13AAE()
{
    self endon( "death" );
    level endon( "game_ended" );
    self._id_A4A3 waittill( "death" );
    self.owner notify( "juggernaut_dead" );
    var_0 = level._id_C321[self._id_C322].weapon["juggernaut"];
    self.owner setclientomnvar( var_0._id_1E44, var_0._id_12B21 );
    self._id_A4A3 = undefined;
}

_id_10129()
{
    self endon( "death" );
    wait 1.0;
    playfxontag( level._effect["odin_targeting"], self._id_1156A, "tag_origin" );
}

_id_13B21( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_1 = self.owner;
    var_1 endon( "disconnect" );
    var_1 endon( "odin_ride_ended" );
    var_2 = var_0._id_1E44;
    var_3 = var_0._id_DF5D;
    var_4 = var_0._id_D5E4;
    var_5 = level._id_C321[self._id_C322]._id_12B20;
    wait( var_3 );

    if ( !isdefined( var_1._id_C2D3 ) )
        return;

    if ( isdefined( var_4 ) )
        var_1 scripts\mp\utility\game::_id_13A7( var_4 );

    var_1 setclientomnvar( var_2, var_5 );
}

_id_58EE( var_0 )
{
    level endon( "game_ended" );
    var_1 = self.owner;
    var_2 = level._id_C2FF * level._id_C2FF;
    var_3 = level._id_C300 * level._id_C300;
    var_4 = 60;
    var_5 = 40;
    var_6 = 11;
    var_7 = 0;

    foreach ( var_9 in level._id_C928 )
    {
        if ( !scripts\mp\utility\game::isreallyalive( var_9 ) || var_9.sessionstate != "playing" )
            continue;

        if ( level.teambased && var_9.team == self.team )
            continue;

        var_10 = distancesquared( var_0, var_9.origin );

        if ( var_10 > var_2 )
            continue;

        var_11 = var_9 getstance();
        var_12 = var_9.origin;

        switch ( var_11 )
        {
            case "stand":
                var_12 = ( var_12[0], var_12[1], var_12[2] + var_4 );
                break;
            case "crouch":
                var_12 = ( var_12[0], var_12[1], var_12[2] + var_5 );
                break;
            case "prone":
                var_12 = ( var_12[0], var_12[1], var_12[2] + var_6 );
                break;
        }

        if ( !bullettracepassed( var_0, var_12, 0, var_9 ) )
            continue;

        if ( var_10 <= var_3 )
            var_13 = 1.0;
        else
            var_13 = 1.0 - ( var_10 - var_3 ) / ( var_2 - var_3 );

        var_14 = anglestoforward( var_9 getplayerangles() );
        var_15 = var_0 - var_12;
        var_15 = vectornormalize( var_15 );
        var_16 = 0.5 * ( 1.0 + vectordot( var_14, var_15 ) );
        var_17 = 1;
        var_9 notify( "flashbang", var_0, var_13, var_16, var_1, var_17 );
        var_7++;

        if ( !_id_6565( var_9 ) )
        {
            if ( level.teambased )
                var_18 = scripts\mp\utility\game::_id_C795( var_9, "orange", self.team, 0, 0, "killstreak" );
            else
                var_18 = scripts\mp\utility\game::_id_C794( var_9, "orange", self.owner, 0, 0, "killstreak" );

            thread _id_E146( var_18, var_9, 3.0 );
        }
    }

    var_20 = level._id_C321[self._id_C322].weapon["marking"];

    if ( var_7 == 1 )
    {
        if ( level.teambased )
            scripts\mp\utility\game::_id_AAE7( var_20._id_1354B, self.team );
        else
            var_1 scripts\mp\utility\game::leaderdialogonplayer( var_20._id_1354B );
    }
    else if ( var_7 > 1 )
    {
        if ( level.teambased )
            scripts\mp\utility\game::_id_AAE7( var_20._id_1354A, self.team );
        else
            var_1 scripts\mp\utility\game::leaderdialogonplayer( var_20._id_1354A );
    }

    var_21 = scripts\mp\weapons::_id_7E8C( var_0, 512, 0 );

    foreach ( var_23 in var_21 )
    {
        if ( isdefined( var_23.owner ) && !scripts\mp\weapons::_id_7415( self.owner, var_23.owner ) )
            continue;

        var_23 notify( "emp_damage", self.owner, 8.0 );
    }
}

_id_20D2( var_0 )
{
    if ( level.teambased && var_0.team == self.team )
        return;
    else if ( !level.teambased && var_0 == self.owner )
        return;

    if ( _id_6565( var_0 ) )
        return;

    var_1 = scripts\mp\utility\game::_id_C794( var_0, "orange", self.owner, 1, 0, "killstreak" );
    thread _id_E146( var_1, var_0 );
}

_id_6565( var_0 )
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

    if ( isdefined( var_1 ) )
        scripts\mp\utility\game::_id_C78F( var_0, var_1 );
}

_id_C31A()
{
    self endon( "death" );
    level endon( "game_ended" );

    foreach ( var_1 in level._id_C928 )
        _id_20D2( var_1 );
}

_id_C31C()
{
    self endon( "death" );
    level endon( "game_ended" );
    self._id_63AB = 0;

    for (;;)
    {
        level waittill( "odin_killed_player", var_0 );
        self._id_63AB++;
        self notify( "odin_enemy_killed" );
    }
}

_id_C2DD( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_1 = level._id_C321[self._id_C322];
    var_2 = 1.0;

    for (;;)
    {
        self waittill( "odin_enemy_killed" );
        wait( var_2 );

        if ( self._id_63AB > 1 )
            self.owner scripts\mp\utility\game::leaderdialogonplayer( var_1._id_1352C );
        else
            self.owner scripts\mp\utility\game::leaderdialogonplayer( var_1._id_1352D );

        self._id_63AB = 0;
    }
}

_id_C303()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_C304( self );
    }
}

_id_C304( var_0 )
{
    self endon( "disconnect" );
    self waittill( "spawned_player" );
    var_0 _id_20D2( self );
}

_id_4074()
{
    if ( isdefined( self._id_1156A ) )
        self._id_1156A delete();

    if ( isdefined( self._id_C305 ) )
        self._id_C305 delete();
}

_id_13A0D( var_0 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 thread scripts\mp\killstreaks\killstreaks::_id_1CA5();
    var_0 waittill( "killstreakExit" );
    var_1 = level._id_C321[var_0._id_C322];
    scripts\mp\utility\game::_id_AAE7( var_1._id_13553 );
    var_0 notify( "death" );
}

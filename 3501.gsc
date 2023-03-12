// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "minijackal", ::_id_12889, undefined, undefined, undefined, ::_id_13C16, undefined, ::invalid_use_minijackal );
    level._effect["miniJackal_eyeglow"] = loadfx( "vfx/iw7/_requests/mp/vfx_venom_glint" );
    level._effect["miniJackal_explosion"] = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_apex_dest_exp.vfx" );
    level._effect["miniJackal_hover_thrusters"] = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_apex_thrusters.vfx" );
    level._effect["miniJackal_antenna_enemy"] = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_apex_light_ping_en.vfx" );
    level._effect["miniJackal_antenna_friendly"] = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_apex_light_ping_fr.vfx" );
    level._effect["miniJackal_boost_thrusters"] = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_apex_thrusters_boost.vfx" );
    level._effect["miniJackal_hover_thrusters_light"] = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_apex_thrusters_light.vfx" );
    level._effect["miniJackal_boost_thrusters_light"] = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_apex_thrusters_boost_light.vfx" );
    level._id_B7AD = [];
    var_0 = [ "passive_increased_armor", "passive_decreased_duration", "passive_auto_missiles", "passive_long_reload", "passive_twin_dragons", "passive_armor_duration" ];
    _id_0AC7::_id_DF07( "minijackal", var_0 );
    level.minijackalsincoming = [];
}

_id_13C16( var_0 )
{
    var_1 = 0;
    var_2 = 0;

    foreach ( var_4 in level.minijackalsincoming )
    {
        if ( level.teambased )
        {
            if ( self.team == var_4.team )
                var_1++;

            continue;
        }

        var_2++;
    }

    if ( var_1 >= 1 )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_MINIJACKAL_MAX" );
        return 0;
    }

    if ( var_2 >= 2 )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_MINIJACKAL_MAX" );
        return 0;
    }

    if ( isdefined( level._id_B7AD ) )
    {
        var_6 = 0;
        var_7 = 0;

        foreach ( var_9 in level._id_B7AD )
        {
            if ( level.teambased )
            {
                if ( self.team == var_9.owner.team )
                    var_6++;

                continue;
            }

            var_7++;
        }

        if ( var_6 + var_1 >= 1 )
        {
            scripts\mp\hud_message::_id_10122( "KILLSTREAKS_MINIJACKAL_MAX" );
            return 0;
        }

        if ( var_7 + var_2 >= 2 )
        {
            scripts\mp\hud_message::_id_10122( "KILLSTREAKS_MINIJACKAL_MAX" );
            return 0;
        }
    }

    self setclientomnvar( "ui_remote_control_sequence", 1 );
    incrementminijackalsincoming( self );
}

invalid_use_minijackal( var_0 )
{
    decrementminijackalsincoming( self );
}

incrementminijackalsincoming( var_0 )
{
    var_1 = "ent_" + var_0 getentitynumber();
    level.minijackalsincoming[var_1] = var_0;
    var_0 thread watchforinterrupt( var_1 );
}

watchforinterrupt( var_0 )
{
    self endon( "received_playremote_result" );
    level endon( "game_ended" );
    scripts\engine\utility::waittill_any( "death", "disconnect" );
    decrementminijackalsincoming( var_0 );
}

decrementminijackalsincoming( var_0 )
{
    var_1 = undefined;

    if ( isplayer( var_0 ) )
        var_1 = "ent_" + var_0 getentitynumber();
    else
        var_1 = var_0;

    level.minijackalsincoming[var_1] = undefined;
}

_id_12889( var_0 )
{
    var_1 = scripts\mp\killstreaks\killstreaks::_id_D507( var_0 );
    self notify( "received_playremote_result" );

    if ( !var_1 )
    {
        decrementminijackalsincoming( self );
        return 0;
    }

    var_2 = _id_6C9B( 80, 35, 20 );

    if ( !isdefined( var_2 ) )
    {
        decrementminijackalsincoming( self );
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_NOT_ENOUGH_SPACE" );
        thread scripts\mp\killstreaks\killstreaks::_id_11086();
        return 0;
    }

    scripts\engine\utility::_id_1C6E( 0 );
    scripts\engine\utility::_id_1C76( 0 );
    var_3 = "veh_mil_air_ca_oblivion_drone_mp";
    var_4 = "veh_minijackal_mp";
    var_5 = "used_minijackal";
    var_6 = 60;
    var_7 = "minijackal_strike_mp";
    var_8 = 1;
    var_9 = _id_0AC7::getrarityforlootitem( var_0._id_1318B );

    if ( var_9 != "" )
    {
        var_3 = var_3 + "_" + var_9;
        var_5 = var_5 + "_" + var_9;
    }

    if ( _id_0DC9::_id_A69F( var_0, "passive_armor_duration" ) )
        var_6 -= 5;

    if ( _id_0DC9::_id_A69F( var_0, "passive_twin_dragons" ) )
    {
        var_7 = "minijackal_assault_mp";
        var_4 = "veh_minijackal_beam_mp";
        var_8 = 2;
    }

    var_10 = spawnvehicle( var_3, "minijackal", var_4, var_2, self.angles, self );
    level._id_B7AD[level._id_B7AD.size] = var_10;
    decrementminijackalsincoming( self );
    var_10 _meth_8317( 1 );
    var_10 _meth_80C7();
    var_10._id_13CC3 = [];
    var_10._id_13CC3["hover"] = "minijackal_assault_mp";
    var_10._id_13CC3["fly"] = var_7;
    var_10._id_13CC3["land"] = var_10._id_13CC3["hover"];
    var_10 _meth_84BE( "minijackal_mp" );
    var_10 _meth_849E( var_10._id_13CC3["fly"] );
    _id_0BCE::_id_A2B2( var_10, undefined, "hover" );
    self _meth_8490( "disable_mode_switching", 1 );
    self _meth_8490( "disable_juke", 1 );
    self _meth_8490( "disable_guns", 0 );
    self _meth_8490( "disable_boost", 0 );
    self._id_E2D7 = self getplayerangles();
    self._id_0184 = 0;
    self _meth_85A2( "apex_mp" );
    var_10._id_10E4C = _id_495B();
    var_10._id_EDD7 = 2250;
    var_10._id_B43C = 2250;
    var_10._id_11A34 = 0;
    var_10._id_110EA = var_0._id_110EA;
    var_10.owner = self;
    var_10.team = self.team;
    var_10._id_B8B0 = 4;
    var_10._id_110E8 = var_0;
    self._id_B7AA = var_10;
    var_10 _id_0DC9::_id_1843( var_0._id_110EA, "Killstreak_Ground", var_10.owner, 1 );
    var_10 _id_0DC9::_id_FAE4( "minijackal_end", "apex_mp" );
    var_10 thread _id_B9A4( self );
    var_10 thread _id_B9A5( self );
    var_10 thread _id_B97F( self );
    var_10 thread _id_B95F( self );
    var_10 thread _id_B961( self );
    var_10 thread _id_B95E( self );
    var_10 thread _id_B9A9( var_6 );
    var_10 thread _id_B968( self );
    var_10 thread _id_B963( self );
    var_10 thread _id_B969( self );
    var_10 thread _id_5119( self );
    var_10 setscriptablepartstate( "thrusters", "hover", 0 );
    var_10 setscriptablepartstate( "team_light", "idle", 0 );
    var_10 setscriptablepartstate( "dust", "active", 0 );
    var_10 setscriptablepartstate( "hud", "active", 0 );
    scripts\mp\matchdata::_id_AFC9( var_0._id_110EA, var_10.origin );
    level thread scripts\mp\utility\game::_id_115DE( var_5, self );
    self setclientomnvar( "ui_minijackal_controls", var_8 );
    self setclientomnvar( "ui_killstreak_countdown", gettime() + int( var_6 * 1000 ) );
    self setclientomnvar( "ui_killstreak_health", var_10._id_EDD7 / var_10._id_B43C );
    self _meth_83BE();
    self._id_209D = gettime();
    return 1;
}

_id_B9A4( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "minijackal_end" );

    for (;;)
    {
        var_0 waittill( "engage boost" );
        self setscriptablepartstate( "thrusters", "boost", 0 );
    }
}

_id_B9A5( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "minijackal_end" );

    for (;;)
    {
        var_0 waittill( "disengage boost" );
        self _meth_8491( "hover" );
        self setscriptablepartstate( "thrusters", "hover", 0 );
    }
}

_id_B9AF( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "minijackal_end" );
    var_0 notifyonplayercommand( "ks_switch_weapons", "+weapnext" );
    var_1 = self._id_13CC3["hover"];

    for (;;)
    {
        var_0 waittill( "ks_switch_weapons" );
        self _meth_849E( var_1 );

        if ( var_1 == self._id_13CC3["fly"] )
        {
            var_1 = self._id_13CC3["hover"];
            continue;
        }

        var_1 = self._id_13CC3["fly"];
    }
}

_id_B978( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "minijackal_end" );

    for (;;)
    {
        var_1 = float( float( self._id_11A34 ) / float( self._id_B43C ) );
        var_1 = clamp( var_1, 0, 1 );
        self._id_10E4C.alpha = var_1;
        scripts\engine\utility::waitframe();
    }
}

_id_B97A( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "minijackal_end" );
    var_0 notifyonplayercommand( "ks_lockon", "+speed_throw" );
    var_0 notifyonplayercommand( "ks_lockoff", "-speed_throw" );

    for (;;)
    {
        var_0 waittill( "ks_lockon" );
        self _meth_849E( self._id_13CC3["hover"] );
        var_0 waittill( "ks_lockoff" );
        self _meth_849E( self._id_13CC3["fly"] );
    }
}

_id_B97F( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "minijackal_end" );
    var_0 notifyonplayercommand( "minijackal_missile_fire", "+frag" );
    var_1 = [ "tag_missile1", "tag_missile2", "tag_missile3", "tag_missile4" ];
    var_2 = "ui_minijackal_reload";

    if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_auto_missiles" ) )
        var_2 = "ui_minijackal_reload_long";

    for (;;)
    {
        var_0 waittill( "minijackal_missile_fire" );

        if ( scripts\mp\utility\game::istrue( self._id_DF58 ) )
            continue;

        var_3 = self._id_B8B0;
        var_0 setclientomnvar( var_2, 1 );

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            var_5 = self gettagorigin( var_1[var_4] );
            var_6 = self gettagorigin( "tag_camera" ) + anglestoforward( self.angles ) * 1000;
            var_7 = scripts\mp\utility\game::_id_1309( "shockproj_mp", var_5, var_6, var_0 );
            var_7._id_110E8 = self._id_110E8;
            var_7 _meth_82DD( self );

            if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_auto_missiles" ) )
                var_7 trackmissiletargetinview( var_5, self );

            self setscriptablepartstate( "missile_pod_" + ( var_4 + 1 ), "fire", 0 );
            var_7 thread _id_13A22();
            var_7 thread _id_0DC9::watchsupertrophynotify( var_0 );
            self._id_B8B0--;
            scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.2 );
        }

        thread _id_B894( var_0 );
    }
}

trackmissiletargetinview( var_0, var_1 )
{
    var_2 = _id_0DC9::_id_7E92( var_1.owner );
    var_3 = undefined;
    var_4 = 999999999;
    var_5 = var_0;
    var_6 = anglestoforward( var_1.angles );
    var_7 = [ self, var_1, var_1.owner ];
    var_8 = physics_createcontents( [ "physicscontents_solid", "physicscontents_glass", "physicscontents_water", "physicscontents_vehicle", "physicscontents_item" ] );

    foreach ( var_10 in var_2 )
    {
        if ( !_id_0DC9::manualmissilecantracktarget( var_10 ) )
            continue;

        if ( scripts\mp\utility\game::istrue( var_10.apextargetted ) )
            continue;

        var_11 = var_10.origin;
        var_12 = vectornormalize( var_11 - var_5 );
        var_7[var_7.size] = var_10;
        var_13 = distance2d( var_5, var_11 );

        if ( scripts\engine\trace::_id_DCF1( var_5, var_11, var_7, var_8 ) && vectordot( var_6, var_12 ) > 0.75 && var_13 <= var_4 )
        {
            var_4 = var_13;
            var_3 = var_10;
        }
    }

    if ( isdefined( var_3 ) )
    {
        self _meth_8206( var_3, ( 0, 0, 40 ) );
        self _meth_8204();
        var_3.apextargetted = 1;
        var_3 thread watchtarget( self );
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

    self.apextargetted = undefined;

    if ( isdefined( var_0 ) )
        var_0 _meth_8203();
}

_id_13A22()
{
    self waittill( "explode", var_0 );
    playloopsound( var_0, "wrist_rocket_explode" );
}

_id_B894( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "minijackal_end" );
    self._id_DF58 = 1;
    var_1 = 0.8;
    var_2 = "ui_minijackal_reload";

    if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_auto_missiles" ) )
    {
        var_1 = 1.05;
        var_2 = "ui_minijackal_reload_long";
    }

    while ( self._id_B8B0 < 4 )
    {
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_1 );
        self._id_B8B0++;
        self setscriptablepartstate( "missile_pod_" + self._id_B8B0, "neutral", 0 );
    }

    var_0 setclientomnvar( var_2, 0 );
    self._id_DF58 = undefined;
}

_id_B95F( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "minijackal_end" );
    var_1 = 3;
    var_2 = 4;
    var_3 = 5;

    if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_armor_duration" ) )
    {
        var_1++;
        var_2++;
        var_3++;
    }

    for (;;)
    {
        self waittill( "damage", var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16, var_17 );
        var_13 = scripts\mp\utility\game::_id_13CA1( var_13, var_17 );

        if ( isdefined( var_5 ) && var_5.classname != "trigger_hurt" )
        {
            if ( isdefined( var_5.owner ) )
                var_5 = var_5.owner;

            if ( isdefined( var_5.team ) && var_5.team == self.team && var_5 != self.owner )
                continue;
        }

        if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_5 ) )
            continue;

        if ( isdefined( var_13 ) )
        {
            var_4 = _id_0DC9::_id_7FBD( var_5, var_13, var_8, var_4, self._id_B43C, var_1, var_2, var_3, 1 );

            if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_armor_duration" ) )
            {
                if ( _id_0DC9::isexplosiveantikillstreakweapon( var_13 ) )
                    var_5 scripts\mp\damagefeedback::updatedamagefeedback( "hitblastshield" );
            }
        }

        self._id_EDD7 -= var_4;
        self._id_11A34 += var_4;

        if ( self._id_EDD7 < 0 )
            self._id_EDD7 = 0;

        var_0 setclientomnvar( "ui_killstreak_health", self._id_EDD7 / self._id_B43C );

        if ( isdefined( var_8 ) )
            var_0 _id_4CF1( self, var_8 );

        if ( isplayer( var_5 ) )
        {
            var_5 scripts\mp\damagefeedback::updatedamagefeedback( "" );
            scripts\mp\killstreaks\killstreaks::_id_A6A0( var_5, var_13, self, var_8 );
            scripts\mp\damage::_id_AF96( self, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );

            if ( self._id_EDD7 <= 0 )
            {
                var_5 notify( "destroyed_killstreak", var_13 );
                var_18 = "callout_destroyed_" + self._id_110EA;
                var_19 = _id_0AC7::getrarityforlootitem( self._id_110E8._id_1318B );

                if ( var_19 != "" )
                    var_18 = var_18 + "_" + var_19;

                scripts\mp\damage::onkillstreakkilled( "minijackal", var_5, var_13, var_8, var_4, "destroyed_" + self._id_110EA, self._id_110EA + "_destroy", var_18, 1 );
            }
        }

        if ( self._id_EDD7 <= 0 )
            self notify( "minijackal_end" );
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
    self _meth_844F( 0.2, 0.25, var_0.origin, 50 );
    self playrumbleonentity( "damage_light" );
    thread _id_1349D( var_0, 0.4 );
}

_id_69E6( var_0 )
{
    self _meth_844F( 0.5, 0.45, var_0.origin, 1000 );
    self playrumbleonentity( "damage_heavy" );
    thread _id_1349D( var_0, 0.7 );
}

_id_1349D( var_0, var_1 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "minijackal_end" );

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

_id_B961( var_0 )
{
    level endon( "game_ended" );
    self waittill( "minijackal_end" );
    self stoploopsound();
    var_1 = self.origin + anglestoforward( self.angles ) * 100;
    playloopsound( self.origin, "frag_grenade_explode" );
    playfx( scripts\engine\utility::_id_7ECB( "miniJackal_explosion" ), self.origin );

    if ( isdefined( var_0 ) )
    {
        if ( scripts\mp\utility\game::isreallyalive( var_0 ) )
            var_0 _meth_844F( 0.6, 1, self.origin, 500 );

        var_0 _id_0BCE::_id_A2B1( self );
        var_0 setclientomnvar( "ui_minijackal_controls", 0 );
        var_0 setclientomnvar( "ui_killstreak_missile_warn", 0 );
        var_0 setclientomnvar( "ui_killstreak_countdown", 0 );
        var_0 setclientomnvar( "ui_killstreak_health", 0 );
        var_0 setclientomnvar( "ui_minijackal_reload", 0 );
        var_0 setclientomnvar( "ui_minijackal_reload_long", 0 );
        var_0 setplayerangles( var_0._id_E2D7 );
        var_0 _meth_85A2( "" );
        var_0 thermalvisionfofoverlayoff();
        var_0 thread scripts\mp\killstreaks\killstreaks::_id_11086();
        var_0 scripts\engine\utility::_id_1C6E( 1 );
        var_0 scripts\engine\utility::_id_1C76( 1 );
        var_2 = ( gettime() - var_0._id_209D ) / 1000;
        var_0 scripts\mp\missions::_id_D991( "ch_apex_pilot", int( var_2 ) );
    }

    if ( isdefined( self._id_115D6 ) )
        self._id_115D6 delete();

    if ( isdefined( self._id_C7FF ) )
        self._id_C7FF delete();

    if ( isdefined( self._id_10E4C ) )
        self._id_10E4C destroy();

    scripts\mp\utility\game::_id_D915( "killstreak ended - minijackal", var_0 );
    self delete();
    level._id_B7AD = scripts\engine\utility::_id_22BC( level._id_B7AD );
}

_id_B95E( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "minijackal_end" );

    for (;;)
    {
        self waittill( "spaceship_collision", var_1, var_2, var_3, var_4 );
        var_5 = var_0 _meth_814C();
        var_6 = ( var_5[0] + 1 ) / 2;
        var_7 = 16 + 19 * var_6;
        var_8 = ( var_2 - 4 ) / ( var_7 - 4 );

        if ( var_8 > 1.0 )
            var_8 = 1.0;
        else if ( var_8 < 0.0 )
            var_8 = 0.0;

        var_9 = var_8 * var_1;

        if ( var_9 > 0 )
        {
            var_0 _meth_844F( var_9, 0.5, self.origin, 100 );
            var_10 = 10 + 240 * var_9;

            if ( self._id_EDD7 - var_10 < 150 )
                var_10 = self._id_EDD7 - 150;
        }
    }
}

_id_B9A9( var_0 )
{
    self.owner endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "host_migration_lifetime_update" );
    self endon( "minijackal_end" );
    thread _id_0DC9::watchhostmigrationlifetime( "minijackal_end", var_0, ::_id_B9A9 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    self.owner scripts\mp\utility\game::_id_D4B6( "minijackal_timeout", undefined, undefined, self.owner.origin );
    self notify( "minijackal_end" );
}

_id_B968( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "minijackal_end" );
    thread scripts\mp\killstreaks\killstreaks::_id_1CA5( "minijackal_end" );
    self waittill( "killstreakExit" );
    self notify( "minijackal_end" );
}

_id_B963( var_0 )
{
    level endon( "game_ended" );
    self endon( "minijackal_end" );
    var_0 scripts\engine\utility::waittill_any( "joined_team", "disconnect", "joined_spectators" );
    self notify( "minijackal_end" );
}

_id_B969( var_0 )
{
    level endon( "game_ended" );
    self endon( "minijackal_end" );

    for (;;)
    {
        self waittill( "emp_damage", var_1, var_2, var_3, var_4, var_5 );
        _id_0DC9::dodamagetokillstreak( 100, var_1, var_1, self.team, var_3, var_5, var_4 );

        if ( !scripts\mp\utility\game::istrue( self._id_55BA ) )
            thread disable_minijackal( var_2 );
    }
}

disable_minijackal( var_0 )
{
    level endon( "game_ended" );
    self endon( "minijackal_end" );
    self._id_55BA = 1;
    self setscriptablepartstate( "team_light", "neutral", 0 );
    playfxontag( scripts\engine\utility::_id_7ECB( "emp_stun" ), self, "tag_origin" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    self setscriptablepartstate( "team_light", "idle", 0 );
    stopfxontag( scripts\engine\utility::_id_7ECB( "emp_stun" ), self, "tag_origin" );
    self._id_55BA = undefined;
}

_id_C77B( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "minijackal_end" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1.0 );
    var_1 = scripts\mp\utility\game::_id_C794( var_0, "cyan", var_0, 0, 0, "killstreak" );
    thread _id_E066( var_1, var_0 );
}

_id_E066( var_0, var_1, var_2 )
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

_id_B7AC( var_0 )
{
    scripts\mp\utility\game::_id_FB09( var_0 );
}

_id_B7AB()
{
    if ( isdefined( self ) )
        scripts\mp\utility\game::_id_41E9();
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

_id_5119( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "minijackal_end" );
    self._id_C7FF = spawnfxforclient( level._effect["thor_fisheye"], var_0 geteye(), var_0 );
    triggerfx( self._id_C7FF );
    self._id_C7FF _meth_82EC();
    thread killfxongameend( self._id_C7FF );
}

killfxongameend( var_0 )
{
    self endon( "minijackal_end" );
    level waittill( "game_ended" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

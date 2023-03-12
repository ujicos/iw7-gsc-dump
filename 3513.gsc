// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._effect["rc8_malfunction"] = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_rc8_glitch_out.vfx" );
    level._effect["rc8_explode"] = loadfx( "vfx/iw7/core/mp/killstreaks/vfx_rc8_dest_exp.vfx" );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "remote_c8", ::_id_128F7 );
    var_0 = [ "passive_increased_speed", "passive_decreased_duration", "passive_energy_machgun", "passive_boosters", "passive_speed_duration" ];
    _id_0AC7::_id_DF07( "remote_c8", var_0 );
}

setup_callbacks()
{
    level.agent_funcs["remote_c8"] = level.agent_funcs["player"];
    level.agent_funcs["remote_c8"]["think"] = ::_id_DCF4;
    level.agent_funcs["remote_c8"]["on_killed"] = ::_id_DCF3;
    level.agent_funcs["remote_c8"]["on_damaged"] = ::_id_DCF2;
    level.agent_funcs["remote_c8"]["gametype_update"] = ::_id_BFF0;
}

_id_DCF4()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "owner_disconnect" );
    level endon( "game_ended" );
    self _meth_845A( "rc8_mp" );
    self botsetflag( "disable_wall_traversals", 1 );
    self botsetflag( "ads_shield", 1 );
    self botsetstance( "stand" );
    self setmovespeedscale( 0.8 );
    thread _id_DCF9();
    thread _id_DCF7();
    thread _id_DCFA();
    thread _id_DCFB();
    thread rc8_watchvoice();
    thread rc8_watchhostmigration();
    thread rc8_watchupdateuav();
    thread rc8_manageboostfx();
    thread rc8_watchupdatecranked();
}

_id_DCF5( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isrc8falldamage( var_4 ) )
        return;

    self notify( "rc8_damage", var_1, var_0 );
}

_id_DCFB()
{
    self endon( "death" );
    self endon( "disconnect" );
    self.owner endon( "destroyed_rc8" );
    level endon( "game_ended" );
    var_0 = scripts\engine\trace::_id_48BC( 0, 1, 1, 1, 1, 1, 1 );
    self waittill( "rc8_launched" );
    var_1 = 1;
    var_2 = undefined;

    for (;;)
    {
        if ( !self isonground() )
        {
            if ( scripts\mp\utility\game::istrue( self.booston ) )
            {
                while ( scripts\mp\utility\game::istrue( self.booston ) )
                    scripts\engine\utility::waitframe();
            }

            var_3 = self.origin[2];

            if ( scripts\mp\utility\game::istrue( var_1 ) )
            {
                var_1 = undefined;
                var_2 = "heavy_damage";
                thread startmidairdamage( var_2 );
            }

            while ( !self isonground() )
            {
                if ( scripts\mp\utility\game::istrue( self.booston ) )
                {
                    while ( scripts\mp\utility\game::istrue( self.booston ) )
                        scripts\engine\utility::waitframe();

                    var_3 = self.origin[2];
                    continue;
                }

                scripts\engine\utility::waitframe();
            }

            self notify( "on_ground" );
            var_4 = self.origin[2];

            if ( var_3 - var_4 < 60 )
                continue;

            if ( isdefined( self.midairdamage ) )
            {
                self._id_FC99 = 1;
                self.midairdamage setscriptablepartstate( "fall", "damage", 0 );
                thread _id_511F( 0.05 );
                wait 0.2;
                self.midairdamage setscriptablepartstate( "fall", "neutral", 0 );
            }
        }

        scripts\engine\utility::waitframe();
    }
}

startmidairdamage( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "on_ground" );
    self.owner endon( "destroyed_rc8" );
    level endon( "game_ended" );

    for (;;)
    {
        self.midairdamage setscriptablepartstate( "air_damage", var_0, 0 );
        scripts\engine\utility::waitframe();
        self.midairdamage setscriptablepartstate( "air_damage", "neutral", 0 );
    }
}

rc8_watchvoice()
{
    self endon( "death" );
    self endon( "disconnect" );
    self.owner endon( "destroyed_rc8" );
    level endon( "game_ended" );
    var_0 = undefined;
    var_1 = undefined;

    for (;;)
    {
        self waittill( "try_play_voice", var_2, var_3 );

        if ( isdefined( var_0 ) && var_0 == var_3 )
            continue;

        if ( isdefined( var_1 ) && gettime() < var_1 + var_2 + 5000 )
            continue;

        var_0 = var_3;
        var_1 = gettime();
        wait( var_2 );

        if ( isdefined( self.owner._id_4BE1 ) && self.owner._id_4BE1 == "MANUAL" )
        {
            self playsoundtoteam( var_3, "allies", self.owner );
            self playsoundtoteam( var_3, "axis", self.owner );
            continue;
        }

        self playsoundtoteam( var_3, "allies" );
        self playsoundtoteam( var_3, "axis" );
    }
}

rc8_watchhostmigration()
{
    self endon( "death" );
    self endon( "disconnect" );
    self.owner endon( "destroyed_rc8" );
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "host_migration_begin" );
        rc8_disable_movement( 1 );
        rc8_disable_attack( 1 );
        rc8_disable_rotation( 1 );
        level waittill( "host_migration_end" );
        rc8_disable_movement( 0 );
        rc8_disable_attack( 0 );
        rc8_disable_rotation( 0 );
    }
}

rc8_watchupdateuav()
{
    self endon( "death" );
    self endon( "disconnect" );
    self.owner endon( "destroyed_rc8" );
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "uav_update" );
        rc8_setuavstrength();
    }
}

rc8_setuavstrength()
{
    if ( level.teambased )
        rc8_updateteamuavstatus( self.team );
    else
        rc8_updateplayersuavstatus();
}

rc8_updateteamuavstatus( var_0, var_1 )
{
    var_2 = getuavstrengthmin();
    var_3 = getuavstrengthmax();
    var_4 = getuavstrengthlevelshowenemydirectional();
    var_5 = getuavstrengthlevelneutral();
    var_6 = getuavstrengthlevelshowenemyfastsweep();

    if ( isdefined( var_1 ) )
        var_7 = var_1;
    else
        var_7 = scripts\mp\killstreaks\uav::_id_12B5( var_0 );

    if ( var_0 == "axis" )
        var_8 = level.axisactiveuavs;
    else
        var_8 = level.alliesactiveuavs;

    if ( scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) && var_7 <= var_5 )
        var_7 = int( clamp( var_8 + var_5, var_5, var_3 ) );

    if ( var_7 <= var_2 )
        var_7 = var_2;
    else if ( var_7 >= var_3 )
        var_7 = var_3;

    self _meth_85A6( var_7 );

    if ( var_7 >= var_5 )
        self _meth_85A5( 0 );
    else
        self _meth_85A5( 1 );

    if ( var_7 <= var_5 )
    {
        self _meth_85A4( 0 );
        self._id_0255 = 0;

        if ( isdefined( self._id_0254 ) && self._id_0254 == "constant_radar" )
            self._id_0254 = "normal_radar";

        self setclientomnvar( "ui_show_hardcore_minimap", 0 );
        return;
    }

    scripts\mp\killstreaks\uav::setradarmode( var_7, var_6, var_4 );
    self._id_0255 = var_7 >= var_4;
    self _meth_85A4( 1 );
    self setclientomnvar( "ui_show_hardcore_minimap", 1 );
}

rc8_updateplayersuavstatus( var_0 )
{
    var_1 = getuavstrengthmin();
    var_2 = getuavstrengthmax();
    var_3 = getuavstrengthlevelshowenemydirectional();
    var_4 = getuavstrengthlevelshowenemyfastsweep();
    var_5 = level._id_1679[self.owner.guid + "_radarStrength"];

    foreach ( var_7 in level.players )
    {
        if ( var_7 == self.owner )
            continue;

        var_8 = level._id_164F[var_7.guid];

        if ( var_8 > 0 && !self.owner scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) )
        {
            var_5 = var_1;
            break;
        }
    }

    if ( var_5 <= var_1 )
        var_5 = var_1;
    else if ( var_5 >= var_2 )
        var_5 = var_2;

    self _meth_85A6( var_5 );

    if ( var_5 >= getuavstrengthlevelneutral() )
        self _meth_85A5( 0 );
    else
        self _meth_85A5( 1 );

    if ( var_5 <= getuavstrengthlevelneutral() )
    {
        self _meth_85A4( 0 );
        self._id_0255 = 0;

        if ( isdefined( self._id_0254 ) && self._id_0254 == "constant_radar" )
            self._id_0254 = "normal_radar";

        self setclientomnvar( "ui_show_hardcore_minimap", 0 );
        return;
    }

    scripts\mp\killstreaks\uav::setradarmode( var_5, var_4, var_3 );
    self._id_0255 = var_5 >= var_3;
    self _meth_85A4( 1 );
    self setclientomnvar( "ui_show_hardcore_minimap", 1 );
}

rc8_watchupdatecranked()
{
    self endon( "death" );
    self endon( "disconnect" );
    self.owner endon( "destroyed_rc8" );
    level endon( "game_ended" );

    if ( isdefined( self.owner.cranked ) && isdefined( self.owner.cranked_end_time ) )
        self setclientomnvar( "ui_cranked_bomb_timer_end_milliseconds", self.owner.cranked_end_time );

    for (;;)
    {
        self.owner scripts\engine\utility::waittill_any( "watchBombTimer", "stop_cranked" );

        if ( !isdefined( self.owner.cranked_end_time ) )
        {
            self setclientomnvar( "ui_cranked_bomb_timer_end_milliseconds", 0 );
            continue;
        }

        self setclientomnvar( "ui_cranked_bomb_timer_end_milliseconds", self.owner.cranked_end_time );
    }
}

_id_DCFA()
{
    self endon( "death" );
    self endon( "disconnect" );
    self.owner endon( "destroyed_rc8" );
    level endon( "game_ended" );
    var_0 = self.health;
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;
    self._id_7197 = ::_id_DCF5;

    for (;;)
    {
        self waittill( "rc8_damage", var_3, var_4 );
        var_5 = gettime();

        if ( var_5 - var_1 > 1000 )
            var_2 = 0;

        var_1 = gettime();
        var_2 += var_3;
        var_6 = var_4.origin - self.origin;
        var_6 = ( var_6[0], var_6[1], 0 );
        var_6 = vectornormalize( var_6 );
        var_7 = anglestoforward( self.angles );
        var_8 = vectordot( var_6, var_7 );

        if ( var_8 < 0 )
            continue;

        if ( var_2 > 50 )
        {
            self botpressbutton( "ads", randomfloatrange( 2, 4 ) );
            var_2 = 0;
        }
    }
}

_id_DCF7()
{
    self endon( "death" );
    self endon( "disconnect" );
    self.owner endon( "destroyed_rc8" );
    level endon( "game_ended" );

    while ( !isdefined( self.mainweapon ) )
        wait 0.25;

    var_0 = self getweaponammoclip( self.mainweapon );

    for (;;)
    {
        self waittill( "weapon_fired", var_1 );

        if ( isdefined( self._id_010C ) && isplayer( self._id_010C ) )
            level thread scripts\mp\battlechatter_mp::_id_EB87( self._id_010C, "plr_killstreak_target" );

        if ( scripts\mp\utility\game::istrue( self._id_0019 ) )
            thread playvoice( 1, "vox_c8_engaging" );

        if ( isdefined( var_1 ) && ( var_1 == "iw7_chargeshot_c8_mp" || var_1 == "iw7_minigun_c8_mp" ) )
            self setweaponammoclip( var_1, var_0 );
    }
}

_id_DCF8( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    while ( isdefined( var_0 ) && isalive( var_0 ) )
    {
        if ( isdefined( self._id_010C ) )
            var_0 = self._id_010C;

        if ( self botcanseeentity( var_0 ) )
        {
            self botclearscriptgoal();
            return;
        }

        var_1 = getclosestpointonnavmesh( var_0.origin, self );

        if ( var_0 scripts\mp\utility\game::isinarbitraryup() )
        {
            var_2 = scripts\engine\trace::_id_48CC( 1 );

            if ( scripts\engine\trace::_id_DCF1( self geteye(), var_0 geteye(), undefined, var_2 ) )
            {
                var_3 = vectornormalize( var_0.origin - self geteye() );
                var_4 = ( 0, 0, 1 );

                if ( vectordot( var_4, var_3 ) < 0.92 )
                    self botlookatpoint( var_0.origin, 0.5, "script_forced" );
                else
                    break;
            }

            var_5 = ( var_0.origin[0], var_0.origin[1], var_0.origin[2] - 100 );
            var_5 = getgroundposition( var_5, 15, 2000 );
            var_1 = getclosestpointonnavmesh( var_5, self );
        }

        self botsetscriptgoal( var_1, 0, "hunt" );
        wait 0.5;
    }

    self botclearscriptgoal();
}

_id_DCF6()
{
    var_0 = [];

    foreach ( var_2 in level.players )
    {
        if ( var_2._id_0184 || isdefined( var_2.owner ) && var_2.owner._id_0184 )
            continue;

        if ( !isalive( var_2 ) )
            continue;

        if ( isdefined( var_2.team ) && self.team == var_2.team )
            continue;

        if ( var_2 _meth_8181( "specialty_blindeye" ) )
            continue;

        var_0[var_0.size] = var_2;
    }

    var_4 = undefined;

    if ( var_0.size > 0 )
        var_4 = sortbydistance( var_0, self.origin );

    if ( isdefined( var_4 ) && var_4.size > 0 )
        return var_4[0];

    return undefined;
}

_id_DCF9()
{
    self endon( "death" );
    self endon( "disconnect" );
    self.owner endon( "destroyed_rc8" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( scripts\mp\utility\game::istrue( self._id_0019 ) )
            thread playvoice( 1, "vox_c8_seeking" );

        if ( isdefined( self._id_010C ) && isalive( self._id_010C ) && isplayer( self._id_010C ) && !self._id_010C _meth_8181( "specialty_blindeye" ) )
        {
            if ( !self botcanseeentity( self._id_010C ) )
                _id_DCF8( self._id_010C );
        }
        else
        {
            var_0 = _id_DCF6();

            if ( isdefined( var_0 ) )
                _id_DCF8( var_0 );
        }

        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.5 );
    }
}

_id_DCF3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{

}

_id_DCF2( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = isdefined( var_1 ) && isdefined( self.owner ) && self.owner == var_1;

    if ( isdefined( level._id_13CA6 ) )
        var_5 = [[ level._id_13CA6 ]]( var_5, var_0 );

    if ( isrc8falldamage( var_0 ) )
        return;

    var_13 = 0;

    if ( self.owner._id_FC96 )
        var_13 = self.owner._id_FC96;

    if ( !scripts\mp\utility\game::istrue( self._id_0019 ) )
        var_2 /= 2;

    scripts\mp\damage::callback_playerdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    var_14 = self.owner._id_FC96 - var_13;

    if ( var_14 > 0 )
        self.owner thread scripts\mp\missions::_id_D991( "ch_rc8_shield", var_14 );

    scripts\mp\damage::_id_AF96( self, var_2, var_1, var_7, var_6, var_4, var_10, undefined, var_11, var_3, var_5 );
    scripts\mp\damage::_id_C546( "remote_c8", var_1, var_5, var_2 );
    scripts\mp\killstreaks\killstreaks::_id_A6A0( var_1, var_5, self, var_4 );
}

rc8_manageboostfx()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "owner_disconnect" );
    self.owner endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "scriptableBoostFxManager" );
    self endon( "scriptableBoostFxManager" );
    self waittill( "rc8_launched" );
    self setscriptablepartstate( "rc8_jump", "neutral", 0 );

    for (;;)
    {
        self waittill( "doubleJumpBoostBegin" );
        self.booston = 1;
        self setscriptablepartstate( "rc8_jump", "active", 0 );
        self waittill( "doubleJumpBoostEnd" );
        self.booston = undefined;
        self setscriptablepartstate( "rc8_jump", "neutral", 0 );
    }
}

isrc8falldamage( var_0 )
{
    return isdefined( var_0 ) && isdefined( var_0._id_01F1 ) && var_0._id_01F1 == "ks_remote_c8_mp";
}

_id_BFF0()
{
    return 0;
}

_id_128F7( var_0 )
{
    var_1 = checkrc8available( 1 );

    if ( !var_1 )
    {
        if ( isdefined( var_0.weapon ) && var_0.weapon != "none" )
            self notify( "killstreak_finished_with_weapon_" + var_0.weapon );

        return 0;
    }

    var_2 = scripts\mp\killstreaks\target_marker::_id_819B( var_0, ::checkrc8availablevalidationfunc );

    if ( !isdefined( var_2._id_AEC4 ) )
    {
        scripts\mp\utility\game::_id_4FC1();
        return 0;
    }

    scripts\mp\matchdata::_id_AFC9( var_0._id_110EA, self.origin );
    thread _id_10D8D( var_0, var_2 );
    var_3 = "used_remote_c8";
    var_4 = _id_0AC7::getrarityforlootitem( var_0._id_1318B );

    if ( var_4 != "" )
        var_3 = var_3 + "_" + var_4;

    level thread scripts\mp\utility\game::_id_115DE( var_3, self );
    return 1;
}

checkrc8available( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( scripts\mp\agents\agent_utility::_id_8008( "remote_c8" ) >= 2 )
    {
        if ( var_0 )
            scripts\mp\hud_message::_id_10122( "KILLSTREAKS_RC8_MAX" );

        return 0;
    }

    if ( scripts\mp\agents\agent_utility::_id_8011( self, "remote_c8" ) >= 1 )
    {
        if ( var_0 )
            scripts\mp\hud_message::_id_10122( "KILLSTREAKS_RC8_MAX" );

        return 0;
    }

    if ( level.teambased && scripts\mp\agents\agent_utility::_id_8012( self.team, "remote_c8" ) >= 1 )
    {
        if ( var_0 )
            scripts\mp\hud_message::_id_10122( "KILLSTREAKS_RC8_MAX" );

        return 0;
    }

    return 1;
}

checkrc8availablevalidationfunc()
{
    return checkrc8available( 1 );
}

_id_3772( var_0 )
{
    scripts\mp\utility\game::_id_93FA();

    if ( scripts\mp\utility\game::_id_4BD7( level._id_6BAA ) >= scripts\mp\utility\game::_id_B4D2() )
        return;

    var_1 = _id_6CC3();

    if ( !var_1 )
        return;

    var_2 = scripts\mp\killstreaks\airdrop::_id_7EC0( var_1 );
}

_id_6CC3( var_0, var_1, var_2 )
{
    var_3 = undefined;
    var_4 = getnodesinradiussorted( self.origin, var_0, var_1, var_0, "path" );

    foreach ( var_6 in var_4 )
    {

    }

    var_8 = scripts\engine\trace::_id_48BC( 0, 1, 0, 0, 0, 0, 0 );

    foreach ( var_6 in var_4 )
    {
        var_10 = scripts\engine\trace::_id_DCED( var_6.origin, var_6.origin + ( 0, 0, var_2 ), level._id_3CB5, var_8 );

        if ( var_10["hittype"] == "hittype_none" )
        {
            var_3 = var_6.origin;
            break;
        }
    }

    return var_3;
}

_id_10D8D( var_0, var_1 )
{
    self endon( "destroyed_rc8" );
    self endon( "disconnect" );
    var_2 = var_1._id_AEC4 + ( 0, 0, 10000 );
    var_3 = var_1._id_AEC4;
    var_4 = rotatepointaroundvector( anglestoright( var_1.angles ), anglestoforward( var_1.angles ), 90 );
    var_5 = vectortoangles( var_4 );
    var_6 = spawn( "script_model", var_3 + ( 0, 0, 3 ) );
    var_6 setmodel( "ks_remote_c8_mp" );
    var_6 _meth_831F( self );
    var_6 _meth_82DD( self );
    var_6 dontinterpolate();
    var_6 setscriptablepartstate( "laser_target", "start" );
    thread _id_FBF0( var_6.origin );
    var_7 = "mp_robot_c8";
    var_8 = _id_0AC7::getrarityforlootitem( var_0._id_1318B );

    if ( var_8 != "" )
        var_7 = var_7 + "_" + var_8;

    var_9 = scripts\mp\agents\agents::_id_16F2( "remote_c8", self.team, "rc8Agent", var_2, ( self.angles[0], 0, 0 ), self, 0, 0, "veteran", undefined, 1, 1, 1, 1 );
    var_9 reset_rc8_functionality();
    var_9 setmodel( var_7 );
    var_9 setviewmodel( "vm_robot_c8_base_mp" );
    var_9 setscriptablepartstate( "CompassIcon", "hideIcon" );
    var_9 _meth_8184();
    var_9.midairdamage = spawn( "script_model", var_9.origin );
    var_9.midairdamage setmodel( "ks_remote_c8_mp" );
    var_9.midairdamage _meth_831F( self );
    var_9.midairdamage _meth_82DD( self );
    var_9.midairdamage dontinterpolate();
    var_9.midairdamage linkto( var_9, "tag_origin" );
    var_9.midairdamage._id_13C2E = "iw7_c8landing_mp";
    var_9.midairdamage._id_110E8 = var_0;
    var_9.midairdamage._id_A63A = spawn( "script_model", var_9.origin );
    var_9.midairdamage._id_A63A setmodel( "tag_origin" );
    var_9.midairdamage._id_A63A linkto( var_9, "tag_origin", ( -10, 0, 250 ), ( 0, 0, 0 ) );
    thread _id_13AE2( var_9 );
    thread _id_13998( var_9, var_1, var_6 );
    thread watchgameover( var_9 );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 3.5 );
    var_10 = spawn( "script_model", var_2 );
    var_10 setmodel( "veh_mil_lnd_ca_droppod_c8_mp" );
    var_10 moveto( var_3, 2.65, 0, 0 );
    var_10 setscriptablepartstate( "pod", "fall", 0 );
    thread _id_13A0B( var_10 );
    var_10 thread watchreachpoddestination( var_3 );
    var_9 linkto( var_10, "tag_origin" );
    var_9._id_A6BB = var_0._id_110EA;
    var_9._id_165A = var_0._id_110EA;
    var_9._id_110EA = var_0._id_110EA;
    var_9._id_110E8 = var_0;
    var_9.owner = self;
    var_9._id_5F6F = undefined;
    var_9._id_FC99 = 1;
    var_9 _meth_831F( self );
    var_9 _meth_82DD( self );
    var_9 thread scripts\mp\killstreaks\agent_killstreak::_id_6CE2();
    var_11 = 2800;
    var_9 scripts\mp\agents\agent_common::set_agent_health( var_11 );
    var_9._id_ED75 = 60;
    var_9.mainweapon = "iw7_chargeshot_c8_mp";

    if ( _id_0DC9::_id_A69F( var_9._id_110E8, "passive_energy_machgun" ) )
        var_9.mainweapon = "iw7_minigun_c8_mp";

    var_9 scripts\mp\utility\game::_id_12C6( var_9.mainweapon );
    var_9 scripts\mp\utility\game::_id_12C6( "iw7_c8landing_mp" );
    var_9 scripts\mp\utility\game::_id_12C6( "iw7_c8shutdown_mp" );
    var_9 scripts\mp\utility\game::_id_12C6( "iw7_c8destruct_mp" );
    var_9 scripts\mp\utility\game::_id_12C6( "iw7_c8offhandshield_mp", 0 );
    var_9 _meth_844C( "iw7_c8offhandshield_mp" );
    var_9 _meth_8451( var_9.mainweapon );
    var_9 scripts\engine\utility::_id_1C6E( 0 );
    var_9 scripts\mp\utility\game::giveperk( "specialty_viewkickoverride" );
    var_9 scripts\mp\utility\game::giveperk( "specialty_block_health_regen" );
    var_9 _meth_8422( 0 );
    var_9 _meth_8424( 0 );
    var_9 _meth_8427( 0 );
    var_9 _meth_800A( 0 );
    var_9 _meth_8010( 0 );
    var_9 _meth_8472( 0 );
    var_9 _meth_8012( 0 );
    var_9 allowjump( 0 );
    var_9 botsetflag( "disable_traversals", 1 );
    var_9 botsetflag( "disable_crouch", 1 );
    var_9 botsetflag( "disable_prone", 1 );
    var_9 botsetflag( "affected_by_blindeye", 1 );
    var_9 botsetflag( "disable_corner_combat", 1 );
    var_9 _meth_82C6( "c8servo" );

    if ( _id_0DC9::_id_A69F( var_9._id_110E8, "passive_boosters" ) )
    {
        var_9 _meth_845A( "rc8_jump_mp" );
        var_9 allowjump( 1 );
        var_9 _meth_8422( 1 );
        var_9 _meth_85C5( 1 );
        var_9 botsetflag( "disable_traversals", 0 );
        var_9 botsetflag( "disable_wall_traversals", 1 );
    }

    var_9 setscriptablepartstate( "CompassIcon", "remote_c8" );
    var_9 scripts\mp\utility\game::_id_F751();
    var_9 _id_0DC9::_id_FAE4( "destroyed_rc8", "rc8_mp" );
    var_9 scripts\mp\utility\game::giveperk( "specialty_blindeye" );
    var_9 scripts\mp\damage::_id_E247();
    var_9 notify( "rc8_launched" );
    var_10 waittill( "explode", var_12 );

    if ( isdefined( var_6 ) )
    {
        var_6 setscriptablepartstate( "laser_target", "neutral" );
        var_6 setscriptablepartstate( "pod", "explode" );
    }

    if ( isdefined( var_10 ) )
        var_10 delete();

    if ( isdefined( var_1._id_1349C ) )
        var_1._id_1349C delete();

    var_9.origin = var_12;
    var_9 _meth_8383();
    var_9.midairdamage._id_A63A unlink();
    var_9.midairdamage._id_A63A linkto( var_9, "j_helmet" );
    thread updatekillcampos( 5, var_9, var_9.midairdamage._id_A63A );
    var_9 attachshieldmodel( "weapon_c8_shield_top_mp", "j_wristshield" );
    var_9 attachshieldmodel( "weapon_c8_shield_bottom_mp", "j_wristbtmshield" );
    var_9._id_130AC = spawn( "script_model", var_9 gettagorigin( "tag_eye" ) );
    var_9._id_130AC linkto( var_9, "tag_eye" );

    if ( isdefined( var_9._id_8C98 ) )
        var_9._id_8C98 = undefined;

    self._id_DCFC = var_9;
    self._id_4BE1 = "AI";
    _id_F697( self._id_4BE1, 1 );
    var_9 _id_0DC9::_id_1843( var_9._id_A6BB, "Killstreak_Ground", self, 1 );

    if ( _id_0DC9::_id_A69F( var_9._id_110E8, "passive_speed_duration" ) )
        var_9._id_ED75 = int( var_9._id_ED75 / 1.2 );

    thread _id_13AD7( var_9._id_130AC );
    thread _id_13B7E( var_9._id_ED75 );
    thread _id_13A10( var_9 );
    thread _id_13996();
    thread _id_13ACD( var_9 );
    thread _id_13B0C( var_9 );

    if ( _id_0DC9::_id_A69F( var_9._id_110E8, "passive_speed_duration" ) )
        var_9 setmovespeedscale( 1.0 );
}

watchreachpoddestination( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );

    while ( distancesquared( self.origin, var_0 ) > 0 )
        scripts\engine\utility::waitframe();

    self notify( "explode", var_0 );
}

updatekillcampos( var_0, var_1, var_2 )
{
    self endon( "destroyed_rc8" );
    wait( var_0 );
    var_2 unlink();
    var_2 linkto( var_1, "tag_origin", ( 0, 0, 150 ), ( 0, 0, 0 ) );
}

watchgameover( var_0 )
{
    self endon( "destroyed_rc8" );
    level waittill( "game_ended" );
    self notify( "destroyed_rc8", 1 );
}

_id_FBF0( var_0 )
{
    self endon( "destroyed_rc8" );
    playloopsound( var_0, "rc8_laser_on" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.5 );
    var_1 = spawn( "script_origin", var_0 );
    var_1 playloopsound( "rc8_laser_lp" );
    var_1 thread _id_FB68( self, 1.5, "rc8_pod_incoming" );
    var_1 thread _id_FB69( self, "destroyed_rc8" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 5.3 );
    playloopsound( var_0, "rc8_land" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.5 );
    playloopsound( var_0, "rc8_intro_pod_break" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.2 );
    var_1 delete();
}

_id_FB68( var_0, var_1, var_2 )
{
    var_0 endon( "destroyed_rc8" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_1 );

    if ( isdefined( self ) )
        self playsound( var_2 );
}

_id_FB69( var_0, var_1 )
{
    level endon( "game_ended" );
    var_0 waittill( var_1 );

    if ( isdefined( self ) )
        self delete();
}

_id_13A0B( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );
    self waittill( "destroyed_rc8", var_1 );

    if ( scripts\mp\utility\game::istrue( var_1 ) )
    {
        scripts\mp\shellshock::_id_22FF( 1.0, 0.7, 800 );

        if ( isdefined( var_0 ) )
            var_0 delete();
    }
}

_id_F697( var_0, var_1 )
{
    thread _id_560D( var_0, var_1 );
    thread _id_627B( var_1 );
}

_id_560D( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "destroyed_rc8" );
    level endon( "game_ended" );
    self._id_DCFC._id_130AC makeunusable();
    self._id_4BE1 = var_0;

    if ( !scripts\mp\utility\game::istrue( var_1 ) && var_0 == "AI" )
    {
        self notify( "stop_manual_rc8" );
        scripts\engine\utility::waitframe();
        self._id_DCFC thermalvisionfofoverlayoff();
        self._id_DCFC _meth_85A2( "" );
        self._id_DCFC setclientomnvar( "ui_rc8_controls", 0 );
        self._id_DCFC setclientomnvar( "ui_killstreak_missile_warn", 0 );
        self._id_DCFC setclientomnvar( "ui_remote_c8_countdown", 0 );
        self._id_DCFC setclientomnvar( "ui_remote_c8_health", 0 );
        self setclientomnvar( "ui_out_of_bounds_countdown", 0 );
    }
    else if ( var_0 == "MANUAL" )
        thread _id_10D87();

    self._id_DCFC rc8_disable_movement( 1 );
    self._id_DCFC rc8_disable_rotation( 1 );
    self._id_DCFC rc8_disable_attack( 1 );

    if ( scripts\mp\utility\game::istrue( var_1 ) )
        self._id_DCFC scripts\mp\utility\game::_id_141A( "iw7_c8landing_mp" );
    else
        self._id_DCFC scripts\mp\utility\game::_id_141A( "iw7_c8shutdown_mp" );

    self._id_DCFC._id_0019 = undefined;

    if ( scripts\mp\utility\game::istrue( var_1 ) )
    {
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.5 );
        self._id_DCFC._id_FC99 = undefined;
    }
    else
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1.2 );

    self notify( "finished_disable" );
}

_id_10D87()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = scripts\mp\killstreaks\proxyagent::_id_45D0( self._id_DCFC, self._id_DCFC._id_110E8, "stop_manual_rc8", self._id_DCFC._id_ED75, 1, "rc8_mp" );

    if ( !var_0 )
    {
        if ( !isalive( self._id_DCFC ) || scripts\mp\utility\game::istrue( self._id_DCFC._id_5F6F ) )
            return;

        self._id_4BE1 = "AI";
        return;
    }

    self._id_DCFC _meth_83BE();
    self._id_DCFC _meth_85A2( "rc8_mp" );
    self._id_DCFC setclientomnvar( "ui_rc8_controls", 1 );
    self._id_DCFC setclientomnvar( "ui_remote_c8_countdown", gettime() + int( self._id_DCFC._id_ED75 * 1000 ) );
    self._id_DCFC setclientomnvar( "ui_remote_c8_health", self._id_DCFC.health / self._id_DCFC.maxhealth );
}

_id_627B( var_0 )
{
    self endon( "disconnect" );
    self endon( "destroyed_rc8" );
    level endon( "game_ended" );
    self waittill( "finished_disable" );
    waitforswitchtoweapon( self._id_DCFC, self._id_DCFC.mainweapon );
    var_1 = self._id_4BE1;

    if ( var_1 == "AI" )
        scripts\mp\utility\game::_id_C638( "remote_c8_ai" );
    else
    {
        scripts\engine\utility::waitframe();
        self._id_DCFC scripts\mp\utility\game::_id_7385( 1 );
        scripts\mp\utility\game::_id_C638( "remote_c8_user" );
    }

    if ( scripts\mp\utility\game::istrue( var_0 ) )
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1.6 );
    else
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 1.2 );

    if ( !isalive( self._id_DCFC ) || scripts\mp\utility\game::istrue( self._id_DCFC._id_5F6F ) )
        return;

    if ( var_1 == "MANUAL" )
    {
        self._id_DCFC scripts\mp\utility\game::_id_7385( 0 );
        self._id_DCFC rc8_setuavstrength();
    }

    self._id_DCFC _meth_8597( 1 );
    self._id_DCFC rc8_disable_movement( 0 );
    self._id_DCFC rc8_disable_rotation( 0 );
    self._id_DCFC rc8_disable_attack( 0 );
    self._id_DCFC._id_130AC _id_0DC9::_id_F774( self, &"KILLSTREAKS_HINTS_RC8_CONTROL", 360, 360, 30000, 30000, 1 );
    self._id_DCFC._id_0019 = 1;
    self notify( "switched_mode" );
}

waitforswitchtoweapon( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "destroyed_rc8" );
    level endon( "game_ended" );
    var_2 = 0;

    while ( !var_2 )
    {
        var_0 scripts\mp\utility\game::_id_141A( var_1 );
        var_3 = 0.5;

        while ( var_3 > 0 )
        {
            if ( var_0 scripts\mp\utility\game::_id_9DA5( var_1 ) )
            {
                var_2 = 1;
                break;
            }

            var_3 -= 0.05;
            scripts\engine\utility::waitframe();
        }
    }
}

_id_8026( var_0 )
{
    var_1 = undefined;

    if ( var_0 == "AI" )
        var_1 = "MANUAL";
    else
        var_1 = "AI";

    return var_1;
}

_id_13AD7( var_0 )
{
    self endon( "disconnect" );
    self endon( "destroyed_rc8" );
    var_1 = self;

    for (;;)
    {
        if ( isdefined( self._id_4BE1 ) && self._id_4BE1 == "AI" )
        {
            var_0 waittill( "trigger", var_2 );

            if ( var_2 != self )
                continue;

            if ( scripts\mp\utility\game::isusingremote() )
                continue;

            if ( isdefined( self._id_55E4 ) && self._id_55E4 > 0 )
                continue;

            if ( scripts\mp\utility\game::_id_9FAE( self ) )
                continue;

            var_1 = self;
        }
        else
            var_1 = self._id_DCFC;

        var_3 = self._id_4BE1;
        var_4 = 0;
        var_5 = 0.1;

        if ( self._id_4BE1 == "MANUAL" )
            var_5 = 0.3;

        while ( var_1 usebuttonpressed() )
        {
            var_4 += 0.05;

            if ( var_4 > var_5 )
            {
                var_6 = _id_8026( var_3 );
                _id_F697( var_6, 0 );
                self waittill( "switched_mode" );
                break;
            }

            wait 0.05;
        }

        wait 0.05;
    }
}

_id_13AE2( var_0 )
{
    self endon( "destroyed_rc8" );
    level endon( "game_ended" );
    scripts\engine\utility::waittill_any( "joined_team", "disconnect", "joined_spectators" );
    self notify( "destroyed_rc8", 1 );
}

_id_13B7E( var_0 )
{
    self endon( "disconnect" );
    self endon( "host_migration_lifetime_update" );
    self endon( "destroyed_rc8" );
    level endon( "game_ended" );
    thread _id_0DC9::watchhostmigrationlifetime( "destroyed_rc8", var_0, ::_id_13B7E );

    while ( var_0 > 0 )
    {
        wait 0.05;
        var_0 -= 0.05;
        self._id_DCFC._id_ED75 -= 0.05;

        if ( self._id_DCFC._id_ED75 < 0 )
            self._id_DCFC._id_ED75 = 0;
    }

    var_1 = [ "remote_c8_end", "remote_c8_timeout" ];
    var_2 = randomint( var_1.size );
    var_3 = var_1[var_2];
    scripts\mp\utility\game::_id_D4B6( var_3, undefined, undefined, self.origin );
    self notify( "destroyed_rc8", 0 );
}

_id_13A10( var_0 )
{
    level endon( "game_ended" );
    self endon( "destroyed_rc8" );

    for (;;)
    {
        var_0 waittill( "emp_damage", var_1, var_2, var_3, var_4, var_5 );
        var_0 _id_0DC9::dodamagetokillstreak( 100, var_1, var_1, self.team, var_3, var_5, var_4 );
    }
}

_id_13999( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        var_1 = var_0 getcurrentweapon();
        iprintlnbold( "Current Weapon: " + var_1 );
        wait 1;
    }
}

_id_13996()
{
    self endon( "destroyed_rc8" );

    for (;;)
    {
        self waittill( "player_killstreak_agent_death", var_0, var_1, var_2, var_3, var_4, var_5, var_6 );

        if ( !isdefined( self._id_DCFC ) )
            break;

        if ( var_0 != self._id_DCFC )
            continue;

        if ( scripts\mp\utility\game::istrue( self._id_DCFC._id_5F6F ) )
            continue;

        if ( isdefined( var_6 ) && var_6 == "concussion_grenade_mp" )
        {
            if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_2 ) ) )
                var_2 scripts\mp\missions::_id_D991( "ch_tactical_emp_eqp" );
        }

        if ( isplayer( var_2 ) && var_2 != self )
        {
            var_7 = "callout_destroyed_remote_c8";
            var_8 = _id_0AC7::getrarityforlootitem( self._id_DCFC._id_110E8._id_1318B );

            if ( var_8 != "" )
                var_7 = var_7 + "_" + var_8;

            self._id_DCFC scripts\mp\damage::onkillstreakkilled( "remote_c8", var_2, var_6, var_5, var_3, "destroyed_remote_c8", "remote_c8_destroy", var_7 );
        }

        if ( scripts\mp\utility\game::istrue( level._id_C1C3 ) )
        {
            self notify( "destroyed_rc8", 1 );
            continue;
        }

        self notify( "destroyed_rc8", 0 );
    }
}

_id_13998( var_0, var_1, var_2 )
{
    self waittill( "destroyed_rc8", var_3 );
    var_0 thread _id_D51B( var_3, var_1, var_2 );
}

_id_D51B( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_AE62 ) )
        self._id_AE62 = undefined;

    if ( isdefined( var_1._id_1349C ) )
        var_1._id_1349C delete();

    if ( isdefined( var_2 ) )
        var_2 delete();

    if ( isdefined( self.midairdamage ) )
    {
        if ( isdefined( self.midairdamage._id_A63A ) )
            self.midairdamage._id_A63A delete();

        self.midairdamage delete();
    }

    if ( isdefined( self._id_130AC ) )
    {
        self._id_130AC makeunusable();
        self._id_130AC delete();
    }

    if ( isdefined( self.mainweapon ) )
        self.mainweapon = undefined;

    self setclientomnvar( "ui_rc8_controls", 0 );
    self setclientomnvar( "ui_killstreak_missile_warn", 0 );
    self setclientomnvar( "ui_remote_c8_countdown", 0 );
    self setclientomnvar( "ui_remote_c8_health", 0 );
    self _meth_85A2( "" );
    self thermalvisionfofoverlayoff();
    rc8_disable_movement( 1 );
    rc8_disable_rotation( 1 );
    rc8_disable_attack( 1 );
    self botsetflag( "ads_shield", 0 );

    if ( scripts\mp\utility\game::istrue( var_0 ) )
    {
        if ( isdefined( self.owner ) )
        {
            if ( isdefined( self.owner._id_4BE1 ) && self.owner._id_4BE1 == "MANUAL" )
                self.owner notify( "stop_manual_rc8" );
        }
    }
    else
    {
        self._id_5F6F = 1;
        var_3 = 3;

        if ( isdefined( self.owner ) )
        {
            if ( isdefined( self.owner._id_4BE1 ) && self.owner._id_4BE1 == "MANUAL" )
            {
                self.owner notify( "stop_manual_rc8" );
                scripts\engine\utility::waitframe();
            }

            self.owner._id_4BE1 = undefined;
            var_4 = self.owner scripts\mp\utility\game::_id_1302( "dummy_spike_mp", self.origin, self.origin, var_3 );

            if ( !isdefined( var_4._id_13C2E ) )
                var_4._id_13C2E = "dummy_spike_mp";

            var_4 linkto( self );
        }

        playfxontag( scripts\engine\utility::_id_7ECB( "rc8_malfunction" ), self, "j_mainroot" );
        scripts\mp\utility\game::_id_141A( "iw7_c8destruct_mp" );
        thread _id_FBF1( var_3 );
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_3 );
    }

    playfx( scripts\engine\utility::_id_7ECB( "rc8_explode" ), self.origin );
    playloopsound( self.origin, "c8_destruct" );
    playloopsound( self.origin, "frag_grenade_explode" );
    scripts\mp\shellshock::_id_22FF( 1.0, 0.7, 800 );
    scripts\mp\utility\game::_id_41BA();
    self hide();
    self._id_AE62 = undefined;
    self._id_C026 = 1;

    if ( !scripts\mp\utility\game::istrue( var_0 ) )
    {
        if ( isdefined( self.owner ) )
            self _meth_8253( self.origin, 256, 200, 100, self.owner, "MOD_EXPLOSIVE", self.mainweapon );

        self suicide();
    }

    reset_rc8_functionality();
    scripts\mp\agents\agent_utility::deactivateagent();
    scripts\mp\utility\game::_id_D915( "killstreak ended - remote_c8", self.owner );
}

_id_FBF1( var_0 )
{
    self playsound( "c8_destruct_initiate" );
    scripts\engine\utility::_id_50E1( 0.4, ::playsound, "c8_destruct_build_up" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 - 0.5 );
    self playsound( "c8_destruct_warning" );
}

_id_13ACD( var_0 )
{
    self endon( "disconnect" );
    self endon( "destroyed_rc8" );
    var_1 = 100;

    for (;;)
    {
        var_0 waittill( "victim_damaged", var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );

        if ( var_3 == var_0 && var_2 != var_0 && var_6 == "MOD_MELEE" )
        {
            if ( isplayer( var_2 ) )
            {
                var_12 = anglestoforward( var_0 getplayerangles() );
                var_13 = var_0.origin;
                var_14 = var_0 gettagorigin( "c8_shield_le" ) + ( 0, 0, 20 ) + var_12 * 200;
                var_15 = vectornormalize( var_14 - var_13 );
                var_1 = var_2.health + 1;
                var_2 _meth_84DC( var_15, 700 );
                var_2 playsound( "rc8_melee_hit" );
                wait 0.05;
            }
            else
                var_1 = 100;

            var_2 _meth_80B0( var_1, var_2.origin, self, var_0, "MOD_EXPLOSIVE", var_7 );
            scripts\mp\shellshock::_id_1245( 0.1, 0.08, var_8, 100 );
        }
    }
}

_id_13B0C( var_0 )
{
    self endon( "disconnect" );
    self endon( "destroyed_rc8" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "spawned_player" );

        if ( isdefined( var_0 ) )
            var_0 _meth_831F( self );
    }
}

_id_511F( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self.owner endon( "destroyed_rc8" );
    level endon( "game_ended" );
    wait( var_0 );
    self._id_FC99 = undefined;
}

playvoice( var_0, var_1 )
{
    self notify( "try_play_voice", var_0, var_1 );
}

rc8_disable_movement( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self.disabledmovement ) )
            self.disabledmovement = 0;

        self.disabledmovement++;
        self botsetflag( "disable_movement", 1 );
    }
    else
    {
        if ( !isdefined( self.disabledmovement ) )
            self.disabledmovement = 0;
        else
            self.disabledmovement--;

        if ( !self.disabledmovement )
            self botsetflag( "disable_movement", 0 );
    }
}

rc8_disable_attack( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55B1 ) )
            self._id_55B1 = 0;

        self._id_55B1++;
        self botsetflag( "disable_attack", 1 );
    }
    else
    {
        if ( !isdefined( self._id_55B1 ) )
            self._id_55B1 = 0;
        else
            self._id_55B1--;

        if ( !self._id_55B1 )
            self botsetflag( "disable_attack", 0 );
    }
}

rc8_disable_rotation( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self.disablerotation ) )
            self.disablerotation = 0;

        self.disablerotation++;
        self botsetflag( "disable_rotation", 1 );
    }
    else
    {
        if ( !isdefined( self.disablerotation ) )
            self.disablerotation = 0;
        else
            self.disablerotation--;

        if ( !self.disablerotation )
            self botsetflag( "disable_rotation", 0 );
    }
}

reset_rc8_functionality()
{
    self.disabledmovement = undefined;
    self._id_55B1 = undefined;
    self.disablerotation = undefined;
}

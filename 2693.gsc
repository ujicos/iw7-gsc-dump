// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    setdvarifuninitialized( "enable_analytics_log", 0 );
    level._id_1E61 = spawnstruct();
    level._id_1E61._id_BFA4 = 0;
    level._id_1E61._id_BF9C = 0;
    level._id_1E61._id_BF79 = 0;

    if ( !analyticsactive() )
        return;

    thread _id_13A33();

    if ( _id_1E62() )
    {
        thread _id_AFCA();
        thread _id_AF93();
        thread _id_AFA6();
    }
}

analyticsactive()
{
    if ( _id_1E6A() )
        return 1;

    if ( _id_1E62() )
        return 1;

    return 0;
}

_id_1E62()
{
    return getdvarint( "enable_analytics_log" ) == 1;
}

_id_81EE()
{
    var_0 = level._id_1E61._id_BF9C;
    level._id_1E61._id_BF9C++;
    return var_0;
}

_id_36A5( var_0 )
{
    if ( !isdefined( self._id_1E61._id_36A3 ) )
        self._id_1E61._id_36A3 = 0;

    self._id_1E61._id_36A3 |= var_0;
}

_id_13A33()
{
    if ( !analyticsactive() )
        return;

    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 _id_AFA8();
        var_0 thread _id_13A31();
        var_0 thread _id_13A5C();
        var_0 thread _id_13A7E();
    }
}

_id_13A31()
{
    self endon( "disconnect" );

    if ( !_id_1E62() )
        return;

    for (;;)
    {
        var_0 = scripts\engine\utility::_id_13735( "adjustedStance", "jumped", "weapon_fired", "reload_start", "spawned_player" );

        if ( var_0 == "adjustedStance" )
        {
            _id_3E4C();
            continue;
        }

        if ( var_0 == "jumped" )
        {
            _id_36A5( 4 );
            continue;
        }

        if ( var_0 == "weapon_fired" )
        {
            _id_36A5( 8 );
            continue;
        }

        if ( var_0 == "reload_start" )
        {
            _id_36A5( 16 );
            continue;
        }

        if ( var_0 == "spawned_player" )
        {
            thread _id_AFAB();
            thread _id_AFB2();
        }
    }
}

_id_13A5C()
{
    self endon( "disconnect" );

    if ( !_id_1E62() )
        return;

    for (;;)
    {
        var_0 = scripts\engine\utility::_id_13735( "doubleJumpBegin", "doubleJumpEnd", "sprint_slide_begin" );

        if ( var_0 == "doubleJumpBegin" )
        {
            _id_36A5( 64 );
            continue;
        }

        if ( var_0 == "doubleJumpEnd" )
        {
            _id_36A5( 128 );
            continue;
        }

        if ( var_0 == "sprint_slide_begin" )
            _id_36A5( 256 );
    }
}

_id_13A7E()
{
    self endon( "disconnect" );

    if ( isai( self ) )
        return;

    if ( getdvarint( "scr_playtest", 0 ) == 0 )
        return;

    self notifyonplayercommand( "log_user_event_start", "+actionslot 3" );
    self notifyonplayercommand( "log_user_event_end", "-actionslot 3" );
    self notifyonplayercommand( "log_user_event_generic_event", "+gostand" );

    for (;;)
    {
        self waittill( "log_user_event_start" );
        var_0 = scripts\engine\utility::_id_13734( "log_user_event_end", "log_user_event_generic_event" );

        if ( isdefined( var_0 ) && var_0 == "log_user_event_generic_event" )
        {
            self iprintlnbold( "Event Logged" );
            _id_AFA5( self.name, self.origin, "Generic User Event" );
        }
    }
}

_id_3E4C()
{
    var_0 = self getstance();

    if ( var_0 == "prone" )
        _id_36A5( 1 );
    else if ( var_0 == "crouch" )
        _id_36A5( 2 );
}

_id_AF93()
{
    if ( !_id_1E62() )
        return;

    for (;;)
    {
        var_0 = gettime();
        var_1 = level.players;

        foreach ( var_3 in var_1 )
        {
            if ( !_id_10044( var_3 ) )
                continue;

            if ( isdefined( var_3 ) && scripts\mp\utility\game::isreallyalive( var_3 ) )
            {
                var_3 _id_AFA7();
                var_3 _id_AFB0();
                scripts\engine\utility::waitframe();
            }
        }

        wait( max( 0.05, 1.5 - ( gettime() - var_0 ) / 1000 ) );
    }
}

_id_804F()
{
    var_0 = scripts\engine\utility::ter_op( isdefined( self._id_1E61._id_36A3 ), self._id_1E61._id_36A3, 0 );

    if ( self iswallrunning() )
        var_0 |= 32;
}

_id_41CB()
{
    self._id_1E61._id_36A3 = 0;
    _id_3E4C();
}

_id_3211()
{
    var_0 = 0;
    var_1 = self getstance();

    if ( var_1 == "prone" )
        var_0 |= 1;
    else if ( var_1 == "crouch" )
        var_0 |= 2;

    if ( self isjumping() )
        var_0 |= 4;

    if ( isdefined( self._id_A9EE ) && gettime() - self._id_A9EE < 500 )
        var_0 |= 8;

    if ( self _meth_81B8() )
        var_0 |= 16;

    return var_0;
}

_id_3212()
{
    var_0 = "archetype=" + self._id_AE62 + ";" + "powerPrimary=" + self._id_AE7B + ";" + "powerSecondary=" + self._id_AE7D + ";" + "weaponPrimary\\t =" + scripts\mp\class::_id_3224( self._id_AE7F, self._id_AE86, self._id_AE88, self._id_AE90 ) + ";" + "weaponSecondary =" + scripts\mp\class::_id_3224( self._id_AE94, self._id_AE9A, self._id_AE9C, self._id_AEA4 ) + ";";
    return var_0;
}

_id_321B( var_0 )
{
    var_1 = "";

    if ( isdefined( var_0._id_A94A ) )
    {
        if ( isdefined( var_0._id_A94A["allies"] ) )
            var_1 += ( "alliesBucket=" + var_0._id_A94A["allies"] + ";" );

        if ( isdefined( var_0._id_A94A["axis"] ) )
            var_1 += ( "axisBucket=" + var_0._id_A94A["axis"] + ";" );
    }

    return var_1;
}

_id_AFA7()
{
    if ( !_id_10044( self ) )
        return;

    var_0 = anglestoforward( self getplayerangles() );
    bbprint( "gamemp_path", "playerid %i x %f y %f z %f gun_orientx %f gun_orienty %f gun_orientz %f action %i health %i", self._id_1E61._id_D3AB, self.origin[0], self.origin[1], self.origin[2], var_0[0], var_0[1], var_0[2], _id_804F(), _id_80FF() );
    _id_41CB();
}

_id_AFAB()
{
    if ( !_id_10044( self ) )
        return;

    var_0 = isdefined( self._id_A9F4 ) && isdefined( self._id_A9F4._id_3165 ) && self._id_A9F4._id_3165;
    var_1 = anglestoforward( self.angles );
    bbprint( "gamemp_spawn_in", "playerid %i x %f y %f z %f orientx %f orienty %f orientz %f loadout %s type %s team %s", self._id_1E61._id_D3AB, self.origin[0], self.origin[1], self.origin[2], var_1[0], var_1[1], var_1[2], _id_3212(), scripts\engine\utility::ter_op( var_0, "Buddy", "Normal" ), self.team );
}

_id_AFA8()
{
    if ( !analyticsactive() )
        return;

    if ( !isdefined( self._id_1E61 ) )
        self._id_1E61 = spawnstruct();

    self._id_1E61._id_D3AB = level._id_1E61._id_BFA4;
    level._id_1E61._id_BFA4++;

    if ( !_id_1E62() )
        return;

    var_0 = scripts\mp\class::_id_3688();
    var_1 = self getxuid();
    bbprint( "gamemp_player_connect", "playerid %i player_name %s player_xuid %s player_super_name %s", self._id_1E61._id_D3AB, self.name, var_1, var_0 );
}

_id_AFA9( var_0, var_1, var_2 )
{
    if ( !_id_10044( self ) || !isplayer( self ) )
        return;

    var_3 = anglestoforward( self getplayerangles() );
    var_4 = -1;
    var_5 = 0;
    var_6 = 0;
    var_7 = 0;
    var_8 = 0;
    var_9 = 0;
    var_10 = 0;
    var_11 = "s";
    var_12 = 0;

    if ( isdefined( var_0 ) && isplayer( var_0 ) )
    {
        var_4 = var_0._id_1E61._id_D3AB;

        if ( isdefined( var_0.team ) )
        {
            if ( var_0.team == "axis" )
                var_11 = "a";
            else
                var_11 = "l";
        }

        if ( isdefined( var_0.origin ) )
        {
            var_5 = var_0.origin[0];
            var_6 = var_0.origin[1];
            var_7 = var_0.origin[2];
        }

        if ( isdefined( var_0._id_AC68 ) )
            var_12 = var_0._id_AC68;

        var_13 = anglestoforward( var_0 getplayerangles() );

        if ( isdefined( var_13 ) )
        {
            var_8 = var_13[0];
            var_9 = var_13[1];
            var_10 = var_13[2];
        }
    }

    var_14 = level._id_1E61._id_BF79;
    level._id_1E61._id_BF79++;
    var_2 = scripts\engine\utility::ter_op( isdefined( var_2 ), var_2, "None" );
    var_15 = "s";

    if ( self.team == "axis" )
        var_15 = "a";
    else
        var_15 = "l";

    bbprint( "gamemp_death", "playerid %i x %f y %f z %f gun_orientx %f gun_orienty %f gun_orientz %f weapon %s mean_of_death %s attackerid %i action %i server_death_id %i victim_life_index %d attacker_life_index %d victim_team %s attacker_team %s attacker_pos_x %f attacker_pos_y %f attacker_pos_z %f attacker_gun_orientx %f attacker_gun_orienty %f attacker_gun_orientz %f victim_weapon %s", self._id_1E61._id_D3AB, self.origin[0], self.origin[1], self.origin[2], var_3[0], var_3[1], var_3[2], var_2, scripts\engine\utility::ter_op( isdefined( var_1 ), var_1, "None" ), var_4, _id_3211(), var_14, self._id_AC68, var_12, var_15, var_11, var_5, var_6, var_7, var_8, var_9, var_10, self.primaryweapon );

    if ( isdefined( var_1 ) && isexplosivedamagemod( var_1 ) )
        _id_AF9E( scripts\engine\utility::ter_op( isdefined( var_2 ), var_2, "generic" ), self.origin, var_0, 1.0 );

    if ( isdefined( self.attackers ) )
    {
        foreach ( var_17 in self.attackers )
        {
            if ( isdefined( var_17 ) && isplayer( var_17 ) && var_17 != var_0 )
                _id_AF9C( var_17._id_1E61._id_D3AB, var_14, var_2 );
        }
    }
}

_id_AFAA( var_0, var_1, var_2 )
{
    if ( !_id_10044( self ) )
        return;

    var_3 = anglestoforward( self getplayerangles() );
    bbprint( "gamemp_kill", "playerid %i x %f y %f z %f gun_orientx %f gun_orienty %f gun_orientz %f weapon %s mean_of_kill %s victimid %i action %i attacker_health %i victim_pixel_count %i", self._id_1E61._id_D3AB, self.origin[0], self.origin[1], self.origin[2], var_3[0], var_3[1], var_3[2], scripts\engine\utility::ter_op( isdefined( var_2 ), var_2, "None" ), scripts\engine\utility::ter_op( isdefined( var_1 ), var_1, "None" ), scripts\engine\utility::ter_op( isdefined( var_0 ) && isplayer( var_0 ), var_0._id_1E61._id_D3AB, "-1" ), _id_3211(), _id_80FF(), 0 );
}

_id_AF9E( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !_id_1E62() )
        return;

    if ( !isdefined( var_4 ) )
        var_4 = ( 1, 0, 0 );

    bbprint( "gamemp_explosion", "playerid %i x %f y %f z %f orientx %f orienty %f orientz %f duration %i type %s", var_2._id_1E61._id_D3AB, var_1[0], var_1[1], var_1[2], var_4[0], var_4[1], var_4[2], var_3, var_0 );
}

_id_AFB2()
{
    if ( !_id_1E62() )
        return;

    if ( !isdefined( level._id_108FB ) )
        return;

    foreach ( var_1 in level._id_108FB )
        bbprint( "gamemp_spawn_point", "x %f y %f z %f allies_score %i axis_score %i allies_max_score %i axis_max_score %i state %s", var_1.origin[0], var_1.origin[1], var_1.origin[2], scripts\engine\utility::ter_op( isdefined( var_1._id_A9E9["allies"] ), var_1._id_A9E9["allies"], 0 ), scripts\engine\utility::ter_op( isdefined( var_1._id_A9E9["axis"] ), var_1._id_A9E9["axis"], 0 ), scripts\engine\utility::ter_op( isdefined( var_1._id_11A3A ), var_1._id_11A3A, 0 ), scripts\engine\utility::ter_op( isdefined( var_1._id_11A3A ), var_1._id_11A3A, 0 ), _id_321B( var_1 ) );
}

_id_AF9F( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !_id_1E62() )
        return;

    bbprint( "gamemp_front_line", "startx %f starty %f endx %f endy %f axis_centerx %f axis_centery %f allies_centerx %f allies_centery %f, state %i", var_0[0], var_0[1], var_1[0], var_1[1], var_3[0], var_3[1], var_2[0], var_2[1], var_4 );
}

_id_AFA0( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !_id_1E62() )
        return;

    bbprint( "gamemp_object", "uniqueid %i x %f y %f z %f ownerid %i type %s state %s", var_1, var_2[0], var_2[1], var_2[2], var_3, var_0, var_4 );
}

_id_AFA5( var_0, var_1, var_2 )
{
    if ( !_id_1E62() )
        return;

    bbprint( "gamemp_message", "ownerid %s x %f y %f z %f message %s", var_0, var_1[0], var_1[1], var_1[2], var_2 );
}

_id_AFB5( var_0 )
{
    if ( !_id_1E62() )
        return;

    bbprint( "gamemp_matchtags", "message %s", var_0 );
}

_id_AFAC( var_0, var_1 )
{
    if ( !_id_10044( self ) )
        return;

    var_2 = anglestoforward( self.angles );
    bbprint( "gamemp_power", "ownerid %i x %f y %f z %f orientx %f orienty %f orientz %f type %s state %s", self._id_1E61._id_D3AB, self.origin[0], self.origin[1], self.origin[2], var_2[0], var_2[1], var_2[2], var_0, var_1 );
}

_id_AFB0()
{
    if ( !_id_10044( self ) )
        return;

    var_0 = anglestoforward( self.angles );
    bbprint( "gamemp_scoreboard", "ownerid %i score %i", self._id_1E61._id_D3AB, self.score );
}

_id_AFA6()
{
    if ( !_id_1E62() )
        return;

    var_0 = getentarray( "minimap_corner", "targetname" );

    if ( !isdefined( var_0 ) || var_0.size != 2 )
        return;

    bbprint( "gamemp_map", "cornera_x %f cornera_y %f cornerb_x %f cornerb_y %f north %f", var_0[0].origin[0], var_0[0].origin[1], var_0[1].origin[0], var_0[1].origin[1], getnorthyaw() );
}

_id_AF9C( var_0, var_1, var_2 )
{
    if ( !_id_1E62() )
        return;

    bbprint( "gamemp_assists", "playerid %i server_death_id %i weapon %s", var_0, var_1, var_2 );
}

_id_80FF()
{
    return int( clamp( self.health, 0, 100000 ) );
}

_id_10044( var_0 )
{
    if ( !_id_1E62() )
        return 0;

    if ( !isdefined( var_0.team ) || var_0.team == "spectator" || var_0.sessionstate != "playing" && var_0.sessionstate != "dead" )
        return 0;

    return 1;
}

_id_AFCA()
{
    var_0 = getdvar( "scr_analytics_tag", "" );

    if ( var_0 != "" )
        _id_AFB5( var_0 );

    if ( scripts\mp\utility\game::matchmakinggame() )
        _id_AFB5( "OnlineMatch" );
    else if ( getdvarint( "xblive_privatematch" ) )
        _id_AFB5( "PrivateMatch" );
    else if ( !getdvarint( "onlinegame" ) )
        _id_AFB5( "OfflineMatch" );
}

_id_AFB4( var_0, var_1, var_2, var_3 )
{
    if ( !_id_1E62() )
        return;

    var_4 = -1;

    if ( isdefined( self._id_1E61 ) && isdefined( self._id_1E61._id_D3AB ) )
        var_4 = self._id_1E61._id_D3AB;

    bbprint( "analytics_mp_supers", "super_name %s time_to_use %i num_hits %i num_kills %i player_id %i", var_0, var_1, var_2, var_3, var_4 );
}

_id_AFB3( var_0 )
{
    if ( !_id_1E62() )
        return;

    var_1 = -1;

    if ( isdefined( self._id_1E61 ) && isdefined( self._id_1E61._id_D3AB ) )
        var_1 = self._id_1E61._id_D3AB;

    bbprint( "analytics_mp_super_earned", "match_time %i player_id %i", var_0, var_1 );
}

_id_AFA4( var_0, var_1 )
{
    if ( !_id_1E62() )
        return;

    var_2 = -1;

    if ( isdefined( self._id_1E61 ) && isdefined( self._id_1E61._id_D3AB ) )
        var_2 = self._id_1E61._id_D3AB;

    bbprint( "analytics_mp_killstreak_earned", "killstreak_name %d match_time %i player_id %i", var_0, var_1, var_2 );
}

_id_AFA3( var_0, var_1 )
{
    if ( !_id_1E62() )
        return;

    var_2 = -1;

    if ( isdefined( self._id_1E61 ) && isdefined( self._id_1E61._id_D3AB ) )
        var_2 = self._id_1E61._id_D3AB;

    bbprint( "analytics_mp_killstreak", "killstreak_name %s time_to_activate %i player_id %i", var_0, var_1, var_2 );
}

_id_AF9D( var_0 )
{
    if ( !_id_1E62() )
        return;

    bbprint( "analytics_mp_awards", "award_message %s", var_0 );
}

_id_AFA2( var_0, var_1, var_2, var_3 )
{
    if ( !_id_1E62() )
        return;

    var_4 = -1;

    if ( isdefined( self._id_1E61 ) && isdefined( self._id_1E61._id_D3AB ) )
        var_4 = self._id_1E61._id_D3AB;

    bbprint( "analytics_mp_player_xp", "current_prestige %d current_level %d xp_gained %d xp_source %s player_id %i", var_0, var_1, var_2, var_3, var_4 );
}

_id_AFA1( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !_id_1E62() )
        return;

    var_5 = -1;

    if ( isdefined( self._id_1E61 ) && isdefined( self._id_1E61._id_D3AB ) )
        var_5 = self._id_1E61._id_D3AB;

    bbprint( "analytics_mp_weapon_xp", "weapon %s current_prestige %d current_level %d xp_gained %d xp_source %s player_id %i", var_0, var_1, var_2, var_3, var_4, var_5 );
}

_id_AFB1()
{
    if ( !_id_1E62() )
        return;

    var_0 = [];
    var_1 = [];
    var_2 = 0;

    for ( var_2 = 0; var_2 < 12; var_2++ )
    {
        var_0[var_2] = 0;
        var_1[var_2] = "";
    }

    var_2 = 0;

    foreach ( var_4 in level.players )
    {
        if ( !isai( var_4 ) )
        {
            var_0[var_2] = var_4._id_1E61._id_D3AB;
            var_1[var_2] = var_4 getxuid();
        }

        var_2 += 1;
    }

    bbprint( "analytics_match_player_index_init", "player1_index %d player1_xuid %s player2_index %d player2_xuid %s player3_index %d player3_xuid %s player4_index %d player4_xuid %s player5_index %d player5_xuid %s player6_index %d player6_xuid %s player7_index %d player7_xuid %s player8_index %d player8_xuid %s player9_index %d player9_xuid %s player10_index %d player10_xuid %s player11_index %d player11_xuid %s player12_index %d player12_xuid %s", var_0[0], var_1[0], var_0[1], var_1[1], var_0[2], var_1[2], var_0[3], var_1[3], var_0[4], var_1[4], var_0[5], var_1[5], var_0[6], var_1[6], var_0[7], var_1[7], var_0[8], var_1[8], var_0[9], var_1[9], var_0[10], var_1[10], var_0[11], var_1[11] );
}

_id_1E6A()
{
    return getdvarint( "enable_analytics_spawn_log" ) != 0;
}

_id_9CCB( var_0, var_1 )
{
    return var_0 < var_1;
}

_id_1E6B()
{
    if ( isdefined( level._id_10841 ) && isdefined( level._id_108D8 ) && isdefined( level._id_BFAC ) )
    {
        game["spawnCount"] = level._id_10841;
        game["spawnIdsToBeInstrumented"] = level._id_108D8;
        game["nextSpawnToBeInstrumented"] = level._id_BFAC;
    }
}

_id_1E5E()
{
    if ( isdefined( level._id_10841 ) && isdefined( level._id_108D8 ) && isdefined( level._id_BFAC ) )
        return 1;

    return 0;
}

_id_1E60()
{
    var_0 = game["spawnCount"];
    var_1 = game["spawnIdsToBeInstrumented"];
    var_2 = game["nextSpawnToBeInstrumented"];

    if ( isdefined( var_0 ) && isdefined( var_1 ) && isdefined( var_2 ) )
    {
        level._id_10841 = var_0;
        level._id_108D8 = var_1;
        level._id_BFAC = var_2;
    }
    else
    {
        level._id_10841 = 0;
        level._id_108D8 = [];
        level._id_BFAC = 0;
        var_3 = getdvarint( "analytics_spawn_event_log_count" );
        var_4 = _id_1E5D();
        var_5 = [];

        for ( var_6 = 0; var_6 < var_3; var_6++ )
        {
            var_7 = randomintrange( 20, var_4 );

            if ( isdefined( var_5[var_7] ) )
            {
                level._id_108D8[var_6] = -1;
                continue;
            }

            var_5[var_7] = 1;
            level._id_108D8[var_6] = var_7;
        }

        level._id_108D8 = scripts\engine\utility::_id_22C3( level._id_108D8, ::_id_9CCB );
    }
}

_id_1E65( var_0 )
{
    if ( isdefined( level._id_BFAC ) && isdefined( level._id_108D8 ) )
    {
        if ( level._id_BFAC < level._id_108D8.size )
        {
            if ( level._id_108D8[level._id_BFAC] == -1 )
                level._id_BFAC++;

            if ( level._id_108D8[level._id_BFAC] == var_0 )
            {
                level._id_BFAC++;
                return 1;
            }
        }
    }

    return 0;
}

_id_1E68( var_0, var_1, var_2, var_3 )
{
    var_4 = scripts\mp\spawnfactor::_id_7ED7();
    var_5 = var_4._id_B72B;
    var_6 = 0;
    var_7 = 0;
    var_8 = 0;

    if ( isdefined( var_5 ) )
    {
        var_6 = var_5[0];
        var_7 = var_5[1];
        var_8 = var_5[2];
    }

    var_9 = 0;

    if ( isdefined( var_4._id_115C7 ) )
        var_9 = var_4._id_115C7;

    var_10 = var_4._id_9D25[var_1];
    var_11 = 0;

    if ( isdefined( var_4._id_55DD ) && isdefined( var_4._id_55DD[var_1] ) )
        var_11 = var_4._id_55DD[var_1];

    var_12 = level._id_108D1._id_AFC0;
    var_13 = 0;

    if ( isdefined( level._id_108D1._id_3164 ) )
    {
        var_13 = level._id_108D1._id_3164;
        level._id_108D1._id_3164 = 0;
    }

    bbreportspawntypes( var_6, var_7, var_8, var_9, var_3, var_10, var_11, var_2, var_12, var_13 );
}

_id_1E67( var_0, var_1, var_2 )
{
    foreach ( var_4 in level.players )
    {
        if ( scripts\mp\utility\game::isreallyalive( var_4 ) )
        {
            var_5 = var_4 getplayerangles();
            var_6 = vectortoyaw( var_5 );
            var_7 = var_4.origin[0];
            var_8 = var_4.origin[1];
            var_9 = var_4.origin[2];
            var_10 = 0;

            if ( var_4 == var_0 )
                var_10 = 1;

            var_11 = 0;

            if ( isdefined( var_0._id_01B1 ) && var_0._id_01B1 == var_4 )
                var_11 = 1;

            var_12 = 0;

            if ( var_4.team == "axis" )
                var_12 = 1;
            else if ( var_4.team == "allies" )
                var_12 = 2;

            var_13 = 0;

            if ( isdefined( var_4._id_1E61._id_D3AB ) )
                var_13 = var_4._id_1E61._id_D3AB;

            bbreportspawnplayerdetails( var_2, var_6, var_7, var_8, var_9, var_13, var_12, var_10, var_11 );
        }
    }
}

_id_1E66( var_0, var_1, var_2, var_3 )
{
    foreach ( var_5 in level._id_108D1._id_108FD )
    {
        var_6 = var_5._id_11A3B;
        var_7 = var_5._id_1E5B._id_1D30;
        var_8 = var_5._id_1E5B._id_654A;
        var_9 = var_5._id_1E5B._id_1192A;
        var_10 = 0;

        if ( isdefined( var_0._id_A9F4 ) && var_0._id_A9F4 == var_5 )
            var_10 = 1;

        var_11 = 0;

        if ( var_3 == var_5 )
            var_11 = 1;

        var_12 = var_5._id_1E5B._id_B498;
        var_13 = var_5._id_1E5B._id_DCC5;
        var_14 = var_5._id_1E5B._id_1091B;
        var_15 = 0;

        if ( var_5._id_A9F5 == "axis" )
            var_15 = 1;
        else if ( var_5._id_A9F5 == "allies" )
            var_15 = 2;

        var_16 = var_5.lastspawntime;
        var_17 = var_5._id_1E5B._id_B4A5;
        var_18 = 0;

        if ( isdefined( var_5.index ) && var_5.index <= 1023 )
            var_18 = var_5.index;

        var_19 = 0;

        if ( isdefined( var_5._id_1E5B ) && isdefined( var_5._id_1E5B._id_10919 ) )
            var_19 = var_5._id_1E5B._id_10919;

        var_20 = 0;

        if ( isdefined( var_5._id_275D ) )
            var_20 = var_5._id_275D;

        bbreportspawnfactors( 2, var_6, var_12, var_17, var_13, var_2, var_7, var_8, var_11, var_10, var_15, var_18, var_14, var_9, var_19, var_20 );
    }
}

_id_1E5D()
{
    var_0 = 120;

    if ( isdefined( level.gametype ) )
    {
        if ( level.gametype == "war" )
            var_0 = 120;
        else if ( level.gametype == "dom" )
            var_0 = 120;
        else if ( level.gametype == "conf" )
            var_0 = 120;
        else if ( level.gametype == "front" )
            var_0 = 40;
        else if ( level.gametype == "sd" )
            var_0 = 50;
        else if ( level.gametype == "dm" )
            var_0 = 50;
        else if ( level.gametype == "koth" )
            var_0 = 125;
        else if ( level.gametype == "ctf" )
            var_0 = 50;
        else if ( level.gametype == "tdef" )
            var_0 = 75;
        else if ( level.gametype == "siege" )
            var_0 = 25;
        else if ( level.gametype == "gun" )
            var_0 = 50;
        else if ( level.gametype == "sr" )
            var_0 = 25;
        else if ( level.gametype == "grind" )
            var_0 = 75;
        else if ( level.gametype == "ball" )
            var_0 = 50;
    }

    return var_0;
}

_id_AFAD( var_0, var_1, var_2 )
{
    if ( !_id_1E62() )
        return;

    var_3 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = -1;

    bbprint( "analytics_mp_score_event", "score_type %d score_points %d score_eventid %d game_time %d player_id %d", var_3, var_0, var_2, var_1, self._id_1E61._id_D3AB );
}

_id_AFAE( var_0, var_1, var_2 )
{
    if ( !_id_1E62() )
        return;

    var_3 = 2;

    if ( !isdefined( var_2 ) )
        var_2 = -1;

    bbprint( "analytics_mp_score_event", "score_type %d score_points %d score_eventid %d game_time %d player_id %d", var_3, var_0, var_2, var_1, self._id_1E61._id_D3AB );
}

_id_AFAF( var_0, var_1 )
{
    if ( !_id_1E62() )
        return;

    var_2 = 3;
    bbprint( "analytics_mp_score_event", "score_type %d score_points %d game_time %d player_id %d", var_2, var_0, var_1, self._id_1E61._id_D3AB );
}

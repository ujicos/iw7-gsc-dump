// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_9888()
{
    level._id_A697 = [];
    var_0 = 1;

    for (;;)
    {
        var_1 = scripts\mp\utility\game::_id_7F4B( var_0 );

        if ( !isdefined( var_1 ) || var_1 == "" )
            break;

        var_2 = var_1;
        var_3 = scripts\mp\utility\game::_id_7F3C( var_2 );
        var_4 = scripts\mp\utility\game::_id_7F3B( var_2 );
        game["dialog"][var_2] = var_4;
        var_5 = scripts\mp\utility\game::_id_7F34( var_2 );
        game["dialog"]["allies_friendly_" + var_2 + "_inbound"] = "friendly_" + var_5;
        game["dialog"]["allies_enemy_" + var_2 + "_inbound"] = "enemy_" + var_5;
        var_6 = scripts\mp\utility\game::_id_7F3E( var_2 );
        game["dialog"]["axis_friendly_" + var_2 + "_inbound"] = "friendly_" + var_6;
        game["dialog"]["axis_enemy_" + var_2 + "_inbound"] = "enemy_" + var_6;
        var_7 = scripts\mp\utility\game::_id_7F4E( var_2 );
        scripts\mp\rank::_id_DF0A( "killstreak_" + var_2, "value", var_7 );
        level._id_A697[level._id_A697.size] = var_2;
        var_0++;
    }
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isdefined( var_0.pers["killstreaks"] ) )
            var_0.pers["killstreaks"] = [];

        if ( !isdefined( var_0.pers["startedMapSelect"] ) )
            var_0.pers["startedMapSelect"] = 0;

        var_0 _meth_83F9( game["thermal_vision"] );
        var_0 thread onplayerspawned();
        var_0 thread _id_B9CB();
        var_0 thread _id_110C3();
        var_0 thread monitorrigswitch();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        self._id_13111 = undefined;
        _id_F1C5();
        thread _id_A6BA();
        thread _id_A69C();
        thread _id_A69B();
        thread _id_A69D();
        thread _id_A6B8();
        thread _id_A6B0();
        thread _id_FAC6();

        if ( !isdefined( self._id_5FBE ) )
            self._id_5FBE = 0;

        if ( !scripts\mp\utility\game::istrue( self._id_AE15 ) )
        {
            scripts\mp\utility\game::_id_98B3( "streakPoints" );
            self._id_110EE = scripts\mp\utility\game::getpersstat( "streakPoints" );
            self._id_AE15 = 1;
        }

        _id_F866();
        _id_12EBC();
        _id_12F2E( self._id_110EE );
    }
}

monitorrigswitch()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "giveLoadout" );

        if ( scripts\mp\utility\game::istrue( level._id_3B1E ) )
            continue;

        if ( isdefined( self.oldperks ) && isdefined( self._id_CA5B ) && self.oldperks.size > 0 )
        {
            if ( scripts\mp\utility\game::_id_2287( self._id_CA5B, "specialty_support_killstreaks" ) && scripts\mp\utility\game::_id_2287( self.oldperks, "specialty_support_killstreaks" ) )
                continue;
            else if ( !scripts\mp\utility\game::_id_2287( self.oldperks, "specialty_support_killstreaks" ) )
                continue;
            else
            {
                _id_E275();
                _id_12EBC();
            }
        }
    }
}

_id_B9CB()
{
    while ( isdefined( self ) )
    {
        if ( scripts\mp\utility\game::bot_is_fireteam_mode() )
            self waittill( "disconnect" );
        else
            scripts\engine\utility::waittill_any( "disconnect", "joined_team", "joined_spectators" );

        self notify( "killstreak_disowned" );
    }
}

_id_FAC6()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( isbot( self ) )
        return;

    scripts\mp\utility\game::_id_7670( "prematch_done" );
    self notifyonplayercommand( "ks_select_up", "+actionslot 1" );
    self notifyonplayercommand( "ks_select_down", "+actionslot 2" );
    self notifyonplayercommand( "ks_action_3", "+actionslot 3" );
    self notifyonplayercommand( "ks_action_4", "+actionslot 4" );
    self notifyonplayercommand( "ks_action_5", "+actionslot 5" );
    self notifyonplayercommand( "ks_action_6", "+actionslot 6" );
    scripts\mp\utility\game::_id_13CB( 4, "" );
}

_id_12F2F()
{
    if ( !isdefined( self.pers["killstreaks"] ) )
        return;

    if ( self._id_110EE == self._id_D8B3 )
        return;

    var_0 = self._id_110EE;
    self _meth_80BF( int( min( self._id_110EE, 16384 ) ) );

    if ( self._id_110EE >= self._id_BFB0 )
        _id_F866();
}

_id_E274()
{
    self _meth_80BF( 0 );
    self setclientomnvar( "ui_score_streak_cost", 0 );
    self setclientomnvar( "ui_score_streak_two_cost", 0 );
    self setclientomnvar( "ui_score_streak_three_cost", 0 );
    _id_F866();
}

_id_F866()
{
    if ( !isdefined( self._id_110F4 ) )
    {
        self._id_BFB0 = 0;
        self _meth_80C0( 0 );
        return;
    }

    if ( _id_7FA2() == 0 )
    {
        self._id_BFB0 = 0;
        self _meth_80C0( 0 );
        return;
    }

    var_0 = self._id_BFB0;
    var_1 = _id_7FEE();

    if ( !isdefined( var_1 ) )
        return;

    var_2 = _id_817B( var_1 );
    self._id_BFB0 = var_2;

    if ( scripts\mp\utility\game::_id_12D6( "specialty_support_killstreaks" ) && isdefined( self.pers["killstreaks"][1] ) && !scripts\mp\utility\game::istrue( self._id_5FBD ) )
    {
        var_3 = 0;

        foreach ( var_5 in self.pers["killstreaks"] )
        {
            if ( scripts\mp\utility\game::istrue( var_5._id_5FB9 ) )
            {
                var_3 = 1;
                continue;
            }

            var_3 = 0;
        }

        if ( var_3 && !isdefined( self._id_5FBD ) )
        {
            self._id_5FBD = 1;
            self._id_BFB0 = 0;
            self _meth_80C0( 0 );
            self _meth_80BF( 0 );
            self setclientomnvar( "ui_score_streak_cost", 0 );
            self setclientomnvar( "ui_score_streak_two_cost", 0 );
            self setclientomnvar( "ui_score_streak_three_cost", 0 );
            scripts\mp\hud_message::_id_10122( "KILLSTREAKS_SUPPORT_NO_WRAP" );
            return;
        }
    }

    self _meth_80C0( var_2 );
}

_id_7FEE()
{
    if ( self._id_110EE == _id_7FA2() && self._id_110F4 != "specialist" )
        var_0 = 0;
    else
        var_0 = self._id_110EE;

    foreach ( var_2 in self._id_A6AB )
    {
        var_3 = _id_817B( var_2 );

        if ( var_3 > var_0 )
            return var_2;
    }

    return undefined;
}

_id_12F2E( var_0 )
{
    if ( scripts\mp\utility\game::istrue( self._id_5FBD ) && scripts\mp\utility\game::_id_12D6( "specialty_support_killstreaks" ) )
    {
        self setclientomnvar( "ui_score_streak", 0 );
        self setclientomnvar( "ui_score_streak_two", 0 );
        self setclientomnvar( "ui_score_streak_three", 0 );
        self setclientomnvar( "ui_score_streak_cost", 0 );
        self setclientomnvar( "ui_score_streak_two_cost", 0 );
        self setclientomnvar( "ui_score_streak_three_cost", 0 );
        self setclientomnvar( "ui_score_streak", 0 );
        return;
    }

    var_1 = 0;

    if ( isdefined( self._id_A6AB ) )
    {
        foreach ( var_3 in self._id_A6AB )
        {
            if ( var_1 == 0 )
            {
                var_4 = _id_817B( var_3 );
                self setclientomnvar( "ui_score_streak_cost", var_4 );
                self setclientomnvar( "ui_score_streak", var_0 );
                var_1++;
                continue;
            }

            if ( var_1 == 1 )
            {
                var_4 = _id_817B( var_3 );
                self setclientomnvar( "ui_score_streak_two_cost", var_4 );
                self setclientomnvar( "ui_score_streak_two", var_0 );
                var_1++;
                continue;
            }

            var_4 = _id_817B( var_3 );
            self setclientomnvar( "ui_score_streak_three_cost", var_4 );
            self setclientomnvar( "ui_score_streak_three", var_0 );
        }
    }
}

_id_7FA2()
{
    var_0 = 0;

    foreach ( var_2 in self._id_A6AB )
    {
        var_3 = _id_817B( var_2 );

        if ( var_3 > var_0 )
            var_0 = var_3;
    }

    return var_0;
}

_id_12EBC()
{
    if ( !scripts\mp\utility\game::isreallyalive( self ) )
        return;

    var_0 = self.pers["killstreaks"];

    for ( var_1 = 0; var_1 <= 3; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( isdefined( var_2 ) && isdefined( var_2._id_110EA ) )
        {
            self setclientomnvar( "ui_score_streak_index_" + var_1, scripts\mp\utility\game::_id_7F44( var_2._id_110EA ) );
            self setclientomnvar( "ui_score_streak_available_" + var_1, var_0[var_1]._id_269A );
            continue;
        }

        self setclientomnvar( "ui_score_streak_index_" + var_1, 0 );
        self setclientomnvar( "ui_score_streak_available_" + var_1, 0 );
    }

    var_3 = _id_8111();

    if ( isdefined( var_3 ) )
        self setclientomnvar( "ui_score_streak_selected_slot", var_3 );
    else
        self setclientomnvar( "ui_score_streak_selected_slot", -1 );
}

_id_A6B8()
{
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self notify( "killstreakTeamChangeWatcher" );
    self endon( "killstreakTeamChangeWatcher" );

    for (;;)
    {
        self waittill( "joined_team" );
        _id_41C0();
    }
}

_id_A6BA()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "spawned" );
    level endon( "game_ended" );
    self notify( "killstreakTriggeredWatcher" );
    self endon( "killstreakTriggeredWatcher" );

    for (;;)
    {
        var_0 = scripts\engine\utility::_id_13734( "ks_action_3", "ks_action_4", "ks_action_5", "ks_action_6" );
        var_1 = _id_81D9( var_0 );

        if ( !isdefined( var_1 ) )
            continue;

        var_2 = _id_7F45( var_1 );

        if ( !isdefined( var_2 ) || !var_2._id_269A )
            continue;

        if ( !scripts\engine\utility::_id_9FBE() )
        {
            scripts\mp\hud_message::_id_10122( "KILLSTREAKS_CANNOT_BE_USED", undefined );
            continue;
        }

        if ( isdefined( var_2.weapon ) )
        {
            var_3 = _id_392B( var_2.weapon, var_2 );

            if ( isdefined( var_3 ) )
            {
                var_4 = undefined;

                if ( var_3 == "KILLSTREAKS_UNAVAILABLE_FOR_N" )
                    var_4 = level._id_A6AA - ( level._id_8487 - level.ingraceperiod );

                scripts\mp\hud_message::_id_10122( var_3, var_4 );
                continue;
            }
        }

        if ( isdefined( self._id_13111 ) )
        {
            self notify( "killstreak_trigger_blocked", var_2 );
            continue;
        }

        var_5 = var_2._id_110F1;

        if ( isdefined( var_5._id_127BD ) )
        {
            if ( !self [[ var_5._id_127BD ]]( var_2 ) )
                continue;
        }

        self._id_AA35 = var_2;

        if ( !scripts\engine\utility::_id_9C70() )
            _id_F837( var_1 );

        if ( var_2._id_EF88 == "no_fire_weapon" )
            thread _id_127C7( var_2.weapon, var_2, 1 );
        else if ( var_2._id_EF88 == "gesture_script_weapon" )
            self _meth_84FF( var_2.weapon );
        else if ( isdefined( var_2.weapon ) && var_2.weapon != "none" )
            thread _id_127C7( var_2.weapon, var_2 );
        else
        {
            var_1 = _id_8111();
            thread _id_A69A( var_2 );
        }

        var_6 = int( tablelookup( "mp/killstreaktable.csv", 1, var_2._id_110EA, 4 ) );

        if ( var_6 >= 1000 )
        {
            var_7 = tablelookup( "mp/killstreaktable.csv", 1, var_2._id_110EA, 0 );

            if ( var_7 != "" )
            {
                var_8 = int( var_7 );
                scripts\mp\utility\game::_id_F79E( 20, self.team, self getentitynumber(), var_8 );
            }
        }
    }
}

_id_81D9( var_0 )
{
    var_1 = undefined;

    if ( !isai( self ) && scripts\engine\utility::_id_9C70() )
    {
        if ( var_0 == "ks_action_4" )
            var_1 = _id_8111();
    }
    else if ( level.gametype == "grnd" && !scripts\engine\utility::_id_9C70() )
    {
        switch ( var_0 )
        {
            case "ks_action_3":
                var_1 = 0;
                break;
            case "ks_action_4":
                var_1 = 0;
                break;
            case "ks_action_5":
                var_1 = 0;
                break;
            case "ks_action_6":
                var_1 = 0;
                break;
        }
    }
    else
    {
        switch ( var_0 )
        {
            case "ks_action_3":
                var_1 = 1;
                break;
            case "ks_action_4":
                var_1 = 2;
                break;
            case "ks_action_5":
                var_1 = 3;
                break;
            case "ks_action_6":
                var_1 = 0;
                break;
        }
    }

    return var_1;
}

_id_392B( var_0, var_1 )
{
    if ( scripts\mp\utility\game::_id_10060( var_1._id_110EA ) )
    {
        if ( isdefined( level._id_A6AA ) && level._id_A6AA > 0 )
        {
            if ( level._id_8487 - level.ingraceperiod < level._id_A6AA )
                return "KILLSTREAKS_UNAVAILABLE_FOR_N";
        }
    }

    if ( self hasweapon( var_0 ) )
        return "KILLSTREAKS_CANNOT_BE_USED";

    if ( self isonladder() )
        return "KILLSTREAKS_CANNOT_BE_USED";

    if ( self _meth_81AD() )
        return "KILLSTREAKS_CANNOT_BE_USED";

    if ( !scripts\engine\utility::_id_A009() )
        return "KILLSTREAKS_CANNOT_BE_USED";

    if ( scripts\mp\utility\game::_id_9FAE( self ) )
        return "KILLSTREAKS_CANNOT_BE_USED";

    if ( ( scripts\mp\utility\game::_id_9F2C( var_1._id_110EA ) || scripts\mp\utility\game::_id_9E90( var_1._id_110EA ) ) && ( !self isonground() || self iswallrunning() ) )
        return "KILLSTREAKS_CANNOT_BE_USED";

    return;
}

_id_127C7( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );

    if ( self hasweapon( var_0 ) )
        return 0;

    self.tryingtousekillstreak = 1;
    thread triggerkillstreakweaponwatchdeath();
    scripts\mp\supers::_id_1CAB();
    scripts\mp\utility\game::_id_12C6( var_0, 0, 0, 1 );
    var_3 = var_1._id_110F1;

    if ( isdefined( var_3._id_13C8D ) )
    {
        var_4 = self [[ var_3._id_13C8D ]]( var_1 );

        if ( isdefined( var_4 ) && var_4 == 0 )
        {
            scripts\mp\utility\game::_id_141E( var_0 );
            self.tryingtousekillstreak = undefined;
            self notify( "stopTryingToUseKillstreak" );
            return;
        }
    }

    var_5 = scripts\mp\utility\game::_id_11383( var_0 );

    if ( isdefined( var_3._id_13CD6 ) )
        self [[ var_3._id_13CD6 ]]( var_1, var_5 );

    if ( var_5 )
    {
        if ( scripts\mp\utility\game::istrue( var_2 ) )
            thread _id_510E( 0.05, var_1 );

        self waittill( "killstreak_finished_with_weapon_" + var_0 );
    }

    self.tryingtousekillstreak = undefined;
    self notify( "stopTryingToUseKillstreak" );

    if ( self hasweapon( var_0 ) )
    {
        scripts\mp\supers::_id_12D6C();
        scripts\mp\utility\game::_id_80F2( var_0 );

        if ( self getcurrentweapon() == "none" )
            scripts\mp\utility\game::_id_141A( self._id_A978 );
    }

    if ( isdefined( var_3._id_13CDB ) )
        self [[ var_3._id_13CDB ]]( var_1 );
}

triggerkillstreakweaponwatchdeath()
{
    self endon( "disconnect" );
    self endon( "stopTryingToUseKillstreak" );
    self waittill( "death" );
    self.tryingtousekillstreak = undefined;
}

_id_510E( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    wait( var_0 );
    thread _id_A69A( var_1 );
}

_id_13B96( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    self endon( "killstreak_finished_with_weapon" );

    for (;;)
    {
        if ( self getcurrentweapon() != var_0 )
        {
            self notify( "killstreak_finished_with_weapon_" + var_0 );
            break;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_A69C()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "spawned" );
    level endon( "game_ended" );
    self notify( "killstreakFiredWatcher_offhand" );
    self endon( "killstreakFiredWatcher_offhand" );

    for (;;)
    {
        self waittill( "offhand_fired", var_0 );
        thread _id_128A4( var_0, "offhand_fired" );
    }
}

_id_A69B()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "spawned" );
    level endon( "game_ended" );
    self notify( "killstreakFiredWatcher_grenade" );
    self endon( "killstreakFiredWatcher_grenade" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );
        thread _id_128A4( var_1, "grenade_fire", var_0 );
    }
}

_id_A69D()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "joined_team" );
    self endon( "faux_spawn" );
    self endon( "spawned" );
    level endon( "game_ended" );
    self notify( "killstreakFiredWatcher_weaponFired" );
    self endon( "killstreakFiredWatcher_weaponFired" );

    for (;;)
    {
        self waittill( "weapon_fired", var_0 );
        thread _id_128A4( var_0, "weapon_fired" );
    }
}

_id_128A4( var_0, var_1, var_2 )
{
    var_3 = _id_7F61();

    if ( !isdefined( var_3 ) )
        return;

    if ( var_3.weapon != var_0 )
        return;

    var_4 = self.pers["killstreaks"];
    var_5 = undefined;

    for ( var_6 = 0; var_6 < 36; var_6++ )
    {
        if ( !isdefined( var_4[var_6] ) )
        {
            if ( var_6 >= 4 )
                break;
            else
                continue;
        }

        if ( var_4[var_6] == var_3 )
        {
            var_5 = var_6;
            break;
        }
    }

    if ( !isdefined( var_5 ) )
        return;

    if ( var_3._id_6D6B == var_1 )
        thread _id_A69A( var_3, var_2 );
}

_id_9E6B( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "jammer":
        case "dronedrop":
        case "directional_uav":
        case "counter_uav":
        case "uav":
            return 0;
        default:
            return 1;
    }
}

_id_A69A( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    var_2 = var_0._id_110F1;

    if ( !scripts\mp\utility\game::_id_1314A( var_0._id_110EA ) )
    {
        if ( isdefined( var_2._id_9B12 ) )
            self [[ var_2._id_9B12 ]]( var_0 );

        if ( isdefined( var_0.weapon ) && var_0.weapon != "none" )
            self notify( "killstreak_finished_with_weapon_" + var_0.weapon );

        return 0;
    }

    if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
    {
        if ( _id_9E6B( var_0._id_110EA ) )
            self _meth_80C3( 1 );
    }

    self._id_13111 = var_0;
    var_3 = 1;

    if ( isdefined( var_2._id_13089 ) )
        var_3 = self [[ var_2._id_13089 ]]( var_0 );

    var_4 = 1;

    if ( isdefined( var_2._id_130C4 ) )
        var_4 = self [[ var_2._id_130C4 ]]( var_0, var_1 );

    self notify( "killstreak_use_finished", var_0._id_110EA, var_3 );
    self._id_13111 = undefined;

    if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
        self _meth_80C3( 0 );

    if ( !var_3 || !var_4 )
        return 0;

    _id_C5A9( var_0 );
}

_id_729F( var_0, var_1 )
{
    var_2 = _id_4A1C( var_0, var_1 );
    _id_A69A( var_2 );
}

_id_729E()
{
    var_0 = _id_7F45( 0 );
    _id_A69A( var_0, 0 );
}

_id_C5A9( var_0 )
{
    var_1 = var_0._id_110EA;
    var_2 = _id_6CBA( var_0 );
    var_0._id_269A = 0;

    if ( isdefined( var_2 ) )
    {
        if ( var_2 == 0 || var_2 >= 4 )
            _id_E131( var_2 );

        _id_F1CB();
    }
    else
    {

    }

    thread _id_0AC7::_id_89BC( var_0 );
    thread scripts\mp\missions::_id_13079( var_1 );
    scripts\mp\utility\game::_id_D915( "killstreak started - " + var_1, self );
    self notify( "killstreak_used", var_1 );
    scripts\mp\utility\game::_id_D4B7( var_1 );
    var_6 = gettime() - var_0._id_B143;
    scripts\mp\analyticslog::_id_AFA3( var_1, var_6 );
    combatrecordkillstreakuse( var_1 );
}

_id_DDF0( var_0 )
{
    if ( isdefined( self._id_4006 ) )
    {
        if ( self getrankedplayerdata( level._id_AEA6, "squadMembers", "killstreakSetups", 0, "killstreak" ) == var_0 )
            self._id_6DEB = gettime();
        else if ( self getrankedplayerdata( level._id_AEA6, "squadMembers", "killstreakSetups", 2, "killstreak" ) == var_0 && isdefined( self._id_6DEB ) )
        {
            if ( gettime() - self._id_6DEB < 20000 )
                thread scripts\mp\missions::_id_D992( "wargasm" );
        }
    }
}

_id_4A1C( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3._id_269A = 0;
    var_3._id_110EA = var_0;
    var_3._id_9E0B = 0;
    var_3._id_FFC4 = 0;
    var_3.owner = var_1;
    var_3._id_A5B0 = _id_81ED( self );
    var_3._id_AC68 = self.pers["deaths"];
    var_3._id_9E10 = 0;
    var_3._id_9F6E = 0;
    var_3.weapon = scripts\mp\utility\game::_id_7F55( var_0 );
    var_3._id_6D6B = _id_7F41( var_0 );
    var_3._id_110F1 = _id_7F50( var_0 );
    var_3._id_EF88 = scripts\mp\utility\game::_id_7F4F( var_0 );
    var_3._id_B143 = -1;
    var_3._id_1318B = var_2;
    return var_3;
}

_id_81ED( var_0 )
{
    if ( !isdefined( var_0.pers["nextKillstreakID"] ) )
        var_0.pers["nextKillstreakID"] = 0;

    var_1 = var_0.pers["nextKillstreakID"];
    var_0.pers["nextKillstreakID"]++;
    return var_1;
}

_id_26D4( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_4A1C( var_0, var_1, var_3 );
    _id_26D5( var_4, var_2 );
}

_id_26D5( var_0, var_1 )
{
    var_0._id_9E10 = 1;

    if ( isdefined( var_1 ) && var_1.size > 0 )
        _id_0AC7::_id_988A( var_0, var_1 );

    _id_1030D( var_0, 0 );
    _id_F837( 0 );
    _id_B2A9( 0 );
}

_id_6693( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return;

    var_4 = _id_4A1C( var_0, self, var_3 );
    var_4._id_9E0B = 1;
    var_4._id_FFC4 = 1;

    if ( isdefined( var_2 ) && var_2.size > 0 )
        _id_0AC7::_id_988A( var_4, var_2 );

    _id_1030D( var_4, var_1 );
}

_id_66B9( var_0, var_1, var_2 )
{
    _id_6693( var_0, 1, var_1, var_2 );
}

_id_66BB( var_0, var_1, var_2 )
{
    _id_6693( var_0, 2, var_1, var_2 );
}

_id_66BA( var_0, var_1, var_2 )
{
    _id_6693( var_0, 3, var_1, var_2 );
}

_id_DB1C()
{
    var_0 = self.pers["killstreaks"];

    if ( isdefined( var_0[35] ) )
        return 0;

    var_1 = var_0[0];

    if ( !isdefined( var_1 ) )
        return 1;

    for ( var_2 = 4; var_2 < 36; var_2++ )
    {
        if ( !isdefined( var_0[var_2] ) )
        {
            var_0[var_2] = var_1;
            var_0[0] = undefined;
            break;
        }
    }

    self.pers["killstreaks"] = var_0;
    return 1;
}

_id_D65E()
{
    var_0 = self.pers["killstreaks"];
    var_1 = var_0[0];
    var_2 = undefined;
    var_3 = undefined;

    for ( var_4 = 4; var_4 < 36; var_4++ )
    {
        var_5 = var_0[var_4];

        if ( isdefined( var_5 ) )
        {
            var_2 = var_5;
            var_3 = var_4;
            continue;
        }

        break;
    }

    self.pers["killstreaks"][0] = var_2;

    if ( isdefined( var_3 ) )
        self.pers["killstreaks"][var_3] = undefined;
}

_id_51D3( var_0 )
{
    if ( var_0 == 35 )
    {
        self.pers["killstreaks"][var_0] = undefined;
        return;
    }

    var_1 = self.pers["killstreaks"];

    for ( var_2 = var_0; var_2 < 35; var_2++ )
    {
        var_3 = var_1[var_2 + 1];

        if ( !isdefined( var_3 ) )
            break;

        var_1[var_0] = var_3;
    }

    self.pers["killstreaks"] = var_1;
}

_id_E131( var_0 )
{
    self.pers["killstreaks"][var_0] = undefined;

    if ( var_0 == 0 )
        _id_D65E();
    else if ( var_0 >= 4 )
        _id_51D3( var_0 );
}

_id_41C0()
{
    self.pers["killstreaks"] = [];
    _id_E275();
    _id_41C1();
    _id_12EBC();
}

_id_1030D( var_0, var_1 )
{
    if ( var_1 == 0 )
    {
        if ( !_id_DB1C() )
            return;
    }
    else
    {

    }

    self.pers["killstreaks"][var_1] = var_0;
    _id_12EBC();
}

_id_5FBF( var_0, var_1 )
{
    var_2 = _id_7F45( var_0 );
    var_3 = var_2._id_110EA;
    scripts\mp\utility\game::_id_316C( "earned_killstreak_buffered", var_3 );
    self._id_5FBE = var_1;

    if ( scripts\mp\utility\game::_id_12D6( "specialty_support_killstreaks" ) )
        self.pers["killstreaks"][var_0]._id_5FB9 = 1;

    if ( !level._id_7669 )
    {
        var_4 = var_3;
        var_5 = _id_0AC7::getrarityforlootitem( var_2._id_1318B );

        if ( var_5 != "" )
            var_4 = var_4 + "_" + var_5;

        thread scripts\mp\hud_message::_id_10134( var_4, var_1 );
    }

    if ( scripts\mp\utility\game::_id_12D6( "specialty_support_killstreaks" ) )
        scripts\mp\missions::_id_D991( "ch_trait_support" );

    _id_DDF0( var_3 );
    _id_F866();
    _id_B2A9( var_0 );
}

_id_B2A9( var_0 )
{
    var_1 = _id_7F45( var_0 );

    if ( !isdefined( var_1 ) )
        return;

    var_2 = var_1._id_110EA;
    var_3 = var_1._id_110F1;

    if ( self.team == "spectator" )
        return;

    var_1._id_269A = 1;

    if ( var_0 >= 0 && var_0 <= 3 )
        _id_F837( var_0 );

    _id_12EBC();

    if ( isdefined( var_3._id_26A2 ) )
        self [[ var_3._id_26A2 ]]( var_1 );

    if ( isdefined( var_1._id_9E0B ) && var_1._id_9E0B && isdefined( var_1._id_FFC4 ) && var_1._id_FFC4 )
        self notify( "received_earned_killstreak" );

    var_1._id_B143 = gettime();
    var_4 = scripts\mp\utility\game::_id_7F44( var_2 );
    scripts\mp\analyticslog::_id_AFA4( var_4, var_1._id_B143 );
    scripts\mp\matchdata::_id_AFC8( var_2 );
}

_id_8374( var_0, var_1, var_2, var_3 )
{
    _id_26D4( var_0, var_3 );
}

_id_817B( var_0 )
{
    var_1 = int( scripts\mp\utility\game::_id_7F46( var_0 ) );

    if ( isdefined( self ) && isplayer( self ) )
    {
        var_1 = _id_0AC7::modifycostforlootitem( self.streakvariantids[var_0], var_1 );

        if ( scripts\mp\utility\game::_id_9F6F( var_0 ) )
        {
            if ( isdefined( self.pers["gamemodeLoadout"] ) )
            {
                if ( isdefined( self.pers["gamemodeLoadout"]["loadoutKillstreak1"] ) && self.pers["gamemodeLoadout"]["loadoutKillstreak1"] == var_0 )
                    var_1 = 2;
                else if ( isdefined( self.pers["gamemodeLoadout"]["loadoutKillstreak2"] ) && self.pers["gamemodeLoadout"]["loadoutKillstreak2"] == var_0 )
                    var_1 = 4;
                else if ( isdefined( self.pers["gamemodeLoadout"]["loadoutKillstreak3"] ) && self.pers["gamemodeLoadout"]["loadoutKillstreak3"] == var_0 )
                    var_1 = 6;
                else
                {

                }
            }
            else if ( issubstr( self._id_4B1C, "custom" ) )
            {
                for ( var_2 = 0; var_2 < 3; var_2++ )
                {
                    var_3 = self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", self._id_4006, "specialistStreaks", var_2 );

                    if ( var_3 == var_0 )
                        break;
                }

                if ( var_2 == 1 )
                    var_1 = 500;
                else if ( var_2 == 2 )
                    var_1 = 800;
            }
            else if ( issubstr( self._id_4B1C, "callback" ) )
            {
                var_2 = 0;

                foreach ( var_2, var_5 in self.pers["specialistStreaks"] )
                {
                    if ( var_5 == var_0 )
                        break;
                }

                var_1 = self.pers["specialistStreakKills"][var_2];
            }
            else if ( issubstr( self._id_4B1C, "axis" ) || issubstr( self._id_4B1C, "allies" ) )
            {
                var_2 = 0;
                var_6 = "none";

                if ( issubstr( self._id_4B1C, "axis" ) )
                    var_6 = "axis";
                else if ( issubstr( self._id_4B1C, "allies" ) )
                    var_6 = "allies";

                for ( var_7 = scripts\mp\utility\game::_id_7E2B( self._id_4B1C ); var_2 < 3; var_2++ )
                {
                    var_3 = scripts\mp\utility\game::_id_7F91( "defaultClasses", var_6, var_7, "class", "specialistStreaks", var_2 );

                    if ( var_3 == var_0 )
                        break;
                }

                var_1 = scripts\mp\utility\game::_id_7F91( "defaultClasses", var_6, var_7, "class", "specialistStreakKills", var_2 );
            }
        }
    }

    var_1 = int( clamp( var_1, 0, 7000 ) );
    return var_1;
}

_id_8057( var_0, var_1 )
{
    var_2 = 0;

    if ( scripts\mp\utility\game::_id_12D6( "specialty_support_killstreaks" ) )
    {
        var_3 = scripts\mp\utility\game::_id_7F44( var_0 );
        var_2 = 175 * var_3;
    }

    return var_2;
}

_id_A6B0()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = scripts\engine\utility::_id_13734( "ks_select_up", "ks_select_down" );

        if ( !scripts\engine\utility::_id_9C70() )
            continue;

        if ( !scripts\mp\utility\game::isjuggernaut() && !scripts\mp\utility\game::istrue( self._id_9D81 ) && !isdefined( self._id_13111 ) )
        {
            var_1 = _id_8111();

            if ( !isdefined( var_1 ) )
                continue;

            var_2 = var_1;

            if ( var_0 == "ks_select_up" )
                var_2 = _id_7FED( var_1 );
            else if ( var_0 == "ks_select_down" )
                var_2 = _id_8099( var_1 );
            else
            {

            }

            _id_F837( var_2 );
        }
    }
}

_id_F1C5()
{
    var_0 = self.pers["killstreaks"];

    for ( var_1 = 3; var_1 >= 0; var_1-- )
    {
        var_2 = var_0[var_1];

        if ( isdefined( var_2 ) && var_2._id_269A )
        {
            _id_F837( var_1 );
            return;
        }
    }

    _id_41C1();
}

_id_7FED( var_0 )
{
    var_1 = self.pers["killstreaks"];
    var_2 = var_0;
    var_3 = scripts\engine\utility::ter_op( var_0 >= 3, 0, var_0 + 1 );
    var_4 = var_0;
    var_5 = var_3;

    while ( var_5 != var_4 )
    {
        var_6 = var_1[var_5];

        if ( isdefined( var_6 ) && var_6._id_269A )
        {
            var_2 = var_5;
            break;
        }

        var_5++;

        if ( var_5 > 3 )
            var_5 = 0;
    }

    return var_2;
}

_id_8099( var_0 )
{
    var_1 = self.pers["killstreaks"];
    var_2 = var_0;
    var_3 = scripts\engine\utility::ter_op( var_0 <= 0, 3, var_0 - 1 );
    var_4 = var_0;
    var_5 = var_3;

    while ( var_5 != var_4 )
    {
        var_6 = var_1[var_5];

        if ( isdefined( var_6 ) && var_6._id_269A )
        {
            var_2 = var_5;
            break;
        }

        var_5--;

        if ( var_5 < 0 )
            var_5 = 3;
    }

    return var_2;
}

_id_F1CB()
{
    var_0 = self.pers["killstreaks"];
    var_1 = undefined;
    var_2 = -1;

    for ( var_3 = 3; var_3 >= 0; var_3-- )
    {
        var_4 = var_0[var_3];

        if ( isdefined( var_4 ) && var_4._id_269A )
        {
            var_5 = _id_817B( var_4._id_110EA );

            if ( var_5 > var_2 )
            {
                var_1 = var_3;
                var_2 = var_5;
            }
        }
    }

    if ( !isdefined( var_1 ) )
    {
        _id_41C1();
        return;
    }

    _id_F837( var_1 );
}

_id_F837( var_0 )
{
    var_1 = _id_7F45( var_0 );
    self._id_4C02 = var_0;
    _id_12EBC();
}

_id_41C1()
{
    self._id_4C02 = undefined;
    _id_12EBC();
}

_id_8110()
{
    var_0 = _id_8111();

    if ( !isdefined( var_0 ) )
        return undefined;

    return self.pers["killstreaks"][var_0];
}

_id_8111()
{
    return self._id_4C02;
}

_id_7F45( var_0 )
{
    return self.pers["killstreaks"][var_0];
}

_id_7E9E( var_0 )
{
    var_1 = self.pers["killstreaks"];

    for ( var_2 = 1; var_2 <= 3; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( isdefined( var_3 ) && var_3._id_110EA == var_0 )
            return var_3;
    }

    return undefined;
}

_id_7E9F( var_0 )
{
    var_1 = self.pers["killstreaks"];

    for ( var_2 = 1; var_2 <= 3; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( isdefined( var_3 ) && var_3._id_110EA == var_0 )
            return var_2;
    }

    return undefined;
}

_id_8207( var_0 )
{
    var_1 = self.pers["killstreaks"];

    for ( var_2 = 0; var_2 <= 3; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( isdefined( var_3 ) && var_3._id_110EA == var_0 && var_3._id_269A )
            return var_2;
    }

    return undefined;
}

_id_7F54( var_0 )
{
    var_1 = self.pers["killstreaks"];

    for ( var_2 = 0; var_2 <= 3; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( isdefined( var_3 ) && var_3._id_110EA == var_0 )
            return var_2;
    }

    return undefined;
}

_id_7ED6()
{
    var_0 = [];
    var_1 = self.pers["killstreaks"];
    var_2 = _id_7F45( 0 );

    if ( isdefined( var_2 ) )
    {
        var_0[0] = var_2;

        for ( var_3 = 4; var_3 < 36; var_3++ )
        {
            var_4 = var_1[var_3];

            if ( isdefined( var_4 ) )
            {
                var_0[var_0.size] = var_4;
                continue;
            }

            break;
        }
    }

    return var_0;
}

_id_7DE7()
{
    var_0 = [];
    var_1 = self.pers["killstreaks"];

    if ( var_1.size )
    {
        for ( var_2 = 1; var_2 < 4; var_2++ )
        {
            var_3 = var_1[var_2];

            if ( isdefined( var_3 ) && isdefined( var_3._id_110EA ) && var_3._id_269A )
                var_0[var_0.size] = var_3;
        }
    }

    return var_0;
}

registerkillstreak( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !isdefined( level._id_A6B2 ) )
        level._id_A6B2 = [];

    var_9 = spawnstruct();
    level._id_A6B2[var_0] = var_9;
    var_9._id_13089 = var_1;
    var_9._id_130C4 = var_2;
    var_9._id_26A2 = var_3;
    var_9._id_127BD = var_4;
    var_9._id_13C8D = var_5;
    var_9._id_13CDB = var_6;
    var_9._id_9B12 = var_7;
    var_9._id_13CD6 = var_8;
}

_id_7F50( var_0 )
{
    var_1 = level._id_A6B2[var_0];
    return var_1;
}

_id_7F41( var_0 )
{
    if ( var_0 == "none" )
        return "";

    var_1 = scripts\mp\utility\game::_id_7F4F( var_0 );

    if ( !isdefined( var_1 ) || var_1 == "" )
        return "";

    switch ( var_1 )
    {
        case "script_weapon":
        case "gesture_script_weapon":
            return "offhand_fired";
        case "grenade_weapon":
            return "grenade_fire";
        case "normal_weapon":
            return "weapon_fired";
        case "no_weapon":
        case "no_fire_weapon":
            return "";
        default:
            return "";
    }

    return "";
}

_id_7F61()
{
    return self._id_AA35;
}

_id_3E4E( var_0 )
{
    foreach ( var_2 in self._id_A6AB )
    {
        var_3 = _id_817B( var_2 );
        var_4 = _id_7E9F( var_2 );
        var_5 = _id_7F45( var_4 );

        if ( self._id_D8B3 < var_3 && var_0 >= var_3 )
        {
            if ( scripts\mp\utility\game::_id_12D6( "specialty_support_killstreaks" ) && scripts\mp\utility\game::istrue( self.pers["killstreaks"][var_4]._id_5FB9 ) )
                continue;

            _id_5FBF( var_4, var_3 );
        }
    }
}

_id_213F( var_0 )
{
    var_1 = self.pers["killstreaks"];

    if ( !isdefined( var_1 ) )
        return 0;

    foreach ( var_3 in var_0 )
    {
        var_4 = 0;

        for ( var_5 = 1; var_5 <= 3; var_5++ )
        {
            var_6 = var_1[var_5];

            if ( isdefined( var_6 ) )
            {
                if ( isdefined( var_6._id_110EA ) )
                {
                    if ( var_6._id_110EA == var_3 )
                    {
                        var_4 = 1;
                        break;
                    }
                }
            }
            else if ( var_3 == "none" )
            {
                var_4 = 1;
                break;
            }
        }

        if ( !var_4 )
            return 0;
    }

    return 1;
}

_id_6CBA( var_0 )
{
    var_1 = self.pers["killstreaks"];

    for ( var_2 = 0; var_2 <= 36; var_2++ )
    {
        var_3 = var_1[var_2];

        if ( !isdefined( var_3 ) )
        {
            if ( var_2 >= 4 )
                break;
        }
        else if ( var_0 == var_3 )
            return var_2;
    }

    return undefined;
}

_id_83A7( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = scripts\mp\rank::getscoreinfovalue( var_0 );

    if ( var_1 == 0 )
        return;

    var_2 = self._id_110EE + var_1;
    var_3 = var_2;
    var_4 = _id_7FA2();

    if ( var_3 >= var_4 )
        var_3 -= var_4;

    _id_F867( var_3 );
    _id_3E4E( var_2 );

    if ( var_2 >= var_4 )
        _id_F867( var_3 );

    _id_12F2E( var_3 );
    scripts\mp\analyticslog::_id_AFAE( var_1, gettime(), scripts\mp\rank::getscoreinfocategory( var_0, "eventID" ) );
}

_id_E275()
{
    self._id_5FBE = 0;
    _id_F867( 0 );
    _id_E274();
    _id_12F2E( 0 );
}

_id_F867( var_0 )
{
    if ( var_0 < 0 )
        var_0 = 0;

    if ( isdefined( self._id_110EE ) )
        self._id_D8B3 = self._id_110EE;
    else
        self._id_D8B3 = 0;

    self._id_110EE = var_0;
    _id_12F2F();
}

_id_110C3()
{
    self endon( "disconnect" );
    level waittill( "game_ended" );
    scripts\mp\utility\game::_id_F7DF( "streakPoints", scripts\engine\utility::ter_op( isdefined( self._id_110EE ), self._id_110EE, 0 ) );
}

_id_6CCB( var_0, var_1, var_2, var_3 )
{
    var_4 = rotatevector( ( 0, 0, 1 ), ( -1 * var_3, 0, 0 ) );
    var_5 = vectortoangles( var_1 - var_0.origin );

    for ( var_6 = 0; var_6 < 360; var_6 += 30 )
    {
        var_7 = var_2 * rotatevector( var_4, ( 0, var_6 + var_5[1], 0 ) );
        var_8 = var_1 + var_7;

        if ( _id_1281( var_0, var_8, var_1 ) )
            return var_8;
    }

    return undefined;
}

_id_6CCA( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = vectortoangles( var_0.origin - var_1 );

    for ( var_7 = var_3; var_7 <= var_4; var_7 += var_5 )
    {
        var_8 = rotatevector( ( 1, 0, 0 ), ( var_7 - 90, 0, 0 ) );
        var_9 = var_2 * rotatevector( var_8, ( 0, var_6[1], 0 ) );
        var_10 = var_1 + var_9;

        if ( _id_1281( var_0, var_10, var_1 ) )
            return var_10;
    }

    return undefined;
}

_id_1281( var_0, var_1, var_2 )
{
    var_3 = bullettrace( var_1, var_2, 0 );

    if ( var_3["fraction"] > 0.99 )
        return 1;

    return 0;
}

_id_6CC9( var_0, var_1, var_2 )
{
    var_3 = _id_6CCB( var_0, var_1, var_2, 30 );

    if ( !isdefined( var_3 ) )
        var_3 = _id_6CCA( var_0, var_1, var_2, 15, 75, 15 );

    return var_3;
}

_id_9FC3()
{
    return isdefined( self._id_C53B ) && self._id_C53B;
}

_id_9FC4()
{
    return isdefined( self._id_98FF ) && self._id_98FF;
}

_id_532A( var_0, var_1, var_2, var_3 )
{
    var_4 = "MOD_EXPLOSIVE";
    var_5 = 5000;
    var_6 = ( 0, 0, 0 );
    var_7 = ( 0, 0, 0 );
    var_8 = "";
    var_9 = "";
    var_10 = "";
    var_11 = undefined;

    if ( !isdefined( var_3 ) )
        return;

    if ( level.teambased )
    {
        foreach ( var_13 in var_3 )
        {
            if ( scripts\mp\utility\game::_id_9FE7( var_0, var_1, var_13 ) )
            {
                var_13 notify( "damage", var_5, var_0, var_6, var_7, var_4, var_8, var_9, var_10, var_11, var_2 );
                wait 0.05;
            }
        }
    }
    else
    {
        foreach ( var_13 in var_3 )
        {
            if ( scripts\mp\utility\game::_id_9FD8( var_0, var_1, var_13 ) )
            {
                var_13 notify( "damage", var_5, var_0, var_6, var_7, var_4, var_8, var_9, var_10, var_11, var_2 );
                wait 0.05;
            }
        }
    }
}

_id_A6A0( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_1 ) && isplayer( var_0 ) && isdefined( var_2.owner ) && isdefined( var_2.owner.team ) )
    {
        if ( scripts\mp\utility\game::playersareenemies( var_0, var_2.owner ) )
        {
            if ( scripts\mp\utility\game::_id_9E6C( var_1 ) )
                return;

            if ( !isdefined( var_0._id_A99F[var_1] ) )
                var_0._id_A99F[var_1] = 0;

            if ( var_0._id_A99F[var_1] == gettime() )
                return;

            var_0._id_A99F[var_1] = gettime();
            var_0 thread scripts\mp\gamelogic::_id_117B7( var_1, 1, "hits" );
            var_4 = var_0 scripts\mp\persistence::_id_10E34( "totalShots" );
            var_5 = var_0 scripts\mp\persistence::_id_10E34( "hits" ) + 1;

            if ( var_5 <= var_4 )
            {
                var_0 scripts\mp\persistence::_id_10E55( "hits", var_5 );
                var_0 scripts\mp\persistence::_id_10E55( "misses", int( var_4 - var_5 ) );
                var_0 scripts\mp\persistence::_id_10E55( "accuracy", int( var_5 * 10000 / var_4 ) );
            }

            if ( isdefined( var_3 ) && scripts\engine\utility::_id_9D74( var_3 ) || scripts\mp\utility\game::isprojectiledamage( var_3 ) )
            {
                var_0 thread scripts\mp\contractchallenges::contractshotslanded( var_1 );
                var_0._id_A96A = gettime();
                var_6 = scripts\mp\utility\game::_id_8225( var_1 );

                if ( var_6 == "weapon_lmg" )
                {
                    if ( !isdefined( var_0.shotslandedlmg ) )
                        var_0.shotslandedlmg = 1;
                    else
                        var_0.shotslandedlmg++;
                }
            }
        }
    }
}

_id_83A0()
{
    thread scripts\mp\utility\game::_id_83B4( "destroyed_equipment" );
}

_id_83A1()
{
    thread scripts\mp\utility\game::_id_83B4( "trophy_defense" );
}

_id_839F()
{
    thread scripts\mp\utility\game::_id_83B4( "blackhat_hack" );
}

_id_9E9F( var_0 )
{
    return var_0 == "iw6_minigunjugg_mp";
}

_id_110F5( var_0 )
{
    switch ( var_0 )
    {
        case "assault":
        case "specialist":
            return 1;
        case "resource":
        case "support":
            return 0;
        default:
            return 1;
    }
}

_id_98C2( var_0 )
{
    scripts\engine\utility::_id_1C6E( 0 );
    var_1 = _id_98C3( var_0 );

    if ( isdefined( self ) )
        scripts\engine\utility::_id_1C6E( 1 );

    return var_1;
}

_id_98C3( var_0 )
{
    if ( isdefined( var_0 ) && _id_9E6F( var_0 ) )
        var_1 = "timeout";
    else
        var_1 = scripts\engine\utility::_id_13736( 1.0, "disconnect", "death", "weapon_switch_started" );

    scripts\mp\hostmigration::waittillhostmigrationdone();

    if ( var_1 == "weapon_switch_started" )
        return "fail";

    if ( !isalive( self ) )
        return "fail";

    if ( var_1 == "disconnect" || var_1 == "death" )
    {
        if ( var_1 == "disconnect" )
            return "disconnect";

        if ( self.team == "spectator" )
            return "fail";

        return "success";
    }

    if ( scripts\mp\utility\game::_id_9E68() )
        return "fail";

    if ( !isdefined( var_0 ) || !issubstr( var_0, "odin" ) || !issubstr( var_0, "pointSelect" ) )
    {
        if ( var_0 == "orbital_deployment" || var_0 == "drone_hive" )
        {
            self _meth_83F8( "black_bw", 0 );
            thread scripts\mp\utility\game::_id_F607( "black_bw", 0, 1.0, undefined, 1 );
            var_2 = scripts\engine\utility::_id_13736( 0, "disconnect", "death" );
        }
        else
        {
            self _meth_83F8( "black_bw", 0.75 );
            thread scripts\mp\utility\game::_id_F607( "black_bw", 0.75, 1.0, undefined, 1 );
            var_2 = scripts\engine\utility::_id_13736( 0.8, "disconnect", "death" );
        }
    }
    else
        var_2 = scripts\engine\utility::_id_13736( 1.0, "disconnect", "death" );

    self notify( "black_out_done" );
    scripts\mp\hostmigration::waittillhostmigrationdone();

    if ( var_2 != "disconnect" )
    {
        if ( !isdefined( var_0 ) || !issubstr( var_0, "odin" ) || !issubstr( var_0, "pointSelect" ) )
            thread _id_41D6( 1.0 );
        else
            self notify( "intro_cleared" );

        if ( self.team == "spectator" )
            return "fail";
    }

    if ( self isonladder() )
        return "fail";

    if ( !isalive( self ) )
        return "fail";

    if ( scripts\mp\utility\game::_id_9E68() )
        return "fail";

    if ( var_2 == "disconnect" )
        return "disconnect";
    else
        return "success";
}

_id_9E6F( var_0 )
{
    switch ( var_0 )
    {
        case "remote_tank":
        case "remote_uav":
        case "osprey_gunner":
        case "pointSelect":
        case "orbital_deployment":
        case "ac130":
        case "ca_a10_strafe":
        case "vanguard":
        case "odin_assault":
        case "odin_support":
        case "heli_pilot":
        case "fleet_swarm":
        case "remote_c8":
        case "spiderbot":
        case "precision_airstrike":
        case "thor":
        case "minijackal":
        case "drone_hive":
            return 1;
    }

    return 0;
}

_id_41D6( var_0, var_1 )
{
    self endon( "disconnect" );

    if ( isdefined( var_0 ) )
        wait( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self _meth_83F8( "", var_1 );
    scripts\mp\utility\game::_id_F607( "", var_1 );
    self notify( "intro_cleared" );
}

_id_1CA5( var_0 )
{
    if ( isdefined( var_0 ) )
        self endon( var_0 );

    if ( !isdefined( self.owner ) )
        return;

    var_1 = self.owner;
    level endon( "game_ended" );
    var_1 endon( "disconnect" );
    var_1 endon( "end_remote" );
    self endon( "death" );

    for (;;)
    {
        var_2 = 0;

        while ( var_1 usebuttonpressed() )
        {
            var_2 += 0.05;

            if ( var_2 > 0.75 )
            {
                self notify( "killstreakExit" );
                return;
            }

            wait 0.05;
        }

        wait 0.05;
    }
}

_id_D507( var_0, var_1 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( scripts\mp\utility\game::isusingremote() )
        return 0;

    if ( !scripts\mp\utility\game::isreallyalive( self ) )
        return 0;

    self notify( "play_remote_sequence" );
    var_2 = undefined;

    if ( scripts\mp\utility\game::istrue( var_1 ) )
    {
        if ( self isonladder() || self _meth_81AD() || !self isonground() )
        {
            scripts\mp\hud_message::_id_10122( "KILLSTREAKS_UNAVAILABLE" );
            return 0;
        }

        var_2 = "ks_remote_device_mp";
        scripts\mp\supers::_id_1CAB();
        scripts\mp\utility\game::_id_12C6( var_2, 0, 0, 1 );
        self setclientomnvar( "ui_remote_control_sequence", 1 );
        var_3 = scripts\mp\utility\game::_id_11383( var_2 );

        if ( scripts\mp\utility\game::istrue( var_3 ) )
            thread _id_13A4C( var_2 );
        else
            return 0;
    }

    scripts\mp\utility\game::_id_FB09( var_0._id_110EA );
    scripts\mp\utility\game::_id_7385( 1 );
    thread _id_12B9C();
    var_4 = scripts\engine\utility::_id_13736( 1.0, "death" );
    self notify( "ks_freeze_end" );

    if ( !isdefined( var_4 ) || var_4 != "timeout" )
    {
        self setclientomnvar( "ui_remote_control_sequence", 0 );
        scripts\mp\utility\game::_id_7385( 0 );
        scripts\mp\utility\game::_id_41E9();

        if ( isdefined( var_2 ) )
            self notify( "finished_with_manual_weapon_" + var_2 );

        return 0;
    }

    self setscriptablepartstate( "killstreak", "visor_active", 0 );
    thread _id_13BA2();
    scripts\mp\utility\game::_id_7385( 0 );
    self setclientomnvar( "ui_remote_control_sequence", 0 );
    return 1;
}

_id_12B9C()
{
    self endon( "disconnect" );
    self endon( "ks_freeze_end" );
    level waittill( "round_switch" );
    scripts\mp\utility\game::_id_7385( 0 );
}

_id_13A4C( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "finished_with_manual_weapon_" + var_0 );

    if ( self hasweapon( var_0 ) )
    {
        scripts\mp\supers::_id_12D6C();
        scripts\mp\utility\game::_id_80F2( var_0 );

        if ( self getcurrentweapon() == "none" )
            scripts\mp\utility\game::_id_141A( self._id_A978 );
    }
}

_id_13BA2()
{
    self endon( "stop_remote_sequence" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    self setscriptablepartstate( "killstreak", "neutral", 0 );
}

_id_11086( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "stop_remote_sequence" );

    if ( scripts\mp\utility\game::isreallyalive( self ) )
    {
        if ( scripts\mp\utility\game::istrue( level._id_C1BB ) && !scripts\mp\utility\game::istrue( level._id_C1B2 ) )
            thread scripts\mp\killstreaks\nuke::_id_FB0F( 0.05 );

        self setclientomnvar( "ui_remote_control_sequence", 2 );
        var_1 = "ks_remote_device_mp";

        if ( scripts\mp\utility\game::istrue( var_0 ) )
        {
            wait 0.1;
            self notify( "finished_with_manual_weapon_" + var_1 );
        }
        else
            self notify( "killstreak_finished_with_weapon_" + var_1 );
    }

    thread scripts\mp\utility\game::delaysetclientomnvar( 1.3, "ui_remote_control_sequence", 0 );
    self setscriptablepartstate( "killstreak", "neutral", 0 );
    scripts\mp\utility\game::_id_41E9();
}

combatrecordkillstreakuse( var_0 )
{
    if ( !scripts\mp\utility\game::canrecordcombatrecordstats() )
        return;

    var_1 = scripts\mp\utility\game::getstreakrecordtype( var_0 );

    if ( !isdefined( var_1 ) )
    {
        if ( var_0 != "nuke" )
        {

        }

        return;
    }

    var_2 = self getrankedplayerdata( "mp", var_1, var_0, "uses" );
    self setrankedplayerdata( "mp", var_1, var_0, "uses", var_2 + 1 );
}

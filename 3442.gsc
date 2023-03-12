// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( scripts\mp\utility\game::bot_is_fireteam_mode() )
    {
        level._id_113CF = [];
        level._id_113CF[0] = "tactics_exit";
        level._id_113CF[1] = "tactic_none";

        if ( level.gametype == "dom" )
        {
            level._id_113CF[2] = "tactic_dom_holdA";
            level._id_113CF[3] = "tactic_dom_holdB";
            level._id_113CF[4] = "tactic_dom_holdC";
            level._id_113CF[5] = "tactic_dom_holdAB";
            level._id_113CF[6] = "tactic_dom_holdAC";
            level._id_113CF[7] = "tactic_dom_holdBC";
            level._id_113CF[8] = "tactic_dom_holdABC";
        }
        else if ( level.gametype == "war" )
        {
            level._id_113CF[2] = "tactic_war_hyg";
            level._id_113CF[3] = "tactic_war_buddy";
            level._id_113CF[4] = "tactic_war_hp";
            level._id_113CF[5] = "tactic_war_pincer";
            level._id_113CF[6] = "tactic_war_ctc";
            level._id_113CF[7] = "tactic_war_rg";
        }
        else
            return;

        level._id_6D88 = [];
        level._id_6D88["axis"] = undefined;
        level._id_6D88["allies"] = undefined;
        level._id_6D8C = [];
        level._id_6D8C["axis"] = undefined;
        level._id_6D8C["allies"] = undefined;
        level._id_6D8E = [];
        level._id_6D8E["axis"] = undefined;
        level._id_6D8E["allies"] = undefined;
        level thread _id_4444();
        level thread _id_442A();
    }
}

_id_442A()
{
    level waittill( "game_ended" );

    if ( isdefined( level._id_6D88["axis"] ) )
    {
        var_0 = 0;

        foreach ( var_2 in level.players )
        {
            if ( isbot( var_2 ) && var_2.team == "axis" )
                var_0 += var_2.pers["score"];
        }

        level._id_6D88["axis"].pers["score"] = var_0;
        level._id_6D88["axis"].score = var_0;
        level._id_6D88["axis"] scripts\mp\persistence::_id_10E12( "score", var_0 );
        level._id_6D88["axis"] scripts\mp\persistence::statsetchild( "round", "score", var_0 );
    }

    if ( isdefined( level._id_6D88["allies"] ) )
    {
        var_0 = 0;

        foreach ( var_2 in level.players )
        {
            if ( isbot( var_2 ) && var_2.team == "allies" )
                var_0 += var_2.pers["score"];
        }

        level._id_6D88["allies"].pers["score"] = var_0;
        level._id_6D88["allies"].score = var_0;
        level._id_6D88["allies"] scripts\mp\persistence::_id_10E12( "score", var_0 );
        level._id_6D88["allies"] scripts\mp\persistence::statsetchild( "round", "score", var_0 );
    }
}

_id_442D( var_0 )
{
    if ( !isdefined( self._id_6D8A[var_0] ) )
    {
        self._id_6D8A[var_0] = scripts\mp\objidpoolmanager::requestminimapid( 1 );
        var_1 = ( 0, 0, 0 );

        foreach ( var_3 in level._id_5913 )
        {
            if ( var_3._id_01AD == "_" + var_0 )
            {
                var_1 = var_3.curorigin;
                break;
            }
        }

        scripts\mp\objidpoolmanager::minimap_objective_add( self._id_6D8A[var_0], "invisible", var_1, "compass_obj_fireteam" );
        scripts\mp\objidpoolmanager::minimap_objective_playerteam( self._id_6D8A[var_0], self getentitynumber() );
    }
}

_id_4436()
{
    if ( isdefined( self._id_4430 ) )
        return;

    self._id_4430 = 1;
    self._id_4437 = "tactic_none";
    self._id_4438 = "tactic_none";

    switch ( level.gametype )
    {
        case "war":
            break;
        case "dom":
            self._id_6D8A = [];
            _id_442D( "a" );
            _id_442D( "b" );
            _id_442D( "c" );
            break;
    }
}

_id_443A()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 != "tactic_select" )
        {
            if ( var_0 == "bot_select" )
            {
                if ( var_1 > 0 )
                    _id_4432( "bot_next" );
                else if ( var_1 < 0 )
                    _id_4432( "bot_prev" );
            }
            else if ( var_0 == "tactics_menu" )
            {
                if ( var_1 > 0 )
                    _id_4432( "tactics_menu" );
                else if ( var_1 <= 0 )
                    _id_4432( "tactics_close" );
            }

            continue;
        }

        if ( var_1 >= level._id_113CF.size )
            continue;

        var_2 = level._id_113CF[var_1];
        _id_4432( var_2 );
    }
}

_id_4432( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    switch ( var_0 )
    {
        case "bot_prev":
            _id_4441( 1 );
            break;
        case "bot_next":
            _id_4441( 0 );
            break;
        case "tactics_menu":
            self notify( "commander_mode" );

            if ( isdefined( self._id_72E4 ) )
                self._id_72E4 notify( "commander_mode" );

            break;
        case "tactics_close":
            self._id_442C = gettime();
            self notify( "takeover_bot" );
            break;
        case "tactic_none":
            if ( level.gametype == "dom" )
            {
                scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["a"], "invisible" );
                scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["b"], "invisible" );
                scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["c"], "invisible" );
            }

            break;
        case "tactic_dom_holdA":
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["a"], "active" );
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["b"], "invisible" );
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["c"], "invisible" );
            break;
        case "tactic_dom_holdB":
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["a"], "invisible" );
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["b"], "active" );
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["c"], "invisible" );
            break;
        case "tactic_dom_holdC":
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["a"], "invisible" );
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["b"], "invisible" );
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["c"], "active" );
            break;
        case "tactic_dom_holdAB":
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["a"], "active" );
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["b"], "active" );
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["c"], "invisible" );
            break;
        case "tactic_dom_holdAC":
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["a"], "active" );
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["b"], "invisible" );
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["c"], "active" );
            break;
        case "tactic_dom_holdBC":
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["a"], "invisible" );
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["b"], "active" );
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["c"], "active" );
            break;
        case "tactic_dom_holdABC":
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["a"], "active" );
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["b"], "active" );
            scripts\mp\objidpoolmanager::minimap_objective_state( self._id_6D8A["c"], "active" );
            break;
        case "tactic_war_rg":
            break;
        case "tactic_war_ctc":
            break;
        case "tactic_war_hp":
            break;
        case "tactic_war_buddy":
            break;
        case "tactic_war_pincer":
            break;
        case "tactic_war_hyg":
            break;
    }

    if ( scripts\engine\utility::string_starts_with( var_0, "tactic_" ) )
    {
        self playlocalsound( "earn_superbonus" );

        if ( self._id_4437 != var_0 )
        {
            self._id_4437 = var_0;
            thread _id_443C();

            if ( isdefined( level.bot_funcs["commander_gametype_tactics"] ) )
                self [[ level.bot_funcs["commander_gametype_tactics"] ]]( var_0 );
        }
    }
}

_id_443C()
{
    self notify( "commander_order_ack" );
    self endon( "commander_order_ack" );
    self endon( "disconnect" );
    var_0 = 360000;
    var_1 = var_0;
    var_2 = undefined;

    for (;;)
    {
        wait 0.5;
        var_1 = var_0;
        var_2 = undefined;
        var_3 = self.origin;
        var_4 = self getspectatingplayer();

        if ( isdefined( var_4 ) )
            var_3 = var_4.origin;

        foreach ( var_6 in level.players )
        {
            if ( isdefined( var_6 ) && isalive( var_6 ) && isbot( var_6 ) && isdefined( var_6.team ) && var_6.team == self.team )
            {
                var_7 = distancesquared( var_3, var_6.origin );

                if ( var_7 < var_1 )
                    var_2 = var_6;
            }
        }

        if ( isdefined( var_2 ) )
        {
            var_9 = var_2.pers["voicePrefix"];
            var_10 = var_9 + level._id_29CB["callout_response_generic"];
            var_2 thread scripts\mp\battlechatter_mp::_id_5AB0( var_10, 1, 1 );
            return;
        }
    }
}

_id_4435( var_0 )
{
    if ( !isdefined( self ) )
        return;

    self notify( "commander_hint_fade_out" );

    if ( isdefined( self._id_4445 ) )
    {
        var_1 = self._id_4445;

        if ( var_0 > 0 )
        {
            var_1 _meth_8067( var_0 );
            var_1._id_013B *= 1.5;
            var_1._id_0154 = ( 0.3, 0.6, 0.3 );
            var_1._id_0153 = 1;
            var_1 fadeovertime( var_0 );
            var_1._id_00B9 = ( 0, 0, 0 );
            var_1.alpha = 0;
            wait( var_0 );
        }

        var_1 scripts\mp\hud_util::_id_52DC();
    }
}

_id_4433()
{
    self endon( "disconnect" );
    self endon( "commander_mode" );
    self._id_4431 = 1;
    wait 1;

    if ( !isdefined( self ) )
        return;

    self._id_4445 = scripts\mp\hud_util::_id_49B2( "default", 3 );
    self._id_4445._id_00B9 = ( 1, 1, 1 );
    self._id_4445 _meth_834D( &"MPUI_COMMANDER_HINT" );
    self._id_4445.x = 0;
    self._id_4445.y = 20;
    self._id_4445._id_002B = "center";
    self._id_4445._id_002C = "middle";
    self._id_4445._id_017D = "center";
    self._id_4445._id_0382 = "middle";
    self._id_4445._id_0142 = 1;
    self._id_4445.alpha = 1;
    self._id_4445._id_0175 = 1;
    self._id_4445._id_02A4 = -1;
    self._id_4445 endon( "death" );
    thread _id_4434();
    wait 4.0;
    thread _id_4435( 0.5 );
}

_id_4434()
{
    self endon( "disconnect" );
    self endon( "commander_hint_fade_out" );
    self waittill( "commander_mode" );
    thread _id_4435( 0 );
}

_id_9157()
{
    self endon( "disconnect" );
    self._id_C83C = [];

    for ( var_0 = 0; var_0 < 16; var_0++ )
    {
        self._id_C83C[var_0] = scripts\mp\hud_util::_id_49B2( "default", 1 );
        self._id_C83C[var_0]._id_00B9 = ( 1, 1, 1 );
        self._id_C83C[var_0].x = 0;
        self._id_C83C[var_0].y = 30 + var_0 * 12;
        self._id_C83C[var_0]._id_002B = "center";
        self._id_C83C[var_0]._id_002C = "top";
        self._id_C83C[var_0]._id_017D = "center";
        self._id_C83C[var_0]._id_0382 = "top";
        self._id_C83C[var_0]._id_0142 = 1;
        self._id_C83C[var_0].alpha = 1;
        self._id_C83C[var_0]._id_02A4 = -1;
        self._id_C83C[var_0]._id_0049 = 0;
    }

    for (;;)
    {
        var_1 = 0;
        var_2 = [];

        foreach ( var_4 in self._id_C83C )
        {

        }

        foreach ( var_7 in level.players )
        {
            var_8 = 0;

            if ( isdefined( var_7 ) && var_7.team == self.team )
            {
                if ( isdefined( var_7.owner ) )
                {
                    if ( scripts\engine\utility::array_contains( var_2, var_7 ) )
                        self._id_C83C[var_1]._id_00B9 = ( 1, 0, 0 );
                    else
                        var_2 = scripts\engine\utility::_id_2279( var_2, var_7 );

                    if ( var_7 != var_7.owner && scripts\engine\utility::array_contains( var_2, var_7.owner ) )
                        self._id_C83C[var_1]._id_00B9 = ( 1, 0, 0 );
                    else
                        var_2 = scripts\engine\utility::_id_2279( var_2, var_7.owner );

                    if ( var_7 == self )
                        self._id_C83C[var_1]._id_00B9 = ( 1, 0, 0 );
                    else if ( var_7.owner == var_7 )
                        self._id_C83C[var_1]._id_00B9 = ( 1, 0, 0 );
                    else if ( var_7.owner == self )
                        self._id_C83C[var_1]._id_00B9 = ( 0, 1, 0 );
                    else
                        self._id_C83C[var_1]._id_00B9 = ( 1, 1, 1 );
                }
                else if ( isdefined( var_7.bot_fireteam_follower ) )
                    var_8 = 1;
                else
                    self._id_C83C[var_1]._id_00B9 = ( 1, 1, 0 );
            }
            else
                var_8 = 1;

            if ( !var_8 )
                var_1++;
        }

        wait 0.1;
    }
}

_id_4444()
{
    for (;;)
    {
        foreach ( var_1 in level.players )
        {
            if ( !isai( var_1 ) && !isdefined( var_1._id_6D89 ) )
            {
                var_1._id_6D89 = 1;
                var_1 setclientomnvar( "ui_options_menu", 0 );
                var_1._id_4009 = ::_id_4439;
                var_2 = "allies";

                if ( !isdefined( var_1.team ) )
                {
                    if ( level._id_115C6["axis"] < level._id_115C6["allies"] )
                        var_2 = "axis";
                    else if ( level._id_115C6["allies"] < level._id_115C6["axis"] )
                        var_2 = "allies";
                }

                var_1 scripts\mp\menus::_id_185F( var_2 );
                level._id_6D88[var_1.team] = var_1;
                var_1 scripts\mp\menus::_id_3327();
                var_1._id_4006 = 0;
                var_1._id_136FE = 0;
                var_1 thread _id_C52B();
                var_1 thread _id_443A();
            }
        }

        wait 0.05;
    }
}

_id_C52B()
{
    self endon( "disconnect" );

    for (;;)
    {
        if ( self.team != "spectator" && self.sessionstate == "spectator" )
        {
            thread _id_4436();
            thread _id_1359A();
            thread _id_4440();
            return;
        }

        wait 0.05;
    }
}

_id_4440()
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "spectating_cycle" );

    for (;;)
    {
        foreach ( var_1 in level.players )
        {
            if ( isbot( var_1 ) && var_1.team == self.team )
            {
                thread _id_443F( var_1 );
                var_1 thread _id_4433();
                return;
            }
        }

        wait 0.1;
    }
}

_id_B96D()
{
    self endon( "disconnect" );
    self endon( "joined_spectators" );

    for (;;)
    {
        self waittill( "commander_mode" );
        var_0 = scripts\mp\killstreaks\deployablebox::_id_9E32();

        if ( !isalive( self ) || var_0 )
            continue;

        break;
    }

    if ( self.team == "spectator" )
        return;

    thread _id_1359A();
    self playlocalsound( "mp_card_slide" );
    var_1 = 0;

    foreach ( var_3 in level.players )
    {
        if ( isdefined( var_3 ) && var_3 != self && isbot( var_3 ) && isdefined( var_3.team ) && var_3.team == self.team && isdefined( var_3._id_101B9 ) && var_3._id_101B9 == 1 )
        {
            var_3 thread _id_1097E( self );
            var_1 = 1;
            break;
        }
    }

    if ( !var_1 )
        thread scripts\mp\playerlogic::_id_10911();
}

_id_442B( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isbot( var_0 ) )
        return 0;

    if ( !isalive( var_0 ) )
        return 0;

    if ( !var_0.connected )
        return 0;

    if ( var_0.team != self.team )
        return 0;

    var_1 = scripts\mp\killstreaks\deployablebox::_id_9E32();

    if ( var_1 )
        return 0;

    return 1;
}

_id_D097()
{
    for ( var_0 = 0; var_0 < level.players.size; var_0++ )
    {
        if ( level.players[var_0] == self )
            return var_0;
    }

    return -1;
}

_id_4441( var_0 )
{
    var_1 = self getspectatingplayer();
    var_2 = undefined;
    var_3 = 0;
    var_4 = 1;

    if ( isdefined( var_0 ) && var_0 == 1 )
        var_4 = -1;

    if ( isdefined( var_1 ) )
        var_3 = var_1 _id_D097();

    var_5 = 1;

    for ( var_6 = var_3 + var_4; var_5 < level.players.size; var_6 += var_4 )
    {
        var_5++;

        if ( var_6 < 0 )
            var_6 = level.players.size - 1;
        else if ( var_6 >= level.players.size )
            var_6 = 0;

        if ( !isdefined( level.players[var_6] ) )
            continue;

        if ( isdefined( var_1 ) && level.players[var_6] == var_1 )
            break;

        var_7 = _id_442B( level.players[var_6] );

        if ( var_7 )
        {
            var_2 = level.players[var_6];
            break;
        }
    }

    if ( isdefined( var_2 ) && ( !isdefined( var_1 ) || var_2 != var_1 ) )
    {
        thread _id_443F( var_2 );
        self playlocalsound( "oldschool_return" );
        var_2 thread _id_1148C();

        if ( isdefined( var_1 ) )
            var_1 _id_2D9D();
    }
    else
        self playlocalsound( "counter_uav_deactivate" );
}

_id_443F( var_0 )
{
    self notify( "commander_spectate_bot" );
    self endon( "commander_spectate_bot" );
    self endon( "commander_spectate_stop" );
    self endon( "disconnect" );

    while ( isdefined( var_0 ) )
    {
        if ( !self._id_02B0 && var_0.sessionstate == "playing" )
        {
            var_1 = var_0 getentitynumber();

            if ( self._id_0140 != var_1 )
            {
                self allowspectateteam( "none", 0 );
                self allowspectateteam( "freelook", 0 );
                self._id_0140 = var_1;
                self._id_72E4 = var_0;
            }
        }

        wait 0.05;
    }
}

_id_7C94()
{
    var_0 = undefined;

    if ( isdefined( self._id_72E4 ) )
        var_0 = self._id_72E4;
    else
        var_0 = self getspectatingplayer();

    return var_0;
}

_id_4443()
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "spectating_cycle" );

    for (;;)
    {
        foreach ( var_1 in level.players )
        {
            if ( isbot( var_1 ) && var_1.team == self.team )
            {
                _id_1097E( var_1 );
                return;
            }
        }

        wait 0.1;
    }
}

_id_1097E( var_0 )
{
    self._id_72E2 = var_0.origin;
    var_1 = var_0 getplayerangles();
    var_1 = ( var_1[0], var_1[1], 0.0 );
    self._id_72E0 = ( 0, var_0.angles[1], 0 );
    self setstance( var_0 getstance() );
    self._id_2EE3 = var_0._id_2EE3;
    self.bot_class = var_0.bot_class;
    _id_443B( self.bot_class );
    self.health = var_0.health;
    self._id_0381 = var_0._id_0381;
    _id_110AA( var_0 );
    var_0 thread scripts\mp\playerlogic::_id_10911();

    if ( isbot( var_0 ) )
    {
        var_0._id_101B9 = 1;
        var_0 _id_2D9D();
        self _meth_8230( var_0 );
        self notify( "commander_spectate_stop" );
        var_0 notify( "commander_took_over" );
    }
    else
    {

    }

    thread scripts\mp\playerlogic::_id_1083A();
    self setplayerangles( var_1 );
    _id_20B7();
    botsentientswap( self, var_0 );

    if ( isbot( self ) )
    {
        var_0 thread _id_443F( self );
        var_0 _meth_8230( undefined );
        self._id_101B9 = 0;
        var_0 playlocalsound( "counter_uav_activate" );
        thread _id_1148C();
        var_0._id_4447 = undefined;
        var_0._id_A89D = self;
        _id_2EC9();
    }
    else
    {
        thread _id_B96D();
        self playsound( "copycat_steal_class" );
        thread _id_1148C();
        self._id_4447 = var_0;
        self._id_A89D = undefined;

        if ( !isdefined( self._id_4431 ) )
            thread _id_4433();
    }
}

_id_1148C()
{
    if ( !isdefined( self._id_1148D ) )
    {
        self._id_1148D = newclienthudelem( self );
        self._id_1148D.x = 0;
        self._id_1148D.y = 0;
        self._id_1148D._id_002B = "left";
        self._id_1148D._id_002C = "top";
        self._id_1148D._id_017D = "fullscreen";
        self._id_1148D._id_0382 = "fullscreen";
        self._id_1148D setshader( "combathigh_overlay", 640, 480 );
        self._id_1148D._id_02A4 = -10;
        self._id_1148D._id_0049 = 1;
    }

    self._id_1148D.alpha = 0.0;
    self._id_1148D fadeovertime( 0.25 );
    self._id_1148D.alpha = 1.0;
    wait 0.75;
    self._id_1148D fadeovertime( 0.5 );
    self._id_1148D.alpha = 0.0;
}

_id_1359A()
{
    self endon( "disconnect" );
    self endon( "joined_team" );
    self notify( "takeover_wait_start" );
    self endon( "takeover_wait_start" );

    for (;;)
    {
        self waittill( "takeover_bot" );
        var_0 = _id_7C94();
        var_1 = _id_442B( var_0 );

        if ( !var_1 )
        {
            _id_4441( 0 );
            var_0 = _id_7C94();
            var_1 = _id_442B( var_0 );
        }

        if ( var_1 )
        {
            thread _id_1097E( var_0 );
            break;
        }

        self playlocalsound( "counter_uav_deactivate" );
    }
}

_id_2EC9()
{
    if ( !isdefined( self ) || !isplayer( self ) || !isbot( self ) )
        return;

    self notify( "wait_here" );
    self botsetflag( "disable_movement", 1 );
    self._id_2757 = "bot_waiting_" + self.team + "_" + self.name;
    badplace_cylinder( self._id_2757, 5, self.origin, 32, 72, self.team );
    thread _id_2D58();
    thread _id_2EC8();
}

_id_2D58( var_0 )
{
    self endon( "freed_to_move" );
    self endon( "disconnect" );
    self waittill( "death" );
    _id_2D9D();
}

_id_2EC8()
{
    self endon( "wait_here" );
    wait 5;
    thread _id_2D9D();
}

_id_2D9D()
{
    if ( !isdefined( self ) || !isplayer( self ) || !isbot( self ) )
        return;

    self botsetflag( "disable_movement", 0 );

    if ( isdefined( self._id_2757 ) )
        badplace_delete( self._id_2757 );

    self notify( "freed_to_move" );
}

_id_4439( var_0 )
{
    return self._id_2EE3;
}

_id_443B( var_0 )
{
    self.pers["class"] = var_0;
    self.class = var_0;
    scripts\mp\class::_id_F691( var_0 );
    self._id_0322 = undefined;
    self._id_113E7 = undefined;
}

_id_110AA( var_0 )
{
    self._id_4643 = var_0 _meth_8173();
    self._id_464B = var_0 getcurrentweapon();

    foreach ( var_2 in self._id_4643 )
    {
        self._id_4648[var_2] = var_0 getweaponammoclip( var_2 );
        self._id_464A[var_2] = var_0 getweaponammostock( var_2 );
    }
}

_id_20B7()
{
    foreach ( var_1 in self._id_4643 )
    {
        if ( !self hasweapon( var_1 ) )
            self giveweapon( var_1 );
    }

    var_3 = self _meth_8173();

    foreach ( var_1 in var_3 )
    {
        if ( !scripts\engine\utility::array_contains( self._id_4643, var_1 ) )
            scripts\mp\utility\game::_id_141E( var_1 );
    }

    foreach ( var_1 in self._id_4643 )
    {
        if ( self hasweapon( var_1 ) )
        {
            self setweaponammoclip( var_1, self._id_4648[var_1] );
            self setweaponammostock( var_1, self._id_464A[var_1] );
            continue;
        }
    }

    if ( self getcurrentweapon() != self._id_464B )
        scripts\mp\utility\game::_id_141A( self._id_464B );
}

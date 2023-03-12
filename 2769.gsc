// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( !isdefined( game["gamestarted"] ) )
    {
        game["menu_team"] = "team_marinesopfor";

        if ( level._id_BDCC )
            game["menu_team"] = "team_mt_options";

        if ( scripts\mp\utility\game::bot_is_fireteam_mode() )
        {
            level._id_6D8F = "class_commander_" + level.gametype;
            game["menu_class"] = level._id_6D8F;
            game["menu_class_allies"] = level._id_6D8F;
            game["menu_class_axis"] = level._id_6D8F;
        }
        else
        {
            game["menu_class"] = "class";
            game["menu_class_allies"] = "class_marines";
            game["menu_class_axis"] = "class_opfor";
        }

        game["menu_changeclass_allies"] = "changeclass_marines";
        game["menu_changeclass_axis"] = "changeclass_opfor";

        if ( level._id_BDCC )
        {
            for ( var_0 = 0; var_0 < level._id_115DA.size; var_0++ )
            {
                var_1 = "menu_class_" + level._id_115DA[var_0];
                var_2 = "menu_changeclass_" + level._id_115DA[var_0];
                game[var_1] = game["menu_class_allies"];
                game[var_2] = "changeclass_marines";
            }
        }

        game["menu_changeclass"] = "changeclass";

        if ( level._id_4542 )
        {
            game["menu_controls"] = "ingame_controls";

            if ( level._id_10A56 )
            {
                if ( level._id_BDCC )
                {
                    for ( var_0 = 0; var_0 < level._id_115DA.size; var_0++ )
                    {
                        var_1 = "menu_class_" + level._id_115DA[var_0];
                        var_2 = "menu_changeclass_" + level._id_115DA[var_0];
                        game[var_1] += "_splitscreen";
                        game[var_2] += "_splitscreen";
                    }
                }

                game["menu_team"] += "_splitscreen";
                game["menu_class_allies"] += "_splitscreen";
                game["menu_class_axis"] += "_splitscreen";
                game["menu_changeclass_allies"] += "_splitscreen";
                game["menu_changeclass_axis"] += "_splitscreen";
                game["menu_controls"] += "_splitscreen";
                game["menu_changeclass_defaults_splitscreen"] = "changeclass_splitscreen_defaults";
                game["menu_changeclass_custom_splitscreen"] = "changeclass_splitscreen_custom";
            }
        }

        precachestring( &"MP_HOST_ENDED_GAME" );
        precachestring( &"MP_HOST_ENDGAME_RESPONSE" );
    }

    level thread _id_C56E();
    level thread watchforbootmoviecomplete();
    level thread setintrocamnetworkmodel();
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_13A32();
        var_0 thread _id_13A72();
        var_0 thread _id_13A4A();
        var_0 thread _id_13A67();
    }
}

setintrocamnetworkmodel()
{
    setintrocameraactive( 1 );
    level waittill( "prematch_over" );
    setintrocameraactive( 0 );
}

watchforbootmoviecomplete()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = 0;

    for (;;)
    {
        level waittill( "rigBootFinished" );
        var_0++;

        if ( level._id_4533 <= var_0 )
        {
            level notify( "allRigsBooted" );
            break;
        }
    }
}

_id_7E2A( var_0 )
{
    var_1 = undefined;

    if ( var_0 > 100 )
    {
        var_2 = var_0 - 100;
        var_1 = "default" + var_2;
    }
    else
        var_1 = "custom" + var_0;

    return var_1;
}

_id_D848( var_0 )
{
    var_1 = spawnstruct();
    scripts\mp\playerlogic::_id_806C( var_1, var_0 );
    scripts\mp\playerlogic::_id_AEAD( var_1 );
}

_id_13A32()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 != "class_select" )
            continue;

        if ( getdvarint( "systemlink" ) && getdvarint( "xblive_competitionmatch" ) && self ismlgspectator() )
        {
            self setclientomnvar( "ui_options_menu", 0 );
            continue;
        }

        var_2 = isai( self ) || issubstr( self.name, "tcBot" );

        if ( !var_2 )
        {
            if ( !isai( self ) && "" + var_1 != "callback" )
                self setclientomnvar( "ui_loadout_selected", var_1 );
        }

        if ( isdefined( self._id_136FE ) && self._id_136FE )
            continue;

        if ( !scripts\mp\utility\game::_id_1C7D() || scripts\mp\utility\game::_id_10125() )
            continue;

        if ( "" + var_1 != "callback" )
        {
            if ( isdefined( self.pers["isBot"] ) && self.pers["isBot"] )
            {
                self.pers["class"] = var_1;
                self.class = var_1;
            }
            else
            {
                var_3 = var_1 + 1;
                var_3 = _id_7E2A( var_3 );

                if ( !isdefined( self.pers["class"] ) || var_3 == self.pers["class"] )
                    continue;

                self.pers["class"] = var_3;
                self.class = var_3;
                _id_D848( var_3 );

                if ( scripts\mp\class::_id_FFBB() )
                    scripts\mp\class::_id_837A();
                else if ( isalive( self ) )
                    self iprintlnbold( game["strings"]["change_class"] );
            }

            continue;
        }

        _id_B670( "callback" );
    }
}

_id_13A4A()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 != "end_game" )
            continue;

        level thread scripts\mp\gamelogic::_id_72BE( var_1 );
    }
}

_id_13A72()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 != "team_select" )
            continue;

        if ( scripts\mp\utility\game::matchmakinggame() )
            continue;

        var_2 = 0;

        if ( var_1 >= 3 )
            var_2 = 1;

        if ( var_2 )
        {
            self setclientomnvar( "ui_spectator_selected", 1 );
            self setclientomnvar( "ui_loadout_selected", -1 );
            self._id_1097B = 1;
        }
        else
        {
            self setclientomnvar( "ui_spectator_selected", -1 );
            self._id_1097B = 0;
        }

        var_3 = self ismlgspectator();
        var_4 = !var_3 && isdefined( self.team ) && self.team == "spectator";
        var_5 = var_3 && var_1 == 3 || var_4 && var_1 == 4;

        if ( var_1 == 4 )
        {
            var_1 = 3;
            self _meth_830E( 1 );
        }
        else
            self _meth_830E( 0 );

        self setclientomnvar( "ui_team_selected", var_1 );

        if ( var_1 == 0 )
            var_1 = "axis";
        else if ( var_1 == 1 )
            var_1 = "allies";
        else if ( var_1 == 2 )
            var_1 = "random";
        else
            var_1 = "spectator";

        if ( !var_5 && isdefined( self.pers["team"] ) && var_1 == self.pers["team"] )
            continue;

        self setclientomnvar( "ui_loadout_selected", -1 );
        thread _id_AFDB( var_1 );

        if ( var_1 == "axis" )
        {
            thread _id_F876( "axis" );
            continue;
        }

        if ( var_1 == "allies" )
        {
            thread _id_F876( "allies" );
            continue;
        }

        if ( var_1 == "random" )
        {
            thread _id_2642();
            continue;
        }

        if ( var_1 == "spectator" )
            thread _id_F859( var_5 );
    }
}

_id_2642()
{
    if ( level.gametype == "infect" )
        thread _id_F876( "allies" );
    else if ( isbotmatchmakingenabled() && isdefined( self.bot_team ) )
        thread _id_F876( self.bot_team );
    else if ( !isdefined( self.team ) )
    {
        if ( self ismlgspectator() )
            thread _id_F859();
        else if ( level._id_115C6["axis"] < level._id_115C6["allies"] )
            thread _id_F876( "axis" );
        else if ( level._id_115C6["allies"] < level._id_115C6["axis"] )
            thread _id_F876( "allies" );
        else if ( getteamscore( "allies" ) > getteamscore( "axis" ) )
            thread _id_F876( "axis" );
        else
            thread _id_F876( "allies" );
    }
    else
    {
        if ( self ismlgspectator() )
        {
            thread _id_F859();
            return;
        }

        if ( level._id_115C6["axis"] < level._id_115C6["allies"] && self.team != "axis" )
        {
            thread _id_F876( "axis" );
            return;
        }

        if ( level._id_115C6["allies"] < level._id_115C6["axis"] && self.team != "allies" )
        {
            thread _id_F876( "allies" );
            return;
        }

        if ( level._id_115C6["allies"] == level._id_115C6["axis"] )
        {
            if ( getteamscore( "allies" ) > getteamscore( "axis" ) && self.team != "axis" )
                thread _id_F876( "axis" );
            else if ( self.team != "allies" )
                thread _id_F876( "allies" );
            else
            {

            }
        }
    }
}

_id_F876( var_0 )
{
    self endon( "disconnect" );

    if ( !isai( self ) && level.teambased && !scripts\mp\teams::getjointeampermissions( var_0 ) && !scripts\mp\utility\game::_id_AEB6() )
        return;

    if ( level.ingraceperiod && !self._id_8BE9 )
    {
        self._id_8C2A = 0;
        self.pers["lives"] = scripts\mp\utility\game::getgametypenumlives();
    }

    if ( self.sessionstate == "playing" )
    {
        self.switching_teams = 1;
        self._id_A49E = var_0;
        self._id_AB33 = self.pers["team"];
    }

    _id_185F( var_0 );

    if ( scripts\mp\utility\game::_id_9F13() )
        self _meth_859D( 1 );

    if ( self.sessionstate == "playing" )
        self suicide();

    _id_136B1();
    _id_637D();

    if ( self.sessionstate == "spectator" )
    {
        if ( game["state"] == "postgame" )
            return;

        if ( game["state"] == "playing" && !scripts\mp\utility\game::_id_9E4A() )
        {
            if ( isdefined( self._id_13700 ) && self._id_13700 )
                return;

            thread scripts\mp\playerlogic::_id_1083A();
        }

        thread _id_0AF0::_id_F857();
    }

    self notify( "okToSpawn" );
}

_id_F859( var_0 )
{
    if ( ( !isdefined( var_0 ) || !var_0 ) && isdefined( self.pers["team"] ) && self.pers["team"] == "spectator" )
        return;

    if ( isalive( self ) )
    {
        self.switching_teams = 1;
        self._id_A49E = "spectator";
        self._id_AB33 = self.pers["team"];
        self suicide();
    }

    self notify( "becameSpectator" );
    _id_185F( "spectator" );
    self.pers["class"] = undefined;
    self.class = undefined;
    thread scripts\mp\playerlogic::_id_10911();
}

_id_136B1()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_136FE = 1;

    for (;;)
    {
        if ( scripts\mp\utility\game::_id_1C7D() || scripts\mp\utility\game::_id_10125() && !isai( self ) )
        {
            if ( !self ismlgspectator() )
                scripts\mp\utility\game::_id_F78C( "spawn_info", game["strings"]["must_select_loadout_to_spawn"], undefined, undefined, undefined, undefined, undefined, undefined, 1 );

            self waittill( "luinotifyserver", var_0, var_1 );
        }
        else
        {
            _id_3327();
            break;
        }

        if ( var_0 != "class_select" )
            continue;

        if ( self.team == "spectator" )
            continue;

        if ( "" + var_1 != "callback" )
        {
            if ( isdefined( self.pers["isBot"] ) && self.pers["isBot"] )
            {
                self.pers["class"] = var_1;
                self.class = var_1;
            }
            else
            {
                var_1 += 1;
                self.pers["class"] = _id_7E2A( var_1 );
                self.class = _id_7E2A( var_1 );
            }

            self._id_136FE = 0;
        }
        else
        {
            self._id_136FE = 0;
            _id_B670( "callback" );
        }

        break;
    }
}

_id_2A61( var_0 )
{
    var_1 = self.pers["team"];

    if ( scripts\mp\utility\game::_id_1C7D() || scripts\mp\utility\game::_id_10125() && !isai( self ) )
    {
        self setclientomnvar( "ui_options_menu", 2 );

        if ( !self ismlgspectator() )
            _id_136B1();

        _id_637D();

        if ( self.sessionstate == "spectator" )
        {
            if ( game["state"] == "postgame" )
                return;

            if ( game["state"] == "playing" && !scripts\mp\utility\game::_id_9E4A() )
            {
                if ( isdefined( self._id_13700 ) && self._id_13700 )
                    return;

                thread scripts\mp\playerlogic::_id_1083A();
            }

            thread _id_0AF0::_id_F857();
        }

        self.connecttime = gettime();
        self notify( "okToSpawn" );
    }
    else
        thread _id_3327();

    if ( !isalive( self ) )
        thread scripts\mp\playerlogic::_id_D81E( 0.1 );
}

_id_3327()
{
    self._id_F1BA = 1;
    self._id_136FE = 0;

    if ( !isbot( self ) && scripts\mp\utility\game::_id_DCD5() )
    {
        if ( level.gametype == "infect" || isdefined( level.aonrules ) && level.aonrules > 0 )
        {
            scripts\mp\utility\game::_id_F78C( "spawn_info", game["strings"]["press_to_spawn"], undefined, undefined, undefined, undefined, undefined, undefined, 1 );
            self notifyonplayercommand( "pressToSpawn", "+usereload" );
            self notifyonplayercommand( "pressToSpawn", "+activate" );
            self waittill( "pressToSpawn" );
        }
    }

    if ( isdefined( level._id_3328 ) )
    {
        var_0 = self [[ level._id_3328 ]]();
        self.class = var_0;
    }
    else
        self.class = "class0";
}

_id_2A7A()
{
    self setclientomnvar( "ui_options_menu", 1 );
}

_id_B678()
{
    if ( isdefined( self.pers["team"] ) && self.pers["team"] == "spectator" )
        return;

    if ( isalive( self ) )
    {
        self.switching_teams = 1;
        self._id_A49E = "spectator";
        self._id_AB33 = self.pers["team"];
        self suicide();
    }

    _id_185F( "spectator" );
    self.pers["class"] = undefined;
    self.class = undefined;
    thread scripts\mp\playerlogic::_id_10911();
}

_id_B670( var_0 )
{
    var_1 = self.pers["team"];
    var_2 = scripts\mp\class::_id_7E2A( var_0 );
    var_3 = scripts\mp\class::_id_821E( var_0 );

    if ( var_2 == "restricted" )
    {
        _id_2A61();
        return;
    }

    if ( isdefined( self.pers["class"] ) && self.pers["class"] == var_2 && ( isdefined( self.pers["primary"] ) && self.pers["primary"] == var_3 ) )
        return;

    if ( self.sessionstate == "playing" )
    {
        if ( isdefined( self.pers["lastClass"] ) && isdefined( self.pers["class"] ) )
        {
            self.pers["lastClass"] = self.pers["class"];
            self._id_A95C = self.pers["lastClass"];
        }

        self.pers["class"] = var_2;
        self.class = var_2;
        self.pers["primary"] = var_3;

        if ( game["state"] == "postgame" )
            return;

        if ( level.ingraceperiod && !self._id_8BE9 )
        {
            scripts\mp\class::_id_F691( self.pers["class"] );
            self._id_0322 = undefined;
            self._id_113E7 = undefined;
            scripts\mp\class::giveloadout( self.pers["team"], self.pers["class"] );
        }
        else
            self iprintlnbold( game["strings"]["change_class"] );
    }
    else
    {
        if ( isdefined( self.pers["lastClass"] ) && isdefined( self.pers["class"] ) )
        {
            self.pers["lastClass"] = self.pers["class"];
            self._id_A95C = self.pers["lastClass"];
        }

        self.pers["class"] = var_2;
        self.class = var_2;
        self.pers["primary"] = var_3;

        if ( game["state"] == "postgame" )
            return;

        if ( game["state"] == "playing" && !scripts\mp\utility\game::_id_9E4A() )
            thread scripts\mp\playerlogic::_id_1083A();
    }

    thread _id_0AF0::_id_F857();
}

_id_185F( var_0, var_1, var_2 )
{
    if ( isdefined( self.team ) )
    {
        scripts\mp\playerlogic::_id_E11D();

        if ( isdefined( var_2 ) && var_2 )
            scripts\mp\playerlogic::_id_4FBD( self.team );
    }

    if ( isdefined( self.pers["team"] ) && self.pers["team"] != "" && self.pers["team"] != "spectator" )
        self.pers["last_team"] = self.pers["team"];

    self.pers["team"] = var_0;
    self.team = var_0;

    if ( ( !scripts\mp\utility\game::matchmakinggame() || isdefined( self.pers["isBot"] ) || !scripts\mp\utility\game::_id_1CAD() ) && !isgamebattlematch() )
    {
        if ( level.teambased )
            self._id_0291 = var_0;
        else if ( var_0 == "spectator" )
            self._id_0291 = "spectator";
        else
            self._id_0291 = "none";
    }

    if ( game["state"] != "postgame" )
    {
        scripts\mp\playerlogic::_id_1860();

        if ( isdefined( var_2 ) && var_2 )
            scripts\mp\playerlogic::_id_93F8( self.team );
    }

    if ( isgamebattlematch() )
        setmatchdata( "players", self._id_41F0, "team", var_0 );

    scripts\mp\utility\game::_id_12EDC();

    if ( isdefined( var_1 ) && var_1 )
        waittillframeend;

    scripts\mp\utility\game::_id_12EC8();

    if ( var_0 == "spectator" )
    {
        self notify( "joined_spectators" );
        level notify( "joined_team", self );
    }
    else
    {
        self notify( "joined_team" );
        level notify( "joined_team", self );
    }
}

_id_637D()
{
    self.waitingtospawn = 0;
    self notify( "end_respawn" );
}

_id_AFDB( var_0 )
{
    if ( getdvarint( "scr_playtest", 0 ) == 0 )
        return;

    if ( var_0 != "random" )
        iprintlnbold( "" + self.name + " did not select auto-assign" );
}

_id_13A67()
{
    thread _id_13A69();
    thread _id_13A6A();
    thread _id_13A6B();
}

_id_13A69()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 == "rig_selected" )
        {
            self._id_E535 = spawnstruct();
            self._id_E535._id_026A = var_1;
        }
    }
}

_id_13A6A()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 == "super_selected" )
        {
            if ( isdefined( self._id_E535 ) )
            {
                self._id_E535._id_11261 = var_1;
                continue;
            }
        }
    }
}

_id_13A6B()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 == "trait_selected" )
        {
            if ( isdefined( self._id_E535 ) )
            {
                self._id_E535._id_11B2D = var_1;

                if ( isdefined( self._id_E535._id_026A ) && isdefined( self._id_E535._id_11261 ) )
                {
                    var_2 = level._id_2128[self._id_E535._id_026A];
                    var_3 = level._id_11264[self._id_E535._id_11261];
                    var_4 = level._id_CA5E[self._id_E535._id_11B2D];
                    scripts\mp\class::_id_3C53( var_2, var_3, var_4 );
                }
                else
                {

                }

                continue;
            }
        }
    }
}

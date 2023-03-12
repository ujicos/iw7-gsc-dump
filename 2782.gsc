// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_1193B( var_0 )
{
    if ( !self._id_8C2A )
        return 0;

    var_1 = gettime() + var_0 * 1000;
    var_2 = level._id_AA44[self.pers["team"]];
    var_3 = level._id_13BDE[self.pers["team"]] * 1000;
    var_4 = ( var_1 - var_2 ) / var_3;
    var_5 = ceil( var_4 );
    var_6 = var_2 + var_5 * var_3;

    if ( isdefined( self._id_E29A ) )
    {
        var_7 = ( gettime() - self._id_E29A ) / 1000.0;

        if ( self._id_E29A < var_2 )
            return 0;
    }

    if ( isdefined( self._id_13BE5 ) )
        var_6 += 50 * self._id_13BE5;

    return ( var_6 - gettime() ) / 1000;
}

_id_115D4()
{
    var_0 = self.pers["teamkills"];

    if ( level._id_B47A < 0 || var_0 <= level._id_B47A )
        return 0;

    var_1 = var_0 - level._id_B47A;
    return scripts\mp\tweakables::_id_81E7( "team", "teamkillspawndelay" ) * var_1;
}

_id_1193A( var_0 )
{
    if ( level.ingraceperiod && !self._id_8C2A || level._id_7669 )
        return 0;

    var_1 = 0;

    if ( self._id_8C2A )
    {
        var_2 = self [[ level._id_C583 ]]();

        if ( isdefined( var_2 ) )
            var_1 = var_2;
        else
            var_1 = getdvarfloat( "scr_" + level.gametype + "_playerrespawndelay" );

        if ( var_0 && isdefined( self.pers["teamKillPunish"] ) && self.pers["teamKillPunish"] )
            var_1 += _id_115D4();

        if ( isdefined( self._id_E29A ) )
        {
            var_3 = ( gettime() - self._id_E29A ) / 1000.0;
            var_1 -= var_3;

            if ( var_1 < 0 )
                var_1 = 0;
        }

        if ( isdefined( self._id_F851 ) )
            var_1 += level._id_11946;
    }

    var_4 = getdvarint( "scr_" + level.gametype + "_waverespawndelay" ) > 0;

    if ( var_4 )
        return _id_1193B( var_1 );

    return var_1;
}

_id_B4EE()
{
    if ( scripts\mp\utility\game::istrue( level._id_C1C3 ) )
        return 0;

    if ( scripts\mp\utility\game::getgametypenumlives() || isdefined( level._id_5611 ) )
    {
        if ( isdefined( level._id_5611 ) && level._id_5611 )
            return 0;

        if ( scripts\mp\utility\game::istrue( self.pers["teamKillPunish"] ) )
            return 0;

        if ( self.pers["lives"] <= 0 && scripts\mp\utility\game::_id_7672() )
            return 0;
        else if ( scripts\mp\utility\game::_id_7672() )
        {
            if ( level.ingraceperiod && !self._id_8C2A )
                return 1;

            if ( !level.ingraceperiod && !self._id_8C2A && ( isdefined( level._id_1C9A ) && !level._id_1C9A ) )
            {
                if ( isdefined( self._id_101D9 ) && !self._id_101D9 )
                    return 1;

                return 0;
            }
        }
    }

    return 1;
}

_id_1083A()
{
    self endon( "becameSpectator" );

    if ( isdefined( self._id_136FE ) && self._id_136FE )
        self waittill( "okToSpawn" );

    if ( isdefined( self._id_185F ) )
    {
        scripts\mp\menus::_id_185F( self._id_185F );
        self._id_185F = undefined;
    }

    if ( !_id_B4EE() )
    {
        wait 0.05;
        var_0 = self.origin;
        var_1 = self.angles;
        self notify( "attempted_spawn" );

        if ( scripts\mp\utility\game::istrue( self.pers["teamKillPunish"] ) )
        {
            self.pers["teamkills"] = max( self.pers["teamkills"] - 1, 0 );
            scripts\mp\utility\game::_id_F78C( "friendly_fire", &"MP_FRIENDLY_FIRE_WILL_NOT" );

            if ( !self._id_8C2A && self.pers["teamkills"] <= level._id_B47A )
                self.pers["teamKillPunish"] = 0;
        }
        else if ( scripts\mp\utility\game::_id_9F32() && game["finalRound"] == 0 )
        {
            if ( isdefined( self._id_113EF ) && self._id_113EF )
                scripts\mp\utility\game::_id_F78C( "spawn_info", game["strings"]["spawn_tag_wait"] );
            else if ( level.gametype == "siege" )
                scripts\mp\utility\game::_id_F78C( "spawn_info", game["strings"]["spawn_point_capture_wait"] );
            else
                scripts\mp\utility\game::_id_F78C( "spawn_info", game["strings"]["spawn_next_round"] );

            thread _id_E170( 3.0 );
        }

        if ( self.sessionstate != "spectator" )
            var_0 += ( 0, 0, 60 );

        if ( scripts\mp\utility\game::isusingremote() )
        {
            self._id_108DB = 1;
            self._id_4E55 = self.origin;
            self waittill( "stopped_using_remote" );
        }

        if ( !scripts\mp\utility\game::istrue( level._id_C1C3 ) )
            thread _id_10911( var_0, var_1 );

        return;
    }

    if ( self.waitingtospawn )
        return;

    self.waitingtospawn = 1;
    _id_1369D();

    if ( isdefined( self ) )
        self.waitingtospawn = 0;
}

_id_1369D()
{
    self endon( "disconnect" );
    self endon( "end_respawn" );
    level endon( "game_ended" );
    self notify( "attempted_spawn" );
    var_0 = 0;

    if ( scripts\mp\utility\game::istrue( self.pers["teamKillPunish"] ) )
    {
        var_1 = _id_115D4();

        if ( var_1 > 0 )
        {
            scripts\mp\utility\game::_id_F78C( "friendly_fire", &"MP_FRIENDLY_FIRE_WILL_NOT", var_1, 1, 1 );
            thread _id_E285( self.origin + ( 0, 0, 60 ), self.angles );
            var_0 = 1;
            wait( var_1 );
            scripts\mp\utility\game::_id_41C4( "friendly_fire" );
            self._id_E29A = gettime();
        }

        self.pers["teamKillPunish"] = 0;
    }
    else if ( _id_115D4() )
        self.pers["teamkills"] = max( self.pers["teamkills"] - 1, 0 );

    if ( scripts\mp\utility\game::isusingremote() )
    {
        self._id_108DB = 1;
        self._id_4E55 = self.origin;
        self waittill( "stopped_using_remote" );

        if ( scripts\mp\utility\game::istrue( level._id_C1C3 ) )
            return;
    }

    if ( !isdefined( self._id_13BE5 ) && isdefined( level._id_13BE0[self.team] ) )
    {
        self._id_13BE5 = level._id_13BE0[self.team];
        level._id_13BE0[self.team]++;
    }

    var_2 = _id_1193A( 0 );
    thread _id_D81E( var_2 );

    if ( scripts\mp\utility\game::isinarbitraryup() )
    {
        var_3 = self _meth_8517();
        var_4 = anglestoup( var_3 );
        var_5 = var_4 * 60;
    }
    else
        var_5 = ( 0, 0, 60 );

    if ( var_2 > 0 )
    {
        scripts\mp\utility\game::_id_F78C( "spawn_info", game["strings"]["waiting_to_spawn"], var_2, 1, 1 );

        if ( !var_0 )
            thread _id_E285( self.origin + var_5, self.angles );

        var_0 = 1;
        scripts\mp\utility\game::_id_136EF( var_2, "force_spawn" );

        if ( !scripts\mp\utility\game::istrue( self._id_136FE ) )
            self notify( "stop_wait_safe_spawn_button" );
    }

    if ( needsbuttontorespawn() )
    {
        if ( !scripts\mp\utility\game::istrue( self._id_136FE ) )
            scripts\mp\utility\game::_id_F78C( "spawn_info", game["strings"]["press_to_spawn"], undefined, undefined, undefined, undefined, undefined, undefined, 1 );

        if ( !var_0 )
            thread _id_E285( self.origin + var_5, self.angles );

        var_0 = 1;
        _id_1370E();
    }

    waitclassselected();

    if ( isbot( self ) )
    {
        if ( !scripts\mp\bots\bots::_id_2DDF() )
            self waittill( "bot_ready_to_spawn" );
    }

    self.waitingtospawn = 0;
    scripts\mp\utility\game::_id_41C4( "spawn_info" );
    self._id_13BE5 = undefined;
    thread _id_108F2();
}

waitclassselected()
{
    while ( scripts\mp\utility\game::istrue( self._id_136FE ) )
        wait 0.05;
}

needsbuttontorespawn()
{
    if ( scripts\mp\tweakables::_id_81E7( "player", "forcerespawn" ) != 0 )
        return 0;

    if ( !self._id_8C2A )
        return 0;

    var_0 = getdvarint( "scr_" + level.gametype + "_waverespawndelay" ) > 0;

    if ( var_0 )
        return 0;

    if ( self._id_138DD )
        return 0;

    return 1;
}

_id_1370E()
{
    self endon( "disconnect" );
    self endon( "end_respawn" );

    for (;;)
    {
        if ( self usebuttonpressed() )
            break;

        wait 0.05;
    }
}

_id_E170( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    waittillframeend;
    self endon( "end_respawn" );
    wait( var_0 );
    scripts\mp\utility\game::_id_41C4( "spawn_info" );
}

_id_AA0D()
{
    self _meth_81DC();

    if ( scripts\mp\utility\game::_id_12D6( "specialty_finalstand" ) && !level._id_54CC )
        scripts\mp\utility\game::_id_E150( "specialty_finalstand" );

    if ( level._id_54CC )
        self._id_016F = "";

    self setstance( "crouch" );
    self._id_E4A8 = 1;
    self notify( "revive" );

    if ( isdefined( self._id_10B67 ) )
        self.maxhealth = self._id_10B67;

    self.health = self.maxhealth;
    scripts\engine\utility::_id_1C6E( 1 );

    if ( game["state"] == "postgame" )
        scripts\mp\gamelogic::_id_7386();
}

_id_7E63()
{
    var_0 = spawn( "script_origin", self.origin );
    var_0 hide();
    var_0.angles = self.angles;
    return var_0;
}

_id_D81E( var_0 )
{
    if ( !0 )
        return;

    self endon( "disconnect" );
    self endon( "spawned" );
    self endon( "used_predicted_spawnpoint" );
    self notify( "predicting_about_to_spawn_player" );
    self endon( "predicting_about_to_spawn_player" );

    if ( var_0 <= 0 )
        return;

    if ( var_0 > 1.0 )
        wait( var_0 - 1.0 );

    _id_D81D();
    self predictstreampos( self._id_D820.origin + ( 0, 0, 60 ), self._id_D820.angles );
    self._id_D821 = gettime();

    for ( var_1 = 0; var_1 < 30; var_1++ )
    {
        wait 0.4;
        var_2 = self._id_D820;
        _id_D81D();

        if ( self._id_D820 != var_2 )
        {
            self predictstreampos( self._id_D820.origin + ( 0, 0, 60 ), self._id_D820.angles );
            self._id_D821 = gettime();
        }
    }
}

_id_D81D()
{
    if ( _id_1193A( 1 ) > 1.0 )
    {
        self._id_D820 = _id_8148();
        return;
    }

    if ( isdefined( self._id_F851 ) )
    {
        self._id_D820 = self._id_F851;
        return;
    }

    var_0 = self [[ level.getspawnpoint ]]();
    self._id_D820 = var_0;
}

_id_3E42( var_0 )
{
    self notify( "used_predicted_spawnpoint" );
    self._id_D820 = undefined;
}

_id_CA12( var_0, var_1 )
{
    return var_0 + " (" + int( var_0 / var_1 * 100 ) + "%)";
}

_id_D919()
{

}

_id_8135( var_0 )
{
    if ( !positionwouldtelefrag( var_0.origin ) )
        return var_0.origin;

    if ( !isdefined( var_0._id_1D53 ) )
        return var_0.origin;

    foreach ( var_2 in var_0._id_1D53 )
    {
        if ( !positionwouldtelefrag( var_2 ) )
            return var_2;
    }

    return var_0.origin;
}

_id_119A9()
{
    if ( !isdefined( self._id_F851 ) )
        return 0;

    var_0 = getentarray( "care_package", "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( distance( var_2.origin, self._id_F851._id_D424 ) > 64 )
            continue;

        if ( isdefined( var_2.owner ) )
            scripts\mp\hud_message::showsplash( "destroyed_insertion", undefined, var_2.owner );

        scripts\mp\perks\perkfunctions::_id_51D7( self._id_F851 );
        return 0;
    }

    var_4 = [];
    var_4[0] = self;
    var_4[1] = self._id_F851;
    var_5 = scripts\engine\trace::_id_48BC( 1, 1, 1, 0, 0, 1, 1 );

    if ( !scripts\engine\trace::_id_DCF1( self._id_F851.origin + ( 0, 0, 60 ), self._id_F851.origin, var_4, var_5 ) )
        return 0;

    var_6 = self._id_F851.origin + ( 0, 0, 1 );
    var_7 = playerphysicstrace( var_6, self._id_F851.origin + ( 0, 0, -16 ) );

    if ( var_6[2] == var_7[2] )
        return 0;

    return 1;
}

_id_108DC()
{
    self notify( "spawningClientThisFrameReset" );
    self endon( "spawningClientThisFrameReset" );
    wait 0.05;
    level._id_C23D--;
}

_id_806C( var_0, var_1 )
{
    var_2 = scripts\mp\class::_id_AE31();
    var_2 = scripts\mp\class::_id_AE48( var_2, var_1 );
    scripts\mp\class::_id_AE4C( var_2 );
    self._id_400E = var_2;
    self._id_400F = 1;

    if ( var_2._id_AE89 != "none" )
        var_0.primaryweapon = var_2._id_AE89;

    if ( var_2._id_AE9D != "none" )
        var_0._id_F0C4 = var_2._id_AE9D;

    var_3 = scripts\mp\teams::_id_7E55();

    if ( isdefined( var_3["body"] ) )
        var_0._id_2C09 = var_3["body"];

    if ( isdefined( var_3["head"] ) )
        var_0._id_8C59 = var_3["head"];
}

_id_AEAD( var_0, var_1 )
{
    var_2 = [];

    if ( isdefined( var_0.primaryweapon ) )
        var_2[var_2.size] = var_0.primaryweapon;

    if ( isdefined( var_0._id_F0C4 ) )
        var_2[var_2.size] = var_0._id_F0C4;

    if ( var_2.size > 0 )
        self _meth_84ED( var_2, var_1 );

    self _meth_84FC( var_0._id_2C09, var_0._id_8C59, var_1 );
}

_id_1CB6( var_0 )
{
    var_1 = [];

    if ( isdefined( var_0.primaryweapon ) )
        var_1[var_1.size] = var_0.primaryweapon;

    if ( isdefined( var_0._id_F0C4 ) )
        var_1[var_1.size] = var_0._id_F0C4;

    if ( !self _meth_84EE( var_1 ) )
        return 0;

    if ( !self _meth_8510( var_0._id_2C09 ) )
        return 0;

    return 1;
}

_id_108F2( var_0 )
{
    self endon( "disconnect" );
    self endon( "joined_spectators" );
    self notify( "spawned" );
    self notify( "end_respawn" );
    self notify( "started_spawnPlayer" );

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = undefined;
    self._id_1189A = 0;
    self setclientomnvar( "ui_options_menu", 0 );
    self setclientomnvar( "ui_hud_shake", 0 );
    self._id_A9A6 = undefined;
    self._id_4C87 = undefined;
    self.killsteakvariantattackerinfo = undefined;
    self.cratemantle = undefined;

    if ( !level.ingraceperiod && !self._id_8BE9 )
    {
        level._id_C23D++;

        if ( level._id_C23D > 1 )
        {
            self._id_13700 = 1;
            wait( 0.05 * ( level._id_C23D - 1 ) );
        }

        thread _id_108DC();
        self._id_13700 = 0;
    }

    var_2 = spawnstruct();
    _id_806C( var_2, self.class );
    _id_AEAD( var_2, 1 );

    if ( !getomnvar( "ui_prematch_period" ) )
    {
        if ( !_id_1CB6( var_2 ) )
        {
            var_3 = scripts\mp\tweakables::_id_81E7( "player", "streamingwaittime" );
            var_4 = var_3 * 1000;
            var_5 = gettime() + var_4;
            self._id_13700 = 1;
            wait 0.1;

            while ( !_id_1CB6( var_2 ) )
            {
                wait 0.1;

                if ( gettime() > var_5 )
                    break;
            }

            self._id_13700 = 0;
        }
    }

    if ( isdefined( self._id_72E2 ) )
    {
        var_6 = self._id_72E2;
        self._id_72E2 = undefined;

        if ( isdefined( self._id_72E0 ) )
        {
            var_7 = self._id_72E0;
            self._id_72E0 = undefined;
        }
        else
            var_7 = ( 0, randomfloatrange( 0, 360 ), 0 );
    }
    else if ( isdefined( self._id_F851 ) && ( isdefined( self._id_F851._id_C188 ) || _id_119A9() ) )
    {
        var_1 = self._id_F851;

        if ( !isdefined( self._id_F851._id_C188 ) )
        {
            self._id_1189A = 1;
            self playlocalsound( "tactical_spawn" );

            if ( level._id_BDCC )
            {
                foreach ( var_9 in level._id_115DA )
                {
                    if ( var_9 != self.team )
                        self playsoundtoteam( "tactical_spawn", var_9 );
                }
            }
            else if ( level.teambased )
                self playsoundtoteam( "tactical_spawn", level._id_C74B[self.team] );
            else
                self playsound( "tactical_spawn" );
        }

        foreach ( var_12 in level._id_12B14 )
        {
            if ( distancesquared( var_12.origin, var_1._id_D424 ) < 1024 )
                var_12 notify( "damage", 5000, var_12.owner, ( 0, 0, 0 ), ( 0, 0, 0 ), "MOD_EXPLOSIVE", "", "", "", undefined, "killstreak_jammer_mp" );
        }

        var_6 = self._id_F851._id_D424;
        var_7 = self._id_F851.angles;

        if ( isdefined( self._id_F851._id_6578 ) )
            self._id_F851._id_6578 delete();

        self._id_F851 delete();
        var_1 = undefined;
    }
    else if ( isdefined( self._id_9F69 ) && isdefined( self._id_28CC ) )
    {
        var_6 = undefined;
        var_7 = undefined;
        var_14 = scripts\mp\battlebuddy::_id_3DF5();

        if ( var_14._id_10E5B == 0 )
        {
            var_6 = var_14.origin;
            var_7 = var_14.angles;
        }
        else
        {
            var_1 = self [[ level.getspawnpoint ]]();
            var_6 = var_1.origin;
            var_7 = var_1.angles;
        }

        scripts\mp\battlebuddy::_id_40E7();
        self setclientomnvar( "cam_scene_name", "battle_spawn" );
        self setclientomnvar( "cam_scene_lead", self._id_28CC getentitynumber() );
        self setclientomnvar( "cam_scene_support", self getentitynumber() );
    }
    else if ( isdefined( self._id_8DD8 ) && ( !isdefined( self._id_6DED ) || isdefined( self._id_6DED ) && self._id_6DED ) && level._id_D84D > 0 && self.team == "allies" )
    {
        while ( !isdefined( level._id_1C29 ) )
            wait 0.1;

        var_6 = level._id_1C29.origin;
        var_7 = level._id_1C29.angles;
        self._id_6DED = 0;
    }
    else if ( isdefined( self._id_8DD8 ) && ( !isdefined( self._id_6DED ) || isdefined( self._id_6DED ) && self._id_6DED ) && level._id_D84D > 0 && self.team == "axis" )
    {
        while ( !isdefined( level._id_26F5 ) )
            wait 0.1;

        var_6 = level._id_26F5.origin;
        var_7 = level._id_26F5.angles;
        self._id_6DED = 0;
    }
    else
    {
        var_1 = self [[ level.getspawnpoint ]]();
        var_6 = var_1.origin;
        var_7 = var_1.angles;
    }

    _id_F853();
    var_15 = self._id_8C2A;
    self.fauxdeath = undefined;

    if ( !var_0 )
    {
        self._id_A684 = [];
        self._id_A685 = [];
        self._id_A6B4 = [];
        scripts\mp\utility\game::updatesessionstate( "playing" );
        scripts\mp\utility\game::_id_41BF();
        self._id_3881 = undefined;
        self.maxhealth = scripts\mp\tweakables::_id_81E7( "player", "maxhealth" );
        self.health = self.maxhealth;
        self._id_7408 = undefined;
        self._id_8C2A = 1;
        self._id_10916 = gettime();
        self._id_1391E = !isdefined( var_1 );
        self._id_18DF = 0;
        self._id_4D44 = [];
        self._id_A6AD = 1;
        self._id_C2AD = 1;
        self._id_4000 = undefined;
        self._id_FC96 = 0;
        self._id_FC97 = 0;
        self._id_FC95 = 0;
        self._id_DDCC = 0;
        self._id_AA43 = undefined;
        self._id_AC68 = 0;

        if ( isdefined( self.pers["deaths"] ) )
            self._id_AC68 = self.pers["deaths"];

        scripts\mp\utility\game::_id_41A6();
        scripts\mp\killcam::clearkillcamomnvars();
        thread monitorwallrun();
    }

    self._id_BCF6 = 1;
    self._id_98F3 = 0;
    self.laststand = undefined;
    self._id_94A2 = undefined;
    self._id_93BB = undefined;

    if ( !var_0 )
    {
        self._id_26B9 = 4.0;
        var_16 = self.pers["lives"];

        if ( var_16 == scripts\mp\utility\game::getgametypenumlives() )
            _id_1853();

        if ( var_16 )
            self.pers["lives"]--;

        _id_1845();

        if ( !var_15 || scripts\mp\utility\game::_id_7672() || scripts\mp\utility\game::_id_7672() && level.ingraceperiod && self._id_8BE9 )
            _id_E112();

        if ( !self._id_13906 )
        {
            var_17 = 20;

            if ( scripts\mp\utility\game::_id_81CA() > 0 && var_17 < scripts\mp\utility\game::_id_81CA() * 60 / 4 )
                var_17 = scripts\mp\utility\game::_id_81CA() * 60 / 4;

            if ( level.ingraceperiod || scripts\mp\utility\game::_id_81CB() < var_17 * 1000 )
                self._id_13906 = 1;
        }
    }

    self setdepthoffield( 0, 0, 512, 512, 4, 0 );

    if ( level._id_4542 )
        self setclientdvar( "cg_fov", "63" );

    if ( isdefined( var_1 ) )
    {
        scripts\mp\spawnlogic::_id_6C5B( var_1 );
        var_6 = _id_8135( var_1 );
        var_7 = var_1.angles;
    }
    else if ( !isdefined( self._id_6BA5 ) )
        self.lastspawntime = gettime();

    self._id_108FF = var_6;

    if ( var_0 && scripts\mp\gameobjects::touchingarbitraryuptrigger() )
    {
        if ( self isonground() )
        {
            self _meth_8518();
            var_6 -= ( 0, 0, 80 );
        }

        var_7 = self _meth_8517();
    }

    self spawn( var_6, var_7 );

    if ( var_0 && isdefined( self._id_6BA6 ) )
    {
        self setstance( self._id_6BA6 );
        self._id_6BA6 = undefined;
    }

    if ( isai( self ) )
        scripts\mp\utility\game::_id_7385( 1 );

    self _meth_8209();
    [[ level.onspawnplayer ]]();

    if ( isdefined( var_1 ) )
        _id_3E42( var_1.origin );

    if ( !var_0 )
    {
        if ( isai( self ) && isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["player_spawned"] ) )
            self [[ level.bot_funcs["player_spawned"] ]]();

        if ( !isai( self ) )
            thread _id_13A6C();

        if ( isdefined( level._id_B3FB ) )
            [[ level._id_B3FB ]]( self._id_41F0, self.team, "SPAWN", self._id_108FF[0], self._id_108FF[1], self._id_10916 );

        if ( !isai( self ) )
        {
            if ( !isdefined( self.pers["distTrackingPassed"] ) )
                thread totaldisttracking( var_6 );

            thread stancespamtracking();
        }
    }

    if ( !var_0 )
    {
        self._id_B3E3 = scripts\mp\matchdata::_id_AFD6();
        self.lastmatchdatakillstreakindex = -1;
        thread _id_DDED();

        if ( self ishost() )
            setmatchdata( "players", self._id_41F0, "wasAHost", 1 );
    }

    scripts\mp\class::_id_F691( self.class );

    if ( isdefined( level._id_4C55 ) )
        self [[ level._id_4C55 ]]( var_0 );
    else
        scripts\mp\class::giveloadout( self.team, self.class );

    self _meth_84BE( "player_mp" );

    if ( isdefined( game["roundsPlayed"] ) && game["roundsPlayed"] > 0 )
    {
        if ( !isdefined( self._id_400D ) || !self._id_400D )
        {
            if ( isdefined( self._id_4006 ) )
            {
                self setclientomnvar( "ui_loadout_selected", self._id_4006 );
                self._id_400D = 1;
            }
        }
    }

    if ( getdvarint( "camera_thirdPerson" ) )
        scripts\mp\utility\game::_id_F887( 1 );

    if ( !scripts\mp\utility\game::_id_766C( "prematch_done" ) )
        _id_1CA2( self );
    else
        scripts\mp\utility\game::_id_7385( 0 );

    if ( scripts\mp\utility\game::_id_7F1D( "scr_showperksonspawn", 1 ) == 1 && game["state"] != "postgame" )
    {
        scripts\mp\perks::_id_F7C5( "ui_spawn_perk_", self.pers["loadoutPerks"] );
        self setclientomnvar( "ui_spawn_abilities_show", 1 );
    }

    waittillframeend;
    self._id_108DB = undefined;
    self notify( "spawned_player" );
    level notify( "player_spawned", self );
    thread _id_F850();

    if ( game["state"] == "postgame" )
        scripts\mp\gamelogic::_id_7386();

    if ( scripts\mp\analyticslog::_id_1E6A() && !var_0 )
    {
        if ( scripts\mp\analyticslog::_id_1E5E() )
            level._id_10841 += 1;
        else
            scripts\mp\analyticslog::_id_1E60();

        if ( scripts\mp\analyticslog::_id_1E65( level._id_10841 ) )
        {
            if ( isdefined( level._id_108D1._id_108FD ) )
            {
                scripts\mp\analyticslog::_id_1E66( self, self._id_108FD, level._id_10841, var_1 );
                scripts\mp\analyticslog::_id_1E68( var_1.origin, self.team, self._id_AC68, level._id_10841 );
                scripts\mp\analyticslog::_id_1E67( self, var_1.origin, level._id_10841 );
            }
        }

        self._id_A9F4 = var_1;
    }
}

_id_F850()
{
    self endon( "disconnect" );
    scripts\engine\utility::waitframe();
    self setclientomnvar( "ui_player_spawned_notify", gettime() );
}

_id_DDED()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( scripts\mp\matchdata::_id_38C6( self ) )
    {
        for (;;)
        {
            var_0 = self._id_B3E3;

            if ( !isdefined( var_0 ) )
                var_0 = -1;

            var_1 = scripts\mp\utility\game::_id_9EE8();
            var_2 = scripts\mp\matchdata::_id_81C8( gettime() );
            var_3 = var_2 / 1000;
            self _meth_8571( var_3, var_0, var_1 );
            wait 2.0;
        }
    }
}

_id_1CA2( var_0 )
{
    var_0 _meth_8423( 0 );
    var_0 scripts\engine\utility::_id_1C46( 0 );
    var_0 scripts\engine\utility::_id_1C58( 0 );
    var_0 scripts\engine\utility::_id_1C4E( 0 );
    var_0._id_D84C = 1;
}

_id_41D1( var_0 )
{
    if ( scripts\engine\utility::_id_9CEE( var_0._id_D84C ) )
    {
        var_0 _meth_8423( 1 );
        var_0 scripts\engine\utility::_id_1C46( 1 );
        var_0 scripts\engine\utility::_id_1C58( 1 );
        var_0 scripts\engine\utility::_id_1C4E( 1 );
        var_0._id_D84C = undefined;
    }
}

waitforversusmenudone()
{
    level endon( "prematch_over" );
    self endon( "versus_menu_done" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 == "versus_done" )
            self notify( "versus_menu_done" );
    }
}

_id_10912( var_0 )
{
    var_1 = 6;
    self endon( "disconnect" );

    if ( isai( self ) )
        return;

    if ( level._id_10A56 || self issplitscreenplayer() )
        self setclientdvars( "cg_fovscale", "0.65" );
    else
        self setclientdvars( "cg_fovscale", "1" );

    self setclientomnvar( "ui_mapshot_camera", 1 );
    self _meth_8553( "mapflyover" );
    var_2 = scripts\engine\utility::_id_8180( "camera_intro", "targetname" );

    if ( var_2.size == 0 )
    {
        self _meth_83F8( "", 0.75 );
        return;
    }

    var_3 = undefined;
    var_4 = undefined;
    _id_F853();
    scripts\mp\utility\game::_id_41C4( "spawn_info" );
    scripts\mp\utility\game::updatesessionstate( "spectator" );
    self.pers["team"] = "spectator";
    self.team = "spectator";
    scripts\mp\utility\game::_id_41BF();
    self._id_7408 = undefined;
    _id_E27B();
    self allowspectateteam( "allies", 0 );
    self allowspectateteam( "axis", 0 );
    self allowspectateteam( "freelook", 0 );
    self allowspectateteam( "none", 0 );

    if ( isdefined( var_2 ) && var_2.size > 1 )
    {
        var_5 = randomintrange( 0, var_2.size - 1 );
        var_3 = var_2[var_5];
    }
    else if ( isdefined( var_2 ) )
        var_3 = var_2[0];
    else
    {

    }

    var_3._id_6C01 = 1;
    scripts\mp\utility\game::_id_7385( 1 );
    self _meth_833E( var_3.origin, var_3.angles );
    self spawn( var_3.origin, var_3.angles );
    _id_3E42( var_3.origin );
    var_6 = spawn( "script_model", var_3.origin );
    var_6 setmodel( "tag_origin" );
    var_6.angles = var_3.angles;
    thread waitforversusmenudone();

    if ( isdefined( var_0 ) && var_0 == 99 )
        var_7 = "debug";
    else if ( scripts\mp\utility\game::_id_766C( "prematch_done" ) )
        var_7 = "prematch_over";
    else if ( self.versusdone )
        var_7 = "versus_menu_done";
    else
        var_7 = scripts\engine\utility::_id_13736( 2, "versus_menu_done", "prematch_over" );

    if ( var_7 == "timeout" )
    {
        if ( scripts\mp\utility\game::_id_766C( "prematch_done" ) )
            var_7 = "prematch_over";
        else
            var_7 = "versus_menu_done";
    }

    if ( var_7 == "prematch_over" )
    {
        self _meth_83F8( "", 0.75 );
        return;
    }

    if ( self issplitscreenplayer() && self isreloading() )
    {
        var_8 = self _meth_81BC();
        var_8 notify( "versus_menu_done" );
        wait 0.05;
    }

    self cameralinkto( var_6, "tag_origin" );
    var_9 = scripts\mp\utility\game::_id_7F8B();
    self notify( "mapCamera_start" );

    switch ( var_9 )
    {
        case "mp_parkour":
            var_6 _meth_8294( "iw7_mp_intro_camera_parkour", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_frontier":
            var_6 _meth_8294( "iw7_mp_intro_camera_frontier", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_fallen":
            var_6 _meth_8294( "iw7_mp_intro_camera_fallen", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_proto":
            var_6 _meth_8294( "iw7_mp_intro_camera_proto", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_metropolis":
            var_6 _meth_8294( "iw7_mp_intro_camera_metropolis", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_dome_iw":
            var_6 _meth_8294( "iw7_mp_intro_camera_dome_iw", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_breakneck":
            var_6 _meth_8294( "iw7_mp_intro_camera_breakneck", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_desert":
            var_6 _meth_8294( "iw7_mp_intro_camera_desert", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_divide":
            var_6 _meth_8294( "iw7_mp_intro_camera_divide", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_quarry":
            var_6 _meth_8294( "iw7_mp_intro_camera_quarry", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_skyway":
            var_6 _meth_8294( "iw7_mp_intro_camera_skyway", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_rivet":
            var_6 _meth_8294( "iw7_mp_intro_camera_rivet", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_riot":
            var_6 _meth_8294( "iw7_mp_intro_camera_riot", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_dome_dusk":
            var_6 _meth_8294( "iw7_mp_intro_camera_dome_iw", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_geneva":
            var_6 _meth_8294( "iw7_mp_intro_camera_geneva", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_renaissance2":
            var_6 _meth_8294( "iw7_mp_intro_camera_geneva", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_afghan":
            var_6 _meth_8294( "iw7_mp_intro_camera_afghan", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_neon":
            var_6 _meth_8294( "iw7_mp_intro_camera_neon", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_prime":
            var_6 _meth_8294( "iw7_mp_intro_camera_prime", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_flip":
            var_6 _meth_8294( "iw7_mp_intro_camera_flip", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_mansion":
            var_6 _meth_8294( "iw7_mp_intro_camera_mansion", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_marsoasis":
            var_6 _meth_8294( "iw7_mp_intro_camera_marsoasis", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_junk":
            var_6 _meth_8294( "iw7_mp_intro_camera_junk", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_turista2":
            var_6 _meth_8294( "iw7_mp_intro_camera_marsoasis", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_overflow":
            var_6 _meth_8294( "iw7_mp_intro_camera_overflow", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_permafrost2":
            var_6 _meth_8294( "iw7_mp_intro_camera_overflow", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_nova":
            var_6 _meth_8294( "iw7_mp_intro_camera_nova", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_paris":
            var_6 _meth_8294( "iw7_mp_intro_camera_paris", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_pixel":
            var_6 _meth_8294( "iw7_mp_intro_camera_pixel", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_hawkwar":
            var_6 _meth_8294( "iw7_mp_intro_camera_hawkwar", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_rally":
            var_6 _meth_8294( "iw7_mp_intro_camera_rally", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_carnage2":
            var_6 _meth_8294( "iw7_mp_intro_camera_rally", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_depot":
            var_6 _meth_8294( "iw7_mp_intro_camera_depot", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        case "mp_codphish":
            var_6 _meth_8294( "iw7_mp_intro_camera_codphish", 1 );
            self _meth_83F8( "", 0.75 );
            self playlocalsound( "mp_camera_intro_whoosh" );
            wait( var_1 - 0.25 );
            return;
        default:
            break;
    }

    wait 0.25;
    self _meth_83F8( "", 0.75 );
    self playlocalsound( "mp_camera_intro_whoosh" );
    var_10 = var_3;
    var_4 = scripts\engine\utility::_id_817E( var_3._id_0334, "targetname" );
    var_11 = 0;

    for (;;)
    {
        if ( isdefined( var_10._id_10992 ) )
        {
            var_12 = 1 / var_10._id_10992;
            var_13 = var_12 * distance( var_10.origin, var_4.origin );
        }
        else
            var_13 = distance( var_10.origin, var_4.origin );

        var_11 += var_13;
        var_10._id_5708 = var_13;
        var_10 = var_4;

        if ( isdefined( var_10._id_0334 ) )
        {
            var_4 = scripts\engine\utility::_id_817E( var_10._id_0334, "targetname" );
            continue;
        }

        break;
    }

    var_10._id_666E = 1;
    var_10 = var_3;
    var_4 = scripts\engine\utility::_id_817E( var_3._id_0334, "targetname" );

    for (;;)
    {
        var_14 = var_10._id_5708 / var_11;
        var_15 = var_14 * var_1;

        if ( isdefined( var_4._id_666E ) )
            var_16 = var_15 / 2;
        else
            var_16 = 0;

        if ( isdefined( var_10._id_6C01 ) )
            var_17 = var_15 / 2;
        else
            var_17 = 0;

        var_6 moveto( var_4.origin, var_15, var_17, var_16 );
        var_6 rotateto( var_4.angles, var_15, var_17, var_16 );

        if ( isdefined( var_4._id_666E ) )
        {
            var_18 = int( var_15 / 2 );
            wait( var_18 );
            wait( var_18 );
        }
        else
            wait( var_15 );

        var_10 = var_4;

        if ( isdefined( var_10._id_0334 ) )
        {
            var_4 = scripts\engine\utility::_id_817E( var_10._id_0334, "targetname" );
            continue;
        }

        break;
    }

    scripts\mp\utility\game::_id_7385( 0 );
    self._id_10D78 = var_6;
    self setclientomnvar( "ui_mapshot_camera", 0 );
}

_id_10911( var_0, var_1 )
{
    self notify( "spawned" );
    self notify( "end_respawn" );
    self notify( "joined_spectators" );

    if ( isdefined( self.deathspectatepos ) )
    {
        var_0 = self.deathspectatepos;
        var_1 = vectortoangles( self.origin - self.deathspectatepos );
    }

    if ( isdefined( self._id_10D78 ) && !isdefined( var_0 ) )
    {
        var_0 = self._id_10D78.origin;
        var_1 = self._id_10D78.angles;
        self._id_10D78 delete();
    }

    _id_93A5( var_0, var_1 );
}

_id_E285( var_0, var_1 )
{
    if ( isdefined( self.deathspectatepos ) )
    {
        var_0 = self.deathspectatepos;
        var_1 = vectortoangles( self.origin - self.deathspectatepos );
    }

    _id_93A5( var_0, var_1 );
}

_id_93A5( var_0, var_1 )
{
    _id_F853();
    var_2 = self.pers["team"];

    if ( isdefined( var_2 ) && var_2 == "spectator" && !level._id_7669 )
        scripts\mp\utility\game::_id_41C4( "spawn_info" );

    scripts\mp\utility\game::updatesessionstate( "spectator" );
    scripts\mp\utility\game::_id_41BF();
    self._id_7408 = undefined;
    _id_E27B();
    _id_0AF0::_id_F857();
    _id_C5A0( var_0, var_1 );

    if ( level.teambased && !level._id_10A56 && !self issplitscreenplayer() )
        self setdepthoffield( 0, 128, 512, 4000, 6, 1.8 );
}

_id_8072( var_0 )
{
    if ( var_0 < 0 )
        return undefined;

    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        if ( level.players[var_1] getentitynumber() == var_0 )
            return level.players[var_1];
    }

    return undefined;
}

_id_C5A0( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        self _meth_833E( var_0, var_1 );
        self spawn( var_0, var_1 );
        _id_3E42( var_0 );
        return;
    }

    var_2 = _id_8148();
    var_3 = 8;

    if ( isdefined( level._id_37C8 ) && level._id_37C8.size )
    {
        for ( var_4 = 0; var_4 < level.camerahighestindex + 1 && var_4 < var_3; var_4++ )
        {
            if ( !isdefined( level._id_37C8[var_4] ) || !isdefined( level._id_37C1[var_4] ) )
                continue;

            self _meth_830C( var_4, level._id_37C8[var_4], level._id_37C1[var_4] );
            level._id_37C3[var_4].origin = level._id_37C8[var_4];
            level._id_C215[var_4].origin = level._id_37C8[var_4];
            level._id_37C3[var_4].angles = level._id_37C1[var_4];
            level._id_C215[var_4].angles = level._id_37C1[var_4];
        }
    }
    else
    {
        for ( var_4 = 0; var_4 < var_3; var_4++ )
            self _meth_830C( var_4, var_2.origin, var_2.angles );
    }

    self _meth_833E( var_2.origin, var_2.angles );
    self spawn( var_2.origin, var_2.angles );
    _id_3E42( var_2.origin );
}

_id_8148()
{
    var_0 = getentarray( "mp_global_intermission", "classname" );
    var_1 = scripts\mp\spawnlogic::_id_813C( var_0 );
    return var_1;
}

_id_108DD()
{
    self endon( "disconnect" );
    self notify( "spawned" );
    self notify( "end_respawn" );
    _id_F853();
    scripts\mp\utility\game::_id_41C5();
    scripts\mp\utility\game::_id_7385( 1 );
    self setclientdvar( "cg_everyoneHearsEveryone", 1 );

    if ( isdefined( level._id_6C6F ) && level._id_6C6F != "none" && isdefined( level._id_B3D9 ) && scripts\mp\utility\game::_id_13916() && !scripts\mp\utility\game::istrue( level._id_58D7 ) )
        wait( level._id_B3D9 );

    if ( !scripts\mp\utility\game::istrue( level._id_58D7 ) )
        scripts\mp\utility\game::updatesessionstate( "intermission" );

    scripts\mp\utility\game::_id_41BF();
    self._id_7408 = undefined;
    var_0 = getentarray( "mp_global_intermission", "classname" );
    var_0 = scripts\mp\spawnscoring::_id_3E05( var_0 );
    var_1 = var_0[0];

    if ( !isdefined( level._id_4C4E ) )
    {
        self spawn( var_1.origin, var_1.angles );
        _id_3E42( var_1.origin );
        self setdepthoffield( 0, 128, 512, 4000, 6, 1.8 );
    }
    else
        level notify( "scoreboard_displaying" );

    scripts\mp\utility\game::_id_7385( 1 );
}

_id_10857()
{
    if ( 1 )
    {
        if ( isdefined( level._id_4C4E ) && scripts\mp\utility\game::_id_13916() )
            level notify( "start_custom_ending" );

        if ( !self._id_45D6 )
            scripts\mp\utility\game::_id_7385( 1 );

        if ( scripts\mp\utility\game::istrue( level._id_58D7 ) )
        {
            self notify( "spawned" );
            scripts\mp\utility\game::_id_41BF();
        }
        else
        {
            _id_10911();
            scripts\mp\utility\game::_id_7385( 1 );
        }

        return;
    }

    self notify( "spawned" );
    self notify( "end_respawn" );
    _id_F853();
    scripts\mp\utility\game::_id_41C5();
    self setclientdvar( "cg_everyoneHearsEveryone", 1 );
    scripts\mp\utility\game::updatesessionstate( "dead" );
    scripts\mp\utility\game::_id_41BF();
    self._id_7408 = undefined;
    var_0 = _id_8148();
    _id_10911( var_0.origin, var_0.angles );
    _id_3E42( var_0.origin );
    scripts\mp\utility\game::_id_7385( 1 );
    self setdepthoffield( 0, 0, 512, 512, 4, 0 );
}

_id_F853()
{
    self _meth_83AA();
    self _meth_83A9( "damage_heavy" );
    self._id_4E55 = undefined;
}

_id_C15D()
{
    waittillframeend;

    if ( isdefined( self ) )
        level notify( "connecting", self );
}

callback_playerdisconnect( var_0 )
{
    if ( !isdefined( self.connected ) )
        return;

    if ( scripts\mp\utility\game::_id_9F32() )
        setmatchdata( "players", self._id_41F0, "playerQuitRoundNumber", game["roundsPlayed"] );

    if ( level.teambased )
    {
        if ( isdefined( self.team ) )
        {
            if ( self.team == "allies" )
            {
                setmatchdata( "players", self._id_41F0, "playerQuitTeamScore", getteamscore( "allies" ) );
                setmatchdata( "players", self._id_41F0, "playerQuitOppposingTeamScore", getteamscore( "axis" ) );
            }
            else if ( self.team == "axis" )
            {
                setmatchdata( "players", self._id_41F0, "playerQuitTeamScore", getteamscore( "axis" ) );
                setmatchdata( "players", self._id_41F0, "playerQuitOppposingTeamScore", getteamscore( "allies" ) );
            }
        }
    }

    setmatchdata( "players", self._id_41F0, "utcDisconnectTimeSeconds", getsystemtime() );
    setmatchdata( "players", self._id_41F0, "disconnectReason", var_0 );
    self _meth_859C( self._id_41F0, var_0 );
    var_1 = _func_0AD( "commonMatchData", "playerCountLeft" );
    var_1++;
    setmatchdata( "commonMatchData", "playerCountLeft", var_1 );

    if ( scripts\mp\utility\game::_id_DCD5() )
        scripts\mp\matchdata::_id_AFB9();

    if ( scripts\mp\utility\game::_id_9D92() )
        self _meth_84E3();

    scripts\mp\matchdata::_id_AFD4();

    if ( isdefined( self.pers["confirmed"] ) )
        scripts\mp\matchdata::_id_AFC6();

    if ( isdefined( self.pers["denied"] ) )
        scripts\mp\matchdata::_id_AFC7();

    _id_E15B();
    scripts\mp\spawnlogic::_id_E113();
    scripts\mp\spawnlogic::_id_E106();
    var_2 = self getentitynumber();

    if ( !level.teambased )
        game["roundsWon"][self.guid] = undefined;

    if ( level._id_10A56 )
    {
        var_3 = level.players;

        if ( var_3.size <= 1 )
            level thread scripts\mp\gamelogic::_id_72BE();
    }

    if ( isdefined( self.kills ) && isdefined( self.deaths ) )
    {
        if ( 120 < self._id_1190E["total"] )
        {
            var_4 = ( self.kills - self.deaths ) / ( self._id_1190E["total"] / 60 );
            setplayerteamrank( self, self._id_41F0, var_4 );
        }
    }
    else
    {

    }

    var_5 = self getentitynumber();
    var_6 = self.guid;
    logprint( "Q;" + var_6 + ";" + var_5 + ";" + self.name + "\\n" );
    thread scripts\mp\events::_id_5638();

    if ( level._id_7669 )
        scripts\mp\gamescore::_id_E0ED();

    if ( isdefined( self.team ) )
        _id_E11D();

    if ( self.sessionstate == "playing" && !( isdefined( self.fauxdeath ) && self.fauxdeath ) )
        removefromalivecount( 1 );
    else if ( self.sessionstate == "spectator" || self.sessionstate == "dead" )
        level thread scripts\mp\gamelogic::_id_12E9D();
}

_id_E15B()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < level.players.size; var_1++ )
    {
        if ( level.players[var_1] == self )
        {
            for ( var_0 = 1; var_1 < level.players.size - 1; var_1++ )
                level.players[var_1] = level.players[var_1 + 1];

            level.players[var_1] = undefined;
            break;
        }
    }
}

_id_97EA()
{
    if ( level._id_10A56 || self issplitscreenplayer() )
    {
        self setclientdvars( "cg_fovscale", "0.75" );
        setdvar( "r_materialBloomHQScriptMasterEnable", 0 );
    }
    else
        self setclientdvars( "cg_fovscale", "1" );
}

_id_97E9()
{
    setdvar( "cg_drawCrosshair", 1 );
    setdvar( "cg_drawCrosshairNames", 1 );

    if ( level._id_8B38 )
    {
        setdvar( "cg_drawCrosshair", 0 );
        setdvar( "cg_drawCrosshairNames", 1 );
    }

    if ( isdefined( level._id_1D5D ) && level._id_1D5D )
        setdvar( "cg_drawFriendlyNamesAlways", 1 );
    else
        setdvar( "cg_drawFriendlyNamesAlways", 0 );

    self setclientdvars( "cg_drawSpectatorMessages", 1 );
    _id_97EA();

    if ( scripts\mp\utility\game::getgametypenumlives() )
        self setclientdvars( "cg_deadChatWithDead", 1, "cg_deadChatWithTeam", 0, "cg_deadHearTeamLiving", 0, "cg_deadHearAllLiving", 0 );
    else
        self setclientdvars( "cg_deadChatWithDead", 0, "cg_deadChatWithTeam", 1, "cg_deadHearTeamLiving", 1, "cg_deadHearAllLiving", 0 );

    if ( level.teambased )
        self setclientdvars( "cg_everyonehearseveryone", 0 );

    self setclientdvar( "ui_altscene", 0 );

    if ( getdvarint( "scr_hitloc_debug" ) )
    {
        for ( var_0 = 0; var_0 < 6; var_0++ )
            self setclientdvar( "ui_hitloc_" + var_0, "" );

        self._id_903A = 1;
    }
}

_id_7F87()
{
    var_0 = 0;

    for ( var_1 = 0; var_1 < 30; var_1++ )
    {
        foreach ( var_3 in level.players )
        {
            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3._id_41F0 == var_1 )
            {
                var_0 = 1;
                break;
            }

            var_0 = 0;
        }

        if ( !var_0 )
            return var_1;
    }
}

_id_FAE7()
{
    self._id_EB6A = [];

    for ( var_0 = 1; var_0 <= 4; var_0++ )
    {
        self._id_EB6A[var_0] = spawnstruct();
        self._id_EB6A[var_0].type = "";
        self._id_EB6A[var_0]._id_0195 = undefined;
    }

    if ( !level._id_4542 )
    {
        for ( var_0 = 5; var_0 <= 8; var_0++ )
        {
            self._id_EB6A[var_0] = spawnstruct();
            self._id_EB6A[var_0].type = "";
            self._id_EB6A[var_0]._id_0195 = undefined;
        }
    }
}

connect_validateplayerteam()
{
    if ( !isdefined( self ) )
        return;

    if ( self._id_0291 == "none" && scripts\mp\utility\game::matchmakinggame() && level.teambased && !isdefined( self.pers["isBot"] ) && !self ismlgspectator() && level.gametype != "infect" )
    {
        bbprint( "mp_invalid_team_error", "player_xuid %s isHost %i", self getxuid(), self ishost() );
        wait 1.5;
        kick( self getentitynumber(), "EXE_PLAYERKICKED_INVALIDTEAM" );
    }
}

queueconnectednotify()
{
    for (;;)
    {
        if ( !isdefined( level.players_waiting_for_callback ) )
        {
            wait 0.05;
            continue;
        }

        break;
    }

    for (;;)
    {
        for ( var_0 = 0; var_0 < level.players_waiting_for_callback.size; var_0++ )
        {
            var_1 = level.players_waiting_for_callback[var_0];

            if ( isdefined( var_1 ) )
            {
                level notify( "connected", var_1 );
                var_1 notify( "connected_continue" );
                level.players_waiting_for_callback[var_0] = undefined;
                break;
            }
        }

        var_2 = scripts\mp\utility\game::_id_403F( level.players_waiting_for_callback );
        level.players_waiting_for_callback = var_2;
        wait 0.05;
    }
}

watchforversusdone()
{
    self endon( "disconnect" );
    self.versusdone = 0;

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 == "versus_done" )
        {
            self.versusdone = 1;
            return;
        }
    }
}

monitorplayersegments( var_0 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    createplayersegmentstats( var_0 );

    for (;;)
    {
        var_0 waittill( "spawned_player" );
        recordsegmentdata( var_0 );
    }
}

createplayersegmentstats( var_0 )
{
    var_0._id_F18B = [];
    var_0._id_F18B["distanceTotal"] = 0;
    var_0._id_F18B["movingTotal"] = 0;
    var_0._id_F18B["movementUpdateCount"] = 0;
}

recordsegmentdata( var_0 )
{
    var_0 endon( "death" );

    while ( !scripts\mp\utility\game::_id_766C( "prematch_done" ) )
        wait 0.5;

    wait 4;
    var_0.savedsegmentposition = var_0.origin;
    var_0.positionptm = var_0.origin;

    for (;;)
    {
        wait 1;

        if ( var_0 scripts\mp\utility\game::isusingremote() )
        {
            var_0 waittill( "stopped_using_remote" );
            var_0.savedsegmentposition = var_0.origin;
            var_0.positionptm = var_0.origin;
            continue;
        }

        var_0._id_F18B["movementUpdateCount"]++;
        var_0._id_F18B["distanceTotal"] += distance2d( var_0.savedsegmentposition, var_0.origin );
        var_0.savedsegmentposition = var_0.origin;

        if ( var_0._id_F18B["movementUpdateCount"] % 5 == 0 )
        {
            var_1 = distance2d( var_0.positionptm, var_0.origin );
            var_0.positionptm = var_0.origin;

            if ( var_1 > 16 )
                var_0._id_F18B["movingTotal"]++;
        }
    }
}

writesegmentdata( var_0 )
{
    var_0 endon( "disconnect" );

    if ( var_0._id_F18B["movementUpdateCount"] < 30 )
        return;

    var_1 = var_0._id_F18B["movingTotal"] / ( var_0._id_F18B["movementUpdateCount"] / 5 ) * 100;
    var_2 = var_0._id_F18B["distanceTotal"] / var_0._id_F18B["movementUpdateCount"];
    setmatchdata( "players", var_0._id_41F0, "averageSpeedDuringMatch", var_2 );
    setmatchdata( "players", var_0._id_41F0, "percentageOfTimeMoving", var_1 );
}

callback_playerconnect()
{
    thread _id_C15D();
    thread watchforversusdone();
    self._id_02C7 = "hud_status_connecting";
    self waittill( "begin" );
    self._id_02C7 = "";
    self.connecttime = undefined;
    self _meth_83F8( "bw", 0 );
    level.players_waiting_for_callback[level.players_waiting_for_callback.size] = self;
    self waittill( "connected_continue" );
    self.connected = 1;
    self setclientomnvar( "ui_scoreboard_freeze", 0 );

    if ( self ishost() )
        level.player = self;

    if ( !level._id_10A56 && !isdefined( self.pers["score"] ) )
        iprintln( &"MP_CONNECTED", self );

    self._id_13114 = self isusingonlinedataoffline();
    _id_97E9();
    _id_98BE();

    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        level waittill( "eternity" );

    self.guid = scripts\mp\utility\game::_id_81EC();
    var_0 = 0;
    var_1 = 0;

    if ( !isdefined( self.pers["clientid"] ) )
    {
        for ( var_2 = 0; var_2 < 30; var_2++ )
        {
            var_3 = _func_0AD( "players", var_2, "playerID", "xuid" );

            if ( var_3 == self.guid )
            {
                self.pers["clientid"] = var_2;
                var_1 = 1;
                var_4 = _func_0AD( "commonMatchData", "playerCountReconnected" );
                var_4++;
                setmatchdata( "commonMatchData", "playerCountReconnected", var_4 );
                setmatchdata( "players", var_2, "utcReconnectTimeSeconds", getsystemtime() );
                break;
            }
        }

        if ( !var_1 )
        {
            if ( game["clientid"] >= 30 )
                self.pers["clientid"] = _id_7F87();
            else
                self.pers["clientid"] = game["clientid"];

            if ( game["clientid"] < 30 )
                game["clientid"]++;
        }

        var_0 = 1;
        self.pers["matchdataWeaponStats"] = [];
        self.pers["matchdataScoreEventCounts"] = [];
        self.pers["xpAtLastDeath"] = 0;
        self.pers["scoreAtLastDeath"] = 0;
        self _meth_8596( self.pers["clientid"] );
        setmatchdata( "players", self.pers["clientid"], "joinType", self _meth_8130() );
        setmatchdata( "players", self.pers["clientid"], "isTrialVersion", self _meth_85B4() );
    }

    if ( var_0 )
    {
        scripts\mp\persistence::_id_10E57( "round", "timePlayed", 0, 1 );
        self setrankedplayerdata( "common", "round", "timePlayed", 0 );
        self setrankedplayerdata( "common", "round", "totalXp", 0 );
        self setrankedplayerdata( "common", "aarUnlockCount", 0 );

        if ( !isdefined( game["uniquePlayerCount"] ) )
            game["uniquePlayerCount"] = 1;
        else
            game["uniquePlayerCount"]++;
    }

    self._id_41F0 = self.pers["clientid"];
    self.pers["teamKillPunish"] = 0;
    logprint( "J;" + self.guid + ";" + self getentitynumber() + ";" + self.name + "\\n" );
    self _meth_85A3();
    var_5 = _func_0AD( "commonMatchData", "playerCount" );

    if ( game["clientid"] <= 30 && game["clientid"] != var_5 )
    {
        if ( !isai( self ) && scripts\mp\utility\game::matchmakinggame() )
            self _meth_8256( self._id_41F0 );

        if ( var_0 && !var_1 )
        {
            var_5++;
            setmatchdata( "commonMatchData", "playerCount", var_5 );
        }

        setmatchdata( "players", self._id_41F0, "playerID", "xuid", scripts\mp\utility\game::_id_81EC() );
        setmatchdata( "players", self._id_41F0, "gamertag", self.name );
        setmatchdata( "players", self._id_41F0, "skill", self _meth_810F() );
        setmatchclientip( self, self._id_41F0 );

        if ( var_0 && !var_1 )
            setmatchdata( "players", self._id_41F0, "utcConnectTimeSeconds", getsystemtime() );

        if ( scripts\mp\utility\game::_id_DCD5() )
            scripts\mp\matchdata::_id_AFC4();

        if ( isdefined( self.pers["isBot"] ) && self.pers["isBot"] || isai( self ) )
        {
            var_6 = 1;
            setmatchdata( "players", self._id_41F0, "isBot", 1 );
        }
        else
            var_6 = 0;

        if ( scripts\mp\utility\game::matchmakinggame() && scripts\mp\utility\game::_id_1CAD() && !var_6 )
            setmatchdata( "players", self._id_41F0, "team", self._id_0291 );

        if ( var_0 && isdefined( level._id_B3FD ) )
            [[ level._id_B3FD ]]( self._id_41F0, self.team, self.name );
    }

    if ( !level.teambased )
        game["roundsWon"][self.guid] = 0;

    self._id_AAEF = [];
    self._id_AAEB = [];
    self._id_AAE8 = "";
    self._id_AAEA = [];
    self._id_AAE9 = "";

    if ( !isdefined( self.pers["cur_kill_streak"] ) )
        self.pers["cur_kill_streak"] = 0;

    if ( !isdefined( self.pers["cur_death_streak"] ) )
        self.pers["cur_death_streak"] = 0;

    if ( !isdefined( self.pers["cur_kill_streak_for_nuke"] ) )
        self.pers["cur_kill_streak_for_nuke"] = 0;

    if ( scripts\mp\utility\game::_id_DCD5() )
        self._id_A61A = scripts\mp\persistence::_id_10E33( "killStreak" );

    self._id_A991 = -1;
    self._id_115D5 = 0;
    self._id_8C2A = 0;
    self.waitingtospawn = 0;
    self._id_138DD = 0;
    self._id_13906 = 0;
    self._id_BCF6 = 1;
    self._id_A6AD = 1;
    self._id_C2AD = 1;
    self._id_6DED = 1;
    self._id_AC68 = 0;

    if ( isdefined( self.pers["deaths"] ) )
        self._id_AC68 = self.pers["deaths"];

    _id_FAE7();
    level thread monitorplayersegments( self );
    _id_E278();
    waittillframeend;
    level.players[level.players.size] = self;
    scripts\mp\spawnlogic::_id_1855();
    scripts\mp\spawnlogic::_id_184B();

    if ( game["state"] == "postgame" )
    {
        self._id_4530 = 1;
        self setclientdvars( "cg_drawSpectatorMessages", 0 );
        self _meth_83F8( "", 0.25 );
        _id_108DD();
    }
    else
    {
        if ( var_0 && ( scripts\mp\utility\game::_id_81CB() >= 60000 || game["roundsPlayed"] > 0 ) )
            self._id_A49D = 1;

        if ( isai( self ) && isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["think"] ) )
            self thread [[ level.bot_funcs["think"] ]]();

        level endon( "game_ended" );

        if ( isdefined( level._id_90A9 ) )
            thread scripts\mp\hostmigration::_id_90AA();

        if ( isdefined( level._id_C56F ) )
            [[ level._id_C56F ]]();

        if ( !isdefined( self.pers["team"] ) )
        {
            var_10 = scripts\mp\utility\game::_id_81CB() / 1000 + 6;

            if ( var_10 < level._id_D84D )
            {
                _id_10912();
                self _meth_8553( "default" );
                self setclientomnvar( "ui_mapshot_camera", 0 );
                _id_97EA();
                self.pers["team"] = "";
                self.team = "free";
            }
            else
                self _meth_83F8( "", 0.5 );

            connect_validateplayerteam();

            if ( self ismlgspectator() )
            {
                thread scripts\mp\menus::_id_F859();
                return;
            }

            if ( ( scripts\mp\utility\game::matchmakinggame() || scripts\mp\utility\game::_id_AEB6() || isgamebattlematch() ) && self._id_0291 != "none" )
            {
                thread _id_10911();
                thread scripts\mp\menus::_id_F876( self._id_0291 );

                if ( scripts\mp\utility\game::_id_1C7D() || scripts\mp\utility\game::_id_10125() && !isai( self ) )
                    self setclientomnvar( "ui_options_menu", 2 );

                if ( !isgamebattlematch() )
                    thread _id_A5AD();

                return;
                return;
            }

            if ( !scripts\mp\utility\game::matchmakinggame() && scripts\mp\utility\game::_id_1CAD() )
            {
                scripts\mp\menus::_id_B678();
                self setclientomnvar( "ui_options_menu", 1 );
                return;
            }

            thread _id_10911();
            scripts\mp\menus::_id_2642();

            if ( scripts\mp\utility\game::_id_1C7D() || scripts\mp\utility\game::_id_10125() && !isai( self ) )
                self setclientomnvar( "ui_options_menu", 2 );

            if ( scripts\mp\utility\game::matchmakinggame() )
                thread _id_A5AD();

            return;
            return;
            return;
            return;
        }
        else
        {
            self _meth_83F8( "", 0.5 );
            connect_validateplayerteam();
            var_11 = self.pers["team"];

            if ( scripts\mp\utility\game::matchmakinggame() && !isdefined( self.pers["isBot"] ) && !self ismlgspectator() && getdvarint( "team_consistency_fix" ) )
                var_11 = self._id_0291;

            scripts\mp\menus::_id_185F( var_11, 1 );

            if ( self ismlgspectator() )
            {
                thread _id_10911();
                return;
            }

            if ( scripts\mp\utility\game::_id_9FD4( self.pers["class"] ) )
            {
                thread _id_1083A();
                return;
            }

            thread _id_10911();

            if ( self.pers["team"] == "spectator" )
            {
                if ( scripts\mp\utility\game::_id_1CAD() )
                {
                    scripts\mp\menus::_id_2A7A();
                    return;
                }

                self [[ level._id_2642 ]]();
                return;
                return;
            }

            scripts\mp\menus::_id_2A61();
        }
    }
}

callback_playermigrated()
{
    if ( isdefined( self.connected ) && self.connected )
    {
        scripts\mp\utility\game::_id_12EDC();
        scripts\mp\utility\game::_id_12EC8();
    }

    if ( self ishost() )
        _id_97EA();

    var_0 = 0;

    foreach ( var_2 in level.players )
    {
        if ( !isdefined( var_2.pers["isBot"] ) || var_2.pers["isBot"] == 0 )
            var_0++;
    }

    if ( !isdefined( self.pers["isBot"] ) || self.pers["isBot"] == 0 )
    {
        level._id_90A8++;

        if ( level._id_90A8 >= var_0 * 2 / 3 )
            level notify( "hostmigration_enoughplayers" );
    }
}

_id_17EA( var_0, var_1 )
{
    var_2 = scripts\mp\rank::_id_80C9( var_0 );
    var_3 = scripts\mp\rank::getrankinfominxp( var_2 );
    var_4 = scripts\mp\rank::_id_80CE( var_2 );
    var_2 += ( var_0 - var_3 ) / ( var_4 - var_3 );
    var_2 += var_1;

    if ( var_2 < 0 )
    {
        var_2 = 0;
        var_5 = 0.0;
    }
    else if ( var_2 >= level._id_B4C0 + 1.0 )
    {
        var_2 = level._id_B4C0;
        var_5 = 1.0;
    }
    else
    {
        var_5 = var_2 - floor( var_2 );
        var_2 = int( floor( var_2 ) );
    }

    var_3 = scripts\mp\rank::getrankinfominxp( var_2 );
    var_4 = scripts\mp\rank::_id_80CE( var_2 );
    return int( var_5 * ( var_4 - var_3 ) ) + var_3;
}

_id_72DF()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "spawned" );
    wait 60.0;

    if ( self._id_8C2A )
        return;

    if ( self.pers["team"] == "spectator" )
        return;

    if ( !scripts\mp\utility\game::_id_9FD4( self.pers["class"] ) )
    {
        self.pers["class"] = "CLASS_CUSTOM1";
        self.class = self.pers["class"];
    }

    thread _id_1083A();
}

_id_A5AD()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "spawned" );
    self endon( "attempted_spawn" );
    var_0 = getdvarfloat( "scr_kick_time", 90 );
    var_1 = getdvarfloat( "scr_kick_mintime", 45 );
    var_2 = getdvarfloat( "scr_kick_hosttime", 120 );
    var_3 = gettime();

    if ( self ishost() )
        _id_A5AF( var_2 );
    else
        _id_A5AF( var_0 );

    var_4 = ( gettime() - var_3 ) / 1000;

    if ( var_4 < var_0 - 0.1 && var_4 < var_1 )
        return;

    if ( self._id_8C2A )
        return;

    if ( self.pers["team"] == "spectator" )
        return;

    kick( self getentitynumber(), "EXE_PLAYERKICKED_INACTIVE", 1 );
    level thread scripts\mp\gamelogic::_id_12E9D();
}

_id_A5AF( var_0 )
{
    level endon( "game_ended" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
}

_id_BA38()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for ( self._id_13552 = 0; self._id_13552 < 2; self._id_13552++ )
        self waittill( "voteToKick" );

    kick( self getentitynumber(), "EXE_PLAYERKICKED_TEAMKILLS" );
}

_id_6B57()
{
    wait 1.0;
    self notify( "voteToKick" );
    wait 3.0;
    self notify( "voteToKick" );
    wait 2.0;
    self notify( "voteToKick" );
}

totaldisttracking( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "spawned" );
    self notify( "distFromSpawnTracking" );
    self endon( "distFromSpawnTracking" );

    if ( !scripts\mp\utility\game::_id_766C( "prematch_done" ) )
        scripts\mp\utility\game::_id_7670( "prematch_done" );

    var_1 = var_0;

    for (;;)
    {
        scripts\engine\utility::_id_137B7( "death", 5.0 );

        if ( !isdefined( self.pers["totalDistTraveledSQ"] ) )
            self.pers["totalDistTraveledSQ"] = 0;

        self.pers["totalDistTraveledSQ"] += distancesquared( var_1, self.origin );
        var_1 = self.origin;

        if ( self.pers["totalDistTraveledSQ"] > 90000 )
            self.pers["distTrackingPassed"] = 1;
    }
}

stancespamtracking()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "spawned" );
    self notify( "stanceSpamTracking" );
    self endon( "stanceSpamTracking" );

    if ( !scripts\mp\utility\game::_id_766C( "prematch_done" ) )
        scripts\mp\utility\game::_id_7670( "prematch_done" );

    var_0 = undefined;

    for (;;)
    {
        var_1 = self getstance();

        if ( isdefined( var_0 ) && var_0 != var_1 )
        {
            if ( !isdefined( self.pers["stanceTracking"] ) )
            {
                self.pers["stanceTracking"] = [];
                self.pers["stanceTracking"]["prone"] = 0;
                self.pers["stanceTracking"]["crouch"] = 0;
                self.pers["stanceTracking"]["stand"] = 0;
            }

            if ( var_1 == "prone" || var_1 == "crouch" || var_1 == "stand" )
                self.pers["stanceTracking"][var_1]++;
        }

        var_0 = var_1;
        scripts\engine\utility::waitframe();
    }
}

_id_98BE()
{
    scripts\mp\persistence::_id_97E2();

    if ( !isdefined( self.pers["deaths"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "deaths" );
        scripts\mp\persistence::statsetchild( "round", "deaths", 0 );
    }

    self.deaths = scripts\mp\utility\game::getpersstat( "deaths" );

    if ( !isdefined( self.pers["score"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "score" );
        scripts\mp\persistence::statsetchild( "round", "score", 0 );
    }

    self.score = scripts\mp\utility\game::getpersstat( "score" );

    if ( !isdefined( self.pers["suicides"] ) )
        scripts\mp\utility\game::_id_98B3( "suicides" );

    self.suicides = scripts\mp\utility\game::getpersstat( "suicides" );

    if ( !isdefined( self.pers["kills"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "kills" );
        scripts\mp\persistence::statsetchild( "round", "kills", 0 );
    }

    self.kills = scripts\mp\utility\game::getpersstat( "kills" );

    if ( !isdefined( self.pers["headshots"] ) )
        scripts\mp\utility\game::_id_98B3( "headshots" );

    self.headshots = scripts\mp\utility\game::getpersstat( "headshots" );

    if ( !isdefined( self.pers["assists"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "assists" );
        scripts\mp\persistence::statsetchild( "round", "assists", 0 );
    }

    self.assists = scripts\mp\utility\game::getpersstat( "assists" );

    if ( !isdefined( self.pers["captures"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "captures" );
        scripts\mp\persistence::statsetchild( "round", "captures", 0 );
    }

    self._id_3A3F = scripts\mp\utility\game::getpersstat( "captures" );

    if ( !isdefined( self.pers["returns"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "returns" );
        scripts\mp\persistence::statsetchild( "round", "returns", 0 );
    }

    self._id_E476 = scripts\mp\utility\game::getpersstat( "returns" );

    if ( !isdefined( self.pers["defends"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "defends" );
        scripts\mp\persistence::statsetchild( "round", "defends", 0 );
    }

    self._id_508B = scripts\mp\utility\game::getpersstat( "defends" );

    if ( !isdefined( self.pers["plants"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "plants" );
        scripts\mp\persistence::statsetchild( "round", "plants", 0 );
    }

    self._id_CC51 = scripts\mp\utility\game::getpersstat( "plants" );

    if ( !isdefined( self.pers["defuses"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "defuses" );
        scripts\mp\persistence::statsetchild( "round", "defuses", 0 );
    }

    self._id_50AA = scripts\mp\utility\game::getpersstat( "defuses" );

    if ( !isdefined( self.pers["destructions"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "destructions" );
        scripts\mp\persistence::statsetchild( "round", "destructions", 0 );
    }

    self._id_5383 = scripts\mp\utility\game::getpersstat( "destructions" );

    if ( !isdefined( self.pers["confirmed"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "confirmed" );
        scripts\mp\persistence::statsetchild( "round", "confirmed", 0 );
    }

    self._id_4522 = scripts\mp\utility\game::getpersstat( "confirmed" );

    if ( !isdefined( self.pers["denied"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "denied" );
        scripts\mp\persistence::statsetchild( "round", "denied", 0 );
    }

    self._id_51E9 = scripts\mp\utility\game::getpersstat( "denied" );

    if ( !isdefined( self.pers["rescues"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "rescues" );
        scripts\mp\persistence::statsetchild( "round", "rescues", 0 );
    }

    self._id_E1C2 = scripts\mp\utility\game::getpersstat( "rescues" );

    if ( !isdefined( self.pers["touchdowns"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "touchdowns" );
        scripts\mp\persistence::statsetchild( "round", "touchdowns", 0 );
    }

    self._id_11A3E = scripts\mp\utility\game::getpersstat( "touchdowns" );

    if ( !isdefined( self.pers["fieldgoals"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "fieldgoals" );
        scripts\mp\persistence::statsetchild( "round", "fieldgoals", 0 );
    }

    self._id_6BDB = scripts\mp\utility\game::getpersstat( "fieldgoals" );

    if ( !isdefined( self.pers["killChains"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "killChains" );
        scripts\mp\persistence::statsetchild( "round", "killChains", 0 );
    }

    self._id_A642 = scripts\mp\utility\game::getpersstat( "killChains" );

    if ( !isdefined( self.pers["killsAsSurvivor"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "killsAsSurvivor" );
        scripts\mp\persistence::statsetchild( "round", "killsAsSurvivor", 0 );
    }

    self._id_A676 = scripts\mp\utility\game::getpersstat( "killsAsSurvivor" );

    if ( !isdefined( self.pers["killsAsInfected"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "killsAsInfected" );
        scripts\mp\persistence::statsetchild( "round", "killsAsInfected", 0 );
    }

    self._id_A675 = scripts\mp\utility\game::getpersstat( "killsAsInfected" );

    if ( !isdefined( self.pers["teamkills"] ) )
        scripts\mp\utility\game::_id_98B3( "teamkills" );

    if ( !isdefined( self.pers["extrascore0"] ) )
        scripts\mp\utility\game::_id_98B3( "extrascore0" );

    if ( !isdefined( self.pers["extrascore1"] ) )
        scripts\mp\utility\game::_id_98B3( "extrascore1" );

    if ( !isdefined( self.pers["stabs"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "stabs" );
        scripts\mp\persistence::statsetchild( "round", "stabs", 0 );
    }

    self._id_10B39 = scripts\mp\utility\game::getpersstat( "stabs" );

    if ( !isdefined( self.pers["setbacks"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "setbacks" );
        scripts\mp\persistence::statsetchild( "round", "setbacks", 0 );
    }

    self._id_F655 = scripts\mp\utility\game::getpersstat( "setbacks" );

    if ( !isdefined( self.pers["objTime"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "objTime" );
        scripts\mp\persistence::statsetchild( "round", "objTime", 0 );
    }

    self._id_C2C5 = scripts\mp\utility\game::getpersstat( "objTime" );

    if ( !isdefined( self.pers["gamemodeScore"] ) )
    {
        scripts\mp\utility\game::_id_98B3( "gamemodeScore" );
        scripts\mp\persistence::statsetchild( "round", "gamemodeScore", 0 );
    }

    if ( !isdefined( self.pers["supersEarned"] ) )
        scripts\mp\utility\game::_id_98B3( "supersEarned" );

    if ( !isdefined( self.pers["wardenKSCount"] ) )
        scripts\mp\utility\game::_id_98B3( "wardenKSCount" );

    if ( !isdefined( self.pers["teamKillPunish"] ) )
        self.pers["teamKillPunish"] = 0;

    scripts\mp\utility\game::_id_98B3( "longestStreak" );
    self.pers["lives"] = scripts\mp\utility\game::getgametypenumlives();
    scripts\mp\persistence::statsetchild( "round", "killStreak", 0 );
    scripts\mp\persistence::statsetchild( "round", "loss", 0 );
    scripts\mp\persistence::statsetchild( "round", "win", 0 );
    scripts\mp\persistence::statsetchild( "round", "scoreboardType", "none" );
}

_id_1860()
{
    level._id_115C6[self.team]++;

    if ( !isdefined( level._id_115D8 ) )
        level._id_115D8 = [];

    if ( !isdefined( level._id_115D8[self.team] ) )
        level._id_115D8[self.team] = [];

    level._id_115D8[self.team][level._id_115D8[self.team].size] = self;
    scripts\mp\gamelogic::_id_12E9D();
}

_id_E11D()
{
    level._id_115C6[self.team]--;

    if ( isdefined( level._id_115D8 ) && isdefined( level._id_115D8[self.team] ) )
    {
        var_0 = [];

        foreach ( var_2 in level._id_115D8[self.team] )
        {
            if ( !isdefined( var_2 ) || var_2 == self )
                continue;

            var_0[var_0.size] = var_2;
        }

        level._id_115D8[self.team] = var_0;
    }
}

_id_1845()
{
    var_0 = self.team;

    if ( !( isdefined( self._id_1D40 ) && self._id_1D40 ) )
    {
        level._id_8C2A[var_0]++;
        _id_93F8( var_0 );
    }

    self._id_1D40 = undefined;

    if ( level._id_1BE6["allies"] + level._id_1BE6["axis"] > level._id_B4BC )
        level._id_B4BC = level._id_1BE6["allies"] + level._id_1BE6["axis"];
}

_id_93F8( var_0, var_1 )
{
    level._id_1BE6[var_0]++;

    if ( !isdefined( level._id_1BE5 ) )
        level._id_1BE5 = [];

    if ( !isdefined( level._id_1BE5[var_0] ) )
        level._id_1BE5[var_0] = [];

    level._id_1BE5[var_0] = scripts\engine\utility::_id_2279( level._id_1BE5[var_0], self );

    if ( scripts\mp\utility\game::istrue( var_1 ) && ( var_0 == "allies" || var_0 == "axis" ) )
    {
        var_2 = level._id_C74B[var_0];

        foreach ( var_4 in level.players )
        {
            if ( var_4.team == var_0 )
            {
                var_4 playsoundtoplayer( "mp_bodycount_tick_positive", var_4 );
                continue;
            }

            if ( var_4.team == var_2 )
                var_4 playsoundtoplayer( "mp_bodycount_tick_negative", var_4 );
        }
    }

    scripts\mp\gamelogic::_id_12E9D();
}

removefromalivecount( var_0 )
{
    var_1 = self.pers["lives"];
    var_2 = scripts\mp\utility\game::getgametypenumlives() != 0 && var_1 == 0;
    var_3 = self.team;

    if ( isdefined( self.switching_teams ) && self.switching_teams && isdefined( self._id_A49E ) && self._id_A49E == self.team )
        var_3 = self._id_AB33;

    if ( isdefined( var_0 ) )
        _id_E0CA();
    else if ( isdefined( self.switching_teams ) && ( !level.ingraceperiod || self._id_8BE9 ) )
    {
        if ( var_1 )
            self.pers["lives"]--;
    }

    _id_4FBD( var_3, var_2 );
}

_id_4FBD( var_0, var_1 )
{
    level._id_1BE6[var_0]--;

    for ( var_2 = 0; var_2 < level._id_1BE5[var_0].size; var_2++ )
    {
        if ( level._id_1BE5[var_0][var_2] == self )
        {
            level._id_1BE5[var_0][var_2] = level._id_1BE5[var_0][level._id_1BE5[var_0].size - 1];
            level._id_1BE5[var_0][level._id_1BE5[var_0].size - 1] = undefined;
            break;
        }
    }

    if ( scripts\mp\utility\game::istrue( var_1 ) && ( var_0 == "allies" || var_0 == "axis" ) )
    {
        var_3 = level._id_C74B[var_0];

        foreach ( var_5 in level.players )
        {
            if ( var_5.team == var_0 )
            {
                var_5 playsoundtoplayer( "mp_bodycount_tick_negative", var_5 );
                continue;
            }

            if ( var_5.team == var_3 )
                var_5 playsoundtoplayer( "mp_bodycount_tick_positive", var_5 );
        }
    }

    scripts\mp\gamelogic::_id_12E9D();
}

_id_1853()
{
    level._id_AD8D[self.team] += self.pers["lives"];
}

_id_E112()
{
    level._id_AD8D[self.team]--;
    level._id_AD8D[self.team] = int( max( 0, level._id_AD8D[self.team] ) );
}

_id_E0CA()
{
    level._id_AD8D[self.team] -= self.pers["lives"];
    level._id_AD8D[self.team] = int( max( 0, level._id_AD8D[self.team] ) );
}

_id_E278()
{
    self setclientomnvar( "ui_carrying_bomb", 0 );
    self setclientomnvar( "ui_objective_state", 0 );
    self setclientomnvar( "ui_securing", 0 );
    self setclientomnvar( "ui_light_armor", 0 );
    self setclientomnvar( "ui_killcam_end_milliseconds", 0 );
    self setclientomnvar( "ui_juiced_end_milliseconds", 0 );
    self setclientdvar( "ui_eyes_on_end_milliseconds", 0 );
    self setclientomnvar( "ui_cranked_bomb_timer_end_milliseconds", 0 );
    self setclientomnvar( "ui_edge_glow", 0 );
}

_id_E27B()
{
    self setclientomnvar( "ui_carrying_bomb", 0 );
    self setclientomnvar( "ui_objective_state", 0 );
    self setclientomnvar( "ui_securing", 0 );
    self setclientomnvar( "ui_light_armor", 0 );
    self setclientomnvar( "ui_killcam_end_milliseconds", 0 );
    self setclientomnvar( "ui_juiced_end_milliseconds", 0 );
    self setclientdvar( "ui_eyes_on_end_milliseconds", 0 );
    self setclientomnvar( "ui_cranked_bomb_timer_end_milliseconds", 0 );
    self setclientomnvar( "ui_edge_glow", 0 );
}

monitorwallrun()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        if ( self iswallrunning() )
            self._id_AA43 = gettime();

        wait 0.05;
    }
}

_id_13A6C()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
        self waittill( "sprint_slide_begin" );
}

_id_13B76()
{
    self endon( "death" );
    self endon( "disconnect" );
    self._id_11563 = [];

    for (;;)
    {
        var_0 = ( self.origin[0], self.origin[1], self.origin[2] + 64 );
        var_1 = self getplayerangles();
        var_2 = anglestoforward( var_1 );
        var_3 = var_0 + var_2 * 10000;
        var_4 = bullettrace( var_0, var_3, 1, self, 0, 0, 0, 0, 0 );
        var_5 = var_4["entity"];

        if ( isdefined( var_5 ) && isplayer( var_5 ) && var_5.team != self.team && scripts\mp\equipment\phase_shift::_id_213D( self, var_5 ) )
        {
            if ( isdefined( var_5 ) )
                _id_12F36( "ui_target_health", var_5.health );

            if ( isdefined( var_5 ) )
                _id_12F36( "ui_target_max_health", var_5.maxhealth );

            if ( isdefined( var_5 ) )
                _id_12F36( "ui_target_entity_num", var_5 getentitynumber() );
        }
        else
            _id_12F36( "ui_target_entity_num", -1 );

        wait 0.1;
    }
}

_id_12F36( var_0, var_1 )
{
    scripts\engine\utility::waitframe();

    if ( !isdefined( self ) )
        return;

    if ( !isdefined( var_1 ) )
        return;

    if ( !isdefined( self._id_11563[var_0] ) || var_1 != self._id_11563[var_0] )
    {
        self setclientomnvar( var_0, var_1 );
        self._id_11563[var_0] = var_1;
    }
}

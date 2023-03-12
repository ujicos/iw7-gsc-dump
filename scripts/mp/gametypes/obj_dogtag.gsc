// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level.dogtags = [];
    level._id_58BE = scripts\mp\gametypes\common::_id_58BE;
    level._id_58BF = scripts\mp\gametypes\common::_id_58BF;
    level._id_4507["vanish"] = loadfx( "vfx/core/impacts/small_snowhit" );
    level._id_C236 = scripts\mp\utility\game::getgametypenumlives();
}

_id_10083( var_0 )
{
    if ( isdefined( self.switching_teams ) )
        return 0;

    if ( isdefined( var_0 ) && var_0 == self )
        return 0;

    if ( level.teambased && isdefined( var_0 ) && isdefined( var_0.team ) && var_0.team == self.team )
        return 0;

    if ( isdefined( var_0 ) && !isdefined( var_0.team ) && ( var_0.classname == "trigger_hurt" || var_0.classname == "worldspawn" ) )
        return 0;

    return 1;
}

_id_10849( var_0, var_1, var_2 )
{
    var_3 = 1;

    if ( scripts\mp\utility\game::istrue( level._id_C236 ) )
    {
        var_3 = var_0 _id_10083( var_1 );

        if ( var_3 )
            var_3 = var_3 && !scripts\mp\utility\game::isreallyalive( var_0 );

        if ( var_3 )
            var_3 = var_3 && !var_0 scripts\mp\playerlogic::_id_B4EE();
    }

    if ( !var_3 )
        return;

    if ( isagent( var_0 ) )
        return;

    if ( isagent( var_1 ) )
        var_1 = var_1.owner;

    var_4 = 14;
    var_5 = ( 0, 0, 0 );
    var_6 = var_0.angles;

    if ( var_0 scripts\mp\gameobjects::touchingarbitraryuptrigger() )
    {
        var_6 = var_0 _meth_8517();
        var_5 = anglestoup( var_6 );

        if ( var_5[2] < 0 )
            var_4 = -14;
    }

    if ( isdefined( level.dogtags[var_0.guid] ) )
    {
        playfx( level._id_4507["vanish"], level.dogtags[var_0.guid].curorigin );
        level.dogtags[var_0.guid] _id_E277();
        level.dogtags[var_0.guid].visuals[0].angles = ( 0, 0, 0 );
        level.dogtags[var_0.guid].visuals[1].angles = ( 0, 0, 0 );
    }
    else
    {
        var_7[0] = spawn( "script_model", ( 0, 0, 0 ) );
        var_7[0] setmodel( "dogtags_iw7_foe" );
        var_7[1] = spawn( "script_model", ( 0, 0, 0 ) );
        var_7[1] setmodel( "dogtags_iw7_friend" );

        if ( level._id_C236 )
        {
            var_7[0] _meth_82BF( var_0 );
            var_7[1] _meth_82BF( var_0 );
        }

        var_7[0] _meth_8588();
        var_7[1] _meth_8588();
        var_8 = spawn( "trigger_radius", ( 0, 0, 0 ), 0, 32, 32 );

        if ( var_0 scripts\mp\gameobjects::touchingarbitraryuptrigger() )
        {
            if ( var_5[2] < 0 )
            {
                var_7[0].angles = var_6;
                var_7[1].angles = var_6;
            }
        }

        level.dogtags[var_0.guid] = scripts\mp\gameobjects::createuseobject( "any", var_8, var_7, ( 0, 0, 16 ) );
        level.dogtags[var_0.guid] scripts\mp\gameobjects::_id_FB08( 0 );
        level.dogtags[var_0.guid]._id_C5BB = ::_id_C5BB;
        level.dogtags[var_0.guid].victim = var_0;
        level.dogtags[var_0.guid]._id_13383 = var_0.team;
        level thread _id_41C9( var_0 );
        var_0 thread _id_11423( level.dogtags[var_0.guid] );
    }

    var_9 = var_0.origin + ( 0, 0, var_4 );
    level.dogtags[var_0.guid].curorigin = var_9;
    level.dogtags[var_0.guid].trigger.origin = var_9;
    level.dogtags[var_0.guid].visuals[0].origin = var_9;
    level.dogtags[var_0.guid].visuals[1].origin = var_9;
    level.dogtags[var_0.guid] scripts\mp\gameobjects::_id_987E();
    level.dogtags[var_0.guid] scripts\mp\gameobjects::allowuse( "any" );

    if ( level.teambased )
    {
        level.dogtags[var_0.guid].visuals[0] thread _id_10159( level.dogtags[var_0.guid], var_1.team );
        level.dogtags[var_0.guid].visuals[1] thread _id_10159( level.dogtags[var_0.guid], var_0.team );
    }
    else
        level.dogtags[var_0.guid] thread showtoffaattacker( level.dogtags[var_0.guid], var_1, var_0 );

    level.dogtags[var_0.guid].attacker = var_1;
    level.dogtags[var_0.guid]._id_250F = var_1.team;

    if ( level.dogtags[var_0.guid]._id_115DC[var_0.team] != -1 )
    {
        scripts\mp\objidpoolmanager::minimap_objective_add( level.dogtags[var_0.guid]._id_115DC[var_0.team], "active", var_9, "waypoint_dogtags_friendlys" );

        if ( level._id_C236 )
            scripts\mp\objidpoolmanager::minimap_objective_team( level.dogtags[var_0.guid]._id_115DC[var_0.team], var_0.team );
        else
            scripts\mp\objidpoolmanager::minimap_objective_player( level.dogtags[var_0.guid]._id_115DC[var_0.team], var_0 getentitynumber() );
    }

    if ( level.dogtags[var_0.guid]._id_115DC[var_1.team] != -1 )
    {
        scripts\mp\objidpoolmanager::minimap_objective_add( level.dogtags[var_0.guid]._id_115DC[var_1.team], "active", var_9, "waypoint_dogtags" );

        if ( level.teambased )
            scripts\mp\objidpoolmanager::minimap_objective_team( level.dogtags[var_0.guid]._id_115DC[var_1.team], var_1.team );
        else
            scripts\mp\objidpoolmanager::minimap_objective_player( level.dogtags[var_0.guid]._id_115DC[var_1.team], var_1 getentitynumber() );
    }

    playloopsound( var_9, "mp_killconfirm_tags_drop" );
    level notify( var_2, level.dogtags[var_0.guid] );
    var_0._id_113EF = 1;
    level.dogtags[var_0.guid].visuals[0] scriptmodelplayanim( "mp_dogtag_spin" );
    level.dogtags[var_0.guid].visuals[1] scriptmodelplayanim( "mp_dogtag_spin" );

    if ( level._id_C236 )
        var_0._id_02C7 = "hud_status_dogtag";
}

_id_E277()
{
    self.attacker = undefined;
    self notify( "reset" );
    self.visuals[0] hide();
    self.visuals[1] hide();
    self.visuals[0] dontinterpolate();
    self.visuals[1] dontinterpolate();
    self.curorigin = ( 0, 0, 1000 );
    self.trigger.origin = ( 0, 0, 1000 );
    self.visuals[0].origin = ( 0, 0, 1000 );
    self.visuals[1].origin = ( 0, 0, 1000 );
    scripts\mp\gameobjects::allowuse( "none" );

    if ( self._id_115DC[self._id_13383] != -1 )
        scripts\mp\objidpoolmanager::minimap_objective_state( self._id_115DC[self._id_13383], "invisible" );

    if ( self._id_115DC[self._id_250F] != -1 )
        scripts\mp\objidpoolmanager::minimap_objective_state( self._id_115DC[self._id_250F], "invisible" );
}

_id_E178( var_0, var_1 )
{
    if ( isdefined( level.dogtags[var_0] ) )
    {
        level.dogtags[var_0] scripts\mp\gameobjects::allowuse( "none" );

        if ( scripts\mp\utility\game::istrue( var_1 ) && isdefined( level.dogtags[var_0].attacker ) )
            level.dogtags[var_0].attacker thread scripts\mp\rank::scoreeventpopup( "kill_denied" );

        playfx( level._id_4507["vanish"], level.dogtags[var_0].curorigin );
        level.dogtags[var_0] notify( "reset" );
        wait 0.05;

        if ( isdefined( level.dogtags[var_0] ) )
        {
            level.dogtags[var_0] notify( "death" );

            for ( var_2 = 0; var_2 < level.dogtags[var_0].visuals.size; var_2++ )
                level.dogtags[var_0].visuals[var_2] delete();

            level.dogtags[var_0] thread scripts\mp\gameobjects::_id_51DA();
            level.dogtags[var_0] = undefined;
        }
    }
}

_id_10159( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "reset" );
    self hide();

    foreach ( var_3 in level.players )
    {
        if ( var_3.team == var_1 )
            self _meth_8388( var_3 );

        if ( var_3.team == "spectator" && var_1 == "allies" )
            self _meth_8388( var_3 );
    }

    for (;;)
    {
        level waittill( "joined_team", var_3 );

        if ( var_3.team == var_1 )
            self _meth_8388( var_3 );

        if ( var_3.team == "spectator" && var_1 == "allies" )
            self _meth_8388( var_3 );
    }
}

showtoffaattacker( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_0 endon( "reset" );
    var_0.visuals[0] hide();
    var_0.visuals[1] hide();

    foreach ( var_4 in level.players )
    {
        if ( var_4 != var_2 )
            var_0.visuals[0] _meth_8388( var_4 );
        else
            var_0.visuals[1] _meth_8388( var_4 );

        if ( var_4.team == "spectator" )
            var_0.visuals[0] _meth_8388( var_4 );
    }

    for (;;)
    {
        level waittill( "joined_team", var_4 );
        var_0.visuals[0] _meth_8388( var_4 );
    }
}

_id_D36B( var_0 )
{
    if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_0 ) )
        return 0;

    return 1;
}

_id_C5BB( var_0 )
{
    if ( !_id_D36B( var_0 ) )
        return;

    if ( isdefined( var_0.owner ) )
        var_0 = var_0.owner;

    if ( level.gametype == "conf" )
        var_0 thread _id_13B1C();

    if ( level.teambased )
    {
        if ( var_0.pers["team"] == self._id_13383 )
        {
            self.trigger playsound( "mp_killconfirm_tags_deny" );
            var_0 scripts\mp\utility\game::incperstat( "denied", 1 );
            var_0 scripts\mp\persistence::statsetchild( "round", "denied", var_0.pers["denied"] );

            if ( level._id_C236 )
                _id_AC69( var_0 );
            else
                _id_1D32( var_0 );

            if ( isdefined( level._id_58BE ) && !level._id_7669 )
                self thread [[ level._id_58BE ]]( var_0 );
        }
        else
        {
            self.trigger playsound( "mp_killconfirm_tags_pickup" );

            if ( level.gametype != "grind" )
            {
                var_0 scripts\mp\utility\game::incperstat( "confirmed", 1 );
                var_0 scripts\mp\persistence::statsetchild( "round", "confirmed", var_0.pers["confirmed"] );
            }

            if ( level._id_C236 )
                _id_AC6A( var_0 );
            else
                _id_656A( var_0 );

            if ( isdefined( level._id_58BF ) && !level._id_7669 )
                self thread [[ level._id_58BF ]]( var_0 );
        }
    }
    else
        runffatagpickup( var_0 );

    self.victim notify( "tag_removed" );
    thread _id_E178( self.victim.guid );
}

runffatagpickup( var_0 )
{
    if ( var_0 == self.victim )
    {
        self.trigger playsound( "mp_killconfirm_tags_deny" );
        _id_1D32( var_0 );

        if ( isdefined( level._id_58BE ) && !level._id_7669 )
            self thread [[ level._id_58BE ]]( var_0 );
    }
    else
    {
        self.trigger playsound( "mp_killconfirm_tags_pickup" );
        _id_656A( var_0 );

        if ( isdefined( level._id_58BF ) && !level._id_7669 )
            self thread [[ level._id_58BF ]]( var_0 );
    }
}

_id_13B1C()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "watchRapidTagPickup()" );
    self endon( "watchRapidTagPickup()" );

    if ( !isdefined( self._id_DDCE ) )
        self._id_DDCE = 1;
    else
    {
        self._id_DDCE++;

        if ( self._id_DDCE == 3 )
            thread scripts\mp\awards::givemidmatchaward( "mode_kc_3_tags" );
    }

    wait 3.0;
    self._id_DDCE = 0;
}

_id_11423( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "death" );

    for (;;)
    {
        self waittill( "joined_team" );
        thread _id_E178( self.guid, 1 );
    }
}

_id_41C9( var_0 )
{
    var_0 notify( "clearOnVictimDisconnect" );
    var_0 endon( "clearOnVictimDisconnect" );
    var_0 endon( "tag_removed" );
    level endon( "game_ended" );
    var_1 = var_0.guid;
    var_0 waittill( "disconnect" );
    thread _id_E178( var_1, 1 );
}

_id_C175( var_0, var_1, var_2 )
{
    var_3 = var_2.team;
    var_4 = scripts\mp\utility\game::_id_8027( var_3 );

    foreach ( var_6 in level.players )
    {
        if ( var_6.team == var_3 )
        {
            if ( var_6 != var_2 )
                var_6 _id_C16D( var_0 );

            continue;
        }

        if ( var_6.team == var_4 )
            var_6 _id_C16D( var_1 );
    }
}

_id_C16D( var_0 )
{
    thread scripts\mp\hud_message::showsplash( var_0 );
}

ontagpickupevent( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    while ( !isdefined( self.pers ) )
        wait 0.05;

    thread scripts\mp\utility\game::_id_83B4( var_0 );
}

_id_AC69( var_0 )
{
    var_0.pers["rescues"]++;
    var_0 scripts\mp\persistence::statsetchild( "round", "rescues", var_0.pers["rescues"] );
    _id_C175( "sr_ally_respawned", "sr_enemy_respawned", self.victim );

    if ( isdefined( self.victim ) )
    {
        self.victim thread scripts\mp\hud_message::showsplash( "sr_respawned" );
        level notify( "sr_player_respawned", self.victim );
        self.victim scripts\mp\utility\game::leaderdialogonplayer( "revived" );

        if ( !level._id_7669 )
            self.victim thread _id_E284();

        self.victim._id_113EF = undefined;
        self.victim._id_02C7 = "";
    }

    if ( isdefined( self.attacker ) )
        self.attacker thread scripts\mp\rank::scoreeventpopup( "kill_denied" );

    var_0 thread ontagpickupevent( "kill_denied" );
    var_0 scripts\mp\missions::_id_D992( "ch_rescuer" );

    if ( !isdefined( var_0._id_E1C0 ) )
        var_0._id_E1C0 = [];

    var_0._id_E1C0[self.victim.guid] = 1;

    if ( var_0._id_E1C0.size == 4 )
        var_0 scripts\mp\missions::_id_D992( "ch_helpme" );
}

_id_AC6A( var_0 )
{
    if ( isdefined( self.victim ) )
    {
        self.victim thread scripts\mp\hud_message::showsplash( "sr_eliminated" );
        level notify( "sr_player_eliminated", self.victim );
    }

    _id_C175( "sr_ally_eliminated", "sr_enemy_eliminated", self.victim );

    if ( isdefined( self.victim ) )
    {
        if ( !level._id_7669 )
        {
            self.victim scripts\mp\utility\game::_id_F78C( "spawn_info", game["strings"]["spawn_next_round"] );
            self.victim thread scripts\mp\playerlogic::_id_E170( 3.0 );
        }

        self.victim._id_113EF = undefined;
        self.victim._id_02C7 = "hud_status_dead";
    }

    if ( self.attacker != var_0 )
        self.attacker thread ontagpickupevent( "kill_confirmed" );

    var_0 thread ontagpickupevent( "kill_confirmed" );
    var_0 scripts\mp\utility\game::leaderdialogonplayer( "kill_confirmed" );
    var_0 scripts\mp\missions::_id_D992( "ch_hideandseek" );
}

_id_E284()
{
    scripts\mp\playerlogic::_id_93F8( self.team );
    self._id_1D40 = 1;
    thread _id_136F9();
    _id_12E58();
}

_id_136F9()
{
    for (;;)
    {
        wait 0.05;

        if ( isdefined( self ) && ( self.sessionstate == "spectator" || !scripts\mp\utility\game::isreallyalive( self ) ) )
        {
            self.pers["lives"] = 1;
            scripts\mp\playerlogic::_id_1083A();
            continue;
        }

        return;
    }
}

_id_12E58()
{
    if ( isdefined( level._id_1BE5["allies"] ) )
        setomnvar( "ui_allies_alive", level._id_1BE5["allies"].size );

    if ( isdefined( level._id_1BE5["axis"] ) )
        setomnvar( "ui_axis_alive", level._id_1BE5["axis"].size );
}

_id_1D32( var_0 )
{
    if ( self.victim == var_0 )
        var_0 thread scripts\mp\awards::givemidmatchaward( "mode_kc_own_tags" );
    else if ( level.gametype == "conf" )
        var_0 ontagpickupevent( "kill_denied" );
    else
        var_0 ontagpickupevent( "tag_denied" );

    if ( isdefined( self.attacker ) )
        self.attacker thread scripts\mp\rank::scoreeventpopup( "tag_denied" );

    var_0 scripts\mp\missions::_id_D992( "ch_denier" );
}

_id_656A( var_0 )
{
    if ( level.gametype == "conf" )
        var_0 ontagpickupevent( "kill_confirmed" );
    else
        var_0 ontagpickupevent( "tag_collected" );

    if ( level.gametype == "grind" )
        var_0 _id_D414( var_0._id_11422 + 1 );

    if ( self.attacker != var_0 )
    {
        if ( level.teambased )
        {
            self.attacker thread ontagpickupevent( "kc_friendly_pickup" );

            if ( isdefined( level._id_112C0 ) && level._id_112C0 )
            {
                if ( isdefined( self.attacker.cranked ) && self.attacker.cranked )
                    var_0 scripts\mp\utility\game::_id_F6A8( "kill" );
                else
                    self.attacker scripts\mp\utility\game::_id_C4DB( undefined, self.attacker );
            }
        }
        else
            var_0 ontagpickupevent( "kill_denied" );
    }

    var_0 scripts\mp\missions::_id_D992( "ch_collector" );
}

_id_D414( var_0 )
{
    self._id_11422 = var_0;
    self._id_0150 = var_0;

    if ( var_0 > 999 )
        var_0 = 999;

    self setclientomnvar( "ui_grind_tags", var_0 );
}

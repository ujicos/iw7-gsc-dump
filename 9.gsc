// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main()
{
    if ( isdefined( level.createfx_enabled ) && level.createfx_enabled )
        return;

    setup_callbacks();
    level._id_274F = ::badplace_cylinder;
    level._id_2750 = ::badplace_delete;
    scripts\mp\mp_agent::_id_94DC( "mp/default_agent_definition.csv" );
    _id_0F6E::_id_DF0C();
    level thread scripts\mp\agents\agent_common::init();
    level thread scripts\mp\killstreaks\agent_killstreak::init();
}

setup_callbacks()
{
    if ( !isdefined( level.agent_funcs ) )
        level.agent_funcs = [];

    level.agent_funcs["player"] = [];
    level.agent_funcs["player"]["spawn"] = ::spawn_agent_player;
    level.agent_funcs["player"]["think"] = scripts\mp\bots\gametype_war::bot_war_think;
    level.agent_funcs["player"]["on_killed"] = ::on_agent_player_killed;
    level.agent_funcs["player"]["on_damaged"] = ::on_agent_player_damaged;
    level.agent_funcs["player"]["on_damaged_finished"] = ::agent_damage_finished;
    _id_0F6E::setupcallbacks();
    scripts\mp\equipment\phase_split::_id_CAC9();
    scripts\mp\killstreaks\agent_killstreak::setup_callbacks();
    scripts\mp\killstreaks\remotec8::setup_callbacks();
}

_id_13672()
{
    while ( !isdefined( level.agent_funcs ) )
        wait 0.05;
}

_id_16F2( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    var_14 = scripts\mp\agents\agent_common::_id_4535( var_0, var_1, var_2 );

    if ( isdefined( var_9 ) )
        var_14._id_4009 = var_9;

    if ( isdefined( var_14 ) )
        var_14 thread [[ var_14 scripts\mp\agents\agent_utility::agentfunc( "spawn" ) ]]( var_3, var_4, var_5, var_6, var_7, var_8, var_10, var_11, var_12, var_13 );

    return var_14;
}

spawn_agent_player( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    self endon( "disconnect" );

    while ( !isdefined( level.getspawnpoint ) )
        scripts\engine\utility::waitframe();

    if ( self._id_8BE2 )
        wait( randomintrange( 6, 10 ) );

    scripts\mp\agents\agent_utility::_id_98BB( 1 );

    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_10 = var_0;
        var_11 = var_1;
        self._id_A9F4 = spawnstruct();
        self._id_A9F4.origin = var_10;
        self._id_A9F4.angles = var_11;
    }
    else
    {
        var_12 = self [[ level.getspawnpoint ]]();
        var_10 = var_12.origin;
        var_11 = var_12.angles;
        self._id_A9F4 = var_12;
    }

    scripts\mp\agents\agent_utility::_id_1601();
    self.lastspawntime = gettime();
    self._id_10916 = gettime();
    var_13 = var_10 + ( 0, 0, 25 );
    var_14 = var_10;
    var_15 = playerphysicstrace( var_13, var_14 );

    if ( distancesquared( var_15, var_13 ) > 1 )
        var_10 = var_15;

    self spawnagent( var_10, var_11 );

    if ( isdefined( var_3 ) && var_3 )
        scripts\mp\bots\bots_personality::bot_assign_personality_functions();
    else
        scripts\mp\bots\bots_util::bot_set_personality( "default" );

    if ( isdefined( var_5 ) )
        scripts\mp\bots\bots_util::bot_set_difficulty( var_5 );

    _id_98B6();
    scripts\mp\agents\agent_common::set_agent_health( 100 );

    if ( isdefined( var_4 ) && var_4 )
        self._id_E28C = 1;

    if ( isdefined( var_2 ) )
        scripts\mp\agents\agent_utility::_id_F290( var_2.team, var_2 );

    if ( isdefined( self.owner ) )
        thread _id_5320( self.owner );

    thread scripts\mp\flashgrenades::_id_B9D9();
    self enableanimstate( 0 );
    self takeallweapons();
    self [[ level.onspawnplayer ]]();

    if ( !scripts\mp\utility\game::istrue( var_6 ) )
        scripts\mp\class::giveloadout( self.team, self.class, 1 );

    thread scripts\mp\bots\bots::bot_think_watch_enemy( 1 );
    thread scripts\mp\bots\bots::bot_think_crate();

    if ( self.agent_type == "player" )
        thread scripts\mp\bots\bots::bot_think_level_acrtions();
    else if ( self.agent_type == "odin_juggernaut" )
        thread scripts\mp\bots\bots::bot_think_level_acrtions( 128 );

    thread scripts\mp\bots\bots_strategy::bot_think_tactical_goals();
    self thread [[ scripts\mp\agents\agent_utility::agentfunc( "think" ) ]]();

    if ( !self._id_8BE2 )
        scripts\mp\spawnlogic::_id_1855();

    self._id_8BE2 = 0;

    if ( !scripts\mp\utility\game::istrue( var_7 ) )
        thread scripts\mp\weapons::onplayerspawned();

    if ( !scripts\mp\utility\game::istrue( var_8 ) )
        thread scripts\mp\healthoverlay::_id_D3A5();

    if ( !scripts\mp\utility\game::istrue( var_9 ) )
        thread scripts\mp\battlechatter_mp::onplayerspawned();

    level notify( "spawned_agent_player", self );
    level notify( "spawned_agent", self );
    self notify( "spawned_player" );
}

_id_5320( var_0 )
{
    self endon( "death" );
    var_0 waittill( "killstreak_disowned" );
    self notify( "owner_disconnect" );

    if ( scripts\mp\hostmigration::waittillhostmigrationdone() )
        wait 0.05;

    self suicide();
}

agent_damage_finished( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( isalive( self ) )
    {
        if ( isdefined( var_0 ) || isdefined( var_1 ) )
        {
            if ( !isdefined( var_0 ) )
                var_0 = var_1;

            if ( isdefined( self._id_1CB0 ) && !self._id_1CB0 )
            {
                if ( isdefined( var_0.classname ) && var_0.classname == "script_vehicle" )
                    return 0;
            }

            if ( isdefined( var_0.classname ) && var_0.classname == "auto_turret" )
                var_1 = var_0;

            if ( isdefined( var_1 ) && var_4 != "MOD_FALLING" && var_4 != "MOD_SUICIDE" )
            {
                if ( level.teambased )
                {
                    if ( isdefined( var_1.team ) && var_1.team != self.team )
                        self setagentattacker( var_1 );
                }
                else
                    self setagentattacker( var_1 );
            }
        }

        self finishagentdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, 0.0, var_10, var_11 );

        if ( !isdefined( self._id_9D25 ) )
            self._id_136FD = 1;

        return 1;
    }
}

_id_C4A7( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = isdefined( var_1 ) && isdefined( self.owner ) && self.owner == var_1;
    var_13 = scripts\mp\utility\game::_id_24F0( self.owner, var_1 ) || var_12;

    if ( !( var_12 && self.agent_type == "playerProxy" ) )
    {
        if ( level.teambased && var_13 && !level._id_740A )
            return 0;

        if ( !level.teambased && var_12 )
            return 0;
    }

    if ( isdefined( var_4 ) && var_4 == "MOD_CRUSH" && isdefined( var_0 ) && isdefined( var_0.classname ) && var_0.classname == "script_vehicle" )
        return 0;

    if ( !isdefined( self ) || !scripts\mp\utility\game::isreallyalive( self ) )
        return 0;

    if ( isdefined( var_1 ) && var_1.classname == "script_origin" && isdefined( var_1.type ) && var_1.type == "soft_landing" )
        return 0;

    if ( var_5 == "killstreak_emp_mp" )
        return 0;

    if ( var_5 == "bouncingbetty_mp" && !scripts\mp\weapons::_id_B767( var_0, self ) )
        return 0;

    if ( issubstr( var_5, "throwingknife" ) && var_4 == "MOD_IMPACT" )
        var_2 = self.health + 1;

    if ( isdefined( var_0 ) && isdefined( var_0._id_11180 ) && var_0._id_11180 == self )
        var_2 = self.health + 1;

    if ( var_2 <= 0 )
        return 0;

    if ( isdefined( var_1 ) && var_1 != self && var_2 > 0 && ( !isdefined( var_8 ) || var_8 != "shield" ) )
    {
        if ( var_3 & level.idflags_stun )
            var_14 = "stun";
        else if ( !scripts\mp\damage::_id_100C1( var_5 ) )
            var_14 = "none";
        else
            var_14 = "standard";

        var_1 thread scripts\mp\damagefeedback::updatedamagefeedback( var_14, var_2 >= self.health );
    }

    if ( isdefined( level.modifyplayerdamage ) )
        var_2 = [[ level.modifyplayerdamage ]]( self, var_1, var_2, var_4, var_5, var_6, var_7, var_8 );

    return self [[ scripts\mp\agents\agent_utility::agentfunc( "on_damaged_finished" ) ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

on_agent_player_damaged( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = isdefined( var_1 ) && isdefined( self.owner ) && self.owner == var_1;

    if ( !level.teambased && var_12 )
        return 0;

    if ( isdefined( level._id_13CA6 ) )
        var_5 = [[ level._id_13CA6 ]]( var_5, var_0 );

    scripts\mp\damage::callback_playerdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

on_agent_player_killed( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    _id_C4B3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, 1 );

    if ( isplayer( var_1 ) && ( !isdefined( self.owner ) || var_1 != self.owner ) )
        scripts\mp\damage::onkillstreakkilled( "squad_mate", var_1, var_4, var_3, var_2, "destroyed_squad_mate" );

    scripts\mp\weapons::dropscavengerfordeath( var_1 );

    if ( self._id_9D25 )
    {
        self._id_8BE2 = 1;

        if ( scripts\mp\utility\game::getgametypenumlives() != 1 && ( isdefined( self._id_E28C ) && self._id_E28C ) )
            self thread [[ scripts\mp\agents\agent_utility::agentfunc( "spawn" ) ]]();
        else
            scripts\mp\agents\agent_utility::deactivateagent();
    }
}

_id_C4B3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( self.hasriotshieldequipped ) && self.hasriotshieldequipped )
    {
        scripts\mp\damage::launchshield( var_2, var_3 );

        if ( !var_9 )
        {
            var_10 = self dropitem( self getcurrentweapon() );

            if ( isdefined( var_10 ) )
            {
                var_10 thread scripts\mp\weapons::deletepickupafterawhile();
                var_10.owner = self;
                var_10._id_C83A = var_1;
                var_10 makeunusable();
            }
        }
    }

    if ( var_9 )
        self [[ level.weapondropfunction ]]( var_1, var_3 );

    scripts\mp\utility\game::riotshield_clear();

    if ( isdefined( self._id_C026 ) )
        return;

    self._id_2C09 = self cloneagent( var_8 );
    thread scripts\mp\damage::_id_5124( self._id_2C09, var_6, var_5, var_4, var_0, var_3 );
}

_id_98B6()
{
    if ( isdefined( self.class_override ) )
        self.class = self.class_override;
    else if ( scripts\mp\bots\bots_loadout::bot_setup_loadout_callback() )
        self.class = "callback";
    else
        self.class = "class1";
}

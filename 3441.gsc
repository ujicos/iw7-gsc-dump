// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_2D92()
{

}

_id_2D8E()
{
    level._id_2EF1 = [];
    level thread _id_2D8B();
}

_id_2D8B()
{
    self notify( "bot_connect_monitor" );
    self endon( "bot_connect_monitor" );
    level._id_2EF0 = [];

    for (;;)
    {
        foreach ( var_1 in level.players )
        {
            if ( !isbot( var_1 ) && !isdefined( var_1._id_D99A ) )
            {
                if ( isdefined( var_1.team ) && ( var_1.team == "allies" || var_1.team == "axis" ) )
                {
                    var_1._id_D99A = 1;
                    level._id_2EF0[var_1.team] = var_1;
                    level._id_2EF1[var_1.team] = 0;
                    var_2 = scripts\mp\bots\bots_util::_id_2DB5();

                    if ( level._id_2EF0.size == 2 )
                        scripts\mp\bots\bots::_id_5CE4( var_2 - 1, var_1.team );

                    scripts\mp\bots\bots::spawn_bots( var_2 - 1, var_1.team, ::_id_2D93 );

                    if ( level._id_2EF0.size == 1 )
                    {
                        var_3 = 0;

                        foreach ( var_5 in level.players )
                        {
                            if ( isdefined( var_5 ) && !isbot( var_5 ) )
                                var_3++;
                        }

                        if ( var_3 == 1 )
                            scripts\mp\bots\bots::spawn_bots( var_2 - 1, scripts\engine\utility::_id_7984( var_1.team ) );
                    }
                }
            }
        }

        wait 0.25;
    }
}

_id_2D93()
{
    self._id_C80E = ::_id_2D91;
    self._id_6D88 = level._id_2EF0[self.bot_team];
    thread _id_2D90();
}

_id_2D91()
{
    self._id_4009 = ::_id_2D8F;
    return "callback";
}

_id_2D8F()
{
    if ( isdefined( self._id_2EE3 ) )
        return self._id_2EE3;

    self._id_4006 = level._id_2EF1[self.team];
    level._id_2EF1[self.team] += 1;

    if ( self._id_4006 == 5 )
        self._id_4006 = 0;

    var_0["loadoutPrimary"] = self._id_6D88 _id_2D85( self._id_4006, 0 );
    var_0["loadoutPrimaryAttachment"] = self._id_6D88 _id_2D86( self._id_4006, 0 );
    var_0["loadoutPrimaryAttachment2"] = self._id_6D88 _id_2D87( self._id_4006, 0 );
    var_0["loadoutPrimaryCamo"] = self._id_6D88 _id_2D89( self._id_4006, 0 );
    var_0["loadoutPrimaryReticle"] = self._id_6D88 _id_2D8A( self._id_4006, 0 );
    var_0["loadoutSecondary"] = self._id_6D88 _id_2D85( self._id_4006, 1 );
    var_0["loadoutSecondaryAttachment"] = self._id_6D88 _id_2D86( self._id_4006, 1 );
    var_0["loadoutSecondaryAttachment2"] = self._id_6D88 _id_2D87( self._id_4006, 1 );
    var_0["loadoutSecondaryCamo"] = self._id_6D88 _id_2D89( self._id_4006, 1 );
    var_0["loadoutSecondaryReticle"] = self._id_6D88 _id_2D8A( self._id_4006, 1 );
    var_0["loadoutEquipment"] = self._id_6D88 _id_2D82( self._id_4006 );
    var_0["loadoutOffhand"] = self._id_6D88 _id_2D83( self._id_4006 );
    var_0["loadoutPerk1"] = self._id_6D88 _id_2D81( self._id_4006, 2 );
    var_0["loadoutPerk2"] = self._id_6D88 _id_2D81( self._id_4006, 3 );
    var_0["loadoutPerk3"] = self._id_6D88 _id_2D81( self._id_4006, 4 );
    var_0["loadoutStreakType"] = self._id_6D88 _id_2D81( self._id_4006, 5 );

    if ( var_0["loadoutStreakType"] != "specialty_null" )
    {
        var_1 = getsubstr( var_0["loadoutStreakType"], 11 ) + "Streaks";
        var_0["loadoutStreak1"] = self._id_6D88 _id_2D84( self._id_4006, var_1, 0 );

        if ( var_0["loadoutStreak1"] == "none" )
            var_0["loadoutStreak1"] = undefined;

        var_0["loadoutStreak2"] = self._id_6D88 _id_2D84( self._id_4006, var_1, 1 );

        if ( var_0["loadoutStreak2"] == "none" )
            var_0["loadoutStreak2"] = undefined;

        var_0["loadoutStreak3"] = self._id_6D88 _id_2D84( self._id_4006, var_1, 2 );

        if ( var_0["loadoutStreak3"] == "none" )
            var_0["loadoutStreak3"] = undefined;
    }

    self._id_2EE3 = var_0;
    return var_0;
}

_id_2D85( var_0, var_1 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", var_0, "weaponSetups", var_1, "weapon" );
}

_id_2D86( var_0, var_1 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", var_0, "weaponSetups", var_1, "attachment", 0 );
}

_id_2D87( var_0, var_1 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", var_0, "weaponSetups", var_1, "attachment", 1 );
}

_id_2D89( var_0, var_1 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", var_0, "weaponSetups", var_1, "camo" );
}

_id_2D8A( var_0, var_1 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", var_0, "weaponSetups", var_1, "reticle" );
}

_id_2D82( var_0 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", var_0, "perks", 0 );
}

_id_2D83( var_0 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", var_0, "perks", 1 );
}

_id_2D81( var_0, var_1 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", var_0, "perks", var_1 );
}

_id_2D84( var_0, var_1, var_2 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", var_0, var_1, var_2 );
}

_id_2D7F()
{
    var_0 = 250;
    var_1 = var_0 * var_0;

    if ( !scripts\mp\bots\bots_util::_id_2DDA( self.owner ) )
        scripts\mp\bots\bots_strategy::_id_2DC1( self.owner, var_0 );

    if ( distancesquared( self.origin, self.owner.origin ) > var_1 )
        self botsetflag( "force_sprint", 1 );
    else if ( self.owner _meth_81BD() )
        self botsetflag( "force_sprint", 1 );
    else
        self botsetflag( "force_sprint", 0 );
}

bot_fireteam_buddy_search()
{
    self endon( "buddy_cancel" );
    self endon( "disconnect" );
    self notify( "buddy_search_start" );
    self endon( "buddy_search_start" );

    for (;;)
    {
        if ( isalive( self ) && !isdefined( self.bot_fireteam_follower ) )
        {
            if ( isdefined( self.owner ) )
            {
                if ( self.sessionstate == "playing" )
                {
                    if ( !self.owner.connected )
                    {
                        self.owner.bot_fireteam_follower = undefined;
                        self.owner = undefined;
                    }
                    else if ( isdefined( level._id_6D88[self.team] ) )
                    {
                        if ( isdefined( level._id_6D88[self.team]._id_4447 ) && level._id_6D88[self.team]._id_4447 == self )
                        {
                            self.owner.bot_fireteam_follower = undefined;
                            self.owner.owner = level._id_6D88[self.team];
                            self.owner.personality_update_function = ::_id_2D7F;
                            self.owner = undefined;
                        }
                        else if ( isdefined( level._id_6D88[self.team]._id_4447 ) && level._id_6D88[self.team]._id_4447 == self.owner )
                        {
                            self.owner.bot_fireteam_follower = undefined;
                            self.owner = level._id_6D88[self.team];
                            self.owner.bot_fireteam_follower = self;
                        }
                        else if ( self.owner == level._id_6D88[self.team] && !isdefined( self.owner._id_4447 ) )
                        {
                            self.owner.bot_fireteam_follower = undefined;

                            if ( isdefined( self.owner._id_A89D ) )
                            {
                                self.owner = self.owner._id_A89D;
                                self.owner.bot_fireteam_follower = self;
                            }
                            else
                                self.owner = undefined;
                        }
                    }
                }
                else if ( isdefined( level._id_6D88[self.team] ) )
                {
                    if ( isdefined( level._id_6D88[self.team]._id_4447 ) && level._id_6D88[self.team]._id_4447 == self )
                    {
                        self.owner.bot_fireteam_follower = undefined;
                        self.owner.owner = level._id_6D88[self.team];
                        self.owner.personality_update_function = ::_id_2D7F;
                        self.owner = undefined;
                    }
                }
            }

            if ( self.sessionstate == "playing" )
            {
                if ( !isdefined( self.owner ) )
                {
                    var_0 = [];

                    foreach ( var_2 in level.players )
                    {
                        if ( var_2 != self && var_2.team == self.team )
                        {
                            if ( isalive( var_2 ) && var_2.sessionstate == "playing" && !isdefined( var_2.bot_fireteam_follower ) && !isdefined( var_2.owner ) )
                                var_0[var_0.size] = var_2;
                        }
                    }

                    if ( var_0.size > 0 )
                    {
                        var_4 = scripts\engine\utility::_id_7E2E( self.origin, var_0 );

                        if ( isdefined( var_4 ) )
                        {
                            self.owner = var_4;
                            self.owner.bot_fireteam_follower = self;
                        }
                    }
                }
            }

            if ( isdefined( self.owner ) )
                self.personality_update_function = ::_id_2D7F;
            else
                scripts\mp\bots\bots_personality::bot_assign_personality_functions();
        }

        wait 0.5;
    }
}

_id_6D94( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level.players )
    {
        if ( var_3.team == var_0 )
        {
            if ( var_3.connected && isalive( var_3 ) && var_3.sessionstate == "playing" )
            {
                if ( !isbot( var_3 ) )
                {
                    level._id_6D8C[var_0] = var_3;
                    return 1;
                }
                else
                    var_1[var_1.size] = var_3;
            }
        }
    }

    if ( !isdefined( level._id_6D8C[var_0] ) )
    {
        if ( var_1.size > 0 )
        {
            if ( var_1.size == 1 )
                level._id_6D8C[var_0] = var_1[0];
            else
                level._id_6D8C[var_0] = var_1[randomint( var_1.size )];

            return 1;
        }
    }

    return 0;
}

fireteam_tdm_hunt_end( var_0 )
{
    level notify( "hunting_party_end_" + var_0 );
    level._id_6D8C[var_0] = undefined;
    level._id_6D8E[var_0] = undefined;
    level.bot_random_path_function[var_0] = scripts\mp\bots\bots_personality::bot_random_path_default;
}

_id_6D93( var_0, var_1 )
{
    var_2 = 0;
    var_3 = undefined;
    var_4 = -1;

    if ( level._id_13FBD > 0 )
    {
        for ( var_5 = 0; var_5 < level._id_13FBD; var_5++ )
        {
            var_6 = botzonegetcount( var_5, var_1, "enemy_predict" );

            if ( var_6 < var_2 )
                continue;

            var_7 = undefined;

            if ( var_6 == var_2 )
            {
                var_7 = getzonepath( var_0, var_5 );

                if ( !isdefined( var_7 ) )
                    continue;

                if ( var_4 >= 0 && var_7.size > var_4 )
                    continue;
            }

            var_2 = var_6;
            var_3 = var_5;

            if ( isdefined( var_7 ) )
            {
                var_4 = var_7.size;
                continue;
            }

            var_4 = -1;
        }
    }

    return var_3;
}

fireteam_tdm_find_hunt_zone( var_0 )
{
    level endon( "hunting_party_end_" + var_0 );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( level._id_13FBD <= 0 )
        return;

    level.bot_random_path_function[var_0] = ::_id_2D8D;

    for (;;)
    {
        var_1 = 3;

        if ( !isdefined( level._id_6D8C[var_0] ) || isbot( level._id_6D8C[var_0] ) || isdefined( level._id_6D8C[var_0]._id_4447 ) )
            _id_6D94( var_0 );

        if ( isdefined( level._id_6D8C[var_0] ) )
        {
            var_2 = getzonenearest( level._id_6D8C[var_0].origin );

            if ( !isdefined( var_2 ) )
            {
                wait( var_1 );
                continue;
            }

            if ( !isbot( level._id_6D8C[var_0] ) )
            {
                if ( isalive( level._id_6D8C[var_0] ) && level._id_6D8C[var_0].sessionstate == "playing" && ( !isdefined( level._id_6D8C[var_0].deathtime ) || level._id_6D8C[var_0].deathtime + 5000 < gettime() ) )
                {
                    level._id_6D8E[var_0] = var_2;
                    level._id_6D8D[var_0] = gettime() + 1000;
                    var_1 = 0.5;
                }
                else
                    var_1 = 1;
            }
            else
            {
                var_3 = 0;
                var_4 = 0;
                var_5 = undefined;

                if ( isdefined( level._id_6D8E[var_0] ) )
                    var_5 = level._id_6D8E[var_0];
                else
                {
                    var_3 = 1;
                    var_4 = 1;
                    var_5 = var_2;
                }

                var_6 = undefined;

                if ( isdefined( var_5 ) )
                {
                    var_6 = _id_6D93( var_2, var_0 );

                    if ( !var_3 )
                    {
                        if ( !isdefined( var_6 ) || var_6 != var_5 )
                        {
                            if ( var_5 == var_2 )
                                var_4 = 1;
                            else if ( gettime() > level._id_6D8D[var_0] )
                                var_4 = 1;
                        }
                    }

                    if ( var_4 )
                    {
                        if ( !isdefined( var_6 ) )
                        {
                            var_7 = 0;
                            var_8 = -1;

                            for ( var_9 = 0; var_9 < level._id_13FBD; var_9++ )
                            {
                                var_10 = distance2d( getzoneorigin( var_9 ), level._id_6D8C[var_0].origin );

                                if ( var_10 > var_7 )
                                {
                                    var_7 = var_10;
                                    var_8 = var_9;
                                }
                            }

                            var_6 = var_8;
                        }

                        if ( isdefined( var_6 ) )
                        {
                            if ( !isdefined( level._id_6D8E[var_0] ) || level._id_6D8E[var_0] != var_6 )
                            {
                                foreach ( var_12 in level.players )
                                {
                                    if ( isbot( var_12 ) && var_12.team == var_0 )
                                    {
                                        var_12 botclearscriptgoal();
                                        var_12._id_6D8B = undefined;
                                        var_12 thread _id_2D8D();
                                    }
                                }
                            }

                            level._id_6D8E[var_0] = var_6;
                            level._id_6D8D[var_0] = gettime() + 12000;
                        }
                    }
                }
            }
        }

        wait( var_1 );
    }
}

_id_2D49()
{
    self notify( "bot_debug_script_goal" );
    level endon( "hunting_party_end_" + self.team );
    self endon( "bot_debug_script_goal" );
    var_0 = 48;

    for (;;)
    {
        if ( self bothasscriptgoal() )
        {
            var_1 = self botgetscriptgoal();

            if ( !isdefined( self._id_6D8B ) )
            {

            }
            else if ( self._id_6D8B != var_1 )
            {

            }
            else
            {

            }
        }
        else if ( isdefined( self._id_6D8B ) )
        {

        }

        wait 0.05;
    }
}

_id_2D8D()
{
    var_0 = 0;
    var_1 = undefined;

    if ( isdefined( level._id_6D8E[self.team] ) )
    {
        var_2 = getzonenodes( level._id_6D8E[self.team], 0 );

        if ( var_2.size <= 18 )
        {
            var_2 = getzonenodes( level._id_6D8E[self.team], 1 );

            if ( var_2.size <= 18 )
            {
                var_2 = getzonenodes( level._id_6D8E[self.team], 2 );

                if ( var_2.size <= 18 )
                    var_2 = getzonenodes( level._id_6D8E[self.team], 3 );
            }
        }

        if ( var_2.size <= 0 )
            return scripts\mp\bots\bots_personality::bot_random_path_default();

        var_1 = self botnodepick( var_2, var_2.size, "node_hide" );

        for ( var_3 = 0; !isdefined( var_1 ) || !self botnodeavailable( var_1 ); var_1 = var_2[randomint( var_2.size )] )
        {
            var_3++;

            if ( var_3 >= 10 )
                return scripts\mp\bots\bots_personality::bot_random_path_default();
        }

        var_4 = var_1.origin;

        if ( isdefined( var_4 ) )
        {
            var_5 = "guard";
            var_6 = getzonenearest( self.origin );

            if ( isdefined( var_6 ) && var_6 == level._id_6D8E[self.team] )
                self botsetflag( "force_sprint", 0 );
            else
                self botsetflag( "force_sprint", 1 );

            var_0 = self botsetscriptgoal( var_4, 128, var_5 );
            self._id_6D8B = var_4;
        }
    }

    if ( !var_0 )
        return scripts\mp\bots\bots_personality::bot_random_path_default();

    return var_0;
}

_id_2D90()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self notify( "bot_fireteam_monitor_killstreak_earned" );
    self endon( "bot_fireteam_monitor_killstreak_earned" );

    for (;;)
    {
        self waittill( "bot_killstreak_earned", var_0, var_1 );

        if ( scripts\mp\utility\game::bot_is_fireteam_mode() )
        {
            if ( isdefined( self ) && isbot( self ) )
            {
                if ( isdefined( self._id_6D88 ) )
                {
                    var_2 = undefined;

                    if ( isdefined( self._id_6D88._id_4447 ) )
                        var_2 = self._id_6D88._id_4447;
                    else
                        var_2 = self._id_6D88 getspectatingplayer();

                    if ( !isdefined( var_2 ) || var_2 != self )
                        self._id_6D88 thread scripts\mp\hud_message::showsplash( var_0, var_1, self );
                }
            }
        }
    }
}

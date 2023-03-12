// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main()
{
    scripts\mp\bots\gametype_sd::setup_callbacks();
    setup_callbacks();
    scripts\mp\bots\gametype_conf::_id_F8D8();
    scripts\mp\bots\gametype_sd::_id_2E6D();
}

setup_callbacks()
{
    level.bot_funcs["gametype_think"] = ::_id_2E9F;
}

_id_2E9F()
{
    self notify( "bot_sr_think" );
    self endon( "bot_sr_think" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self._id_8BAF = undefined;

    while ( !isdefined( level._id_2DA1 ) )
        wait 0.05;

    self._id_112FD = undefined;
    childthread _id_113ED();
    scripts\mp\bots\gametype_sd::_id_2E6E();
}

_id_113ED()
{
    for (;;)
    {
        wait 0.05;

        if ( self.health <= 0 )
            continue;

        if ( !isdefined( self._id_E67C ) )
            continue;

        var_0 = scripts\mp\bots\gametype_conf::_id_2D7C( 0 );

        if ( var_0.size > 0 )
        {
            var_1 = scripts\engine\utility::_id_DC6B( var_0 );

            if ( distancesquared( self.origin, var_1._id_02DD.curorigin ) < 10000 )
                _id_10B2C( var_1._id_02DD );
            else if ( self.team == game["attackers"] )
            {
                if ( self._id_E67C != "atk_bomber" )
                    _id_10B2C( var_1._id_02DD );
            }
            else if ( self._id_E67C != "bomb_defuser" )
                _id_10B2C( var_1._id_02DD );
        }
    }
}

_id_10B2C( var_0 )
{
    if ( isdefined( var_0._id_2E4B ) && isdefined( var_0._id_2E4B[self.team] ) && isalive( var_0._id_2E4B[self.team] ) && var_0._id_2E4B[self.team] != self )
        return;

    if ( _id_10B28( var_0 ) )
        return;

    if ( !isdefined( self._id_E67C ) )
        return;

    if ( scripts\mp\bots\bots_util::_id_2DD7() )
        scripts\mp\bots\bots_strategy::_id_2D4E();

    var_0._id_2E4B[self.team] = self;
    var_0 thread _id_4136();
    var_0 thread _id_4135( self );
    self._id_112FD = 1;
    childthread _id_C158( var_0, "tag_picked_up" );
    var_1 = var_0.curorigin;
    self botsetscriptgoal( var_1, 0, "tactical" );
    childthread _id_1397F( var_0 );
    var_2 = scripts\mp\bots\bots_util::_id_2ECB( undefined, "tag_picked_up", "new_role" );
    self notify( "stop_watch_tag_destination" );

    if ( var_2 == "no_path" )
    {
        var_1 += ( 16 * _id_DC68(), 16 * _id_DC68(), 0 );
        self botsetscriptgoal( var_1, 0, "tactical" );
        var_2 = scripts\mp\bots\bots_util::_id_2ECB( undefined, "tag_picked_up", "new_role" );

        if ( var_2 == "no_path" )
        {
            var_1 = scripts\mp\bots\bots_util::_id_2E58( "BotGetClosestNavigablePoint", scripts\mp\bots\bots_util::_id_74C3, var_0.curorigin, 32, self );

            if ( isdefined( var_1 ) )
            {
                self botsetscriptgoal( var_1, 0, "tactical" );
                var_2 = scripts\mp\bots\bots_util::_id_2ECB( undefined, "tag_picked_up", "new_role" );
            }
        }
    }
    else if ( var_2 == "bad_path" )
    {
        var_3 = getnodesinradiussorted( var_0.curorigin, 256, 0, level._id_2EA6 + 55 );

        if ( var_3.size > 0 )
        {
            var_4 = ( var_0.curorigin[0], var_0.curorigin[1], ( var_3[0].origin[2] + var_0.curorigin[2] ) * 0.5 );
            self botsetscriptgoal( var_4, 0, "tactical" );
            var_2 = scripts\mp\bots\bots_util::_id_2ECB( undefined, "tag_picked_up", "new_role" );
        }
    }

    if ( var_2 == "goal" && var_0 scripts\mp\gameobjects::_id_38C3( self.team ) )
        wait 3.0;

    if ( self bothasscriptgoal() && isdefined( var_1 ) )
    {
        var_5 = self botgetscriptgoal();

        if ( scripts\mp\bots\bots_util::_id_2EC6( var_5, var_1 ) )
            self botclearscriptgoal();
    }

    self notify( "stop_tag_watcher" );
    var_0._id_2E4B[self.team] = undefined;
    self._id_112FD = undefined;
}

_id_1397F( var_0 )
{
    self endon( "stop_watch_tag_destination" );

    for (;;)
    {
        if ( !var_0 scripts\mp\gameobjects::_id_38C3( self.team ) )
            wait 0.05;

        var_1 = self botgetscriptgoal();
        wait 0.05;
    }
}

_id_10B28( var_0 )
{
    var_1 = distance( self.origin, var_0.curorigin );
    var_2 = scripts\mp\bots\gametype_sd::_id_7AA1( self.team, 1 );

    foreach ( var_4 in var_2 )
    {
        if ( var_4 != self && isdefined( var_4._id_E67C ) && var_4._id_E67C != "atk_bomber" && var_4._id_E67C != "bomb_defuser" )
        {
            var_5 = distance( var_4.origin, var_0.curorigin );

            if ( var_5 < var_1 * 0.5 )
                return 1;
        }
    }

    return 0;
}

_id_DC68()
{
    return randomintrange( 0, 2 ) * 2 - 1;
}

_id_4136()
{
    self waittill( "reset" );
    self._id_2E4B = [];
}

_id_4135( var_0 )
{
    self endon( "reset" );
    var_1 = var_0.team;
    var_0 scripts\engine\utility::waittill_any( "death", "disconnect" );
    self._id_2E4B[var_1] = undefined;
}

_id_C158( var_0, var_1 )
{
    self endon( "stop_tag_watcher" );

    while ( var_0 scripts\mp\gameobjects::_id_38C3( self.team ) && !scripts\mp\bots\gametype_conf::_id_2D2E( var_0 ) )
        wait 0.05;

    self notify( var_1 );
}

_id_10B29( var_0 )
{
    if ( isdefined( var_0._id_2D21 ) && isdefined( var_0._id_2D21[self.team] ) && isalive( var_0._id_2D21[self.team] ) && var_0._id_2D21[self.team] != self )
        return;

    if ( !isdefined( self._id_E67C ) )
        return;

    if ( scripts\mp\bots\bots_util::_id_2DD7() )
        scripts\mp\bots\bots_strategy::_id_2D4E();

    var_0._id_2D21[self.team] = self;
    var_0 thread _id_4134();
    var_0 thread _id_4133( self );
    self._id_112FD = 1;
    scripts\mp\bots\bots_personality::clear_camper_data();
    var_1 = self._id_E67C;

    while ( var_0 scripts\mp\gameobjects::_id_38C3( self.team ) && self._id_E67C == var_1 )
    {
        if ( scripts\mp\bots\bots_personality::_id_FF87() )
        {
            if ( scripts\mp\bots\bots_personality::find_ambush_node( var_0.curorigin, 1000 ) )
                childthread scripts\mp\bots\gametype_conf::_id_2D1F( var_0, "tactical", "new_role" );
        }

        wait 0.05;
    }

    self notify( "stop_camping_tag" );
    self botclearscriptgoal();
    var_0._id_2D21[self.team] = undefined;
    self._id_112FD = undefined;
}

_id_4134()
{
    self waittill( "reset" );
    self._id_2D21 = [];
}

_id_4133( var_0 )
{
    self endon( "reset" );
    var_1 = var_0.team;
    var_0 scripts\engine\utility::waittill_any( "death", "disconnect" );
    self._id_2D21[var_1] = undefined;
}

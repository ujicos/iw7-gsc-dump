// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_45D0( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    self._id_DAD6 = undefined;

    if ( var_3 < 3.0 )
    {
        scripts\mp\hud_message::_id_10122( "KILLSTREAKS_SCORESTREAK_ENDING" );
        return 0;
    }

    var_6 = scripts\mp\killstreaks\killstreaks::_id_D507( var_1, 1 );

    if ( !var_6 )
        return 0;

    thread _id_13B05( var_2 );
    thread watchgameend();

    if ( !isdefined( var_4 ) || !var_4 )
        thread _id_13B03( var_2 );

    if ( isalive( var_0 ) && !scripts\mp\utility\game::istrue( var_0._id_5F6F ) )
        _id_10D7E( var_0, var_1._id_110EA, var_2, var_5 );
    else
    {
        self notify( var_2 );
        return 0;
    }

    return 1;
}

_id_13B01( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( var_0 );

    for (;;)
    {
        self waittill( "player_killstreak_death", var_2, var_3, var_4, var_5, var_6, var_7 );

        if ( var_3 != self && isplayer( var_3 ) )
        {
            var_3 notify( "destroyed_killstreak", var_7 );
            var_3 scripts\mp\utility\game::_id_83B4( "destroyed_" + var_1 );
            thread scripts\mp\utility\game::_id_115DE( "callout_destroyed_" + var_1, var_3 );
            thread scripts\mp\missions::_id_A6A3( var_1, self, self, undefined, var_3, var_4, var_6, var_7, "destroyed_" + var_1 );
            thread scripts\mp\utility\game::leaderdialogonplayer( var_1 + "_destroyed", undefined, undefined, self.origin );
        }

        self notify( var_0, 1 );
    }
}

_id_13B02( var_0 )
{
    self endon( var_0 );
    self waittill( "disconnect" );
    self notify( var_0, 1 );
}

_id_13B06( var_0 )
{
    self endon( var_0 );
    self waittill( "joined_team" );
    self notify( var_0, 1 );
}

_id_13B03( var_0 )
{
    self endon( "disconnect" );
    self endon( var_0 );

    for (;;)
    {
        var_1 = 0;

        while ( self usebuttonpressed() )
        {
            var_1 += 0.05;

            if ( var_1 > 0.75 )
            {
                self._id_D3CB = self.origin;
                self notify( var_0 );
                return;
            }

            wait 0.05;
        }

        wait 0.05;
    }
}

_id_13B07( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( var_0 );
    wait( var_1 );
    self notify( var_0, 1 );
}

_id_13B04( var_0 )
{
    self endon( "disconnect" );
    self endon( var_0 );

    for (;;)
        self waittill( "emp_damage", var_1, var_2 );
}

_id_13B05( var_0 )
{
    scripts\engine\utility::waittill_any( var_0, "level_game_ended" );
    _id_11066();
}

watchgameend()
{
    level waittill( "game_ended" );
    self notify( "level_game_ended" );
}

_id_10D7E( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self ) && isalive( var_0 ) )
    {
        self _meth_84E2( var_0 );

        if ( isdefined( var_3 ) )
            self visionsetnakedforplayer( var_3, 0 );

        self._id_D3E7 = var_0;
    }
}

_id_8077( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "spiderbot":
            var_1 = 0.45;
            break;
        case "remote_c8":
            var_1 = -0.2;
            break;
    }

    return var_1;
}

_id_11066()
{
    if ( isdefined( self ) )
    {
        if ( scripts\mp\utility\game::_id_9D92() )
        {
            self _meth_84E3();
            self visionsetnakedforplayer( "", 0 );
        }

        thread scripts\mp\killstreaks\killstreaks::_id_11086( 1 );
        self._id_D3E7 = undefined;
        self._id_165A = undefined;
    }
}

_id_4198( var_0 )
{
    scripts\mp\archetypes\archcommon::_id_E0D0( var_0._id_AE62 );
    scripts\mp\perks::_id_11AA();
}

_id_DDA3( var_0 )
{
    var_1 = undefined;

    switch ( var_0._id_AE62 )
    {
        case "archetype_assault":
            var_1 = scripts\mp\archetypes\archassault::_id_20BB;
            break;
        case "archetype_heavy":
            var_1 = _id_0D6C::_id_20BB;
            break;
        case "archetype_scout":
            var_1 = _id_0D6F::_id_20BB;
            break;
        case "archetype_assassin":
            var_1 = _id_0D67::_id_20BB;
            break;
        case "archetype_engineer":
            var_1 = _id_0D6B::_id_20BB;
            break;
        case "archetype_sniper":
            var_1 = _id_0D70::_id_20BB;
            break;
    }

    scripts\mp\class::_id_AE58( var_0 );

    if ( isdefined( var_1 ) )
        self [[ var_1 ]]();
}

_id_A670( var_0 )
{

}

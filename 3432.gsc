// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_20BB()
{
    _id_6692();
}

_id_6692()
{

}

_id_E0D0()
{
    self notify( "removeArchetype" );
}

_id_2616()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    self setclientomnvar( "ui_aura_quickswap", 0 );

    for (;;)
    {
        self waittill( "got_a_kill" );

        foreach ( var_1 in level.players )
        {
            if ( var_1.team != self.team )
                continue;

            if ( distance2dsquared( var_1.origin, self.origin ) > 147456 )
                continue;

            var_1 thread _id_2615( self );
        }
    }
}

_id_2615( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "giveLoadout_start" );
    level endon( "game_ended" );

    if ( self != var_0 )
        var_0 thread scripts\mp\utility\game::_id_83B4( "buff_teammate" );

    self setclientomnvar( "ui_aura_quickswap", 1 );
    scripts\mp\utility\game::giveperk( "specialty_fastreload" );
    self playlocalsound( "mp_overcharge_on" );
    thread _id_40E1();
    wait 5;
    self playlocalsound( "mp_overcharge_off" );
    self notify( "removeAuraQuickswap" );
    scripts\mp\utility\game::_id_E150( "specialty_fastreload" );
    self setclientomnvar( "ui_aura_quickswap", 0 );
}

_id_40E1()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    self setclientomnvar( "ui_aura_quickswap", 0 );
}

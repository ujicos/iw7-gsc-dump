// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_139F9()
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "setDodge" );
    self endon( "setDodge" );
    self endon( "removeArchetype" );
    thread _id_5802();

    for (;;)
    {
        self waittill( "dodgeBegin" );
        scripts\mp\utility\game::_id_D915( "dodge", self );

        if ( isdefined( self._id_45D6 ) && self._id_45D6 == 1 )
            continue;

        if ( isdefined( self._id_13118 ) && self._id_13118 != "" )
            continue;

        self._id_5812 = 1;
        scripts\mp\missions::_id_D991( "ch_scout_dodge_uses" );

        if ( scripts\mp\utility\game::_id_12D6( "specialty_dodge_defense" ) )
            self setclientomnvar( "ui_light_armor", 1 );

        thread _id_139FB();
        var_0 = self _meth_814C();

        for (;;)
        {
            if ( var_0[0] > 0 )
            {
                if ( var_0[1] <= 0.7 && var_0[1] >= -0.7 )
                {
                    self setscriptablepartstate( "dodge", "dodge_forward" );
                    break;
                }

                if ( var_0[0] > 0.5 && var_0[1] > 0.7 )
                {
                    self setscriptablepartstate( "dodge", "dodge_forward_right" );
                    break;
                }

                if ( var_0[0] > 0.5 && var_0[1] < -0.7 )
                {
                    self setscriptablepartstate( "dodge", "dodge_forward_left" );
                    break;
                }
            }

            if ( var_0[0] < 0 )
            {
                if ( var_0[1] < 0.4 && var_0[1] > -0.4 )
                {
                    self setscriptablepartstate( "dodge", "dodge_back" );
                    break;
                }

                if ( var_0[0] < -0.5 && var_0[1] > 0.5 )
                {
                    self setscriptablepartstate( "dodge", "dodge_back_right" );
                    break;
                }

                if ( var_0[0] < -0.5 && var_0[1] < -0.5 )
                {
                    self setscriptablepartstate( "dodge", "dodge_back_left" );
                    break;
                }
            }

            if ( var_0[1] > 0.4 )
            {
                self setscriptablepartstate( "dodge", "dodge_right" );
                break;
            }

            if ( var_0[1] < -0.4 )
            {
                self setscriptablepartstate( "dodge", "dodge_left" );
                break;
            }
            else
                break;
        }

        if ( isdefined( self._id_5809 ) )
            triggerfx( self._id_5809 );

        foreach ( var_2 in level.players )
        {
            if ( isdefined( var_2 ) && var_2 != self )
                playfxontagforclients( level._effect["dash_trail"], self, "tag_shield_back", var_2 );
        }

        if ( !self isjumping() )
        {

        }

        self playlocalsound( "synaptic_dash" );
        self playsound( "synaptic_dash_npc" );
        wait 1.5;
        self setscriptablepartstate( "dodge", "default" );
    }
}

_id_5802()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    self endon( "setDodge" );

    for (;;)
    {
        var_0 = self _meth_842B( 1 );
        var_1 = self _meth_842D( 1 );

        if ( var_0 >= var_1 )
            self setclientomnvar( "ui_dodge_charges", 1 );
        else
            self setclientomnvar( "ui_dodge_charges", 0 );

        wait 0.05;
    }
}

_id_139FB()
{
    level endon( "game_ended" );
    scripts\engine\utility::waittill_any( "dodgeEnd", "death", "disconnect" );
    self._id_5812 = 0;

    if ( scripts\mp\utility\game::_id_12D6( "specialty_dodge_defense" ) )
        self setclientomnvar( "ui_light_armor", 0 );

    if ( isdefined( self ) )
        stopfxontag( level._effect["dash_trail"], self, "tag_shield_back" );

    if ( isdefined( self._id_5809 ) )
        self._id_5809 delete();
}

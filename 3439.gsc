// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_97D0()
{
    level._effect["dodge_ground_spark_fx"] = loadfx( "vfx/iw7/_requests/mp/vfx_dodge_ground_spark_fx" );
    level._effect["dash_trail"] = loadfx( "vfx/iw7/_requests/mp/vfx_dash_trail" );
    level._effect["dodge_fwd_screen"] = loadfx( "vfx/core/mp/equipment/vfx_dodge_fwd_scrn" );
    level._effect["dodge_back_screen"] = loadfx( "vfx/core/mp/equipment/vfx_dodge_back_scrn" );
    level._effect["dodge_left_screen"] = loadfx( "vfx/core/mp/equipment/vfx_dodge_left_scrn" );
    level._effect["dodge_right_screen"] = loadfx( "vfx/core/mp/equipment/vfx_dodge_right_scrn" );
    level._effect["dodge_fwd_left_screen"] = loadfx( "vfx/core/mp/equipment/vfx_dodge_fwd_left_scrn" );
    level._effect["dodge_fwd_right_screen"] = loadfx( "vfx/core/mp/equipment/vfx_dodge_fwd_right_scrn" );
    level._effect["dodge_back_left_screen"] = loadfx( "vfx/core/mp/equipment/vfx_dodge_back_left_scrn" );
    level._effect["dodge_back_right_screen"] = loadfx( "vfx/core/mp/equipment/vfx_dodge_back_right_scrn" );
}

_id_98AE()
{
    level._effect["speed_strip_friendly"] = loadfx( "vfx/iw7/_requests/mp/vfx_aura_speed_friend" );
}

_id_98AF()
{

}

_id_20BB()
{
    _id_6692();
}

_id_6692()
{
    scripts\mp\utility\game::giveperk( "specialty_falldamage" );
}

_id_E0D0()
{
    self._id_B94B = undefined;
    self setclientomnvar( "ui_dodge_charges", 0 );
    self notify( "removeArchetype" );
}

_id_3886()
{
    self notify( "removeScoutMomentum" );
}

_id_13B32()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    self endon( "removeScoutMomentum" );
    var_0 = 0;
    var_1 = -1;

    for (;;)
    {
        var_2 = self getentityvelocity();
        var_3 = length( var_2 );

        if ( var_3 >= 0 && var_3 <= 120 )
            var_1 = -25;
        else if ( var_3 > 120 && var_3 <= 150 )
            var_1 = -20;
        else if ( var_3 > 150 && var_3 <= 180 )
            var_1 = -15;
        else if ( var_3 > 180 && var_3 <= 210 )
            var_1 = -10;
        else if ( var_3 > 210 && var_3 <= 250 )
            var_1 = 0;
        else if ( var_3 > 250 && var_3 <= 330 )
            var_1 = 5;
        else if ( var_3 > 330 )
            var_1 = 10;

        var_0 += var_1;
        var_0 = clamp( var_0, 0, 100 );
        var_4 = _id_7FC8( var_0 );
        self._id_B94B = var_4;

        if ( scripts\mp\utility\game::_id_12D6( "specialty_scoutping" ) || scripts\mp\utility\game::_id_12D6( "passive_scoutping" ) )
            scripts\mp\perks\perkfunctions::_id_12F0E( var_4 );

        wait 0.5;
    }
}

_id_7FC8( var_0 )
{
    var_1 = 0;

    if ( var_0 >= 10 && var_0 <= 20 )
        var_1 = 1;
    else if ( var_0 > 20 && var_0 <= 30 )
        var_1 = 2;
    else if ( var_0 > 30 && var_0 <= 40 )
        var_1 = 3;
    else if ( var_0 > 40 && var_0 <= 50 )
        var_1 = 4;
    else if ( var_0 > 50 && var_0 <= 60 )
        var_1 = 5;
    else if ( var_0 > 60 && var_0 <= 70 )
        var_1 = 6;
    else if ( var_0 > 70 && var_0 <= 80 )
        var_1 = 7;
    else if ( var_0 > 80 && var_0 <= 90 )
        var_1 = 8;
    else if ( var_0 > 90 && var_0 <= 100 )
        var_1 = 9;

    return var_1;
}

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

        if ( isdefined( self._id_45D6 ) && self._id_45D6 == 1 )
            continue;

        if ( isdefined( self._id_13118 ) && self._id_13118 != "" )
            continue;

        self._id_5812 = 1;

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
            playfxontag( level._effect["dodge_ground_spark_fx"], self, "tag_origin" );

        self playlocalsound( "synaptic_dash" );
        self playsound( "synaptic_dash_npc" );
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

_id_F861()
{

}

_id_E175()
{
    if ( isdefined( self._id_D753 ) && self._id_D753 == 1 )
    {
        scripts\mp\utility\game::_id_E150( "specialty_quieter" );
        scripts\mp\utility\game::_id_E150( "specialty_ghost" );
        scripts\mp\utility\game::_id_E150( "specialty_spygame" );
        scripts\mp\utility\game::_id_E150( "specialty_blindeye" );
        scripts\mp\utility\game::_id_E150( "specialty_coldblooded" );
        scripts\mp\utility\game::_id_E150( "specialty_noscopeoutline" );
        scripts\mp\utility\game::_id_E150( "specialty_heartbreaker" );
        scripts\mp\utility\game::_id_E150( "specialty_noplayertarget" );
        self._id_D753 = undefined;
    }
}

_id_130E0()
{
    for (;;)
    {
        if ( self isonladder() )
        {
            wait 0.1;
            continue;
        }

        break;
    }

    scripts\mp\utility\game::giveperk( "specialty_quieter" );
    scripts\mp\utility\game::giveperk( "specialty_ghost" );
    scripts\mp\utility\game::giveperk( "specialty_spygame" );
    scripts\mp\utility\game::giveperk( "specialty_blindeye" );
    scripts\mp\utility\game::giveperk( "specialty_coldblooded" );
    scripts\mp\utility\game::giveperk( "specialty_noscopeoutline" );
    scripts\mp\utility\game::giveperk( "specialty_heartbreaker" );
    scripts\mp\utility\game::giveperk( "specialty_noplayertarget" );
    self._id_D753 = 1;
    _id_11320();
    _id_0AE2::_id_4575( 30, "powers_stealth_mode_update" );
    _id_E175();
}

_id_11320()
{
    scripts\engine\utility::_id_1C71( 0 );
    var_0 = self getweaponslistprimaries();
    var_1 = getweaponbasename( var_0[0] );
    var_2 = self getweaponammostock( var_0[0] );
    var_3 = self getweaponammoclip( var_0[0] );
    var_4 = undefined;
    var_5 = undefined;
    var_6 = undefined;

    if ( var_0.size > 1 )
    {
        var_4 = getweaponbasename( var_0[1] );
        var_5 = self getweaponammostock( var_0[1] );
        var_6 = self getweaponammoclip( var_0[1] );
    }

    var_7 = self getcurrentweapon();
    var_8 = undefined;

    foreach ( var_10 in var_0 )
    {
        if ( !issubstr( var_10, "silencer" ) )
        {
            var_11 = undefined;
            var_12 = getweaponattachments( var_10 );
            var_13 = scripts\mp\utility\game::_id_8217( var_10 );

            foreach ( var_15 in var_13 )
            {
                if ( issubstr( var_15, "silencer" ) )
                {
                    var_11 = scripts\mp\utility\game::_id_2496( var_15, var_10 );
                    break;
                }
            }

            if ( isdefined( var_11 ) )
            {
                foreach ( var_15 in var_12 )
                {
                    if ( scripts\mp\utility\game::_id_249D( var_15, var_11 ) )
                        continue;

                    var_12 = scripts\engine\utility::array_remove( var_12, var_15 );
                }

                var_12 = scripts\engine\utility::_id_2279( var_12, var_11 );
                var_19 = getweaponbasename( var_10 );
                var_20 = scripts\mp\utility\game::_id_8234( var_10 );
                var_8 = scripts\mp\class::_id_3224( var_20, var_12 );
                wait 0.3;
                scripts\mp\utility\game::_id_141E( var_10 );
                scripts\mp\utility\game::_id_12C6( var_8 );

                if ( var_19 == var_1 )
                {
                    self setweaponammoclip( var_8, var_3 );
                    self setweaponammostock( var_8, var_2 );
                }
                else if ( isdefined( var_6 ) )
                {
                    self setweaponammoclip( var_8, var_6 );
                    self setweaponammostock( var_8, var_5 );
                }

                if ( var_10 == var_7 )
                    scripts\mp\utility\game::_id_141A( var_8 );
            }
        }
    }

    scripts\engine\utility::_id_1C71( 1 );
}

_id_F6F2()
{
    self _meth_8454( 4 );
}

_id_139FA()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );

    if ( 0 )
        thread _id_E844();

    if ( 0 )
        thread _id_E85D();

    if ( 0 )
        thread _id_E864();

    if ( 0 )
        thread _id_E89E();
}

_id_E844()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );

    for (;;)
    {
        self waittill( "dodgeBegin" );
        var_0 = spawn( "script_origin", self.origin );
        var_0 setmodel( "tag_origin" );
        var_0 linkto( self, "tag_origin", ( 0, 0, 64 ), ( 0, 0, 0 ) );
        var_0 thread scripts\mp\weapons::_id_56E5( self, 1 );
    }
}

_id_E85D()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );

    for (;;)
    {

    }
}

_id_E89E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );

    for (;;)
        self waittill( "dodgeEnd" );
}

_id_E864()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );

    for (;;)
    {
        self waittill( "dodgeEnd" );

        if ( !isdefined( self._id_B94A ) )
            self._id_B94A = 1.5;
        else
        {
            self._id_B94A += 1.5;
            continue;
        }

        scripts\mp\utility\game::giveperk( "specialty_stalker" );
        _id_B949();
        scripts\mp\utility\game::_id_E150( "specialty_stalker" );
        self._id_B94A = undefined;
    }
}

_id_B949()
{
    self._id_BCF6 = 1.2;
    scripts\mp\weapons::_id_12ED5();

    for ( var_0 = gettime(); var_0 + self._id_B94A * 1000 > gettime(); self._id_B94A -= 0.05 )
        scripts\engine\utility::waitframe();

    self._id_BCF6 = 1;
    scripts\mp\weapons::_id_12ED5();
}

_id_2620()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    _id_98AE();
    self setclientomnvar( "ui_aura_speedboost", 0 );

    for (;;)
    {
        self waittill( "got_a_kill" );

        foreach ( var_1 in level.players )
        {
            if ( var_1.team != self.team )
                continue;

            if ( scripts\mp\equipment\charge_mode::_id_3CEE( var_1 ) )
                continue;

            if ( distance2dsquared( var_1.origin, self.origin ) > 147456 )
                continue;

            var_1 thread _id_261E( self );
        }
    }
}

_id_261E( var_0 )
{
    self endon( "disconnect" );
    self endon( "giveLoadout_start" );

    if ( self != var_0 )
        var_0 thread scripts\mp\utility\game::_id_83B4( "buff_teammate" );

    self._id_BCF6 = 1.1;
    scripts\mp\weapons::_id_12ED5();
    self setclientomnvar( "ui_aura_speedboost", 1 );
    var_1 = playfxontag( scripts\engine\utility::_id_7ECB( "speed_strip_friendly" ), self, "tag_origin" );
    thread _id_2621( var_1 );
    scripts\engine\utility::_id_13736( 3, "death" );
    thread _id_261F();
}

_id_2621( var_0 )
{
    level endon( "game_ended" );
    scripts\engine\utility::waittill_any( "death", "aura_speed_end" );
    stopfxontag( scripts\engine\utility::_id_7ECB( "speed_strip_friendly" ), self, "tag_origin" );
    self setclientomnvar( "ui_aura_speedboost", 0 );
}

_id_261F()
{
    self notify( "aura_speed_end" );
    self._id_BCF6 = 1.0;
    scripts\mp\weapons::_id_12ED5();
}

_id_B947()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    self endon( "removeCombatHigh" );
    _id_98AF();

    for (;;)
    {
        self waittill( "got_a_kill", var_0, var_1, var_2 );

        if ( scripts\engine\utility::_id_9D74( var_2 ) || var_2 == "MOD_MELEE" )
            thread _id_B942();
    }
}

_id_B942()
{
    self endon( "disconnect" );
    self endon( "giveLoadout_start" );
    self.speedonkillmod = 0.06;
    scripts\mp\weapons::_id_12ED5();
    self playlocalsound( "mp_overcharge_on" );
    self setscriptablepartstate( "momentumScreen", "momentumScreen_On", 0 );
    thread _id_B948();
    scripts\engine\utility::_id_13736( scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_9D46(), 3, 4 ), "death" );
    thread _id_B945();
}

_id_B948()
{
    level endon( "game_ended" );
    scripts\engine\utility::waittill_any( "death", "momentum_end" );
    self setscriptablepartstate( "momentumScreen", "momentumScreen_Off", 0 );
}

_id_B945()
{
    self notify( "momentum_end" );
    self.speedonkillmod = 0;
    scripts\mp\weapons::_id_12ED5();
    self playlocalsound( "mp_overcharge_off" );
}

_id_B946()
{
    if ( self._id_AE62 == "archetype_scout" && level.gametype != "infect" )
        self setscriptablepartstate( "momentumScreen", "momentumScreen_Off", 0 );
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_F81E()
{
    thread _id_13A62();
}

_id_12D1B( var_0 )
{
    self notify( "rewindUnset" );

    if ( !scripts\mp\utility\game::istrue( var_0 ) && !scripts\mp\utility\game::istrue( level.broshotrunning ) )
    {
        self setscriptablepartstate( "jet_pack", "neutral", 0 );
        self setscriptablepartstate( "teamColorPins", "teamColorPins", 0 );
    }

    if ( self._id_AE62 == "archetype_scout" )
        self setscriptablepartstate( "rewindIdle", "neutral", 0 );

    thread _id_E163();
}

_id_10DEB()
{
    level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_rewind", undefined, 0.75 );

    if ( self.health < self.maxhealth )
        scripts\mp\missions::_id_D991( "ch_scout_damaged_rewind" );

    self._id_9F2A = 1;
    self playerhide();
    self setscriptablepartstate( "jet_pack", "off", 0 );
    self setscriptablepartstate( "teamColorPins", "off", 0 );
    self setscriptablepartstate( "rewindStartFlash", "active", 0 );
    self setscriptablepartstate( "rewindIdle", "active", 0 );
    self _meth_8209();
    applytempeffects();
}

_id_637E( var_0 )
{
    _id_E4D5();
    _id_E4C7();
    self setscriptablepartstate( "rewindIdle", "neutral", 0 );

    if ( !scripts\mp\utility\game::istrue( level.broshotrunning ) )
    {
        self _meth_8447();

        if ( !scripts\mp\utility\game::istrue( var_0 ) )
        {
            self setscriptablepartstate( "jet_pack", "neutral", 0 );
            self setscriptablepartstate( "teamColorPins", "teamColorPins", 0 );
            self setscriptablepartstate( "rewindEndFlash", "active", 0 );
        }
    }

    thread _id_E163();
}

_id_E163()
{
    self._id_9F2A = undefined;
    self _meth_8208();
    removetempeffects();
}

_id_13A62()
{
    self endon( "disconnect" );
    self endon( "rewindUnset" );
    self notify( "watchForRewind" );
    self endon( "watchForRewind" );

    for (;;)
    {
        var_0 = spawnstruct();
        childthread _id_13A66( var_0 );
        childthread _id_13A64( var_0 );
        childthread _id_13A63( var_0 );
        childthread _id_13A65( var_0 );
        self waittill( "rewindBeginRace" );
        waittillframeend;

        if ( isdefined( var_0._id_6ACF ) )
        {
            if ( isplayer( self ) )
                scripts\mp\hud_message::_id_10122( "MP_REWIND_FAILED" );

            scripts\mp\supers::_id_DE7D();
        }
        else if ( isdefined( var_0._id_10DE6 ) && isdefined( var_0._id_4E59 ) )
            scripts\mp\supers::_id_DE7D();
        else if ( isdefined( var_0._id_637B ) )
        {
            self notify( "rewind_success" );
            _id_637E();
        }
        else if ( isdefined( var_0._id_10DE6 ) )
        {
            self notify( "rewind_success" );
            _id_10DEB();
        }

        self notify( "rewindEndRace" );
    }
}

_id_13A66( var_0 )
{
    self endon( "rewindEndRace" );
    self waittill( "rewindStart" );
    var_0._id_10DE6 = 1;
    self notify( "rewindBeginRace" );
}

_id_13A64( var_0 )
{
    self endon( "rewindEndRace" );
    self waittill( "rewindEnd" );
    var_0._id_637B = 1;
    self notify( "rewindBeginRace" );
}

_id_13A63( var_0 )
{
    self endon( "rewindEndRace" );
    self waittill( "death" );
    var_0._id_4E59 = 1;
    self notify( "rewindBeginRace" );
}

_id_13A65( var_0 )
{
    self endon( "rewindEndRace" );
    self waittill( "rewindFailed" );
    var_0._id_6ACF = 1;
    self notify( "rewindBeginRace" );
}

_id_E4D5()
{
    if ( scripts\mp\utility\game::_id_9D46() )
        self.health = int( min( self.maxhealth, self.health + 25 ) );
    else
    {
        var_0 = self.maxhealth - self.health;
        self.health = self.maxhealth;
    }
}

_id_E4C7()
{
    var_0 = self getweaponslistprimaries();
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        var_4 = scripts\mp\utility\game::_id_8225( var_3 );

        if ( var_4 == "super" || var_4 == "weapon_mg" || var_4 == "killstreak" || var_4 == "gamemode" || var_4 == "other" )
        {
            var_1[var_1.size] = var_3;
            continue;
        }

        if ( scripts\mp\weapons::isaxeweapon( var_3 ) || scripts\mp\weapons::_id_9E6D( var_3 ) )
        {
            var_1[var_1.size] = var_3;
            continue;
        }

        if ( getsubstr( var_3, 0, 7 ) == "deploy_" )
        {
            var_1[var_1.size] = var_3;
            continue;
        }

        if ( scripts\mp\weapons::_id_9D3E( var_3 ) )
        {
            var_5 = 0;
            var_6 = scripts\mp\utility\game::_id_821A( var_3 );

            foreach ( var_8 in var_6 )
            {
                if ( getsubstr( var_8, 0, 2 ) == "gl" )
                {
                    var_5 = 1;
                    break;
                }
            }

            if ( var_5 )
                continue;

            if ( self _meth_8519( var_3, 1 ) )
                var_3 = getsubstr( var_3, 4, var_3.size );

            var_1[var_1.size] = var_3;
            continue;
        }
    }

    var_1 = scripts\engine\utility::_id_22AF( var_1 );

    foreach ( var_3 in var_1 )
        var_0 = scripts\engine\utility::array_remove( var_0, var_3 );

    foreach ( var_3 in var_0 )
    {
        var_14 = 0;

        if ( scripts\mp\utility\game::_id_8234( var_3 ) == "iw7_fmg" )
            var_14 = self _meth_8519( var_3, 1 );
        else if ( issubstr( var_3, "akimbo" ) )
            var_14 = 1;

        if ( var_14 )
        {
            var_15 = self getweaponammoclip( var_3, "left" ) + self getweaponammoclip( var_3, "right" ) + self getweaponammostock( var_3 );
            var_15 = int( max( var_15, weaponstartammo( var_3 ) ) );
            var_16 = weaponclipsize( var_3 );
            var_17 = int( max( 0, var_15 - var_16 * 2 ) );
            self setweaponammoclip( var_3, var_16, "left" );
            self setweaponammoclip( var_3, var_16, "right" );
            self setweaponammostock( var_3, var_17 );
            continue;
        }

        var_15 = self getweaponammoclip( var_3 ) + self getweaponammostock( var_3 );
        var_15 = int( max( var_15, weaponstartammo( var_3 ) ) );
        var_16 = weaponclipsize( var_3 );
        var_17 = int( max( 0, var_15 - var_16 ) );
        self setweaponammoclip( var_3, var_16 );
        self setweaponammostock( var_3, var_17 );
    }
}

applytempeffects()
{
    if ( scripts\mp\utility\game::istrue( self.rewind_appliedtempeffects ) )
        return;

    self.rewind_appliedtempeffects = 1;
    var_0 = self getcurrentweapon();

    if ( var_0 == "briefcase_bomb_mp" )
        self _meth_83B8( var_0 );

    scripts\engine\utility::_id_1C76( 0 );
    scripts\engine\utility::_id_1C6E( 0 );
    scripts\engine\utility::_id_1C35( 0 );
    scripts\mp\utility\game::giveperk( "specialty_blindeye" );
    scripts\mp\utility\game::giveperk( "specialty_spygame" );
    scripts\mp\utility\game::giveperk( "specialty_coldblooded" );
    scripts\mp\utility\game::giveperk( "specialty_noscopeoutline" );
    scripts\mp\utility\game::giveperk( "specialty_no_target" );
    thread applytempeffectscleanup();
}

removetempeffects()
{
    if ( !scripts\mp\utility\game::istrue( self.rewind_appliedtempeffects ) )
        return;

    self.rewind_appliedtempeffects = undefined;
    scripts\engine\utility::_id_1C76( 1 );
    scripts\engine\utility::_id_1C6E( 1 );
    scripts\engine\utility::_id_1C35( 1 );
    scripts\mp\utility\game::_id_E150( "specialty_blindeye" );
    scripts\mp\utility\game::_id_E150( "specialty_spygame" );
    scripts\mp\utility\game::_id_E150( "specialty_coldblooded" );
    scripts\mp\utility\game::_id_E150( "specialty_noscopeoutline" );
    scripts\mp\utility\game::_id_E150( "specialty_no_target" );
}

applytempeffectscleanup()
{
    self endon( "disconnect" );
    self endon( "rewindUnset" );
    self notify( "applyTempEffectsCleanup" );
    self endon( "applyTempEffectsCleanup" );
    self waittill( "death" );
    self.rewind_appliedtempeffects = undefined;
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_F286()
{

}

_id_12BF4( var_0 )
{
    if ( _id_9FC1() )
        _id_62A3( var_0 );
}

_id_12F9B()
{
    if ( _id_9FC1() )
        return 0;

    self._id_9D8B = 1;
    self._id_5583 = 1;
    scripts\mp\utility\game::giveperk( "specialty_noscopeoutline" );
    scripts\mp\utility\game::giveperk( "specialty_spygame" );
    scripts\mp\utility\game::giveperk( "specialty_blindeye" );
    scripts\mp\utility\game::giveperk( "specialty_no_target" );
    self._id_423A = 1;
    self setscriptablepartstate( "cloak", "on", 0 );
    self setscriptablepartstate( "jet_pack", "off", 0 );
    self setscriptablepartstate( "teamColorPins", "off", 0 );

    if ( !scripts\mp\utility\game::_id_9D46() )
        thread scripts\mp\supers::watchobjuse( 75, 1 );

    thread _id_13A14();
    return 1;
}

_id_13A14()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "cloak_end" );
    scripts\engine\utility::waittill_any( "grenade_throw", "weapon_fired", "melee_fired" );
    scripts\mp\supers::_id_DE3B( 9999 );
}

_id_62A3( var_0, var_1 )
{
    if ( !isdefined( self ) )
        return;

    self notify( "cloak_end" );
    self notify( "obj_drain_end" );
    var_0 = scripts\engine\utility::_id_9CEE( var_0 );
    var_1 = scripts\engine\utility::_id_9CEE( var_1 );

    if ( var_0 )
    {
        self setscriptablepartstate( "cloak", "offImmediate", 0 );
        self._id_9D8B = undefined;
        self._id_5583 = 0;
        self._id_423A = undefined;
    }
    else if ( var_1 )
        thread endimmediate();
    else
        thread enddelayed();
}

enddelayed()
{
    self endon( "disconnect" );
    self endon( "cloak_end" );
    enddelayedinternal();

    if ( scripts\mp\utility\game::istrue( self._id_423A ) )
    {
        scripts\mp\utility\game::_id_E150( "specialty_noscopeoutline" );
        scripts\mp\utility\game::_id_E150( "specialty_spygame" );
        scripts\mp\utility\game::_id_E150( "specialty_blindeye" );
        scripts\mp\utility\game::_id_E150( "specialty_no_target" );
    }

    if ( !scripts\mp\utility\game::istrue( level.broshotrunning ) )
    {
        self setscriptablepartstate( "jet_pack", "neutral", 0 );
        self setscriptablepartstate( "teamColorPins", "teamColorPins", 0 );
    }

    self._id_9D8B = undefined;
    self._id_5583 = 0;
    self._id_423A = undefined;
}

enddelayedinternal()
{
    self endon( "death" );
    wait 0.05;

    if ( !scripts\mp\utility\game::istrue( level.broshotrunning ) )
        self setscriptablepartstate( "cloak", "off", 0 );

    wait 0.45;
}

endimmediate()
{
    if ( scripts\mp\utility\game::istrue( self._id_423A ) )
    {
        scripts\mp\utility\game::_id_E150( "specialty_noscopeoutline" );
        scripts\mp\utility\game::_id_E150( "specialty_spygame" );
        scripts\mp\utility\game::_id_E150( "specialty_blindeye" );
        scripts\mp\utility\game::_id_E150( "specialty_no_target" );
    }

    if ( !scripts\mp\utility\game::istrue( level.broshotrunning ) )
    {
        self setscriptablepartstate( "jet_pack", "neutral", 0 );
        self setscriptablepartstate( "teamColorPins", "teamColorPins", 0 );
    }

    self._id_9D8B = undefined;
    self._id_5583 = 0;
    self._id_423A = undefined;
}

_id_E26A()
{
    self setscriptablepartstate( "cloak", "offImmediate", 0 );
}

_id_9FC1()
{
    return scripts\mp\utility\game::istrue( self._id_9D8B );
}

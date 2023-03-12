// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{

}

_id_F87E()
{
    thread _id_13A73();
}

_id_12D44()
{
    self notify( "teleportUnset" );

    if ( self._id_AE62 == "archetype_assassin" )
        self setscriptablepartstate( "teleporttrail", "neutral", 0 );

    self _meth_8208();
    scripts\mp\utility\game::_id_E0E6( "teleport", 0 );
}

_id_10DFA( var_0, var_1 )
{
    self _meth_84D3( "power_active", "teleport" );
    self setscriptablepartstate( "teleporttrail", "active", 0 );
    self _meth_8209();
    level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_ftl", undefined, 0.75 );
    thread _id_4524( 0.5 );
}

_id_6391()
{
    self playsound( "ftl_teleport_npc_in" );
    self _meth_84D3( "power_exit", "teleport" );
    self setscriptablepartstate( "teleporttrail", "neutral", 0 );
    self _meth_8208();
}

_id_13A73()
{
    self endon( "disconnect" );
    self endon( "teleportUnset" );
    self notify( "watchForTeleport" );
    self endon( "watchForTeleport" );

    for (;;)
    {
        var_0 = spawnstruct();
        childthread _id_13A77( var_0 );
        childthread _id_13A75( var_0 );
        childthread _id_13A74( var_0 );
        childthread _id_13A76( var_0 );
        self waittill( "teleportBeginRace" );
        waittillframeend;

        if ( isdefined( var_0._id_6ACF ) )
        {
            if ( isplayer( self ) )
                scripts\mp\hud_message::_id_10122( "MP_TELEPORT_FAILED" );

            scripts\mp\supers::_id_DE7D();
        }
        else if ( isdefined( var_0._id_10DE6 ) && isdefined( var_0._id_4E59 ) )
            scripts\mp\supers::_id_DE7D();
        else if ( isdefined( var_0._id_637B ) )
        {
            self notify( "teleport_success" );
            _id_6391();
        }
        else if ( isdefined( var_0._id_10DE6 ) )
        {
            self notify( "teleport_success" );
            _id_10DFA( var_0._id_02C5, var_0._id_6378 );
        }

        self notify( "teleportEndRace" );
    }
}

_id_13A77( var_0 )
{
    self endon( "teleportEndRace" );
    self waittill( "teleportStart", var_1, var_2 );
    var_0._id_10DE6 = 1;
    var_0._id_02C5 = var_1;
    var_0._id_6378 = var_2;
    self notify( "teleportBeginRace" );
}

_id_13A75( var_0 )
{
    self endon( "teleportEndRace" );
    self waittill( "teleportEnd" );
    var_0._id_637B = 1;
    self notify( "teleportBeginRace" );
}

_id_13A74( var_0 )
{
    self endon( "teleportEndRace" );
    self waittill( "death" );
    var_0._id_4E59 = 1;
    self notify( "teleportBeginRace" );
}

_id_13A76( var_0 )
{
    self endon( "teleportEndRace" );
    self waittill( "teleportFailed" );
    var_0._id_6ACF = 1;
    self notify( "teleportBeginRace" );
}

_id_4524( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    scripts\mp\utility\game::giveperk( "specialty_no_target" );
    wait( var_0 );
    scripts\mp\utility\game::_id_E150( "specialty_no_target" );
}

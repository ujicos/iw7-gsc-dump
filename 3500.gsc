// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_B337()
{
    level._effect["map_target_mark"] = loadfx( "vfx/iw7/_requests/mp/vfx_marker_map_target" );
}

_id_8112( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_3 = 0;

    if ( scripts\mp\utility\game::_id_9EAF( var_0 ) )
        var_3 = 1;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    thread _id_13AC4();
    thread _id_13AE7();
    var_4 = undefined;
    self setscriptablepartstate( "killstreak", "visor_active", 0 );
    self visionsetnakedforplayer( "map_select_mp", 0.5 );
    var_4 = _id_76F7( var_1, var_2 );
    return var_4;
}

_id_76F7( var_0, var_1 )
{
    var_2 = 1;

    if ( var_0 <= 1 )
    {
        self setclientomnvar( "ui_map_select_uses", -1 );
        var_2 = 0;
    }

    self._id_B338 = 0;
    self._id_D8AD = undefined;
    var_3 = [];
    thread _id_13AC5();

    if ( scripts\mp\utility\game::istrue( var_2 ) )
    {
        self setclientomnvar( "ui_map_select_uses", var_0 );
        self setclientomnvar( "ui_map_select_count", var_0 );
    }

    while ( self._id_B338 < var_0 )
    {
        var_4 = _id_1374C( "confirm_location", "cancel_location" );

        if ( !isdefined( var_4 ) || var_4._id_11145 == "cancel_location" )
        {
            var_3 = undefined;
            break;
        }

        var_3[var_3.size] = var_4;
        self._id_B338++;

        if ( scripts\mp\utility\game::istrue( var_2 ) )
            self setclientomnvar( "ui_map_select_uses", var_0 - self._id_B338 );

        self playlocalsound( "bombardment_killstreak_select" );
    }

    self setclientomnvar( "ui_map_select_count", -1 );
    self notify( "map_select_exit" );
    self visionsetnakedforplayer( "", 0 );

    if ( scripts\mp\utility\game::istrue( level._id_C1BB ) && !scripts\mp\utility\game::istrue( level._id_C1B2 ) )
        thread scripts\mp\killstreaks\nuke::_id_FB0F( 0.05 );

    self setscriptablepartstate( "killstreak", "neutral", 0 );

    if ( isdefined( var_3 ) )
        self.pers["startedMapSelect"] = 0;

    return var_3;
}

_id_13AC5()
{
    self endon( "map_select_exit" );

    for (;;)
    {
        if ( self getcurrentweapon() != "ks_remote_map_mp" )
        {
            self notify( "cancel_location" );
            break;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_13AC4()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "map_select_exit" );
    _id_1107B();
}

_id_13AE7()
{
    self endon( "disconnect" );
    self endon( "map_select_exit" );
    level endon( "game_ended" );
    self setclientomnvar( "ui_location_selection_countdown", gettime() + 30000 );
    scripts\engine\utility::_id_13736( 30, "death" );
    self notify( "cancel_location" );
}

_id_10DC2( var_0, var_1, var_2 )
{
    if ( !self.pers["startedMapSelect"] )
    {
        triggeroneoffradarsweep( self );
        self.pers["startedMapSelect"] = 1;
    }

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    self beginlocationselection( var_0, var_1, var_2, 1 );
}

_id_1107B()
{
    self _meth_80DE();
    self._id_B338 = undefined;
    self._id_B336 = undefined;
    self._id_D8AD = undefined;

    if ( scripts\mp\utility\game::isreallyalive( self ) )
        self notify( "killstreak_finished_with_weapon_ks_remote_map_mp" );
    else
        self.pers["startedMapSelect"] = 0;
}

_id_1374C( var_0, var_1, var_2 )
{
    if ( ( !isdefined( var_0 ) || var_0 != "death" ) && ( !isdefined( var_1 ) || var_1 != "death" ) )
        self endon( "death" );

    var_3 = spawnstruct();

    if ( isdefined( var_0 ) )
        childthread _id_137F9( var_0, var_3 );

    if ( isdefined( var_1 ) )
        childthread _id_137F9( var_1, var_3 );

    if ( isdefined( var_2 ) )
        childthread _id_137F9( var_2, var_3 );

    var_3 waittill( "returned", var_4, var_5, var_6 );
    var_3 notify( "die" );
    var_7 = spawnstruct();
    var_7._id_AEC4 = var_4;
    var_7.angles = var_5;
    var_7._id_11145 = var_6;
    return var_7;
}

_id_137F9( var_0, var_1 )
{
    if ( var_0 != "death" )
        self endon( "death" );

    var_1 endon( "die" );
    self waittill( var_0, var_2, var_3 );
    var_1 notify( "returned", var_2, var_3, var_0 );
}

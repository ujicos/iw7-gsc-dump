// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_97D0()
{
    level._effect["swipe_trail"] = loadfx( "vfx/iw7/_requests/mp/vfx_swipe_trail" );
    level._id_DDA0 = "prop_mp_reaper_shield";
}

_id_20BB()
{
    self _meth_845A( "reaper_mp" );
    _id_6692();
    self _meth_80A9();
    self._id_9F1B = 0;
    self._id_C4DA = 0;
    self._id_B62A = spawn( "script_model", self.origin );
    self._id_B62A setmodel( "tag_origin" );
    self._id_FC9F = spawn( "script_model", self.origin );
    self._id_FC9F setmodel( level._id_DDA0 );
    self._id_FC9F setcandamage( 0 );
    self._id_FC9F hide();
    thread _id_13ACC();
    self _meth_845E( 1 );
}

_id_E0D0()
{
    self notify( "removeReaper" );
    self _meth_80DB();
    self._id_FC9F delete();
    self._id_B62A delete();
}

_id_6692()
{

}

_id_4FB9( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "removeReaper" );
    self endon( "shield_down" );
    level endon( "game_ended" );

    while ( self._id_4BFD > var_0 )
    {
        self._id_4BFD -= var_0;
        wait( var_1 );
    }

    self._id_C4DA = 1;
    self notify( "drop_shield" );
}

_id_93EE( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "removeReaper" );
    self endon( "shield_up" );
    level endon( "game_ended" );

    while ( self._id_4BFD < var_2 )
    {
        self._id_4BFD += var_0;

        if ( self._id_4BFD > 33 )
            self._id_C4DA = 0;

        wait( var_1 );
    }
}

_id_13994()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "removeReaper" );
    level endon( "game_ended" );
    var_0 = 3;
    var_1 = 100;
    var_2 = var_1 / var_0;
    self._id_4BFD = var_1;
    var_3 = 0.1;
    var_4 = var_2 * var_3;
    self._id_FCA5 = 0;
    thread _id_5D58();
    thread _id_5D57( var_4, var_3, var_1 );

    for (;;)
    {
        if ( self._id_9F1B )
        {
            wait 0.05;
            continue;
        }

        if ( self adsbuttonpressed() && !self._id_FCA5 && !self._id_C4DA )
            _id_FCA5( var_4, var_3 );
        else if ( !self adsbuttonpressed() && self._id_FCA5 )
            _id_FC98( var_4, var_3, var_1 );

        wait 0.05;
    }
}

_id_5D57( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "removeReaper" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "drop_shield" );
        _id_FC98( var_0, var_1, var_2 );
    }
}

_id_FCA5( var_0, var_1 )
{
    thread _id_4FB9( var_0, var_1 );
    self._id_FCA5 = 1;
    self notify( "shield_up" );
    self._id_FC9F.angles = self.angles + ( 0, 90, 0 );
    self._id_FC9F.origin = _id_36DB( 32 );
    self playlocalsound( "reaper_shield_up" );
    self._id_FC9F playsound( "reaper_shield_up_npc" );
    self._id_FC9F show();
    self._id_FC9F setcandamage( 1 );
    thread _id_BCEE();
    thread _id_FC9C();
    self _meth_80AA();
    self allowjump( 0 );
    self _meth_8010( 0 );
    scripts\mp\utility\game::_id_1309( "iw7_erad_mp", self.origin + ( 0, 0, 4500 ), self.origin + ( 0, 0, 5500 ), self );
}

_id_FC98( var_0, var_1, var_2 )
{
    thread _id_93EE( var_0, var_1, var_2 );
    self playlocalsound( "reaper_shield_down" );
    self._id_FC9F playsound( "reaper_shield_down_npc" );
    self notify( "shield_down" );
    self._id_FCA5 = 0;
    self enableweapons();
    self allowjump( 1 );
    self _meth_8010( 1 );
    self._id_FC9F hide();
    self._id_FC9F setcandamage( 0 );
}

_id_5D58()
{
    level endon( "game_ended" );
    var_0 = scripts\engine\utility::_id_13735( "death", "disconnect" );

    if ( var_0 == "death" )
    {
        self enableweapons();
        self allowjump( 1 );
        self _meth_8010( 1 );
        self notify( "shield_down" );

        if ( isdefined( self._id_FC9F ) )
        {
            self._id_FC9F hide();
            self._id_FC9F setcandamage( 0 );
        }
    }

    if ( var_0 == "disconnect" && isdefined( self._id_FC9F ) )
    {
        self._id_FC9F hide();
        self._id_FC9F setcandamage( 0 );
    }
}

_id_FC9C()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeReaper" );
    self endon( "shield_down" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( isdefined( var_3 ) )
            playloopsound( var_3, "bs_shield_impact" );
        else
            playloopsound( self._id_FC9F.origin, "bs_shield_impact" );

        var_1 scripts\mp\damagefeedback::updatedamagefeedback( "hitbulletstorm" );
        wait 0.05;
    }
}

_id_BCEE( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeReaper" );
    self endon( "shield_down" );
    level endon( "game_ended" );

    if ( isdefined( var_0 ) )
        var_1 = var_0;
    else
        var_1 = 32;

    for (;;)
    {
        self._id_FC9F.angles = self.angles + ( 0, 90, 0 );
        self._id_FC9F.origin = _id_36DB( var_1 );
        wait 0.05;
    }
}

_id_36DB( var_0 )
{
    var_1 = ( 0, 0, 0 );
    var_2 = self.origin + var_1;
    var_3 = anglestoforward( self.angles );
    var_4 = anglestoright( self.angles );
    var_5 = self _meth_816B();
    var_6 = vectordot( var_5, self.angles );
    var_7 = length( var_5 );

    if ( var_7 < 64 )
        var_7 = 64;

    if ( var_7 > 64 && var_7 < 128 )
        var_7 = 92;

    if ( var_7 > 350 )
        var_7 = 500;

    if ( var_7 > 200 )
        var_7 = 256;

    if ( var_7 > 128 )
        var_7 = 164;

    if ( var_6 < 1 )
        var_7 = 64;

    if ( isdefined( var_0 ) )
        var_7 = var_0;

    return var_2 + var_3 * var_7;
}

_id_13ACC( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeReaper" );
    level endon( "game_ended" );
    var_1 = ( 0, 0, 32 );

    for (;;)
    {
        self waittill( "melee_fired" );
        var_2 = self.origin + var_1;
        var_3 = anglestoforward( self.angles );
        var_4 = anglestoright( self.angles );
        scripts\mp\utility\game::_id_1309( "iw7_erad_mp", self.origin + ( 0, 0, 4500 ), self.origin + ( 0, 0, 5500 ), self );
        self playrumbleonentity( "damage_light" );
        earthquake( 0.2, 0.1, self.origin, 32 );
        var_5 = _id_36DB( var_0 );
        var_5 += var_1;
        var_6 = var_2 + var_4 * 64;
        var_7 = var_2 - var_4 * 32;
        var_8 = rotatevector( var_4, ( 0, 45, 0 ) );
        var_9 = var_2 + var_8 * 64;
        var_10 = rotatevector( var_4, ( 0, 135, 0 ) );
        var_11 = var_2 + var_10 * 32;
        var_12 = gettime();
        self._id_B62A.origin = var_6;
        wait 0.05;
        playfxontag( level._effect["swipe_trail"], self._id_B62A, "tag_origin" );
        wait 0.05;
        self._id_B62A.origin = var_9;
        wait 0.05;
        self._id_B62A.origin = var_5;
        thread _id_20D9( var_5 );
        wait 0.05;
        self._id_B62A.origin = var_11;
        wait 0.05;
        self._id_B62A.origin = var_7;
        wait 0.05;
        stopfxontag( level._effect["swipe_trail"], self._id_B62A, "tag_origin" );
    }
}

_id_20D9( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeReaper" );
    level endon( "game_ended" );
    var_1 = distance2d( self.origin, var_0 ) / 2;
    self _meth_8253( self.origin, var_1, 135, 135, self, "MOD_MELEE", "iw7_reaperblade_mp" );
}

_id_11A83( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeReaper" );
    level endon( "game_ended" );
    var_3 = self.origin + ( 0, 0, 32 );
    var_4 = undefined;
    var_5 = undefined;
    var_6 = undefined;
    var_7 = undefined;
    var_8 = 0;
    var_9 = gettime();
    var_10 = var_2;
    var_4 = scripts\engine\trace::_id_DCED( var_3, var_0, var_10 );

    if ( isdefined( var_4["entity"] ) )
    {
        var_8 = 1;
        var_6 = var_4["entity"];
        var_10[var_10.size] = var_6;
    }

    if ( isdefined( var_1 ) )
    {
        var_5 = scripts\engine\trace::_id_DCED( var_0, var_1, var_10 );

        if ( isdefined( var_5 ) && isdefined( var_5["entity"] ) )
        {
            var_8 = 1;
            var_7 = var_4["entity"];
            var_10[var_10.size] = var_7;
        }
    }

    if ( isdefined( var_6 ) )
    {
        if ( isdefined( var_6._id_904B ) && var_6._id_904B == var_9 )
            return var_10;

        if ( !scripts\mp\utility\game::_id_24F0( var_6, self ) && var_6 != self )
            var_6 thread [[ level.callbackplayerdamage ]]( undefined, self, 135, 0, "MOD_MELEE", "iw7_reaperblade_mp", self.origin, undefined, "none", 0 );
    }

    if ( isdefined( var_7 ) )
    {
        if ( isdefined( var_7._id_904B ) && var_7._id_904B == var_9 )
            return var_10;

        if ( !scripts\mp\utility\game::_id_24F0( var_7, self ) && var_7 != self )
            var_7 thread [[ level.callbackplayerdamage ]]( undefined, self, 135, 0, "MOD_MELEE", "iw7_reaperblade_mp", self.origin, undefined, "none", 0 );
    }

    return var_10;
}

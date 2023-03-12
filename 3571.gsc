// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_BFBE()
{
    level._effect["niagara_expl"] = loadfx( "vfx/iw7/_requests/mp/power/vfx_niagara_airburst_expl" );
}

_id_BFC9()
{

}

_id_BFCA()
{

}

_id_BFCB()
{
    self._id_BFB8 = spawnstruct();
    self._id_BFB8._id_9D25 = 1;
    thread _id_BFCD();
}

_id_BFCD()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "niagara_end" );
    self._id_BFB8._id_13CE4 = self getcurrentprimaryweapon();

    if ( self._id_BFB8._id_13CE4 == "none" )
        self._id_BFB8._id_13CE4 = self._id_A978;

    scripts\engine\utility::_id_1C76( 0 );
    scripts\engine\utility::_id_1C58( 0 );
    scripts\engine\utility::_id_1C6E( 0 );
    self._id_BFB8._id_55E4 = 1;
    self giveweapon( "iw7_niagara_mp" );
    scripts\mp\utility\game::_id_141B( "iw7_niagara_mp" );
    self setweaponammoclip( "iw7_niagara_mp", 2 );
    self setweaponammostock( "iw7_niagara_mp", 0 );
    self _meth_80A9();
    self._id_BFB8._id_55DB = 1;
    var_0 = "none";

    while ( var_0 != "iw7_niagara_mp" )
        self waittill( "weapon_change", var_0 );

    thread _id_BFCC();
    scripts\engine\utility::_id_1C76( 1 );
    scripts\engine\utility::_id_1C58( 1 );
    scripts\engine\utility::_id_1C6E( 1 );
    self._id_BFB8._id_55E4 = undefined;
    thread _id_BFC5();
    thread _id_BFC8();
    thread _id_BFC3();
}

_id_BFBB( var_0, var_1 )
{
    self notify( "niagara_end" );

    if ( !isdefined( self ) )
        return;

    if ( !isdefined( var_0 ) )
        var_0 = 1;

    if ( self hasweapon( "iw7_niagara_mp" ) && var_0 )
    {
        if ( self getcurrentprimaryweapon() == "iw7_niagara_mp" )
        {
            if ( !isdefined( var_1 ) || var_1 == "none" || !scripts\mp\weapons::_id_9F0E( var_1 ) )
                var_1 = self._id_BFB8._id_13CE4;

            if ( !self hasweapon( var_1 ) )
                var_1 = self._id_A978;

            if ( isdefined( var_1 ) && self hasweapon( var_1 ) )
                scripts\mp\utility\game::_id_141B( var_1 );
        }

        scripts\mp\utility\game::_id_141E( "iw7_niagara_mp" );
    }

    if ( isdefined( self._id_BFB8._id_55DB ) )
        self _meth_80DB();

    if ( isdefined( self._id_BFB8._id_55E4 ) )
    {
        scripts\engine\utility::_id_1C76( 1 );
        scripts\engine\utility::_id_1C58( 1 );
        scripts\engine\utility::_id_1C6E( 1 );
    }

    if ( isdefined( self._id_BFB8._id_55C8 ) )
        self _meth_800C( 1 );

    self._id_BFB8 = undefined;
    self notify( "powers_niagara_update", -1 );
}

_id_BFC8()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "niagara_end" );
    var_0 = "iw7_niagara_mp";

    while ( var_0 == "iw7_niagara_mp" )
        self waittill( "weapon_change", var_0 );

    thread _id_BFBB( 1, var_0 );
}

_id_BFC7()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "niagara_end" );
    var_0 = _id_0AE2::_id_D735( "power_niagara" );
    self notifyonplayercommand( "niagara_button_pressed", var_0 );
    self waittill( "niagara_button_pressed" );
    thread _id_BFBB();
}

_id_BFC3()
{
    self endon( "niagara_end" );
    scripts\engine\utility::waittill_any( "death", "disconnect" );
    thread _id_BFBB( 0, undefined );
}

_id_BFBC( var_0 )
{
    thread _id_BFBD();
    self _meth_800C( 0 );
    self._id_BFB8._id_55C8 = 1;
    var_1 = self getammocount( "iw7_niagara_mp" );
    var_2 = var_1 * 0.5;
    self notify( "powers_niagara_update", var_2 );
    var_3 = var_0 scripts\engine\utility::_id_107E6();
    var_0._id_A63A = var_3;
    var_0._id_6C1A = var_1 == 0;
    thread _id_BFC0( var_3 );
    thread _id_BFC1( var_3, var_0 );
    thread _id_BFC4( var_0, var_3 );

    if ( var_0._id_6C1A )
        thread _id_BFC6( var_0, var_3, 1 );
    else
        thread _id_BFC6( var_0, var_3, 0 );

    self._id_BFB8._id_6D96 = gettime();
    self._id_BFB8._id_6D9A = anglestoforward( self getplayerangles() ) * 1175 + ( 0, 0, 10 );
}

_id_BFC5()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "niagara_end" );

    for (;;)
    {

    }
}

_id_BFC4( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "niagara_end" );
    var_0 endon( "death" );
    self notifyonplayercommand( "niagara_detonateButtonPressed", "+attack" );
    self notifyonplayercommand( "niagara_detonateButtonPressed", "+attack_akimbo_accessible" );
    self notifyonplayercommand( "niagara_detonateButtonPressed", "+smoke" );
    self waittill( "niagara_detonateButtonPressed" );
    var_2 = ( gettime() - self._id_BFB8._id_6D96 ) / 1000;
    var_3 = self._id_BFB8._id_6D9A + ( 0, 0, -800 ) * var_2 * var_2;
    var_4 = vectortoangles( var_3 );
    var_5 = ( 0, 0, 1 ) * vectordot( var_3, ( 0, 0, 1 ) );
    var_6 = var_3 - var_5;
    var_5 *= 1;
    var_6 *= 0.7;
    var_3 = var_5 + var_6;
    var_3 += ( 0, 0, 55 );
    var_7 = [];
    var_8 = self _meth_8449( "niagara_mini_mp", var_0.origin, var_3 );
    var_8._id_9E9E = 1;
    var_8._id_13C2E = "iw7_niagara_mp";
    var_8._id_A63A = var_0._id_A63A;
    var_7[var_7.size] = var_8;
    var_9 = 0;
    var_10 = 45 + var_9;
    var_11 = 90;
    var_12 = randomfloatrange( 45, 75 );

    for ( var_13 = 0; var_13 < 4; var_13++ )
    {
        var_14 = var_10 + var_13 * 90;
        var_15 = var_3;
        var_15 += anglestoright( var_4 ) * cos( var_14 ) * var_12;
        var_15 += anglestoup( var_4 ) * sin( var_14 ) * var_12;
        var_8 = self _meth_8449( "niagara_mini_mp", var_0.origin, var_15 );
        var_8._id_9E9E = 1;
        var_8._id_A63A = var_0._id_A63A;
        var_7[var_7.size] = var_8;
    }

    var_10 = 0 + var_9;
    var_11 = 90;
    var_12 = randomfloatrange( 95, 125 );

    for ( var_13 = 0; var_13 < 4; var_13++ )
    {
        var_14 = var_10 + var_13 * 90;
        var_15 = var_3;
        var_15 += anglestoright( var_4 ) * cos( var_14 ) * var_12;
        var_15 += anglestoup( var_4 ) * sin( var_14 ) * var_12;
        var_8 = self _meth_8449( "niagara_mini_mp", var_0.origin, var_15 );
        var_8._id_9E9E = 1;
        var_8._id_13C2E = "iw7_niagara_mp";
        var_8._id_A63A = var_0._id_A63A;
        var_7[var_7.size] = var_8;
    }

    self._id_BFB8._id_6D9A = undefined;
    self._id_BFB8._id_6D96 = undefined;
    var_0 _meth_8253( var_0.origin, 128, 15, 65, self, "MOD_EXPLOSIVE", "iw7_niagara_mp" );
    thread _id_BFBA( var_0.origin, var_0.angles );
    thread _id_BFC2( var_1, var_7 );

    if ( var_0._id_6C1A )
        thread _id_BFC6( var_0, undefined, 1 );
    else
        thread _id_BFC6( var_0, undefined, 0 );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_BFC6( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "niagara_end" );
    self notify( "niagara_monitorMissileDeath_" + var_0 getentitynumber() );
    self endon( "niagara_monitorMissileDeath_" + var_0 getentitynumber() );
    var_0 waittill( "death" );
    wait 0.25;

    if ( isdefined( self._id_BFB8._id_55C8 ) )
    {
        self _meth_800C( 1 );
        self._id_BFB8._id_55C8 = undefined;
    }

    if ( var_2 )
        thread _id_BFBB();

    scripts\engine\utility::waitframe();

    if ( isdefined( var_1 ) )
        var_1 delete();
}

_id_BFC1( var_0, var_1 )
{
    self endon( "niagara_killCamPhase1End" + var_0 getentitynumber() );
    var_0 endon( "death" );
    var_2 = var_1.origin;

    for (;;)
    {
        var_3 = var_2 - var_0.origin;

        if ( lengthsquared( var_3 ) > 1024 )
            var_0 moveto( var_2, 0.1, 0, 0 );

        var_0 rotateto( vectortoangles( var_3 ), 0.1 );
        wait 0.1;

        if ( isdefined( var_1 ) )
            var_2 = var_1.origin;
    }
}

_id_BFC2( var_0, var_1 )
{
    var_0 endon( "death" );
    self notify( "niagara_killCamPhase1End" + var_0 getentitynumber() );
    var_2 = _id_BFB9( var_1 );

    for (;;)
    {
        var_3 = var_2 - var_0.origin;

        if ( lengthsquared( var_3 ) > 65536 )
            var_0 moveto( var_2, 0.15, 0, 0 );

        var_0 rotateto( vectortoangles( var_3 ), 0.15 );
        wait 0.15;
        var_2 = _id_BFB9( var_1 );

        if ( !isdefined( var_2 ) )
            break;
    }

    scripts\engine\utility::waitframe();
    var_0 delete();
}

_id_BFBF( var_0 )
{
    return var_0;
}

_id_BFC0( var_0 )
{
    var_0 endon( "death" );
    self waittill( "disconnect" );
    var_0 delete();
}

_id_BFB9( var_0 )
{
    var_1 = 0;
    var_2 = ( 0, 0, 0 );

    foreach ( var_4 in var_0 )
    {
        if ( !isdefined( var_4 ) )
            continue;

        var_2 += var_4.origin;
        var_1++;
    }

    if ( var_1 == 0 )
        return undefined;

    return var_2 / var_1;
}

_id_BFCC()
{

}

_id_BFBA( var_0, var_1 )
{
    playfx( scripts\engine\utility::_id_7ECB( "niagara_expl" ), var_0, anglestoforward( var_1 ), anglestoup( var_1 ) );
    playloopsound( var_0, "grenade_explode_scr" );
}

_id_BFBD()
{

}

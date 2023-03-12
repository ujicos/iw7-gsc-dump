// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_5AC0()
{
    self endon( "killanimscript" );
    var_0 = self _meth_8148();
    var_1 = var_0._id_0048;
    self notify( "traverse_begin", var_1, var_0 );
    self waittill( "traverse_end" );
}

_id_3E96( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        return _id_3EF4( var_0, var_1, var_2 );

    return scripts\asm\asm::_id_2358( var_1, var_2 );
}

_id_3EB8( var_0, var_1, var_2 )
{
    return 0;
}

_id_3EF4( var_0, var_1, var_2 )
{
    var_3 = self getanimentrycount( var_1 );

    if ( var_3 == 1 )
        return 0;

    return randomint( var_3 );
}

_id_3EB6( var_0, var_1, var_2 )
{
    return _id_3E96( var_0, var_1, var_2 );
}

_id_CEA8( var_0, var_1, var_2, var_3 )
{
    scripts\asm\asm_mp::_id_2364( var_0, var_1, var_2, var_3 );
}

_id_B050( var_0, var_1, var_2, var_3 )
{
    scripts\asm\asm_mp::_id_235F( var_0, var_1, var_2, 1.0 );
}

_id_136B4( var_0, var_1, var_2 )
{
    self endon( var_1 + "_finished" );
    self _meth_84BD();
    self waittill( "stop_soon" );
    self._id_20EE = self _meth_813A();
    scripts\asm\asm::_id_2330( var_1, "cover_approach", self._id_20EE );
}

_id_136CC( var_0, var_1, var_2 )
{
    self endon( var_1 + "_finished" );
    self waittill( "path_set" );
    var_3 = self _meth_813A();
    var_4 = [ var_3, 1 ];
    scripts\asm\asm::_id_2330( var_1, "sharp_turn", var_4 );
    thread _id_136CC( var_0, var_1, var_2 );
}

_id_136E7( var_0, var_1, var_2 )
{
    self endon( var_1 + "_finished" );
    self waittill( "path_dir_change", var_3 );
    var_4 = [ var_3, 1 ];
    scripts\asm\asm::_id_2330( var_1, "sharp_turn", var_4 );
    thread _id_136E7( var_0, var_1, var_2 );
}

_id_D4DD( var_0, var_1, var_2, var_3 )
{
    thread _id_136B4( var_0, var_1, var_3 );
    thread _id_136E7( var_0, var_1, var_3 );
    thread _id_136CC( var_0, var_1, var_3 );
    var_4 = 1.0;

    if ( isdefined( self._id_2303._id_BCD6 ) )
        var_4 = self._id_2303._id_BCD6;
    else if ( isdefined( self._id_BCD6 ) )
        var_4 = self._id_BCD6;

    scripts\asm\asm_mp::_id_235F( var_0, var_1, var_2, var_4 );
}

_id_FFB6( var_0, var_1, var_2, var_3 )
{
    if ( !_id_100A3( var_0, var_1, var_2, var_3 ) )
        return 1;

    if ( !scripts\asm\asm_bb::_id_2956( "combat" ) )
        return 1;

    if ( scripts\asm\asm_bb::_id_2950( var_0, var_1, var_2, var_3 ) )
        return 1;

    return 0;
}

_id_100A3( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
    {
        if ( !scripts\asm\asm_bb::_id_2949( var_0, var_1, var_2, var_3 ) )
            return 0;
    }

    if ( self._id_1198._id_1D64 )
        return 0;

    if ( !scripts\asm\asm_bb::_id_2956( "combat" ) )
        return 0;

    if ( !scripts\asm\asm_bb::_id_298E() )
        return 0;

    if ( !isdefined( self._id_010C ) )
    {
        if ( !isdefined( self._id_6571 ) )
            return 0;
    }

    return 1;
}

_id_9DED( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0.5;

    var_1 = anglestoforward( self.angles );
    var_2 = vectornormalize( self._id_010C.origin - self.origin );
    var_3 = vectordot( var_1, var_2 );

    if ( var_3 < var_0 )
        return 0;

    return 1;
}

_id_9FFF()
{
    if ( _id_9D2E() )
        return 1;

    return 0;
}

_id_10076( var_0, var_1, var_2, var_3 )
{
    if ( !scripts\asm\asm_bb::_id_291C() )
        return 0;

    if ( isdefined( self._id_010C ) )
    {
        if ( !_id_9DED() && !_id_9FFF() )
            return 0;

        if ( !self _meth_805F( self._id_010C ) )
            return 0;
    }

    return 1;
}

_id_3EB3( var_0, var_1, var_2 )
{
    var_3 = scripts\asm\asm::_id_233C();

    if ( scripts\asm\asm::_id_234A( var_3, "idle" ) )
    {
        var_4 = scripts\asm\asm::_id_233D( var_3, "idle" );

        if ( isarray( var_4 ) )
            return var_4[randomint( var_4.size )];

        return var_4;
    }

    return _id_3EAB( var_0, var_1, var_2 );
}

_id_3EAB( var_0, var_1, var_2 )
{
    if ( isdefined( self.weapon ) )
        var_3 = weaponclass( self.weapon );
    else
        var_3 = "none";

    if ( !scripts\asm\asm::_id_2346( var_1, var_3 + var_2 ) )
        var_3 = "rifle";

    return scripts\asm\asm::_id_2358( var_1, var_3 + var_2 );
}

_id_138E2()
{
    if ( scripts\asm\asm_bb::_id_292C() == "crouch" )
        return 1;

    return 0;
}

_id_811E( var_0 )
{
    if ( !isdefined( self._id_1198._id_FECD ) )
        return undefined;
    else if ( isdefined( self._id_1198._id_FECD._id_65D3 ) )
        return self._id_1198._id_FECD._id_65D3 _meth_815B();
    else if ( isdefined( self._id_1198._id_FECD._id_D699 ) )
        return self._id_1198._id_FECD._id_D699;
    else if ( isdefined( self._id_010C ) )
        return self._id_010C _meth_815B();

    return undefined;
}

_id_811C()
{
    if ( isdefined( self._id_130A9 ) )
    {
        var_0 = self _meth_8143();
        return ( var_0[0], var_0[1], self geteye()[2] );
    }

    return ( self.origin[0], self.origin[1], self geteye()[2] );
}

_id_9D2E()
{
    if ( !isdefined( self._id_1198._id_FECD._id_D699 ) && !isdefined( self._id_1198._id_FECD._id_65D3 ) )
        return 1;

    var_0 = self _meth_8141();
    var_1 = _id_811C();
    var_2 = _id_811E( var_1 );

    if ( !isdefined( var_2 ) )
        return 0;

    var_3 = vectortoangles( var_2 - var_1 );
    var_4 = scripts\engine\utility::_id_152F( var_0[1] - var_3[1] );

    if ( var_4 > anim._id_1A52 )
    {
        if ( distancesquared( self geteye(), var_2 ) > anim._id_1A50 || var_4 > anim._id_1A51 )
        {

        }
    }

    var_5 = _id_7DA3();
    return scripts\engine\utility::_id_152F( var_0[0] - var_3[0] ) <= var_5;
}

_id_7DA3()
{
    if ( isdefined( self._id_1A44 ) )
        return self._id_1A44;
    else
        return anim._id_1A44;
}

_id_CEC0( var_0, var_1, var_2 )
{

}

_id_CEC1( var_0, var_1, var_2 )
{

}

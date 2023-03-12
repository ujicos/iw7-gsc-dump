// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_B063( var_0, var_1, var_2, var_3 )
{
    self setscriptablepartstate( "run", "active", 0 );
    self _meth_828A( "gravity" );
    scripts\asm\asm_mp::_id_2364( var_0, var_1, var_2, 1.3 );
}

_id_F173( var_0, var_1, var_2, var_3 )
{
    self setscriptablepartstate( "run", "activeEnd", 0 );
}

_id_F178( var_0, var_1, var_2, var_3 )
{
    self._id_9FB2 = 0;
    self setscriptablepartstate( "jump", "activeEnd", 0 );
}

_id_D560( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self._id_9FB2 = 1;
    self setscriptablepartstate( "jump", "active", 0 );
    var_4 = self _meth_8148();
    var_5 = self _meth_8145();
    self _meth_828A( "noclip" );
    self orientmode( "face angle abs", var_4.angles );
    self _meth_8281( "anim deltas" );
    self scragentsetanimscale( 1.0, 1.0 );
    var_6 = var_5.origin - var_4.origin;
    var_7 = self getanimentry( var_1, 0 );
    var_8 = getanimlength( var_7 );
    var_9 = getmovedelta( var_7 );
    self _meth_827B( self.origin, var_5.origin, var_8 );
    self setanimstate( var_1, 0 );
    wait( var_8 );
    self _meth_828A( "gravity" );
    self notify( "traverse_end" );
    _id_11701( var_0, var_1 );
}

_id_D562( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    var_4 = self _meth_8148();
    var_5 = self _meth_8145();
    self _meth_828A( "noclip" );
    self orientmode( "face angle abs", var_4.angles );
    self _meth_8281( "anim deltas" );
    self scragentsetanimscale( 1.0, 1.0 );
    var_6 = var_5.origin - var_4.origin;
    var_7 = self getanimentry( var_1, 0 );
    var_8 = getanimlength( var_7 );
    self setanimstate( var_1, 0 );
    var_9 = undefined;
    var_10 = var_4.origin[2] - var_5.origin[2];

    if ( var_10 < -16.0 )
    {
        var_9 = var_5.origin + ( 0, 0, 32 );
        self _meth_827B( self.origin, var_9, var_8 );
        wait( var_8 );
        self setanimstate( var_1, 1 );
    }
    else if ( var_10 > 16 )
    {
        var_9 = ( var_5.origin[0], var_5.origin[1], var_4.origin[2] );
        self _meth_827B( self.origin, var_9, var_8 * 0.5 );
        wait( var_8 * 0.5 );
    }
    else
    {
        self _meth_827B( self.origin, var_5.origin, var_8 );
        wait( var_8 );
    }

    self _meth_828A( "gravity" );
    self notify( "traverse_end" );
    _id_11701( var_0, var_1 );
}

_id_BBC2( var_0 )
{
    self endon( "stop_motion_hack" );

    for (;;)
    {
        self setorigin( var_0.origin, 1 );
        self.angles = var_0.angles;
        wait 0.05;
    }
}

_id_11701( var_0, var_1 )
{
    var_2 = anim._id_2303[var_0]._id_10E2F[var_1];
    var_3 = undefined;

    if ( isarray( var_2._id_116FB ) )
        var_3 = var_2._id_116FB[0];
    else
        var_3 = var_2._id_116FB;

    scripts\asm\asm::_id_2388( var_0, var_1, var_2, var_2._id_116FB );
    scripts\asm\asm::_id_238A( var_0, var_3, 0.0, undefined, undefined, undefined );
    self notify( "killanimscript" );
}

_id_F16E( var_0, var_1, var_2, var_3 )
{
    self notify( "terminate_ai_threads" );
    self notify( "killanimscript" );
}

_id_9DEE( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self._id_0233 ) )
        return 0;

    var_4 = anglestoforward( self.angles );
    var_5 = vectortoangles( var_4 );
    var_6 = vectordot( vectornormalize( ( var_4[0], var_4[1], 0 ) ), anglestoforward( self.angles ) );
    var_7 = 0.966;
    return var_6 > var_7;
}

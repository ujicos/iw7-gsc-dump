// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_234D( var_0 )
{
    scripts\asm\asm::_id_234E();
    self._id_2303 = spawnstruct();
    self._id_2303._id_1FC5 = [];
    self._id_2303._id_7360 = 0;
    self._id_164D = [];
    self._id_238F = var_0;
    self._id_718F = ::_id_230F;
    self._id_7193 = ::_id_235A;
    self._id_7192 = ::_id_2347;
    self._id_7191 = ::_id_2336;
    scripts\asm\asm::_id_2351( var_0, 1 );
    self._id_1491 = spawnstruct();
    self._id_1491._id_D6A5 = "stand";
    self._id_1491._id_85E2 = "stand";
    self._id_1491._id_BCC8 = "stop";
    self._id_1491._id_10E19 = "stop";
    self._id_1491._id_10930 = "none";
    self._id_1491._id_870D = "none";
    self._id_1491._id_D8BD = -1;
    self._id_1491._id_BE98 = 0;
    self._id_1491._id_4401 = gettime();
    self._id_1491._id_A981 = gettime();
    self._id_1491._id_112CB = 0;
    self._id_1491._id_55FC = !self isbadguy();
    self._id_1491._id_AFFF = 0;
    self._id_1491._id_C888 = 0;
    self._id_1491._id_A9ED = 0;
    self._id_1491._id_BF84 = 0;
    self._id_1491._id_DD61 = 0.8;
    self._id_1491._id_D707 = undefined;
    self._id_1491._id_10B53 = "stand";
    self._id_1491._id_B8D6 = 0;
    self._id_1491._id_C043 = 0;
    self._id_1491._id_B8D6 = 0;
    self._id_1491._id_B8D8 = 0;
    self._id_1491._id_5605 = 0;
}

_id_C878()
{
    self endon( "death" );
    self endon( "terminate_ai_threads" );

    for (;;)
    {
        self waittill( "pain" );

        if ( isdefined( self._id_71D0 ) )
        {
            if ( ![[ self._id_71D0 ]]() )
                continue;
        }
        else if ( !_id_1004C() )
            continue;

        foreach ( var_4, var_1 in self._id_164D )
        {
            var_2 = var_1._id_4BC0;
            var_3 = anim._id_2303[var_4]._id_10E2F[var_2];

            if ( !isdefined( var_3._id_C87F ) )
                continue;

            scripts\asm\asm::_id_2388( var_4, var_2, var_3, var_3._id_116FB );
            scripts\asm\asm::_id_238A( var_4, var_3._id_C87F, 0.2, undefined, undefined, var_3._id_C87C );
        }
    }
}

_id_126E5()
{
    self endon( "death" );
    self endon( "terminate_ai_threads" );

    for (;;)
    {
        self waittill( "traverse_begin", var_0, var_1 );
        var_2 = self._id_238F;
        var_3 = anim._id_2303[var_2];
        var_4 = var_3._id_10E2F[var_0];

        if ( !isdefined( var_4 ) )
            var_0 = "traverse_external";

        var_5 = self._id_164D[var_2]._id_4BC0;
        var_6 = var_3._id_10E2F[var_5];
        scripts\asm\asm::_id_2388( var_2, var_5, var_6, var_6._id_116FB );
        scripts\asm\asm::_id_238A( var_2, var_0, 0.2, undefined, undefined, undefined );
    }
}

_id_1004C()
{
    var_0 = 300;

    if ( isdefined( self._id_0033 ) && self._id_0033 == 0 )
        return 0;

    if ( !scripts\asm\asm_bb::_id_298E() )
    {
        if ( isdefined( self._id_0233 ) )
        {
            if ( self _meth_841E() < var_0 )
                return 0;

            var_1 = self _meth_8148();

            if ( isdefined( var_1 ) )
            {
                var_2 = distancesquared( self.origin, var_1.origin );

                if ( var_2 < var_0 * var_0 )
                    return 0;
            }
        }
    }

    return 1;
}

_id_235F( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( var_1 + "_finished" );

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    var_5 = scripts\asm\asm::_id_2341( var_0, var_1 );

    for (;;)
    {
        var_6 = _id_2337( var_0, var_1 );
        self setanimstate( var_1, var_6, var_3 );
        scripts\anim\notetracks_mp::_id_1384C( var_1, "end", var_1, var_6, var_5 );
    }
}

_id_2345( var_0, var_1, var_2, var_3 )
{
    scripts\asm\asm::_id_2330( var_1, var_0 );
}

_id_2365( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( var_1 + "_finished" );
    var_5 = scripts\asm\asm::_id_2341( var_0, var_1 );

    if ( isdefined( var_4 ) )
        scripts\anim\notetracks_mp::_id_CED2( var_1, var_3, var_4, var_1, "end", var_5 );
    else
        scripts\anim\notetracks_mp::_id_CED5( var_1, var_3, var_1, "end", var_5 );
}

_id_2366( var_0, var_1, var_2, var_3 )
{
    _id_2364( var_0, var_1, var_2, var_3 );
}

_id_2364( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    var_4 = _id_2337( var_0, var_1 );
    var_5 = scripts\asm\asm::_id_2341( var_0, var_1 );
    scripts\anim\notetracks_mp::_id_CED5( var_1, var_4, var_1, "end", var_5 );
}

_id_2367( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
    var_4 = _id_2337( var_0, var_1 );
    var_5 = scripts\asm\asm::_id_2341( var_0, var_1 );
    scripts\anim\notetracks_mp::_id_CED5( var_1, var_4, var_1, var_3, var_5 );
}

_id_2361( var_0, var_1, var_2, var_3 )
{
    self endon( var_1 + "_finished" );
}

_id_2382( var_0, var_1 )
{
    if ( !isdefined( var_1._id_4E6D ) )
        return 0;

    if ( isalive( self ) )
        return 0;

    return 1;
}

_id_237E( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "code_move";

    self _meth_8281( var_0 );
}

_id_237F( var_0 )
{
    switch ( var_0 )
    {
        case "face goal":
            var_1 = self _meth_8150();

            if ( isdefined( var_1 ) )
            {
                var_2 = var_1 - self.origin;
                var_3 = vectornormalize( var_2 );
                var_4 = vectortoangles( var_3 );
                self orientmode( "face angle abs", var_4 );
                break;
            }
        case "face current":
            self orientmode( "face angle abs", self.angles );
            break;
        case "face motion":
        case "face enemy":
            self orientmode( var_0 );
            break;
        case "face node":
            var_5 = self.angles[1];
            var_6 = 1024.0;

            if ( isdefined( self._id_0205 ) && distancesquared( self.origin, self._id_0205.origin ) < var_6 )
                var_5 = scripts\asm\shared\utility::_id_7FF7( self._id_0205 );

            var_7 = ( 0, var_5, 0 );
            self orientmode( "face angle abs", var_7 );
            break;
        default:
            break;
    }
}

_id_230F( var_0 )
{
    if ( isdefined( var_0._id_1FBA ) )
        _id_237E( var_0._id_1FBA );

    if ( isdefined( var_0._id_C704 ) )
        _id_237F( var_0._id_C704 );
}

_id_2337( var_0, var_1 )
{
    var_2 = anim._id_2303[var_0]._id_10E2F[var_1]._id_71A5;
    var_3 = anim._id_2303[var_0]._id_10E2F[var_1]._id_7DC8;
    var_4 = self [[ var_2 ]]( var_0, var_1, var_3 );
    return var_4;
}

_id_7EA3()
{
    var_0 = undefined;

    if ( !isdefined( self._id_8CD0 ) )
        var_1 = 400;
    else
        var_1 = 4096;

    if ( isdefined( self._id_0205 ) && distancesquared( self.origin, self._id_0205.origin ) < var_1 )
        var_0 = self._id_0205;
    else if ( isdefined( self._id_024A ) && distancesquared( self.origin, self._id_024A.origin ) < var_1 )
        var_0 = self._id_024A;

    if ( isdefined( var_0 ) && isdefined( self._id_8CD0 ) && scripts\engine\utility::_id_152F( self.angles[1] - var_0.angles[1] ) > 30 )
        return undefined;

    return var_0;
}

_id_235A( var_0, var_1 )
{
    var_1 = tolower( var_1 );
    return self _meth_80FE( var_0, var_1 );
}

_id_2347( var_0, var_1 )
{
    var_1 = tolower( var_1 );

    if ( !self _meth_80FF( var_0, var_1 ) )
        return 0;

    return 1;
}

_id_2336( var_0, var_1 )
{
    var_2 = _id_2337( var_0, var_1 );
    var_3 = self getanimentry( var_1, var_2 );
    return var_3;
}

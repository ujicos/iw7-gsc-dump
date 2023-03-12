// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_2343()
{
    if ( isdefined( anim._id_2303 ) )
        return;

    anim._id_2303 = [];
}

_id_230B( var_0, var_1 )
{
    _id_2343();
    anim._id_2303[var_0] = spawnstruct();
    anim._id_2303[var_0]._id_9881 = var_1;
    anim._id_2303[var_0]._id_10E2F = [];
    anim._id_2303[var_0]._id_F281 = [];
    anim._id_DEF5 = var_0;
}

_id_232E( var_0 )
{
    return isdefined( anim._id_2303 ) && isdefined( anim._id_2303[var_0] );
}

_id_2327()
{
    anim._id_DEF5 = undefined;
    anim._id_DEF7 = undefined;
}

_id_2373( var_0, var_1 )
{
    anim._id_2303[anim._id_DEF5]._id_F281[var_0] = var_1;
}

_id_2374( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16, var_17, var_18, var_19, var_20, var_21 )
{
    var_22 = anim._id_2303[anim._id_DEF5];
    var_22._id_10E2F[var_0] = spawnstruct();
    var_22._id_10E2F[var_0]._id_7048 = var_1;
    var_22._id_10E2F[var_0]._id_E88A = var_2;
    var_22._id_10E2F[var_0]._id_71C5 = var_3;
    var_22._id_10E2F[var_0]._id_71D2 = var_4;
    var_22._id_10E2F[var_0]._id_116FB = var_5;
    var_22._id_10E2F[var_0]._id_71A5 = var_6;
    var_22._id_10E2F[var_0]._id_7DC8 = var_7;
    var_22._id_10E2F[var_0]._id_1267B = [];
    var_22._id_10E2F[var_0]._id_0134 = var_8;
    var_22._id_10E2F[var_0]._id_10B53 = var_9;
    var_22._id_10E2F[var_0]._id_6A8B = var_11;
    var_22._id_10E2F[var_0]._id_C87F = var_12;
    var_22._id_10E2F[var_0]._id_C87C = var_13;
    var_22._id_10E2F[var_0]._id_4E6D = var_14;
    var_22._id_10E2F[var_0]._id_4E54 = var_15;
    var_22._id_10E2F[var_0]._id_D773 = var_16;
    var_22._id_10E2F[var_0]._id_D772 = var_17;
    var_22._id_10E2F[var_0]._id_116FA = var_18;
    var_22._id_10E2F[var_0]._id_C704 = var_19;
    var_22._id_10E2F[var_0]._id_1FBA = var_20;
    var_22._id_10E2F[var_0]._id_C94B = var_21;
    var_22._id_10E2F[var_0]._id_111AC = var_10;
    anim._id_DEF7 = var_0;
}

_id_2375( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = anim._id_2303[anim._id_DEF5];
    var_7 = spawnstruct();
    var_7._id_2B93 = var_1;
    var_7._id_71D1 = var_2;
    var_7._id_100B1 = var_3;
    var_7._id_11A1A = var_0;
    var_6._id_10E2F[anim._id_DEF7]._id_1267B[var_6._id_10E2F[anim._id_DEF7]._id_1267B.size] = var_7;
}

_id_232F( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();
    var_3._id_7686 = gettime();
    var_3.name = var_1;
    var_3._id_C8F0 = var_2;

    if ( !isdefined( self._id_1198._id_2329[var_0] ) )
        self._id_1198._id_2329[var_0] = [];

    self._id_1198._id_2329[var_0][self._id_1198._id_2329[var_0].size] = var_3;

    if ( isdefined( self._id_1198._id_2328[var_0] ) && self._id_1198._id_2328[var_0] == var_1 )
    {
        self._id_3135._id_72EB = 1;
        self._id_1198._id_2328[var_0] = undefined;
    }
}

_id_2351( var_0, var_1 )
{
    var_2 = anim._id_2303[var_0];
    self._id_164D[var_0] = spawnstruct();
    self._id_164D[var_0]._id_4BC0 = undefined;

    if ( var_1 )
        self._id_164D[var_0]._id_2F3C = 1;

    foreach ( var_4 in var_2._id_F281 )
        self thread [[ var_4 ]]( var_0 );

    _id_238A( var_0, var_2._id_9881, 0.0 );
}

_id_234E()
{
    self._id_1198 = spawnstruct();
    self._id_1198._id_527D = "stand";
    self._id_1198._id_232D = [];
    self._id_1198._id_2329 = [];
    self._id_1198._id_2328 = [];
    self._id_1198._id_2FC8 = 0;
    self._id_1198._id_2AA6 = 0;
    self._id_1198._id_BD23 = "combat";
    self._id_1198._id_1FCD = 0;
    self._id_1198._id_1D64 = 0;
    self._id_1198._id_444A = 0;
}

_id_2317( var_0 )
{
    if ( isdefined( self._id_1198._id_232D[var_0] ) )
        self._id_1198._id_232D[var_0] = undefined;
}

_id_2388( var_0, var_1, var_2, var_3 )
{
    self notify( var_1 + "_finished" );
    _id_2330( var_1, "ASM_Finished" );

    if ( isdefined( var_2._id_71D2 ) )
        self [[ var_2._id_71D2 ]]( var_0, var_1, var_3 );

    if ( isdefined( var_2._id_116FA ) )
        _id_232F( var_2._id_116FA, "end" );
}

_id_2387( var_0 )
{
    var_1 = anim._id_2303[var_0];
    var_2 = self._id_164D[var_0]._id_4BC0;
    _id_2388( var_0, var_2, var_1._id_10E2F[var_2], var_1._id_10E2F[var_2]._id_116FB );
    self._id_164D[var_0] = undefined;
}

_id_238A( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = anim._id_2303[var_0];
    var_7 = var_6._id_10E2F[var_1];
    var_8 = self._id_164D[var_0];
    var_8._id_10E23 = var_8._id_4BC0;
    var_8._id_4BC0 = var_1;
    _id_2317( var_1 );
    self._id_2303._id_4E6E = undefined;
    var_9 = var_7._id_111AC;
    var_10 = undefined;

    if ( isdefined( var_8._id_10E23 ) )
    {
        var_10 = var_6._id_10E2F[var_8._id_10E23]._id_111AC;

        if ( isdefined( var_10 ) )
        {
            foreach ( var_12 in var_10 )
            {
                if ( !isdefined( var_9 ) || !scripts\engine\utility::array_contains( var_9, var_12 ) )
                    _id_2387( var_12 );
            }
        }
    }

    if ( isdefined( self._id_7195 ) )
        self [[ self._id_7195 ]]( var_7 );

    self [[ self._id_718F ]]( var_7 );

    if ( isdefined( var_8._id_2F3C ) && var_8._id_2F3C )
        self._id_0034 = isdefined( var_7._id_C87F );

    var_14 = undefined;

    if ( isdefined( var_5 ) )
        var_14 = var_5;
    else if ( isdefined( var_7._id_E88A ) )
        var_14 = var_7._id_E88A;

    self thread [[ var_7._id_7048 ]]( var_0, var_1, var_2, var_14 );

    if ( isdefined( self._id_718D ) )
        self [[ self._id_718D ]]( var_0, var_8._id_10E23, var_1, var_2 );

    if ( isdefined( self._id_718E ) )
        self [[ self._id_718E ]]( var_0, var_1 );

    if ( isdefined( var_7._id_111AC ) )
    {
        foreach ( var_12 in var_7._id_111AC )
        {
            if ( !isdefined( var_10 ) || !scripts\engine\utility::array_contains( var_10, var_12 ) )
                _id_2351( var_12, 0 );
        }
    }
}

_id_2341( var_0, var_1 )
{
    if ( isdefined( anim._id_2303[var_0]._id_10E2F[var_1]._id_71C5 ) )
        return anim._id_2303[var_0]._id_10E2F[var_1]._id_71C5;

    return undefined;
}

_id_231E( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_2303._id_4E6E ) )
    {
        var_3 = self._id_2303._id_4E6E._id_10E2C;
        var_4 = self._id_2303._id_4E6E._id_C8F0;
    }
    else
    {
        var_3 = var_1._id_4E6D;
        var_4 = var_1._id_4E54;
    }

    var_5 = anim._id_2303[var_0]._id_10E2F[var_3];
    _id_2388( var_0, var_2, var_1, var_1._id_116FB );
    var_6 = var_3;

    if ( isdefined( var_5._id_C94B ) && var_5._id_C94B )
        [var_6, var_8] = _id_2310( var_0, var_3, 1 );

    _id_238A( var_0, var_6, 0.2, undefined, undefined, var_4 );
}

_id_231B( var_0, var_1 )
{
    var_2 = self._id_164D[var_0];

    if ( !isdefined( var_2._id_4BC0 ) )
        return 0;

    var_3 = anim._id_2303[var_0]._id_10E2F[var_2._id_4BC0]._id_0134;

    if ( isdefined( var_3 ) && scripts\engine\utility::array_contains( var_3, var_1 ) )
        return 1;

    return 0;
}

_id_2384( var_0, var_1, var_2 )
{
    var_3 = self._id_164D[var_0];
    var_4 = anim._id_2303[var_0]._id_10E2F[var_1]._id_0134;

    if ( isdefined( var_4 ) && scripts\engine\utility::array_contains( var_4, var_2 ) )
        return 1;

    return 0;
}

_id_2331( var_0, var_1, var_2 )
{
    if ( !isdefined( self._id_1198._id_232D[var_0] ) )
        self._id_1198._id_232D[var_0] = [];

    var_3 = _id_233F( var_0, var_1 );

    if ( !isdefined( var_3 ) )
        var_3 = spawnstruct();

    var_3._id_7686 = gettime();
    var_3._id_C8F0 = var_2;
    self._id_1198._id_232D[var_0][var_1] = var_3;
    _id_232F( var_0, var_1, var_2 );
}

_id_2330( var_0, var_1, var_2 )
{
    _id_2331( var_0, var_1, var_2 );

    if ( var_1 == "anim_will_finish" || var_1 == "finish" )
    {
        var_1 = "end";
        _id_2331( var_0, var_1 );
    }
}

_id_2304( var_0, var_1 )
{
    self._id_1198._id_2328[var_0] = var_1;
}

_id_232A( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_1198._id_2329[var_0] ) )
    {
        foreach ( var_4 in self._id_1198._id_2329[var_0] )
        {
            if ( var_4.name == var_1 )
                return 1;
        }
    }

    if ( !isdefined( var_2 ) || var_2 )
        _id_2304( var_0, var_1 );

    return 0;
}

_id_232C( var_0, var_1 )
{
    var_2 = _id_233F( var_0, var_1 );

    if ( isdefined( var_2 ) )
    {
        if ( var_2._id_7686 >= gettime() - 50 )
            return 1;
    }

    return 0;
}

_id_233F( var_0, var_1 )
{
    if ( !isdefined( self._id_1198._id_232D[var_0] ) )
        return undefined;

    foreach ( var_4, var_3 in self._id_1198._id_232D[var_0] )
    {
        if ( var_4 == var_1 )
            return var_3;
    }

    return undefined;
}

_id_233E( var_0, var_1 )
{
    if ( !isdefined( self._id_1198._id_2329[var_0] ) || self._id_1198._id_2329[var_0].size == 0 )
        return undefined;

    foreach ( var_3 in self._id_1198._id_2329[var_0] )
    {
        if ( var_3.name == var_1 )
            return var_3;
    }

    return undefined;
}

_id_2314()
{
    self._id_1198._id_2329 = [];
}

_id_2383( var_0, var_1 )
{
    if ( !isdefined( self._id_2F39 ) || !self._id_2F39 )
        return 0;

    if ( isdefined( self._id_2303._id_2F3A ) && self._id_2303._id_2F3A )
        return 0;

    if ( !isalive( self ) )
        return 0;

    if ( scripts\asm\asm_bb::_id_2938() )
        return 0;

    if ( isdefined( self._id_1198._id_3141 ) )
        return 0;

    if ( isdefined( self._id_B55B ) )
        return 0;

    return 1;
}

_id_2325( var_0, var_1, var_2 )
{
    var_3 = 1.0;
    var_4 = var_1._id_D773;

    if ( !isdefined( var_4 ) )
        var_4 = "powerdown_default";

    _id_2388( var_0, var_2, var_1, var_1._id_116FB );
    _id_238A( var_0, var_4, var_3, undefined, undefined, var_1._id_D772 );
}

_id_2354( var_0 )
{
    foreach ( var_3, var_2 in self._id_164D )
    {
        if ( var_2._id_4BC0 == var_0 )
            return 1;
    }

    return 0;
}

_id_232B( var_0, var_1 )
{
    if ( !isdefined( self._id_1198._id_232D[var_0] ) || self._id_1198._id_232D[var_0].size == 0 )
        return 0;

    foreach ( var_4, var_3 in self._id_1198._id_232D[var_0] )
    {
        if ( var_4 == var_1 )
            return 1;
    }

    return 0;
}

_id_68B0( var_0, var_1, var_2, var_3 )
{
    return _id_232B( var_1, var_3 );
}

_id_666F( var_0, var_1, var_2, var_3 )
{
    return _id_232A( var_1, var_3 );
}

_id_2310( var_0, var_1, var_2 )
{
    var_3 = anim._id_2303[var_0];
    var_4 = anim._id_2303[var_0]._id_10E2F[var_1];

    foreach ( var_6 in var_4._id_1267B )
    {
        var_7 = var_6._id_11A1A;
        var_8 = self [[ var_6._id_71D1 ]]( var_0, var_1, var_7, var_6._id_100B1 );

        if ( var_8 )
        {
            var_9 = anim._id_2303[var_0]._id_10E2F[var_6._id_11A1A];
            var_10 = var_6._id_2B93;

            if ( !isdefined( var_10 ) )
                var_10 = 0.2;

            if ( isdefined( var_9._id_C94B ) && var_9._id_C94B )
                [var_7, var_10] = _id_2310( var_0, var_7, 1 );

            if ( isdefined( var_7 ) )
            {
                if ( !var_2 )
                {
                    _id_2388( var_0, var_1, var_4, var_4._id_116FB );
                    _id_238A( var_0, var_7, var_10 );
                }

                return [ var_7, var_10 ];
            }
        }
    }

    return [ undefined, undefined ];
}

_id_237C( var_0, var_1 )
{
    foreach ( var_10, var_3 in self._id_164D )
    {
        var_4 = var_3._id_4BC0;
        var_5 = anim._id_2303[var_10]._id_10E2F[var_4];
        var_6 = anim._id_2303[var_10]._id_10E2F[var_0];

        if ( !isdefined( var_6 ) )
            continue;

        var_7 = var_0;

        if ( isdefined( var_6._id_C94B ) && var_6._id_C94B )
        {
            [var_7, var_9] = _id_2310( var_10, var_0, 1 );

            if ( !isdefined( var_7 ) )
                continue;
        }

        _id_2388( var_10, var_4, var_5, var_5._id_116FB );
        _id_238A( var_10, var_7, 0.2, undefined, undefined, var_1 );
    }
}

_id_2389()
{
    var_0 = self._id_164D[self._id_238F]._id_4BC0;
    var_1 = anim._id_2303[self._id_238F]._id_10E2F[var_0];

    if ( isdefined( self._id_7194 ) )
    {
        if ( self [[ self._id_7194 ]]( self._id_238F, var_1 ) )
        {
            _id_231E( self._id_238F, var_1, var_0 );
            return;
        }
    }

    if ( _id_2383( self._id_238F, var_1 ) )
    {
        _id_2325( self._id_238F, var_1, var_0 );
        return;
    }

    var_3 = 0;

    foreach ( var_9, var_5 in self._id_164D )
    {
        var_0 = var_5._id_4BC0;
        [var_7, var_8] = _id_2310( var_9, var_0, 0 );

        if ( isdefined( var_7 ) )
            var_3 = 1;

        if ( var_3 )
            return;
    }
}

_id_6A18( var_0, var_1, var_2, var_3 )
{
    if ( weaponclass( self.weapon ) == "pistol" )
    {
        if ( weaponclass( self.primaryweapon ) != "mg" && weaponclass( self.primaryweapon ) != "rocketlauncher" && weaponclass( self.primaryweapon ) != "pistol" )
            return 0;
    }

    return _id_BCE7( var_0, var_1, var_2, var_3 );
}

_id_BCE7( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) && _id_233C() != var_3 )
        return 0;

    return scripts\asm\asm_bb::_id_2955() && distancesquared( self._id_0233, self.origin ) > 4.0;
}

_id_C17F( var_0, var_1, var_2, var_3 )
{
    return !_id_BCE7( var_0, var_1, var_2, var_3 );
}

_id_BCE8( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
    {
        var_4 = self [[ self._id_71A6 ]]();

        if ( var_4 != var_3 )
            return 0;
    }

    return _id_BCE7( var_0, var_1, var_2, undefined );
}

_id_9E41( var_0, var_1, var_2, var_3 )
{
    var_4 = undefined;

    if ( isarray( var_3 ) )
        var_4 = var_3[0];
    else
        var_4 = var_3;

    if ( scripts\asm\asm_bb::_id_2941() != var_4 )
        return 0;

    var_5 = undefined;

    if ( isarray( var_3 ) && isdefined( var_3[1] ) )
        var_5 = var_3[1];

    return _id_BCE7( var_0, var_1, var_2, var_5 );
}

_id_233C()
{
    if ( _id_2353() )
        return "frantic";
    else if ( scripts\asm\asm_bb::_id_293B() )
        return "combat";
    else if ( isdefined( self._id_51E3 ) && self._id_51E3 == "cqb" && !isdefined( self._id_015F ) )
        return "cqb";

    return self._id_1198._id_BD23;
}

_id_238C()
{
    if ( !isdefined( self._id_0233 ) || distancesquared( self.origin, self._id_0233 ) > 4096.0 )
        self._id_2303._id_7360 = scripts\asm\asm_bb::_id_293B();
}

_id_2353()
{
    return self._id_2303._id_7360;
}

_id_2352()
{
    return isdefined( self._id_2303._id_4879 );
}

_id_2379( var_0 )
{
    self._id_2303._id_4879 = var_0;
}

_id_237A( var_0, var_1, var_2 )
{
    self._id_2303._id_1FC5[var_0][var_1] = var_2;
}

_id_2316( var_0, var_1 )
{
    if ( _id_234A( var_0, var_1 ) )
        self._id_2303._id_1FC5[var_0][var_1] = undefined;
}

_id_234A( var_0, var_1 )
{
    return isdefined( self._id_2303._id_1FC5[var_0] ) && isdefined( self._id_2303._id_1FC5[var_0][var_1] );
}

_id_233D( var_0, var_1 )
{
    return self._id_2303._id_1FC5[var_0][var_1];
}

_id_233A( var_0 )
{
    var_1 = self._id_164D[var_0];
    return var_1._id_4BC0;
}

_id_2346( var_0, var_1 )
{
    return self [[ self._id_7192 ]]( var_0, var_1 );
}

_id_2358( var_0, var_1 )
{
    return self [[ self._id_7193 ]]( var_0, var_1 );
}

_id_2334( var_0, var_1, var_2 )
{
    return self [[ self._id_7190 ]]( var_0, var_1, var_2 );
}

_id_235C( var_0, var_1, var_2, var_3 )
{
    var_4 = "";

    if ( isdefined( var_3 ) )
        var_4 = var_3;

    if ( var_2 )
    {
        if ( _id_232C( var_1, "pass_left" ) )
            var_5 = var_4 + "left";
        else if ( _id_232C( var_1, "pass_right" ) )
            var_5 = var_4 + "right";
        else if ( self._id_2303._id_7257._id_7254 == "right" )
            var_5 = var_4 + "right";
        else
            var_5 = var_4 + "left";
    }
    else
        var_5 = var_4;

    if ( _id_2346( var_1, var_5 + var_0 ) )
        return _id_2358( var_1, var_5 + var_0 );

    if ( var_4 != var_5 && _id_2346( var_1, var_4 + var_0 ) )
        return _id_2358( var_1, var_4 + var_0 );

    return undefined;
}

_id_237B( var_0 )
{
    if ( getdvarint( "ai_iw7", 0 ) == 1 )
    {
        self._id_BCD6 = var_0;
        return;
    }

    self._id_BCD6 = var_0;
}

_id_2340()
{
    return self._id_BCD6;
}

_id_231D( var_0, var_1, var_2, var_3 )
{
    var_4 = anim._id_2303[var_0]._id_10E2F[var_2];
    self._id_2303._id_DCC7 = undefined;
    var_5 = 0;

    for ( var_6 = 0; var_6 < var_4._id_1267B.size; var_6++ )
    {
        var_7 = var_4._id_1267B[var_6]._id_100B1;
        var_8 = var_7[1];

        for ( var_9 = var_6 - 1; var_9 >= 0; var_9-- )
        {

        }

        var_10 = 1;

        if ( var_7.size > 2 )
            var_10 = var_7[3];

        var_5 += var_10;
    }

    var_11 = randomfloat( var_5 );
    var_12 = undefined;

    for ( var_6 = 0; var_6 < var_4._id_1267B.size; var_6++ )
    {
        var_13 = var_4._id_1267B[var_6];
        var_7 = var_13._id_100B1;
        var_12 = var_7[1];
        var_10 = 1;

        if ( var_7.size > 2 )
            var_10 = var_7[3];

        if ( var_11 < var_10 )
            break;
        else
            var_11 -= var_10;
    }

    self._id_2303._id_DCC7 = var_0 + "_" + var_2 + "_" + var_12;
    return 1;
}

_id_230C( var_0, var_1, var_2, var_3 )
{
    var_4 = var_0 + "_" + var_1 + "_" + var_3[1];
    return var_4 == self._id_2303._id_DCC7;
}

_id_233B( var_0 )
{
    return self._id_164D[var_0]._id_4BC0;
}

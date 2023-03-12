// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_3EB7( var_0, var_1, var_2 )
{
    var_3 = var_2;
    var_4 = self._id_1198._id_FED6 + "_" + var_3;

    if ( isdefined( self._id_1198._id_FED6 ) && scripts\asm\asm::_id_2346( var_1, var_4 ) )
        return scripts\asm\asm::_id_2358( var_1, var_4 );

    return scripts\asm\asm::_id_2358( var_1, var_2 );
}

_id_3ECD( var_0, var_1, var_2 )
{
    var_3 = scripts\asm\asm::_id_233C();

    if ( scripts\asm\asm::_id_234A( var_3, var_2 ) )
    {
        var_4 = scripts\asm\asm::_id_233D( var_3, var_2 );

        if ( isarray( var_4 ) )
            return var_4[randomint( var_4.size )];

        return var_4;
    }

    if ( !scripts\asm\asm::_id_2346( var_1, var_3 ) )
        return scripts\asm\asm::_id_2358( var_1, "default" );

    return scripts\asm\asm::_id_2358( var_1, var_3 );
}

_id_3ECE( var_0, var_1, var_2 )
{
    var_3 = scripts\asm\asm::_id_233C();

    if ( scripts\asm\asm::_id_234A( var_3, var_2 ) )
    {
        var_4 = scripts\asm\asm::_id_233D( var_3, var_2 );

        if ( isarray( var_4 ) )
            return var_4[randomint( var_4.size )];

        return var_4;
    }

    if ( !scripts\asm\asm::_id_2346( var_1, var_3 ) )
    {
        var_5 = [];
        var_5[0] = scripts\asm\asm::_id_2358( var_1, "trans_to_one_hand_run" );
        var_5[1] = scripts\asm\asm::_id_2358( var_1, "one_hand_run" );
        var_5[2] = scripts\asm\asm::_id_2358( var_1, "trans_to_two_hand_run" );
        var_5[3] = scripts\asm\asm::_id_2358( var_1, "two_hand_run" );
        return var_5;
    }

    return scripts\asm\asm::_id_2358( var_1, var_3 );
}

_id_3EAA( var_0, var_1, var_2 )
{
    var_3 = weaponclass( self.weapon );

    if ( !scripts\asm\asm::_id_2346( var_1, var_3 ) )
        var_3 = "rifle";

    return scripts\asm\asm::_id_2358( var_1, var_3 );
}

_id_3E9A( var_0, var_1, var_2 )
{
    var_3 = var_2;

    if ( self._id_2303._id_FECD._id_FF0B == 1 )
        var_4 = "single";
    else
        var_4 = var_3 + self._id_2303._id_FECD._id_FF0B;

    if ( scripts\asm\asm::_id_2346( var_1, var_4 ) )
        var_5 = scripts\asm\asm::_id_2358( var_1, var_4 );
    else
        var_5 = scripts\asm\asm::_id_2358( var_1, "fire" );

    return var_5;
}

_id_3EAC( var_0, var_1, var_2 )
{
    if ( weaponclass( self.weapon ) == "rocketlauncher" && scripts\asm\asm::_id_2346( var_1, "drop_rpg" ) )
        return scripts\asm\asm::_id_2358( var_1, "drop_rpg" );

    var_3 = scripts\asm\asm_bb::_id_292E();

    if ( !scripts\asm\asm::_id_2346( var_1, var_3 ) )
        var_3 = "rifle";

    return scripts\asm\asm::_id_2358( var_1, var_3 );
}

_id_12668( var_0, var_1, var_2, var_3 )
{
    return 1;
}

_id_2B58( var_0, var_1, var_2, var_3 )
{

}

_id_BD25( var_0, var_1, var_2, var_3 )
{
    return scripts\asm\asm::_id_233C() == var_3;
}

_id_BD26( var_0, var_1, var_2, var_3 )
{
    return scripts\asm\asm::_id_233C() != var_3;
}

_id_BD28( var_0, var_1, var_2, var_3 )
{
    var_4 = scripts\asm\asm::_id_233C();
    return var_4 != "frantic" && var_4 != "combat" && var_4 != "sprint";
}

_id_BD27( var_0, var_1, var_2, var_3 )
{
    var_4 = scripts\asm\asm::_id_233C();
    return var_4 != "casual" && var_4 != "casual_gun";
}

_id_7FF8( var_0, var_1 )
{
    switch ( var_1 )
    {
        case "stand":
        case "crouch":
        case "prone":
            break;
        default:
            return var_1;
    }

    switch ( var_0 )
    {
        case "Cover Left":
            if ( var_1 == "crouch" )
                return "Cover Left Crouch";

            break;
        case "Cover Right":
            if ( var_1 == "crouch" )
                return "Cover Right Crouch";

            break;
        case "Conceal Crouch":
        case "Cover Crouch Window":
            return "Cover Crouch";
        case "Conceal Stand":
            return "Cover Stand";
    }

    return undefined;
}

_id_8000( var_0, var_1, var_2 )
{
    var_3 = self._id_1491._id_D6A5;

    if ( isdefined( var_2 ) )
        var_3 = var_2;
    else if ( isnode( var_1 ) && !var_1 doesnodeallowstance( var_3 ) )
        var_3 = var_1 gethighestnodestance();

    var_4 = _id_7FF8( var_1.type, var_3 );

    if ( isdefined( var_4 ) && isdefined( var_0[var_4] ) )
        return var_0[var_4];

    if ( isdefined( var_0[var_1.type] ) )
        return var_0[var_1.type];

    return undefined;
}

_id_1C9C()
{
    var_0 = scripts\engine\utility::_id_13C07( self.weapon ) == "mg";
    return var_0 || isdefined( self._id_1198._id_522F ) && isdefined( self._id_0205 ) && self._id_0205 == self._id_1198._id_522F;
}

_id_8001( var_0, var_1 )
{
    if ( _func_2A4( var_0 ) || !isdefined( var_0.type ) )
        return 0;

    if ( getdvarint( "ai_iw7", 0 ) == 1 )
    {
        if ( isdefined( self._id_1198._id_98F4 ) && self._id_1198._id_98F4 || isdefined( self._id_2303._id_1310E ) && self._id_2303._id_1310E )
            return 0;

        if ( self._id_2303._id_7360 && isdefined( anim._id_7365 ) && isdefined( anim._id_7365[self._id_238F] ) )
        {
            var_2 = _id_8000( anim._id_7365[self._id_238F], var_0, var_1 );

            if ( isdefined( var_2 ) )
                return var_2;

            return 0;
        }
        else if ( isdefined( anim._id_C05A ) && isdefined( anim._id_C05A[self._id_238F] ) )
        {
            var_2 = _id_8000( anim._id_C05A[self._id_238F], var_0, var_1 );

            if ( isdefined( var_2 ) )
                return var_2;

            return 0;
        }
    }

    if ( !isdefined( self._id_8CD0 ) )
    {
        if ( scripts\engine\utility::_id_9EB4( var_0 ) )
            return 90;
        else if ( scripts\engine\utility::_id_9EB7( var_0 ) )
            return -90;
    }

    return 0;
}

_id_812E( var_0, var_1 )
{
    if ( !isdefined( var_0.angles ) )
        return 0;

    var_2 = var_0.type;

    if ( isnode( var_0 ) && !var_0 doesnodeallowstance( "stand" ) && !isdefined( var_1 ) )
    {
        switch ( var_2 )
        {
            case "Cover Left":
                var_1 = "crouch";
                break;
            case "Cover Right":
                var_1 = "crouch";
                break;
        }
    }

    var_3 = _id_8001( var_0, var_1 );

    if ( var_0.type == "Cover Left" )
    {
        if ( self._id_238F == "soldier" )
            var_3 += 45;
    }

    return var_3;
}

_id_7FF7( var_0, var_1 )
{
    var_2 = _id_8001( var_0, var_1 );
    return var_0.angles[1] + var_2;
}

_id_812D( var_0, var_1 )
{
    var_2 = _id_812E( var_0, var_1 );
    return var_0.angles[1] + var_2;
}

_id_7FF6( var_0, var_1 )
{
    var_2 = _id_8001( var_0, var_1 );
    return _func_048( var_0.angles, ( 0, var_2, 0 ) );
}

_id_7FF1( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( var_2 == "exposed" )
        var_3 = anim._id_C046[var_0];
    else if ( var_2 == "lean" || var_2 == "leanover" )
        var_3 = anim._id_C04D[var_0];

    if ( isdefined( var_3 ) )
    {
        var_4 = _id_8000( var_3, var_1, undefined );

        if ( isdefined( var_4 ) )
            return var_4;
    }

    return 0;
}

_id_7FF2( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( self._id_2303._id_7360 )
    {
        if ( var_2 == "lean" )
            var_3 = anim._id_7364[var_0];
        else if ( var_2 == "A" || var_2 == "full" || var_2 == "right" || var_2 == "left" )
            var_3 = anim._id_7363[var_0];
    }
    else if ( var_2 == "lean" )
        var_3 = anim._id_C04E[var_0];

    if ( isdefined( var_3 ) )
    {
        var_4 = _id_8000( var_3, var_1, undefined );

        if ( isdefined( var_4 ) )
            return var_4;
    }

    return 0;
}

_id_C04B( var_0 )
{
    if ( var_0.type == "Cover Stand 3D" )
        return !_id_C04A( var_0 );

    return 0;
}

_id_C04A( var_0 )
{
    if ( var_0.type == "Cover Stand 3D" )
    {
        if ( isdefined( var_0._id_EE79 ) && var_0._id_EE79 == "exposed" )
            return 1;
    }

    return 0;
}

_id_7FFF( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        if ( _id_C04A( var_0 ) )
            return "Cover Exposed 3D";
        else
            return var_0.type;
    }

    return "undefined";
}

_id_3F04( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( abs( self._id_00E3 ) > 150 )
    {
        if ( scripts\engine\utility::_id_4D59( "left_leg_upper", "left_leg_lower", "right_leg_upper", "right_leg_lower", "left_foot", "right_foot" ) )
            var_3 = "legs";
        else if ( self._id_00DD == "torso_lower" )
            var_3 = "torso_lower";
        else
            var_3 = "default";
    }
    else if ( self._id_00E3 < 0 )
        var_3 = "right";
    else
        var_3 = "left";

    return scripts\asm\asm::_id_2358( var_1, var_3 );
}

_id_9D50()
{
    return isdefined( scripts\asm\asm_bb::_id_2920() );
}

_id_93DE( var_0, var_1, var_2, var_3 )
{
    return !isdefined( scripts\asm\asm_bb::_id_2920() );
}

_id_C17A( var_0, var_1, var_2, var_3 )
{
    return !isdefined( scripts\asm\asm_bb::_id_2920() );
}

_id_FB04( var_0, var_1 )
{
    self endon( var_0 + "_finished" );
    self._id_036A = 1;
    thread _id_FB05( var_0 );

    if ( var_1 > 0 )
        wait( var_1 );

    self._id_036A = 0;
    self notify( "StopUseAnimGoalWeight" );
}

_id_FB05( var_0 )
{
    self notify( "StopUseAnimGoalWeight" );
    self endon( "StopUseAnimGoalWeight" );
    self endon( "death" );
    self endon( "entitydeleted" );
    self waittill( var_0 + "_finished" );
    self._id_036A = 0;
}

_id_DCB8( var_0, var_1, var_2, var_3 )
{
    var_4 = anim._id_2303[var_0]._id_10E2F[var_2];

    if ( isdefined( var_4._id_1267B ) )
    {
        if ( var_4._id_1267B.size == 2 )
        {
            if ( scripts\engine\utility::_id_4347() )
            {
                var_5 = var_4._id_1267B[0];
                var_4._id_1267B[0] = var_4._id_1267B[1];
                var_4._id_1267B[1] = var_5;
            }
        }
        else
            var_4._id_1267B = scripts\engine\utility::_id_22A7( var_4._id_1267B );
    }

    return 1;
}

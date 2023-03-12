// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_C0AC( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level._id_74C2 ) )
        return;

    if ( !isdefined( level._id_74C2[var_0] ) )
        return;

    if ( !isdefined( var_1 ) )
    {
        call [[ level._id_74C2[var_0] ]]();
        return;
    }

    if ( !isdefined( var_2 ) )
    {
        call [[ level._id_74C2[var_0] ]]( var_1 );
        return;
    }

    if ( !isdefined( var_3 ) )
    {
        call [[ level._id_74C2[var_0] ]]( var_1, var_2 );
        return;
    }

    if ( !isdefined( var_4 ) )
    {
        call [[ level._id_74C2[var_0] ]]( var_1, var_2, var_3 );
        return;
    }

    call [[ level._id_74C2[var_0] ]]( var_1, var_2, var_3, var_4 );
}

_id_F1E4( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( level._id_74C2[var_0] ) )
        return;

    if ( !isdefined( var_1 ) )
    {
        self call [[ level._id_74C2[var_0] ]]();
        return;
    }

    if ( !isdefined( var_2 ) )
    {
        self call [[ level._id_74C2[var_0] ]]( var_1 );
        return;
    }

    if ( !isdefined( var_3 ) )
    {
        self call [[ level._id_74C2[var_0] ]]( var_1, var_2 );
        return;
    }

    if ( !isdefined( var_4 ) )
    {
        self call [[ level._id_74C2[var_0] ]]( var_1, var_2, var_3 );
        return;
    }

    self call [[ level._id_74C2[var_0] ]]( var_1, var_2, var_3, var_4 );
}

_id_1E7C( var_0, var_1 )
{
    return acos( vectordot( var_0, var_1 ) / length( var_0 ) * length( var_1 ) );
}

_id_1E7E( var_0, var_1 )
{
    return acos( vectordot( var_0, var_1 ) );
}

_id_1E7D( var_0, var_1, var_2 )
{
    var_3 = vectornormalize( var_0 );
    var_4 = vectornormalize( var_1 );
    var_5 = acos( clamp( vectordot( var_3, var_4 ), -1, 1 ) );
    var_6 = vectorcross( var_3, var_4 );

    if ( vectordot( var_6, var_2 ) < 0 )
        var_5 *= -1;

    return var_5;
}

_id_F18C( var_0, var_1, var_2, var_3 )
{
    if ( var_0 == var_1 )
        return 0;

    var_4 = var_2 - var_0;
    var_5 = var_1 - var_0;
    var_6 = clamp( vectordot( var_4, var_5 ) / vectordot( var_5, var_5 ), 0, 1 );
    var_7 = var_0 + var_5 * var_6;
    return lengthsquared( var_2 - var_7 ) <= var_3 * var_3;
}

_id_DCC8( var_0 )
{
    return ( randomfloat( var_0 ) - var_0 * 0.5, randomfloat( var_0 ) - var_0 * 0.5, randomfloat( var_0 ) - var_0 * 0.5 );
}

_id_DCC9( var_0, var_1 )
{
    var_2 = randomfloatrange( var_0, var_1 );

    if ( randomint( 2 ) == 0 )
        var_2 *= -1;

    var_3 = randomfloatrange( var_0, var_1 );

    if ( randomint( 2 ) == 0 )
        var_3 *= -1;

    var_4 = randomfloatrange( var_0, var_1 );

    if ( randomint( 2 ) == 0 )
        var_4 *= -1;

    return ( var_2, var_3, var_4 );
}

_id_101EA( var_0 )
{
    if ( var_0 >= 0 )
        return 1;

    return -1;
}

_id_B8F8( var_0, var_1 )
{
    var_2 = int( var_0 / var_1 );

    if ( var_0 * var_1 < 0 )
        var_2 -= 1;

    return var_0 - var_2 * var_1;
}

_id_7984( var_0 )
{
    var_1 = [];
    var_1["axis"] = "allies";
    var_1["allies"] = "axis";
    return var_1[var_0];
}

_id_414E( var_0 )
{
    self._id_68C6[var_0] = anim._id_503A;
}

_id_4347()
{
    return randomint( 100 ) >= 50;
}

_id_3E83( var_0, var_1 )
{
    var_2 = randomint( var_1[var_1.size - 1] + 1 );

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
    {
        if ( var_2 <= var_1[var_3] )
            return var_0[var_3];
    }
}

_id_13806( var_0, var_1 )
{
    if ( var_0 != "death" )
        self endon( "death" );

    var_1 endon( "die" );
    self waittill( var_0 );
    var_1 notify( "returned", var_0 );
}

_id_13839( var_0, var_1, var_2 )
{
    if ( var_1 != "death" )
        self endon( "death" );

    var_2 endon( "die" );
    self waittillmatch( var_0, var_1 );
    var_2 notify( "returned", var_1 );
}

_id_13807( var_0, var_1 )
{
    var_1 endon( "die" );
    self waittill( var_0 );
    var_1 notify( "returned", var_0 );
}

_id_137AC( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    var_5 = spawnstruct();
    var_5._id_117B8 = 0;

    if ( isdefined( var_0 ) )
    {
        childthread _id_13806( var_0, var_5 );
        var_5._id_117B8++;
    }

    if ( isdefined( var_1 ) )
    {
        childthread _id_13806( var_1, var_5 );
        var_5._id_117B8++;
    }

    if ( isdefined( var_2 ) )
    {
        childthread _id_13806( var_2, var_5 );
        var_5._id_117B8++;
    }

    if ( isdefined( var_3 ) )
    {
        childthread _id_13806( var_3, var_5 );
        var_5._id_117B8++;
    }

    if ( isdefined( var_4 ) )
    {
        childthread _id_13806( var_4, var_5 );
        var_5._id_117B8++;
    }

    while ( var_5._id_117B8 )
    {
        var_5 waittill( "returned" );
        var_5._id_117B8--;
    }

    var_5 notify( "die" );
}

_id_13838( var_0, var_1, var_2 )
{
    self endon( "death" );
    self waittillmatch( var_0, var_1 );
    self notify( var_2 );
}

_id_13734( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( ( !isdefined( var_0 ) || var_0 != "death" ) && ( !isdefined( var_1 ) || var_1 != "death" ) && ( !isdefined( var_2 ) || var_2 != "death" ) && ( !isdefined( var_3 ) || var_3 != "death" ) && ( !isdefined( var_4 ) || var_4 != "death" ) && ( !isdefined( var_5 ) || var_5 != "death" ) )
        self endon( "death" );

    var_6 = spawnstruct();

    if ( isdefined( var_0 ) )
        childthread _id_13806( var_0, var_6 );

    if ( isdefined( var_1 ) )
        childthread _id_13806( var_1, var_6 );

    if ( isdefined( var_2 ) )
        childthread _id_13806( var_2, var_6 );

    if ( isdefined( var_3 ) )
        childthread _id_13806( var_3, var_6 );

    if ( isdefined( var_4 ) )
        childthread _id_13806( var_4, var_6 );

    if ( isdefined( var_5 ) )
        childthread _id_13806( var_5, var_6 );

    var_6 waittill( "returned", var_7 );
    var_6 notify( "die" );
    return var_7;
}

_id_13837( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( ( !isdefined( var_1 ) || var_1 != "death" ) && ( !isdefined( var_2 ) || var_2 != "death" ) && ( !isdefined( var_3 ) || var_3 != "death" ) && ( !isdefined( var_4 ) || var_4 != "death" ) && ( !isdefined( var_5 ) || var_5 != "death" ) && ( !isdefined( var_6 ) || var_6 != "death" ) )
        self endon( "death" );

    var_7 = spawnstruct();

    if ( isdefined( var_1 ) )
        childthread _id_13839( var_0, var_1, var_7 );

    if ( isdefined( var_2 ) )
        childthread _id_13839( var_0, var_2, var_7 );

    if ( isdefined( var_3 ) )
        childthread _id_13839( var_0, var_3, var_7 );

    if ( isdefined( var_4 ) )
        childthread _id_13839( var_0, var_4, var_7 );

    if ( isdefined( var_5 ) )
        childthread _id_13839( var_0, var_5, var_7 );

    if ( isdefined( var_6 ) )
        childthread _id_13839( var_0, var_6, var_7 );

    var_7 waittill( "returned", var_8 );
    var_7 notify( "die" );
    return var_8;
}

_id_13735( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();

    if ( isdefined( var_0 ) )
        childthread _id_13807( var_0, var_6 );

    if ( isdefined( var_1 ) )
        childthread _id_13807( var_1, var_6 );

    if ( isdefined( var_2 ) )
        childthread _id_13807( var_2, var_6 );

    if ( isdefined( var_3 ) )
        childthread _id_13807( var_3, var_6 );

    if ( isdefined( var_4 ) )
        childthread _id_13807( var_4, var_6 );

    if ( isdefined( var_5 ) )
        childthread _id_13807( var_5, var_6 );

    var_6 waittill( "returned", var_7 );
    var_6 notify( "die" );
    return var_7;
}

_id_13730( var_0 )
{
    var_1 = spawnstruct();
    var_2 = 0;

    foreach ( var_4 in var_0 )
    {
        childthread _id_13806( var_4, var_1 );

        if ( var_4 == "death" )
            var_2 = 1;
    }

    if ( !var_2 )
        self endon( "death" );

    var_1 waittill( "returned", var_6 );
    var_1 notify( "die" );
    return var_6;
}

_id_13731( var_0 )
{
    var_1 = spawnstruct();

    foreach ( var_3 in var_0 )
        childthread _id_13807( var_3, var_1 );

    var_1 waittill( "returned", var_5 );
    var_1 notify( "die" );
    return var_5;
}

_id_1372E( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_3 = 0;

    foreach ( var_5 in var_0 )
    {
        childthread _id_13806( var_5, var_2 );

        if ( var_5 == "death" )
            var_3 = 1;
    }

    if ( !var_3 )
        self endon( "death" );

    var_2 childthread _id_1428( var_1 );
    var_2 waittill( "returned", var_7 );
    var_2 notify( "die" );
    return var_7;
}

_id_1372F( var_0, var_1 )
{
    var_2 = spawnstruct();

    foreach ( var_4 in var_0 )
        childthread _id_13807( var_4, var_2 );

    var_2 thread _id_1428( var_1 );
    var_2 waittill( "returned", var_6 );
    var_2 notify( "die" );
    return var_6;
}

_id_13736( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( ( !isdefined( var_1 ) || var_1 != "death" ) && ( !isdefined( var_2 ) || var_2 != "death" ) && ( !isdefined( var_3 ) || var_3 != "death" ) && ( !isdefined( var_4 ) || var_4 != "death" ) && ( !isdefined( var_5 ) || var_5 != "death" ) && ( !isdefined( var_6 ) || var_6 != "death" ) )
        self endon( "death" );

    var_7 = spawnstruct();

    if ( isdefined( var_1 ) )
        childthread _id_13806( var_1, var_7 );

    if ( isdefined( var_2 ) )
        childthread _id_13806( var_2, var_7 );

    if ( isdefined( var_3 ) )
        childthread _id_13806( var_3, var_7 );

    if ( isdefined( var_4 ) )
        childthread _id_13806( var_4, var_7 );

    if ( isdefined( var_5 ) )
        childthread _id_13806( var_5, var_7 );

    if ( isdefined( var_6 ) )
        childthread _id_13806( var_6, var_7 );

    var_7 childthread _id_1428( var_0 );
    var_7 waittill( "returned", var_8 );
    var_7 notify( "die" );
    return var_8;
}

_id_1428( var_0 )
{
    self endon( "die" );
    wait( var_0 );
    self notify( "returned", "timeout" );
}

_id_13737( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();

    if ( isdefined( var_1 ) )
        childthread _id_13807( var_1, var_6 );

    if ( isdefined( var_2 ) )
        childthread _id_13807( var_2, var_6 );

    if ( isdefined( var_3 ) )
        childthread _id_13807( var_3, var_6 );

    if ( isdefined( var_4 ) )
        childthread _id_13807( var_4, var_6 );

    if ( isdefined( var_5 ) )
        childthread _id_13807( var_5, var_6 );

    var_6 childthread _id_1428( var_0 );
    var_6 waittill( "returned", var_7 );
    var_6 notify( "die" );
    return var_7;
}

waittill_any( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( isdefined( var_1 ) )
        self endon( var_1 );

    if ( isdefined( var_2 ) )
        self endon( var_2 );

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    if ( isdefined( var_4 ) )
        self endon( var_4 );

    if ( isdefined( var_5 ) )
        self endon( var_5 );

    if ( isdefined( var_6 ) )
        self endon( var_6 );

    if ( isdefined( var_7 ) )
        self endon( var_7 );

    self waittill( var_0 );
}

_id_1372B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    if ( isdefined( var_2 ) && isdefined( var_3 ) )
        var_2 endon( var_3 );

    if ( isdefined( var_4 ) && isdefined( var_5 ) )
        var_4 endon( var_5 );

    if ( isdefined( var_6 ) && isdefined( var_7 ) )
        var_6 endon( var_7 );

    if ( isdefined( var_8 ) && isdefined( var_9 ) )
        var_8 endon( var_9 );

    if ( isdefined( var_10 ) && isdefined( var_11 ) )
        var_10 endon( var_11 );

    if ( isdefined( var_12 ) && isdefined( var_13 ) )
        var_12 endon( var_13 );

    var_0 waittill( var_1 );
}

_id_9DFB()
{
    if ( !isdefined( self._id_6ECA ) )
        return 0;

    return gettime() < self._id_6ECA;
}

_id_6E34( var_0 )
{
    if ( !isdefined( level._id_6E25 ) )
        return 0;

    return isdefined( level._id_6E25[var_0] );
}

_id_6E25( var_0 )
{
    return level._id_6E25[var_0];
}

_id_6E39( var_0 )
{
    if ( !isdefined( level._id_6E25 ) )
        scripts\engine\flags::_id_95E2();

    level._id_6E25[var_0] = 0;
    _id_978C();

    if ( !isdefined( level._id_12745[var_0] ) )
        level._id_12745[var_0] = [];

    if ( getsubstr( var_0, 0, 3 ) == "aa_" )
        thread [[ level._id_74C2["sp_stat_tracking_func"] ]]( var_0 );
}

_id_61B9( var_0 )
{

}

_id_6E3E( var_0, var_1 )
{
    level._id_6E25[var_0] = 1;
    _id_F5D6( var_0 );

    if ( isdefined( var_1 ) )
        level notify( var_0, var_1 );
    else
        level notify( var_0 );
}

_id_6E4C( var_0 )
{
    var_1 = undefined;

    while ( !_id_6E25( var_0 ) )
    {
        var_1 = undefined;
        level waittill( var_0, var_1 );
    }

    if ( isdefined( var_1 ) )
        return var_1;
}

_id_6E2A( var_0 )
{
    if ( !_id_6E25( var_0 ) )
        return;

    level._id_6E25[var_0] = 0;
    _id_F5D6( var_0 );
    level notify( var_0 );
}

_id_6E5A( var_0 )
{
    while ( _id_6E25( var_0 ) )
        level waittill( var_0 );
}

_id_13762( var_0, var_1 )
{
    self endon( var_0 );
    self waittill( var_1 );
    return var_1;
}

_id_22D3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( !isdefined( var_3 ) )
    {
        foreach ( var_13 in var_0 )
        {
            var_13 thread [[ var_1 ]]();
            wait( var_2 );
        }
    }
    else
    {
        if ( !isdefined( var_4 ) )
        {
            foreach ( var_13 in var_0 )
            {
                var_13 thread [[ var_1 ]]( var_3 );
                wait( var_2 );
            }

            return;
        }

        if ( !isdefined( var_5 ) )
        {
            foreach ( var_13 in var_0 )
            {
                var_13 thread [[ var_1 ]]( var_3, var_4 );
                wait( var_2 );
            }

            return;
        }

        if ( !isdefined( var_6 ) )
        {
            foreach ( var_13 in var_0 )
            {
                var_13 thread [[ var_1 ]]( var_3, var_4, var_5 );
                wait( var_2 );
            }

            return;
        }

        if ( !isdefined( var_7 ) )
        {
            foreach ( var_13 in var_0 )
            {
                var_13 thread [[ var_1 ]]( var_3, var_4, var_5, var_6 );
                wait( var_2 );
            }

            return;
        }

        if ( !isdefined( var_8 ) )
        {
            foreach ( var_13 in var_0 )
            {
                var_13 thread [[ var_1 ]]( var_3, var_4, var_5, var_6, var_7 );
                wait( var_2 );
            }

            return;
        }

        if ( !isdefined( var_9 ) )
        {
            foreach ( var_13 in var_0 )
            {
                var_13 thread [[ var_1 ]]( var_3, var_4, var_5, var_6, var_7, var_8 );
                wait( var_2 );
            }

            return;
        }

        if ( !isdefined( var_10 ) )
        {
            foreach ( var_13 in var_0 )
            {
                var_13 thread [[ var_1 ]]( var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
                wait( var_2 );
            }

            return;
        }

        if ( !isdefined( var_11 ) )
        {
            foreach ( var_13 in var_0 )
            {
                var_13 thread [[ var_1 ]]( var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
                wait( var_2 );
            }

            return;
        }

        foreach ( var_13 in var_0 )
        {
            var_13 thread [[ var_1 ]]( var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
            wait( var_2 );
        }
    }
}

_id_22D2( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 )
{
    if ( isdefined( var_10 ) )
    {
        foreach ( var_12 in var_0 )
            var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        return;
    }

    if ( isdefined( var_9 ) )
    {
        foreach ( var_12 in var_0 )
            var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        return;
    }

    if ( isdefined( var_8 ) )
    {
        foreach ( var_12 in var_0 )
            var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

        return;
    }

    if ( isdefined( var_7 ) )
    {
        foreach ( var_12 in var_0 )
            var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7 );

        return;
    }

    if ( isdefined( var_6 ) )
    {
        foreach ( var_12 in var_0 )
            var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6 );

        return;
    }

    if ( isdefined( var_5 ) )
    {
        foreach ( var_12 in var_0 )
            var_12 thread [[ var_1 ]]( var_2, var_3, var_4, var_5 );

        return;
    }

    if ( isdefined( var_4 ) )
    {
        foreach ( var_12 in var_0 )
            var_12 thread [[ var_1 ]]( var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_12 in var_0 )
            var_12 thread [[ var_1 ]]( var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_12 in var_0 )
            var_12 thread [[ var_1 ]]( var_2 );

        return;
    }

    foreach ( var_12 in var_0 )
        var_12 thread [[ var_1 ]]();
}

_id_227D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    if ( isdefined( var_9 ) )
    {
        foreach ( var_11 in var_0 )
            var_11 call [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        return;
    }

    if ( isdefined( var_8 ) )
    {
        foreach ( var_11 in var_0 )
            var_11 call [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

        return;
    }

    if ( isdefined( var_7 ) )
    {
        foreach ( var_11 in var_0 )
            var_11 call [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6, var_7 );

        return;
    }

    if ( isdefined( var_6 ) )
    {
        foreach ( var_11 in var_0 )
            var_11 call [[ var_1 ]]( var_2, var_3, var_4, var_5, var_6 );

        return;
    }

    if ( isdefined( var_5 ) )
    {
        foreach ( var_11 in var_0 )
            var_11 call [[ var_1 ]]( var_2, var_3, var_4, var_5 );

        return;
    }

    if ( isdefined( var_4 ) )
    {
        foreach ( var_11 in var_0 )
            var_11 call [[ var_1 ]]( var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_11 in var_0 )
            var_11 call [[ var_1 ]]( var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_11 in var_0 )
            var_11 call [[ var_1 ]]( var_2 );

        return;
    }

    foreach ( var_11 in var_0 )
        var_11 call [[ var_1 ]]();
}

_id_1277A( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_2 = getentarray( var_0, var_1 );
        _id_22D2( var_2, ::_id_1277B );
    }
    else
        _id_1277B();
}

_id_1277B()
{
    if ( isdefined( self._id_DD8D ) )
        self.origin = self._id_DD8D;

    self._id_12778 = undefined;
}

_id_12778( var_0, var_1 )
{
    if ( isdefined( var_0 ) && isdefined( var_1 ) )
    {
        var_2 = getentarray( var_0, var_1 );
        _id_22D2( var_2, ::_id_12779 );
    }
    else
        _id_12779();
}

_id_12779()
{
    if ( !isdefined( self._id_DD8D ) )
        self._id_DD8D = self.origin;

    if ( self.origin == self._id_DD8D )
        self.origin += ( 0, 0, -10000 );

    self._id_12778 = 1;
    self notify( "trigger_off" );
}

_id_F5D6( var_0 )
{
    if ( !isdefined( level._id_12745 ) )
        return;

    level._id_12745[var_0] = _id_22BC( level._id_12745[var_0] );
    _id_22D2( level._id_12745[var_0], ::_id_12E40 );
}

_id_12E40()
{
    var_0 = 1;

    if ( isdefined( self._id_ED9F ) )
    {
        var_0 = 0;
        var_1 = _id_48ED( self._id_ED9F );

        foreach ( var_3 in var_1 )
        {
            if ( _id_6E25( var_3 ) )
            {
                var_0 = 1;
                break;
            }
        }
    }

    var_5 = 1;

    if ( isdefined( self._id_ED9D ) )
    {
        var_1 = _id_48ED( self._id_ED9D );

        foreach ( var_3 in var_1 )
        {
            if ( _id_6E25( var_3 ) )
            {
                var_5 = 0;
                break;
            }
        }
    }

    [[ level._id_12749[var_0 && var_5] ]]();
}

_id_48ED( var_0 )
{
    var_1 = strtok( var_0, " " );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( !isdefined( level._id_6E25[var_1[var_2]] ) )
            _id_6E39( var_1[var_2] );
    }

    return var_1;
}

_id_978C()
{
    if ( !_id_16F3( "trigger_flags", ::_id_978C ) )
        return;

    level._id_12745 = [];
    level._id_12749[1] = ::_id_1277A;
    level._id_12749[0] = ::_id_12778;
}

_id_817E( var_0, var_1 )
{
    var_2 = level._id_1115C[var_1][var_0];

    if ( !isdefined( var_2 ) )
        return undefined;

    if ( var_2.size > 1 )
        return undefined;

    return var_2[0];
}

_id_8180( var_0, var_1 )
{
    var_2 = level._id_1115C[var_1][var_0];

    if ( !isdefined( var_2 ) )
        return [];

    return var_2;
}

_id_1115B()
{
    if ( !_id_16F3( "struct_classes", ::_id_1115B ) )
        return;

    level._id_1115C = [];
    level._id_1115C["target"] = [];
    level._id_1115C["targetname"] = [];
    level._id_1115C["script_noteworthy"] = [];
    level._id_1115C["script_linkname"] = [];

    foreach ( var_3, var_1 in level.struct )
    {
        if ( isdefined( var_1._id_0336 ) )
        {
            if ( var_1._id_0336 == "delete_on_load" )
            {
                level.struct[var_3] = undefined;
                continue;
            }

            if ( !isdefined( level._id_1115C["targetname"][var_1._id_0336] ) )
                level._id_1115C["targetname"][var_1._id_0336] = [];

            var_2 = level._id_1115C["targetname"][var_1._id_0336].size;
            level._id_1115C["targetname"][var_1._id_0336][var_2] = var_1;
        }

        if ( isdefined( var_1._id_0334 ) )
        {
            if ( !isdefined( level._id_1115C["target"][var_1._id_0334] ) )
                level._id_1115C["target"][var_1._id_0334] = [];

            var_2 = level._id_1115C["target"][var_1._id_0334].size;
            level._id_1115C["target"][var_1._id_0334][var_2] = var_1;
        }

        if ( isdefined( var_1.script_noteworthy ) )
        {
            if ( !isdefined( level._id_1115C["script_noteworthy"][var_1.script_noteworthy] ) )
                level._id_1115C["script_noteworthy"][var_1.script_noteworthy] = [];

            var_2 = level._id_1115C["script_noteworthy"][var_1.script_noteworthy].size;
            level._id_1115C["script_noteworthy"][var_1.script_noteworthy][var_2] = var_1;
        }

        if ( isdefined( var_1._id_027C ) )
        {
            if ( !isdefined( level._id_1115C["script_linkname"][var_1._id_027C] ) )
                level._id_1115C["script_linkname"][var_1._id_027C] = [];

            var_2 = level._id_1115C["script_linkname"][var_1._id_027C].size;
            level._id_1115C["script_linkname"][var_1._id_027C][var_2] = var_1;
        }
    }
}

_id_6C0C( var_0 )
{

}

_id_6C0A()
{

}

_id_6C08( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;
}

_id_6C09( var_0, var_1 )
{

}

_id_6C07()
{

}

_id_6C06()
{

}

_id_6C0B( var_0 )
{

}

array_remove( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
    {
        if ( var_4 != var_1 )
            var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_22AC( var_0, var_1 )
{
    foreach ( var_3 in var_1 )
        var_0 = array_remove( var_0, var_3 );

    return var_0;
}

_id_22BC( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_22AF( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_4 = 1;

        foreach ( var_6 in var_1 )
        {
            if ( var_3 == var_6 )
            {
                var_4 = 0;
                break;
            }
        }

        if ( var_4 )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_22A1( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_0 )
            thread [[ var_1 ]]( var_6, var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_0 )
            thread [[ var_1 ]]( var_6, var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_0 )
            thread [[ var_1 ]]( var_6, var_2 );

        return;
    }

    foreach ( var_6 in var_0 )
        thread [[ var_1 ]]( var_6 );
}

_id_22A0( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2 );

        return;
    }

    foreach ( var_6 in var_0 )
        call [[ var_1 ]]( var_6 );
}

_id_1756( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return var_0;

    if ( !isdefined( var_0 ) )
        var_0[0] = var_1;
    else
        var_0[var_0.size] = var_1;

    return var_0;
}

_id_693B( var_0, var_1 )
{
    var_2 = 0;

    if ( var_0.size > 0 )
    {
        foreach ( var_4 in var_0 )
        {
            if ( var_4 == var_1 )
            {
                var_2 = 1;
                break;
            }
        }
    }

    return var_2;
}

_id_50E1( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    thread _id_50E2( var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
}

_id_50E2( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 )
{
    if ( _id_9F64() )
    {
        self endon( "death" );
        self endon( "stop_delay_call" );
    }

    wait( var_1 );

    if ( isdefined( var_13 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
    else if ( isdefined( var_12 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 );
    else if ( isdefined( var_11 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
    else if ( isdefined( var_10 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
    else if ( isdefined( var_9 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );
    else if ( isdefined( var_8 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
    else if ( isdefined( var_7 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7 );
    else if ( isdefined( var_6 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6 );
    else if ( isdefined( var_5 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        self call [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        self call [[ var_0 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        self call [[ var_0 ]]( var_2 );
    else
        self call [[ var_0 ]]();
}

_id_9F64()
{
    if ( !isdefined( level._id_9F64 ) )
    {
        var_0 = getdvar( "mapname" );
        var_1 = "";

        for ( var_2 = 0; var_2 < min( var_0.size, 3 ); var_2++ )
            var_1 += var_0[var_2];

        level._id_9F64 = var_1 != "mp_" && var_1 != "cp_";
    }

    return level._id_9F64;
}

_id_9D9A()
{
    return string_starts_with( getdvar( "mapname" ), "cp_" );
}

_id_9F65()
{
    if ( !isdefined( level._id_9F65 ) )
        level._id_9F65 = string_starts_with( getdvar( "mapname" ), "so_td_" );

    return level._id_9F65;
}

string_starts_with( var_0, var_1 )
{
    if ( var_0.size < var_1.size )
        return 0;

    var_2 = getsubstr( var_0, 0, var_1.size );

    if ( var_2 == var_1 )
        return 1;

    return 0;
}

_id_D5DA( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_0[0];

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !isdefined( var_4 ) )
        var_4 = 0.05;

    for ( var_6 = 1; var_6 < var_0.size; var_6++ )
    {
        thread _id_5B4B( var_5, var_0[var_6], var_1, var_2, var_3, var_4 );
        var_5 = var_0[var_6];
    }
}

_id_5B4B( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_5 = gettime() + var_5 * 1000;

    while ( gettime() < var_5 )
        wait 0.05;
}

_id_227F( var_0, var_1, var_2, var_3 )
{
    var_4 = [];

    if ( isdefined( var_0 ) )
    {
        foreach ( var_6 in var_0 )
            var_4[var_4.size] = var_6;
    }

    if ( isdefined( var_1 ) )
    {
        foreach ( var_6 in var_1 )
            var_4[var_4.size] = var_6;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_2 )
            var_4[var_4.size] = var_6;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_3 )
            var_4[var_4.size] = var_6;
    }

    return var_4;
}

_id_2282( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        foreach ( var_5 in var_3 )
            var_1[var_1.size] = var_5;
    }

    return var_1;
}

_id_2284( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in var_0 )
        var_2[var_2.size] = var_4;

    foreach ( var_4 in var_1 )
    {
        if ( array_contains( var_2, var_4 ) )
            continue;

        var_2[var_2.size] = var_4;
    }

    return var_2;
}

_id_2283( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_5, var_4 in var_0 )
        var_2[var_5] = var_4;

    foreach ( var_5, var_4 in var_1 )
        var_2[var_5] = var_4;

    return var_2;
}

_id_22A7( var_0 )
{
    for ( var_1 = 0; var_1 <= var_0.size - 2; var_1++ )
    {
        var_2 = randomintrange( var_1, var_0.size - 1 );
        var_3 = var_0[var_1];
        var_0[var_1] = var_0[var_2];
        var_0[var_2] = var_3;
    }

    return var_0;
}

_id_22A8( var_0 )
{
    var_1 = [];

    for ( var_2 = var_0; var_2.size > 0; var_2 = var_4 )
    {
        var_3 = randomintrange( 0, var_2.size );
        var_4 = [];
        var_5 = 0;

        foreach ( var_8, var_7 in var_2 )
        {
            if ( var_5 == var_3 )
                var_1[ter_op( isstring( var_8 ), var_8, var_1.size )] = var_7;
            else
                var_4[ter_op( isstring( var_8 ), var_8, var_4.size )] = var_7;

            var_5++;
        }
    }

    return var_1;
}

_id_2279( var_0, var_1 )
{
    var_0[var_0.size] = var_1;
    return var_0;
}

_id_229C( var_0, var_1, var_2 )
{
    if ( var_2 == var_0.size )
    {
        var_3 = var_0;
        var_3[var_3.size] = var_1;
        return var_3;
    }

    var_3 = [];
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        if ( var_5 == var_2 )
        {
            var_3[var_5] = var_1;
            var_4 = 1;
        }

        var_3[var_5 + var_4] = var_0[var_5];
    }

    return var_3;
}

array_contains( var_0, var_1 )
{
    if ( var_0.size <= 0 )
        return 0;

    foreach ( var_3 in var_0 )
    {
        if ( var_3 == var_1 )
            return 1;
    }

    return 0;
}

_id_2291( var_0, var_1 )
{
    foreach ( var_4, var_3 in var_0 )
    {
        if ( var_3 == var_1 )
            return var_4;
    }

    return undefined;
}

_id_6EE1( var_0 )
{
    var_1 = ( 0, var_0[1], 0 );
    return var_1;
}

_id_6EE3( var_0 )
{
    var_1 = ( var_0[0], var_0[1], 0 );
    return var_1;
}

_id_6EE6( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = ( 0, 0, 1 );

    var_2 = vectornormalize( var_0 - vectordot( var_1, var_0 ) * var_1 );
    return var_2;
}

_id_5B22( var_0, var_1, var_2, var_3 )
{
    level endon( "newpath" );
    var_4 = [];
    var_5 = vectortoangles( var_0 - var_1 );
    var_6 = anglestoright( var_5 );
    var_7 = anglestoforward( var_5 );
    var_8 = anglestoup( var_5 );
    var_9 = distance( var_0, var_1 );
    var_10 = [];
    var_11 = 0.1;
    var_10[0] = var_0;
    var_10[1] = var_0 + var_6 * ( var_9 * var_11 ) + var_7 * ( var_9 * -0.1 );
    var_10[2] = var_1;
    var_10[3] = var_0 + var_6 * ( var_9 * ( -1 * var_11 ) ) + var_7 * ( var_9 * -0.1 );
    var_10[4] = var_0;
    var_10[5] = var_0 + var_8 * ( var_9 * var_11 ) + var_7 * ( var_9 * -0.1 );
    var_10[6] = var_1;
    var_10[7] = var_0 + var_8 * ( var_9 * ( -1 * var_11 ) ) + var_7 * ( var_9 * -0.1 );
    var_10[8] = var_0;
    var_12 = var_2[0];
    var_13 = var_2[1];
    var_14 = var_2[2];
    _id_D5DA( var_10, var_12, var_13, var_14, var_3 );
}

_id_7A9C()
{
    return strtok( self._id_EE01, " " );
}

_id_5B21( var_0, var_1, var_2 )
{
    level endon( "newpath" );
    var_3 = [];
    var_4 = vectortoangles( var_0 - var_1 );
    var_5 = anglestoright( var_4 );
    var_6 = anglestoforward( var_4 );
    var_7 = distance( var_0, var_1 );
    var_8 = [];
    var_9 = 0.05;
    var_8[0] = var_0;
    var_8[1] = var_0 + var_5 * ( var_7 * var_9 ) + var_6 * ( var_7 * -0.2 );
    var_8[2] = var_1;
    var_8[3] = var_0 + var_5 * ( var_7 * ( -1 * var_9 ) ) + var_6 * ( var_7 * -0.2 );

    for ( var_10 = 0; var_10 < 4; var_10++ )
    {
        var_11 = var_10 + 1;

        if ( var_11 >= 4 )
            var_11 = 0;
    }
}

_id_5B27( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    if ( !isdefined( var_6 ) )
        var_6 = 1;

    var_7 = anglestoforward( var_3 );
    var_8 = anglestoright( var_3 );
    var_9 = anglestoup( var_3 );
    var_10 = var_0 + var_9 * var_1;
    var_11 = var_0 + var_9 * var_2;
    var_11 -= var_9 * var_1;
    var_12 = var_10 + var_7 * var_1;
    var_13 = var_11 + var_7 * var_1;
    var_14 = var_10 - var_7 * var_1;
    var_15 = var_11 - var_7 * var_1;
    var_16 = var_10 + var_8 * var_1;
    var_17 = var_11 + var_8 * var_1;
    var_18 = var_10 - var_8 * var_1;
    var_19 = var_11 - var_8 * var_1;
}

_id_5B28( var_0, var_1, var_2 )
{
    var_3 = self _meth_8435();
    _id_5B27( self _meth_814F(), var_3["radius"], var_3["half_height"] * 2, self.angles, var_0, var_1, var_2 );
}

_id_5B58( var_0, var_1, var_2 )
{
    var_3 = self _meth_8435();
    _id_5B27( self _meth_814F(), var_3["radius"], var_3["half_height"] * 2, self getplayerangles(), var_0, var_1, var_2 );
}

_id_5B43( var_0, var_1 )
{
    self endon( "stop_drawing_axis" );
    self endon( "death" );

    for (;;)
    {
        var_2 = self gettagorigin( var_0 );
        var_3 = self gettagangles( var_0 );
        _id_5B20( var_3, var_2, var_1 );
        waitframe();
    }
}

_id_5B42( var_0, var_1 )
{
    self endon( "stop_drawing_axis" );
    self endon( "death" );

    for (;;)
    {
        _id_5B41( var_0, undefined, var_1 );
        waitframe();
    }
}

_id_5B41( var_0, var_1, var_2 )
{
    waittillframeend;

    if ( isdefined( self.angles ) )
        var_3 = self.angles;
    else
        var_3 = ( 0, 0, 0 );

    _id_5B20( var_3, self.origin, var_0, var_1, var_2 );
}

_id_5B20( var_0, var_1, var_2, var_3, var_4 )
{
    waittillframeend;
    var_5 = anglestoforward( var_0 );
    var_6 = anglestoright( var_0 );
    var_7 = anglestoup( var_0 );

    if ( !isdefined( var_2 ) )
        var_2 = ( 1, 0, 1 );

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !isdefined( var_4 ) )
        var_4 = 10;
}

_id_5B44( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2 ) )
        var_2 = ( 0, 1, 0 );

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !isdefined( var_4 ) )
        var_4 = 0.05;

    if ( var_3 )
        var_5 = int( var_4 / 0.05 );
    else
        var_5 = int( var_1 / 0.05 );

    var_6 = [];
    var_7 = [];
    var_8 = gettime();

    for ( var_9 = var_8 + var_1 * 1000; var_8 < var_9 && isdefined( var_0 ); var_8 = gettime() )
    {
        var_6[0] = var_0 getpointinbounds( 1, 1, 1 );
        var_6[1] = var_0 getpointinbounds( 1, 1, -1 );
        var_6[2] = var_0 getpointinbounds( -1, 1, -1 );
        var_6[3] = var_0 getpointinbounds( -1, 1, 1 );
        var_7[0] = var_0 getpointinbounds( 1, -1, 1 );
        var_7[1] = var_0 getpointinbounds( 1, -1, -1 );
        var_7[2] = var_0 getpointinbounds( -1, -1, -1 );
        var_7[3] = var_0 getpointinbounds( -1, -1, 1 );

        for ( var_10 = 0; var_10 < 4; var_10++ )
        {
            var_11 = var_10 + 1;

            if ( var_11 == 4 )
                var_11 = 0;
        }

        if ( !var_3 )
            return;

        wait( var_4 );
    }
}

_id_7ECB( var_0 )
{
    return level._effect[var_0];
}

_id_7628( var_0 )
{
    return isdefined( level._effect[var_0] );
}

_id_7F62()
{
    return self._id_EB6B;
}

_id_D454()
{

}

_id_9FBE()
{
    return !isdefined( self._id_55E4 ) || !self._id_55E4;
}

_id_1C6E( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55E4 ) )
            self._id_55E4 = 0;

        self._id_55E4--;

        if ( !self._id_55E4 )
            self _meth_80DA();
    }
    else
    {
        if ( !isdefined( self._id_55E4 ) )
            self._id_55E4 = 0;

        self._id_55E4++;
        self _meth_80A8();
    }
}

_id_1C71( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55E6 ) )
            self._id_55E6 = 0;

        self._id_55E6--;

        if ( !self._id_55E6 )
        {
            self enableweapons();

            if ( isdefined( level._id_1C73 ) )
                self [[ level._id_1C73 ]]( 1 );
        }
    }
    else
    {
        if ( !isdefined( self._id_55E6 ) )
            self._id_55E6 = 0;

        if ( !self._id_55E6 )
        {
            if ( isdefined( level._id_1C73 ) )
                self [[ level._id_1C73 ]]( 0 );

            self _meth_80AA();
        }

        self._id_55E6++;
    }
}

_id_9FFD()
{
    return !isdefined( self._id_55E6 ) || !self._id_55E6;
}

_id_1C76( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55E9 ) )
            self._id_55E9 = 0;

        self._id_55E9--;

        if ( !self._id_55E9 )
            self enableweaponswitch();
    }
    else
    {
        if ( !isdefined( self._id_55E9 ) )
            self._id_55E9 = 0;

        self._id_55E9++;
        self _meth_80AB();
    }
}

_id_1C58( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55D9 ) )
            self._id_55D9 = 0;

        self._id_55D9--;

        if ( !self._id_55D9 )
            self _meth_80D6();

        if ( !isdefined( level.ismp ) || level.ismp == 0 )
            _id_1C57( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55D9 ) )
            self._id_55D9 = 0;

        self._id_55D9++;
        self _meth_80A4();

        if ( !isdefined( level.ismp ) || level.ismp == 0 )
            _id_1C57( 0 );
    }
}

_id_1C55( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55D6 ) )
            self._id_55D6 = 0;
        else
            self._id_55D6--;

        if ( !self._id_55D6 )
            self _meth_858C();
    }
    else
    {
        if ( !isdefined( self._id_55D6 ) )
            self._id_55D6 = 0;

        self._id_55D6++;
        self _meth_858B();
    }
}

_id_1C56( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55D7 ) )
            self._id_55D7 = 0;
        else
            self._id_55D7--;

        if ( !self._id_55D7 )
            self _meth_8438();

        _id_1C57( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55D7 ) )
            self._id_55D7 = 0;

        self._id_55D7++;
        self _meth_8437();
        _id_1C57( 0 );
    }
}

_id_1C57( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55D8 ) )
            self._id_55D8 = 0;

        self._id_55D8--;

        if ( !self._id_55D8 )
            self _meth_84DD( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55D8 ) )
            self._id_55D8 = 0;

        self._id_55D8++;
        self _meth_84DD( 0 );
    }
}

_id_A009()
{
    return !isdefined( self._id_55E9 ) || !self._id_55E9;
}

_id_9EC1()
{
    return !isdefined( self._id_55D9 ) || !self._id_55D9;
}

_id_9EBE()
{
    return !isdefined( self._id_55D6 ) || !self._id_55D6;
}

_id_9EBF()
{
    return !isdefined( self._id_55D7 ) || !self._id_55D7;
}

_id_1C60( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55DC ) )
            self._id_55DC = 0;
        else
            self._id_55DC--;

        if ( !self._id_55DC )
            self _meth_8010( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55DC ) )
            self._id_55DC = 0;

        self._id_55DC++;
        self _meth_8010( 0 );
    }
}

_id_1C40( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55C3 ) )
            self._id_55C3 = 0;
        else
            self._id_55C3--;

        if ( !self._id_55C3 )
            self _meth_800A( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55C3 ) )
            self._id_55C3 = 0;

        self._id_55C3++;
        self _meth_800A( 0 );
    }
}

_id_1C68( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55E2 ) )
            self._id_55E2 = 0;
        else
            self._id_55E2--;

        if ( !self._id_55E2 )
            self _meth_8013( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55E2 ) )
            self._id_55E2 = 0;

        self._id_55E2++;
        self _meth_8013( 0 );
    }
}

_id_1C67( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55E1 ) )
            self._id_55E1 = 0;
        else
            self._id_55E1--;

        if ( !self._id_55E1 )
            self _meth_8012( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55E1 ) )
            self._id_55E1 = 0;

        self._id_55E1++;
        self _meth_8012( 0 );
    }
}

_id_1C52( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55D4 ) )
            self._id_55D4 = 0;
        else
            self._id_55D4--;

        if ( !self._id_55D4 )
            self _meth_8472( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55D4 ) )
            self._id_55D4 = 0;

        self._id_55D4++;
        self _meth_8472( 0 );
    }
}

_id_1C46( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55C8 ) )
            self._id_55C8 = 0;
        else
            self._id_55C8--;

        if ( !self._id_55C8 )
            self _meth_800C( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55C8 ) )
            self._id_55C8 = 0;

        self._id_55C8++;
        self _meth_800C( 0 );
    }
}

_id_1C35( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55BE ) )
            self._id_55BE = 0;
        else
            self._id_55BE--;

        if ( !self._id_55BE )
            self _meth_8009( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55BE ) )
            self._id_55BE = 0;

        self._id_55BE++;
        self _meth_8009( 0 );
    }
}

_id_1C4E( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55D0 ) )
            self._id_55D0 = 0;
        else
            self._id_55D0--;

        if ( !self._id_55D0 )
            self allowjump( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55D0 ) )
            self._id_55D0 = 0;

        self._id_55D0++;
        self allowjump( 0 );
    }
}

_id_1C70( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55E5 ) )
            self._id_55E5 = 0;
        else
            self._id_55E5--;

        if ( !self._id_55E5 )
            self _meth_8424( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55E5 ) )
            self._id_55E5 = 0;

        self._id_55E5++;
        self _meth_8424( 0 );
    }
}

_id_1C42( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55C6 ) )
            self._id_55C6 = 0;
        else
            self._id_55C6--;

        if ( !self._id_55C6 )
        {
            self _meth_842C( 0, self._id_5AE0 );
            self _meth_8434( 0, self._id_5AE1 );
            self._id_5AE0 = undefined;
            self._id_5AE1 = undefined;
            self _meth_8422( 1 );
        }
    }
    else
    {
        if ( !isdefined( self._id_55C6 ) )
            self._id_55C6 = 0;

        if ( self._id_55C6 == 0 )
        {
            self._id_5AE0 = self _meth_842B( 0 );
            self._id_5AE1 = self _meth_8433( 0 );
            self _meth_842C( 0, 0 );
            self _meth_8434( 0, 0 );
        }

        self._id_55C6++;
        self _meth_8422( 0 );
    }
}

_id_1C53( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55D5 ) )
            self._id_55D5 = 0;
        else
            self._id_55D5--;

        if ( !self._id_55D5 )
            self _meth_800F( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55D5 ) )
            self._id_55D5 = 0;

        self._id_55D5++;
        self _meth_800F( 0 );
    }
}

_id_1C64( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55E0 ) )
            self._id_55E0 = 0;
        else
            self._id_55E0--;

        if ( !self._id_55E0 )
            self _meth_8427( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55E0 ) )
            self._id_55E0 = 0;

        self._id_55E0++;
        self _meth_8427( 0 );
    }
}

_id_7953()
{
    if ( !isdefined( self._id_5AE0 ) )
        return self _meth_842B( 0 );

    return self._id_5AE0;
}

_id_F367( var_0 )
{
    if ( !isdefined( self._id_5AE0 ) )
        self _meth_842C( 0, var_0 );
    else
        self._id_5AE0 = var_0;
}

_id_7954()
{
    if ( !isdefined( self._id_5AE1 ) )
        return self _meth_8433( 0 );

    return self._id_5AE1;
}

_id_F368( var_0 )
{
    if ( !isdefined( self._id_5AE1 ) )
        self _meth_8434( 0, var_0 );
    else
        self._id_5AE1 = var_0;
}

_id_DC6B( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
        var_1[var_1.size] = var_3;

    if ( !var_1.size )
        return undefined;

    return var_1[randomint( var_1.size )];
}

random_weight_sorted( var_0 )
{
    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
        var_1[var_1.size] = var_3;

    if ( !var_1.size )
        return undefined;

    var_5 = randomint( var_1.size * var_1.size );
    return var_1[var_1.size - 1 - int( sqrt( var_5 ) )];
}

_id_107E6( var_0, var_1 )
{
    if ( !isdefined( var_1 ) && isdefined( self.angles ) )
        var_1 = self.angles;

    if ( !isdefined( var_0 ) && isdefined( self.origin ) )
        var_0 = self.origin;
    else if ( !isdefined( var_0 ) )
        var_0 = ( 0, 0, 0 );

    var_2 = spawn( "script_model", var_0 );
    var_2 setmodel( "tag_origin" );
    var_2 hide();

    if ( isdefined( var_1 ) )
        var_2.angles = var_1;

    return var_2;
}

_id_137B7( var_0, var_1 )
{
    self endon( var_0 );
    wait( var_1 );
}

_id_137B9( var_0, var_1 )
{
    self endon( var_0 );
    wait( var_1 );
    return "timeout";
}

_id_137B4( var_0, var_1 )
{
    var_2 = gettime();
    self waittill( var_0 );
    var_3 = var_2 + var_1 * 1000;
    var_4 = var_3 - var_2;

    if ( var_4 > 0 )
    {
        var_5 = var_4 / 1000.0;
        wait( var_5 );
    }
}

_id_6C05()
{
    level._id_6C0D = 0;
    level._id_6C03 = 1;
    _id_6C03( "GAMEPRINTSTARTFILE:" );
}

_id_6C03( var_0 )
{
    level._id_6C0D++;

    if ( level._id_6C0D > 200 )
    {
        wait 0.05;
        level._id_6C0D = 0;
    }
}

_id_6C04( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( var_1 )
        _id_6C03( "GAMEPRINTENDFILE:GAMEPRINTP4ENABLED:" + var_0 );
    else
        _id_6C03( "GAMEPRINTENDFILE:" + var_0 );

    var_2 = gettime() + 4000;

    while ( getdvarint( "LAUNCHER_PRINT_SUCCESS" ) == 0 && getdvar( "LAUNCHER_PRINT_FAIL" ) == "0" && gettime() < var_2 )
        wait 0.05;

    if ( !( gettime() < var_2 ) )
    {
        iprintlnbold( "LAUNCHER_PRINT_FAIL:( TIMEOUT ): launcherconflict? restart launcher and try again? " );
        level._id_6C03 = undefined;
        return 0;
    }

    var_3 = getdvar( "LAUNCHER_PRINT_FAIL" );

    if ( var_3 != "0" )
    {
        iprintlnbold( "LAUNCHER_PRINT_FAIL:( " + var_3 + " ): launcherconflict? restart launcher and try again? " );
        level._id_6C03 = undefined;
        return 0;
    }

    iprintlnbold( "Launcher write to file successful!" );
    level._id_6C03 = undefined;
    return 1;
}

_id_AAAC( var_0 )
{
    level._id_6C0D = 0;
    _id_6C03( "LAUNCHER_CLIP:" + var_0 );
}

activate_individual_exploder()
{
    scripts\common\exploder::_id_15B9();
}

waitframe()
{
    wait 0.05;
}

_id_7CD1( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self._id_0334;

    var_1 = getent( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        return var_1;

    if ( _id_9F64() )
    {
        var_1 = call [[ level._id_7FF9 ]]( var_0, "targetname" );

        if ( isdefined( var_1 ) )
            return var_1;

        var_1 = call [[ level._id_74C2["getspawner"] ]]( var_0, "targetname" );

        if ( isdefined( var_1 ) )
            return var_1;
    }

    var_1 = _id_817E( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        return var_1;

    var_1 = getvehiclenode( var_0, "targetname" );

    if ( isdefined( var_1 ) )
        return var_1;
}

_id_577E( var_0, var_1 )
{
    var_2 = level._id_5FC6[var_0];
    earthquake( var_2["magnitude"], var_2["duration"], var_1, var_2["radius"] );
}

_id_CD86( var_0, var_1 )
{
    var_2 = spawn( "script_origin", ( 0, 0, 0 ) );

    if ( !isdefined( var_1 ) )
        var_1 = self.origin;

    var_2.origin = var_1;
    var_2 playloopsound( var_0 );
    return var_2;
}

_id_CE2C( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawn( "script_origin", ( 0, 0, 1 ) );

    if ( !isdefined( var_1 ) )
        var_1 = self.origin;

    var_5.origin = var_1;
    var_5.angles = var_2;

    if ( isdefined( var_4 ) )
        var_5 linkto( var_4 );

    if ( _id_9F64() )
    {
        if ( isdefined( var_3 ) && var_3 )
            var_5 playsoundasmaster( var_0, "sounddone" );
        else
            var_5 playsound( var_0, "sounddone" );

        var_5 waittill( "sounddone" );
    }
    else if ( isdefined( var_3 ) && var_3 )
        var_5 playsoundasmaster( var_0 );
    else
        var_5 playsound( var_0 );

    var_5 delete();
}

_id_CE2B( var_0, var_1, var_2, var_3 )
{
    _id_CE2C( var_0, var_1, ( 0, 0, 0 ), var_2, var_3 );
}

_id_B040( var_0, var_1, var_2, var_3, var_4 )
{
    _id_B043( var_0, var_1, ( 0, 0, 0 ), var_2, var_3, var_4 );
}

_id_B043( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( var_3 ) && var_3 )
    {
        if ( !isdefined( level._id_6DC7 ) || level._id_6DC7 == 1 )
            spawnloopingsound( var_0, var_1, var_2 );
    }
    else
    {
        if ( level.createfx_enabled && isdefined( var_5._id_B066 ) )
            var_7 = var_5._id_B066;
        else
            var_7 = spawn( "script_origin", ( 0, 0, 0 ) );

        if ( isdefined( var_4 ) )
        {
            thread _id_B049( var_4, var_7 );
            self endon( var_4 );
        }

        var_7.origin = var_1;
        var_7.angles = var_2;
        var_7 playloopsound( var_0 );

        if ( level.createfx_enabled )
            var_5._id_B066 = var_7;
        else
            var_7 willneverchange();
    }
}

_id_B041( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    loop_fx_sound_interval_with_angles( var_0, var_1, ( 0, 0, 0 ), var_2, var_3, var_4, var_5 );
}

loop_fx_sound_interval_with_angles( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self.origin = var_1;
    self.angles = var_2;

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    if ( var_5 >= var_6 )
    {
        for (;;)
            wait 0.05;
    }

    if ( !soundexists( var_0 ) )
    {
        for (;;)
            wait 0.05;
    }

    for (;;)
    {
        wait( randomfloatrange( var_5, var_6 ) );
        _id_AED4( "createfx_looper" );
        thread _id_CE2C( var_0, self.origin, self.angles, undefined );
        _id_12BD1( "createfx_looper" );
    }
}

_id_B049( var_0, var_1 )
{
    var_1 endon( "death" );
    self waittill( var_0 );
    var_1 delete();
}

_id_49E6( var_0 )
{
    var_1 = scripts\common\createfx::_id_49AA( "loopfx", var_0 );
    var_1.v["delay"] = scripts\common\createfx::_id_7F81();
    return var_1;
}

_id_49FA( var_0 )
{
    var_1 = scripts\common\createfx::_id_49AA( "oneshotfx", var_0 );
    var_1.v["delay"] = scripts\common\createfx::_id_8022();
    return var_1;
}

_id_49AE( var_0 )
{
    var_1 = scripts\common\createfx::_id_49AA( "exploder", var_0 );
    var_1.v["delay"] = scripts\common\createfx::_id_7EA6();
    var_1.v["exploder_type"] = "normal";
    return var_1;
}

_id_1D3A( var_0 )
{
    if ( var_0.size <= 1 )
        return var_0;

    var_1 = 0;

    for ( var_2 = var_0.size - 1; var_2 >= 1; var_2-- )
    {
        var_3 = var_0[var_2];
        var_4 = var_2;

        for ( var_5 = 0; var_5 < var_2; var_5++ )
        {
            var_6 = var_0[var_5];

            if ( stricmp( var_6, var_3 ) > 0 )
            {
                var_3 = var_6;
                var_4 = var_5;
            }
        }

        if ( var_4 != var_2 )
        {
            var_0[var_4] = var_0[var_2];
            var_0[var_2] = var_3;
        }
    }

    return var_0;
}

_id_CD7F( var_0, var_1 )
{
    var_2 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_2 endon( "death" );
    thread _id_5179( var_2 );

    if ( isdefined( var_1 ) )
    {
        var_2.origin = self.origin + var_1;
        var_2.angles = self.angles;
        var_2 linkto( self );
    }
    else
    {
        var_2.origin = self.origin;
        var_2.angles = self.angles;
        var_2 linkto( self );
    }

    var_2 playloopsound( var_0 );
    self waittill( "stop sound" + var_0 );
    var_2 stoploopsound( var_0 );
    var_2 delete();
}

_id_11018( var_0 )
{
    self notify( "stop sound" + var_0 );
}

_id_5179( var_0 )
{
    var_0 endon( "death" );
    self waittill( "death" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_66BD( var_0 )
{
    waitframe();
}

_id_69A3( var_0, var_1, var_2 )
{
    [[ level._id_128D._id_69B4 ]]( var_0, var_1, var_2 );
}

ter_op( var_0, var_1, var_2 )
{
    if ( var_0 )
        return var_1;

    return var_2;
}

_id_4914( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !isdefined( level._id_AED4 ) )
        level._id_AED4 = [];

    var_2 = spawnstruct();
    var_2._id_B425 = var_1;
    var_2._id_00C1 = 0;
    level._id_AED4[var_0] = var_2;
}

_id_AED4( var_0 )
{
    var_1 = level._id_AED4[var_0];

    while ( var_1._id_00C1 >= var_1._id_B425 )
        var_1 waittill( "unlocked" );

    var_1._id_00C1++;
}

_id_12BD1( var_0 )
{
    thread _id_12BDC( var_0 );
}

_id_12BDC( var_0 )
{
    wait 0.05;
    var_1 = level._id_AED4[var_0];
    var_1._id_00C1--;
    var_1 notify( "unlocked" );
}

_id_7CF1()
{
    var_0 = level.script;

    if ( isdefined( level._id_116CC ) )
        var_0 = level._id_116CC;

    return var_0;
}

_id_9C70()
{
    if ( !level._id_4542 )
    {
        var_0 = self _meth_83D8();

        if ( isdefined( var_0 ) )
            return var_0;
        else
            return 0;
    }

    return 1;
}

_id_22BD( var_0 )
{
    var_1 = [];

    for ( var_2 = var_0.size - 1; var_2 >= 0; var_2-- )
        var_1[var_1.size] = var_0[var_2];

    return var_1;
}

_id_56F4( var_0, var_1 )
{
    return length2dsquared( var_0 - var_1 );
}

_id_7830( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_782F( var_0, var_1, var_2, var_3, var_4, var_5 );
    var_6 = _id_22BD( var_6 );
    return var_6;
}

_id_782F( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_3 ) )
        var_3 = var_1.size;

    if ( !isdefined( var_2 ) )
        var_2 = [];

    var_6 = undefined;

    if ( isdefined( var_4 ) )
        var_6 = var_4 * var_4;

    var_7 = 0;

    if ( isdefined( var_5 ) )
        var_7 = var_5 * var_5;

    if ( var_2.size == 0 && var_3 >= var_1.size && var_7 == 0 && !isdefined( var_6 ) )
        return sortbydistance( var_1, var_0 );

    var_8 = [];

    foreach ( var_10 in var_1 )
    {
        var_11 = 0;

        foreach ( var_13 in var_2 )
        {
            if ( var_10 == var_13 )
            {
                var_11 = 1;
                break;
            }
        }

        if ( var_11 )
            continue;

        var_15 = distancesquared( var_0, var_10.origin );

        if ( isdefined( var_6 ) && var_15 > var_6 )
            continue;

        if ( var_15 < var_7 )
            continue;

        var_8[var_8.size] = var_10;
    }

    var_8 = sortbydistance( var_8, var_0 );

    if ( var_3 >= var_8.size )
        return var_8;

    var_17 = [];

    for ( var_18 = 0; var_18 < var_3; var_18++ )
        var_17[var_18] = var_8[var_18];

    return var_17;
}

_id_5D14( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1500;

    if ( !isdefined( var_2 ) )
        var_2 = -12000;

    return _func_16D( var_0 + ( 0, 0, var_1 ), var_0 + ( 0, 0, var_2 ) );
}

within_fov( var_0, var_1, var_2, var_3 )
{
    var_4 = vectornormalize( var_2 - var_0 );
    var_5 = anglestoforward( var_1 );
    var_6 = vectordot( var_5, var_4 );
    return var_6 >= var_3;
}

_id_B269( var_0, var_1 )
{
    if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["bots_make_entity_sentient"] ) )
        return self [[ level.bot_funcs["bots_make_entity_sentient"] ]]( var_0, var_1 );
}

_id_1913( var_0 )
{
    if ( isdefined( level.bot_funcs ) && isdefined( level.bot_funcs["ai_3d_sighting_model"] ) )
        return self [[ level.bot_funcs["ai_3d_sighting_model"] ]]( var_0 );
}

_id_7E2E( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 500000;

    var_3 = undefined;

    foreach ( var_5 in var_1 )
    {
        var_6 = distance( var_5.origin, var_0 );

        if ( var_6 >= var_2 )
            continue;

        var_2 = var_6;
        var_3 = var_5;
    }

    return var_3;
}

_id_B82F( var_0, var_1, var_2 )
{
    var_2 = ter_op( isdefined( var_2 ), var_2, ( 0, 0, 0 ) );
    self _meth_8206( var_0, var_2 );

    switch ( var_1 )
    {
        case "direct":
            self _meth_8204();
            break;
        case "top":
            self _meth_8205();
            break;
    }
}

_id_16DE( var_0, var_1 )
{
    if ( !isdefined( level._effect ) )
        level._effect = [];

    level._effect[var_0] = loadfx( var_1 );
}

_id_22C3( var_0, var_1 )
{
    for ( var_2 = 1; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        for ( var_4 = var_2 - 1; var_4 >= 0 && ![[ var_1 ]]( var_0[var_4], var_3 ); var_4-- )
            var_0[var_4 + 1] = var_0[var_4];

        var_0[var_4 + 1] = var_3;
    }

    return var_0;
}

_id_16DC( var_0, var_1 )
{
    if ( !isdefined( level._id_74C2 ) )
        level._id_74C2 = [];

    level._id_74C2[var_0] = var_1;
}

_id_95C6( var_0 )
{
    if ( !isdefined( level._id_74C2 ) )
        level._id_74C2 = [];

    if ( !isdefined( level._id_74C2[var_0] ) )
        _id_16DC( var_0, ::_id_61B9 );
}

_id_16F3( var_0, var_1 )
{
    if ( !isdefined( level._id_9724 ) )
        level._id_9724 = [];

    if ( isdefined( level._id_9724[var_0] ) )
        return 0;

    level._id_9724[var_0] = var_1;
    return 1;
}

_id_D959()
{

}

_id_C953()
{
    if ( getdvar( "g_connectpaths" ) == "2" )
        level waittill( "eternity" );
}

_id_7E5E( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "unknown";

    var_0 = tolower( var_0 );

    switch ( var_0 )
    {
        case "melee":
        case "mod_crush":
        case "mod_melee":
            return "melee";
        case "bullet":
        case "mod_rifle_bullet":
        case "mod_pistol_bullet":
            return "bullet";
        case "splash":
        case "mod_explosive":
        case "mod_projectile_splash":
        case "mod_projectile":
        case "mod_grenade_splash":
        case "mod_grenade":
            return "splash";
        case "mod_impact":
            return "impact";
        case "unknown":
            return "unknown";
        default:
            return "unknown";
    }
}

_id_16DA( var_0 )
{
    if ( !isdefined( self._id_735B ) )
    {
        self._id_735B = [ var_0 ];
        thread _id_D977();
    }
    else
        self._id_735B[self._id_735B.size] = var_0;
}

_id_D977()
{
    for (;;)
    {
        if ( isdefined( self ) )
        {
            foreach ( var_1 in self._id_735B )
                self thread [[ var_1 ]]();
        }
        else
            break;

        wait 0.05;
    }
}

delaythread( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    thread _id_512D( var_1, var_0, var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_512D( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    self endon( "death" );
    self endon( "stop_delay_thread" );
    wait( var_1 );

    if ( isdefined( var_7 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6, var_7 );
    else if ( isdefined( var_6 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4, var_5, var_6 );
    else if ( isdefined( var_5 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        thread [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        thread [[ var_0 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        thread [[ var_0 ]]( var_2 );
    else
        thread [[ var_0 ]]();
}

_id_9F11( var_0 )
{
    if ( isdefined( var_0.hasriotshield ) && var_0.hasriotshield )
    {
        var_1 = self.origin - var_0.origin;
        var_2 = vectornormalize( ( var_1[0], var_1[1], 0 ) );
        var_3 = anglestoforward( var_0.angles );
        var_4 = vectordot( var_3, var_1 );

        if ( var_0.hasriotshieldequipped )
        {
            if ( var_4 > 0.766 )
                return 1;
        }
        else if ( var_4 < -0.766 )
            return 1;
    }

    return 0;
}

_id_9F10( var_0 )
{
    var_1 = 0;
    var_2 = self getcurrentweapon();
    var_3 = self adsbuttonpressed();
    var_4 = 0;
    var_5 = 0;
    var_6 = 0;
    var_7 = anglestoforward( self.angles );
    var_8 = vectornormalize( var_0.origin - self.origin );
    var_9 = vectordot( var_8, var_7 );

    if ( var_9 > 0.5 )
        var_4 = 1;

    if ( var_2 == "iw6_axe_mp" || var_2 == "iw7_axe_zm" )
    {
        var_6 = self getcurrentweaponclipammo();
        var_5 = 1;
    }

    if ( var_5 && var_3 && var_4 && var_6 > 0 )
    {
        self setweaponammoclip( var_2, var_6 - 1 );
        self playsound( "crate_impact" );
        earthquake( 0.75, 0.5, self.origin, 100 );
        var_1 = 1;
    }

    return var_1;
}

_id_9D33( var_0 )
{
    switch ( var_0 )
    {
        case "airdrop_escort_marker_mp":
        case "airdrop_tank_marker_mp":
        case "airdrop_juggernaut_maniac_mp":
        case "airdrop_juggernaut_def_mp":
        case "airdrop_juggernaut_mp":
        case "airdrop_sentry_marker_mp":
        case "airdrop_mega_marker_mp":
        case "airdrop_marker_support_mp":
        case "airdrop_marker_assault_mp":
        case "airdrop_marker_mp":
            return 1;
        default:
            return 0;
    }
}

_id_9DC1( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    switch ( var_0 )
    {
        case "barrel_mp":
        case "destructible_toy":
        case "destructible_car":
        case "destructible":
            return 1;
    }

    return 0;
}

_id_13C07( var_0 )
{
    if ( isdefined( var_0 ) && var_0 != "" && var_0 != "none" )
    {
        var_1 = getweaponbasename( var_0 );

        if ( var_1 == "iw7_emc" )
            return "pistol";

        if ( var_1 == "iw7_devastator" )
            return "spread";

        if ( var_1 == "iw7_steeldragon" )
            return "beam";
    }

    return weaponclass( var_0 );
}

_id_4D59( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( isdefined( self._id_00DD ) )
    {
        if ( !isdefined( var_0 ) )
            return 0;

        if ( self._id_00DD == var_0 )
            return 1;

        if ( !isdefined( var_1 ) )
            return 0;

        if ( self._id_00DD == var_1 )
            return 1;

        if ( !isdefined( var_2 ) )
            return 0;

        if ( self._id_00DD == var_2 )
            return 1;

        if ( !isdefined( var_3 ) )
            return 0;

        if ( self._id_00DD == var_3 )
            return 1;

        if ( !isdefined( var_4 ) )
            return 0;

        if ( self._id_00DD == var_4 )
            return 1;

        if ( !isdefined( var_5 ) )
            return 0;

        if ( self._id_00DD == var_5 )
            return 1;

        if ( !isdefined( var_6 ) )
            return 0;

        if ( self._id_00DD == var_6 )
            return 1;

        if ( !isdefined( var_7 ) )
            return 0;

        if ( self._id_00DD == var_7 )
            return 1;

        if ( !isdefined( var_8 ) )
            return 0;

        if ( self._id_00DD == var_8 )
            return 1;

        if ( !isdefined( var_9 ) )
            return 0;

        if ( self._id_00DD == var_9 )
            return 1;

        if ( !isdefined( var_10 ) )
            return 0;

        if ( self._id_00DD == var_10 )
            return 1;
    }

    return _id_4D6E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

_id_4D6E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    if ( !isdefined( self._id_4D46 ) )
        return 0;

    if ( !isdefined( var_0 ) )
        return 0;

    if ( self._id_4D46 == var_0 )
        return 1;

    if ( !isdefined( var_1 ) )
        return 0;

    if ( self._id_4D46 == var_1 )
        return 1;

    if ( !isdefined( var_2 ) )
        return 0;

    if ( self._id_4D46 == var_2 )
        return 1;

    if ( !isdefined( var_3 ) )
        return 0;

    if ( self._id_4D46 == var_3 )
        return 1;

    if ( !isdefined( var_4 ) )
        return 0;

    if ( self._id_4D46 == var_4 )
        return 1;

    if ( !isdefined( var_5 ) )
        return 0;

    if ( self._id_4D46 == var_5 )
        return 1;

    if ( !isdefined( var_6 ) )
        return 0;

    if ( self._id_4D46 == var_6 )
        return 1;

    if ( !isdefined( var_7 ) )
        return 0;

    if ( self._id_4D46 == var_7 )
        return 1;

    if ( !isdefined( var_8 ) )
        return 0;

    if ( self._id_4D46 == var_8 )
        return 1;

    if ( !isdefined( var_9 ) )
        return 0;

    if ( self._id_4D46 == var_9 )
        return 1;

    if ( !isdefined( var_10 ) )
        return 0;

    if ( self._id_4D46 == var_10 )
        return 1;

    return 0;
}

_id_9D74( var_0 )
{
    var_1 = "MOD_RIFLE_BULLET MOD_PISTOL_BULLET MOD_HEAD_SHOT";

    if ( issubstr( var_1, var_0 ) )
        return 1;

    return 0;
}

_id_9EB4( var_0 )
{
    return var_0.type == "Cover Left";
}

_id_9EB7( var_0 )
{
    return var_0.type == "Cover Right";
}

_id_9EB1( var_0 )
{
    return _id_9EB2( var_0 ) || _id_9EB8( var_0 );
}

_id_9EB2( var_0 )
{
    return var_0.type == "Cover Stand 3D" || var_0.type == "Cover 3D";
}

_id_9EB8( var_0 )
{
    return var_0.type == "Exposed 3D" || var_0.type == "Path 3D";
}

_id_9EB3( var_0 )
{
    return var_0.type == "Cover Crouch" || var_0.type == "Cover Crouch Window" || var_0.type == "Conceal Crouch";
}

_id_152F( var_0 )
{
    return abs( angleclamp180( var_0 ) );
}

_id_7DA7( var_0 )
{
    var_1 = _id_824D( var_0 );
    var_2 = distance( self.origin, var_0 );

    if ( var_2 > 3 )
    {
        var_3 = atan( -3 / var_2 );
        var_1 -= var_3;
    }

    var_1 = angleclamp180( var_1 );
    return var_1;
}

_id_824D( var_0 )
{
    if ( _id_167E() )
    {
        var_1 = anglestoforward( self.angles );
        var_2 = rotatepointaroundvector( var_1, var_0 - self.origin, self.angles[2] * -1 );
        var_0 = var_2 + self.origin;
    }

    var_3 = _id_8246( var_0 ) - self.angles[1];
    var_3 = angleclamp180( var_3 );
    return var_3;
}

_id_8246( var_0 )
{
    return vectortoyaw( var_0 - self.origin );
}

_id_7DA6( var_0 )
{
    var_1 = _id_824C( var_0 );
    var_2 = distance( self.origin, var_0 );

    if ( var_2 > 3 )
    {
        var_3 = atan( -3 / var_2 );
        var_1 -= var_3;
    }

    var_1 = angleclamp180( var_1 );
    return var_1;
}

_id_824C( var_0 )
{
    var_1 = var_0 - self.origin;
    var_2 = rotatevectorinverted( var_1, self.angles );
    var_3 = vectortoyaw( var_2 );
    var_4 = angleclamp180( var_3 );
    return var_4;
}

_id_7DA4( var_0 )
{
    var_1 = _id_8066( var_0 );
    var_2 = distance( self.origin, var_0 );

    if ( var_2 > 3 )
    {
        var_3 = atan( -3 / var_2 );
        var_1 -= var_3;
    }

    var_1 = angleclamp180( var_1 );
    return var_1;
}

_id_8066( var_0 )
{
    var_1 = var_0 - self.origin;
    var_2 = rotatevectorinverted( var_1, self.angles );
    var_3 = _func_2D1( var_2 );
    var_4 = angleclamp180( var_3 );
    return var_4;
}

_id_167F()
{
    return _id_9CEE( self._id_02A6 );
}

_id_167E()
{
    return _id_167F();
}

_id_8094( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
    {
        if ( !isdefined( var_2 ) )
            return 0;

        return _id_7DA7( var_2 );
    }

    var_3 = ( 0, 0, 0 );

    if ( isplayer( var_1 ) )
        var_3 = var_1 _meth_816B();
    else if ( isai( var_1 ) )
        var_3 = var_1._id_0381;

    var_4 = var_1.origin + var_3 * var_0;
    return _id_7DA7( var_4 );
}

_id_8093( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
    {
        if ( !isdefined( var_2 ) )
            return 0;

        return _id_7DA6( var_2 );
    }

    var_3 = ( 0, 0, 0 );

    if ( isplayer( var_1 ) )
        var_3 = var_1 _meth_816B();
    else if ( isai( var_1 ) )
        var_3 = var_1._id_0381;

    var_4 = var_1.origin + var_3 * var_0;
    return _id_7DA6( var_4 );
}

_id_8092( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
    {
        if ( !isdefined( var_2 ) )
            return 0;

        return _id_7DA4( var_2 );
    }

    var_3 = ( 0, 0, 0 );

    if ( isplayer( var_1 ) )
        var_3 = var_1 _meth_816B();
    else if ( isai( var_1 ) )
        var_3 = var_1._id_0381;

    var_4 = var_1.origin + var_3 * var_0;
    return _id_7DA4( var_4 );
}

_id_B616()
{
    var_0 = [ "mars_killstreak", "iw7_jackal_support_designator" ];

    if ( array_contains( var_0, level.player getcurrentweapon() ) )
        return 1;

    if ( level.player _meth_81C4() )
        return 1;

    if ( level.player _meth_81C3() )
    {
        if ( array_contains( var_0, level.player getcurrentweapon() ) )
            return 1;
    }

    return 0;
}

_id_1390D()
{
    if ( !isdefined( self._id_00DE ) || self._id_00DE != "MOD_MELEE" )
        return 0;

    if ( !isdefined( self._id_00E2 ) || weapontype( self._id_00E2 ) != "shield" )
        return 0;

    return 1;
}

_id_9CEE( var_0 )
{
    if ( isdefined( var_0 ) && var_0 )
        return 1;

    return 0;
}

_id_D11B()
{
    if ( isdefined( level.player _meth_8473() ) )
        return 1;
    else
        return 0;
}

_id_F315()
{
    if ( !isdefined( level.createfx_enabled ) )
        level.createfx_enabled = getdvar( "createfx" ) != "";
}

_id_6E3F( var_0, var_1, var_2 )
{
    wait( var_1 );
    _id_6E3E( var_0, var_2 );
}

_id_C0A5( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_4 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3, var_4 );

        return;
    }

    if ( isdefined( var_3 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2, var_3 );

        return;
    }

    if ( isdefined( var_2 ) )
    {
        foreach ( var_6 in var_0 )
            call [[ var_1 ]]( var_6, var_2 );

        return;
    }

    foreach ( var_6 in var_0 )
        call [[ var_1 ]]( var_6 );
}

_id_6E27( var_0 )
{

}

_id_6E52( var_0, var_1 )
{
    for (;;)
    {
        if ( _id_6E25( var_0 ) )
            return;

        if ( _id_6E25( var_1 ) )
            return;

        level _id_13762( var_0, var_1 );
    }
}

_id_6E53( var_0, var_1 )
{
    for (;;)
    {
        if ( _id_6E25( var_0 ) )
            return var_0;

        if ( _id_6E25( var_1 ) )
            return var_1;

        var_2 = level _id_13734( var_0, var_1 );
        return var_2;
    }
}

_id_6E4E( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = [];

    if ( isdefined( var_5 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
        var_6[var_6.size] = var_3;
        var_6[var_6.size] = var_4;
        var_6[var_6.size] = var_5;
    }
    else if ( isdefined( var_4 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
        var_6[var_6.size] = var_3;
        var_6[var_6.size] = var_4;
    }
    else if ( isdefined( var_3 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
        var_6[var_6.size] = var_3;
    }
    else if ( isdefined( var_2 ) )
    {
        var_6[var_6.size] = var_0;
        var_6[var_6.size] = var_1;
        var_6[var_6.size] = var_2;
    }
    else if ( isdefined( var_1 ) )
    {
        _id_6E52( var_0, var_1 );
        return;
    }
    else
        return;

    for (;;)
    {
        for ( var_7 = 0; var_7 < var_6.size; var_7++ )
        {
            if ( _id_6E25( var_6[var_7] ) )
                return;
        }

        level waittill_any( var_0, var_1, var_2, var_3, var_4, var_5 );
    }
}

_id_6E4F( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = [];

    if ( isdefined( var_4 ) )
    {
        var_5[var_5.size] = var_0;
        var_5[var_5.size] = var_1;
        var_5[var_5.size] = var_2;
        var_5[var_5.size] = var_3;
        var_5[var_5.size] = var_4;
    }
    else if ( isdefined( var_3 ) )
    {
        var_5[var_5.size] = var_0;
        var_5[var_5.size] = var_1;
        var_5[var_5.size] = var_2;
        var_5[var_5.size] = var_3;
    }
    else if ( isdefined( var_2 ) )
    {
        var_5[var_5.size] = var_0;
        var_5[var_5.size] = var_1;
        var_5[var_5.size] = var_2;
    }
    else if ( isdefined( var_1 ) )
    {
        var_6 = _id_6E53( var_0, var_1 );
        return var_6;
    }
    else
        return;

    for (;;)
    {
        for ( var_7 = 0; var_7 < var_5.size; var_7++ )
        {
            if ( _id_6E25( var_5[var_7] ) )
                return var_5[var_7];
        }

        var_6 = level _id_13734( var_0, var_1, var_2, var_3, var_4 );
        return var_6;
    }
}

_id_6E4D( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0 ) )
        _id_6E4C( var_0 );

    if ( isdefined( var_1 ) )
        _id_6E4C( var_1 );

    if ( isdefined( var_2 ) )
        _id_6E4C( var_2 );

    if ( isdefined( var_3 ) )
        _id_6E4C( var_3 );
}

_id_6E59( var_0, var_1 )
{
    var_2 = var_1 * 1000;
    var_3 = gettime();

    for (;;)
    {
        if ( _id_6E25( var_0 ) )
            break;

        if ( gettime() >= var_3 + var_2 )
            break;

        var_4 = var_2 - ( gettime() - var_3 );
        var_5 = var_4 / 1000;
        _id_135D4( var_0, var_5 );
    }
}

_id_6E5C( var_0, var_1 )
{
    var_2 = gettime();

    for (;;)
    {
        if ( !_id_6E25( var_0 ) )
            break;

        if ( gettime() >= var_2 + var_1 * 1000 )
            break;

        _id_135D4( var_0, var_1 );
    }
}

_id_135D4( var_0, var_1 )
{
    level endon( var_0 );
    wait( var_1 );
}

_id_C0A6( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    thread _id_C0AB( var_1, var_0, var_2, var_3, var_4, var_5 );
}

_id_C0AB( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    wait( var_1 );

    if ( isdefined( var_5 ) )
        call [[ var_0 ]]( var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        call [[ var_0 ]]( var_2, var_3, var_4 );
    else if ( isdefined( var_3 ) )
        call [[ var_0 ]]( var_2, var_3 );
    else if ( isdefined( var_2 ) )
        call [[ var_0 ]]( var_2 );
    else
        call [[ var_0 ]]();
}

_id_7CCF( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self._id_0334;

    var_1 = getentarray( var_0, "targetname" );

    if ( var_1.size > 0 )
        return var_1;

    if ( _id_9F64() )
    {
        var_1 = call [[ level._id_7FF3 ]]( var_0, "targetname" );

        if ( var_1.size > 0 )
            return var_1;
    }

    var_1 = _id_8180( var_0, "targetname" );

    if ( var_1.size > 0 )
        return var_1;

    var_1 = getvehiclenodearray( var_0, "targetname" );

    if ( var_1.size > 0 )
        return var_1;
}

_id_C9CF()
{
    scripts\common\createfx::_id_10FF7();
}

_id_107CE( var_0, var_1 )
{
    if ( !isdefined( var_1 ) && isdefined( self.angles ) )
        var_1 = self.angles;

    if ( !isdefined( var_0 ) && isdefined( self.origin ) )
        var_0 = self.origin;
    else if ( !isdefined( var_0 ) )
        var_0 = ( 0, 0, 0 );

    var_2 = spawn( "script_origin", var_0 );

    if ( isdefined( var_1 ) )
        var_2.angles = var_1;

    return var_2;
}

_id_1C4F( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55D1 ) )
            self._id_55D1 = 0;
        else
            self._id_55D1--;

        if ( !self._id_55D1 )
            self _meth_800E( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55D1 ) )
            self._id_55D1 = 0;

        self._id_55D1++;
        self _meth_800E( 0 );
    }
}

_id_1C62( var_0, var_1 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55DE ) )
            self._id_55DE = 0;
        else
            self._id_55DE--;

        if ( !self._id_55DE )
            self _meth_8471( 1 );
    }
    else
    {
        if ( !isdefined( self._id_55DE ) )
            self._id_55DE = 0;

        self._id_55DE++;
        self _meth_8471( 0 );

        if ( !isdefined( var_1 ) || !var_1 )
            self _meth_8545();
    }
}

_id_1C3A( var_0 )
{
    if ( var_0 )
    {
        if ( !isdefined( self._id_55C1 ) )
            self._id_55C1 = 0;
        else
            self._id_55C1--;

        if ( !self._id_55C1 )
            self _meth_80C9();
    }
    else
    {
        if ( !isdefined( self._id_55C1 ) )
            self._id_55C1 = 0;

        self._id_55C1++;
        self _meth_809C();
    }
}

_id_725F()
{
    self._id_55E6 = 0;
    self enableweapons();
}

_id_725D()
{
    self._id_55C8 = 0;
    self _meth_800C( 1 );
}

_id_725E()
{
    self._id_55D5 = 0;
    self _meth_800F( 1 );
}

_id_7B26( var_0 )
{
    var_1 = getentarray( var_0, "script_noteworthy" );

    if ( var_1.size > 0 )
        return var_1;

    if ( _id_9F64() )
    {
        var_1 = call [[ level._id_7FF3 ]]( var_0, "script_noteworthy" );

        if ( var_1.size > 0 )
            return var_1;
    }

    var_1 = _id_8180( var_0, "script_noteworthy" );

    if ( var_1.size > 0 )
        return var_1;

    var_1 = getvehiclenodearray( var_0, "script_noteworthy" );

    if ( var_1.size > 0 )
        return var_1;
}

_id_78F6( var_0 )
{
    var_1 = [];
    var_2 = 0;

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_2 += var_0[var_3];
        var_1[var_3] = var_2;
    }

    return var_1;
}

_id_1352A()
{

}

_id_9DA3()
{
    if ( !isdefined( self._id_010C ) )
        return 0;

    if ( !issentient( self._id_010C ) )
        return 1;

    if ( self _meth_805F( self._id_010C ) )
        return 1;

    var_0 = self _meth_81DB( self._id_010C );

    if ( var_0 == 0 )
        return 0;

    var_1 = gettime() - var_0;

    if ( var_1 > 10000 )
        return 0;

    if ( distancesquared( self._id_010C.origin, self.origin ) > 4194304 )
        return 0;

    return 1;
}

_id_7B25( var_0, var_1 )
{
    var_2 = getnotetracktimes( var_0, var_1 );
    var_3 = getanimlength( var_0 );
    return var_2[0] * var_3;
}

_id_BD6A( var_0 )
{
    return var_0 * 17.6;
}

_id_9B3C( var_0 )
{
    return var_0 * 0.056818;
}

_id_42A1( var_0, var_1, var_2, var_3 )
{
    var_4 = var_0 - var_2;
    var_5 = var_3 - var_2;

    if ( abs( var_5[0] ) < 0.000001 && abs( var_5[1] ) < 0.000001 && abs( var_5[2] ) < 0.000001 )
        return undefined;

    var_6 = var_1 - var_0;

    if ( abs( var_6[0] ) < 0.000001 && abs( var_6[1] ) < 0.000001 && abs( var_6[2] ) < 0.000001 )
        return undefined;

    var_7 = var_4[0] * var_5[0] + var_4[1] * var_5[1] + var_4[2] * var_5[2];
    var_8 = var_5[0] * var_6[0] + var_5[1] * var_6[1] + var_5[2] * var_6[2];
    var_9 = var_4[0] * var_6[0] + var_4[1] * var_6[1] + var_4[2] * var_6[2];
    var_10 = var_5[0] * var_5[0] + var_5[1] * var_5[1] + var_5[2] * var_5[2];
    var_11 = var_6[0] * var_6[0] + var_6[1] * var_6[1] + var_6[2] * var_6[2];
    var_12 = var_11 * var_10 - var_8 * var_8;

    if ( abs( var_12 ) < 0.000001 )
        return undefined;

    var_13 = var_7 * var_8 - var_9 * var_10;
    var_14 = var_13 / var_12;
    var_15 = ( var_7 + var_8 * var_14 ) / var_10;
    var_16 = var_0 + var_14 * var_6;
    var_17 = var_2 + var_15 * var_5;
    var_18 = [ var_16, var_17, distance( var_16, var_17 ) ];
    return var_18;
}

_id_42A2( var_0, var_1, var_2, var_3 )
{
    var_4 = var_1 - var_0;
    var_5 = var_3 - var_2;
    var_6 = var_0 - var_2;
    var_7 = vectordot( var_4, var_4 );
    var_8 = vectordot( var_4, var_5 );
    var_9 = vectordot( var_5, var_5 );
    var_10 = vectordot( var_4, var_6 );
    var_11 = vectordot( var_5, var_6 );
    var_12 = var_7 * var_9 - var_8 * var_8;
    var_13 = var_12;
    var_14 = var_12;
    var_15 = 0;
    var_16 = 0;
    var_17 = 0;
    var_18 = 0;

    if ( var_12 < 0.00000001 )
    {
        var_16 = 0;
        var_13 = 1;
        var_18 = var_11;
        var_14 = var_9;
    }
    else
    {
        var_16 = var_8 * var_11 - var_9 * var_10;
        var_18 = var_7 * var_11 - var_8 * var_10;

        if ( var_16 < 0.0 )
        {
            var_16 = 0;
            var_18 = var_11;
            var_14 = var_9;
        }
        else if ( var_16 > var_13 )
        {
            var_16 = var_13;
            var_18 = var_11 + var_8;
            var_14 = var_9;
        }
    }

    if ( var_18 < 0.0 )
    {
        var_18 = 0.0;

        if ( var_10 * -1 < 0.0 )
            var_16 = 0.0;
        else if ( var_10 * -1 > var_7 )
            var_16 = var_13;
        else
        {
            var_16 = var_10 * -1;
            var_13 = var_7;
        }
    }
    else if ( var_18 > var_14 )
    {
        var_18 = var_14;

        if ( var_8 - var_10 < 0.0 )
            var_16 = 0;
        else if ( var_8 - var_10 > var_7 )
            var_16 = var_13;
        else
        {
            var_16 = var_8 - var_10;
            var_13 = var_7;
        }
    }

    if ( abs( var_16 ) > 0.00000001 )
        var_15 = var_16 / var_13;

    if ( abs( var_18 ) > 0.00000001 )
        var_17 = var_18 / var_14;

    var_19 = var_0 + var_15 * var_4;
    var_20 = var_2 + var_17 * var_5;
    var_21 = [ var_19, var_20, distance( var_19, var_20 ) ];
    return var_21;
}

getcamotablecolumnindex( var_0 )
{
    switch ( var_0 )
    {
        case "index":
            return 0;
        case "ref":
            return 1;
        case "type":
            return 2;
        case "target_material":
            return 3;
        case "tint":
            return 4;
        case "atlas_dims":
            return 5;
        case "name":
            return 6;
        case "image":
            return 7;
        case "weapon_index":
            return 8;
        case "bot_valid":
            return 9;
        case "description":
            return 10;
        case "category":
            return 11;
        default:
            return undefined;
    }
}

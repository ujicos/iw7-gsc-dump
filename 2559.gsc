// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_006E( var_0, var_1, var_2, var_3 )
{
    var_4 = anim.invalid;
    var_5 = undefined;
    var_6 = level._id_119E[var_0];
    var_7 = var_6._id_1581[var_1];
    var_4 = [[ var_7 ]]( var_2 );

    if ( !isdefined( var_4 ) )
        var_4 = 3;

    return var_4;
}

_id_0085( var_0 )
{
    _func_2BA( var_0 );
}

_id_0084( var_0, var_1, var_2, var_3 )
{
    _func_2B8( var_0, var_1, var_2, var_3 );
}

_id_0080( var_0 )
{
    return _func_2BC( var_0 );
}

_id_0082( var_0, var_1, var_2, var_3, var_4 )
{
    _func_2B9( var_0, var_1, var_2, var_3, var_4 );
}

_id_0083( var_0, var_1, var_2, var_3, var_4 )
{
    _func_2B9( var_0, var_1, var_2, var_3, var_4 );
}

_id_007F()
{
    _func_2BB();
}

_id_0086()
{
    self _meth_84B3();
}

_id_0081( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    _func_2BD( var_0, var_1, var_2, var_3, var_4, var_5 );
}

_id_007E( var_0, var_1, var_2, var_3 )
{
    var_4 = anim.invalid;
    var_5 = gettime();

    if ( isdefined( var_3 ) )
    {
        var_6 = [[ var_3 ]]();
        var_4 = [[ var_1 ]]( var_2, var_6 );
    }
    else
        var_4 = [[ var_1 ]]( var_2 );

    if ( !isdefined( var_4 ) )
        return 3;

    if ( var_4 == anim.failure )
        return 0;
    else if ( var_4 == anim.success )
        return 1;
    else if ( var_4 == anim.running )
        return 2;
    else
        return 3;
}

_id_007C( var_0 )
{

}

_id_007D( var_0 )
{

}

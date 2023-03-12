// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_967B()
{
    level._id_11B7._id_C6C0 = [];
    _id_1807( "string", "fxid", "FX id", "nil", "fx" );
    _id_1807( "float", "delay", "Repeat rate/start delay", 0.5, "fx" );
    _id_1807( "string", "flag", "Flag", "nil", "exploder" );

    if ( !level._id_BD5D )
    {
        _id_1807( "string", "firefx", "2nd FX id", "nil", "exploder" );
        _id_1807( "float", "firefxdelay", "2nd FX id repeat rate", 0.5, "exploder" );
        _id_1807( "float", "firefxtimeout", "2nd FX timeout", 5, "exploder" );
        _id_1807( "string", "firefxsound", "2nd FX soundalias", "nil", "exploder" );
        _id_1807( "float", "damage", "Radius damage", 150, "exploder" );
        _id_1807( "float", "damage_radius", "Radius of radius damage", 250, "exploder" );
        _id_1807( "string", "earthquake", "Earthquake", "nil", "exploder" );
        _id_1807( "string", "ender", "Level notify for ending 2nd FX", "nil", "exploder" );
    }

    _id_1807( "float", "delay_min", "Minimimum time between repeats", 1, "soundfx_interval" );
    _id_1807( "float", "delay_max", "Maximum time between repeats", 2, "soundfx_interval" );
    _id_1807( "int", "repeat", "Number of times to repeat", 5, "exploder" );
    _id_1807( "string", "exploder", "Exploder", "1", "exploder" );
    _id_1807( "string", "soundalias", "Soundalias", "nil", "all" );
    _id_1807( "string", "loopsound", "Loopsound", "nil", "exploder" );
    _id_1807( "int", "reactive_radius", "Reactive Radius", 100, "reactive_fx", ::_id_9909 );

    if ( !level._id_BD5D )
    {
        _id_1807( "string", "rumble", "Rumble", "nil", "exploder" );
        _id_1807( "int", "stopable", "Can be stopped from script", "1", "all" );
    }

    level._id_5FE0 = 0;
    level._id_5FE1 = 10;

    if ( level._id_BD5D )
        level._id_5FE1 = 6;

    level._id_49CC = [];
    level._id_49CC["all"] = [];
    level._id_49CC["all"]["exploder"] = 1;
    level._id_49CC["all"]["oneshotfx"] = 1;
    level._id_49CC["all"]["loopfx"] = 1;
    level._id_49CC["all"]["soundfx"] = 1;
    level._id_49CC["all"]["soundfx_interval"] = 1;
    level._id_49CC["all"]["reactive_fx"] = 1;
    level._id_49CC["fx"] = [];
    level._id_49CC["fx"]["exploder"] = 1;
    level._id_49CC["fx"]["oneshotfx"] = 1;
    level._id_49CC["fx"]["loopfx"] = 1;

    if ( !level._id_BD5D )
        level._id_49CC["fx"]["reactive_fx"] = 1;

    level._id_49CC["exploder"] = [];
    level._id_49CC["exploder"]["exploder"] = 1;
    level._id_49CC["loopfx"] = [];
    level._id_49CC["loopfx"]["loopfx"] = 1;
    level._id_49CC["oneshotfx"] = [];
    level._id_49CC["oneshotfx"]["oneshotfx"] = 1;
    level._id_49CC["soundfx"] = [];
    level._id_49CC["soundfx"]["soundalias"] = 1;
    level._id_49CC["soundfx_interval"] = [];
    level._id_49CC["soundfx_interval"]["soundfx_interval"] = 1;
    level._id_49CC["reactive_fx"] = [];
    level._id_49CC["reactive_fx"]["reactive_fx"] = 1;
    var_0 = [];
    var_0["creation"] = ::_id_B669;
    var_0["create_oneshot"] = ::_id_B668;
    var_0["create_loopfx"] = ::_id_B668;
    var_0["change_fxid"] = ::_id_B668;
    var_0["none"] = ::_id_B66D;
    var_0["add_options"] = ::_id_B666;
    var_0["select_by_name"] = ::_id_B66E;
    level._id_11B7._id_B677 = var_0;
}

_id_B665( var_0 )
{
    return level._id_48F1 == var_0;
}

_id_F796( var_0 )
{
    level._id_48F1 = var_0;
}

_id_48F1()
{
    if ( scripts\common\createfx::_id_32DF( "escape", "x" ) )
    {
        _id_6958();
        return;
    }

    if ( isdefined( level._id_11B7._id_B677[level._id_48F1] ) )
        [[ level._id_11B7._id_B677[level._id_48F1] ]]();
}

_id_B669()
{
    if ( !isdefined( level._id_11B7._id_B669 ) )
    {
        level._id_11B7._id_B669 = [];
        var_0 = [];
        var_0["1"] = ::_id_32F4;

        if ( !level._id_BD5D )
        {
            var_0["2"] = ::_id_32F2;
            var_0["3"] = ::_id_32F3;
            var_0["4"] = ::_id_32F0;
            var_0["5"] = ::_id_32F1;
            var_0["6"] = ::_id_32F5;
        }
        else
        {
            var_0["2"] = ::_id_32F3;
            var_0["3"] = ::_id_32F0;
            var_0["4"] = ::_id_32F1;
            var_0["5"] = ::_id_32F5;
        }

        level._id_11B7._id_B669 = var_0;
    }

    foreach ( var_3, var_2 in level._id_11B7._id_B669 )
    {
        if ( scripts\common\createfx::_id_32DF( var_3 ) )
        {
            [[ var_2 ]]();
            return;
        }
    }
}

_id_32F4()
{
    _id_F796( "create_oneshot" );
    _id_5B3D();
}

_id_32F2()
{
    _id_F796( "create_loopfx" );
    _id_5B3D();
}

_id_32F3()
{
    _id_F796( "create_loopsound" );
    var_0 = scripts\common\createfx::_id_49E7();
    _id_6CCE( var_0 );
}

_id_32F0()
{
    _id_F796( "create_exploder" );
    var_0 = scripts\common\createfx::_id_49F4();
    _id_6CCE( var_0 );
}

_id_32F1()
{
    _id_F796( "create_interval_sound" );
    var_0 = scripts\common\createfx::_id_49DD();
    _id_6CCE( var_0 );
}

_id_32F5()
{
    var_0 = scripts\common\createfx::_id_4A06();
    _id_6CCE( var_0 );
}

_id_B668()
{
    if ( _id_BF33() )
    {
        _id_93F3();
        _id_5B3D();
    }
    else if ( _id_D89F() )
    {
        _id_4FBC();
        _id_5B3D();
    }

    _id_B66A();
}

_id_B66D()
{
    if ( scripts\common\createfx::_id_32DF( "m" ) )
        _id_93F3();

    _id_B667();

    if ( _id_6634() )
    {
        var_0 = _id_7A70();

        if ( !isdefined( level._id_A8A9 ) || var_0 != level._id_A8A9 )
        {
            _id_56B8( var_0 );
            level._id_A8A9 = var_0;
        }

        if ( scripts\common\createfx::_id_32DF( "a" ) )
        {
            scripts\common\createfx::_id_417F();
            _id_F796( "add_options" );
            return;
        }
    }
    else
        level._id_A8A9 = undefined;
}

_id_B666()
{
    if ( !_id_6634() )
    {
        scripts\common\createfx::_id_4152();
        _id_F796( "none" );
        return;
    }

    _id_56B7( _id_7A70() );

    if ( _id_BF33() )
        _id_93F3();
}

_id_B66E()
{
    if ( _id_BF33() )
    {
        _id_93F3();
        _id_5B3D( "Select by name" );
    }
    else if ( _id_D89F() )
    {
        _id_4FBC();
        _id_5B3D( "Select by name" );
    }

    _id_F191();
}

_id_BF33()
{
    return scripts\common\createfx::_id_32DF( "rightarrow" );
}

_id_D89F()
{
    return scripts\common\createfx::_id_32DF( "leftarrow" );
}

_id_6958()
{
    scripts\common\createfx::_id_4152();
    scripts\common\createfx::_id_414D();
    scripts\common\createfx::_id_12E21();
    _id_F796( "none" );
}

_id_B66A()
{
    var_0 = 0;
    var_1 = undefined;
    var_2 = scripts\common\createfx::_id_74C7();

    for ( var_3 = level._id_5FE0; var_3 < var_2.size; var_3++ )
    {
        var_0 += 1;
        var_4 = var_0;

        if ( var_4 == 10 )
            var_4 = 0;

        if ( scripts\common\createfx::_id_32DF( var_4 + "" ) )
        {
            var_1 = var_2[var_3];
            break;
        }

        if ( var_0 > level._id_5FE1 )
            break;
    }

    if ( !isdefined( var_1 ) )
        return;

    if ( _id_B665( "change_fxid" ) )
    {
        _id_20AF( _id_7B4E( "fxid" ), var_1 );
        level._id_5FE0 = 0;
        scripts\common\createfx::_id_4152();
        _id_F796( "none" );
        return;
    }

    var_5 = undefined;

    if ( _id_B665( "create_loopfx" ) )
        var_5 = scripts\engine\utility::_id_49E6( var_1 );

    if ( _id_B665( "create_oneshot" ) )
        var_5 = scripts\engine\utility::_id_49FA( var_1 );

    _id_6CCE( var_5 );
}

_id_6CCE( var_0 )
{
    var_0.v["angles"] = vectortoangles( var_0.v["origin"] + ( 0, 0, 100 ) - var_0.v["origin"] );

    if ( isdefined( level._effect ) && isdefined( level._effect[var_0.v["fxid"]] ) && isvfxfile( level._effect[var_0.v["fxid"]] ) )
        var_0.v["angles"] = ( 0, 0, 0 );

    var_0 scripts\common\createfx::_id_D6CF();
    scripts\common\createfx::_id_414D();
    scripts\common\createfx::_id_F19D();
    scripts\common\createfx::_id_BC69();
    scripts\common\createfx::_id_12E21();
    _id_F796( "none" );
}

_id_6634()
{
    return level._id_11B7._id_F1B3.size > 0;
}

_id_B667()
{
    if ( !level._id_11B7._id_F1B3.size )
        return;

    var_0 = 0;
    var_1 = 0;
    var_2 = _id_7A70();

    for ( var_3 = 0; var_3 < level._id_11B7._id_C6C0.size; var_3++ )
    {
        var_4 = level._id_11B7._id_C6C0[var_3];

        if ( !isdefined( var_2.v[var_4["name"]] ) )
            continue;

        var_0++;

        if ( var_0 < level._id_5FE0 )
            continue;

        var_1++;
        var_5 = var_1;

        if ( var_5 == 10 )
            var_5 = 0;

        if ( scripts\common\createfx::_id_32DF( var_5 + "" ) )
        {
            _id_D85B( var_4, var_1 );
            break;
        }

        if ( var_1 > level._id_5FE1 )
        {
            var_6 = 1;
            break;
        }
    }
}

_id_D85B( var_0, var_1 )
{
    if ( var_0["name"] == "fxid" )
    {
        _id_F796( "change_fxid" );
        _id_5B3D();
        return;
    }

    level._id_49C0 = 1;
    level._id_11B7._id_917E[var_1 + 3][0]._id_00B9 = ( 1, 1, 0 );

    if ( isdefined( var_0["input_func"] ) )
        thread [[ var_0["input_func"] ]]( var_1 + 3 );
    else
        scripts\common\createfx::_id_49B7( "To change " + var_0["description"] + " on selected entities, type /fx newvalue" );

    _id_F4AC( var_0["name"] );
    setdvar( "fx", "nil" );
}

_id_B66B()
{
    if ( getdvar( "fx" ) == "nil" )
        return;

    var_0 = _id_7C4C();
    var_1 = undefined;

    if ( var_0["type"] == "string" )
        var_1 = getdvar( "fx" );

    if ( var_0["type"] == "int" )
        var_1 = getdvarint( "fx" );

    if ( var_0["type"] == "float" )
        var_1 = getdvarfloat( "fx" );

    _id_20AF( var_0, var_1 );
}

_id_20AF( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < level._id_11B7._id_F1B3.size; var_2++ )
    {
        var_3 = level._id_11B7._id_F1B3[var_2];

        if ( _id_B3C8( var_0["mask"], var_3.v["type"] ) )
            var_3.v[var_0["name"]] = var_1;
    }

    level._id_A8A9 = undefined;
    scripts\common\createfx::_id_12E21();
    scripts\common\createfx::_id_417F();
}

_id_F4AC( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_11B7._id_C6C0.size; var_1++ )
    {
        if ( level._id_11B7._id_C6C0[var_1]["name"] != var_0 )
            continue;

        level._id_11B7._id_F1B4 = var_1;
        return;
    }
}

_id_7C4C()
{
    return level._id_11B7._id_C6C0[level._id_11B7._id_F1B4];
}

_id_B3C8( var_0, var_1 )
{
    return isdefined( level._id_49CC[var_0][var_1] );
}

_id_1807( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = [];
    var_6["type"] = var_0;
    var_6["name"] = var_1;
    var_6["description"] = var_2;
    var_6["default"] = var_3;
    var_6["mask"] = var_4;

    if ( isdefined( var_5 ) )
        var_6["input_func"] = var_5;

    level._id_11B7._id_C6C0[level._id_11B7._id_C6C0.size] = var_6;
}

_id_7B4E( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_11B7._id_C6C0.size; var_1++ )
    {
        if ( level._id_11B7._id_C6C0[var_1]["name"] == var_0 )
            return level._id_11B7._id_C6C0[var_1];
    }
}

_id_9909( var_0 )
{
    for (;;)
    {
        wait 0.05;

        if ( level.player buttonpressed( "escape" ) || level.player buttonpressed( "x" ) )
            break;

        var_1 = 0;

        if ( level.player buttonpressed( "-" ) )
            var_1 = -10;
        else if ( level.player buttonpressed( "=" ) )
            var_1 = 10;

        if ( var_1 != 0 )
        {
            foreach ( var_3 in level._id_11B7._id_F1B3 )
            {
                if ( isdefined( var_3.v["reactive_radius"] ) )
                {
                    var_3.v["reactive_radius"] += var_1;
                    var_3.v["reactive_radius"] = clamp( var_3.v["reactive_radius"], 10, 1000 );
                }
            }
        }
    }

    level._id_A8A9 = undefined;
    scripts\common\createfx::_id_12E21();
    scripts\common\createfx::_id_417F();
}

_id_56B7( var_0 )
{
    scripts\common\createfx::_id_4152();
    scripts\common\createfx::_id_F3C4( "Name: " + var_0.v["fxid"] );
    scripts\common\createfx::_id_F3C4( "Type: " + var_0.v["type"] );
    scripts\common\createfx::_id_F3C4( "Origin: " + var_0.v["origin"] );
    scripts\common\createfx::_id_F3C4( "Angles: " + var_0.v["angles"] );
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;

    if ( level._id_5FE0 >= level._id_11B7._id_C6C0.size )
        level._id_5FE0 = 0;

    for ( var_4 = 0; var_4 < level._id_11B7._id_C6C0.size; var_4++ )
    {
        var_5 = level._id_11B7._id_C6C0[var_4];

        if ( isdefined( var_0.v[var_5["name"]] ) )
            continue;

        if ( !_id_B3C8( var_5["mask"], var_0.v["type"] ) )
            continue;

        var_1++;

        if ( var_1 < level._id_5FE0 )
            continue;

        if ( var_2 >= level._id_5FE1 )
            continue;

        var_2++;
        var_6 = var_2;

        if ( var_6 == 10 )
            var_6 = 0;

        if ( scripts\common\createfx::_id_32DF( var_6 + "" ) )
        {
            _id_1725( var_5 );
            _id_B672();
            level._id_A8A9 = undefined;
            return;
        }

        scripts\common\createfx::_id_F3C4( var_6 + ". " + var_5["description"] );
    }

    if ( var_1 > level._id_5FE1 )
        scripts\common\createfx::_id_F3C4( "(->) More >" );

    scripts\common\createfx::_id_F3C4( "(x) Exit >" );
}

_id_1725( var_0 )
{
    var_1 = undefined;

    for ( var_2 = 0; var_2 < level._id_11B7._id_F1B3.size; var_2++ )
    {
        var_3 = level._id_11B7._id_F1B3[var_2];

        if ( _id_B3C8( var_0["mask"], var_3.v["type"] ) )
            var_3.v[var_0["name"]] = var_0["default"];
    }
}

_id_B672()
{
    level._id_5FE0 = 0;
    scripts\common\createfx::_id_4152();
    _id_F796( "none" );
}

_id_56B8( var_0 )
{
    if ( !_id_B665( "none" ) )
        return;

    scripts\common\createfx::_id_4152();
    scripts\common\createfx::_id_F3C4( "Name: " + var_0.v["fxid"] );
    scripts\common\createfx::_id_F3C4( "Type: " + var_0.v["type"] );
    scripts\common\createfx::_id_F3C4( "Origin: " + var_0.v["origin"] );
    scripts\common\createfx::_id_F3C4( "Angles: " + var_0.v["angles"] );

    if ( _id_6634() )
    {
        var_1 = 0;
        var_2 = 0;
        var_3 = 0;

        for ( var_4 = 0; var_4 < level._id_11B7._id_C6C0.size; var_4++ )
        {
            var_5 = level._id_11B7._id_C6C0[var_4];

            if ( !isdefined( var_0.v[var_5["name"]] ) )
                continue;

            var_1++;

            if ( var_1 < level._id_5FE0 )
                continue;

            var_2++;
            scripts\common\createfx::_id_F3C4( var_2 + ". " + var_5["description"] + ": " + var_0.v[var_5["name"]] );

            if ( var_2 > level._id_5FE1 )
            {
                var_3 = 1;
                break;
            }
        }

        if ( var_1 > level._id_5FE1 )
            scripts\common\createfx::_id_F3C4( "(->) More >" );

        scripts\common\createfx::_id_F3C4( "(a) Add >" );
        scripts\common\createfx::_id_F3C4( "(x) Exit >" );
    }
    else
    {
        var_1 = 0;
        var_3 = 0;

        for ( var_4 = 0; var_4 < level._id_11B7._id_C6C0.size; var_4++ )
        {
            var_5 = level._id_11B7._id_C6C0[var_4];

            if ( !isdefined( var_0.v[var_5["name"]] ) )
                continue;

            var_1++;
            scripts\common\createfx::_id_F3C4( var_5["description"] + ": " + var_0.v[var_5["name"]] );

            if ( var_1 > level._id_11B7._id_917B )
                break;
        }
    }
}

_id_5B3D( var_0 )
{
    scripts\common\createfx::_id_4152();
    var_1 = 0;
    var_2 = 0;
    var_3 = scripts\common\createfx::_id_74C7();

    if ( !isdefined( var_0 ) )
        var_0 = "Pick an effect";

    scripts\common\createfx::_id_F3C4( var_0 + " [" + level._id_5FE0 + " - " + var_3.size + "]:" );

    for ( var_4 = level._id_5FE0; var_4 < var_3.size; var_4++ )
    {
        var_1 += 1;
        scripts\common\createfx::_id_F3C4( var_1 + ". " + var_3[var_4] );

        if ( var_1 >= level._id_5FE1 )
        {
            var_2 = 1;
            break;
        }
    }

    if ( var_3.size > level._id_5FE1 )
    {
        scripts\common\createfx::_id_F3C4( "(->) More >" );
        scripts\common\createfx::_id_F3C4( "(<-) Previous >" );
    }
}

_id_93F3()
{
    var_0 = scripts\common\createfx::_id_74C7();

    if ( level._id_5FE0 >= var_0.size - level._id_5FE1 )
        level._id_5FE0 = 0;
    else
        level._id_5FE0 += level._id_5FE1;
}

_id_4FBC()
{
    level._id_5FE0 -= level._id_5FE1;

    if ( level._id_5FE0 < 0 )
    {
        var_0 = scripts\common\createfx::_id_74C7();
        level._id_5FE0 = var_0.size - level._id_5FE1;
    }
}

_id_F191()
{
    var_0 = 0;
    var_1 = undefined;
    var_2 = scripts\common\createfx::_id_74C7();

    for ( var_3 = level._id_5FE0; var_3 < var_2.size; var_3++ )
    {
        var_0 += 1;
        var_4 = var_0;

        if ( var_4 == 10 )
            var_4 = 0;

        if ( scripts\common\createfx::_id_32DF( var_4 + "" ) )
        {
            var_1 = var_2[var_3];
            break;
        }

        if ( var_0 > level._id_5FE1 )
            break;
    }

    if ( !isdefined( var_1 ) )
        return;

    var_5 = [];

    foreach ( var_3, var_7 in level.createfxent )
    {
        if ( issubstr( var_7.v["fxid"], var_1 ) )
            var_5[var_5.size] = var_3;
    }

    scripts\common\createfx::_id_5264();
    scripts\common\createfx::_id_F19B( var_5 );
    level._id_11B7._id_F191 = 1;
}

_id_7A70()
{
    return level._id_11B7._id_F1B3[level._id_11B7._id_F1B3.size - 1];
}

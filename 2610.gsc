// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_49AA( var_0, var_1 )
{
    var_2 = spawnstruct();

    if ( !isdefined( level.createfxent ) )
        level.createfxent = [];

    level.createfxent[level.createfxent.size] = var_2;
    var_2.v = [];
    var_2.v["type"] = var_0;
    var_2.v["fxid"] = var_1;
    var_2.v["angles"] = ( 0, 0, 0 );
    var_2.v["origin"] = ( 0, 0, 0 );
    return var_2;
}

_id_7F81()
{
    return 0.5;
}

_id_8022()
{
    return -4;
}

_id_7EA6()
{
    return 0;
}

_id_7F1C()
{
    return 0.75;
}

_id_7F1B()
{
    return 2;
}

_id_49E7()
{
    var_0 = spawnstruct();

    if ( !isdefined( level.createfxent ) )
        level.createfxent = [];

    level.createfxent[level.createfxent.size] = var_0;
    var_0.v = [];
    var_0.v["type"] = "soundfx";
    var_0.v["fxid"] = "No FX";
    var_0.v["soundalias"] = "nil";
    var_0.v["angles"] = ( 0, 0, 0 );
    var_0.v["origin"] = ( 0, 0, 0 );
    var_0.v["server_culled"] = 1;

    if ( getdvar( "serverCulledSounds" ) != "1" )
        var_0.v["server_culled"] = 0;

    return var_0;
}

_id_49DD()
{
    var_0 = _id_49E7();
    var_0.v["type"] = "soundfx_interval";
    var_0.v["delay_min"] = _id_7F1C();
    var_0.v["delay_max"] = _id_7F1B();
    return var_0;
}

_id_49F4()
{
    if ( !isdefined( level.createfxent ) )
        level.createfxent = [];

    var_0 = _id_49F5();
    level.createfxent[level.createfxent.size] = var_0;
    return var_0;
}

_id_49F5( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        var_0 = spawnstruct();
        var_0.v = [];
    }

    var_0.v["type"] = "exploder";
    var_0.v["exploder_type"] = "normal";

    if ( !isdefined( var_0.v["fxid"] ) )
        var_0.v["fxid"] = "No FX";

    if ( !isdefined( var_0.v["soundalias"] ) )
        var_0.v["soundalias"] = "nil";

    if ( !isdefined( var_0.v["loopsound"] ) )
        var_0.v["loopsound"] = "nil";

    if ( !isdefined( var_0.v["angles"] ) )
        var_0.v["angles"] = ( 0, 0, 0 );

    if ( !isdefined( var_0.v["origin"] ) )
        var_0.v["origin"] = ( 0, 0, 0 );

    if ( !isdefined( var_0.v["exploder"] ) )
        var_0.v["exploder"] = 1;

    if ( !isdefined( var_0.v["flag"] ) )
        var_0.v["flag"] = "nil";

    if ( !isdefined( var_0.v["delay"] ) || var_0.v["delay"] < 0 )
        var_0.v["delay"] = _id_7EA6();

    return var_0;
}

_id_49AF( var_0, var_1 )
{
    var_2 = scripts\engine\utility::_id_49AE( var_0 );
    var_2.v["exploder"] = var_1;
    return var_2;
}

_id_4A06( var_0 )
{
    var_1 = spawnstruct();

    if ( !isdefined( level.createfxent ) )
        level.createfxent = [];

    level.createfxent[level.createfxent.size] = var_1;
    var_1.v = [];
    var_1.v["origin"] = ( 0, 0, 0 );
    var_1.v["reactive_radius"] = 350;

    if ( isdefined( var_0 ) )
        var_1.v["fxid"] = var_0;
    else
        var_1.v["fxid"] = "No FX";

    var_1.v["type"] = "reactive_fx";
    var_1.v["soundalias"] = "nil";
    return var_1;
}

_id_F4AD( var_0, var_1 )
{
    if ( isdefined( level._id_49C2 ) )
        var_0 += level._id_49C2;

    self.v["origin"] = var_0;
    self.v["angles"] = var_1;
}

_id_F3BD()
{
    self.v["up"] = anglestoup( self.v["angles"] );
    self.v["forward"] = anglestoforward( self.v["angles"] );
}

_id_49B9()
{
    precacheshader( "black" );
    level._id_11B7 = spawnstruct();
    level._id_11B7._id_015F = spawn( "script_origin", ( 0, 0, 0 ) );
    level._id_11B7._id_015F._id_7542 = loadfx( "vfx/core/expl/grenadeexp_default" );
    level._id_11B7._id_015F._id_10453 = "frag_grenade_explode";
    level._id_11B7._id_015F.radius = 256;
    precachemodel( "axis_guide_createfx_rot" );
    precachemodel( "axis_guide_createfx" );
    scripts\engine\utility::_id_6E39( "createfx_saving" );
    scripts\engine\utility::_id_6E39( "createfx_started" );

    if ( !isdefined( level._id_49B4 ) )
        level._id_49B4 = [];

    level._id_49C1 = 0;
    wait 0.05;
    level notify( "createfx_common_done" );
}

_id_965E()
{
    level._id_11B7._id_F1BE = 0;
    level._id_11B7._id_F1BC = 0;
    level._id_11B7._id_F1BD = 0;
    level._id_11B7._id_F1C0 = 0;
    level._id_11B7._id_F1C1 = 0;
    level._id_11B7._id_F1C2 = 0;
    level._id_11B7._id_F1B2 = [];
    level._id_11B7._id_F1B3 = [];
    level._id_11B7._id_DCE1 = 1;
    level._id_11B7._id_10388 = 0;
    level._id_11B7._id_10386 = 0;
    level._id_11B7._id_10387 = [ 0, 90, 45, 15 ];
    level._id_11B7._id_26F8 = 0;
    level._id_11B7._id_F191 = 0;
    level._id_11B7._id_5B6F = 1;
    level._id_11B7._id_D2C7 = getdvarfloat( "g_speed" );
    _id_F54D();
}

_id_966D()
{
    level._id_11B7._id_AEF7 = [];
    level._id_11B7._id_AEF7["escape"] = 1;
    level._id_11B7._id_AEF7["BUTTON_LSHLDR"] = 1;
    level._id_11B7._id_AEF7["BUTTON_RSHLDR"] = 1;
    level._id_11B7._id_AEF7["mouse1"] = 1;
    level._id_11B7._id_AEF7["ctrl"] = 1;
}

_id_957F()
{
    var_0 = [];
    var_0["loopfx"]["selected"] = ( 1, 1, 0.2 );
    var_0["loopfx"]["highlighted"] = ( 0.4, 0.95, 1 );
    var_0["loopfx"]["default"] = ( 0.3, 0.8, 1 );
    var_0["oneshotfx"]["selected"] = ( 1, 1, 0.2 );
    var_0["oneshotfx"]["highlighted"] = ( 0.4, 0.95, 1 );
    var_0["oneshotfx"]["default"] = ( 0.3, 0.8, 1 );
    var_0["exploder"]["selected"] = ( 1, 1, 0.2 );
    var_0["exploder"]["highlighted"] = ( 1, 0.2, 0.2 );
    var_0["exploder"]["default"] = ( 1, 0.1, 0.1 );
    var_0["rainfx"]["selected"] = ( 1, 1, 0.2 );
    var_0["rainfx"]["highlighted"] = ( 0.95, 0.4, 0.95 );
    var_0["rainfx"]["default"] = ( 0.78, 0, 0.73 );
    var_0["soundfx"]["selected"] = ( 1, 1, 0.2 );
    var_0["soundfx"]["highlighted"] = ( 0.5, 1, 0.75 );
    var_0["soundfx"]["default"] = ( 0.2, 0.9, 0.2 );
    var_0["soundfx_interval"]["selected"] = ( 1, 1, 0.2 );
    var_0["soundfx_interval"]["highlighted"] = ( 0.5, 1, 0.75 );
    var_0["soundfx_interval"]["default"] = ( 0.2, 0.9, 0.2 );
    var_0["reactive_fx"]["selected"] = ( 1, 1, 0.2 );
    var_0["reactive_fx"]["highlighted"] = ( 0.5, 1, 0.75 );
    var_0["reactive_fx"]["default"] = ( 0.2, 0.9, 0.2 );
    level._id_11B7._id_43AE = var_0;
}

_id_49CB()
{
    waittillframeend;
    wait 0.05;

    if ( !isdefined( level._effect ) )
        level._effect = [];

    if ( getdvar( "createfx_map" ) == "" )
    {

    }
    else if ( getdvar( "createfx_map" ) == scripts\engine\utility::_id_7CF1() )
        [[ level._id_74CF ]]();

    _id_9599();
    scripts\common\createfxmenu::_id_967B();
    _id_962A();
    _id_9786();
    _id_965E();
    _id_966D();
    _id_957F();
    level.player setclientomnvar( "ui_hide_hud", 1 );
    setdvarifuninitialized( "createfx_filter", "" );
    setdvarifuninitialized( "createfx_vfxonly", "0" );

    if ( getdvar( "createfx_use_f4" ) == "" )
    {

    }

    if ( getdvar( "createfx_no_autosave" ) == "" )
    {

    }

    level._id_49BB = 1;
    level._id_A8A9 = undefined;
    level._id_32EF = [];
    var_0 = ( 0, 0, 0 );
    scripts\engine\utility::_id_6E3E( "createfx_started" );

    if ( !level._id_BD5D )
        var_0 = level.player.origin;

    var_1 = undefined;
    level._id_75DC = 0;
    scripts\common\createfxmenu::_id_F796( "none" );
    level._id_49C6 = 0;
    level._id_49C0 = 0;

    foreach ( var_3 in level.createfxent )
        var_3 _id_D6CF();

    thread _id_5B3A();
    var_5 = undefined;
    thread _id_49B6();

    for (;;)
    {
        var_6 = 0;
        var_7 = anglestoright( level.player getplayerangles() );
        var_8 = anglestoforward( level.player getplayerangles() );
        var_9 = anglestoup( level.player getplayerangles() );
        var_10 = 0.85;
        var_11 = var_8 * 750;
        level._id_49C8 = bullettrace( level.player geteye(), level.player geteye() + var_11, 0, undefined );
        var_12 = undefined;
        level._id_32ED = [];
        level._id_32E1 = [];
        _id_D962();
        var_13 = _id_32E0( "ctrl", "BUTTON_LSHLDR" );
        var_14 = _id_32E0( "shift" );
        var_15 = _id_32DF( "mouse1", "BUTTON_A" );
        var_16 = _id_32E0( "mouse1", "BUTTON_A" );
        scripts\common\createfxmenu::_id_48F1();
        var_17 = "F5";

        if ( getdvarint( "createfx_use_f4" ) )
            var_17 = "F4";

        if ( _id_32DF( var_17 ) )
        {

        }

        if ( getdvarint( "scr_createfx_dump" ) )
            _id_772B();

        if ( _id_32DF( "F2" ) )
            _id_119B4();

        if ( _id_32DF( "z" ) )
            _id_119B3();

        if ( _id_32DF( "ins" ) )
            _id_990C();

        if ( _id_32DF( "del" ) )
            _id_518B();

        if ( _id_32DF( "escape" ) )
            _id_417F();

        if ( _id_32DF( "space" ) )
            _id_F4A9();

        if ( _id_32DF( "u" ) )
            _id_F192();

        _id_B933();

        if ( !var_13 && !var_14 && _id_32DF( "g" ) )
        {
            _id_F190( "exploder" );
            _id_F190( "flag" );
        }

        if ( var_14 )
        {
            if ( _id_32DF( "g" ) )
                _id_846C();
        }

        if ( _id_32E0( "h", "F1" ) && !level._id_BD5D )
        {
            _id_100E3();
            wait 0.05;
            continue;
        }

        if ( _id_32DF( "BUTTON_LSTICK" ) )
            _id_4641();

        if ( _id_32DF( "BUTTON_RSTICK" ) )
            _id_C94D();

        if ( var_13 )
        {
            if ( _id_32DF( "c" ) )
                _id_4641();

            if ( _id_32DF( "v" ) )
                _id_C94D();

            if ( _id_32DF( "g" ) )
                _id_1071F();
        }

        if ( isdefined( level._id_11B7._id_F1B4 ) )
            scripts\common\createfxmenu::_id_B66B();

        for ( var_18 = 0; var_18 < level.createfxent.size; var_18++ )
        {
            var_3 = level.createfxent[var_18];
            var_19 = vectornormalize( var_3.v["origin"] - level.player.origin + ( 0, 0, 55 ) );
            var_20 = vectordot( var_8, var_19 );

            if ( var_20 < var_10 )
                continue;

            var_10 = var_20;
            var_12 = var_3;
        }

        level._id_7593 = var_12;

        if ( isdefined( var_12 ) )
        {
            if ( isdefined( var_1 ) )
            {
                if ( var_1 != var_12 )
                {
                    if ( !_id_65F2( var_1 ) )
                        var_1 thread _id_663E();

                    if ( !_id_65F2( var_12 ) )
                        var_12 thread _id_663F();
                }
            }
            else if ( !_id_65F2( var_12 ) )
                var_12 thread _id_663F();
        }

        _id_B2F9( var_12, var_15, var_16, var_13, var_7 );
        var_6 = _id_895B( var_6 );
        wait 0.05;

        if ( var_6 )
            _id_12E21();

        if ( !level._id_BD5D )
            var_0 = [[ level._id_74D0 ]]( var_0 );

        var_1 = var_12;

        if ( _id_A902( var_5 ) )
        {
            level._id_5FE0 = 0;
            _id_417F();
            scripts\common\createfxmenu::_id_F796( "none" );
        }

        if ( level._id_11B7._id_F1B3.size )
        {
            var_5 = level._id_11B7._id_F1B3[level._id_11B7._id_F1B3.size - 1];
            continue;
        }

        var_5 = undefined;
    }
}

_id_B933()
{
    var_0 = 0;
    var_1 = _id_32E0( "ctrl" );

    if ( _id_32E0( "." ) )
    {
        if ( var_1 )
        {
            if ( level._id_11B7._id_D2C7 < 190 )
                level._id_11B7._id_D2C7 = 190;
            else
                level._id_11B7._id_D2C7 += 10;
        }
        else
            level._id_11B7._id_D2C7 += 5;

        var_0 = 1;
    }
    else if ( _id_32E0( "," ) )
    {
        if ( var_1 )
        {
            if ( level._id_11B7._id_D2C7 > 190 )
                level._id_11B7._id_D2C7 = 190;
            else
                level._id_11B7._id_D2C7 -= 10;
        }
        else
            level._id_11B7._id_D2C7 -= 5;

        var_0 = 1;
    }

    if ( var_0 )
    {
        level._id_11B7._id_D2C7 = clamp( level._id_11B7._id_D2C7, 5, 500 );
        [[ level._id_74CE ]]();
        _id_F54D();
    }
}

_id_F54D()
{
    if ( level._id_BD5D )
        return;

    if ( !isdefined( level._id_11B7._id_D2CB ) )
    {
        var_0 = newhudelem();
        var_0._id_002B = "right";
        var_0._id_0142 = 1;
        var_0._id_013B = 1.2;
        var_0.alpha = 0.2;
        var_0.x = 320;
        var_0.y = 420;
        var_1 = newhudelem();
        var_1._id_002B = "left";
        var_1._id_0142 = 1;
        var_1._id_013B = 1.2;
        var_1.alpha = 0.2;
        var_1.x = 320;
        var_1.y = 420;
        var_0._id_9168 = var_1;
        level._id_11B7._id_D2CB = var_0;
    }

    level._id_11B7._id_D2CB._id_9168 setvalue( level._id_11B7._id_D2C7 );
}

_id_119B4()
{
    level._id_49BB = !level._id_49BB;
}

_id_990C()
{
    scripts\common\createfxmenu::_id_F796( "creation" );
    level._id_5FE0 = 0;
    _id_4152();
    _id_F3C4( "Pick effect type to create:" );
    _id_F3C4( "1. One Shot FX" );

    if ( !level._id_BD5D )
    {
        _id_F3C4( "2. Looping FX" );
        _id_F3C4( "3. Looping sound" );
        _id_F3C4( "4. Exploder" );
        _id_F3C4( "5. One Shot Sound" );
        _id_F3C4( "6. Reactive FX" );
    }
    else
    {
        _id_F3C4( "2. Looping sound" );
        _id_F3C4( "3. Exploder" );
        _id_F3C4( "4. One Shot Sound" );
        _id_F3C4( "5. Reactive FX" );
    }

    _id_F3C4( "(c) Cancel >" );
    _id_F3C4( "(x) Exit >" );
}

_id_9BD2( var_0, var_1 )
{
    if ( var_1 != "" )
    {
        if ( isdefined( var_0.v["type"] ) && issubstr( var_0.v["type"], var_1 ) )
            return 0;
        else if ( isdefined( var_0.v["fxid"] ) && issubstr( var_0.v["fxid"], var_1 ) )
            return 0;
        else if ( isdefined( var_0.v["soundalias"] ) && issubstr( var_0.v["soundalias"], var_1 ) )
            return 0;

        return 1;
    }

    return 0;
}

_id_B2F9( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !level._id_49BB )
        return;

    if ( level._id_11B7._id_F191 )
    {
        level._id_11B7._id_F191 = 0;
        var_0 = undefined;
    }
    else if ( _id_F193() )
        var_0 = undefined;

    for ( var_5 = 0; var_5 < level.createfxent.size; var_5++ )
    {
        var_6 = level.createfxent[var_5];

        if ( !var_6._id_5B7F )
            continue;

        if ( _id_9BD2( var_6, getdvar( "createfx_filter" ) ) )
            continue;

        var_7 = getdvarfloat( "createfx_scaleid" );

        if ( isdefined( var_0 ) && var_6 == var_0 )
        {
            if ( !scripts\common\createfxmenu::_id_6634() )
                scripts\common\createfxmenu::_id_56B8( var_6 );

            if ( var_1 )
            {
                var_8 = _id_93FF( var_5 );
                level._id_49C6 = !var_8;

                if ( !var_3 )
                {
                    var_9 = level._id_11B7._id_F1B3.size;
                    _id_414D();

                    if ( var_8 && var_9 == 1 )
                        _id_F197( var_5, var_6 );
                }

                _id_119B8( var_5, var_6 );
            }
            else if ( var_2 )
            {
                if ( var_3 )
                {
                    if ( level._id_49C6 )
                        _id_F197( var_5, var_6 );

                    if ( !level._id_49C6 )
                        _id_5265( var_5, var_6 );
                }
            }

            var_10 = "highlighted";
        }
        else
            var_10 = "default";

        if ( _id_93FF( var_5 ) )
            var_10 = "selected";

        var_6 _id_49C5( var_10, var_7, var_4 );
    }
}

_id_5B55( var_0, var_1 )
{
    var_2 = level.player getvieworigin();
    var_3 = level.player getplayerangles();
    var_4 = level._id_11B7._id_43AE[self.v["type"]][var_1];
    var_5 = 0;
    var_6 = 1;
    var_7 = ( 0, 0, 0 );
    var_8 = distancesquared( var_2, self.v["origin"] ) < 36864;

    if ( var_8 )
    {
        var_9 = distance( var_2, self.v["origin"] );
        var_10 = var_9 / 176;
        var_5 = 1 - clamp( var_10, 0.0, 1.0 );
        var_6 = clamp( var_10, 0.333, 1.0 );
        var_11 = anglestoright( var_3 ) * -4;
        var_12 = anglestoup( var_3 ) * -4.666;
        var_7 = var_11 + var_12;
    }

    if ( var_5 > 0 )
    {
        var_13 = scripts\engine\utility::within_fov( var_2, var_3, self.v["origin"], 0.422618 );

        if ( var_13 )
        {
            var_14 = 2.0;
            var_15 = 4.0;
            var_16 = anglestoforward( self.v["angles"] );
            var_16 *= ( var_15 * var_0 );
            var_17 = anglestoright( self.v["angles"] ) * -1;
            var_17 *= ( var_15 * var_0 );
            var_18 = anglestoup( self.v["angles"] );
            var_18 *= ( var_15 * var_0 );
        }
    }
}

_id_49C5( var_0, var_1, var_2 )
{
    _id_5B55( var_1, var_0 );

    if ( self._id_11763 > 0 )
    {
        var_3 = _id_7BD9();
        var_4 = var_2 * ( var_3[0].size * -2.93 );
        var_5 = level._id_11B7._id_43AE[self.v["type"]][var_0];

        if ( isdefined( self._id_9C80 ) )
            var_5 = ( 1, 0.5, 0 );

        var_6 = 15;

        foreach ( var_8 in var_3 )
            var_6 -= 13;

        if ( isdefined( self.v["reactive_radius"] ) )
        {
            if ( self.v["fxid"] == "No FX" && !getdvarint( "createfx_vfxonly" ) )
                return;
        }
    }
}

_id_7BD9()
{
    switch ( self.v["type"] )
    {
        case "reactive_fx":
            var_0[0] = "reactive sound: " + self.v["soundalias"];

            if ( !level._id_BD5D )
                var_0[1] = "reactive FX: " + self.v["fxid"];

            return var_0;
        case "soundfx_interval":
        case "soundfx":
            return [ self.v["soundalias"] ];
        default:
            return [ self.v["fxid"] ];
    }
}

_id_F192()
{
    level._id_5FE0 = 0;
    _id_4152();
    scripts\common\createfxmenu::_id_F796( "select_by_name" );
    scripts\common\createfxmenu::_id_5B3D();
}

_id_895B( var_0 )
{
    if ( level._id_11B7._id_F1B3.size > 0 )
    {
        var_0 = _id_F1B1( var_0 );

        if ( !_id_4B92( "selected_ents" ) )
        {
            _id_BF18( "selected_ents" );
            _id_F5CF( "Selected Ent Mode" );
            _id_F5CF( "Mode:", "move" );
            _id_F5CF( "Rate:", level._id_11B7._id_DCE1 );
            _id_F5CF( "Snap2Normal:", level._id_11B7._id_10388 );
            _id_F5CF( "Snap2Angle:", level._id_11B7._id_10387[level._id_11B7._id_10386] );
        }

        if ( level._id_11B7._id_26F8 && level._id_11B7._id_F1B3.size > 0 )
        {
            _id_F5CF( "Mode:", "rotate" );
            thread [[ level._id_74D2 ]]();

            if ( _id_32DF( "enter", "p" ) )
                _id_E1D4();

            if ( _id_32DF( "v" ) )
                _id_463B();

            for ( var_1 = 0; var_1 < level._id_11B7._id_F1B3.size; var_1++ )
                level._id_11B7._id_F1B3[var_1] _id_5B23();

            if ( level._id_F1C0 != 0 || level._id_F1C2 != 0 || level._id_F1C1 != 0 )
                var_0 = 1;
        }
        else
        {
            _id_F5CF( "Mode:", "move" );
            var_2 = _id_7C49();

            for ( var_1 = 0; var_1 < level._id_11B7._id_F1B3.size; var_1++ )
            {
                var_3 = level._id_11B7._id_F1B3[var_1];

                if ( isdefined( var_3._id_01F1 ) )
                    continue;

                var_3 _id_5B32();
                var_3.v["origin"] += var_2;
            }

            if ( distance( ( 0, 0, 0 ), var_2 ) > 0 )
                var_0 = 1;
        }
    }
    else
        _id_4188();

    return var_0;
}

_id_F1B1( var_0 )
{
    if ( _id_32DF( "shift", "BUTTON_X" ) )
        _id_119B0();

    _id_B934();

    if ( _id_32DF( "s" ) )
        _id_119CD();

    if ( _id_32DF( "r" ) )
        _id_119CC();

    if ( _id_32DF( "end", "l" ) )
    {
        _id_5D0B();
        var_0 = 1;
    }

    if ( _id_32DF( "tab", "BUTTON_RSHLDR" ) )
    {
        _id_BC69();
        var_0 = 1;
    }

    if ( _id_32DF( "e" ) )
    {
        _id_45F4();
        var_0 = 1;
    }

    return var_0;
}

_id_B934()
{
    var_0 = _id_32E0( "shift" );
    var_1 = _id_32E0( "ctrl" );

    if ( _id_32DF( "=" ) )
    {
        if ( var_0 )
            level._id_11B7._id_DCE1 += 1;
        else if ( var_1 )
        {
            if ( level._id_11B7._id_DCE1 < 1 )
                level._id_11B7._id_DCE1 = 1;
            else
                level._id_11B7._id_DCE1 += 10;
        }
        else
            level._id_11B7._id_DCE1 += 0.1;
    }
    else if ( _id_32DF( "-" ) )
    {
        if ( var_0 )
            level._id_11B7._id_DCE1 -= 1;
        else if ( var_1 )
        {
            if ( level._id_11B7._id_DCE1 > 1 )
                level._id_11B7._id_DCE1 = 1;
            else
                level._id_11B7._id_DCE1 = 0.1;
        }
        else
            level._id_11B7._id_DCE1 -= 0.1;
    }

    level._id_11B7._id_DCE1 = clamp( level._id_11B7._id_DCE1, 0.1, 100 );
    _id_F5CF( "Rate:", level._id_11B7._id_DCE1 );
}

_id_119B0()
{
    level._id_11B7._id_26F8 = !level._id_11B7._id_26F8;
}

_id_119CD()
{
    level._id_11B7._id_10388 = !level._id_11B7._id_10388;
    _id_F5CF( "Snap2Normal:", level._id_11B7._id_10388 );
}

_id_119CC()
{
    level._id_11B7._id_10386 += 1;

    if ( level._id_11B7._id_10386 >= level._id_11B7._id_10387.size )
        level._id_11B7._id_10386 = 0;

    _id_F5CF( "Snap2Angle:", level._id_11B7._id_10387[level._id_11B7._id_10386] );
}

_id_463B()
{
    level notify( "new_ent_selection" );

    for ( var_0 = 0; var_0 < level._id_11B7._id_F1B3.size; var_0++ )
    {
        var_1 = level._id_11B7._id_F1B3[var_0];
        var_1.v["angles"] = level._id_11B7._id_F1B3[level._id_11B7._id_F1B3.size - 1].v["angles"];
        var_1 _id_F3BD();
    }

    _id_12E21();
}

_id_E1D4()
{
    level notify( "new_ent_selection" );

    for ( var_0 = 0; var_0 < level._id_11B7._id_F1B3.size; var_0++ )
    {
        var_1 = level._id_11B7._id_F1B3[var_0];
        var_1.v["angles"] = ( 0, 0, 0 );
        var_1 _id_F3BD();
    }

    _id_12E21();
}

_id_A902( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        if ( !scripts\common\createfxmenu::_id_6634() )
            return 1;
    }
    else
        return scripts\common\createfxmenu::_id_6634();

    return var_0 != level._id_11B7._id_F1B3[level._id_11B7._id_F1B3.size - 1];
}

_id_5D0B()
{
    for ( var_0 = 0; var_0 < level._id_11B7._id_F1B3.size; var_0++ )
    {
        var_1 = level._id_11B7._id_F1B3[var_0];
        var_2 = bullettrace( var_1.v["origin"], var_1.v["origin"] + ( 0, 0, -2048 ), 0, undefined );
        var_1.v["origin"] = var_2["position"];
    }
}

_id_F4A9()
{
    level notify( "createfx_exploder_reset" );
    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_11B7._id_F1B3.size; var_1++ )
    {
        var_2 = level._id_11B7._id_F1B3[var_1];

        if ( isdefined( var_2.v["exploder"] ) )
            var_0[var_2.v["exploder"]] = 1;
    }

    var_3 = getarraykeys( var_0 );

    for ( var_1 = 0; var_1 < var_3.size; var_1++ )
        scripts\engine\utility::_id_69A3( var_3[var_1] );
}

_id_5B3A()
{
    var_0 = 0;

    if ( getdvarint( "createfx_drawdist" ) == 0 )
    {

    }

    for (;;)
    {
        var_1 = getdvarint( "createfx_drawdist" );
        var_1 *= var_1;

        for ( var_2 = 0; var_2 < level.createfxent.size; var_2++ )
        {
            var_3 = level.createfxent[var_2];
            var_3._id_5B7F = distancesquared( level.player.origin, var_3.v["origin"] ) <= var_1;
            var_0++;

            if ( var_0 > 100 )
            {
                var_0 = 0;
                wait 0.05;
            }
        }

        if ( level.createfxent.size == 0 )
            wait 0.05;
    }
}

_id_49B6()
{
    setdvarifuninitialized( "createfx_autosave_time", "300" );

    for (;;)
    {
        wait( getdvarint( "createfx_autosave_time" ) );
        scripts\engine\utility::_id_6E5A( "createfx_saving" );

        if ( getdvarint( "createfx_no_autosave" ) )
            continue;

        _id_772B( 1 );
    }
}

_id_E70F( var_0, var_1 )
{
    level endon( "new_ent_selection" );
    var_2 = 0.1;

    for ( var_3 = 0; var_3 < var_2 * 20; var_3++ )
    {
        if ( level._id_F1C0 != 0 )
            var_0 addpitch( level._id_F1C0 );
        else if ( level._id_F1C2 != 0 )
            var_0 addyaw( level._id_F1C2 );
        else
            var_0 addroll( level._id_F1C1 );

        wait 0.05;
        var_0 _id_5B23();

        for ( var_4 = 0; var_4 < level._id_11B7._id_F1B3.size; var_4++ )
        {
            var_5 = level._id_11B7._id_F1B3[var_4];

            if ( isdefined( var_5._id_01F1 ) )
                continue;

            var_5.v["origin"] = var_1[var_4].origin;
            var_5.v["angles"] = var_1[var_4].angles;
        }
    }
}

_id_518B()
{
    if ( level._id_49C0 )
    {
        _id_E087();
        return;
    }

    _id_5191();
}

_id_E087()
{
    if ( !isdefined( level._id_11B7._id_F1B4 ) )
        return;

    var_0 = level._id_11B7._id_C6C0[level._id_11B7._id_F1B4]["name"];

    for ( var_1 = 0; var_1 < level.createfxent.size; var_1++ )
    {
        var_2 = level.createfxent[var_1];

        if ( !_id_65F2( var_2 ) )
            continue;

        var_2 _id_E064( var_0 );
    }

    _id_12E21();
    _id_417F();
}

_id_E064( var_0 )
{
    self.v[var_0] = undefined;
}

_id_5191()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < level.createfxent.size; var_1++ )
    {
        var_2 = level.createfxent[var_1];

        if ( _id_65F2( var_2 ) )
        {
            if ( isdefined( var_2._id_B066 ) )
            {
                var_2._id_B066 stoploopsound();
                var_2._id_B066 delete();
            }

            if ( isdefined( var_2._id_B051 ) )
                var_2._id_B051 delete();

            var_2 notify( "stop_loop" );
            continue;
        }

        var_0[var_0.size] = var_2;
    }

    level.createfxent = var_0;
    level._id_11B7._id_F1B2 = [];
    level._id_11B7._id_F1B3 = [];
    _id_4152();
    _id_DFC8();
}

_id_BC69()
{
    var_0 = level._id_49C8["position"];

    if ( level._id_11B7._id_F1B3.size <= 0 )
        return;

    var_1 = _id_7890( level._id_11B7._id_F1B3 );
    var_2 = var_1 - var_0;

    for ( var_3 = 0; var_3 < level._id_11B7._id_F1B3.size; var_3++ )
    {
        var_4 = level._id_11B7._id_F1B3[var_3];

        if ( isdefined( var_4._id_01F1 ) )
            continue;

        var_4.v["origin"] -= var_2;

        if ( level._id_11B7._id_10388 )
        {
            if ( isdefined( level._id_49C8["normal"] ) )
                var_4.v["angles"] = vectortoangles( level._id_49C8["normal"] );
        }
    }
}

_id_45F4()
{
    if ( level._id_11B7._id_F1B3.size < 1 )
        return;

    var_0 = 0;

    foreach ( var_2 in level._id_11B7._id_F1B3 )
    {
        if ( var_2.v["type"] == "oneshotfx" )
        {
            var_0 = 1;
            _id_49F5( var_2 );
            continue;
        }
    }

    if ( var_0 )
    {
        scripts\common\createfxmenu::_id_F796( "none" );
        scripts\common\createfxmenu::_id_56B8( scripts\common\createfxmenu::_id_7A70() );
    }
}

_id_F19D()
{
    _id_F197( level.createfxent.size - 1, level.createfxent[level.createfxent.size - 1] );
}

_id_F190( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_11B7._id_F1B3 )
    {
        if ( !isdefined( var_3.v[var_0] ) )
            continue;

        var_4 = var_3.v[var_0];
        var_1[var_4] = 1;
    }

    foreach ( var_4, var_7 in var_1 )
    {
        foreach ( var_9, var_3 in level.createfxent )
        {
            if ( _id_93FF( var_9 ) )
                continue;

            if ( !isdefined( var_3.v[var_0] ) )
                continue;

            if ( var_3.v[var_0] != var_4 )
                continue;

            _id_F197( var_9, var_3 );
        }
    }

    _id_12E21();
}

_id_4641()
{
    if ( level._id_11B7._id_F1B3.size <= 0 )
        return;

    var_0 = [];

    for ( var_1 = 0; var_1 < level._id_11B7._id_F1B3.size; var_1++ )
    {
        var_2 = level._id_11B7._id_F1B3[var_1];
        var_3 = spawnstruct();
        var_3.v = var_2.v;
        var_3 _id_D6CF();
        var_0[var_0.size] = var_3;
    }

    level._id_110B2 = var_0;
}

_id_D6CF()
{
    self._id_11763 = 0;
    self._id_5B7F = 1;
}

_id_C94D()
{
    if ( !isdefined( level._id_110B2 ) )
        return;

    _id_414D();

    for ( var_0 = 0; var_0 < level._id_110B2.size; var_0++ )
        _id_1694( level._id_110B2[var_0] );

    _id_BC69();
    _id_12E21();
    level._id_110B2 = [];
    _id_4641();
}

_id_1694( var_0 )
{
    level.createfxent[level.createfxent.size] = var_0;
    _id_F19D();
}

_id_7890( var_0 )
{
    var_1 = ( 0, 0, 0 );

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1 = ( var_1[0] + var_0[var_2].v["origin"][0], var_1[1] + var_0[var_2].v["origin"][1], var_1[2] + var_0[var_2].v["origin"][2] );

    return ( var_1[0] / var_0.size, var_1[1] / var_0.size, var_1[2] / var_0.size );
}

_id_846C()
{
    var_0 = undefined;

    if ( level._id_11B7._id_F1B3.size > 0 )
        var_0 = _id_7890( level._id_11B7._id_F1B3 );
    else if ( isdefined( level._id_7593 ) )
        var_0 = level._id_7593.v["origin"];

    if ( !isdefined( var_0 ) )
        return;

    var_1 = vectortoangles( level.player.origin - var_0 );
    var_2 = var_0 + anglestoforward( var_1 ) * 200;
    level.player setorigin( var_2 + ( 0, 0, -60 ) );
    level.player setplayerangles( vectortoangles( var_0 - var_2 ) );
}

_id_65DA()
{
    self endon( "death" );

    for (;;)
    {
        _id_5B23();
        wait 0.05;
    }
}

_id_E73E()
{
    if ( level._id_F1C1 != 0 )
        return 1;

    if ( level._id_F1C0 != 0 )
        return 1;

    return level._id_F1C2 != 0;
}

_id_D8F8( var_0, var_1, var_2 )
{
    for ( var_3 = 0; var_3 < level._id_11B7._id_C6C0.size; var_3++ )
    {
        var_4 = level._id_11B7._id_C6C0[var_3];
        var_5 = var_4["name"];

        if ( !isdefined( var_0.v[var_5] ) )
            continue;

        if ( !scripts\common\createfxmenu::_id_B3C8( var_4["mask"], var_0.v["type"] ) )
            continue;

        if ( !level._id_BD5D )
        {
            if ( scripts\common\createfxmenu::_id_B3C8( "fx", var_0.v["type"] ) && var_5 == "fxid" )
                continue;

            if ( var_0.v["type"] == "exploder" && var_5 == "exploder" )
                continue;

            var_6 = var_0.v["type"] + "/" + var_5;

            if ( isdefined( level._id_11B7._id_504A[var_6] ) && level._id_11B7._id_504A[var_6] == var_0.v[var_5] )
                continue;
        }

        if ( var_4["type"] == "string" )
        {
            var_7 = var_0.v[var_5] + "";

            if ( var_7 == "nil" )
                continue;

            _id_3BE9( var_1 + "ent.v[ \"" + var_5 + "\" ] = \"" + var_0.v[var_5] + "\";" );
            continue;
        }

        _id_3BE9( var_1 + "ent.v[ \"" + var_5 + "\" ] = " + var_0.v[var_5] + ";" );
    }
}

_id_663E()
{
    self notify( "highlight change" );
    self endon( "highlight change" );

    for (;;)
    {
        self._id_11763 *= 0.85;
        self._id_11763 -= 0.05;

        if ( self._id_11763 < 0 )
            break;

        wait 0.05;
    }

    self._id_11763 = 0;
}

_id_663F()
{
    self notify( "highlight change" );
    self endon( "highlight change" );

    for (;;)
    {
        self._id_11763 += 0.05;
        self._id_11763 *= 1.25;

        if ( self._id_11763 > 1 )
            break;

        wait 0.05;
    }

    self._id_11763 = 1;
}

_id_417F()
{
    level._id_49C0 = 0;
    level._id_11B7._id_F1B4 = undefined;
    _id_E1EF();
}

_id_E1EF()
{
    for ( var_0 = 0; var_0 < level._id_11B7._id_917B; var_0++ )
        level._id_11B7._id_917E[var_0][0]._id_00B9 = ( 1, 1, 1 );
}

_id_119B8( var_0, var_1 )
{
    if ( isdefined( level._id_11B7._id_F1B2[var_0] ) )
        _id_5265( var_0, var_1 );
    else
        _id_F197( var_0, var_1 );
}

_id_F197( var_0, var_1 )
{
    if ( isdefined( level._id_11B7._id_F1B2[var_0] ) )
        return;

    _id_417F();
    level notify( "new_ent_selection" );
    var_1 thread _id_663F();
    level._id_11B7._id_F1B2[var_0] = 1;
    level._id_11B7._id_F1B3[level._id_11B7._id_F1B3.size] = var_1;
}

_id_65EE( var_0 )
{
    if ( !isdefined( level._id_7593 ) )
        return 0;

    return var_0 == level._id_7593;
}

_id_5265( var_0, var_1 )
{
    if ( !isdefined( level._id_11B7._id_F1B2[var_0] ) )
        return;

    _id_417F();
    level notify( "new_ent_selection" );
    level._id_11B7._id_F1B2[var_0] = undefined;

    if ( !_id_65EE( var_1 ) )
        var_1 thread _id_663E();

    var_2 = [];

    for ( var_3 = 0; var_3 < level._id_11B7._id_F1B3.size; var_3++ )
    {
        if ( level._id_11B7._id_F1B3[var_3] != var_1 )
            var_2[var_2.size] = level._id_11B7._id_F1B3[var_3];
    }

    level._id_11B7._id_F1B3 = var_2;
}

_id_93FF( var_0 )
{
    return isdefined( level._id_11B7._id_F1B2[var_0] );
}

_id_65F2( var_0 )
{
    for ( var_1 = 0; var_1 < level._id_11B7._id_F1B3.size; var_1++ )
    {
        if ( level._id_11B7._id_F1B3[var_1] == var_0 )
            return 1;
    }

    return 0;
}

_id_414D()
{
    for ( var_0 = 0; var_0 < level._id_11B7._id_F1B3.size; var_0++ )
    {
        if ( !_id_65EE( level._id_11B7._id_F1B3[var_0] ) )
            level._id_11B7._id_F1B3[var_0] thread _id_663E();
    }

    level._id_11B7._id_F1B2 = [];
    level._id_11B7._id_F1B3 = [];
}

_id_5B23()
{

}

_id_F2D5( var_0 )
{
    if ( !isdefined( level._id_11B7._id_0055 ) )
        level._id_11B7._id_0055 = spawn( "script_model", ( 0, 0, 0 ) );
    else if ( level._id_11B7._id_0055._id_01F1 != var_0 )
        level._id_11B7._id_0055 setmodel( var_0 );
}

_id_DFC8()
{
    if ( !isdefined( level._id_11B7._id_0055 ) )
        return;

    level._id_11B7._id_0055 delete();
}

_id_5B32()
{

}

_id_119B3()
{
    level._id_11B7._id_5B6F++;

    if ( level._id_11B7._id_5B6F > 2 )
        level._id_11B7._id_5B6F = 0;

    if ( level._id_11B7._id_5B6F != 1 )
        _id_DFC8();
}

_id_49B7( var_0 )
{
    thread _id_49B8( var_0 );
}

_id_49B8( var_0 )
{
    level notify( "new_createfx_centerprint" );
    level endon( "new_createfx_centerprint" );
    wait 4.5;
}

_id_7C49()
{
    var_0 = level.player getplayerangles()[1];
    var_1 = ( 0, var_0, 0 );
    var_2 = anglestoright( var_1 );
    var_3 = anglestoforward( var_1 );
    var_4 = anglestoup( var_1 );
    var_5 = 0;
    var_6 = level._id_11B7._id_DCE1;

    if ( _id_32EE( "kp_uparrow", "DPAD_UP" ) )
    {
        if ( level._id_F1BC < 0 )
            level._id_F1BC = 0;

        level._id_F1BC += var_6;
    }
    else if ( _id_32EE( "kp_downarrow", "DPAD_DOWN" ) )
    {
        if ( level._id_F1BC > 0 )
            level._id_F1BC = 0;

        level._id_F1BC -= var_6;
    }
    else
        level._id_F1BC = 0;

    if ( _id_32EE( "kp_rightarrow", "DPAD_RIGHT" ) )
    {
        if ( level._id_F1BD < 0 )
            level._id_F1BD = 0;

        level._id_F1BD += var_6;
    }
    else if ( _id_32EE( "kp_leftarrow", "DPAD_LEFT" ) )
    {
        if ( level._id_F1BD > 0 )
            level._id_F1BD = 0;

        level._id_F1BD -= var_6;
    }
    else
        level._id_F1BD = 0;

    if ( _id_32EE( "BUTTON_Y" ) )
    {
        if ( level._id_F1BE < 0 )
            level._id_F1BE = 0;

        level._id_F1BE += var_6;
    }
    else if ( _id_32EE( "BUTTON_B" ) )
    {
        if ( level._id_F1BE > 0 )
            level._id_F1BE = 0;

        level._id_F1BE -= var_6;
    }
    else
        level._id_F1BE = 0;

    var_7 = ( 0, 0, 0 );
    var_7 += var_3 * level._id_F1BC;
    var_7 += var_2 * level._id_F1BD;
    var_7 += var_4 * level._id_F1BE;
    return var_7;
}

_id_F2AD()
{
    var_0 = level._id_11B7._id_DCE1;
    var_1 = level._id_11B7._id_10387[level._id_11B7._id_10386];

    if ( var_1 != 0 )
        var_0 = 0;

    if ( _id_32EE( "kp_uparrow", "DPAD_UP" ) )
    {
        if ( level._id_F1C0 < 0 )
            level._id_F1C0 = 0;

        level._id_F1C0 = level._id_F1C0 + var_1 + var_0;
    }
    else if ( _id_32EE( "kp_downarrow", "DPAD_DOWN" ) )
    {
        if ( level._id_F1C0 > 0 )
            level._id_F1C0 = 0;

        level._id_F1C0 = level._id_F1C0 - var_1 - var_0;
    }
    else
        level._id_F1C0 = 0;

    if ( _id_32EE( "kp_leftarrow", "DPAD_LEFT" ) )
    {
        if ( level._id_F1C2 < 0 )
            level._id_F1C2 = 0;

        level._id_F1C2 = level._id_F1C2 + var_1 + var_0;
    }
    else if ( _id_32EE( "kp_rightarrow", "DPAD_RIGHT" ) )
    {
        if ( level._id_F1C2 > 0 )
            level._id_F1C2 = 0;

        level._id_F1C2 = level._id_F1C2 - var_1 - var_0;
    }
    else
        level._id_F1C2 = 0;

    if ( _id_32EE( "BUTTON_Y" ) )
    {
        if ( level._id_F1C1 < 0 )
            level._id_F1C1 = 0;

        level._id_F1C1 = level._id_F1C1 + var_1 + var_0;
    }
    else if ( _id_32EE( "BUTTON_B" ) )
    {
        if ( level._id_F1C1 > 0 )
            level._id_F1C1 = 0;

        level._id_F1C1 = level._id_F1C1 - var_1 - var_0;
    }
    else
        level._id_F1C1 = 0;
}

_id_12E21()
{
    var_0 = 0;

    foreach ( var_2 in level._id_11B7._id_F1B3 )
    {
        if ( var_2.v["type"] == "reactive_fx" )
            var_0 = 1;

        var_2 [[ level._id_74D3 ]]();
    }

    if ( var_0 )
        _id_DE71();
}

_id_10FF7()
{
    if ( isdefined( self._id_B051 ) )
        self._id_B051 delete();

    _id_1101A();
}

_id_1101A()
{
    self notify( "stop_loop" );
}

_id_74C7()
{
    if ( !isdefined( level._id_1247 ) )
        var_0 = getarraykeys( level._effect );
    else
    {
        var_0 = getarraykeys( level._effect );

        if ( var_0.size == level._id_1247.size )
            return level._id_1247;
    }

    var_0 = scripts\engine\utility::_id_1D3A( var_0 );
    level._id_1247 = var_0;
    return var_0;
}

_id_E2AB()
{
    _id_10FF7();
    _id_F3BD();

    switch ( self.v["type"] )
    {
        case "oneshotfx":
            scripts\common\fx::_id_496F();
            break;
        case "loopfx":
            scripts\common\fx::_id_4916();
            break;
        case "soundfx":
            scripts\common\fx::_id_4917();
            break;
        case "soundfx_interval":
            scripts\common\fx::_id_4907();
            break;
    }
}

_id_DE71()
{
    level._id_128D._id_DD56 = undefined;

    foreach ( var_1 in level.createfxent )
    {
        if ( var_1.v["type"] == "reactive_fx" )
        {
            var_1 _id_F3BD();
            var_1 scripts\common\fx::_id_1734();
        }
    }
}

_id_D978()
{
    if ( level._id_75DC )
        return;

    _id_F2AD();

    if ( !_id_E73E() )
        return;

    level._id_75DC = 1;

    if ( level._id_11B7._id_F1B3.size > 1 )
    {
        var_0 = _id_7890( level._id_11B7._id_F1B3 );
        var_1 = spawn( "script_origin", var_0 );
        var_1.v["angles"] = level._id_11B7._id_F1B3[0].v["angles"];
        var_1.v["origin"] = var_0;
        var_2 = [];

        for ( var_3 = 0; var_3 < level._id_11B7._id_F1B3.size; var_3++ )
        {
            var_2[var_3] = spawn( "script_origin", level._id_11B7._id_F1B3[var_3].v["origin"] );
            var_2[var_3].angles = level._id_11B7._id_F1B3[var_3].v["angles"];
            var_2[var_3] linkto( var_1 );
        }

        _id_E70F( var_1, var_2 );
        var_1 delete();

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
            var_2[var_3] delete();
    }
    else if ( level._id_11B7._id_F1B3.size == 1 )
    {
        var_4 = level._id_11B7._id_F1B3[0];
        var_2 = spawn( "script_origin", ( 0, 0, 0 ) );
        var_2.angles = var_4.v["angles"];

        if ( level._id_F1C0 != 0 )
            var_2 addpitch( level._id_F1C0 );
        else if ( level._id_F1C2 != 0 )
            var_2 addyaw( level._id_F1C2 );
        else
            var_2 addroll( level._id_F1C1 );

        var_4.v["angles"] = var_2.angles;
        var_2 delete();
        wait 0.05;
    }

    level._id_75DC = 0;
}

_id_1071F()
{
    playfx( level._id_11B7._id_015F._id_7542, level._id_49C8["position"] );
    level._id_11B7._id_015F playsound( level._id_11B7._id_015F._id_10453 );
    radiusdamage( level._id_49C8["position"], level._id_11B7._id_015F.radius, 50, 5, undefined, "MOD_EXPLOSIVE" );
    level notify( "code_damageradius", undefined, level._id_11B7._id_015F.radius, level._id_49C8["position"] );
}

_id_100E3()
{
    _id_4152();
    _id_F3C4( "Help:" );
    _id_F3C4( "Insert          Insert entity" );
    _id_F3C4( "L               Drop selected entities to the ground" );
    _id_F3C4( "A               Add option to the selected entities" );
    _id_F3C4( "P               Reset the rotation of the selected entities" );
    _id_F3C4( "V               Copy the angles from the most recently selected fx onto all selected fx." );
    _id_F3C4( "Delete          Kill the selected entities" );
    _id_F3C4( "ESCAPE          Cancel out of option-modify-mode, must have console open" );
    _id_F3C4( "Ctrl-C          Copy" );
    _id_F3C4( "Ctrl-V          Paste" );
    _id_F3C4( "F2              Toggle createfx dot and text drawing" );
    _id_F3C4( "F5              SAVES your work" );
    _id_F3C4( "Dpad            Move selected entitise on X/Y or rotate pitch/yaw" );
    _id_F3C4( "A button        Toggle the selection of the current entity" );
    _id_F3C4( "X button        Toggle entity rotation mode" );
    _id_F3C4( "Y button        Move selected entites up or rotate roll" );
    _id_F3C4( "B button        Move selected entites down or rotate roll" );
    _id_F3C4( "R Shoulder      Move selected entities to the cursor" );
    _id_F3C4( "L Shoulder      Hold to select multiple entites" );
    _id_F3C4( "L JoyClick      Copy" );
    _id_F3C4( "R JoyClick      Paste" );
    _id_F3C4( "N               UFO" );
    _id_F3C4( "T               Toggle Timescale FAST" );
    _id_F3C4( "Y               Toggle Timescale SLOW" );
    _id_F3C4( "[               Toggle FX Visibility" );
    _id_F3C4( "]               Toggle ShowTris" );
    _id_F3C4( "F11             Toggle FX Profile" );
}

_id_772B( var_0 )
{

}

_id_13E01( var_0, var_1, var_2, var_3 )
{
    var_4 = "\\t";
    _id_3BEB();
    _id_3BE9( "//_createfx generated. Do not touch!!" );
    _id_3BE9( "#include scripts\\common\\utility;" );
    _id_3BE9( "#include scripts\\common\\createfx;\\n" );
    _id_3BE9( "" );
    _id_3BE9( "main()" );
    _id_3BE9( "{" );
    _id_3BE9( var_4 + "// CreateFX " + var_1 + " entities placed: " + var_0.size );

    foreach ( var_6 in var_0 )
    {
        if ( level._id_49C1 > 16 )
        {
            level._id_49C1 = 0;
            wait 0.1;
        }

        level._id_49C1++;

        if ( getdvarint( "scr_map_exploder_dump" ) )
        {
            if ( !isdefined( var_6._id_01F1 ) )
                continue;
        }
        else if ( isdefined( var_6._id_01F1 ) )
            continue;

        if ( var_6.v["type"] == "oneshotfx" )
            _id_3BE9( var_4 + "ent = createOneshotEffect( \"" + var_6.v["fxid"] + "\" );" );

        if ( var_6.v["type"] == "loopfx" )
            _id_3BE9( var_4 + "ent = createLoopEffect( \"" + var_6.v["fxid"] + "\" );" );

        if ( var_6.v["type"] == "exploder" )
        {
            if ( isdefined( var_6.v["exploder"] ) && !level._id_BD5D )
                _id_3BE9( var_4 + "ent = createExploderEx( \"" + var_6.v["fxid"] + "\", \"" + var_6.v["exploder"] + "\" );" );
            else
                _id_3BE9( var_4 + "ent = createExploder( \"" + var_6.v["fxid"] + "\" );" );
        }

        if ( var_6.v["type"] == "soundfx" )
            _id_3BE9( var_4 + "ent = createLoopSound();" );

        if ( var_6.v["type"] == "soundfx_interval" )
            _id_3BE9( var_4 + "ent = createIntervalSound();" );

        if ( var_6.v["type"] == "reactive_fx" )
        {
            if ( var_1 == "fx" && var_6.v["fxid"] != "No FX" && !level._id_BD5D )
                _id_3BE9( var_4 + "ent = createReactiveEnt( \"" + var_6.v["fxid"] + "\" );" );
            else if ( var_1 == "sound" && var_6.v["fxid"] == "No FX" )
                _id_3BE9( var_4 + "ent = createReactiveEnt();" );
            else
                continue;
        }

        _id_3BE9( var_4 + "ent set_origin_and_angles( " + var_6.v["origin"] + ", " + var_6.v["angles"] + " );" );
        _id_D8F8( var_6, var_4, var_2 );
        _id_3BE9( "" );
    }

    _id_3BE9( "}" );
    _id_3BE9( " " );
    _id_3BEA( var_2, var_3, var_1 );
}

_id_49B5()
{
    var_0 = 0.1;

    foreach ( var_2 in level.createfxent )
    {
        var_3 = [];
        var_4 = [];

        for ( var_5 = 0; var_5 < 3; var_5++ )
        {
            var_3[var_5] = var_2.v["origin"][var_5];
            var_4[var_5] = var_2.v["angles"][var_5];

            if ( var_3[var_5] < var_0 && var_3[var_5] > var_0 * -1 )
                var_3[var_5] = 0;

            if ( var_4[var_5] < var_0 && var_4[var_5] > var_0 * -1 )
                var_4[var_5] = 0;
        }

        var_2.v["origin"] = ( var_3[0], var_3[1], var_3[2] );
        var_2.v["angles"] = ( var_4[0], var_4[1], var_4[2] );
    }
}

_id_78F2( var_0 )
{
    var_1 = _id_78F3( var_0 );
    var_2 = [];

    foreach ( var_5, var_4 in var_1 )
        var_2[var_5] = [];

    foreach ( var_7 in level.createfxent )
    {
        var_8 = 0;

        foreach ( var_5, var_0 in var_1 )
        {
            if ( var_7.v["type"] != var_0 )
                continue;

            var_8 = 1;
            var_2[var_5][var_2[var_5].size] = var_7;
            break;
        }
    }

    var_11 = [];

    for ( var_12 = 0; var_12 < var_1.size; var_12++ )
    {
        foreach ( var_7 in var_2[var_12] )
            var_11[var_11.size] = var_7;
    }

    return var_11;
}

_id_78F3( var_0 )
{
    var_1 = [];

    if ( var_0 == "fx" )
    {
        var_1[0] = "oneshotfx";
        var_1[1] = "loopfx";
        var_1[2] = "exploder";
        var_1[3] = "reactive_fx";
    }
    else
    {
        var_1[0] = "soundfx";
        var_1[1] = "soundfx_interval";
        var_1[2] = "reactive_fx";
    }

    return var_1;
}

_id_3DC5( var_0, var_1 )
{
    if ( var_0.v["fxid"] != "No FX" && var_1 == "fx" )
        return 1;

    if ( var_0.v["fxid"] == "No FX" && var_1 == "sound" )
        return 1;

    return 0;
}

_id_9BAD( var_0, var_1 )
{
    var_2 = _id_78F3( var_1 );

    if ( var_0.v["type"] == "reactive_fx" )
    {
        if ( _id_3DC5( var_0, var_1 ) )
            return 1;
        else
            return 0;
    }

    foreach ( var_4 in var_2 )
    {
        if ( var_0.v["type"] == var_4 )
            return 1;
    }

    return 0;
}

_id_49BF()
{
    var_0 = [];
    var_0[var_0.size] = "soundfx";
    var_0[var_0.size] = "oneshotfx";
    var_0[var_0.size] = "exploder";
    var_0[var_0.size] = "soundfx_interval";
    var_0[var_0.size] = "reactive_fx";

    if ( !level._id_BD5D )
        var_0[var_0.size] = "loopfx";

    var_1 = [];

    foreach ( var_4, var_3 in var_0 )
        var_1[var_4] = [];

    foreach ( var_6 in level.createfxent )
    {
        var_7 = 0;

        foreach ( var_4, var_9 in var_0 )
        {
            if ( var_6.v["type"] != var_9 )
                continue;

            var_7 = 1;
            var_1[var_4][var_1[var_4].size] = var_6;
            break;
        }
    }

    var_11 = [];

    for ( var_12 = 0; var_12 < var_0.size; var_12++ )
    {
        foreach ( var_6 in var_1[var_12] )
            var_11[var_11.size] = var_6;
    }

    level.createfxent = var_11;
}

_id_3BEB()
{
    scripts\engine\utility::_id_6C05();
}

_id_3BE9( var_0 )
{
    scripts\engine\utility::_id_6C03( var_0 );
}

_id_3BEA( var_0, var_1, var_2 )
{
    var_3 = 1;

    if ( var_1 != "" || var_0 )
        var_3 = 0;

    if ( scripts\engine\utility::_id_9F64() )
    {
        var_4 = scripts\engine\utility::_id_7CF1() + var_1 + "_" + var_2 + ".gsc";

        if ( var_0 )
            var_4 = "backup_" + var_2 + ".gsc";
    }
    else
    {
        var_4 = scripts\engine\utility::_id_7CF1() + var_1 + "_" + var_2 + ".gsc";

        if ( var_0 )
            var_4 = "backup.gsc";
    }

    var_5 = scripts\engine\utility::_id_7CF1();
    var_6 = _id_7BF9();
    var_7 = _id_79E2();
    scripts\engine\utility::_id_6C04( "/share/" + var_6 + "/scripts/" + var_7 + "/maps/" + var_5 + "/gen/" + var_4, var_3 );
}

_id_7BF9()
{
    if ( isdefined( level._id_49BA ) && level._id_49BA )
        return "devraw";
    else
        return "raw";
}

_id_79E2()
{
    if ( scripts\engine\utility::_id_9D9A() )
        return "cp";
    else if ( scripts\engine\utility::_id_9F64() )
        return "sp";
    else
        return "mp";
}

_id_D962()
{
    _id_16A8( "mouse1" );
    _id_16A8( "BUTTON_RSHLDR" );
    _id_16A8( "BUTTON_LSHLDR" );
    _id_16A8( "BUTTON_RSTICK" );
    _id_16A8( "BUTTON_LSTICK" );
    _id_16A8( "BUTTON_A" );
    _id_16A8( "BUTTON_B" );
    _id_16A8( "BUTTON_X" );
    _id_16A8( "BUTTON_Y" );
    _id_16A8( "DPAD_UP" );
    _id_16A8( "DPAD_LEFT" );
    _id_16A8( "DPAD_RIGHT" );
    _id_16A8( "DPAD_DOWN" );
    _id_1704( "shift" );
    _id_1704( "ctrl" );
    _id_1704( "escape" );
    _id_1704( "F1" );
    _id_1704( "F5" );
    _id_1704( "F4" );
    _id_1704( "F2" );
    _id_1704( "a" );
    _id_1704( "e" );
    _id_1704( "g" );
    _id_1704( "c" );
    _id_1704( "h" );
    _id_1704( "i" );
    _id_1704( "k" );
    _id_1704( "l" );
    _id_1704( "m" );
    _id_1704( "p" );
    _id_1704( "r" );
    _id_1704( "s" );
    _id_1704( "u" );
    _id_1704( "v" );
    _id_1704( "x" );
    _id_1704( "z" );
    _id_1704( "del" );
    _id_1704( "end" );
    _id_1704( "tab" );
    _id_1704( "ins" );
    _id_1704( "add" );
    _id_1704( "space" );
    _id_1704( "enter" );
    _id_1704( "1" );
    _id_1704( "2" );
    _id_1704( "3" );
    _id_1704( "4" );
    _id_1704( "5" );
    _id_1704( "6" );
    _id_1704( "7" );
    _id_1704( "8" );
    _id_1704( "9" );
    _id_1704( "0" );
    _id_1704( "-" );
    _id_1704( "=" );
    _id_1704( "," );
    _id_1704( "." );
    _id_1704( "[" );
    _id_1704( "]" );
    _id_1704( "leftarrow" );
    _id_1704( "rightarrow" );
    _id_1704( "uparrow" );
    _id_1704( "downarrow" );
}

_id_AEED( var_0 )
{
    if ( isdefined( level._id_11B7._id_AEF7[var_0] ) )
        return 0;

    return _id_A55F( var_0 );
}

_id_A55F( var_0 )
{
    return level._id_49C0 && isdefined( level._id_32E1[var_0] );
}

_id_16A8( var_0 )
{
    if ( _id_AEED( var_0 ) )
        return;

    if ( !isdefined( level._id_32EF[var_0] ) )
    {
        if ( level.player buttonpressed( var_0 ) )
        {
            level._id_32EF[var_0] = 1;
            level._id_32ED[var_0] = 1;
        }
    }
    else if ( !level.player buttonpressed( var_0 ) )
        level._id_32EF[var_0] = undefined;
}

_id_1704( var_0 )
{
    level._id_32E1[var_0] = 1;
    _id_16A8( var_0 );
}

_id_32EE( var_0, var_1 )
{
    return _id_32F6( var_0 ) || _id_32F6( var_1 );
}

_id_32F6( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( _id_A55F( var_0 ) )
        return 0;

    return level.player buttonpressed( var_0 );
}

_id_32E0( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        if ( isdefined( level._id_32EF[var_1] ) )
            return 1;
    }

    return isdefined( level._id_32EF[var_0] );
}

_id_32DF( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        if ( isdefined( level._id_32ED[var_1] ) )
            return 1;
    }

    return isdefined( level._id_32ED[var_0] );
}

_id_962A()
{
    level._id_11B7._id_917E = [];
    level._id_11B7._id_917B = 30;

    if ( level._id_BD5D )
        level._id_11B7._id_917B = 16;

    var_0 = [];
    var_1 = [];
    var_0[0] = 0;
    var_1[0] = 0;
    var_0[1] = 1;
    var_1[1] = 1;
    var_0[2] = -2;
    var_1[2] = 1;
    var_0[3] = 1;
    var_1[3] = -1;
    var_0[4] = -2;
    var_1[4] = -1;
    level._id_41E7 = newhudelem();
    level._id_41E7.alpha = 0;
    level._id_41E7._id_0049 = 0;

    for ( var_2 = 0; var_2 < level._id_11B7._id_917B; var_2++ )
    {
        var_3 = [];

        for ( var_4 = 0; var_4 < 1; var_4++ )
        {
            var_5 = newhudelem();
            var_5._id_002B = "left";
            var_5._id_0049 = 0;
            var_5._id_AEC4 = 0;
            var_5._id_0142 = 1;
            var_5._id_013B = 1.4;
            var_5._id_02A4 = 20 - var_4;
            var_5.alpha = 1;
            var_5.x = 0 + var_0[var_4];
            var_5.y = 60 + var_1[var_4] + var_2 * 15;

            if ( var_4 > 0 )
                var_5._id_00B9 = ( 0, 0, 0 );

            var_3[var_3.size] = var_5;
        }

        level._id_11B7._id_917E[var_2] = var_3;
    }

    var_6 = newhudelem();
    var_6._id_0049 = 0;
    var_6._id_002B = "center";
    var_6._id_AEC4 = 0;
    var_6._id_0142 = 1;
    var_6._id_013B = 1.4;
    var_6._id_02A4 = 20;
    var_6.alpha = 1;
    var_6.x = 320;
    var_6.y = 40;
    level._id_49B7 = var_6;
}

_id_9599()
{
    var_0 = newhudelem();
    var_0._id_0049 = 0;
    var_0._id_AEC4 = 0;
    var_0._id_002B = "center";
    var_0._id_002C = "middle";
    var_0._id_0142 = 1;
    var_0._id_013B = 1;
    var_0._id_02A4 = 20;
    var_0.alpha = 1;
    var_0.x = 320;
    var_0.y = 233;
}

_id_4152()
{
    level._id_41E7 clearalltextafterhudelem();

    for ( var_0 = 0; var_0 < level._id_11B7._id_917B; var_0++ )
    {
        for ( var_1 = 0; var_1 < 1; var_1++ )
        {

        }
    }

    level._id_762B = 0;
}

_id_F3C4( var_0 )
{
    for ( var_1 = 0; var_1 < 1; var_1++ )
    {

    }

    level._id_762B++;
}

_id_9786()
{
    if ( !isdefined( level._id_11B7._id_119E2 ) )
        level._id_11B7._id_119E2 = [];

    if ( !isdefined( level._id_11B7._id_119E1 ) )
        level._id_11B7._id_119E1 = 1;

    if ( !isdefined( level._id_11B7._id_119E0 ) )
        level._id_11B7._id_119E0 = "";
}

_id_BF18( var_0 )
{
    foreach ( var_3, var_2 in level._id_11B7._id_119E2 )
    {
        if ( isdefined( var_2._id_13154 ) )
            var_2._id_13154 destroy();

        var_2 destroy();
        level._id_11B7._id_119E2[var_3] = undefined;
    }

    level._id_11B7._id_119E0 = var_0;
}

_id_4B92( var_0 )
{
    return level._id_11B7._id_119E0 == var_0;
}

_id_4188()
{
    _id_BF18( "" );
}

_id_BF19( var_0 )
{
    var_1 = newhudelem();
    var_1._id_0049 = 0;
    var_1._id_002B = "left";
    var_1._id_AEC4 = 0;
    var_1._id_0142 = 1;
    var_1._id_013B = 1.2;
    var_1.alpha = 1;
    var_1.x = 0;
    var_1.y = 320 + var_0 * 15;
    return var_1;
}

_id_7D0A( var_0 )
{
    if ( isdefined( level._id_11B7._id_119E2[var_0] ) )
        return level._id_11B7._id_119E2[var_0];

    return undefined;
}

_id_F5CF( var_0, var_1 )
{
    if ( level._id_BD5D )
        return;

    var_2 = _id_7D0A( var_0 );

    if ( !isdefined( var_2 ) )
    {
        var_2 = _id_BF19( level._id_11B7._id_119E2.size );
        level._id_11B7._id_119E2[var_0] = var_2;
        var_2._id_1175C = var_0;
    }

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_2._id_13154 ) )
            var_3 = var_2._id_13154;
        else
        {
            var_3 = _id_BF19( level._id_11B7._id_119E2.size );
            var_3.x += 100;
            var_3.y = var_2.y;
            var_2._id_13154 = var_3;
        }

        if ( isdefined( var_3._id_1175C ) && var_3._id_1175C == var_1 )
            return;

        var_3._id_1175C = var_1;
    }
}

_id_F193()
{
    var_0 = getdvar( "select_by_substring" );

    if ( var_0 == "" )
        return 0;

    setdvar( "select_by_substring", "" );
    var_1 = [];

    foreach ( var_4, var_3 in level.createfxent )
    {
        if ( issubstr( var_3.v["fxid"], var_0 ) )
            var_1[var_1.size] = var_4;
    }

    if ( var_1.size == 0 )
        return 0;

    _id_5264();
    _id_F19B( var_1 );

    foreach ( var_6 in var_1 )
    {
        var_3 = level.createfxent[var_6];
        _id_F197( var_6, var_3 );
    }

    return 1;
}

_id_F19B( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        var_3 = level.createfxent[var_2];
        _id_F197( var_2, var_3 );
    }
}

_id_5264()
{
    foreach ( var_2, var_1 in level._id_11B7._id_F1B3 )
        _id_5265( var_2, var_1 );
}

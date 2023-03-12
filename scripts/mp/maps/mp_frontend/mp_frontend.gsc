// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_C573()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( !isdefined( level._id_4542 ) )
        level._id_4542 = getdvar( "consoleGame" ) == "true";

    level._id_D460 = self;

    if ( isdefined( level._id_D372 ) )
        return;

    level._id_D372 = 1;
    wait 0.5;
}

_id_3740()
{
    thread _id_C573();
    thread _id_0A78::_id_744C( ::_id_37BA );
    thread epictauntlistener();
    level thread camolistener();
}

coming_from_rig_select()
{
    if ( !isdefined( level._id_4C01 ) )
        return 0;

    return level._id_4C01 == "rig_select" || level._id_4C01 == "rig_pick" || level._id_4C01 == "rig_trait_select" || level._id_4C01 == "rig_head_select" || level._id_4C01 == "rig_taunt_select";
}

_id_81A3( var_0 )
{
    var_1 = undefined;

    switch ( var_0 )
    {
        case 0:
            var_1 = level._id_37AA;
            break;
        case 1:
            var_1 = level._id_37AC;
            break;
        case 2:
            var_1 = level._id_37AE;
            break;
        case 3:
            var_1 = level._id_37AD;
            break;
        case 4:
            var_1 = level._id_37AF;
            break;
        default:
            var_1 = level._id_37B5;
            break;
    }

    return var_1;
}

get_camera_data_by_rig_scene( var_0 )
{
    var_1 = undefined;

    switch ( var_0 )
    {
        case "rig_select":
            var_1 = level._id_37B7;
            break;
        case "rig_pick":
            var_1 = level._id_37B8;
            break;
        case "rig_trait_select":
            var_1 = level._id_37B9;
            break;
        case "rig_head_select":
            var_1 = level.camera_rig_head;
            break;
        case "rig_taunt_select":
            var_1 = level.camera_rig_taunt;
            break;
        default:
            var_1 = level._id_37B7;
            break;
    }

    return var_1;
}

_id_788A( var_0, var_1 )
{
    switch ( var_1 )
    {
        case "create_a_class":
            return var_0._id_369A;
        case "weapon_select":
            return var_0._id_13C7B;
        case "loadout_select":
            return var_0._id_AE63;
        case "rig_select":
            return var_0._id_E510;
        case "barracks":
            return var_0._id_282B;
        default:
            return var_0._id_289A;
    }
}

_id_BD64( var_0, var_1, var_2 )
{
    _id_0A78::_id_7449( var_0, var_1, 0, 1, var_2 );
}

_id_12DA1()
{
    if ( level._id_1641.shows_my_character )
    {
        level._id_3CAD.origin = level._id_1641._id_3CAA.origin;
        level._id_3CAD.angles = level._id_1641._id_3CAA.angles;
    }
}

_id_12DEB( var_0 )
{
    _id_12DA1();
    _id_12E4A();
    _id_12D9B();
}

_id_12D9B()
{
    var_0 = level._id_1623._id_525D;
    self setdepthoffield( var_0[0], var_0[1], var_0[2], var_0[3], var_0[4], var_0[5] );
}

_id_12DBB()
{
    _id_12DA1();
    _id_12E4A();
    _id_12D9B();
}

_id_12E4A()
{
    var_0 = undefined;

    if ( isdefined( level._id_1641._id_13C27 ) )
        var_0 = level._id_1641._id_13C27;
    else
    {
        var_1 = _id_81A3( level._id_4BF6 );
        var_0 = var_1._id_13C27;
    }

    level.weapon.origin = var_0.origin;
    level.weapon.angles = var_0.angles;
    level._id_13BF9.origin = var_0.origin;
    level._id_13BF9.angles = var_0.angles;
    level._id_13BFA.origin = var_0.origin;
    level._id_13BFA.angles = var_0.angles;
}

_id_37BB( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;

    if ( var_0.name == "mlg.tv" )
        return;

    if ( var_0.name == "mp_main" )
    {
        frontendscenecameracharacters( 3 );
        var_1 = level._id_37B0;
        var_2 = level._id_37B0._id_289A;
    }
    else if ( var_0.name == "rig_select" || var_0.name == "rig_pick" || var_0.name == "rig_trait_select" || var_0.name == "rig_taunt_select" || var_0.name == "rig_head_select" )
    {
        frontendscenecameracharacters( 0 );
        var_1 = get_camera_data_by_rig_scene( var_0.name );
        var_2 = var_1._id_289A;
    }
    else if ( var_0.name == "armory" )
    {
        frontendscenecameracharacters( 0 );
        var_1 = level._id_37A7;
        var_2 = level._id_37A7._id_289A;
    }
    else if ( var_0.name == "lobby_members" )
    {
        frontendscenecameracharacters( 2 );
        var_1 = level.camera_lobby_members;
        var_2 = level.camera_lobby_members._id_289A;
    }
    else
    {
        frontendscenecameracharacters( 0 );
        var_1 = _id_81A3( var_0.index );
        var_2 = _id_788A( var_1, var_0.name );
    }

    _id_F289( var_1, var_2 );
    level._id_4BF6 = var_0.index;
    level._id_4C01 = var_0.name;
    thread _id_0A78::_id_744B( level._id_1623, var_1._id_BE17, var_1._id_3F70, 0, 0.2, ::_id_12DBB );
}

_id_37BA( var_0 )
{
    if ( var_0.name == "" )
        return;

    if ( !isdefined( level._id_1641 ) || level.transition_interrupted )
    {
        _id_37BB( var_0 );
        return;
    }

    switch ( var_0.name )
    {
        case "mp_main":
            frontendscenecameracharacters( 3 );

            if ( level._id_4C01 != "mlg.tv" )
            {
                _id_F289( level._id_37B0, level._id_37B0._id_289A );
                _id_0A78::_id_744B( level._id_1623, 20, level._id_37B0._id_3F70, 0.2, 0.2, ::_id_12D9B );
            }

            level._id_4BF6 = undefined;
            break;
        case "private_lobby":
            frontendscenecameracharacters( 0 );
            _id_F289( level._id_37B5, level._id_37B5._id_289A );

            if ( level._id_4C01 == "private_lobby_menu" || level._id_4C01 == "create_a_class" )
                thread _id_BD64( level._id_1623, 5000, ::_id_12D9B );
            else
                _id_0A78::_id_744B( level._id_1623, 40, level._id_37B5._id_3F70, 0.2, 0.2, ::_id_12DBB );

            level._id_4BF6 = undefined;
            break;
        case "private_lobby_menu":
            frontendscenecameracharacters( 0 );
            _id_F289( level._id_37B5, level._id_37B5._id_AEB5 );

            if ( level._id_4C01 == "create_a_class" || level._id_4C01 == "private_lobby" )
                thread _id_BD64( level._id_1623, 5000, ::_id_12D9B );
            else
                _id_0A78::_id_744B( level._id_1623, 40, level._id_37B5._id_3F70, 0.2, 0.2, ::_id_12DBB );

            level._id_4BF6 = undefined;
            break;
        case "create_a_class":
            if ( coming_from_rig_select() || level._id_4C01 == "armory" )
            {
                var_1 = _id_81A3( var_0.index );
                _id_F289( var_1, var_1._id_369A );
                level._id_4BF6 = var_0.index;
                _id_0A78::_id_744B( level._id_1623, level._id_1641._id_BE17, level._id_1641._id_3F70, 0.2, 0.2, ::_id_12DEB );
            }
            else
            {
                var_2 = 5000;

                if ( level._id_4C01 == "mission_team_lobby" )
                    var_2 = 600;

                _id_F289( level._id_1641, level._id_1641._id_369A );
                thread _id_BD64( level._id_1641._id_369A, var_2, ::_id_12DBB );
            }

            break;
        case "weapon_select":
            if ( level._id_4C01 == "armory" )
            {
                var_1 = _id_81A3( var_0.index );
                _id_F289( var_1, var_1._id_13C7B );
                level._id_4BF6 = var_0.index;
                _id_0A78::_id_744B( level._id_1623, level._id_1641._id_BE17, level._id_1641._id_3F70, 0.2, 0.2, ::_id_12DEB );
            }
            else
            {
                _id_F289( level._id_1641, level._id_1641._id_13C7B );
                thread _id_BD64( level._id_1641._id_13C7B, 5000, ::_id_12D9B );
            }

            break;
        case "loadout_select":
            if ( level._id_4C01 == "armory" )
            {
                var_1 = _id_81A3( var_0.index );
                _id_F289( var_1, var_1._id_AE63 );
                level._id_4BF6 = var_0.index;
                _id_0A78::_id_744B( level._id_1623, level._id_1641._id_BE17, level._id_1641._id_3F70, 0.2, 0.2, ::_id_12DEB );
            }
            else
            {
                _id_F289( level._id_1641, level._id_1641._id_AE63 );
                thread _id_BD64( level._id_1641._id_AE63, 5000, ::_id_12D9B );
            }

            break;
        case "lobby_members":
            level._id_4BF6 = undefined;
            _id_F289( level._id_37B7, level.camera_lobby_members._id_289A );
            _id_0A78::_id_744B( level._id_1623, level._id_1641._id_BE17, level._id_1641._id_3F70, 0.2, 0.2, ::_id_12D9B );
            break;
        case "rig_select":
            _id_F289( level._id_37B7, level._id_37B7._id_289A );

            if ( level._id_4C01 == "rig_pick" || level._id_4C01 == "rig_trait_select" || level._id_4C01 == "rig_head_select" || level._id_4C01 == "rig_taunt_select" )
            {
                thread _id_BD64( level._id_1623, 5000, ::_id_12D9B );
                frontendscenecamerafov( level._id_37B7._id_BE17, 0.1 );
            }
            else
                _id_0A78::_id_744B( level._id_1623, level._id_1641._id_BE17, level._id_1641._id_3F70, 0.2, 0.2, ::_id_12D9B );

            level._id_4BF6 = undefined;
            break;
        case "rig_pick":
            _id_F289( level._id_37B8, level._id_37B8._id_289A );

            if ( level._id_4C01 == "rig_select" || level._id_4C01 == "rig_head_select" )
            {
                thread _id_BD64( level._id_37B8._id_289A, 5000, ::_id_12D9B );
                frontendscenecamerafov( level._id_37B8._id_BE17, 0.1 );
            }
            else
                _id_0A78::_id_744B( level._id_1623, level._id_1641._id_BE17, level._id_1641._id_3F70, 0.2, 0.2, ::_id_12D9B );

            break;
        case "rig_trait_select":
            _id_F289( level._id_37B9, level._id_37B9._id_289A );
            thread _id_BD64( level._id_37B9._id_289A, 5000, ::_id_12D9B );
            break;
        case "rig_head_select":
            _id_F289( level.camera_rig_head, level.camera_rig_head._id_289A );

            if ( level._id_4C01 == "rig_select" || level._id_4C01 == "rig_pick" )
            {
                thread _id_BD64( level.camera_rig_head._id_289A, 5000, ::_id_12D9B );
                frontendscenecamerafov( level.camera_rig_head._id_BE17, 0.1 );
            }
            else
                _id_0A78::_id_744B( level._id_1623, level._id_1641._id_BE17, level._id_1641._id_3F70, 0.2, 0.2, ::_id_12D9B );

            break;
        case "rig_taunt_select":
            _id_F289( level.camera_rig_taunt, level.camera_rig_taunt._id_289A );

            if ( level._id_4C01 == "rig_select" || level._id_4C01 == "rig_pick" )
            {
                thread _id_BD64( level.camera_rig_taunt._id_289A, 5000, ::_id_12D9B );
                frontendscenecamerafov( level.camera_rig_taunt._id_BE17, 0.15 );
            }
            else
                _id_0A78::_id_744B( level._id_1623, level._id_1641._id_BE17, level._id_1641._id_3F70, 0.2, 0.2, ::_id_12D9B );

            break;
        case "barracks":
            var_1 = _id_81A3( var_0.index );
            _id_F289( var_1, var_1._id_282B );
            level._id_4BF6 = var_0.index;

            if ( level._id_4C01 == "armory" )
                _id_0A78::_id_744B( level._id_1623, level._id_1641._id_BE17, level._id_1641._id_3F70, 0.2, 0.2, ::_id_12D9B );
            else
            {
                if ( level._id_4C01 == "loadout_select" || level._id_4C01 == "weapon_select" )
                    var_2 = 5000;
                else
                    var_2 = 100;

                thread _id_BD64( level._id_1641._id_282B, var_2, ::_id_12D9B );
            }

            break;
        case "mission_team_lobby":
            frontendscenecameracharacters( 0 );

            if ( isdefined( level._id_4BF6 ) && level._id_4BF6 == var_0.index )
            {
                _id_F289( level._id_1641, level._id_1641._id_289A );

                if ( level._id_4C01 == "barracks" )
                    thread _id_BD64( level._id_1641._id_289A, 100, ::_id_12D9B );
                else
                    thread _id_BD64( level._id_1641._id_289A, 600, ::_id_12D9B );
            }
            else
            {
                var_1 = _id_81A3( var_0.index );
                _id_F289( var_1, var_1._id_289A );
                level._id_4BF6 = var_0.index;
                _id_0A78::_id_744B( level._id_1623, level._id_1641._id_BE17, level._id_1641._id_3F70, 0.2, 0.2, ::_id_12DEB );
            }

            break;
        case "armory":
            _id_F289( level._id_37A7, level._id_37A7._id_289A );
            _id_0A78::_id_744B( level._id_1623, level._id_1641._id_BE17, level._id_1641._id_3F70, 0.2, 0.2, ::_id_12D9B );
            level._id_4BF6 = undefined;
            break;
        case "bro_shot":
            _id_F289( level._id_37A8, level._id_37A8._id_289A );
            _id_0A78::_id_744B( level._id_1623, level._id_1641._id_BE17, level._id_1641._id_3F70, 0.2, 0.2, ::_id_12D9B );
            level._id_4BF6 = undefined;
            break;
        case "weapon_painter_select":
            _id_F289( level.camera_weapon_painter, level.camera_weapon_painter._id_289A );
            _id_0A78::_id_744B( level._id_1623, level._id_1641._id_BE17, level._id_1641._id_3F70, 0.2, 0.2, ::_id_12E4A );
            break;
        case "mlg.tv":
            frontendscenecameracharacters();
            break;
        case "gamebattles_lobby":
            frontendscenecameracharacters( 0 );
            _id_F289( level.camera_gamebattles_lobby, level.camera_gamebattles_lobby._id_289A );

            if ( level._id_4C01 == "create_a_class" )
                thread _id_BD64( level._id_1623, 5000, ::_id_12D9B );
            else
                _id_0A78::_id_744B( level._id_1623, 40, level.camera_gamebattles_lobby._id_3F70, 0.2, 0.2, ::_id_12DBB );

            level._id_4BF6 = undefined;
            break;
        default:
            _id_0A78::_id_744B( level._id_37B0._id_289A, 65, undefined, 0.2, 0.2, ::_id_12D9B );
            break;
    }

    level._id_4C01 = var_0.name;
}

_id_48AE()
{
    level._id_37B0 = spawnstruct();
    level._id_37B0._id_289A = getent( "camera_mp_main", "targetname" );
    level._id_37B0._id_289A._id_525D = [ 55, 79, 90, 300, 4, 1.8 ];
    level._id_37B0._id_369A = level._id_37B0._id_289A;
    level._id_37B0._id_13C7B = level._id_37B0._id_289A;
    level._id_37B0._id_E510 = level._id_37B0._id_289A;
    level._id_37B0._id_BE17 = 20;
    level._id_37B0._id_3CAA = getent( "character_loc_mp_main", "targetname" );
    level._id_37B0._id_13C27 = getent( "weapon_loc_hq2", "targetname" );
    level._id_37B0._id_3F70 = "MP_FRONTEND_VX";
    level._id_37B0.shows_my_character = 0;
    level._id_37B5 = spawnstruct();
    level._id_37B5._id_289A = getent( "camera_mp_hq2", "targetname" );
    level._id_37B5._id_289A._id_525D = [ 0, 0, 10000, 10000, 6, 1 ];
    level._id_37B5._id_369A = getent( "camera_mp_hq2_cac", "targetname" );
    level._id_37B5._id_369A._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37B5._id_AE63 = getent( "camera_mp_hq2_weapon_02", "targetname" );
    level._id_37B5._id_AE63._id_525D = [ 0, 0, 10000, 10000, 8, 6 ];
    level._id_37B5._id_13C7B = getent( "camera_mp_hq2_weapon", "targetname" );
    level._id_37B5._id_13C7B._id_525D = [ 0, 0, 10000, 10000, 10, 8 ];
    level._id_37B5._id_E510 = getent( "camera_mp_hq2_rig", "targetname" );
    level._id_37B5._id_E510._id_525D = [ 10, 15, 250, 300, 4, 1.8 ];
    level._id_37B5._id_282B = level._id_37B5._id_369A;
    level._id_37B5._id_AEB5 = getent( "camera_mp_lan_default", "targetname" );
    level._id_37B5._id_AEB5._id_525D = [ 0, 0, 10000, 10000, 10, 8 ];
    level._id_37B5._id_BE17 = 40;
    level._id_37B5._id_3CAA = getent( "character_loc_hq2", "targetname" );
    level._id_37B5._id_13C27 = getent( "weapon_loc_hq2", "targetname" );
    level._id_37B5._id_3F70 = "MP_COD_XP_Bink";
    level._id_37B5.shows_my_character = 1;
    level.camera_gamebattles_lobby = spawnstruct();
    level.camera_gamebattles_lobby._id_289A = getent( "camera_mp_hq2", "targetname" );
    level.camera_gamebattles_lobby._id_289A._id_525D = [ 0, 0, 10000, 10000, 6, 1 ];
    level.camera_gamebattles_lobby._id_369A = getent( "camera_mp_hq2_cac", "targetname" );
    level.camera_gamebattles_lobby._id_369A._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level.camera_gamebattles_lobby._id_AE63 = getent( "camera_mp_hq2_weapon_02", "targetname" );
    level.camera_gamebattles_lobby._id_AE63._id_525D = [ 0, 0, 10000, 10000, 8, 6 ];
    level.camera_gamebattles_lobby._id_13C7B = getent( "camera_mp_hq2_weapon", "targetname" );
    level.camera_gamebattles_lobby._id_13C7B._id_525D = [ 0, 0, 10000, 10000, 10, 8 ];
    level.camera_gamebattles_lobby._id_E510 = getent( "camera_mp_hq2_rig", "targetname" );
    level.camera_gamebattles_lobby._id_E510._id_525D = [ 10, 15, 250, 300, 4, 1.8 ];
    level.camera_gamebattles_lobby._id_BE17 = 40;
    level.camera_gamebattles_lobby._id_3CAA = getent( "character_loc_hq2", "targetname" );
    level.camera_gamebattles_lobby._id_13C27 = getent( "weapon_loc_hq2", "targetname" );
    level.camera_gamebattles_lobby._id_3F70 = "MP_COD_XP_Bink";
    level.camera_gamebattles_lobby.shows_my_character = 1;
    level._id_37AA = spawnstruct();
    level._id_37AA._id_289A = getent( "camera_mp_hq1", "targetname" );
    level._id_37AA._id_289A._id_525D = [ 0, 0, 10000, 10000, 6, 1 ];
    level._id_37AA._id_369A = getent( "camera_mp_hq1_cac", "targetname" );
    level._id_37AA._id_369A._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37AA._id_AE63 = getent( "camera_mp_hq1_weapon_02", "targetname" );
    level._id_37AA._id_AE63._id_525D = [ 0, 0, 10000, 10000, 8, 6 ];
    level._id_37AA._id_13C7B = getent( "camera_mp_hq1_weapon", "targetname" );
    level._id_37AA._id_13C7B._id_525D = [ 0, 0, 10000, 10000, 10, 8 ];
    level._id_37AA._id_E510 = getent( "camera_mp_hq1_rig", "targetname" );
    level._id_37AA._id_E510._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37AA._id_282B = level._id_37AA._id_369A;
    level._id_37AA._id_BE17 = 40;
    level._id_37AA._id_3CAA = getent( "character_loc_hq1", "targetname" );
    level._id_37AA._id_13C27 = getent( "weapon_loc_hq1", "targetname" );
    level._id_37AA._id_3F70 = "MP_screen_WOLVERINE";
    level._id_37AA.shows_my_character = 1;
    level._id_37AB = spawnstruct();
    level._id_37AB._id_289A = getent( "camera_mp_hq2", "targetname" );
    level._id_37AB._id_289A._id_525D = [ 0, 0, 10000, 10000, 6, 1 ];
    level._id_37AB._id_369A = getent( "camera_mp_hq2_cac", "targetname" );
    level._id_37AB._id_369A._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37AB._id_AE63 = getent( "camera_mp_hq2_weapon_02", "targetname" );
    level._id_37AB._id_AE63._id_525D = [ 0, 0, 10000, 10000, 8, 6 ];
    level._id_37AB._id_13C7B = getent( "camera_mp_hq2_weapon", "targetname" );
    level._id_37AB._id_13C7B._id_525D = [ 0, 0, 10000, 10000, 10, 8 ];
    level._id_37AB._id_E510 = getent( "camera_mp_hq2_rig", "targetname" );
    level._id_37AB._id_E510._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37AB._id_282B = level._id_37AB._id_369A;
    level._id_37AB._id_BE17 = 40;
    level._id_37AB._id_3CAA = getent( "character_loc_hq2", "targetname" );
    level._id_37AB._id_13C27 = getent( "weapon_loc_hq2", "targetname" );
    level._id_37AB._id_3F70 = "MP_COD_XP_Bink";
    level._id_37AB.shows_my_character = 1;
    level._id_37AC = spawnstruct();
    level._id_37AC._id_289A = getent( "camera_mp_hq3", "targetname" );
    level._id_37AC._id_289A._id_525D = [ 0, 0, 10000, 10000, 6, 1 ];
    level._id_37AC._id_369A = getent( "camera_mp_hq3_cac", "targetname" );
    level._id_37AC._id_369A._id_525D = [ 0, 0, 10000, 10000, 6, 1 ];
    level._id_37AC._id_AE63 = getent( "camera_mp_hq3_weapon_02", "targetname" );
    level._id_37AC._id_AE63._id_525D = [ 0, 0, 10000, 10000, 6, 1 ];
    level._id_37AC._id_13C7B = getent( "camera_mp_hq3_weapon", "targetname" );
    level._id_37AC._id_13C7B._id_525D = [ 0, 0, 10000, 10000, 6, 1 ];
    level._id_37AC._id_E510 = getent( "camera_mp_hq3_rig", "targetname" );
    level._id_37AC._id_E510._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37AC._id_282B = level._id_37AC._id_369A;
    level._id_37AC._id_BE17 = 40;
    level._id_37AC._id_3CAA = getent( "character_loc_hq3", "targetname" );
    level._id_37AC._id_13C27 = getent( "weapon_loc_hq3", "targetname" );
    level._id_37AC._id_3F70 = "MP_screen_ORION";
    level._id_37AC.shows_my_character = 1;
    level._id_37AD = spawnstruct();
    level._id_37AD._id_289A = getent( "camera_mp_hq4", "targetname" );
    level._id_37AD._id_289A._id_525D = [ 0, 0, 10000, 10000, 6, 1 ];
    level._id_37AD._id_369A = getent( "camera_mp_hq4_cac", "targetname" );
    level._id_37AD._id_369A._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37AD._id_AE63 = getent( "camera_mp_hq4_weapon_02", "targetname" );
    level._id_37AD._id_AE63._id_525D = [ 0, 0, 10000, 10000, 8, 6 ];
    level._id_37AD._id_13C7B = getent( "camera_mp_hq4_weapon", "targetname" );
    level._id_37AD._id_13C7B._id_525D = [ 0, 0, 10000, 10000, 10, 8 ];
    level._id_37AD._id_E510 = getent( "camera_mp_hq4_rig", "targetname" );
    level._id_37AD._id_E510._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37AD._id_282B = level._id_37AD._id_369A;
    level._id_37AD._id_BE17 = 40;
    level._id_37AD._id_3CAA = getent( "character_loc_hq4", "targetname" );
    level._id_37AD._id_13C27 = getent( "weapon_loc_hq4", "targetname" );
    level._id_37AD._id_3F70 = "MP_screen_WRAITH";
    level._id_37AD.shows_my_character = 1;
    level._id_37AE = spawnstruct();
    level._id_37AE._id_289A = getent( "camera_mp_hq5", "targetname" );
    level._id_37AE._id_289A._id_525D = [ 0, 0, 10000, 10000, 6, 1 ];
    level._id_37AE._id_369A = getent( "camera_mp_hq5_cac", "targetname" );
    level._id_37AE._id_369A._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37AE._id_AE63 = getent( "camera_mp_hq5_weapon_02", "targetname" );
    level._id_37AE._id_AE63._id_525D = [ 0, 0, 10000, 10000, 8, 6 ];
    level._id_37AE._id_13C7B = getent( "camera_mp_hq5_weapon", "targetname" );
    level._id_37AE._id_13C7B._id_525D = [ 0, 0, 10000, 10000, 10, 8 ];
    level._id_37AE._id_E510 = getent( "camera_mp_hq5_rig", "targetname" );
    level._id_37AE._id_E510._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37AE._id_282B = level._id_37AE._id_369A;
    level._id_37AE._id_BE17 = 40;
    level._id_37AE._id_3CAA = getent( "character_loc_hq5", "targetname" );
    level._id_37AE._id_13C27 = getent( "weapon_loc_hq5", "targetname" );
    level._id_37AE._id_3F70 = "MP_screen_SABER";
    level._id_37AE.shows_my_character = 1;
    level._id_37AF = spawnstruct();
    level._id_37AF._id_289A = getent( "camera_mp_hq6", "targetname" );
    level._id_37AF._id_289A._id_525D = [ 0, 0, 10000, 10000, 6, 1 ];
    level._id_37AF._id_369A = getent( "camera_mp_hq6_cac", "targetname" );
    level._id_37AF._id_369A._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37AF._id_AE63 = getent( "camera_mp_hq6_weapon_02", "targetname" );
    level._id_37AF._id_AE63._id_525D = [ 0, 0, 10000, 10000, 8, 6 ];
    level._id_37AF._id_13C7B = getent( "camera_mp_hq6_weapon", "targetname" );
    level._id_37AF._id_13C7B._id_525D = [ 0, 0, 10000, 10000, 10, 8 ];
    level._id_37AF._id_E510 = getent( "camera_mp_hq6_rig", "targetname" );
    level._id_37AF._id_E510._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37AF._id_282B = level._id_37AF._id_369A;
    level._id_37AF._id_BE17 = 40;
    level._id_37AF._id_3CAA = getent( "character_loc_hq6", "targetname" );
    level._id_37AF._id_13C27 = getent( "weapon_loc_hq6", "targetname" );
    level._id_37AF._id_3F70 = "MP_screen_BLOODFORGE";
    level._id_37AF.shows_my_character = 1;
    level._id_37A8 = spawnstruct();
    level._id_37A8._id_289A = getent( "camera_mp_broshot", "targetname" );
    level._id_37A8._id_289A._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37A8._id_BE17 = 40;
    level._id_37A8._id_3CAA = getent( "character_loc_broshot", "targetname" );
    level._id_37A8._id_3CAB = getent( "character_loc_broshot_a", "targetname" );
    level._id_37A8._id_3CAC = getent( "character_loc_broshot_b", "targetname" );
    level._id_37A8.shows_my_character = 0;
    level._id_37A7 = spawnstruct();
    level._id_37A7._id_289A = getent( "camera_mp_armory", "targetname" );
    level._id_37A7._id_289A._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37A7._id_BE17 = 40;
    level._id_37A7._id_3CAA = getent( "character_loc_armory", "targetname" );
    level._id_37A7.shows_my_character = 0;
    level._id_37A7.box_loc = getent( "loot_box", "targetname" );
    level._id_37B7 = spawnstruct();
    level._id_37B7._id_289A = getent( "camera_mp_rig_select", "targetname" );
    level._id_37B7._id_289A._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37B7._id_369A = getent( "camera_mp_hq7_cac", "targetname" );
    level._id_37B7._id_369A._id_525D = [ 10, 15, 250, 300, 4, 1.8 ];
    level._id_37B7._id_AE63 = getent( "camera_mp_hq7_weapon_02", "targetname" );
    level._id_37B7._id_AE63._id_525D = [ 0, 15, 80, 300, 8, 6 ];
    level._id_37B7._id_13C7B = getent( "camera_mp_hq7_weapon", "targetname" );
    level._id_37B7._id_13C7B._id_525D = [ 0, 15, 80, 300, 10, 8 ];
    level._id_37B7._id_E510 = getent( "camera_mp_hq7_rig", "targetname" );
    level._id_37B7._id_E510._id_525D = [ 10, 15, 250, 300, 4, 1.8 ];
    level._id_37B7._id_282B = level._id_37AF._id_369A;
    level._id_37B7._id_BE17 = 40;
    level._id_37B7._id_3CAA = getent( "character_loc_hq7", "targetname" );
    level._id_37B7._id_13C27 = getent( "weapon_loc_hq7", "targetname" );
    level._id_37B7._id_3F70 = "MP_COD_XP_Bink";
    level._id_37B7.shows_my_character = 0;
    level._id_37B8 = spawnstruct();
    level._id_37B8._id_289A = getent( "camera_mp_rig_select", "targetname" );
    level._id_37B8._id_289A._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level._id_37B8._id_BE17 = 40;
    level._id_37B8._id_3CAA = getent( "character_loc_hq7", "targetname" );
    level._id_37B8._id_3F70 = "MP_COD_XP_Bink";
    level._id_37B8.shows_my_character = 0;
    level.camera_rig_taunt = spawnstruct();
    level.camera_rig_taunt._id_289A = getent( "camera_mp_taunt", "targetname" );
    level.camera_rig_taunt._id_289A._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level.camera_rig_taunt._id_289A.origin = ( -30, 6.66, 0 ) + level.camera_rig_taunt._id_289A.origin;
    level.camera_rig_taunt._id_BE17 = 63;
    level.camera_rig_taunt._id_3CAA = getent( "character_loc_taunt", "targetname" );
    level.camera_rig_taunt._id_3F70 = "MP_COD_XP_Bink";
    level.camera_rig_taunt.shows_my_character = 0;
    level._id_37B9 = spawnstruct();
    level._id_37B9._id_289A = getent( "camera_mp_rig_traits", "targetname" );
    level._id_37B9._id_289A._id_525D = [ 0, 15, 80, 300, 8, 6 ];
    level._id_37B9._id_BE17 = 40;
    level._id_37B9._id_3CAA = getent( "character_loc_hq7", "targetname" );
    level._id_37B9.shows_my_character = 0;
    level.camera_rig_head = spawnstruct();
    level.camera_rig_head._id_289A = getent( "camera_mp_rig_head", "targetname" );
    level.camera_rig_head._id_289A._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level.camera_rig_head._id_BE17 = 36;
    level.camera_rig_head._id_3CAA = getent( "character_loc_hq7", "targetname" );
    level.camera_rig_head.shows_my_character = 0;
    level.camera_lobby_members = spawnstruct();
    level.camera_lobby_members._id_289A = getent( "camera_mp_lobby_members", "targetname" );
    level.camera_lobby_members._id_289A._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level.camera_lobby_members._id_BE17 = 40;
    level.camera_lobby_members._id_3CAA = getent( "character_loc_lobby_members", "targetname" );
    level.camera_lobby_members.shows_my_character = 0;
    level._id_37BF = getent( "camera_weapon_select", "targetname" );
    level.camera_weapon_painter = spawnstruct();
    level.camera_weapon_painter._id_289A = getent( "camera_mp_gun_painter_01", "targetname" );
    level.camera_weapon_painter._id_289A._id_525D = [ 0, 0, 10000, 10000, 4, 1.8 ];
    level.camera_weapon_painter._id_BE17 = 40;
    level.camera_weapon_painter._id_13C27 = getent( "weapon_loc_painter", "targetname" );
    level.camera_weapon_painter.shows_my_character = 0;
}

_id_F289( var_0, var_1 )
{
    level._id_1641 = var_0;
    level._id_1623 = var_1;
}

_id_F9A9()
{
    var_0 = getent( "character_loc_hq2", "targetname" );
    level._id_3CAD = spawn( "script_character", var_0.origin, 0, 0, 0 );
    level._id_3CAD.angles = var_0.angles;
    var_1 = level._id_37B7._id_3CAA;
    level._id_3CB3 = spawn( "script_character", var_1.origin, 0, 0, 1 );
    level._id_3CB3.angles = var_1.angles;
    var_2 = level.camera_lobby_members._id_3CAA;
    level.characterlobbymember = spawn( "script_character", var_2.origin, 0, 0, 2 );
    level.characterlobbymember.angles = var_2.angles;
    level._id_3CB4 = spawn( "script_character", level._id_37B0._id_3CAA.origin, 0, 0, 3 );
    level._id_3CB4.angles = level._id_37B0._id_3CAA.angles;
    level.quartermaster = spawn( "script_character", level._id_37A7._id_3CAA.origin, 0, 0, 4 );
    level.quartermaster.angles = level._id_37A7._id_3CAA.angles;
    level.loot_box = spawn( "script_character", level._id_37A7.box_loc.origin, 0, 0, 5 );
    level.loot_box.angles = level._id_37A7.box_loc.angles;
    var_3 = getent( "weapon_loc_hq1", "targetname" );
    level.weapon = spawn( "script_weapon", var_3.origin, 0, 0, 0 );
    level.weapon.angles = var_3.angles;
    level.weapon _meth_831F( level._id_3CAD );
    level._id_13BF9 = spawn( "script_weapon", var_3.origin, 0, 0, 1 );
    level._id_13BF9.angles = var_3.angles;
    level._id_13BF9 _meth_831F( level._id_3CAD );
    level._id_13BFA = spawn( "script_weapon", var_3.origin, 0, 0, 2 );
    level._id_13BFA.angles = var_3.angles;
    level._id_13BFA _meth_831F( level._id_3CAD );
    _id_0A78::_id_744A( level._id_37B0._id_289A.origin, level._id_37B0._id_289A.angles );
}

epictauntlistener()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "luinotifyserver", var_0, var_1 );

        if ( var_0 == "taunt_started" )
        {
            scripts\mp\broshot_utilities::respawnclientcharacter();
            var_2 = tablelookup( "mp/cac/taunts.csv", 0, var_1, 9 );
            scripts\mp\broshot_utilities::processepictaunt( var_2, -1, 0 );
            continue;
        }

        if ( var_0 == "taunt_reset" )
            scripts\mp\broshot_utilities::respawnclientcharacter();
    }
}

camolistener()
{

}

main()
{
    setdvar( "match_running", 0 );
    _id_0FAA::main();
    scripts\mp\maps\mp_frontend\gen\mp_frontend_art::main();
    _id_0FA9::main();
    setdvar( "r_lightGridEnableTweaks", 1 );
    setdvar( "r_lightGridIntensity", 1.33 );
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    _id_48AE();
    _id_F9A9();
    level.transition_interrupted = 0;
    level.callbackplayerconnect = ::_id_3740;
    frontendscenecameracharacters( 0, 3 );
    precachemodel( "veh_mil_air_ca_oblivion_drone_mp" );
    precachempanim( "IW7_mp_taunt_killstreak_apex01_apex" );
    precachemodel( "veh_mil_air_thor_wm" );
    precachemodel( "sdf_mp_cruise_missile_01" );
    precachemodel( "un_mp_jackal_exterior_missile" );
    precachempanim( "iw7_mp_taunt_killstreak_thor_prop" );
    precachempanim( "iw7_mp_taunt_killstreak_thor_missile_sdf" );
    precachempanim( "iw7_mp_taunt_killstreak_thor_missile01" );
    precachempanim( "iw7_mp_taunt_killstreak_thor_missile02" );
    precachempanim( "iw7_mp_taunt_killstreak_thor_missile03" );
    precachempanim( "iw7_mp_taunt_killstreak_thor_missile04" );
    precachempanim( "iw7_mp_taunt_killstreak_thor_missile05" );
    precachemodel( "veh_mil_air_un_uav" );
    precachempanim( "iw7_mp_taunt_super_shootdown_uav" );
    precachemodel( "weapon_retract_shield_wm_mp" );
    precachempanim( "iw7_mp_taunt_super_shield_prop" );
    precachempanim( "iw7_mp_taunt_super_shield_prop_no_gun" );
    precachemodel( "mp_robot_c8" );
    precachemodel( "weapon_c8_shield_top_mp" );
    precachemodel( "weapon_c8_shield_bottom_mp" );
    precachempanim( "iw7_mp_taunt_killstreak_c8_robot" );
    precachemodel( "care_package_iw7_ca_wm" );
    precachemodel( "equipment_mp_nanoshot_wm" );
    precachempanim( "IW7_mp_taunt_adrenaline_nano" );
    precachemodel( "veh_mil_air_ca_jackal_drone_atmos_periph_mp" );
    precachempanim( "iw7_mp_taunt_killstreak_scorcher_scorcher01" );
    precachempanim( "iw7_mp_taunt_killstreak_scorcher_scorcher02" );
    precachempanim( "iw7_mp_taunt_killstreak_scorcher_scorcher03" );
    precachempanim( "iw7_mp_taunt_synaptic_reaper" );
    precachempanim( "iw7_mp_taunt_super_merc_steeldragon_frontend" );
    precachempanim( "iw7_mp_taunt_killstreak_laser_strike" );
    precachempanim( "iw7_mp_taunt_killstreak_laser_strike_synaptic" );
    precachempanim( "IW7_mp_taunt_ftl_pistol_spin" );
    precachempanim( "iw7_mp_taunt_bio_spike" );
    precachempanim( "iw7_mp_taunt_bio_spike_synaptic" );
    precachempanim( "iw7_mp_taunt_ftl_1st_kills_456" );
    precachempanim( "iw7_mp_taunt_ftl_2nd_kills_456" );
    precachempanim( "iw7_mp_taunt_ftl_3rd_kills_456" );
    precachemodel( "ctf_game_flag_unsa_close_wm" );
    precachemodel( "ctf_game_flag_sdf_close_wm" );
    precachemodel( "ctf_game_flag_noStand_red_mp" );
    precachemodel( "ctf_game_flag_noStand_blue_mp" );
    precachempanim( "iw7_mp_taunt_flag_plant_flag" );
    precachemodel( "care_package_iw7_ca_wm" );
    precachempanim( "IW7_mp_taunt_drone_crush_07_carepackage" );
}

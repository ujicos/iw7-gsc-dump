// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_2782()
{
    level._id_4FF4 = [];
    level._id_0134 = getentarray( "flag_primary", "targetname" );

    foreach ( var_1 in level._id_0134 )
    {
        switch ( var_1._id_EDF9 )
        {
            case "_a":
                level._id_4FF4[game["attackers"]] = var_1.origin;
                break;
            case "_b":
                level._id_4FDB = var_1.origin;
                break;
            case "_c":
                level._id_4FF4[game["defenders"]] = var_1.origin;
                break;
        }
    }
}

_id_279C()
{
    level._id_27A0 = ( 1000, 1000, 1000 );
    level._id_279F = ( -1000, -1000, -1000 );
    var_0 = getallnodes();

    if ( var_0.size > 0 )
    {
        foreach ( var_2 in var_0 )
        {
            level._id_27A0 = scripts\mp\spawnlogic::_id_6988( level._id_27A0, var_2.origin );
            level._id_279F = scripts\mp\spawnlogic::_id_6987( level._id_279F, var_2.origin );
        }
    }
    else
    {
        level._id_27A0 = level.spawnmins;
        level._id_279F = level.spawnmaxs;
    }
}

_id_277F()
{
    if ( !isdefined( level._id_53E1 ) )
        level._id_53E1 = 0;

    var_0 = _id_7DF3();
    level._id_27CA = _id_7DF4();
    checkpostshipballspawns( var_0 );

    if ( var_0.size > 1 && level._id_EB50 > 1 )
    {
        for ( var_1 = 0; var_1 < level._id_EB50; var_1++ )
        {
            var_2 = _id_7DF2( var_0[var_1] );
            _id_276F( var_2 );
        }
    }
    else
    {
        var_3 = [];
        var_3[0] = ( 0, 0, 0 );
        var_3[1] = ( 50, 0, 0 );
        var_3[2] = ( -50, 0, 0 );
        var_3[3] = ( 0, 50, 0 );
        var_3[4] = ( 0, -50, 0 );

        for ( var_1 = 0; var_1 < level._id_EB50; var_1++ )
        {
            var_2 = _id_7DF2( var_0[var_1] );
            _id_276F( var_2 + var_3[var_1] );
        }
    }

    level thread scripts\mp\utility\game::_id_83DA();
}

checkpostshipballspawns( var_0 )
{
    if ( level._id_B335 == "mp_divide" )
    {
        var_0[0].origin = ( -261, 235, 610 );
        var_0[1].origin = ( -211, 235, 610 );
        var_0[2].origin = ( -311, 235, 610 );
        var_0[3].origin = ( -311, 500, 610 );
        var_0[4].origin = ( -211, 500, 610 );
    }
}

_id_7DF3()
{
    var_0 = undefined;

    if ( level.gametype == "tdef" )
        var_0 = scripts\engine\utility::_id_8180( "tdef_ball_start", "targetname" );

    if ( !isdefined( var_0 ) || !var_0.size )
        var_0 = scripts\engine\utility::_id_8180( "ball_start", "targetname" );

    if ( level._id_EB50 > 1 )
        var_0 = _id_10435( var_0 );

    return var_0;
}

_id_7DF4()
{
    var_0 = undefined;

    if ( level.gametype == "tdef" )
        var_0 = getentarray( "tdef_ball_pickup", "targetname" );

    if ( !isdefined( var_0 ) || !var_0.size )
        var_0 = getentarray( "ball_pickup", "targetname" );

    if ( level._id_EB50 > 1 )
        var_0 = _id_10435( var_0 );

    return var_0;
}

_id_7DF2( var_0 )
{
    if ( isdefined( var_0 ) )
        var_1 = var_0.origin;
    else if ( level._id_53E1 )
        var_1 = level.players[0].origin + ( 0, 0, 30 );
    else
        var_1 = level._id_4FDB;

    return var_1;
}

_id_276F( var_0 )
{
    var_1 = 30;
    var_2 = spawnstruct();
    var_2.origin = var_0;
    var_3 = var_0;
    var_2 _id_278A();
    var_2.origin = var_2._id_862F + ( 0, 0, var_1 );
    var_2._id_93A8 = 0;

    if ( level._id_B335 == "mp_desert" )
        var_3 = var_2._id_862F;

    if ( level._id_B335 == "mp_divide" )
        var_3 = var_2._id_862F;

    if ( level.gametype == "tdef" )
        level._id_27D2[level._id_27D2.size] = _id_4985( var_3 );

    level._id_27C6[level._id_27C6.size] = var_2;
}

_id_278A( var_0 )
{
    var_1 = self.origin + ( 0, 0, 32 );
    var_2 = self.origin + ( 0, 0, -1000 );
    var_3 = scripts\engine\trace::_id_48BC( 1, 1, 1, 1, 0, 1, 1 );
    var_4 = [];
    var_5 = scripts\engine\trace::_id_DCED( var_1, var_2, var_4, var_3 );
    self._id_862F = var_5["position"];
    return var_5["fraction"] != 0 && var_5["fraction"] != 1;
}

_id_4985( var_0 )
{
    var_1 = spawn( "script_model", var_0 );
    var_1 setmodel( "ctf_game_flag_unsa_base_wm" );
    var_1 _meth_8588();
    var_1._id_289D = var_0;
    return var_1;
}

_id_1010F( var_0 )
{
    if ( isdefined( var_0._id_1194[0] ) )
        var_0._id_1194[0] delete();

    var_1 = undefined;
    var_2 = var_0.team;
    var_3 = var_0 ismlgspectator();

    if ( var_3 )
        var_2 = var_0 _meth_813B();
    else if ( var_2 == "spectator" )
        var_2 = "allies";

    var_4 = spawnfxforclient( level._effect["ball_base_glow"], self._id_289D, var_0 );
    var_4 _meth_82EC();
    var_0._id_1194[0] = var_4;
    triggerfx( var_4 );
}

_id_27C4( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_1 = level._id_27C6[level._id_2800.size];
    var_2 = spawn( "script_model", var_1.origin );
    var_2 _meth_8588();

    if ( level.gametype == "ball" || getdvarint( "scr_uplink_create_ball" ) == 1 )
    {
        var_2 setmodel( "uplink_ball_drone_wm" );
        var_2 _meth_8318( 1 );
        level._id_2809 = "iw7_uplinkball_mp";
        level._id_27F8 = 1000000;
    }
    else
    {
        var_2 setmodel( "tdef_ball_drone_wm" );
        var_2 _meth_8318( 1 );
        level._id_2809 = "iw7_tdefball_mp";
        level._id_27F8 = 250000;
    }

    var_3 = 32;
    var_4 = undefined;

    if ( isdefined( level._id_27CA ) && level._id_27CA.size > 0 )
    {
        var_4 = level._id_27CA[var_0];
        var_4.origin = var_2.origin;
    }
    else
        var_4 = spawn( "trigger_radius", var_2.origin - ( 0, 0, var_3 / 2 ), 0, var_3, var_3 );

    var_4 _meth_80D2();
    var_4 linkto( var_2 );
    var_4._id_C000 = 1;
    var_4._id_AD48 = 1;
    var_4._id_28AC = var_4.origin;
    var_4._id_C000 = 1;
    var_5 = [ var_2 ];
    var_6 = scripts\mp\gameobjects::_id_4993( "any", var_4, var_5, ( 0, 0, 32 ) );
    var_6._id_C2A6 = 1;
    var_6 scripts\mp\gameobjects::_id_1C7C( "any" );
    var_6 _id_27CE();
    var_6._id_1CB3 = 0;
    var_6._id_3B01 = level._id_2809;
    var_6._id_A575 = 0;
    var_6._id_1349F = ( 0, 0, 30 );
    var_6._id_393A = ::_id_2776;
    var_6._id_C566 = ::_id_27A4;
    var_6.setdropped = ::_id_27C1;
    var_6._id_C581 = ::_id_27A7;
    var_6._id_3B02 = ::_id_27A9;
    var_6._id_9398 = 0;
    var_6._id_A957 = 0;
    var_6._id_C930 = 0;
    var_6._id_E1BA = 1;
    var_6._id_A958 = "none";
    var_6._id_27F4 = level._id_2800.size;
    var_6.playeroutlineid = undefined;
    var_6.playeroutlined = undefined;
    var_6.passtargetoutlineid = undefined;
    var_6.passtargetent = undefined;
    var_6.visuals[0] _meth_858F( 1 );
    var_6.visuals[0] _meth_8317( 1 );

    if ( isdefined( level._id_10120 ) )
    {
        switch ( level._id_10120 )
        {
            case 0:
                var_6 scripts\mp\gameobjects::_id_FB0E( "friendly" );
                var_6._id_C2BE = 0;
                var_6._id_C2BD = 1;
                var_6._id_C2BF = 60.0;
                break;
            case 1:
                var_6 scripts\mp\gameobjects::_id_FB0E( "any" );
                var_6._id_C2BE = 0;
                var_6._id_C2BD = 0;
                var_6._id_C2BF = 0.05;
                break;
            case 2:
                var_6 scripts\mp\gameobjects::_id_FB0E( "any" );
                var_6._id_C2BE = 0;
                var_6._id_C2BD = 1;
                var_6._id_C2BF = 1.0;
                break;
            case 3:
                var_6 scripts\mp\gameobjects::_id_FB0E( "any" );
                var_6._id_C2BE = 0;
                var_6._id_C2BD = 1;
                var_6._id_C2BF = 1.5;
                break;
            case 4:
                var_6 scripts\mp\gameobjects::_id_FB0E( "any" );
                var_6._id_C2BE = 0;
                var_6._id_C2BD = 1;
                var_6._id_C2BF = 2.0;
                break;
            case 5:
                var_6 scripts\mp\gameobjects::_id_FB0E( "any" );
                var_6._id_C2BE = 0;
                var_6._id_C2BD = 1;
                var_6._id_C2BF = 3.0;
                break;
            case 6:
                var_6 scripts\mp\gameobjects::_id_FB0E( "any" );
                var_6._id_C2BE = 0;
                var_6._id_C2BD = 1;
                var_6._id_C2BF = 4.0;
                break;
        }
    }
    else
    {
        var_6 scripts\mp\gameobjects::_id_FB0E( "any" );
        var_6._id_C2BE = 0;
        var_6._id_C2BD = 1;
        var_6._id_C2BF = 3.0;
    }

    var_6 _id_2772( var_1 );
    level._id_2800[level._id_2800.size] = var_6;

    if ( level.gametype == "tdef" )
        level._id_2800[0] thread _id_10DA5();

    if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
        var_6 thread _id_278D( 1, 1 );

    var_6 thread _id_279E();
    var_6.visuals[0] playloopsound( "uplink_ball_hum_lp" );
    var_7 = [ "physicscontents_clipshot", "physicscontents_corpseclipshot", "physicscontents_missileclip", "physicscontents_solid", "physicscontents_vehicle", "physicscontents_player", "physicscontents_actor", "physicscontents_glass", "physicscontents_itemclip" ];
    var_8 = physics_createcontents( var_7 );
    level.ballphysicscontentoverride = var_8;
    level.balltraceradius = 10;

    if ( level.gametype == "tdef" )
        level.balltraceradius = 20;
}

_id_2776( var_0 )
{
    if ( isdefined( self._id_5EED ) && self._id_5EED >= gettime() )
        return 0;

    if ( isplayer( var_0 ) )
    {
        if ( !var_0 scripts\engine\utility::_id_9FFD() )
            return 0;

        if ( isdefined( var_0._id_B31D ) && var_0._id_B31D )
            return 0;

        if ( scripts\mp\utility\game::istrue( var_0._id_9D81 ) )
            return 0;

        if ( scripts\mp\utility\game::istrue( var_0._id_13107 ) )
            return 0;

        if ( !_id_1312E( var_0 ) )
            return 0;

        var_1 = var_0 getcurrentweapon();

        if ( isdefined( var_1 ) )
        {
            if ( !_id_1312D( var_1 ) )
                return 0;
        }

        var_2 = var_0._id_3C64;

        if ( isdefined( var_2 ) && var_0 _meth_81C2() )
        {
            if ( !_id_1312D( var_2 ) )
                return 0;
        }

        if ( var_0 scripts\mp\utility\game::_id_9D47() )
        {
            var_2 = var_0 scripts\mp\utility\game::_id_7E4D();

            if ( !_id_1312D( var_2 ) )
                return 0;
        }

        if ( var_0 scripts\mp\utility\game::isusingremote() )
            return 0;

        if ( var_0 _id_D207() )
            return 0;
    }
    else
        return 0;

    return 1;
}

_id_27A4( var_0 )
{
    var_0 notify( "obj_picked_up" );
    var_0 thread checkgesturethread();
    var_1 = 0;

    if ( level._id_27FC )
    {
        if ( _id_836A( var_0 ) )
            var_0 thread scripts\mp\utility\game::_id_83B4( "ball_grab" );

        level._id_27F9 = gettime();
        level._id_27FC = 0;

        if ( isdefined( level._id_D6AF ) && level._id_D6AF == 1 && scripts\mp\utility\game::istrue( level._id_D6B0 ) )
            var_1 = 1;

        var_0 notify( "ball_grab" );
    }

    if ( isdefined( level._id_D6AF ) && level._id_D6AF == 2 && scripts\mp\utility\game::istrue( level._id_D6B0 ) && isdefined( self._id_A956 ) && self._id_A956 != var_0 )
        var_1 = 1;

    if ( level.gametype == "tdef" )
    {
        var_0 scripts\mp\gametypes\tdef::_id_8116();
        level thread scripts\mp\gametypes\tdef::_id_26CE( var_0.team );

        if ( !level._id_11920 )
            level scripts\mp\gamelogic::_id_C9D6();
    }

    if ( scripts\mp\utility\game::istrue( level._id_D6AF ) )
        level _id_12F46( var_0.team, 0, 0, var_1 );

    level._id_130DD = 0;
    level.codcasterball = undefined;
    level.codcasterballinitialforcevector = undefined;
    var_2 = self.visuals[0] _meth_8138();

    if ( isdefined( var_2 ) )
        self.visuals[0] unlink();

    if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
        var_0 scripts\mp\utility\game::giveperk( "specialty_ballcarrier" );

    var_0._id_2777 = self;
    var_0._id_C274 = 1;
    self._id_3AA8 scripts\mp\utility\game::giveperk( "specialty_sprintfire" );
    self._id_3AA8._id_8C10 = 1;

    if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
        var_0 scripts\mp\lightarmor::_id_F786( var_0, level._id_3AEC );

    if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
        thread _id_27B8( var_0.team, "mp_uplink_ball_pickedup_friendly", "mp_uplink_ball_pickedup_enemy" );

    var_0 scripts\engine\utility::_id_1C6E( 0 );

    foreach ( var_5, var_4 in var_0._id_D782 )
        var_0 _id_0AE2::_id_D727( var_5 );

    self.visuals[0] physicslaunchserver( self.visuals[0].origin, ( 0, 0, 0 ) );
    self.visuals[0] _meth_851B();
    self.visuals[0] scripts\mp\movers::_id_C13B();
    self._id_C930 = 0;
    self.visuals[0] _id_10FF6();
    self.visuals[0] show();
    self.visuals[0] hide( 1 );
    self.visuals[0] linkto( var_0, "j_wrist_ri", ( 0, 0, 0 ), var_0.angles );
    self.visuals[0] setscriptablepartstate( "uplink_drone_hide", "hide", 0 );
    self.trigger scripts\mp\movers::_id_11001();
    self._id_4BBD._id_93A8 = 0;
    var_6 = 0;

    if ( isdefined( self._id_DA5A ) )
    {
        var_6 = 1;
        self._id_DA5A delete();
    }

    var_7 = var_0.team;
    var_8 = scripts\mp\utility\game::_id_8027( var_0.team );
    self.visuals[0] _meth_831F( var_0 );

    if ( var_6 )
    {
        if ( self._id_A958 == var_0.team )
        {
            if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
                scripts\mp\utility\game::_id_10E60( "pass_complete", var_7 );

            var_0._id_C94C = gettime();
            var_0._id_C94A = self._id_A956;
        }
        else
        {
            if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
                scripts\mp\utility\game::_id_10E60( "pass_intercepted", var_8 );

            var_0 thread scripts\mp\awards::givemidmatchaward( "mode_uplink_intercept" );

            if ( isplayer( var_0 ) )
                var_0 thread scripts\mp\matchdata::_id_AFBA( "pickup_interception", var_0.origin );
        }
    }
    else
    {
        if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) && self._id_A958 != var_0.team )
        {
            scripts\mp\utility\game::_id_10E60( "ally_own_drone", var_7 );
            scripts\mp\utility\game::_id_10E60( "enemy_own_drone", var_8 );
        }

        if ( isplayer( var_0 ) )
            var_0 thread scripts\mp\matchdata::_id_AFBA( "pickup", var_0.origin );
    }

    if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
        _id_278F();

    self._id_A957 = 0;
    self._id_A956 = var_0;
    self._id_A958 = var_0.team;
    self._id_C83E = var_0.team;
    _id_27CD( self._id_C83E );
    scripts\mp\utility\game::_id_F79E( 12, var_0.team, var_0 getentitynumber() );
    var_0 setweaponammoclip( level._id_2809, 1 );

    if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
        var_0 _meth_80C1( 1 );

    var_0 thread _id_D314( self );

    if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
        scripts\mp\gamelogic::_id_F73B( var_0, 1 );

    self notify( "physics_timeout" );
}

checkgesturethread()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "drop_object" );
    wait 0.05;

    if ( isdefined( self._id_77C2 ) && self _meth_8477( self._id_77C2 ) )
        self _meth_8442( self._id_77C2, 0.05, 1 );
}

_id_53D1()
{
    var_0 = spawn( "script_model", self.curorigin );
    var_0 setmodel( "tag_origin" );
    var_1 = self._id_A956 scripts\mp\utility\game::_id_1302( "blackhole_grenade_mp", self.curorigin, ( 0, 0, 0 ) );
    var_1 linkto( var_0, "tag_origin" );
    var_1.owner = self._id_A956;
    var_1 hide( 1 );
    var_1.owner thread scripts\mp\blackhole_grenade::_id_2B3E( var_1 );
}

_id_836A( var_0 )
{
    if ( level.gametype == "tdef" )
        var_1 = 15000;
    else
        var_1 = 10000;

    var_2 = var_0 _id_12E69();

    if ( var_2 )
        return 0;

    if ( isdefined( self._id_A956 ) && var_0.team == self._id_A956.team && gettime() < level._id_27F9 + var_1 )
        return 0;

    return 1;
}

_id_12E69()
{
    if ( !isdefined( self._id_2F37 ) )
    {
        self._id_C230 = 0;
        self._id_2F37 = 0;
    }

    self._id_C230++;

    if ( scripts\mp\utility\game::_id_7FB9() < 1 )
        return 0;

    self._id_2F37 = self._id_C230 / scripts\mp\utility\game::_id_7FB9();

    if ( self._id_2F37 < 4 )
        return 0;
    else
        return 1;
}

_id_27B8( var_0, var_1, var_2 )
{
    var_3 = scripts\mp\utility\game::_id_8027( var_0 );

    foreach ( var_5 in level.players )
    {
        if ( var_5.team == var_0 )
        {
            var_5 playlocalsound( var_1 );
            continue;
        }

        if ( var_5.team == var_3 )
            var_5 playlocalsound( var_2 );
    }
}

_id_27C1( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    var_4 = 0;
    self._id_9F24 = 1;
    self._id_5EED = gettime();
    self notify( "dropped" );
    var_5 = ( 0, 0, 0 );
    var_6 = self._id_3AA8;

    if ( isdefined( var_6 ) && var_6.team != "spectator" )
    {
        var_7 = var_6.origin;
        var_5 = var_6.angles;
        var_6 notify( "ball_dropped" );
    }
    else if ( isdefined( var_1 ) )
        var_7 = var_1;
    else
        var_7 = self._id_EA28;

    var_7 += ( 0, 0, 40 );

    if ( isdefined( self._id_DA5A ) )
        self._id_DA5A delete();

    for ( var_8 = 0; var_8 < self.visuals.size; var_8++ )
    {
        self.visuals[var_8].origin = var_7;
        self.visuals[var_8].angles = var_5;
        self.visuals[var_8] show();
        var_9 = self.visuals[var_8] _meth_8138();

        if ( isdefined( var_9 ) )
            self.visuals[var_8] unlink();

        self.visuals[var_8] setscriptablepartstate( "uplink_drone_hide", "show", 0 );
    }

    if ( scripts\mp\utility\game::istrue( var_3 ) || scripts\mp\utility\game::istrue( var_2 ) )
        var_4 = 1;

    _id_2778( var_4 );

    if ( !isdefined( level._id_EC39 ) )
        level._id_EC39 = 0;

    if ( level._id_EC39 > 0 )
        self.trigger.origin -= ( 0, 0, 10000 );
    else
        self.trigger.origin = var_7;

    _id_2783();
    self.curorigin = self.trigger.origin;

    if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
        thread _id_278D( 0 );

    self._id_C83E = "any";
    _id_27CE();
    scripts\mp\gameobjects::_id_41A0();

    if ( isdefined( var_6 ) )
        var_6 _id_D315();

    scripts\mp\gameobjects::_id_12E7B();
    scripts\mp\gameobjects::_id_12F68();
    self._id_9F24 = 0;

    if ( !var_0 )
    {
        var_10 = self._id_A958;
        var_11 = scripts\mp\utility\game::_id_8027( var_10 );

        if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) && !isdefined( var_1 ) && !scripts\mp\utility\game::istrue( var_2 ) )
        {
            scripts\mp\utility\game::_id_10E60( "ally_drop_drone", var_10 );
            scripts\mp\utility\game::_id_10E60( "enemy_drop_drone", var_11 );
        }

        var_12 = ( 0, var_5[1], 0 );
        var_13 = anglestoforward( var_12 );

        if ( isdefined( var_1 ) )
            var_14 = var_13 * 20 + ( 0, 0, 80 );
        else
            var_14 = var_13 * 200 + ( 0, 0, 80 );

        _id_27B1( var_14 );
    }

    var_15 = spawnstruct();
    var_15.carryobject = self;
    var_15._id_4E53 = ::_id_27A8;
    self.trigger thread scripts\mp\movers::_id_892F( var_15 );

    if ( level._id_11920 )
        level scripts\mp\gamelogic::_id_E2FF();

    return 1;
}

_id_2778( var_0 )
{
    if ( isdefined( self._id_3AA8 ) )
    {
        if ( level.gametype == "tdef" )
            self._id_3AA8 scripts\mp\gametypes\tdef::_id_8116();

        self._id_3AA8._id_27F3 = undefined;
        self._id_3AA8._id_C087 = gettime() + 500;
        self._id_3AA8 _id_CFCA();
        self._id_3AA8 notify( "cancel_update_pass_target" );
        self._id_3AA8._id_2777 = undefined;

        if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
        {
            self._id_3AA8 scripts\mp\utility\game::_id_E150( "specialty_ballcarrier" );
            self._id_3AA8 scripts\mp\lightarmor::_id_ACAC( self._id_3AA8 );
        }

        if ( self._id_3AA8._id_8C10 )
            self._id_3AA8 scripts\mp\utility\game::_id_E150( "specialty_sprintfire" );

        self._id_3AA8._id_8C10 = 0;

        if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
            self._id_3AA8 _meth_80C1( 0 );

        self._id_3AA8 scripts\engine\utility::_id_1C6E( 1 );

        if ( scripts\mp\utility\game::istrue( var_0 ) )
        {
            foreach ( var_3, var_2 in self._id_3AA8._id_D782 )
                self._id_3AA8 _id_0AE2::_id_D72D( var_3 );
        }

        self._id_3AA8 _meth_851A( 0 );
        self._id_3AA8._id_C274 = 0;
        self.visuals[0] _meth_831F( undefined );
    }
}

_id_27A7()
{
    _id_2772( level._id_27C6[self._id_27F4] );
    _id_27BC();
    var_0 = self.visuals[0];
    var_0 scripts\mp\movers::_id_C13B();
    var_1 = var_0 _meth_8138();

    if ( isdefined( var_1 ) )
        var_0 unlink();

    self.visuals[0] _id_10FF6();
    var_0 physicslaunchserver( var_0.origin, ( 0, 0, 0 ) );
    var_0 _meth_851B();
    _id_2783();

    if ( isdefined( self._id_DA5A ) )
        self._id_DA5A delete();

    var_2 = "none";
    var_3 = self._id_A958;

    if ( isdefined( var_3 ) )
        var_2 = scripts\mp\utility\game::_id_8027( var_3 );

    self._id_A958 = "none";
    _id_2778( 1 );
    self.trigger scripts\mp\movers::_id_11001();
    _id_27CC();

    if ( level.gametype != "tdef" )
    {
        scripts\mp\gameobjects::_id_F806( var_0._id_28AC + ( 0, 0, 4000 ), ( 0, 0, 0 ) );
        var_0 moveto( var_0._id_28AC, 3, 0, 3 );
        var_0 rotatevelocity( ( 0, 720, 0 ), 3, 0, 3 );
    }
    else
    {
        if ( !level._id_11920 )
            level scripts\mp\gamelogic::_id_C9D6();

        var_0 hide( 1 );
        self.visuals[0] setscriptablepartstate( "uplink_drone_hide", "hide", 0 );
        thread _id_136E1( var_0 );
    }

    if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
        playloopsound( var_0._id_28AC, "mp_uplink_ball_reset" );

    if ( !self._id_A957 && isdefined( var_3 ) && isdefined( var_2 ) )
    {
        if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) && var_3 != "none" )
        {
            scripts\mp\utility\game::_id_10E60( "drone_reset", var_3 );
            scripts\mp\utility\game::_id_10E60( "drone_reset", var_2 );
        }

        if ( isdefined( self._id_A956 ) )
        {

        }
    }

    self._id_C83E = "any";

    if ( level.gametype == "ball" || level._id_53E1 )
        thread _id_2785( 3 );

    if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
        thread _id_2784( var_0, 3 );

    thread scripts\mp\matchdata::_id_AFBA( "obj_return", var_0._id_28AC );
}

_id_277C()
{
    self.visuals[0]._id_C3B7 = self.visuals[0] _meth_82C7( 0 );
}

_id_27A9()
{
    self endon( "disconnect" );
    thread _id_27AD();
    thread _id_27C3();
    thread _id_27D0();
    self.carryobject waittill( "dropped" );
}

_id_27AD()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );

    for (;;)
    {
        self waittill( "ball_pass", var_0 );

        if ( var_0 != level._id_2809 )
            continue;

        if ( !isdefined( self._id_C935 ) )
        {
            self iprintlnbold( "No Pass Target" );
            continue;
        }

        self.carryobject._id_C930 = 1;
        break;
    }

    if ( isdefined( self.carryobject ) )
    {
        thread _id_27AA();
        var_1 = self._id_C935;
        var_2 = self._id_C935.origin;
        wait 0.15;

        if ( isdefined( self._id_C935 ) )
            var_1 = self._id_C935;

        self.carryobject thread _id_27AB( self, var_1, var_2 );
    }
}

_id_27C3()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );

    if ( level.gametype != "tdef" )
    {
        var_0 = getdvarfloat( "scr_ball_shoot_extra_pitch", 0 );
        var_1 = getdvarfloat( "scr_ball_shoot_force", 825 );
    }
    else
    {
        var_0 = getdvarfloat( "scr_tdef_shoot_extra_pitch", -3 );
        var_1 = getdvarfloat( "scr_tdef_shoot_force", 450 );
    }

    for (;;)
    {
        self waittill( "weapon_fired", var_2 );

        if ( var_2 != level._id_2809 )
            continue;

        self setweaponammoclip( level._id_2809, 0 );
        break;
    }

    if ( isdefined( self.carryobject ) )
    {
        thread scripts\mp\matchdata::_id_AFBA( "pass", self.origin );

        if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
            self playsound( "mp_uplink_ball_pass" );

        wait 0.15;

        if ( self _meth_81BE() )
        {
            var_0 = -12;

            if ( level.gametype == "tdef" )
                var_1 += 200;
        }

        var_3 = self getplayerangles();
        var_3 += ( var_0, 0, 0 );
        var_3 = ( clamp( var_3[0], -85, 85 ), var_3[1], var_3[2] );
        var_4 = anglestoforward( var_3 );
        thread _id_27AA();
        thread _id_277B( self.carryobject );
        self.carryobject _id_2780();
        self.carryobject thread _id_27B2( var_4 * var_1, self );
    }
}

_id_27D0()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );
    thread _id_11237();
    var_0 = level._id_2809;

    for (;;)
    {
        if ( var_0 == self getcurrentweapon() )
            break;

        self waittill( "weapon_change" );
    }

    for (;;)
    {
        self waittill( "weapon_change", var_1 );
        var_2 = self._id_11234;
        var_3 = var_2._id_10E47._id_130F8;

        if ( !isdefined( var_3 ) )
            continue;

        if ( isdefined( var_1 ) && var_1 == var_3 )
            break;
    }

    var_4 = self getplayerangles();
    var_4 = ( clamp( var_4[0], -85, 85 ), scripts\engine\utility::_id_152F( var_4[1] + 20 ), var_4[2] );
    var_5 = anglestoforward( var_4 );
    var_6 = 90;
    self.carryobject thread _id_27B2( var_5 * var_6, self, 1 );
}

_id_11237()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "drop_object" );
    self endon( "unsetBallCarrier" );
    self waittill( "super_started" );
    var_0 = self._id_11234;

    switch ( var_0._id_10E47._id_DE3F )
    {
        case "super_chargemode":
        case "super_phaseshift":
            ball_drop_on_ability();
            break;
        case "super_teleport":
        case "super_rewind":
            scripts\engine\utility::waittill_any( "teleport_success", "rewind_success" );
            ball_drop_on_ability();
            break;
    }
}

ball_drop_on_ability()
{
    var_0 = self getplayerangles();
    var_0 = ( clamp( var_0[0], -85, 85 ), scripts\engine\utility::_id_152F( var_0[1] + 20 ), var_0[2] );
    var_1 = anglestoforward( var_0 );
    var_2 = 90;
    self.carryobject thread _id_27B2( var_1 * var_2, self, 1 );
}

_id_27AA()
{
    self endon( "death" );
    self endon( "disconnect" );
    self._id_C933 = 1;
    self _meth_800F( 0 );

    while ( level._id_2809 == self getcurrentweapon() )
        scripts\engine\utility::waitframe();

    self _meth_800F( 1 );
    self._id_C933 = 0;

    foreach ( var_2, var_1 in self._id_D782 )
        _id_0AE2::_id_D72D( var_2 );
}

_id_27B2( var_0, var_1, var_2 )
{
    _id_27C1( 1, undefined, 0, var_2 );
    _id_27B1( var_0, var_1 );
}

_id_27AB( var_0, var_1, var_2 )
{
    _id_27C1( 1 );

    if ( isdefined( var_1 ) )
        var_2 = var_1.origin;

    var_3 = var_0 getpasserorigin();
    var_4 = var_0 getpasserdirection();

    if ( !validatepasstarget( self, var_0, var_1 ) )
    {
        var_3 = self.lastvalidpassorg;
        var_4 = self.lastvalidpassdir;
    }

    var_5 = var_4 * 30;
    var_6 = var_4 * 60;
    var_7 = var_3 + var_5;
    var_8 = var_1 gettargetorigin();
    var_9 = scripts\engine\trace::sphere_trace( var_7, var_8, level.balltraceradius, var_0, level.ballphysicscontentoverride, 0 );
    var_10 = 1.0;

    if ( var_9["fraction"] < 1 || !scripts\mp\utility\game::isreallyalive( var_1 ) )
    {
        if ( var_9["hittype"] == "hittype_entity" && isdefined( var_9["entity"] ) && isplayer( var_9["entity"] ) )
            var_10 = max( 0.1, 0.7 * var_9["fraction"] );
        else
            var_10 = 0.7 * var_9["fraction"];

        scripts\mp\gameobjects::_id_F806( var_7 + var_5 * var_10, self.visuals[0].angles );
    }
    else
        scripts\mp\gameobjects::_id_F806( var_9["position"], self.visuals[0].angles );

    if ( isdefined( var_1 ) )
    {
        self._id_DA5A = scripts\mp\utility\game::_id_1309( "uplinkball_tracking_mp", var_7 + var_6 * var_10, var_8, var_0 );
        self._id_DA5A _meth_8206( var_1, var_1 gettargetoffset() );
    }

    self.trigger.origin -= ( 0, 0, 10000 );
    var_1 thread _id_1878( self._id_DA5A );
    self.visuals[0] linkto( self._id_DA5A );
    _id_2783();
    _id_2780();
    _id_277C();
    level.codcasterball = self.visuals[0];
    thread _id_27A6();
    thread _id_27A5();
    thread _id_27A3();
    thread ball_track_pass_velocity( var_1 );
    thread ball_track_pass_lifetime();
    thread ball_track_target( var_1 );

    if ( level.gametype == "ball" )
        thread scripts\mp\gametypes\ball::_id_27AC();
}

_id_D314( var_0 )
{
    self endon( "disconnect" );
    self endon( "cancel_update_pass_target" );
    _id_D315();
    childthread _id_D1A5();

    for (;;)
    {
        var_1 = undefined;

        if ( !self isonladder() )
        {
            var_2 = [];

            foreach ( var_4 in level.players )
            {
                if ( !isdefined( var_4.team ) )
                    continue;

                if ( var_4.team != self.team )
                    continue;

                if ( !scripts\mp\utility\game::isreallyalive( var_4 ) )
                    continue;

                if ( !var_0 _id_2776( var_4 ) )
                    continue;

                if ( validatepasstarget( var_0, self, var_4 ) )
                    var_2[var_2.size] = var_4;
            }

            if ( isdefined( var_2 ) && var_2.size > 0 )
            {
                var_2 = scripts\mp\utility\game::_id_DB9F( var_2, ::_id_445B );
                var_6 = self geteye();

                foreach ( var_4 in var_2 )
                {
                    var_8 = var_4 gettargetorigin();

                    if ( sighttracepassed( var_6, var_8, 0, self, var_4 ) )
                    {
                        var_1 = var_4;
                        break;
                    }
                }
            }
        }

        _id_D289( var_1 );
        scripts\engine\utility::waitframe();
    }
}

validatepasstarget( var_0, var_1, var_2 )
{
    var_3 = 0.85;
    var_4 = var_1 getpasserorigin();
    var_5 = var_1 getpasserdirection();
    var_6 = var_2 gettargetorigin();
    var_7 = distancesquared( var_6, var_4 );

    if ( var_7 > level._id_27F8 )
        return 0;

    var_8 = vectornormalize( var_6 - var_4 );
    var_9 = vectordot( var_5, var_8 );

    if ( var_9 > var_3 )
    {
        var_10 = var_5 * 30;
        var_11 = var_4 + var_10;
        var_12 = scripts\engine\trace::sphere_trace( var_11, var_6, level.balltraceradius, var_1, level.ballphysicscontentoverride, 0 );

        if ( isdefined( var_12["entity"] ) && isplayer( var_12["entity"] ) || var_12["fraction"] > 0.8 )
        {
            var_2._id_C931 = var_9;
            var_0.lastvalidpassorg = var_4;
            var_0.lastvalidpassdir = var_5;
            return 1;
        }
    }

    return 0;
}

_id_D315()
{
    if ( !isdefined( self ) )
        return;

    if ( !isdefined( self.carryobject ) )
        return;

    if ( isdefined( self.carryobject.passtargetoutlineid ) && isdefined( self.carryobject.passtargetent ) )
    {
        scripts\mp\utility\game::_id_C78F( self.carryobject.passtargetoutlineid, self.carryobject.passtargetent );
        self.carryobject.passtargetoutlineid = undefined;
        self.carryobject.passtargetent = undefined;
    }

    if ( isdefined( self.carryobject.playeroutlineid ) && isdefined( self.carryobject.playeroutlined ) )
    {
        scripts\mp\utility\game::_id_C78F( self.carryobject.playeroutlineid, self.carryobject.playeroutlined );
        self.carryobject.playeroutlineid = undefined;
        self.carryobject.playeroutlined = undefined;
    }

    if ( self.carryobject._id_9F24 )
        return;

    var_0 = [];
    var_1 = [];
    var_2 = scripts\mp\utility\game::_id_8027( self.team );
    var_3 = undefined;
    var_4 = undefined;

    foreach ( var_6 in level.players )
    {
        if ( var_6 == self )
            continue;

        if ( var_6.team == self.team )
        {
            var_0[var_0.size] = var_6;
            continue;
        }

        if ( var_6.team == var_2 )
            var_1[var_1.size] = var_6;
    }

    foreach ( var_6 in var_0 )
        var_9 = isdefined( self._id_C935 ) && self._id_C935 == var_6;

    if ( isdefined( self._id_C935 ) )
        var_3 = scripts\mp\utility\game::_id_C794( self._id_C935, "cyan", self, 1, 0, "level_script" );

    self.carryobject.passtargetoutlineid = var_3;
    self.carryobject.passtargetent = self._id_C935;

    if ( level.gametype == "tdef" && var_0.size > 0 )
        var_4 = scripts\mp\utility\game::_id_C795( self, "cyan", self.team, 0, 1, "level_script" );

    self.carryobject.playeroutlineid = var_4;
    self.carryobject.playeroutlined = self;
}

_id_1878( var_0 )
{
    var_1 = self;
    var_0 endon( "pass_end" );

    while ( isdefined( var_1 ) && isdefined( var_0 ) )
    {
        var_0 _meth_8206( var_1, var_1 gettargetoffset() );
        scripts\engine\utility::waitframe();
    }
}

_id_445B( var_0, var_1 )
{
    return var_0._id_C931 >= var_1._id_C931;
}

_id_D1A5()
{
    for (;;)
    {
        level waittill( "joined_team", var_0 );
        _id_D315();
    }
}

_id_D289( var_0 )
{
    var_1 = 80;
    var_2 = 0;

    if ( isdefined( var_0 ) )
    {
        switch ( var_0 getstance() )
        {
            case "crouch":
                var_1 = 60;
                break;
            case "prone":
                var_1 = 35;
                break;
        }

        if ( !isdefined( self.pass_icon_offset ) || self.pass_icon_offset != var_1 )
        {
            var_2 = 1;
            self.pass_icon_offset = var_1;
        }
    }

    var_3 = ( 0, 0, var_1 );

    if ( isdefined( self._id_C935 ) && isdefined( var_0 ) && self._id_C935 == var_0 )
    {
        if ( var_2 )
            self._id_C932 = var_0 scripts\mp\entityheadicons::_id_F73D( self, "waypoint_ball_pass", var_3, 10, 10, 0, 0.05, 0, 1, 0, 0 );

        return;
    }

    if ( !isdefined( self._id_C935 ) && !isdefined( var_0 ) )
        return;

    _id_CFCA();

    if ( isdefined( var_0 ) )
    {
        self._id_C932 = var_0 scripts\mp\entityheadicons::_id_F73D( self, "waypoint_ball_pass", var_3, 10, 10, 0, 0.05, 0, 1, 0, 0 );
        self._id_C935 = var_0;
        var_4 = [];

        foreach ( var_6 in level.players )
        {
            if ( var_6.team == self.team && var_6 != self && var_6 != var_0 )
                var_4[var_4.size] = var_6;
        }

        self _meth_851A( 1 );
    }

    _id_D315();
}

_id_CFCA()
{
    if ( isdefined( self._id_C932 ) )
        self._id_C932 destroy();

    var_0 = [];

    foreach ( var_2 in level.players )
    {
        if ( var_2.team == self.team && var_2 != self )
            var_0[var_0.size] = var_2;
    }

    self._id_C935 = undefined;
    self _meth_851A( 0 );
    _id_D315();
}

_id_D207()
{
    return isdefined( self._id_C087 ) && self._id_C087 > gettime() || isdefined( self._id_2777 );
}

_id_1312E( var_0 )
{
    if ( !isdefined( var_0._id_11234 ) )
        return 1;

    if ( !isdefined( var_0._id_11234._id_9E53 ) || !var_0._id_11234._id_9E53 )
        return 1;

    if ( var_0._id_11234._id_10E47._id_DE3F == "super_phaseshift" )
        return 0;
    else
        return 1;
}

_id_1312D( var_0 )
{
    if ( var_0 == "none" )
        return 0;

    if ( var_0 == level._id_2809 )
        return 0;

    if ( var_0 == "ks_remote_map_mp" )
        return 0;

    if ( var_0 == "ks_remote_device_mp" )
        return 0;

    if ( scripts\mp\utility\game::_id_9E6C( var_0 ) )
        return 0;

    return 1;
}

_id_27A3()
{
    self.visuals[0] endon( "pass_end" );
    level waittill( "host_migration_begin" );

    if ( isdefined( self._id_DA5A ) )
    {
        if ( !isdefined( self._id_C935 ) && !isdefined( self._id_3AA8 ) && !self._id_9398 )
        {
            if ( self.visuals[0].origin != self.visuals[0]._id_28AC + ( 0, 0, 4000 ) )
            {
                _id_27BC();

                if ( !isdefined( self.lastpassdir ) )
                    self.lastpassdir = ( 0, 0, 1 );

                _id_27B1( self.lastpassdir * 400 );
            }
        }
    }
}

ball_track_pass_velocity( var_0 )
{
    self.visuals[0] endon( "pass_end" );
    self._id_DA5A endon( "projectile_impact_player" );
    self._id_DA5A endon( "death" );
    self.lastpassdir = vectornormalize( var_0.origin - self._id_DA5A.origin );
    var_1 = undefined;

    for (;;)
    {
        if ( isdefined( var_1 ) )
            self.lastpassdir = vectornormalize( self._id_DA5A.origin - var_1 );

        var_1 = self._id_DA5A.origin;
        scripts\engine\utility::waitframe();
    }
}

ball_track_pass_lifetime()
{
    self.visuals[0] endon( "pass_end" );
    self._id_DA5A endon( "projectile_impact_player" );
    self._id_DA5A endon( "death" );
    var_0 = gettime();

    for ( var_1 = var_0; var_1 < var_0 + 2000; var_1 = gettime() )
        scripts\engine\utility::waitframe();

    self._id_DA5A delete();
}

ball_track_target( var_0 )
{
    self.visuals[0] endon( "pass_end" );
    self._id_DA5A endon( "projectile_impact_player" );
    self._id_DA5A endon( "death" );

    for (;;)
    {
        if ( !isdefined( var_0 ) )
            break;

        if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
            break;

        if ( isdefined( var_0._id_11234 ) && scripts\mp\utility\game::istrue( var_0._id_11234._id_9E53 ) )
        {
            if ( var_0._id_11234._id_10E47._id_DE3F == "super_phaseshift" )
                break;
        }

        scripts\engine\utility::waitframe();
    }

    self._id_DA5A delete();
}

_id_27A5()
{
    self endon( "reset" );
    self._id_DA5A waittill( "death" );
    waittillframeend;

    if ( !isdefined( self._id_3AA8 ) )
        self.trigger.origin = self.curorigin;

    var_0 = self.visuals[0];

    if ( !isdefined( self._id_3AA8 ) && !self._id_9398 )
    {
        if ( var_0.origin != var_0._id_28AC + ( 0, 0, 4000 ) )
        {
            _id_27BC();

            if ( !isdefined( self.lastpassdir ) )
                self.lastpassdir = ( 0, 0, 1 );

            _id_27B1( self.lastpassdir * 400 );
        }
    }

    _id_27BC();
    var_0 notify( "pass_end" );
}

_id_27A6()
{
    self.visuals[0] endon( "pass_end" );
    self._id_DA5A waittill( "projectile_impact_player", var_0 );
    self.trigger.origin = self.visuals[0].origin;
    self.trigger notify( "trigger", var_0 );
}

_id_27B1( var_0, var_1 )
{
    var_2 = self.visuals[0];
    var_2._id_C71B = undefined;
    var_3 = var_2.origin;
    var_4 = var_2;

    if ( isdefined( var_1 ) )
    {
        var_4 = var_1;
        var_3 = var_1 geteye();
        var_5 = anglestoright( var_0 );
        var_3 += ( var_5[0], var_5[1], 0 ) * 7;

        if ( var_1 _meth_81BE() )
            var_3 += ( 0, 0, 10 );

        var_6 = var_3;
        var_7 = vectornormalize( var_0 ) * 80;
        var_8 = [ "physicscontents_clipshot", "physicscontents_corpseclipshot", "physicscontents_missileclip", "physicscontents_solid", "physicscontents_vehicle", "physicscontents_player", "physicscontents_actor", "physicscontents_glass", "physicscontents_itemclip" ];
        var_9 = physics_createcontents( var_8 );
        var_10 = scripts\engine\trace::sphere_trace( var_6, var_6 + var_7, 38, var_1, var_9 );

        if ( var_10["fraction"] < 1 )
        {
            var_11 = 0.7 * var_10["fraction"];
            scripts\mp\gameobjects::_id_F806( var_6 + var_7 * var_11, var_2.angles );
        }
        else
            scripts\mp\gameobjects::_id_F806( var_10["position"], var_2.angles );
    }

    self.visuals[0] physicslaunchserver( var_2.origin, var_0 );
    self.visuals[0] thread scripts\mp\utility\game::_id_DED0();
    self.visuals[0] _meth_84D1();
    scripts\mp\utility\game::_id_DECF( self.visuals[0], ::_id_279A );
    self.visuals[0].origin = self.trigger.origin;
    self.trigger linkto( self.visuals[0] );
    level.codcasterball = self.visuals[0];
    level.codcasterballowner = var_4;
    level.codcasterballinitialforcevector = var_0;
    thread _id_27B4( var_1 );
    thread _id_27AF();
    thread _id_27B3();

    if ( level.gametype == "ball" )
        thread scripts\mp\gametypes\ball::_id_27B6();

    thread _id_27B5( var_1 );
}

_id_27B5( var_0 )
{
    var_1 = self.visuals[0];
    var_2 = self.trigger;
    self.visuals[0] endon( "physics_finished" );
    self endon( "physics_timeout" );
    self endon( "pickup_object" );
    self endon( "reset" );
    self endon( "score_event" );

    for (;;)
    {
        var_2 waittill( "trigger", var_3 );

        if ( scripts\mp\utility\game::_id_9F22( var_3 ) )
            continue;

        if ( !isplayer( var_3 ) && !isagent( var_3 ) )
            continue;

        if ( isdefined( var_0 ) && var_0 == var_3 && var_3 _id_D207() )
            continue;

        if ( self._id_5EED >= gettime() )
            continue;

        if ( var_1.origin == var_1._id_28AC + ( 0, 0, 4000 ) )
            continue;

        if ( !_id_2776( var_3 ) )
        {
            if ( var_3 _id_D207() )
                continue;

            var_3._id_C087 = gettime() + 500;
            thread _id_27B0();
        }
    }
}

_id_27B0( var_0 )
{
    var_1 = self.visuals[0];
    var_2 = var_1 physics_getbodyid( 0 );
    var_3 = physics_getbodylinvel( var_2 );

    if ( isdefined( var_0 ) && var_0 )
    {
        var_4 = length( var_3 ) * 0.4;
        thread _id_13B69();
    }
    else
        var_4 = length( var_3 ) / 10;

    var_5 = vectornormalize( var_3 );
    var_5 = ( -1, -1, -0.5 ) * var_5;
    var_1 physicslaunchserver( var_1.origin, ( 0, 0, 0 ) );
    var_1 _meth_851B();
    var_1 physicslaunchserver( var_1.origin, var_5 * var_4 );
    var_1._id_CB0B = 1;
}

_id_CAFC()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "projectile_impact", var_0, var_1, var_2, var_3 );
        var_4 = level._effect["ball_physics_impact"];

        if ( isdefined( var_3 ) && isdefined( level._effect["ball_physics_impact_" + var_3] ) )
            var_4 = level._effect["ball_physics_impact_" + var_3];

        if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
            playfx( var_4, var_0, var_1 );

        wait 0.3;
    }
}

_id_279A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = var_0 physics_getbodyid( 0 );
    var_10 = physics_getbodylinvel( var_9 );
    var_11 = length( var_10 );

    if ( isdefined( var_0._id_D4A9 ) || var_11 < 70 )
        return;

    var_0 endon( "death" );
    var_0._id_D4A9 = 1;
    var_12 = "mp_uplink_ball_bounce";
    var_0 playsound( var_12 );
    var_13 = lookupsoundlength( var_12 );
    wait 0.1;
    var_0._id_D4A9 = undefined;
}

_id_27BD( var_0, var_1 )
{
    self._id_278C = 0;

    if ( scripts\mp\utility\game::istrue( level._id_69A1 ) && scripts\mp\utility\game::istrue( var_0 ) )
        _id_53D1();

    if ( scripts\mp\utility\game::istrue( level._id_D6AF ) )
    {
        if ( scripts\mp\utility\game::istrue( level._id_27D1 ) )
            level _id_12F46( "neutral", 0, 1 );
        else
            level _id_12F46( "neutral", 1, 1 );
    }

    level.codcasterball = undefined;
    level.codcasterballinitialforcevector = undefined;
    level._id_27FC = 1;
    self._id_9398 = 0;
    var_2 = self.visuals[0];
    var_2 physicslaunchserver( var_2.origin, ( 0, 0, 0 ) );
    var_2 _meth_851B();

    if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
    {
        playloopsound( var_2.origin, "mp_uplink_ball_out_of_bounds" );
        playfx( scripts\engine\utility::_id_7ECB( "ball_teleport" ), var_2.origin );
    }

    if ( var_1 )
        scripts\mp\utility\game::_id_F79E( 2, "free" );

    if ( isdefined( self._id_3AA8 ) )
        self._id_3AA8 scripts\engine\utility::delaythread( 0.05, ::_id_D315 );

    self.visuals[0] setscriptablepartstate( "uplink_drone_hide", "show", 0 );
    thread scripts\mp\gameobjects::_id_E472();
}

_id_27A8( var_0 )
{
    var_0.carryobject _id_27BD( 0, 1 );
}

_id_2785( var_0 )
{
    self endon( "pickup_object" );
    scripts\mp\gameobjects::_id_1C7C( "none" );
    self._id_9F24 = 1;
    wait( var_0 );
    self._id_9F24 = 0;
    _id_27CE();
    scripts\mp\gameobjects::_id_1C7C( "any" );
    self notify( "ball_ready" );

    if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
    {
        playfx( level._effect["ball_download_end"], self.curorigin );
        thread _id_278D( 0, 1 );
    }

    if ( level.gametype == "tdef" )
    {
        level _id_12F46( "neutral", 1, 1 );
        level._id_2800[0] thread _id_10DA5();
    }
}

_id_136E1( var_0 )
{
    self endon( "pickup_object" );
    self endon( "game_ended" );
    scripts\mp\gameobjects::_id_1C7C( "none" );

    if ( level._id_27D1 != 0 )
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( level._id_27D1 );

    if ( level._id_11920 )
        level scripts\mp\gamelogic::_id_E2FF();

    scripts\mp\gameobjects::_id_F806( var_0._id_28AC, ( 0, 0, 0 ) );
    self.visuals[0] setscriptablepartstate( "uplink_drone_hide", "show", 0 );
    thread _id_2785( 0 );
    var_0 rotatevelocity( ( 0, 720, 0 ), 3, 0, 3 );
}

_id_10DA5()
{
    self endon( "death" );
    self endon( "reset" );
    self endon( "pickup_object" );
    self notify( "hoverAnimStart" );
    self endon( "hoverAnimStart" );
    var_0 = self.visuals[0].origin;
    self.visuals[0] _meth_8271( 2000, 60, 0.2, 0.2 );

    for (;;)
    {
        self.visuals[0] moveto( var_0 + ( 0, 0, 5 ), 1, 0.5, 0.5 );
        wait 1;
        self.visuals[0] moveto( var_0 - ( 0, 0, 5 ), 1, 0.5, 0.5 );
        wait 1;
    }
}

_id_27B3()
{
    self endon( "reset" );
    self endon( "pickup_object" );
    var_0 = self.visuals[0];
    var_1[0] = 200;
    var_1[1] = 200;
    var_1[2] = 1000;
    var_2[0] = 200;
    var_2[1] = 200;
    var_2[2] = 200;

    for (;;)
    {
        for ( var_3 = 0; var_3 < 2; var_3++ )
        {
            if ( var_0.origin[var_3] > level._id_279F[var_3] + var_1[var_3] )
            {
                _id_27BD( 1, 1 );
                return;
            }

            if ( var_0.origin[var_3] < level._id_27A0[var_3] - var_2[var_3] )
            {
                _id_27BD( 1, 1 );
                return;
            }
        }

        scripts\engine\utility::waitframe();
    }
}

_id_27B4( var_0 )
{
    self endon( "reset" );
    self endon( "pickup_object" );
    self endon( "score_event" );

    if ( !isdefined( level._id_92F7 ) )
        level._id_92F7 = 15;

    var_1 = level._id_92F7;
    var_2 = 10;
    var_3 = 3;

    if ( var_1 >= var_2 )
    {
        wait( var_3 );
        var_1 -= var_3;
    }

    wait( var_1 );
    self notify( "physics_timeout" );
    _id_27BD( 1, 1 );
}

_id_27AF()
{
    self.visuals[0] endon( "physics_finished" );
    self endon( "physics_timeout" );
    self endon( "pickup_object" );
    self endon( "reset" );
    self endon( "score_event" );
    thread _id_27AE();

    for (;;)
    {
        if ( self.visuals[0] _id_11A43() )
            thread _id_27B0( 1 );

        if ( !self.visuals[0] scripts\mp\utility\game::touchingballallowedtrigger() )
        {
            if ( self.visuals[0] scripts\mp\utility\game::_id_11A42() || self.visuals[0] scripts\mp\utility\game::_id_11A44() )
            {
                _id_27BD( 0, 1 );
                return;
            }
        }

        scripts\engine\utility::waitframe();
    }
}

_id_11A43()
{
    if ( level.nozonetriggers.size > 0 )
    {
        foreach ( var_1 in level.nozonetriggers )
        {
            if ( self istouching( var_1 ) )
                return 1;
        }
    }

    return 0;
}

_id_13B69()
{
    self.visuals[0] endon( "physics_finished" );
    self endon( "physics_timeout" );
    self endon( "pickup_object" );
    self endon( "reset" );
    self endon( "score_event" );
    var_0 = gettime();
    var_1 = var_0 + 500;

    for (;;)
    {
        if ( self.visuals[0] _id_11A43() && var_1 < var_0 )
        {
            _id_27BD( 1, 1 );
            return;
        }

        wait 0.05;
        var_0 = gettime();
    }
}

_id_27AE()
{
    self endon( "pickup_object" );
    self endon( "reset" );
    self endon( "score_event" );
    var_0 = self.visuals[0];
    var_0 endon( "death" );
    var_0 waittill( "physics_finished" );

    if ( scripts\mp\utility\game::_id_11A42() )
    {
        _id_27BD( 1, 1 );
        return;
    }
}

_id_279E()
{
    for (;;)
    {
        var_0 = scripts\engine\utility::_id_13734( "pickup_object", "dropped", "reset", "ball_ready" );

        switch ( var_0 )
        {
            case "pickup_object":
                setomnvar( "ui_uplink_ball_carrier", self._id_3AA8 getentitynumber() );
                setomnvar( "ui_uplink_timer_text", 1 );
                break;
            case "dropped":
                setomnvar( "ui_uplink_ball_carrier", -2 );
                break;
            case "reset":
                setomnvar( "ui_uplink_ball_carrier", -3 );
                setomnvar( "ui_uplink_timer_text", 2 );
                break;
            case "ball_ready":
                setomnvar( "ui_uplink_timer_text", 1 );
                setomnvar( "ui_uplink_ball_carrier", -1 );
                break;
            default:
                break;
        }
    }
}

_id_277B( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 endon( "reset" );
    var_1 = spawnstruct();
    var_1 endon( "timer_done" );
    var_1 thread _id_11918( 1.5 );
    var_0 waittill( "pickup_object" );
    var_1 _id_11913();

    if ( !isdefined( var_0._id_3AA8 ) || var_0._id_3AA8.team == self.team )
        return;

    var_0._id_3AA8 endon( "disconnect" );
    var_1 thread _id_11918( 5 );
    var_0._id_3AA8 waittill( "death", var_2 );
    var_1 _id_11913();

    if ( !isdefined( var_2 ) || var_2 != self )
        return;

    var_1 thread _id_11918( 2 );
    var_0 waittill( "pickup_object" );
    var_1 _id_11913();

    if ( isdefined( var_0._id_3AA8 ) && var_0._id_3AA8 == self )
        thread scripts\mp\utility\game::_id_83B4( "ball_pass_kill" );
}

_id_11918( var_0 )
{
    self endon( "cancel_timer" );
    wait( var_0 );
    self notify( "timer_done" );
}

_id_11913()
{
    self notify( "cancel_timer" );
}

_id_27CE()
{
    scripts\mp\gameobjects::_id_F283( "friendly", "waypoint_neutral_ball" );
    scripts\mp\gameobjects::_id_F283( "enemy", "waypoint_neutral_ball" );
    scripts\mp\gameobjects::_id_F284( "friendly", "waypoint_neutral_ball" );
    scripts\mp\gameobjects::_id_F284( "enemy", "waypoint_neutral_ball" );
}

_id_27CD( var_0 )
{
    if ( level.gametype == "ball" )
        var_1 = "waypoint_escort";
    else
        var_1 = "waypoint_defend_round";

    scripts\mp\gameobjects::_id_F283( "friendly", var_1 );
    scripts\mp\gameobjects::_id_F283( "enemy", "waypoint_capture_kill_round" );
    scripts\mp\gameobjects::_id_F284( "friendly", var_1 );
    scripts\mp\gameobjects::_id_F284( "enemy", "waypoint_capture_kill_round" );
}

_id_27CC()
{
    if ( level.gametype == "ball" )
        var_0 = "waypoint_ball_download";
    else
        var_0 = "waypoint_reset_marker";

    scripts\mp\gameobjects::_id_F283( "friendly", var_0 );
    scripts\mp\gameobjects::_id_F283( "enemy", var_0 );
    scripts\mp\gameobjects::_id_F284( "friendly", var_0 );
    scripts\mp\gameobjects::_id_F284( "enemy", var_0 );
}

_id_27CF()
{
    scripts\mp\gameobjects::_id_F283( "friendly", "waypoint_ball_upload" );
    scripts\mp\gameobjects::_id_F283( "enemy", "waypoint_ball_upload" );
    scripts\mp\gameobjects::_id_F284( "friendly", "waypoint_ball_upload" );
    scripts\mp\gameobjects::_id_F284( "enemy", "waypoint_ball_upload" );
}

_id_27BC()
{
    if ( isdefined( self.visuals[0]._id_C3B7 ) )
    {
        self.visuals[0] _meth_82C7( self.visuals[0]._id_C3B7 );
        self.visuals[0]._id_C3B7 = undefined;
    }
}

_id_2783()
{
    self.visuals[0] dontinterpolate();
    self._id_278C = 0;
}

_id_2772( var_0 )
{
    foreach ( var_2 in self.visuals )
        var_2._id_28AC = var_0.origin;

    self.trigger._id_28AC = var_0.origin;
    self._id_4BBD = var_0;
    var_0._id_93A8 = 1;
}

_id_2780()
{
    if ( isdefined( self._id_A63A ) )
        self._id_A63A delete();

    self._id_A63A = spawn( "script_model", self.visuals[0].origin );
    self._id_A63A linkto( self.visuals[0] );
    self._id_A63A _meth_82C7( 0 );
    self._id_A63A setscriptmoverkillcam( "explosive" );
}

_id_97D6()
{
    level._id_2803 = level._id_D6B0;
    level._id_2804 = 1;
    level._id_2805 = 0;

    if ( isdefined( level._id_D6AF ) && level._id_D6AF != 0 )
    {
        setomnvar( "ui_uplink_timer_show", 1 );
        setomnvar( "ui_uplink_timer_text", 1 );
        thread _id_49D6();
    }
    else
        setomnvar( "ui_uplink_timer_show", 0 );
}

_id_49D6()
{
    level endon( "game_ended" );
    scripts\mp\utility\game::_id_7670( "prematch_done" );
    _id_12F46( "neutral", 1, 1 );
}

_id_12F46( var_0, var_1, var_2, var_3 )
{
    if ( !scripts\mp\utility\game::istrue( level._id_D6AF ) )
        return;

    var_4 = undefined;
    var_5 = 1000 * level._id_D6B0;

    if ( scripts\mp\utility\game::istrue( var_2 ) )
    {
        if ( scripts\mp\utility\game::istrue( level._id_27D1 ) && !scripts\mp\utility\game::istrue( level._id_27FC ) )
            var_5 = 1000 * level._id_27D1;
    }

    if ( scripts\mp\utility\game::istrue( var_2 ) || scripts\mp\utility\game::istrue( var_3 ) )
    {
        level._id_2803 = level._id_D6B0;
        level.ballendtime = int( gettime() + var_5 );
    }
    else
        level.ballendtime = int( gettime() + 1000 * level._id_2803 );

    setomnvar( "ui_hardpoint_timer", level.ballendtime );

    if ( var_5 > 0 && ( scripts\mp\utility\game::istrue( var_3 ) || !var_1 && level._id_2804 ) )
        level._id_276E thread _id_27FD( var_0, var_4 );

    if ( level._id_2803 > 1.0 )
    {
        if ( var_1 )
            level _id_C9CD();
    }
}

_id_27FD( var_0, var_1 )
{
    level endon( "game_ended" );
    level endon( "reset" );
    level endon( "pause_ball_timer" );
    level notify( "ballRunTimer" );
    level endon( "ballRunTimer" );
    level._id_2804 = 0;
    _id_2806( var_0, var_1 );

    if ( isdefined( level._id_276E ) && isdefined( level._id_276E._id_3AA8 ) )
        self._id_3AA8 scripts\mp\missions::_id_27FA();

    if ( !scripts\mp\utility\game::istrue( level._id_27FC ) )
    {
        scripts\mp\gameobjects::_id_1C7C( "none" );
        _id_27C1( 1, self.trigger.origin, 1 );
        _id_27BD( 1, 1 );
    }
}

_id_2806( var_0, var_1 )
{
    level endon( "game_ended" );
    level endon( "pause_ball_timer" );
    var_2 = scripts\engine\utility::ter_op( isdefined( var_1 ), var_1, int( level._id_2803 * 1000 + gettime() ) );
    level _id_E2FD( var_1 );
    thread _id_13B80();
    level thread _id_89B4( var_2 );
    _id_136A0( level._id_2803 );
}

_id_136A0( var_0 )
{
    level endon( "game_ended" );
    level endon( "pause_ball_timer" );

    if ( var_0 == 0 )
        return;

    var_1 = gettime();
    var_2 = gettime() + var_0 * 1000;

    while ( gettime() < var_2 )
    {
        _id_13829( ( var_2 - gettime() ) / 1000 );

        while ( isdefined( level._id_90A9 ) )
        {
            var_2 += 1000;
            setgameendtime( int( var_2 ) );
            wait 1;
        }
    }

    while ( isdefined( level._id_90A9 ) )
    {
        var_2 += 1000;
        setgameendtime( int( var_2 ) );
        wait 1;
    }

    return gettime() - var_1;
}

_id_13829( var_0 )
{
    level endon( "game_ended" );
    level endon( "pause_ball_timer" );

    if ( isdefined( level._id_90A9 ) )
        return;

    level endon( "host_migration_begin" );
    wait( var_0 );
}

_id_89B4( var_0 )
{
    level endon( "game_ended" );
    level endon( "disconnect" );
    level waittill( "host_migration_begin" );
    setomnvar( "ui_uplink_timer_stopped", 1 );
    var_1 = scripts\mp\hostmigration::waittillhostmigrationdone();

    if ( !level._id_2805 )
        setomnvar( "ui_uplink_timer_stopped", 0 );

    if ( var_1 > 0 )
        setomnvar( "ui_hardpoint_timer", level.ballendtime + var_1 );
    else
        setomnvar( "ui_hardpoint_timer", level.ballendtime );
}

_id_13B80()
{
    level endon( "game_ended" );
    level notify( "watchResetSoon" );
    level endon( "watchResetSoon" );
    var_0 = 0;

    for ( var_1 = undefined; level._id_2803 > 0 && !level._id_2804; level._id_2803 -= var_3 )
    {
        var_2 = gettime();

        if ( !var_0 && level._id_2803 < 10 )
        {
            level scripts\mp\utility\game::_id_10E60( "drone_reset_soon", "allies" );
            level scripts\mp\utility\game::_id_10E60( "drone_reset_soon", "axis" );
            var_0 = 1;
        }

        if ( isdefined( level._id_2800[0]._id_3AA8 ) && level._id_2803 < 5 )
        {
            if ( !isdefined( var_1 ) || var_2 > var_1 + 1000 )
            {
                var_1 = var_2;
                level._id_2800[0]._id_3AA8 playsoundtoplayer( "mp_cranked_countdown", level._id_2800[0]._id_3AA8 );
            }
        }

        var_3 = 0.05;
        wait( var_3 );
    }

    if ( level._id_2804 )
        level notify( "pause_ball_timer" );
}

_id_12E62( var_0 )
{
    var_1 = level._id_2804 || isdefined( level._id_90A9 );

    if ( !scripts\mp\utility\game::_id_766C( "prematch_done" ) )
        var_1 = 0;

    if ( !level._id_2805 && var_1 )
    {
        level._id_2805 = 1;
        setomnvar( "ui_uplink_timer_stopped", 1 );
    }
    else if ( level._id_2805 && !var_1 )
    {
        level._id_2805 = 0;
        setomnvar( "ui_uplink_timer_stopped", 0 );
    }
}

_id_C9CD()
{
    level._id_2804 = 1;
    _id_12E62();
}

_id_E2FD( var_0 )
{
    level._id_2804 = 0;
    _id_12E62( var_0 );
}

_id_27BA()
{
    if ( !scripts\mp\utility\game::istrue( level._id_53E1 ) )
    {
        foreach ( var_1 in level._id_2800 )
            var_1 _id_278E( self );
    }
}

_id_278E( var_0 )
{
    if ( _id_278C() )
    {
        self.visuals[0] setscriptablepartstate( "uplink_drone_idle", "normal", 0 );
        self.visuals[0] setscriptablepartstate( "uplink_drone_tail", "normal", 0 );
    }
}

_id_278D( var_0, var_1 )
{
    self endon( "reset" );
    self endon( "pickup_object" );

    if ( scripts\mp\utility\game::istrue( var_0 ) )
        wait 0.2;
    else
        wait 0.05;

    if ( !_id_278C() )
    {
        self.visuals[0] setscriptablepartstate( "uplink_drone_idle", "normal", 0 );
        self.visuals[0] setscriptablepartstate( "uplink_drone_tail", "normal", 0 );
        self._id_278C = 1;
    }
}

_id_278C()
{
    return isdefined( self._id_278C ) && self._id_278C;
}

_id_278F()
{
    if ( _id_278C() )
        self.visuals[0] _id_10FF6();

    self._id_278C = 0;
}

_id_10FF6()
{
    self setscriptablepartstate( "uplink_drone_idle", "off", 0 );
    self setscriptablepartstate( "uplink_drone_tail", "off", 0 );
}

_id_2784( var_0, var_1 )
{
    scripts\engine\utility::_id_137B7( "pickup_object", var_1 );
    level._id_EC39 = 0;
    level notify( "goal_ready" );
}

_id_BCA9()
{
    level notify( "practice" );
    level endon( "practice" );
    level endon( "game_ended" );
    wait 5;

    for (;;)
    {
        self waittill( "call_ball" );

        if ( !isdefined( level._id_2800[0]._id_3AA8 ) )
        {
            level._id_2800[0].visuals[0] physicslaunchserver( level._id_2800[0].visuals[0].origin, ( 0, 0, 0 ) );
            level._id_2800[0].visuals[0] _meth_851B();

            while ( !isdefined( level._id_2800[0]._id_3AA8 ) )
            {
                var_0 = 40;

                switch ( self getstance() )
                {
                    case "crouch":
                        var_0 = 30;
                        break;
                    case "prone":
                        var_0 = 15;
                        break;
                }

                level._id_2800[0].visuals[0] moveto( self.origin + ( 0, 0, var_0 ), 0.3, 0.15, 0.1 );
                wait 0.1;
            }
        }

        wait 1;
    }
}

_id_D7A7()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 = 1;

    for (;;)
    {
        if ( var_0 )
            self waittill( "giveLoadout" );
        else
            self waittill( "spawned" );

        var_0 = 0;

        if ( var_0 )
            wait 20;
        else
            wait 2;

        thread givepracticemessage();
    }
}

givepracticemessage()
{
    self notify( "practiceMessage" );
    self endon( "practiceMessage" );
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );

    if ( scripts\engine\utility::_id_9C70() )
    {
        self notifyonplayercommand( "call_ball", "+actionslot 3" );
        self iprintlnbold( &"PLATFORM_UPLINK_PRACTICE_SLOT3" );
    }
    else
    {
        self notifyonplayercommand( "call_ball", "+actionslot 7" );
        self iprintlnbold( &"PLATFORM_UPLINK_PRACTICE_SLOT7" );
    }

    level._id_2800[0] waittill( "score_event" );
    wait 5;
    thread givepracticemessage();
}

_id_10435( var_0 )
{
    if ( !isdefined( var_0 ) || var_0.size == 0 )
        return undefined;

    var_1 = 1;

    for ( var_2 = var_0.size; var_1; var_2-- )
    {
        var_1 = 0;

        for ( var_3 = 0; var_3 < var_2 - 1; var_3++ )
        {
            if ( _id_4460( var_0[var_3], var_0[var_3 + 1] ) )
            {
                var_4 = var_0[var_3];
                var_0[var_3] = var_0[var_3 + 1];
                var_0[var_3 + 1] = var_4;
                var_1 = 1;
            }
        }
    }

    return var_0;
}

_id_4460( var_0, var_1 )
{
    var_2 = int( var_0._id_EDF9 );
    var_3 = int( var_1._id_EDF9 );

    if ( !isdefined( var_2 ) && !isdefined( var_3 ) )
        return 0;

    if ( !isdefined( var_2 ) && isdefined( var_3 ) )
        return 1;

    if ( isdefined( var_2 ) && !isdefined( var_3 ) )
        return 0;

    if ( var_2 > var_3 )
        return 1;

    return 0;
}

getpasserorigin()
{
    var_0 = 0;

    switch ( self getstance() )
    {
        case "crouch":
            var_0 = 5;
            break;
        case "prone":
            var_0 = 10;
            break;
    }

    var_1 = self _meth_8517();
    var_2 = anglestoup( var_1 );
    var_3 = self geteye() + var_2 * var_0;
    return var_3;
}

getpasserdirection()
{
    var_0 = self getplayerangles();
    var_1 = anglestoforward( var_0 );
    return var_1;
}

gettargetorigin()
{
    var_0 = 10;

    switch ( self getstance() )
    {
        case "crouch":
            var_0 = 15;
            break;
        case "prone":
            var_0 = 5;
            break;
    }

    var_1 = self _meth_8517();
    var_2 = anglestoup( var_1 );
    var_3 = self gettagorigin( "j_spinelower", 1, 1 );
    var_4 = var_3 + var_2 * var_0;
    return var_4;
}

gettargetoffset()
{
    var_0 = gettargetorigin();
    return ( 0, 0, var_0[2] - self.origin[2] );
}

hideballsongameended()
{
    level waittill( "bro_shot_start" );

    foreach ( var_1 in level._id_2800 )
    {
        var_1.visuals[0] setscriptablepartstate( "uplink_drone_hide", "hide", 0 );
        var_1.visuals[0] setscriptablepartstate( "uplink_drone_idle", "off", 0 );
        var_1.visuals[0] setscriptablepartstate( "uplink_drone_tail", "off", 0 );
    }
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main( var_0 )
{
    var_0[var_0.size] = "airdrop_pallet";
    var_1 = getentarray();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( isdefined( var_1[var_2]._id_EDBF ) )
        {
            var_3 = 1;
            var_4 = strtok( var_1[var_2]._id_EDBF, " " );

            for ( var_5 = 0; var_5 < var_0.size; var_5++ )
            {
                for ( var_6 = 0; var_6 < var_4.size; var_6++ )
                {
                    if ( var_4[var_6] == var_0[var_5] )
                    {
                        var_3 = 0;
                        break;
                    }
                }

                if ( !var_3 )
                    break;
            }

            if ( var_3 )
                var_1[var_2] delete();
        }
    }
}

init()
{
    level._id_C22E = 0;
    level thread _id_C56E();
    level thread getleveltriggers();
}

_id_C56E()
{
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( isbot( var_0 ) )
            level.botsenabled = 1;

        var_0 thread onplayerspawned();
        var_0 thread _id_C4F5();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "spawned_player" );

        if ( isdefined( self._id_767C ) )
        {
            self._id_767C = undefined;
            continue;
        }

        _id_96DF();
    }
}

_id_96DF()
{
    thread _id_C4EA();
    self._id_11A46 = [];
    self.carryobject = undefined;
    self._id_3FFA = undefined;
    self._id_38ED = 1;
    self._id_A64F = undefined;
    self._id_987A = 1;
}

_id_C4EA()
{
    level endon( "game_ended" );
    self waittill( "death" );

    if ( isdefined( self.carryobject ) )
        self.carryobject thread setdropped();
}

_id_C4F5()
{
    level endon( "game_ended" );
    self waittill( "disconnect" );

    if ( isdefined( self.carryobject ) )
        self.carryobject thread setdropped();
}

_id_4A29( var_0, var_1 )
{
    var_2 = spawn( "script_model", self.origin );
    var_2 setmodel( "tag_origin" );
    var_3 = spawnstruct();
    var_3.type = "carryObject";
    var_3._id_3AA8 = var_0;
    var_3.curorigin = var_0.origin;
    var_3.entnum = var_2 getentitynumber();
    var_3._id_C83E = var_0.team;
    var_3._id_4465 = [];
    var_3._id_C2BE = 0;
    var_3._id_C2BD = 0;
    var_3._id_13DCA = [];
    var_3._id_3AF1 = 0;
    var_3._id_1343B = "none";

    foreach ( var_5 in level._id_115DA )
    {
        var_3._id_115DC[var_5] = scripts\mp\objidpoolmanager::requestminimapid( 99 );

        if ( var_3._id_115DC[var_5] != -1 )
        {
            scripts\mp\objidpoolmanager::minimap_objective_add( var_3._id_115DC[var_5], "invisible", var_3.curorigin );
            scripts\mp\objidpoolmanager::minimap_objective_team( var_3._id_115DC[var_5], var_5 );
        }

        var_3.objpoints[var_5] = scripts\mp\objpoints::_id_4A23( "objpoint_" + var_5 + "_" + var_3.entnum, var_3.curorigin + var_1, var_5, undefined );
        var_3.objpoints[var_5].alpha = 0;

        if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
        {
            var_6 = "mlg_" + var_5;
            var_3.objpoints[var_6] = scripts\mp\objpoints::_id_4A23( "objpoint_" + var_6 + "_" + var_3.entnum, var_3.curorigin + var_1, var_5, undefined );
            var_3.objpoints[var_6].alpha = 0;
        }
    }

    var_3 thread _id_12E6F();
    var_3 thread _id_51D8();
    return var_3;
}

_id_51D8()
{
    self._id_3AA8 waittill( "disconnect" );

    if ( self.type != "carryObject" )
        return;

    var_0 = self;
    var_0.type = undefined;
    var_0._id_3AA8 = undefined;
    var_0.curorigin = undefined;
    var_0.entnum = undefined;
    var_0._id_C83E = undefined;
    var_0._id_4465 = undefined;
    var_0._id_C2BE = undefined;
    var_0._id_C2BD = undefined;
    var_0._id_13DCA = undefined;
    var_0._id_3AF1 = undefined;
    var_0._id_1343B = undefined;

    foreach ( var_2 in level._id_115DA )
    {
        scripts\mp\objidpoolmanager::returnminimapid( var_0._id_115DC[var_2] );
        scripts\mp\objpoints::deleteobjpoint( var_0.objpoints[var_2] );

        if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
        {
            var_3 = "mlg_" + var_2;
            scripts\mp\objpoints::deleteobjpoint( var_0.objpoints[var_3] );
        }
    }
}

_id_4993( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4.type = "carryObject";
    var_4.curorigin = var_1.origin;
    var_4._id_C83E = var_0;
    var_4.entnum = var_1 getentitynumber();

    if ( issubstr( var_1.classname, "use" ) )
        var_4._id_127CB = "use";
    else
        var_4._id_127CB = "proximity";

    var_1._id_28AC = var_1.origin;
    var_4.trigger = var_1;

    if ( !isdefined( var_1._id_AD48 ) )
    {
        var_1._id_AD48 = 1;
        var_1 _meth_80D2();
    }

    var_4._id_130F8 = undefined;

    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    var_4._id_C363 = var_3;

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        var_2[var_5]._id_28AC = var_2[var_5].origin;
        var_2[var_5]._id_2898 = var_2[var_5].angles;
    }

    var_4.visuals = var_2;
    var_4._id_4465 = [];
    var_4._id_C2BE = 0;
    var_4._id_C2BD = 0;

    foreach ( var_7 in level._id_115DA )
    {
        var_4._id_115DC[var_7] = scripts\mp\objidpoolmanager::requestminimapid( 99 );

        if ( var_4._id_115DC[var_7] != -1 )
        {
            scripts\mp\objidpoolmanager::minimap_objective_add( var_4._id_115DC[var_7], "invisible", var_4.curorigin );
            scripts\mp\objidpoolmanager::minimap_objective_team( var_4._id_115DC[var_7], var_7 );
        }

        var_4.objpoints[var_7] = scripts\mp\objpoints::_id_4A23( "objpoint_" + var_7 + "_" + var_4.entnum, var_4.curorigin + var_3, var_7, undefined );
        var_4.objpoints[var_7].alpha = 0;

        if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
        {
            var_8 = "mlg_" + var_7;
            var_4.objpoints[var_8] = scripts\mp\objpoints::_id_4A23( "objpoint_" + var_8 + "_" + var_4.entnum, var_4.curorigin + var_3, var_7, undefined );
            var_4.objpoints[var_8].alpha = 0;
        }
    }

    var_4._id_3AA8 = undefined;
    var_4._id_9F24 = 0;
    var_4._id_9A52 = "none";
    var_4._id_1CB3 = 0;
    var_4._id_13DCA = [];
    var_4._id_3AF1 = 0;
    var_4._id_1343B = "none";
    var_4._id_3AF5 = undefined;
    var_4._id_C4F9 = undefined;
    var_4._id_C566 = undefined;
    var_4._id_C581 = undefined;

    if ( var_4._id_127CB == "use" )
        var_4 thread _id_3AFC();
    else
    {
        var_4._id_4B30 = 0;
        var_4._id_115DF = [];
        var_4._id_115DF["none"] = 0;
        var_4._id_115DF["allies"] = 0;
        var_4._id_115DF["axis"] = 0;
        var_4._id_130EE = 0;
        var_4._id_130C7 = 0;
        var_4._id_BDF4 = 0;
        var_4._id_3897 = 0;
        var_4._id_115F2 = [];
        var_4._id_115F1 = [];
        var_4._id_C248["neutral"] = 0;
        var_4._id_11A45["neutral"] = [];
        var_4._id_C248["none"] = 0;
        var_4._id_11A45["none"] = [];

        foreach ( var_11 in level._id_115DA )
        {
            var_4._id_C248[var_11] = 0;
            var_4._id_11A45[var_11] = [];
        }

        var_4._id_3FF9 = "none";
        var_4._id_3FF8 = undefined;
        var_4._id_A95A = "none";
        var_4._id_A95B = 0;
        var_4 thread _id_3AF9();
    }

    var_4 thread _id_12E6F();
    return var_4;
}

_id_51A9()
{
    if ( self.type != "carryObject" )
        return;

    var_0 = self;
    var_0.type = undefined;
    var_0.curorigin = undefined;
    var_0._id_C83E = undefined;
    var_0.entnum = undefined;
    var_0._id_127CB = undefined;
    var_0.trigger unlink();
    var_0.trigger = undefined;
    var_0._id_130F8 = undefined;
    var_0._id_C363 = undefined;

    foreach ( var_2 in var_0.visuals )
        var_2 delete();

    var_0.visuals = undefined;
    var_0._id_4465 = undefined;
    var_0._id_C2BE = undefined;
    var_0._id_C2BD = undefined;
    var_0._id_C2BF = undefined;
    scripts\mp\objpoints::deleteobjpoint( var_0.objpoints["allies"] );
    scripts\mp\objpoints::deleteobjpoint( var_0.objpoints["axis"] );

    foreach ( var_5 in level._id_115DA )
    {
        scripts\mp\objidpoolmanager::returnminimapid( var_0._id_115DC[var_5] );
        scripts\mp\objpoints::deleteobjpoint( var_0.objpoints[var_5] );

        if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
        {
            var_6 = "mlg_" + var_5;
            scripts\mp\objpoints::deleteobjpoint( var_0.objpoints[var_6] );
        }
    }

    var_0.objpoints = undefined;
    var_0._id_3AA8 = undefined;
    var_0._id_9F24 = undefined;
    var_0._id_9A52 = undefined;
    var_0._id_1CB3 = undefined;
    var_0._id_A57D = undefined;
    var_0._id_13DCA = undefined;
    var_0._id_3AF1 = undefined;
    var_0._id_1343B = undefined;
    var_0._id_3AF5 = undefined;
    var_0._id_C4F9 = undefined;
    var_0._id_C566 = undefined;
    var_0._id_C581 = undefined;
    var_0._id_4B30 = undefined;
    var_0._id_130EE = undefined;
    var_0._id_130C7 = undefined;
    var_0._id_BDF4 = undefined;
    var_0._id_3897 = undefined;
    var_0._id_115F2 = undefined;
    var_0._id_115F1 = undefined;
    var_0._id_C248 = undefined;
    var_0._id_11A45 = undefined;
    var_0._id_3FF9 = undefined;
    var_0._id_3FF8 = undefined;
    var_0._id_A95A = undefined;
    var_0._id_A95B = undefined;
    var_0 notify( "death" );
    var_0 notify( "deleted" );
}

_id_3AFC()
{
    level endon( "game_ended" );

    for (;;)
    {
        self.trigger waittill( "trigger", var_0 );

        if ( scripts\mp\utility\game::_id_9F22( var_0 ) )
            continue;

        if ( !isplayer( var_0 ) )
            continue;

        if ( var_0 _meth_84CA() )
            continue;

        if ( var_0 getcurrentweapon() == "ks_remote_map_mp" )
            continue;

        if ( var_0 getcurrentweapon() == "ks_remote_device_mp" )
            continue;

        if ( var_0 scripts\mp\utility\game::_id_9D47() )
        {
            var_1 = var_0 scripts\mp\utility\game::_id_7E4D();

            if ( var_1 == "ks_remote_map_mp" || var_1 == "ks_remote_device_mp" )
                continue;
        }

        if ( scripts\mp\utility\game::istrue( var_0._id_13107 ) )
            continue;

        if ( !_id_DAD1( var_0 ) )
            continue;

        if ( self._id_9F24 )
            continue;

        if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
            continue;

        if ( !_id_38C3( var_0.pers["team"] ) )
            continue;

        if ( !var_0._id_38ED )
            continue;

        if ( isdefined( var_0._id_C087 ) && var_0._id_C087 > gettime() )
            continue;

        if ( !isdefined( var_0._id_987A ) )
            continue;

        if ( var_0 scripts\mp\utility\game::_id_85C7() )
        {
            var_2 = var_0 _meth_854D();

            if ( !scripts\mp\utility\game::isgesture( var_2 ) )
                continue;
        }

        if ( isdefined( self._id_3AA8 ) )
            continue;

        if ( var_0 scripts\mp\utility\game::isusingremote() )
            continue;

        _id_F7E8( var_0 );
    }
}

_id_3AF9()
{
    if ( level.gametype == "ball" || level.gametype == "tdef" )
        thread _id_3AFC();
    else
        thread _id_3AFA();
}

_id_3AFA()
{
    level endon( "game_ended" );

    if ( isdefined( self.trigger ) )
        self.trigger endon( "move_gameobject" );

    thread _id_DAD2();

    for (;;)
    {
        if ( self._id_130EE && self._id_115DF[self._id_3FF9] >= self._id_130EE )
        {
            self._id_4B30 = 0.0;
            self._id_115DF[self._id_3FF9] = self._id_4B30;
            var_0 = _id_7E8B();

            if ( isdefined( self._id_C50D ) )
                self [[ self._id_C50D ]]( _id_7E29(), var_0, isdefined( var_0 ) );

            if ( isdefined( var_0 ) )
                _id_F7E8( var_0 );

            _id_F690( "none" );
            self._id_3FF8 = undefined;
        }

        if ( self._id_3FF9 != "none" )
        {
            if ( self._id_130EE )
            {
                if ( !self._id_C248[self._id_3FF9] )
                {
                    if ( isdefined( self._id_C50D ) )
                        self [[ self._id_C50D ]]( _id_7E29(), self._id_3FF8, 0 );

                    _id_F690( "none" );
                    self._id_3FF8 = undefined;
                }
                else
                {
                    self._id_4B30 += 50 * self._id_130C7;
                    self._id_115DF[self._id_3FF9] = self._id_4B30;

                    if ( self._id_C83E != level._id_C74B[self._id_3FF9] )
                        self._id_115DF[level._id_C74B[self._id_3FF9]] = 0;

                    if ( isdefined( self._id_C5C8 ) )
                        self [[ self._id_C5C8 ]]( _id_7E29(), self._id_4B30 / self._id_130EE, 50 * self._id_130C7 / self._id_130EE, self._id_3FF8 );
                }
            }
            else
            {
                if ( scripts\mp\utility\game::isreallyalive( self._id_3FF8 ) )
                    _id_F7E8( self._id_3FF8 );

                _id_F690( "none" );
                self._id_3FF8 = undefined;
            }
        }

        wait 0.05;
        scripts\mp\hostmigration::waittillhostmigrationdone();
    }
}

_id_CB44( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self._id_38ED = 0;

    if ( isdefined( var_0._id_27F4 ) )
        var_1 = 1024;
    else
        var_1 = 4096;

    for (;;)
    {
        if ( distancesquared( self.origin, var_0.trigger.origin ) > var_1 )
            break;

        wait 0.2;
    }

    if ( !scripts\mp\equipment\phase_shift::_id_9DDF( self ) )
        self._id_38ED = 1;
}

_id_F7E8( var_0 )
{
    if ( isai( var_0 ) && isdefined( var_0.owner ) )
        return;

    if ( isdefined( var_0.carryobject ) || isdefined( self._id_3B01 ) && !var_0 scripts\engine\utility::_id_9FFD() )
    {
        if ( isdefined( self._id_C567 ) )
            self [[ self._id_C567 ]]( var_0 );

        return;
    }

    var_0 _id_8382( self );
    _id_F67F( var_0 );

    if ( isdefined( self.trigger _meth_8138() ) )
    {
        for ( var_1 = 0; var_1 < self.visuals.size; var_1++ )
            self.visuals[var_1] unlink();

        self.trigger unlink();
    }

    for ( var_1 = 0; var_1 < self.visuals.size; var_1++ )
        self.visuals[var_1] hide();

    self.trigger.origin += ( 0, 0, 10000 );
    self.trigger scripts\mp\movers::_id_11001();
    self notify( "pickup_object" );

    if ( isdefined( self._id_C566 ) )
        self [[ self._id_C566 ]]( var_0 );

    _id_12E7B();
    _id_12F68();
}

_id_12E83()
{
    level endon( "game_ended" );

    if ( isdefined( self.trigger ) )
        self.trigger endon( "move_gameobject" );

    if ( level.gametype == "front" )
        self._id_3AA8 endon( "disconnect" );

    for (;;)
    {
        if ( isdefined( self._id_3AA8 ) )
            self.curorigin = self._id_3AA8.origin + ( 0, 0, 75 );
        else
            self.curorigin = self.trigger.origin;

        wait 0.05;
    }
}

_id_12E6F()
{
    level endon( "game_ended" );

    if ( isdefined( self.trigger ) )
        self.trigger endon( "move_gameobject" );

    if ( level.gametype == "front" )
        self._id_3AA8 endon( "disconnect" );

    thread _id_12E83();

    if ( !isdefined( self._id_C2BF ) )
        self._id_C2BF = 4.0;

    for (;;)
    {
        if ( isdefined( self._id_3AA8 ) )
        {
            if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
            {
                if ( isdefined( self.objpoints["mlg_allies"] ) )
                    self.objpoints["mlg_allies"] scripts\mp\objpoints::_id_12EE3( self.curorigin );

                if ( isdefined( self.objpoints["mlg_axis"] ) )
                    self.objpoints["mlg_axis"] scripts\mp\objpoints::_id_12EE3( self.curorigin );
            }

            foreach ( var_1 in level._id_115DA )
                self.objpoints[var_1] scripts\mp\objpoints::_id_12EE3( self.curorigin );

            foreach ( var_1 in level._id_115DA )
            {
                if ( ( self._id_1343B == "friendly" || self._id_1343B == "any" ) && _id_9E07( var_1 ) && self._id_C2BE )
                {
                    if ( self.objpoints[var_1]._id_9F51 )
                    {
                        self.objpoints[var_1].alpha = self.objpoints[var_1]._id_2897;
                        self.objpoints[var_1] fadeovertime( self._id_C2BF );
                        self.objpoints[var_1].alpha = 0;
                    }

                    if ( self._id_115DC[var_1] != -1 )
                        scripts\mp\objidpoolmanager::minimap_objective_position( self._id_115DC[var_1], self.curorigin );
                }
            }

            foreach ( var_1 in level._id_115DA )
            {
                if ( ( self._id_1343B == "enemy" || self._id_1343B == "any" ) && !_id_9E07( var_1 ) && self._id_C2BD )
                {
                    if ( self.objpoints[var_1]._id_9F51 )
                    {
                        self.objpoints[var_1].alpha = self.objpoints[var_1]._id_2897;
                        self.objpoints[var_1] fadeovertime( self._id_C2BF );
                        self.objpoints[var_1].alpha = 0;
                    }

                    if ( self._id_115DC[var_1] != -1 )
                        scripts\mp\objidpoolmanager::minimap_objective_position( self._id_115DC[var_1], self.curorigin );
                }
            }

            scripts\mp\utility\game::_id_1359E( self._id_C2BF, "dropped", "reset" );
            continue;
        }

        foreach ( var_1 in level._id_115DA )
            self.objpoints[var_1] scripts\mp\objpoints::_id_12EE3( self.curorigin + self._id_C363 );

        wait 0.05;
    }
}

_id_8EBA()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );
    level waittill( "game_ended" );

    if ( isdefined( self._id_3AF5 ) )
        self._id_3AF5.alpha = 0;
}

_id_767E()
{
    var_0 = self getcurrentweapon();
    var_1 = self getcurrentprimaryweapon();

    if ( "alt_" + var_1 == var_0 )
        return var_0;

    return var_1;
}

_id_139CC( var_0 )
{
    self endon( "goal_scored" );
    var_1 = gettime();
    var_2 = scripts\mp\utility\game::_id_11383( var_0, 1 );

    if ( isdefined( var_2 ) )
    {
        if ( var_2 == 0 )
        {
            if ( var_1 == gettime() )
                waittillframeend;

            if ( isdefined( self.carryobject ) )
                self.carryobject thread setdropped();
        }
    }
}

_id_8382( var_0 )
{
    self.carryobject = var_0;
    thread _id_11ACC();

    if ( isdefined( var_0._id_3B01 ) )
    {
        var_0._id_3AF2 = _id_767E();
        var_0._id_3AF0 = self hasweapon( var_0._id_3B01 );

        if ( isdefined( var_0._id_3B02 ) )
            self thread [[ var_0._id_3B02 ]]();

        self giveweapon( var_0._id_3B01 );
        thread _id_139CC( var_0._id_3B01 );
        self _meth_80A9();
        scripts\engine\utility::_id_1C76( 0 );
    }
    else if ( !var_0._id_1CB3 )
    {
        scripts\engine\utility::_id_1C71( 0 );
        thread _id_B31B();
    }

    if ( isdefined( var_0._id_3AF5 ) )
    {
        if ( level._id_10A56 )
        {
            self._id_3AF5 = scripts\mp\hud_util::_id_49D9( var_0._id_3AF5, 33, 33 );
            self._id_3AF5 scripts\mp\hud_util::_id_F801( "BOTTOM LEFT", "BOTTOM LEFT", -50, -78 );
        }
        else
        {
            self._id_3AF5 = scripts\mp\hud_util::_id_49D9( var_0._id_3AF5, 50, 50 );
            self._id_3AF5 scripts\mp\hud_util::_id_F801( "BOTTOM LEFT", "BOTTOM LEFT", 175, -30 );
        }

        self._id_3AF5._id_0177 = 1;
        thread _id_8EBA();
    }
}

_id_E472()
{
    self._id_9F24 = 1;
    self notify( "reset" );

    for ( var_0 = 0; var_0 < self.visuals.size; var_0++ )
    {
        var_1 = self.visuals[var_0] _meth_8138();

        if ( isdefined( var_1 ) )
            self.visuals[var_0] unlink();

        if ( isbombmode() && self.visuals[var_0]._id_0336 == "sd_bomb" )
        {
            self.visuals[var_0].origin = level._id_2C61;
            self.visuals[var_0].angles = level._id_2C60;
        }
        else
        {
            self.visuals[var_0].origin = self.visuals[var_0]._id_28AC;
            self.visuals[var_0].angles = self.visuals[var_0]._id_2898;
        }

        self.visuals[var_0] show();
    }

    var_1 = self.trigger _meth_8138();

    if ( isdefined( var_1 ) )
        self.trigger unlink();

    self.trigger.origin = self.trigger._id_28AC;
    self.curorigin = self.trigger.origin;

    if ( isdefined( self._id_C581 ) )
        self [[ self._id_C581 ]]();

    _id_41A0();
    _id_12F68();
    _id_12E7B();
    self._id_9F24 = 0;
    self notify( "reset_done" );
}

_id_9E35()
{
    if ( isdefined( self._id_3AA8 ) )
        return 0;

    if ( self.curorigin != self.trigger._id_28AC )
        return 0;

    return 1;
}

_id_F806( var_0, var_1 )
{
    self._id_9F24 = 1;

    for ( var_2 = 0; var_2 < self.visuals.size; var_2++ )
    {
        self.visuals[var_2].origin = var_0;
        self.visuals[var_2].angles = var_1;
        self.visuals[var_2] show();
    }

    self.trigger.origin = var_0;

    if ( level.gametype == "ball" || level.gametype == "tdef" )
        self.trigger linkto( self.visuals[0] );

    self.curorigin = self.trigger.origin;
    _id_41A0();
    _id_12F68();
    _id_12E7B();
    self._id_9F24 = 0;
}

_id_C578()
{
    if ( isdefined( self.carryobject ) )
        self.carryobject thread setdropped();
}

_id_3AF8( var_0 )
{
    for ( var_1 = 0; var_1 < var_0.carryobject.visuals.size; var_1++ )
        var_0.carryobject.visuals[var_1] unlink();

    var_0.carryobject.trigger unlink();
    var_0.carryobject thread setdropped( 1 );
}

setdropped( var_0 )
{
    if ( isdefined( self.setdropped ) )
    {
        if ( [[ self.setdropped ]]() )
            return;
    }

    self._id_9F24 = 1;
    self._id_E25D = undefined;
    self notify( "dropped" );

    foreach ( var_2 in self.visuals )
        var_2._id_D887 = var_2 _meth_82C7( 0 );

    if ( isdefined( self._id_3AA8 ) )
        var_4 = self._id_3AA8.origin;
    else
        var_4 = self.curorigin;

    if ( scripts\mp\utility\game::istrue( level.botsenabled ) || isdefined( self.ftldrop ) || touchingdroptonavmeshtrigger( var_4 ) || level._id_B335 == "mp_junk" && level.gametype == "ctf" && !self._id_3AA8 touchingarbitraryuptrigger() )
    {
        var_4 = getclosestpointonnavmesh( var_4 );

        if ( isdefined( self.ftldrop ) )
            self.ftldrop = undefined;
    }

    var_5 = 20;
    var_6 = 4000;
    var_7 = ( 0, 0, 0 );

    if ( self._id_3AA8 touchingarbitraryuptrigger() )
    {
        var_8 = self._id_3AA8 _meth_8517();
        var_7 = anglestoup( var_8 );

        if ( var_7[2] < 0 )
        {
            var_5 = -20;
            var_6 = -4000;
        }
    }

    var_9 = var_4 + ( 0, 0, var_5 );
    var_10 = var_4 - ( 0, 0, var_6 );
    var_11 = scripts\engine\trace::_id_48BC( 0, 1, 1, 0, 0, 1, 1 );
    var_12 = [];
    var_12[0] = self.visuals[0];
    var_12[1] = self._id_3AA8;

    if ( isdefined( self._id_3AA8 ) && self._id_3AA8.team != "spectator" )
    {
        if ( level.gametype != "ctf" )
            var_13 = scripts\engine\trace::_id_3A09( var_9, var_10, 8, 16, ( 0, 0, 0 ), var_12, var_11, 0 );
        else
            var_13 = scripts\engine\trace::_id_3A09( var_9, var_10, 2, 4, ( 0, 0, 0 ), var_12, var_11, 0 );
    }
    else
    {
        var_13 = scripts\engine\trace::_id_DCED( self._id_EA28 + ( 0, 0, 20 ), self._id_EA28 - ( 0, 0, 20 ), var_12, var_11, 0 );

        if ( isplayer( var_13["entity"] ) )
            var_13["entity"] = undefined;
    }

    foreach ( var_2 in self.visuals )
        var_2 _meth_82C7( var_2._id_D887 );

    var_16 = self._id_3AA8;
    var_17 = 0;

    if ( isdefined( var_13 ) )
    {
        var_18 = randomfloat( 360 );
        var_19 = var_13["position"];

        if ( isdefined( self._id_1349F ) )
            var_19 += self._id_1349F;

        var_20 = ( cos( var_18 ), sin( var_18 ), 0 );
        var_20 = vectornormalize( var_20 - var_13["normal"] * vectordot( var_20, var_13["normal"] ) );
        var_21 = 0;

        if ( level.gametype == "ctf" || isbombmode() )
        {
            if ( self._id_3AA8 touchingarbitraryuptrigger() && var_7[2] < 0 )
            {
                var_22 = ( 0, 0, -180 );

                if ( isdefined( self._id_1349F ) )
                    var_19 -= self._id_1349F * 2;

                if ( level.gametype == "ctf" )
                    var_21 = -80;

                if ( isbombmode() )
                    var_21 = -30;
            }
            else
                var_22 = ( 0, 0, 0 );
        }
        else
            var_22 = vectortoangles( var_20 );

        for ( var_23 = 0; var_23 < self.visuals.size; var_23++ )
        {
            self.visuals[var_23].origin = var_19;
            self.visuals[var_23].angles = var_22;
            self.visuals[var_23] show();
        }

        self.trigger.origin = var_19 + ( 0, 0, var_21 );
        self.curorigin = self.trigger.origin;
        var_24 = undefined;

        if ( !isplayer( var_13["entity"] ) || !isbot( var_13["entity"] ) || !isagent( var_13["entity"] ) )
            var_24 = var_13["entity"];

        if ( isdefined( var_24 ) && isdefined( var_24.owner ) )
        {
            var_25 = var_24 _meth_8138();

            if ( isdefined( var_25 ) )
                var_24 = var_25;
        }

        if ( isdefined( var_24 ) )
        {
            if ( isdefined( var_24._id_9B09 ) && var_24._id_9B09 == 1 )
                self._id_E25D = 1;
            else
            {
                for ( var_23 = 0; var_23 < self.visuals.size; var_23++ )
                    self.visuals[var_23] linkto( var_24 );

                self.trigger linkto( var_24 );
                var_26 = spawnstruct();
                var_26.carryobject = self;
                var_26._id_4E53 = ::_id_3AF8;
                self.trigger thread scripts\mp\movers::_id_892F( var_26 );
            }
        }

        if ( !isdefined( var_0 ) )
            thread _id_CB49();
    }
    else
    {
        for ( var_23 = 0; var_23 < self.visuals.size; var_23++ )
        {
            self.visuals[var_23].origin = self.visuals[var_23]._id_28AC;
            self.visuals[var_23].angles = self.visuals[var_23]._id_2898;
            self.visuals[var_23] show();
        }

        self.trigger.origin = self.trigger._id_28AC;
        self.curorigin = self.trigger._id_28AC;
    }

    if ( isdefined( self._id_C4F9 ) && !isdefined( var_0 ) )
        self [[ self._id_C4F9 ]]( var_16 );

    _id_41A0();
    _id_12E7B();
    _id_12F68();
    self._id_9F24 = 0;
}

_id_F67F( var_0 )
{
    self._id_3AA8 = var_0;
    thread _id_12F59();
}

_id_41A0()
{
    if ( !isdefined( self._id_3AA8 ) )
        return;

    self._id_3AA8 thread _id_11471( self );
    self._id_3AA8 = undefined;
    self notify( "carrier_cleared" );
}

_id_CB49()
{
    self endon( "pickup_object" );
    self endon( "reset_done" );
    wait 0.05;

    if ( isdefined( self._id_E25D ) )
    {
        self._id_E25D = undefined;
        _id_E472();
        return;
    }

    for ( var_0 = 0; var_0 < level.radtriggers.size; var_0++ )
    {
        if ( !self.visuals[0] istouching( level.radtriggers[var_0] ) )
            continue;

        _id_E472();
        return;
    }

    for ( var_0 = 0; var_0 < level.minetriggers.size; var_0++ )
    {
        if ( !self.visuals[0] istouching( level.minetriggers[var_0] ) )
            continue;

        _id_E472();
        return;
    }

    for ( var_0 = 0; var_0 < level.hurttriggers.size; var_0++ )
    {
        if ( !self.visuals[0] istouching( level.hurttriggers[var_0] ) )
            continue;

        _id_E472();
        return;
    }

    if ( scripts\mp\utility\game::istrue( level.ballallowedtriggers.size ) )
    {
        self.allowedintrigger = 0;

        foreach ( var_2 in level.ballallowedtriggers )
        {
            if ( self.visuals[0] istouching( var_2 ) )
            {
                self.allowedintrigger = 1;
                break;
            }
        }
    }

    foreach ( var_2 in level._id_C7B3 )
    {
        if ( scripts\mp\utility\game::istrue( self.allowedintrigger ) )
            break;

        if ( !self.visuals[0] istouching( var_2 ) )
            continue;

        _id_E472();
        return;
    }

    if ( isdefined( self._id_2667 ) )
    {
        wait( self._id_2667 );

        if ( !isdefined( self._id_3AA8 ) )
            _id_E472();
    }
}

_id_11471( var_0 )
{
    if ( isdefined( self._id_3AF5 ) )
        self._id_3AF5 scripts\mp\hud_util::_id_52DC();

    if ( isdefined( self ) )
        self.carryobject = undefined;

    self notify( "drop_object" );

    if ( var_0._id_127CB == "proximity" )
        thread _id_CB44( var_0 );

    if ( scripts\mp\utility\game::isreallyalive( self ) && !var_0._id_1CB3 )
    {
        if ( isdefined( var_0._id_3B01 ) )
        {
            var_1 = isdefined( var_0._id_A575 ) && var_0._id_A575;

            if ( !var_0._id_3AF0 && !var_1 )
            {
                if ( isdefined( var_0._id_27F4 ) )
                    wait 0.25;

                self notify( "clear_carrier" );

                if ( scripts\mp\utility\game::_id_9F20( var_0._id_3B01 ) )
                    scripts\mp\utility\game::_id_1529( var_0._id_3B01 );
                else
                    scripts\mp\utility\game::_id_141E( var_0._id_3B01 );

                var_2 = var_0._id_A978;
                thread scripts\mp\utility\game::_id_72ED( var_2 );
            }
            else
            {

            }

            self _meth_80DB();
            scripts\engine\utility::_id_1C76( 1 );
        }
        else if ( !var_0._id_1CB3 )
            scripts\engine\utility::_id_1C71( 1 );
    }
}

_id_11ACC()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );

    while ( isdefined( self.carryobject ) && scripts\mp\utility\game::isreallyalive( self ) )
    {
        if ( self isonground() )
        {
            var_0 = bullettrace( self.origin + ( 0, 0, 20 ), self.origin - ( 0, 0, 20 ), 0, undefined );

            if ( var_0["fraction"] < 1 )
                self.carryobject._id_EA28 = var_0["position"];
        }

        wait 0.05;
    }
}

_id_B31B()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "drop_object" );

    for (;;)
    {
        while ( self attackbuttonpressed() || self fragbuttonpressed() || self secondaryoffhandbuttonpressed() || self meleebuttonpressed() )
            wait 0.05;

        while ( !self attackbuttonpressed() && !self fragbuttonpressed() && !self secondaryoffhandbuttonpressed() || self meleebuttonpressed() )
            wait 0.05;

        if ( isdefined( self.carryobject ) && !self usebuttonpressed() )
            self.carryobject thread setdropped();
    }
}

_id_51DA()
{
    foreach ( var_1 in level._id_115DA )
    {
        scripts\mp\objidpoolmanager::returnminimapid( self._id_115DC[var_1] );
        scripts\mp\objpoints::deleteobjpoint( self.objpoints[var_1] );

        if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
        {
            var_2 = "mlg_" + var_1;
            scripts\mp\objpoints::deleteobjpoint( self.objpoints[var_2] );
        }
    }

    self.trigger delete();
    self.trigger = undefined;
    self notify( "deleted" );
}

createuseobject( var_0, var_1, var_2, var_3 )
{
    var_4 = spawnstruct();
    var_4.type = "useObject";
    var_4.curorigin = var_1.origin;
    var_4._id_C83E = var_0;
    var_4.entnum = var_1 getentitynumber();
    var_4._id_A5A0 = undefined;

    if ( issubstr( var_1.classname, "use" ) )
        var_4._id_127CB = "use";
    else
        var_4._id_127CB = "proximity";

    var_4.trigger = var_1;

    for ( var_5 = 0; var_5 < var_2.size; var_5++ )
    {
        var_2[var_5]._id_28AC = var_2[var_5].origin;
        var_2[var_5]._id_2898 = var_2[var_5].angles;
    }

    var_4.visuals = var_2;

    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    var_4._id_C363 = var_3;
    var_4._id_4465 = [];

    foreach ( var_7 in level._id_115DA )
    {
        var_4._id_115DC[var_7] = scripts\mp\objidpoolmanager::requestminimapid( 99 );

        if ( var_4._id_115DC[var_7] != -1 )
        {
            scripts\mp\objidpoolmanager::minimap_objective_add( var_4._id_115DC[var_7], "invisible", var_4.curorigin );
            scripts\mp\objidpoolmanager::minimap_objective_team( var_4._id_115DC[var_7], var_7 );
        }

        var_4.objpoints[var_7] = scripts\mp\objpoints::_id_4A23( "objpoint_" + var_7 + "_" + var_4.entnum, var_4.curorigin + var_3, var_7, undefined );
        var_4.objpoints[var_7].alpha = 0;

        if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
        {
            var_8 = "mlg_" + var_7;
            var_4.objpoints[var_8] = scripts\mp\objpoints::_id_4A23( "objpoint_" + var_8 + "_" + var_4.entnum, var_4.curorigin + var_3, var_7, undefined );
            var_4.objpoints[var_8].alpha = 0;
        }
    }

    var_4._id_9A52 = "none";
    var_4._id_13DCA = [];
    var_4._id_1343B = "none";
    var_4._id_C5BB = undefined;
    var_4._id_C4D4 = undefined;
    var_4._id_130EB = "default";
    var_4._id_130EE = 10000;
    var_4._id_4B30 = 0;
    var_4._id_10B51 = 0;
    var_4.wasstalemate = 0;
    var_4._id_115DF = [];
    var_4._id_115DF["none"] = 0;
    var_4._id_115DF["allies"] = 0;
    var_4._id_115DF["axis"] = 0;

    if ( var_4._id_127CB == "proximity" )
    {
        var_4._id_115F2 = [];
        var_4._id_115F1 = [];
        var_4._id_C248["neutral"] = 0;
        var_4._id_11A45["neutral"] = [];
        var_4._id_C248["none"] = 0;
        var_4._id_11A45["none"] = [];

        foreach ( var_11 in level._id_115DA )
        {
            var_4._id_C248[var_11] = 0;
            var_4._id_11A45[var_11] = [];
        }

        var_4._id_130C7 = 0;
        var_4._id_3FF9 = "none";
        var_4._id_3FF8 = undefined;
        var_4._id_A95A = "none";
        var_4._id_A95B = 0;
        var_4._id_BDF4 = 0;
        var_4._id_3897 = 0;
        var_4 thread _id_130B0();
    }
    else
    {
        var_4._id_130C7 = 1;
        var_4 thread _id_130B1();
    }

    return var_4;
}

_id_F76A( var_0 )
{
    self._id_A5A0 = var_0;
}

_id_130B1()
{
    level endon( "game_ended" );
    self endon( "deleted" );

    for (;;)
    {
        self.trigger waittill( "trigger", var_0 );

        if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
            continue;

        if ( !_id_38C3( var_0.pers["team"] ) )
            continue;

        if ( !var_0 isonground() )
            continue;

        if ( !var_0 scripts\mp\utility\game::isjuggernaut() && scripts\mp\utility\game::_id_9E6C( var_0 getcurrentweapon() ) )
            continue;

        if ( isdefined( self._id_13056 ) )
        {
            if ( !self [[ self._id_13056 ]]( var_0 ) )
                continue;
        }

        if ( isdefined( self._id_A5A0 ) && ( !isdefined( var_0.carryobject ) || var_0.carryobject != self._id_A5A0 ) )
        {
            if ( isdefined( self._id_C4D4 ) )
                self [[ self._id_C4D4 ]]( var_0 );

            continue;
        }

        if ( var_0 hasweapon( self._id_130F8 ) )
            continue;

        if ( !var_0 scripts\engine\utility::_id_9FFD() )
            continue;

        var_1 = 1;

        if ( self._id_130EE > 0 )
        {
            if ( isdefined( self._id_C4CB ) )
            {
                var_0 _id_12F53( self, 0 );
                self [[ self._id_C4CB ]]( var_0 );
            }

            if ( !isdefined( self._id_A5A0 ) )
                thread _id_3930();

            var_2 = var_0.pers["team"];
            var_1 = _id_13093( var_0 );
            self notify( "finished_use" );

            if ( isdefined( self._id_C50D ) )
                self [[ self._id_C50D ]]( var_2, var_0, var_1 );
        }

        if ( !var_1 )
            continue;

        if ( isdefined( self._id_C5BB ) )
            self [[ self._id_C5BB ]]( var_0 );
    }
}

_id_3E22( var_0 )
{
    if ( !isdefined( self._id_A5A0 ) )
        return 1;

    if ( !isdefined( var_0.carryobject ) )
        return 0;

    var_1 = self._id_A5A0;

    if ( !isarray( var_1 ) )
        var_1 = [ var_1 ];

    foreach ( var_3 in var_1 )
    {
        if ( var_3 == var_0.carryobject )
            return 1;
    }

    return 0;
}

_id_3930()
{
    level endon( "game_ended" );
    self endon( "deleted" );
    self endon( "finished_use" );

    for (;;)
    {
        self.trigger waittill( "trigger", var_0 );

        if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
            continue;

        if ( !_id_38C3( var_0.pers["team"] ) )
            continue;

        if ( isdefined( self._id_C4D4 ) )
            self [[ self._id_C4D4 ]]( var_0 );
    }
}

_id_7E8B()
{
    var_0 = self._id_3FF9;

    if ( scripts\mp\utility\game::isreallyalive( self._id_3FF8 ) )
        var_1 = self._id_3FF8;
    else
        var_1 = undefined;

    if ( self._id_11A45[var_0].size > 0 )
    {
        var_2 = undefined;
        var_3 = getarraykeys( self._id_11A45[var_0] );

        for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        {
            var_5 = self._id_11A45[var_0][var_3[var_4]];

            if ( scripts\mp\utility\game::isreallyalive( var_5.player ) && ( !isdefined( var_2 ) || var_5._id_10DFF < var_2 ) )
            {
                var_1 = var_5.player;
                var_2 = var_5._id_10DFF;
            }
        }
    }

    return var_1;
}

_id_130B0()
{
    level endon( "game_ended" );
    self endon( "deleted" );
    thread _id_DAD2();

    for (;;)
    {
        if ( self._id_3897 && self._id_10B51 != self.wasstalemate )
        {
            if ( self._id_10B51 )
            {
                if ( isdefined( self._id_C4D9 ) )
                    self [[ self._id_C4D9 ]]();
            }
            else
            {
                var_0 = "none";

                if ( self._id_C248["allies"] )
                    var_0 = "allies";
                else if ( self._id_C248["axis"] )
                    var_0 = "axis";

                if ( var_0 == "none" && self._id_C83E != "neutral" )
                    var_0 = self._id_C83E;

                if ( isdefined( self._id_C5B9 ) )
                    self [[ self._id_C5B9 ]]( var_0 );

                _id_F690( "none" );
                self._id_3FF8 = undefined;
            }

            self.wasstalemate = self._id_10B51;
        }
        else if ( self._id_BDF4 && self._id_C83E != "neutral" && !self._id_C248[self._id_C83E] )
        {
            if ( isdefined( self._id_C5BA ) )
                self [[ self._id_C5BA ]]();

            _id_F690( "none" );
            self._id_3FF8 = undefined;
        }

        if ( self._id_3FF9 != "none" )
        {
            if ( !self._id_130EE )
            {
                if ( !self._id_10B51 )
                {
                    var_1 = _id_7E8B();

                    if ( isdefined( self._id_C5BB ) )
                        self [[ self._id_C5BB ]]( self._id_3FF8 );

                    _id_F690( "none" );
                    self._id_3FF8 = undefined;
                }
            }
            else if ( self._id_130EE && self._id_115DF[self._id_3FF9] >= self._id_130EE )
            {
                self._id_4B30 = 0.0;
                self._id_115DF[self._id_3FF9] = self._id_4B30;
                var_1 = _id_7E8B();

                if ( isdefined( self._id_C50D ) )
                    self [[ self._id_C50D ]]( self._id_3FF9, var_1, isdefined( var_1 ) );

                if ( isdefined( var_1 ) && isdefined( self._id_C5BB ) )
                    self [[ self._id_C5BB ]]( var_1 );

                _id_F690( "none" );
                self._id_3FF8 = undefined;
            }
            else if ( !self._id_10B51 && self._id_130EE && self._id_C83E != self._id_3FF9 )
            {
                if ( !self._id_C248[self._id_3FF9] )
                {
                    if ( isdefined( self._id_C50D ) )
                        self [[ self._id_C50D ]]( self._id_3FF9, self._id_3FF8, 0 );

                    _id_F690( "none" );
                    self._id_3FF8 = undefined;
                }
                else
                {
                    self._id_4B30 += 50 * self._id_130C7;
                    self._id_115DF[self._id_3FF9] = self._id_4B30;

                    if ( self._id_C83E != level._id_C74B[self._id_3FF9] )
                        self._id_115DF[level._id_C74B[self._id_3FF9]] = 0;

                    if ( isdefined( self._id_C5C8 ) )
                        self [[ self._id_C5C8 ]]( self._id_3FF9, self._id_115DF[self._id_3FF9] / self._id_130EE, 50 * self._id_130C7 / self._id_130EE, self._id_3FF8 );
                }
            }
        }

        wait 0.05;
        scripts\mp\hostmigration::waittillhostmigrationdone();
    }
}

_id_130AE( var_0 )
{
    level endon( "game_ended" );
    self endon( "deleted" );

    for (;;)
    {
        wait 0.1;

        if ( self._id_C83E != "neutral" )
        {
            if ( self._id_C248[self._id_C83E] >= 1 && !self._id_10B51 )
            {
                self._id_4B30 = 0;
                self._id_115DF[self._id_3FF9] = self._id_4B30;
                break;
            }
        }

        if ( self._id_3FF9 == "none" )
        {
            if ( self._id_130EE )
            {
                wait 0.1;

                if ( self._id_3FF9 == "none" && !self._id_10B51 )
                    self._id_4B30 -= 50;

                self._id_115DF[self._id_A95A] = self._id_4B30;
            }

            if ( self._id_115DF[self._id_A95A] <= 0 )
            {
                self._id_4B30 = 0;
                self._id_115DF[self._id_A95A] = self._id_4B30;
                break;
            }
        }

        scripts\mp\hostmigration::waittillhostmigrationdone();
    }
}

_id_3895( var_0 )
{
    if ( isdefined( self._id_3AA8 ) )
        return 0;

    if ( self._id_3897 )
    {
        var_1 = _id_8019( var_0.pers["team"] );

        if ( var_1 != 0 )
            return 0;
    }

    if ( _id_3E22( var_0 ) )
        return 1;

    return 0;
}

_id_DAD2()
{
    level endon( "game_ended" );
    self endon( "deleted" );
    var_0 = self.entnum;

    for (;;)
    {
        self.trigger waittill( "trigger", var_1 );

        if ( !scripts\mp\utility\game::isreallyalive( var_1 ) )
            continue;

        if ( isagent( var_1 ) )
            continue;

        if ( !scripts\mp\utility\game::_id_9E0E( var_1 ) )
            continue;

        if ( isdefined( self._id_3AA8 ) )
            continue;

        if ( isdefined( var_1._id_108DB ) )
            continue;

        if ( var_1 _meth_8568() )
            continue;

        if ( isdefined( var_1.classname ) && var_1.classname == "script_vehicle" )
            continue;

        if ( !isdefined( var_1._id_987A ) )
            continue;

        var_2 = _id_80E6( var_1.pers["team"] );

        if ( isdefined( self._id_115F2[var_2] ) && self._id_115F2[var_2] < 0 )
            continue;

        if ( !scripts\mp\equipment\phase_shift::_id_213D( self, var_1 ) )
            continue;

        if ( self._id_3FF9 == "none" && _id_38C3( var_1.pers["team"], var_1 ) )
        {
            if ( _id_3895( var_1 ) )
            {
                if ( !_id_DAD1( var_1 ) )
                    continue;

                _id_F690( var_1.pers["team"] );
                self._id_3FF8 = var_1;

                if ( isdefined( self._id_115F2[var_2] ) )
                    self._id_130EE = self._id_115F2[var_2];

                if ( self._id_130EE && isdefined( self._id_C4CB ) )
                    self [[ self._id_C4CB ]]( self._id_3FF8 );
            }
            else if ( isdefined( self._id_C4D4 ) )
                self [[ self._id_C4D4 ]]( var_1 );
        }

        if ( scripts\mp\utility\game::isreallyalive( var_1 ) && !isdefined( var_1._id_11A46[var_0] ) )
            var_1 thread _id_127CA( self );
    }
}

_id_DAD1( var_0 )
{
    if ( !isdefined( self._id_E1BA ) )
        return 1;

    var_1 = var_0 geteye();
    var_2 = scripts\engine\trace::_id_48BC( 0, 1, 1, 1, 0, 1, 0 );
    var_3 = [];

    if ( level.gametype == "tdef" || scripts\mp\utility\game::istrue( level._id_53E1 ) )
    {
        var_4 = self.trigger.origin + ( 0, 0, 16 );
        var_5 = 0;
        var_3[0] = self.visuals[0];
    }
    else if ( level.gametype == "ball" )
    {
        var_4 = self.trigger.origin + ( 0, 0, 8 );
        var_5 = 0;
        var_3[0] = self.visuals[0];
    }
    else
    {
        var_4 = self.trigger.origin + ( 0, 0, 32 );
        var_5 = 1;
        var_3[0] = self.visuals;
    }

    var_3[1] = self._id_3AA8;
    var_6 = scripts\engine\trace::_id_DCED( var_1, var_4, var_3, var_2, 0 );

    if ( var_6["fraction"] != 1 && var_5 )
    {
        var_4 = self.trigger.origin + ( 0, 0, 16 );
        var_6 = scripts\engine\trace::_id_DCED( var_1, var_4, var_3, var_2, 0 );
    }

    if ( var_6["fraction"] != 1 )
    {
        var_4 = self.trigger.origin + ( 0, 0, 0 );
        var_6 = scripts\engine\trace::_id_DCED( var_1, var_4, var_3, var_2, 0 );
    }

    return var_6["fraction"] == 1;
}

_id_F690( var_0 )
{
    if ( !isdefined( self._id_3FF7 ) )
        self._id_3FF7 = 1000;

    if ( self._id_3FF9 == "none" && gettime() - self._id_A95B > self._id_3FF7 )
    {
        self._id_4B30 = 0;
        self._id_115DF[var_0] = self._id_4B30;
    }
    else if ( var_0 != "none" && var_0 != self._id_A95A )
    {
        self._id_4B30 = 0;
        self._id_115DF[var_0] = self._id_4B30;
    }

    self._id_A95A = self._id_3FF9;
    self._id_A95B = gettime();
    self._id_3FF9 = var_0;
    _id_12F57();
}

_id_7E29()
{
    return self._id_3FF9;
}

_id_127CA( var_0 )
{
    var_1 = self.pers["team"];
    var_0._id_C248[var_1]++;
    var_2 = self.guid;
    var_3 = spawnstruct();
    var_3.player = self;
    var_3._id_10DFF = gettime();
    var_0._id_11A45[var_1][var_2] = var_3;

    if ( !isdefined( var_0._id_C18B ) )
        var_0._id_C18B = 0;

    self._id_11A46[var_0.entnum] = var_0.trigger;
    var_0 _id_12F57();

    while ( scripts\mp\utility\game::isreallyalive( self ) && isdefined( var_0.trigger ) && self istouching( var_0.trigger ) && !level._id_7669 )
    {
        if ( !scripts\mp\equipment\phase_shift::_id_213D( self, var_0 ) )
            break;

        if ( isplayer( self ) && var_0._id_130EE > 50 )
            _id_12F53( var_0, 1 );

        wait 0.05;
    }

    if ( isdefined( self ) )
    {
        if ( var_0._id_130EE > 50 )
        {
            if ( isplayer( self ) )
                _id_12F53( var_0, 0 );

            self._id_11A46[var_0.entnum] = undefined;
        }
        else
            self._id_11A46[var_0.entnum] = undefined;
    }

    if ( level._id_7669 )
        return;

    var_0._id_C405 = var_0._id_11A45;
    var_0._id_11A45[var_1][var_2] = undefined;
    var_0._id_C248[var_1]--;
    var_0 _id_12F57();
}

_id_B737( var_0 )
{
    var_0._id_B737 = 1;
    level waittill( "host_migration_begin" );

    if ( !isdefined( var_0 ) || !isdefined( self ) )
        return;

    var_0 setclientomnvar( "ui_securing", 0 );
    var_0 setclientomnvar( "ui_securing_progress", 0 );
    self._id_B737 = undefined;
}

_id_8019( var_0 )
{
    return self._id_C248[scripts\mp\utility\game::_id_8027( var_0 )];
}

_id_12F53( var_0, var_1 )
{
    if ( !isdefined( level._id_90A9 ) )
    {
        var_2 = 0;

        if ( isdefined( var_0._id_115DF ) && isdefined( var_0._id_3FF9 ) )
        {
            if ( var_0._id_115DF[var_0._id_3FF9] > var_0._id_130EE )
                var_0._id_115DF[var_0._id_3FF9] = var_0._id_130EE;

            var_2 = var_0._id_115DF[var_0._id_3FF9] / var_0._id_130EE;
        }
        else
        {
            if ( var_0._id_4B30 > var_0._id_130EE )
                var_0._id_4B30 = var_0._id_130EE;

            var_2 = var_0._id_4B30 / var_0._id_130EE;
        }

        if ( level.gametype == "ctf" && !isdefined( var_0._id_92B8 ) )
        {
            if ( var_1 && scripts\mp\utility\game::istrue( var_0._id_10B51 ) )
            {
                if ( !isdefined( self._id_12B1C ) )
                {
                    if ( !isdefined( self._id_12B1B ) )
                        self._id_12B1B = 1;

                    self setclientomnvar( "ui_objective_state", -1 );
                    self._id_12B1C = 1;
                }

                var_2 = 0.01;
            }
            else if ( var_1 && isdefined( self._id_12B1B ) && isdefined( var_0._id_10B51 ) && !var_0._id_10B51 && var_0._id_C83E != self.team )
            {
                self setclientomnvar( "ui_objective_state", 1 );
                self._id_12B1B = 1;
                self._id_12B1C = undefined;
            }
            else if ( var_1 && isdefined( self._id_12B1B ) && isdefined( var_0._id_10B51 ) && !var_0._id_10B51 && var_0._id_C83E == self.team )
            {
                self setclientomnvar( "ui_objective_state", 2 );
                self._id_12B1B = 1;
                self._id_12B1C = undefined;
            }
            else
            {
                if ( !var_1 && isdefined( self._id_12B1C ) )
                {
                    self setclientomnvar( "ui_objective_state", 0 );
                    self._id_12B1B = undefined;
                }

                if ( var_1 && !isdefined( self._id_12B1C ) && var_0._id_C83E == self.team )
                {
                    self setclientomnvar( "ui_objective_state", 0 );
                    self._id_12B1B = undefined;
                }

                if ( var_1 && !isdefined( self._id_12B1B ) )
                {
                    if ( var_0._id_C83E != self.team )
                    {
                        self setclientomnvar( "ui_objective_state", 1 );
                        self._id_12B1B = 1;
                    }
                    else if ( var_0._id_9A52 == "any" )
                    {
                        self setclientomnvar( "ui_objective_state", 2 );
                        self._id_12B1B = 1;
                    }
                }

                self._id_12B1C = undefined;
            }

            if ( !var_1 )
            {
                var_2 = 0.01;
                self setclientomnvar( "ui_objective_state", 0 );
                self._id_12B1B = undefined;
            }

            if ( var_2 != 0 )
            {
                if ( isdefined( var_0._id_115DF ) && isdefined( var_0._id_3FF9 ) && var_1 )
                    self setclientomnvar( "ui_objective_progress", var_0._id_115DF[self.team] / var_0._id_130EE );
                else
                    self setclientomnvar( "ui_objective_progress", var_2 );
            }
        }

        if ( _id_8BE7() && isdefined( var_0._id_92B8 ) && ( var_0._id_92B8 == "domFlag" || var_0._id_92B8 == "hardpoint" ) )
        {
            var_3 = 0;

            if ( level.gametype == "koth" || level.gametype == "grnd" )
            {
                var_3 = 7;

                if ( scripts\mp\utility\game::istrue( level._id_13097 ) && isdefined( var_0._id_C83E ) && var_0._id_C83E != "neutral" )
                    var_3 = 8;
            }
            else
            {
                if ( var_0._id_01AD == "_a" )
                    var_3 = 1;
                else if ( var_0._id_01AD == "_b" )
                    var_3 = 2;
                else if ( var_0._id_01AD == "_c" )
                    var_3 = 3;

                if ( scripts\mp\utility\game::istrue( var_0.neutralizing ) )
                    var_3 += 3;
            }

            if ( var_1 && isdefined( var_0._id_10B51 ) && var_0._id_10B51 )
            {
                if ( !isdefined( self._id_12B1E ) )
                {
                    if ( !isdefined( self._id_12B1D ) )
                        self._id_12B1D = 1;

                    self setclientomnvar( "ui_objective_state", -1 );
                    self._id_12B1E = 1;
                }

                var_2 = 0.01;
            }
            else if ( var_1 && isdefined( self._id_12B1D ) && isdefined( var_0._id_10B51 ) && !var_0._id_10B51 && var_0._id_C83E != self.team )
            {
                self setclientomnvar( "ui_objective_state", var_3 );
                self._id_12B1D = 1;
                self._id_12B1E = undefined;
            }
            else
            {
                if ( !var_1 && isdefined( self._id_12B1E ) )
                {
                    self setclientomnvar( "ui_objective_state", 0 );
                    self._id_12B1D = undefined;
                }

                if ( var_1 && !isdefined( self._id_12B1E ) && var_0._id_C83E == self.team )
                {
                    self setclientomnvar( "ui_objective_state", 0 );
                    self._id_12B1D = undefined;
                }

                if ( var_1 && !isdefined( self._id_12B1D ) && var_0._id_C83E != self.team )
                {
                    self setclientomnvar( "ui_objective_state", var_3 );
                    self._id_12B1D = 1;
                }

                self._id_12B1E = undefined;
            }

            if ( !var_1 || !var_0 _id_38C3( self.team ) && ( !isdefined( var_0._id_10B51 ) || isdefined( var_0._id_10B51 ) && !var_0._id_10B51 ) )
            {
                var_2 = 0.01;
                self setclientomnvar( "ui_objective_state", 0 );
                self._id_12B1D = undefined;
            }

            if ( var_2 != 0 )
            {
                if ( isdefined( var_0._id_115DF ) && isdefined( var_0._id_3FF9 ) && var_1 )
                {
                    self setclientomnvar( "ui_objective_progress", var_0._id_115DF[self.team] / var_0._id_130EE );
                    return;
                }

                self setclientomnvar( "ui_objective_progress", var_2 );
                return;
                return;
            }
        }
        else if ( isbombmode() && isdefined( var_0._id_92B8 ) && ( var_0._id_92B8 == "bomb_zone" || var_0._id_92B8 == "defuse_object" ) )
        {
            if ( isdefined( self ) )
            {
                if ( var_1 && isdefined( self ) )
                {
                    if ( !isdefined( self._id_12B1A ) )
                    {
                        var_4 = 0;

                        if ( var_0._id_92B8 == "bomb_zone" )
                            var_4 = 1;
                        else if ( var_0._id_92B8 == "defuse_object" )
                            var_4 = 2;

                        self setclientomnvar( "ui_objective_state", var_4 );
                        self._id_12B1A = 1;
                    }
                }
                else
                {
                    self setclientomnvar( "ui_objective_state", 0 );
                    self._id_12B1A = undefined;
                    var_2 = 0.01;
                }

                if ( var_2 != 0 )
                {
                    if ( isdefined( var_0._id_115DF ) && isdefined( var_0._id_3FF9 ) && var_1 )
                        self setclientomnvar( "ui_objective_progress", var_0._id_115DF[self.team] / var_0._id_130EE );
                    else
                        self setclientomnvar( "ui_objective_progress", var_2 );
                }
            }
        }
        else if ( isdefined( var_0._id_92B8 ) )
        {
            var_4 = 0;

            switch ( var_0._id_92B8 )
            {
                case "care_package":
                    var_4 = 1;
                    break;
                case "intel":
                    var_4 = 2;
                    break;
                case "deployable_vest":
                    var_4 = 3;
                    break;
                case "deployable_weapon_crate":
                    var_4 = 4;
                    break;
                case "last_stand":
                    var_4 = 5;

                    if ( isdefined( self._id_98F3 ) && self._id_98F3 )
                        var_4 = 6;

                    break;
                case "breach":
                    var_4 = 7;
                    break;
                case "use":
                    var_4 = 8;
                    break;
            }

            _id_12F55( var_2, var_1, var_4, var_0, var_0._id_130EE );
        }
    }
}

_id_8BE7()
{
    if ( level.gametype == "dom" || level.gametype == "grind" || level.gametype == "koth" || level.gametype == "grnd" || level.gametype == "siege" )
        return 1;

    return 0;
}

_id_12F55( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_1 )
    {
        if ( !isdefined( var_3._id_13074 ) )
            var_3._id_13074 = [];

        if ( !isdefined( self._id_B737 ) )
            var_3 thread _id_B737( self );

        if ( !_id_693C( self, var_3._id_13074 ) )
            var_3._id_13074[var_3._id_13074.size] = self;

        if ( !isdefined( self._id_12B26 ) )
        {
            self setclientomnvar( "ui_securing", var_2 );
            self._id_12B26 = 1;
        }
    }
    else
    {
        if ( isdefined( var_3._id_13074 ) && _id_693C( self, var_3._id_13074 ) )
            var_3._id_13074 = scripts\engine\utility::array_remove( var_3._id_13074, self );

        self setclientomnvar( "ui_securing", 0 );
        self._id_12B26 = undefined;
        var_0 = 0.01;
    }

    if ( var_4 == 500 )
        var_0 = min( var_0 + 0.15, 1 );

    if ( var_0 != 0 )
        self setclientomnvar( "ui_securing_progress", var_0 );
}

_id_693C( var_0, var_1 )
{
    if ( var_1.size > 0 )
    {
        foreach ( var_3 in var_1 )
        {
            if ( var_3 == var_0 )
                return 1;
        }
    }

    return 0;
}

_id_12F57()
{
    if ( self._id_3FF9 == "none" && self._id_C83E != "neutral" && self._id_C83E != "any" )
        var_0 = self._id_C83E;
    else
        var_0 = self._id_3FF9;

    var_1 = self._id_C248[var_0];
    var_2 = 0;
    var_3 = 0;

    if ( level._id_BDCC )
    {
        foreach ( var_5 in level._id_115DA )
        {
            if ( var_0 != var_5 )
                var_2 += self._id_C248[var_5];
        }
    }
    else
    {
        if ( var_0 != "axis" )
            var_2 += self._id_C248["axis"];

        if ( var_0 != "allies" )
            var_2 += self._id_C248["allies"];
    }

    foreach ( var_8 in self._id_11A45[var_0] )
    {
        if ( !isdefined( var_8.player ) )
            continue;

        if ( var_8.player.pers["team"] != var_0 )
            continue;

        if ( var_8.player._id_C2AD == 1 )
            continue;

        var_1 *= var_8.player._id_C2AD;
        var_3 = var_8.player._id_C2AD;
    }

    self._id_10B51 = var_1 && var_2;
    self._id_130C7 = 0;

    if ( var_1 && !var_2 )
        self._id_130C7 = min( var_1, 4 );

    if ( isdefined( self._id_9D49 ) && self._id_9D49 && var_3 != 0 )
        self._id_130C7 = 1 * var_3;
    else if ( isdefined( self._id_9D49 ) && self._id_9D49 )
        self._id_130C7 = 1;
}

_id_13093( var_0 )
{
    var_0 notify( "use_hold" );

    if ( isplayer( var_0 ) )
        var_0 _meth_823A( self.trigger );
    else
        var_0 linkto( self.trigger );

    var_0 _meth_8234();
    var_0 _meth_8082( self.trigger );
    var_0._id_3FFA = self.trigger;
    var_0 _meth_8423( 0 );
    var_0 unlink();

    if ( isbombmode() )
    {
        if ( scripts\mp\utility\game::_id_9D46() || scripts\mp\utility\game::istrue( level._id_101F7 ) || var_0 scripts\mp\utility\game::_id_12D6( "specialty_engineer" ) )
            self._id_130F8 = "briefcase_bomb_defuse_mp";
        else
            self._id_130F8 = "briefcase_bomb_mp";
    }

    var_1 = self._id_130F8;
    var_2 = var_0 getcurrentweapon();

    if ( isdefined( var_1 ) )
    {
        if ( var_2 == var_1 )
            var_2 = var_0._id_A9C6;

        var_0._id_A9C6 = var_2;
        var_0 scripts\mp\utility\game::_id_12C6( var_1 );
        var_0 setweaponammostock( var_1, 0 );
        var_0 setweaponammoclip( var_1, 0 );
        var_0 thread _id_11382( var_1 );
    }
    else
        var_0 scripts\engine\utility::_id_1C71( 0 );

    self._id_4B30 = 0;
    self._id_9B04 = 1;
    self._id_130C7 = 0;
    var_3 = _id_13094( var_0, var_2 );

    if ( isdefined( var_0 ) )
    {
        var_0 _id_5397();
        var_0 notify( "done_using" );
    }

    if ( isdefined( var_1 ) && isdefined( var_0 ) )
    {
        var_0 scripts\mp\supers::_id_12D6C();

        if ( var_0 scripts\mp\utility\game::_id_9F20( var_1 ) )
            var_0 scripts\mp\utility\game::_id_1529( var_1 );
        else
            var_0 thread scripts\mp\utility\game::_id_80F2( var_1 );
    }

    if ( isdefined( var_3 ) && var_3 )
    {
        var_0 _meth_8423( 1 );
        return 1;
    }

    if ( isdefined( var_0 ) )
    {
        var_0._id_3FFA = undefined;

        if ( !isdefined( var_1 ) )
            var_0 scripts\engine\utility::_id_1C71( 1 );

        if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
            var_0._id_A64F = 1;

        var_0 _meth_8423( 1 );
    }

    self._id_9B04 = 0;
    self.trigger _meth_8257();
    return 0;
}

_id_5397()
{
    if ( isdefined( self._id_247F ) )
    {
        self _meth_8096( self._id_247F, "tag_inhand" );
        self._id_247F = undefined;
    }
}

_id_11382( var_0 )
{
    scripts\mp\supers::_id_1CAB();
    var_1 = scripts\mp\utility\game::_id_11383( var_0, 1 );

    if ( !scripts\engine\utility::_id_9CEE( var_1 ) )
    {
        scripts\mp\supers::_id_12D6C();

        if ( scripts\mp\utility\game::_id_9F20( var_0 ) )
            scripts\mp\utility\game::_id_1529( var_0 );
        else
            scripts\mp\utility\game::_id_141E( var_0 );
    }
}

_id_130E9( var_0, var_1, var_2, var_3 )
{
    if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
        return 0;

    if ( !var_0 istouching( self.trigger ) )
        return 0;

    if ( !var_0 usebuttonpressed() )
        return 0;

    if ( var_0 scripts\mp\utility\game::_id_85C7() )
        return 0;

    if ( var_0 meleebuttonpressed() )
        return 0;

    if ( self._id_4B30 >= self._id_130EE )
        return 0;

    if ( !self._id_130C7 && !var_1 )
        return 0;

    if ( var_1 && var_2 > var_3 )
        return 0;

    if ( isdefined( self._id_130F8 ) )
    {
        if ( var_0 getcurrentweapon() != self._id_130F8 && !var_0 scripts\mp\utility\game::_id_9F20( self._id_130F8 ) )
            return 0;
    }

    return 1;
}

_id_13094( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "disabled" );
    var_2 = self._id_130F8;
    var_3 = 1;

    if ( isdefined( self._id_136F6 ) )
        var_3 = self._id_136F6;

    if ( !var_3 )
        self._id_130C7 = 1 * var_0._id_C2AD;

    var_4 = 0;
    var_5 = 1.5;

    while ( _id_130E9( var_0, var_3, var_4, var_5 ) )
    {
        var_4 += 0.05;

        if ( !var_3 || !isdefined( var_2 ) || var_0 getcurrentweapon() == var_2 )
        {
            self._id_4B30 += 50 * self._id_130C7;
            self._id_130C7 = 1 * var_0._id_C2AD;
            var_3 = 0;
        }
        else
            self._id_130C7 = 0;

        var_0 _id_12F53( self, 1 );

        if ( self._id_4B30 >= self._id_130EE )
        {
            self._id_9B04 = 0;
            var_0 _meth_8083( self.trigger );
            var_0._id_3FFA = undefined;

            if ( !isdefined( var_2 ) )
                var_0 scripts\engine\utility::_id_1C71( 1 );

            var_0 unlink();
            return scripts\mp\utility\game::isreallyalive( var_0 );
        }

        wait 0.05;
        scripts\mp\hostmigration::waittillhostmigrationdone();
    }

    var_0 _id_12F53( self, 0 );
    return 0;
}

_id_12F4C()
{
    if ( self._id_127CB != "use" )
        return;

    if ( self._id_9A52 == "none" )
        self.trigger.origin -= ( 0, 0, 50000 );
    else if ( self._id_9A52 == "any" )
    {
        self.trigger.origin = self.curorigin;
        self.trigger _meth_8349( "none" );
    }
    else if ( self._id_9A52 == "friendly" )
    {
        self.trigger.origin = self.curorigin;

        if ( self._id_C83E == "allies" )
            self.trigger _meth_8349( "allies" );
        else if ( self._id_C83E == "axis" )
            self.trigger _meth_8349( "axis" );
        else
            self.trigger.origin -= ( 0, 0, 50000 );
    }
    else if ( self._id_9A52 == "enemy" )
    {
        self.trigger.origin = self.curorigin;

        if ( self._id_C83E == "allies" )
            self.trigger _meth_8349( "axis" );
        else if ( self._id_C83E == "axis" )
            self.trigger _meth_8349( "allies" );
        else
            self.trigger _meth_8349( "none" );
    }
}

_id_12F68()
{
    if ( self._id_1343B == "any" )
    {
        _id_12F67( "friendly", 1 );
        _id_12F67( "enemy", 1 );
    }
    else if ( self._id_1343B == "friendly" )
    {
        _id_12F67( "friendly", 1 );
        _id_12F67( "enemy", 0 );
    }
    else if ( self._id_1343B == "enemy" )
    {
        _id_12F67( "friendly", 0 );
        _id_12F67( "enemy", 1 );
    }
    else
    {
        _id_12F67( "friendly", 0 );
        _id_12F67( "enemy", 0 );
    }
}

getmlgteamcolor( var_0 )
{
    if ( var_0 == "allies" )
        return game["colors"]["friendly"];
    else if ( var_0 == "axis" )
        return game["colors"]["enemy"];

    return ( 1, 1, 1 );
}

setobjpointteamcolor( var_0, var_1, var_2 )
{
    if ( var_1 == "mlg_allies" )
    {
        var_0 _meth_85A9( 1, 0 );
        var_3 = self.worldiconscolor[var_2];

        if ( var_3 == "friendly" )
        {
            var_0._id_00B9 = getmlgteamcolor( "allies" );
            return;
        }

        if ( var_3 == "enemy" )
        {
            var_0._id_00B9 = getmlgteamcolor( "axis" );
            return;
        }

        var_0._id_00B9 = game["colors"][var_3];
        return;
        return;
    }
    else if ( var_1 == "mlg_axis" )
    {
        var_0 _meth_85A9( 1, 0 );
        var_3 = self.worldiconscolor[var_2];

        if ( var_3 == "friendly" )
        {
            var_0._id_00B9 = getmlgteamcolor( "axis" );
            return;
        }

        if ( var_3 == "enemy" )
        {
            var_0._id_00B9 = getmlgteamcolor( "allies" );
            return;
        }

        var_0._id_00B9 = game["colors"][var_3];
        return;
        return;
    }
    else
    {
        var_0._id_00B9 = game["colors"][self.worldiconscolor[var_2]];
        var_0 _meth_85A9( 0, 1 );
    }
}

_id_12F67( var_0, var_1 )
{
    if ( !isdefined( self._id_13DCA[var_0] ) )
        var_1 = 0;

    var_2 = _id_81F2( var_0 );

    if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
    {
        var_3 = var_2.size;

        for ( var_4 = 0; var_4 < var_3; var_4++ )
        {
            if ( var_2[var_4] == "allies" )
            {
                var_2[var_2.size] = "mlg_allies";
                continue;
            }

            if ( var_2[var_4] == "axis" )
                var_2[var_2.size] = "mlg_axis";
        }
    }

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        var_5 = "objpoint_" + var_2[var_4] + "_" + self.entnum;
        var_6 = scripts\mp\objpoints::_id_801E( var_5 );

        if ( !isdefined( var_6 ) )
            continue;

        var_6 notify( "stop_flashing_thread" );
        var_6 thread scripts\mp\objpoints::_id_11070();

        if ( var_1 )
        {
            var_6 setshader( self._id_13DCA[var_0], level._id_C2C4, level._id_C2C4 );
            var_6 fadeovertime( 0.05 );
            var_6.alpha = var_6._id_2897;
            var_6._id_9F51 = 1;

            if ( level.gametype == "dom" )
                var_6 setwaypoint( 0, 1 );
            else if ( isdefined( self._id_4465[var_0] ) )
                var_6 setwaypoint( 1, 1 );
            else
                var_6 setwaypoint( 1, 0 );

            setobjpointteamcolor( var_6, var_2[var_4], var_0 );
            var_6 _meth_85A8( getwaypointbackgroundtype( self._id_13DCA[var_0] ) );

            if ( self.type == "carryObject" )
            {
                var_7 = var_2[var_4] == "mlg_allies" || var_2[var_4] == "mlg_axis";

                if ( isdefined( self._id_3AA8 ) && ( !_id_10040( var_0 ) || var_7 ) )
                    var_6 _meth_8346( self._id_3AA8 );
                else if ( !isdefined( self._id_3AA8 ) && isdefined( self._id_C2A6 ) && self._id_C2A6 )
                    var_6 _meth_8346( self.visuals[0] );
                else
                    var_6 _meth_807D();
            }
            else if ( isdefined( self._id_C2B4 ) )
                var_6 _meth_8346( self._id_C2B4 );
        }
        else
        {
            var_6 fadeovertime( 0.05 );
            var_6.alpha = 0;
            var_6._id_9F51 = 0;
            var_6 _meth_807D();
        }

        var_6 thread _id_8EDE();
    }
}

_id_8EDE()
{
    self notify( "hideWorldIconOnGameEnd" );
    self endon( "hideWorldIconOnGameEnd" );
    self endon( "death" );
    level waittill( "game_ended" );

    if ( isdefined( self ) )
        self.alpha = 0;
}

_id_12F43( var_0, var_1 )
{

}

_id_12E7B()
{
    if ( self._id_1343B == "any" )
    {
        _id_12E7A( "friendly", 1 );
        _id_12E7A( "enemy", 1 );
    }
    else if ( self._id_1343B == "friendly" )
    {
        _id_12E7A( "friendly", 1 );
        _id_12E7A( "enemy", 0 );
    }
    else if ( self._id_1343B == "enemy" )
    {
        _id_12E7A( "friendly", 0 );
        _id_12E7A( "enemy", 1 );
    }
    else
    {
        _id_12E7A( "friendly", 0 );
        _id_12E7A( "enemy", 0 );
    }
}

updateobjectiveiconcolortype( var_0, var_1 )
{
    var_2 = self.worldiconscolor[var_1];

    if ( !isdefined( var_2 ) )
        scripts\mp\objidpoolmanager::minimap_objective_icon_colortype( var_0, 0 );
    else if ( var_2 == "friendly" )
        scripts\mp\objidpoolmanager::minimap_objective_icon_colortype( var_0, 1 );
    else if ( var_2 == "enemy" )
        scripts\mp\objidpoolmanager::minimap_objective_icon_colortype( var_0, 2 );
    else
    {
        if ( var_2 == "contest" )
        {
            scripts\mp\objidpoolmanager::minimap_objective_icon_colortype( var_0, 3 );
            return;
        }

        scripts\mp\objidpoolmanager::minimap_objective_icon_colortype( var_0, 0 );
    }
}

_id_12E7A( var_0, var_1 )
{
    var_2 = _id_81F2( var_0 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];
        var_5 = var_1;

        if ( !var_5 && _id_1007A( var_4 ) )
            var_5 = 1;

        var_6 = self._id_115DC[var_4];

        if ( var_6 != -1 )
        {
            if ( !isdefined( self._id_4465[var_0] ) || !var_5 )
            {
                scripts\mp\objidpoolmanager::minimap_objective_state( var_6, "invisible" );
                continue;
            }

            scripts\mp\objidpoolmanager::minimap_objective_icon( var_6, self._id_4465[var_0] );
            scripts\mp\objidpoolmanager::minimap_objective_state( var_6, "active" );
            scripts\mp\objidpoolmanager::minimap_objective_icon_backgroundtype( var_6, getwaypointbackgroundtype( self._id_4465[var_0] ) );
            updateobjectiveiconcolortype( var_6, var_0 );

            if ( self.type == "carryObject" )
            {
                if ( scripts\mp\utility\game::isreallyalive( self._id_3AA8 ) && !_id_10040( var_0 ) )
                    scripts\mp\objidpoolmanager::minimap_objective_onentity( var_6, self._id_3AA8 );
                else if ( isdefined( self.visuals ) && isdefined( self.visuals[0] ) && isdefined( self.visuals[0] _meth_8138() ) )
                    scripts\mp\objidpoolmanager::minimap_objective_onentity( var_6, self.visuals[0] );
                else if ( isdefined( self._id_C2A6 ) && self._id_C2A6 && !_id_10040( var_0 ) )
                    scripts\mp\objidpoolmanager::minimap_objective_onentity( var_6, self.visuals[0] );
                else
                    scripts\mp\objidpoolmanager::minimap_objective_position( var_6, self.curorigin );

                continue;
            }

            if ( isdefined( self._id_C2B4 ) )
                scripts\mp\objidpoolmanager::minimap_objective_onentity( var_6, self._id_C2B4 );
        }
    }
}

_id_10040( var_0 )
{
    if ( var_0 == "friendly" && self._id_C2BE )
        return 1;
    else if ( var_0 == "enemy" && self._id_C2BD )
        return 1;

    return 0;
}

_id_81F2( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_115DA )
    {
        if ( var_0 == "friendly" )
        {
            if ( _id_9E07( var_3 ) )
                var_1[var_1.size] = var_3;

            continue;
        }

        if ( var_0 == "enemy" )
        {
            if ( !_id_9E07( var_3 ) )
                var_1[var_1.size] = var_3;
        }
    }

    return var_1;
}

_id_1007A( var_0 )
{
    if ( !isdefined( self._id_3AA8 ) )
        return 0;

    if ( self._id_3AA8 scripts\mp\utility\game::_id_12D6( "specialty_gpsjammer" ) )
        return 0;

    return getteamradar( var_0 );
}

_id_12F59()
{
    self endon( "death" );
    self endon( "carrier_cleared" );

    for (;;)
    {
        level waittill( "radar_status_change" );
        _id_12E7B();
    }
}

_id_F7D4( var_0 )
{
    self._id_C83E = var_0;
    _id_12F4C();
    _id_12E7B();
    _id_12F68();

    if ( var_0 != "neutral" )
        self._id_D8BA = var_0;
}

_id_803E()
{
    return self._id_C83E;
}

_id_FB08( var_0 )
{
    self._id_130EE = int( var_0 * 1000 );
}

_id_FB14( var_0 )
{
    self._id_136F6 = var_0;
}

_id_FB07( var_0 )
{
    self._id_130EB = var_0;
}

_id_F87D( var_0, var_1 )
{
    self._id_115F2[var_0] = int( var_1 * 1000 );
}

_id_F87C( var_0, var_1 )
{
    self._id_115F1[var_0] = var_1;
}

_id_FB06( var_0 )
{
    self.trigger sethintstring( var_0 );
}

_id_1C7C( var_0 )
{
    self._id_9A52 = var_0;
}

allowuse( var_0 )
{
    self._id_9A52 = var_0;
    _id_12F4C();
}

_id_FB0E( var_0 )
{
    self._id_1343B = var_0;
    _id_12E7B();
    _id_12F68();
}

_id_F7A3( var_0 )
{
    if ( var_0 )
    {
        for ( var_1 = 0; var_1 < self.visuals.size; var_1++ )
        {
            self.visuals[var_1] show();

            if ( self.visuals[var_1].classname == "script_brushmodel" || self.visuals[var_1].classname == "script_model" )
            {
                foreach ( var_3 in level.players )
                {
                    if ( var_3 istouching( self.visuals[var_1] ) )
                        var_3 scripts\mp\utility\game::_id_1417();
                }

                self.visuals[var_1] thread _id_B2B1();
            }
        }
    }
    else
    {
        for ( var_1 = 0; var_1 < self.visuals.size; var_1++ )
        {
            self.visuals[var_1] hide();

            if ( self.visuals[var_1].classname == "script_brushmodel" || self.visuals[var_1].classname == "script_model" )
            {
                self.visuals[var_1] notify( "changing_solidness" );
                self.visuals[var_1] notsolid();
            }
        }
    }
}

_id_B2B1()
{
    self endon( "death" );
    self notify( "changing_solidness" );
    self endon( "changing_solidness" );

    for (;;)
    {
        for ( var_0 = 0; var_0 < level.players.size; var_0++ )
        {
            if ( level.players[var_0] istouching( self ) )
                break;
        }

        if ( var_0 == level.players.size )
        {
            self solid();
            break;
        }

        wait 0.05;
    }
}

_id_F680( var_0 )
{
    self._id_3AF1 = var_0;
}

_id_F67D( var_0 )
{
    self._id_130E5 = var_0;
}

_id_F283( var_0, var_1 )
{
    self._id_4465[var_0] = var_1;

    if ( !isdefined( var_1 ) )
        self.worldiconscolor[var_0] = "neutral";
    else
        self.worldiconscolor[var_0] = getwaypointbackgroundcolor( var_1 );

    _id_12E7B();
}

getwaypointbackgroundtype( var_0 )
{
    if ( !isdefined( level.waypointbgtype ) )
        scripts\mp\gamelogic::initwaypointbackgrounds();

    var_1 = level.waypointbgtype[var_0];

    if ( !isdefined( var_1 ) )
        return 0;

    return var_1;
}

getwaypointbackgroundcolor( var_0 )
{
    if ( !isdefined( level.waypointcolors ) )
        scripts\mp\gamelogic::initwaypointbackgrounds();

    var_1 = level.waypointcolors[var_0];

    if ( !isdefined( var_1 ) )
        return "neutral";

    return var_1;
}

_id_F284( var_0, var_1 )
{
    self._id_13DCA[var_0] = var_1;

    if ( !isdefined( var_1 ) )
        self.worldiconscolor[var_0] = "neutral";
    else
        self.worldiconscolor[var_0] = getwaypointbackgroundcolor( var_1 );

    _id_12F68();
}

_id_F285( var_0, var_1 )
{
    self._id_13DCD[var_0] = var_1;
}

_id_F681( var_0 )
{
    self._id_3AF5 = var_0;
}

_id_5603()
{
    self notify( "disabled" );

    if ( self.type == "carryObject" )
    {
        if ( isdefined( self._id_3AA8 ) )
            self._id_3AA8 _id_11471( self );

        for ( var_0 = 0; var_0 < self.visuals.size; var_0++ )
            self.visuals[var_0] hide();
    }

    self.trigger scripts\engine\utility::_id_12778();
    _id_FB0E( "none" );
}

_id_6275()
{
    if ( self.type == "carryObject" )
    {
        for ( var_0 = 0; var_0 < self.visuals.size; var_0++ )
            self.visuals[var_0] show();
    }

    self.trigger scripts\engine\utility::_id_1277A();
    _id_FB0E( "any" );
}

_id_80E6( var_0 )
{
    if ( var_0 == self._id_C83E )
        return "friendly";
    else
        return "enemy";
}

_id_9E07( var_0 )
{
    if ( self._id_C83E == "any" )
        return 1;

    if ( self._id_C83E == var_0 )
        return 1;

    if ( self._id_C83E == "neutral" && isdefined( self._id_D8BA ) && self._id_D8BA == var_0 )
        return 1;

    return 0;
}

_id_38C3( var_0, var_1 )
{
    switch ( self._id_9A52 )
    {
        case "none":
            return 0;
        case "any":
            return 1;
        case "friendly":
            if ( var_0 == self._id_C83E )
                return 1;
            else
                return 0;
        case "enemy":
            if ( var_0 != self._id_C83E )
                return 1;
            else
                return 0;
        default:
            return 0;
    }
}

_id_9F9A( var_0 )
{
    if ( var_0 == "neutral" )
        return 1;

    if ( var_0 == "allies" )
        return 1;

    if ( var_0 == "axis" )
        return 1;

    if ( var_0 == "any" )
        return 1;

    if ( var_0 == "none" )
        return 1;

    foreach ( var_2 in level._id_115DA )
    {
        if ( var_0 == var_2 )
            return 1;
    }

    return 0;
}

_id_9F1F( var_0 )
{
    if ( var_0 == "friendly" )
        return 1;

    if ( var_0 == "enemy" )
        return 1;

    if ( var_0 == "any" )
        return 1;

    if ( var_0 == "none" )
        return 1;

    return 0;
}

_id_7E93( var_0 )
{
    if ( level._id_BDCC )
    {

    }

    if ( !level.teambased )
    {

    }

    if ( var_0 == "neutral" )
        return "none";
    else if ( var_0 == "allies" )
        return "axis";
    else
        return "allies";
}

_id_7F5A()
{
    var_0 = self.trigger._id_EDF9;

    if ( !isdefined( var_0 ) )
    {
        var_0 = "";
        return var_0;
    }

    if ( var_0[0] != "_" )
        return "_" + var_0;

    return var_0;
}

_id_987E()
{
    self._id_BE7C = undefined;
    self._id_370E = 0;
    self._id_C4B7 = undefined;
}

_id_BDF4( var_0 )
{
    self._id_BDF4 = var_0;
}

_id_3897( var_0 )
{
    self._id_3897 = var_0;
}

setzonestatusicons( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = var_0;

    _id_F283( "friendly", var_0 );
    _id_F284( "friendly", var_0 );
    _id_F283( "enemy", var_1 );
    _id_F284( "enemy", var_1 );
}

getleveltriggers()
{
    level.minetriggers = getentarray( "minefield", "targetname" );
    level.hurttriggers = getentarray( "trigger_hurt", "classname" );
    level.radtriggers = getentarray( "radiation", "targetname" );
    level.ballallowedtriggers = getentarray( "uplinkAllowedOOB", "targetname" );
    level.nozonetriggers = getentarray( "uplink_nozone", "targetname" );
    level.droptonavmeshtriggers = getentarray( "dropToNavMesh", "targetname" );
    thread scripts\mp\utility\game::initarbitraryuptriggers();
}

isbombmode()
{
    if ( level.gametype == "sd" || level.gametype == "sr" || level.gametype == "dd" )
        return 1;

    return 0;
}

touchingdroptonavmeshtrigger( var_0 )
{
    if ( level.droptonavmeshtriggers.size > 0 )
    {
        if ( isbombmode() || level.gametype == "ctf" )
            self.visuals[0].origin = var_0;

        foreach ( var_2 in level.droptonavmeshtriggers )
        {
            foreach ( var_4 in self.visuals )
            {
                if ( var_4 istouching( var_2 ) )
                    return 1;
            }
        }
    }

    return 0;
}

touchingarbitraryuptrigger()
{
    if ( level.arbitraryuptriggers.size > 0 )
    {
        foreach ( var_1 in level.arbitraryuptriggers )
        {
            if ( self istouching( var_1 ) )
                return 1;
        }
    }

    return 0;
}

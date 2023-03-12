// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_DF76()
{
    while ( !isdefined( level._id_2EC5 ) )
        wait 0.05;

    if ( isdefined( level._id_2DD0 ) )
        return;

    level._id_2DFA["heli_pilot"] = ( 0, 0, 350 );
    level._id_2DFA["heli_sniper"] = ( 0, 0, 228 );
    level._id_2DF9["isUsing"]["odin_assault"] = scripts\mp\utility\game::isusingremote;
    level._id_2DF9["isUsing"]["odin_support"] = scripts\mp\utility\game::isusingremote;
    level._id_2DF9["isUsing"]["heli_pilot"] = scripts\mp\utility\game::isusingremote;
    level._id_2DF9["isUsing"]["heli_sniper"] = ::_id_9FC3;
    level._id_2DF9["isUsing"]["switchblade_cluster"] = scripts\mp\utility\game::isusingremote;
    level._id_2DF9["isUsing"]["vanguard"] = ::_id_9FCC;
    level._id_2DF9["waittill_initial_goal"]["heli_pilot"] = ::_id_8D80;
    level._id_2DF9["waittill_initial_goal"]["heli_sniper"] = ::_id_8D89;
    level._id_2DF9["control_aiming"]["heli_pilot"] = ::_id_8D7B;
    level._id_2DF9["control_aiming"]["heli_sniper"] = scripts\engine\utility::_id_61B9;
    level._id_2DF9["control_aiming"]["vanguard"] = ::_id_1315E;
    level._id_2DF9["control_other"]["heli_pilot"] = ::_id_8D7E;
    level._id_2DF9["heli_pick_node"]["heli_pilot"] = ::_id_8D7F;
    level._id_2DF9["heli_pick_node"]["heli_sniper"] = ::_id_8D88;
    level._id_2DF9["heli_pick_node"]["vanguard"] = ::_id_13172;
    level._id_2DF9["heli_node_get_origin"]["heli_pilot"] = ::_id_8D58;
    level._id_2DF9["heli_node_get_origin"]["heli_sniper"] = ::_id_8D58;
    level._id_2DF9["heli_node_get_origin"]["vanguard"] = ::_id_13163;
    level._id_2DF9["odin_perform_action"]["odin_assault"] = ::_id_C2D8;
    level._id_2DF9["odin_perform_action"]["odin_support"] = ::_id_C316;
    level._id_2DF9["odin_get_target"]["odin_assault"] = ::_id_C2D7;
    level._id_2DF9["odin_get_target"]["odin_support"] = ::_id_C315;
    var_0 = scripts\engine\utility::_id_8180( "so_chopper_boss_path_struct", "script_noteworthy" );
    level._id_2DC8 = [];

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_027C ) )
            level._id_2DC8 = scripts\engine\utility::_id_2279( level._id_2DC8, var_2 );
    }

    level._id_2DC9 = scripts\mp\utility\game::_id_7EFA();

    foreach ( var_5 in level._id_2DC8 )
    {
        var_5._id_13171 = var_5.origin;
        var_6 = var_5.origin + ( 0, 0, 50 );
        var_5._id_13130 = 1;

        if ( var_6[2] <= var_5.origin[2] - 1000 )
            var_5._id_13130 = 0;

        var_6 -= ( 0, 0, 50 );
        var_5._id_13171 = var_6;
    }

    var_8 = -99999999;

    foreach ( var_5 in level._id_2DC8 )
        var_8 = max( var_8, var_5.origin[2] );

    level._id_2EC4 = var_8 - level._id_2E1D + 100;
    level._id_C2F9 = getweaponexplosionradius( "odin_projectile_large_rod_mp" );
    level._id_C30F = getweaponexplosionradius( "odin_projectile_small_rod_mp" );
    level._id_13168 = getweaponexplosionradius( "remote_tank_projectile_mp" );
    level._id_8D7D = getdvarfloat( "bg_bulletExplRadius" );

    while ( !isdefined( level._id_C2FF ) || !isdefined( level._id_C300 ) )
        wait 0.05;

    level._id_C2E9 = ( level._id_C2FF + level._id_C300 ) / 2;
    level._id_C7E0 = [];

    if ( isdefined( level._id_1165D ) )
        var_11 = [[ level._id_1165D ]]();
    else
    {
        var_11 = [];

        for ( var_12 = 0; var_12 < level._id_13FBD; var_12++ )
            var_11[var_11.size] = var_12;
    }

    foreach ( var_14 in var_11 )
    {
        if ( botzonegetindoorpercent( var_14 ) < 0.25 )
            level._id_C7E0 = scripts\engine\utility::_id_2279( level._id_C7E0, var_14 );
    }

    level._id_2E35["recruit"] = 1.0;
    level._id_2E35["regular"] = 0.7;
    level._id_2E35["hardened"] = 0.4;
    level._id_2E35["veteran"] = 0.05;
    level._id_2DD0 = 1;
}

_id_2DF1( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) )
        return 0;

    var_5 = 1;
    var_6 = 1;
    var_7 = undefined;

    if ( isdefined( self.node_ambushing_from ) )
    {
        var_8 = self botgetscriptgoalradius();
        var_9 = distancesquared( self.origin, self.node_ambushing_from.origin );

        if ( var_9 < squared( var_8 ) )
        {
            var_5 = 0;
            var_6 = 0;
        }
        else if ( var_9 < squared( 200 ) )
            var_5 = 0;
    }

    var_10 = var_0._id_110EA == "vanguard" && _id_9C23();

    if ( var_10 || var_5 )
    {
        var_11 = getnodesinradius( self.origin, 500, 0, 512 );

        if ( isdefined( var_11 ) && var_11.size > 0 )
        {
            if ( isdefined( var_4 ) && var_4 )
            {
                var_12 = var_11;
                var_11 = [];

                foreach ( var_14 in var_12 )
                {
                    if ( nodeexposedtosky( var_14 ) )
                    {
                        var_15 = getlinkednodes( var_14 );
                        var_16 = 0;

                        foreach ( var_18 in var_15 )
                        {
                            if ( nodeexposedtosky( var_18 ) )
                                var_16++;
                        }

                        if ( var_16 / var_15.size > 0.5 )
                            var_11 = scripts\engine\utility::_id_2279( var_11, var_14 );
                    }
                }
            }

            if ( var_10 )
            {
                var_21 = self botnodescoremultiple( var_11, "node_exposed" );

                foreach ( var_14 in var_21 )
                {
                    if ( bullettracepassed( var_14.origin + ( 0, 0, 30 ), var_14.origin + ( 0, 0, 400 ), 0, self ) )
                    {
                        var_7 = var_14;
                        break;
                    }

                    wait 0.05;
                }
            }
            else if ( var_11.size > 0 )
                var_7 = self botnodepick( var_11, min( 3, var_11.size ), "node_hide" );

            if ( !isdefined( var_7 ) )
                return 0;

            self botsetscriptgoalnode( var_7, "tactical" );
        }
    }

    if ( var_6 )
    {
        var_24 = scripts\mp\bots\bots_util::_id_2ECB();

        if ( var_24 != "goal" )
        {
            _id_1284E( var_7 );
            return 1;
        }
    }

    if ( isdefined( var_2 ) && !self [[ var_2 ]]() )
    {
        _id_1284E( var_7 );
        return 0;
    }

    if ( !scripts\mp\bots\bots_util::_id_2D0A() )
    {
        _id_1284E( var_7 );
        return 1;
    }

    if ( !isdefined( var_7 ) )
    {
        if ( self getstance() == "prone" )
            self botsetstance( "prone" );
        else if ( self getstance() == "crouch" )
            self botsetstance( "crouch" );
    }
    else if ( self botgetdifficultysetting( "strategyLevel" ) > 0 )
    {
        if ( randomint( 100 ) > 50 )
            self botsetstance( "prone" );
        else
            self botsetstance( "crouch" );
    }

    scripts\mp\bots\bots_killstreaks::_id_2EA5( var_0, var_1, var_0.weapon );
    self._id_131B5 = undefined;
    self thread [[ var_3 ]]();
    thread _id_2D6A();
    thread _id_2D6C( var_7 );
    self waittill( "control_func_done" );
    return 1;
}

_id_2D6A()
{
    self endon( "disconnect" );
    self endon( "control_func_done" );
    level endon( "game_ended" );
    self waittill( "spawned_player" );
    self notify( "control_func_done" );
}

_id_2D6C( var_0 )
{
    self endon( "disconnect" );
    self waittill( "control_func_done" );
    _id_1284E( var_0 );
    self botsetstance( "none" );
    self botsetscriptmove( 0, 0 );
    self botsetflag( "disable_movement", 0 );
    self botsetflag( "disable_rotation", 0 );
    self._id_131B5 = undefined;
}

_id_1284E( var_0 )
{
    if ( isdefined( var_0 ) && self bothasscriptgoal() && isdefined( self botgetscriptgoalnode() ) && self botgetscriptgoalnode() == var_0 )
        self botclearscriptgoal();
}

_id_2D6B( var_0 )
{
    var_0 waittill( "death" );
    self notify( "control_func_done" );
}

_id_2ECD( var_0 )
{
    var_1 = gettime();

    while ( !self [[ level._id_2DF9["isUsing"][var_0] ]]() )
    {
        wait 0.05;

        if ( gettime() - var_1 > 5000 )
            return 0;
    }

    return 1;
}

_id_2D42()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "control_func_done" );
    level endon( "game_ended" );
    childthread _id_88D4();
    var_0 = _id_2ECD( "switchblade_cluster" );

    if ( !var_0 )
        self notify( "control_func_done" );

    thread _id_11372();
    var_1 = _id_6C83( self );
    wait 0.1;
    self._id_C3F6 = self._id_01D3;
    self._id_01D3 = 256000000;
    thread _id_13938();
    var_2 = undefined;
    var_3 = 0;
    var_4 = 0;
    var_5 = [];
    var_6 = undefined;
    var_7 = 0;
    var_8 = 0;
    var_9 = undefined;
    var_10 = undefined;
    var_11 = 0;
    var_12 = _id_9C23();

    while ( self [[ level._id_2DF9["isUsing"]["switchblade_cluster"] ]]() && isdefined( var_1 ) )
    {
        foreach ( var_14 in level._id_E5DE )
        {
            if ( isdefined( var_14 ) && var_14.owner == self && var_14._id_13C2E == "switch_blade_child_mp" )
            {
                var_15 = 1;

                foreach ( var_17 in var_5 )
                {
                    if ( var_17._id_026C == var_14 )
                        var_15 = 0;
                }

                if ( var_15 )
                {
                    var_19 = spawnstruct();
                    var_19._id_026C = var_14;
                    var_19._id_0334 = var_6;
                    var_6 = undefined;
                    var_5 = scripts\engine\utility::_id_2279( var_5, var_19 );
                }
            }
        }

        for ( var_21 = 0; var_21 < var_5.size; var_21++ )
        {
            var_17 = var_5[var_21];

            if ( isdefined( var_17 ) && isdefined( var_17._id_026C ) && !scripts\engine\utility::array_contains( level._id_E5DE, var_17._id_026C ) )
            {
                var_5[var_21] = var_5[var_5.size - 1];
                var_5[var_5.size - 1] = undefined;
                var_21--;
            }
        }

        if ( var_11 )
        {
            wait 0.05;
            continue;
        }

        var_22 = undefined;

        if ( isdefined( var_10 ) )
        {
            var_22 = var_10;

            if ( !isalive( var_10 ) || !self botcanseeentity( var_22 ) )
            {
                if ( !isalive( var_10 ) )
                    var_11 = 1;

                wait 0.05;
                continue;
            }
        }

        var_23 = [];

        if ( !isdefined( var_22 ) )
        {
            var_24 = _id_2DEA( 0 );
            var_25 = [];

            foreach ( var_17 in var_5 )
            {
                if ( isdefined( var_17._id_0334 ) )
                    var_25 = scripts\engine\utility::_id_2279( var_25, var_17._id_0334 );
            }

            var_24 = scripts\engine\utility::_id_22AC( var_24, var_25 );

            foreach ( var_29 in var_24 )
            {
                if ( var_29 scripts\mp\utility\game::_id_12D6( "specialty_noplayertarget" ) )
                    continue;

                if ( self botcanseeentity( var_29 ) || var_12 && scripts\engine\utility::within_fov( self geteye(), var_1.angles, var_29.origin, self botgetfovdot() ) )
                {
                    if ( !_id_2D16() && distancesquared( var_29.origin, self.origin ) < 40000 )
                        continue;

                    var_23 = scripts\engine\utility::_id_2279( var_23, var_29 );

                    if ( !isdefined( var_22 ) )
                    {
                        var_22 = var_29;
                        continue;
                    }

                    var_30 = vectornormalize( var_22.origin - var_1.origin );
                    var_31 = vectornormalize( var_29.origin - var_1.origin );
                    var_32 = anglestoforward( var_1.angles );
                    var_33 = vectordot( var_30, var_32 );
                    var_34 = vectordot( var_31, var_32 );

                    if ( var_34 > var_33 )
                        var_22 = var_29;
                }
            }
        }

        if ( isdefined( var_22 ) )
        {
            var_2 = undefined;
            var_36 = var_1.origin[2] - var_22.origin[2];
            var_37 = self botgetdifficulty();

            if ( var_37 == "recruit" )
                var_9 = var_22.origin;
            else if ( var_36 < 5000 )
                var_9 = var_22.origin;
            else if ( length( var_22 getentityvelocity() ) < 25 )
                var_9 = var_22.origin;
            else if ( gettime() - var_8 > 500 )
            {
                var_8 = gettime();
                var_38 = 3.0;

                if ( var_37 == "regular" )
                    var_38 = 1.0;

                var_9 = getpredictedentityposition( var_22, var_38 );
            }

            var_39 = _id_B7FA( var_1, var_9 );
            var_40 = _id_B7FB( var_1, var_9 );

            if ( var_40 < 30 )
                var_41 = 0.0;
            else if ( var_40 < 100 )
                var_41 = 0.15;
            else if ( var_40 < 200 )
                var_41 = 0.3;
            else if ( var_40 < 400 )
                var_41 = 0.6;
            else
                var_41 = 1.0;

            if ( var_7 )
                var_41 = min( var_41 * 3, 1.0 );

            if ( var_41 > 0 )
                self botsetscriptmove( var_39[1], 0.05, var_41, 1, 1 );
            else if ( gettime() > var_4 )
            {
                if ( var_3 < 2 )
                {
                    self botpressbutton( "attack" );
                    var_3++;
                    var_4 = gettime() + 200;

                    if ( var_37 == "regular" && var_3 == 2 || var_37 == "hardened" || var_37 == "veteran" )
                    {
                        var_42 = var_3 == 1 && var_23.size == 1;

                        if ( !var_42 )
                        {
                            var_6 = var_22;
                            var_4 += 800;
                        }
                    }
                }
                else if ( !var_7 && ( var_36 < 5000 || var_37 == "recruit" ) )
                {
                    var_7 = 1;
                    self botpressbutton( "attack" );

                    if ( var_37 == "recruit" )
                        var_10 = var_22;
                }
            }
        }
        else
        {
            if ( !isdefined( var_2 ) )
                var_2 = scripts\engine\utility::_id_DC6B( level._id_C7E0 );

            var_43 = getzonenodeforindex( var_2 ).origin;

            if ( _id_B7FB( var_1, var_43 ) < 200 )
            {
                var_2 = scripts\engine\utility::_id_DC6B( level._id_C7E0 );
                var_43 = getzonenodeforindex( var_2 ).origin;
            }

            var_39 = _id_B7FA( var_1, var_43 );
            self botsetscriptmove( var_39[1], 0.05, 0.75, 1, 1 );
        }

        wait 0.05;
    }

    self notify( "control_func_done" );
}

_id_B7FA( var_0, var_1 )
{
    var_2 = _id_B7F6( var_0, var_1[2] );
    var_3 = vectornormalize( var_1 - var_2 );
    return vectortoangles( var_3 );
}

_id_B7FB( var_0, var_1 )
{
    var_2 = _id_B7F6( var_0, var_1[2] );
    return distance( var_2, var_1 );
}

_id_88D4()
{
    self botsetflag( "disable_rotation", 1 );
    self botsetflag( "disable_movement", 1 );
    _id_6C83( self );
    self botsetflag( "disable_rotation", 0 );
    self botsetflag( "disable_movement", 0 );
}

_id_11372()
{
    self endon( "disconnect" );
    self botsetawareness( 2.5 );
    self waittill( "control_func_done" );
    self botsetawareness( 1.0 );
}

_id_B7F6( var_0, var_1 )
{
    var_2 = anglestoforward( var_0.angles );
    var_3 = ( var_1 - var_0.origin[2] ) / var_2[2];
    var_4 = var_0.origin + var_2 * var_3;
    return var_4;
}

_id_13938()
{
    self endon( "disconnect" );
    self waittill( "control_func_done" );
    self._id_01D3 = self._id_C3F6;
}

_id_6C83( var_0 )
{
    for (;;)
    {
        foreach ( var_2 in level._id_E5DE )
        {
            if ( isdefined( var_2 ) && var_2.owner == var_0 )
                return var_2;
        }

        wait 0.05;
    }
}

_id_1315D()
{
    if ( !scripts\mp\bots\bots_killstreaks::_id_18DB() )
        return 0;

    if ( scripts\mp\bots\bots_killstreaks::_id_9E66( "vanguard" ) )
        return 0;

    return 1;
}

_id_2DF6( var_0, var_1, var_2, var_3 )
{
    _id_2DF1( var_0, var_1, var_2, var_3, 1 );
}

_id_9FCC()
{
    return scripts\mp\utility\game::isusingremote() && self._id_13118 == "vanguard" && isdefined( self._id_DF8A );
}

_id_2D43()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "control_func_done" );
    level endon( "game_ended" );
    var_0 = _id_2ECD( "vanguard" );

    if ( !var_0 )
        self notify( "control_func_done" );

    self._id_131B5 = self._id_DF8A;
    childthread _id_2D6B( self._id_131B5 );
    self._id_131B5 endon( "death" );
    wait 0.5;
    var_1 = 0;
    var_2 = !self._id_131B5 _id_13166();
    var_3 = undefined;
    var_4 = 0;
    var_5 = _id_9C23();

    while ( var_2 && !var_5 )
    {
        var_6 = getnodesinradiussorted( self._id_131B5.origin, 1024, 64, 512, "path" );

        if ( isdefined( var_3 ) )
            var_6 = scripts\engine\utility::array_remove( var_6, var_3 );

        foreach ( var_8 in var_6 )
        {
            if ( _id_C038( var_8 ) )
            {
                var_3 = var_8;
                break;
            }

            wait 0.05;
            var_1 += 0.05;
        }

        if ( var_1 < 1.0 )
            wait( 1.0 - var_1 );

        if ( !isdefined( var_3 ) )
        {
            self botpressbutton( "use", 4.0 );
            wait 4.0;
        }

        var_10 = scripts\mp\bots\bots_util::_id_2E58( "GetNodesOnPathVanguard", scripts\mp\bots\bots_util::_id_74C8, self._id_131B5.origin, var_3.origin );

        if ( !isdefined( var_10 ) )
        {
            if ( var_4 == 0 )
            {
                var_4++;
                wait 0.05;
                continue;
            }
            else
            {
                self botpressbutton( "use", 4.0 );
                wait 4.0;
            }
        }

        for ( var_11 = 0; var_11 < var_10.size; var_11++ )
        {
            var_12 = var_10[var_11];

            if ( var_11 == 0 && distancesquared( self.origin, var_12.origin ) < 1600 )
                continue;

            var_13 = 32;

            if ( var_11 == var_10.size - 1 )
                var_13 = 16;

            var_14 = self._id_131B5.origin;
            var_15 = gettime() + 2500;

            while ( distance2dsquared( var_12.origin, self._id_131B5.origin ) > var_13 * var_13 )
            {
                if ( self._id_131B5 _id_13166() )
                {
                    var_11 = var_10.size;
                    break;
                }

                if ( gettime() > var_15 )
                {
                    var_15 = gettime() + 2500;
                    var_16 = distancesquared( self._id_131B5.origin, var_14 );

                    if ( var_16 < 1.0 )
                    {
                        var_11++;
                        break;
                    }

                    var_14 = self._id_131B5.origin;
                }

                var_17 = vectornormalize( var_12.origin - self._id_131B5.origin );
                self botsetscriptmove( vectortoangles( var_17 )[1], 0.2 );
                self botlookatpoint( var_12.origin, 0.2, "script_forced" );
                var_18 = var_12.origin[2] + 64;
                var_19 = var_18 - self._id_131B5.origin[2];

                if ( var_19 > 10 )
                    self botpressbutton( "lethal" );
                else if ( var_19 < -10 )
                    self botpressbutton( "tactical" );

                wait 0.05;
            }
        }

        var_2 = 0;

        if ( !self._id_131B5 _id_13166() )
            var_2 = 1;
    }

    self botsetscriptmove( 0, 0 );
    self botlookatpoint( undefined );
    self childthread [[ level._id_2DF9["control_aiming"]["vanguard"] ]]();
    var_21 = self._id_131B5.origin[2];
    var_22 = undefined;
    var_23 = gettime() + 2000;
    var_24 = [];
    var_24[0] = ( 1, 0, 0 );
    var_24[1] = ( -1, 0, 0 );
    var_24[2] = ( 0, 1, 0 );
    var_24[3] = ( 0, -1, 0 );
    var_24[4] = ( 1, 1, 0 );
    var_24[5] = ( 1, -1, 0 );
    var_24[6] = ( -1, 1, 0 );
    var_24[7] = ( -1, -1, 0 );
    var_25 = _id_6C81( self._id_131B5.origin, "vanguard" );

    while ( var_25._id_13171[2] - self._id_131B5.origin[2] > 20 )
    {
        if ( gettime() > var_23 )
        {
            var_23 = gettime() + 2000;

            if ( isdefined( var_22 ) )
                var_22 = undefined;
            else
            {
                var_19 = self._id_131B5.origin[2] - var_21;

                if ( var_19 < 20 && !var_5 )
                {
                    var_26 = scripts\engine\utility::_id_22A7( var_24 );

                    foreach ( var_28 in var_26 )
                    {
                        if ( _id_D6A1( self._id_131B5.origin + var_28 * 64 ) )
                        {
                            if ( !bullettracepassed( self._id_131B5.origin, self._id_131B5.origin + var_28 * 64, 0, self._id_131B5 ) )
                            {
                                wait 0.05;
                                continue;
                            }

                            var_22 = var_28;
                            break;
                        }

                        wait 0.05;
                    }
                }
            }

            var_21 = self._id_131B5.origin[2];
        }

        if ( isdefined( var_22 ) )
        {
            self botsetscriptmove( vectortoangles( var_22 )[1], 0.05 );

            if ( scripts\engine\utility::_id_4347() )
                self botpressbutton( "tactical" );
        }
        else
            self botpressbutton( "lethal" );

        wait 0.05;
    }

    wait 1.0;
    wait 1.0;
    self botsetflag( "disable_movement", 0 );
    _id_2D3C( "vanguard", 0 );
    self notify( "control_func_done" );
}

_id_D69E( var_0 )
{
    var_1 = getclosestnodeinsight( var_0 );

    if ( isdefined( var_1 ) )
        return _id_C038( var_1 );

    return 0;
}

_id_C038( var_0 )
{
    if ( nodeexposedtosky( var_0 ) )
        return _id_D6A1( var_0.origin );

    return 0;
}

_id_D6A1( var_0 )
{
    var_1 = var_0;
    var_2 = var_0 + ( 0, 0, level._id_2EC4 );

    if ( var_2[2] <= var_1[2] )
        return 0;

    var_3 = bullettracepassed( var_1, var_2, 0, undefined );
    return var_3;
}

_id_13166()
{
    var_0 = getclosestnodeinsight( self.origin );

    if ( isdefined( var_0 ) && !nodeexposedtosky( var_0 ) )
        return 0;

    wait 0.05;

    if ( !_id_D6A1( self.origin + ( 18, 0, 25 ) ) )
        return 0;

    wait 0.05;

    if ( !_id_D6A1( self.origin + ( -18, 0, 25 ) ) )
        return 0;

    wait 0.05;

    if ( !_id_D6A1( self.origin + ( 0, 18, 25 ) ) )
        return 0;

    wait 0.05;

    if ( !_id_D6A1( self.origin + ( 0, -18, 25 ) ) )
        return 0;

    return 1;
}

_id_1315E()
{
    self notify( "vanguard_control_aiming" );
    self endon( "vanguard_control_aiming" );
    var_0 = undefined;
    var_1 = 0;
    var_2 = gettime();
    var_3 = 0;
    var_4 = undefined;
    var_5 = 0;

    while ( self [[ level._id_2DF9["isUsing"]["vanguard"] ]]() )
    {
        var_6 = undefined;
        var_7 = self geteye();
        var_8 = self getplayerangles();
        var_9 = self botgetfovdot();

        if ( isalive( self._id_010C ) && self botcanseeentity( self._id_010C ) )
        {
            var_10 = 1;
            var_6 = self._id_010C;
            var_5 = 0;
        }
        else if ( var_5 < 10.0 )
        {
            foreach ( var_12 in level._id_3CB5 )
            {
                if ( var_12 == self || !isalive( var_12 ) )
                    continue;

                if ( var_12 scripts\mp\utility\game::_id_12D6( "specialty_noplayertarget" ) )
                    continue;

                if ( !isdefined( var_12.team ) )
                    continue;

                if ( !level.teambased || self.team != var_12.team )
                {
                    if ( scripts\engine\utility::within_fov( var_7, var_8, var_12.origin, var_9 ) )
                    {
                        var_5 += 0.05;

                        if ( isdefined( var_6 ) )
                        {
                            var_13 = distancesquared( self._id_131B5.origin, var_6.origin );
                            var_14 = distancesquared( self._id_131B5.origin, var_12.origin );

                            if ( var_14 < var_13 )
                                var_6 = var_12;

                            continue;
                        }

                        var_6 = var_12;
                    }
                }
            }
        }

        if ( isdefined( var_6 ) )
        {
            if ( ( isai( var_6 ) || isplayer( var_6 ) ) && length( var_6 getentityvelocity() ) < 25 )
                var_0 = var_6.origin;
            else if ( gettime() - var_3 < 500 )
            {
                if ( var_4 != var_6 )
                    var_0 = var_6.origin;
            }
            else if ( gettime() - var_3 > 500 )
            {
                var_3 = gettime();
                var_0 = getpredictedentityposition( var_6, 3.0 );
                var_4 = var_6;
            }

            var_16 = 165;

            if ( gettime() - var_2 > 10000 )
                var_16 = 200;

            if ( distancesquared( self._id_131B5._id_24D1.origin, var_0 ) < level._id_13168 * level._id_13168 )
            {
                if ( _id_2D16() || distancesquared( self._id_131B5._id_24D1.origin, self.origin ) > level._id_13168 * level._id_13168 )
                {
                    var_2 = gettime();
                    self botpressbutton( "attack" );
                }
            }
        }
        else if ( gettime() > var_1 )
        {
            var_1 = gettime() + randomintrange( 1000, 2000 );
            var_0 = _id_7BEE();
            self._id_BF40 = gettime();
        }

        if ( length( var_0 ) == 0 )
            var_0 = ( 0, 0, 10 );

        self botlookatpoint( var_0, 0.2, "script_forced" );
        wait 0.05;
    }
}

_id_13172( var_0 )
{
    var_0._id_2EC7[self.entity_number]++;
    var_1 = [[ level._id_2DF9["heli_node_get_origin"]["vanguard"] ]]( var_0 );
    var_2 = _id_2EC3( var_0 );
    var_3 = var_2;
    var_2 = [];

    foreach ( var_5 in var_3 )
    {
        if ( var_5._id_13130 )
        {
            if ( var_0.origin[2] != var_0._id_13171[2] || var_5.origin[2] != var_5._id_13171[2] )
            {
                var_6 = [[ level._id_2DF9["heli_node_get_origin"]["vanguard"] ]]( var_5 );
                var_7 = playerphysicstrace( var_1, var_6 );

                if ( distancesquared( var_7, var_6 ) < 1 )
                    var_2 = scripts\engine\utility::_id_2279( var_2, var_5 );

                wait 0.05;
                continue;
            }

            var_2 = scripts\engine\utility::_id_2279( var_2, var_5 );
        }
    }

    if ( var_2.size == 0 && var_3.size > 0 )
    {
        foreach ( var_5 in var_3 )
            var_5._id_2EC7[self.entity_number]++;
    }

    return _id_8D78( var_2, "vanguard" );
}

_id_2EC3( var_0 )
{
    var_1 = 99;
    var_2 = [];

    foreach ( var_4 in var_0._id_BEAA )
    {
        if ( isdefined( var_4._id_027C ) && var_4._id_13130 )
        {
            var_5 = var_4._id_2EC7[self.entity_number];

            if ( var_5 < var_1 )
            {
                var_2 = [];
                var_2[0] = var_4;
                var_1 = var_5;
            }
            else if ( var_5 == var_1 )
                var_2[var_2.size] = var_4;
        }
    }

    return var_2;
}

_id_13163( var_0 )
{
    return var_0._id_13171;
}

_id_C716( var_0 )
{
    var_1 = 1;
    var_2 = scripts\engine\utility::_id_107E6();
    var_2.origin = var_0;
    var_2 delete();
    return var_1;
}

_id_8D86()
{
    if ( !scripts\mp\bots\bots_killstreaks::_id_18DB() )
        return 0;

    return 1;
}

_id_8D89()
{
    self._id_131B5 waittill( "near_goal" );
}

_id_2D3E()
{
    thread _id_8D87();
    _id_2D3B( "heli_sniper" );
}

_id_8D87()
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "control_func_done" );
    level endon( "game_ended" );
    self botclearscriptgoal();
}

_id_8D88( var_0 )
{
    var_0._id_2EC7[self.entity_number]++;
    var_1 = _id_2DC7( var_0 );
    return _id_8D78( var_1, "heli_sniper" );
}

_id_8D7A()
{
    if ( !scripts\mp\bots\bots_killstreaks::_id_18DB() )
        return 0;

    return 1;
}

_id_8D80()
{
    self._id_131B5 waittill( "goal_reached" );
}

_id_2D3D()
{
    _id_2D3B( "heli_pilot" );
}

_id_8D7F( var_0 )
{
    var_0._id_2EC7[self.entity_number]++;
    var_1 = _id_2DC7( var_0 );
    var_2 = scripts\engine\utility::_id_DC6B( var_1 );
    return var_2;
}

_id_8D7E()
{
    self notify( "heli_pilot_monitor_flares" );
    self endon( "heli_pilot_monitor_flares" );
    var_0 = [];

    while ( self [[ level._id_2DF9["isUsing"]["heli_pilot"] ]]() )
    {
        self._id_131B5 waittill( "targeted_by_incoming_missile", var_1 );
        var_2 = 1;

        foreach ( var_4 in var_1 )
        {
            if ( isdefined( var_4 ) && !scripts\engine\utility::array_contains( var_0, var_4 ) )
                var_2 = 0;
        }

        if ( !var_2 )
        {
            var_6 = clamp( 0.34 * self botgetdifficultysetting( "strategyLevel" ), 0.0, 1.0 );

            if ( randomfloat( 1.0 ) < var_6 )
                self notify( "manual_flare_popped" );

            var_0 = scripts\engine\utility::_id_227F( var_0, var_1 );
            var_0 = scripts\engine\utility::_id_22BC( var_0 );
            wait 3.0;
        }
    }
}

_id_8D7B()
{
    self notify( "heli_pilot_control_heli_aiming" );
    self endon( "heli_pilot_control_heli_aiming" );
    var_0 = undefined;
    var_1 = undefined;
    var_2 = undefined;
    var_3 = 0;
    var_4 = 0;
    var_5 = undefined;
    var_6 = ( self botgetdifficultysetting( "minInaccuracy" ) + self botgetdifficultysetting( "maxInaccuracy" ) ) / 2;
    var_7 = 0;

    while ( self [[ level._id_2DF9["isUsing"]["heli_pilot"] ]]() )
    {
        var_8 = 0;
        var_9 = 0;

        if ( isdefined( var_1 ) && var_1.health <= 0 && gettime() - var_1.deathtime < 2000 )
        {
            var_8 = 1;
            var_9 = 1;
        }
        else if ( isalive( self._id_010C ) && ( self botcanseeentity( self._id_010C ) || gettime() - self _meth_81DB( self._id_010C ) <= 300 ) )
        {
            var_8 = 1;
            var_1 = self._id_010C;
            var_0 = self._id_010C.origin;

            if ( self botcanseeentity( self._id_010C ) )
            {
                var_7 = 0;
                var_9 = 1;
                var_10 = gettime();
            }
            else
            {
                var_7 += 0.05;

                if ( var_7 > 5.0 )
                    var_8 = 0;
            }
        }

        if ( var_8 )
        {
            var_2 = var_0 - ( 0, 0, 50 );

            if ( var_9 && ( _id_2D16() || distancesquared( var_2, self.origin ) > level._id_8D7D * level._id_8D7D ) )
                self botpressbutton( "attack" );

            if ( gettime() > var_4 + 500 )
            {
                var_11 = randomfloatrange( -1 * var_6 / 2, var_6 / 2 );
                var_12 = randomfloatrange( -1 * var_6 / 2, var_6 / 2 );
                var_13 = randomfloatrange( -1 * var_6 / 2, var_6 / 2 );
                var_5 = ( 150 * var_11, 150 * var_12, 150 * var_13 );
                var_4 = gettime();
            }

            var_2 += var_5;
            var_14 = self._id_131B5 gettagorigin( "tag_player" );
            var_15 = vectornormalize( var_2 - var_14 );
            var_16 = anglestoforward( self getplayerangles() );
            var_17 = vectordot( var_15, var_16 );

            if ( var_17 > 0.5 )
                self botpressbutton( "ads", 0.1 );
        }
        else if ( gettime() > var_3 )
        {
            var_3 = gettime() + randomintrange( 1000, 2000 );
            var_2 = _id_7BEE();
            self._id_BF40 = gettime();
        }

        var_18 = var_2 - self._id_131B5.origin;
        var_19 = length( var_18 );
        var_20 = vectortoangles( var_18 );
        var_21 = angleclamp( self._id_131B5.angles[0] );
        var_22 = angleclamp( var_20[0] );
        var_23 = int( var_21 - var_22 ) % 360;

        if ( var_23 > 180 )
            var_23 = 360 - var_23;
        else if ( var_23 < -180 )
            var_23 = -360 + var_23;

        if ( var_23 > 15 )
            var_22 = var_21 - 15;
        else if ( var_23 < -15 )
            var_22 = var_21 + 15;

        var_20 = ( var_22, var_20[1], var_20[2] );
        var_18 = anglestoforward( var_20 );
        var_2 = self._id_131B5.origin + var_18 * var_19;

        if ( length( var_2 ) == 0 )
            var_2 = ( 0, 0, 10 );

        self botlookatpoint( var_2, 0.2, "script_forced" );
        wait 0.05;
    }
}

_id_2D40()
{
    _id_2D3F( "odin_assault" );
}

_id_C2D8()
{
    if ( _id_2E3A() )
        return 1;

    if ( _id_2E38() )
        return 1;

    if ( _id_2E36() )
        return 1;

    return 0;
}

_id_C2D7()
{
    return _id_2E2B();
}

_id_2E2B()
{
    var_0 = undefined;

    if ( isdefined( self._id_A8DB ) && gettime() - self._id_A8DC < 5000 )
        var_0 = self._id_A8DB;

    return _id_2E2C( "enemy", 1, var_0 );
}

_id_2E38()
{
    var_0 = _id_2E34();

    if ( var_0 == "large" )
    {
        self notify( "large_rod_action" );
        return 1;
    }

    if ( var_0 == "small" )
    {
        self notify( "small_rod_action" );
        return 1;
    }

    return 0;
}

_id_2E34()
{
    var_0 = gettime() >= self._id_C2D3._id_C2FA;
    var_1 = gettime() >= self._id_C2D3._id_C310;

    if ( var_0 || var_1 )
    {
        var_2 = _id_2E30( "enemy", 0 );
        var_3 = [];
        var_4 = distancesquared( self.origin, self._id_C2D3._id_1156A.origin );

        for ( var_5 = 0; var_5 < var_2.size; var_5++ )
        {
            var_6 = _id_2E2F( var_2[var_5] );
            var_3[var_5] = distancesquared( self._id_C2D3._id_1156A.origin, var_6 );
        }

        if ( var_0 )
        {
            if ( !_id_2D16() && var_4 < level._id_C2F9 * level._id_C2F9 )
                return "none";

            for ( var_5 = 0; var_5 < var_2.size; var_5++ )
            {
                if ( var_3[var_5] < squared( level._id_C2F9 ) )
                {
                    self._id_A8DB = var_2[var_5];
                    self._id_A8DC = gettime();
                    return "large";
                }
            }
        }

        if ( var_1 )
        {
            if ( !_id_2D16() && var_4 < level._id_C30F * level._id_C30F )
                return "none";

            for ( var_5 = 0; var_5 < var_2.size; var_5++ )
            {
                if ( var_3[var_5] < squared( level._id_C30F ) )
                {
                    if ( isdefined( self._id_A8DB ) && self._id_A8DB == var_2[var_5] && gettime() - self._id_A8DC < 5000 )
                        continue;

                    return "small";
                }
            }
        }
    }

    return "none";
}

_id_2D41()
{
    _id_2D3F( "odin_support" );
}

_id_C316()
{
    if ( _id_2E3A() )
        return 1;

    if ( _id_2E36() )
        return 1;

    if ( _id_2E39() )
        return 1;

    if ( _id_2E37() )
        return 1;

    return 0;
}

_id_2E37()
{
    if ( _id_2E33() )
    {
        self notify( "marking_action" );
        return 1;
    }

    return 0;
}

_id_2E33()
{
    if ( gettime() < self._id_C2D3._id_C301 )
        return 0;

    var_0 = _id_2E30( "enemy", 0 );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = _id_2E2F( var_0[var_2] );
        var_1[var_2] = distancesquared( self._id_C2D3._id_1156A.origin, var_3 );

        if ( var_1[var_2] < squared( level._id_C2E9 / 2 ) )
            return 1;
    }

    return 0;
}

_id_2E39()
{
    if ( _id_2E32() )
    {
        self notify( "smoke_action" );
        return 1;
    }

    return 0;
}

_id_2E32()
{
    if ( gettime() < self._id_C2D3._id_C311 )
        return 0;

    var_0 = _id_2E2D();

    foreach ( var_2 in var_0 )
    {
        if ( distancesquared( var_2, self._id_C2D3._id_1156A.origin ) < 2500 )
            return 1;
    }

    var_4 = undefined;

    if ( isdefined( self._id_C2D3._id_1156A._id_BE7C ) )
        var_4 = getnodezone( self._id_C2D3._id_1156A._id_BE7C );

    if ( !isdefined( var_4 ) )
        return 0;

    var_5 = _id_2DED( 1 );
    var_6 = var_5[var_4].size;

    if ( var_6 >= 2 )
        return 1;

    return 0;
}

_id_2E2D()
{
    var_0 = [];

    if ( gettime() < self._id_C2D3._id_C311 )
        return var_0;

    foreach ( var_2 in level._id_3A59 )
    {
        if ( scripts\mp\bots\bots::_id_483D( var_2 ) )
        {
            var_3[0] = self;
            var_4 = scripts\engine\utility::_id_782F( var_2.origin, level.players, var_3 );

            if ( var_4.size > 0 && var_4[0].team == self.team )
                var_0 = scripts\engine\utility::_id_2279( var_0, var_2.origin );
        }
    }

    var_6 = _id_2E30( "ally", 0 );

    foreach ( var_8 in var_6 )
    {
        if ( isai( var_8 ) && var_8 scripts\mp\bots\bots_util::_id_2DD5() )
            var_0 = scripts\engine\utility::_id_2279( var_0, var_8.origin );
    }

    return var_0;
}

_id_C315()
{
    var_0 = _id_2E2D();

    if ( var_0.size > 0 )
        return var_0[0];

    return _id_2E2C( "enemy", 1 );
}

_id_B983()
{
    for (;;)
    {
        self._id_C2D3._id_1156A._id_BE7C = getclosestnodeinsight( self._id_C2D3._id_1156A.origin );

        if ( scripts\mp\bots\bots_util::_id_2E4E( self._id_C2D3._id_1156A.origin, 200 ) )
            self._id_C2D3._id_1156A._id_BE7F = self._id_C2D3._id_1156A.origin;
        else
            self._id_C2D3._id_1156A._id_BE7F = undefined;

        wait 0.25;
    }
}

_id_2D3F( var_0 )
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "control_func_done" );
    level endon( "game_ended" );
    var_1 = _id_2ECD( var_0 );

    if ( !var_1 )
        self notify( "control_func_done" );

    self._id_131B5 = self._id_C2D3;
    childthread _id_2D6B( self._id_C2D3 );
    self._id_C2D3 endon( "death" );
    wait 1.4;
    self botsetawareness( 0.7 );
    thread _id_2D6D();
    self._id_C307 = [];
    self._id_C308 = [];
    self._id_C2FB = 0;
    var_2 = undefined;
    var_3 = 0;
    var_4 = undefined;
    childthread _id_B983();
    var_5 = self._id_C2D3._id_1156A.origin;
    var_6 = gettime();

    while ( self [[ level._id_2DF9["isUsing"][var_0] ]]() )
    {
        var_7 = self [[ level._id_2DF9["odin_perform_action"][var_0] ]]();

        if ( gettime() > var_6 + 2000 )
        {
            var_6 = gettime();
            var_8 = distance( var_5, self._id_C2D3._id_1156A.origin );
            var_5 = self._id_C2D3._id_1156A.origin;

            if ( var_8 < 100 )
            {
                var_4 = undefined;
                var_2 = undefined;
            }
        }

        if ( gettime() > var_3 || !isdefined( var_4 ) )
        {
            var_9 = level._id_2E35[self botgetdifficulty()];
            var_3 = gettime() + var_9 * 1000;
            var_10 = self [[ level._id_2DF9["odin_get_target"][var_0] ]]();

            if ( isdefined( var_10 ) )
            {
                var_2 = undefined;

                if ( isplayer( var_10 ) )
                    var_4 = _id_2E2F( var_10 );
                else
                    var_4 = var_10;
            }
            else
            {
                if ( !isdefined( var_2 ) )
                    var_2 = scripts\engine\utility::_id_DC6B( level._id_C7E0 );

                var_11 = getzonenodeforindex( var_2 ).origin;

                if ( distance2dsquared( self._id_C2D3._id_1156A.origin, var_11 ) < 10000 )
                {
                    var_2 = scripts\engine\utility::_id_DC6B( level._id_C7E0 );
                    var_11 = getzonenodeforindex( var_2 ).origin;
                    var_6 = gettime();
                }

                var_4 = var_11;
            }
        }

        var_12 = var_4 - self._id_C2D3._id_1156A.origin;

        if ( lengthsquared( var_12 ) > 100 )
        {
            var_13 = vectortoangles( var_12 );
            self botsetscriptmove( var_13[1], 0.05 );
            self botlookatpoint( var_4, 0.1, "script_forced" );
        }
        else
            var_6 = gettime();

        wait 0.05;
    }

    self notify( "control_func_done" );
}

_id_2D6D( var_0 )
{
    self endon( "disconnect" );
    self waittill( "control_func_done" );
    self._id_C307 = undefined;
    self._id_C308 = undefined;
    self._id_C2FB = undefined;
    self botsetawareness( 1.0 );
}

_id_2E2F( var_0 )
{
    if ( level.teambased && self.team == var_0.team )
        return var_0.origin;
    else
    {
        if ( length( var_0 getentityvelocity() ) < 25 )
            return var_0.origin;

        var_1 = var_0 getentitynumber();

        if ( !isdefined( self._id_C308[var_1] ) )
            self._id_C308[var_1] = 0;

        var_2 = gettime();
        var_3 = var_2 - self._id_C308[var_1];

        if ( var_3 <= 400 )
        {
            var_4 = vectornormalize( var_0 getentityvelocity() );
            var_5 = vectornormalize( self._id_C307[var_1] - var_0.origin );

            if ( vectordot( var_4, var_5 ) < -0.5 )
                return var_0.origin;
        }

        if ( var_3 > 400 )
        {
            if ( var_2 == self._id_C2FB )
            {
                if ( var_3 > 1000 )
                    return var_0.origin;
            }
            else
            {
                self._id_C307[var_1] = getpredictedentityposition( var_0, 1.5 );
                self._id_C308[var_1] = var_2;
                self._id_C2FB = var_2;
            }
        }

        return self._id_C307[var_1];
    }
}

_id_2E2C( var_0, var_1, var_2 )
{
    var_3 = _id_2E30( var_0, var_1 );

    if ( isdefined( var_2 ) )
        var_3 = scripts\engine\utility::array_remove( var_3, var_2 );

    if ( var_3.size > 0 )
    {
        var_4 = scripts\engine\utility::_id_782F( self._id_C2D3._id_1156A.origin, var_3 );
        return var_4[0];
    }

    return undefined;
}

_id_2E3A()
{
    if ( gettime() >= self._id_C2D3._id_C2F8 )
    {
        if ( !isdefined( self._id_C2D3._id_1156A._id_BE7C ) )
            return 0;
    }

    return 0;
}

_id_2E2A()
{
    return _id_2E2C( "ally", 0 );
}

_id_2E36()
{
    if ( _id_2E31() )
    {
        self notify( "airdrop_action" );
        self notify( "juggernaut_action" );
        return 1;
    }

    return 0;
}

_id_2E31()
{
    if ( gettime() < self._id_C2D3._id_C2D4 )
        return 0;

    if ( !isdefined( self._id_C2D3._id_1156A._id_BE7C ) )
        return 0;

    if ( _id_2E2E() > 2 )
        return 0;

    if ( !isdefined( self._id_C2D3._id_1156A._id_BE7F ) )
        return 0;

    var_0 = getnodezone( self._id_C2D3._id_1156A._id_BE7C );

    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = _id_2DEC( 1 );
    var_2 = var_1[var_0].size;
    var_3 = _id_2DED( 1 );
    var_4 = var_3[var_0].size;

    if ( var_2 == 0 )
        return 0;

    if ( var_4 == 0 )
    {
        var_5 = 0;
        var_6 = _id_2E30( "enemy", 1 );

        foreach ( var_8 in var_6 )
        {
            if ( distancesquared( var_8.origin, self._id_C2D3._id_1156A.origin ) < 14400 )
                var_5 = 1;
        }

        if ( !var_5 )
            return 1;
    }

    if ( var_2 - var_4 >= 2 )
    {
        var_10 = scripts\engine\utility::_id_782F( self._id_C2D3._id_1156A.origin, var_1[var_0] );
        var_11 = scripts\engine\utility::_id_782F( self._id_C2D3._id_1156A.origin, var_3[var_0] );
        var_12 = distance( self._id_C2D3._id_1156A.origin, var_10[0].origin );
        var_13 = distance( self._id_C2D3._id_1156A.origin, var_11[0].origin );

        if ( var_12 + 120 < var_13 )
            return 1;
    }

    return 0;
}

_id_2E2E()
{
    var_0 = 0;

    foreach ( var_2 in level._id_3A59 )
    {
        if ( isdefined( var_2 ) && scripts\mp\bots\bots::_id_483D( var_2 ) )
            var_0++;
    }

    return var_0;
}

_id_2E30( var_0, var_1, var_2 )
{
    var_3 = _id_2DEB( self.team, var_0, var_1 );
    var_4 = self botgetfovdot();
    var_5 = [];

    foreach ( var_7 in var_3 )
    {
        var_8 = 0;
        var_9 = var_4;

        if ( var_0 == "enemy" )
            var_9 *= 0.9;

        if ( scripts\engine\utility::within_fov( self._id_131B5.origin, self getplayerangles(), var_7.origin, var_9 ) )
        {
            if ( !var_8 || self botcanseeentity( var_7 ) )
                var_5 = scripts\engine\utility::_id_2279( var_5, var_7 );
        }
    }

    return var_5;
}

_id_9C23()
{
    return level.script == "mp_sovereign";
}

_id_2D16()
{
    return isdefined( self.fauxdeath ) && self.fauxdeath;
}

_id_8D78( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = 0;

    foreach ( var_5 in var_0 )
    {
        var_6 = distancesquared( level._id_2E17, [[ level._id_2DF9["heli_node_get_origin"][var_1] ]]( var_5 ) );

        if ( var_6 > var_3 )
        {
            var_3 = var_6;
            var_2 = var_5;
        }
    }

    if ( isdefined( var_2 ) )
        return var_2;
    else
        return scripts\engine\utility::_id_DC6B( var_0 );
}

_id_8D58( var_0 )
{
    return var_0.origin;
}

_id_6C81( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = 99999999;

    foreach ( var_5 in level._id_2DC8 )
    {
        var_6 = distance2dsquared( var_0, [[ level._id_2DF9["heli_node_get_origin"][var_1] ]]( var_5 ) );

        if ( var_6 < var_3 )
        {
            var_2 = var_5;
            var_3 = var_6;
        }
    }

    return var_2;
}

_id_2DEC( var_0 )
{
    var_1 = _id_2DE9( var_0 );
    var_2 = [];

    for ( var_3 = 0; var_3 < level._id_13FBD; var_3++ )
        var_2[var_3] = [];

    foreach ( var_5 in var_1 )
    {
        var_6 = var_5 getnearestnode();
        var_7 = getnodezone( var_6 );

        if ( isdefined( var_7 ) )
            var_2[var_7] = scripts\engine\utility::_id_2279( var_2[var_7], var_5 );
    }

    return var_2;
}

_id_2DED( var_0 )
{
    var_1 = _id_2DEA( var_0 );
    var_2 = [];

    for ( var_3 = 0; var_3 < level._id_13FBD; var_3++ )
        var_2[var_3] = [];

    foreach ( var_5 in var_1 )
    {
        var_6 = var_5 getnearestnode();
        var_7 = getnodezone( var_6 );
        var_2[var_7] = scripts\engine\utility::_id_2279( var_2[var_7], var_5 );
    }

    return var_2;
}

_id_2DEA( var_0 )
{
    return _id_2DEB( self.team, "enemy", var_0 );
}

_id_2DE9( var_0 )
{
    return _id_2DEB( self.team, "ally", var_0 );
}

_id_2DEB( var_0, var_1, var_2 )
{
    var_3 = [];
    var_4 = level._id_C928;

    if ( isdefined( var_2 ) && var_2 )
        var_4 = level.players;

    foreach ( var_6 in var_4 )
    {
        if ( var_6 == self || !isalive( var_6 ) )
            continue;

        var_7 = 0;

        if ( var_1 == "ally" )
            var_7 = level.teambased && var_0 == var_6.team;
        else if ( var_1 == "enemy" )
            var_7 = !level.teambased || var_0 != var_6.team;

        if ( var_7 )
        {
            var_8 = var_6 getnearestnode();

            if ( isdefined( var_8 ) && nodeexposedtosky( var_8 ) )
                var_3 = scripts\engine\utility::_id_2279( var_3, var_6 );
        }
    }

    var_3 = scripts\engine\utility::array_remove( var_3, self );
    return var_3;
}

_id_2DC7( var_0 )
{
    var_1 = 99;
    var_2 = [];

    foreach ( var_4 in var_0._id_BEAA )
    {
        if ( isdefined( var_4._id_027C ) )
        {
            var_5 = var_4._id_2EC7[self.entity_number];

            if ( var_5 < var_1 )
            {
                var_2 = [];
                var_2[0] = var_4;
                var_1 = var_5;
            }
            else if ( var_5 == var_1 )
                var_2[var_2.size] = var_4;
        }
    }

    return var_2;
}

_id_2D3B( var_0 )
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "control_func_done" );
    level endon( "game_ended" );
    var_1 = _id_2ECD( var_0 );

    if ( !var_1 )
        self notify( "control_func_done" );

    foreach ( var_3 in level._id_AD8B )
    {
        if ( var_3.owner == self )
            self._id_131B5 = var_3;
    }

    childthread _id_2D6B( self._id_131B5 );
    self._id_131B5 endon( "death" );

    if ( isdefined( level._id_2DF9["control_other"][var_0] ) )
        self childthread [[ level._id_2DF9["control_other"][var_0] ]]();

    self [[ level._id_2DF9["waittill_initial_goal"][var_0] ]]();
    self childthread [[ level._id_2DF9["control_aiming"][var_0] ]]();
    _id_2D3C( var_0, 1 );
    self notify( "control_func_done" );
}

_id_2DAB( var_0 )
{
    if ( var_0 )
        return squared( 100 );
    else
        return squared( 30 );
}

_id_2DAC( var_0 )
{
    if ( var_0 )
        return squared( 300 );
    else
        return squared( 90 );
}

_id_2D3C( var_0, var_1 )
{
    foreach ( var_3 in level._id_2DC8 )
        var_3._id_2EC7[self.entity_number] = 0;

    var_5 = _id_6C81( self._id_131B5.origin, var_0 );
    var_6 = undefined;
    self._id_BF40 = 0;
    var_7 = "needs_new_goal";
    var_8 = undefined;
    var_9 = self._id_131B5.origin;
    var_10 = 3.0;
    var_11 = 0.05;

    while ( self [[ level._id_2DF9["isUsing"][var_0] ]]() )
    {
        if ( gettime() > self._id_BF40 && var_7 == "needs_new_goal" )
        {
            var_12 = var_5;
            var_5 = [[ level._id_2DF9["heli_pick_node"][var_0] ]]( var_5 );
            var_6 = undefined;

            if ( isdefined( var_5 ) )
            {
                var_13 = [[ level._id_2DF9["heli_node_get_origin"][var_0] ]]( var_5 );

                if ( var_1 )
                {
                    var_14 = var_5.origin + ( scripts\mp\utility\game::_id_7EF9() + level._id_2DC9 );
                    var_15 = var_5.origin + scripts\mp\utility\game::_id_7EF9() - level._id_2DC9;
                    var_16 = bullettrace( var_14, var_15, 0, undefined, 0, 0, 1 );
                    var_6 = var_16["position"] - scripts\mp\utility\game::_id_7EF9() + level._id_2DFA[var_0];
                }
                else
                    var_6 = var_13;
            }

            if ( isdefined( var_6 ) )
            {
                self botsetflag( "disable_movement", 0 );
                var_7 = "waiting_till_goal";
                var_10 = 3.0;
                var_9 = self._id_131B5.origin;
            }
            else
            {
                var_5 = var_12;
                self._id_BF40 = gettime() + 2000;
            }
        }
        else if ( var_7 == "waiting_till_goal" )
        {
            if ( !var_1 )
            {
                var_17 = var_6[2] - self._id_131B5.origin[2];

                if ( var_17 > 10 )
                    self botpressbutton( "lethal" );
                else if ( var_17 < -10 )
                    self botpressbutton( "tactical" );
            }

            var_18 = var_6 - self._id_131B5.origin;

            if ( var_1 )
                var_8 = length2dsquared( var_18 );
            else
                var_8 = lengthsquared( var_18 );

            if ( var_8 < _id_2DAB( var_1 ) )
            {
                self botsetscriptmove( 0, 0 );
                self botsetflag( "disable_movement", 1 );

                if ( self botgetdifficulty() == "recruit" )
                    self._id_BF40 = gettime() + randomintrange( 5000, 7000 );
                else
                    self._id_BF40 = gettime() + randomintrange( 3000, 5000 );

                var_7 = "needs_new_goal";
            }
            else
            {
                var_18 = var_6 - self._id_131B5.origin;
                var_19 = vectortoangles( var_18 );
                var_20 = scripts\engine\utility::ter_op( var_8 < _id_2DAC( var_1 ), 0.5, 1.0 );
                self botsetscriptmove( var_19[1], var_11, var_20 );
                var_10 -= var_11;

                if ( var_10 <= 0.0 )
                {
                    if ( distancesquared( self._id_131B5.origin, var_9 ) < 225 )
                    {
                        var_5._id_2EC7[self.entity_number]++;
                        var_7 = "needs_new_goal";
                    }

                    var_9 = self._id_131B5.origin;
                    var_10 = 3.0;
                }
            }
        }

        wait( var_11 );
    }
}

_id_7BEE()
{
    var_0 = [];

    foreach ( var_2 in level._id_C7E0 )
    {
        var_3 = botzonegetcount( var_2, self.team, "enemy_predict" );

        if ( var_3 > 0 )
            var_0 = scripts\engine\utility::_id_2279( var_0, var_2 );
    }

    var_5 = undefined;

    if ( var_0.size > 0 )
    {
        var_6 = scripts\engine\utility::_id_DC6B( var_0 );
        var_7 = scripts\engine\utility::_id_DC6B( getzonenodes( var_6 ) );
        var_5 = var_7.origin;
    }
    else
    {
        if ( isdefined( level._id_1165C ) )
            var_8 = [[ level._id_1165C ]]();
        else
            var_8 = getallnodes();

        var_9 = 0;

        while ( var_9 < 10 )
        {
            var_9++;
            var_10 = var_8[randomint( var_8.size )];
            var_5 = var_10.origin;

            if ( nodeexposedtosky( var_10 ) && distance2dsquared( var_10.origin, self._id_131B5.origin ) > 62500 )
                break;
        }
    }

    return var_5;
}

_id_9FC3()
{
    return isdefined( self._id_C53B ) && self._id_C53B;
}

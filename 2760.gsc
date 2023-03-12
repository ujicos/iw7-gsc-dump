// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_AC0B( var_0, var_1 )
{

}

_id_AC1A( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    thread _id_AC13();
    var_2 = self getcurrentweapon();

    for (;;)
    {
        while ( var_2 != var_0 )
            self waittill( "weapon_change", var_2 );

        childthread _id_AC08( var_2, var_1 );
        self waittill( "weapon_change", var_2 );
        _id_AC07();
    }
}

_id_AC13()
{
    self endon( "LGM_player_endMonitorFire" );
    scripts\engine\utility::waittill_any( "death", "disconnect" );

    if ( isdefined( self ) )
        _id_AC04();
}

_id_AC07()
{
    _id_AC04();
    self notify( "LGM_player_endMonitorFire" );
}

_id_AC08( var_0, var_1, var_2 )
{
    self endon( "LGM_player_endMonitorFire" );
    _id_AC05();
    var_3 = undefined;

    for (;;)
    {
        var_4 = undefined;
        self waittill( "missile_fire", var_4, var_5 );

        if ( isdefined( var_4._id_9E8F ) && var_4._id_9E8F )
            continue;

        if ( var_5 != var_0 )
            continue;

        if ( !isdefined( var_3 ) )
            var_3 = _id_AC17( self );

        thread _id_AC06( var_0, var_1, var_2, 0.35, 0.1, var_4, var_3 );
    }
}

_id_AC06( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self notify( "monitor_laserGuidedMissile_delaySpawnChildren" );
    self endon( "monitor_laserGuidedMissile_delaySpawnChildren" );
    self endon( "death" );
    self endon( "LGM_player_endMonitorFire" );
    _id_AC12( var_6 );
    wait( var_3 );

    if ( !isvalidmissile( var_5 ) )
        return;

    var_7 = var_5.origin;
    var_8 = anglestoforward( var_5.angles );
    var_9 = anglestoup( var_5.angles );
    var_10 = anglestoright( var_5.angles );
    var_5 delete();
    playfx( level._effect["laser_guided_launcher_missile_split"], var_7, var_8, var_9 );
    var_11 = [];

    for ( var_12 = 0; var_12 < 2; var_12++ )
    {
        var_13 = 20;
        var_14 = 0;

        if ( var_12 == 0 )
            var_14 = 20;
        else if ( var_12 == 1 )
            var_14 = -20;
        else if ( var_12 == 2 )
        {

        }

        var_15 = rotatepointaroundvector( var_10, var_8, var_13 );
        var_15 = rotatepointaroundvector( var_9, var_15, var_14 );
        var_16 = scripts\mp\utility\game::_id_1309( var_1, var_7, var_7 + var_15 * 180, self );
        var_16._id_9E8F = 1;
        var_11[var_11.size] = var_16;
        scripts\engine\utility::waitframe();
    }

    wait( var_4 );
    var_11 = _id_AC16( var_11 );

    if ( var_11.size > 0 )
    {
        foreach ( var_18 in var_11 )
        {
            var_6._id_B8AC[var_6._id_B8AC.size] = var_18;
            var_18 _meth_8206( var_6 );
            thread _id_AC15( var_6, var_18 );
        }

        thread _id_AC09( var_6, var_2 );
    }
}

_id_AC15( var_0, var_1 )
{
    var_1 scripts\engine\utility::waittill_any( "death", "missile_pairedWithFlare", "LGM_missile_abandoned" );

    if ( isdefined( var_0._id_B8AC ) && var_0._id_B8AC.size > 0 )
    {
        var_0._id_B8AC = scripts\engine\utility::array_remove( var_0._id_B8AC, var_1 );
        var_0._id_B8AC = _id_AC16( var_0._id_B8AC );
    }

    if ( !isdefined( var_0._id_B8AC ) || var_0._id_B8AC.size == 0 )
        self notify( "LGM_player_allMissilesDestroyed" );
}

_id_AC09( var_0, var_1 )
{
    self notify( "LGM_player_newMissilesFired" );
    self endon( "LGM_player_newMissilesFired" );
    self endon( "LGM_player_allMissilesDestroyed" );
    self endon( "LGM_player_endMonitorFire" );
    self endon( "death" );
    self endon( "disconnect" );
    var_2 = undefined;
    var_3 = undefined;
    var_4 = undefined;
    var_5 = 0;
    var_6 = gettime() + 400;

    while ( isdefined( var_0._id_B8AC ) && var_0._id_B8AC.size > 0 )
    {
        var_7 = _id_AC18();

        if ( !isdefined( var_7 ) )
        {
            if ( isdefined( var_3 ) )
            {
                self notify( "LGM_player_targetLost" );
                var_3 = undefined;

                foreach ( var_9 in var_0._id_B8AC )
                    var_9 notify( "missile_targetChanged" );
            }

            var_4 = undefined;
            var_5 = 0;
            var_11 = scripts\engine\utility::ter_op( gettime() > var_6, 8000, 800 );
            var_12 = anglestoforward( self getplayerangles() );
            var_13 = self geteye() + var_12 * 12;
            var_14 = bullettrace( var_13, var_13 + var_12 * var_11, 1, self, 0, 0, 0 );
            var_2 = var_14["position"];
        }
        else
        {
            var_2 = var_7.origin;
            var_15 = !isdefined( var_3 ) || var_7 != var_3;
            var_3 = var_7;

            if ( var_15 || !isdefined( var_4 ) )
            {
                var_4 = gettime() + 1500;
                level thread _id_AC11( var_3, self );
            }
            else if ( gettime() >= var_4 )
            {
                var_5 = 1;
                self notify( "LGM_player_lockedOn" );
            }

            if ( var_5 )
            {
                waittillframeend;

                if ( var_0._id_B8AC.size > 0 )
                {
                    var_16 = [];

                    foreach ( var_9 in var_0._id_B8AC )
                    {
                        if ( !isvalidmissile( var_9 ) )
                            continue;

                        var_16[var_16.size] = var_9.origin;
                        var_9 notify( "missile_targetChanged" );
                        var_9 notify( "LGM_missile_abandoned" );
                        var_9 delete();
                    }

                    if ( var_16.size > 0 )
                        level thread _id_AC0E( var_3, self, var_1, var_16 );

                    var_0._id_B8AC = [];
                }
                else
                    break;
            }
            else if ( var_15 )
                _id_AC19( var_3, self, var_0._id_B8AC );
        }

        var_0.origin = var_2;
        scripts\engine\utility::waitframe();
    }
}

_id_AC17( var_0 )
{
    if ( !isdefined( level._id_A875 ) )
        level._id_A875 = [];

    if ( !isdefined( level._id_A876 ) )
        level._id_A876 = [];

    var_1 = undefined;

    if ( level._id_A876.size )
    {
        var_1 = level._id_A876[0];
        level._id_A876 = scripts\engine\utility::array_remove( level._id_A876, var_1 );
    }
    else
        var_1 = spawn( "script_origin", var_0.origin );

    level._id_A875[level._id_A875.size] = var_1;
    level thread _id_AC14( var_1, var_0 );
    var_1._id_B8AC = [];
    return var_1;
}

_id_AC14( var_0, var_1 )
{
    var_1 scripts\engine\utility::waittill_any( "death", "disconnect", "LGM_player_endMonitorFire" );

    foreach ( var_3 in var_0._id_B8AC )
    {
        if ( isvalidmissile( var_3 ) )
            var_3 _meth_8203();
    }

    var_0._id_B8AC = undefined;
    level._id_A875 = scripts\engine\utility::array_remove( level._id_A875, var_0 );

    if ( level._id_A876.size + level._id_A875.size < 4 )
        level._id_A876[level._id_A876.size] = var_0;
    else
        var_0 delete();
}

_id_AC11( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_C794( var_0, "orange", var_1, 1, 0, "killstreak_personal" );
    level thread _id_AC0F( var_1, "maaws_reticle_tracking", 1.5, "LGM_player_lockingDone" );
    level thread _id_AC10( var_0, var_1 );
    var_1 scripts\engine\utility::waittill_any( "death", "disconnect", "LGM_player_endMonitorFire", "LGM_player_newMissilesFired", "LGM_player_targetLost", "LGM_player_lockedOn", "LGM_player_allMissilesDestroyed", "LGM_player_targetDied" );

    if ( isdefined( var_0 ) )
        scripts\mp\utility\game::_id_C78F( var_2, var_0 );

    if ( isdefined( var_1 ) )
    {
        var_1 notify( "LGM_player_lockingDone" );
        var_1 stopolcalsound( "maaws_reticle_tracking" );
    }
}

_id_AC0C( var_0, var_1, var_2 )
{
    var_1 endon( "death" );
    var_0 waittill( "death" );
    var_1._id_AC03[var_2] = scripts\engine\utility::array_remove( var_1._id_AC03[var_2], var_0 );

    if ( var_1._id_AC03[var_2].size == 0 )
    {
        var_1._id_AC03[var_2] = undefined;
        var_1 notify( "LGM_target_lockedMissilesDestroyed" );
    }
}

_id_AC10( var_0, var_1 )
{
    var_1 endon( "death" );
    var_1 endon( "disconnect" );
    var_1 endon( "LGM_player_lockingDone" );
    var_0 waittill( "death" );
    var_1 notify( "LGM_player_targetDied" );
}

_id_AC0F( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( var_3 );

    for (;;)
    {
        var_0 playlocalsound( var_1 );
        wait( var_2 );
    }
}

_id_AC0D( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "death" );
    var_1 endon( "death" );
    var_1 endon( "disconnect" );
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
    {
        var_6 = scripts\mp\utility\game::_id_1309( var_2, var_3[var_5], var_0.origin, var_1 );
        var_6._id_9E8F = 1;
        var_4[var_4.size] = var_6;
        playfx( level._effect["laser_guided_launcher_missile_spawn_homing"], var_6.origin, anglestoforward( var_6.angles ), anglestoup( var_6.angles ) );
        scripts\engine\utility::waitframe();
    }

    return var_4;
}

_id_AC0E( var_0, var_1, var_2, var_3 )
{
    if ( var_3.size == 0 )
        return;

    var_4 = _id_AC0D( var_0, var_1, var_2, var_3 );

    if ( !isdefined( var_4 ) )
        return;

    var_4 = _id_AC16( var_4 );

    if ( var_4.size == 0 )
        return;

    var_1 playlocalsound( "maaws_reticle_locked" );
    var_5 = scripts\mp\utility\game::_id_C794( var_0, "red", var_1, 0, 0, "killstreak_personal" );
    var_6 = _id_AC0A( var_0 );

    foreach ( var_8 in var_4 )
    {
        var_8 scripts\engine\utility::_id_B82F( var_0, "direct", var_6 );
        _id_AC19( var_0, var_1, var_4 );
    }

    if ( !isdefined( var_0._id_AC03 ) )
        var_0._id_AC03 = [];

    var_0._id_AC03[var_5] = var_4;

    foreach ( var_11 in var_4 )
        level thread _id_AC0C( var_11, var_0, var_5 );

    var_13 = 1;

    while ( var_13 )
    {
        var_14 = var_0 scripts\engine\utility::_id_13734( "death", "LGM_target_lockedMissilesDestroyed" );

        if ( var_14 == "death" )
        {
            var_13 = 0;

            if ( isdefined( var_0 ) )
                var_0._id_AC03[var_5] = undefined;

            continue;
        }

        if ( var_14 == "LGM_target_lockedMissilesDestroyed" )
        {
            waittillframeend;

            if ( !isdefined( var_0._id_AC03[var_5] ) || var_0._id_AC03[var_5].size == 0 )
                var_13 = 0;
        }
    }

    if ( isdefined( var_0 ) )
        scripts\mp\utility\game::_id_C78F( var_5, var_0 );
}

_id_AC18()
{
    var_0 = scripts\mp\weapons::_id_AF2B();
    var_0 = sortbydistance( var_0, self.origin );
    var_1 = undefined;

    foreach ( var_3 in var_0 )
    {
        if ( self _meth_8409( var_3.origin, 65, 75 ) )
        {
            var_1 = var_3;
            break;
        }
    }

    return var_1;
}

_id_AC05()
{
    if ( !isdefined( self._id_A874 ) || self._id_A874 == 0 )
    {
        self._id_A874 = 1;
        scripts\mp\utility\game::_id_6282();
    }
}

_id_AC04()
{
    if ( isdefined( self._id_A874 ) && self._id_A874 == 1 )
        scripts\mp\utility\game::_id_561C();

    self._id_A874 = undefined;
}

_id_AC16( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 )
    {
        if ( isvalidmissile( var_3 ) )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_AC19( var_0, var_1, var_2 )
{
    level notify( "laserGuidedMissiles_incoming", var_1, var_2, var_0 );
    var_0 notify( "targeted_by_incoming_missile", var_2 );
}

_id_AC0A( var_0 )
{
    var_1 = undefined;

    if ( var_0._id_01F1 != "vehicle_av8b_harrier_jet_mp" )
        var_1 = var_0 gettagorigin( "tag_missile_target" );
    else
        var_1 = var_0 gettagorigin( "tag_body" );

    if ( !isdefined( var_1 ) )
        var_1 = var_0 getpointinbounds( 0, 0, 0 );

    return var_1 - var_0.origin;
}

_id_AC12( var_0 )
{
    if ( isdefined( var_0._id_B8AC ) && var_0._id_B8AC.size > 0 )
    {
        foreach ( var_2 in var_0._id_B8AC )
        {
            if ( isvalidmissile( var_2 ) )
            {
                var_2 notify( "missile_targetChanged" );
                var_2 notify( "LGM_missile_abandoned" );
                var_2 _meth_8203();
            }
        }
    }

    var_0._id_B8AC = [];
}

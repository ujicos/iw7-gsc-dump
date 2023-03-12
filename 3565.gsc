// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

kineticpulse_use()
{
    self setscriptablepartstate( "kineticPulse", "activeWarmUp" );
    scripts\engine\utility::_id_13737( 0.5, "death", "disconnect" );

    if ( !isdefined( self ) )
        return;

    if ( !scripts\mp\utility\game::isreallyalive( self ) )
    {
        self setscriptablepartstate( "kineticPulse", "neutral" );
        return;
    }

    self iprintlnbold( "Kinetic Pulse Activated" );
    self setclientomnvar( "ui_hud_shake", 1 );
    self setscriptablepartstate( "kineticPulse", "activeFire" );
    var_0 = [];
    var_1 = 0.05;
    var_2 = 120.0;
    var_3 = 200;
    var_4 = physics_createcontents( [ "physicscontents_solid", "physicscontents_vehicle", "physicscontents_glass", "physicscontents_water", "physicscontents_sky", "physicscontents_item" ] );
    var_5 = self gettagorigin( "j_spineupper" );

    for ( var_6 = 0; var_6 < 5; var_6++ )
    {
        var_7 = undefined;

        if ( level.teambased && !level._id_740A )
            var_7 = scripts\mp\utility\game::_id_807C( var_5, var_3, scripts\mp\utility\game::_id_8027( self.team ), undefined );
        else
            var_7 = scripts\mp\utility\game::_id_807C( var_5, var_3, undefined, self );

        foreach ( var_9 in var_7 )
        {
            var_10 = var_9 getentitynumber();

            if ( isdefined( var_0[var_10] ) )
                continue;

            if ( !scripts\mp\utility\game::isreallyalive( var_9 ) )
                continue;

            if ( !scripts\mp\equipment\phase_shift::_id_213D( self, var_9 ) )
                continue;

            var_11 = var_5;
            var_12 = var_9.origin;
            var_13 = physics_raycast( var_11, var_12, var_4, undefined, 0, "physicsquery_closest", 1 );

            if ( isdefined( var_13 ) && var_13.size > 0 )
            {
                var_12 = var_9 geteye();
                var_13 = physics_raycast( var_11, var_12, var_4, undefined, 0, "physicsquery_closest", 1 );

                if ( isdefined( var_13 ) && var_13.size > 0 )
                    continue;
            }

            var_0[var_10] = var_9;
            kineticpulse_playereffects( var_9, var_5 );
        }

        var_7 = scripts\mp\weapons::_id_7E8C( var_5, var_3, 0 );

        foreach ( var_9 in var_7 )
        {
            if ( !isdefined( var_9 ) )
                continue;

            var_10 = var_9 getentitynumber();

            if ( isdefined( var_0[var_10] ) )
                continue;

            if ( !scripts\mp\equipment\phase_shift::_id_213D( self, var_9 ) )
                continue;

            var_16 = var_9;

            if ( isdefined( var_9.owner ) )
                var_16 = var_9.owner;

            if ( !scripts\mp\weapons::_id_7415( self, var_16 ) && var_16 != self )
                continue;

            var_0[var_10] = var_9;
            kineticpulse_nonplayereffects( var_9, var_5 );
        }

        var_3 += var_2;
        wait( var_1 );
    }
}

kineticpulse_playereffects( var_0, var_1 )
{
    thread kineticpulse_playerconcuss( var_0 );
    thread kineticpulse_playeremp( var_0 );
    var_0 _meth_80B0( 1, var_1, self, self, "MOD_EXPLOSIVE", "kineticpulse_mp" );
}

kineticpulse_playerconcuss( var_0 )
{
    scripts\mp\gamescore::_id_11ACE( self, var_0, "kineticpulse_concuss_mp" );
    var_1 = scripts\mp\perks\perkfunctions::_id_20E0( self, var_0, 5 );
    var_0 shellshock( "concussion_grenade_mp", var_1 );
    var_0 scripts\engine\utility::_id_13737( var_1, "death", "disconnect" );

    if ( isdefined( var_0 ) && scripts\mp\utility\game::isreallyalive( var_0 ) )
    {
        if ( isdefined( self ) )
            scripts\mp\gamescore::_id_12D6F( self, var_0, "kineticpulse_concuss_mp" );
    }
}

kineticpulse_playeremp( var_0 )
{
    if ( !scripts\mp\killstreaks\emp_common::_id_FFC5() )
    {
        scripts\mp\damagefeedback::updatedamagefeedback( "hiticonempimmune", undefined, undefined, undefined, 1 );
        return;
    }
    else
    {
        scripts\mp\gamescore::_id_11ACE( self, var_0, "kineticpulse_emp_mp" );
        var_0 scripts\mp\killstreaks\emp_common::_id_20C3();
        var_0 scripts\engine\utility::_id_13737( 5, "death", "disconnect" );

        if ( isdefined( var_0 ) && scripts\mp\utility\game::isreallyalive( var_0 ) )
        {
            if ( isdefined( self ) )
                scripts\mp\gamescore::_id_12D6F( self, var_0, "kineticpulse_emp_mp" );

            var_0 scripts\mp\killstreaks\emp_common::_id_E0F3();
        }
    }
}

kineticpulse_nonplayereffects( var_0, var_1 )
{
    var_0 notify( "emp_damage", self, 5, var_1, "kineticpulse_emp_mp", "MOD_EXPLOSIVE" );
}

isplayertaggedbykineticpulse( var_0 )
{
    var_1 = scripts\mp\gamescore::_id_7E64( var_0, "kineticpulse_concuss_mp" );

    if ( isdefined( var_1 ) && scripts\engine\utility::array_contains( var_1, self ) )
        return 1;

    var_1 = scripts\mp\gamescore::_id_7E64( var_0, "kineticpulse_emp_mp" );

    if ( isdefined( var_1 ) && scripts\engine\utility::array_contains( var_1, self ) )
        return 1;

    return 0;
}

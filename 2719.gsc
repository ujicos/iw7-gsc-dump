// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{

}

_id_1014E( var_0, var_1, var_2, var_3, var_4, var_5 )
{

}

_id_12F00()
{

}

_id_DE5E()
{

}

_id_DE5D()
{

}

_id_DE5C()
{

}

_id_8470()
{

}

_id_8472()
{

}

_id_53E0()
{

}

_id_10607()
{
    var_0 = [ "headshot", "avenger", "longshot", "posthumous", "double", "triple", "multi" ];

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        thread scripts\mp\rank::_id_EC42( 100 );
        thread scripts\mp\rank::scoreeventpopup( var_0[var_1] );
        wait 2.0;
    }
}

_id_A5AC()
{
    for (;;)
    {
        if ( getdvarint( "scr_dropAllies" ) > 0 )
            break;

        wait 1;
    }

    var_0 = undefined;

    foreach ( var_2 in level._id_3CB5 )
    {
        if ( isplayer( var_2 ) && !isbot( var_2 ) )
        {
            var_0 = var_2;
            break;
        }
    }

    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_2 in level._id_3CB5 )
    {
        if ( level.teambased )
        {
            if ( var_2.team == var_0.team )
                kick( var_2 getentitynumber() );

            continue;
        }

        return;
    }
}

_id_53EE()
{
    level._id_D788 = getdvarint( "scr_power_short_cooldown", 0 );

    for (;;)
    {
        var_0 = getdvarint( "scr_power_short_cooldown", 0 );

        if ( var_0 != level._id_D788 )
        {
            level._id_D788 = var_0;

            foreach ( var_2 in level.players )
            {
                if ( isbot( var_2 ) )
                    continue;

                var_3 = var_2 _id_0AE2::_id_808C( "primary" );

                if ( isdefined( var_3 ) )
                    _id_53E4( var_3, "primary" );

                var_3 = var_2 _id_0AE2::_id_808C( "secondary" );

                if ( isdefined( var_3 ) )
                    _id_53E4( var_3, "secondary" );
            }
        }

        wait 0.25;
    }
}

_id_53ED()
{
    level._id_D7A3 = getdvarint( "scr_power_use_cooldown", -1 );

    for (;;)
    {
        var_0 = getdvarint( "scr_power_use_cooldown", -1 );

        if ( var_0 != level._id_D7A3 )
        {
            level._id_D7A3 = var_0;

            foreach ( var_2 in level.players )
            {
                if ( isbot( var_2 ) )
                    continue;

                var_3 = var_2 _id_0AE2::_id_808C( "primary" );

                if ( isdefined( var_3 ) )
                    _id_53E4( var_3, "primary" );

                var_3 = var_2 _id_0AE2::_id_808C( "secondary" );

                if ( isdefined( var_3 ) )
                    _id_53E4( var_3, "secondary" );
            }
        }

        wait 0.25;
    }
}

_id_53EC()
{
    level._id_D777 = getdvarint( "scr_power_extra_charge", 0 );

    for (;;)
    {
        var_0 = getdvarint( "scr_power_extra_charge", 0 );

        if ( var_0 != level._id_D777 )
        {
            level._id_D777 = var_0;

            foreach ( var_2 in level.players )
            {
                if ( isbot( var_2 ) )
                    continue;

                var_3 = var_2 _id_0AE2::_id_808C( "primary" );

                if ( isdefined( var_3 ) )
                    _id_53E4( var_3, "primary" );

                var_3 = var_2 _id_0AE2::_id_808C( "secondary" );

                if ( isdefined( var_3 ) )
                    _id_53E4( var_3, "secondary" );
            }
        }

        wait 0.25;
    }
}

_id_53E5()
{
    for (;;)
    {
        var_0 = getdvar( "scr_givepowerprimary", "" );

        if ( var_0 != "" )
            _id_53E4( var_0, "primary" );

        var_0 = getdvar( "scr_givepowersecondary", "" );

        if ( var_0 != "" )
            _id_53E4( var_0, "secondary" );

        wait 0.25;
    }
}

_id_53E4( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( isbot( var_3 ) )
            continue;

        var_4 = var_3 _id_0AE2::_id_808C( var_1 );

        if ( isdefined( var_4 ) )
            var_3 _id_0AE2::_id_E15E( var_4 );

        var_3 _id_0AE2::_id_8397( var_0, var_1, 0 );
    }
}

_id_53EA()
{
    var_0 = getdvar( "scr_list_inventory", "" );

    if ( var_0 != "" )
    {
        var_1 = _id_53E3();

        if ( !isdefined( var_1 ) )
            return;

        var_2 = undefined;
        var_3 = undefined;
        var_4 = 0;

        if ( var_0 == "all" )
        {
            var_3 = "all weapons";
            var_2 = var_1 _meth_8173();
        }
        else if ( var_0 == "primaryCurrent" )
        {
            var_3 = "current weapon";
            var_4 = 1;
            var_2 = [ var_1 getcurrentweapon() ];
        }
        else
        {
            var_3 = var_0 + " inventory";
            var_2 = var_1 _meth_8172( var_0 );
        }

        var_1 _id_53EF( var_2, var_3, var_4 );
    }
}

_id_53EF( var_0, var_1, var_2 )
{
    if ( isdefined( var_0 ) && var_0.size > 0 )
    {
        foreach ( var_4 in var_0 )
        {
            var_5 = self getweaponammoclip( var_4 );
            var_6 = self getweaponammostock( var_4 );
            var_7 = "  " + var_4 + " " + var_5 + "/" + var_6;

            if ( var_2 )
                iprintlnbold( var_7 );
        }
    }
    else
    {

    }
}

_id_53E6()
{
    var_0 = getdvarint( "scr_super_short_cooldown", 0 );

    for (;;)
    {
        var_1 = getdvar( "scr_givesuper", "" );

        if ( var_1 != "" )
        {
            var_2 = _id_53E3();
            var_2 scripts\mp\supers::_id_83A8( var_1 );
        }

        if ( getdvarint( "scr_super_short_cooldown", 0 ) != 0 )
        {
            if ( !var_0 )
            {
                var_0 = 1;

                foreach ( var_4 in level.players )
                {
                    if ( isbot( var_4 ) )
                        continue;

                    if ( var_4 scripts\mp\supers::_id_9F89() )
                        var_4 scripts\mp\supers::_id_E276();
                }
            }
        }
        else if ( var_0 )
        {
            var_0 = 0;

            foreach ( var_4 in level.players )
            {
                if ( isbot( var_4 ) )
                    continue;

                if ( var_4 scripts\mp\supers::_id_9F89() )
                    var_4 scripts\mp\supers::_id_E276();
            }
        }

        wait 0.25;
    }
}

_id_53E3()
{
    var_0 = undefined;

    foreach ( var_2 in level.players )
    {
        if ( var_2 ishost() )
        {
            var_0 = var_2;
            break;
        }
    }

    return var_0;
}

_id_53F0()
{
    var_0 = getdvar( "scr_debug_streak_passive", "none" );

    for (;;)
    {
        var_1 = getdvar( "scr_debug_streak_passive", "none" );

        if ( var_0 != var_1 )
        {
            iprintlnbold( "All Killstreaks from the DevGui will have " + var_1 );
            var_0 = var_1;
        }

        wait 1.0;
    }
}

_id_13AB3()
{
    for (;;)
    {
        if ( getdvarint( "scr_lethalDelayCancel", 0 ) )
        {
            scripts\mp\weapons::_id_3882();
            return;
        }

        wait 1.0;
    }
}

_id_13B6C()
{
    for (;;)
    {
        if ( getdvarint( "scr_superDelayCancel", 0 ) )
        {
            scripts\mp\supers::_id_3887();
            return;
        }

        wait 1.0;
    }
}

_id_13B46()
{
    for (;;)
    {
        if ( getdvar( "scr_slowmo" ) != "" )
            break;

        wait 1;
    }

    var_0 = getdvarfloat( "scr_slowmo" );
    setslowmotion( var_0, var_0, 0.0 );
    thread _id_13B46();
}

_id_53E2()
{
    for (;;)
    {
        if ( getdvar( "scr_jt_devbroshot" ) != "" )
        {
            iprintlnbold( " BRO " );
            level._id_58D7 = scripts\mp\broshot::_id_97E0();

            if ( level._id_58D7 )
            {
                setomnvarforallclients( "post_game_state", 6 );
                wait 0.1;
                scripts\mp\broshot::_id_10D73();
            }
        }

        if ( getdvarint( "scr_debug_start_broshot" ) )
        {
            iprintlnbold( "Test Broshot" );
            level._id_58D7 = scripts\mp\broshot::forceinitbroshot();

            if ( level._id_58D7 )
            {
                setomnvarforallclients( "post_game_state", 6 );
                wait 0.1;
                level.players[0] scripts\mp\broshot::_id_10D73();
            }
        }

        if ( getdvarint( "scr_debug_change_rig_broshot" ) )
        {
            scripts\mp\broshot::changetestrig( getdvarint( "scr_debug_change_rig_broshot" ), 1 );
            iprintlnbold( "Test Rig" + getdvarint( "scr_debug_change_rig_broshot" ) );
        }

        if ( getdvarint( "scr_debug_assign_taunt_broshot" ) )
        {
            scripts\mp\broshot::changetesttaunt( getdvarint( "scr_debug_assign_taunt_broshot" ) );
            iprintlnbold( "Test Taunt" + getdvarint( "scr_debug_assign_taunt_broshot" ) );
        }

        if ( getdvarint( "scr_debug_change_slot_broshot" ) )
        {
            scripts\mp\broshot::changetestslot( getdvarint( "scr_debug_change_slot_broshot" ) );
            iprintlnbold( "Test Slot Change" + getdvarint( "scr_debug_change_slot_broshot" ) );
        }

        wait 0.05;
    }
}

rangefinder()
{
    thread scripts\mp\rangefinder::runmprangefinder();
}

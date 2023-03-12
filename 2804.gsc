// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_10E4E = [];
    level._id_112A9 = [];
    level._id_1125E = 1.0;
    level._id_11264 = [];
    scripts\mp\bots\bots_supers::_id_2EA3();

    if ( scripts\mp\utility\game::_id_9D46() )
    {
        var_0 = 24;
        var_1 = 25;
        var_2 = 26;

        if ( level.gametype == "sd" )
            var_2 = 2;
    }
    else
    {
        var_0 = 4;
        var_1 = 14;
        var_2 = 2;
    }

    var_3 = 1;

    for (;;)
    {
        var_4 = tablelookupbyrow( "mp/supertable.csv", var_3, 0 );

        if ( !isdefined( var_4 ) || var_4 == "" )
            break;

        var_5 = spawnstruct();
        level._id_10E4E[var_4] = var_5;
        var_5._id_92B8 = var_3;
        var_5._id_DE3F = var_4;
        var_5.weapon = _id_DD68( var_3, 1 );
        var_5._id_4613 = _id_DD68( var_3, var_2, 1 );
        var_5._id_EC3E = _id_DD68( var_3, 3, 1 );
        var_5._id_5F36 = _id_DD68( var_3, var_0, 1 );
        var_5._id_B473 = _id_DD68( var_3, 5, 1 );
        var_5._id_130F8 = _id_DD68( var_3, 10 );
        var_5._id_130F9 = _id_DD68( var_3, 11, 1 );
        var_5._id_130FA = _id_DD68( var_3, 12, 1 );
        var_5._id_BCEF = _id_DD68( var_3, 13, 1 );
        var_5._id_8487 = _id_DD68( var_3, var_1, 1 );
        var_5._id_B474 = _id_DD68( var_3, 15, 1 );
        var_5._id_12B28 = _id_DD68( var_3, 17, 1 );
        var_5._id_2123 = _id_DD68( var_3, 16 );
        var_5._id_9FF8 = _id_DD68( var_3, 18, 1 );
        level._id_11264[var_3] = var_4;

        if ( !isdefined( level._id_2EFC ) )
            level._id_2EFC[var_5._id_2123] = [];

        if ( !isdefined( level._id_2EFC[var_5._id_2123] ) )
            level._id_2EFC[var_5._id_2123] = [];

        if ( scripts\mp\bots\bots_supers::_id_9F8B( var_4 ) )
            level._id_2EFC[var_5._id_2123][level._id_2EFC[var_5._id_2123].size] = var_4;

        if ( !isdefined( var_5.weapon ) )
            level._id_10E4E[var_4] = undefined;

        if ( !isdefined( var_5._id_4613 ) )
            level._id_10E4E[var_4] = undefined;

        if ( isdefined( var_5._id_B473 ) )
        {
            if ( var_5._id_B473 > 0 )
                var_5._id_1616 = var_5._id_5F36 / var_5._id_B473 * 1000.0;
            else
                var_5._id_1616 = var_5._id_5F36;
        }

        if ( isdefined( var_5._id_B474 ) )
        {
            if ( var_5._id_B474 > 0 )
                var_5._id_1617 = var_5._id_5F36 / var_5._id_B474 * 1000.0;
        }

        if ( isdefined( var_5._id_130F8 ) )
            _id_1831( var_5._id_130F8, var_4, var_5 );

        if ( var_5.weapon == "<default>" )
            var_5.weapon = "super_default_mp";

        if ( isdefined( var_5._id_8487 ) )
            var_5._id_8487 *= 1000.0;
        else
            var_5._id_8487 = 0.0;

        if ( isdefined( var_5._id_12B28 ) )
            var_5._id_12B28 *= 1000.0;
        else
            var_5._id_12B28 = 0.0;

        var_3++;
    }

    var_6 = tablelookup( "mp/superratetable.csv", 0, level.gametype, 1 );

    if ( isdefined( var_6 ) && var_6 != "" )
        level._id_1125E = float( var_6 );

    _id_DF10();
    scripts\mp\supers\super_reaper::_id_DD9E();
    scripts\mp\supers\super_armorup::_id_218F();
    scripts\mp\supers\super_visionpulse::init();
    scripts\mp\supers\super_supertrophy::_id_1127D();
    scripts\mp\equipment\phase_shift::init();
    scripts\mp\teleport::init();
    scripts\mp\equipment\micro_turret::_id_B703();
    scripts\mp\equipment\charge_mode::_id_3CED();
    scripts\mp\supers\super_blackholegun::init();
    scripts\mp\supers\super_overdrive::_id_98AB();
}

_id_1831( var_0, var_1, var_2 )
{
    var_0 = scripts\mp\utility\game::_id_8234( var_0 );
    level._id_112A9[var_0] = spawnstruct();
    level._id_112A9[var_0]._id_11263 = var_1;
    level._id_112A9[var_0]._id_10E47 = var_2;
}

_id_DF10()
{
    _id_DF0F( "super_claw", undefined, undefined, undefined, undefined );
    _id_DF0F( "super_amplify", undefined, ::_id_12C70, ::_id_13041, ::_id_630A );
    _id_DF0F( "super_overdrive", ::_id_F7CE, ::_id_12CFF, undefined, undefined );
    _id_DF0F( "super_steeldragon", undefined, undefined, undefined, undefined );
    _id_DF0F( "super_armorup", undefined, undefined, ::_id_13044, ::_id_630C );
    _id_DF0F( "super_chargemode", ::_id_F68E, ::_id_12C8F, ::_id_13052, ::_id_6313 );
    _id_DF0F( "super_armmgs", undefined, undefined, undefined, undefined );
    _id_DF0F( "super_reaper", undefined, undefined, ::_id_130CA, ::_id_637A );
    _id_DF0F( "super_rewind", ::_id_F81E, ::_id_12D1B, undefined, undefined );
    _id_DF0F( "super_atomizer", undefined, undefined, undefined, undefined );
    _id_DF0F( "super_phaseshift", undefined, undefined, ::_id_130BC, ::_id_6376 );
    _id_DF0F( "super_teleport", ::_id_F87E, ::_id_12D44, undefined, undefined );
    _id_DF0F( "super_blackholegun", undefined, undefined, ::_id_1304E, ::_id_630F );
    _id_DF0F( "super_supertrophy", undefined, ::_id_12D3F, ::_id_130E2, ::_id_638F );
    _id_DF0F( "super_microturret", ::_id_F797, ::_id_12CEF, ::_id_130A4, ::_id_6364 );
    _id_DF0F( "super_penetrationrailgun", undefined, undefined, undefined, undefined );
    _id_DF0F( "super_visionpulse", undefined, undefined, ::_id_130F6, undefined );
    _id_DF0F( "super_invisible", ::_id_F75E, ::_id_12CDA, ::_id_1309A, ::_id_635C );
}

_id_DF0F( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = level._id_10E4E[var_0];

    if ( !isdefined( var_5 ) )
        return;

    var_5._id_F71E = var_1;
    var_5._id_12CC4 = var_2;
    var_5._id_2A7C = var_3;
    var_5._id_6398 = var_4;
    var_5._id_9F1D = 1;
}

_id_DD68( var_0, var_1, var_2 )
{
    var_3 = tablelookupbyrow( "mp/supertable.csv", var_0, var_1 );

    if ( var_3 == "" )
        return undefined;

    if ( scripts\mp\utility\game::istrue( var_2 ) )
    {
        if ( issubstr( var_3, "." ) )
            var_3 = float( var_3 );
        else
            var_3 = int( var_3 );
    }

    return var_3;
}

_id_83A8( var_0, var_1 )
{
    _id_41E2( var_1 );
    var_2 = level._id_10E4E[var_0];

    if ( !isdefined( var_2 ) )
        return;

    var_3 = spawnstruct();
    self._id_11234 = var_3;
    var_3._id_10E47 = var_2;
    var_3._id_9E53 = 0;
    var_3._id_461F = undefined;
    var_3._id_461E = undefined;
    var_3._id_130DE = undefined;
    var_3._id_130EF = undefined;
    var_3._id_1CA3 = 1;
    var_3._id_B143 = -1;
    var_3._id_C234 = 0;
    var_3._id_1391B = 0;
    var_3._id_3916 = 0;
    var_4 = var_3._id_10E47._id_F71E;

    if ( isdefined( var_4 ) )
        self thread [[ var_4 ]]();

    self setclientomnvar( "ui_super_ref", var_0 );
    var_5 = 0;
    var_6 = self.pers["superCooldownTime"];

    if ( isdefined( var_6 ) )
    {
        var_5 = var_6 / 1000.0;
        self.pers["superCooldownTime"] = undefined;
    }

    _id_E276( var_5 );

    if ( _id_1125C() )
    {
        scripts\mp\utility\game::_id_12C6( var_2.weapon );
        var_7 = scripts\engine\utility::ter_op( _id_9F8A(), 1, 0 );
        self setweaponammoclip( var_2.weapon, var_7 );
        self _meth_84C2( var_2.weapon );
    }
    else
        thread _id_13B6D();

    thread _id_13A6F();
    thread _id_12F32();
    thread _id_13A61();
    thread _id_110C5();
    thread _id_89E8();
    thread _id_89F0();
}

_id_41E2( var_0 )
{
    var_1 = _id_7E4E();

    if ( isdefined( var_1 ) && isdefined( var_1._id_10E47 ) )
    {
        var_2 = var_1._id_10E47._id_12CC4;

        if ( isdefined( var_2 ) )
            self thread [[ var_2 ]]();
    }

    if ( scripts\mp\utility\game::istrue( var_0 ) && isdefined( var_1 ) )
        _id_110C4();

    self _meth_84C3();

    if ( isdefined( var_1 ) )
        scripts\mp\utility\game::_id_141E( var_1._id_10E47.weapon );

    if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
        self _meth_80C5( 0 );

    self notify( "remove_super" );
    self._id_11234 = undefined;
    self setclientomnvar( "ui_super_state", 0 );
    self setclientomnvar( "ui_super_ref", "none" );
}

_id_E276( var_0 )
{
    var_1 = _id_7E4E();
    var_1._id_461E = getsupermaxcooldownmsec();
    var_1._id_461F = 0;
    var_1._id_1CA3 = 1;

    if ( isdefined( var_0 ) )
    {
        var_1._id_461F += int( var_0 * 1000 );
        var_1._id_461F = int( min( var_1._id_461F, var_1._id_461E ) );
    }

    self setclientomnvar( "ui_super_state", 1 );
    self setweaponammoclip( var_1._id_10E47.weapon, 0 );
    _id_11257();
}

_id_DE3A( var_0 )
{
    var_1 = _id_7E4E();
    var_0 = int( var_0 );
    var_1._id_461F += var_0;
    _id_11257();
}

_id_11257()
{
    self notify( "super_cooldown_altered" );
    thread _id_12F31();
}

_id_83AA( var_0 )
{
    var_1 = _id_7E4E();

    if ( !isdefined( var_1 ) || !isdefined( var_1._id_10E47._id_EC3E ) || _id_9F8A() || var_1._id_9E53 )
        return;

    var_2 = var_0 / 100.0 * level.superpointsmod * var_1._id_10E47._id_EC3E * 1000.0;
    _id_DE3A( var_2 );
    scripts\mp\analyticslog::_id_AFAF( var_0, gettime() );
}

_id_12F32()
{
    self endon( "disconnect" );
    self endon( "remove_super" );

    for (;;)
    {
        var_0 = _id_7E4E();
        var_1 = 0.0;

        if ( var_0._id_9E53 )
            var_1 = _id_818B();
        else
        {
            var_2 = var_0._id_461E - var_0._id_461F;
            var_3 = getsupermaxcooldownmsec();
            var_1 = clamp( 1.0 - var_2 / var_3, 0.0, 1.0 );
        }

        if ( !scripts\mp\utility\game::_id_9E4A() && isalive( self ) )
            self setclientomnvar( "ui_super_progress", var_1 );

        self _meth_8400( var_1 );
        scripts\engine\utility::waitframe();
    }
}

_id_13A61()
{
    var_0 = _id_7E4E();
    self endon( "disconnect" );
    self endon( "remove_super" );

    for (;;)
    {
        self waittill( "spawned_player" );

        if ( _id_9F8A() )
        {
            scripts\mp\lightbar::_id_1768( 2, 1, 1, 1, 0, "super_use_finished" );
            self setclientomnvar( "ui_super_state", 2 );
        }

        givesuperweapon( var_0 );
    }
}

_id_12F31()
{
    self endon( "disconnect" );
    self endon( "super_cooldown_altered" );
    self endon( "remove_super" );
    self endon( "game_ended" );
    var_0 = _id_7E4E();
    self notify( "super_finished" );

    while ( _id_9F89() )
    {
        scripts\mp\utility\game::_id_7670( "prematch_done" );

        if ( scripts\mp\utility\game::istrue( level._id_90A4 ) )
        {
            scripts\engine\utility::waitframe();
            continue;
        }

        var_1 = int( 50.0 * level._id_11260 * scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_12D6( "specialty_overclock" ), 1.4, 1.0 ) );
        var_0._id_461F += var_1;
        wait 0.05;
    }

    _id_11258();
}

_id_110C5()
{
    self endon( "disconnect" );
    self endon( "remove_super" );
    scripts\mp\utility\game::_id_ABF5( "game_over" );
    _id_110C4();
}

_id_89E8()
{
    self endon( "disconnect" );
    self endon( "remove_super" );
    self waittill( "joined_spectators" );
    thread _id_41E2( 1 );
}

_id_89F0()
{
    self endon( "disconnect" );
    self endon( "remove_super" );
    var_0 = self.team;
    self waittill( "joined_team" );

    if ( self.team != var_0 )
        thread _id_41E2( 0 );
}

_id_11258()
{
    var_0 = _id_7E4E();
    self setweaponammoclip( var_0._id_10E47.weapon, 1 );
    self setclientomnvar( "ui_super_state", 2 );
    self playlocalsound( "mp_super_ready" );
    self notify( "super_ready" );

    if ( !var_0._id_1391B )
    {
        self.pers["supersEarned"]++;
        self notify( "super_earned" );
    }

    scripts\mp\lightbar::_id_1768( 2, 1, 1, 1, 0, "super_use_finished_lb" );
    var_0._id_B143 = gettime();
    var_0._id_C234 = 0;
    scripts\mp\analyticslog::_id_AFB3( var_0._id_B143 );

    if ( isdefined( self._id_B3E3 ) )
        scripts\mp\matchdata::logsuperavailableevent( self._id_B3E3, self.origin );
}

_id_13A6F()
{
    self endon( "disconnect" );
    self endon( "remove_super" );

    for (;;)
    {
        self waittill( "special_weapon_fired", var_0 );

        if ( scripts\mp\utility\game::isreallyalive( self ) )
        {
            if ( var_0 != _id_7E4E()._id_10E47.weapon )
                continue;

            var_1 = _id_2A79();

            if ( !isdefined( var_1 ) || var_1 == 0 )
                continue;

            self waittill( "super_use_finished" );
        }
    }
}

_id_2A79()
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 = _id_7E4E();
    self notify( "super_started" );
    self playlocalsound( "weap_super_activate_plr" );

    if ( isdefined( var_0 ) && !var_0._id_9E53 )
    {
        var_1 = 1;

        if ( isdefined( var_0._id_10E47._id_130F8 ) )
        {
            if ( scripts\mp\utility\game::isinarbitraryup() && superdisabledinarbitraryup( var_0._id_10E47._id_DE3F ) )
            {
                superdisabledinarbitraryupmessage();
                var_1 = 0;
            }
            else if ( scripts\mp\utility\game::istryingtousekillstreak() && superdisabledduringkillstreak( var_0._id_10E47._id_DE3F ) )
            {
                superdisabledduringkillstreakmessage();
                var_1 = 0;
            }
            else
                var_1 = _id_1289E( var_0._id_10E47._id_130F8, var_0._id_10E47._id_130F9, var_0._id_10E47._id_130FA );
        }

        if ( var_1 && ( !isdefined( var_0._id_10E47._id_2A7C ) || scripts\mp\utility\game::istrue( self [[ var_0._id_10E47._id_2A7C ]]() ) ) )
        {
            var_2 = [];
            var_2[0] = "super_use_finished_lb";
            var_2[1] = "super_switched";
            scripts\mp\lightbar::_id_1768( 2, 0, 2, 1, 0, var_2 );
            var_0._id_9E53 = 1;
            var_0._id_1CA3 = scripts\engine\utility::ter_op( var_0._id_10E47._id_8487 > 0, 1, 0 );
            _id_10DF7();

            if ( isdefined( self._id_B3E3 ) )
                scripts\mp\matchdata::logsuperactivatedevent( self._id_B3E3, self.origin );

            self setclientomnvar( "ui_super_state", 3 );

            if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
                self _meth_80C5( 1 );

            scripts\mp\utility\game::_id_D915( "super use started - " + var_0._id_10E47._id_DE3F, self );
            return 1;
        }
        else
        {
            if ( isdefined( var_0._id_10E47._id_130F8 ) && var_1 )
                thread _id_11371();

            self setweaponammoclip( var_0._id_10E47.weapon, 1 );
        }
    }

    return 0;
}

_id_1613( var_0, var_1 )
{
    var_2 = _id_7E4E();

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 1.0;

    var_3 = gettime();

    if ( var_2._id_12B2C > var_3 )
        var_2._id_12B2C = var_3;

    if ( var_0 && isdefined( var_2._id_10E47._id_1617 ) )
        _id_DE3B( var_2._id_10E47._id_1617 * var_1 );
    else if ( isdefined( var_2._id_10E47._id_1616 ) )
        _id_DE3B( var_2._id_10E47._id_1616 * var_1 );

    return 1;
}

_id_10DF7()
{
    var_0 = _id_7E4E();
    self notify( "super_use_started" );
    var_0._id_130DE = gettime();
    var_0._id_130EF = _id_8188() * 1000.0;
    var_0._id_12B2C = gettime() + var_0._id_10E47._id_12B28;
    _id_112A5();
}

_id_DE3B( var_0 )
{
    var_1 = _id_7E4E();
    self setclientomnvar( "ui_super_flash_progress", _id_818B() );
    var_1._id_130EF = max( var_1._id_130EF - var_0, 0.0 );
    var_1._id_1CA3 = 0;
    _id_112A5();
}

_id_112A5()
{
    self notify( "super_use_duration_updated" );
    thread _id_13B71();
}

_id_13B71()
{
    self endon( "disconnect" );
    self endon( "super_use_duration_updated" );
    self endon( "super_use_finished" );
    self endon( "remove_super" );
    var_0 = _id_7E4E();

    while ( var_0._id_130EF > 0 )
    {
        if ( scripts\mp\utility\game::istrue( level._id_90A4 ) )
        {
            scripts\engine\utility::waitframe();
            continue;
        }

        scripts\engine\utility::waitframe();
        var_0._id_130EF -= 50;

        if ( isbot( self ) )
        {
            if ( isdefined( var_0._id_10E47._id_130F8 ) && var_0._id_10E47._id_9FF8 == 1 )
            {
                var_1 = self getammocount( var_0._id_10E47._id_130F8 );

                if ( !isdefined( var_1 ) || var_1 <= 0 )
                    break;
            }
        }
    }

    _id_112A6();
}

_id_112A6( var_0, var_1, var_2 )
{
    var_3 = _id_7E4E();
    var_4 = _id_818B();
    self notify( "super_use_finished_lb" );
    var_3._id_9E53 = 0;
    var_3._id_3916 = 0;
    var_5 = undefined;

    if ( isdefined( var_3._id_10E47._id_6398 ) )
    {
        if ( !isdefined( var_1 ) )
            var_1 = 0;

        var_5 = self [[ var_3._id_10E47._id_6398 ]]( var_1 );
    }

    if ( _id_10066( var_2 ) || scripts\mp\utility\game::istrue( var_0 ) || scripts\mp\utility\game::istrue( var_5 ) )
    {
        var_3._id_1391B = 1;
        _id_E276( getsupermaxcooldownsec() );
    }
    else if ( scripts\mp\utility\game::istrue( var_2 ) )
    {
        var_6 = getsupermaxcooldownsec() * var_4;
        var_3._id_1391B = 1;
        _id_E276( var_6 );
    }
    else
    {
        if ( var_3._id_10E47._id_DE3F != "super_chargemode" )
        {
            var_7 = getsubstr( self._id_AE62, 10, self._id_AE62.size );
            scripts\mp\missions::_id_D991( "ch_" + var_7 + "_super" );
            combatrecordsuperuse( var_3._id_10E47._id_DE3F );
        }

        var_3._id_A986 = gettime();
        var_3._id_1391B = 0;
        _id_E276();
    }

    thread _id_11371();
    var_8 = var_3._id_130DE - var_3._id_B143;
    scripts\mp\analyticslog::_id_AFB4( var_3._id_10E47._id_DE3F, var_8, 0, var_3._id_C234 );

    if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
        self _meth_80C5( 0 );

    scripts\mp\utility\game::_id_D915( "super use ended - " + var_3._id_10E47._id_DE3F, self );

    if ( isdefined( self._id_B3E3 ) )
    {
        if ( isdefined( var_1 ) )
            scripts\mp\matchdata::logsuperexpiredevent( self._id_B3E3, self.origin, 1 );
        else
            scripts\mp\matchdata::logsuperexpiredevent( self._id_B3E3, self.origin, 0 );
    }

    self notify( "super_use_finished" );
}

_id_DE7D()
{
    var_0 = _id_7E4E();

    if ( isdefined( var_0 ) )
    {
        if ( var_0._id_9E53 )
            _id_112A6( 1 );
        else
            _id_DE3A( getsupermaxcooldownmsec() );
    }
}

_id_898E()
{
    self endon( "disconnect" );

    if ( !_id_9F88() )
        return;

    _id_112A6( undefined, 1 );
}

_id_BA37( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "super_use_finished" );
    self endon( "remove_super" );

    for (;;)
    {
        self waittill( "weapon_fired", var_1 );
        var_2 = scripts\mp\weapons::_id_9D3E( var_1 );
        var_1 = scripts\mp\utility\game::_id_E0CF( var_1 );

        if ( var_1 == var_0 )
            _id_1613( var_2 );
    }
}

_id_1289E( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self endon( "death" );
    scripts\mp\utility\game::_id_12C6( var_0 );
    self setweaponammoclip( var_0, var_1 );
    self setweaponammostock( var_0, var_2 );
    var_3 = scripts\mp\utility\game::_id_11383( var_0, isbot( self ) );

    if ( var_3 )
    {
        thread _id_B2F7( var_0 );
        thread _id_BA37( var_0 );
        return 1;
    }

    scripts\mp\utility\game::_id_1529( var_0 );
    return 0;
}

_id_B2F7( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "super_use_finished" );
    var_1 = _id_7E4E();
    var_1.useweaponswapped = undefined;
    var_2 = 0;

    for (;;)
    {
        var_3 = self getcurrentweapon();

        if ( !var_1._id_3916 && var_3 != "iw7_fistslethal_mp" && var_3 != "iw7_fistsperk_mp" && var_3 != var_0 )
        {
            if ( var_3 == "iw7_uplinkball_mp" || var_3 == "iw7_tdefball_mp" )
                var_2 = 1;

            break;
        }

        scripts\engine\utility::waitframe();
    }

    if ( _id_9F88() )
    {
        var_1.useweaponswapped = 1;
        _id_112A6( undefined, undefined, var_2 );
    }
}

_id_11371()
{
    self endon( "death" );
    var_0 = _id_7E4E();
    var_1 = var_0._id_10E47._id_130F8;

    if ( !isdefined( var_1 ) )
        return;

    if ( scripts\mp\utility\game::_id_9F20( var_1 ) )
    {
        scripts\mp\utility\game::_id_1529( var_1 );
        return;
    }

    self notify( "super_switched" );
    scripts\mp\utility\game::_id_80F2( var_1 );
}

_id_110C4()
{
    var_0 = _id_7E4E();

    if ( !isdefined( var_0 ) )
        return;

    if ( _id_9F89() )
        self.pers["superCooldownTime"] = _id_7E4E()._id_461F;
    else if ( _id_9F8A() )
        self.pers["superCooldownTime"] = _id_7E4E()._id_461E;
    else if ( _id_9F88() )
        self.pers["superCooldownTime"] = scripts\engine\utility::ter_op( _id_10066(), _id_7E4E()._id_461E, 0 );
    else
        self.pers["superCooldownTime"] = 0;
}

_id_818B()
{
    var_0 = _id_7E4E();
    var_1 = gettime();
    var_2 = var_0._id_12B2C - var_0._id_130DE;
    var_3 = _id_8188() * 1000.0 - var_2;
    var_4 = clamp( var_0._id_130EF / var_3, 0.0, 1.0 );
    return var_4;
}

getsupermaxcooldownsec()
{
    var_0 = _id_7E4E()._id_10E47._id_4613 * level._id_1125E;
    return scripts\engine\utility::ter_op( getdvarint( "scr_super_short_cooldown" ) != 0, 1, var_0 );
}

getsupermaxcooldownmsec()
{
    return int( getsupermaxcooldownsec() * 1000 );
}

_id_8188()
{
    return _id_7E4E()._id_10E47._id_5F36;
}

_id_9F8A()
{
    var_0 = _id_7E4E();

    if ( !isdefined( var_0 ) || var_0._id_9E53 )
        return 0;

    return var_0._id_461F >= var_0._id_461E;
}

_id_9F88()
{
    return isdefined( _id_7E4E() ) && _id_7E4E()._id_9E53;
}

_id_9F89()
{
    return !_id_9F8A() && !_id_9F88();
}

_id_7E4E()
{
    return self._id_11234;
}

_id_7E4F()
{
    var_0 = _id_7E4E();

    if ( !isdefined( var_0 ) )
        return undefined;

    return var_0._id_10E47._id_DE3F;
}

_id_10066( var_0 )
{
    var_1 = _id_7E4E();
    var_2 = var_1._id_10E47._id_8487;
    var_3 = gettime() - var_1._id_130DE;

    if ( var_3 >= var_2 )
        return 0;

    if ( var_1._id_C234 > 0 )
        return 0;

    if ( scripts\mp\utility\game::istrue( var_1.useweaponswapped ) && !scripts\mp\utility\game::istrue( var_0 ) )
    {
        if ( var_1._id_10E47._id_130F8 == "iw7_reaperblade_mp" )
            return 0;
    }

    return var_1._id_1CA3;
}

_id_11759()
{
    iprintlnbold( "Super FIRST activate" );
    thread _id_11758();
    return 1;
}

_id_11758()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "super_use_finished" );
    self notifyonplayercommand( "testsuper_fired", "+frag" );

    for (;;)
    {
        self waittill( "testsuper_fired" );
        iprintlnbold( "activate" );
        _id_1613();
    }
}

_id_130EA()
{
    return _id_11759();
}

_id_130CA()
{
    return scripts\mp\supers\super_reaper::_id_DD9D();
}

_id_637A( var_0 )
{
    scripts\mp\supers\super_reaper::_id_DD97();
}

_id_1304E()
{
    return scripts\mp\supers\super_blackholegun::_id_2A7B();
}

_id_630F( var_0 )
{
    scripts\mp\supers\super_blackholegun::_id_1109A();
}

_id_13044()
{
    return scripts\mp\supers\super_armorup::_id_2197();
}

_id_630C( var_0 )
{
    scripts\mp\supers\super_armorup::_id_218E( var_0 );
}

_id_13041()
{
    return scripts\mp\supers\super_amplify::_id_12F9B();
}

_id_630A( var_0 )
{
    scripts\mp\supers\super_amplify::_id_62A3();
}

_id_12C70()
{
    scripts\mp\supers\super_amplify::_id_12BF4();
}

_id_F7CE()
{
    scripts\mp\supers\super_overdrive::_id_F7CE();
}

_id_12CFF()
{
    scripts\mp\supers\super_overdrive::_id_12CFF();
}

_id_1308A()
{
    return _id_0E12::_id_8541();
}

_id_6332()
{
    _id_0E12::_id_853F();
}

_id_130F6()
{
    return scripts\mp\supers\super_visionpulse::_id_12F9B();
}

_id_1303A()
{
    return _id_0E0C::_id_14F9();
}

_id_6308()
{
    _id_0E0C::_id_14F7();
}

_id_130A3()
{
    return _id_0E14::_id_B554();
}

_id_6361()
{
    _id_0E14::_id_B552();
}

_id_F75E()
{

}

_id_12CDA()
{
    scripts\mp\equipment\cloak::_id_62A3( undefined, 1 );
}

_id_1309A()
{
    return scripts\mp\equipment\cloak::_id_12F9B();
}

_id_635C( var_0 )
{
    scripts\mp\equipment\cloak::_id_62A3( var_0 );
}

_id_130E2()
{
    return scripts\mp\supers\super_supertrophy::_id_11297();
}

_id_638F( var_0 )
{
    return scripts\mp\supers\super_supertrophy::_id_11276( var_0 );
}

_id_12D3F( var_0 )
{
    scripts\mp\supers\super_supertrophy::_id_11296( var_0 );
}

_id_130BC()
{
    return scripts\mp\equipment\phase_shift::_id_E88D();
}

_id_6376( var_0 )
{
    scripts\mp\equipment\phase_shift::_id_E154( var_0 );
}

_id_F797()
{
    scripts\mp\equipment\micro_turret::_id_B70A();
}

_id_12CEF()
{
    scripts\mp\equipment\micro_turret::_id_B718();
}

_id_130A4()
{
    scripts\mp\equipment\micro_turret::_id_B719();
    return 1;
}

_id_6364( var_0 )
{
    return scripts\mp\equipment\micro_turret::_id_B6F9( var_0 );
}

_id_F68E()
{
    scripts\mp\equipment\charge_mode::_id_3D0E();
}

_id_12C8F()
{
    scripts\mp\equipment\charge_mode::_id_3D19();
}

_id_13052()
{
    return scripts\mp\equipment\charge_mode::_id_3D1A();
}

_id_6313( var_0 )
{
    scripts\mp\equipment\charge_mode::_id_3CDD( var_0 );
}

_id_F81E()
{
    scripts\mp\equipment\rewind::_id_F81E();
}

_id_12D1B()
{
    scripts\mp\equipment\rewind::_id_12D1B();
}

_id_F87E()
{
    thread scripts\mp\teleport::_id_F87E();
}

_id_12D44()
{
    thread scripts\mp\teleport::_id_12D44();
}

_id_1309C()
{
    thread scripts\mp\equipment\kinetic_pulse::kineticpulse_use();
    return 1;
}

_id_8189( var_0 )
{
    var_0 = scripts\mp\utility\game::_id_8234( var_0 );

    if ( !isdefined( level._id_112A9[var_0] ) )
        return undefined;

    return level._id_112A9[var_0]._id_11263;
}

_id_7F0D( var_0 )
{
    var_0 = scripts\mp\utility\game::_id_8234( var_0 );

    if ( isdefined( level._id_112A9[var_0] ) )
        return level._id_112A9[var_0]._id_10E47._id_92B8;

    var_1 = undefined;

    switch ( var_0 )
    {
        case "micro_turret_gun_mp":
            var_1 = "super_microturret";
            break;
        case "chargemode_mp":
            var_1 = "super_chargemode";
            break;
    }

    if ( isdefined( var_1 ) )
    {
        var_2 = level._id_10E4E[var_1];

        if ( isdefined( var_2 ) )
            return var_2._id_92B8;
    }

    return undefined;
}

_id_8186( var_0 )
{
    if ( !isdefined( var_0 ) || !isdefined( level._id_10E4E[var_0] ) || var_0 == "none" )
        return 0;

    return level._id_10E4E[var_0]._id_92B8;
}

_id_7FD0( var_0 )
{
    var_0 = scripts\mp\utility\game::_id_8234( var_0 );

    if ( !isdefined( level._id_112A9[var_0] ) )
        return undefined;

    return level._id_112A9[var_0]._id_10E47._id_BCEF;
}

_id_80F6( var_0 )
{
    return getsubstr( var_0, 6 );
}

_id_1CAB()
{
    var_0 = _id_7E4E();

    if ( !isdefined( var_0 ) || !var_0._id_9E53 )
        return;

    var_0._id_3916 = 1;
}

_id_12D6C()
{
    var_0 = _id_7E4E();

    if ( !isdefined( var_0 ) || !var_0._id_3916 )
        return;

    if ( !var_0._id_9E53 || !isdefined( var_0._id_10E47._id_130F8 ) )
    {
        var_0._id_3916 = 0;
        return;
    }

    scripts\mp\utility\game::_id_11383( var_0._id_10E47._id_130F8 );
    var_0._id_3916 = 0;
}

modifysuperequipmentdamage( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;

    if ( isdefined( self.owner ) && isdefined( var_0 ) && var_0 == self.owner )
        var_5 = int( ceil( var_3 * 0.5 ) );

    return var_5;
}

_id_13B6B()
{
    level endon( "super_delay_end" );
    level endon( "round_end" );
    level endon( "game_ended" );
    level waittill( "prematch_over" );

    if ( scripts\mp\utility\game::_id_9D46() )
        level._id_1125A = 0;
    else
        level._id_1125A = getdvarfloat( "scr_superDelay", 0 );

    if ( level._id_1125A == 0 )
    {
        level._id_1125D = scripts\mp\utility\game::_id_81CB();
        level._id_1125B = level._id_1125D;
        level notify( "super_delay_end" );
    }

    level._id_1125D = scripts\mp\utility\game::_id_81CB();
    level._id_1125B = level._id_1125D + level._id_1125A * 1000;
    level notify( "super_delay_start" );

    while ( scripts\mp\utility\game::_id_81CB() < level._id_1125B )
        scripts\engine\utility::waitframe();

    level notify( "super_delay_end" );
}

_id_13B6D()
{
    self endon( "remove_super" );
    self endon( "disconnect" );
    level endon( "round_end" );
    level endon( "game_ended" );
    _id_83A9();
    thread _id_411B();
    _id_13B6E();
    var_0 = _id_7E4E()._id_10E47.weapon;
    var_1 = scripts\engine\utility::ter_op( _id_9F8A(), 1, 0 );
    scripts\mp\utility\game::_id_12C6( var_0 );
    self setweaponammoclip( var_0, var_1 );
    self _meth_84C2( var_0 );
    scripts\mp\utility\game::_id_141E( "super_delay_mp" );
}

_id_13B6E()
{
    level endon( "super_delay_end" );

    if ( !scripts\mp\utility\game::istrue( scripts\mp\utility\game::_id_766C( "prematch_done" ) ) )
        level waittill( "super_delay_start" );

    for (;;)
    {
        self waittill( "special_weapon_fired", var_0 );

        if ( var_0 != "super_delay_mp" )
            continue;

        self setweaponammoclip( "super_delay_mp", 1 );

        if ( _id_9F8A() )
        {
            var_1 = ( level._id_1125B - scripts\mp\utility\game::_id_81CB() ) / 1000;
            var_1 = int( max( 0, ceil( var_1 ) ) );
            scripts\mp\hud_message::_id_10122( "MP_SUPERS_UNAVAILABLE_FOR_N", var_1 );
        }
    }
}

_id_411B()
{
    self endon( "disconnect" );
    level endon( "round_end" );
    level endon( "game_ended" );
    level endon( "super_delay_end" );
    self notify( "watchSuperDelayWeaponCleanup" );
    self endon( "watchSuperDelayWeaponCleanup" );
    self waittill( "remove_super" );
    scripts\mp\utility\game::_id_141E( "super_delay_mp" );
}

_id_83A9()
{
    scripts\mp\utility\game::_id_12C6( "super_delay_mp" );
    self setweaponammoclip( "super_delay_mp", 1 );
    self _meth_84C2( "super_delay_mp" );
}

_id_3887()
{
    level._id_1125A = 0;
    level._id_1125D = scripts\mp\utility\game::_id_81CB();
    level._id_1125B = level._id_1125D;
    level notify( "super_delay_end" );
}

_id_1125C()
{
    if ( isdefined( level._id_1125A ) && level._id_1125A == 0 )
        return 1;

    return isdefined( level._id_1125B ) && scripts\mp\utility\game::_id_81CB() > level._id_1125B;
}

givesuperweapon( var_0 )
{
    if ( _id_1125C() )
    {
        if ( !self hasweapon( var_0._id_10E47.weapon ) )
        {
            var_1 = scripts\engine\utility::ter_op( _id_9F8A(), 1, 0 );
            scripts\mp\utility\game::_id_12C6( var_0._id_10E47.weapon );
            self setweaponammoclip( var_0._id_10E47.weapon, var_1 );
            self _meth_84C2( var_0._id_10E47.weapon );
        }
    }
    else
        _id_83A9();
}

watchobjuse( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "obj_drain_end" );
    self endon( "ball_dropped" );

    if ( level.gametype == "sd" || level.gametype == "sr" || level.gametype == "dd" )
    {
        if ( scripts\mp\utility\game::istrue( var_1 ) )
            self waittill( "super_obj_drain" );
    }
    else if ( !isdefined( self.carryobject ) )
        self waittill( "obj_picked_up" );
    else
        wait 0.05;

    while ( _id_9F88() )
    {
        _id_DE3B( var_0 );
        wait 0.05;
    }
}

combatrecordsuperuse( var_0 )
{
    if ( !scripts\mp\utility\game::canrecordcombatrecordstats() )
        return;

    var_1 = self getrankedplayerdata( "mp", "superStats", var_0, "uses" );
    self setrankedplayerdata( "mp", "superStats", var_0, "uses", var_1 + 1 );
}

combatrecordsuperkill( var_0 )
{
    if ( !scripts\mp\utility\game::canrecordcombatrecordstats() )
        return;

    var_1 = self getrankedplayerdata( "mp", "superStats", var_0, "kills" );
    self setrankedplayerdata( "mp", "superStats", var_0, "kills", var_1 + 1 );
}

superdisabledinarbitraryup( var_0 )
{
    if ( var_0 == "super_microturret" || var_0 == "super_supertrophy" )
        return 1;

    return 0;
}

superdisabledinarbitraryupmessage()
{
    scripts\mp\hud_message::_id_10122( "MP_SUPERS_UNAVAILABLE_ARB_UP" );
}

superdisabledduringkillstreak( var_0 )
{
    switch ( var_0 )
    {
        case "super_visionpulse":
        case "super_invisible":
        case "super_armorup":
        case "super_amplify":
            return 0;
        default:
            return 1;
    }
}

superdisabledduringkillstreakmessage()
{
    scripts\mp\hud_message::_id_10122( "MP_SUPERS_UNAVAILABLE_ARB_UP" );
}

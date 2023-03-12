// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_1843( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = self getentitynumber();
    self._id_1653 = var_2 _id_7D98();

    if ( isdefined( var_0 ) )
    {
        if ( scripts\mp\utility\game::_id_9FBA( var_0 ) )
        {
            _id_1863( var_5 );
            thread _id_E121( var_5 );
        }
        else if ( scripts\mp\utility\game::_id_9D35( var_0 ) )
        {
            _id_1844( var_5 );
            thread _id_E0FE( var_5 );
        }
        else if ( scripts\mp\utility\game::_id_9E7F( var_0 ) )
        {
            _id_1852( var_5 );
            thread _id_E111( var_5 );
        }
        else if ( scripts\mp\utility\game::_id_9E2D( var_0 ) )
        {
            _id_184E( var_5 );
            thread _id_E10A( var_5 );
        }
        else if ( scripts\mp\utility\game::_id_9F67( var_0 ) )
        {
            _id_185A( var_5 );
            thread _id_E118( var_5 );
        }
        else if ( scripts\mp\utility\game::_id_9D61( var_0 ) )
        {
            _id_1847( var_5 );
            thread _id_E102( var_5 );
        }
        else if ( scripts\mp\utility\game::_id_9FB7( var_0 ) )
        {
            _id_1862( var_5 );
            thread _id_E120( var_5 );
        }
        else if ( scripts\mp\utility\game::_id_9D82( var_0 ) )
        {
            _id_184A( var_5 );
            thread _id_E105( var_5 );
        }
        else if ( scripts\mp\utility\game::_id_9F0F( var_0 ) )
        {
            _id_1857( var_5 );
            thread _id_E115( var_5 );
        }
        else
        {
            _id_1856( var_5 );
            thread removefromplayerkillstreaklistondeath( var_5 );
        }

        if ( scripts\mp\utility\game::_id_9E64( var_0 ) )
            self._id_18DD = 1;

        if ( scripts\mp\utility\game::_id_9E6A( var_0 ) )
            self._id_18DE = 1;
    }

    level._id_1655[var_5] = self;
    level._id_1655[var_5]._id_110EA = var_0;

    if ( scripts\mp\utility\game::istrue( var_3 ) )
    {
        var_6 = undefined;
        var_7 = undefined;

        if ( level.teambased )
        {
            if ( scripts\mp\utility\game::_id_9F2C( var_0 ) )
            {
                foreach ( var_9 in level.players )
                {
                    if ( var_9.team == self.team && var_9 != self.owner )
                        var_6 = scripts\mp\utility\game::_id_C794( self, "cyan", var_9, 0, 0, "lowest" );

                    if ( isdefined( var_6 ) )
                        thread _id_E14B( var_6, var_4 );
                }

                var_7 = 1;
            }
            else
                var_6 = scripts\mp\utility\game::_id_C795( self, "cyan", var_2.team, 0, 0, "lowest" );
        }
        else
            var_6 = scripts\mp\utility\game::_id_C794( self, "cyan", var_2, 0, 0, "lowest" );

        if ( !scripts\mp\utility\game::istrue( var_7 ) )
            thread _id_E14B( var_6, var_4 );
    }

    if ( isdefined( var_1 ) && var_1 != "" )
    {
        var_11 = getkillstreaknomeleetarget( var_0 );
        scripts\mp\sentientpoolmanager::registersentient( var_1, var_2, var_11, var_4 );
    }

    thread scripts\mp\missions::_id_A691( var_0 );
}

_id_7D98()
{
    if ( !isdefined( self.pers["nextActiveID"] ) )
        self.pers["nextActiveID"] = 0;

    var_0 = self.pers["nextActiveID"];
    self.pers["nextActiveID"]++;
    return var_0;
}

_id_E14B( var_0, var_1 )
{
    var_2 = [ "death", "carried" ];

    if ( isdefined( var_1 ) )
        var_2 = [ var_1 ];

    scripts\engine\utility::_id_13731( var_2 );
    scripts\mp\utility\game::_id_C78F( var_0, self );
}

_id_E0FD( var_0 )
{
    level._id_1655[var_0] = undefined;
}

_id_1654( var_0 )
{
    return isdefined( level._id_1655[var_0] );
}

_id_1863( var_0 )
{
    if ( !isdefined( level._id_12AF3 ) )
        level._id_12AF3 = [];

    if ( level.teambased )
        level._id_12AF3[self.team][level._id_12AF3[self.team].size] = self;
    else
        level._id_12AF3[self.owner.guid + "_" + gettime()] = self;
}

_id_115CF( var_0 )
{
    if ( isdefined( level._id_12AF3[level._id_C74B[var_0]] ) && level._id_12AF3[level._id_C74B[var_0]].size > 0 )
    {
        foreach ( var_2 in level._id_12AF3[level._id_C74B[var_0]] )
        {
            if ( !isdefined( var_2 ) )
                continue;

            if ( var_2._id_12AFA == "counter_uav" )
                return 0;
        }
    }

    if ( isdefined( level._id_12AF3[var_0] ) && level._id_12AF3[var_0].size > 0 )
    {
        foreach ( var_2 in level._id_12AF3[var_0] )
        {
            if ( !isdefined( var_2 ) )
                continue;

            if ( var_2._id_12AFA == "uav" || var_2._id_12AFA == "directional_uav" )
                return 1;
        }
    }

    return 0;
}

_id_12F51()
{
    var_0 = [];
    var_0["allies"] = _id_115CF( "allies" );
    var_0["axis"] = _id_115CF( "axis" );

    foreach ( var_2 in level.players )
    {
        if ( !isdefined( var_2.team ) || var_2.team == "spectator" )
        {
            var_2 setclientomnvar( "ui_show_hardcore_minimap", 0 );
            continue;
        }

        var_2 setclientomnvar( "ui_show_hardcore_minimap", var_0[var_2.team] );
    }
}

_id_E121( var_0 )
{
    self waittill( "death" );

    if ( isdefined( self._id_12AF5 ) )
        self._id_12AF5 delete();

    if ( level.teambased )
    {
        var_1 = self.team;
        level._id_12AF3[var_1] = scripts\engine\utility::_id_22BC( level._id_12AF3[var_1] );
    }
    else
        level._id_12AF3 = scripts\engine\utility::_id_22BC( level._id_12AF3 );

    if ( isdefined( self ) )
        self delete();

    _id_E0FD( var_0 );
}

_id_9FB9( var_0 )
{
    if ( !isdefined( level._id_12AF3 ) )
        return 0;

    if ( !isdefined( level._id_12AF3[var_0] ) )
        return 0;

    return level._id_12AF3[var_0].size > 0;
}

_id_1844( var_0 )
{
    if ( !isdefined( level._id_1AFC ) )
        level._id_1AFC = [];

    level._id_1AFC[var_0] = self;
}

_id_E0FE( var_0 )
{
    self waittill( "death" );
    level._id_1AFC[var_0] = undefined;
    _id_E0FD( var_0 );
}

_id_1852( var_0 )
{
    if ( !isdefined( level._id_AD8B ) )
        level._id_AD8B = [];

    level._id_AD8B[var_0] = self;
}

_id_E111( var_0 )
{
    self waittill( "death" );
    level._id_AD8B[var_0] = undefined;
    _id_E0FD( var_0 );
}

_id_184E( var_0 )
{
    if ( !isdefined( level._id_8DD3 ) )
        level._id_8DD3 = [];

    level._id_8DD3[var_0] = self;
}

_id_E10A( var_0 )
{
    self waittill( "death" );
    level._id_8DD3[var_0] = undefined;
    _id_E0FD( var_0 );
}

_id_185A( var_0 )
{
    if ( !isdefined( level._id_105EA ) )
        level._id_105EA = [];

    level._id_105EA[var_0] = self;
}

_id_E118( var_0 )
{
    self waittill( "death" );
    level._id_105EA[var_0] = undefined;
    _id_E0FD( var_0 );
}

_id_1847( var_0 )
{
    if ( !isdefined( level._id_27EF ) )
        level._id_27EF = [];

    level._id_27EF[var_0] = self;
}

_id_E102( var_0 )
{
    self waittill( "death" );
    level._id_27EF[var_0] = undefined;
    _id_E0FD( var_0 );
}

_id_1862( var_0 )
{
    if ( !isdefined( level._id_12A83 ) )
        level._id_12A83 = [];

    level._id_12A83[var_0] = self;
}

_id_E120( var_0 )
{
    scripts\engine\utility::waittill_any( "death", "carried" );
    level._id_12A83[var_0] = undefined;
    _id_E0FD( var_0 );
}

_id_184A( var_0 )
{
    if ( !isdefined( level._id_5228 ) )
        level._id_5228 = [];

    level._id_5228[var_0] = self;
}

_id_E105( var_0 )
{
    scripts\engine\utility::waittill_any( "death", "carried" );
    level._id_5228[var_0] = undefined;
    _id_E0FD( var_0 );
}

_id_1857( var_0 )
{
    if ( !isdefined( level._id_DA61 ) )
        level._id_DA61 = [];

    level._id_DA61[var_0] = self;
}

_id_E115( var_0 )
{
    self waittill( "death" );
    level._id_DA61[var_0] = undefined;
    _id_E0FD( var_0 );
}

_id_1856( var_0 )
{
    if ( !isdefined( level._id_D3CC ) )
        level._id_D3CC = [];

    level._id_D3CC[var_0] = self;
}

removefromplayerkillstreaklistondeath( var_0 )
{
    self waittill( "death" );
    level._id_D3CC[var_0] = undefined;
    _id_E0FD( var_0 );
}

_id_F774( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self makeusable();
    self setcursorhint( "HINT_NOICON" );
    self _meth_84A9( "show" );
    self sethintstring( var_1 );
    self _meth_84A6( var_2 );
    self _meth_84A5( var_3 );
    self _meth_84A4( var_4 );
    self _meth_84A2( var_5 );
    self _meth_835F( var_6 );
    level thread _id_20D8( self );

    foreach ( var_8 in level.players )
    {
        if ( var_8 == var_0 )
        {
            self enableplayeruse( var_8 );
            continue;
        }

        self disableplayeruse( var_8 );
    }
}

_id_20D8( var_0 )
{
    var_0 endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        level waittill( "connected", var_1 );
        var_0 disableplayeruse( var_1 );
    }
}

_id_20CF( var_0, var_1 )
{
    var_2 = self.team;
    var_3 = self.owner;
    var_4 = undefined;
    var_5 = undefined;

    if ( !scripts\mp\utility\game::isreallyalive( var_0 ) || var_0.team == "spectator" )
        return;

    if ( var_0 == var_3 )
        var_4 = "cyan";
    else if ( var_0 != var_3 )
    {
        if ( level.teambased && var_0.team != var_2 || !level.teambased )
        {
            var_4 = "orange";
            var_5 = 1;
        }
        else
            return;
    }

    if ( isdefined( var_4 ) )
    {
        if ( scripts\mp\utility\game::istrue( var_5 ) )
        {
            if ( var_0 scripts\mp\utility\game::_id_12D6( "specialty_noplayertarget" ) )
                return;
        }

        var_6 = scripts\mp\utility\game::_id_C794( var_0, var_4, self.owner, 1, 1, "killstreak" );
        thread _id_13ADD( var_6, var_0, var_1 );
        thread _id_13ADE( var_6, var_0, var_1 );
    }
}

_id_13ADD( var_0, var_1, var_2 )
{
    var_1 endon( "disconnect" );
    var_1 endon( "death" );
    level endon( "game_ended" );
    self waittill( var_2 );
    scripts\mp\utility\game::_id_C78F( var_0, var_1 );
}

_id_13ADE( var_0, var_1, var_2 )
{
    self endon( var_2 );
    level endon( "game_ended" );
    var_1 scripts\engine\utility::waittill_any( "death", "disconnect" );
    scripts\mp\utility\game::_id_C78F( var_0, var_1 );
}

_id_7FBD( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_3 = scripts\mp\damage::_id_89E2( var_1, var_2, var_3 );
    var_3 = scripts\mp\damage::_id_8975( var_1, var_2, var_3, var_0 );
    var_9 = scripts\mp\weapons::_id_9D3E( var_1 );
    var_10 = 0;

    if ( scripts\mp\utility\game::istrue( var_9 ) )
    {
        var_11 = scripts\mp\utility\game::_id_821A( var_1 );

        foreach ( var_13 in var_11 )
        {
            if ( var_13 == "gl" )
            {
                var_10 = 1;
                break;
            }
        }
    }

    var_15 = undefined;
    var_16 = scripts\mp\utility\game::_id_821D( var_1 );

    if ( var_2 != "MOD_MELEE" )
    {
        switch ( var_16 )
        {
            case "iw7_lockon_mp":
            case "kineticpulse_emp_mp":
            case "super_trophy_mp":
                self._id_A859 = 1;
                var_15 = var_5;
                break;
            case "iw7_venomx_mp":
            case "iw7_glprox_mp":
            case "switch_blade_child_mp":
            case "iw7_chargeshot_mp":
            case "thorproj_tracking_mp":
            case "thorproj_zoomed_mp":
            case "drone_hive_projectile_mp":
            case "emp_grenade_mp":
                self._id_A859 = 1;
                var_15 = var_6;
                break;
            case "iw7_tacburst_mpl":
            case "iw7_tacburst_mp":
                if ( scripts\mp\utility\game::istrue( var_10 ) )
                {
                    self._id_A859 = 1;
                    var_15 = var_6;
                }

                break;
            case "sentry_shock_missile_mp":
            case "jackal_cannon_mp":
            case "shockproj_mp":
            case "artillery_mp":
            case "bombproj_mp":
            case "iw7_chargeshot_c8_mp":
            case "power_exploding_drone_mp":
            case "wristrocket_mp":
            case "c4_mp":
                self._id_A859 = 0;
                var_15 = var_7;
                break;
            case "iw7_mp28_mpl":
            case "iw7_arclassic_mp":
                if ( scripts\mp\utility\game::istrue( var_10 ) )
                {
                    self._id_A859 = 0;
                    var_15 = var_7;
                }

                break;
        }
    }
    else if ( var_2 == "MOD_MELEE" )
    {
        switch ( var_16 )
        {
            case "iw7_minigun_c8_mp":
            case "iw7_chargeshot_c8_mp":
            case "iw7_c8offhandshield_mp":
                var_3 = 350;
                break;
        }
    }

    if ( isdefined( var_8 ) )
        self._id_A859 = var_8;

    if ( isdefined( var_15 ) && isdefined( var_2 ) && ( var_2 == "MOD_EXPLOSIVE" || var_2 == "MOD_EXPLOSIVE_BULLET" || var_2 == "MOD_PROJECTILE" || var_2 == "MOD_PROJECTILE_SPLASH" || var_2 == "MOD_GRENADE" ) )
        var_3 = ceil( var_4 / var_15 );

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0.owner ) )
            var_0 = var_0.owner;

        if ( var_0 == self.owner )
            var_3 = ceil( var_3 / 2 );
    }

    return int( var_3 );
}

isexplosiveantikillstreakweapon( var_0 )
{
    var_1 = 0;
    var_2 = scripts\mp\weapons::_id_9D3E( var_0 );
    var_3 = 0;

    if ( scripts\mp\utility\game::istrue( var_2 ) )
    {
        var_4 = scripts\mp\utility\game::_id_821A( var_0 );

        foreach ( var_6 in var_4 )
        {
            if ( var_6 == "gl" )
            {
                var_3 = 1;
                break;
            }
        }
    }

    var_8 = scripts\mp\utility\game::_id_821D( var_0 );

    switch ( var_8 )
    {
        case "sentry_shock_missile_mp":
        case "jackal_cannon_mp":
        case "shockproj_mp":
        case "iw7_venomx_mp":
        case "iw7_glprox_mp":
        case "switch_blade_child_mp":
        case "iw7_chargeshot_mp":
        case "iw7_lockon_mp":
        case "thorproj_tracking_mp":
        case "thorproj_zoomed_mp":
        case "drone_hive_projectile_mp":
        case "artillery_mp":
        case "bombproj_mp":
        case "iw7_chargeshot_c8_mp":
        case "kineticpulse_emp_mp":
        case "super_trophy_mp":
        case "emp_grenade_mp":
        case "power_exploding_drone_mp":
        case "wristrocket_mp":
        case "c4_mp":
            var_1 = 1;
            break;
        case "iw7_arclassic_mp":
            if ( scripts\mp\utility\game::istrue( var_3 ) )
                var_1 = 1;

            break;
    }

    return var_1;
}

_id_C1D3( var_0 )
{
    return isdefined( var_0 ) && var_0 == self.owner;
}

dodamagetokillstreak( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = ( 0, 0, 0 );
    var_8 = ( 0, 0, 0 );
    var_9 = ( 0, 0, 0 );
    var_10 = ( 0, 0, 0 );
    var_11 = "";
    var_12 = "";
    var_13 = "";
    var_14 = undefined;

    if ( isdefined( var_3 ) )
    {
        if ( level.teambased )
        {
            if ( !scripts\mp\utility\game::_id_9FE7( var_1, var_3, self ) )
                return;
        }
        else if ( !scripts\mp\utility\game::_id_9FD8( var_1, var_3, self ) )
            return;
    }

    if ( isagent( self ) )
        self _meth_80B0( var_0, var_4, var_1, var_2, var_5, var_6 );
    else
        self notify( "damage", var_0, var_1, var_7, var_8, var_5, var_11, var_12, var_13, var_14, var_6, var_4, var_9, var_10, var_2 );
}

_id_FAE4( var_0, var_1 )
{
    if ( isdefined( level._id_C7B3 ) )
    {
        foreach ( var_3 in level._id_C7B3 )
            thread _id_139B5( var_3, var_0, var_1 );
    }
}

_id_139B5( var_0, var_1, var_2 )
{
    var_3 = self.owner;
    var_3 endon( "disconnect" );
    var_4 = self;

    if ( scripts\mp\utility\game::_id_9EF0( self ) )
        var_4 = var_3;

    var_4 endon( var_1 );
    level endon( "game_ended" );

    for (;;)
    {
        var_0 waittill( "trigger", var_5 );

        if ( var_5 != self )
            continue;

        if ( scripts\mp\utility\game::_id_9EF0( self ) && _id_8076( self ) == "NONE" )
            continue;

        if ( scripts\mp\utility\game::_id_9FAE( var_5 ) )
            continue;

        if ( scripts\mp\utility\game::istouchingboundsnullify( var_5 ) )
            continue;

        var_5 thread _id_13B85( var_1 );
        var_5 thread _id_13B84( var_0, var_1, var_2 );
    }
}

_id_13B85( var_0 )
{
    var_1 = undefined;

    if ( isdefined( self.owner ) )
        var_1 = self.owner;

    var_2 = self;

    if ( scripts\mp\utility\game::_id_9EF0( self ) )
        var_2 = var_1;

    var_2 waittill( var_0 );

    if ( isdefined( var_1 ) )
    {
        var_1 setclientomnvar( "ui_out_of_bounds_countdown", 0 );
        var_1 _meth_859E( "", 0 );
    }

    if ( isdefined( self ) )
        self._id_1D44 = undefined;
}

_id_13B84( var_0, var_1, var_2 )
{
    var_3 = self.owner;
    var_3 endon( "disconnect" );
    var_4 = self;

    if ( scripts\mp\utility\game::_id_9EF0( self ) )
        var_4 = var_3;

    var_4 endon( var_1 );
    level endon( "game_ended" );

    if ( !isdefined( self.lastboundstimelimit ) )
        self.lastboundstimelimit = scripts\mp\utility\game::_id_7F9B();

    var_5 = gettime() + int( self.lastboundstimelimit * 1000 );
    self._id_1D44 = 1;
    var_6 = var_3;

    if ( scripts\mp\utility\game::_id_9EF0( self ) )
        var_6 = self;

    if ( !scripts\mp\utility\game::_id_9EF0( self ) || scripts\mp\utility\game::_id_9EF0( self ) && _id_8076( self ) == "MANUAL" )
    {
        var_3 setclientomnvar( "ui_out_of_bounds_countdown", var_5 );
        var_6 _meth_859E( "mp_out_of_bounds" );
    }

    var_7 = 0;

    for ( var_8 = self.lastboundstimelimit; self istouching( var_0 ); var_8 -= 0.05 )
    {
        if ( var_8 <= 0 )
        {
            var_7 = 1;
            break;
        }

        scripts\engine\utility::waitframe();
    }

    var_3 setclientomnvar( "ui_out_of_bounds_countdown", 0 );
    var_6 _meth_859E( "" );

    if ( isdefined( self ) )
        self._id_1D44 = undefined;

    if ( scripts\mp\utility\game::istrue( var_7 ) )
    {
        self.lastboundstimelimit = undefined;

        if ( scripts\mp\utility\game::_id_9EF0( self ) )
            var_4 notify( var_1, 0 );
        else
            var_4 notify( var_1, self.origin );
    }
    else
    {
        self.lastboundstimelimit = var_8;
        thread watchtimelimitcooldown();
    }
}

watchtimelimitcooldown()
{
    self endon( "death" );
    self notify( "start_time_limit_cooldown" );
    self endon( "start_time_limit_cooldown" );

    for ( var_0 = scripts\mp\utility\game::getmaxoutofboundscooldown(); var_0 > 0; var_0 -= 0.05 )
        scripts\engine\utility::waitframe();

    self.lastboundstimelimit = undefined;
}

_id_A69F( var_0, var_1 )
{
    if ( !isdefined( var_0._id_C946 ) )
        return 0;

    foreach ( var_3 in var_0._id_C946 )
    {
        if ( var_3 == var_1 )
            return 1;
    }

    return 0;
}

_id_7EB7()
{
    var_0 = self getweaponslistprimaries();
    return var_0[0];
}

_id_CF1D( var_0, var_1 )
{
    self endon( "death" );

    if ( !isdefined( level._effect["dlight_large"] ) )
        level._effect["dlight_large"] = loadfx( "vfx/iw7/_requests/mp/vfx_killstreak_dlight" );

    if ( !isdefined( level._effect["dlight_small"] ) )
        level._effect["dlight_small"] = loadfx( "vfx/iw7/_requests/mp/vfx_killstreak_dlight_small" );

    if ( !isdefined( var_0 ) )
        var_0 = ( 0, 0, 0 );

    if ( !isdefined( var_1 ) )
        var_1 = ( 0, 0, 0 );

    var_2 = scripts\engine\utility::_id_7ECB( "dlight_large" );

    if ( scripts\mp\utility\game::istrue( self._id_9D32 ) )
        var_2 = scripts\engine\utility::_id_7ECB( "dlight_small" );

    self._id_7625 = spawn( "script_model", self.origin );
    self._id_7625 setmodel( "tag_origin" );
    self._id_7625 linkto( self, "tag_origin", var_0, var_1 );
    self._id_7625 thread _id_51C6( self );
    wait 0.1;
    playfxontag( var_2, self._id_7625, "tag_origin" );
}

_id_51C6( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );

    if ( isdefined( self ) )
        self delete();
}

_id_9D28( var_0 )
{
    switch ( var_0 )
    {
        case "ball_drone_backup":
        case "jackal":
        case "remote_c8":
        case "sentry_shock":
            return 1;
    }

    return 0;
}

_id_8076( var_0 )
{
    var_1 = "NONE";

    if ( isdefined( var_0.owner ) && isdefined( var_0.owner._id_4BE1 ) )
        var_1 = var_0.owner._id_4BE1;

    return var_1;
}

watchsupertrophynotify( var_0 )
{
    var_0 endon( "disconnect" );
    self endon( "explode" );

    for (;;)
    {
        var_0 waittill( "destroyed_by_trophy", var_1, var_2, var_3, var_4, var_5 );

        if ( var_3 != self._id_13C2E )
            continue;

        var_0 scripts\mp\damagefeedback::updatedamagefeedback( "" );
        break;
    }
}

getkillstreaknomeleetarget( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "venom":
            var_1 = 1;
            break;
    }

    return var_1;
}

watchhostmigrationlifetime( var_0, var_1, var_2 )
{
    if ( var_0 != "death" )
        self endon( "death" );

    self endon( var_0 );
    level endon( "game_ended" );
    var_3 = gettime() + int( var_1 * 1000 );
    level waittill( "host_migration_begin" );
    self notify( "host_migration_lifetime_update" );
    var_4 = gettime();
    var_5 = var_3 - var_4;
    level waittill( "host_migration_end" );
    var_6 = gettime();
    var_7 = var_6 + var_5;
    var_5 /= 1000;

    if ( isdefined( self._id_DCFC ) && _id_8076( self._id_DCFC ) == "MANUAL" )
        self._id_DCFC setclientomnvar( "ui_remote_c8_countdown", var_7 );
    else if ( isdefined( self._id_110EA ) && scripts\mp\utility\game::_id_9F2C( self._id_110EA ) )
        self.owner setclientomnvar( "ui_killstreak_countdown", var_7 );

    self [[ var_2 ]]( var_5 );
}

_id_7E92( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level.players )
    {
        if ( var_0 scripts\mp\utility\game::isenemy( var_3 ) )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

manualmissilecantracktarget( var_0 )
{
    var_1 = 1;

    if ( !isdefined( var_0 ) || !scripts\mp\utility\game::isreallyalive( var_0 ) )
        var_1 = 0;

    if ( var_0 _meth_84D9() || scripts\mp\utility\game::istrue( var_0._id_9D8B ) || var_0 scripts\mp\utility\game::_id_12D6( "specialty_noscopeoutline" ) )
        var_1 = 0;

    return var_1;
}

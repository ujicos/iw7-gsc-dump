// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_12813()
{
    var_0 = spawnstruct();
    var_0._id_1141B = [];
    var_0._id_1141B[0] = "tag_sensor_1";
    var_0._id_1141B[1] = "tag_sensor_2";
    var_0._id_1141B[2] = "tag_sensor_3";
    level._id_12802 = var_0;
}

_id_12820()
{
    _id_12806();
    _id_1281A();
}

_id_12825()
{
    _id_12806();
}

_id_12827( var_0 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    scripts\mp\utility\game::_id_D915( "trophy spawned", self );
    thread scripts\mp\weapons::monitordisownedgrenade( self, var_0 );
    var_0 waittill( "missile_stuck", var_1 );
    var_0 _meth_831F( self );
    var_0 _meth_8317( 1 );
    var_2 = scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" );

    if ( var_2 )
        var_0.hasruggedeqp = 1;

    var_0._id_1E2D = _id_1281F();

    if ( !isdefined( var_0._id_1E2D ) )
        var_0._id_1E2D = 2;

    scripts\mp\weapons::_id_C5AC( var_0, "power_trophy" );
    thread scripts\mp\weapons::_id_B9CA( self, var_0 );
    var_0 thread scripts\mp\weapons::_id_B2A7( "tag_use", 1 );
    var_0._id_69DA = trophy_createexplosion( var_0 );
    var_3 = scripts\engine\utility::ter_op( var_2, 200, 100 );
    var_4 = scripts\engine\utility::ter_op( var_2, "hitequip", "" );
    var_0 thread scripts\mp\damage::monitordamage( var_3, var_4, ::_id_12812, ::_id_12811, 0 );
    var_0 thread trophy_destroyonemp();
    var_0 thread trophy_destroyongameend();
    var_0 thread _id_1282B();
    var_0 _meth_859F();
    var_0 _meth_85A0();
    var_0 scripts\mp\sentientpoolmanager::registersentient( "Tactical_Static", self );
    var_0 thread scripts\mp\entityheadicons::_id_F73E( self, ( 0, 0, 38 ), 1.3 );
    thread scripts\mp\weapons::_id_C798( var_0, self );
    var_0 thread _id_1280B();
    var_0 thread scripts\mp\perks\perk_equipmentping::_id_E84B();
}

trophy_destroy()
{
    thread trophy_delete( 1.6 );
    self setscriptablepartstate( "effects", "activeDestroyStart", 0 );
    wait 1.5;
    self setscriptablepartstate( "effects", "activeDestroyEnd", 0 );
}

trophy_delete( var_0 )
{
    self notify( "death" );
    level._id_B779[self getentitynumber()] = undefined;
    self setcandamage( 0 );
    self makeunusable();
    scripts\mp\weapons::_id_B2A4();
    self._id_69BA = 1;
    var_1 = self.owner;

    if ( isdefined( self.owner ) )
    {
        var_1._id_CC4D = scripts\engine\utility::array_remove( var_1._id_CC4D, self );
        var_1 notify( "trophy_update", 0 );
    }

    wait( var_0 );
    self delete();
}

_id_1280B()
{
    self endon( "death" );
    self setscriptablepartstate( "effects", "activeDeployStart" );
    wait 1.25;
    self setscriptablepartstate( "effects", "activeDeployEnd" );
}

_id_1282B()
{
    self endon( "death" );
    self.owner endon( "disconnect" );

    if ( !isdefined( level._id_85D5 ) )
        level._id_85D5 = [];

    if ( !isdefined( level._id_B898 ) )
        level._id_B898 = [];

    if ( !isdefined( level._id_B779 ) )
        level._id_B779 = [];

    var_0 = _id_12804();

    for (;;)
    {
        var_1 = _id_12805();
        var_2 = [];
        var_2[0] = level._id_85D5;
        var_2[1] = level._id_B898;
        var_2[2] = level._id_B779;
        var_3 = scripts\engine\utility::_id_2282( var_2 );

        foreach ( var_5 in var_3 )
        {
            if ( !isdefined( var_5 ) )
                continue;

            if ( scripts\mp\utility\game::istrue( var_5._id_69BA ) )
                continue;

            if ( trophy_checkignorelist( var_5 ) )
                continue;

            var_6 = var_5.owner;

            if ( !isdefined( var_6 ) && isdefined( var_5._id_13C2E ) && weaponclass( var_5._id_13C2E ) == "grenade" )
                var_6 = getmissileowner( var_5 );

            if ( isdefined( var_6 ) && !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_6 ) ) )
                continue;

            if ( distancesquared( var_5.origin, self.origin ) > trophy_modifiedprotectiondistsqr( var_5, 65536 ) )
                continue;

            var_7 = physics_raycast( var_1, var_5.origin, var_0, [ self, var_5 ], 0, "physicsquery_closest" );

            if ( isdefined( var_7 ) && var_7.size > 0 )
                continue;

            _id_1281E( var_5 );
        }

        scripts\engine\utility::waitframe();
    }
}

_id_1281E( var_0 )
{
    self.owner thread scripts\mp\utility\game::_id_83B4( "trophy_defense" );
    self.owner scripts\mp\missions::_id_D991( "ch_tactical_trophy" );
    self.owner thread scripts\mp\gamelogic::_id_117B7( "trophy_mp", 1, "hits" );
    self.owner scripts\mp\damage::combatrecordtacticalstat( "power_trophy" );
    var_0 setcandamage( 0 );
    var_0._id_69BA = 1;
    var_0 _meth_83AD();
    _id_12821( var_0 );
    _id_12817( var_0, "trophy_mp", self.owner );
    var_1 = var_0.origin;
    var_2 = var_0.angles;

    if ( scripts\mp\weapons::_id_9EE5( var_0 ) )
        var_0 scripts\mp\weapons::_id_51B5();
    else if ( var_0 scripts\mp\domeshield::isdomeshield() )
        var_0 thread scripts\mp\domeshield::domeshield_delete();
    else
        var_0 delete();

    var_3 = trophy_getbesttag( var_1 );
    var_4 = trophy_getpartbytag( var_3 );
    self setscriptablepartstate( var_4, "active", 0 );
    self._id_69DA thread trophy_explode( var_1, var_2 );
    self._id_1E2D--;

    if ( self._id_1E2D <= 0 )
        thread trophy_destroy();
}

_id_12811( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;
    var_5 = scripts\mp\damage::_id_89C3( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8975( var_1, var_2, var_5 );
    _id_0AE2::equipmenthit( self.owner, var_0, var_1, var_2 );
    return var_5;
}

_id_12812( var_0, var_1, var_2, var_3, var_4 )
{
    trophy_givepointsfordeath( var_0 );
    thread trophy_destroy();
}

trophy_destroyonemp()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self waittill( "emp_damage", var_0, var_1 );
    trophy_givepointsfordeath( var_0 );
    trophy_givedamagefeedback( var_0 );
    thread trophy_destroy();
}

trophy_destroyongameend()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    level scripts\engine\utility::waittill_any( "game_ended", "bro_shot_start" );
    thread trophy_destroy();
}

_id_12818()
{
    if ( self.owner _id_0AE2::_id_8C17( "power_trophy" ) )
        self.owner _id_12803( self._id_1E2D );
}

trophy_createexplosion( var_0 )
{
    var_1 = spawn( "script_model", var_0.origin );
    var_1._id_A63A = var_0;
    var_1.owner = var_0.owner;
    var_1.team = var_0.team;
    var_1._id_D719 = var_0._id_D719;
    var_1._id_13C2E = var_0._id_13C2E;
    var_1 _meth_831F( var_1.owner );
    var_1 _meth_82DD( var_1.owner );
    var_1 setmodel( "trophy_system_mp_explode" );
    var_1.explode1available = 1;
    var_1.explode2available = 1;
    var_1 thread trophy_cleanuponparentdeath( var_0, 0.1 );
    return var_1;
}

trophy_explode( var_0, var_1 )
{
    self dontinterpolate();
    self.origin = var_0;
    self.angles = var_1;

    if ( self.explode1available )
    {
        self setscriptablepartstate( "explode1", "active", 0 );
        self.explode1available = 0;
    }
    else if ( self.explode2available )
    {
        self setscriptablepartstate( "explode2", "active", 0 );
        self.explode1available = 0;
    }
}

_id_12805()
{
    return self.origin + anglestoup( self.angles ) * 45;
}

_id_12804()
{
    return physics_createcontents( [ "physicscontents_solid", "physicscontents_vehicle", "physicscontents_glass", "physicscontents_water", "physicscontents_sky", "physicscontents_item" ] );
}

trophy_modifiedprotectiondistsqr( var_0, var_1 )
{
    if ( isdefined( var_0._id_13C2E ) && isdefined( var_0.owner ) )
    {
        switch ( var_0._id_13C2E )
        {
            case "jackal_cannon_mp":
            case "shockproj_mp":
            case "switch_blade_child_mp":
            case "thorproj_zoomed_mp":
            case "drone_hive_projectile_mp":
                if ( 147456 > var_1 )
                    var_1 = 147456;

                break;
            case "iw7_arclassic_mp":
            case "iw7_chargeshot_mp":
            case "iw7_lockon_mp":
            case "wristrocket_proj_mp":
                if ( 65536 > var_1 )
                    var_1 = 65536;

                break;
        }
    }

    return var_1;
}

trophy_checkignorelist( var_0 )
{
    if ( isdefined( var_0._id_13C2E ) )
    {
        if ( scripts\mp\utility\game::_id_9E6C( var_0._id_13C2E ) )
            return 1;

        if ( scripts\mp\weapons::isaxeweapon( var_0._id_13C2E ) )
            return 1;

        switch ( var_0._id_13C2E )
        {
            case "domeshield_mp":
                if ( scripts\mp\weapons::_id_9EE5( var_0 ) )
                    return 1;

                break;
            case "trophy_mp":
                if ( scripts\mp\weapons::_id_9EE5( var_0 ) )
                    return 1;

                break;
            case "uplinkball_tracking_mp":
            case "blackholegun_indicator_mp":
            case "cluster_grenade_indicator_mp":
            case "micro_turret_mp":
            case "iw7_cheytac_mpr_projectile":
            case "iw7_blackholegun_mp":
            case "globproj_mp":
            case "transponder_mp":
            case "throwingknifeteleport_mp":
            case "throwingknife_mp":
            case "wristrocket_mp":
            case "throwingknifec4_mp":
                return 1;
        }
    }

    return 0;
}

_id_12821( var_0 )
{
    if ( getdvarint( "showArchetypes", 0 ) > 0 )
        var_0 _id_0AE2::_id_C179();
}

_id_12817( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0.owner ) || !isplayer( var_0.owner ) )
        return;

    var_0.owner thread scripts\mp\damagefeedback::updatedamagefeedback( "hiticontrophysystem" );

    if ( isdefined( var_0._id_13C2E ) )
    {
        switch ( var_0._id_13C2E )
        {
            case "jackal_cannon_mp":
            case "shockproj_mp":
            case "switch_blade_child_mp":
            case "thorproj_tracking_mp":
            case "thorproj_zoomed_mp":
            case "drone_hive_projectile_mp":
                var_0.owner notify( "destroyed_by_trophy", var_2, var_1, var_0._id_13C2E, var_0.origin, var_0.angles );
                break;
        }
    }
}

trophy_getbesttag( var_0 )
{
    var_1 = level._id_12802._id_1141B;
    var_2 = undefined;
    var_3 = undefined;

    foreach ( var_10, var_5 in var_1 )
    {
        var_6 = self gettagorigin( var_5 );
        var_7 = self gettagangles( var_5 );
        var_8 = anglestoforward( var_7 );
        var_9 = vectordot( vectornormalize( var_0 - var_6 ), var_8 );

        if ( var_10 == 0 || var_9 > var_2 )
        {
            var_2 = var_9;
            var_3 = var_5;
        }
    }

    return var_3;
}

trophy_getpartbytag( var_0 )
{
    var_1 = level._id_12802._id_1141B;

    foreach ( var_4, var_3 in var_1 )
    {
        if ( var_3 == var_0 )
            return "protect" + ( var_4 + 1 );
    }

    return undefined;
}

trophy_givepointsfordeath( var_0 )
{
    if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0 ) ) )
    {
        var_0 notify( "destroyed_equipment" );
        var_0 thread scripts\mp\utility\game::_id_83B4( "destroyed_equipment" );
    }
}

trophy_givedamagefeedback( var_0 )
{
    var_1 = "";

    if ( scripts\mp\utility\game::istrue( self.hasruggedeqp ) )
        var_1 = "hitequip";

    if ( isplayer( var_0 ) )
        var_0 scripts\mp\damagefeedback::updatedamagefeedback( var_1 );
}

_id_12803( var_0 )
{
    if ( !isdefined( self._id_12801 ) )
        self._id_12801 = [];

    if ( self._id_12801.size < _id_12814() )
    {
        if ( !isdefined( var_0 ) )
            var_0 = 2;

        self._id_12801[self._id_12801.size] = var_0;
    }
}

_id_1281F()
{
    if ( isdefined( self._id_12801 ) && self._id_12801.size > 0 )
    {
        var_0 = self._id_12801[self._id_12801.size - 1];
        self._id_12801[self._id_12801.size - 1] = undefined;
        return var_0;
    }

    return undefined;
}

_id_12806()
{
    self._id_12801 = undefined;
}

_id_1281A()
{
    var_0 = _id_0AE2::_id_D736( "power_trophy" );

    for ( var_1 = 0; var_1 < var_0; var_1++ )
        _id_12803();
}

_id_12814()
{
    return _id_0AE2::_id_D736( "power_trophy" );
}

trophy_modifieddamage( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2 ) )
        return [ var_3, var_4 ];

    if ( var_3 == 0 )
        return [ var_3, var_4 ];

    var_5 = undefined;

    if ( level._id_8B38 )
    {
        switch ( var_2 )
        {
            case "super_trophy_mp":
            case "player_trophy_system_mp":
            case "trophy_mp":
                var_5 = 20;
                break;
        }
    }

    var_6 = var_4;

    if ( isdefined( var_5 ) )
        var_6 = var_5 - var_3;

    var_6 = min( var_6, var_4 );
    return [ var_3, var_4 ];
}

trophy_cleanuponparentdeath( var_0, var_1 )
{
    self endon( "death" );
    var_0 waittill( "death" );
    wait( var_1 );
    self delete();
}

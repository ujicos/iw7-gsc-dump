// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_1127D()
{
    var_0 = spawnstruct();
    var_0._id_12801 = [];
    var_0._id_1141B = [];
    var_0._id_1141B[0] = "fx_01_jnt";
    var_0._id_1141B[1] = "fx_02_jnt";
    var_0._id_1141B[2] = "fx_03_jnt";
    var_0._id_1141B[3] = "fx_04_jnt";
    level._id_11267 = var_0;
}

_id_11296( var_0 )
{
    var_1 = self.supertrophies;

    if ( isdefined( var_1 ) )
    {
        foreach ( var_3 in var_1 )
            var_3 thread _id_11274();

        self.supertrophies = undefined;
    }

    if ( isdefined( self._id_11293 ) )
    {
        self._id_11293 = undefined;
        _id_11276( var_0 );
    }
}

_id_11297()
{
    scripts\mp\utility\game::_id_1254();
    self setscriptablepartstate( "killstreak", "visor_active", 0 );
    self._id_11293 = 1;
    _id_11272();
    thread _id_1129D();
    thread _id_1129B();
    thread _id_1129C();
    thread watcharbitraryup();
    return 1;
}

_id_11276( var_0 )
{
    self notify( "superTrophy_end" );

    if ( !scripts\mp\utility\game::istrue( var_0 ) )
        scripts\mp\utility\game::_id_11DB();

    self setscriptablepartstate( "killstreak", "neutral", 0 );
    _id_11273( var_0 );
    var_1 = self._id_11293;
    self._id_11293 = undefined;
    return scripts\mp\utility\game::istrue( var_1 );
}

_id_11274()
{
    self notify( "death" );
    supertrophy_removefromarrays( self, self.owner );

    if ( isdefined( self.objstruct ) )
        self.objstruct _id_11275();

    if ( isdefined( self.owner ) )
        scripts\mp\utility\game::_id_D915( "supertrophy destroyed", self.owner );

    self setcandamage( 0 );
    self _meth_854A();
    self setscriptablepartstate( "effects", "activeDestroyStart", 0 );
    wait 3;
    self setscriptablepartstate( "effects", "activeDestroyEnd", 0 );
    wait 0.1;
    self delete();
}

_id_11299()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self setscriptablepartstate( "effects", "activeDeployStart", 0 );
    self.objstruct = _id_11270();
    wait 1.25;
    self setscriptablepartstate( "effects", "activeDeployEnd", 0 );
    scripts\mp\sentientpoolmanager::registersentient( "Killstreak_Ground", self.owner );
    thread scripts\mp\weapons::outlinesuperequipment( self, self.owner );
    thread scripts\mp\entityheadicons::_id_F73E( self.owner, ( 0, 0, 50 ), 0 );
    thread scripts\mp\perks\perk_equipmentping::_id_E84B( self );
    thread _id_1129F();
    thread _id_1129E();
}

_id_11278( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;

    if ( !scripts\mp\equipment\phase_shift::_id_213D( self, var_0 ) )
        return 0;

    var_5 = scripts\mp\damage::_id_8975( var_1, var_2, var_5 );
    var_5 = _id_1127B( var_1, var_2, var_5 );
    var_5 = supertrophy_handlesuperdamage( var_1, var_2, var_5 );
    var_5 = scripts\mp\supers::modifysuperequipmentdamage( var_0, var_1, var_2, var_5, var_4 );
    return var_5;
}

_id_11279( var_0, var_1, var_2, var_3, var_4 )
{
    if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0 ) ) )
    {
        var_0 thread scripts\mp\events::_id_11265( self.owner );
        var_0 notify( "destroyed_equipment" );
    }

    if ( isdefined( var_0 ) && isplayer( var_0 ) && var_0 != self.owner )
        var_0 scripts\mp\missions::_id_D991( "ch_killjoy_six_ability" );

    thread _id_11274();
}

_id_1127B( var_0, var_1, var_2 )
{
    if ( var_1 == "MOD_MELEE" )
        return int( ceil( self.maxhealth / 2 ) );

    return var_2;
}

supertrophy_handlesuperdamage( var_0, var_1, var_2 )
{
    var_3 = 1;
    var_4 = getweaponbasename( var_0 );

    if ( isdefined( var_4 ) )
        var_0 = var_4;

    switch ( var_0 )
    {
        case "micro_turret_gun_mp":
            var_3 = 4;
            break;
        case "iw7_penetrationrail_mp":
            var_3 = 2.3;
            break;
        case "iw7_atomizer_mp":
            var_3 = 1.5;
            break;
    }

    return int( ceil( var_3 * var_2 ) );
}

_id_1129D()
{
    self endon( "disconnect" );
    self endon( "superTrophy_createTrophy" );
    self endon( "superTrophy_end" );

    for (;;)
    {
        self waittill( "equip_deploy_succeeded", var_0, var_1, var_2, var_3 );

        if ( var_0 == "deploy_supertrophy_mp" )
        {
            thread _id_11271( var_1, var_2, var_3 );
            break;
        }
    }
}

_id_1129B()
{
    self endon( "disconnect" );
    self endon( "superTrophy_createTrophy" );
    self endon( "superTrophy_end" );

    for (;;)
    {
        self waittill( "equip_deploy_failed", var_0, var_1, var_2, var_3 );

        if ( var_0 == "deploy_supertrophy_mp" )
        {
            self setweaponammoclip( "deploy_supertrophy_mp", 100 );
            break;
        }
    }
}

_id_1129C()
{
    self endon( "disconnect" );
    self endon( "superTrophy_createTrophy" );
    self endon( "superTrophy_end" );
    level waittill( "game_ended" );
    scripts\mp\supers::_id_DE3B( 9999000 );
}

watcharbitraryup()
{
    self endon( "disconnect" );
    self endon( "superTrophy_createTrophy" );
    self endon( "superTrophy_end" );
    scripts\engine\utility::waitframe();

    while ( !scripts\mp\utility\game::isinarbitraryup() )
        scripts\engine\utility::waitframe();

    scripts\mp\supers::superdisabledinarbitraryupmessage();
    scripts\mp\supers::_id_DE3B( 9999000 );
}

_id_11272()
{
    self._id_11277 = 1;
    scripts\engine\utility::_id_1C6E( 0 );
    _id_0AE2::_id_D729();
    scripts\mp\utility\game::_id_1C47( 0 );
}

_id_11273( var_0 )
{
    if ( !scripts\mp\utility\game::istrue( var_0 ) )
    {
        if ( scripts\mp\utility\game::istrue( self._id_11277 ) )
        {
            scripts\engine\utility::_id_1C6E( 1 );
            _id_0AE2::_id_D72F();
            scripts\mp\utility\game::_id_1C47( 1 );
        }
    }

    self._id_11277 = undefined;
}

_id_11271( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_11267 ) )
        self._id_11267 thread _id_11274();

    self notify( "superTrophy_createTrophy" );

    if ( !isdefined( self.supertrophies ) )
        self.supertrophies = [];

    if ( self.supertrophies.size >= supertrophy_getmaxnum() )
        self.supertrophies[0] thread _id_11274();

    var_3 = spawn( "script_model", var_0 );
    var_3.angles = var_1;
    var_3 _meth_831F( self );
    var_3 setmodel( "super_trophy_mp_wm" );
    var_3 _meth_8317( 1 );
    var_3 _meth_8549();
    var_3 _meth_8594();
    var_3.owner = self;
    var_3.team = var_3.owner.team;
    var_3._id_11234 = "super_supertrophy";
    var_3._id_13C2E = "super_trophy_mp";
    var_3.planted = 1;
    var_3._id_B373 = [];
    var_3._id_B374 = [];
    var_3._id_1E2D = 10;
    supertrophy_addtoarrays( var_3, self );
    var_3 thread _id_1126D();
    var_3 thread _id_1126E();
    var_3._id_A63A = _id_1126F( var_3 );
    var_3._id_69DA = supertrophy_createexplosion( var_3 );
    var_4 = scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" );
    var_5 = scripts\engine\utility::ter_op( var_4, 475, 399 );
    var_6 = scripts\engine\utility::ter_op( var_4, "hitequip", "" );
    var_3 thread scripts\mp\damage::monitordamage( var_5, var_6, ::_id_11279, ::_id_11278, 0 );

    if ( isdefined( var_2 ) )
        var_3 scripts\mp\weapons::_id_69FF( var_2 );

    var_3 thread _id_11299();
    self._id_11293 = undefined;
    scripts\mp\supers::_id_DE3B( 9999000 );
    level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_trophy", undefined, 0.75 );
    scripts\mp\utility\game::_id_D915( "supertrophy placed", self );
}

_id_1126F( var_0 )
{
    var_1 = spawn( "script_model", var_0.origin + anglestoup( var_0.angles ) * 65 );
    var_1.angles = var_0.angles;
    var_1 setmodel( "tag_origin" );
    var_1 setscriptmoverkillcam( "explosive" );
    var_1 linkto( var_0 );
    var_1 thread supertrophy_cleanuponparentdeath( var_0, 5 );
    return var_1;
}

supertrophy_createexplosion( var_0 )
{
    var_1 = spawn( "script_model", var_0.origin );
    var_1._id_A63A = var_0._id_A63A;
    var_1.owner = var_0.owner;
    var_1.team = var_0.team;
    var_1._id_11234 = var_0._id_11234;
    var_1._id_13C2E = var_0._id_13C2E;
    var_1 _meth_831F( var_1.owner );
    var_1 _meth_82DD( var_1.owner );
    var_1 setmodel( "super_trophy_mp_explode" );
    var_1.timebypart = [];

    for ( var_2 = 0; var_2 < 4; var_2++ )
        var_1.timebypart[var_2] = 0;

    var_1 thread supertrophy_cleanuponparentdeath( var_0, 0.1 );
    return var_1;
}

supertrophy_explode( var_0, var_1 )
{
    foreach ( var_4, var_3 in self.timebypart )
    {
        if ( ( gettime() - var_3 ) / 1000 > 0.1 )
        {
            self dontinterpolate();
            self.origin = var_0;
            self.angles = var_1;
            self setscriptablepartstate( "explode" + ( var_4 + 1 ), "active", 0 );
            self.timebypart[var_4] = gettime();
            return;
        }
    }
}

_id_1129F()
{
    self endon( "death" );
    self.owner endon( "disconnect" );

    if ( !isdefined( level._id_85D5 ) )
        level._id_85D5 = [];

    if ( !isdefined( level._id_B898 ) )
        level._id_B898 = [];

    if ( !isdefined( level._id_B779 ) )
        level._id_B779 = [];

    var_0 = scripts\mp\trophy_system::_id_12804();

    for (;;)
    {
        var_1 = [];
        var_1[0] = level._id_85D5;
        var_1[1] = level._id_B898;
        var_1[2] = level._id_B779;
        var_2 = scripts\engine\utility::_id_2282( var_1 );
        var_3 = _id_1128F();

        foreach ( var_5 in var_2 )
        {
            if ( !isdefined( var_5 ) )
                continue;

            if ( scripts\mp\utility\game::istrue( var_5._id_69BA ) )
                continue;

            if ( supertrophy_checkignorelist( var_5 ) )
                continue;

            var_6 = var_5.owner;

            if ( !isdefined( var_6 ) && isdefined( var_5._id_13C2E ) && weaponclass( var_5._id_13C2E ) == "grenade" )
                var_6 = getmissileowner( var_5 );

            if ( isdefined( var_6 ) && !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_6 ) ) )
                continue;

            if ( distancesquared( var_5.origin, self.origin ) > scripts\mp\trophy_system::trophy_modifiedprotectiondistsqr( var_5, 65536 ) )
                continue;

            var_7 = physics_raycast( var_3, var_5.origin, var_0, [ self, var_5 ], 0, "physicsquery_closest" );

            if ( isdefined( var_7 ) && var_7.size > 0 )
                continue;

            if ( isdefined( self.objstruct ) )
                self.objstruct thread supertrophy_setobjectivefiring();

            thread _id_1128E( var_5 );
            self._id_1E2D--;

            if ( self._id_1E2D <= 0 )
            {
                thread _id_11274();
                return;
            }
        }

        scripts\engine\utility::waitframe();
    }
}

_id_1128E( var_0 )
{
    level thread scripts\mp\battlechatter_mp::_id_EB87( self.owner, "plr_perk_trophy_block", undefined, 0.75 );
    self.owner scripts\mp\killstreaks\killstreaks::_id_83A1();
    self.owner thread scripts\mp\events::_id_11262( "super_supertrophy" );
    self.owner scripts\mp\supers::combatrecordsuperkill( "super_supertrophy" );
    var_0 setcandamage( 0 );
    var_0._id_69BA = 1;
    var_0 _meth_83AD();
    scripts\mp\trophy_system::_id_12821( var_0 );
    scripts\mp\trophy_system::_id_12817( var_0, "super_trophy_mp", self.owner );
    var_1 = var_0.origin;
    var_2 = var_0.angles;

    if ( scripts\mp\weapons::_id_9EE5( var_0 ) )
        var_0 scripts\mp\weapons::_id_51B5();
    else if ( var_0 scripts\mp\domeshield::isdomeshield() )
        var_0 thread scripts\mp\domeshield::domeshield_delete();
    else
        var_0 delete();

    var_3 = supertrophy_getbesttag( var_1 );
    var_4 = supertrophy_getpartbytag( var_3 );
    self setscriptablepartstate( var_4, "active", 0 );
    self._id_69DA thread supertrophy_explode( var_1, var_2 );
}

_id_1129E()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    var_0 = physics_createcontents( [ "physicscontents_solid", "physicscontents_vehicle", "physicscontents_glass", "physicscontents_water", "physicscontents_sky", "physicscontents_missileclip" ] );

    for (;;)
    {
        var_1 = scripts\mp\utility\game::_id_807C( self.origin, 256, undefined );

        foreach ( var_3 in self._id_B373 )
        {
            if ( !_id_1127E( var_3 ) )
                continue;

            if ( scripts\engine\utility::array_contains( var_1, var_3 ) )
                continue;

            _id_11292( var_3 );
        }

        var_5 = _id_1128F();

        foreach ( var_7 in var_1 )
        {
            if ( !_id_1127E( var_7 ) )
                continue;

            var_8 = _id_11295( var_7 );
            var_9 = _id_11288( var_7, var_5, var_0 );

            if ( !var_8 && var_9 )
            {
                thread _id_11284( var_7 );
                continue;
            }

            if ( var_8 && !var_9 )
                _id_11292( var_7 );
        }

        var_1 = scripts\mp\weapons::_id_7E8C( self.origin, 256 );

        foreach ( var_3 in self._id_B373 )
        {
            if ( _id_1127E( var_3 ) )
                continue;

            if ( scripts\engine\utility::array_contains( var_1, var_3 ) )
                continue;

            _id_11292( var_3 );
        }

        foreach ( var_7 in var_1 )
        {
            if ( _id_1127E( var_7 ) )
                continue;

            var_8 = _id_11295( var_7 );
            var_9 = _id_11287( var_7 );

            if ( !var_8 && var_9 )
            {
                thread _id_11282( var_7 );
                continue;
            }

            if ( var_8 && !var_9 )
                _id_11292( var_7 );
        }

        scripts\engine\utility::waitframe();
    }
}

_id_11284( var_0 )
{
    _id_11269( var_0 );
    var_1 = var_0 getentitynumber();
    var_2 = spawnstruct();
    var_2.empd = 0;
    _id_11285( var_0, var_2 );

    if ( isdefined( self ) )
        _id_11292( var_0, var_1 );

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( self ) && isdefined( self.owner ) )
            scripts\mp\gamescore::_id_12D6F( self.owner, var_0, "super_trophy_mp" );

        if ( var_2.empd )
            var_0 scripts\mp\killstreaks\emp_common::_id_E0F3();
    }
}

_id_11285( var_0, var_1 )
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    var_2 = gettime();

    while ( _id_11295( var_0 ) )
    {
        if ( !var_1.empd )
        {
            if ( !var_0 scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) )
            {
                var_0 scripts\mp\killstreaks\emp_common::_id_20C3();
                scripts\mp\gamescore::_id_11ACE( self.owner, var_0, "super_trophy_mp" );
                var_1.empd = 1;
            }
        }
        else if ( var_0 scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) )
        {
            var_0 scripts\mp\killstreaks\emp_common::_id_E0F3();
            scripts\mp\gamescore::_id_12D6F( self.owner, var_0, "super_trophy_mp" );
            var_1.empd = 0;
        }

        if ( gettime() >= var_2 )
        {
            if ( var_0 scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) )
                self.owner scripts\mp\damagefeedback::updatedamagefeedback( "hiticonempimmune", undefined, undefined, undefined, 1 );

            var_3 = scripts\mp\perks\perkfunctions::_id_20E0( self.owner, var_0, 0.7 );
            var_0 _meth_80B0( 1, self.origin, self.owner, self, "MOD_EXPLOSIVE", "super_trophy_mp" );
            var_0 shellshock( "super_trophy_mp", var_3 );
            thread supertrophy_persempplayereffectsstun( var_0, var_3 );
            var_2 = gettime() + 1000;
        }

        scripts\engine\utility::waitframe();
    }
}

supertrophy_persempplayereffectsstun( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 scripts\mp\weapons::_id_F7FC();
    wait( var_1 );
    var_0 scripts\mp\weapons::_id_F800();
}

_id_11282( var_0 )
{
    _id_11269( var_0 );
    var_1 = var_0 getentitynumber();
    _id_11283( var_0 );

    if ( isdefined( self ) )
        _id_11292( var_0, var_1 );
}

_id_11283( var_0 )
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_1 = gettime();

    while ( _id_11295( var_0 ) )
    {
        if ( gettime() >= var_1 )
        {
            var_0 notify( "emp_damage", self.owner, 2.25, self.origin, "super_trophy_mp", "MOD_EXPLOSIVE" );
            var_1 = gettime() + 1000;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_11270()
{
    var_0 = spawnstruct();
    var_0.owner = self.owner;
    var_0._id_12802 = self;
    var_0._id_92B8 = scripts\mp\objidpoolmanager::requestminimapid( 1 );

    if ( var_0._id_92B8 == -1 )
        return undefined;

    scripts\mp\objidpoolmanager::minimap_objective_add( var_0._id_92B8, "active", self.origin, "icon_minimap_super_trophy_friendly" );
    scripts\mp\objidpoolmanager::minimap_objective_onentitywithrotation( var_0._id_92B8, self );
    var_0 thread supertrophy_monitorobjective();
    return var_0;
}

_id_11275()
{
    self notify( "returnMinimapID" );
    scripts\mp\objidpoolmanager::returnminimapid( self._id_92B8 );
}

supertrophy_monitorobjective()
{
    self._id_12802 endon( "death" );
    self.owner endon( "disconnect" );
    self endon( "returnMinimapID" );
    self notify( "superTrophy_monitorObjective" );
    self endon( "superTrophy_monitorObjective" );

    while ( isdefined( self.owner ) && isdefined( self._id_12802 ) )
    {
        if ( scripts\mp\utility\game::istrue( self.firingstate ) )
        {
            scripts\mp\objidpoolmanager::minimap_objective_playermask_showtoall( self._id_92B8 );

            if ( self.firingstate == 1 )
                scripts\mp\objidpoolmanager::minimap_objective_icon( self._id_92B8, "icon_minimap_super_trophy_friendly_firing" );

            if ( self.firingstate == 2 )
                scripts\mp\objidpoolmanager::minimap_objective_icon( self._id_92B8, "icon_minimap_super_trophy_friendly" );
        }
        else
        {
            scripts\mp\objidpoolmanager::minimap_objective_playermask_hidefromall( self._id_92B8 );
            scripts\mp\objidpoolmanager::minimap_objective_playermask_showto( self._id_92B8, self.owner getentitynumber() );
            scripts\mp\objidpoolmanager::minimap_objective_icon( self._id_92B8, "icon_minimap_super_trophy_friendly" );

            foreach ( var_1 in level.players )
            {
                if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_engineer" ) )
                {
                    scripts\mp\objidpoolmanager::minimap_objective_playermask_showto( self._id_92B8, var_1 getentitynumber() );
                    continue;
                }

                if ( level.teambased && var_1.team == self.owner.team )
                    scripts\mp\objidpoolmanager::minimap_objective_playermask_showto( self._id_92B8, var_1 getentitynumber() );
            }
        }

        scripts\engine\utility::waitframe();
    }
}

supertrophy_setobjectivefiring()
{
    self notify( "superTrophy_setObjectiveFiring" );
    self endon( "superTrophy_setObjectiveFiring" );
    self.firingstate = 1;
    thread supertrophy_monitorobjective();
    wait 0.5;
    self.firingstate = 2;
    wait 0.25;
    self.firingstate = undefined;
}

_id_11288( var_0, var_1, var_2 )
{
    if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
        return 0;

    if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_0 ) )
        return 0;

    if ( !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0 ) ) )
        return 0;

    var_3 = physics_raycast( var_1, var_0.origin, var_2, [ self, var_0 ], 0, "physicsquery_closest" );

    if ( isdefined( var_3 ) && var_3.size > 0 )
    {
        var_3 = physics_raycast( var_1, var_0 geteye(), var_2, [ self, var_0 ], 0, "physicsquery_closest" );

        if ( isdefined( var_3 ) && var_3.size > 0 )
            return 0;
    }

    return 1;
}

_id_11287( var_0 )
{
    if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_0 ) )
        return 0;

    if ( !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0.owner ) ) )
        return 0;

    return 1;
}

_id_11280( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) || var_2 != "super_trophy_mp" )
        return var_3;

    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return var_3;

    if ( var_0 != var_1 )
        return var_3;

    return 0;
}

_id_11286( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_4 == 1 )
        return 1;

    return 0;
}

_id_11269( var_0 )
{
    var_1 = var_0 getentitynumber();
    self._id_B373[var_1] = var_0;
}

_id_11292( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = var_0 getentitynumber();

    self._id_B373[var_1] = undefined;
}

_id_11295( var_0 )
{
    var_1 = var_0 getentitynumber();
    return isdefined( self._id_B373[var_1] );
}

supertrophy_checkignorelist( var_0 )
{
    return !supertrophy_ignorelistoverrides( var_0 ) && scripts\mp\trophy_system::trophy_checkignorelist( var_0 );
}

supertrophy_ignorelistoverrides( var_0 )
{
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
                return 1;
            case "trophy_mp":
            case "domeshield_mp":
                if ( scripts\mp\weapons::_id_9EE5( var_0 ) )
                    return 1;
        }
    }

    return 0;
}

_id_1128F()
{
    return self.origin + anglestoup( self.angles ) * 35;
}

_id_1127E( var_0 )
{
    if ( !isplayer( var_0 ) && !isagent( var_0 ) )
        return 0;

    if ( scripts\mp\utility\game::_id_9F22( var_0 ) )
        return 0;

    if ( scripts\mp\utility\game::_id_9F72( var_0 ) )
        return 0;

    return 1;
}

supertrophy_getbesttag( var_0 )
{
    var_1 = level._id_11267._id_1141B;
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

supertrophy_getpartbytag( var_0 )
{
    var_1 = level._id_11267._id_1141B;

    foreach ( var_4, var_3 in var_1 )
    {
        if ( var_3 == var_0 )
            return "protect" + ( var_4 + 1 );
    }

    return undefined;
}

supertrophy_getmaxnum()
{
    var_0 = 1;

    if ( scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" ) )
        var_0++;

    return var_0;
}

supertrophy_onruggedequipmentunset()
{
    self endon( "disconnect" );

    if ( !isdefined( self.supertrophies ) || self.supertrophies.size <= 0 )
        return;

    if ( !scripts\mp\utility\game::isreallyalive( self ) )
    {
        self waittill( "giveLoadout" );

        if ( !isdefined( self.supertrophies ) || self.supertrophies.size <= 0 )
            return;
    }

    var_0 = supertrophy_getmaxnum();
    var_1 = max( 0, self.supertrophies.size - var_0 );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
        self.supertrophies[0] thread _id_11274();
}

supertrophy_addtoarrays( var_0, var_1 )
{
    var_1.supertrophies[var_1.supertrophies.size] = var_0;
    level._id_11267._id_12801[var_0 getentitynumber()] = var_0;
}

supertrophy_removefromarrays( var_0, var_1 )
{
    if ( isdefined( var_1 ) && isdefined( var_1.supertrophies ) )
        var_1.supertrophies = scripts\engine\utility::array_remove( var_1.supertrophies, var_0 );

    level._id_11267._id_12801[var_0 getentitynumber()] = undefined;
}

_id_1126D()
{
    self endon( "death" );
    self.owner waittill( "disconnect" );
    thread _id_11274();
}

_id_1126E()
{
    self endon( "death" );
    level scripts\engine\utility::waittill_any( "game_ended", "bro_shot_start" );
    thread _id_11274();
}

supertrophy_cleanuponparentdeath( var_0, var_1 )
{
    self endon( "death" );
    var_0 waittill( "death" );
    wait( var_1 );
    self delete();
}

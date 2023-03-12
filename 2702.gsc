// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_2B3C()
{
    level._id_2ABD = [];
    level._id_2ABC = [];
}

_id_2B41()
{
    scripts\mp\weapons::_id_B2A3();
    self.owner _id_2B3D( self, 1 );
}

_id_2B40()
{

}

_id_2B3D( var_0, var_1 )
{
    var_0 endon( "death" );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    scripts\mp\utility\game::_id_D915( "black hole grenade spawned", self );
    thread bhg_deleteondisowned( var_0 );
    var_0._id_10E19 = 0;
    thread _id_12EB1( var_0, var_1 );

    if ( !var_1 )
    {
        var_0 waittill( "blackhole_grenade_stuck" );

        if ( !isdefined( var_0 ) )
            return;
    }

    var_0._id_10E19 = 1;
    thread _id_12F29( var_0 );
    var_0 waittill( "blackhole_grenade_active" );

    if ( !isdefined( var_0 ) )
        return;

    var_0._id_10E19 = 2;
    thread _id_12E56( var_0 );
    var_0 waittill( "blackhole_grenade_finished" );

    if ( !isdefined( var_0 ) )
        return;
}

_id_2B3E( var_0 )
{
    var_0 endon( "death" );
    thread bhg_deleteondisowned( var_0 );
    var_0._id_9935 = 1;
    var_1 = spawn( "script_model", var_0.origin );
    var_1 _meth_831F( var_0.owner );
    var_1 setmodel( "prop_mp_black_hole_grenade_scr" );
    var_1 _meth_8317( 1 );
    var_1 linkto( var_0 );
    var_1 thread _id_4116( var_0 );
    var_0._id_0289 = var_1;
    var_2 = _id_7E08( var_0 );
    thread _id_10831( var_0, var_2, var_0.angles, self, "blackhole_grenade_mp" );
    thread _id_10833( var_0, var_2, var_0.angles, 2750 );
    thread _id_13A58( var_0, var_2 );
    thread watchforempents( var_0, var_2 );
    var_0._id_0289 setscriptablepartstate( "vortexUpdate", "active", 0 );
    var_0 thread _id_CB0C();
    wait 2.0;
    var_0 delete();
}

_id_12EB1( var_0, var_1 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );

    if ( !var_1 )
        var_0 waittill( "missile_stuck", var_2 );

    self notify( "powers_blackholeGrenade_used", 1 );
    playloopsound( var_0.origin, "blackhole_plant" );
    var_0 _meth_859F();
    var_0 _meth_85A0();
    var_0 _meth_831F( var_0.owner );
    var_0 _meth_82DD( var_0.owner );
    var_0 _meth_8317( 1 );
    var_3 = scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" );

    if ( var_3 )
        var_0.hasruggedeqp = 1;

    var_4 = scripts\engine\utility::ter_op( scripts\mp\utility\game::istrue( var_3 ), 30, 15 );
    var_5 = scripts\engine\utility::ter_op( scripts\mp\utility\game::istrue( var_3 ), "hitequip", "" );
    var_0 thread scripts\mp\damage::monitordamage( var_4, var_5, ::bhg_handlefataldamage, ::bhg_handledamage, 0 );
    var_0 thread bhg_destroyonemp();
    var_0 thread bhg_destroyongameend();
    var_0 thread scripts\mp\perks\perk_equipmentping::_id_E84B();
    thread scripts\mp\weapons::_id_C798( var_0, self );
    var_0 bhg_addtoglobalarr();
    var_6 = _id_7E08( var_0 );
    var_7 = _id_10835( var_0, var_6, var_0.angles );
    var_0._id_0289 = var_7;
    var_0 notify( "blackhole_grenade_stuck" );
}

_id_12F29( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_0 setscriptablepartstate( "beam", "active", 0 );
    var_0._id_0289 setscriptablepartstate( "vortexStart", "active", 0 );
    wait 1.2;
    var_0 notify( "blackhole_grenade_active" );
}

_id_12E56( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_1 = _id_7E08( var_0 );
    var_0.planted = 1;
    thread _id_10831( var_0, var_1, var_0.angles, self, "blackhole_grenade_mp" );
    thread _id_10833( var_0, var_1, var_0.angles, 2750 );
    thread _id_13A58( var_0, var_1 );
    thread watchforempents( var_0, var_1 );
    var_0._id_0289 setscriptablepartstate( "vortexUpdate", "active", 0 );
    var_0 scripts\mp\sentientpoolmanager::registersentient( "Lethal_Static", var_0.owner, 1 );
    var_0 thread _id_CB0C();
    wait 2.0;
    scripts\mp\utility\game::_id_D915( "black hole grenade finished", self );
    var_0 scripts\mp\sentientpoolmanager::unregistersentient( var_0.sentientpool, var_0.sentientpoolindex );
    var_0 thread bhg_destroy();
}

_id_13A58( var_0, var_1 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_0._id_11AD2 = [];
    var_2 = anglestoup( var_0.angles );
    var_3 = spawn( "trigger_rotatable_radius", var_1 - var_2 * 20 * 0.5, 0, 20, 20 );
    var_3.angles = var_0.angles;
    var_3 _meth_80D2();
    var_3 linkto( var_0 );
    var_3 thread _id_4108( var_0 );
    var_4 = physics_createcontents( [ "physicscontents_solid", "physicscontents_glass", "physicscontents_sky", "physicscontents_water", "physicscontents_item" ] );

    while ( isdefined( var_3 ) )
    {
        var_3 waittill( "trigger", var_5 );

        if ( !isdefined( var_5 ) )
            continue;

        if ( var_5 _id_9FAF( var_0 ) )
            continue;

        if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_5 ) )
            continue;

        if ( !isplayer( var_5 ) || isagent( var_5 ) )
            continue;

        if ( !scripts\mp\utility\game::isreallyalive( var_5 ) )
            continue;

        if ( scripts\mp\utility\game::_id_9F72( var_5 ) )
            continue;

        if ( !level._id_740A && var_5 != self && !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self, var_5 ) ) )
            continue;

        var_6 = "tag_eye";
        var_7 = _id_7E08( var_0 );
        var_8 = var_5 gettagorigin( var_6 );
        var_9 = physics_raycast( var_7, var_8, var_4, [ var_0, var_5 ], 0, "physicsquery_closest", 1 );

        if ( isdefined( var_9 ) && var_9.size > 0 )
        {
            var_6 = "tag_origin";
            var_8 = var_5 gettagorigin( var_6 );
            var_9 = physics_raycast( var_7, var_8, var_4, [ var_0, var_5 ], 0, "physicsquery_closest", 1 );

            if ( isdefined( var_9 ) && var_9.size > 0 )
                continue;
        }

        var_5 thread _id_11AD5( var_0 );
        var_5 _meth_80B0( 140, var_0.origin, var_0.owner, var_0, "MOD_EXPLOSIVE", "blackhole_grenade_mp" );
    }
}

watchforempents( var_0, var_1 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_2 = physics_createcontents( [ "physicscontents_solid", "physicscontents_glass", "physicscontents_sky", "physicscontents_water", "physicscontents_item" ] );
    var_3 = _id_7E08( var_0 );

    for (;;)
    {
        var_4 = scripts\mp\weapons::_id_7E8C( var_1, 60, 0 );

        foreach ( var_6 in var_4 )
        {
            if ( var_6 _id_9FAF( var_0 ) || var_6 == var_0 )
                continue;

            var_7 = var_6 gettagorigin( "tag_origin" );
            var_8 = physics_raycast( var_3, var_7, var_2, [ var_0, var_6 ], 0, "physicsquery_closest", 1 );

            if ( isdefined( var_8 ) && var_8.size > 0 )
                continue;

            var_6 thread _id_11AD5( var_0 );
            var_6 _meth_80B0( 140, var_0.origin, var_0.owner, var_0, "MOD_EXPLOSIVE", "blackhole_grenade_mp" );
        }

        scripts\engine\utility::waitframe();
    }
}

_id_10835( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_model", var_1 );
    var_3.angles = var_2;
    var_3 _meth_831F( var_0.owner );
    var_3 _meth_82DD( var_0 );
    var_3 setmodel( "prop_mp_black_hole_grenade_scr" );
    var_3 linkto( var_0 );
    var_3 thread _id_4116( var_0 );
    return var_3;
}

bhg_handlefataldamage( var_0, var_1, var_2, var_3, var_4 )
{
    bhg_awardpoints( var_0 );
    thread bhg_destroy();
}

bhg_handledamage( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !scripts\mp\equipment\phase_shift::_id_213D( var_0, self ) )
        return 0;

    if ( var_2 == "MOD_MELEE" )
        return self.maxhealth + 1;

    var_5 = 15;
    var_6 = 1;

    if ( scripts\mp\utility\game::_id_9DFF( var_1, var_2 ) )
        var_6 = 2;
    else if ( var_3 >= scripts\mp\weapons::minegettwohitthreshold() )
        var_6 = 2;

    _id_0AE2::equipmenthit( self.owner, var_0, var_1, var_2 );
    return var_6 * var_5;
}

_id_4116( var_0 )
{
    var_0 waittill( "death" );
    self setscriptablepartstate( "vortexStart", "neutral", 0 );
    self setscriptablepartstate( "vortexUpdate", "neutral", 0 );
    self setscriptablepartstate( "vortexEnd", "active", 0 );
    wait 2;
    self delete();
}

_id_10833( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_2E1( var_1, 256 );
    var_4.angles = var_2;
    var_4 linkto( var_0 );
    var_4 _meth_852C( 1, var_1, var_3 );
    var_4 _meth_8526( 1 );
    var_4 _meth_8529( 1 );
    var_4.time = gettime();
    var_4._id_720E = var_3;
    level._id_2ABC scripts\engine\utility::_id_22BC( level._id_2ABC );
    var_5 = undefined;
    var_6 = 0;

    for ( var_7 = 0; var_7 < 7; var_7++ )
    {
        var_8 = level._id_2ABC[var_7];

        if ( !isdefined( var_8 ) )
        {
            var_6 = var_7;
            break;
        }
        else if ( !isdefined( var_5 ) || isdefined( var_5 ) && var_5.time > var_8.time )
        {
            var_5 = var_8;
            var_6 = var_7;
        }
    }

    if ( isdefined( var_5 ) )
        var_5 delete();

    level._id_2ABC[var_6] = var_4;
    var_4 thread _id_139AD();
    var_4 thread _id_4108( var_0 );
}

_id_139AD()
{
    self endon( "death" );
    var_0 = self.origin;

    for (;;)
    {
        if ( var_0 != self.origin )
        {
            self _meth_852C( 1, self.origin, self._id_720E );
            var_0 = self.origin;
        }

        wait 0.1;
    }
}

_id_10831( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = _func_2AF( var_3, var_4, var_1 );
    var_5.angles = var_2;
    var_5 linkto( var_0 );
    thread bhg_trackimpulsefielddebuff( var_5, var_3 );
    var_5 thread _id_4108( var_0 );
}

_id_CB0C()
{
    var_0 = spawnstruct();
    _id_CB0D( var_0 );
    physicsexplosionsphere( var_0._id_D699, 128.0, 0, 200 );
}

_id_CB0D( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        var_0._id_D699 = self.origin;
        scripts\engine\utility::waitframe();
    }
}

bhg_destroyongameend()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    level scripts\engine\utility::waittill_any( "game_ended", "bro_shot_start" );
    thread bhg_destroy();
}

bhg_destroyonemp()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self waittill( "emp_damage", var_0, var_1, var_2, var_3, var_4 );

    if ( isdefined( var_3 ) && var_3 == "emp_grenade_mp" )
    {
        if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0 ) ) )
            var_0 scripts\mp\missions::_id_D991( "ch_tactical_emp_eqp" );
    }

    bhg_awardpoints( var_0 );
    var_5 = "";

    if ( scripts\mp\utility\game::istrue( self.hasruggedeqp ) )
        var_5 = "hitequip";

    if ( isplayer( var_0 ) )
        var_0 scripts\mp\damagefeedback::updatedamagefeedback( var_5 );

    thread bhg_destroy();
}

bhg_deleteondisowned( var_0 )
{
    self endon( "death" );
    var_0 scripts\engine\utility::waittill_any( "joined_team", "joined_spectators", "disconnect" );
    self delete();
}

_id_4108( var_0, var_1 )
{
    self endon( "death" );
    self notify( "cleanupOnParentDeath" );
    self endon( "cleanupOnParentDeath" );

    if ( isdefined( var_0 ) )
        var_0 waittill( "death" );

    if ( isdefined( var_1 ) )
        wait( var_1 );

    self delete();
}

_id_9FAF( var_0 )
{
    return isdefined( var_0._id_11AD2[self getentitynumber()] );
}

_id_11AD5( var_0 )
{
    var_0 endon( "death" );
    var_1 = self getentitynumber();
    var_0._id_11AD2[var_1] = self;
    _id_11AD6();
    var_0._id_11AD2[var_1] = undefined;
}

_id_11AD6()
{
    self endon( "death" );
    self endon( "disconnect" );
    wait 0.75;
}

bhg_addtoglobalarr()
{
    var_0 = self getentitynumber();

    if ( isdefined( level._id_2ABD[var_0] ) )
        return;

    level._id_2ABD[var_0] = self;
    thread bhg_removefromglobalarrondeath();
}

bhg_removefromglobalarr( var_0 )
{
    self notify( "blackHoleGrenade_removeFromGlobalArr" );

    if ( !isdefined( var_0 ) )
        var_0 = self getentitynumber();

    level._id_2ABD[var_0] = undefined;
}

bhg_removefromglobalarrondeath()
{
    self endon( "blackHoleGrenade_removeFromGlobalArr" );
    var_0 = self getentitynumber();
    self waittill( "death" );
    thread bhg_removefromglobalarr( var_0 );
}

bhg_trackimpulsefielddebuff( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2.players = [];
    bhg_trackimpulsefielddebuffend( var_0, var_1, var_2 );

    if ( isdefined( var_1 ) )
    {
        foreach ( var_4 in var_2.players )
        {
            if ( isdefined( var_4 ) && scripts\mp\utility\game::isreallyalive( var_4 ) )
                scripts\mp\gamescore::_id_12D6F( var_1, var_4, "blackhole_grenade_mp" );
        }
    }
}

bhg_trackimpulsefielddebuffend( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    var_1 endon( "disconnect" );

    for (;;)
    {
        var_3 = [];
        var_4 = undefined;

        if ( level.teambased )
            var_4 = scripts\mp\utility\game::_id_807C( var_0.origin, 256, scripts\mp\utility\game::_id_8027( var_1.team ), var_1 );
        else
            var_4 = scripts\mp\utility\game::_id_807C( var_0.origin, 256, undefined, var_1 );

        foreach ( var_6 in var_4 )
        {
            var_7 = var_6 getentitynumber();

            if ( !scripts\mp\utility\game::isreallyalive( var_6 ) )
            {
                var_2.players[var_7] = undefined;
                continue;
            }

            if ( isdefined( var_2.players[var_7] ) )
            {
                var_2.players[var_7] = undefined;
                var_3[var_7] = var_6;
                continue;
            }

            var_3[var_7] = var_6;
            scripts\mp\gamescore::_id_11ACE( var_1, var_6, "blackhole_grenade_mp" );
        }

        foreach ( var_6 in var_2.players )
        {
            if ( isdefined( var_6 ) && scripts\mp\utility\game::isreallyalive( var_6 ) )
                scripts\mp\gamescore::_id_12D6F( var_1, var_6, "blackhole_grenade_mp" );
        }

        var_2.players = var_3;
        scripts\engine\utility::waitframe();
    }
}

bhg_destroy()
{
    thread bhg_delete( 0.1 );
    self setscriptablepartstate( "beam", "neutral", 0 );
    self setscriptablepartstate( "destroy", "active", 0 );
}

bhg_delete( var_0 )
{
    self notify( "death" );
    self setcandamage( 0 );
    self._id_69BA = 1;
    wait 0.1;
    self delete();
}

bhg_awardpoints( var_0 )
{
    if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0 ) ) )
    {
        var_0 notify( "destroyed_equipment" );
        var_0 thread scripts\mp\utility\game::_id_83B4( "destroyed_equipment" );
    }
}

_id_7E08( var_0 )
{
    if ( scripts\mp\utility\game::istrue( var_0._id_9935 ) )
        return var_0.origin;

    if ( !isdefined( var_0.centeroffset ) )
    {
        var_1 = anglestoup( var_0.angles );
        var_2 = var_0.origin;
        var_3 = var_2 + var_1 * 55.0;
        var_4 = physics_createcontents( [ "physicscontents_solid", "physicscontents_glass", "physicscontents_sky", "physicscontents_water", "physicscontents_item" ] );
        var_5 = physics_raycast( var_2, var_3, var_4, [ self ], 0, "physicsquery_closest" );

        if ( isdefined( var_5 ) && var_5.size > 0 )
        {
            var_3 = var_5[0]["position"];
            var_0.centeroffset = max( 3, vectordot( var_1, var_3 - var_2 ) - 2 );
        }
        else
            var_0.centeroffset = 55.0;
    }

    return var_0.origin + anglestoup( var_0.angles ) * var_0.centeroffset;
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    groundpound_initimpactstructs();
}

_id_8659( var_0 )
{
    self _meth_8488( 1 );
    thread _id_8654();
    thread groundpound_monitoractivation();
}

_id_865A()
{
    self _meth_8488( 0 );

    if ( self._id_AE62 == "archetype_heavy" )
        self setscriptablepartstate( "groundPound", "neutral", 0 );

    self notify( "groundPound_unset" );
}

_id_8654()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "groundPound_unset" );

    for (;;)
    {
        self waittill( "groundPoundLand", var_0 );
        thread groundpound_impact( self, var_0 );
        scripts\mp\utility\game::_id_D915( "ground pound land", self );
    }
}

groundpound_monitoractivation()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "groundPound_unset" );

    for (;;)
    {
        self waittill( "groundPoundBegin" );
        thread groundpound_activate( self );
    }
}

groundpound_activate( var_0 )
{
    var_0 setscriptablepartstate( "groundPound", "activated" );
}

groundpound_impact( var_0, var_1 )
{
    var_0 setclientomnvar( "ui_hud_shake", 1 );
    var_0 setscriptablepartstate( "groundPound", "impact" );
    var_2 = groundpound_getbestimpactstruct( var_1 );

    if ( !isdefined( var_2 ) )
        return;

    var_3 = var_0.origin + ( 0, 0, 2 );
    thread groundpound_impactphysics( var_3, var_2.physicsradmin, var_2.physicsradmax, var_2.physicsscale );

    if ( isdefined( var_2._id_01F2 ) )
    {
        var_4 = spawn( "script_model", var_3 );
        var_4.angles = var_0.angles;
        var_4.owner = var_0;
        var_4._id_13C2E = "groundpound_mp";
        var_4.impactstruct = var_2;
        var_4._id_A63A = var_0;
        var_4 _meth_82DD( var_0 );
        var_4 _meth_831F( var_0 );
        var_4 setmodel( var_2._id_01F2 );

        if ( isdefined( var_2._id_022A ) && isdefined( var_2._id_10E2C ) )
            var_4 setscriptablepartstate( var_2._id_022A, var_2._id_10E2C );

        if ( isdefined( var_2.deletiondelay ) )
            wait( var_2.deletiondelay );
        else
            scripts\engine\utility::waitframe();

        var_4 delete();
    }
}

groundpound_impactphysics( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_1 ) || var_1 == 0 )
        return;

    if ( !isdefined( var_2 ) || var_2 == 0 )
        return;

    if ( !isdefined( var_3 ) || var_3 == 0 )
        return;

    wait 0.1;
    physicsexplosionsphere( var_0, var_2, var_1, var_3 );
}

groundpound_victimimpacteffects( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 == var_1 )
        return;

    if ( var_1 scripts\mp\utility\game::isusingremote() )
        return;

    if ( !isdefined( var_3 ) )
        return;

    var_4 = var_3.impactstruct;

    if ( !isdefined( var_4 ) )
        return;

    if ( !isdefined( var_4.shock ) || var_4.shock == "" )
        return;

    if ( !isdefined( var_4.shockduration ) || var_4.shockduration == 0 )
        return;

    var_1 shellshock( var_4.shock, var_4.shockduration );
}

_id_8653( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2 ) || var_2 != "groundpound_mp" )
        return var_4;

    if ( !isplayer( var_1 ) )
        return var_4;

    if ( !isdefined( var_0 ) )
        return var_4;

    if ( var_0 == var_1 )
        return 0;

    if ( !isdefined( var_3 ) )
        return var_4;

    var_5 = var_3.impactstruct;

    if ( !isdefined( var_5 ) )
        return var_4;

    var_6 = scripts\engine\utility::ter_op( level._id_8B38, var_5.innerradsqrhc, var_5.innerradsqr );
    var_7 = scripts\engine\utility::ter_op( level._id_8B38, var_5.innerdamagehc, var_5.innerdamage );
    var_8 = scripts\engine\utility::ter_op( level._id_8B38, var_5.outerdamagehc, var_5.outerdamage );
    var_9 = var_1 scripts\mp\utility\game::isinarbitraryup();
    var_10 = scripts\engine\utility::ter_op( var_9, self gettagorigin( "TAG_EYE", 1, 1 ), self gettagorigin( "TAG_EYE" ) );
    var_11 = abs( vectordot( var_10 - var_3.origin, ( 0, 0, 1 ) ) );
    var_12 = scripts\engine\utility::ter_op( var_9, self gettagorigin( "TAG_ORIGIN", 1, 1 ), self gettagorigin( "TAG_ORIGIN" ) );
    var_13 = abs( vectordot( var_12 - var_3.origin, ( 0, 0, 1 ) ) );

    if ( var_11 > var_5.maxzdelta && var_13 > var_5.maxzdelta )
        return 0;

    var_14 = var_6 != 0;

    if ( var_14 )
    {
        var_14 = var_6 < 0;

        if ( !var_14 )
        {
            if ( !var_14 )
            {
                var_15 = distancesquared( var_3.origin, var_1.origin );

                if ( var_15 <= var_6 )
                    var_14 = 1;
            }

            if ( !var_14 )
            {
                var_15 = distancesquared( var_3.origin, var_1 gettagorigin( "j_mainroot" ) );

                if ( var_15 <= var_6 )
                    var_14 = 1;
            }

            if ( !var_14 )
            {
                var_15 = distancesquared( var_3.origin, var_1 geteye() );

                if ( var_15 <= var_6 )
                    var_14 = 1;
            }
        }
    }

    if ( var_14 )
    {
        var_4 = scripts\engine\utility::ter_op( var_7 > 0, var_7, var_4 );

        if ( !var_1 isonground() )
            var_4 *= 1;

        return var_4;
    }

    var_4 = scripts\engine\utility::ter_op( var_8 > 0, var_8, var_4 );

    if ( !var_1 isonground() )
        var_4 *= 1;

    return var_4;
}

groundpound_modifiedblastshieldconst( var_0, var_1 )
{
    if ( level._id_8B38 )
    {
        if ( scripts\mp\utility\game::_id_821D( var_1 ) == "groundpound_mp" )
            var_0 = 0.65;
    }

    return var_0;
}

_id_8651( var_0 )
{
    return var_0 _meth_8499();
}

groundpound_initimpactstructs()
{
    var_0 = spawnstruct();
    var_0.impactstructs = [];
    var_1 = groundpound_createimpactstruct();
    var_0.impactstructs[var_0.impactstructs.size] = var_1;
    var_1 = groundpound_createimpactstruct();
    var_1._id_B783 = 150;
    var_1.innerradsqr = 5625;
    var_1.innerradsqr = 5625;
    var_1._id_10E2C = "impact2";
    var_1.physicsradmax = 150;
    var_1.physicsscale = 2.5;
    var_0.impactstructs[var_0.impactstructs.size] = var_1;
    var_1 = groundpound_createimpactstruct();
    var_1._id_B783 = 225;
    var_1.innerradsqr = -1;
    var_1.innerradsqrhc = -1;
    var_1._id_10E2C = "impact3";
    var_1.physicsradmax = 225;
    var_1.physicsscale = 3;
    var_0.impactstructs[var_0.impactstructs.size] = var_1;
    var_1 = groundpound_createimpactstruct();
    var_1._id_B783 = 325;
    var_1.innerradsqr = -1;
    var_1.innerradsqrhc = -1;
    var_1._id_10E2C = "impact4";
    var_1.physicsradmax = 275;
    var_1.physicsscale = 3.5;
    var_0.impactstructs[var_0.impactstructs.size] = var_1;
    var_1 = groundpound_createimpactstruct();
    var_1._id_B783 = 425;
    var_1.innerradsqr = -1;
    var_1.innerradsqrhc = -1;
    var_1._id_10E2C = "impact5";
    var_1.physicsradmax = 325;
    var_1.physicsscale = 4;
    var_0.impactstructs[var_0.impactstructs.size] = var_1;
    var_0.impactstructs = scripts\engine\utility::_id_22C3( var_0.impactstructs, ::groundpound_compareimpactstruct );
    level.groundpound = var_0;
}

groundpound_createimpactstruct()
{
    var_0 = spawnstruct();
    var_0._id_B783 = 48;
    var_0.maxzdelta = 125;
    var_0.innerradsqr = 0;
    var_0.innerradsqrhc = 0;
    var_0.innerdamage = 105;
    var_0.outerdamage = 55;
    var_0.innerdamagehc = 35;
    var_0.outerdamagehc = 20;
    var_0._id_01F2 = "perk_mp_groundPound_scr";
    var_0._id_022A = "effects";
    var_0._id_10E2C = "impact1";
    var_0.deletiondelay = 2;
    var_0.physicsradmin = 75;
    var_0.physicsradmax = 100;
    var_0.physicsscale = 2;
    var_0.shock = "concussion_grenade_mp";
    var_0.shockduration = 0.7;
    return var_0;
}

groundpound_compareimpactstruct( var_0, var_1 )
{
    return var_0._id_B783 > var_1._id_B783;
}

groundpound_getbestimpactstruct( var_0 )
{
    var_1 = undefined;

    foreach ( var_3 in level.groundpound.impactstructs )
    {
        if ( var_0 < var_3._id_B783 )
            continue;

        var_1 = var_3;
        break;
    }

    return var_1;
}

_id_8655( var_0, var_1, var_2, var_3 )
{

}

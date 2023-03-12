// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_10A34()
{
    level._effect["base_plasma_smoke"] = loadfx( "vfx/iw7/_requests/mp/vfx_plasma_smoke" );
    _id_0AE1::_id_DF06( "power_splashGrenade", [ "passive_smoke", "passive_increased_duration", "passive_increased_spread", "passive_increased_radius", "passive_increased_entities" ] );
}

_id_10A35( var_0 )
{
    var_0._id_85D5 = [];
    var_1 = _id_0AE1::_id_7FC2( "power_splashGrenade", 6 );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        var_3 = scripts\mp\utility\game::_id_1302( "globproj_mp", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        var_3.owner = self;
        var_3.team = self.team;
        var_3._id_13C2E = "globproj_mp";
        var_3.parentinflictor = var_0 getentitynumber();
        var_3 linkto( var_0, "", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        var_3 hide( 1 );
        var_0._id_85D5[var_0._id_85D5.size] = var_3;
        var_3 thread _id_85B4();
    }

    thread _id_85CE( var_0 );
    thread _id_85CD( var_0 );
    var_0 thread _id_85B4();
}

_id_85CD( var_0, var_1 )
{
    var_0 notify( "grenadeOnExplode" );
    var_0 endon( "grenadeOnExplode" );
    var_0 thread scripts\mp\utility\game::_id_C15A( "death", "end_explode" );
    var_0 endon( "end_explode" );
    var_2 = var_0.owner;
    var_3 = var_0._id_85D5;
    var_4 = var_0._id_D719;
    var_0 waittill( "explode", var_5 );

    if ( !isdefined( var_2 ) )
        return;

    _id_85B9( var_5, var_1, var_3, var_4 );
}

_id_85CE( var_0 )
{
    var_0 endon( "death" );
    var_0 waittill( "missile_stuck", var_1 );
    var_0 setscriptablepartstate( "beacon", "active", 0 );

    if ( isdefined( var_1 ) && isplayer( var_1 ) )
    {
        scripts\mp\weapons::_id_85DD( var_0, var_1 );

        foreach ( var_3 in var_0._id_85D5 )
            var_3._id_9F7D = var_0._id_9F7D;

        thread scripts\mp\missions::_id_D3A8( var_1, self );
    }
    else
        thread _id_85CD( var_0, var_0.angles );
}

_id_85B9( var_0, var_1, var_2, var_3 )
{
    var_4 = 0;
    var_5 = 0;
    var_6 = undefined;

    if ( isdefined( var_1 ) )
    {
        var_6 = anglestoup( var_1 );
        var_7 = vectordot( var_6, ( 0, 0, 1 ) );
        var_8 = acos( var_7 );
        var_4 = var_8 >= 45;
        var_5 = var_8 >= 145;
    }

    var_9 = undefined;
    var_10 = [];

    if ( level.teambased )
        var_9 = scripts\mp\utility\game::_id_81A0( scripts\mp\utility\game::_id_8027( self.team ) );
    else
        var_9 = level._id_3CB5;

    var_11 = physics_createcontents( [ "physicscontents_solid", "physicscontents_glass", "physicscontents_vehicleclip", "physicscontents_missileclip", "physicscontents_clipshot" ] );

    foreach ( var_13 in var_9 )
    {
        if ( !isdefined( var_13 ) || var_13 == self || !scripts\mp\utility\game::isreallyalive( var_13 ) )
            continue;

        var_14 = distancesquared( var_0, var_13.origin );

        if ( var_14 > 13225 || var_14 < 7225 )
            continue;

        var_15 = physics_raycast( var_0, var_13.origin, var_11, undefined, 0, "physicsquery_closest" );

        if ( !isdefined( var_15 ) || var_15.size > 0 )
            continue;

        var_10[var_10.size] = var_13;
    }

    if ( var_10.size > 0 )
        var_10 = scripts\engine\utility::_id_22A7( var_10 );

    var_17 = 0;
    var_18 = 0;
    var_19 = _id_0AE1::_id_7FC1( "power_splashGrenade", 1.5 );
    var_20 = ( 0, 0, 0 );
    var_21 = ( 0, 0, 0 );

    if ( var_4 || var_5 )
    {
        var_20 = var_6 * 115;
        var_21 = var_6 * 3;
    }

    var_22 = randomint( 46 );
    var_23 = 0;

    for ( var_24 = 0; var_24 < var_2.size; var_24++ )
    {
        var_25 = undefined;
        var_26 = randomint( 2 );

        if ( var_26 && var_17 < var_10.size )
        {
            var_27 = var_10[var_17].origin - var_0;
            var_27 = ( var_27[0], var_27[1], 0 );
            var_17++;
        }
        else if ( var_23 < 6 )
        {
            var_28 = var_22 + 72.0 * var_23;
            var_29 = 85 + randomint( 31 );

            if ( var_23 == 5 )
                var_29 = 0;

            var_27 = ( cos( var_28 ), sin( var_28 ), 0 ) * var_29 + var_20;
            var_23++;
        }
        else
        {
            var_30 = randomint( 360 );
            var_31 = 85 + randomint( 31 );
            var_27 = ( cos( var_30 ), sin( var_30 ), 0 ) * var_31 + var_20;
        }

        if ( !var_5 )
            var_27 += ( 0, 0, 200 + randomint( 200 ) );

        var_27 = _id_0AE1::_id_7FC7( "power_splashGrenade", var_27 );
        var_32 = var_0 + var_21;
        var_33 = var_2[var_24];
        var_33 show();
        var_33 unlink( 1 );
        var_33 = scripts\mp\utility\game::_id_1302( "globproj_mp", var_32, var_27, undefined, undefined, var_33 );
        var_33.owner = self;
        var_33.team = self.team;
        var_33._id_13C2E = "globproj_mp";

        if ( var_24 == 0 )
            var_33 setscriptablepartstate( "explosionLarge", "active" );

        var_33 setscriptablepartstate( "trail", "active" );
        thread _id_B79A( var_33, var_19 );
    }
}

_id_B79A( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 waittill( "missile_stuck", var_2 );
    var_3 = 3 + randomfloat( 0.15 );
    var_0 thread _id_85B4( var_1 + var_3 );
    var_0 setscriptablepartstate( "trail", "neutral" );
    var_0 setscriptablepartstate( "explosion", "active" );
    var_4 = _id_0AE1::_id_7FC4( "power_splashGrenade", 60 );
    var_5 = spawn( "trigger_rotatable_radius", var_0.origin, 0, var_4, 60 );
    var_5.angles = var_0.angles;
    var_5.owner = self;
    var_5 _meth_80D2();
    var_5 linkto( var_0 );
    var_5 hide();
    var_5._id_B799 = var_0;
    var_5 thread _id_13B91();
    var_6 = vectordot( anglestoup( var_5.angles ), ( 0, 0, 1 ) );

    if ( var_6 <= 0 )
    {
        var_0._id_D654 = "poolWall";
        var_0 setscriptablepartstate( "poolWall", "active" );
    }
    else
    {
        var_0._id_D654 = "poolGround";
        var_0 setscriptablepartstate( "poolGround", "active" );
    }

    wait( var_1 );
    var_0 notify( "extinguish" );
    var_0 setscriptablepartstate( var_0._id_D654, "activeEnd", 0 );
}

_id_85B4( var_0 )
{
    self endon( "death" );
    self notify( "grenadeCleanup" );
    self endon( "grenadeCleanup" );

    if ( isdefined( var_0 ) )
        self.owner scripts\engine\utility::_id_13737( var_0, "disconnect" );
    else
        self.owner waittill( "disconnect" );

    if ( isdefined( self ) )
        self delete();
}

_id_B24D( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_3 = self getentitynumber();
    self notify( "mainScriptableCleanup" + var_3 );
    self endon( "mainScriptableCleanup" + var_3 );

    if ( isdefined( var_1 ) )
        wait( var_1 );
    else
        var_0 waittill( "death" );

    if ( isdefined( var_2 ) )
        wait( var_2 );

    if ( isdefined( self ) )
        self delete();
}

_id_13B91()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    var_0 = self.owner;
    var_1 = var_0.team;

    if ( !isdefined( self._id_127C0 ) )
        self._id_127C0 = [];

    thread _id_13B93();
    thread _id_127B9();

    for (;;)
    {
        self waittill( "trigger", var_2 );

        if ( !isplayer( var_2 ) && !scripts\mp\utility\game::_id_9F22( var_2 ) )
            continue;

        if ( !scripts\mp\utility\game::isreallyalive( var_2 ) )
            continue;

        var_3 = scripts\engine\utility::ter_op( isdefined( var_2.owner ), var_2.owner, var_2 );

        if ( !level._id_740A && var_3 != var_0 && !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( var_3, var_0 ) ) )
            continue;

        thread scripts\mp\missions::_id_D3A8( var_2, var_0 );
        self._id_127C0[var_2 getentitynumber()] = var_2;
        var_2 _id_17B0( self._id_B799 );
    }
}

_id_13B93()
{
    self endon( "death" );
    self.owner endon( "disconnect" );

    for (;;)
    {
        foreach ( var_2, var_1 in self._id_127C0 )
        {
            if ( !isdefined( var_1 ) )
            {
                self._id_127C0[var_2] = undefined;
                continue;
            }

            if ( !scripts\mp\utility\game::isreallyalive( var_1 ) || !var_1 istouching( self ) )
            {
                self._id_127C0[var_2] = undefined;
                var_1 thread _id_E0DC( self._id_B799 );
            }
        }

        scripts\engine\utility::waitframe();
    }
}

_id_127B9()
{
    self endon( "death" );
    self._id_B799 endon( "death" );
    self._id_B799 waittill( "extinguish" );

    foreach ( var_1 in self._id_127C0 )
    {
        if ( isdefined( var_1 ) )
            var_1 thread _id_E0DC( self._id_B799 );
    }

    self delete();
}

_id_D51E( var_0, var_1 )
{
    var_2 = spawnfx( scripts\engine\utility::_id_7ECB( "base_plasma_smoke" ), var_0 );
    triggerfx( var_2 );
    wait( var_1 );
    var_2 delete();
}

_id_10D77()
{
    if ( isplayer( self ) )
        self setscriptablepartstate( "burning", "active", 0 );

    thread _id_139C0();
}

_id_6312()
{
    self notify( "endBurning" );
    self._id_3291 = undefined;

    if ( isplayer( self ) )
        self setscriptablepartstate( "burning", "neutral", 0 );
}

_id_139C0()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "endBurning" );
    thread _id_40E8();
    var_0 = self._id_3291;
    var_1 = 0;

    for (;;)
    {
        if ( _id_9D76() )
        {
            var_0._id_32A1 += 0.05;
            var_0._id_32A0 = 0;

            if ( var_1 <= 0 && var_0._id_32A4.size > 0 )
            {
                var_2 = var_0._id_32A4[0];
                var_3 = var_2.owner;
                var_4 = var_2._id_13C2E;
                var_5 = _id_7E11();
                self _meth_80B0( var_5, var_2.origin, var_3, var_2, "MOD_EXPLOSIVE", var_4 );
                var_1 = 0.25;
            }
            else
                var_1 -= 0.05;
        }
        else
        {
            var_0._id_32A0 += 0.05;

            if ( var_0._id_32A0 > 0.25 )
                thread _id_6312();
        }

        wait 0.05;
    }
}

_id_40E8()
{
    self endon( "endBurning" );
    self endon( "disconnect" );
    self waittill( "death" );
    thread _id_6312();
}

_id_17B0( var_0 )
{
    var_1 = self._id_3291;

    if ( !isdefined( var_1 ) )
    {
        var_1 = spawnstruct();
        var_1._id_32A4 = [];
        var_1._id_32A1 = 0;
        var_1._id_32A0 = 0;
        self._id_3291 = var_1;
    }

    var_2 = var_1._id_32A4.size;

    if ( !_id_8BD9( var_0 ) )
        var_1._id_32A4[var_2] = var_0;

    if ( var_2 == 0 )
        _id_10D77();
}

_id_E0DC( var_0 )
{
    if ( isdefined( self._id_3291 ) )
    {
        var_1 = self._id_3291;
        var_2 = [];

        for ( var_3 = 0; var_3 > var_1._id_32A4.size; var_3++ )
        {
            var_4 = var_1._id_32A4[var_3];

            if ( !isdefined( var_4 ) )
                continue;

            if ( var_4 == var_0 )
                continue;

            var_2[var_2.size] = var_4;
        }

        if ( var_2.size > 0 )
            var_1._id_32A4 = var_2;
        else
            _id_6312();
    }
}

_id_8BD9( var_0 )
{
    if ( isdefined( self._id_3291 ) )
    {
        var_1 = self._id_3291;

        foreach ( var_3 in var_1._id_32A4 )
        {
            if ( var_3 == var_0 )
                return 1;
        }
    }

    return 0;
}

_id_9D76()
{
    return isdefined( self._id_3291 ) && isdefined( self._id_3291._id_32A4 ) && self._id_3291._id_32A4.size > 0;
}

_id_7E11()
{
    var_0 = self._id_3291._id_32A1;
    var_1 = undefined;

    if ( var_0 > 1.0 )
        var_1 = 25;
    else if ( var_0 > 0.5 )
        var_1 = 25;
    else
        var_1 = 25;

    return var_1;
}

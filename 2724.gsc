// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_13A12()
{
    var_0 = scripts\engine\utility::_id_107E6();
    var_0 linkto( self );
    self._id_A63A = var_0;
    thread _id_A639( var_0 );
    thread scripts\mp\utility\game::_id_C15A( "death", "end_explode" );
    self endon( "end_explode" );
    var_1 = self.owner;
    self waittill( "explode", var_2 );
    thread _id_0118( var_2, 256, var_1, var_0 );
}

_id_C5CB( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_0 ) )
        return;
    else if ( var_2 == "MOD_IMPACT" )
        return;

    if ( issubstr( self._id_13C2E, "iw7_tacburst_mpl" ) )
        _id_20BF( var_0, var_4 );

    _id_20C3( var_0, var_4, var_1 );
}

_id_0118( var_0, var_1, var_2, var_3 )
{
    var_4 = "gltacburst";

    if ( issubstr( self._id_13C2E, "iw7_tacburst_mpl" ) )
        var_4 = "gltacburst_big";
    else if ( issubstr( self._id_13C2E, "iw7_tacburst_mpl_epic2" ) )
        var_4 = "gltacburst_regen";

    var_5 = scripts\mp\weapons::_id_7E8C( var_0, var_1, 0 );

    foreach ( var_7 in var_5 )
    {
        if ( !isdefined( var_7 ) )
            continue;

        if ( !scripts\mp\equipment\phase_shift::_id_213D( self, var_7 ) )
            continue;

        var_8 = scripts\engine\utility::ter_op( isdefined( var_7.owner ), var_7.owner, var_7 );

        if ( !scripts\mp\weapons::_id_7415( var_2, var_8 ) && var_8 != var_2 )
            continue;

        var_7 notify( "emp_damage", var_2, 3, var_0, var_4, "MOD_EXPLOSIVE" );
    }

    var_10 = scripts\mp\utility\game::_id_807C( var_0, var_1 );

    foreach ( var_12 in var_10 )
    {
        if ( !isdefined( var_12 ) )
            continue;

        if ( !scripts\mp\utility\game::isreallyalive( var_12 ) )
            continue;

        if ( !scripts\mp\equipment\phase_shift::_id_213D( var_12, self ) )
            continue;

        if ( var_12 != var_2 && scripts\mp\utility\game::_id_9E05( var_2.team, var_12 ) )
            continue;

        if ( !var_12 scripts\mp\killstreaks\emp_common::_id_FFC5() )
        {
            var_2 scripts\mp\damagefeedback::updatedamagefeedback( "hiticonempimmune", undefined, undefined, undefined, 1 );
            continue;
        }

        if ( scripts\mp\utility\game::istrue( var_12._id_9F72 ) )
            continue;

        var_12 _meth_80B0( 1, var_2.origin, var_2, var_3, "MOD_EXPLOSIVE", var_4 );
        var_12 scripts\mp\killstreaks\emp_common::_id_20C7( 3 );

        if ( var_4 == "gltacburst_big" )
            var_12 _id_20BF( self, var_2 );

        thread scripts\mp\gamescore::_id_11ACF( var_2, var_12, var_4, 3 );
    }
}

_id_20C3( var_0, var_1, var_2 )
{
    if ( !scripts\mp\killstreaks\emp_common::_id_FFC5() )
    {
        if ( var_1 != self )
            var_1 scripts\mp\damagefeedback::updatedamagefeedback( "hiticonempimmune", undefined, undefined, undefined, 1 );

        return;
    }

    var_3 = 3;

    if ( self == var_1 )
        var_3 = 1;

    scripts\mp\killstreaks\emp_common::_id_20C7( var_3 );
    thread scripts\mp\gamescore::_id_11ACF( var_1, self, scripts\engine\utility::ter_op( issubstr( var_2, "iw7_tacburst_mpl" ), "gltacburst_big", "gltacburst" ), var_3 );
}

_id_20BF( var_0, var_1 )
{
    var_2 = 2;
    var_3 = 4;

    if ( self == var_1 )
    {
        var_2 = 0.75;
        var_3 = 1.5;
    }

    var_4 = 1 - distance( self.origin, var_0.origin ) / 256;

    if ( var_4 < 0 )
        var_4 = 0;

    var_5 = var_2 + var_3 * var_4;
    var_5 = scripts\mp\perks\perkfunctions::_id_20E0( var_1, self, var_5 );
    thread scripts\mp\gamescore::_id_11ACF( var_1, self, "gltacburst_big", var_5 );
    var_1 notify( "stun_hit" );
    self notify( "concussed", var_1 );
    scripts\mp\weapons::_id_F7FC();
    thread scripts\mp\weapons::_id_40EA( var_5 );
    self shellshock( "concussion_grenade_mp", var_5 );
    self._id_44ED = gettime() + var_5 * 1000;
}

_id_61B2( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "emp_rumble_loop" );
    self notify( "emp_rumble_loop" );
    var_1 = gettime() + var_0 * 1000;

    while ( gettime() < var_1 )
    {
        self playrumbleonentity( "damage_light" );
        wait 0.05;
    }
}

_id_A639( var_0 )
{
    var_0 endon( "death" );
    self waittill( "death" );
    wait 5;
    var_0 delete();
}

_id_B92C( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) || !isdefined( var_4 ) || !isdefined( var_1 ) || !isdefined( var_2 ) )
        return var_0;

    if ( var_4 != "gltacburst" )
        return var_0;

    if ( var_1 != var_2 )
        return var_0;

    if ( distancesquared( var_2.origin, var_3.origin ) <= 16384 )
        return var_0;

    return 0;
}

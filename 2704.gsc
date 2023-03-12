// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_3258()
{
    level._id_3257 = [];
    level._id_3257["bubble"] = spawnstruct();
    level._id_3257["bubble"]._id_49B3 = ::_id_498C;
    level._id_3257["bubble"]._id_741D = "prop_mp_bulletstorm";
    level._id_3257["bubble"]._id_6564 = "prop_mp_bulletstorm_enemy";
    level._id_3257["section"] = spawnstruct();
    level._id_3257["section"]._id_49B3 = ::_id_4A0F;
    level._id_3257["section"]._id_741D = "prop_mp_bulletstorm_v3";
    level._id_3257["section"]._id_6564 = "prop_mp_bulletstorm_v3_enemy";
}

_id_10D76( var_0 )
{
    self._id_D782["power_bulletstorm"]._id_0019 = 1;
    scripts\engine\utility::_id_1C76( 0 );
    self _meth_800A( 0 );
    self _meth_8010( 0 );
    self _meth_8422( 0 );
    self _meth_800E( 0 );
    self._id_3253 = spawnstruct();
    self._id_3253._id_4C15 = self getcurrentweapon();
    self._id_3253._id_DF66 = self getweaponammoclip( self._id_3253._id_4C15 );
    self._id_3253._id_DF67 = self getweaponammostock( self._id_3253._id_4C15 );
    scripts\mp\utility\game::_id_141E( self._id_3253._id_4C15 );
    var_1 = _id_811B( 1 );
    var_2 = self [[ level._id_3257[var_1]._id_49B3 ]]( var_0 );
    thread _id_139BF( var_1, var_2 );
    thread _id_139BC();
    self._id_FC99 = 1;
}

_id_139BF( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
}

_id_139BC()
{
    level endon( "game_ended" );
    scripts\engine\utility::waittill_any( "death", "disconnect" );
    self._id_FC99 = undefined;
    self._id_3255 = undefined;
    self._id_3254 = undefined;
    self._id_3256 = undefined;
}

_id_811B( var_0 )
{
    var_1 = undefined;

    switch ( var_0 )
    {
        case 1:
            var_1 = "bubble";
            break;
        case 2:
            var_1 = "section";
            break;
    }

    return var_1;
}

_id_498C( var_0 )
{
    var_1 = self.origin;
    var_2 = spawn( "script_model", var_1 );
    var_2 setmodel( level._id_3257["bubble"]._id_741D );
    var_2.health = 999999;
    var_2._id_AC75 = 4;
    var_2._id_E749 = 720;
    var_2._id_11A33 = 0;
    var_2._id_4D63 = 250;
    var_2._id_28AF = "bulletstorm_device_mp";
    var_2 setcandamage( 1 );
    var_2 hide();
    var_2._id_249C = [];

    if ( isdefined( self._id_3255 ) )
        var_2._id_AC75 = self._id_3255;

    if ( isdefined( self._id_3254 ) )
        var_2.health = self._id_3254;

    if ( isdefined( self._id_3256 ) )
        var_2._id_E749 = self._id_3256;

    var_3 = spawn( "script_model", var_2.origin + ( 0, 0, 10 ) );
    var_3 setmodel( "tag_origin" );
    var_3 thread _id_BD2E( self );
    var_3 thread _id_13B3A( var_2 );
    var_4 = spawn( "script_model", var_1 );
    var_4 setmodel( level._id_3257["bubble"]._id_6564 );
    var_4 hide();
    var_4 thread _id_BD2E( self );
    var_4 thread _id_13B3A( var_2 );
    var_2 thread _id_BD2E( self );
    var_2 thread _id_3259( self, var_3, var_4 );
    _id_10112( self, var_2, var_4 );
    return var_2;
}

_id_4A0F()
{
    var_0 = self gettagorigin( "j_mainroot" );
    var_1 = spawn( "script_model", var_0 );
    var_1 setmodel( "tag_origin" );
    var_1 thread _id_BD2E( self );
    return var_1;
}

_id_24AA( var_0, var_1 )
{
    var_2[0] = ( 50, 0, 10 );
    var_2[1] = ( 0, 50, 10 );
    var_2[2] = ( -50, 0, 10 );
    var_2[3] = ( 0, -50, 10 );
    var_3 = 4;

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        var_5 = spawn( "script_model", self.origin + ( 0, 0, 50 ) );
        var_5 setmodel( level._id_3257["section"]._id_741D );
        var_5 linkto( self, "tag_origin", var_2[var_4], ( 0, 90 * ( var_4 + 1 ), 0 ) );
        var_5 thread _id_13B3A( var_1 );
    }
}

_id_BD2E( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    self endon( "shield_lifetime_hit" );

    for (;;)
    {
        scripts\engine\utility::waitframe();

        if ( isdefined( self ) )
            self.origin = var_0.origin;
    }
}

_id_3259( var_0, var_1, var_2 )
{
    self endon( "stop_bulletstorm" );
    thread _id_139B8( var_0 );
    thread _id_13B61( var_0 );
    thread _id_139BA( var_0 );
    thread _id_139BE( var_0 );
    var_3 = "hitbulletstorm";
    thread _id_10A10( self._id_E749, 4, 1, 1 );
    var_1 thread _id_10A10( self._id_E749, 4, 1, 1 );
    var_2 thread _id_10A10( self._id_E749, 4, 1, 1 );

    for (;;)
    {
        self waittill( "damage", var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13 );
        playfx( scripts\engine\utility::_id_7ECB( "bulletstorm_shield_hit" ), var_7 );
        playloopsound( var_7, "bs_shield_impact" );
        var_5 scripts\mp\damagefeedback::updatedamagefeedback( var_3 );
    }
}

_id_10112( var_0, var_1, var_2 )
{
    foreach ( var_4 in level.players )
    {
        if ( !isdefined( var_4 ) )
            continue;

        if ( !scripts\mp\equipment\phase_shift::_id_9DDF( var_4 ) )
            var_4 _id_12E6B( var_0.team, var_1, var_2 );
    }
}

_id_12E6B( var_0, var_1, var_2 )
{
    var_3 = undefined;

    if ( self.team == var_0 )
        var_3 = var_1;
    else
        var_3 = var_2;

    if ( isdefined( var_3 ) )
    {
        var_3 _meth_8388( self );
        thread _id_139BD( var_0, var_3, var_1, var_2 );
        thread _id_139BB( var_0, var_3, var_1, var_2 );
    }
}

_id_139BD( var_0, var_1, var_2, var_3 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_1 endon( "death" );
    self waittill( "joined_team" );
    var_1 _meth_8429( self );
    scripts\engine\utility::waitframe();
    _id_12E6B( var_0, var_2, var_3 );
}

_id_139BB( var_0, var_1, var_2, var_3 )
{

}

_id_139B8( var_0 )
{
    self endon( "stop_bulletstorm" );
    var_0 scripts\engine\utility::waittill_any( "death", "disconnect" );
    self notify( "stop_bulletstorm", 1 );
}

_id_13B61( var_0 )
{
    self waittill( "stop_bulletstorm", var_1 );

    if ( isdefined( var_0 ) )
    {
        var_2 = var_0 gettagorigin( "j_mainroot" );
        _id_10D75( var_0, self._id_11A33, var_2, self._id_4D63 );
        var_0._id_FC99 = undefined;
        var_0 setclientomnvar( "ui_bulletstorm_update", -1 );
        var_0._id_3255 = undefined;
        var_0._id_3254 = undefined;
        var_0._id_3256 = undefined;
        var_0._id_D782["power_bulletstorm"]._id_0019 = 0;
        var_3 = -1;

        if ( var_1 )
            var_3 = 0;

        var_0 notify( "powers_bulletstorm_update", var_3 );
        var_0 scripts\engine\utility::_id_1C76( 1 );
        var_0 _meth_800A( 1 );
        var_0 _meth_8010( 1 );
        var_0 _meth_8422( 1 );
        var_0 _meth_800E( 1 );
        var_4 = var_0._id_3253._id_4C15;
        var_5 = var_0._id_3253._id_DF66;
        var_6 = var_0._id_3253._id_DF67;
        var_0 giveweapon( var_4, 0, 0, 0, 1 );
        var_0 setweaponammoclip( var_4, var_5 );
        var_0 setweaponammostock( var_4, var_6 );
        var_0 scripts\mp\utility\game::_id_141B( var_4 );
    }

    self delete();
}

_id_139BE( var_0 )
{
    self endon( "stop_bulletstorm" );

    for (;;)
    {
        var_0 waittill( "multi_use_activated", var_1 );

        if ( var_1 == "power_bulletstorm" )
            self notify( "stop_bulletstorm", 1 );
    }
}

_id_139BA( var_0 )
{
    self endon( "stop_bulletstorm" );
    var_1 = 0.25;

    for (;;)
    {
        if ( self._id_AC75 >= 1 )
            var_0 setclientomnvar( "ui_bulletstorm_update", int( self._id_AC75 ) );
        else
            break;

        wait 0.05;

        if ( self._id_AC75 > 1 )
        {
            self._id_AC75 -= 0.05;
            self notify( "powers_bulletstorm_update", self._id_AC75 * var_1 );
        }
    }

    self notify( "shield_lifetime_hit" );
    self notify( "stop_bulletstorm", 1 );
}

_id_10D75( var_0, var_1, var_2, var_3 )
{
    if ( var_1 > 0 )
    {
        var_4 = getdvarint( "scr_bulletstorm_explosion", 1 );
        playfx( scripts\engine\utility::_id_7ECB( "bulletstorm_explode" ), var_2 );
        playfx( scripts\engine\utility::_id_7ECB( "bulletstorm_explode2" ), var_2 );

        if ( var_4 == 1 )
        {
            var_0 playlocalsound( "bs_shield_explo" );
            var_0 playsound( "bs_shield_explo_npc" );
        }
        else
        {
            var_0 playlocalsound( "bs_shield_explo" );
            var_0 playsound( "bs_shield_explo_npc" );
        }

        var_0 thread scripts\mp\shellshock::_id_858A( undefined, 0 );
        var_1 = int( clamp( var_1, 20, 150 ) );
        var_3 = int( clamp( var_3, 50, 250 ) );

        foreach ( var_6 in level.players )
        {
            if ( var_6 == var_0 )
                continue;

            if ( var_6.team == var_0.team )
                continue;

            var_7 = _id_811A( var_4, var_2, var_3, var_0, var_6, var_1 );

            if ( var_7._id_38BF )
            {
                if ( var_4 == 1 )
                {
                    if ( var_7._id_4D70 >= var_6.health )
                        var_6._id_4C87 = 1;

                    var_6 _meth_80B0( var_7._id_4D70, var_2, var_0, self, "MOD_EXPLOSIVE" );
                    var_6 thread _id_139B9( var_2, var_3, 1.0 );
                    continue;
                }

                var_0 notify( "stun_hit" );
                var_6 notify( "concussed", var_0 );
                var_6 shellshock( "concussion_grenade_mp", var_7._id_5FE9 );
                var_6._id_44ED = gettime() + var_7._id_5FE9 * 1000;
                var_0 thread scripts\mp\damagefeedback::updatedamagefeedback( "stun" );
            }
        }
    }
}

_id_13B3A( var_0 )
{
    level endon( "game_ended" );
    var_0 waittill( "stop_bulletstorm" );

    if ( isdefined( self ) )
        self delete();
}

_id_10A10( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );

    if ( isdefined( self ) )
        self _meth_8271( var_0, var_1, var_2, var_3 );

    wait( var_1 );
    thread _id_10A10( var_0, var_1, var_2, var_3, var_4 );
}

_id_5116( var_0, var_1, var_2, var_3 )
{
    level endon( "game_ended" );
    wait( var_0 );
    physicsexplosionsphere( var_1, var_2, var_2, var_3 );
}

_id_139B9( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self waittill( "start_instant_ragdoll", var_3, var_4 );
    scripts\engine\utility::waitframe();
    physicsexplosionsphere( var_0, var_1 + 40, var_1 + 20, var_2 );
}

_id_5105( var_0, var_1 )
{
    level endon( "game_ended" );
    wait( var_0 );

    if ( isdefined( var_1 ) )
        var_1 delete();
}

_id_811A( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = spawnstruct();
    var_6._id_38BF = 0;
    var_6._id_4D70 = 0;
    var_6._id_5FE9 = 0;
    var_7 = distance( var_1, var_4.origin );

    if ( var_7 <= var_2 )
    {
        if ( var_7 <= 50 )
            var_6._id_38BF = 1;
        else
        {
            var_8 = [];
            var_8[var_8.size] = "physicscontents_solid";
            var_8[var_8.size] = "physicscontents_glass";
            var_8[var_8.size] = "physicscontents_vehicle";
            var_9 = physics_createcontents( var_8 );
            var_10 = [];
            var_11 = physics_raycast( var_1, var_4.origin, var_9, var_10, 0, "physicsquery_any" );

            if ( !var_11 )
                var_6._id_38BF = 1;
        }

        if ( var_6._id_38BF )
        {
            if ( var_0 == 1 )
                var_6._id_4D70 = var_5 - var_5 / ( var_2 / var_7 );
            else
            {
                var_12 = 1 - var_7 / var_2;

                if ( var_12 < 0 )
                    var_12 = 0;

                var_13 = 2 + 4 * var_12;
                var_6._id_5FE9 = scripts\mp\perks\perkfunctions::_id_20E0( var_3, var_4, var_13 );
            }
        }
    }

    return var_6;
}

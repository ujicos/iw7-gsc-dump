// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_DCED( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = scripts\engine\utility::ter_op( isdefined( var_3 ), var_3, _id_48CC() );
    var_7 = scripts\engine\utility::ter_op( isdefined( var_5 ), var_5, 0 );
    var_8 = physics_raycast( var_0, var_1, var_6, var_2, 0, "physicsquery_closest", var_7 );

    if ( var_8.size )
        var_8 = var_8[0];
    else
        var_8 = _id_9A81( var_1 );

    if ( isdefined( var_4 ) && var_4 )
        var_8 = _id_45F5( var_8 );

    return var_8;
}

_id_DCEE( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = scripts\engine\utility::ter_op( isdefined( var_3 ), var_3, _id_48CC() );
    var_7 = scripts\engine\utility::ter_op( isdefined( var_5 ), var_5, 0 );
    var_8 = physics_raycast( var_0, var_1, var_6, var_2, 1, "physicsquery_closest", var_7 );

    if ( var_8.size )
        var_8 = var_8[0];
    else
        var_8 = _id_9A81( var_1 );

    if ( isdefined( var_4 ) && var_4 )
        var_8 = _id_45F5( var_8 );

    return var_8;
}

_id_DCF0( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = scripts\engine\utility::ter_op( isdefined( var_3 ), var_3, _id_48CC() );
    var_6 = physics_raycast( var_0, var_1, var_5, var_2, 0, "physicsquery_all" );

    if ( isdefined( var_4 ) && var_4 )
    {
        foreach ( var_8 in var_6 )
            var_8 = _id_45F5( var_8 );
    }

    return var_6;
}

_id_DCF1( var_0, var_1, var_2, var_3 )
{
    var_4 = scripts\engine\utility::ter_op( isdefined( var_3 ), var_3, _id_48CC() );
    return !physics_raycast( var_0, var_1, var_4, var_2, 0, "physicsquery_any" );
}

_id_DCEF( var_0, var_1, var_2, var_3 )
{
    var_4 = scripts\engine\utility::ter_op( isdefined( var_3 ), var_3, _id_48CC() );
    return !physics_raycast( var_0, var_1, var_4, var_2, 1, "physicsquery_any" );
}

sphere_trace( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_48CC() );
    var_7 = physics_spherecast( var_0, var_1, var_2, var_6, var_3, "physicsquery_closest" );

    if ( var_7.size )
        var_7 = var_7[0];
    else
        var_7 = _id_9A81( var_1 );

    if ( isdefined( var_5 ) && var_5 )
        var_7 = _id_45F5( var_7 );

    return var_7;
}

_id_109DE( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_48CC() );
    var_7 = physics_spherecast( var_0, var_1, var_2, var_6, var_3, "physicsquery_all" );

    if ( isdefined( var_5 ) && var_5 )
    {
        foreach ( var_9 in var_7 )
            var_9 = _id_45F5( var_9 );
    }

    return var_7;
}

_id_109DF( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_48CC() );
    return !physics_spherecast( var_0, var_1, var_2, var_5, var_3, "physicsquery_any" );
}

_id_109DC( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_48CC() );
    var_7 = physics_getclosestpointtosphere( var_0, var_1, var_2, var_6, var_3, "physicsquery_closest" );

    if ( var_7.size )
        var_7 = var_7[0];
    else
        var_7 = _id_9A81( var_0 );

    if ( isdefined( var_5 ) && var_5 )
        var_7 = _id_45F5( var_7 );

    return var_7;
}

_id_3A09( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !isdefined( var_4 ) )
        var_4 = ( 0, 0, 0 );

    var_8 = scripts\engine\utility::ter_op( isdefined( var_6 ), var_6, _id_48CC() );
    var_9 = _id_45EC( var_0, var_1, var_2, var_3, var_4 );
    var_10 = physics_capsulecast( var_9["trace_start"], var_9["trace_end"], var_2, var_9["half_height"], var_4, var_8, var_5, "physicsquery_closest" );

    if ( var_10.size )
        var_10 = var_10[0];
    else
        var_10 = _id_9A81( var_1 );

    if ( isdefined( var_7 ) && var_7 )
        var_10 = _id_45F5( var_10 );

    return var_10;
}

_id_3A0A( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !isdefined( var_4 ) )
        var_4 = ( 0, 0, 0 );

    var_8 = scripts\engine\utility::ter_op( isdefined( var_6 ), var_6, _id_48CC() );
    var_9 = _id_45EC( var_0, var_1, var_2, var_3, var_4 );
    var_10 = physics_capsulecast( var_9["trace_start"], var_9["trace_end"], var_2, var_9["half_height"], var_4, var_8, var_5, "physicsquery_all" );

    if ( isdefined( var_7 ) && var_7 )
    {
        foreach ( var_12 in var_10 )
            var_12 = _id_45F5( var_12 );
    }

    return var_10;
}

_id_3A0B( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_4 ) )
        var_4 = ( 0, 0, 0 );

    var_7 = scripts\engine\utility::ter_op( isdefined( var_6 ), var_6, _id_48CC() );
    var_8 = _id_45EC( var_0, var_1, var_2, var_3, var_4 );
    return !physics_capsulecast( var_8["trace_start"], var_8["trace_end"], var_2, var_8["half_height"], var_4, var_7, var_5, "physicsquery_any" );
}

_id_3A08( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( !isdefined( var_3 ) )
        var_3 = ( 0, 0, 0 );

    var_8 = scripts\engine\utility::ter_op( isdefined( var_6 ), var_6, _id_48CC() );
    var_9 = _id_45EC( var_0, undefined, var_1, var_2, var_3 );
    var_10 = physics_getclosestpointtocapsule( var_9["trace_start"], var_1, var_9["half_height"], var_3, var_4, var_8, var_5, "physicsquery_closest" );

    if ( var_10.size )
        var_10 = var_10[0];
    else
        var_10 = _id_9A81( var_0 );

    if ( isdefined( var_7 ) && var_7 )
        var_10 = _id_45F5( var_10 );

    return var_10;
}

_id_D305( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isplayer( self ) )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = self getplayerangles();

    var_7 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_48CC() );

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    var_8 = physics_charactercast( var_0, var_1, self, var_6, var_2, var_7, var_3, "physicsquery_closest" );

    if ( var_8.size )
        var_8 = var_8[0];
    else
        var_8 = _id_9A81( var_1 );

    if ( isdefined( var_5 ) && var_5 )
        var_8 = _id_45F5( var_8 );

    return var_8;
}

_id_D306( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isplayer( self ) )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = self getplayerangles();

    var_7 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_48CC() );

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    var_8 = physics_charactercast( var_0, var_1, self, var_6, var_2, var_7, var_3, "physicsquery_all" );

    if ( isdefined( var_5 ) && var_5 )
    {
        foreach ( var_10 in var_8 )
            var_10 = _id_45F5( var_10 );
    }

    return var_8;
}

_id_D307( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isplayer( self ) )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = self getplayerangles();

    var_6 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_48CC() );

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    return !physics_charactercast( var_0, var_1, self, var_5, var_2, var_6, var_3, "physicsquery_any" );
}

_id_D096( var_0, var_1, var_2, var_3 )
{
    return _id_D095( self.origin, self.angles, var_0, var_1, var_2, var_3 );
}

_id_D095( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isplayer( self ) )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = self getplayerangles();

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( isarray( var_3 ) )
        var_3 = scripts\engine\utility::_id_2279( var_3, self );
    else
        var_3 = self;

    var_6 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_48CC() );
    var_7 = physics_getclosestpointtocharacter( var_0, self, 0, var_1, var_2, var_6, var_3, "physicsquery_closest" );

    if ( var_7.size )
        var_7 = var_7[0];
    else
        var_7 = _id_9A81( var_0 );

    if ( isdefined( var_5 ) && var_5 )
        var_7 = _id_45F5( var_7 );

    return var_7;
}

_id_19F2( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isai( self ) )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = self.angles;

    var_7 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_48CC() );

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    var_8 = physics_charactercast( var_0, var_1, self, var_6, var_2, var_7, var_3, "physicsquery_closest" );

    if ( var_8.size )
        var_8 = var_8[0];
    else
        var_8 = _id_9A81( var_1 );

    if ( isdefined( var_5 ) && var_5 )
        var_8 = _id_45F5( var_8 );

    return var_8;
}

_id_19F3( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isai( self ) )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = self.angles;

    var_7 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_48CC() );

    if ( !isdefined( var_6 ) )
        var_6 = 0;

    var_8 = physics_charactercast( var_0, var_1, self, var_6, var_2, var_7, var_3, "physicsquery_all" );

    if ( isdefined( var_5 ) && var_5 )
    {
        foreach ( var_10 in var_8 )
            var_10 = _id_45F5( var_10 );
    }

    return var_8;
}

_id_19F4( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isai( self ) )
        return;

    if ( !isdefined( var_2 ) )
        var_2 = self.angles;

    var_6 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_48CC() );

    if ( !isdefined( var_5 ) )
        var_5 = 0;

    return !physics_charactercast( var_0, var_1, self, var_5, var_2, var_6, var_3, "physicsquery_any" );
}

_id_196D( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isai( self ) )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = self.angles;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_6 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, _id_48CC() );
    var_7 = physics_getclosestpointtocharacter( var_0, self, var_1, var_2, var_6, var_3, "physicsquery_closest" );

    if ( var_7.size )
        var_7 = var_7[0];
    else
        var_7 = _id_9A81( var_0 );

    if ( isdefined( var_5 ) && var_5 )
        var_7 = _id_45F5( var_7 );

    return var_7;
}

_id_4956( var_0 )
{
    var_1 = [ "physicscontents_solid", "physicscontents_monsterclip", "physicscontents_aiavoid", "physicscontents_glass", "physicscontents_vehicle" ];

    if ( !isdefined( var_0 ) || !var_0 )
        var_1 = scripts\engine\utility::_id_2279( var_1, "physicscontents_player" );

    return physics_createcontents( var_1 );
}

_id_497D()
{
    var_0 = [ "physicscontents_solid", "physicscontents_water", "physicscontents_sky" ];
    return physics_createcontents( var_0 );
}

_id_48F5()
{
    var_0 = [ "physicscontents_glass" ];
    return physics_createcontents( var_0 );
}

_id_4909()
{
    var_0 = [ "physicscontents_item" ];
    return physics_createcontents( var_0 );
}

_id_4972()
{
    var_0 = [ "physicscontents_vehicle" ];
    return physics_createcontents( var_0 );
}

_id_4950()
{
    var_0 = [ "physicscontents_clipshot", "physicscontents_corpseclipshot", "physicscontents_missileclip" ];
    return physics_createcontents( var_0 );
}

_id_493E()
{
    var_0 = [ "physicscontents_playerclip" ];
    return physics_createcontents( var_0 );
}

_id_48B1()
{
    var_0 = [ "physicscontents_player", "physicscontents_actor" ];
    return physics_createcontents( var_0 );
}

_id_48CC( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    return _id_48BC( !var_0, 1, 1, 1, 0, 1 );
}

_id_48BC( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = 0;

    if ( isdefined( var_0 ) && var_0 )
        var_7 += _id_48B1();

    if ( isdefined( var_1 ) && var_1 )
        var_7 += _id_497D();

    if ( isdefined( var_2 ) && var_2 )
        var_7 += _id_48F5();

    if ( isdefined( var_3 ) && var_3 )
        var_7 += _id_4950();

    if ( isdefined( var_4 ) && var_4 )
        var_7 += _id_4909();

    if ( isdefined( var_5 ) && var_5 )
        var_7 += _id_4972();

    if ( isdefined( var_6 ) && var_6 )
        var_7 += _id_493E();

    return var_7;
}

_id_489A()
{
    var_0 = [ "physicscontents_solid", "physicscontents_foliage", "physicscontents_aiavoid", "physicscontents_vehicletrigger", "physicscontents_glass", "physicscontents_water", "physicscontents_canshootclip", "physicscontents_missileclip", "physicscontents_item", "physicscontents_vehicleclip", "physicscontents_itemclip", "physicscontents_sky", "physicscontents_ainosight", "physicscontents_clipshot", "physicscontents_actor", "physicscontents_corpseclipshot", "physicscontents_playerclip", "physicscontents_monsterclip", "physicscontents_sentienttrigger", "physicscontents_teamtrigger", "physicscontents_use", "physicscontents_nonsentienttrigger", "physicscontents_vehicle", "physicscontents_mantle", "physicscontents_player", "physicscontents_corpse", "physicscontents_detail", "physicscontents_structural", "physicscontents_translucent", "physicscontents_playertrigger", "physicscontents_nodrop" ];
    return physics_createcontents( var_0 );
}

_id_45F5( var_0 )
{
    var_1 = _func_290( var_0["surfaceflags"] );
    var_0["surfaceindex"] = var_1["index"];
    var_0["surfacetype"] = var_1["name"];
    return var_0;
}

_id_45EC( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = ( 0, 0, 0 );

    var_5 = var_3 * 0.5;
    var_6 = anglestoforward( var_4 );
    var_7 = anglestoup( var_4 );
    var_8 = [];
    var_8["trace_start"] = var_0 + var_7 * var_5;

    if ( isdefined( var_1 ) )
        var_8["trace_end"] = var_1 + var_7 * var_5;

    var_8["radius"] = var_2;
    var_8["angles"] = var_4;
    var_8["half_height"] = var_5;
    return var_8;
}

_id_5B66( var_0, var_1, var_2, var_3 )
{

}

_id_5B67( var_0, var_1, var_2, var_3, var_4 )
{

}

_id_5B68( var_0, var_1, var_2 )
{

}

_id_9A81( var_0 )
{
    var_1 = [];
    var_1["fraction"] = 1;
    var_1["surfaceflags"] = 0;
    var_1["distance"] = 0;
    var_1["position"] = var_0;
    var_1["shape_position"] = var_0;
    var_1["normal"] = ( 0, 0, 0 );
    var_1["contact_normal"] = ( 0, 0, 0 );
    var_1["hittype"] = "hittype_none";
    return var_1;
}

_id_9A80( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{

}

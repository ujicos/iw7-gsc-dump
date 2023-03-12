// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_FC58()
{
    level._effect["shard_ball_rocket_trail"] = loadfx( "vfx/iw7/_requests/mp/vfx_shard_ball_launch_trail.vfx" );
    level._effect["shard_ball_explosion_shards"] = loadfx( "vfx/iw7/_requests/mp/vfx_shard_ball_proj_exp.vfx" );
    level._effect["shard_ball_explosion_rocket"] = loadfx( "vfx/iw7/_requests/mp/vfx_shard_ball_launch_exp.vfx" );
    _id_0AE1::_id_DF06( "power_shardBall", [ "passive_increased_radius", "passive_increased_entities", "passive_grenade_to_mine" ] );
}

_id_FC5A()
{
    scripts\mp\weapons::_id_B2A3();
    self.owner _id_FC5B( self, 1 );
    self notify( "detonateExplosive", self.owner );
}

_id_FC59()
{

}

_id_FC5B( var_0, var_1 )
{
    self notify( "powers_shardBall_used", 1 );

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_0 endon( "death" );

    if ( !isalive( self ) )
    {
        var_0 delete();
        return;
    }

    if ( !isdefined( var_0 ) )
        return;

    if ( !var_1 )
    {
        var_0 waittill( "missile_stuck", var_2 );

        if ( isplayer( var_2 ) || isagent( var_2 ) )
            scripts\mp\weapons::_id_85DD( var_0, var_2 );
    }

    var_0 thread scripts\mp\shellshock::_id_858A();
    var_0 scripts\mp\weapons::_id_69FF( undefined );
    var_0 thread _id_13B39();
}

_id_13B39()
{
    var_0 = self._id_11180;
    var_1 = self.owner;
    var_2 = self.owner.team;
    var_3 = self._id_13C2E;
    var_4 = _id_7EA7();
    self waittill( "explode", var_5 );

    if ( !isdefined( var_1 ) )
        return;

    playloopsound( var_5, "frag_grenade_explode" );
    thread _id_13B34( var_4, var_1 );
    self notify( "start_secondary_explosion", var_5 );
}

_id_7EA7()
{
    var_0 = self.angles;

    if ( isdefined( self._id_11180 ) )
        var_0 = self._id_11180.angles;

    return var_0;
}

_id_7EA8( var_0, var_1, var_2, var_3 )
{
    var_4 = 150;
    var_5 = 200;
    var_6 = anglestoup( var_0 );

    if ( isdefined( var_2 ) )
        var_4 = var_2;

    var_7 = var_5 * var_6;
    var_8 = var_1 + var_7;
    var_6 = var_4 * var_6;
    var_9 = var_1 + var_6;

    if ( !isdefined( var_3 ) || !var_3 )
    {
        var_10 = physics_createcontents( [ "physicscontents_solid", "physicscontents_glass", "physicscontents_vehicleclip", "physicscontents_missileclip", "physicscontents_clipshot" ] );
        var_11 = physics_raycast( var_1, var_8, var_10, undefined, 0, "physicsquery_closest" );

        if ( var_11.size > 0 )
        {
            var_12 = var_11[0]["position"];
            var_9 = ( var_1 + var_12 ) / 2;
        }
    }

    return var_9;
}

_id_13AEA( var_0 )
{
    var_0 waittill( "death" );

    if ( isdefined( self ) )
        self delete();
}

_id_13A0A( var_0 )
{
    self waittill( "death" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_13B1F( var_0 )
{
    self endon( "death" );

    while ( self.origin != var_0 )
        wait 0.05;

    self notify( "start_secondary_explosion", var_0 );
}

_id_13B34( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_1 endon( "disconnect" );
    var_1 endon( "joined_team" );
    var_1 endon( "joined_spectators" );
    var_6 = "start_secondary_explosion";

    if ( isdefined( var_3 ) )
        var_6 = var_3;

    self waittill( var_6, var_7 );
    playloopsound( var_7, "shard_ball_explode_default" );
    var_8 = [];

    foreach ( var_10 in level.players )
    {
        if ( !isdefined( var_10 ) )
            continue;

        if ( !scripts\mp\utility\game::isreallyalive( var_10 ) )
            continue;

        if ( var_10 != var_1 && level.teambased && var_1.team != var_10.team )
            continue;

        var_8 = scripts\engine\utility::_id_1756( var_8, var_10 );
    }

    var_12 = var_1 _id_0AE1::_id_7FC4( "power_shardBall", 30 );
    var_13 = var_1 _id_0AE1::_id_7FC4( "power_shardBall", 300 );
    var_14 = scripts\engine\utility::_id_782F( var_7, var_8, undefined, undefined, var_13, var_12 );
    var_15 = 15;

    if ( isdefined( var_4 ) )
        var_15 = var_4;

    var_16 = var_1 _id_0AE1::_id_7FC2( "power_shardBall", var_15 );

    for ( var_17 = 0; var_17 < var_16; var_17++ )
    {
        var_18 = _id_80B9( var_7, var_0 );
        var_19 = undefined;

        if ( isdefined( var_14 ) && var_14.size > 0 )
        {
            var_20 = scripts\engine\utility::_id_DC6B( var_14 );
            var_19 = var_20 gettagorigin( "j_mainroot" );
            var_14 = scripts\engine\utility::array_remove( var_14, var_20 );
        }

        var_1 thread _id_6D81( var_7, var_18, var_2, var_19, var_5 );
        scripts\engine\utility::waitframe();
    }
}

_id_80B9( var_0, var_1 )
{
    var_2 = anglestoup( var_1 );
    var_3 = anglestoright( var_1 );
    var_4 = anglestoforward( var_1 );
    var_5 = randomint( 360 );
    var_6 = randomint( 360 );
    var_7 = cos( var_6 ) * sin( var_5 );
    var_8 = sin( var_6 ) * sin( var_5 );
    var_9 = cos( var_5 );
    var_10 = ( var_7 * var_3 + var_8 * var_4 + var_9 * var_2 ) / 0.33;
    return var_10;
}

_id_6D81( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "disconnect" );
    var_5 = var_0 + var_1;

    if ( isdefined( var_3 ) )
        var_5 = var_3;

    var_6 = scripts\mp\utility\game::_id_1309( "iw6_semtexshards_mp", var_0, var_5, self );
    var_6._id_1653 = var_4;

    if ( isdefined( var_2 ) )
        var_6 _meth_82DD( var_2 );

    var_6 waittill( "explode", var_7 );
    playloopsound( var_7, "mp_shard_grenade_impacts" );
}

_id_CC21( var_0 )
{
    self notify( "powers_shardBall_used", 0 );
    scripts\mp\utility\game::_id_CC16( var_0._id_13C2E, 1, var_0.origin );
}

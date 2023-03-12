// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._effect["slam_sml"] = loadfx( "vfx/old/_requests/archetypes/vfx_heavy_slam_s" );
    level._effect["slam_lrg"] = loadfx( "vfx/old/_requests/archetypes/vfx_heavy_slam_l" );
    level._effect["dash_dust"] = loadfx( "vfx/core/screen/vfx_scrnfx_tocam_slidedust_m" );
    level._effect["dash_trail"] = loadfx( "vfx/iw7/_requests/mp/vfx_dash_trail" );
}

_id_835F()
{

}

_id_E0E9()
{
    self notify( "removeDash" );
}

_id_4D90()
{
    if ( isbot( self ) )
        return;

    self endon( "removeDash" );
    self endon( "death" );
    self endon( "disconnect" );
    self._id_D782["power_dash"]._id_0019 = 1;
    var_0 = _id_4D88( self );
    var_1 = _id_4D8C( self, var_0 );
    self._id_D782["power_dash"]._id_0019 = 0;
    return var_1;
}

_id_4D91( var_0 )
{
    return var_0 isonground() == 0 && var_0 getstance() != "prone";
}

_id_4D88( var_0 )
{
    var_1 = var_0 _meth_814C();
    var_2 = anglestoright( var_0.angles );
    var_3 = anglestoforward( var_0.angles );
    var_4 = var_3 * var_1[0] + var_2 * var_1[1];
    var_5 = var_0.origin + var_4 * 175;
    return var_0 aiphysicstrace( var_0.origin + ( 0, 0, 20 ), var_5, 16, 80, 0, 0 );
}

_id_4D8C( var_0, var_1 )
{
    var_2 = lengthsquared( var_0.origin - var_1 );

    if ( var_2 < 576 )
        return 0;

    var_3 = var_0 scripts\engine\utility::_id_107E6();
    thread _id_4D89( var_0, var_3 );
    _id_4D8D( var_0, var_1, var_3 );
    var_0 notify( "dash_finished" );
    return 1;
}

_id_4D8D( var_0, var_1, var_2 )
{
    var_3 = var_0.origin - var_1;
    var_4 = lengthsquared( var_3 );
    var_5 = self getentityvelocity();
    var_6 = 0;

    if ( var_4 >= 28224 )
        var_6 = 1;

    if ( var_0 isonground() )
        var_0 setstance( "crouch" );

    var_0 _meth_823A( var_2, "tag_origin" );
    _id_4D8F( "dash_dust" );
    self playlocalsound( "synaptic_dash" );
    self playsound( "synaptic_dash_npc" );
    var_2 moveto( var_1, 0.35, 0.01, 0 );
    wait 0.35;

    if ( 0 )
        var_0 _id_4D87();

    wait 0.1;
    var_0 _meth_8366( var_5 * 1.2 );
    var_0 unlink();
    var_0 setstance( "stand" );
}

_id_4D8E()
{
    self endon( "disconnect" );
    playfxontag( scripts\engine\utility::_id_7ECB( "dash_trail" ), self, "TAG_EYE" );
    wait 0.35;
    stopfxontag( scripts\engine\utility::_id_7ECB( "dash_trail" ), self, "TAG_EYE" );
}

_id_4D87()
{
    var_0 = [];

    foreach ( var_2 in level._id_3CB5 )
    {
        if ( !isdefined( var_2 ) || !isalive( var_2 ) || !scripts\mp\utility\game::isenemy( var_2 ) )
            continue;

        if ( distancesquared( var_2.origin, self.origin ) < 254016 )
            var_0[var_0.size] = var_2;
    }

    if ( isdefined( var_0[0] ) )
    {
        var_0 = sortbydistance( var_0, self.origin );
        var_4 = var_0[0];
        var_5 = self gettagorigin( "TAG_EYE" );
        var_6 = var_4.origin;
        var_7 = vectortoangles( var_4.origin - self.origin );
        self setplayerangles( var_7 );
    }
}

_id_4D89( var_0, var_1 )
{
    var_0 scripts\engine\utility::waittill_any( "death", "disconnect", "dash_finished" );
    scripts\engine\utility::waitframe();

    if ( isdefined( var_1 ) )
        var_1 delete();
}

_id_4D92( var_0, var_1 )
{
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    wait( var_1 );
    return 1;
}

_id_4D8F( var_0 )
{
    thread _id_4D8E();
    var_1 = ( 235.004, 521.706, 1.95469 );
    var_2 = ( 270, 0, 0 );
    var_3 = anglestoup( var_2 );
    var_4 = anglestoforward( var_2 );
    var_5 = spawnfxforclient( level._effect[var_0], var_1, self, var_4, var_3 );
    triggerfx( var_5 );
    wait 0.05;
    var_5 delete();
}

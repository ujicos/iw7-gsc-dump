// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_D690 = loadfx( "vfx/iw7/_requests/mp/vfx_impulse_grenade_start" );
    level._id_D68D = loadfx( "vfx/iw7/_requests/mp/vfx_impulse_gren_exp" );
}

_id_D691( var_0 )
{
    var_0 endon( "death" );

    if ( !isdefined( var_0 ) )
        return;

    var_0 waittill( "missile_stuck" );
    playfx( level._id_D690, var_0.origin + ( 0, 0, 2 ) );
    wait 1.25;
    playfx( level._id_D68D, var_0.origin + ( 0, 0, 2 ) );
    radiusdamage( var_0.origin, 180, 1, 1, self, "MOD_EXPLOSIVE", var_0._id_13C2E );
    var_0 delete();
}

_id_D68E( var_0, var_1 )
{
    self endon( "disconnect" );

    if ( scripts\mp\utility\game::_id_9EF0( self ) || !isplayer( self ) )
        return;

    var_2 = self.origin + ( 0, 0, 2000 );
    var_3 = self.angles * ( 0, 1, 1 );
    var_3 += ( 85, 0, 0 );
    var_4 = scripts\engine\trace::_id_48BC( 1, 1, 1, 1, 0, 1, 1 );
    var_5 = scripts\engine\trace::_id_D305( self.origin, var_2, self.angles, self, var_4 );
    var_6 = self.origin;
    self._id_115FC = 1;

    if ( var_5["fraction"] < 1 )
    {
        var_2 = var_5["position"] - ( 0, 0, 65 );
        _id_11663( var_2 );
        wait 0.05;
        self._id_115FC = 0;
        radiusdamage( var_2 + ( 0, 0, 32 ), 128, 400, 400, var_1, "MOD_EXPLOSIVE", "portal_grenade_mp" );
        _id_468B( self, self.origin + ( 0, 0, 32 ) );
        return;
    }

    thread _id_4E75();
    self shellshock( "flashbang_mp", 0.8, 1, 1 );
    _id_11663( var_2 );
    var_7 = ( 0, 0, 1500 );
    self setplayerangles( var_3 );
    self _meth_8366( var_7 );
    scripts\engine\utility::_id_1C42( 0 );
    scripts\mp\utility\game::_id_1253( 1 );
    self setmovespeedscale( 0 );
    thread _id_13EF3();
    thread _id_13B31();
    thread _id_13AF8( var_1 );
    self._id_115FE = var_6;
    self._id_115FD = var_1;
}

_id_13AF8( var_0 )
{
    self endon( "portalGrenadeSave" );
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "collided", var_1, var_2, var_3, var_4, var_5 );

    if ( var_5 == "hittype_entity" )
    {
        radiusdamage( self.origin + ( 0, 0, 32 ), 128, 400, 400, var_0, "MOD_EXPLOSIVE", "portal_grenade_mp" );
        _id_468B( self, self.origin + ( 0, 0, 32 ) );
    }
}

_id_4E75()
{
    self endon( "portalGrenadeSave" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    scripts\mp\utility\game::_id_1253( 0 );
    scripts\engine\utility::_id_1C42( 1 );
    self._id_115FC = 0;
    self._id_115FD = undefined;
    self._id_115FE = undefined;
}

_id_13B31()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    scripts\engine\utility::waittill_any( "phase_shift_power_activated", "rewind_power_finished", "powers_teleport_used", "orbital_deployment_complete", "phase_slash_entered", "transponder_teleportPlayer" );

    while ( !self isonground() )
        wait 0.05;

    self notify( "portalGrenadeSave" );
    scripts\mp\weapons::_id_12ED5();
    scripts\mp\utility\game::_id_1253( 0 );
    scripts\engine\utility::_id_1C42( 1 );
    self._id_115FC = 0;
    self._id_115FD = undefined;
    self._id_115FE = undefined;
}

_id_13EF3()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "portalGrenadeSave" );
    self endon( "disconnect" );

    for (;;)
    {
        var_0 = self _meth_816B();
        var_0 *= ( 0, 0, 1 );
        self _meth_8366( var_0 );
        wait 0.05;
    }
}

_id_468B( var_0, var_1 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "diconnect" );
    wait 0.05;
    var_2 = var_0 _meth_8113();

    if ( !isdefined( var_2 ) )
        return;

    var_3 = var_2.origin;
    earthquake( 0.5, 1.5, var_3, 120 );
    thread scripts\mp\utility\game::_id_13AF( var_3, 64, 400, 400, self, "MOD_EXPLOSIVE", "portal_grenade_mp", 0 );
    var_0 thread scripts\mp\utility\game::_id_13AF( var_3, 64, 400, 400, var_0, "MOD_EXPLOSIVE", "portal_grenade_mp", 0 );
    wait 0.1;
    playfx( level._effect["corpse_pop"], var_3 + ( 0, 0, 12 ) );

    if ( isdefined( var_2 ) )
    {
        var_2 hide();
        var_2._id_CA6C = 1;
    }
}

_id_11663( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );

    if ( !isdefined( var_0 ) )
        return 0;

    self playlocalsound( "ftl_teleport" );
    self playsound( "ftl_teleport_npc_out" );

    if ( self _meth_81AD() )
        self _meth_805B();

    var_1 = length2dsquared( self getentityvelocity() );
    var_2 = ( 0, 0, 0 );
    var_3 = var_0 - self.origin;

    if ( var_1 > 0 )
        var_2 = var_3 * sqrt( var_1 ) / length( var_3 );

    thread _id_E852( self.origin, var_3 );
    scripts\engine\utility::waitframe();

    if ( !isdefined( self ) )
        return 0;

    var_4 = self.origin;
    var_5 = scripts\engine\utility::_id_107E6( self.origin, self.angles );
    self _meth_823A( var_5 );
    self setclientdvar( "cg_fovScale", 1.7 );
    var_5 moveto( var_0, 0.15, 0.0, 0.0 );
    self _meth_84D3( "power_active", "teleport" );
    scripts\mp\utility\game::_id_17C0( "teleport", 0.0, 0 );
    self _meth_8209();
    self setblurforplayer( 3, 0 );
    wait 0.15;
    self setblurforplayer( 0, 0.25 );
    self _meth_8208();
    scripts\mp\utility\game::_id_E0E6( "teleport", 0 );
    self unlink();
    self setorigin( var_0, 1 );
    self setclientdvar( "cg_fovScale", 1.0 );
    scripts\engine\utility::waitframe();
    self _meth_84D3( "power_exit", "teleport" );

    if ( !isdefined( self ) )
        return 0;

    self playsound( "ftl_teleport_npc_in" );
    self _meth_8366( var_2 );
    return 1;
}

_id_E852( var_0, var_1 )
{
    var_0 += ( 0, 0, 50 );
    var_2 = var_0 + var_1;
    var_3 = spawn( "script_model", var_0 );
    var_3 setmodel( "tag_origin" );
    wait 0.1;
    playfxontag( scripts\engine\utility::_id_7ECB( "vfx_tele_trail" ), var_3, "tag_origin" );
    var_3 moveto( var_2, 0.1, 0.05, 0.0 );
    wait 0.2;
    stopfxontag( scripts\engine\utility::_id_7ECB( "vfx_tele_trail" ), var_3, "tag_origin" );
    var_3 delete();
}

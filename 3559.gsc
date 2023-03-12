// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_6BBA = spawnstruct();
    level._id_6BBA._id_451D = [];
    level._effect["vfx_haywire_scrn"] = loadfx( "vfx/iw7/_requests/mp/vfx_haywire_scrn.vfx" );
    level._effect["haywire_smoke_friendly"] = loadfx( "vfx/old/_requests/mp_weapons/vfx_haywire_gas_friendly" );
    level._effect["haywire_smoke_enemy"] = loadfx( "vfx/old/_requests/mp_weapons/vfx_haywire_gas_enemy" );
    level._effect["vfx_fear_grenade_explode_frag"] = loadfx( "vfx/core/expl/grenadeexp_default" );
    level._effect["vfx_fear_grenade_explode_plasma"] = loadfx( "vfx/iw7/_requests/mp/vfx_plasma_large_explosion_enemy" );
    level._effect["vfx_fear_grenade_explode_blackhole"] = loadfx( "vfx/iw7/_requests/mp/vfx_blackhole_grenade_enemy" );
    level._effect["fear_mine_vanish"] = loadfx( "vfx/core/mp/equipment/vfx_motionsensor_exp" );
    _id_49CF( "projectile_m67fraggrenade", "vfx_fear_grenade_explode_frag", "grenade_explode_scr", undefined, 2.0 );
    _id_49CF( "projectile_m67fraggrenade", "vfx_fear_grenade_explode_plasma", "grenade_explode_scr", undefined, 2.0 );
    _id_49CF( "projectile_m67fraggrenade", "vfx_fear_grenade_explode_blackhole", "blackhole_grenade_explode_default", 75, 0.5 );
    level._id_6BBA._id_8283 = [ "mp_fullbody_synaptic_1" ];
    level._id_6BBA._id_3251 = [ "drone_ak12_fire_npc" ];
    _id_0AE1::_id_DF06( "power_fearGrenade", [ "passive_increased_duration", "passive_increased_damage", "passive_increased_radius" ] );
}

_id_49CF( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = spawnstruct();
    var_5._id_01F1 = var_0;
    var_5._id_1336D = scripts\engine\utility::_id_7ECB( var_1 );
    var_5._id_FC43 = var_2;
    var_5._id_763E = var_3;
    var_5._id_AC75 = var_4;
    level._id_6BBA._id_451D[level._id_6BBA._id_451D.size] = var_5;
}

_id_80BA()
{
    return level._id_6BBA._id_451D[randomint( level._id_6BBA._id_451D.size )];
}

_id_6BBC()
{
    self notify( "detonateExplosive" );
}

_id_6BBB()
{
    var_0 = self.owner;
    var_1 = self.origin;
    playfx( scripts\engine\utility::_id_7ECB( "fear_mine_vanish" ), var_1 );

    if ( isdefined( self._id_76CF ) )
        self._id_76CF moveto( var_1 + ( 0, 0, 72 ), 0.5 );

    var_2 = var_0 _id_0AE1::_id_7FC4( "power_fearGrenade", 160 );
    var_3 = spawn( "trigger_radius", var_1, 0, var_2, 160 );
    var_3.owner = var_0;
    var_4 = scripts\mp\utility\game::_id_108CB( var_0, var_1, "haywire_smoke_friendly", "haywire_smoke_enemy", 0 );
    var_0 thread _id_13A3E( var_3, self._id_76CF );
    wait 5.0;

    foreach ( var_6 in var_4 )
        var_6 delete();

    wait 2.0;
    var_3 delete();
}

_id_13A3E( var_0, var_1 )
{
    var_0.owner endon( "disconnect" );
    self endon( "disconnect" );

    for (;;)
    {
        var_0 waittill( "trigger", var_2 );

        if ( !scripts\mp\equipment\phase_shift::_id_213D( var_0, var_2 ) )
            continue;

        var_3 = _id_370F( var_0.owner, var_2 );

        if ( var_3._id_13378 > 0.0 )
            var_2 thread _id_127C3( var_3._id_13378, var_0.owner, var_1 );

        if ( var_3._id_24E6 > 0.0 )
            var_0.owner thread _id_127C3( var_3._id_24E6, var_0.owner, var_1 );
    }
}

_id_370F( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_24E6 = 0.0;
    var_2._id_13378 = 0.0;
    var_3 = _id_0AE1::_id_7FC1( "power_fearGrenade", 2.5 );

    if ( level.teambased && var_0.team == var_1.team && var_0 != var_1 )
    {
        if ( level._id_740A == 0 )
        {

        }
        else if ( level._id_740A == 1 )
            var_2._id_13378 = var_3;
        else if ( level._id_740A == 2 )
            var_2._id_24E6 = var_3;
        else if ( level._id_740A == 3 )
        {
            var_2._id_13378 = var_3 * 0.5;
            var_2._id_24E6 = var_3 * 0.5;
        }
    }
    else
        var_2._id_13378 = var_3;

    return var_2;
}

_id_127C3( var_0, var_1, var_2 )
{
    if ( _id_9EEA( self ) )
        _id_F703( var_0 );
    else
        thread _id_2A67( var_0, var_1, var_2 );
}

_id_2A67( var_0, var_1, var_2 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self._id_6BB9 = spawnstruct();
    _id_F703( var_0 );
    thread _id_E84C();
    var_3 = _id_0AE1::_id_7FC0( "power_fearGrenade", 8 );
    self _meth_80B0( var_3, self.origin, var_1, var_2, "MOD_EXPLOSIVE", "fear_grenade_mp" );

    for (;;)
    {
        var_4 = ( self._id_6BB9._id_6393 - gettime() ) / 1000.0;
        var_5 = scripts\engine\utility::_id_13736( var_4, "fear_update_duration" );

        if ( var_5 == "timeout" )
        {
            _id_6319();
            break;
        }
        else
            continue;
    }
}

_id_E84C()
{
    self endon( "stop_fear_effects" );
    self endon( "death" );
    self endon( "disconnect" );
    var_0 = spawnfxforclient( scripts\engine\utility::_id_7ECB( "vfx_haywire_scrn" ), ( 0, 0, 0 ), self );
    triggerfx( var_0 );
    thread _id_4115( var_0 );
    thread _id_13A35();
    childthread _id_E85A();
    wait 0.5;
    childthread _id_E853();
    childthread _id_E854();
}

_id_6319()
{
    self notify( "stop_fear_effects" );
    scripts\engine\utility::waitframe();
    _id_40F9();
    self._id_6BB9 = undefined;
    self notify( "finished_stop_fear_effects" );
}

_id_4115( var_0 )
{
    scripts\engine\utility::waittill_any( "death", "disconnect", "stop_fear_effects" );
    var_0 delete();
}

_id_13A35()
{
    self endon( "finished_stop_fear_effects" );
    self waittill( "death" );
    _id_6319();
}

_id_F703( var_0 )
{
    var_1 = gettime() + int( var_0 * 1000 );

    if ( isdefined( self._id_6BB9._id_6393 ) )
    {
        if ( self._id_6BB9._id_6393 > var_1 )
            return;
    }

    self._id_6BB9._id_6393 = var_1;
    self notify( "fear_update_duration" );
}

_id_9EEA( var_0 )
{
    return isdefined( var_0._id_6BB9 );
}

_id_E853()
{
    for (;;)
    {
        var_0 = self geteye();
        var_1 = self getplayerangles();
        var_2 = anglestoforward( var_1 );
        var_3 = anglestoright( var_1 );
        var_4 = var_0 + ( 0, 0, 60 ) + var_3 * randomfloatrange( -300, 300 );
        var_5 = self.origin + var_2 * 500 + ( randomfloatrange( -150, 150 ), randomfloatrange( -150, 150 ), 0 );
        var_6 = vectornormalize( var_5 - var_4 ) * randomfloatrange( 500, 900 );
        var_6 = ( var_6[0], var_6[1], 0 ) + self _meth_816B();
        thread _id_108CE( self, var_4, var_6 );
        wait( randomfloatrange( 0.1, 0.5 ) );
    }
}

_id_E8D9()
{
    for (;;)
    {
        var_0 = _id_80C1();
        var_1 = randomfloat( 50 );
        wait( randomfloatrange( 0.05, 0.15 ) );
    }
}

_id_E842()
{
    for (;;)
    {
        var_0 = _id_80C1();
        var_1 = self.health;
        self _meth_80B0( 1, var_0, undefined, undefined, "MOD_FALLING" );
        self.health = var_1;
        wait( randomfloatrange( 0.35, 1.5 ) );
    }
}

_id_E85A()
{
    self setclientomnvar( "ui_hud_shake", 1 );
}

_id_E854()
{
    var_0 = spawn( "script_model", self.origin );
    var_0 hide();
    self._id_6BB9._id_8282 = var_0;
    var_1 = 0;

    for (;;)
    {
        var_2 = undefined;

        if ( !var_1 && randomint( 10 ) == 0 )
        {
            var_3 = anglestoforward( self.angles );
            var_2 = self.origin + var_3 * 25 + ( 0, 0, -5 );
            var_4 = ( self.angles[0], 180 + self.angles[1], self.angles[2] );
            var_0.origin = var_2;
            var_0.angles = var_4;
            var_0 setmodel( "mp_fullbody_synaptic_1" );
            var_1 = 1;
        }
        else
        {
            var_2 = _id_80C1( 200, 300 );
            var_2 = getclosestpointonnavmesh( var_2 );
            var_4 = ( self.angles[0], 180 + self.angles[1], self.angles[2] );
            var_0.origin = var_2;
            var_0.angles = var_4;
            var_5 = level._id_6BBA._id_8283[randomint( level._id_6BBA._id_8283.size )];
            var_0 setmodel( var_5 );
        }

        scripts\engine\utility::waitframe();
        var_0 _meth_8388( self );
        wait( randomfloatrange( 0.3, 0.65 ) );
        var_0 hide();
        var_0 unlink();
        wait( randomfloatrange( 0.3, 0.65 ) );
    }
}

_id_E83D()
{
    var_0 = spawn( "script_model", self.origin );
    var_0 thread _id_4119();

    for (;;)
    {
        var_1 = level._id_6BBA._id_3251[randomint( level._id_6BBA._id_3251.size )];
        var_0.origin = _id_80C1();
        var_0 playsoundtoplayer( var_1, self );
        wait( randomfloatrange( 0.15, 0.3 ) );
    }
}

_id_4119( var_0 )
{
    scripts\engine\utility::waittill_any( "stop_fear_effects", "death", "disconnect" );
    var_0 delete();
}

_id_40F9()
{
    if ( isdefined( self._id_6BB9._id_8282 ) )
        self._id_6BB9._id_8282 delete();
}

_id_108CE( var_0, var_1, var_2 )
{
    var_3 = randomfloatrange( 0.4, 1.25 );
    var_4 = var_0 scripts\mp\utility\game::_id_1302( "fear_ghost_grenade_mp", var_1, var_2, var_3 );
    var_4 hide();
    var_4 _meth_8388( var_0 );
    var_4 thread _id_13A3D();
    var_5 = spawn( "script_model", var_1 );
    var_5.owner = var_0;
    var_5._id_DA5A = var_4;
    var_5._id_451C = _id_80BA();
    var_5 hide();
    var_5 _meth_8388( var_0 );
    var_5 setmodel( var_5._id_451C._id_01F1 );
    var_5 linkto( var_4, "tag_origin" );
    var_4._id_6B4A = var_5;
    var_5 thread _id_13A41();
}

_id_13A3D()
{
    var_0 = scripts\engine\utility::_id_13734( "explode", "death" );
    self._id_6B4A notify( "detonate_ghost_grenade" );
}

_id_13A41()
{
    self endon( "death" );
    var_0 = scripts\engine\utility::_id_13736( 4.0, "detonate_ghost_grenade" );
    thread _id_108CF();
    self delete();
}

_id_108CF()
{
    var_0 = self._id_451C;
    var_1 = undefined;

    if ( isdefined( var_0._id_1336D ) )
    {
        var_2 = ( 0, 0, 0 );

        if ( isdefined( var_0._id_763E ) )
        {
            var_3 = anglestoup( self.angles );
            var_2 = var_3 * var_0._id_763E;
        }

        var_1 = spawnfxforclient( var_0._id_1336D, self.origin + var_2, self.owner );
        triggerfx( var_1 );
    }

    if ( isdefined( var_0._id_FC43 ) )
        self playsoundtoplayer( var_0._id_FC43, self.owner );

    wait( var_0._id_AC75 );

    if ( isdefined( var_1 ) )
        var_1 delete();
}

_id_80C1( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_0 ) )
        var_0 = -100;

    if ( !isdefined( var_1 ) )
        var_1 = 100;

    if ( !isdefined( var_2 ) )
        var_2 = -100;

    if ( !isdefined( var_3 ) )
        var_3 = 100;

    if ( !isdefined( var_4 ) )
        var_4 = -100;

    if ( !isdefined( var_5 ) )
        var_5 = 100;

    var_6 = randomfloatrange( var_0, var_1 );
    var_7 = randomfloatrange( var_2, var_3 );
    var_8 = randomfloatrange( var_4, var_5 );
    var_9 = anglestoforward( self.angles );
    var_10 = anglestoright( self.angles );
    var_11 = anglestoup( self.angles );
    return self.origin + var_9 * var_6 + var_10 * var_7 + var_11 * var_8;
}

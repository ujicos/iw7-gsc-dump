// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._effect["transponder"] = loadfx( "vfx/iw7/_requests/mp/vfx_smokewall" );
    level._effect["transponder_activate"] = loadfx( "vfx/iw7/_requests/mp/vfx_transponder_activate" );
    level._effect["direction_indicator_close"] = loadfx( "vfx/iw7/_requests/mp/vfx_transponder_direction_indicator_close" );
    level._effect["direction_indicator_mid"] = loadfx( "vfx/iw7/_requests/mp/vfx_transponder_direction_indicator_mid" );
    level._effect["direction_indicator_far"] = loadfx( "vfx/iw7/_requests/mp/vfx_transponder_direction_indicator_far" );
    self._id_E561 = 0;
    self._id_9F2F = 0;
    self._id_9FB0 = 0;
    _id_0AE1::_id_DF06( "power_transponder", [ "passive_increased_range", "passive_spot_enemies", "passive_ripper" ] );
}

_id_F5D3()
{

}

_id_E180()
{
    self notify( "remove_transponder" );
}

_id_1268C( var_0 )
{
    if ( _id_3E5A() )
        _id_1268E( var_0 );
    else
        thread _id_CC21( var_0 );
}

_id_1268F( var_0 )
{
    self._id_9F2F = _id_0AE1::_id_D779( "power_transponder", "passive_ripper" );
    self._id_9FB0 = _id_0AE1::_id_D779( "power_transponder", "passive_spot_enemies" );
    _id_1268E( var_0 );
}

_id_1268E( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "remove_transponder" );
    var_1 = "power_transponder";
    self setclientomnvar( "ui_transponder_range_finder", 0 );
    self setclientomnvar( "ui_show_transponder_outofrange", 0 );

    if ( !scripts\mp\utility\game::isreallyalive( self ) )
    {
        var_0 delete();
        return;
    }

    var_0 thread scripts\mp\weapons::_id_C4F4();
    thread _id_13B90( var_0 );
    var_0 _meth_831F( self );
    var_0._id_1604 = 0;
    scripts\mp\weapons::_id_C5AC( var_0, "power_transponder" );
    thread _id_12696( var_0 );
    var_0 thread _id_12690();
    var_0 thread scripts\mp\weapons::_id_3343();
    var_0 thread _id_12692();
    var_0 thread scripts\mp\weapons::_id_66B4( 1 );
    var_0 thread scripts\mp\perks\perk_equipmentping::_id_E84B();
    level thread scripts\mp\weapons::_id_B9CA( self, var_0 );
}

_id_13B90( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "transponder_alt_detonate" );
    self endon( "transponder_detonated" );
    var_0 waittill( "activated" );

    for (;;)
    {
        self setclientomnvar( "ui_show_transponder_outofrange", 0 );
        self waittillmatch( "detonate", "transponder_mp" );
        var_1 = _id_0AE1::_id_7FC5( "power_transponder", 1801 );

        if ( isdefined( var_0 ) && var_0._id_1604 && length2d( var_0.origin - self.origin ) <= var_1 )
        {
            _id_1268D( var_0 );
            _id_12693();
            continue;
        }

        if ( isdefined( var_0 ) )
        {
            self setclientomnvar( "ui_show_transponder_outofrange", 1 );
            scripts\engine\utility::waitframe();
        }

        continue;
    }
}

_id_12692()
{
    var_0 = self.owner;
    var_0 waittill( "transponder_update" );
    var_0 setclientomnvar( "ui_transponder_range_finder", 0 );
}

_id_12693()
{
    foreach ( var_1 in self._id_CC4D )
    {
        if ( isdefined( var_1 ) && var_1._id_13C2E == "transponder_mp" )
        {
            var_1 scripts\mp\weapons::_id_51B5();
            scripts\engine\utility::array_remove( self._id_CC4D, var_1 );
        }
    }

    self notify( "transponder_update", 0 );
    waittillframeend;
    self notify( "transponder_detonated" );
}

_id_13B8F( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "transponder_detonated" );
    var_0 waittill( "activated" );

    for (;;)
    {
        self waittill( "transponder_alt_detonate" );
        var_1 = self getcurrentweapon();

        if ( var_1 != "transponder_mp" )
        {
            if ( isdefined( var_0 ) && var_0._id_1604 )
            {
                _id_1268D( var_0 );
                _id_12693();
                continue;
            }
        }
        else
        {

        }
    }
}

_id_13B8E( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "transponder_detonated" );
    level endon( "game_ended" );
    var_0 waittill( "activated" );
    var_1 = 0;

    for (;;)
    {
        if ( self usebuttonpressed() )
        {
            var_1 = 0;

            while ( self usebuttonpressed() )
            {
                var_1 += 0.05;
                wait 0.05;
            }

            if ( var_1 >= 0.5 )
                continue;

            var_1 = 0;

            while ( !self usebuttonpressed() && var_1 < 0.5 )
            {
                var_1 += 0.05;
                wait 0.05;
            }

            if ( var_1 >= 0.5 )
                continue;

            if ( !self._id_CC4D.size )
                return;

            if ( self _meth_81AD() )
                self _meth_805B();

            if ( isdefined( self._id_9FF6 ) )
                _id_0D70::_id_639B();

            self notify( "transponder_alt_detonate" );
        }

        wait 0.05;
    }
}

_id_12690()
{
    self waittill( "missile_stuck", var_0 );
    wait 0.05;

    if ( !_id_3E5B() )
        self.owner _id_CC21( self );
    else
    {
        self.owner notify( "powers_transponder_used", 1 );
        self notify( "activated" );
        self._id_1604 = 1;
        self.owner _id_5616( self );
        scripts\mp\weapons::_id_B2A5();
        scripts\mp\weapons::_id_69FF( var_0 );
    }
}

_id_1268D( var_0 )
{
    self notify( "transponder_teleportPlayer" );
    var_1 = undefined;
    var_2 = getclosestpointonnavmesh( var_0.origin );
    var_1 = getclosestnodeinsight( var_2 );

    if ( isdefined( var_1 ) )
    {
        thread _id_161E( self.origin, var_0.origin );
        self playlocalsound( "ghost_use_transponder" );
        self setorigin( var_1.origin + ( 0, 0, 20 ) );

        if ( self._id_9FB0 )
            thread _id_12694();

        if ( self._id_9F2F )
            thread _id_12691();
    }
    else
    {
        iprintlnbold( "Transponder lost connection" );
        self.owner _id_12693();
    }
}

_id_161E( var_0, var_1 )
{
    wait 0.1;
    var_2 = "direction_indicator_far";
    var_3 = length2d( var_0 - var_1 );

    if ( var_3 < 1024 )
        var_2 = "direction_indicator_close";
    else if ( var_3 < 2048 )
        var_2 = "direction_indicator_mid";

    playfx( scripts\engine\utility::_id_7ECB( var_2 ), var_0, ( 0, 0, 1 ), anglestoforward( vectortoangles( var_1 - var_0 ) ) );
    playfx( scripts\engine\utility::_id_7ECB( "transponder_activate" ), var_1 );
}

_id_E8AB()
{
    self endon( "disconnect" );
    scripts\mp\killstreaks\emp_common::_id_20C3();
    self shellshock( "flashbang_mp", 1.2 );
    scripts\engine\utility::_id_13736( 1.2, "death" );
    scripts\mp\killstreaks\emp_common::_id_E0F3();
}

_id_12696( var_0 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    thread _id_12698( var_0 );

    while ( isdefined( var_0 ) )
    {
        var_1 = distance2d( self.origin, var_0.origin );
        self setclientomnvar( "ui_transponder_range_finder", int( var_1 ) );
        wait 0.1;
    }
}

_id_12698( var_0 )
{
    var_0 waittill( "deleted_equipment" );
    self setclientomnvar( "ui_transponder_range_finder", 0 );
}

_id_3E5B()
{
    var_0 = getclosestpointonnavmesh( self.origin );
    var_1 = self.owner _id_0AE1::_id_7FC5( "power_transponder", 256 );

    if ( distance( self.origin, var_0 ) > var_1 )
        return 0;

    var_2 = getclosestnodeinsight( var_0 );
    return isdefined( var_2 );
}

_id_3E5A()
{
    return !self iswallrunning() && !self isonladder() && self isonground();
}

_id_CC21( var_0 )
{
    self iprintlnbold( "TRANSPONDER LOST COMMUNICATION" );
    self notify( "powers_transponder_used", 0 );
    self._id_1604 = 0;
    _id_12693();
    self._id_CC4D = scripts\engine\utility::_id_22BC( self._id_CC4D );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_897B( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self iprintlnbold( "Transponder Hacked!" );
    wait 2;
    self notify( "transponder_alt_detonate" );
}

_id_5616( var_0 )
{
    _id_0AE2::_id_D727( "power_transponder" );
    thread _id_5617( var_0 );
}

_id_5617( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "remove_transponder" );
    var_0 waittill( "death" );
    _id_0AE2::_id_D72D( "power_transponder" );
}

_id_12694()
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 = 0;
    var_1 = 0.8;
    var_2 = 0;
    var_3 = 650;
    self._id_E561 = 0;

    foreach ( var_5 in level._id_C928 )
    {
        if ( !scripts\mp\utility\game::isreallyalive( var_5 ) )
            continue;

        if ( !scripts\mp\utility\game::isenemy( var_5 ) )
            continue;

        if ( var_5 scripts\mp\utility\game::_id_12D6( "specialty_noplayertarget" ) || var_5 scripts\mp\utility\game::_id_12D6( "specialty_noscopeoutline" ) )
            continue;

        var_6 = var_5.origin - self.origin;

        if ( 1 && vectordot( anglestoforward( self.angles ), var_6 ) < 0 )
            continue;

        var_7 = var_3 * var_3;

        if ( length2dsquared( var_6 ) > var_7 )
            continue;

        var_0++;
        thread _id_12695( var_5, distance2d( self.origin, var_5.origin ) / var_3, var_1 );
        var_2 = 1;
    }
}

_id_12695( var_0, var_1, var_2 )
{
    wait( var_2 * var_1 );
    var_3 = scripts\mp\utility\game::_id_C794( var_0, "orange", self, 0, 0, "level_script" );
    var_0 scripts\mp\hud_message::_id_1013D( "spotted" );
    var_4 = 3.0;
    _id_13AA0( var_3, var_0, var_4 );
}

_id_13AA0( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\engine\utility::_id_13737( var_2, "leave" );

    if ( isdefined( var_1 ) )
        scripts\mp\utility\game::_id_C78F( var_0, var_1 );
}

_id_12691()
{
    level._effect["reaper_fisheye"] = loadfx( "vfx/code/screen/vfx_scrnfx_reaper_fisheye" );
    self._id_12697 = [ "specialty_fastermelee", "specialty_extendedmelee", "specialty_stun_resistance", "specialty_detectexplosive" ];

    foreach ( var_1 in self._id_12697 )
        scripts\mp\utility\game::giveperk( var_1 );

    var_3 = self.maxhealth;
    self _meth_845A( "reaper_mp" );
    self.maxhealth = 170;
    self.health = self.maxhealth;
    level._effect["reaper_swipe_trail"] = loadfx( "vfx/iw7/_requests/mp/vfx_swipe_trail" );
    self._id_B62A = spawn( "script_model", self.origin );
    self._id_B62A setmodel( "tag_origin" );
    thread _id_13ACC();
    thread _id_AD77( var_3 );
}

_id_AD77( var_0 )
{
    scripts\engine\utility::_id_13736( 5, "death" );
    thread _id_E164( var_0 );
}

_id_13ACC( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeRipper" );
    level endon( "game_ended" );
    var_1 = ( 0, 0, 4 );

    for (;;)
    {
        self waittill( "melee_fired" );
        var_2 = self.origin + var_1;
        var_3 = anglestoforward( self.angles );
        var_4 = anglestoright( self.angles );
        var_5 = _id_36DB( var_0 );
        var_5 += var_1;
        var_6 = var_2 + var_4 * 64;
        var_7 = var_2 - var_4 * 32;
        var_8 = rotatevector( var_4, ( 0, 45, 0 ) );
        var_9 = var_2 + var_8 * 64;
        var_10 = rotatevector( var_4, ( 0, 135, 0 ) );
        var_11 = var_2 + var_10 * 32;
        self._id_B62A.origin = var_6;
        wait 0.05;
        playfxontag( level._effect["reaper_swipe_trail"], self._id_B62A, "tag_origin" );
        wait 0.075;
        self._id_B62A.origin = var_9;
        wait 0.075;
        self._id_B62A.origin = var_5;
        thread _id_20D9( var_5 );
        wait 0.075;
        self._id_B62A.origin = var_11;
        wait 0.075;
        self._id_B62A.origin = var_7;
        wait 0.05;
        stopfxontag( level._effect["reaper_swipe_trail"], self._id_B62A, "tag_origin" );
    }
}

_id_40B3()
{
    if ( isdefined( self._id_C7FF ) )
        self._id_C7FF delete();
}

_id_E164( var_0 )
{
    self notify( "removeRipper" );
    self._id_9F2E = 0;
    self._id_9FB0 = 0;
    self._id_E561 = 0;

    foreach ( var_2 in self._id_12697 )
        scripts\mp\utility\game::_id_E150( var_2 );

    self._id_12697 = undefined;
    self _meth_845A( "scout_mp" );
    self.maxhealth = var_0;
    self setclientomnvar( "ui_odin", -1 );
    _id_40B3();
}

_id_20D9( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "removeRipper" );
    var_1 = distance2d( self.origin, var_0 ) / 2;
    self _meth_8253( self.origin + ( 0, 0, 36 ), var_1, 250, 135, self, "MOD_MELEE", "iw7_reaperblade_mp" );
}

_id_36DB( var_0 )
{
    self endon( "removeRipper" );
    var_1 = ( 0, 0, 0 );
    var_2 = self.origin + var_1;
    var_3 = anglestoforward( self.angles );
    var_4 = anglestoright( self.angles );
    var_5 = self _meth_816B();
    var_6 = vectordot( var_5, self.angles );
    var_7 = length( var_5 );

    if ( var_7 < 64 )
        var_7 = 92;

    if ( var_7 > 64 && var_7 < 128 )
        var_7 = 128;

    if ( var_7 > 350 )
        var_7 = 700;

    if ( var_7 > 200 )
        var_7 = 328;

    if ( var_7 > 128 )
        var_7 = 256;

    if ( var_6 < 1 )
        var_7 = 64;

    if ( isdefined( var_0 ) )
        var_7 = var_0;

    return var_2 + var_3 * var_7;
}

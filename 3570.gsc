// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_C7E4 = loadfx( "vfx/core/mp/ability/vfx_aslt_overcharge_scrn" );
    level._id_C7E5 = loadfx( "vfx/core/mp/ability/vfx_aslt_overcharge_world_view" );
}

_id_F7AB()
{
    self._id_D782["power_multiVisor"]._id_1348E = 0;
    self._id_D782["power_multiVisor"]._id_1348F[0] = "default";
    self._id_D782["power_multiVisor"]._id_1348F[1] = "thermal";
    self._id_D782["power_multiVisor"]._id_1348F[2] = "sitrep";
    self._id_D782["power_multiVisor"]._id_1348F[3] = "phase";
    self._id_8BD7 = 0;
}

_id_E13F()
{
    self notify( "removeMultiVisor" );
    _id_E12D();
}

_id_130A7()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeMultiVisor" );
    level endon( "game_ended" );
    thread _id_E27E();
    var_0 = self._id_D782["power_multiVisor"];
    var_1 = self._id_D782["power_multiVisor"]._id_1348E;
    var_2 = 4;
    _id_E27F( var_1, var_2 );
    scripts\engine\utility::waitframe();
    self._id_D782["power_multiVisor"]._id_1348E = var_2;
    _id_20D0();
    self notify( "power_multi_visor_update", 0 );
    self playlocalsound( "mp_overcharge_on" );
    thread _id_BDCD();
    return 1;
}

_id_BDCD()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removemultivisor" );
    var_0 = gettime() + 10000;

    while ( var_0 > gettime() )
        wait 0.05;

    _id_E27F( 0, 4 );
}

_id_C5A5( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeMultiVisor" );
    level endon( "game_ended" );

    switch ( var_0 )
    {
        case 0:
            self iprintlnbold( "DEFAULT" );
            break;
        case 1:
            self iprintlnbold( "THERMAL" );
            break;
        case 2:
            self iprintlnbold( "SITREP" );
            break;
        case 3:
            self iprintlnbold( "PHASE" );
            break;
        case 4:
            break;
        default:
            self iprintlnbold( "DEFAULT" );
    }
}

_id_20C1( var_0 )
{
    self endon( "multivisor_reset" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeMultiVisor" );
    thread _id_E12D();
    self._id_8BD7 = 0;
}

_id_20D0()
{
    self endon( "multivisor_reset" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeMultiVisor" );
    self _meth_83C0();
    thread _id_20CE();

    if ( !self._id_8BD7 )
        scripts\mp\utility\game::giveperk( "specialty_detectexplosive" );

    self._id_8BD7 = 1;
    thread _id_E88F();
}

_id_20E1( var_0 )
{
    self endon( "multivisor_reset" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeMultiVisor" );
    self _meth_83C0();
    thread _id_20CE();
    self._id_8BD7 = 0;
}

_id_20DB( var_0 )
{
    self endon( "multivisor_reset" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeMultiVisor" );

    if ( !self._id_8BD7 )
        scripts\mp\utility\game::giveperk( "specialty_detectexplosive" );

    self._id_8BD7 = 1;
}

_id_20D7( var_0 )
{
    self endon( "multivisor_reset" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeMultiVisor" );
    self visionsetnakedforplayer( "phase_shift_mp", 0.0 );
    thread _id_E88F();
    self._id_8BD7 = 0;
}

_id_E88F()
{
    self endon( "death" );
    self endon( "disconnect" );

    if ( !isdefined( self._id_D782["power_multiVisor"] ) )
        return;

    while ( self._id_D782["power_multiVisor"]._id_1348E == 4 )
    {
        foreach ( var_1 in level.players )
        {
            if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_1 ) )
                var_1 _meth_8388( self );
        }

        wait 0.05;
    }

    foreach ( var_1 in level.players )
    {
        if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_1 ) )
            var_1 _meth_8429( self );
    }
}

_id_E27F( var_0, var_1 )
{
    if ( var_0 != var_1 )
    {
        self thermalvisionoff();
        self visionsetnakedforplayer( "", 0.0 );

        if ( self._id_8BD7 )
        {
            scripts\mp\utility\game::_id_E150( "specialty_detectexplosive" );
            self._id_8BD7 = 0;
        }

        _id_E12D();
    }
}

_id_E27E()
{
    self endon( "power_multi_visor_update" );
    self waittill( "death" );
    self notify( "multivisor_reset" );
}

_id_20CE()
{
    self setclientomnvar( "ui_multiVisorOverlay", 1 );
}

_id_E12D()
{
    self setclientomnvar( "ui_multiVisorOverlay", 0 );
}

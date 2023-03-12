// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_DAF5( var_0 )
{
    thread _id_13A55( var_0 );
    thread _id_13A6E( var_0 );
}

_id_13A55( var_0 )
{
    var_0 endon( "death" );
    self waittill( "disconnect" );
    var_0 delete();
}

_id_13A6E( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_0 waittill( "missile_stuck" );
    var_1 = anglestoup( var_0.angles );
    var_2 = _id_10856( var_0 );
    var_2 scripts\mp\equipment\blackhat::_id_2B2A();
    var_2 thread _id_13A3B();
    thread _id_13B19( var_2 );
}

_id_13B19( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_1 = var_0._id_015F;
    var_1 endon( "death" );
    var_0 setscriptablepartstate( "effects", "warmUp", 0 );
    wait 1;
    var_0 setscriptablepartstate( "effects", "explode_01", 0 );
    var_1 thread scripts\mp\shellshock::_id_DAF3();
    var_0 _meth_8253( var_1.origin, 256, 100, 50, var_1.owner, "MOD_EXPLOSIVE", var_1._id_13C2E );
    var_2 = var_1._id_118A2;

    for ( var_3 = 0; var_3 < var_2; var_3++ )
    {
        wait 0.5;

        switch ( var_3 )
        {
            case 0:
                var_0 setscriptablepartstate( "effects", "explode_02", 0 );
                break;
            case 1:
                var_0 setscriptablepartstate( "effects", "explode_03", 0 );
                break;
            case 2:
                var_0 setscriptablepartstate( "effects", "explode_04", 0 );
                break;
            case 3:
                var_0 setscriptablepartstate( "effects", "explode_05", 0 );
                break;
        }

        var_1 thread scripts\mp\shellshock::_id_DAF3();
        var_0 _meth_8253( var_1.origin, 256, 40, 20, var_1.owner, "MOD_EXPLOSIVE", var_1._id_13C2E );
    }

    wait 1;
    var_1 delete();
}

_id_10856( var_0 )
{
    var_1 = spawn( "script_model", var_0.origin );
    var_1 setmodel( "prop_mp_pulse_grenade_temp" );
    var_1.angles = var_0.angles;
    var_1 linkto( var_0 );
    var_1._id_015F = var_0;
    var_1.owner = var_0.owner;
    var_1 _meth_831F( var_0.owner );
    var_1 thread _id_40F3( var_0 );
    var_0 hide();
    return var_1;
}

_id_13A3B()
{
    scripts\mp\damage::monitordamage( 50, "pulseGrenade", ::_id_612B, ::_id_612C, 0 );
}

_id_612B( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self.owner ) && var_0 != self.owner )
    {
        var_0 scripts\mp\killstreaks\killstreaks::_id_83A0();
        var_0 notify( "destroyed_equipment" );
    }

    scripts\mp\equipment\blackhat::_id_2B2C();
    self._id_015F delete();
    self notify( "detonateExplosive" );
}

_id_612C( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;
    var_5 = scripts\mp\damage::_id_89C3( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8999( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8975( var_1, var_2, var_5 );
    return var_5;
}

_id_40F3( var_0 )
{
    var_0 waittill( "death" );
    self delete();
}

_id_A63A()
{
    if ( isdefined( self ) )
        return self._id_015F;
}

_id_DAF4()
{
    self shellshock( "pulse_grenade_mp", 0.3 );
}

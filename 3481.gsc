// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_20C3()
{
    self notify( "apply_player_emp" );
    self._id_619B = scripts\engine\utility::ter_op( isdefined( self._id_619B ), self._id_619B, 0 );
    var_0 = self._id_619B;
    self._id_619B++;
    self playloopsound( "emp_nade_lp" );
    thread _id_5AA9();

    if ( var_0 == 0 )
        thread _id_1181();
}

_id_E0F3()
{
    self._id_619B--;

    if ( self._id_619B == 0 )
        thread _id_13B5();
}

_id_1181()
{
    if ( scripts\mp\utility\game::_id_12D6( "specialty_localjammer" ) )
        self _meth_807C();

    self _meth_82DA( 1 );
    scripts\engine\utility::_id_1C6E( 0 );
    thread _id_10D95();
}

_id_13B5()
{
    if ( scripts\mp\utility\game::_id_12D6( "specialty_localjammer" ) )
        self _meth_81F4();

    self _meth_82DA( 0 );
    scripts\engine\utility::_id_1C6E( 1 );

    if ( scripts\mp\utility\game::isreallyalive( self ) )
        thread _id_1106A();
    else
        thread _id_1106B();

    self notify( "emp_stop_vfx" );
    self playsound( "emp_nade_lp_end" );
    self stoploopsound( "emp_nade_lp" );
}

_id_9D29()
{
    return isdefined( self._id_619B ) && self._id_619B > 0;
}

_id_FFC5()
{
    if ( scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) || !scripts\mp\utility\game::isreallyalive( self ) )
        return 0;

    if ( scripts\mp\utility\game::_id_9EF0( self ) )
        return 0;

    return 1;
}

_id_20CD()
{
    visionsetnaked( "coup_sunblind", 0.05 );
    wait 0.05;
    visionsetnaked( "coup_sunblind", 0 );
    visionsetnaked( "", 0.5 );
}

_id_10D95()
{
    level endon( "game_ended" );
    self endon( "emp_stop_effect" );
    self endon( "disconnect" );
    self._id_2B12 = 1;
    thread _id_5823();
    wait 1.0;
    self setclientomnvar( "ui_hud_static", 2 );
    wait 0.5;
    self notify( "emp_stop_artifact" );
    self setclientomnvar( "ui_hud_emp_artifact", 0 );

    for (;;)
    {
        self setclientomnvar( "ui_hud_static", 3 );
        var_0 = randomfloatrange( 0.25, 1.25 );
        wait( var_0 );
        self setclientomnvar( "ui_hud_static", 2 );
        wait 0.5;
    }
}

_id_1106A()
{
    level endon( "game_ended" );
    self notify( "emp_stop_effect" );
    self endon( "disconnect" );

    if ( isdefined( self._id_2B12 ) )
    {
        self._id_2B12 = undefined;
        self setclientomnvar( "ui_hud_static", 0 );

        for ( var_0 = 0; var_0 < 3; var_0++ )
        {
            self setclientomnvar( "ui_hud_emp_artifact", 1 );
            wait 0.5;
        }

        self setclientomnvar( "ui_hud_emp_artifact", 0 );
        self._id_D2DB = 0;
    }
}

_id_1106B()
{
    self notify( "emp_stop_effect" );

    if ( isdefined( self._id_2B12 ) || isdefined( self._id_D2DB ) )
    {
        self._id_2B12 = undefined;
        self._id_D2DB = 0;
        self setclientomnvar( "ui_hud_static", 0 );
        self setclientomnvar( "ui_hud_emp_artifact", 0 );
    }
}

_id_5823()
{
    self notify( "emp_stop_artifact" );
    level endon( "game_ended" );
    self endon( "emp_stop_effect" );
    self endon( "emp_stop_artifact" );
    self endon( "disconnect" );
    self endon( "joined_spectators" );

    for (;;)
    {
        self setclientomnvar( "ui_hud_emp_artifact", 1 );
        var_0 = randomfloatrange( 0.375, 0.5 );
        wait( var_0 );
    }
}

_id_5826( var_0 )
{
    self notify( "emp_stop_static" );
    level endon( "game_ended" );
    self endon( "emp_stop_effect" );
    self endon( "emp_stop_static" );
    self endon( "disconnect" );
    self endon( "joined_spectators" );
    var_1 = 1.0;
    var_2 = 2.0;

    if ( var_0 == 2 )
    {
        var_1 = 0.5;
        var_2 = 0.75;
    }

    for (;;)
    {
        self setclientomnvar( "ui_hud_static", 2 );
        var_3 = randomfloatrange( var_1, var_2 );
        wait( var_3 );
    }
}

_id_10E4A()
{
    self._id_D2DB = 0;
}

_id_10E4B( var_0 )
{
    if ( self._id_D2DB != var_0 && isalive( self ) && !_id_9D29() )
    {
        self._id_D2DB = var_0;

        switch ( var_0 )
        {
            case 0:
                _id_1106A();
                break;
            case 1:
                self._id_2B12 = 1;
                self notify( "emp_stop_static" );
                thread _id_5823();
                thread _id_5826( 1 );
                break;
            case 2:
                self._id_2B12 = 1;
                self notify( "emp_stop_static" );
                self notify( "emp_stop_artifact" );
                thread _id_5826( 2 );
                break;
        }
    }
}

_id_10E49()
{
    return self._id_D2DB;
}

_id_5AA9()
{
    self endon( "disconnect" );
    self notify( "doShockEffects" );
    self endon( "doShockEffects" );
    self setscriptablepartstate( "emped", "active", 0 );
    scripts\engine\utility::waittill_any( "death", "emp_stop_vfx", "game_ended" );
    self setscriptablepartstate( "emped", "neutral", 0 );
}

_id_20C7( var_0 )
{
    thread _id_20C8( var_0 );
}

_id_20C8( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    _id_20C3();
    wait( var_0 );
    _id_E0F3();
}

_id_E24E()
{
    self._id_619B = undefined;
    _id_1106B();
    self notify( "emp_stop_vfx" );
    self stoploopsound( "emp_nade_lp" );
    self _meth_82DA( 0 );
}

_id_61A2()
{
    if ( !isdefined( level._id_61A1 ) )
        _id_61C1();

    return level._id_61A1;
}

_id_61C1( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level._id_B779 )
    {
        if ( isdefined( var_3 ) )
            var_1[var_1.size] = var_3;
    }

    var_5 = getentarray( "misc_turret", "classname" );

    foreach ( var_7 in var_5 )
    {
        if ( isdefined( var_7 ) )
            var_1[var_1.size] = var_7;
    }

    foreach ( var_10 in level._id_12F81 )
    {
        if ( isdefined( var_10 ) )
            var_1[var_1.size] = var_10;
    }

    foreach ( var_13 in level._id_DF74 )
    {
        if ( isdefined( var_13 ) )
            var_1[var_1.size] = var_13;
    }

    foreach ( var_16 in level._id_27EF )
    {
        if ( isdefined( var_16 ) )
            var_1[var_1.size] = var_16;
    }

    foreach ( var_19 in level._id_CC11 )
    {
        if ( isdefined( var_19 ) )
            var_1[var_1.size] = var_19;
    }

    foreach ( var_0 in level.players )
    {
        if ( isdefined( var_0 ) && scripts\mp\utility\game::_id_9EF0( var_0 ) )
            var_1[var_1.size] = var_0;
    }

    level._id_61A1 = var_1;
    thread _id_61B1();
}

_id_61B1()
{
    waittillframeend;
    level._id_61A1 = undefined;
}

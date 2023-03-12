// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_CA2B()
{
    _id_CA29( 1 );
}

_id_CA2C()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "periphVis_end" );
    self._id_CA7D = 1;
    self setclientomnvar( "ui_ringradar_enabled", 1 );
    scripts\mp\utility\game::_id_D915( "ring radar on", self );
    self setscriptablepartstate( "periphVis", "activeOn", 0 );
    thread _id_CA2D();
    _id_0AE2::_id_4575( 4.5, "periphVis_update" );
    thread _id_CA29();
}

_id_CA29( var_0 )
{
    self endon( "disconnect" );
    self notify( "periphVis_end" );
    self notify( "periphVis_update", 0 );

    if ( scripts\mp\utility\game::istrue( var_0 ) )
    {
        self setclientomnvar( "ui_ringradar_enabled", 0 );
        self setscriptablepartstate( "periphVis", "neutral", 0 );
    }
    else
    {
        self setclientomnvar( "ui_ringradar_enabled", 2 );
        wait 0.75;
        self setscriptablepartstate( "periphVis", "activeOff", 0 );
    }

    self._id_CA7D = undefined;
    scripts\mp\utility\game::_id_D915( "ring radar off", self );
}

_id_CA2A()
{
    if ( scripts\mp\utility\game::istrue( self._id_CA7D ) )
        thread _id_CA29( 1 );
}

_id_CA2D()
{
    self endon( "disconnect" );
    self endon( "periphVis_end" );
    scripts\engine\utility::waittill_any( "death", "phase_shift_start" );
    thread _id_CA29( 1 );
}

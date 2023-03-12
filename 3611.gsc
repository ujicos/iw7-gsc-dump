// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._effect["visionPulse_ping"] = loadfx( "vfx/iw7/_requests/mp/vfx_opticwave.vfx" );
}

_id_12F9B()
{
    level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_pulse", undefined, 0.75 );
    thread _id_139A3();
    thread _id_13450();
    return 1;
}

_id_139A3()
{
    if ( !isdefined( self._id_13455 ) )
        self._id_13455 = [];

    self visionsetnakedforplayer( "opticwave_mp", 0.0 );
    self setscriptablepartstate( "visionPulse", "active", 0 );
    self.visionpulsevisionsetactive = 1;
    _id_139A4();

    if ( isdefined( self ) )
    {
        if ( scripts\mp\utility\game::isreallyalive( self ) )
            self visionsetnakedforplayer( "", 0.5 );
        else
            self visionsetnakedforplayer( "", 0.0 );

        self setscriptablepartstate( "visionPulse", "neutral", 0 );
        self.visionpulsevisionsetactive = undefined;
    }
}

_id_139A4()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = self.origin;
    var_1 = anglestoforward( self.angles );
    var_2 = 1000.0;
    var_3 = gettime();
    var_4 = var_3 + var_2;

    while ( gettime() <= var_4 )
    {
        var_5 = ( 1 - ( var_4 - gettime() ) / var_2 ) * 4096;

        foreach ( var_7 in level._id_3CB5 )
        {
            if ( _id_13151( var_7, var_5, var_0, var_1 ) )
                var_7 thread _id_13B9F( self );
        }

        scripts\engine\utility::waitframe();
    }
}

_id_13B9F( var_0 )
{
    var_1 = self getentitynumber();
    var_0._id_13455[var_1] = self;

    if ( !isai( self ) )
        scripts\mp\utility\game::_id_12E5( 5 );

    var_2 = scripts\mp\utility\game::_id_C794( self, "orange", var_0, 0, 1, "killstreak_personal" );
    _id_13BA0( var_0, 5 );

    if ( isdefined( self ) )
    {
        if ( !isai( self ) )
            scripts\mp\utility\game::_id_12E4();
    }

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0._id_13455 ) )
            var_0._id_13455[var_1] = undefined;
    }

    scripts\mp\utility\game::_id_C78F( var_2, self );
}

_id_13BA0( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_2 = gettime() + var_1 * 1000;

    while ( gettime() <= var_2 )
    {
        if ( scripts\mp\utility\game::_id_12D6( "specialty_noscopeoutline" ) )
            break;

        if ( scripts\mp\equipment\phase_shift::_id_9DDF( self ) )
            break;

        scripts\engine\utility::waitframe();
    }
}

_id_13151( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 == self )
        return 0;

    if ( scripts\mp\utility\game::_id_9E05( self.team, var_0 ) )
        return 0;

    if ( _id_9EF9( var_0 ) )
        return 0;

    if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_0 ) )
        return 0;

    if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
        return 0;

    if ( var_0 scripts\mp\utility\game::_id_12D6( "specialty_noscopeoutline" ) )
        return 0;

    var_4 = ( var_0.origin - var_2 ) * ( 1, 1, 0 );

    if ( length2dsquared( var_4 ) > var_1 * var_1 )
        return 0;

    return 1;
}

_id_9EF9( var_0 )
{
    if ( isdefined( self._id_13455 ) )
        return isdefined( self._id_13455[var_0 getentitynumber()] );

    return 0;
}

_id_13450()
{
    var_0 = self geteye();
    var_1 = anglestoforward( self.angles );
    var_2 = var_0 + var_1 * 4096;
    var_3 = spawn( "script_model", var_0 );
    var_3.angles = self.angles;
    var_3 setmodel( "tag_origin" );
    wait 0.1;
    playfxontagforclients( scripts\engine\utility::_id_7ECB( "visionPulse_ping" ), var_3, "tag_origin", self );
    var_3 moveto( var_2, 1.0 );
    wait 1.0;
    var_3 delete();
}

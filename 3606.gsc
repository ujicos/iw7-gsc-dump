// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_98AB()
{
    level._id_C7F2 = [];
}

_id_F7CE()
{
    thread _id_13A4F();
}

_id_12CFF()
{
    self notify( "overdriveUnset" );
    _id_6373( 1 );
}

_id_10DD6()
{
    if ( !scripts\mp\utility\game::_id_9D46() )
        self.health = self.maxhealth;

    self _meth_8209();
    thread _id_13ADF();
    thread _id_13AE0();
    thread _id_13AE1();
    self setscriptablepartstate( "overdrive", "activeOn", 0 );
    level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_overdrive", undefined, 0.75 );
}

_id_6373( var_0 )
{
    self notify( "overdriveEnd" );
    self _meth_8208();

    if ( self._id_AE62 == "archetype_assault" )
    {
        if ( !scripts\mp\utility\game::istrue( var_0 ) )
            self setscriptablepartstate( "overdrive", "activeOff", 0 );

        self setscriptablepartstate( "overdriveMove", "neutral", 0 );
    }
}

_id_13A4F()
{
    self endon( "disconnect" );
    self endon( "overdriveUnset" );
    self notify( "watchForOverdrive" );
    self endon( "watchForOverdrive" );

    for (;;)
    {
        var_0 = spawnstruct();
        childthread _id_13A53( var_0 );
        childthread _id_13A51( var_0 );
        childthread _id_13A50( var_0 );
        childthread _id_13A52( var_0 );
        childthread watchforoverdriveracegameended( var_0 );
        self waittill( "overdriveBeginRace" );
        waittillframeend;

        if ( isdefined( var_0._id_6ACF ) )
            scripts\mp\supers::_id_DE7D();
        else if ( isdefined( var_0._id_10DE6 ) && ( isdefined( var_0._id_637B ) || isdefined( var_0._id_4E59 ) || isdefined( var_0.gameendedreceived ) ) )
            scripts\mp\supers::_id_DE7D();
        else if ( isdefined( var_0._id_4E59 ) )
            _id_6373( 1 );
        else if ( isdefined( var_0._id_637B ) )
            _id_6373( 0 );
        else if ( isdefined( var_0.gameendedreceived ) )
        {
            if ( self _meth_856B() )
            {
                self _meth_85AD();
                _id_6373( 0 );
            }
        }
        else if ( isdefined( var_0._id_10DE6 ) )
            _id_10DD6();

        self notify( "overdriveEndRace" );
    }
}

_id_13A53( var_0 )
{
    self endon( "overdriveEndRace" );
    self waittill( "overdriveStart", var_1, var_2 );
    var_0._id_10DE6 = 1;
    var_0._id_02C5 = var_1;
    var_0._id_6378 = var_2;
    self notify( "overdriveBeginRace" );
}

_id_13A51( var_0 )
{
    self endon( "overdriveEndRace" );
    self waittill( "overdriveEnd" );
    var_0._id_637B = 1;
    self notify( "overdriveBeginRace" );
}

_id_13A50( var_0 )
{
    self endon( "overdriveEndRace" );
    self waittill( "death" );
    var_0._id_4E59 = 1;
    self notify( "overdriveBeginRace" );
}

_id_13A52( var_0 )
{
    self endon( "overdriveEndRace" );
    self waittill( "overdriveFailed" );
    var_0._id_6ACF = 1;
    self notify( "overdriveBeginRace" );
}

watchforoverdriveracegameended( var_0 )
{
    self endon( "overdriveEndRace" );
    level scripts\engine\utility::waittill_any( "bro_shot_start", "game_ended" );
    var_0.gameendedreceived = 1;
    self notify( "overdriveBeginRace" );
}

_id_13ADF()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "overdriveEnd" );
    waittillframeend;

    while ( self _meth_856B() )
    {
        var_0 = scripts\mp\supers::_id_7E4E();
        var_0._id_130EF = self _meth_856C() * scripts\mp\supers::_id_8188() * 1000;
        scripts\mp\supers::_id_112A5();
        scripts\engine\utility::waitframe();
    }
}

_id_13AE1()
{
    var_0 = _func_2E1( self.origin, 72 );
    var_0.time = gettime();
    level._id_C7F2 scripts\engine\utility::_id_22BC( level._id_C7F2 );
    var_1 = undefined;
    var_2 = 0;

    for ( var_3 = 0; var_3 < 3; var_3++ )
    {
        var_4 = level._id_C7F2[var_3];

        if ( !isdefined( var_4 ) )
        {
            var_2 = var_3;
            break;
        }
        else if ( !isdefined( var_1 ) || isdefined( var_1 ) && var_1.time > var_4.time )
        {
            var_1 = var_4;
            var_2 = var_3;
        }
    }

    if ( isdefined( var_1 ) )
        var_1 delete();

    level._id_C7F2[var_2] = var_0;
    var_5 = spawn( "script_origin", var_0.origin );
    var_0 linkto( var_5 );
    thread _id_13AEF( var_0 );
    thread _id_13AF0( var_5 );
    scripts\engine\utility::waittill_any( "death", "disconnect", "overdriveEnd" );

    if ( isdefined( var_0 ) )
        var_0 delete();

    var_5 delete();
}

_id_13AF0( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "overdriveEnd" );

    for (;;)
    {
        var_0 moveto( self.origin, 0.1 );
        wait 0.1;
    }
}

_id_13AEF( var_0 )
{
    var_0 endon( "death" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "overdriveEnd" );
    var_1 = 55225;

    for (;;)
    {
        var_2 = self _meth_816B();

        if ( lengthsquared( var_2 ) < var_1 )
            var_0 _meth_8526( 0 );
        else
        {
            var_3 = vectornormalize( var_2 );
            var_4 = self.origin + var_3 * 25;
            var_0 _meth_852C( 1, var_4, 325 );
            var_0 _meth_8529( 1 );
            var_0 _meth_8526( 1 );
        }

        scripts\engine\utility::waitframe();
    }
}

_id_13AE0()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "overdriveEnd" );
    var_0 = 55225;

    for (;;)
    {
        var_1 = self _meth_816B() * ( 1, 1, 0 );
        var_2 = length2dsquared( var_1 );

        if ( var_2 >= var_0 )
            self setscriptablepartstate( "overdriveMove", "active", 0 );
        else
            self setscriptablepartstate( "overdriveMove", "neutral", 0 );

        wait 0.1;
    }
}

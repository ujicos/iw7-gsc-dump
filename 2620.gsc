// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_980A()
{
    if ( !scripts\engine\utility::_id_16F3( "fx", ::_id_980A ) )
        return;

    scripts\engine\utility::_id_16DC( "create_triggerfx", ::_id_496F );
    thread _id_95F6();
}

_id_95F6()
{
    if ( !isdefined( level._id_128D ) )
        level._id_128D = spawnstruct();

    scripts\engine\utility::_id_4914( "createfx_looper", 20 );
    level._id_128D._id_6D70 = 1;
    level._id_128D._id_69B4 = scripts\common\exploder::_id_69A5;
    waittillframeend;
    waittillframeend;
    level._id_128D._id_69B4 = scripts\common\exploder::_id_69A4;
    level._id_128D._id_F27D = 0;

    if ( getdvarint( "serverCulledSounds" ) == 1 )
        level._id_128D._id_F27D = 1;

    if ( level.createfx_enabled )
        level._id_128D._id_F27D = 0;

    if ( level.createfx_enabled )
        level waittill( "createfx_common_done" );

    for ( var_0 = 0; var_0 < level.createfxent.size; var_0++ )
    {
        var_1 = level.createfxent[var_0];
        var_1 scripts\common\createfx::_id_F3BD();

        switch ( var_1.v["type"] )
        {
            case "loopfx":
                var_1 thread _id_B059();
                break;
            case "oneshotfx":
                var_1 thread _id_C51A();
                break;
            case "soundfx":
                var_1 thread _id_4917();
                break;
            case "soundfx_interval":
                var_1 thread _id_4907();
                break;
            case "reactive_fx":
                var_1 _id_1734();
                break;
        }
    }

    _id_3D65();
}

_id_DFFD()
{

}

_id_C365()
{

}

_id_3D65()
{

}

_id_3DB2( var_0, var_1 )
{

}

_id_D8FD( var_0, var_1, var_2, var_3 )
{
    if ( getdvar( "debug" ) == "1" )
        return;
}

_id_C519( var_0, var_1, var_2, var_3 )
{

}

_id_B052( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = scripts\engine\utility::_id_49E6( var_0 );
    var_7.v["origin"] = var_1;
    var_7.v["angles"] = ( 0, 0, 0 );

    if ( isdefined( var_3 ) )
        var_7.v["angles"] = vectortoangles( var_3 - var_1 );

    var_7.v["delay"] = var_2;
}

_id_4916()
{
    self._id_B051 = playloopedfx( level._effect[self.v["fxid"]], self.v["delay"], self.v["origin"], 0, self.v["forward"], self.v["up"] );
    _id_4917();
}

_id_4917()
{
    self notify( "stop_loop" );

    if ( !isdefined( self.v["soundalias"] ) )
        return;

    if ( self.v["soundalias"] == "nil" )
        return;

    var_0 = 0;
    var_1 = undefined;

    if ( isdefined( self.v["stopable"] ) && self.v["stopable"] )
    {
        if ( isdefined( self._id_B051 ) )
            var_1 = "death";
        else
            var_1 = "stop_loop";
    }
    else if ( level._id_128D._id_F27D && isdefined( self.v["server_culled"] ) )
        var_0 = self.v["server_culled"];

    var_2 = self;

    if ( isdefined( self._id_B051 ) )
        var_2 = self._id_B051;

    var_3 = undefined;

    if ( level.createfx_enabled )
        var_3 = self;

    var_2 scripts\engine\utility::_id_B043( self.v["soundalias"], self.v["origin"], self.v["angles"], var_0, var_1, var_3 );
}

_id_4907()
{
    self notify( "stop_loop" );

    if ( !isdefined( self.v["soundalias"] ) )
        return;

    if ( self.v["soundalias"] == "nil" )
        return;

    var_0 = undefined;
    var_1 = self;

    if ( isdefined( self.v["stopable"] ) && self.v["stopable"] || level.createfx_enabled )
    {
        if ( isdefined( self._id_B051 ) )
        {
            var_1 = self._id_B051;
            var_0 = "death";
        }
        else
            var_0 = "stop_loop";
    }

    var_1 thread scripts\engine\utility::loop_fx_sound_interval_with_angles( self.v["soundalias"], self.v["origin"], self.v["angles"], var_0, undefined, self.v["delay_min"], self.v["delay_max"] );
}

_id_B059()
{
    scripts\engine\utility::waitframe();

    if ( isdefined( self._id_7641 ) )
        level waittill( "start fx" + self._id_7641 );

    for (;;)
    {
        _id_4916();

        if ( isdefined( self._id_11901 ) )
            thread _id_B058( self._id_11901 );

        if ( isdefined( self._id_7642 ) )
            level waittill( "stop fx" + self._id_7642 );
        else
            return;

        if ( isdefined( self._id_B051 ) )
            self._id_B051 delete();

        if ( isdefined( self._id_7641 ) )
        {
            level waittill( "start fx" + self._id_7641 );
            continue;
        }

        return;
    }
}

_id_B058( var_0 )
{
    self endon( "death" );
    wait( var_0 );
    self._id_B051 delete();
}

_id_B065( var_0, var_1, var_2 )
{
    level thread _id_B067( var_0, var_1, var_2 );
}

_id_B067( var_0, var_1, var_2 )
{
    var_3 = spawn( "script_origin", var_1 );
    var_3.origin = var_1;
    var_3 playloopsound( var_0 );
}

_id_86F7( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    thread _id_86F8( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
}

_id_86F8( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    level endon( "stop all gunfireloopfx" );
    scripts\engine\utility::waitframe();

    if ( var_7 < var_6 )
    {
        var_8 = var_7;
        var_7 = var_6;
        var_6 = var_8;
    }

    var_9 = var_6;
    var_10 = var_7 - var_6;

    if ( var_5 < var_4 )
    {
        var_8 = var_5;
        var_5 = var_4;
        var_4 = var_8;
    }

    var_11 = var_4;
    var_12 = var_5 - var_4;

    if ( var_3 < var_2 )
    {
        var_8 = var_3;
        var_3 = var_2;
        var_2 = var_8;
    }

    var_13 = var_2;
    var_14 = var_3 - var_2;
    var_15 = spawnfx( level._effect[var_0], var_1 );

    if ( !level.createfx_enabled )
        var_15 willneverchange();

    for (;;)
    {
        var_16 = var_13 + randomint( var_14 );

        for ( var_17 = 0; var_17 < var_16; var_17++ )
        {
            triggerfx( var_15 );
            wait( var_11 + randomfloat( var_12 ) );
        }

        wait( var_9 + randomfloat( var_10 ) );
    }
}

_id_496F()
{
    if ( !_id_1329E( self.v["fxid"] ) )
        return;

    self._id_B051 = spawnfx( level._effect[self.v["fxid"]], self.v["origin"], self.v["forward"], self.v["up"] );
    triggerfx( self._id_B051, self.v["delay"] );

    if ( !level.createfx_enabled )
        self._id_B051 willneverchange();

    _id_4917();
}

_id_1329E( var_0 )
{
    if ( isdefined( level._effect[var_0] ) )
        return 1;

    if ( !isdefined( level._id_134E ) )
        level._id_134E = [];

    level._id_134E[self.v["fxid"]] = var_0;
    _id_1329F( var_0 );
    return 0;
}

_id_1329F( var_0 )
{
    level notify( "verify_effects_assignment_print" );
    level endon( "verify_effects_assignment_print" );
    wait 0.05;
    var_1 = getarraykeys( level._id_134E );

    foreach ( var_3 in var_1 )
    {

    }
}

_id_C51A()
{
    wait 0.05;

    if ( self.v["delay"] > 0 )
        wait( self.v["delay"] );

    [[ level._id_74C2["create_triggerfx"] ]]();
}

_id_1734()
{
    if ( !scripts\engine\utility::_id_9F64() && getdvar( "createfx" ) == "" )
        return;

    if ( !isdefined( level._id_128D._id_DD5C ) )
    {
        level._id_128D._id_DD5C = 1;
        level thread _id_DD57();
    }

    if ( !isdefined( level._id_128D._id_DD56 ) )
        level._id_128D._id_DD56 = [];

    level._id_128D._id_DD56[level._id_128D._id_DD56.size] = self;
    self._id_BF54 = 3000;
}

_id_DD57()
{
    if ( !scripts\engine\utility::_id_9F64() )
    {
        if ( getdvar( "createfx" ) == "on" )
            scripts\engine\utility::_id_6E4C( "createfx_started" );
    }

    level._id_128D._id_DD5B = [];
    var_0 = 256;

    for (;;)
    {
        level waittill( "code_damageradius", var_1, var_0, var_2, var_3, var_4 );
        var_5 = _id_1042F( var_2, var_0 );

        foreach ( var_8, var_7 in var_5 )
            var_7 thread _id_CDD9( var_8, var_4 );
    }
}

_id_13194( var_0 )
{
    return ( var_0[0], var_0[1], 0 );
}

_id_1042F( var_0, var_1 )
{
    var_2 = [];
    var_3 = gettime();

    foreach ( var_5 in level._id_128D._id_DD56 )
    {
        if ( var_5._id_BF54 > var_3 )
            continue;

        var_6 = var_5.v["reactive_radius"] + var_1;
        var_6 *= var_6;

        if ( distancesquared( var_0, var_5.v["origin"] ) < var_6 )
            var_2[var_2.size] = var_5;
    }

    foreach ( var_5 in var_2 )
    {
        var_9 = _id_13194( var_5.v["origin"] - level.player.origin );
        var_10 = _id_13194( var_0 - level.player.origin );
        var_11 = vectornormalize( var_9 );
        var_12 = vectornormalize( var_10 );
        var_5._id_5ABA = vectordot( var_11, var_12 );
    }

    for ( var_14 = 0; var_14 < var_2.size - 1; var_14++ )
    {
        for ( var_15 = var_14 + 1; var_15 < var_2.size; var_15++ )
        {
            if ( var_2[var_14]._id_5ABA > var_2[var_15]._id_5ABA )
            {
                var_16 = var_2[var_14];
                var_2[var_14] = var_2[var_15];
                var_2[var_15] = var_16;
            }
        }
    }

    foreach ( var_5 in var_2 )
    {
        var_5.origin = undefined;
        var_5._id_5ABA = undefined;
    }

    for ( var_14 = 4; var_14 < var_2.size; var_14++ )
        var_2[var_14] = undefined;

    return var_2;
}

_id_CDD9( var_0, var_1 )
{
    if ( self.v["fxid"] != "No FX" )
        playfx( level._effect[self.v["fxid"]], self.v["origin"], self.v["forward"], self.v["up"] );

    if ( self.v["soundalias"] == "nil" )
        return;

    var_2 = _id_7BFA();

    if ( !isdefined( var_2 ) )
        return;

    self._id_BF54 = gettime() + 3000;
    var_2.origin = self.v["origin"];
    var_2._id_9C80 = 1;

    if ( !isdefined( var_1 ) )
        var_1 = 0.0;

    wait( var_0 * randomfloatrange( 0.05, 0.1 ) + var_1 );

    if ( scripts\engine\utility::_id_9F64() )
    {
        var_2 playsound( self.v["soundalias"], "sounddone" );
        var_2 waittill( "sounddone" );
    }
    else
    {
        var_2 playsound( self.v["soundalias"] );
        wait 2;
    }

    wait 0.1;
    var_2._id_9C80 = 0;
}

_id_7BFA()
{
    foreach ( var_1 in level._id_128D._id_DD5B )
    {
        if ( !var_1._id_9C80 )
            return var_1;
    }

    if ( level._id_128D._id_DD5B.size < 4 )
    {
        var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
        var_1._id_9C80 = 0;
        level._id_128D._id_DD5B[level._id_128D._id_DD5B.size] = var_1;
        return var_1;
    }

    return undefined;
}

_id_D484( var_0, var_1, var_2, var_3 )
{
    var_4 = 0;
    var_5 = [];

    foreach ( var_7 in level.players )
    {
        if ( var_7 _meth_84D9() )
        {
            var_4 = 1;
            continue;
        }

        var_5[var_5.size] = var_7;
    }

    if ( var_4 )
    {
        foreach ( var_7 in var_5 )
            playfx( var_0, var_1, var_2, var_3, var_7 );
    }
    else
        playfx( var_0, var_1, var_2, var_3 );
}

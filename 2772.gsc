// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        return;

    level._id_EE36 = [];
    level._id_EE36["move_time"] = 5;
    level._id_EE36["accel_time"] = 0;
    level._id_EE36["decel_time"] = 0;
    level._id_EE36["wait_time"] = 0;
    level._id_EE36["delay_time"] = 0;
    level._id_EE36["usable"] = 0;
    level._id_EE36["hintstring"] = "activate";
    _id_EE2E( "activate", &"MP_ACTIVATE_MOVER" );
    _id_EE2F( "none", "" );
    level._id_EE41 = [];
    scripts\engine\utility::waitframe();
    var_0 = [];
    var_1 = _id_EE34();

    foreach ( var_3 in var_1 )
        var_0 = scripts\engine\utility::_id_227F( var_0, getentarray( var_3, "classname" ) );

    scripts\engine\utility::_id_22D2( var_0, ::_id_EE3C );
}

_id_EE34()
{
    return [ "script_model_mover", "script_brushmodel_mover" ];
}

_id_EE3D()
{
    if ( isdefined( self._id_EE2D ) )
        return self._id_EE2D;

    var_0 = _id_EE34();

    foreach ( var_2 in var_0 )
    {
        if ( self.classname == var_2 )
        {
            self._id_EE2D = 1;
            return 1;
        }
    }

    return 0;
}

_id_EE2E( var_0, var_1 )
{
    if ( !isdefined( level._id_EE3A ) )
        level._id_EE3A = [];

    level._id_EE3A[var_0] = var_1;
}

_id_EE2F( var_0, var_1 )
{
    if ( !isdefined( level._id_EE42 ) )
        level._id_EE42 = [];

    level._id_EE42[var_0] = var_1;
}

_id_EE3C()
{
    if ( !isdefined( self._id_0334 ) )
        return;

    self._id_EE2D = 1;
    self._id_BD30 = 0;
    self._id_C714 = self;
    self._id_13034 = [];
    self._id_AD1E = [];
    var_0 = scripts\engine\utility::_id_8180( self._id_0334, "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2.script_noteworthy ) )
            continue;

        switch ( var_2.script_noteworthy )
        {
            case "origin":
                if ( !isdefined( var_2.angles ) )
                    var_2.angles = ( 0, 0, 0 );

                self._id_C714 = spawn( "script_model", var_2.origin );
                self._id_C714.angles = var_2.angles;
                self._id_C714 setmodel( "tag_origin" );
                self._id_C714 linkto( self );
                break;
            default:
                break;
        }
    }

    var_4 = getentarray( self._id_0334, "targetname" );

    foreach ( var_2 in var_4 )
    {
        if ( !isdefined( var_2.script_noteworthy ) )
            continue;

        switch ( var_2.script_noteworthy )
        {
            case "use_trigger_link":
                var_2 _meth_80D2();
                var_2 linkto( self );
            case "use_trigger":
                var_2 _id_EE45();
                thread _id_EE4F( var_2 );
                self._id_13034[self._id_13034.size] = var_2;
                break;
            case "link":
                var_2 linkto( self );
                self._id_AD1E[self._id_AD1E.size] = var_2;
                break;
            default:
                break;
        }
    }

    thread _id_EE45();
    thread _id_EE3B();
    thread _id_EE47();
    thread _id_EE32( self );
    thread _id_EE40();

    foreach ( var_8 in self._id_13034 )
        _id_EE4A( var_8, 1 );
}

_id_EE4F( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        var_0 waittill( "trigger" );

        if ( var_0._id_8436.size > 0 )
        {
            self notify( "new_path" );
            thread _id_EE40( var_0 );
            continue;
        }

        self notify( "trigger" );
    }
}

_id_EE3F( var_0 )
{
    if ( isdefined( level._id_EE41[var_0] ) )
    {
        self notify( "new_path" );
        self._id_8436 = [ level._id_EE41[var_0] ];
        thread _id_EE40();
    }
}

_id_1E8B( var_0 )
{
    return ( angleclamp180( var_0[0] ), angleclamp180( var_0[1] ), angleclamp180( var_0[2] ) );
}

_id_EE45()
{
    if ( isdefined( self._id_C907 ) && self._id_C907 )
        return;

    self._id_C907 = 1;
    self._id_8436 = [];
    self._id_BCEA = [];
    self._id_ABDF = [];
    var_0 = [];
    var_1 = [];

    if ( isdefined( self._id_0334 ) )
    {
        var_0 = scripts\engine\utility::_id_8180( self._id_0334, "targetname" );
        var_1 = getentarray( self._id_0334, "targetname" );
    }

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( !isdefined( var_3.script_noteworthy ) )
            var_3.script_noteworthy = "goal";

        switch ( var_3.script_noteworthy )
        {
            case "ignore":
                if ( isdefined( var_3._id_0334 ) )
                {
                    var_4 = scripts\engine\utility::_id_8180( var_3._id_0334, "targetname" );

                    foreach ( var_6 in var_4 )
                        var_0[var_0.size] = var_6;
                }

                break;
            case "goal":
                var_3 _id_EE3B();
                var_3 _id_EE45();
                self._id_8436[self._id_8436.size] = var_3;

                if ( isdefined( var_3._id_C8F0["name"] ) )
                    level._id_EE41[var_3._id_C8F0["name"]] = var_3;

                break;
            case "level_notify":
                if ( isdefined( var_3._id_EE79 ) )
                    self._id_ABDF[self._id_ABDF.size] = var_3;

                break;
            default:
                break;
        }
    }

    foreach ( var_9 in var_1 )
    {
        if ( var_9 _id_EE3D() )
        {
            self._id_BCEA[self._id_BCEA.size] = var_9;
            continue;
        }

        if ( !isdefined( var_9.script_noteworthy ) )
            continue;

        var_10 = strtok( var_9.script_noteworthy, "_" );

        if ( var_10.size != 3 || var_10[1] != "on" )
            continue;

        switch ( var_10[0] )
        {
            case "delete":
                thread _id_EE33( var_9, ::delete, var_10[2] );
                break;
            case "hide":
                thread _id_EE33( var_9, ::hide, var_10[2] );
                break;
            case "show":
                var_9 hide();
                thread _id_EE33( var_9, ::show, var_10[2] );
                break;
            case "triggerHide":
            case "triggerhide":
                thread _id_EE37( var_9, scripts\engine\utility::_id_12778, var_10[2] );
                break;
            case "triggerShow":
            case "triggershow":
                var_9 scripts\engine\utility::_id_12778();
                thread _id_EE37( var_9, scripts\engine\utility::_id_1277A, var_10[2] );
                break;
            default:
                break;
        }
    }
}

_id_EE37( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "death" );

    for (;;)
    {
        self waittill( var_2 );
        var_0 [[ var_1 ]]();
    }
}

_id_EE33( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "death" );

    for (;;)
    {
        self waittill( var_2 );
        var_0 call [[ var_1 ]]();
    }
}

_id_EE4C()
{
    scripts\engine\utility::_id_1277A();
}

_id_EE40( var_0 )
{
    self endon( "death" );
    self endon( "new_path" );

    if ( !isdefined( var_0 ) )
        var_0 = self;

    while ( var_0._id_8436.size != 0 )
    {
        var_1 = scripts\engine\utility::_id_DC6B( var_0._id_8436 );
        var_2 = self;
        var_2 _id_EE32( var_1 );

        if ( isdefined( var_2._id_C8F0["delay_till"] ) )
            level waittill( var_2._id_C8F0["delay_till"] );

        if ( isdefined( var_2._id_C8F0["delay_till_trigger"] ) && var_2._id_C8F0["delay_till_trigger"] )
            self waittill( "trigger" );

        if ( var_2._id_C8F0["delay_time"] > 0 )
            wait( var_2._id_C8F0["delay_time"] );

        var_3 = var_2._id_C8F0["move_time"];
        var_4 = var_2._id_C8F0["accel_time"];
        var_5 = var_2._id_C8F0["decel_time"];
        var_6 = 0;
        var_7 = 0;
        var_8 = transformmove( var_1.origin, var_1.angles, self._id_C714.origin, self._id_C714.angles, self.origin, self.angles );

        if ( var_2.origin != var_1.origin )
        {
            if ( isdefined( var_2._id_C8F0["move_speed"] ) )
            {
                var_9 = distance( var_2.origin, var_1.origin );
                var_3 = var_9 / var_2._id_C8F0["move_speed"];
            }

            if ( isdefined( var_2._id_C8F0["accel_frac"] ) )
                var_4 = var_2._id_C8F0["accel_frac"] * var_3;

            if ( isdefined( var_2._id_C8F0["decel_frac"] ) )
                var_5 = var_2._id_C8F0["decel_frac"] * var_3;

            var_2 moveto( var_8["origin"], var_3, var_4, var_5 );

            foreach ( var_11 in var_1._id_ABDF )
                thread _id_EE46( var_11.origin, var_11._id_EE79, self.origin, var_1.origin );

            var_6 = 1;
        }

        if ( _id_1E8B( var_8["angles"] ) != _id_1E8B( var_2.angles ) )
        {
            var_2 rotateto( var_8["angles"], var_3, var_4, var_5 );
            var_7 = 1;
        }

        foreach ( var_14 in var_2._id_BCEA )
            var_14 notify( "trigger" );

        var_0 notify( "depart" );
        var_2 _id_EE31( 0 );
        self._id_BD30 = 1;

        if ( isdefined( var_2._id_C8F0["move_time_offset"] ) && var_2._id_C8F0["move_time_offset"] + var_3 > 0 )
            wait( var_2._id_C8F0["move_time_offset"] + var_3 );
        else if ( var_6 )
            self waittill( "movedone" );
        else if ( var_7 )
            self waittill( "rotatedone" );
        else
            wait( var_3 );

        self._id_BD30 = 0;
        self notify( "move_end" );
        var_1 notify( "arrive" );

        if ( isdefined( var_2._id_C8F0["solid"] ) )
        {
            if ( var_2._id_C8F0["solid"] )
                var_2 solid();
            else
                var_2 notsolid();
        }

        foreach ( var_14 in var_1._id_BCEA )
            var_14 notify( "trigger" );

        if ( isdefined( var_2._id_C8F0["wait_till"] ) )
            level waittill( var_2._id_C8F0["wait_till"] );

        if ( var_2._id_C8F0["wait_time"] > 0 )
            wait( var_2._id_C8F0["wait_time"] );

        var_2 _id_EE31( 1 );
        var_0 = var_1;
    }
}

_id_EE46( var_0, var_1, var_2, var_3 )
{
    self endon( "move_end" );
    var_4 = self;
    var_5 = vectornormalize( var_3 - var_2 );

    for (;;)
    {
        var_6 = vectornormalize( var_0 - var_4.origin );

        if ( vectordot( var_5, var_6 ) <= 0 )
            break;

        wait 0.05;
    }

    level notify( var_1 );
}

_id_EE3B()
{
    self._id_C8F0 = [];

    if ( !isdefined( self.angles ) )
        self.angles = ( 0, 0, 0 );

    self.angles = _id_1E8B( self.angles );
    _id_EE43( self._id_EE79 );
}

_id_EE43( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "";

    var_1 = strtok( var_0, ";" );

    foreach ( var_3 in var_1 )
    {
        var_4 = strtok( var_3, "=" );

        if ( var_4.size != 2 )
            continue;

        if ( var_4[1] == "undefined" || var_4[1] == "default" )
        {
            self._id_C8F0[var_4[0]] = undefined;
            continue;
        }

        switch ( var_4[0] )
        {
            case "move_time_offset":
            case "decel_frac":
            case "accel_frac":
            case "move_speed":
            case "delay_time":
            case "wait_time":
            case "decel_time":
            case "accel_time":
            case "move_time":
                self._id_C8F0[var_4[0]] = _id_EE44( var_4[1] );
                break;
            case "wait_till":
            case "delay_till":
            case "hintstring":
            case "name":
                self._id_C8F0[var_4[0]] = var_4[1];
                break;
            case "delay_till_trigger":
            case "usable":
            case "solid":
                self._id_C8F0[var_4[0]] = int( var_4[1] );
                break;
            case "script_params":
                var_5 = var_4[1];
                var_6 = level._id_EE42[var_5];

                if ( isdefined( var_6 ) )
                    _id_EE43( var_6 );

                break;
            default:
                break;
        }
    }
}

_id_EE44( var_0 )
{
    var_1 = 0;
    var_2 = strtok( var_0, "," );

    if ( var_2.size == 1 )
        var_1 = float( var_2[0] );
    else if ( var_2.size == 2 )
    {
        var_3 = float( var_2[0] );
        var_4 = float( var_2[1] );

        if ( var_3 >= var_4 )
            var_1 = var_3;
        else
            var_1 = randomfloatrange( var_3, var_4 );
    }

    return var_1;
}

_id_EE32( var_0 )
{
    foreach ( var_3, var_2 in var_0._id_C8F0 )
        _id_EE49( var_3, var_2 );

    _id_EE48();
}

_id_EE49( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 == "usable" && isdefined( var_1 ) )
        _id_EE4A( self, var_1 );

    self._id_C8F0[var_0] = var_1;
}

_id_EE31( var_0 )
{
    if ( self._id_C8F0["usable"] )
        _id_EE4A( self, var_0 );

    foreach ( var_2 in self._id_13034 )
        _id_EE4A( var_2, var_0 );
}

_id_EE4A( var_0, var_1 )
{
    if ( var_1 )
    {
        var_0 makeusable();
        var_0 setcursorhint( "HINT_NOICON" );
        var_0 sethintstring( level._id_EE3A[self._id_C8F0["hintstring"]] );
    }
    else
        var_0 makeunusable();
}

_id_EE47()
{
    self._id_C8F1 = [];

    foreach ( var_2, var_1 in self._id_C8F0 )
        self._id_C8F1[var_2] = var_1;
}

_id_EE48()
{
    foreach ( var_2, var_1 in level._id_EE36 )
    {
        if ( !isdefined( self._id_C8F0[var_2] ) )
            _id_EE49( var_2, var_1 );
    }

    if ( isdefined( self._id_C8F1 ) )
    {
        foreach ( var_2, var_1 in self._id_C8F1 )
        {
            if ( !isdefined( self._id_C8F0[var_2] ) )
                _id_EE49( var_2, var_1 );
        }
    }
}

init()
{
    level thread _id_EE35();
    level thread _id_EE30();
}

_id_EE35()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_D312();
    }
}

_id_EE30()
{
    for (;;)
    {
        level waittill( "spawned_agent", var_0 );
        var_0 thread _id_D312();
    }
}

_id_D312()
{
    self endon( "disconnect" );

    if ( isagent( self ) )
        self endon( "death" );

    self._id_12BE5 = 0;

    for (;;)
    {
        self waittill( "unresolved_collision", var_0 );
        self._id_12BE5++;
        thread _id_418E();
        var_1 = 3;

        if ( isdefined( var_0 ) && isdefined( var_0._id_12BEC ) )
            var_1 = var_0._id_12BEC;

        if ( self._id_12BE5 >= var_1 )
        {
            if ( isdefined( var_0 ) )
            {
                if ( isdefined( var_0._id_12BE7 ) )
                    var_0 [[ var_0._id_12BE7 ]]( self );
                else if ( isdefined( var_0._id_12BE8 ) && var_0._id_12BE8 )
                    var_0 _id_12BED( self );
                else
                    var_0 _id_12BEA( self, undefined, var_0 );
            }
            else
                _id_12BEA( self );

            self._id_12BE5 = 0;
        }
    }
}

_id_418E()
{
    self endon( "unresolved_collision" );
    scripts\engine\utility::waitframe();

    if ( isdefined( self ) )
        self._id_12BE5 = 0;
}

_id_12BED( var_0 )
{
    var_1 = self;

    if ( !isdefined( var_1.owner ) )
    {
        var_0 _id_BCDE();
        return;
    }

    var_2 = 0;

    if ( level.teambased )
    {
        if ( isdefined( var_1.owner.team ) && var_1.owner.team != var_0.team )
            var_2 = 1;
    }
    else if ( var_0 != var_1.owner )
        var_2 = 1;

    if ( !var_2 )
    {
        var_0 _id_BCDE();
        return;
    }

    var_3 = 1000;

    if ( isdefined( var_1._id_12BE6 ) )
        var_3 = var_1._id_12BE6;

    var_0 _meth_80B0( var_3, var_1.origin, var_1.owner, var_1, "MOD_CRUSH" );
}

_id_12BEA( var_0, var_1, var_2 )
{
    if ( isdefined( level._id_C81D ) )
    {
        self [[ level._id_C81D ]]( var_0, var_1 );
        return;
    }

    if ( var_0.sessionstate == "spectator" )
        return;

    var_3 = self._id_12BEB;
    var_4 = undefined;

    if ( isdefined( var_3 ) )
        var_3 = sortbydistance( var_3, var_0.origin );
    else
        var_3 = getnodesinradiussorted( var_0.origin, 500, 0, 128, "path" );

    var_5 = ( 0, 0, -100 );
    var_0 _meth_805B();
    var_0 dontinterpolate();
    var_6 = get_mover_ents( var_2 );
    var_7 = scripts\engine\utility::_id_227F( var_6, level._id_3CB5 );

    for ( var_8 = 0; var_8 < var_3.size; var_8++ )
    {
        if ( var_8 == 3 )
            break;

        var_9 = var_3[var_8];
        var_10 = var_9.origin + ( 0, 0, 10 );
        var_11 = scripts\engine\trace::_id_48BC( 0, 1, 1, 1, 1, 1 );
        var_12 = scripts\engine\trace::_id_DCED( var_0 gettagorigin( "tag_eye" ), var_10, var_7, var_11 );

        if ( isdefined( var_12["hittype"] ) && var_12["hittype"] != "hittype_none" )
            continue;

        if ( !canspawn( var_10 ) )
            continue;

        if ( positionwouldtelefrag( var_10 ) )
            continue;

        if ( var_0 getstance() == "prone" )
            var_0 setstance( "crouch" );

        var_0 setorigin( var_10 );
        return;
    }

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( var_1 )
        var_0 _id_BCDE();
}

get_mover_ents( var_0 )
{
    var_1 = [];
    var_1[var_1.size] = var_0;
    var_2 = var_0 _meth_8138();
    var_3 = var_0 _meth_8137( 1 );

    if ( isdefined( var_2 ) )
        var_1[var_1.size] = var_2;

    if ( isdefined( var_3 ) )
    {
        foreach ( var_5 in var_3 )
            var_1[var_1.size] = var_5;
    }

    return var_1;
}

_id_12BEE( var_0 )
{

}

_id_BCDE()
{
    scripts\mp\utility\game::_id_1417();
}

_id_D246( var_0 )
{
    self endon( "death" );
    self endon( "stop_player_pushed_kill" );

    for (;;)
    {
        self waittill( "player_pushed", var_1, var_2 );

        if ( isplayer( var_1 ) || isagent( var_1 ) )
        {
            var_3 = length( var_2 );

            if ( var_3 >= var_0 )
                _id_12BED( var_1 );
        }
    }
}

_id_11030()
{
    self notify( "stop_player_pushed_kill" );
}

_id_EE38()
{
    var_0 = self _meth_8138();

    for ( var_1 = var_0; isdefined( var_1 ); var_1 = var_1 _meth_8138() )
        var_0 = var_1;

    return var_0;
}

_id_EE4B( var_0 )
{
    var_1 = var_0 _id_EE38();

    if ( isdefined( var_1 ) )
        var_1._id_10E07 = var_1.origin;

    self._id_10E06 = self _meth_8140();

    if ( isdefined( self._id_10E06 ) )
    {
        var_2 = self._id_10E06 _id_EE38();

        if ( isdefined( var_2 ) )
            self._id_10E06 = var_2;

        self._id_10E06._id_10E07 = self._id_10E06.origin;
    }
}

_id_EE39( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    return lengthsquared( var_0.origin - var_0._id_10E07 ) > 0.001;
}

_id_EE4E( var_0 )
{
    if ( !isplayer( self ) )
        return 1;

    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = var_0 _id_EE38();
    var_2 = self._id_10E06;

    if ( !isdefined( var_1 ) && !isdefined( var_2 ) )
        return 1;

    if ( isdefined( var_1 ) && isdefined( var_2 ) && var_1 == var_2 )
        return 1;

    if ( _id_EE39( var_1 ) )
        return 0;

    if ( _id_EE39( var_2 ) )
        return 0;

    return 1;
}

_id_EE3E( var_0 )
{
    if ( isplayer( var_0 ) )
        var_0 _id_EE4B( self );

    var_0 _meth_8423( 0 );
    var_0 allowjump( 0 );
}

_id_EE4D( var_0 )
{
    var_0 _meth_8423( 1 );
    var_0 allowjump( 1 );
}

_id_C13B()
{
    var_0 = self _meth_8137( 0 );

    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_C000 ) && var_2._id_C000 )
            continue;

        var_2 unlink();
        var_2 notify( "invalid_parent", self );
    }
}

_id_D981( var_0, var_1 )
{
    if ( isdefined( var_1 ) && isdefined( var_1._id_BFFF ) && var_1._id_BFFF )
        return;

    if ( isdefined( var_0._id_CF14 ) )
        playfx( scripts\engine\utility::_id_7ECB( "airdrop_crate_destroy" ), self.origin );

    if ( isdefined( var_0._id_4E53 ) )
    {
        var_0._id_AA33 = var_1;
        self thread [[ var_0._id_4E53 ]]( var_0 );
    }
    else
        self delete();
}

_id_892E( var_0 )
{
    self notify( "handle_moving_platform_touch" );
    self endon( "handle_moving_platform_touch" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "stop_handling_moving_platforms" );

    if ( isdefined( var_0._id_6371 ) )
        self endon( var_0._id_6371 );

    for (;;)
    {
        self waittill( "touching_platform", var_1 );

        if ( isdefined( var_0._id_13139 ) && var_0._id_13139 )
        {
            if ( !self istouching( var_1 ) )
            {
                wait 0.05;
                continue;
            }
        }

        thread _id_D981( var_0, var_1 );
        break;
    }
}

_id_892D( var_0 )
{
    self notify( "handle_moving_platform_invalid" );
    self endon( "handle_moving_platform_invalid" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "stop_handling_moving_platforms" );

    if ( isdefined( var_0._id_6371 ) )
        self endon( var_0._id_6371 );

    self waittill( "invalid_parent", var_1 );

    if ( isdefined( var_0._id_9B11 ) )
        self thread [[ var_0._id_9B11 ]]( var_0 );
    else
        thread _id_D981( var_0, var_1 );
}

_id_892F( var_0 )
{
    self notify( "handle_moving_platforms" );
    self endon( "handle_moving_platforms" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "stop_handling_moving_platforms" );

    if ( !isdefined( var_0 ) )
        var_0 = spawnstruct();

    if ( isdefined( var_0._id_6371 ) )
        self endon( var_0._id_6371 );

    if ( isdefined( var_0._id_AD39 ) )
    {
        var_1 = self _meth_8138();

        if ( !isdefined( var_1 ) || var_1 != var_0._id_AD39 )
            self linkto( var_0._id_AD39 );
    }

    thread _id_892E( var_0 );
    thread _id_892D( var_0 );
}

_id_11001()
{
    self notify( "stop_handling_moving_platforms" );
}

_id_BD3C( var_0 )
{

}

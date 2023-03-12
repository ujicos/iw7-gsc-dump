// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( !isdefined( level._id_CC46 ) )
        level._id_CC46 = [];

    if ( !isdefined( level._id_CC43 ) )
        level._id_CC43 = [];

    level._id_6BE0 = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_7545 = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_7546 = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_7547 = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._id_7548 = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
}

_id_7EBE( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = var_0 + var_1 * ( -1 * var_2 );
    var_9 = var_0 + var_1 * var_2;

    if ( var_3 )
    {
        var_8 *= ( 1, 1, 0 );
        var_9 *= ( 1, 1, 0 );
    }

    var_8 += ( 0, 0, var_4 );
    var_9 += ( 0, 0, var_4 );
    var_10 = length( var_8 - var_9 );
    var_11 = var_10 / var_5;
    var_10 = abs( 0.5 * var_10 + var_6 );
    var_12 = var_10 / var_5;
    var_13["startPoint"] = var_8;
    var_13["endPoint"] = var_9;
    var_13["attackTime"] = var_12;
    var_13["flyTime"] = var_11;
    return var_13;
}

_id_5857( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = _id_CC47( var_0, var_1, var_3, var_7, var_8 );
    var_9 endon( "death" );
    var_10 = 150;
    var_11 = var_4 + ( ( randomfloat( 2 ) - 1 ) * var_10, ( randomfloat( 2 ) - 1 ) * var_10, 0 );
    var_9 _id_CC45( var_11, var_6, var_5, var_8 );
    var_9 _id_CC42();
}

_id_CC47( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_1 ) )
        return;

    var_5 = 100;
    var_6 = var_2 + ( ( randomfloat( 2 ) - 1 ) * var_5, ( randomfloat( 2 ) - 1 ) * var_5, 0 );
    var_7 = level._id_CC43[var_4];
    var_8 = undefined;
    var_8 = spawn( "script_model", var_6 );
    var_8.team = var_1.team;
    var_8.origin = var_6;
    var_8.angles = vectortoangles( var_3 );
    var_8._id_AC68 = var_0;
    var_8._id_110EA = var_4;
    var_8.owner = var_1;
    var_8 setmodel( var_7._id_B923[var_1.team] );

    if ( isdefined( var_7._id_4464 ) )
        var_8 _id_F7BF( var_7._id_4464, var_7._id_4463 );

    var_8 thread _id_898C();
    var_8 thread _id_898E();
    _id_10E02( var_8 );

    if ( !isdefined( var_7._id_C06E ) )
        var_8 thread _id_D4FA();

    var_8 playloopsound( var_7._id_93B9 );
    var_8 _id_49DF( var_4 );
    return var_8;
}

_id_CC45( var_0, var_1, var_2, var_3 )
{
    var_4 = level._id_CC43[var_3];
    self moveto( var_0, var_1, 0, 0 );

    if ( isdefined( var_4._id_C4C6 ) )
        self thread [[ var_4._id_C4C6 ]]( var_0, var_1, var_2, self.owner, var_3 );

    if ( isdefined( var_4._id_10407 ) )
        thread _id_D520( var_4._id_10407, 0.5 * var_1 );

    wait( 0.65 * var_1 );

    if ( isdefined( var_4._id_C750 ) )
    {
        self stoploopsound();
        self playloopsound( var_4._id_C750 );
    }

    if ( isdefined( var_4._id_C74F ) )
        self _meth_8294( var_4._id_C74F );

    wait( 0.35 * var_1 );
}

_id_CC42()
{
    var_0 = level._id_CC43[self._id_110EA];

    if ( isdefined( var_0._id_C52E ) )
        thread [[ var_0._id_C52E ]]( self.owner, self, self._id_110EA );

    if ( isdefined( self._id_7424 ) )
    {
        scripts\mp\objidpoolmanager::returnminimapid( self._id_7424 );
        scripts\mp\objidpoolmanager::returnminimapid( self._id_6576 );
    }

    if ( isdefined( self._id_A63A ) )
        self._id_A63A delete();

    _id_11098( self );
    self notify( "delete" );
    self delete();
}

_id_8998( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        if ( var_0 scripts\mp\killstreaks\emp_common::_id_9D29() )
        {
            self notify( "death" );
            return;
        }

        level waittill( "emp_update" );
    }
}

_id_898E()
{
    level endon( "game_ended" );
    self endon( "delete" );
    self waittill( "death" );
    var_0 = anglestoforward( self.angles ) * 200;
    playfx( level._id_6BE0, self.origin, var_0 );
    thread _id_CC42();
}

_id_898C()
{
    self endon( "end_remote" );
    scripts\mp\damage::monitordamage( 800, "helicopter", ::_id_898F, ::_id_B938, 1 );
}

_id_B938( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;
    var_5 = scripts\mp\damage::_id_89C6( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8975( var_1, var_2, var_5 );
    return var_5;
}

_id_898F( var_0, var_1, var_2, var_3 )
{
    var_4 = level._id_CC43[self._id_110EA];
    scripts\mp\damage::onkillstreakkilled( self._id_110EA, var_0, var_1, var_2, var_3, var_4._id_EC44, var_4._id_52DA, var_4._id_3774 );
    scripts\mp\missions::_id_3DE3( var_0, self, var_1 );
}

_id_D4FA()
{
    self endon( "death" );
    wait 0.5;
    playfxontag( level._id_7545, self, "tag_engine_right" );
    wait 0.5;
    playfxontag( level._id_7545, self, "tag_engine_left" );
    wait 0.5;
    playfxontag( level._id_7546, self, "tag_right_wingtip" );
    wait 0.5;
    playfxontag( level._id_7546, self, "tag_left_wingtip" );
    wait 0.5;
    playfxontag( level._id_7548, self, "tag_right_wingtip" );
    wait 0.5;
    playfxontag( level._id_7547, self, "tag_left_wingtip" );
}

_id_806A()
{
    var_0 = getent( "airstrikeheight", "targetname" );

    if ( isdefined( var_0 ) )
        return var_0.origin[2];
    else
    {
        var_1 = 950;

        if ( isdefined( level._id_1AF8 ) )
            var_1 *= level._id_1AF8;

        return var_1;
    }
}

_id_8069( var_0 )
{
    var_1 = spawnstruct();
    var_1.height = _id_806A();
    var_2 = getent( "airstrikeheight", "targetname" );

    if ( isdefined( var_2 ) && isdefined( var_2.script_noteworthy ) && var_2.script_noteworthy == "fixedposition" )
    {
        var_1._id_1157A = var_2.origin;
        var_1._id_6F25 = anglestoforward( var_2.angles );

        if ( randomint( 2 ) == 0 )
            var_1._id_6F25 *= -1;
    }
    else
    {
        var_3 = anglestoforward( self.angles );
        var_4 = anglestoright( self.angles );
        var_1._id_1157A = self.origin + var_0 * var_3;
        var_1._id_6F25 = -1 * var_4;
    }

    return var_1;
}

_id_7EA5( var_0 )
{
    var_1 = 850;
    var_2 = 1500;
    var_3 = var_1 / var_0;
    var_4 = var_3 * var_2;
    return var_4;
}

_id_10E02( var_0 )
{
    var_1 = var_0 getentitynumber();
    level._id_CC46[var_1] = var_0;
}

_id_11098( var_0 )
{
    var_1 = var_0 getentitynumber();
    level._id_CC46[var_1] = undefined;
}

_id_F1AA( var_0, var_1, var_2 )
{
    var_3 = level._id_B339 / 6.46875;

    if ( level._id_10A56 )
        var_3 *= 1.5;

    var_4 = level._id_CC43[var_1];

    if ( isdefined( var_4._id_F1CA ) )
        self playlocalsound( game["voice"][self.team] + var_4._id_F1CA );

    scripts\mp\utility\game::_id_1197( var_1, "map_artillery_selector", var_4._id_3ED0, var_3 );
    self endon( "stop_location_selection" );
    self waittill( "confirm_location", var_5, var_6 );

    if ( !var_4._id_3ED0 )
        var_6 = randomint( 360 );

    self setblurforplayer( 0, 0.3 );

    if ( isdefined( var_4._id_93BA ) )
        self playlocalsound( game["voice"][self.team] + var_4._id_93BA );

    self thread [[ var_2 ]]( var_0, var_5, var_6, var_1 );
    return 1;
}

_id_F7BF( var_0, var_1 )
{
    var_2 = scripts\mp\objidpoolmanager::requestminimapid( 1 );

    if ( var_2 != -1 )
    {
        scripts\mp\objidpoolmanager::minimap_objective_add( var_2, "active", ( 0, 0, 0 ), var_0 );
        scripts\mp\objidpoolmanager::minimap_objective_onentitywithrotation( var_2, self );
    }

    self._id_7424 = var_2;
    var_3 = scripts\mp\objidpoolmanager::requestminimapid( 1 );

    if ( var_3 != -1 )
    {
        scripts\mp\objidpoolmanager::minimap_objective_add( var_3, "active", ( 0, 0, 0 ), var_1 );
        scripts\mp\objidpoolmanager::minimap_objective_onentitywithrotation( var_3, self );
    }

    self._id_6576 = var_3;

    if ( level.teambased )
    {
        if ( var_2 != -1 )
            scripts\mp\objidpoolmanager::minimap_objective_team( var_2, self.team );

        if ( var_3 != -1 )
            scripts\mp\objidpoolmanager::minimap_objective_team( var_3, scripts\mp\utility\game::_id_8027( self.team ) );
    }
    else
    {
        var_4 = self.owner getentitynumber();

        if ( var_2 != -1 )
            scripts\mp\objidpoolmanager::minimap_objective_playerteam( var_2, var_4 );

        if ( var_3 != -1 )
            scripts\mp\objidpoolmanager::minimap_objective_playerenemyteam( var_3, var_4 );
    }
}

_id_D520( var_0, var_1 )
{
    self endon( "death" );
    wait( var_1 );
    self playsoundonmovingent( var_0 );
}

_id_49DF( var_0 )
{
    var_1 = level._id_CC43[var_0];

    if ( isdefined( var_1._id_A640 ) )
    {
        var_2 = anglestoforward( self.angles );
        var_3 = spawn( "script_model", self.origin + ( 0, 0, 100 ) - var_2 * 200 );
        var_3._id_10DFF = gettime();
        var_3 setscriptmoverkillcam( "airstrike" );
        var_3 linkto( self, "tag_origin", var_1._id_A640, ( 0, 0, 0 ) );
        self._id_A63A = var_3;
    }
}

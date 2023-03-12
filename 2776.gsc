// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    precacheshader( "objpoint_default" );
    level._id_C2C1 = [];
    level.objpoints = [];

    if ( level._id_10A56 )
        level._id_C2C4 = 15;
    else
        level._id_C2C4 = 8;

    level._id_C2C0 = 0.75;
    level._id_C2C3 = 1.0;
}

_id_4A23( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_801E( var_0 );

    if ( isdefined( var_6 ) )
        deleteobjpoint( var_6 );

    if ( !isdefined( var_3 ) )
        var_3 = "objpoint_default";

    if ( !isdefined( var_5 ) )
        var_5 = 1.0;

    if ( var_2 != "all" )
        var_6 = newteamhudelem( var_2 );
    else
        var_6 = newhudelem();

    var_6.name = var_0;
    var_6.x = var_1[0];
    var_6.y = var_1[1];
    var_6.z = var_1[2];
    var_6.team = var_2;
    var_6._id_9DFC = 0;
    var_6._id_9F51 = 1;
    var_6 setshader( var_3, level._id_C2C4, level._id_C2C4 );
    var_6 setwaypoint( 1, 0 );

    if ( isdefined( var_4 ) )
        var_6.alpha = var_4;
    else
        var_6.alpha = level._id_C2C0;

    var_6._id_2897 = var_6.alpha;
    var_6.index = level._id_C2C1.size;
    level.objpoints[var_0] = var_6;
    level._id_C2C1[level._id_C2C1.size] = var_0;
    return var_6;
}

deleteobjpoint( var_0 )
{
    if ( level.objpoints.size == 1 )
    {
        level.objpoints = [];
        level._id_C2C1 = [];
        var_0 destroy();
        return;
    }

    var_1 = var_0.index;
    var_2 = level._id_C2C1.size - 1;
    var_3 = _id_801D( var_2 );
    level._id_C2C1[var_1] = var_3.name;
    var_3.index = var_1;
    level._id_C2C1[var_2] = undefined;
    level.objpoints[var_0.name] = undefined;
    var_0 destroy();
}

_id_12EE3( var_0 )
{
    if ( self.x != var_0[0] )
        self.x = var_0[0];

    if ( self.y != var_0[1] )
        self.y = var_0[1];

    if ( self.z != var_0[2] )
        self.z = var_0[2];
}

_id_F7CA( var_0, var_1 )
{
    var_2 = _id_801E( var_0 );
    var_2 _id_12EE3( var_1 );
}

_id_801E( var_0 )
{
    if ( isdefined( level.objpoints[var_0] ) )
        return level.objpoints[var_0];
    else
        return undefined;
}

_id_801D( var_0 )
{
    if ( isdefined( level._id_C2C1[var_0] ) )
        return level.objpoints[level._id_C2C1[var_0]];
    else
        return undefined;
}

_id_10D9B()
{
    self endon( "stop_flashing_thread" );

    if ( self._id_9DFC )
        return;

    self._id_9DFC = 1;

    while ( self._id_9DFC )
    {
        self fadeovertime( 0.75 );
        self.alpha = 0.35 * self._id_2897;
        wait 0.75;
        self fadeovertime( 0.75 );
        self.alpha = self._id_2897;
        wait 0.75;
    }

    self.alpha = self._id_2897;
}

_id_11070()
{
    if ( !self._id_9DFC )
        return;

    self._id_9DFC = 0;
}

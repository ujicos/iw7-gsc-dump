// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_2ABE = [];
}

_id_2A7B()
{
    return 1;
}

_id_1109A()
{

}

_id_B8B1( var_0, var_1 )
{
    self endon( "disconnect" );
    var_2 = scripts\engine\trace::_id_48BC( 0, 1, 1, 1, 1, 0, 0 );
    var_3 = var_1.origin;
    var_4 = anglestoforward( var_1.angles );
    var_5 = var_3 + var_4 * 1920.0;
    var_6 = physics_raycast( var_3, var_5, var_2, var_1, 1, "physicsquery_closest" );
    var_7 = isdefined( var_6 ) && var_6.size > 0;

    if ( var_7 )
    {
        var_8 = var_6[0]["position"];
        var_9 = distance( var_8, var_3 );
        var_10 = vectornormalize( var_3 - var_8 );
        var_11 = var_8 + var_10 * 80.0;
    }
    else
    {
        var_9 = 1920.0;
        var_10 = anglestoforward( var_1.angles );
        var_11 = var_5;
        var_8 = undefined;
    }

    var_12 = distance( var_11, var_3 );

    if ( var_12 < 90 )
    {
        var_13 = 1;
        wait 0.3;

        if ( isdefined( var_1 ) )
        {
            var_1 delete();
            return;
        }
    }
    else
    {
        var_14 = max( var_12 / 980.0, 1.05 );
        var_15 = spawn( "script_model", var_3 );
        var_15 setmodel( "prop_mp_super_blackholegun_projectile" );
        var_15 _meth_831F( self );
        var_15 moveto( var_11, var_14, 0.1, 0.95 );
        var_15.owner = var_1.owner;
        var_15 setscriptmoverkillcam( "rocket" );
        var_16 = var_15.owner scripts\mp\utility\game::_id_1302( "blackholegun_indicator_mp", self.origin, ( 0, 0, 0 ) );
        var_16._id_13C2E = "blackholegun_indicator_mp";
        var_16 linkto( var_15 );
        var_15 thread _id_13A38( var_16, var_2 );
        var_15 thread _id_BA0A( var_14, self, var_16, var_2 );
        var_15 setscriptablepartstate( "projectile", "on", 0 );
        waittillframeend;

        if ( isdefined( var_1 ) )
            var_1 delete();
    }
}

_id_BA0A( var_0, var_1, var_2, var_3 )
{
    self endon( "blackhole_projectile_impact" );
    self endon( "death" );
    thread _id_DA5F( var_1, var_2 );
    wait( var_0 );
    self notify( "blackhole_projectile_arrive" );
    thread _id_DA5E( var_2, var_3 );
}

_id_DA5E( var_0, var_1 )
{
    self endon( "death" );
    self notify( "projectile_arrived" );
    _id_410E();
    var_2 = physics_raycast( self.origin, self.origin - ( 0, 0, 42 ), var_1, undefined, 1, "physicsquery_closest" );
    var_3 = isdefined( var_2 ) && var_2.size > 0;

    if ( var_3 )
    {
        var_4 = var_2[0]["position"];
        self.origin = var_4 + ( 0, 0, 42 );
    }

    var_5 = _id_B29C( var_1 );
    self setscriptablepartstate( "singularity", "singularity", 0 );
    var_6 = _id_10833( 2750 );
    thread _id_13A45( var_5 );
    thread _id_10213();
    thread _id_10211( var_5, self.owner, var_6, var_0 );
    wait 2.0;
    thread _id_10212( self.owner, var_5, var_6, var_0 );
}

_id_C836( var_0 )
{
    self endon( "death" );
    var_0 waittill( "disconnect" );
    self delete();
}

_id_B29C( var_0 )
{
    var_1 = _func_2AF( self.owner, "bhgunfield_mp", self.origin );
    var_1 linkto( self );
    return var_1;
}

_id_10213()
{
    self endon( "death" );
    var_0 = 0.4;
    var_1 = 0.0466;

    for ( var_2 = 0; var_2 < 5; var_2++ )
    {
        scripts\mp\shellshock::_id_1245( ( var_2 + 1 ) * var_1, var_0 * 2, self.origin, 800 );
        wait( var_0 );
    }
}

_id_12896( var_0, var_1, var_2, var_3 )
{
    var_4 = physics_raycast( self.origin, var_1, var_3, self, 0, "physicsquery_closest" );
    var_5 = !( isdefined( var_4 ) && var_4.size > 0 );

    if ( var_5 )
        var_0 _meth_80B0( var_2, self.origin, self.owner, self, "MOD_EXPLOSIVE", "iw7_blackholegun_mp" );
}

_id_13A45( var_0 )
{
    self endon( "death" );
    self endon( "blackhole_die" );
    self.owner endon( "disconnect" );
    var_1 = scripts\engine\trace::_id_48BC( 0, 1, 1, 0, 1, 0 );
    var_2 = 5898.24;

    for (;;)
    {
        foreach ( var_4 in level.players )
        {
            if ( !isdefined( var_4 ) )
                continue;

            if ( !scripts\mp\utility\game::isreallyalive( var_4 ) )
                continue;

            if ( !scripts\mp\equipment\phase_shift::_id_213D( self, var_4 ) )
                continue;

            if ( !level._id_740A && var_4 != self.owner && !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( var_4, self.owner ) ) )
                continue;

            if ( distancesquared( var_4 geteye(), self.origin ) > var_2 )
                continue;

            _id_12896( var_4, var_4 geteye(), 1000, var_1 );
        }

        var_6 = scripts\mp\weapons::_id_7E8C( self.origin, 76.8, 0 );

        foreach ( var_8 in var_6 )
        {
            if ( !isdefined( var_8 ) || !isdefined( var_8.owner ) || isplayer( var_8 ) )
                continue;

            if ( !scripts\mp\equipment\phase_shift::_id_213D( self, var_8 ) )
                continue;

            if ( !level._id_740A && var_8.owner != self.owner && !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( var_8.owner, self.owner ) ) )
                continue;

            if ( distancesquared( var_8.origin, self.origin ) > var_2 )
                continue;

            var_8 _meth_80B0( 18.1818, self.origin, self.owner, self, "MOD_EXPLOSIVE", "iw7_blackholegun_mp" );
        }

        wait 0.2;
    }
}

_id_13A38( var_0, var_1 )
{
    self endon( "death" );
    self endon( "blackhole_projectile_arrive" );
    self.owner endon( "disconnect" );
    wait 0.1;
    var_2 = spawn( "trigger_radius", self.origin - ( 0, 0, 32 ), 0, 24, 64 );
    var_2 _meth_80D2();
    var_2 linkto( self );
    var_2 thread _id_411E( self );

    for (;;)
    {
        var_2 waittill( "trigger", var_3 );

        if ( var_3 == self.owner )
            continue;

        if ( !isplayer( var_3 ) && !isagent( var_3 ) )
            continue;

        if ( !scripts\mp\utility\game::isreallyalive( var_3 ) )
            continue;

        if ( !scripts\mp\equipment\phase_shift::_id_213D( self, var_3 ) )
            continue;

        var_4 = var_3;

        if ( scripts\mp\utility\game::_id_9F22( var_3 ) || scripts\mp\utility\game::_id_9F72( var_3 ) )
            var_4 = var_3.owner;

        if ( !level._id_740A && var_4 != self.owner && !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( var_4, self.owner ) ) )
            continue;

        self notify( "blackhole_projectile_impact" );
        var_3 _meth_80B0( 135, self.origin, self.owner, self, "MOD_EXPLOSIVE", "iw7_blackholegun_mp" );
        self moveto( self.origin, 0.05, 0, 0 );
        thread _id_DA5E( var_0, var_1 );
        break;
    }
}

_id_10212( var_0, var_1, var_2, var_3 )
{
    self setscriptablepartstate( "singularity", "explosion", 0 );
    self _meth_8253( self.origin, 235, 200, 100, self.owner, "MOD_EXPLOSIVE", "iw7_blackholegun_mp" );
    self notify( "singularity_explode" );
    self notify( "blackhole_die" );
    thread _id_4118( var_1, var_2, var_3 );
}

_id_10833( var_0 )
{
    var_1 = _func_2E1( self.origin, 384.0 );
    var_1 _meth_852C( 1, self.origin, var_0 );
    var_1 _meth_8526( 1 );
    var_1.time = gettime();
    level._id_2ABE scripts\engine\utility::_id_22BC( level._id_2ABE );
    var_2 = undefined;
    var_3 = 0;

    for ( var_4 = 0; var_4 < 3; var_4++ )
    {
        var_5 = level._id_2ABE[var_4];

        if ( !isdefined( var_5 ) )
        {
            var_3 = var_4;
            break;
        }
        else if ( !isdefined( var_2 ) || isdefined( var_2 ) && var_2.time > var_5.time )
        {
            var_2 = var_5;
            var_3 = var_4;
        }
    }

    if ( isdefined( var_2 ) )
        var_2 delete();

    level._id_2ABE[var_3] = var_1;
    var_1 thread _id_2B42();
    return var_1;
}

_id_2B42()
{
    self endon( "death" );
    self _meth_8529( 1 );
    scripts\engine\utility::waitframe();
    self _meth_8529( 0 );
}

_id_411E( var_0 )
{
    var_0 scripts\engine\utility::waittill_any( "death", "blackhole_projectile_arrive", "blackhole_projectile_impact" );
    self delete();
}

_id_4118( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        var_1 delete();

    var_0 delete();

    if ( isdefined( var_2 ) )
        var_2 delete();

    wait 3.0;
    self setscriptablepartstate( "singularity", "off", 0 );
    self delete();
}

_id_DA5F( var_0, var_1 )
{
    self endon( "death" );
    self endon( "projectile_arrived" );
    var_0 waittill( "disconnect" );
    _id_410E();

    if ( isdefined( var_1 ) )
        var_1 delete();

    self delete();
}

_id_410E()
{
    self setscriptablepartstate( "projectile", "off", 0 );
}

_id_10211( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    var_1 waittill( "disconnect" );
    thread _id_4118( var_0, var_2, var_3 );
}

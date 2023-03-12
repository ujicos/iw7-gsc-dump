// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_98CB( var_0 )
{
    if ( !isdefined( self._id_9F46 ) )
        return anim.running;

    self._id_C026 = 1;
    return anim.failure;
}

_id_7EA9()
{
    return 1000;
}

_id_69F3( var_0 )
{
    self._id_69F5 = gettime();
    self setscriptablepartstate( "beacon", "activeExplode", 0 );
    self._id_2A9E = 1;
    return anim.success;
}

_id_69F4( var_0 )
{
    if ( gettime() - self._id_69F5 > _id_7EA9() )
    {
        self notify( "seeker_detonate" );
        return anim.running;
    }

    return anim.running;
}

_id_2A70( var_0 )
{
    thread _id_13AEB();
    thread _id_13B35();
    self notify( "entering_passive_mode" );
    return anim.failure;
}

_id_8CA2( var_0 )
{
    self _meth_8284( self.owner );
    return anim.success;
}

_id_8CA3( var_0 )
{
    if ( !scripts\mp\utility\game::isreallyalive( self.owner ) )
        return anim.success;

    var_1 = distancesquared( self.owner.origin, self.origin );

    if ( var_1 <= 10000 )
        return anim.success;

    return anim.running;
}

_id_8CA4( var_0 )
{
    self _meth_841F();
}

_id_136D0( var_0 )
{
    var_1 = distancesquared( self.owner.origin, self.origin );

    if ( var_1 >= 40000 )
    {
        if ( !isdefined( self._id_CB49 ) )
            self._id_CB49 = gettime();
        else if ( gettime() - self._id_CB49 > 100 )
            return anim.failure;
    }
    else
        self._id_CB49 = undefined;

    return anim.running;
}

getseekenemytimeout()
{
    return 1000;
}

_id_2A73( var_0 )
{
    self._id_F109 = gettime();
    return anim.success;
}

_id_2A74( var_0 )
{
    if ( !_id_9F3B() )
        return anim.running;

    return anim.success;
}

_id_7E27()
{
    return 1000;
}

_id_3D47( var_0 )
{
    self._id_3D49 = gettime();
    return anim.success;
}

_id_3D48( var_0 )
{
    self setscriptablepartstate( "beacon", "activeChase", 0 );

    if ( !_id_9F3B() )
    {
        if ( !_id_9FB2() )
        {
            thread scripts\mp\equipment\spider_grenade::spidergrenade_agenttoproxy( self, self.proxy );
            return anim.running;
        }

        self _meth_841F();
    }
    else if ( distancesquared( self._id_F181.origin, self.origin ) <= 4096 )
        self _meth_841F();
    else
        self _meth_8284( self._id_F181 );

    if ( gettime() - self._id_3D49 > 1000 )
        return anim.success;

    return anim.running;
}

_id_24D6( var_0 )
{
    self._id_24D9 = gettime();
    self _meth_8284( self._id_F181 );
    return anim.success;
}

_id_24D7( var_0 )
{
    if ( !_id_9F3B() )
    {
        if ( !_id_9FB2() )
        {
            thread scripts\mp\equipment\spider_grenade::spidergrenade_agenttoproxy( self, self.proxy );
            return anim.running;
        }
    }

    if ( distance2dsquared( self._id_F181.origin, self.origin ) <= 10000 )
    {
        if ( !_id_9FB2() )
        {
            thread scripts\mp\equipment\spider_grenade::spidergrenade_agenttoproxy( self, self.proxy );
            return anim.running;
        }
    }

    if ( isdefined( self._id_24D9 ) && gettime() - self._id_24D9 > 2250 )
    {
        if ( !_id_9FB2() )
        {
            thread scripts\mp\equipment\spider_grenade::spidergrenade_agenttoproxy( self, self.proxy );
            return anim.running;
        }
    }

    return anim.running;
}

_id_6385( var_0 )
{
    self _meth_841F();
    self._id_F181 = undefined;
    return anim.failure;
}

_id_7FDB()
{
    var_0 = undefined;
    var_1 = 0;

    foreach ( var_3 in level._id_3CB5 )
    {
        var_4 = var_3;

        if ( !isdefined( var_3 ) )
            continue;

        if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_3 ) )
            continue;

        if ( isplayer( var_3 ) || isagent( var_3 ) )
        {
            if ( scripts\mp\utility\game::_id_9F72( var_3 ) )
                continue;

            if ( !scripts\mp\utility\game::isreallyalive( var_3 ) )
                continue;

            if ( scripts\mp\utility\game::_id_9F22( var_3 ) )
                var_4 = self.owner;
        }

        if ( !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_4 ) ) )
            continue;

        var_5 = distancesquared( var_3.origin, self.origin );

        if ( var_5 >= 65536 )
            continue;

        if ( !isdefined( var_0 ) || var_5 < var_1 )
        {
            var_0 = var_3;
            var_1 = var_5;
        }
    }

    return var_0;
}

_id_9FB2()
{
    return scripts\mp\utility\game::istrue( self._id_9FB2 );
}

_id_13AEB()
{
    self endon( "death" );
    wait 10.0;
    _id_A6CD();
}

_id_13B35()
{
    self endon( "death" );
    self._id_130F2 = spawn( "script_origin", self.origin + ( 0, 0, 16 ) );
    self._id_130F2.owner = self;
    self._id_130F2 thread _id_4120( self );
    self._id_130F2 setcursorhint( "HINT_NOICON" );
    self._id_130F2 sethintstring( &"MP_PICKUP_SPIDER_GRENADE" );
    self._id_130F2 scripts\mp\utility\game::_id_F838( self.owner );
    self._id_130F2 thread scripts\mp\utility\game::_id_C18A( self.owner );
    self._id_130F2 linkto( self );

    for (;;)
    {
        self._id_130F2 waittill( "trigger", var_0 );
        self.owner playlocalsound( "scavenger_pack_pickup" );
        self.owner notify( "scavenged_ammo", "power_spider_grenade_mp" );
        _id_A6CD();
    }
}

_id_4120( var_0 )
{
    var_0 waittill( "death" );
    self delete();
}

_id_A6CD()
{
    scripts\mp\equipment\spider_grenade::_id_5856( self.origin );
    self suicide();
}

_id_9F3B()
{
    return isdefined( self._id_F181 ) && scripts\mp\utility\game::isreallyalive( self._id_F181 );
}

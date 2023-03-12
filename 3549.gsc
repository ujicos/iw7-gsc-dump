// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_333D( var_0 )
{
    thread _id_333F();
}

_id_333E( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    scripts\mp\utility\game::_id_D915( "c4 spawn", var_0.owner );
    var_0._id_11832 = gettime();
    _id_332E( var_0 );
    thread _id_3340();
    thread _id_333F();

    if ( scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" ) )
        var_0.hasruggedeqp = 1;

    var_0 thread scripts\mp\weapons::_id_B76A();
    var_0 thread _id_3339();
    var_0 thread _id_3334();
    thread scripts\mp\weapons::monitordisownedgrenade( self, var_0 );
    var_0 waittill( "missile_stuck" );
    var_0 _meth_831F( self );
    var_0 _meth_8317( 1 );
    scripts\mp\weapons::_id_C54E( var_0, "power_c4" );
    thread scripts\mp\weapons::_id_B9CA( self, var_0 );
    var_0 thread scripts\mp\weapons::_id_B2A7( "tag_use", 1 );
    var_0 scripts\mp\sentientpoolmanager::registersentient( "Lethal_Static", var_0.owner, 1 );
    var_0 thread _id_3333();
    var_0 thread scripts\mp\perks\perk_equipmentping::_id_E84B();
    var_0 setscriptablepartstate( "plant", "active", 0 );
    thread scripts\mp\weapons::_id_C798( var_0, self );
    var_0 _meth_859F();
    var_0 _meth_85A0();
    var_0 thread scripts\mp\entityheadicons::_id_F73E( self, ( 0, 0, 20 ), 0.1 );
}

_id_3335()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    wait 0.1;
    thread _id_3338( self.owner );
}

_id_3338( var_0 )
{
    scripts\mp\utility\game::_id_D915( "c4 triggered", self.owner );
    thread _id_3330( 0.1 );
    self _meth_82DD( var_0 );
    self _meth_8593();
    self setscriptablepartstate( "plant", "neutral", 0 );
    self setscriptablepartstate( "explode", "active", 0 );
}

_id_3332( var_0 )
{
    thread _id_3330( 0.1 );
    self setscriptablepartstate( "plant", "neutral", 0 );
    self setscriptablepartstate( "destroy", "active", 0 );
}

_id_3330( var_0 )
{
    self notify( "death" );
    level._id_B779[self getentitynumber()] = undefined;
    self setcandamage( 0 );
    scripts\mp\weapons::_id_B2A4();
    self._id_69BA = 1;
    var_1 = self.owner;

    if ( isdefined( self.owner ) )
    {
        var_1._id_CC4C = scripts\engine\utility::array_remove( var_1._id_CC4C, self );
        var_1 notify( "c4_update", 0 );
    }

    wait( var_0 );
    self delete();
}

_id_3339()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = self.owner;
    self waittill( "detonateExplosive", var_1 );

    if ( isdefined( var_1 ) )
        thread _id_3338( var_1 );
    else
        thread _id_3338( var_0 );
}

_id_3333()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self waittill( "emp_damage", var_0, var_1, var_2, var_3, var_4 );

    if ( isdefined( var_3 ) && var_3 == "emp_grenade_mp" )
    {
        if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0 ) ) )
            var_0 scripts\mp\missions::_id_D991( "ch_tactical_emp_eqp" );
    }

    if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0 ) ) )
    {
        var_0 notify( "destroyed_equipment" );
        var_0 scripts\mp\killstreaks\killstreaks::_id_83A0();
    }

    var_5 = "";

    if ( scripts\mp\utility\game::istrue( self.hasruggedeqp ) )
        var_5 = "hitequip";

    if ( isplayer( var_0 ) )
        var_0 scripts\mp\damagefeedback::updatedamagefeedback( var_5 );

    thread _id_3332();
}

_id_3334()
{
    self endon( "death" );
    level scripts\engine\utility::waittill_any( "game_ended", "bro_shot_start" );
    thread _id_3332();
}

c4_validdetonationstate()
{
    if ( !scripts\mp\utility\game::isreallyalive( self ) )
        return 0;

    if ( scripts\mp\utility\game::isusingremote() )
        return 0;

    if ( scripts\mp\equipment\phase_shift::_id_9DDF( self ) )
        return 0;

    if ( scripts\mp\supers\super_reaper::isusingreaper() )
        return 0;

    if ( self _meth_84CA() )
        return 0;

    if ( self _meth_8568() )
        return 0;

    return 1;
}

_id_332F()
{
    return ( gettime() - self._id_11832 ) / 1000 > 0.3;
}

_id_3340()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "c4_unset" );
    level endon( "game_ended" );
    self notify( "watchForDetonation" );
    self endon( "watchForDetonation" );

    for (;;)
    {
        self waittill( "detonate" );
        thread _id_3336();
    }
}

_id_333F()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "c4_unset" );
    level endon( "game_ended" );
    self notify( "watchForAltDetonation" );
    self endon( "watchForAltDetonation" );

    while ( self usebuttonpressed() )
        scripts\engine\utility::waitframe();

    var_0 = 0;

    for (;;)
    {
        if ( self usebuttonpressed() )
        {
            var_0 = 0;

            while ( self usebuttonpressed() )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.5 )
                continue;

            var_0 = 0;

            while ( !self usebuttonpressed() && var_0 < 0.25 )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.25 )
                continue;

            if ( c4_validdetonationstate() )
                thread _id_3336();
        }

        wait 0.05;
    }
}

_id_3336()
{
    if ( isdefined( self._id_334E ) )
    {
        foreach ( var_1 in self._id_334E )
        {
            if ( var_1 _id_332F() )
                var_1 thread _id_3335();
        }
    }
}

c4_resetaltdetonpickup()
{
    if ( _id_0AE2::_id_8C17( "power_c4" ) )
        thread _id_333F();
}

_id_332E( var_0 )
{
    var_1 = self.owner;

    if ( !isdefined( self._id_334E ) )
        self._id_334E = [];

    self._id_334E[var_0 getentitynumber()] = var_0;
    thread _id_333C( var_0 );
}

_id_333B( var_0 )
{
    if ( !isdefined( self._id_334E ) )
        return;

    self._id_334E[var_0] = undefined;
}

_id_333C( var_0 )
{
    self endon( "disconnect" );
    var_1 = var_0 getentitynumber();
    var_0 waittill( "death" );
    _id_333B( var_1 );
}

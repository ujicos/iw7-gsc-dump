// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_69D5()
{
    level._id_69D6 = [];
}

_id_69D0( var_0 )
{
    thread _id_69CC();
}

_id_69D3()
{
    self notify( "exploding_drone_unset" );
    self._id_D38B = undefined;
}

_id_69D4( var_0, var_1 )
{
    var_1 = scripts\mp\utility\game::istrue( var_1 );
    var_0.issmokeversion = var_1;
    var_0._id_11832 = gettime();

    if ( !var_1 )
    {
        thread _id_69CD();
        thread _id_69CC();
        scripts\mp\utility\game::_id_D915( "exploding drone spawn", var_0.owner );
    }
    else if ( scripts\mp\equipment\phase_shift::_id_9DDF( self ) )
        return;

    var_0 thread _id_69C5();
    var_0 thread _id_69D1();
    var_0 thread _id_69C0();
}

_id_69C6()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    wait 0.1;
    thread _id_69C8( self.owner );
}

_id_69C8( var_0 )
{
    var_1 = self.owner;

    if ( !isdefined( var_0 ) )
        var_0 = var_1;

    explodingdrone_awardpointsfordeath( var_0, var_1 );
    self _meth_8593();
    self setscriptablepartstate( "beacon", "neutral", 0 );
    self setscriptablepartstate( "primaryThruster", "neutral", 0 );
    self setscriptablepartstate( "secondaryThrusters", "neutral", 0 );
    var_2 = undefined;

    if ( !self.issmokeversion )
    {
        scripts\mp\utility\game::_id_D915( "exploding drone exploded", var_1 );
        self setscriptablepartstate( "explode", "active", 0 );
        var_2 = 0.1;
    }
    else
    {
        self setscriptablepartstate( "destroySmoke", "active", 0 );
        var_2 = 0.1;
    }

    thread _id_69BF( var_2 );
}

_id_69C2( var_0 )
{
    var_1 = self.owner;

    if ( !isdefined( var_0 ) )
        var_0 = var_1;

    explodingdrone_awardpointsfordeath( var_0, var_1 );

    if ( !self.issmokeversion )
        scripts\mp\utility\game::_id_D915( "exploding drone destroyed", var_1 );

    self _meth_8593();
    self setscriptablepartstate( "beacon", "neutral", 0 );
    self setscriptablepartstate( "primaryThruster", "neutral", 0 );
    self setscriptablepartstate( "secondaryThrusters", "neutral", 0 );

    if ( !self.issmokeversion )
        self setscriptablepartstate( "destroy", "active", 0 );
    else
        self setscriptablepartstate( "destroySmoke", "active", 0 );

    thread _id_69BF( 0.1 );
}

_id_69BF( var_0 )
{
    self notify( "death" );
    self._id_69BA = 1;
    self _meth_8587( 1 );
    self setcandamage( 0 );
    wait( var_0 );
    self delete();
}

explodingdrone_transform()
{
    scripts\mp\utility\game::_id_1302( scripts\engine\utility::ter_op( self.issmokeversion, "power_smoke_drone_transform_mp", "power_exploding_drone_transform_mp" ), self.origin, ( 0, 0, 0 ), 100, 1, self );
    thread explodingdrone_transforminternal();
}

explodingdrone_transforminternal()
{
    self endon( "death" );
    self _meth_8587( 1 );
    var_0 = 1 - ( gettime() - self._id_11832 ) / 1000;

    if ( self.issmokeversion )
        var_0 += 0.1;

    wait( var_0 );
    self _meth_8587( 0 );
}

_id_69D2()
{
    self endon( "death" );

    if ( !self.issmokeversion )
        self setscriptablepartstate( "transform", "active", 0 );
    else
        self setscriptablepartstate( "transformSmoke", "active", 0 );

    wait 0.4;
    self setscriptablepartstate( "primaryThruster", "active", 0 );
    wait 0.25;
    self setscriptablepartstate( "secondaryThrusters", "active", 0 );
    wait 0.4;

    if ( !self.issmokeversion )
        self setscriptablepartstate( "beacon", "active", 0 );
    else
        self setscriptablepartstate( "smoke", "active", 0 );
}

_id_69C5()
{
    self endon( "death" );
    self endon( "exploding_drone_transform" );
    self.owner endon( "disconnect" );
    self waittill( "missile_stuck", var_0, var_1 );
    self notify( "exploding_drone_stuck" );
    var_2 = isdefined( var_1 ) && var_1 == "tag_flicker";
    var_3 = isdefined( var_1 ) && var_1 == "tag_weapon";

    if ( !self.issmokeversion )
    {
        if ( isdefined( var_0 ) && ( isplayer( var_0 ) || isagent( var_0 ) ) && !var_3 && !var_2 )
        {
            if ( scripts\mp\equipment\phase_shift::_id_213D( var_0, self ) )
                var_0 _meth_80B0( 35, self.origin, self.owner, self, "MOD_IMPACT", scripts\engine\utility::ter_op( self.issmokeversion, "power_smoke_drone_mp", "power_exploding_drone_mp" ) );
        }
    }

    explodingdrone_transform();
    thread _id_69C2();
    self delete();
}

_id_69D1()
{
    self endon( "death" );
    self endon( "exploding_drone_stuck" );
    self.owner endon( "disconnect" );
    var_0 = self.owner;
    self _meth_82DD( var_0 );
    self _meth_831F( var_0 );
    var_1 = anglestoforward( var_0 _meth_857C() );
    var_2 = var_0 geteye() + var_1 * 2500;
    var_3 = scripts\engine\utility::ter_op( self.issmokeversion, 0.1, 0.2 );
    wait( var_3 );
    self notify( "exploding_drone_transform" );
    var_4 = self.origin;
    var_5 = self.angles;
    explodingdrone_transform();
    self.origin = var_4;
    self.angles = var_5;
    self _meth_82DD( var_0 );
    self _meth_831F( var_0 );
    var_0 _id_69BC( self );
    thread _id_69D2();
    var_6 = var_0 scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" );

    if ( var_6 )
        self.hasruggedeqp = 1;

    var_7 = scripts\engine\utility::ter_op( var_6, 57, 38 );
    var_8 = scripts\engine\utility::ter_op( var_6, "hitequip", "" );
    thread scripts\mp\damage::monitordamage( var_7, var_8, ::_id_69CA, ::explodingdrone_handledamage, 0, 0 );
    self _meth_859F();
    self _meth_85A0();

    if ( !self.issmokeversion )
        scripts\mp\sentientpoolmanager::registersentient( "Lethal_Moving", var_0, 1 );

    thread _id_69C9( var_2 );
    thread _id_69C3();
    thread _id_69C4();
    thread scripts\mp\perks\perk_equipmentping::_id_E84B();
    thread scripts\mp\weapons::_id_C798( self, var_0 );
    var_9 = scripts\engine\utility::_id_107E6();
    var_9 thread _id_69C1( self );
    self linkto( var_9 );
    var_10 = 4;

    if ( self.issmokeversion )
    {
        if ( issubstr( var_0 getcurrentweapon(), "iw7_unsalmg_mpl" ) )
            var_10 = 10;
        else
            var_10 = 6;
    }

    var_9 moveto( var_2, var_10, 3, 0 );
    wait( var_10 );
    thread _id_69C8();
}

_id_69C9( var_0 )
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    var_1 = vectornormalize( var_0 - self.origin );
    var_2 = scripts\engine\trace::_id_48BC( 1, 1, 1, 0, 1, 1, 0 );

    for (;;)
    {
        if ( physics_spherecast( self.origin, self.origin + var_1 * 12, 6, var_2, [ self, self.owner ], "physicsquery_any" ) )
            thread _id_69C8();

        scripts\engine\utility::waitframe();
    }
}

_id_69C3()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self waittill( "emp_damage", var_0, var_1, var_2, var_3, var_4 );

    if ( isdefined( var_3 ) && var_3 == "emp_grenade_mp" )
    {
        if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0 ) ) )
            var_0 scripts\mp\missions::_id_D991( "ch_tactical_emp_eqp" );
    }

    explodingdrone_givedamagefeedback( var_0 );
    thread _id_69C2( var_0 );
}

_id_69C4()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    level scripts\engine\utility::waittill_any( "game_ended", "bro_shot_start" );
    thread _id_69C2();
}

explodingdrone_validdetonationstate()
{
    if ( !scripts\mp\utility\game::isreallyalive( self ) )
        return 0;

    if ( scripts\mp\utility\game::isusingremote() )
        return 0;

    if ( scripts\mp\equipment\phase_shift::_id_9DDF( self ) )
        return 0;

    if ( isusingreaper() )
        return 0;

    if ( self _meth_84CA() )
        return 0;

    if ( self _meth_8568() )
        return 0;

    return 1;
}

_id_69BD()
{
    return ( gettime() - self._id_11832 ) / 1000 > 0.3;
}

_id_69CD()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "exploding_drone_unset" );
    level endon( "game_ended" );
    self notify( "explodingDrone_listenForDetonate" );
    self endon( "explodingDrone_listenForDetonate" );

    for (;;)
    {
        self waittillmatch( "detonate", "power_exploding_drone_mp" );

        if ( explodingdrone_validdetonationstate() )
            _id_69C7();
    }
}

_id_69CC()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "exploding_drone_unset" );
    level endon( "game_ended" );
    self notify( "explodingDrone_listenForAltDetonate" );
    self endon( "explodingDrone_listenForAltDetonate" );
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

            while ( !self usebuttonpressed() && var_0 < 0.5 )
            {
                var_0 += 0.05;
                wait 0.05;
            }

            if ( var_0 >= 0.5 )
                continue;

            if ( !scripts\mp\equipment\phase_shift::_id_9DDF( self ) && !scripts\mp\utility\game::isusingremote() )
                _id_69C7();
        }

        wait 0.05;
    }
}

_id_69C7()
{
    if ( !isdefined( self._id_D38B ) )
        return;

    foreach ( var_1 in self._id_D38B )
    {
        if ( var_1 _id_69BD() )
            var_1 thread _id_69C6();
    }
}

_id_69BC( var_0 )
{
    if ( !isdefined( self._id_D38B ) )
        self._id_D38B = [];

    if ( !isdefined( level._id_69D6 ) )
        level._id_69D6 = [];

    var_1 = var_0 getentitynumber();

    if ( !isdefined( self._id_D38B[var_1] ) )
        self._id_D38B[var_1] = var_0;

    if ( !isdefined( level._id_69D6[var_1] ) )
        level._id_69D6[var_1] = var_0;

    thread _id_69CF( var_0 );
}

_id_69CE( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = var_0 getentitynumber();

    if ( isdefined( self ) && isdefined( self._id_D38B ) )
        self._id_D38B[var_1] = undefined;

    if ( isdefined( level._id_69D6 ) )
        level._id_69D6[var_1] = undefined;
}

_id_69CF( var_0 )
{
    var_1 = var_0 getentitynumber();
    var_0 waittill( "death" );
    _id_69CE( var_0, var_1 );
}

isexplodingdrone()
{
    var_0 = self getentitynumber();
    var_1 = level._id_69D6[var_0];
    return isdefined( var_1 ) && var_1 == self;
}

explodingdrone_givedamagefeedback( var_0 )
{
    var_1 = "";

    if ( scripts\mp\utility\game::istrue( self.hasruggedeqp ) )
        var_1 = "hitequip";

    if ( isplayer( var_0 ) )
        var_0 scripts\mp\damagefeedback::updatedamagefeedback( var_1 );
}

explodingdrone_awardpointsfordeath( var_0, var_1 )
{
    if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( var_1, var_0 ) ) )
    {
        self _meth_82DD( var_0 );
        var_0 notify( "destroyed_equipment" );

        if ( !self.issmokeversion )
            var_0 notify( "killed_exploding_drone", var_1 );

        var_0 thread scripts\mp\utility\game::_id_83B4( "destroyed_equipment" );
    }
}

explodingdrone_makedamageimmune( var_0 )
{
    if ( !isdefined( self.entsimmune ) )
        self.entsimmune = [];

    self.entsimmune[var_0 getentitynumber()] = var_0;
}

explodingdrone_isdamageimmune( var_0 )
{
    if ( !isexplodingdrone() )
        return 0;

    if ( !isdefined( self.entsimmune ) )
        return 0;

    return isdefined( self.entsimmune[var_0 getentitynumber()] );
}

explodingdrone_modifieddamage( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( var_0 ) && isdefined( var_3 ) )
    {
        if ( var_3 explodingdrone_isdamageimmune( var_1 ) )
            var_4 = 0;
    }

    return var_4;
}

explodingdrone_handledamage( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !scripts\mp\equipment\phase_shift::_id_213D( var_0, self ) )
        return 0;

    if ( scripts\engine\utility::_id_9D74( var_2 ) )
    {
        if ( isdefined( var_1 ) )
        {
            var_5 = getweaponbasename( var_1 );

            switch ( var_5 )
            {
                case "iw7_steeldragon_mp":
                    var_3 *= 3;
                    break;
                case "micro_turret_gun_mp":
                    var_3 *= 2;
                    break;
                default:
                    var_6 = 1;

                    if ( var_3 >= scripts\mp\weapons::minegettwohitthreshold() )
                        var_6 += 1;

                    if ( scripts\mp\utility\game::_id_9DFF( var_1, var_2 ) )
                        var_6 *= 2;

                    var_3 = var_6 * 19;
            }
        }
    }

    _id_0AE2::equipmenthit( self.owner, var_0, var_1, var_2 );
    return var_3;
}

_id_69CA( var_0, var_1, var_2, var_3 )
{
    self._id_4D3F = var_0;
    thread _id_69C8( var_0 );
}

_id_69C0()
{
    self endon( "death" );
    self.owner waittill( "disconnect" );
    self delete();
}

_id_69C1( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );
    self delete();
}

isusingreaper()
{
    if ( !isplayer( self ) )
        return 0;

    if ( !scripts\mp\utility\game::isreallyalive( self ) )
        return 0;

    if ( isdefined( self._id_11234 ) )
    {
        var_0 = self._id_11234._id_10E47._id_DE3F;

        if ( !isdefined( var_0 ) || var_0 != "super_reaper" )
            return 0;

        return scripts\mp\utility\game::istrue( self._id_11234._id_9E53 );
    }

    return 0;
}

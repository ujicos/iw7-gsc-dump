// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_109B8()
{
    level._id_109BE = [];
    level._id_109BE = scripts\engine\utility::_id_1756( level._id_109BE, "specialty_fastreload" );
    level._id_109BE = scripts\engine\utility::_id_1756( level._id_109BE, "specialty_quickdraw" );
    level._id_109BE = scripts\engine\utility::_id_1756( level._id_109BE, "specialty_quickswap" );
}

_id_109C1( var_0 )
{
    if ( !isalive( self ) )
    {
        var_0 delete();
        return;
    }

    var_0 waittill( "missile_stuck", var_1 );
    var_2 = self canplayerplacesentry( 1, 12 );
    var_3 = spawn( "script_model", var_0.origin );
    var_3.angles = var_0.angles;
    var_3.team = self.team;
    var_3.owner = self;
    var_3 setmodel( "prop_mp_speed_strip_temp" );
    var_3 thread _id_109B4( self );
    var_3 thread _id_109C3();
    var_3 thread _id_109B5( self );
    var_3 thread _id_109BF( self );
    var_3 thread scripts\mp\weapons::_id_66B4();
    var_3 _meth_831F( self );
    var_3 scripts\mp\weapons::_id_69FF( var_2["entity"], 1 );

    if ( isdefined( var_0 ) )
        var_0 delete();

    var_3 thread _id_109B3( self );
    var_3 thread _id_109B9( 45 );

    if ( isdefined( var_1 ) )
        var_3 scripts\mp\weapons::_id_69FF( var_1, 1 );

    if ( level.teambased )
        var_3 scripts\mp\entityheadicons::_id_F877( self.team, ( 0, 0, 40 ) );
    else
        var_3 scripts\mp\entityheadicons::_id_F7F2( self, ( 0, 0, 40 ) );

    scripts\mp\weapons::_id_C5AC( var_3, "power_speedStrip" );
}

_id_109B4( var_0 )
{
    scripts\mp\damage::monitordamage( 100, "trophy", ::_id_109B7, ::_id_109BC, 0 );
}

_id_109B7( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self.owner ) && var_0 != self.owner )
    {
        var_0 scripts\mp\killstreaks\killstreaks::_id_83A0();
        var_0 notify( "destroyed_equipment" );
    }

    self notify( "detonateExplosive" );
}

_id_109BC( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;
    var_5 = scripts\mp\damage::_id_89C3( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8999( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8975( var_1, var_2, var_5 );
    return var_5;
}

_id_109C3()
{
    level endon( "game_ended" );
    self waittill( "detonateExplosive" );
    self scriptmodelclearanim();
    self stoploopsound();
    scripts\mp\weapons::_id_66A6();
    self notify( "death" );
    var_0 = self.origin;
    wait 3;

    if ( isdefined( self ) )
    {
        if ( isdefined( self._id_A63A ) )
            self._id_A63A delete();

        scripts\mp\weapons::_id_66A8();
        scripts\mp\weapons::_id_51B5();
    }
}

_id_109B5( var_0 )
{
    self endon( "death" );
    var_0 waittill( "disconnect" );
    self notify( "detonateExplosive" );
}

_id_109BF( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    var_0 waittill( "spawned_player" );
    self notify( "detonateExplosive" );
}

_id_109C2( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    self.trigger setcursorhint( "HINT_NOICON" );
    self.trigger sethintstring( &"MP_PICKUP_SPEED_STRIP" );
    self.trigger scripts\mp\utility\game::_id_F838( var_0 );
    self.trigger thread scripts\mp\utility\game::_id_C18A( var_0 );

    for (;;)
    {
        self.trigger waittill( "trigger", var_0 );
        self stoploopsound();
        self scriptmodelclearanim();
        var_0 setweaponammoclip( "speed_strip_mp", 1 );
        scripts\mp\weapons::_id_51B5();
        self notify( "death" );
    }
}

_id_109B9( var_0 )
{
    self endon( "death" );
    wait( var_0 );
    self notify( "detonateExplosive" );
}

_id_109B3( var_0 )
{
    var_1 = spawn( "trigger_rotatable_radius", self.origin, 0, 50, 100 );
    var_1.angles = self.angles;
    var_1 thread _id_13B54( var_0, self );
    var_1 thread _id_13B4E( self, 1 );
    var_1 thread _id_13B51( self );
    self._id_72FE = ::_id_109C0;
    self._id_72F5 = ::_id_109B6;
    self._id_109AB = 5;

    foreach ( var_3 in level.players )
    {
        if ( !isdefined( var_3 ) || !scripts\mp\utility\game::isreallyalive( var_3 ) )
            continue;

        var_3 thread _id_D534( self, self.origin );
    }
}

_id_13B54( var_0, var_1 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_2 );

        if ( var_2.team != var_0.team )
            continue;

        if ( scripts\mp\equipment\charge_mode::_id_3CEE( var_2 ) )
            continue;

        if ( !isdefined( var_2._id_109B2 ) )
        {
            var_2._id_109B2 = 1;

            foreach ( var_4 in level._id_109BE )
                var_2 scripts\mp\utility\game::giveperk( var_4 );

            if ( !( isdefined( var_2._id_D782 ) && var_2 _id_0AE2::_id_8C17( "power_speedBoost" ) && var_2._id_D782["power_speedBoost"]._id_0019 ) )
            {
                var_2._id_109BB = 0.2;
                var_2 scripts\mp\weapons::_id_12ED5();
                var_2 thread _id_13B53();
                var_2._id_109BD = var_0;
                scripts\mp\gamescore::_id_11AC9( var_0, var_2, "power_speedBoost" );
            }

            if ( isplayer( var_2 ) )
            {
                var_2._id_109A9 = spawnfxforclient( scripts\engine\utility::_id_7ECB( "speed_strip_screen" ), var_2 geteye(), var_2 );
                triggerfx( var_2._id_109A9 );
            }

            var_2 notify( "speed_strip_start" );
            var_2 thread _id_13B50( var_1._id_109AB );
            var_2 thread _id_13B86( self );
            var_2 thread _id_13B4F();
        }
    }
}

_id_13B86( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( isdefined( self ) )
        {
            if ( !isdefined( var_0 ) || !self istouching( var_0 ) )
            {
                self notify( "start_speed_strip_linger" );
                break;
            }
        }

        scripts\engine\utility::waitframe();
    }
}

_id_13B50( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "start_speed_strip_linger" );
    wait( var_0 );
    self notify( "speed_strip_end" );
}

_id_13B4F()
{
    level endon( "game_ended" );
    scripts\engine\utility::waittill_any( "speed_strip_end", "death", "disconnect" );

    if ( isdefined( self ) )
        _id_41E0();
}

_id_41E0()
{
    if ( isdefined( self._id_109B2 ) )
    {
        self._id_109B2 = undefined;
        self._id_109BA = undefined;

        foreach ( var_1 in level._id_109BE )
            scripts\mp\utility\game::_id_E150( var_1 );

        if ( isdefined( self._id_109BB ) )
        {
            self._id_109BB = undefined;
            scripts\mp\weapons::_id_12ED5();
            scripts\mp\gamescore::_id_12D6E( self._id_109BD, self, "power_speedBoost" );
            self._id_109BD = undefined;
        }

        if ( isdefined( self._id_109A9 ) )
            self._id_109A9 delete();
    }
}

_id_13B4E( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    level endon( "game_ended" );

    if ( isdefined( var_5 ) )
        self endon( var_5 );

    var_0 waittill( "death" );

    if ( isdefined( var_2 ) )
    {
        if ( isdefined( var_3 ) )
        {
            switch ( var_3 )
            {
                case "player_linger":
                    if ( isplayer( self ) && isdefined( self._id_109B2 ) && !isdefined( self._id_109BA ) )
                    {
                        self notify( var_4 );
                        self._id_109BA = 1;
                    }

                    break;
            }
        }
    }
    else if ( isdefined( var_4 ) )
        self notify( var_4 );

    if ( isdefined( var_1 ) )
    {
        if ( isdefined( self ) )
            self delete();
    }
}

_id_13B53()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = 0.2;
    var_1 = 0.1;

    while ( var_0 >= var_1 )
    {
        wait 1.5;
        var_0 -= 0.05;
        self._id_109BB = var_0;
        scripts\mp\weapons::_id_12ED5();
    }
}

_id_13B51( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        if ( self.origin != var_0.origin )
            self.origin = var_0.origin;

        wait 0.5;
    }
}

_id_D534( var_0, var_1 )
{
    var_0 endon( "death" );
    var_2 = undefined;
    var_3 = var_1;
    var_4 = 1;

    for (;;)
    {
        if ( isdefined( var_0 ) && var_4 )
        {
            if ( self.team == var_0.team )
                var_2 = spawnfxforclient( scripts\engine\utility::_id_7ECB( "speed_strip_friendly" ), var_3, self, anglestoup( var_0.angles ), anglestoforward( var_0.angles ) );
            else
                var_2 = spawnfxforclient( scripts\engine\utility::_id_7ECB( "speed_strip_enemy" ), var_3, self, anglestoup( var_0.angles ), anglestoforward( var_0.angles ) );

            if ( isdefined( var_2 ) )
            {
                triggerfx( var_2 );
                var_2 thread _id_13B4E( var_0, 1 );
                thread _id_13B52( var_0, var_3, var_2, "disconnect", "spawned_player", 1 );
                thread _id_13B52( var_0, var_3, var_2, undefined, "disconnect", 0 );
            }

            var_4 = 0;
        }

        wait 0.5;

        if ( var_3 != var_0.origin )
        {
            if ( isdefined( var_2 ) )
                var_2 delete();

            var_3 = var_0.origin;
            self notify( "speed_strip_moved" );
            var_4 = 1;
        }
    }
}

_id_13B52( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_0 endon( "death" );
    self endon( "speed_strip_moved" );

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    self waittill( var_4 );

    if ( isdefined( var_2 ) )
        var_2 delete();

    if ( isdefined( var_5 ) && var_5 )
        thread _id_D534( var_0, var_1 );
}

_id_109C0()
{
    self._id_109AB = 10;
}

_id_109B6()
{
    self._id_109AB = 5;
}

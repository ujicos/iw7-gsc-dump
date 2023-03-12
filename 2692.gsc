// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_18A0()
{
    level._effect["adrenaline_mist_friendly"] = loadfx( "vfx/core/mp/equipment/vfx_adrenaline_device_mist_friend" );
    level._effect["adrenaline_mist_enemy"] = loadfx( "vfx/core/mp/equipment/vfx_adrenaline_device_mist_enemy" );
    level._effect["adrenaline_mist_screen"] = loadfx( "vfx/iw7/_requests/mp/vfx_adreno_fp_scrn" );
}

_id_18A5( var_0 )
{
    if ( !isalive( self ) )
    {
        var_0 delete();
        return;
    }

    if ( self isonladder() || !self isonground() || self iswallrunning() )
    {
        var_0 delete();
        return;
    }

    var_0 hide();
    var_1 = self canplayerplacesentry( 1, 12 );

    if ( var_1["result"] )
    {
        var_0.origin = var_1["origin"];
        var_0.angles = var_1["angles"];
    }
    else
    {
        var_0.origin = self.origin;
        var_0.angles = self.angles;
    }

    var_0 show();
    self playlocalsound( "trophy_turret_plant_plr" );
    self playsoundtoteam( "trophy_turret_plant_npc", "allies", self );
    self playsoundtoteam( "trophy_turret_plant_npc", "axis", self );
    var_2 = spawn( "script_model", var_0.origin );
    var_2.angles = var_0.angles;
    var_2.team = self.team;
    var_2.owner = self;
    var_2 setmodel( "mp_trophy_system_iw6" );
    var_2 thread _id_189C( self );
    var_2 thread _id_18A7();
    var_2 thread _id_189D( self );
    var_2 thread _id_18A3( self );
    var_2 thread scripts\mp\weapons::_id_66B4();

    if ( isdefined( var_0 ) )
        var_0 delete();

    var_2 thread scripts\mp\weapons::_id_4988( "mp_trophy_system_iw6_bombsquad", "tag_origin", self );
    var_2 thread _id_189B( self );
    var_2 thread _id_18A1( 45 );

    if ( level.teambased )
        var_2 scripts\mp\entityheadicons::_id_F877( self.team, ( 0, 0, 65 ) );
    else
        var_2 scripts\mp\entityheadicons::_id_F7F2( self, ( 0, 0, 65 ) );

    scripts\mp\weapons::_id_C5AC( var_2, "power_adrenalineMist" );
    var_2 thread _id_CEA3();
}

_id_189C( var_0 )
{
    scripts\mp\damage::monitordamage( 100, "trophy", ::_id_189F, ::_id_18A2, 0 );
}

_id_189F( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( self.owner ) && var_0 != self.owner )
    {
        var_0 scripts\mp\killstreaks\killstreaks::_id_83A0();
        var_0 notify( "destroyed_equipment" );
    }

    self notify( "detonateExplosive" );
}

_id_18A2( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;
    var_5 = scripts\mp\damage::_id_89C3( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8999( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8975( var_1, var_2, var_5 );
    return var_5;
}

_id_18A7()
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

_id_189D( var_0 )
{
    self endon( "death" );
    var_0 waittill( "disconnect" );
    self notify( "detonateExplosive" );
}

_id_18A3( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    var_0 waittill( "spawned_player" );
    self notify( "detonateExplosive" );
}

_id_18A6( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    var_0 endon( "death" );
    self.trigger setcursorhint( "HINT_NOICON" );
    self.trigger sethintstring( &"MP_PICKUP_ADRENALINE_MIST" );
    self.trigger scripts\mp\utility\game::_id_F838( var_0 );
    self.trigger thread scripts\mp\utility\game::_id_C18A( var_0 );

    for (;;)
    {
        self.trigger waittill( "trigger", var_0 );
        self stoploopsound();
        self scriptmodelclearanim();
        var_0 setweaponammoclip( "adrenaline_mist_mp", 1 );
        scripts\mp\weapons::_id_51B5();
        self notify( "death" );
    }
}

_id_18A1( var_0 )
{
    self endon( "death" );
    wait( var_0 );
    self notify( "detonateExplosive" );
}

_id_189B( var_0 )
{
    var_1 = spawn( "trigger_radius", self.origin, 0, 150, 100 );
    var_1 thread _id_13992( var_0, self );
    var_1 thread _id_1398E( self );
    var_1 thread _id_13990( self );
    self._id_72FE = ::_id_18A4;
    self._id_72F5 = ::_id_189E;
    self._id_FCA3 = 40;

    foreach ( var_3 in level.players )
    {
        if ( !isdefined( var_3 ) || !scripts\mp\utility\game::isreallyalive( var_3 ) )
            continue;

        var_3 thread _id_CEA4( self, self.origin );
    }
}

_id_13992( var_0, var_1 )
{
    self endon( "death" );
    var_2 = 0;

    for (;;)
    {
        self waittill( "trigger", var_3 );

        if ( var_3.team != var_0.team )
            continue;

        if ( !isdefined( var_3._id_189A ) || var_2 != var_1._id_FCA3 )
        {
            if ( var_2 != var_1._id_FCA3 )
            {
                var_3 _id_4193();
                var_3 notify( "exit_adrenaline_mist" );
            }

            var_3._id_189A = 1;
            var_3 scripts\mp\utility\game::_id_F741( var_1._id_FCA3 );
            var_2 = var_1._id_FCA3;

            if ( isplayer( var_3 ) )
            {
                var_3._id_1894 = spawnfxforclient( scripts\engine\utility::_id_7ECB( "adrenaline_mist_screen" ), var_3 geteye(), var_3 );
                triggerfx( var_3._id_1894 );
                scripts\mp\gamescore::_id_11AC9( var_0, var_3, "adrenaline_mist_mp" );
            }

            var_3 notify( "enter_adrenaline_mist" );
            var_3 setclientomnvar( "ui_adrenaline_mist", 1 );
            var_3 thread _id_13B83( self, var_0 );
            var_3 thread _id_1398F( self );
            var_3 thread _id_13A09( self );
        }
    }
}

_id_13B83( var_0, var_1 )
{
    self endon( "death" );
    var_0 endon( "death" );

    for (;;)
    {
        if ( isdefined( self ) )
        {
            if ( !self istouching( var_0 ) )
            {
                _id_4193();
                self notify( "exit_adrenaline_mist" );
                scripts\mp\gamescore::_id_12D6E( var_1, self, "adrenaline_mist_mp" );
                break;
            }
        }

        scripts\engine\utility::waitframe();
    }
}

_id_1398F( var_0 )
{
    self endon( "exit_adrenaline_mist" );
    var_0 waittill( "death" );

    if ( isdefined( self ) )
        _id_4193();
}

_id_13A09( var_0 )
{
    self endon( "exit_adrenaline_mist" );
    var_0 endon( "death" );
    self waittill( "death" );

    if ( isdefined( self ) )
        _id_4193();
}

_id_4193()
{
    if ( isdefined( self._id_189A ) )
    {
        self._id_189A = undefined;
        scripts\mp\utility\game::_id_41B4();

        if ( isdefined( self._id_1894 ) )
            self._id_1894 delete();

        self setclientomnvar( "ui_adrenaline_mist", 0 );
    }
}

_id_1398E( var_0 )
{
    level endon( "game_ended" );
    var_0 waittill( "death" );

    if ( isdefined( self ) )
        self delete();
}

_id_13990( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        if ( self.origin != var_0.origin )
            self.origin = var_0.origin;

        wait 0.5;
    }
}

_id_CEA4( var_0, var_1 )
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
                var_2 = spawnfxforclient( scripts\engine\utility::_id_7ECB( "adrenaline_mist_friendly" ), var_3, self );
            else
                var_2 = spawnfxforclient( scripts\engine\utility::_id_7ECB( "adrenaline_mist_enemy" ), var_3, self );

            if ( isdefined( var_2 ) )
            {
                triggerfx( var_2 );
                var_2 thread _id_1398E( var_0 );
                thread _id_13991( var_0, var_3, var_2, "disconnect", "spawned_player", 1 );
                thread _id_13991( var_0, var_3, var_2, undefined, "disconnect", 0 );
            }

            var_4 = 0;
        }

        wait 0.5;

        if ( var_3 != var_0.origin )
        {
            if ( isdefined( var_2 ) )
                var_2 delete();

            var_3 = var_0.origin;
            self notify( "adrenaline_mist_moved" );
            var_4 = 1;
        }
    }
}

_id_13991( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_0 endon( "death" );
    self endon( "adrenaline_mist_moved" );

    if ( isdefined( var_3 ) )
        self endon( var_3 );

    self waittill( var_4 );

    if ( isdefined( var_2 ) )
        var_2 delete();

    if ( isdefined( var_5 ) && var_5 )
        thread _id_CEA4( var_0, var_1 );
}

_id_CEA3()
{

}

_id_18A4()
{
    self._id_FCA3 = 60;
}

_id_189E()
{
    self._id_FCA3 = 40;
}

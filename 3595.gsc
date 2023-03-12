// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_13DFB()
{
    level._effect["wristrocket_explode"] = loadfx( "vfx/iw7/_requests/mp/power/vfx_wrist_rocket_exp.vfx" );
    level._effect["wristrocket_thruster"] = loadfx( "vfx/iw7/_requests/mp/power/vfx_wrist_rocket_thruster" );
}

_id_13DF4()
{
    thread wristrocket_watcheffects();
}

_id_13DF5()
{
    self notify( "wristRocket_unset" );
}

_id_13DFC( var_0 )
{
    if ( var_0._id_118A1 == 1 )
        return;

    var_1 = _id_13DF0( var_0 );
    var_1._id_015F = var_0;
    var_0 = scripts\mp\utility\game::_id_1302( "wristrocket_mp", self.origin, ( 0, 0, 0 ), 100, 1, var_0 );
    var_0 _meth_8587( 1 );
    var_0 linkto( var_1 );
    var_0 thread _id_13DEF( var_1 );
    var_1 setscriptablepartstate( "launch", "active", 0 );
    var_1 thread _id_13DF8( 2 );
    var_1 thread _id_13DF9();
}

_id_13DF8( var_0 )
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self notify( "wristRocket_watchFuse" );
    self endon( "wristRocket_watchFuse" );
    wait( var_0 );
    thread _id_13DF2();
}

_id_13DF9()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self playloopsound( "wrist_rocket_fire_tail" );
    self waittill( "missile_stuck", var_0 );

    if ( isplayer( var_0 ) )
        self.owner scripts\mp\weapons::_id_85DD( self, var_0 );

    self stoploopsound();
    self setscriptablepartstate( "beacon", "active", 0 );
    self._id_015F _meth_8587( 0 );
    thread _id_13DF8( 1 );
}

_id_13DF2()
{
    self setscriptablepartstate( "beacon", "neutral", 0 );
    self setscriptablepartstate( "explode", "active", 0 );
    thread _id_13DF1();
}

_id_13DF1()
{
    self notify( "death" );
    self._id_69BA = 1;
    wait 0.1;
    self delete();
}

_id_13DF0( var_0 )
{
    var_1 = scripts\mp\utility\game::_id_1309( "wristrocket_proj_mp", var_0.origin, var_0.origin + anglestoforward( self _meth_857C() ), self );
    var_1.owner = self;
    var_1.team = self.team;
    var_1._id_13C2E = "wristrocket_proj_mp";
    var_1._id_D719 = "power_wristrocket";
    var_1 _meth_831F( self );
    var_1 _meth_82DD( self );
    var_1 thread _id_13DEE( self );
    return var_1;
}

wristrocket_watcheffects()
{
    self endon( "disconnect" );
    self notify( "wristRocket_watchEffects" );
    self endon( "wristRocket_watchEffects" );
    var_0 = 0;

    for (;;)
    {
        var_1 = spawnstruct();

        if ( var_0 )
            childthread wristrocket_watcheffectsraceheldoffhandbreak( var_1 );
        else
            childthread wristrocket_watcheffectsracegrenadepullback( var_1 );

        childthread wristrocket_watcheffectsracegrenadefired( var_1 );
        childthread wristrocket_watcheffectsracesuperstarted( var_1 );
        childthread wristrocket_watcheffectsracedeath( var_1 );
        childthread wristrocket_watcheffectsraceunset( var_1 );
        var_0 = 0;
        self waittill( "wristRocket_watchEffectsRaceStart" );
        waittillframeend;
        var_2 = scripts\mp\utility\game::istrue( var_1.grenadepullback );
        var_3 = scripts\mp\utility\game::istrue( var_1.grenadefire );
        var_4 = scripts\mp\utility\game::istrue( var_1.superstarted );
        var_5 = scripts\mp\utility\game::istrue( var_1._id_00E6 );
        var_6 = scripts\mp\utility\game::istrue( var_1._id_12BF4 );
        var_7 = scripts\mp\utility\game::istrue( var_1.heldoffhandbreak );

        if ( var_5 )
        {
            self notify( "wristRocket_watchEffectsRaceEnd" );
            thread wristrocket_endeffects();
            return;
        }
        else if ( var_6 )
        {
            self notify( "wristRocket_watchEffectsRaceEnd" );
            thread wristrocket_endeffects();
            return;
        }
        else if ( var_4 )
            thread wristrocket_endeffects();
        else if ( var_7 )
            thread wristrocket_endeffects();
        else if ( var_3 )
            thread wristrocket_endeffects();
        else if ( var_2 )
        {
            thread wristrocket_begineffects();
            var_0 = 1;
        }

        self notify( "wristRocket_watchEffectsRaceEnd" );
    }
}

wristrocket_watcheffectsracegrenadepullback( var_0 )
{
    self endon( "wristRocket_watchEffectsRaceEnd" );

    for (;;)
    {
        self waittill( "grenade_pullback", var_1 );

        if ( var_1 == "wristrocket_mp" )
            break;
    }

    var_0.grenadepullback = 1;
    self notify( "wristRocket_watchEffectsRaceStart" );
}

wristrocket_watcheffectsracegrenadefired( var_0 )
{
    self endon( "wristRocket_watchEffectsRaceEnd" );

    for (;;)
    {
        self waittill( "grenade_fire", var_1, var_2 );

        if ( var_2 == "wristrocket_mp" )
            break;
    }

    var_0.grenadefire = 1;
    self notify( "wristRocket_watchEffectsRaceStart" );
}

wristrocket_watcheffectsracesuperstarted( var_0 )
{
    self endon( "wristRocket_watchEffectsRaceEnd" );
    self waittill( "super_started" );
    var_0.superstarted = 1;
    self notify( "wristRocket_watchEffectsRaceStart" );
}

wristrocket_watcheffectsracedeath( var_0 )
{
    self endon( "wristRocket_watchEffectsRaceEnd" );
    self waittill( "death" );
    var_0._id_00E6 = 1;
    self notify( "wristRocket_watchEffectsRaceStart" );
}

wristrocket_watcheffectsraceunset( var_0 )
{
    self endon( "wristRocket_watchEffectsRaceEnd" );
    self waittill( "wristRocket_unset" );
    var_0._id_12BF4 = 1;
    self notify( "wristRocket_watchEffectsRaceStart" );
}

wristrocket_watcheffectsraceheldoffhandbreak( var_0 )
{
    self endon( "wristRocket_watchEffectsRaceEnd" );
    scripts\engine\utility::waitframe();

    while ( self _meth_854D() == "wristrocket_mp" )
        scripts\engine\utility::waitframe();

    var_0.heldoffhandbreak = 1;
    self notify( "wristRocket_watchEffectsRaceStart" );
}

wristrocket_begineffects()
{
    self notify( "wristRocket_beginEffects" );
    self endon( "wristRocket_beginEffects" );
    self endon( "wristRocket_endEffects" );
    self setscriptablepartstate( "wristRocketWorld", "neutral", 0 );
    wait 0.15;
    self setscriptablepartstate( "wristRocketWorld", "active", 0 );
}

wristrocket_endeffects()
{
    self notify( "wristRocket_endEffects" );
    self setscriptablepartstate( "wristRocketWorld", "neutral", 0 );
}

_id_13DFA( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_1 != var_2 )
        return;

    if ( var_3 != "MOD_SUICIDE" )
        return;

    if ( !isdefined( var_0 ) || var_0 != var_1 )
        return;

    if ( !isdefined( var_4 ) || var_4 != "wristrocket_mp" )
        return;

    var_5 = var_2 gettagorigin( "tag_weapon_left" );
    radiusdamage( var_5, 175, 200, 70, var_1, "MOD_EXPLOSIVE", "wristrocket_mp" );
    scripts\mp\shellshock::_id_858B( var_5, 0.6 );
    playloopsound( var_5, "wrist_rocket_explode" );
    playfx( scripts\engine\utility::_id_7ECB( "wristrocket_explode" ), var_5 );
}

_id_13DEF( var_0, var_1 )
{
    self endon( "death" );
    self notify( "cleanupOnParentDeath" );
    self endon( "cleanupOnParentDeath" );

    if ( isdefined( var_0 ) )
        var_0 waittill( "death" );

    if ( isdefined( var_1 ) )
        wait( var_1 );

    self delete();
}

_id_13DEE( var_0 )
{
    self endon( "death" );
    var_0 waittill( "disconnect" );

    if ( isdefined( self ) )
        self delete();
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._effect["spider_explode"] = loadfx( "vfx/core/expl/grenadeexp_default" );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "spiderbot", ::_id_1288A );
}

_id_1288A( var_0 )
{
    var_1 = 0;

    if ( !var_1 )
        return 0;

    _id_10DF3( var_0._id_110EA );
    thread _id_13B56();
    thread _id_13B57();
    thread _id_13B55();
    return 1;
}

_id_13B56()
{
    self endon( "disconnect" );
    self endon( "detonate_spiderbot" );
    self notifyonplayercommand( "manual_explode", "+attack" );
    self notifyonplayercommand( "manual_explode", "+attack_akimbo_accessible" );
    self waittill( "manual_explode" );
    self notify( "detonate_spiderbot" );
}

_id_13B58()
{
    self endon( "disconnect" );
    self endon( "detonate_spiderbot" );
    self notifyonplayercommand( "toggle_thermal", "+smoke" );
    var_0 = 0;

    for (;;)
    {
        self waittill( "toggle_thermal" );

        if ( !var_0 )
        {
            self _meth_83C0();
            var_0 = 1;
            continue;
        }

        self thermalvisionoff();
        var_0 = 0;
    }
}

_id_13B57()
{
    self endon( "disconnect" );
    self endon( "detonate_spiderbot" );
    self notifyonplayercommand( "shoot_web", "+speed_throw" );

    for (;;)
    {
        self waittill( "shoot_web" );

        if ( !isdefined( self._id_13CE7 ) )
        {
            self._id_13CE7 = 1;
            var_0 = anglestoforward( self getplayerangles() );
            var_1 = self geteye() + var_0 * 20 + ( 0, 0, 20 );
            var_2 = var_1 + var_0;
            var_3 = scripts\mp\utility\game::_id_1309( "iw7_webhook_mp", var_1, var_2, self );
            thread _id_13BB0( var_3, var_1 );
            thread _id_13BB1( 2, var_3 );
        }
    }
}

_id_13BAF()
{
    self notifyonplayercommand( "web_cut", "+gostand" );
    self waittill( "web_cut" );

    if ( isdefined( self._id_13CE7 ) )
    {
        self._id_AD32 = undefined;
        self._id_13CE7 = undefined;
        self unlink();
    }
}

_id_13BB0( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "detonate_spiderbot" );
    self endon( "web_cut" );
    var_0 waittill( "explode", var_2 );
    var_3 = scripts\engine\utility::_id_107E6();
    var_3._id_1155F = _id_7F05( var_2, 50, 1, 50 );
    var_3.origin = var_2;
    var_4 = scripts\engine\utility::_id_107E6();
    var_4.origin = var_1;
    var_4.angles = vectortoangles( var_2 - var_4.origin );
    self._id_AD32 = var_4;
    self _meth_823C( var_4, "tag_origin", 0.5 );

    if ( isdefined( var_3._id_1155F ) && isplayer( var_3._id_1155F ) )
    {
        var_3 linkto( var_3._id_1155F );
        thread _id_13B79( var_3 );

        for ( var_5 = 0.5; distance2dsquared( var_4.origin, var_3.origin ) > 400 || !isdefined( var_3._id_1155F ); var_5 = max( 0.05, var_5 ) )
        {
            var_4 rotateto( vectortoangles( var_3.origin - var_4.origin ), 0.3 );
            var_4 moveto( var_3.origin, var_5 );
            wait( var_5 );
            var_5 -= 0.25;
        }

        self notify( "detonate_spiderbot" );
    }
    else
    {
        var_4 moveto( var_3.origin, 0.5 );
        var_4 thread _id_13AD8( var_3.origin, self );
    }
}

_id_13B79( var_0 )
{
    var_0 endon( "death" );
    self endon( "detonate_spiderbot" );
    var_0._id_1155F scripts\engine\utility::waittill_any( "phase_shift_power_activated", "rewind_activated", "powers_teleport_used", "powers_transponder_used", "orbital_deployment_action", "death", "disconnect" );
    var_0._id_1155F = undefined;
}

_id_13AD8( var_0, var_1 )
{
    var_1 endon( "disconnect" );
    var_1 endon( "detonate_spiderbot" );
    var_1 endon( "web_cut" );

    while ( self.origin != var_0 )
        scripts\engine\utility::waitframe();

    var_1 notify( "detonate_spiderbot" );
}

_id_13BB1( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "detonate_spiderbot" );
    var_1 endon( "explode" );
    wait( var_0 );
    self._id_13CE7 = undefined;
}

_id_13B55()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "detonate_spiderbot", var_0 );
    var_1 = self.origin;
    var_2 = 500;
    var_3 = 200;

    if ( !isdefined( var_0 ) )
        radiusdamage( var_1, 256, var_2, var_3, self, "MOD_EXPLOSIVE", "killstreak_spiderbot_mp" );

    playfx( scripts\engine\utility::_id_7ECB( "spider_explode" ), var_1 );
    playloopsound( var_1, "frag_grenade_explode" );
    playrumbleonentity( "grenade_rumble", var_1 );
    earthquake( 0.5, 0.75, var_1, 800 );

    foreach ( var_5 in level.players )
    {
        if ( var_5 scripts\mp\utility\game::isusingremote() )
            continue;

        if ( distancesquared( var_1, var_5.origin ) > 360000 )
            continue;

        var_5 setclientomnvar( "ui_hud_shake", 1 );
    }

    _id_1108D();
}

_id_10DF3( var_0 )
{
    self setclientomnvar( "ui_spiderbot_controls", 1 );
    self _meth_83C0();
    self _meth_83BE();
    _id_511C( 0.05, "spiderbot_steps" );
    scripts\engine\utility::_id_1C71( 0 );
    scripts\engine\utility::_id_1C6E( 0 );
    self _meth_845A( "spiderbot_mp" );
    self setmodel( "alien_minion" );
    self _meth_8427( 0 );
    self _meth_8422( 0 );
    self _meth_800A( 0 );
    self _meth_8010( 0 );
    self _meth_8012( 0 );
    self _meth_8412( 1 );
    self _meth_8454( 8 );
    self setscriptablepartstate( "CompassIcon", "spiderbot" );
    return 1;
}

_id_1108D()
{
    self setclientomnvar( "ui_spiderbot_controls", 0 );
    self thermalvisionoff();
    self thermalvisionfofoverlayoff();
    self _meth_83AD();
    scripts\engine\utility::_id_1C71( 1 );
    scripts\engine\utility::_id_1C6E( 1 );

    if ( isdefined( self._id_13CE7 ) )
    {
        self._id_AD32 = undefined;
        self._id_13CE7 = undefined;
        self unlink();
    }

    self setscriptablepartstate( "CompassIcon", "defaulticon" );
}

_id_7F05( var_0, var_1, var_2, var_3 )
{
    var_4 = [];
    var_5 = undefined;

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_6 = var_1 * var_1;

    foreach ( var_8 in level.players )
    {
        if ( _id_38C1( var_8, var_0, var_6, var_2, var_3 ) )
        {
            var_5 = var_8;
            break;
        }
    }

    return var_5;
}

_id_38C1( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_0.origin;
    var_6 = distance2dsquared( var_1, var_5 );
    return var_6 < var_2 && ( !var_3 || scripts\mp\weapons::_id_13C7E( var_1, var_5, var_4, var_0 ) );
}

_id_511C( var_0, var_1 )
{
    self endon( "death" );
    wait( var_0 );
    self playloopsound( var_1 );
}

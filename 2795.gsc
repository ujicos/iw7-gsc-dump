// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._effect["slide_dust"] = loadfx( "vfx/core/screen/vfx_scrnfx_tocam_slidedust_m" );
    level._effect["hit_left"] = loadfx( "vfx/core/screen/vfx_blood_hit_left" );
    level._effect["hit_right"] = loadfx( "vfx/core/screen/vfx_blood_hit_right" );
    level._effect["melee_spray"] = loadfx( "vfx/core/screen/vfx_melee_blood_spray" );
}

_id_FC6A( var_0, var_1 )
{
    if ( isdefined( self._id_6ECA ) && gettime() < self._id_6ECA )
        return;

    if ( var_0 == "MOD_EXPLOSIVE" || var_0 == "MOD_GRENADE" || var_0 == "MOD_GRENADE_SPLASH" || var_0 == "MOD_PROJECTILE" || var_0 == "MOD_PROJECTILE_SPLASH" )
    {
        if ( var_1 > 10 )
        {
            if ( isplayer( self ) && self _meth_84CA() )
                return;

            if ( isdefined( self._id_FC6B ) && self._id_FC6B )
                self shellshock( "frag_grenade_mp", self._id_FC6B );
            else
                self shellshock( "frag_grenade_mp", 0.5 );
        }
    }
}

_id_636E()
{
    self waittill( "death" );
    waittillframeend;
    self notify( "end_explode" );
}

_id_858A( var_0, var_1 )
{
    self notify( "grenade_earthQuake" );
    self endon( "grenade_earthQuake" );
    thread _id_636E();
    self endon( "end_explode" );
    var_2 = undefined;

    if ( !isdefined( var_1 ) || var_1 )
        self waittill( "explode", var_2 );
    else
        var_2 = self.origin;

    _id_858C( var_2, var_0 );
}

_id_858B( var_0, var_1, var_2 )
{
    _id_858C( var_0, var_1, var_2 );
}

_id_858C( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    _id_13B9( "grenade_rumble", var_0, var_2 );
    var_3 = 0.45 * var_1;
    var_4 = 0.7;
    var_5 = 800;
    _id_1245( var_3, var_4, var_0, var_5, var_2 );
    _id_13BE( var_0, 600, var_2 );
}

_id_2BC2( var_0 )
{
    self endon( "disconnect" );

    if ( !scripts\mp\utility\game::isreallyalive( self ) )
        return;

    var_1 = vectornormalize( anglestoforward( self.angles ) );
    var_2 = vectornormalize( anglestoright( self.angles ) );
    var_3 = vectornormalize( var_0 - self.origin );
    var_4 = vectordot( var_3, var_1 );
    var_5 = vectordot( var_3, var_2 );

    if ( var_4 > 0 && var_4 > 0.5 )
        return;

    if ( abs( var_4 ) < 0.866 )
    {
        var_6 = level._effect["hit_left"];

        if ( var_5 > 0 )
            var_6 = level._effect["hit_right"];

        var_7 = [ "death", "damage" ];
        thread _id_CD1D( var_6, var_7, 7.0 );
    }
    else
    {

    }
}

_id_2BC3( var_0 )
{
    self endon( "disconnect" );

    if ( isdefined( var_0 ) && scripts\mp\utility\game::_id_8234( var_0 ) == "iw7_axe" && self getweaponammoclip( var_0 ) > 0 )
    {
        if ( !isdefined( self.axeswingnum ) )
            self.axeswingnum = 1;

        var_1 = "axe_blood_" + self.axeswingnum;
        thread activateaxeblood( var_1 );
        self.axeswingnum++;

        if ( self.axeswingnum > 5 )
        {
            self.axeswingnum = 1;
            return;
        }
    }
    else
    {
        wait 0.5;
        var_2 = [ "death" ];
        thread _id_CD1D( level._effect["melee_spray"], var_2, 1.5 );
    }
}

activateaxeblood( var_0 )
{
    self endon( "disconnect" );
    self setscriptablepartstate( var_0, "blood" );
    wait 5;
    self setscriptablepartstate( var_0, "neutral" );
}

_id_CD1D( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    var_3 = spawnfxforclient( var_0, self geteye(), self );
    triggerfx( var_3 );
    var_3 _meth_82EC();
    scripts\engine\utility::_id_1372E( var_1, var_2 );
    var_3 delete();
}

_id_3337()
{
    thread _id_636E();
    self endon( "end_explode" );
    self waittill( "explode", var_0 );
    playrumbleonentity( "grenade_rumble", var_0 );
    earthquake( 0.4, 0.75, var_0, 512 );

    foreach ( var_2 in level.players )
    {
        if ( var_2 scripts\mp\utility\game::isusingremote() )
            continue;

        if ( distance( var_0, var_2.origin ) > 512 )
            continue;

        var_2 setclientomnvar( "ui_hud_shake", 1 );
    }
}

_id_22FF( var_0, var_1, var_2 )
{
    var_3 = self.origin;
    _id_13B9( "artillery_rumble", var_3 );

    if ( !isdefined( var_0 ) )
        var_0 = 0.7;

    if ( !isdefined( var_1 ) )
        var_1 = 0.5;

    if ( !isdefined( var_2 ) )
        var_2 = 800;

    _id_1245( var_0, var_1, var_3, var_2 );
    _id_13BE( var_3, var_2 );
}

_id_10F44( var_0 )
{
    playrumbleonentity( "grenade_rumble", var_0 );
    earthquake( 1.0, 0.6, var_0, 2000 );

    foreach ( var_2 in level.players )
    {
        if ( var_2 scripts\mp\utility\game::isusingremote() )
            continue;

        if ( distance( var_0, var_2.origin ) > 1000 )
            continue;

        var_2 setclientomnvar( "ui_hud_shake", 1 );
    }
}

_id_1AF0( var_0 )
{
    _id_13B9( "artillery_rumble", var_0 );
    _id_1245( 0.5, 0.65, var_0, 1000 );
    _id_13BE( var_0, 900 );
}

_id_DAF3( var_0 )
{
    self notify( "pulseGrenade_earthQuake" );
    self endon( "pulseGrenade_earthQuake" );
    thread _id_636E();
    self endon( "end_explode" );
    var_1 = undefined;

    if ( !isdefined( var_0 ) || var_0 )
        self waittill( "explode", var_1 );
    else
        var_1 = self.origin;

    playrumbleonentity( "grenade_rumble", var_1 );
    earthquake( 0.3, 0.35, var_1, 800 );

    foreach ( var_3 in level.players )
    {
        if ( var_3 scripts\mp\utility\game::isusingremote() )
            continue;

        if ( distancesquared( var_1, var_3.origin ) > 90000 )
            continue;

        var_3 setclientomnvar( "ui_hud_shake", 1 );
    }
}

_id_65C4( var_0 )
{
    self notify( "pulseGrenade_earthQuake" );
    self endon( "pulseGrenade_earthQuake" );
    thread _id_636E();
    self endon( "end_explode" );
    var_1 = undefined;

    if ( !isdefined( var_0 ) || var_0 )
        self waittill( "explode", var_1 );
    else
        var_1 = self.origin;

    playrumbleonentity( "grenade_rumble", var_1 );
    earthquake( 0.3, 0.35, var_1, 800 );

    foreach ( var_3 in level.players )
    {
        if ( var_3 scripts\mp\utility\game::isusingremote() )
            continue;

        if ( distancesquared( var_1, var_3.origin ) > 90000 )
            continue;

        var_3 setclientomnvar( "ui_hud_shake", 1 );
    }
}

_id_1245( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = 0;

    foreach ( var_6 in level.players )
    {
        if ( !isdefined( var_6 ) )
            continue;

        var_7 = scripts\mp\equipment\phase_shift::_id_9DDF( var_6 );

        if ( var_7 && var_4 || !var_7 && !var_4 )
            var_6 _meth_844F( var_0, var_1, var_2, var_3 );
    }
}

_id_13B9( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    foreach ( var_4 in level.players )
    {
        if ( !isdefined( var_4 ) )
            continue;

        var_5 = scripts\mp\equipment\phase_shift::_id_9DDF( var_4 );

        if ( var_5 && var_2 || !var_5 && !var_2 )
            var_4 _meth_8246( var_0, var_1 );
    }
}

_id_13BE( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 0;

    var_3 = var_1 * var_1;

    foreach ( var_5 in level.players )
    {
        if ( !isdefined( var_5 ) )
            continue;

        if ( var_5 scripts\mp\utility\game::isusingremote() )
            continue;

        var_6 = scripts\mp\equipment\phase_shift::_id_9DDF( var_5 );

        if ( var_6 && var_2 || !var_6 && !var_2 )
        {
            if ( distancesquared( var_0, var_5.origin ) <= var_3 )
                var_5 setclientomnvar( "ui_hud_shake", 1 );
        }
    }
}

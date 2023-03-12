// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_1664()
{
    if ( !isdefined( level._id_1668 ) )
        level._id_1668 = [];

    thread _id_1672();
    thread _id_166F();
}

_id_166F()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self waittill( "spawned_player" );
    _id_1665( self.primaryweapon );
    _id_1665( self._id_F0C4 );
}

_id_1667()
{
    self notify( "stopActiveReload" );
    _id_165D();
}

_id_1672()
{
    self endon( "disconnect" );
    self endon( "stopActiveReload" );
    level endon( "game_ended" );
    self notify( "activeReloadWatch" );
    self endon( "activeReloadWatch" );

    for (;;)
    {
        self waittill( "reload_start" );
        var_0 = self getcurrentweapon();

        if ( !isdefined( var_0 ) || var_0 == "none" )
            continue;

        var_1 = scripts\mp\utility\game::_id_8225( var_0 );

        if ( _id_165E( var_0, var_1 ) )
        {
            thread _id_1671();
            thread _id_1670();
            thread _id_166C();
            thread _id_166D( var_0 );
            var_2 = _id_166B( var_0, var_1 );

            if ( isdefined( var_2 ) )
                thread _id_50DB();
            else
                _id_1661();
        }
    }
}

_id_1671()
{
    _id_166A( "weapon_switch_started" );
}

_id_166C()
{
    _id_166A( "melee_fired" );
}

_id_166E()
{
    _id_166A( "reload" );
}

_id_1670()
{
    _id_166A( "sprint_begin" );
}

_id_166D( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "reload_start" );
    wait 0.333;

    if ( !isai( self ) )
    {
        self notifyonplayercommand( "activeReloadInput", "+usereload" );
        self notifyonplayercommand( "activeReloadInput", "+activate" );
    }

    _id_166A( "activeReloadInput" );
}

_id_166A( var_0 )
{
    self endon( "disconnect" );
    self endon( "stopActiveReload" );
    level endon( "game_ended" );
    self endon( "activeReloadEvent" );
    self waittill( var_0 );
    self notify( "activeReloadEvent" );
}

_id_166B( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "stopActiveReload" );
    level endon( "game_ended" );
    self._id_165F = gettime();
    var_2 = _id_1662( var_0, var_1 );
    var_3 = var_2["totalTime"];
    var_4 = var_2["hotzoneStart"];
    var_5 = var_2["hotzoneDuration"];
    thread _id_1669( var_3, var_4, var_5 );
    scripts\engine\utility::_id_13736( var_2["totalTime"] * 0.001, "activeReloadEvent" );
    self notify( "activeReloadEvent" );
    var_6 = gettime() - self._id_165F;

    if ( var_6 < var_4 - 0 )
    {
        self setclientomnvar( "ui_activereload_result", -1 );
        self setclientomnvar( "ui_activereload_result_notify", gettime() );
        return 1;
    }
    else if ( var_6 < var_3 )
    {
        if ( var_6 <= var_4 + var_5 + 0 )
            thread _id_165B();
        else
        {
            self setclientomnvar( "ui_activereload_result", 0 );
            self setclientomnvar( "ui_activereload_result_notify", gettime() );
        }

        return 1;
    }
    else
    {

    }
}

_id_165C()
{
    if ( !isdefined( self._id_1666 ) || self._id_1666 == 0 )
    {
        scripts\mp\utility\game::giveperk( "specialty_regenfaster" );
        self._id_1666 = 1;
    }
}

_id_165D()
{
    if ( isdefined( self._id_1666 ) && self._id_1666 )
    {
        scripts\mp\utility\game::_id_E150( "specialty_regenfaster" );
        self._id_1666 = undefined;
    }
}

_id_165B()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self notify( "activeReloadGivePerk" );
    self endon( "activeReloadGivePerk" );
    self playlocalsound( "scavenger_pack_pickup" );
    _id_165C();
    _id_0AE2::_id_D740( 2.0 );
    self setclientomnvar( "ui_activereload_result", 1 );
    self setclientomnvar( "ui_activereload_result_notify", gettime() );
    wait 5.0;
    _id_165D();
    _id_0AE2::_id_D740( 1.0 );
}

_id_1661()
{
    if ( !isai( self ) )
    {
        self notifyonplayercommand( "", "+usereload" );
        self notifyonplayercommand( "", "+activate" );
    }

    self setclientomnvar( "ui_activereload_visible", 0 );
}

_id_50DB()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "reload_start" );
    wait 0.5;
    _id_1661();
}

_id_1660( var_0, var_1, var_2, var_3 )
{
    var_4 = gettime() - var_0;

    if ( var_4 >= var_1 && var_4 < var_2 )
        return 1;
    else
        return 0;
}

_id_165E( var_0, var_1 )
{
    if ( var_1 == "weapon_shotgun" )
    {
        var_2 = scripts\mp\utility\game::_id_8234( var_0 );
        return var_2 != "iw6_fp6" && var_2 != "iw6_uts15" && var_2 != "iw7_spas";
    }
    else if ( scripts\mp\utility\game::_id_13C90( var_0, "akimbo" ) )
        return 0;
    else if ( scripts\mp\utility\game::_id_9F7C( var_0, "alt_" ) )
        return 0;
    else if ( scripts\mp\weapons::_id_9E6D( var_0 ) || scripts\mp\weapons::_id_9F2D( var_0 ) )
        return 0;
    else
        return 1;
}

_id_1662( var_0, var_1 )
{
    var_2 = 1.0;

    if ( scripts\mp\utility\game::_id_12D6( "specialty_fastreload" ) )
        var_2 = 0.5;

    var_3 = undefined;

    if ( scripts\mp\utility\game::_id_9F7C( var_0, "alt_" ) )
    {
        if ( scripts\mp\utility\game::_id_13C90( var_0, "gl" ) )
            var_3 = _id_1665( "gl", 1 );
        else if ( scripts\mp\utility\game::_id_13C90( var_0, "shotgun" ) )
            var_3 = _id_1665( "shotgun", 1 );
    }
    else
        var_3 = _id_1665( var_0 );

    var_4 = 2;
    var_5 = self getweaponammoclip( var_0 );

    if ( var_5 == 0 )
        var_4 = 4;

    var_6 = [];
    var_7 = var_3[var_4] * var_2;
    var_8 = var_3[var_4 + -1] * var_2;
    var_6["totalTime"] = int( var_7 );
    var_6["hotzoneStart"] = int( var_8 );
    var_6["hotzoneDuration"] = 250;
    return var_6;
}

_id_1669( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self endon( "stopActiveReload" );
    level endon( "game_ended" );
    self endon( "activeReloadCanceled" );
    self setclientomnvar( "ui_activereload_hotzone_start", var_1 );
    self setclientomnvar( "ui_activereload_hotzone_duration", var_2 );
    self setclientomnvar( "ui_activereload_total_time", var_0 );
    self setclientomnvar( "ui_activereload_visible", 1 );
    wait( var_0 );
    self setclientomnvar( "ui_activereload_result", 0 );
    self setclientomnvar( "ui_activereload_result_notify", gettime() );
}

_id_1665( var_0 )
{
    if ( var_0 == "none" )
        return;

    var_1 = getweaponbasename( var_0 );

    if ( isdefined( level._id_1668[var_1] ) )
        return level._id_1668[var_1];
    else if ( !scripts\mp\weapons::_id_9E6D( var_1 ) && !scripts\mp\weapons::_id_9F2D( var_1 ) )
    {
        var_2 = [];
        var_3 = tablelookuprownum( "mp/weaponReloadStats.csv", 0, var_1 );
        var_4 = 4;
        var_5 = scripts\mp\utility\game::_id_8225( var_1 );

        if ( var_5 == "weapon_pistol" )
            var_4 = 8;

        for ( var_6 = 1; var_6 <= var_4; var_6++ )
            var_2[var_6] = int( float( tablelookupbyrow( "mp/weaponReloadStats.csv", var_3, var_6 ) ) * 1000 );

        level._id_1668[var_1] = var_2;
        return var_2;
    }
}

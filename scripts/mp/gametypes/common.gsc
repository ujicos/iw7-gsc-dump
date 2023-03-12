// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

setupcommoncallbacks()
{
    level.onnormaldeath = ::onnormaldeath;
    level._id_C5AA = ::_id_C5AA;
    level._id_C5B0 = ::_id_C5B0;
    scripts\mp\utility\game::_id_DEEB( level.gametype, 0 );
    level._effect["protection_cameraFX"] = loadfx( "vfx/iw7/_requests/mp/vfx_adrenaline_drip_heal_scrn.vfx" );
}

updategametypedvars()
{
    level._id_58C2 = scripts\mp\utility\game::istrue( scripts\mp\utility\game::_id_8214( "dogtags" ) );

    if ( level._id_58C2 )
        scripts\mp\gametypes\obj_dogtag::init();
}

onnormaldeath( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = level._id_EC3D["death"] * -1;

    if ( var_5 != 0 )
    {
        if ( level.teambased )
            level scripts\mp\gamescore::giveteamscoreforobjective( var_0.pers["team"], var_5, 0 );
        else
            var_1 scripts\mp\gamescore::_id_8392( "kill", var_5 );
    }

    var_6 = level._id_EC3D["kill"];

    if ( var_3 == "MOD_HEAD_SHOT" )
        var_6 += level._id_EC3D["headshot"];

    if ( scripts\mp\utility\game::istrue( level._id_112C0 ) )
    {
        if ( scripts\mp\utility\game::matchmakinggame() && isdefined( var_1.cranked ) )
        {
            var_6 += 1;
            var_1 thread scripts\mp\rank::scoreeventpopup( "teamscore_notify_" + var_6 );
        }

        var_1 scripts\mp\utility\game::_id_C4DB( var_0, var_1, var_2 );
    }

    if ( var_6 != 0 )
    {
        if ( level.teambased )
            level scripts\mp\gamescore::giveteamscoreforobjective( var_1.pers["team"], var_6, 0 );
        else
            var_1 scripts\mp\gamescore::_id_8392( "kill", var_6 );
    }

    if ( level._id_58C2 && scripts\mp\utility\game::_id_766C( "prematch_done" ) )
        level thread scripts\mp\gametypes\obj_dogtag::_id_10849( var_0, var_1, "new_tag_spawned" );
}

_id_C5AA( var_0 )
{
    if ( scripts\mp\utility\game::istrue( level._id_112C0 ) )
        var_0 scripts\mp\utility\game::_id_40EF();

    if ( isdefined( level._id_EC3D ) )
    {
        var_1 = level._id_EC3D["death"] * -1;

        if ( var_1 != 0 )
        {
            if ( level.teambased )
                level scripts\mp\gamescore::giveteamscoreforobjective( var_0.pers["team"], var_1, 0 );
        }
    }
}

_id_C5B0( var_0 )
{
    if ( scripts\mp\utility\game::istrue( level._id_112C0 ) )
        var_0 scripts\mp\utility\game::_id_40EF();
}

_id_58BE( var_0 )
{

}

_id_58BF( var_0 )
{

}

onspawnplayer()
{
    if ( scripts\mp\utility\game::istrue( level._id_10903 ) && !scripts\mp\spawnlogic::_id_100BA() )
        thread _id_B2F2();
}

_id_B2F2()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "remove_spawn_protection" );
    thread _id_20DC();
    wait( level._id_10903 );
    _id_E171();
}

_id_20DC()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "remove_spawn_protection" );
    self waittill( "spawned_player" );
    self setclientomnvar( "ui_uplink_carrier_hud", 1 );
    self._id_10902 = 1;
    scripts\mp\lightarmor::_id_F786( self, 1000, undefined, 1 );
    self setclientomnvar( "ui_uplink_carrier_armor", 100 );
    self setclientomnvar( "ui_uplink_carrier_armor_max", 100 );
}

_id_E171()
{
    if ( isdefined( self ) )
    {
        self setclientomnvar( "ui_uplink_carrier_hud", 0 );
        self._id_10902 = 0;
    }

    scripts\mp\lightarmor::_id_ACAC( self );
    self setclientomnvar( "ui_uplink_carrier_armor", -1 );
    self notify( "remove_spawn_protection" );
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_49B4()
{
    level._id_74CF = scripts\engine\utility::_id_1352A;
    level._id_74D0 = ::_id_74D0;
    level._id_74CC = scripts\common\fx::_id_B059;
    level._id_74CD = scripts\common\fx::_id_C51A;
    level._id_74C5 = scripts\common\fx::_id_4917;
    level._id_74D3 = scripts\common\createfx::_id_E2AB;
    level._id_74D2 = scripts\common\createfx::_id_D978;
    level._id_74CE = ::_id_74CE;
    level._id_BD5D = 1;
    level.callbackstartgametype = scripts\engine\utility::_id_1352A;
    level.callbackplayerconnect = scripts\engine\utility::_id_1352A;
    level.callbackplayerdisconnect = scripts\engine\utility::_id_1352A;
    level.callbackplayerdamage = scripts\engine\utility::_id_1352A;
    level.callbackplayerkilled = scripts\engine\utility::_id_1352A;
    level.callbackplayerlaststand = scripts\engine\utility::_id_1352A;
    level.callbackplayerconnect = ::callback_playerconnect;
    level.callbackplayermigrated = scripts\engine\utility::_id_1352A;
    thread _id_DE5D();
    thread _id_DE5C();
    thread scripts\common\createfx::_id_74C7();
    scripts\common\createfx::_id_49B9();
    level waittill( "eternity" );
}

_id_74D0( var_0 )
{
    return level.player.origin;
}

callback_playerconnect()
{
    self waittill( "begin" );

    if ( !isdefined( level.player ) )
    {
        var_0 = getentarray( "mp_global_intermission", "classname" );
        self spawn( var_0[0].origin, var_0[0].angles );
        scripts\mp\utility\game::updatesessionstate( "playing", "" );
        self.maxhealth = 10000000;
        self.health = 10000000;
        level.player = self;
        thread scripts\common\createfx::_id_49CB();
    }
    else
        kick( self getentitynumber() );
}

_id_74CE()
{
    var_0 = level._id_11B7._id_D2C7 / 190;
    level.player setmovespeedscale( var_0 );
}

_id_DE5D()
{

}

_id_DE5C()
{

}

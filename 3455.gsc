// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "aa_launcher", ::_id_6D69, undefined, ::_id_5FBC, undefined, ::_id_11378 );
    scripts\mp\laserguidedlauncher::_id_AC0B( "vfx/core/mp/killstreaks/vfx_maaws_split", "vfx/core/mp/killstreaks/vfx_maaws_homing" );
}

_id_7D8F()
{
    return "iw6_maaws_mp";
}

_id_7D8D()
{
    return "iw6_maawschild_mp";
}

_id_7D8E()
{
    return "iw6_maawshoming_mp";
}

_id_5FBC( var_0 )
{
    var_0._id_14FF = 2;
    return 1;
}

_id_6D69( var_0 )
{
    var_0._id_14FF -= 1;
    var_1 = var_0._id_14FF <= 0;
    return var_1;
}

_id_11378( var_0 )
{
    self setweaponammoclip( var_0.weapon, var_0._id_14FF );
    thread _id_B9B1( var_0 );
}

_id_B9B1( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self waittill( "weapon_change", var_1 );
    thread scripts\mp\laserguidedlauncher::_id_AC08( _id_7D8F(), _id_7D8D(), _id_7D8E() );
    self waittill( "weapon_change" );
    scripts\mp\laserguidedlauncher::_id_AC07();
}

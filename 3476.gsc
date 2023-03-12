// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    var_0 = spawnstruct();
    var_0._id_92B8 = "deployable_vest";
    var_0._id_039B = "deployable_vest_marker_mp";
    var_0._id_B91A = "prop_ballistic_vest_iw6";
    var_0._id_B91C = "prop_ballistic_vest_iw6_bombsquad";
    var_0._id_017B = &"KILLSTREAKS_HINTS_LIGHT_ARMOR_PICKUP";
    var_0._id_3A41 = &"KILLSTREAKS_BOX_GETTING_VEST";
    var_0._id_67E5 = "deployable_vest_taken";
    var_0._id_110EA = "deployable_vest";
    var_0._id_10A38 = "used_deployable_vest";
    var_0._id_FC47 = "compass_objpoint_deploy_friendly";
    var_0._id_8C7A = 20;
    var_0._id_AC71 = 90.0;
    var_0._id_130FC = 50;
    var_0._id_EC44 = "destroyed_vest";
    var_0._id_13523 = "ballistic_vest_destroyed";
    var_0._id_5230 = "mp_vest_deployed_ui";
    var_0._id_C5C7 = "ammo_crate_use";
    var_0._id_C5BC = ::_id_C5BE;
    var_0._id_3936 = ::_id_3937;
    var_0._id_130EE = 1000;
    var_0.maxhealth = 220;
    var_0._id_4D4A = "deployable_bag";
    var_0._id_4E74 = loadfx( "vfx/core/mp/killstreaks/vfx_ballistic_vest_death" );
    var_0._id_1C9D = 1;
    var_0._id_1C96 = 0;
    var_0._id_B4D1 = 4;
    var_0._id_393B = 0;
    level._id_2F30["deployable_vest"] = var_0;
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "deployable_vest", ::_id_128E1 );
    level._id_5212["deployable_vest"] = [];
}

_id_128E1( var_0, var_1 )
{
    var_2 = scripts\mp\killstreaks\deployablebox::_id_2A63( var_0, "deployable_vest" );

    if ( !isdefined( var_2 ) || !var_2 )
        return 0;

    scripts\mp\matchdata::_id_AFC9( "deployable_vest", self.origin );
    return 1;
}

_id_3937( var_0 )
{
    return !scripts\mp\lightarmor::_id_8C07( self ) && !scripts\mp\utility\game::isjuggernaut();

    if ( isdefined( var_0 ) && var_0.owner == self && !isdefined( var_0._id_1A64 ) )
        return 0;

    return !scripts\mp\utility\game::isjuggernaut();
}

_id_C5BE( var_0 )
{
    scripts\mp\perks\perkfunctions::_id_F785();
}

_id_77D4( var_0, var_1 )
{
    if ( var_0 + level._id_5221[var_1] > level._id_5220 )
        return level._id_5220;

    return var_0 + level._id_5221[var_1];
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    var_0 = spawnstruct();
    var_0._id_92B8 = "deployable_weapon_crate";
    var_0._id_039B = "crate_marker_mp";
    var_0._id_B91A = "mp_weapon_crate";
    var_0._id_B91C = "mp_weapon_crate_bombsquad";
    var_0._id_017B = &"KILLSTREAKS_HINTS_DEPLOYABLE_AMMO_USE";
    var_0._id_3A41 = &"KILLSTREAKS_DEPLOYABLE_AMMO_TAKING";
    var_0._id_67E5 = "deployable_ammo_taken";
    var_0._id_110EA = "deployable_ammo";
    var_0._id_10A38 = "used_deployable_ammo";
    var_0._id_FC47 = "compass_objpoint_deploy_ammo_friendly";
    var_0._id_8C7A = 20;
    var_0._id_AC71 = 20.0;
    var_0._id_13524 = "ammocrate_gone";
    var_0._id_130FC = 0;
    var_0._id_EC44 = "destroyed_ammo";
    var_0._id_13523 = "ammocrate_destroyed";
    var_0._id_5230 = "mp_vest_deployed_ui";
    var_0._id_C5C7 = "ammo_crate_use";
    var_0._id_C5BC = ::_id_C5BE;
    var_0._id_3936 = ::_id_3937;
    var_0._id_C18C = 1;
    var_0._id_130EE = 1000;
    var_0.maxhealth = 128;
    var_0._id_4D4A = "deployable_bag";
    var_0._id_4E74 = loadfx( "vfx/core/mp/killstreaks/vfx_ballistic_vest_death" );
    var_0._id_1C9D = 1;
    var_0._id_1C96 = 0;
    var_0._id_B4D1 = 4;
    var_0._id_B7A5 = 20;
    var_0._id_B7A8 = "iw6_minigun_mp";
    var_0._id_1E4B = 0.5;
    var_0._id_1E4C = 10.0;
    var_0._id_127C8 = 200;
    var_0._id_127C5 = 64;
    var_0._id_C4F0 = ::_id_C4CF;
    var_0._id_393B = 0;
    level._id_2F30["deployable_ammo"] = var_0;
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "deployable_ammo", undefined, ::_id_128DD );
    level._id_5226 = randomintrange( 1, var_0._id_B7A5 + 1 );
    level._id_5212["deployable_ammo"] = [];
}

_id_1E3C( var_0 )
{
    _id_128D7( 1, var_0, "ammo_box_mp" );
}

_id_128D7( var_0, var_1, var_2 )
{
    var_3 = scripts\mp\killstreaks\deployablebox::_id_2A63( var_0, "deployable_ammo", var_1, var_2 );

    if ( !isdefined( var_3 ) || !var_3 )
        return 0;

    return 1;
}

_id_128DD( var_0, var_1 )
{
    var_2 = scripts\mp\killstreaks\deployablebox::_id_2A63( var_0._id_AC68, "deployable_ammo", var_1, var_0.weapon );

    if ( !isdefined( var_2 ) || !var_2 )
        return 0;

    scripts\mp\matchdata::_id_AFC9( "deployable_ammo", self.origin );
    return 1;
}

_id_C5BE( var_0 )
{
    level._id_5226--;

    if ( level._id_5226 == 0 )
    {
        var_1 = level._id_2F30[var_0.boxtype];

        if ( isdefined( level._id_5222 ) )
            [[ level._id_5222 ]]( 1 );
        else
            _id_836B( self, var_1._id_B7A8 );

        scripts\mp\missions::_id_D992( "ch_guninabox" );
        level._id_5226 = randomintrange( var_1._id_B7A5, var_1._id_B7A5 + 1 );
    }
    else
        _id_8399( self );
}

_id_C4CF( var_0 )
{
    thread _id_E2B7( var_0 );
}

_id_8399( var_0 )
{
    var_1 = [];

    foreach ( var_3 in var_0 getweaponslistprimaries() )
        var_1[var_1.size] = getweaponbasename( var_3 );

    var_5 = undefined;

    for (;;)
    {
        var_5 = scripts\mp\gametypes\sotf::_id_80C5( level._id_13C73 );
        var_6 = var_5["name"];

        if ( !scripts\engine\utility::array_contains( var_1, var_6 ) )
            break;
    }

    var_5 = scripts\mp\gametypes\sotf::_id_80B1( var_5 );
    _id_836B( var_0, var_5 );
}

_id_836B( var_0, var_1 )
{
    var_2 = var_0 getweaponslistprimaries();
    var_3 = 0;

    foreach ( var_5 in var_2 )
    {
        if ( !scripts\mp\weapons::_id_9D3E( var_5 ) )
            var_3++;
    }

    if ( var_3 > 1 )
    {
        var_7 = var_0._id_A978;

        if ( isdefined( var_7 ) && var_7 != "none" )
            var_0 dropitem( var_7 );
    }

    var_0 scripts\mp\utility\game::_id_12C6( var_1 );
    var_0 scripts\mp\utility\game::_id_141A( var_1 );
    var_0 _meth_817C( var_1 );
}

_id_E2B7( var_0 )
{
    self endon( "death" );
    level endon( "game_eneded" );
    var_1 = spawn( "trigger_radius", self.origin, 0, var_0._id_127C8, var_0._id_127C5 );
    var_1.owner = self;
    thread scripts\mp\weapons::_id_51BF( var_1 );

    if ( isdefined( self._id_BD3B ) )
    {
        var_1 _meth_80D2();
        var_1 linkto( self._id_BD3B );
    }

    var_2 = var_0._id_127C8 * var_0._id_127C8;
    var_3 = undefined;

    for (;;)
    {
        var_4 = var_1 getistouchingentities( level.players );

        foreach ( var_3 in var_4 )
        {
            if ( isdefined( var_3 ) && !self.owner scripts\mp\utility\game::isenemy( var_3 ) )
            {
                if ( !isdefined( var_3._id_116D0 ) || !var_3._id_116D0 )
                    var_3 thread _id_93EF();

                if ( _id_FFB8( var_3 ) )
                    _id_17A8( var_3, var_0._id_1E4C );
            }
        }

        wait( var_0._id_1E4B );
    }
}

_id_93EF()
{
    self endon( "death" );
    self endon( "disconnect" );
    thread scripts\mp\utility\game::_id_F5C6( 0, 6000, 2, 0 );
    thread scripts\mp\utility\game::_id_F5C5( 0, 1, 2, 0 );
    _id_0AE2::_id_D740( 1.1 );
    wait 2;
    _id_0AE2::_id_D74E();
}

_id_FFB8( var_0 )
{
    return !isdefined( var_0._id_5227 ) || gettime() >= var_0._id_5227;
}

_id_17A8( var_0, var_1 )
{
    var_0._id_5227 = gettime() + var_1 * 1000;
    scripts\mp\weapons::_id_EBD2( var_0 );
}

_id_17A9( var_0, var_1, var_2 )
{
    self endon( "death" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        _id_17A8( var_0 );
        wait( var_2 );

        if ( distancesquared( var_0.origin, self.origin ) > var_1 )
            break;
    }
}

_id_3937( var_0 )
{
    return !scripts\mp\utility\game::isjuggernaut();
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    thread _id_13962();
    level._id_5CC0 = [];
    level._id_5CC0["ability_pet_1"] = spawnstruct();
    level._id_5CC0["ability_pet_1"]._id_1088C = ::_id_10610;
    level._id_5CC0["ability_pet_2"] = spawnstruct();
    level._id_5CC0["ability_pet_2"]._id_1088C = ::_id_10611;
    level._id_5CC0["ability_pet_3"] = spawnstruct();
    level._id_5CC0["ability_pet_3"]._id_1088C = ::_id_10612;
    level._id_5CC0["ability_pet_4"] = spawnstruct();
    level._id_5CC0["ability_pet_4"]._id_1088C = ::_id_10613;
}

_id_13962()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_D2FA();
    }
}

_id_D2FA()
{
    self endon( "disconnect" );

    for (;;)
    {
        if ( getdvarint( "scr_drone_pet_debug_spawn" ) != 0 )
        {
            self waittill( "spawned_player" );
            var_0 = getdvarint( "scr_drone_pet_debug_spawn" );
            var_1 = "select_ability";
        }
        else
        {
            self waittill( "luinotifyserver", var_1, var_0 );

            if ( var_1 != "select_ability" )
                continue;
        }

        if ( !scripts\mp\killstreaks\ball_drone::_id_128DB( 0, "ball_drone_ability_pet" ) )
            continue;

        self._id_27D3._id_151C = var_0;
        var_2 = "ability_pet_" + ( var_0 + 1 );
        var_3 = level._id_5CC0[var_2];
        self [[ var_3._id_1088C ]]();
    }
}

_id_10610()
{
    level._id_112C0 = 1;
    level._id_47EF = 30.0;
    scripts\mp\utility\game::_id_B2AC( "" );
}

_id_10611()
{
    self.health = 200;
    self._id_BCF6 = 0.6;
    scripts\mp\weapons::_id_12ED5();
}

_id_10612()
{
    var_0 = self getcurrentprimaryweapon();

    if ( var_0 == "none" )
        var_0 = scripts\engine\utility::_id_7F62();

    if ( !self hasweapon( var_0 ) )
        var_0 = _id_0DC9::_id_7EB7();

    scripts\mp\utility\game::_id_141E( var_0 );
    scripts\mp\utility\game::_id_12C6( "iw7_knife_mp", 0 );
    scripts\mp\utility\game::_id_141A( "iw7_knife_mp" );
    thread _id_94A9();
}

_id_10613()
{
    var_0 = self getcurrentprimaryweapon();

    if ( var_0 == "none" )
        var_0 = scripts\engine\utility::_id_7F62();

    if ( !self hasweapon( var_0 ) )
        var_0 = _id_0DC9::_id_7EB7();

    scripts\mp\utility\game::_id_141E( var_0 );
    scripts\mp\utility\game::_id_12C6( "iw7_knife_mp", 0 );
    scripts\mp\utility\game::_id_141A( "iw7_knife_mp" );
    self._id_BCF6 = 1.5;
}

_id_94A9()
{
    self endon( "disconnect" );
    self endon( "death" );

    for (;;)
    {
        var_0 = self _meth_8115();
        self givemaxammo( var_0 );
        wait 2.0;
    }
}

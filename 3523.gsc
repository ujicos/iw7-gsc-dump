// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{

}

_id_819B( var_0, var_1 )
{
    scripts\engine\utility::_id_1C6E( 0 );
    self setscriptablepartstate( "killstreak", "visor_active", 0 );
    scripts\mp\utility\game::_id_1254();
    scripts\mp\utility\game::_id_1C47( 0 );
    var_2 = undefined;

    if ( var_0._id_110EA == "dronedrop" )
        var_2 = "deploy_dronepackage_mp";
    else if ( var_0._id_110EA == "remote_c8" )
        var_2 = "deploy_rc8_mp";
    else
        var_2 = "deploy_warden_mp";

    var_3 = undefined;
    thread _id_13A47( var_2 );
    thread _id_13A2F( var_2 );
    thread watchforphaseshiftuse( var_2 );
    thread watchforempapply( var_2 );

    if ( !isai( self ) )
    {
        self notifyonplayercommand( "equip_deploy_end", "+actionslot 4" );

        if ( !level._id_4542 )
        {
            self notifyonplayercommand( "equip_deploy_end", "+actionslot 5" );
            self notifyonplayercommand( "equip_deploy_end", "+actionslot 6" );
            self notifyonplayercommand( "equip_deploy_end", "+actionslot 7" );
        }
    }

    for (;;)
    {
        var_3 = _id_13808( "equip_deploy_succeeded", "equip_deploy_failed", "equip_deploy_end" );

        if ( var_3._id_11145 == "equip_deploy_failed" )
            continue;
        else if ( var_3._id_11145 == "equip_deploy_succeeded" )
        {
            if ( isdefined( var_1 ) )
            {
                if ( !self [[ var_1 ]]() )
                    continue;
                else
                    break;
            }
            else
                break;
        }
        else
            break;
    }

    if ( isdefined( var_3._id_AEC4 ) && isdefined( var_3.angles ) )
    {
        var_3._id_1349C = spawn( "script_model", var_3._id_AEC4 );
        var_3._id_1349C setmodel( "ks_marker_mp" );
        var_3._id_1349C _meth_831F( self );
        var_3._id_1349C setscriptablepartstate( "target", "placed", 0 );
        var_3._id_1349C _meth_85C8( 1 );
    }

    if ( scripts\mp\utility\game::isreallyalive( self ) )
        self notify( "killstreak_finished_with_weapon_" + var_2 );

    self setscriptablepartstate( "killstreak", "neutral", 0 );
    scripts\mp\utility\game::_id_11DB();
    scripts\mp\utility\game::_id_1C47( 1 );
    thread scripts\engine\utility::delaythread( 0.05, scripts\engine\utility::_id_1C6E, 1 );
    return var_3;
}

_id_13A47( var_0 )
{
    self endon( "disconnect" );
    self endon( "killstreak_finished_with_weapon_" + var_0 );

    for (;;)
    {
        if ( self getcurrentweapon() != var_0 )
        {
            self notify( "equip_deploy_end" );
            break;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_13A2F( var_0 )
{
    self endon( "disconnect" );
    self endon( "killstreak_finished_with_weapon_" + var_0 );
    var_1 = self getweaponammoclip( var_0 );

    for (;;)
    {
        self waittill( "weapon_fired", var_2 );

        if ( var_2 == var_0 )
            self setweaponammoclip( var_2, var_1 );
    }
}

watchforphaseshiftuse( var_0 )
{
    self endon( "disconnect" );
    self endon( "killstreak_finished_with_weapon_" + var_0 );

    for (;;)
    {
        if ( self _meth_84D9() )
        {
            self notify( "equip_deploy_end" );
            break;
        }

        scripts\engine\utility::waitframe();
    }
}

watchforempapply( var_0 )
{
    self endon( "disconnect" );
    self endon( "killstreak_finished_with_weapon_" + var_0 );
    self waittill( "apply_player_emp" );
    self notify( "equip_deploy_end" );
}

_id_13808( var_0, var_1, var_2 )
{
    var_3 = spawnstruct();

    if ( isdefined( var_0 ) )
        childthread _id_137F9( var_0, var_3 );

    if ( isdefined( var_1 ) )
        childthread _id_137F9( var_1, var_3 );

    if ( isdefined( var_2 ) )
        childthread _id_137F9( var_2, var_3 );

    childthread _id_137F9( "death", var_3 );
    var_3 waittill( "returned", var_4, var_5, var_6, var_7 );
    var_3 notify( "die" );
    var_8 = spawnstruct();
    var_8.weapon = var_4;
    var_8._id_AEC4 = var_5;
    var_8.angles = var_6;
    var_8._id_11145 = var_7;
    return var_8;
}

_id_137F9( var_0, var_1 )
{
    if ( var_0 != "death" )
        self endon( "death" );

    var_1 endon( "die" );
    self waittill( var_0, var_2, var_3, var_4 );
    var_1 notify( "returned", var_2, var_3, var_4, var_0 );
}

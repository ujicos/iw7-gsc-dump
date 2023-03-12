// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_D446()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "player_trophy_unset" );

    if ( !isdefined( level._effect["pts_detonate"] ) )
        level._effect["pts_detonate"] = loadfx( "vfx/iw7/_requests/mp/vfx_generic_equipment_exp.vfx" );

    if ( !isdefined( level._effect["pts_drone_drop"] ) )
        level._effect["pts_drone_drop"] = loadfx( "vfx/iw7/_requests/mp/vfx_pts_drone_drop.vfx" );

    for (;;)
    {
        _id_D447();
        wait 40;
    }
}

_id_D448()
{
    self notify( "player_trophy_unset" );
    _id_D441();
}

_id_D447()
{
    self endon( "player_trophy_end" );
    self notify( "player_trophy_start" );
    self endon( "player_trophy_start" );
    self setclientomnvar( "ui_dodge_charges", 5 );

    if ( self._id_AE62 == "archetype_engineer" )
        self setscriptablepartstate( "pts_drone", "active" );

    thread playertrophy_watchemp();
    thread playertrophy_watchownerdeath();
    _id_D449();
}

_id_D441()
{
    self notify( "player_trophy_end" );
    self setclientomnvar( "ui_dodge_charges", 0 );

    if ( self._id_AE62 == "archetype_engineer" )
        self setscriptablepartstate( "pts_drone", "off" );
}

_id_D449()
{
    var_0 = scripts\mp\trophy_system::_id_12804();

    for (;;)
    {
        var_1 = _id_D444();
        var_2 = [];
        var_2[0] = level._id_85D5;
        var_2[1] = level._id_B898;
        var_2[2] = level._id_B779;
        var_3 = scripts\engine\utility::_id_2282( var_2 );

        foreach ( var_5 in var_3 )
        {
            if ( !isdefined( var_5 ) )
                continue;

            if ( scripts\mp\utility\game::istrue( var_5._id_69BA ) )
                continue;

            if ( playertrophy_checkignorelist( var_5 ) )
                continue;

            var_6 = var_5.owner;

            if ( !isdefined( var_6 ) && isdefined( var_5._id_13C2E ) && weaponclass( var_5._id_13C2E ) == "grenade" )
                var_6 = getmissileowner( var_5 );

            if ( isdefined( var_6 ) && !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self, var_5.owner ) ) )
                continue;

            if ( distancesquared( var_5.origin, var_1 ) > scripts\mp\trophy_system::trophy_modifiedprotectiondistsqr( var_5, 65536 ) )
                continue;

            var_7 = physics_raycast( var_1, var_5.origin, var_0, [ self, var_5 ], 0, "physicsquery_closest" );

            if ( isdefined( var_7 ) && var_7.size > 0 )
                continue;

            thread _id_D445( var_5 );
            thread _id_D441();
        }

        scripts\engine\utility::waitframe();
    }
}

_id_D445( var_0 )
{
    scripts\mp\missions::_id_D991( "ch_trait_personal_trophy" );
    scripts\mp\killstreaks\killstreaks::_id_83A1();
    var_0 setcandamage( 0 );
    var_0._id_69BA = 1;
    var_0 _meth_83AD();
    scripts\mp\trophy_system::_id_12821( var_0 );
    scripts\mp\trophy_system::_id_12817( var_0, "player_trophy_system_mp", self );
    var_1 = var_0.origin;
    var_2 = var_0.angles;

    if ( scripts\mp\weapons::_id_9EE5( var_0 ) )
        var_0 scripts\mp\weapons::_id_51B5();
    else if ( var_0 scripts\mp\domeshield::isdomeshield() )
        var_0 thread scripts\mp\domeshield::domeshield_delete();
    else
        var_0 delete();

    radiusdamage( var_1, 128, 70, 10, self, "MOD_EXPLOSIVE", "player_trophy_system_mp" );
    thread playertrophy_protectionfx( var_1, var_2 );
}

playertrophy_watchemp()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "player_trophy_end" );

    while ( !scripts\mp\killstreaks\emp_common::_id_9D29() )
        scripts\engine\utility::waitframe();

    thread _id_D441();
}

playertrophy_watchownerdeath()
{
    self endon( "player_trophy_end" );
    self waittill( "death" );
    playfx( scripts\engine\utility::_id_7ECB( "pts_drone_drop" ), self gettagorigin( "tag_shield_back" ) );
    thread _id_D441();
}

_id_D444()
{
    var_0 = scripts\mp\utility\game::isinarbitraryup();
    var_1 = scripts\engine\utility::ter_op( var_0, self gettagorigin( "tag_shield_back", 1, 1 ), self gettagorigin( "tag_shield_back" ) );
    var_2 = scripts\engine\utility::ter_op( var_0, self _meth_8517(), self.angles );
    return var_1 + anglestoup( var_2 ) * 20;
}

playertrophy_checkignorelist( var_0 )
{
    var_1 = scripts\mp\trophy_system::trophy_checkignorelist( var_0 );

    if ( isdefined( var_0._id_13C2E ) && ( issubstr( var_0._id_13C2E, "iw7_tacburst" ) || issubstr( var_0._id_13C2E, "power_smoke_drone_mp" ) ) )
        var_1 = 1;

    if ( !var_1 && isdefined( var_0._id_13C2E ) )
    {
        var_2 = scripts\mp\utility\game::_id_7E9D( var_0._id_13C2E );

        if ( isdefined( var_2 ) && var_2 != "lethal" )
            var_1 = 1;
    }

    if ( !var_1 && scripts\mp\weapons::_id_9EE5( var_0 ) )
        var_1 = 1;

    return var_1;
}

playertrophy_modifieddamage( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2 ) || var_2 != "player_trophy_system_mp" )
        return var_4;

    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return var_4;

    return scripts\engine\utility::ter_op( var_0 == var_1, 0, var_4 );
}

playertrophy_protectionfx( var_0, var_1 )
{
    self playsound( "trophy_detect_projectile" );
    playfx( scripts\engine\utility::_id_7ECB( "pts_detonate" ), var_0, anglestoforward( var_1 ), anglestoup( var_1 ) );
    playloopsound( var_0, "trophy_fire" );
}

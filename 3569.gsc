// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_BB80()
{
    level._effect["mortarMount_path_fr"] = loadfx( "vfx/iw7/_requests/mp/power/vfx_mortar_mount_trail_fr" );
    level._effect["mortarMount_target_fr"] = loadfx( "vfx/iw7/_requests/mp/power/vfx_mortar_mount_target_fr" );
    level._effect["mortarMount_target_en"] = loadfx( "vfx/iw7/_requests/mp/power/vfx_mortar_mount_target_en" );
}

_id_BB90()
{
    self notify( "mortarMount_set" );
}

_id_BB93()
{
    self notify( "mortarMount_unset" );
    self unlink();
    self _meth_845E( 0 );
    self _meth_8009( 1 );
    _id_BB77();
    _id_BB78();
    _id_BB7A();
    _id_BB79();
}

_id_BB94()
{
    if ( !_id_BB6F() )
    {
        waittillframeend;
        _id_BB95( 0 );
        return;
    }

    self notify( "mortarMount_activated" );
    thread _id_BB8C();
}

_id_BB8C()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "mortarMount_unset" );
    self notify( "mortarMount_popIn" );
    self._id_BB6E = spawnstruct();
    self._id_BB6E._id_9D25 = 1;
    var_0 = rotatepointaroundvector( anglestoright( self.angles ), anglestoforward( self.angles ), 0 );
    var_1 = vectortoangles( var_0 );
    self _meth_845E( 1 );
    self _meth_8009( 0 );
    self setplayerangles( var_1 );
    var_2 = scripts\engine\utility::_id_107E6( self.origin, var_1 );
    thread _id_BB82( var_2 );
    var_3 = self geteye() - self.origin;
    self _meth_823A( var_2, "tag_origin", 0, 0, 0, 0, 0 );
    _id_BB71();
    _id_BB72();
    _id_BB74();
    _id_BB73();
    thread _id_BB70();
    thread _id_BB8D();
    wait 0.25;
    self iprintlnbold( "Fire at Will!" );
    self _meth_823A( var_2, "tag_origin", 0, 90, 90, 20, 20 );
    thread _id_BB87();
    thread _id_BB76();
    thread _id_BB8A( var_2 );
    thread _id_BB89( var_2 );
}

_id_BB8E( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "mortarMount_unset" );
    self notify( "mortarMount_popOut" );
    wait 0.1;
    self unlink();

    if ( isdefined( var_0 ) )
        var_0 delete();

    self _meth_845E( 0 );
    self _meth_8009( 1 );
    _id_BB77();
    _id_BB78();
    _id_BB7A();
    _id_BB79();
    self._id_BB6E = undefined;
    self notify( "mortarMount_deactivated" );
}

_id_BB7B()
{
    var_0 = _id_BB7E();
    var_1 = _id_BB7D( var_0 );
    var_2 = -1089.0;
    var_3 = ( var_1[2] - var_0[2] - var_2 ) / 1.65;
    var_4 = ( 0, 0, 1 );
    var_5 = var_3 * var_4;
    var_6 = distance2d( var_0, var_1 ) / 1.65;
    var_7 = vectornormalize( ( var_1[0] - var_0[0], var_1[1] - var_0[1], 0 ) );
    var_8 = var_6 * var_7;
    var_9 = var_8 + var_5;
    var_10 = self _meth_8449( "mortarmount_mp", var_0, var_9, 5 );
    thread _id_BB7C();
    thread _id_BB88( var_10 );
    thread _id_BB86( var_10 );
}

_id_BB88( var_0 )
{
    self endon( "disconnect" );
    self endon( "mortarMount_unset" );
    var_0 waittill( "missile_stuck" );
    var_0 _meth_8253( var_0.origin, 64, 64, 300, self, "MOD_EXPLOSIVE", "mortarmount_mp" );
    var_0 _meth_8253( var_0.origin, 128, 128, 300, self, "MOD_EXPLOSIVE", "mortarmount_mp" );
    var_0 _meth_8253( var_0.origin, 256, 256, 135, self, "MOD_EXPLOSIVE", "mortarmount_mp" );
    var_1 = undefined;

    if ( level.teambased )
        var_1 = scripts\mp\utility\game::_id_81A0( scripts\mp\utility\game::_id_8027( self.team ) );
    else
        var_1 = level._id_3CB5;

    var_1[var_1.size] = self;

    foreach ( var_3 in var_1 )
    {
        if ( !isdefined( var_3 ) || !scripts\mp\utility\game::isreallyalive( var_3 ) )
            continue;

        var_4 = distancesquared( var_0.origin, var_3.origin );

        if ( var_4 < 4096 )
        {
            var_3 scripts\mp\shellshock::_id_FC6A( "MOD_EXPLOSIVE", 300 );
            continue;
        }

        if ( var_4 < 300 )
        {
            var_3 scripts\mp\shellshock::_id_FC6A( "MOD_EXPLOSIVE", 300 );
            continue;
        }

        if ( var_4 < 135 )
            var_3 scripts\mp\shellshock::_id_FC6A( "MOD_EXPLOSIVE", 300 );
    }

    var_0 _meth_8099();
}

_id_BB7E()
{
    var_0 = self gettagorigin( "j_shoulder_ri" );
    var_0 += anglestoforward( self.angles ) * ( 0, 8, 20 )[1];
    var_0 += anglestoup( self.angles ) * ( 0, 8, 20 )[2];
    return var_0;
}

_id_BB8A( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "mortarMount_unset" );
    self endon( "mortarMount_popOut" );
    self endon( "mortarMount_fireButtonPressed" );
    var_1 = _id_0AE2::_id_D735( "power_mortarMount" );
    self notifyonplayercommand( "mortarMount_powerButtonPressed", var_1 );
    self waittill( "mortarMount_powerButtonPressed" );
    _id_BB95( 0 );
    thread _id_BB8E( var_0 );
}

_id_BB89( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "mortarMount_unset" );
    self endon( "mortarMount_popOut" );
    self notifyonplayercommand( "mortarMount_fireButtonPressed", "+attack" );
    self notifyonplayercommand( "mortarMount_fireButtonPressed", "+attack_akimbo_accessible" );
    self waittill( "mortarMount_fireButtonPressed" );
    _id_BB7B();
    wait 0.1;
    _id_BB95( 1 );
    thread _id_BB8E( var_0 );
}

_id_BB6F()
{
    return self isonground() && !self iswallrunning();
}

_id_BB95( var_0 )
{
    self notify( "powers_mortarMount_used", var_0 );
}

_id_BB72()
{
    if ( !isdefined( self._id_BB6E ) )
        return;

    if ( !isdefined( self._id_BB6E._id_10B5D ) )
    {
        self setstance( "crouch" );
        scripts\engine\utility::_id_1C68( 0 );
        scripts\engine\utility::_id_1C67( 0 );
        scripts\engine\utility::_id_1C60( 0 );
        self._id_BB6E._id_10B5D = 1;
    }
}

_id_BB78()
{
    if ( !isdefined( self._id_BB6E ) )
        return;

    if ( isdefined( self._id_BB6E._id_10B5D ) )
    {
        self setstance( "stand" );
        scripts\engine\utility::_id_1C68( 1 );
        scripts\engine\utility::_id_1C67( 1 );
        scripts\engine\utility::_id_1C60( 1 );
        self._id_BB6E._id_10B5D = undefined;
    }
}

_id_BB74()
{
    if ( !isdefined( self._id_BB6E ) )
        return;

    if ( !isdefined( self._id_BB6E._id_13C80 ) )
    {
        self _meth_800C( 0 );
        scripts\engine\utility::_id_1C76( 0 );
        self _meth_800F( 0 );
        self._id_BB6E._id_13C80 = 1;
    }
}

_id_BB7A()
{
    if ( !isdefined( self._id_BB6E ) )
        return;

    if ( isdefined( self._id_BB6E._id_13C80 ) )
    {
        self _meth_800C( 1 );
        scripts\engine\utility::_id_1C76( 1 );
        self _meth_800F( 1 );
        self._id_BB6E._id_13C80 = undefined;
    }
}

_id_BB71()
{
    if ( !isdefined( self._id_BB6E ) )
        return;

    if ( !isdefined( self._id_BB6E._id_D771 ) )
    {
        _id_0AE2::_id_D729();
        self._id_BB6E._id_D771 = 1;
    }
}

_id_BB77()
{
    if ( !isdefined( self._id_BB6E ) )
        return;

    if ( isdefined( self._id_BB6E._id_D771 ) )
    {
        _id_0AE2::_id_D72F();
        self._id_BB6E._id_D771 = undefined;
    }
}

_id_BB73()
{
    if ( !isdefined( self._id_BB6E ) )
        return;

    if ( !isdefined( self._id_BB6E._id_12F95 ) )
    {
        scripts\engine\utility::_id_1C6E( 0 );
        self._id_BB6E._id_12F95 = 1;
    }
}

_id_BB79()
{
    if ( !isdefined( self._id_BB6E ) )
        return;

    if ( isdefined( self._id_BB6E._id_12F95 ) )
    {
        scripts\engine\utility::_id_1C6E( 1 );
        self._id_BB6E._id_12F95 = undefined;
    }
}

_id_BB70()
{
    self endon( "disconnect" );
    self endon( "mortarMount_unset" );
    self endon( "mortarMount_deactivated" );
    self waittill( "death" );
    _id_BB78();
    _id_BB7A();
    _id_BB79();
    self._id_BB6E = undefined;
}

_id_BB86( var_0 )
{
    var_0 endon( "death" );
    self waittill( "disconnect" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_BB82( var_0 )
{
    scripts\engine\utility::waittill_any( "death", "disconnect", "mortarMount_unset", "mortarMount_deactivated" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_BB81( var_0 )
{
    return isdefined( var_0._id_BB6E ) && isdefined( var_0._id_BB6E._id_9D25 );
}

_id_BB87()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "mortarMount_unset" );
    self endon( "mortarMount_popOut" );
    self endon( "mortarMount_fireButtonPressed" );
    var_0 = 0;
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;

    for (;;)
    {
        self._id_BB8B = _id_BB7F( 5, 0.1 );
        var_0 -= 0.1;

        if ( var_1 >= 0.05 )
        {
            thread _id_BB75();
            var_1 -= 0.05;
        }

        if ( var_3 >= 0.1 )
            var_3 -= 0.1;

        scripts\engine\utility::waitframe();
        var_0 += 0.05;
        var_1 += 0.05;
        var_3 += 0.05;
    }
}

_id_BB7D( var_0 )
{
    var_1 = anglestoforward( self getplayerangles( 1 ) );
    var_2 = var_0 + var_1 * 900;
    var_3 = angleclamp180( self getplayerangles()[0] );
    var_4 = 0 - var_3;

    if ( var_4 > 0 )
        var_2 += clamp( abs( var_4 ) / 20, 0, 1 ) * 2100 * var_1;
    else if ( var_4 < 0 )
        var_2 -= clamp( abs( var_4 ) / 20, 0, 1 ) * 640 * var_1;

    return var_2;
}

_id_BB7F( var_0, var_1 )
{
    var_2 = spawnstruct();
    var_2._id_D648 = [];
    var_2._id_437E = 0;
    var_2._id_438B = ( 0, 0, 1 );
    var_2._id_97CD = ( 0, 0, 1 );
    var_3 = _id_BB7E();
    var_4 = _id_BB7D( var_3 );
    var_5 = -1089.0;
    var_6 = ( var_4[2] - var_3[2] - var_5 ) / 1.65;
    var_7 = ( 0, 0, 1 );
    var_8 = distance2d( var_3, var_4 ) / 1.65;
    var_9 = vectornormalize( ( var_4[0] - var_3[0], var_4[1] - var_3[1], 0 ) );
    var_10 = 0;
    var_11 = var_3;
    var_12 = undefined;

    for ( var_13 = physics_createcontents( [ "physicscontents_solid", "physicscontents_structural", "physicscontents_canshootclip", "physicscontents_missileclip" ] ); var_10 <= var_0 + var_1 && !var_2._id_437E; var_10 += var_1 )
    {
        var_12 = var_11;
        var_5 = var_10 * var_10 * -800 / 2;
        var_14 = ( 0, 0, var_3[2] ) + var_7 * ( var_6 * var_10 + var_5 );
        var_15 = ( var_3[0], var_3[1], 0 ) + var_9 * var_8 * var_10;
        var_11 = var_14 + var_15;
        var_16 = physics_raycast( var_12, var_11, var_13, self, 0, "physicsquery_closest" );

        if ( isdefined( var_16 ) && var_16.size > 0 )
        {
            var_11 = var_16[0]["position"];
            var_2._id_437E = 1;
            var_2._id_438B = var_16[0]["normal"];
        }

        var_2._id_D648[var_2._id_D648.size] = var_11;
    }

    if ( var_2._id_D648.size > 1 )
    {
        var_17 = vectornormalize( var_2._id_D648[0] - var_2._id_D648[0] );
        var_2._id_97CD = vectortoangles( var_17 );
    }

    return var_2;
}

_id_BB8D()
{
    self playlocalsound( "heavy_siege_on_plr" );
    self playsoundtoteam( "heavy_siege_on_npc", "allies", self );
    self playsoundtoteam( "heavy_siege_on_npc", "axis", self );
}

_id_BB8F()
{
    self playlocalsound( "" );
    self playsoundtoteam( "", "allies", self );
    self playsoundtoteam( "", "axis", self );
}

_id_BB7C( var_0, var_1, var_2 )
{
    self playlocalsound( "heavy_mortar_fire_plr" );
    self playsoundtoteam( "heavy_mortar_fire_npc", "axis", self );
    self playsoundtoteam( "heavy_mortar_fire_npc", "allies", self );
    var_3 = self._id_BB8B._id_97CD;
}

_id_BB75()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "mortarMount_unset" );
    self endon( "mortarMount_popOut" );
    self endon( "mortarMount_fireButtonPressed" );
    var_0 = self._id_BB8B._id_D648;

    if ( var_0.size < 2 )
        return;

    var_1 = spawn( "script_model", var_0[0] );
    var_1 setmodel( "tag_origin" );
    thread _id_BB92( var_1 );
    scripts\engine\utility::waitframe();
    playfxontagforclients( scripts\engine\utility::_id_7ECB( "mortarMount_path_fr" ), var_1, "tag_origin", self );
    var_2 = 0;

    for ( var_3 = var_2 + 1; var_3 < var_0.size; var_3++ )
    {
        var_4 = length( var_0[var_3] - var_0[var_2] );
        var_5 = var_4 / 1000;
        var_1 moveto( var_0[var_3], max( var_5, 0.05 ) );
        wait( var_5 );
        var_2++;
    }

    if ( isdefined( var_1 ) )
    {
        _func_121( scripts\engine\utility::_id_7ECB( "mortarMount_path_fr" ), var_1, "tag_origin" );
        var_1 delete();
    }
}

_id_BB76()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "mortarMount_unset" );
    self endon( "mortarMount_popOut" );
    self endon( "mortarMount_fireButtonPressed" );
    var_0 = spawn( "script_model", ( 0, 0, 0 ) );
    var_0 setmodel( "tag_origin" );
    thread _id_BB91( var_0 );
    scripts\engine\utility::waitframe();
    var_1 = 1;

    for (;;)
    {
        var_2 = self._id_BB8B;

        if ( isdefined( var_2 ) )
        {
            if ( var_2._id_437E )
            {
                if ( var_1 )
                {
                    var_0 show();
                    var_1 = 0;
                    _func_29A( scripts\engine\utility::_id_7ECB( "mortarMount_target_fr" ), var_0, "tag_origin", self.team );
                    _func_29A( scripts\engine\utility::_id_7ECB( "mortarMount_target_en" ), var_0, "tag_origin", scripts\mp\utility\game::_id_8027( self.team ) );
                }

                var_0.origin = var_2._id_D648[var_2._id_D648.size - 1];
                var_0.angles = vectortoangles( var_2._id_438B );
            }
            else if ( !var_1 )
            {
                var_0 hide();
                var_1 = 1;
                _func_121( scripts\engine\utility::_id_7ECB( "mortarMount_target_fr" ), var_0, "tag_origin" );
                _func_121( scripts\engine\utility::_id_7ECB( "mortarMount_target_en" ), var_0, "tag_origin" );
            }
        }

        scripts\engine\utility::waitframe();
    }
}

_id_BB92( var_0 )
{
    var_0 endon( "death" );
    scripts\engine\utility::waittill_any( "death", "disconnect", "mortarMount_unset", "mortarMount_popOut", "mortarMount_fireButtonPressed" );

    if ( isdefined( var_0 ) )
    {
        _func_121( scripts\engine\utility::_id_7ECB( "mortarMount_path_fr" ), var_0, "tag_origin" );
        var_0 delete();
    }
}

_id_BB91( var_0 )
{
    var_0 endon( "death" );
    scripts\engine\utility::waittill_any( "death", "disconnect", "mortarMount_unset", "mortarMount_popOut", "mortarMount_fireButtonPressed" );

    if ( isdefined( var_0 ) )
    {
        _func_121( scripts\engine\utility::_id_7ECB( "mortarMount_target_fr" ), var_0, "tag_origin" );
        _func_121( scripts\engine\utility::_id_7ECB( "mortarMount_target_en" ), var_0, "tag_origin" );
        var_0 delete();
    }
}

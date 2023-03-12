// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_97D0()
{
    level._id_37D3 = [];
    level._effect["marked_target"] = loadfx( "vfx/iw7/_requests/mp/vfx_marked_target" );
    level._effect["wall_lock_engaged"] = loadfx( "vfx/iw7/_requests/mp/vfx_sonic_sensor_pulse" );
}

_id_20BB()
{

}

_id_E0D0()
{
    self notify( "removeArchetype" );
}

_id_E89D()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );

    for (;;)
    {
        self waittill( "victim_damaged", var_0, var_1 );

        if ( var_0 scripts\mp\utility\game::_id_12D6( "specialty_coldblooded" ) || var_0 scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) )
            continue;

        thread _id_10222( var_0 );
        wait 0.05;
    }
}

_id_10222( var_0 )
{
    var_0 endon( "disconnect" );
    var_1 = scripts\mp\utility\game::_id_C794( var_0, "red", self, 0, 0, "level_script" );
    var_0 scripts\mp\hud_message::_id_1013D( "spotted" );
    thread _id_13AA0( var_1, var_0, 2 );
    wait 2;
}

_id_E83E()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    setdvarifuninitialized( "camo_method", 0 );

    if ( level.ingraceperiod == 0 )
        self waittill( "spawned_player" );
    else
        wait 1;

    self._id_9E3F = 0;
    self._id_37E5 = 0.1;
    self._id_C3E6 = self._id_01F1;
    self._id_C408 = self _meth_816D();
    thread _id_37DD();

    if ( getdvarint( "camo_method", 1 ) )
        thread _id_37D4();
    else
        thread _id_37D5();
}

_id_37D4()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    thread _id_37E0();
    thread _id_37DB();
    thread _id_37DF();
    thread _id_37E3();
    thread _id_37DE();

    if ( scripts\mp\utility\game::_id_12D6( "specialty_camo_elite" ) )
        self._id_37D2 = "mp_fullbody_synaptic_1";
    else
        self._id_37D2 = "mp_fullbody_synaptic_1";

    for (;;)
    {
        if ( ( self _meth_81BD() || self iswallrunning() ) && !self _meth_81AE() && !scripts\mp\killstreaks\emp_common::_id_9D29() && !self _meth_81AD() && !self usebuttonpressed() && !self adsbuttonpressed() && !isdefined( self._id_9FF6 ) && !isdefined( self._id_6F43 ) )
            _id_37DA();
        else
        {
            wait 1.5;
            continue;
        }

        wait 0.1;
        scripts\engine\utility::waittill_any( "camo_off", "emp_damage" );
        wait 0.05;
        _id_37D9();
        wait( self._id_37E5 );
        self._id_37E5 = 0.1;
    }
}

_id_37D5()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    thread _id_37DF();
    thread _id_37E3();

    if ( scripts\mp\utility\game::_id_12D6( "specialty_camo_elite" ) )
        self._id_37D2 = "mp_fullbody_synaptic_1";
    else
        self._id_37D2 = "mp_fullbody_synaptic_1";

    for (;;)
    {
        if ( !self _meth_81AE() && !scripts\mp\killstreaks\emp_common::_id_9D29() )
            _id_37DA();
        else
        {
            wait 1.5;
            continue;
        }

        wait 0.1;
        scripts\engine\utility::waittill_any( "camo_off", "emp_damage" );
        wait 0.05;
        _id_37D9();
        wait( self._id_37E5 );
        self._id_37E5 = 0.1;
    }
}

_id_37E3()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "weapon_fired", var_0 );

        if ( self._id_9E3F )
        {
            self._id_37E5 = 3.5;
            self notify( "camo_off" );
        }
    }
}

_id_37E4()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "weapon_change" );

        if ( self._id_9E3F && scripts\mp\utility\game::_id_8225( self getcurrentweapon() ) == "weapon_sniper" )
            self notify( "camo_off" );
    }
}

_id_37E0()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( !self _meth_81BD() && !self iswallrunning() && !self isjumping() && !self _meth_81AD() || isdefined( self._id_9FF6 ) || isdefined( self._id_6F43 ) )
        {
            self notify( "camo_off" );
            self waittill( "camo_on" );
        }

        wait 0.05;
    }
}

_id_37DB()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "removeArchetype" );

    for (;;)
    {
        if ( self adsbuttonpressed() )
        {
            self notify( "camo_off" );
            self waittill( "camo_on" );
        }

        wait 0.05;
    }
}

_id_37DF()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "removeArchetype" );

    for (;;)
    {
        if ( self _meth_81AE() )
        {
            self notify( "camo_off" );
            self waittill( "camo_on" );
        }

        wait 0.05;
    }
}

_id_37E2()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "removeArchetype" );

    for (;;)
    {
        if ( self iswallrunning() )
        {
            self notify( "camo_off" );
            self waittill( "camo_on" );
        }

        wait 0.05;
    }
}

_id_37DA()
{
    if ( !self._id_9E3F )
    {
        self._id_9E3F = 1;
        self setmodel( self._id_37D2 );
        _id_20CE();
        self playlocalsound( "ghost_wall_camo_on" );
        scripts\mp\utility\game::giveperk( "specialty_blindeye" );
        scripts\mp\utility\game::giveperk( "specialty_noscopeoutline" );
        self notify( "camo_on" );
    }
}

_id_37D9()
{
    if ( self._id_9E3F )
    {
        self._id_9E3F = 0;
        self setmodel( self._id_C3E6 );
        _id_E12D();
        self playlocalsound( "ghost_wall_camo_off" );
        scripts\mp\utility\game::_id_E150( "specialty_blindeye" );
        scripts\mp\utility\game::_id_E150( "specialty_noscopeoutline" );
    }
}

_id_561B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self _meth_80AA();
    self waittill( "camo_off" );
    self enableweapons();
}

_id_37DE()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "camo_off" );

    for (;;)
    {
        if ( self usebuttonpressed() || self adsbuttonpressed() && !isdefined( self._id_9FF6 ) )
            self notify( "camo_off" );

        scripts\engine\utility::waitframe();
    }
}

_id_37DD()
{
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    self waittill( "death" );

    if ( self._id_9E3F )
    {
        _id_37D9();
        self._id_9FF6 = undefined;
        self notify( "camo_off" );
    }
}

_id_E8AC()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    self._id_138CE = undefined;

    for (;;)
    {
        if ( self iswallrunning() && self playerads() > 0.3 )
        {
            var_0 = self _meth_842B( 0 );
            var_1 = self _meth_842D( 0 );
            self _meth_842C( 0, var_1 );
            self._id_138CE = var_0;
            _id_68D7();
            thread _id_13BA3();
            self waittill( "walllock_ended" );
            _id_639B();
        }

        wait 0.1;
    }
}

_id_13BA3()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    self endon( "walllock_ended" );
    wait 0.05;

    while ( self playerads() > 0.3 && self _meth_842B( 0 ) > 0 )
    {
        self _meth_842C( 0, self _meth_842B( 0 ) - 3.0 );
        wait 0.05;
    }

    self notify( "walllock_ended" );
}

_id_68D7()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    self._id_9FF6 = 1;
    self _meth_8423( 0 );
    self allowjump( 0 );
    self setstance( "crouch" );
    self playlocalsound( "ghost_wall_attach" );
    var_0 = scripts\engine\utility::_id_107E6();
    self setscriptablepartstate( "perch", "active", 0 );
    self _meth_823A( var_0 );
    thread _id_49EE( var_0.origin, scripts\mp\utility\game::_id_8027( self.team ) );
    thread _id_B2F5( var_0 );
}

_id_B2F5( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    self endon( "walllock_ended" );
    level endon( "game_ended" );
    wait 10;
    var_1 = var_0.origin - ( 0, 0, 100 );
    var_2 = scripts\engine\trace::_id_DCED( var_0.origin, var_1 );

    if ( length( var_0.origin - var_2["position"] ) < length( var_0.origin - var_1 ) )
        var_1 = var_2["position"];

    var_0 moveto( var_1, 4.0, 3.5 );
    wait 4.0;
    self notify( "walllock_ended" );
}

_id_639B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    var_0 = self.angles;
    self._id_9FF6 = undefined;
    self _meth_8423( 1 );
    self allowjump( 1 );
    self setstance( "stand" );
    self playlocalsound( "ghost_wall_detach" );

    if ( isdefined( self._id_138CE ) )
        self _meth_842C( 0, self._id_138CE );

    self._id_138CE = undefined;
    self unlink();
    scripts\engine\utility::waitframe();
    self.angles = var_0;
    self setscriptablepartstate( "perch", "neutral", 0 );
}

_id_20CE()
{
    self setclientomnvar( "ui_camouflageOverlay", 1 );
}

_id_E12D()
{
    self setclientomnvar( "ui_camouflageOverlay", 0 );
}

_id_49EE( var_0, var_1 )
{
    if ( !isdefined( self ) || !scripts\mp\utility\game::isreallyalive( self ) )
        return;

    var_2 = scripts\mp\objidpoolmanager::requestminimapid( 10 );

    if ( var_2 == -1 )
        return;

    scripts\mp\objidpoolmanager::minimap_objective_add( var_2, "active", self.origin, "cb_compassping_sniper_enemy", "icon_large" );
    scripts\mp\objidpoolmanager::minimap_objective_team( var_2, var_1 );
    scripts\engine\utility::waittill_any( "death", "disconnect", "stop_minimap_decoys", "walllock_ended" );
    scripts\mp\objidpoolmanager::returnminimapid( var_2 );
}

_id_13A2A()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    wait 0.05;

    if ( !isdefined( self._id_AD33 ) )
    {
        self._id_AD33 = scripts\engine\utility::_id_107E6();
        self._id_5FF1 = spawn( "script_model", self.origin );
        self._id_5FF1 setmodel( "tag_origin" );
    }
    else
    {
        self._id_5FF1.origin = self gettagorigin( "tag_shield_back" );
        self._id_5FF1.angles = self gettagangles( "tag_shield_back" );
        self._id_5FF1 linkto( self, "tag_shield_back" );
        self._id_AD33.origin = self.origin;
    }

    self notifyonplayercommand( "floatPressed", "+stance" );

    for (;;)
    {
        self waittill( "doubleJumpBegin" );

        if ( self isonground() )
            continue;

        if ( self _meth_81AD() )
            continue;

        _id_10B46();
    }
}

_id_10B46()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );

    for (;;)
    {
        var_0 = scripts\engine\utility::_id_13734( "adjustedStance", "doubleJumpEnd", "unlinked" );

        if ( var_0 == "doubleJumpEnd" || var_0 == "unlinked" )
            break;

        if ( isdefined( self._id_1D42 ) && self._id_1D42 )
            break;

        if ( self _meth_842B( 0 ) > 10 )
            continue;

        _id_1608();
    }
}

_id_1608()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unlinked" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    self._id_6F43 = 1;
    self._id_1D42 = 1;
    self._id_AD33.origin = self.origin;
    self _meth_823A( self._id_AD33 );
    self setstance( "stand" );
    thread _id_D47C( self._id_5FF1 );
    thread _id_13A43();
    thread _id_13A7C();
    thread _id_13A49();
    thread _id_BCB9( self._id_AD33 );
    self._id_5039 = self _meth_8433( 0 );
    self _meth_8434( 0, 0 );
    wait 5;
    _id_10358();
}

_id_13A43()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( self isonground() )
        {
            self._id_1D42 = 0;
            return;
        }
        else
            wait 0.05;
    }
}

_id_D47C( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unlinked" );

    if ( !var_0 _meth_81AB( self ) )
    {
        var_0.origin = self gettagorigin( "tag_shield_back" );
        var_0.angles = self gettagangles( "tag_shield_back" );
        var_0 linkto( self, "tag_shield_back" );
        wait 0.05;
    }

    var_0 show();
    wait 0.1;
    scripts\mp\utility\game::_id_D486( self, var_0, "tag_origin", self.team, scripts\engine\utility::_id_7ECB( "heavyThrustFr" ), scripts\engine\utility::_id_7ECB( "heavyThrustEn" ), undefined, undefined, [ self ] );
}

_id_10358()
{
    self._id_6F43 = undefined;
    self._id_5FF1 hide();
    stopfxontag( level._effect["heavyThrustFr"], self._id_5FF1, "tag_origin" );
    self _meth_8434( 0, self._id_5039 );
    self unlink();
    self notify( "unlinked" );
}

_id_13A7C()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unlinked" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    self waittill( "floatPressed" );
    _id_10358();
}

_id_13A49()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unlinked" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    self waittill( "adjustedStance" );
    _id_10358();
}

_id_BCB9( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unlinked" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );

    for (;;)
    {
        var_1 = self _meth_814C();

        if ( var_1[0] >= 0.15 || var_1[1] >= 0.15 || var_1[0] <= -0.15 || var_1[1] <= -0.15 )
            thread _id_B31F( var_0, var_1 );
        else
            thread _id_DCBD( var_0, var_1 );

        wait 0.05;
        _id_8D14( var_0 );
    }
}

_id_B31F( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unlinked" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    var_0._id_BCD9 = 80;
    var_2 = anglestoforward( self.angles ) * ( var_0._id_BCD9 * var_1[0] );
    var_3 = anglestoright( self.angles ) * ( var_0._id_BCD9 * var_1[1] );
    var_4 = var_2 + var_3;
    var_5 = self.origin + var_4;
    var_6 = self.origin[2] - var_0._id_BCD9 / 4;
    var_5 *= ( 1, 1, 0 );
    var_5 += ( 0, 0, var_6 );
    var_5 = _id_EA27( var_5 );
    var_0 moveto( var_5, 0.5 );
}

_id_DCBD( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unlinked" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    var_2 = self.origin[2] - 12.5;
    var_3 = self.origin;
    var_3 *= ( 1, 1, 0 );
    var_3 += ( 0, 0, var_2 );
    var_3 = _id_EA27( var_3 );
    var_0 moveto( var_3, 0.5 );
}

_id_EA27( var_0 )
{
    var_1 = scripts\engine\trace::_id_48BC( 1, 1, 1, 1, 0, 1, 1 );
    var_2 = scripts\engine\trace::_id_3A09( self.origin, var_0, 16, 32, ( 0, 0, 0 ), self, var_1, 0 );
    var_3 = var_2["fraction"];
    var_4 = var_2["position"];
    var_5 = undefined;
    var_6 = var_2["normal"];
    var_7 = 0;

    if ( var_3 != 1 )
    {
        if ( var_6[0] > 0.8 || var_6[0] < -0.8 )
            var_7 = 1;

        if ( var_6[1] > 0.8 || var_6[1] < -0.8 )
            var_7 = 1;

        if ( var_3 < 0.25 && !var_7 )
            return self.origin;
        else if ( var_3 < 0.25 && var_7 )
            return ( self.origin[0], self.origin[1], var_0[2] );

        var_8 = var_0 - self.origin;
        var_9 = vectortoangles( var_8 );
        var_10 = anglestoforward( var_9 );
        var_5 = distance( self.origin, var_0 );
        var_5 -= 32;
        var_11 = self.origin + var_10 * var_5;
    }
    else
        var_11 = var_0;

    if ( isdefined( var_5 ) && var_5 < 16 )
        return self.origin;

    return var_11;
}

_id_8D14( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unlinked" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    var_1 = scripts\engine\trace::_id_48BC( 1, 1, 1, 1, 0, 1, 1 );
    var_2 = scripts\engine\trace::_id_D305( var_0.origin, var_0.origin - ( 0, 0, 100 ), self.angles, self, var_1 );
    var_3 = var_2["position"];
    var_4 = var_2["normal"];
    var_5 = 0;

    if ( var_4[0] == 1 || var_4[0] == -1 )
        var_5 = 1;

    if ( var_4[1] == 1 || var_4[1] == -1 )
        var_5 = 1;

    if ( !var_2["fraction"] && var_5 )
    {
        var_6 = scripts\engine\trace::_id_DCED( var_0.origin, var_0.origin - ( 0, 0, 100 ), self, var_1 );
        var_5 = 0;
        var_4 = var_6["normal"];

        if ( var_4[0] > 0.8 || var_4[0] < -0.8 )
            var_5 = 1;

        if ( var_4[1] > 0.8 || var_4[1] < -0.8 )
            var_5 = 1;

        if ( var_5 )
            return;
    }

    if ( distancesquared( var_0.origin, var_3 ) < 256 )
        _id_10358();
}

_id_B382( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( scripts\engine\utility::_id_9D74( var_1 ) && isplayer( var_0 ) && var_0.team != self.team && !( var_0 scripts\mp\utility\game::_id_12D6( "specialty_coldblooded" ) || var_0 scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) ) && !isdefined( var_0._id_9E92 ) )
        thread _id_B380( var_0 );
}

_id_B380( var_0 )
{
    var_1 = var_0 scripts\engine\utility::_id_107E6();
    var_2 = spawn( "script_model", var_1.origin );
    var_2 setmodel( "tag_origin" );
    var_2 linkto( var_1, "tag_origin", ( 0, 0, 45 ), ( 0, 0, 0 ) );
    var_1 linkto( var_0, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0._id_9E92 = 1;
    var_0._id_8CC1 = 1;
    wait 0.1;

    if ( level.gametype != "dm" )
        var_3 = _func_29A( scripts\engine\utility::_id_7ECB( "marked_target" ), var_2, "tag_origin", self.team );
    else
        var_3 = playfxontagforclients( scripts\engine\utility::_id_7ECB( "marked_target" ), var_2, "tag_origin", self );

    var_0 scripts\engine\utility::_id_137B7( "death", 5 );
    stopfxontag( scripts\engine\utility::_id_7ECB( "marked_target" ), var_0, "tag_origin" );
    var_1 delete();
    wait 0.1;
    var_0._id_9E92 = undefined;
    var_0._id_8CC1 = undefined;
}

_id_13AA0( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\engine\utility::_id_13737( var_2, "leave" );

    if ( isdefined( var_1 ) )
        scripts\mp\utility\game::_id_C78F( var_0, var_1 );
}

_id_E84B( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_1 = self.owner;
    var_2 = level.uavsettings["uav_3dping"];

    if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_equipment_ping" ) )
    {
        for (;;)
        {
            foreach ( var_4 in level.players )
            {
                if ( !var_1 scripts\mp\utility\game::isenemy( var_4 ) )
                    continue;

                if ( var_4 scripts\mp\utility\game::_id_12D6( "specialty_engineer" ) || var_4 scripts\mp\utility\game::_id_12D6( "specialty_noscopeoutline" ) )
                    continue;

                if ( isdefined( var_4._id_C78B ) )
                    continue;

                var_5 = scripts\engine\utility::_id_2279( level.players, self );

                if ( isdefined( var_0 ) )
                    var_5 = scripts\engine\utility::_id_2279( var_5, var_0 );

                if ( distance2d( var_4.origin, self.origin ) < 300 && scripts\engine\trace::_id_DCF1( self.origin, var_4 gettagorigin( "j_head" ), var_5 ) )
                {
                    playfxontagforclients( var_2._id_7636, self, "tag_origin", var_1 );
                    playloopsound( self.origin + ( 0, 0, 5 ), var_2._id_10469 );
                    var_4 scripts\mp\hud_message::_id_1013D( "spotted" );
                    var_1 scripts\mp\damagefeedback::_id_917F( "eqp_ping" );
                    var_1 thread _id_B369( var_4, self );
                    wait 3;
                }
            }

            scripts\engine\utility::waitframe();
        }
    }
}

_id_1B45()
{
    self playsoundtoplayer( "mp_cranked_countdown", self );
}

_id_B369( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );

    if ( !isdefined( self ) || !scripts\mp\utility\game::isreallyalive( self ) )
        return;

    var_2 = scripts\mp\objidpoolmanager::requestminimapid( 10 );

    if ( var_2 == -1 )
        return;

    scripts\mp\objidpoolmanager::minimap_objective_add( var_2, "active", var_1.origin, "cb_compassping_eqp_ping", "icon_large" );
    scripts\mp\objidpoolmanager::minimap_objective_team( var_2, self.team );
    var_0 thread _id_13A35( var_2 );
    wait 3;
    scripts\mp\objidpoolmanager::returnminimapid( var_2 );
}

_id_13A35( var_0 )
{
    scripts\engine\utility::waittill_any( "death", "disconnect" );
    scripts\mp\objidpoolmanager::returnminimapid( var_0 );
}

_id_C7A6( var_0 )
{
    var_0 endon( "disconnect" );
    var_1 = scripts\mp\utility\game::_id_C794( var_0, "orange", self, 0, 0, "level_script" );
    var_0 scripts\mp\hud_message::_id_1013D( "spotted" );
    var_0._id_C78B = 1;
    _id_13AA0( var_1, var_0, 0.35 );
    wait 3;
    var_0._id_C78B = undefined;
}

_id_E7FE()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        if ( self getstance() == "prone" && scripts\mp\utility\game::_id_12D6( "specialty_improved_prone" ) )
        {
            wait 0.2;
            var_0 = self._id_BCF6;
            self._id_BCF6 = 3.0;
            scripts\mp\weapons::_id_12ED5();
            _id_BA22();
            self._id_BCF6 = var_0;
            scripts\mp\weapons::_id_12ED5();
        }

        scripts\engine\utility::waitframe();
    }
}

_id_BA22()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    self endon( "changed_kit" );

    while ( self getstance() == "prone" )
        scripts\engine\utility::waitframe();
}

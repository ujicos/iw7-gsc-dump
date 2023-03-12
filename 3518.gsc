// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_DF98["hit"] = loadfx( "vfx/core/impacts/large_metal_painted_hit" );
    level._id_DF98["smoke"] = loadfx( "vfx/core/smktrail/remote_heli_damage_smoke_runner" );
    level._id_DF98["explode"] = loadfx( "vfx/core/expl/bouncing_betty_explosion" );
    level._id_DF98["missile_explode"] = loadfx( "vfx/core/expl/stinger_explosion" );
    level._id_DF91["launch"][0] = "ac130_plt_yeahcleared";
    level._id_DF91["launch"][1] = "ac130_plt_rollinin";
    level._id_DF91["launch"][2] = "ac130_plt_scanrange";
    level._id_DF91["out_of_range"][0] = "ac130_plt_cleanup";
    level._id_DF91["out_of_range"][1] = "ac130_plt_targetreset";
    level._id_DF91["track"][0] = "ac130_fco_moreenemy";
    level._id_DF91["track"][1] = "ac130_fco_getthatguy";
    level._id_DF91["track"][2] = "ac130_fco_guymovin";
    level._id_DF91["track"][3] = "ac130_fco_getperson";
    level._id_DF91["track"][4] = "ac130_fco_guyrunnin";
    level._id_DF91["track"][5] = "ac130_fco_gotarunner";
    level._id_DF91["track"][6] = "ac130_fco_backonthose";
    level._id_DF91["track"][7] = "ac130_fco_gonnagethim";
    level._id_DF91["track"][8] = "ac130_fco_personnelthere";
    level._id_DF91["track"][9] = "ac130_fco_rightthere";
    level._id_DF91["track"][10] = "ac130_fco_tracking";
    level._id_DF91["tag"][0] = "ac130_fco_nice";
    level._id_DF91["tag"][1] = "ac130_fco_yougothim";
    level._id_DF91["tag"][2] = "ac130_fco_yougothim2";
    level._id_DF91["tag"][3] = "ac130_fco_okyougothim";
    level._id_DF91["assist"][0] = "ac130_fco_goodkill";
    level._id_DF91["assist"][1] = "ac130_fco_thatsahit";
    level._id_DF91["assist"][2] = "ac130_fco_directhit";
    level._id_DF91["assist"][3] = "ac130_fco_rightontarget";
    level._id_DF9D = 0;
    level._id_DFA2 = getentarray( "no_vehicles", "targetname" );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "remote_uav", ::_id_130CC );
    level._id_DF74 = [];
}

_id_130CC( var_0, var_1 )
{
    return _id_12900( var_0, "remote_uav" );
}

_id_68C4( var_0 )
{
    if ( level.gametype == "dm" )
    {
        if ( isdefined( level._id_DF74[var_0] ) || isdefined( level._id_DF74[level._id_C74B[var_0]] ) )
            return 1;
        else
            return 0;
    }
    else if ( isdefined( level._id_DF74[var_0] ) )
        return 1;
    else
        return 0;
}

_id_12900( var_0, var_1 )
{
    scripts\engine\utility::_id_1C6E( 0 );

    if ( scripts\mp\utility\game::isusingremote() || self isusingturret() || isdefined( level._id_C1C4 ) )
    {
        scripts\engine\utility::_id_1C6E( 1 );
        return 0;
    }

    var_2 = 1;

    if ( _id_68C4( self.team ) || level._id_AD8B.size >= 4 )
    {
        self iprintlnbold( &"KILLSTREAKS_AIR_SPACE_TOO_CROWDED" );
        scripts\engine\utility::_id_1C6E( 1 );
        return 0;
    }
    else if ( scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA + var_2 >= scripts\mp\utility\game::_id_B4D2() )
    {
        self iprintlnbold( &"KILLSTREAKS_TOO_MANY_VEHICLES" );
        scripts\engine\utility::_id_1C6E( 1 );
        return 0;
    }

    self setrankedplayerdata( "reconDroneState", "staticAlpha", 0 );
    self setrankedplayerdata( "reconDroneState", "incomingMissile", 0 );
    scripts\mp\utility\game::_id_93FA();
    var_3 = _id_8355( var_0, var_1 );

    if ( var_3 )
    {
        scripts\mp\matchdata::_id_AFC9( var_1, self.origin );
        thread scripts\mp\utility\game::_id_115DE( "used_remote_uav", self );
    }
    else
        scripts\mp\utility\game::_id_4FC1();

    self._id_9D81 = 0;
    return var_3;
}

_id_8355( var_0, var_1 )
{
    var_2 = _id_4994( var_1, self );
    scripts\mp\utility\game::_id_141E( "killstreak_uav_mp" );
    scripts\mp\utility\game::_id_12C6( "killstreak_remote_uav_mp" );
    scripts\mp\utility\game::_id_141B( "killstreak_remote_uav_mp" );
    _id_F686( var_2 );

    if ( isalive( self ) && isdefined( var_2 ) )
    {
        var_3 = var_2.origin;
        var_4 = self.angles;
        var_2._id_10478 delete();
        var_2 delete();
        var_5 = _id_10DEA( var_0, var_1, var_3, var_4 );
    }
    else
    {
        var_5 = 0;

        if ( isalive( self ) )
        {
            scripts\mp\utility\game::_id_141E( "killstreak_remote_uav_mp" );
            scripts\mp\utility\game::_id_12C6( "killstreak_uav_mp" );
        }
    }

    return var_5;
}

_id_4994( var_0, var_1 )
{
    var_2 = var_1.origin + anglestoforward( var_1.angles ) * 4 + anglestoup( var_1.angles ) * 50;
    var_3 = spawnturret( "misc_turret", var_2, "sentry_minigun_mp" );
    var_3.origin = var_2;
    var_3.angles = var_1.angles;
    var_3._id_F26E = "sentry_minigun";
    var_3._id_3872 = 1;
    var_3 _meth_835B( 1 );
    var_3 _meth_830F( "sentry_offline" );
    var_3 makeunusable();
    var_3 maketurretinoperable();
    var_3.owner = var_1;
    var_3 _meth_8336( var_3.owner );
    var_3._id_EB9C = 3;
    var_3._id_94D1 = 0;
    var_3 thread _id_3AFE();
    var_3._id_DCD0 = getent( "remote_uav_range", "targetname" );

    if ( !isdefined( var_3._id_DCD0 ) )
    {
        var_4 = getent( "airstrikeheight", "targetname" );
        var_3._id_B4A3 = var_4.origin[2];
        var_3._id_B492 = 3600;
    }

    var_3._id_10478 = spawn( "script_origin", var_3.origin );
    var_3._id_10478.angles = var_3.angles;
    var_3._id_10478.origin = var_3.origin;
    var_3._id_10478 linkto( var_3 );
    var_3._id_10478 playloopsound( "recondrone_idle_high" );
    return var_3;
}

_id_F686( var_0 )
{
    var_0 thread _id_3AFF( self );
    self notifyonplayercommand( "place_carryRemoteUAV", "+attack" );
    self notifyonplayercommand( "place_carryRemoteUAV", "+attack_akimbo_accessible" );
    self notifyonplayercommand( "cancel_carryRemoteUAV", "+actionslot 4" );

    if ( !level._id_4542 )
    {
        self notifyonplayercommand( "cancel_carryRemoteUAV", "+actionslot 5" );
        self notifyonplayercommand( "cancel_carryRemoteUAV", "+actionslot 6" );
        self notifyonplayercommand( "cancel_carryRemoteUAV", "+actionslot 7" );
    }

    for (;;)
    {
        var_1 = _id_AEBE( "place_carryRemoteUAV", "cancel_carryRemoteUAV", "weapon_switch_started", "force_cancel_placement", "death", "disconnect" );
        self _meth_80F3();

        if ( var_1 != "place_carryRemoteUAV" )
        {
            _id_3AFD( var_0 );
            break;
        }

        if ( !var_0._id_3872 )
        {
            if ( self.team != "spectator" )
                self _meth_80F4( &"KILLSTREAKS_REMOTE_UAV_CANNOT_PLACE" );

            continue;
        }

        if ( _id_68C4( self.team ) || scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA >= scripts\mp\utility\game::_id_B4D2() )
        {
            self iprintlnbold( &"KILLSTREAKS_TOO_MANY_VEHICLES" );
            _id_3AFD( var_0 );
            break;
        }

        self._id_9D81 = 0;
        var_0._id_3A9D = undefined;
        var_0 playsound( "sentry_gun_plant" );
        var_0 notify( "placed" );
        break;
    }
}

_id_AEBE( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( ( !isdefined( var_0 ) || var_0 != "death" ) && ( !isdefined( var_1 ) || var_1 != "death" ) && ( !isdefined( var_2 ) || var_2 != "death" ) && ( !isdefined( var_3 ) || var_3 != "death" ) && ( !isdefined( var_4 ) || var_4 != "death" ) )
        self endon( "death" );

    var_6 = spawnstruct();

    if ( isdefined( var_0 ) )
        thread scripts\engine\utility::_id_13806( var_0, var_6 );

    if ( isdefined( var_1 ) )
        thread scripts\engine\utility::_id_13806( var_1, var_6 );

    if ( isdefined( var_2 ) )
        thread scripts\engine\utility::_id_13806( var_2, var_6 );

    if ( isdefined( var_3 ) )
        thread scripts\engine\utility::_id_13806( var_3, var_6 );

    if ( isdefined( var_4 ) )
        thread scripts\engine\utility::_id_13806( var_4, var_6 );

    if ( isdefined( var_5 ) )
        thread scripts\engine\utility::_id_13806( var_5, var_6 );

    var_6 waittill( "returned", var_7 );
    var_6 notify( "die" );
    return var_7;
}

_id_3AFF( var_0 )
{
    self setcandamage( 0 );
    self _meth_8335( var_0 );
    self _meth_82C7( 0 );
    self._id_3A9D = var_0;
    var_0._id_9D81 = 1;
    var_0 thread _id_12E70( self );
    self notify( "carried" );
}

_id_3AFD( var_0 )
{
    self._id_9D81 = 0;

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0._id_10478 ) )
            var_0._id_10478 delete();

        var_0 delete();
    }
}

_id_9E4F()
{
    if ( isdefined( level._id_DFA2 ) && level._id_DFA2.size )
    {
        foreach ( var_1 in level._id_DFA2 )
        {
            if ( self istouching( var_1 ) )
                return 1;
        }
    }

    return 0;
}

_id_12E70( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "placed" );
    var_0 endon( "death" );
    var_0._id_3872 = 1;
    var_1 = -1;
    scripts\engine\utility::_id_1C6E( 1 );

    for (;;)
    {
        var_2 = 18;

        switch ( self getstance() )
        {
            case "stand":
                var_2 = 40;
                break;
            case "crouch":
                var_2 = 25;
                break;
            case "prone":
                var_2 = 10;
                break;
        }

        var_3 = self _meth_805E( 22, 22, 50, var_2, 0, 0 );
        var_0.origin = var_3["origin"] + anglestoup( self.angles ) * 27;
        var_0.angles = var_3["angles"];
        var_0._id_3872 = self isonground() && var_3["result"] && var_0 _id_DF9C() && !var_0 _id_9E4F();

        if ( var_0._id_3872 != var_1 )
        {
            if ( var_0._id_3872 )
            {
                if ( self.team != "spectator" )
                    self _meth_80F4( &"KILLSTREAKS_REMOTE_UAV_PLACE" );

                if ( self attackbuttonpressed() )
                    self notify( "place_carryRemoteUAV" );
            }
            else if ( self.team != "spectator" )
                self _meth_80F4( &"KILLSTREAKS_REMOTE_UAV_CANNOT_PLACE" );
        }

        var_1 = var_0._id_3872;
        wait 0.05;
    }
}

_id_3AFE()
{
    level endon( "game_ended" );
    self.owner endon( "place_carryRemoteUAV" );
    self.owner endon( "cancel_carryRemoteUAV" );
    self.owner scripts\engine\utility::waittill_any( "death", "disconnect", "joined_team", "joined_spectators" );

    if ( isdefined( self ) )
    {
        if ( isdefined( self._id_10478 ) )
            self._id_10478 delete();

        self delete();
    }
}

_id_E162()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    wait 0.7;
}

_id_10DEA( var_0, var_1, var_2, var_3 )
{
    _id_AF31();
    scripts\mp\utility\game::_id_FB09( var_1 );
    scripts\mp\utility\game::_id_12C6( "uav_remote_mp" );
    scripts\mp\utility\game::_id_141B( "uav_remote_mp" );
    self visionsetnakedforplayer( "black_bw", 0.0 );
    var_4 = scripts\mp\killstreaks\killstreaks::_id_98C2( "remote_uav" );

    if ( var_4 != "success" )
    {
        if ( var_4 != "disconnect" )
        {
            self notify( "remoteuav_unlock" );
            scripts\mp\utility\game::_id_141E( "uav_remote_mp" );
            scripts\mp\utility\game::_id_41E9();
        }

        return 0;
    }

    if ( _id_68C4( self.team ) || scripts\mp\utility\game::_id_4BD7() >= scripts\mp\utility\game::_id_B4D2() || level._id_6BAA >= scripts\mp\utility\game::_id_B4D2() )
    {
        self iprintlnbold( &"KILLSTREAKS_TOO_MANY_VEHICLES" );
        self notify( "remoteuav_unlock" );
        scripts\mp\utility\game::_id_141E( "uav_remote_mp" );
        scripts\mp\utility\game::_id_41E9();
        return 0;
    }

    self notify( "remoteuav_unlock" );
    var_5 = _id_4A07( var_0, self, var_1, var_2, var_3 );

    if ( isdefined( var_5 ) )
    {
        thread _id_DFA7( var_0, var_5, var_1 );
        return 1;
    }
    else
    {
        self iprintlnbold( &"KILLSTREAKS_TOO_MANY_VEHICLES" );
        scripts\mp\utility\game::_id_141E( "uav_remote_mp" );
        scripts\mp\utility\game::_id_41E9();
        return 0;
    }
}

_id_AF31()
{
    var_0 = spawn( "script_origin", self.origin );
    var_0 hide();
    self _meth_823A( var_0 );
    thread _id_41CD( var_0 );
}

_id_41CD( var_0 )
{
    level endon( "game_ended" );
    var_1 = scripts\engine\utility::_id_13734( "disconnect", "death", "remoteuav_unlock" );

    if ( var_1 != "disconnect" )
        self unlink();

    var_0 delete();
}

_id_4A07( var_0, var_1, var_2, var_3, var_4 )
{
    if ( level._id_4542 )
        var_5 = spawnhelicopter( var_1, var_3, var_4, "remote_uav_mp", "vehicle_remote_uav" );
    else
        var_5 = spawnhelicopter( var_1, var_3, var_4, "remote_uav_mp_pc", "vehicle_remote_uav" );

    if ( !isdefined( var_5 ) )
        return undefined;

    var_5 scripts\mp\killstreaks\helicopter::_id_1852();
    var_5 thread scripts\mp\killstreaks\helicopter::_id_E111();
    var_5 makevehiclesolidcapsule( 18, -9, 18 );
    var_5._id_AC68 = var_0;
    var_5.team = var_1.team;
    var_5.pers["team"] = var_1.team;
    var_5.owner = var_1;
    var_5 _meth_831F( var_1 );
    var_5 scripts\mp\sentientpoolmanager::registersentient( "Killstreak_Air", var_1 );
    var_5.maxhealth = 250;
    var_5._id_EC9C = spawn( "script_model", var_3 );
    var_5._id_EC9C linkto( var_5, "tag_origin", ( 0, 0, -160 ), ( 0, 0, 0 ) );
    var_5._id_EC9C _meth_81F4( var_1 );
    var_5._id_1037E = 0;
    var_5._id_94D1 = 0;
    var_5.helitype = "remote_uav";
    var_5._id_B372 = [];
    var_5 thread _id_DFA0();
    var_5 thread _id_DF95();
    var_5 thread _id_DF93();
    var_5 thread _id_DF94();
    var_5 thread _id_DF8D();
    var_5 thread _id_DF9F();
    var_5 thread _id_DFAD();
    var_5 thread _id_DFAE();
    var_5 thread _id_DF99();
    var_5._id_C22B = 2;
    var_5._id_8C01 = 0;
    var_5._id_93DB = [];
    var_5 thread _id_DF8E();
    var_5 thread _id_DF9B();
    var_5 thread _id_DF9A();
    level._id_DF74[var_5.team] = var_5;
    return var_5;
}

_id_DFA7( var_0, var_1, var_2 )
{
    var_1._id_D3D3 = 1;
    self._id_E2D7 = self.angles;

    if ( getdvarint( "camera_thirdPerson" ) )
        scripts\mp\utility\game::_id_F887( 0 );

    self cameralinkto( var_1, "tag_origin" );
    self remotecontrolvehicle( var_1 );
    thread _id_DFA4( var_1 );
    thread _id_DFAA( var_1 );
    thread _id_DF96( var_1 );
    self._id_DF75 = var_0;
    self._id_DF8A = var_1;
    thread _id_DF90( var_1 );
    self visionsetnakedforplayer( "black_bw", 0.0 );
    scripts\mp\utility\game::restorebasevisionset( 1 );
}

_id_DF90( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_0 endon( "end_remote" );
    var_0 endon( "end_launch_dialog" );
    wait 3;
    _id_DF91( "launch" );
}

_id_DF92( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        var_0._id_D3D3 = 0;
        var_0 notify( "end_remote" );
        scripts\mp\utility\game::_id_41E9();

        if ( getdvarint( "camera_thirdPerson" ) )
            scripts\mp\utility\game::_id_F887( 1 );

        self cameraunlink( var_0 );
        self remotecontrolvehicleoff( var_0 );
        self thermalvisionoff();
        self setplayerangles( self._id_E2D7 );
        var_1 = scripts\engine\utility::_id_7F62();

        if ( !self hasweapon( var_1 ) )
            var_1 = _id_0DC9::_id_7EB7();

        scripts\mp\utility\game::_id_141A( var_1 );
        scripts\mp\utility\game::_id_141E( "uav_remote_mp" );
        thread _id_DF97();
    }

    self._id_DF8A = undefined;
}

_id_DF97()
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    scripts\mp\utility\game::_id_7385( 1 );
    wait 0.5;
    scripts\mp\utility\game::_id_7385( 0 );
}

_id_DFA4( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_0 endon( "end_remote" );
    wait 2;

    for (;;)
    {
        var_1 = 0;

        while ( self usebuttonpressed() )
        {
            var_1 += 0.05;

            if ( var_1 > 0.75 )
            {
                var_0 thread _id_DF9E();
                return;
            }

            wait 0.05;
        }

        wait 0.05;
    }
}

_id_DFAA( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_0 endon( "death" );
    var_0 endon( "end_remote" );
    var_0._id_AA34 = 0;
    self._id_AEFB = undefined;
    self _meth_8403();
    wait 1;

    for (;;)
    {
        var_1 = var_0 gettagorigin( "tag_turret" );
        var_2 = anglestoforward( self getplayerangles() );
        var_3 = var_1 + var_2 * 1024;
        var_4 = bullettrace( var_1, var_3, 1, var_0 );

        if ( isdefined( var_4["position"] ) )
            var_5 = var_4["position"];
        else
        {
            var_5 = var_3;
            var_4["endpos"] = var_3;
        }

        var_0._id_11A7B = var_4;
        var_6 = _id_DFAB( var_0, level.players, var_5 );
        var_7 = _id_DFAB( var_0, level._id_12A83, var_5 );
        var_8 = undefined;

        if ( level._id_BDCC )
        {
            var_9 = [];

            foreach ( var_11 in level._id_115DA )
            {
                if ( var_11 != self.team )
                {
                    foreach ( var_13 in level._id_12AF3[var_11] )
                        var_9[var_9.size] = var_13;
                }
            }

            var_8 = _id_DFAB( var_0, var_9, var_5 );
        }
        else if ( level.teambased )
            var_8 = _id_DFAB( var_0, level._id_12AF3[level._id_C74B[self.team]], var_5 );
        else
            var_8 = _id_DFAB( var_0, level._id_12AF3, var_5 );

        var_16 = undefined;

        if ( isdefined( var_6 ) )
            var_16 = var_6;
        else if ( isdefined( var_7 ) )
            var_16 = var_7;
        else if ( isdefined( var_8 ) )
            var_16 = var_8;

        if ( isdefined( var_16 ) )
        {
            if ( !isdefined( self._id_AEFB ) || isdefined( self._id_AEFB ) && self._id_AEFB != var_16 )
            {
                self _meth_8402( var_16 );
                self._id_AEFB = var_16;

                if ( isdefined( var_6 ) )
                {
                    var_0 notify( "end_launch_dialog" );
                    _id_DF91( "track" );
                }
            }
        }
        else
        {
            self _meth_8403();
            self._id_AEFB = undefined;
        }

        wait 0.05;
    }
}

_id_DFAB( var_0, var_1, var_2 )
{
    level endon( "game_ended" );
    var_3 = undefined;

    foreach ( var_5 in var_1 )
    {
        if ( level.teambased && ( !isdefined( var_5.team ) || var_5.team == self.team ) )
            continue;

        if ( isplayer( var_5 ) )
        {
            if ( !scripts\mp\utility\game::isreallyalive( var_5 ) )
                continue;

            if ( var_5 == self )
                continue;

            var_6 = var_5.guid;
        }
        else
            var_6 = var_5._id_0064;

        if ( isdefined( var_5._id_F26E ) || isdefined( var_5._id_12A9A ) )
        {
            var_7 = ( 0, 0, 32 );
            var_8 = "hud_fofbox_hostile_vehicle";
        }
        else if ( isdefined( var_5._id_12AFA ) )
        {
            var_7 = ( 0, 0, -52 );
            var_8 = "hud_fofbox_hostile_vehicle";
        }
        else
        {
            var_7 = ( 0, 0, 26 );
            var_8 = "veh_hud_target_unmarked";
        }

        if ( isdefined( var_5._id_12AF4 ) )
        {
            if ( !isdefined( var_0._id_B372[var_6] ) )
            {
                var_0._id_B372[var_6] = [];
                var_0._id_B372[var_6]["player"] = var_5;
                var_0._id_B372[var_6]["icon"] = var_5 scripts\mp\entityheadicons::_id_F73D( self, "veh_hud_target_marked", var_7, 10, 10, 0, 0.05, 0, 0, 0, 0 );
                var_0._id_B372[var_6]["icon"]._id_FC44 = "veh_hud_target_marked";

                if ( !isdefined( var_5._id_F26E ) || !isdefined( var_5._id_12A9A ) )
                    var_0._id_B372[var_6]["icon"] _meth_8346( var_5 );
            }
            else if ( isdefined( var_0._id_B372[var_6] ) && isdefined( var_0._id_B372[var_6]["icon"] ) && isdefined( var_0._id_B372[var_6]["icon"]._id_FC44 ) && var_0._id_B372[var_6]["icon"]._id_FC44 != "veh_hud_target_marked" )
            {
                var_0._id_B372[var_6]["icon"]._id_FC44 = "veh_hud_target_marked";
                var_0._id_B372[var_6]["icon"] setshader( "veh_hud_target_marked", 10, 10 );
                var_0._id_B372[var_6]["icon"] setwaypoint( 0, 0, 0, 0 );
            }

            continue;
        }

        if ( isplayer( var_5 ) )
        {
            var_9 = isdefined( var_5._id_10916 ) && ( gettime() - var_5._id_10916 ) / 1000 <= 5;
            var_10 = var_5 scripts\mp\utility\game::_id_12D6( "specialty_blindeye" );
            var_11 = 0;
            var_12 = 0;
        }
        else
        {
            var_9 = 0;
            var_10 = 0;
            var_11 = isdefined( var_5._id_3A9D );
            var_12 = isdefined( var_5._id_9E78 ) && var_5._id_9E78 == 1;
        }

        if ( !isdefined( var_0._id_B372[var_6] ) && !var_9 && !var_10 && !var_11 && !var_12 )
        {
            var_0._id_B372[var_6] = [];
            var_0._id_B372[var_6]["player"] = var_5;
            var_0._id_B372[var_6]["icon"] = var_5 scripts\mp\entityheadicons::_id_F73D( self, var_8, var_7, 10, 10, 0, 0.05, 0, 0, 0, 0 );
            var_0._id_B372[var_6]["icon"]._id_FC44 = var_8;

            if ( !isdefined( var_5._id_F26E ) || !isdefined( var_5._id_12A9A ) )
                var_0._id_B372[var_6]["icon"] _meth_8346( var_5 );
        }

        if ( ( !isdefined( var_3 ) || var_3 != var_5 ) && ( isdefined( var_0._id_11A7B["entity"] ) && var_0._id_11A7B["entity"] == var_5 && !var_11 && !var_12 ) || distance( var_5.origin, var_2 ) < 200 * var_0._id_11A7B["fraction"] && !var_9 && !var_11 && !var_12 || !var_12 && _id_DF8B( var_0, var_5 ) )
        {
            var_13 = bullettrace( var_0.origin, var_5.origin + ( 0, 0, 32 ), 1, var_0 );

            if ( isdefined( var_13["entity"] ) && var_13["entity"] == var_5 || var_13["fraction"] == 1 )
            {
                self playlocalsound( "recondrone_lockon" );
                var_3 = var_5;
            }
        }
    }

    return var_3;
}

_id_DF8B( var_0, var_1 )
{
    if ( isdefined( var_1._id_12AFA ) )
    {
        var_2 = anglestoforward( self getplayerangles() );
        var_3 = vectornormalize( var_1.origin - var_0 gettagorigin( "tag_turret" ) );
        var_4 = vectordot( var_2, var_3 );

        if ( var_4 > 0.985 )
            return 1;
    }

    return 0;
}

_id_DF96( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "end_remote" );
    wait 1;
    self notifyonplayercommand( "remoteUAV_tag", "+attack" );
    self notifyonplayercommand( "remoteUAV_tag", "+attack_akimbo_accessible" );

    for (;;)
    {
        self waittill( "remoteUAV_tag" );

        if ( isdefined( self._id_AEFB ) )
        {
            self playlocalsound( "recondrone_tag" );
            scripts\mp\damagefeedback::updatedamagefeedback( "" );
            thread _id_DFA1( self._id_AEFB );
            thread _id_DFA8( var_0, 3 );
            wait 0.25;
            continue;
        }

        wait 0.05;
    }
}

_id_DFA8( var_0, var_1 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "end_remote" );
    var_0 notify( "end_rumble" );
    var_0 endon( "end_rumble" );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
    {
        self playrumbleonentity( "damage_heavy" );
        wait 0.05;
    }
}

_id_DFA1( var_0 )
{
    level endon( "game_ended" );
    var_0._id_12AF4 = self;

    if ( isplayer( var_0 ) && !var_0 scripts\mp\utility\game::isusingremote() )
    {
        var_0 playlocalsound( "player_hit_while_ads_hurt" );
        var_0 thread scripts\mp\flashgrenades::_id_20CA( 2.0, 1.0 );
        var_0 thread scripts\mp\rank::scoreeventpopup( "marked_by_remote_uav" );
    }
    else if ( isdefined( var_0._id_12AFA ) )
        var_0._id_2B0C = var_0._id_0064;
    else if ( isdefined( var_0.owner ) && isalive( var_0.owner ) )
        var_0.owner thread scripts\mp\rank::scoreeventpopup( "turret_marked_by_remote_uav" );

    _id_DF91( "tag" );

    if ( level.gametype != "dm" )
    {
        if ( isplayer( var_0 ) )
            thread scripts\mp\utility\game::_id_83B4( "kill" );
    }

    if ( isplayer( var_0 ) )
        var_0 _meth_8320( "specialty_radarblip", 1 );
    else
    {
        if ( isdefined( var_0._id_12AFA ) )
            var_1 = "compassping_enemy_uav";
        else
            var_1 = "compassping_sentry_enemy";

        if ( level.teambased )
        {
            var_2 = scripts\mp\objidpoolmanager::requestminimapid( 1 );

            if ( var_2 != -1 )
            {
                scripts\mp\objidpoolmanager::minimap_objective_add( var_2, "invisible", ( 0, 0, 0 ) );
                scripts\mp\objidpoolmanager::minimap_objective_onentity( var_2, var_0 );
                scripts\mp\objidpoolmanager::minimap_objective_state( var_2, "active" );
                scripts\mp\objidpoolmanager::minimap_objective_team( var_2, self.team );
                scripts\mp\objidpoolmanager::minimap_objective_icon( var_2, var_1 );
            }

            var_0._id_DFAF = var_2;
        }
        else
        {
            var_2 = scripts\mp\objidpoolmanager::requestminimapid( 1 );

            if ( var_2 != -1 )
            {
                scripts\mp\objidpoolmanager::minimap_objective_add( var_2, "invisible", ( 0, 0, 0 ) );
                scripts\mp\objidpoolmanager::minimap_objective_onentity( var_2, var_0 );
                scripts\mp\objidpoolmanager::minimap_objective_state( var_2, "active" );
                scripts\mp\objidpoolmanager::minimap_objective_team( var_2, level._id_C74B[self.team] );
                scripts\mp\objidpoolmanager::minimap_objective_icon( var_2, var_1 );
            }

            var_0._id_DFB0 = var_2;
            var_2 = scripts\mp\objidpoolmanager::requestminimapid( 1 );

            if ( var_2 != -1 )
            {
                scripts\mp\objidpoolmanager::minimap_objective_add( var_2, "invisible", ( 0, 0, 0 ) );
                scripts\mp\objidpoolmanager::minimap_objective_onentity( var_2, var_0 );
                scripts\mp\objidpoolmanager::minimap_objective_state( var_2, "active" );
                scripts\mp\objidpoolmanager::minimap_objective_team( var_2, self.team );
                scripts\mp\objidpoolmanager::minimap_objective_icon( var_2, var_1 );
            }

            var_0._id_DFB1 = var_2;
        }
    }

    var_0 thread _id_DFAC( self._id_DF8A );
}

_id_DFA5( var_0 )
{
    _id_DF91( "assist" );

    if ( level.gametype != "dm" )
    {
        self._id_113FF = 1;

        if ( isdefined( var_0 ) )
            thread scripts\mp\gamescore::_id_D98C( var_0 );
        else
            thread scripts\mp\utility\game::_id_83B4( "assist" );
    }
}

_id_DFAC( var_0 )
{
    level endon( "game_ended" );
    var_1 = scripts\engine\utility::_id_13734( "death", "disconnect", "carried", "leaving" );

    if ( var_1 == "leaving" || !isdefined( self._id_12AFA ) )
        self._id_12AF4 = undefined;

    if ( isdefined( var_0 ) )
    {
        if ( isplayer( self ) )
            var_2 = self.guid;
        else if ( isdefined( self._id_0064 ) )
            var_2 = self._id_0064;
        else
            var_2 = self._id_2B0C;

        if ( var_1 == "carried" || var_1 == "leaving" )
        {
            var_0._id_B372[var_2]["icon"] destroy();
            var_0._id_B372[var_2]["icon"] = undefined;
        }

        if ( isdefined( var_2 ) && isdefined( var_0._id_B372[var_2] ) )
        {
            var_0._id_B372[var_2] = undefined;
            var_0._id_B372 = scripts\engine\utility::_id_22BC( var_0._id_B372 );
        }
    }

    if ( isplayer( self ) )
        self _meth_83CC( "specialty_radarblip", 1 );
    else
    {
        if ( isdefined( self._id_DFAF ) )
            scripts\mp\objidpoolmanager::returnminimapid( self._id_DFAF );

        if ( isdefined( self._id_DFB0 ) )
            scripts\mp\objidpoolmanager::returnminimapid( self._id_DFB0 );

        if ( isdefined( self._id_DFB1 ) )
            scripts\mp\objidpoolmanager::returnminimapid( self._id_DFB1 );
    }
}

_id_DF8F()
{
    foreach ( var_1 in self._id_B372 )
    {
        if ( isdefined( var_1["icon"] ) )
        {
            var_1["icon"] destroy();
            var_1["icon"] = undefined;
        }
    }

    self._id_B372 = undefined;
}

_id_DFA3( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "end_remote" );

    for (;;)
    {
        self playrumbleonentity( "damage_light" );
        wait 0.5;
    }
}

_id_DFAD()
{
    self endon( "death" );
    self._id_DCD0 = getent( "remote_uav_range", "targetname" );

    if ( !isdefined( self._id_DCD0 ) )
    {
        var_0 = getent( "airstrikeheight", "targetname" );
        self._id_B4A3 = var_0.origin[2];
        self._id_B492 = 12800;
    }

    self._id_3BB7 = spawn( "script_model", level.mapcenter );
    var_1 = self.origin;
    self._id_DCCE = 0;

    for (;;)
    {
        if ( !_id_DF9C() )
        {
            var_2 = 0;

            while ( !_id_DF9C() )
            {
                self.owner _id_DF91( "out_of_range" );

                if ( !self._id_DCCE )
                {
                    self._id_DCCE = 1;
                    thread _id_DFA6();
                }

                if ( isdefined( self._id_8DBD ) )
                {
                    var_3 = distance( self.origin, self._id_8DBD.origin );
                    var_2 = 1 - ( var_3 - 150 ) / 150;
                }
                else
                {
                    var_3 = distance( self.origin, var_1 );
                    var_2 = min( 1, var_3 / 200 );
                }

                self.owner setrankedplayerdata( "reconDroneState", "staticAlpha", var_2 );
                wait 0.05;
            }

            self notify( "in_range" );
            self._id_DCCE = 0;
            thread _id_DFA9( var_2 );
        }

        var_1 = self.origin;
        wait 0.05;
    }
}

_id_DF9C()
{
    if ( isdefined( self._id_DCD0 ) )
    {
        if ( !self istouching( self._id_DCD0 ) && !self._id_94D1 )
            return 1;
    }
    else if ( distance2d( self.origin, level.mapcenter ) < self._id_B492 && self.origin[2] < self._id_B4A3 && !self._id_94D1 )
        return 1;

    return 0;
}

_id_DFA9( var_0 )
{
    self endon( "death" );

    while ( _id_DF9C() )
    {
        var_0 -= 0.05;

        if ( var_0 < 0 )
        {
            self.owner setrankedplayerdata( "reconDroneState", "staticAlpha", 0 );
            break;
        }

        self.owner setrankedplayerdata( "reconDroneState", "staticAlpha", var_0 );
        wait 0.05;
    }
}

_id_DFA6()
{
    self endon( "death" );
    self endon( "in_range" );

    if ( isdefined( self._id_8DBD ) )
        var_0 = 3;
    else
        var_0 = 6;

    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    self notify( "death" );
}

_id_DF95()
{
    self endon( "death" );
    self.owner waittill( "disconnect" );
    self notify( "death" );
}

_id_DF93()
{
    self endon( "death" );
    self.owner scripts\engine\utility::waittill_any( "joined_team", "joined_spectators" );
    self notify( "death" );
}

_id_DF8D()
{
    self endon( "death" );
    level waittill( "game_ended" );
    _id_DF8F();
}

_id_DF9F()
{
    self endon( "death" );
    var_0 = 60.0;
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    thread _id_DF9E();
}

_id_DF9E()
{
    level endon( "game_ended" );
    self endon( "death" );
    self notify( "leaving" );
    self.owner _id_DF92( self );
    self notify( "death" );
}

_id_DF94()
{
    level endon( "game_ended" );
    self waittill( "death" );
    self playsound( "recondrone_destroyed" );
    playfx( level._id_DF98["explode"], self.origin );
    _id_DF8C();
}

_id_DF8C()
{
    if ( self._id_D3D3 == 1 && isdefined( self.owner ) )
        self.owner _id_DF92( self );

    if ( isdefined( self._id_EC9C ) )
        self._id_EC9C delete();

    if ( isdefined( self._id_3BB7 ) )
        self._id_3BB7 delete();

    _id_DF8F();
    stopfxontag( level._id_DF98["smoke"], self, "tag_origin" );
    level._id_DF74[self.team] = undefined;
    scripts\mp\utility\game::_id_4FC1();
    self delete();
}

_id_DFA0()
{
    playfxontag( level._id_3F19["light"]["belly"], self, "tag_light_nose" );
    wait 0.05;
    playfxontag( level._id_3F19["light"]["tail"], self, "tag_light_tail1" );
}

_id_DF91( var_0 )
{
    if ( var_0 == "tag" )
        var_1 = 1000;
    else
        var_1 = 5000;

    if ( gettime() - level._id_DF9D < var_1 )
        return;

    level._id_DF9D = gettime();
    var_2 = randomint( level._id_DF91[var_0].size );
    var_3 = level._id_DF91[var_0][var_2];
    var_4 = scripts\mp\teams::_id_81BC( self.team ) + var_3;
    self playlocalsound( var_4 );
}

_id_DF9B()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "end_remote" );

    for (;;)
    {
        level waittill( "stinger_fired", var_0, var_1, var_2 );

        if ( !isdefined( var_1 ) || !isdefined( var_2 ) || var_2 != self )
            continue;

        self.owner playlocalsound( "javelin_clu_lock" );
        self.owner setrankedplayerdata( "reconDroneState", "incomingMissile", 1 );
        self._id_8C01 = 1;
        self._id_93DB[self._id_93DB.size] = var_1;
        var_1.owner = var_0;
        var_1 thread _id_13B5F( var_2 );
    }
}

_id_DF9A()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "end_remote" );

    for (;;)
    {
        level waittill( "sam_fired", var_0, var_1, var_2 );

        if ( !isdefined( var_2 ) || var_2 != self )
            continue;

        var_3 = 0;

        foreach ( var_5 in var_1 )
        {
            if ( isdefined( var_5 ) )
            {
                self._id_93DB[self._id_93DB.size] = var_5;
                var_5.owner = var_0;
                var_3++;
            }
        }

        if ( var_3 )
        {
            self.owner playlocalsound( "javelin_clu_lock" );
            self.owner setrankedplayerdata( "reconDroneState", "incomingMissile", 1 );
            self._id_8C01 = 1;
            level thread _id_13B30( var_2, var_1 );
        }
    }
}

_id_13B5F( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self _meth_8206( var_0 );
    var_1 = vectornormalize( var_0.origin - self.origin );

    while ( isdefined( var_0 ) )
    {
        var_2 = var_0 getpointinbounds( 0, 0, 0 );
        var_3 = distance( self.origin, var_2 );

        if ( var_0._id_C22B > 0 && var_3 < 4000 )
        {
            var_4 = var_0 _id_5231();
            self _meth_8206( var_4 );
            return;
        }
        else
        {
            var_5 = vectornormalize( var_0.origin - self.origin );

            if ( vectordot( var_5, var_1 ) < 0 )
            {
                self playsound( "exp_stinger_armor_destroy" );
                playfx( level._id_DF98["missile_explode"], self.origin );

                if ( isdefined( self.owner ) )
                    radiusdamage( self.origin, 400, 1000, 1000, self.owner, "MOD_EXPLOSIVE", "stinger_mp" );
                else
                    radiusdamage( self.origin, 400, 1000, 1000, undefined, "MOD_EXPLOSIVE", "stinger_mp" );

                self hide();
                wait 0.05;
                self delete();
            }
            else
                var_1 = var_5;
        }

        wait 0.05;
    }
}

_id_13B30( var_0, var_1 )
{
    level endon( "game_ended" );
    var_0 endon( "death" );

    foreach ( var_3 in var_1 )
    {
        if ( isdefined( var_3 ) )
        {
            var_3 _meth_8206( var_0 );
            var_3._id_AA41 = vectornormalize( var_0.origin - var_3.origin );
        }
    }

    while ( var_1.size && isdefined( var_0 ) )
    {
        var_5 = var_0 getpointinbounds( 0, 0, 0 );

        foreach ( var_3 in var_1 )
        {
            if ( isdefined( var_3 ) )
            {
                if ( isdefined( self._id_B37B ) )
                {
                    self delete();
                    continue;
                }

                if ( var_0._id_C22B > 0 )
                {
                    var_7 = distance( var_3.origin, var_5 );

                    if ( var_7 < 4000 )
                    {
                        var_8 = var_0 _id_5231();

                        foreach ( var_10 in var_1 )
                        {
                            if ( isdefined( var_10 ) )
                                var_10 _meth_8206( var_8 );
                        }

                        return;
                    }

                    continue;
                }

                var_12 = vectornormalize( var_0.origin - var_3.origin );

                if ( vectordot( var_12, var_3._id_AA41 ) < 0 )
                {
                    var_3 playsound( "exp_stinger_armor_destroy" );
                    playfx( level._id_DF98["missile_explode"], var_3.origin );

                    if ( isdefined( var_3.owner ) )
                        radiusdamage( var_3.origin, 400, 1000, 1000, var_3.owner, "MOD_EXPLOSIVE", "stinger_mp" );
                    else
                        radiusdamage( var_3.origin, 400, 1000, 1000, undefined, "MOD_EXPLOSIVE", "stinger_mp" );

                    var_3 hide();
                    var_3._id_B37B = 1;
                }
                else
                    var_3._id_AA41 = var_12;
            }
        }

        var_1 = scripts\engine\utility::_id_22BC( var_1 );
        wait 0.05;
    }
}

_id_5231()
{
    self._id_C22B--;
    self.owner thread _id_DFA8( self, 6 );
    self playsound( "WEAP_SHOTGUNATTACH_FIRE_NPC" );
    thread _id_D47A();
    var_0 = self.origin + ( 0, 0, -100 );
    var_1 = spawn( "script_origin", var_0 );
    var_1.angles = self.angles;
    var_1 movegravity( ( 0, 0, -1 ), 5.0 );
    var_1 thread _id_51A6( 5.0 );
    return var_1;
}

_id_D47A()
{
    for ( var_0 = 0; var_0 < 5; var_0++ )
    {
        if ( !isdefined( self ) )
            return;

        playfxontag( level._effect["vehicle_flares"], self, "TAG_FLARE" );
        wait 0.15;
    }
}

_id_51A6( var_0 )
{
    wait( var_0 );
    self delete();
}

_id_DF8E()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "end_remote" );

    for (;;)
    {
        var_0 = 0;

        for ( var_1 = 0; var_1 < self._id_93DB.size; var_1++ )
        {
            if ( isdefined( self._id_93DB[var_1] ) && _id_B80A( self._id_93DB[var_1], self ) )
                var_0++;
        }

        if ( self._id_8C01 && !var_0 )
        {
            self._id_8C01 = 0;
            self.owner setrankedplayerdata( "reconDroneState", "incomingMissile", 0 );
        }

        self._id_93DB = scripts\engine\utility::_id_22BC( self._id_93DB );
        wait 0.05;
    }
}

_id_B80A( var_0, var_1 )
{
    var_2 = vectornormalize( var_1.origin - var_0.origin );
    var_3 = anglestoforward( var_0.angles );
    return vectordot( var_2, var_3 ) > 0;
}

_id_DFAE()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "end_remote" );

    for (;;)
    {
        var_0 = 0;

        foreach ( var_2 in level._id_8DD3 )
        {
            if ( distance( var_2.origin, self.origin ) < 300 )
            {
                var_0 = 1;
                self._id_8DBD = var_2;
            }
        }

        foreach ( var_5 in level._id_AD8B )
        {
            if ( var_5 != self && ( !isdefined( var_5.helitype ) || var_5.helitype != "remote_uav" ) && distance( var_5.origin, self.origin ) < 300 )
            {
                var_0 = 1;
                self._id_8DBD = var_5;
            }
        }

        if ( !self._id_94D1 && var_0 )
            self._id_94D1 = 1;
        else if ( self._id_94D1 && !var_0 )
        {
            self._id_94D1 = 0;
            self._id_8DBD = undefined;
        }

        wait 0.05;
    }
}

_id_DF99()
{
    self endon( "end_remote" );
    scripts\mp\damage::monitordamage( self.maxhealth, "remote_uav", ::_id_898F, ::_id_B938, 1 );
}

_id_B938( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;
    var_5 = scripts\mp\damage::_id_8999( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_89C6( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8975( var_1, var_2, var_5 );
    playfxontagforclients( level._id_DF98["hit"], self, "tag_origin", self.owner );
    self playsound( "recondrone_damaged" );

    if ( self._id_1037E == 0 && self._id_00E1 >= self.maxhealth / 2 )
    {
        self._id_1037E = 1;
        playfxontag( level._id_DF98["smoke"], self, "tag_origin" );
    }

    return var_5;
}

_id_898F( var_0, var_1, var_2, var_3 )
{
    scripts\mp\damage::onkillstreakkilled( "remote_uav", var_0, var_1, var_2, var_3, "destroyed_remote_uav", undefined, "callout_destroyed_remote_uav" );
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "ims", ::_id_128EA );
    level._id_9385 = [];
    var_0 = spawnstruct();
    var_0._id_039B = "ims_projectile_mp";
    var_0._id_B91A = "ims_scorpion_body_iw6";
    var_0._id_B924 = "ims_scorpion_body_iw6_placement";
    var_0._id_B925 = "ims_scorpion_body_iw6_placement_failed";
    var_0._id_B91D = "ims_scorpion_body_iw6";
    var_0._id_B91C = "ims_scorpion_body_iw6_bombsquad";
    var_0._id_017B = &"KILLSTREAKS_HINTS_IMS_PICKUP_TO_MOVE";
    var_0._id_CC28 = &"KILLSTREAKS_HINTS_IMS_PLACE";
    var_0._id_38E3 = &"KILLSTREAKS_HINTS_IMS_CANNOT_PLACE";
    var_0._id_110EA = "ims";
    var_0._id_10A38 = "used_ims";
    var_0.maxhealth = 670;
    var_0._id_AC71 = 90.0;
    var_0._id_DDAC = 0.5;
    var_0._id_8487 = 0.4;
    var_0._id_C228 = 4;
    var_0._id_6A03 = "ims_scorpion_explosive_iw6";
    var_0._id_CC22 = 30.0;
    var_0._id_CC25 = 24.0;
    var_0._id_AC49 = "tag_lid";
    var_0._id_AC47 = [];
    var_0._id_AC47[1] = "IMS_Scorpion_door_1";
    var_0._id_AC47[2] = "IMS_Scorpion_door_2";
    var_0._id_AC47[3] = "IMS_Scorpion_door_3";
    var_0._id_AC47[4] = "IMS_Scorpion_door_4";
    var_0._id_AC48 = [];
    var_0._id_AC48[1] = "IMS_Scorpion_1_opened";
    var_0._id_AC48[2] = "IMS_Scorpion_2_opened";
    var_0._id_AC48[3] = "IMS_Scorpion_3_opened";
    var_0._id_6A09 = "tag_explosive";
    var_0._id_A640 = ( 0, 0, 12 );
    level._id_9385["ims"] = var_0;
    level._effect["ims_explode_mp"] = loadfx( "vfx/iw7/_requests/mp/vfx_generic_equipment_exp_lg.vfx" );
    level._effect["ims_smoke_mp"] = loadfx( "vfx/core/mp/killstreaks/vfx_sg_damage_blacksmoke" );
    level._effect["ims_sensor_explode"] = loadfx( "vfx/core/mp/killstreaks/vfx_ims_sparks" );
    level._effect["ims_antenna_light_mp"] = loadfx( "vfx/core/mp/killstreaks/vfx_light_detonator_blink" );
    level._id_CC11 = [];
}

_id_128EA( var_0 )
{
    var_1 = [];

    if ( isdefined( self._id_9382 ) )
        var_1 = self._id_9382;

    var_2 = _id_836E( "ims", var_0 );

    if ( !isdefined( var_2 ) )
    {
        var_2 = 0;

        if ( isdefined( self._id_9382 ) )
        {
            if ( !var_1.size && self._id_9382.size )
                var_2 = 1;

            if ( var_1.size && var_1[0] != self._id_9382[0] )
                var_2 = 1;
        }
    }

    if ( var_2 )
        scripts\mp\matchdata::_id_AFC9( var_0._id_110EA, self.origin );

    self._id_9D81 = 0;
    return var_2;
}

_id_836E( var_0, var_1 )
{
    var_2 = _id_49DC( var_0, self );
    var_1._id_9380 = var_2;
    _id_E152();
    self._id_3A9F = var_2;
    var_2._id_6DEC = 1;
    var_3 = _id_F684( var_2, 1 );
    self._id_3A9F = undefined;
    thread _id_E2E0();
    return var_3;
}

_id_F684( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 thread _id_9377( self );
    scripts\engine\utility::_id_1C71( 0 );

    if ( !isai( self ) )
    {
        self notifyonplayercommand( "place_ims", "+attack" );
        self notifyonplayercommand( "place_ims", "+attack_akimbo_accessible" );

        if ( !level._id_4542 )
        {
            self notifyonplayercommand( "cancel_ims", "+actionslot 5" );
            self notifyonplayercommand( "cancel_ims", "+actionslot 6" );
            self notifyonplayercommand( "cancel_ims", "+actionslot 7" );
        }
    }

    for (;;)
    {
        var_2 = scripts\engine\utility::_id_13734( "place_ims", "cancel_ims", "force_cancel_placement", "killstreak_trigger_blocked" );

        if ( var_2 == "cancel_ims" || var_2 == "force_cancel_placement" || var_2 == "killstreak_trigger_blocked" )
        {
            if ( !var_1 && ( var_2 == "cancel_ims" || var_2 == "killstreak_trigger_blocked" ) )
                continue;

            var_0 _id_9376( var_2 == "force_cancel_placement" && !isdefined( var_0._id_6DEC ) );
            return 0;
        }

        if ( !var_0._id_3872 )
            continue;

        var_0 thread _id_9379();
        self notify( "IMS_placed" );
        scripts\engine\utility::_id_1C71( 1 );
        return 1;
    }
}

_id_E18E()
{
    if ( self hasweapon( "iw6_riotshield_mp" ) )
    {
        self._id_E2E6 = "iw6_riotshield_mp";
        scripts\mp\utility\game::_id_141E( "iw6_riotshield_mp" );
    }
}

_id_E152()
{
    if ( scripts\mp\utility\game::_id_12D6( "specialty_explosivebullets" ) )
    {
        self._id_E2DF = "specialty_explosivebullets";
        scripts\mp\utility\game::_id_E150( "specialty_explosivebullets" );
    }
}

_id_E2E8()
{
    if ( isdefined( self._id_E2E6 ) )
    {
        scripts\mp\utility\game::_id_12C6( self._id_E2E6 );
        self._id_E2E6 = undefined;
    }
}

_id_E2E0()
{
    if ( isdefined( self._id_E2DF ) )
    {
        scripts\mp\utility\game::giveperk( self._id_E2DF );
        self._id_E2DF = undefined;
    }
}

_id_1370F()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait 0.05;
    _id_E2E0();
}

_id_49DC( var_0, var_1 )
{
    if ( isdefined( var_1._id_9D81 ) && var_1._id_9D81 )
        return;

    var_2 = spawnturret( "misc_turret", var_1.origin + ( 0, 0, 25 ), "sentry_minigun_mp" );
    var_2.angles = var_1.angles;
    var_2._id_9386 = var_0;
    var_2.owner = var_1;
    var_2 setmodel( level._id_9385[var_0]._id_B91A );
    var_2 maketurretinoperable();
    var_2 _meth_835B( 1 );
    var_2 _meth_830F( "sentry_offline" );
    var_2 makeunusable();
    var_2 _meth_8336( var_1 );
    return var_2;
}

_id_49DB( var_0 )
{
    var_1 = var_0.owner;
    var_2 = var_0._id_9386;
    var_3 = spawn( "script_model", var_0.origin );
    var_3 setmodel( level._id_9385[var_2]._id_B91A );
    var_3._id_EB9C = 3;
    var_3.angles = var_0.angles;
    var_3._id_9386 = var_2;
    var_3.owner = var_1;
    var_3 _meth_831F( var_1 );
    var_3.team = var_1.team;
    var_3._id_10085 = 0;
    var_3._id_8E5A = 0;
    var_3._id_252E = 1;
    var_3 _meth_80A3();
    var_3._id_8BF0 = [];
    var_3._id_451C = level._id_9385[var_2];
    var_3 thread _id_9369();
    var_3 thread _id_937C();
    var_3 thread _id_9363();
    var_3 thread _id_9372();
    return var_3;
}

_id_9363()
{
    var_0 = spawn( "script_model", self.origin );
    var_0.angles = self.angles;
    var_0 hide();
    var_0 thread scripts\mp\weapons::_id_2C69( self.owner );
    var_0 setmodel( level._id_9385[self._id_9386]._id_B91C );
    var_0 linkto( self );
    var_0 _meth_82C7( 0 );
    self._id_2C68 = var_0;
    self waittill( "death" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_936D( var_0 )
{
    self._id_933C = 1;
    self notify( "death" );
}

_id_9366()
{
    self endon( "carried" );
    scripts\mp\damage::monitordamage( self._id_451C.maxhealth, "ims", ::_id_9368, ::_id_936C, 1 );
}

_id_936C( var_0, var_1, var_2, var_3, var_4 )
{
    if ( self._id_8E5A || var_1 == "ims_projectile_mp" )
        return -1;

    var_5 = var_3;

    if ( var_2 == "MOD_MELEE" )
        var_5 = self.maxhealth * 0.25;

    if ( isexplosivedamagemod( var_2 ) )
        var_5 = var_3 * 1.5;

    var_5 = scripts\mp\damage::_id_89C6( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8975( var_1, var_2, var_5 );
    return var_5;
}

_id_9368( var_0, var_1, var_2, var_3 )
{
    var_4 = scripts\mp\damage::onkillstreakkilled( "ims", var_0, var_1, var_2, var_3, "destroyed_ims", "ims_destroyed" );

    if ( var_4 )
        var_0 notify( "destroyed_equipment" );
}

_id_9367()
{
    self endon( "carried" );
    self waittill( "death" );
    _id_E10B();

    if ( !isdefined( self ) )
        return;

    _id_9378();
    self playsound( "ims_destroyed" );

    if ( isdefined( self._id_9B05 ) )
    {
        playfx( scripts\engine\utility::_id_7ECB( "ims_explode_mp" ), self.origin + ( 0, 0, 10 ) );
        playfx( scripts\engine\utility::_id_7ECB( "ims_smoke_mp" ), self.origin );
        self._id_9B05 _id_E2E0();
        self._id_9B05 _id_E2E8();
        self notify( "deleting" );
        wait 1.0;
    }
    else if ( isdefined( self._id_933C ) )
    {
        playfx( scripts\engine\utility::_id_7ECB( "ims_explode_mp" ), self.origin + ( 0, 0, 10 ) );
        self notify( "deleting" );
    }
    else
    {
        playfx( scripts\engine\utility::_id_7ECB( "ims_explode_mp" ), self.origin + ( 0, 0, 10 ) );
        playfx( scripts\engine\utility::_id_7ECB( "ims_smoke_mp" ), self.origin );
        wait 3.0;
        self playsound( "ims_fire" );
        self notify( "deleting" );
    }

    if ( isdefined( self._id_C2BB ) )
        scripts\mp\objidpoolmanager::returnminimapid( self._id_C2BB );

    if ( isdefined( self._id_C2BA ) )
        scripts\mp\objidpoolmanager::returnminimapid( self._id_C2BA );

    scripts\mp\weapons::_id_66A8();
    self _meth_80D4();
    self delete();
}

_id_13A10()
{
    self endon( "carried" );
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1 );
        scripts\mp\weapons::_id_11061();
        playfx( scripts\engine\utility::_id_7ECB( "emp_stun" ), self.origin );
        playfx( scripts\engine\utility::_id_7ECB( "ims_smoke_mp" ), self.origin );
        wait( var_1 );
        _id_937B();
    }
}

_id_9369()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_0 );

        if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
            continue;

        if ( self._id_00E1 >= self.maxhealth )
            continue;

        var_1 = _id_49DC( self._id_9386, var_0 );

        if ( !isdefined( var_1 ) )
            continue;

        var_1._id_935F = self;
        _id_9378();
        _id_936A();

        if ( isdefined( self _meth_8138() ) )
            self unlink();

        var_0 _id_F684( var_1, 0 );
    }
}

_id_9379()
{
    self endon( "death" );
    level endon( "game_ended" );

    if ( isdefined( self._id_3A9D ) )
        self._id_3A9D _meth_80F3();

    self._id_3A9D = undefined;

    if ( isdefined( self.owner ) )
        self.owner._id_9D81 = 0;

    self._id_6DEC = undefined;
    var_0 = undefined;

    if ( isdefined( self._id_935F ) )
    {
        var_0 = self._id_935F;
        var_0 endon( "death" );
        var_0.origin = self.origin;
        var_0.angles = self.angles;
        var_0._id_3A9D = undefined;
        var_0 _id_937A();

        if ( isdefined( var_0._id_2C68 ) )
        {
            var_0._id_2C68 show();
            var_0 _id_9383( var_0._id_2C68, 1 );
            level notify( "update_bombsquad" );
        }
    }
    else
        var_0 = _id_49DB( self );

    var_0 _id_184F();
    var_0._id_9EE4 = 1;
    var_0 thread _id_9366();
    var_0 thread _id_13A10();
    var_0 thread _id_9367();
    var_0 setcandamage( 1 );
    self playsound( "ims_plant" );
    self notify( "placed" );
    var_0 thread _id_9375();
    var_1 = spawnstruct();

    if ( isdefined( self._id_BD3B ) )
        var_1._id_AD39 = self._id_BD3B;

    var_1._id_6371 = "carried";
    var_1._id_4E53 = ::_id_936D;
    var_0 thread scripts\mp\movers::_id_892F( var_1 );
    self delete();
}

_id_9376( var_0 )
{
    if ( isdefined( self._id_3A9D ) )
    {
        var_1 = self._id_3A9D;
        var_1 _meth_80F3();
        var_1._id_9D81 = undefined;
        var_1._id_3AA0 = undefined;
        var_1 scripts\engine\utility::_id_1C71( 1 );

        if ( isdefined( var_1._id_9382 ) )
        {
            foreach ( var_3 in var_1._id_9382 )
            {
                if ( isdefined( var_3._id_2C68 ) )
                    var_3._id_2C68 delete();
            }
        }
    }

    if ( isdefined( var_0 ) && var_0 )
        scripts\mp\weapons::_id_66A8();

    self delete();
}

_id_9377( var_0 )
{
    _id_E10B();
    self setmodel( level._id_9385[self._id_9386]._id_B924 );
    self _meth_8335( var_0 );
    self _meth_82C7( 0 );
    self setcandamage( 0 );
    self._id_3A9D = var_0;
    var_0._id_9D81 = 1;
    var_0 thread _id_12EB0( self );
    thread _id_936E( var_0 );
    thread _id_936F( var_0 );
    thread _id_9371();
    thread _id_9370( var_0 );
    self notify( "carried" );

    if ( isdefined( self._id_935F ) )
    {
        self._id_935F notify( "carried" );
        self._id_935F._id_3A9D = var_0;
        self._id_935F._id_9EE4 = 0;

        if ( isdefined( self._id_935F._id_2C68 ) )
            self._id_935F._id_2C68 hide();
    }
}

_id_12EB0( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "placed" );
    var_0 endon( "death" );
    var_0._id_3872 = 1;
    var_1 = -1;
    var_2 = level._id_9385[var_0._id_9386];

    for (;;)
    {
        var_3 = self canplayerplacesentry( 1, var_2._id_CC25 );
        var_0.origin = var_3["origin"];
        var_0.angles = var_3["angles"];
        var_0._id_3872 = self isonground() && var_3["result"] && abs( var_0.origin[2] - self.origin[2] ) < var_2._id_CC22;

        if ( isdefined( var_3["entity"] ) )
            var_0._id_BD3B = var_3["entity"];
        else
            var_0._id_BD3B = undefined;

        if ( var_0._id_3872 != var_1 )
        {
            if ( var_0._id_3872 )
            {
                var_0 setmodel( level._id_9385[var_0._id_9386]._id_B924 );
                self _meth_80F4( level._id_9385[var_0._id_9386]._id_CC28 );
            }
            else
            {
                var_0 setmodel( level._id_9385[var_0._id_9386]._id_B925 );
                self _meth_80F4( level._id_9385[var_0._id_9386]._id_38E3 );
            }
        }

        var_1 = var_0._id_3872;
        wait 0.05;
    }
}

_id_936E( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 waittill( "death" );

    if ( self._id_3872 && var_0.team != "spectator" )
        thread _id_9379();
    else
        _id_9376();
}

_id_936F( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 waittill( "disconnect" );
    _id_9376();
}

_id_9370( var_0 )
{
    self endon( "placed" );
    self endon( "death" );

    for (;;)
    {
        if ( isdefined( self._id_3A9D._id_C53B ) && self._id_3A9D._id_C53B )
            self notify( "death" );

        wait 0.1;
    }
}

_id_9371( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    level waittill( "game_ended" );
    _id_9376();
}

_id_9375()
{
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( level._id_9385[self._id_9386]._id_017B );
    var_0 = self.owner;
    var_0 _meth_80F3();

    if ( level.teambased )
        scripts\mp\entityheadicons::_id_F877( self.team, ( 0, 0, 60 ) );
    else
        scripts\mp\entityheadicons::_id_F7F2( var_0, ( 0, 0, 60 ) );

    self makeusable();
    self setcandamage( 1 );

    if ( isdefined( var_0._id_9382 ) )
    {
        foreach ( var_2 in var_0._id_9382 )
        {
            if ( var_2 == self )
                continue;

            var_2 notify( "death" );
        }
    }

    var_0._id_9382 = [];
    var_0._id_9382[0] = self;

    foreach ( var_5 in level.players )
    {
        if ( var_5 == var_0 )
        {
            self enableplayeruse( var_5 );
            continue;
        }

        self disableplayeruse( var_5 );
    }

    if ( self._id_10085 )
    {
        level thread scripts\mp\utility\game::_id_115DE( level._id_9385[self._id_9386]._id_10A38, var_0 );
        self._id_10085 = 0;
    }

    var_7 = ( 0, 0, 20 );
    var_8 = ( 0, 0, 256 ) - var_7;
    var_9 = [];
    self._id_A637 = [];

    for ( var_10 = 0; var_10 < self._id_451C._id_C228; var_10++ )
    {
        if ( _id_C229() )
            var_11 = _id_FCA8( var_10 + 1, self._id_451C._id_C228 - 4 );
        else
            var_11 = var_10 + 1;

        var_12 = self gettagorigin( self._id_451C._id_6A09 + var_11 + "_attach" );
        var_13 = self gettagorigin( self._id_451C._id_6A09 + var_11 + "_attach" ) + var_7;
        var_9[var_10] = bullettrace( var_13, var_13 + var_8, 0, self );

        if ( var_10 < 4 )
        {
            var_14 = spawn( "script_model", var_12 + self._id_451C._id_A640 );
            var_14 setscriptmoverkillcam( "explosive" );
            self._id_A637[self._id_A637.size] = var_14;
        }
    }

    var_15 = var_9[0];

    for ( var_10 = 0; var_10 < var_9.size; var_10++ )
    {
        if ( var_9[var_10]["position"][2] < var_15["position"][2] )
            var_15 = var_9[var_10];
    }

    self._id_2514 = var_15["position"] - ( 0, 0, 20 ) - self.origin;
    var_16 = spawn( "trigger_radius", self.origin, 0, 256, 100 );
    self._id_2536 = var_16;
    self._id_2536 _meth_80D2();
    self._id_2536 linkto( self );
    self._id_2528 = length( self._id_2514 ) / 200;
    _id_937F();
    _id_937B();
    thread _id_937D();

    foreach ( var_5 in level.players )
        thread _id_9374( var_5 );
}

_id_937D()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        _id_9373( var_0 );
    }
}

_id_9373( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 waittill( "spawned_player" );
    self disableplayeruse( var_0 );
}

_id_9374( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );

    for (;;)
    {
        var_0 waittill( "joined_team" );
        self disableplayeruse( var_0 );
    }
}

_id_9372()
{
    self endon( "death" );
    level endon( "game_ended" );
    self.owner waittill( "killstreak_disowned" );

    if ( isdefined( self._id_9EE4 ) )
        self notify( "death" );
    else
        _id_9376( 0 );
}

_id_937B()
{
    thread scripts\mp\weapons::_id_57EB( "tag_fx" );
    thread _id_9362();
}

_id_9378()
{
    self makeunusable();

    if ( level.teambased )
        scripts\mp\entityheadicons::_id_F877( "none", ( 0, 0, 0 ) );
    else if ( isdefined( self.owner ) )
        scripts\mp\entityheadicons::_id_F7F2( undefined, ( 0, 0, 0 ) );

    if ( isdefined( self._id_2536 ) )
        self._id_2536 delete();

    if ( isdefined( self._id_A637 ) )
    {
        foreach ( var_1 in self._id_A637 )
        {
            if ( isdefined( var_1 ) )
            {
                if ( isdefined( self.owner ) && isdefined( self.owner._id_9381 ) && var_1 == self.owner._id_9381 )
                    continue;
                else
                    var_1 delete();
            }
        }
    }

    if ( isdefined( self._id_69F6 ) )
    {
        self._id_69F6 delete();
        self._id_69F6 = undefined;
    }

    scripts\mp\weapons::_id_11061();
}

_id_9E09( var_0 )
{
    if ( level.teambased && self.team == var_0.team )
        return 1;

    return 0;
}

_id_9362()
{
    self endon( "death" );
    self endon( "emp_damage" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( !isdefined( self._id_2536 ) )
            break;

        self._id_2536 waittill( "trigger", var_0 );

        if ( isplayer( var_0 ) )
        {
            if ( isdefined( self.owner ) && var_0 == self.owner )
                continue;

            if ( level.teambased && var_0.pers["team"] == self.team )
                continue;

            if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
                continue;
        }
        else if ( isdefined( var_0.owner ) )
        {
            if ( isdefined( self.owner ) && var_0.owner == self.owner )
                continue;

            if ( level.teambased && var_0.owner.pers["team"] == self.team )
                continue;
        }

        var_1 = var_0.origin + ( 0, 0, 50 );

        if ( !sighttracepassed( self._id_2514 + self.origin, var_1, 0, self ) )
            continue;

        var_2 = 0;

        for ( var_3 = 1; var_3 <= self._id_451C._id_C228; var_3++ )
        {
            if ( var_3 > 4 )
                break;

            if ( sighttracepassed( self gettagorigin( self._id_451C._id_AC49 + var_3 ), var_1, 0, self ) )
            {
                var_2 = 1;
                break;
            }
        }

        if ( !var_2 )
            continue;

        self playsound( "ims_trigger" );
        scripts\mp\weapons::_id_6A08( var_0, level._id_9385[self._id_9386]._id_8487, "ims" );

        if ( !isdefined( self._id_2536 ) )
            break;

        if ( !isdefined( self._id_8BF0[self._id_252E] ) )
        {
            self._id_8BF0[self._id_252E] = 1;
            thread _id_6D2C( var_0, self._id_252E );
            self._id_252E++;
        }

        if ( self._id_252E > self._id_451C._id_C228 )
            break;

        _id_937F();
        self waittill( "sensor_exploded" );
        wait( self._id_451C._id_DDAC );

        if ( !isdefined( self.owner ) )
            break;
    }

    if ( isdefined( self._id_3A9D ) && isdefined( self.owner ) && self._id_3A9D == self.owner )
        return;

    self notify( "death" );
}

_id_6D2C( var_0, var_1 )
{
    if ( _id_C229() )
        var_1 = _id_FCA8( var_1, self._id_451C._id_C228 - 4 );

    var_2 = self._id_69F6;
    self._id_69F6 = undefined;
    var_3 = self._id_451C._id_AC49 + var_1;
    playfxontag( level._effect["ims_sensor_explode"], self, var_3 );
    _id_9384( var_1, self._id_451C );
    var_4 = self._id_451C._id_039B;
    var_5 = self.owner;
    var_2 unlink();
    var_2 _meth_8271( 3600, self._id_2528 );
    var_2 moveto( self._id_2514 + self.origin, self._id_2528, self._id_2528 * 0.25, self._id_2528 * 0.25 );

    if ( isdefined( var_2._id_A63A ) )
    {
        var_6 = var_2._id_A63A;
        var_6 unlink();

        if ( isdefined( self.owner ) )
            self.owner._id_9381 = var_6;

        var_6 moveto( self._id_2514 + self.origin + self._id_451C._id_A640, self._id_2528, self._id_2528 * 0.25, self._id_2528 * 0.25 );

        if ( !_id_C229() )
            var_6 thread _id_51A6( 5.0 );
    }

    var_2 playsound( "ims_launch" );
    var_2 waittill( "movedone" );
    playfx( level._effect["ims_sensor_explode"], var_2.origin );
    var_7 = [];
    var_7[0] = var_0.origin;

    for ( var_8 = 0; var_8 < var_7.size; var_8++ )
    {
        if ( isdefined( var_5 ) )
        {
            scripts\mp\utility\game::_id_1309( var_4, var_2.origin, var_7[var_8], var_5 );
            continue;
        }

        scripts\mp\utility\game::_id_1309( var_4, var_2.origin, var_7[var_8] );
    }

    var_2 delete();
    self notify( "sensor_exploded" );
}

_id_51A6( var_0 )
{
    self endon( "death" );
    level scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );

    if ( isdefined( self ) )
        self delete();
}

_id_937C()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = level._id_9385[self._id_9386]._id_AC71;

    while ( var_0 )
    {
        wait 1.0;
        scripts\mp\hostmigration::waittillhostmigrationdone();

        if ( !isdefined( self._id_3A9D ) )
            var_0 = max( 0, var_0 - 1.0 );
    }

    self notify( "death" );
}

_id_184F()
{
    var_0 = self getentitynumber();
    level._id_CC11[var_0] = self;
}

_id_E10B()
{
    var_0 = self getentitynumber();
    level._id_CC11[var_0] = undefined;
}

_id_936A()
{
    self hide();
    self._id_8E5A = 1;
}

_id_937A()
{
    self show();
    self._id_8E5A = 0;
    _id_9383( self, 1 );
}

_id_937E( var_0 )
{
    var_1 = spawn( "script_model", self gettagorigin( self._id_451C._id_6A09 + var_0 + "_attach" ) );
    var_1 setmodel( self._id_451C._id_6A03 );
    var_1.angles = self.angles;
    var_1._id_A63A = self._id_A637[var_0 - 1];
    var_1._id_A63A linkto( self );
    return var_1;
}

_id_937F()
{
    for ( var_0 = 1; var_0 <= self._id_451C._id_C228 && isdefined( self._id_8BF0[var_0] ); var_0++ )
    {

    }

    if ( var_0 <= self._id_451C._id_C228 )
    {
        if ( _id_C229() )
            var_0 = _id_FCA8( var_0, self._id_451C._id_C228 - 4 );

        var_1 = _id_937E( var_0 );
        var_1 linkto( self );
        self._id_69F6 = var_1;
    }
}

_id_9384( var_0, var_1, var_2 )
{
    var_3 = var_1._id_AC49 + var_0 + "_attach";
    var_4 = undefined;

    if ( isdefined( var_2 ) )
        var_4 = var_1._id_AC48[var_0];
    else
        var_4 = var_1._id_AC47[var_0];

    self scriptmodelplayanim( var_4 );
    var_5 = var_1._id_6A09 + var_0 + "_attach";
    self _meth_8187( var_5 );
}

_id_9383( var_0, var_1 )
{
    var_2 = self._id_8BF0.size;

    if ( var_2 > 0 )
    {
        if ( _id_C229() )
            var_2 = _id_FCA8( var_2, self._id_451C._id_C228 - 4 );

        var_0 _id_9384( var_2, self._id_451C, var_1 );
    }
}

_id_C229()
{
    return self._id_451C._id_C228 > 4;
}

_id_FCA8( var_0, var_1 )
{
    var_2 = var_0 - var_1;
    var_2 = max( 1, var_2 );
    return int( var_2 );
}

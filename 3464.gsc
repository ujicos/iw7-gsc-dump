// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_F26E = [];
    level._id_F26E["sentry_minigun"] = "sentry";
    level._id_F26E["sam_turret"] = "sam_turret";
    level._id_F26E["super_trophy"] = "super_trophy";
    level._id_F26E["sentry_shock"] = "sentry_shock";
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "sentry_shock", ::_id_12902 );
    _id_0AC7::_id_DF07( "sentry_shock", [ "passive_extra_health", "passive_increased_duration" ] );
    level._id_F26B = [];
    level._id_F26B["super_trophy"] = spawnstruct();
    level._id_F26B["super_trophy"].health = 999999;
    level._id_F26B["super_trophy"].maxhealth = 100;
    level._id_F26B["super_trophy"]._id_F269 = "sentry";
    level._id_F26B["super_trophy"]._id_F268 = "sentry_offline";
    level._id_F26B["super_trophy"]._id_039B = "sentry_laser_mp";
    level._id_F26B["super_trophy"]._id_B91A = "super_trophy_mp";
    level._id_F26B["super_trophy"]._id_B920 = "super_trophy_mp_placement";
    level._id_F26B["super_trophy"]._id_B919 = "super_trophy_mp_placement_fail";
    level._id_F26B["super_trophy"]._id_B91D = "super_trophy_mp";
    level._id_F26B["super_trophy"]._id_017B = &"SENTRY_PICKUP";
    level._id_F26B["super_trophy"]._id_016F = 1;
    level._id_F26B["super_trophy"]._id_115EB = "used_super_trophy";
    level._id_F26B["super_trophy"]._id_10085 = 0;
    level._id_F26B["super_trophy"]._id_ACB6 = "tag_fx";
    level._id_F26B["sentry_shock"] = spawnstruct();
    level._id_F26B["sentry_shock"].health = 999999;
    level._id_F26B["sentry_shock"].maxhealth = 670;
    level._id_F26B["sentry_shock"]._id_32C1 = 20;
    level._id_F26B["sentry_shock"]._id_32C0 = 120;
    level._id_F26B["sentry_shock"]._id_C9D3 = 0.15;
    level._id_F26B["sentry_shock"]._id_C9D1 = 0.35;
    level._id_F26B["sentry_shock"]._id_F269 = "sentry";
    level._id_F26B["sentry_shock"]._id_F268 = "sentry_offline";
    level._id_F26B["sentry_shock"]._id_11901 = 90.0;
    level._id_F26B["sentry_shock"]._id_10A13 = 0.05;
    level._id_F26B["sentry_shock"]._id_C7FB = 8.0;
    level._id_F26B["sentry_shock"]._id_461D = 0.1;
    level._id_F26B["sentry_shock"]._id_7645 = 0.3;
    level._id_F26B["sentry_shock"]._id_110EA = "sentry_shock";
    level._id_F26B["sentry_shock"]._id_039B = "sentry_shock_mp";
    level._id_F26B["sentry_shock"]._id_0289 = "ks_shock_sentry_mp";
    level._id_F26B["sentry_shock"]._id_B91A = "shock_sentry_gun_wm";
    level._id_F26B["sentry_shock"]._id_B920 = "shock_sentry_gun_wm_obj";
    level._id_F26B["sentry_shock"]._id_B919 = "shock_sentry_gun_wm_obj_red";
    level._id_F26B["sentry_shock"]._id_B91D = "shock_sentry_gun_wm_destroyed";
    level._id_F26B["sentry_shock"]._id_017B = &"SENTRY_PICKUP";
    level._id_F26B["sentry_shock"]._id_016F = 1;
    level._id_F26B["sentry_shock"]._id_115EB = "used_shock_sentry";
    level._id_F26B["sentry_shock"].destroyedsplash = "callout_destroyed_sentry_shock";
    level._id_F26B["sentry_shock"]._id_10085 = 1;
    level._id_F26B["sentry_shock"]._id_13554 = "sentry_shock_timeout";
    level._id_F26B["sentry_shock"]._id_13523 = "sentry_shock_destroy";
    level._id_F26B["sentry_shock"]._id_EC44 = "destroyed_sentry";
    level._id_F26B["sentry_shock"]._id_ACB6 = "tag_fx";
    level._id_F26B["sentry_shock"]._id_9E63 = 1;
    level._id_F26B["sentry_shock"]._id_8C7A = ( 0, 0, 75 );
    level._effect["sentry_overheat_mp"] = loadfx( "vfx/core/mp/killstreaks/vfx_sg_overheat_smoke" );
    level._effect["sentry_explode_mp"] = loadfx( "vfx/iw7/_requests/mp/vfx_generic_equipment_exp_lg.vfx" );
    level._effect["sentry_sparks_mp"] = loadfx( "vfx/core/mp/killstreaks/vfx_sentry_gun_explosion" );
    level._effect["sentry_smoke_mp"] = loadfx( "vfx/iw7/_requests/mp/vfx_gen_equip_dam_spark_runner.vfx" );
    level._effect["sentry_shock_charge"] = loadfx( "vfx/iw7/_requests/mp/vfx_sentry_shock_charge_up.vfx" );
    level._effect["sentry_shock_screen"] = loadfx( "vfx/iw7/_requests/mp/vfx_sentry_shock_screen" );
    level._effect["sentry_shock_base"] = loadfx( "vfx/iw7/_requests/mp/vfx_sentry_shock_base" );
    level._effect["sentry_shock_radius"] = loadfx( "vfx/iw7/_requests/mp/vfx_sentry_shock_radius" );
    level._effect["sentry_shock_explosion"] = loadfx( "vfx/iw7/_requests/mp/vfx_sentry_shock_end.vfx" );
    level._effect["sentry_shock_trail"] = loadfx( "vfx/iw7/_requests/mp/vfx_sentry_shock_proj_trail.vfx" );
    level._effect["sentry_shock_arc"] = loadfx( "vfx/iw7/_requests/mp/vfx_sentry_shock_arc.vfx" );
    var_0 = [ "passive_fast_sweep", "passive_decreased_health", "passive_sam_turret", "passive_no_shock", "passive_mini_explosives", "passive_slow_turret" ];
    _id_0AC7::_id_DF07( "sentry_shock", var_0 );
}

_id_128D9( var_0, var_1 )
{
    var_2 = _id_83A3( "sentry_minigun" );

    if ( var_2 )
        scripts\mp\matchdata::_id_AFC9( level._id_F26B["sentry_minigun"]._id_110EA, self.origin );

    return var_2;
}

_id_12901( var_0, var_1 )
{
    var_2 = _id_83A3( "sam_turret" );

    if ( var_2 )
        scripts\mp\matchdata::_id_AFC9( level._id_F26B["sam_turret"]._id_110EA, self.origin );

    return var_2;
}

_id_12902( var_0 )
{
    var_1 = _id_83A3( "sentry_shock", undefined, var_0 );

    if ( var_1 )
        scripts\mp\matchdata::_id_AFC9( var_0._id_110EA, self.origin );
    else
        scripts\engine\utility::waitframe();

    return var_1;
}

_id_83A3( var_0, var_1, var_2 )
{
    self._id_A904 = var_0;

    if ( !isdefined( self._id_CC14 ) )
        self._id_CC14 = [];

    if ( !isdefined( self._id_CC14[var_0] ) )
        self._id_CC14[var_0] = [];

    var_3 = 1;

    if ( isdefined( var_1 ) )
        var_3 = var_1;

    var_4 = _id_4A11( var_0, self, var_3, var_2 );

    if ( isdefined( var_2 ) )
        var_2._id_F265 = var_4;

    _id_E152();
    self._id_3AA5 = var_4;
    var_5 = _id_F688( var_4, 1, var_3 );
    self._id_3AA5 = undefined;
    thread _id_1370F();
    self._id_9D81 = 0;

    if ( isdefined( var_4 ) )
        return 1;
    else
        return 0;
}

_id_F688( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 _id_F255( self, var_2, var_3 );
    scripts\engine\utility::_id_1C6E( 0 );
    _id_1CB4( 0 );
    scripts\engine\utility::_id_1C53( 0 );

    if ( !isai( self ) )
    {
        self notifyonplayercommand( "place_sentry", "+attack" );
        self notifyonplayercommand( "place_sentry", "+attack_akimbo_accessible" );
        self notifyonplayercommand( "cancel_sentry", "+actionslot 4" );

        if ( !level._id_4542 )
        {
            self notifyonplayercommand( "cancel_sentry", "+actionslot 5" );
            self notifyonplayercommand( "cancel_sentry", "+actionslot 6" );
            self notifyonplayercommand( "cancel_sentry", "+actionslot 7" );
        }
    }

    for (;;)
    {
        var_4 = scripts\engine\utility::_id_13734( "place_sentry", "cancel_sentry", "force_cancel_placement", "apply_player_emp" );

        if ( !isdefined( var_0 ) )
        {
            _id_1CB4( 1 );
            scripts\engine\utility::_id_1C6E( 1 );
            thread _id_6270();
            return 1;
        }

        if ( var_4 == "cancel_sentry" || var_4 == "force_cancel_placement" || var_4 == "apply_player_emp" )
        {
            if ( !var_1 && ( var_4 == "cancel_sentry" || var_4 == "apply_player_emp" ) )
                continue;

            var_0 _id_F253( var_4 == "force_cancel_placement" && !isdefined( var_0._id_6DEC ) );
            return 0;
        }

        if ( !var_0._id_3872 )
            continue;

        var_0 _id_F259( var_2 );
        return 1;
    }
}

_id_6270()
{
    self endon( "death" );
    self endon( "disconnect" );
    wait 0.25;
    scripts\engine\utility::_id_1C53( 1 );
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

_id_4A11( var_0, var_1, var_2, var_3 )
{
    var_4 = level._id_F26B[var_0]._id_039B;

    if ( _id_0DC9::_id_A69F( var_3, "passive_fast_sweep" ) )
        var_4 = "sentry_shock_fast_mp";

    var_5 = spawnturret( "misc_turret", var_1.origin, var_4 );
    var_5.angles = var_1.angles;
    var_5._id_110E8 = var_3;
    var_5 _id_F246( var_0, var_1, var_2 );
    var_5 thread sentry_destroyongameend();
    return var_5;
}

_id_F246( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 1;

    self._id_F26E = var_0;
    self._id_3872 = 1;
    self setmodel( level._id_F26B[var_0]._id_B91A );
    self _meth_8318( 1 );
    self _meth_8317( 1 );

    if ( level._id_F26B[var_0]._id_10085 )
        self._id_10085 = 1;
    else
        self._id_10085 = 0;

    self._id_6DEC = 1;
    self setcandamage( 1 );

    switch ( var_0 )
    {
        case "gl_turret_4":
        case "gl_turret_3":
        case "gl_turret_2":
        case "gl_turret_1":
        case "gl_turret":
        case "minigun_turret_4":
        case "minigun_turret_3":
        case "minigun_turret_2":
        case "minigun_turret_1":
        case "minigun_turret":
            self _meth_82FB( 80 );
            self _meth_8330( 80 );
            self _meth_82B6( 50 );
            self setdefaultdroppitch( 0.0 );
            self._id_C731 = var_1;
            break;
        case "scramble_turret":
        case "sam_turret":
            self maketurretinoperable();
            self _meth_82FB( 180 );
            self _meth_8330( 180 );
            self _meth_8353( 80 );
            self setdefaultdroppitch( -89.0 );
            self._id_A86B = 0;
            var_4 = spawn( "script_model", self gettagorigin( "tag_laser" ) );
            var_4 linkto( self );
            self._id_A63A = var_4;
            self._id_A63A setscriptmoverkillcam( "explosive" );
            break;
        case "sentry_shock":
            self maketurretinoperable();
            var_5 = anglestoforward( self.angles );
            var_6 = self gettagorigin( "tag_laser" ) + ( 0, 0, 10 );
            var_6 -= var_5 * 20;
            var_4 = spawn( "script_model", var_6 );
            var_4 linkto( self );
            self._id_A63A = var_4;
            break;
        default:
            self maketurretinoperable();
            self setdefaultdroppitch( -89.0 );
            break;
    }

    self _meth_835B( 1 );
    _id_F257();
    _id_F258( var_1 );

    if ( var_3 )
        thread _id_F261();

    switch ( var_0 )
    {
        case "minigun_turret_4":
        case "minigun_turret_3":
        case "minigun_turret_2":
        case "minigun_turret_1":
        case "minigun_turret":
            self._id_B941 = 0;
            self._id_8CDE = 0;
            self._id_C7F9 = 0;
            thread _id_F245();
            break;
        case "gl_turret_4":
        case "gl_turret_3":
        case "gl_turret_2":
        case "gl_turret_1":
        case "gl_turret":
            self._id_B941 = 0;
            self._id_8CDE = 0;
            self._id_4621 = 0;
            self._id_C7F9 = 0;
            thread _id_12A00();
            thread _id_129D7();
            break;
        case "scramble_turret":
        case "sam_turret":
        case "sentry_shock":
            self._id_B941 = 0;
            thread _id_F244( var_2 );
            thread _id_F23A();
            break;
        case "super_trophy":
            thread _id_F244( 0 );
            thread _id_F23A();
            break;
        default:
            thread _id_F244( var_2 );
            thread _id_F239();
            thread _id_F23A();
            break;
    }
}

_id_F23E( var_0 )
{
    if ( isdefined( level._id_F26B[var_0]._id_B91C ) )
    {
        var_1 = spawn( "script_model", self.origin );
        var_1.angles = self.angles;
        var_1 hide();
        var_1 thread scripts\mp\weapons::_id_2C69( self.owner );
        var_1 setmodel( level._id_F26B[var_0]._id_B91C );
        var_1 linkto( self );
        var_1 _meth_82C7( 0 );
        self._id_2C68 = var_1;
        self waittill( "death" );

        if ( isdefined( var_1 ) )
            var_1 delete();
    }
}

sentry_setteamheadicon()
{
    var_0 = level._id_F26B[self._id_F26E]._id_8C7A;

    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( self.owner ) )
        return;

    var_1 = self.owner;
    var_2 = var_1.team;

    if ( level.teambased && !scripts\mp\utility\game::istrue( self._id_115D1 ) )
    {
        scripts\mp\entityheadicons::_id_F877( var_2, var_0 );
        self._id_115D1 = 1;
    }
    else if ( !scripts\mp\utility\game::istrue( self._id_D3AA ) )
    {
        scripts\mp\entityheadicons::_id_F7F2( var_1, var_0 );
        self._id_D3AA = 1;
    }
}

sentry_clearteamheadicon()
{
    var_0 = level._id_F26B[self._id_F26E]._id_8C7A;

    if ( !isdefined( var_0 ) )
        return;

    if ( scripts\mp\utility\game::istrue( self._id_115D1 ) )
    {
        scripts\mp\entityheadicons::_id_F877( "none", ( 0, 0, 0 ) );
        self._id_115D1 = undefined;
    }

    if ( scripts\mp\utility\game::istrue( self._id_D3AA ) )
    {
        scripts\mp\entityheadicons::_id_F7F2( undefined, ( 0, 0, 0 ) );
        self._id_D3AA = undefined;
    }
}

sentry_destroyongameend()
{
    self endon( "death" );
    level scripts\engine\utility::waittill_any( "bro_shot_start", "game_ended" );
    self notify( "death" );
}

_id_F241()
{
    self endon( "carried" );
    var_0 = level._id_F26B[self._id_F26E].maxhealth;

    if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_fast_sweep" ) )
        var_0 = int( var_0 / 1.25 );

    var_1 = 0;

    if ( self.owner scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" ) )
    {
        var_2 = self._id_13C2E;

        if ( isdefined( var_2 ) )
        {
            switch ( var_2 )
            {
                default:
            }
        }
    }

    var_0 += int( var_1 );
    scripts\mp\damage::monitordamage( var_0, "sentry", ::_id_F266, ::_id_F26A, 1 );
}

_id_F26A( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;

    if ( var_2 == "MOD_MELEE" )
        var_5 = self.maxhealth * 0.34;

    var_5 = _id_0DC9::_id_7FBD( var_0, var_1, var_2, var_5, self.maxhealth, 2, 3, 4 );

    if ( isdefined( var_0 ) && isplayer( var_0 ) && scripts\mp\equipment\phase_shift::_id_9DDF( var_0 ) )
        var_5 = 0;

    return var_5;
}

_id_F266( var_0, var_1, var_2, var_3 )
{
    var_4 = level._id_F26B[self._id_F26E];

    if ( var_4._id_9E63 )
    {
        if ( isdefined( var_1 ) && var_1 == "concussion_grenade_mp" )
        {
            if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0 ) ) )
                var_0 scripts\mp\missions::_id_D991( "ch_tactical_emp_eqp" );
        }

        var_5 = var_4.destroyedsplash;
        var_6 = _id_0AC7::getrarityforlootitem( self._id_110E8._id_1318B );

        if ( var_6 != "" )
            var_5 = var_5 + "_" + var_6;

        var_7 = scripts\mp\damage::onkillstreakkilled( var_4._id_110EA, var_0, var_1, var_2, var_3, var_4._id_EC44, var_4._id_13523, var_5 );

        if ( var_7 )
        {
            var_0 notify( "destroyed_equipment" );
            return;
        }
    }
    else
    {
        var_8 = undefined;
        var_9 = var_0;

        if ( isdefined( var_9 ) && isdefined( self.owner ) )
        {
            if ( isdefined( var_0.owner ) && isplayer( var_0.owner ) )
                var_9 = var_0.owner;

            if ( self.owner scripts\mp\utility\game::isenemy( var_9 ) )
                var_8 = var_9;
        }

        if ( isdefined( var_8 ) )
        {
            var_8 thread scripts\mp\events::_id_11265( self.owner );
            var_8 notify( "destroyed_equipment" );
        }

        self notify( "death" );
    }
}

_id_F263()
{
    self endon( "carried" );
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1, var_2, var_3, var_4 );
        _id_0DC9::dodamagetokillstreak( 100, var_0, var_0, self.team, var_2, var_4, var_3 );

        if ( !scripts\mp\utility\game::istrue( self._id_55BA ) )
            thread disablesentry( var_1 );
    }
}

disablesentry( var_0 )
{
    self endon( "carried" );
    self endon( "death" );
    level endon( "game_ended" );
    self._id_55BA = 1;
    scripts\mp\weapons::_id_11061();
    self setdefaultdroppitch( 40 );
    self _meth_830F( level._id_F26B[self._id_F26E]._id_F268 );
    self cleartargetentity();
    self setscriptablepartstate( "coil", "neutral" );
    self setscriptablepartstate( "muzzle", "neutral", 0 );
    self setscriptablepartstate( "stunned", "active" );
    sentry_clearteamheadicon();
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_0 );
    self setdefaultdroppitch( -89.0 );
    self _meth_830F( level._id_F26B[self._id_F26E]._id_F269 );
    thread scripts\mp\weapons::_id_57EB( level._id_F26B[self._id_F26E]._id_ACB6 );
    self setscriptablepartstate( "coil", "idle" );
    self setscriptablepartstate( "stunned", "neutral" );
    sentry_setteamheadicon();
    self._id_55BA = undefined;
}

_id_F242()
{
    self endon( "carried" );
    self waittill( "death" );

    if ( isdefined( self.owner ) )
        self.owner._id_CC14[self._id_F26E] = scripts\engine\utility::array_remove( self.owner._id_CC14[self._id_F26E], self );

    if ( !isdefined( self ) )
        return;

    self cleartargetentity();
    self laseroff();
    self setmodel( level._id_F26B[self._id_F26E]._id_B91D );

    if ( isdefined( self._id_7627 ) && self._id_7627.size > 0 )
    {
        foreach ( var_1 in self._id_7627 )
        {
            if ( isdefined( var_1 ) )
                var_1 delete();
        }

        self._id_7627 = undefined;
    }

    _id_F257();
    self setdefaultdroppitch( 40 );
    self _meth_8336( undefined );

    if ( isdefined( self._id_9B05 ) )
        self _meth_83D3( self._id_9B05 );

    self _meth_835A( 0 );

    if ( isdefined( self._id_C840 ) )
        self._id_C840 delete();

    self playsound( "mp_equip_destroyed" );

    switch ( self._id_F26E )
    {
        case "gl_turret":
        case "minigun_turret":
            self._id_72B5 = 1;
            self _meth_83C6();
            break;
        default:
            break;
    }

    if ( isdefined( self._id_9B05 ) )
    {
        playfxontag( scripts\engine\utility::_id_7ECB( "sentry_explode_mp" ), self, "tag_origin" );
        playfxontag( scripts\engine\utility::_id_7ECB( "sentry_smoke_mp" ), self, "tag_aim" );
        self._id_9B05._id_12A1A scripts\mp\hud_util::_id_52DC();
        self._id_9B05 _id_E2E0();
        self._id_9B05 _id_E2E8();
        self notify( "deleting" );
        wait 1.0;
        stopfxontag( scripts\engine\utility::_id_7ECB( "sentry_explode_mp" ), self, "tag_origin" );
        stopfxontag( scripts\engine\utility::_id_7ECB( "sentry_smoke_mp" ), self, "tag_aim" );
    }
    else
    {
        self playsound( "sentry_explode_smoke" );
        self setscriptablepartstate( "destroyed", "sparks" );
        wait 5;
        playfx( scripts\engine\utility::_id_7ECB( "sentry_explode_mp" ), self.origin + ( 0, 0, 10 ) );
        self notify( "deleting" );
    }

    scripts\mp\weapons::_id_66A8();

    if ( isdefined( self._id_A63A ) )
        self._id_A63A delete();

    if ( isdefined( self.airlookatent ) )
        self.airlookatent delete();

    scripts\mp\utility\game::_id_D915( "killstreak ended - shock_sentry", self.owner );
    self delete();
}

_id_F244( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( !scripts\mp\utility\game::isreallyalive( var_1 ) )
            continue;

        if ( self._id_F26E == "sam_turret" || self._id_F26E == "scramble_turret" || self._id_F26E == "sentry_shock" && _id_0DC9::_id_A69F( self._id_110E8, "passive_sam_turret" ) )
            self _meth_830F( level._id_F26B[self._id_F26E]._id_F268 );

        var_1._id_CC14[self._id_F26E] = scripts\engine\utility::array_remove( var_1._id_CC14[self._id_F26E], self );
        var_1 _id_F688( self, 0, var_0 );
    }
}

_id_129FD( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );

    if ( !isdefined( var_0._id_C840 ) )
        return;

    var_1 = 0;

    for (;;)
    {
        if ( isalive( self ) && self istouching( var_0._id_C840 ) && !isdefined( var_0._id_9B05 ) && !isdefined( var_0._id_3A9D ) && self isonground() )
        {
            if ( self usebuttonpressed() )
            {
                if ( isdefined( self._id_13107 ) && self._id_13107 )
                    continue;

                var_1 = 0;

                while ( self usebuttonpressed() )
                {
                    var_1 += 0.05;
                    wait 0.05;
                }

                if ( var_1 >= 0.5 )
                    continue;

                var_1 = 0;

                while ( !self usebuttonpressed() && var_1 < 0.5 )
                {
                    var_1 += 0.05;
                    wait 0.05;
                }

                if ( var_1 >= 0.5 )
                    continue;

                if ( !scripts\mp\utility\game::isreallyalive( self ) )
                    continue;

                if ( isdefined( self._id_13107 ) && self._id_13107 )
                    continue;

                var_0 _meth_830F( level._id_F26B[var_0._id_F26E]._id_F268 );
                thread _id_F688( var_0, 0 );
                var_0._id_C840 delete();
                return;
            }
        }

        wait 0.05;
    }
}

_id_129FF()
{
    self notify( "turret_handluse" );
    self endon( "turret_handleuse" );
    self endon( "deleting" );
    level endon( "game_ended" );
    self._id_72B5 = 0;
    var_0 = ( 1, 0.9, 0.7 );
    var_1 = ( 1, 0.65, 0 );
    var_2 = ( 1, 0.25, 0 );

    for (;;)
    {
        self waittill( "trigger", var_3 );

        if ( isdefined( self._id_3A9D ) )
            continue;

        if ( isdefined( self._id_9B05 ) )
            continue;

        if ( !scripts\mp\utility\game::isreallyalive( var_3 ) )
            continue;

        var_3 _id_E152();
        var_3 _id_E18E();
        self._id_9B05 = var_3;
        self _meth_830F( level._id_F26B[self._id_F26E]._id_F268 );
        _id_F258( var_3 );
        self _meth_830F( level._id_F26B[self._id_F26E]._id_F269 );
        var_3 thread _id_12A31( self );
        var_3._id_12A1A = var_3 scripts\mp\hud_util::_id_4987( var_0, 100, 6 );
        var_3._id_12A1A scripts\mp\hud_util::_id_F801( "CENTER", "BOTTOM", 0, -70 );
        var_3._id_12A1A.alpha = 0.65;
        var_3._id_12A1A._id_2812.alpha = 0.65;
        var_4 = 0;

        for (;;)
        {
            if ( !scripts\mp\utility\game::isreallyalive( var_3 ) )
            {
                self._id_9B05 = undefined;
                var_3._id_12A1A scripts\mp\hud_util::_id_52DC();
                break;
            }

            if ( !var_3 isusingturret() )
            {
                self notify( "player_dismount" );
                self._id_9B05 = undefined;
                var_3._id_12A1A scripts\mp\hud_util::_id_52DC();
                var_3 _id_E2E0();
                var_3 _id_E2E8();
                self sethintstring( level._id_F26B[self._id_F26E]._id_017B );
                self _meth_830F( level._id_F26B[self._id_F26E]._id_F268 );
                _id_F258( self._id_C731 );
                self _meth_830F( level._id_F26B[self._id_F26E]._id_F269 );
                break;
            }

            if ( self._id_8CDE >= level._id_F26B[self._id_F26E]._id_C7FB )
                var_5 = 1;
            else
                var_5 = self._id_8CDE / level._id_F26B[self._id_F26E]._id_C7FB;

            var_3._id_12A1A scripts\mp\hud_util::_id_12E63( var_5 );

            if ( scripts\engine\utility::string_starts_with( self._id_F26E, "minigun_turret" ) )
                var_6 = "minigun_turret";

            if ( self._id_72B5 || self._id_C7F9 )
            {
                self _meth_83C6();
                var_3._id_12A1A._id_2812._id_00B9 = var_2;
                var_4 = 0;
            }
            else if ( self._id_8CDE > level._id_F26B[self._id_F26E]._id_C7FB * 0.75 && scripts\engine\utility::string_starts_with( self._id_F26E, "minigun_turret" ) )
            {
                var_3._id_12A1A._id_2812._id_00B9 = var_1;

                if ( randomintrange( 0, 10 ) < 6 )
                    self _meth_83C7();
                else
                    self _meth_83C6();

                if ( !var_4 )
                {
                    var_4 = 1;
                    thread _id_D497();
                }
            }
            else
            {
                var_3._id_12A1A._id_2812._id_00B9 = var_0;
                self _meth_83C7();
                var_4 = 0;
                self notify( "not_overheated" );
            }

            wait 0.05;
        }

        self setdefaultdroppitch( 0.0 );
    }
}

_id_F243()
{
    self endon( "death" );
    level endon( "game_ended" );
    self notify( "sentry_handleOwner" );
    self endon( "sentry_handleOwner" );
    self.owner waittill( "killstreak_disowned" );
    self notify( "death" );
}

_id_F258( var_0 )
{
    self.owner = var_0;
    self _meth_8336( self.owner );
    self _meth_835A( 1, self._id_F26E );

    if ( level.teambased )
    {
        self.team = self.owner.team;
        self _meth_835E( self.team );
    }

    thread _id_F243();
}

_id_F24B( var_0 )
{
    self notify( "death" );
}

_id_F259( var_0 )
{
    if ( isdefined( self.owner ) )
    {
        var_1 = self.owner._id_CC14[self._id_F26E].size;
        self.owner._id_CC14[self._id_F26E][var_1] = self;

        if ( var_1 + 1 > 2 )
            self.owner._id_CC14[self._id_F26E][0] notify( "death" );

        self.owner _id_1CB4( 1 );
        self.owner scripts\engine\utility::_id_1C6E( 1 );
        self.owner thread _id_6270();
        self.owner _meth_85BD( 1 );
    }

    var_2 = level._id_F26B[self._id_F26E]._id_B91A;
    var_3 = _id_0AC7::getrarityforlootitem( self._id_110E8._id_1318B );

    if ( var_3 != "" )
        var_2 = var_2 + "_" + var_3;

    self setmodel( var_2 );

    if ( self _meth_813D() == "manual" )
        self _meth_830F( level._id_F26B[self._id_F26E]._id_F268 );

    if ( self._id_F26E == "sentry_shock" )
        self setscriptablepartstate( "coil", "idle" );

    thread _id_F241();
    thread _id_F242();
    self _meth_8335( undefined );
    self setcandamage( 1 );

    switch ( self._id_F26E )
    {
        case "gl_turret_4":
        case "gl_turret_3":
        case "gl_turret_2":
        case "gl_turret_1":
        case "gl_turret":
        case "minigun_turret_4":
        case "minigun_turret_3":
        case "minigun_turret_2":
        case "minigun_turret_1":
        case "minigun_turret":
            if ( var_0 )
            {
                self.angles = self._id_3A9D.angles;

                if ( isalive( self._id_C731 ) )
                    self._id_C731 scripts\mp\utility\game::_id_F78C( "pickup_hint", level._id_F26B[self._id_F26E]._id_C837, 3.0, undefined, undefined, undefined, undefined, undefined, 1 );

                self._id_C840 = spawn( "trigger_radius", self.origin + ( 0, 0, 1 ), 0, 105, 64 );
                self._id_C840 _meth_80D2();
                self._id_C840 linkto( self );
                self._id_C731 thread _id_129FD( self );
                thread _id_129FF();
            }

            break;
        default:
            break;
    }

    _id_F24A();

    if ( isdefined( self._id_2C68 ) )
    {
        self._id_2C68 show();
        level notify( "update_bombsquad" );
    }

    self._id_3A9D _meth_80F3();
    self._id_3A9D = undefined;
    self._id_6DEC = undefined;

    if ( isdefined( self.owner ) )
    {
        self.owner._id_9D81 = 0;
        self.owner notify( "new_sentry", self );
    }

    _id_F252( var_0 );
    var_4 = spawnstruct();

    if ( isdefined( self._id_BD3B ) )
        var_4._id_AD39 = self._id_BD3B;

    var_4._id_6371 = "carried";
    var_4._id_4E53 = ::_id_F24B;
    thread scripts\mp\movers::_id_892F( var_4 );

    if ( self._id_F26E != "multiturret" )
        self playsound( "sentry_gun_plant" );

    thread scripts\mp\weapons::_id_57EB( level._id_F26B[self._id_F26E]._id_ACB6 );
    self notify( "placed" );
}

_id_F253( var_0 )
{
    if ( isdefined( self._id_3A9D ) )
    {
        var_1 = self._id_3A9D;
        var_1 _meth_80F3();
        var_1._id_9D81 = undefined;
        var_1._id_3AA0 = undefined;
        var_1 _id_1CB4( 1 );
        var_1 scripts\engine\utility::_id_1C6E( 1 );
        var_1 thread _id_6270();
        var_1 _meth_85BD( 1 );

        if ( isdefined( self._id_2C68 ) )
            self._id_2C68 delete();
    }

    if ( isdefined( var_0 ) && var_0 )
        scripts\mp\weapons::_id_66A8();

    self delete();
}

_id_F255( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_C731 ) )
    {

    }
    else
    {

    }

    if ( self._id_F26E == "sentry_shock" )
    {
        self setscriptablepartstate( "coil", "neutral" );
        self setscriptablepartstate( "muzzle", "neutral", 0 );
    }

    self setmodel( level._id_F26B[self._id_F26E]._id_B920 );
    self _meth_8335( var_0 );
    self setcandamage( 0 );
    _id_F249();
    var_0 _meth_85BD( 0 );
    self._id_3A9D = var_0;
    var_0._id_9D81 = 1;
    self._id_CB40 = var_1;
    thread sentry_oncarrierdeathoremp( var_0, var_2 );
    var_0 thread _id_12F16( self );
    thread _id_F24E( var_0 );
    thread _id_F24C( var_0 );
    thread _id_F24F();
    self setdefaultdroppitch( -89.0 );
    _id_F257();

    if ( isdefined( self _meth_8138() ) )
        self unlink();

    self notify( "carried" );

    if ( isdefined( self._id_2C68 ) )
        self._id_2C68 hide();
}

_id_12F16( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "placed" );
    var_0 endon( "death" );
    var_0._id_3872 = 1;
    var_1 = -1;

    for (;;)
    {
        var_2 = self canplayerplacesentry( 1, 40 );
        var_0.origin = var_2["origin"];
        var_0.angles = var_2["angles"];
        var_3 = scripts\engine\utility::_id_227F( level._id_12A83, level._id_B726, level._id_11267._id_12801, level._id_B779 );
        var_4 = var_0 getistouchingentities( var_3 );
        var_0._id_3872 = self isonground() && var_2["result"] && abs( var_0.origin[2] - self.origin[2] ) < 30 && !scripts\mp\utility\game::_id_9FAE( self ) && var_4.size == 0;

        if ( isdefined( var_2["entity"] ) )
            var_0._id_BD3B = var_2["entity"];
        else
            var_0._id_BD3B = undefined;

        if ( var_0._id_3872 != var_1 )
        {
            if ( var_0._id_3872 )
            {
                var_0 setmodel( level._id_F26B[var_0._id_F26E]._id_B920 );
                var_0 _id_CC1B();
            }
            else
            {
                var_0 setmodel( level._id_F26B[var_0._id_F26E]._id_B919 );
                var_0 _id_38E2();
            }
        }

        var_1 = var_0._id_3872;
        wait 0.05;
    }
}

sentry_oncarrierdeathoremp( var_0, var_1 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 scripts\engine\utility::waittill_any( "death", "apply_player_emp" );

    if ( self._id_3872 && !scripts\mp\utility\game::istrue( var_1 ) )
        _id_F259( self._id_CB40 );
    else
        _id_F253( 0 );
}

_id_F24E( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 waittill( "disconnect" );
    self delete();
}

_id_F24C( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    var_0 scripts\engine\utility::waittill_any( "joined_team", "joined_spectators" );
    self delete();
}

_id_F24F( var_0 )
{
    self endon( "placed" );
    self endon( "death" );
    level waittill( "game_ended" );
    self delete();
}

_id_F252( var_0 )
{
    self _meth_830F( level._id_F26B[self._id_F26E]._id_F269 );

    if ( var_0 )
    {
        self setcursorhint( "HINT_NOICON" );
        self sethintstring( level._id_F26B[self._id_F26E]._id_017B );
        self makeusable();
    }

    sentry_setteamheadicon();

    foreach ( var_2 in level.players )
    {
        switch ( self._id_F26E )
        {
            case "gl_turret_4":
            case "gl_turret_3":
            case "gl_turret_2":
            case "gl_turret_1":
            case "gl_turret":
            case "minigun_turret_4":
            case "minigun_turret_3":
            case "minigun_turret_2":
            case "minigun_turret_1":
            case "minigun_turret":
                if ( var_0 )
                    self enableplayeruse( var_2 );

                break;
            default:
                _id_0DC9::_id_1843( self._id_F26E, "Killstreak_Ground", self.owner, 1, "carried" );

                if ( var_2 == self.owner && var_0 )
                    self enableplayeruse( var_2 );
                else
                    self disableplayeruse( var_2 );

                break;
        }
    }

    var_4 = level._id_F26B[self._id_F26E]._id_115EB;
    var_5 = _id_0AC7::getrarityforlootitem( self._id_110E8._id_1318B );

    if ( var_5 != "" )
        var_4 = var_4 + "_" + var_5;

    if ( self._id_10085 )
    {
        level thread scripts\mp\utility\game::_id_115DE( var_4, self.owner );
        self._id_10085 = 0;
    }

    if ( self._id_F26E == "sam_turret" )
        thread _id_EB09();

    if ( self._id_F26E == "scramble_turret" )
        thread _id_ECA3();

    if ( self._id_F26E == "sentry_shock" )
        thread _id_F26D();

    thread _id_F263();
}

_id_F257()
{
    self _meth_830F( level._id_F26B[self._id_F26E]._id_F268 );
    self makeunusable();
    scripts\mp\weapons::_id_11061();
    sentry_clearteamheadicon();
}

_id_F24A()
{
    self _meth_81F7();
}

_id_F249()
{
    self _meth_82C7( 0 );
}

_id_9E0A( var_0 )
{
    if ( level.teambased && self.team == var_0.team )
        return 1;

    return 0;
}

_id_F239()
{
    self endon( "death" );
    level endon( "game_ended" );
    self._id_B941 = 0;
    self._id_8CDE = 0;
    self._id_C7F9 = 0;
    thread _id_F245();

    for (;;)
    {
        scripts\engine\utility::_id_13762( "turretstatechange", "cooled" );

        if ( self _meth_81A0() )
        {
            thread _id_F23B();
            continue;
        }

        _id_F25B();
        thread _id_F23C();
    }
}

_id_F261()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = level._id_F26B[self._id_F26E]._id_11901;

    if ( isdefined( var_0 ) && var_0 == 0 )
        return;

    while ( var_0 )
    {
        wait 1.0;
        scripts\mp\hostmigration::waittillhostmigrationdone();

        if ( !isdefined( self._id_3A9D ) )
            var_0 = max( 0, var_0 - 1.0 );
    }

    if ( isdefined( self.owner ) )
    {
        if ( isdefined( level._id_F26B[self._id_F26E]._id_13554 ) )
            self.owner scripts\mp\utility\game::_id_D4B6( level._id_F26B[self._id_F26E]._id_13554, undefined, undefined, self.owner.origin );
    }

    self notify( "death" );
}

_id_F260()
{
    self endon( "death" );
    self playsound( "sentry_gun_beep" );
    wait 0.1;
    self playsound( "sentry_gun_beep" );
    wait 0.1;
    self playsound( "sentry_gun_beep" );
}

_id_F25C()
{
    thread _id_F260();

    while ( self._id_B941 < level._id_F26B[self._id_F26E]._id_10A13 )
    {
        self._id_B941 += 0.1;
        wait 0.1;
    }
}

_id_F25B()
{
    self._id_B941 = 0;
}

_id_F248()
{
    self endon( "death" );
    self endon( "stop_shooting" );
    level endon( "game_ended" );
    _id_F25C();
    var_0 = weaponfiretime( level._id_F26B[self._id_F26E]._id_039B );
    var_1 = level._id_F26B[self._id_F26E]._id_32C1;
    var_2 = level._id_F26B[self._id_F26E]._id_32C0;

    if ( isdefined( self._id_112C5 ) && self._id_112C5 )
    {
        var_0 = 0.05;
        var_3 = 50;
    }
    else
    {
        var_0 = 0.5 / ( self._id_AD80.size + 1 );
        var_3 = var_1;
    }

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        var_5 = self getturrettarget( 1 );

        if ( !isdefined( var_5 ) )
            break;

        self shootturret();
        wait( var_0 );
    }

    self notify( "doneFiring" );
    self cleartargetentity();
}

_id_F23B()
{
    self endon( "death" );
    self endon( "stop_shooting" );
    level endon( "game_ended" );
    _id_F25C();
    var_0 = weaponfiretime( level._id_F26B[self._id_F26E]._id_039B );
    var_1 = level._id_F26B[self._id_F26E]._id_32C1;
    var_2 = level._id_F26B[self._id_F26E]._id_32C0;
    var_3 = level._id_F26B[self._id_F26E]._id_C9D3;
    var_4 = level._id_F26B[self._id_F26E]._id_C9D1;

    for (;;)
    {
        var_5 = randomintrange( var_1, var_2 + 1 );

        for ( var_6 = 0; var_6 < var_5 && !self._id_C7F9; var_6++ )
        {
            self shootturret();
            self notify( "bullet_fired" );
            self._id_8CDE += var_0;
            wait( var_0 );
        }

        wait( randomfloatrange( var_3, var_4 ) );
    }
}

_id_F23C()
{
    self notify( "stop_shooting" );
}

_id_12A31( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 endon( "player_dismount" );
    var_1 = weaponfiretime( level._id_F26B[var_0._id_F26E]._id_039B );

    for (;;)
    {
        var_0 waittill( "turret_fire" );
        var_0._id_8CDE += var_1;
        var_0._id_4621 = var_1;
    }
}

_id_F245()
{
    self endon( "death" );
    var_0 = weaponfiretime( level._id_F26B[self._id_F26E]._id_039B );
    var_1 = 0;
    var_2 = 0;
    var_3 = level._id_F26B[self._id_F26E]._id_C7FB;
    var_4 = level._id_F26B[self._id_F26E]._id_461D;

    for (;;)
    {
        if ( self._id_8CDE != var_1 )
            wait( var_0 );
        else
            self._id_8CDE = max( 0, self._id_8CDE - 0.05 );

        if ( self._id_8CDE > var_3 )
        {
            self._id_C7F9 = 1;
            thread _id_D497();

            switch ( self._id_F26E )
            {
                case "minigun_turret_4":
                case "minigun_turret_3":
                case "minigun_turret_2":
                case "minigun_turret_1":
                case "minigun_turret":
                    playfxontag( scripts\engine\utility::_id_7ECB( "sentry_smoke_mp" ), self, "tag_aim" );
                    break;
                default:
                    break;
            }

            while ( self._id_8CDE )
            {
                self._id_8CDE = max( 0, self._id_8CDE - var_4 );
                wait 0.1;
            }

            self._id_C7F9 = 0;
            self notify( "not_overheated" );
        }

        var_1 = self._id_8CDE;
        wait 0.05;
    }
}

_id_12A00()
{
    self endon( "death" );
    var_0 = level._id_F26B[self._id_F26E]._id_C7FB;

    for (;;)
    {
        if ( self._id_8CDE > var_0 )
        {
            self._id_C7F9 = 1;
            thread _id_D497();

            switch ( self._id_F26E )
            {
                case "gl_turret":
                    playfxontag( scripts\engine\utility::_id_7ECB( "sentry_smoke_mp" ), self, "tag_aim" );
                    break;
                default:
                    break;
            }

            while ( self._id_8CDE )
                wait 0.1;

            self._id_C7F9 = 0;
            self notify( "not_overheated" );
        }

        wait 0.05;
    }
}

_id_129D7()
{
    self endon( "death" );

    for (;;)
    {
        if ( self._id_8CDE > 0 )
        {
            if ( self._id_4621 <= 0 )
                self._id_8CDE = max( 0, self._id_8CDE - 0.05 );
            else
                self._id_4621 = max( 0, self._id_4621 - 0.05 );
        }

        wait 0.05;
    }
}

_id_D497()
{
    self endon( "death" );
    self endon( "not_overheated" );
    level endon( "game_ended" );
    self notify( "playing_heat_fx" );
    self endon( "playing_heat_fx" );

    for (;;)
    {
        playfxontag( scripts\engine\utility::_id_7ECB( "sentry_overheat_mp" ), self, "tag_flash" );
        wait( level._id_F26B[self._id_F26E]._id_7645 );
    }
}

_id_D51F()
{
    self endon( "death" );
    self endon( "not_overheated" );
    level endon( "game_ended" );

    for (;;)
    {
        playfxontag( scripts\engine\utility::_id_7ECB( "sentry_smoke_mp" ), self, "tag_aim" );
        wait 0.4;
    }
}

_id_F23A()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        wait 3.0;

        if ( !isdefined( self._id_3A9D ) )
            self playsound( "sentry_gun_beep" );
    }
}

_id_EB09()
{
    self endon( "carried" );
    self endon( "death" );
    level endon( "game_ended" );
    self._id_EB19 = undefined;
    self._id_EB16 = [];

    for (;;)
    {
        self._id_EB19 = _id_EB08();
        _id_EB0C();
        wait 0.05;
    }
}

_id_EB08()
{
    var_0 = self gettagorigin( "tag_laser" );

    if ( !isdefined( self._id_EB19 ) )
    {
        if ( level.teambased )
        {
            var_1 = [];

            if ( level._id_BDCC )
            {
                foreach ( var_3 in level._id_115DA )
                {
                    if ( var_3 != self.team )
                    {
                        foreach ( var_5 in level._id_12AF3[var_3] )
                            var_1[var_1.size] = var_5;
                    }
                }
            }
            else
                var_1 = level._id_12AF3[level._id_C74B[self.team]];

            foreach ( var_9 in var_1 )
            {
                if ( isdefined( var_9._id_9E78 ) && var_9._id_9E78 )
                    continue;

                if ( sighttracepassed( var_0, var_9.origin, 0, self ) )
                    return var_9;
            }

            foreach ( var_12 in level._id_AD8B )
            {
                if ( isdefined( var_12.team ) && var_12.team == self.team )
                    continue;

                if ( sighttracepassed( var_0, var_12.origin, 0, self ) )
                    return var_12;
            }

            foreach ( var_15 in level._id_8DD3 )
            {
                if ( isdefined( var_15.team ) && var_15.team == self.team )
                    continue;

                if ( sighttracepassed( var_0, var_15.origin, 0, self ) )
                    return var_15;
            }

            foreach ( var_9 in level._id_DF74 )
            {
                if ( !isdefined( var_9 ) )
                    continue;

                if ( isdefined( var_9.team ) && var_9.team == self.team )
                    continue;

                if ( sighttracepassed( var_0, var_9.origin, 0, self, var_9 ) )
                    return var_9;
            }
        }
        else
        {
            foreach ( var_9 in level._id_12AF3 )
            {
                if ( isdefined( var_9._id_9E78 ) && var_9._id_9E78 )
                    continue;

                if ( isdefined( var_9.owner ) && isdefined( self.owner ) && var_9.owner == self.owner )
                    continue;

                if ( sighttracepassed( var_0, var_9.origin, 0, self ) )
                    return var_9;
            }

            foreach ( var_12 in level._id_AD8B )
            {
                if ( isdefined( var_12.owner ) && isdefined( self.owner ) && var_12.owner == self.owner )
                    continue;

                if ( sighttracepassed( var_0, var_12.origin, 0, self ) )
                    return var_12;
            }

            foreach ( var_15 in level._id_8DD3 )
            {
                if ( isdefined( var_15.owner ) && isdefined( self.owner ) && var_15.owner == self.owner )
                    continue;

                if ( sighttracepassed( var_0, var_15.origin, 0, self ) )
                    return var_15;
            }

            foreach ( var_9 in level._id_DF74 )
            {
                if ( !isdefined( var_9 ) )
                    continue;

                if ( isdefined( var_9.owner ) && isdefined( self.owner ) && var_9.owner == self.owner )
                    continue;

                if ( sighttracepassed( var_0, var_9.origin, 0, self, var_9 ) )
                    return var_9;
            }
        }

        self cleartargetentity();
        return undefined;
    }
    else
    {
        if ( !sighttracepassed( var_0, self._id_EB19.origin, 0, self ) )
        {
            self cleartargetentity();
            return undefined;
        }

        return self._id_EB19;
    }
}

_id_EB0C()
{
    if ( isdefined( self._id_EB19 ) )
    {
        if ( self._id_EB19 == level._id_1537._id_CC44 && !isdefined( level._id_1541 ) )
        {
            self._id_EB19 = undefined;
            self cleartargetentity();
            return;
        }

        self settargetentity( self._id_EB19 );
        self waittill( "turret_on_target" );

        if ( !isdefined( self._id_EB19 ) )
            return;

        if ( !self._id_A86B )
        {
            thread _id_EB0E();
            thread _id_EB0D();
            thread _id_EB0F();
            thread _id_EB10();
        }

        wait 2.0;

        if ( !isdefined( self._id_EB19 ) )
            return;

        if ( self._id_EB19 == level._id_1537._id_CC44 && !isdefined( level._id_1541 ) )
        {
            self._id_EB19 = undefined;
            self cleartargetentity();
            return;
        }

        var_0 = [];
        var_0[0] = self gettagorigin( "tag_le_missile1" );
        var_0[1] = self gettagorigin( "tag_le_missile2" );
        var_0[2] = self gettagorigin( "tag_ri_missile1" );
        var_0[3] = self gettagorigin( "tag_ri_missile2" );
        var_1 = self._id_EB16.size;

        for ( var_2 = 0; var_2 < 4; var_2++ )
        {
            if ( !isdefined( self._id_EB19 ) )
                return;

            if ( isdefined( self._id_3A9D ) )
                return;

            self shootturret();
            var_3 = scripts\mp\utility\game::_id_1309( "sam_projectile_mp", var_0[var_2], self._id_EB19.origin, self.owner );
            var_3 _meth_8206( self._id_EB19 );
            var_3 _meth_8204();
            var_3._id_EB1A = self;
            var_3._id_EB15 = var_1;
            self._id_EB16[var_1][var_2] = var_3;
            level notify( "sam_missile_fired", self.owner, var_3, self._id_EB19 );

            if ( var_2 == 3 )
                break;

            wait 0.25;
        }

        level notify( "sam_fired", self.owner, self._id_EB16[var_1], self._id_EB19 );
        wait 3.0;
    }
}

_id_EB10()
{
    level endon( "game_ended" );
    self endon( "death" );

    while ( isdefined( self._id_EB19 ) && isdefined( self getturrettarget( 1 ) ) && self getturrettarget( 1 ) == self._id_EB19 )
    {
        var_0 = self gettagorigin( "tag_laser" );

        if ( !sighttracepassed( var_0, self._id_EB19.origin, 0, self, self._id_EB19 ) )
        {
            self cleartargetentity();
            self._id_EB19 = undefined;
            break;
        }

        wait 0.05;
    }
}

_id_EB0E()
{
    self endon( "death" );
    self laseron();
    self._id_A86B = 1;

    while ( isdefined( self._id_EB19 ) && isdefined( self getturrettarget( 1 ) ) && self getturrettarget( 1 ) == self._id_EB19 )
        wait 0.05;

    self laseroff();
    self._id_A86B = 0;
}

_id_EB0D()
{
    self endon( "death" );
    self._id_EB19 endon( "death" );

    if ( !isdefined( self._id_EB19.helitype ) )
        return;

    self._id_EB19 waittill( "crashing" );
    self cleartargetentity();
    self._id_EB19 = undefined;
}

_id_EB0F()
{
    self endon( "death" );
    self._id_EB19 endon( "death" );

    if ( !isdefined( self._id_EB19._id_01F1 ) )
        return;

    if ( self._id_EB19._id_01F1 == "vehicle_uav_static_mp" )
    {
        self._id_EB19 waittill( "leaving" );
        self cleartargetentity();
        self._id_EB19 = undefined;
    }
}

_id_ECA3()
{
    self endon( "carried" );
    self endon( "death" );
    level endon( "game_ended" );
    self._id_ECA1 = undefined;

    for (;;)
    {
        self._id_ECA1 = _id_EC96();

        if ( isdefined( self._id_ECA1 ) && isdefined( self._id_ECA1._id_EC9B ) && !self._id_ECA1._id_EC9B )
            _id_ECA0();

        wait 0.05;
    }
}

_id_EC96()
{
    return _id_EB08();
}

_id_ECA0()
{
    if ( isdefined( self._id_ECA1 ) )
    {
        if ( self._id_ECA1 == level._id_1537._id_CC44 && !isdefined( level._id_1541 ) )
        {
            self._id_ECA1 = undefined;
            self cleartargetentity();
            return;
        }

        self settargetentity( self._id_ECA1 );
        self waittill( "turret_on_target" );

        if ( !isdefined( self._id_ECA1 ) )
            return;

        if ( !self._id_A86B )
        {
            thread _id_EC98();
            thread _id_EC97();
            thread _id_EC99();
            thread _id_EC9A();
        }

        wait 2.0;

        if ( !isdefined( self._id_ECA1 ) )
            return;

        if ( self._id_ECA1 == level._id_1537._id_CC44 && !isdefined( level._id_1541 ) )
        {
            self._id_ECA1 = undefined;
            self cleartargetentity();
            return;
        }

        if ( !isdefined( self._id_ECA1 ) )
            return;

        if ( isdefined( self._id_3A9D ) )
            return;

        self shootturret();
        thread _id_F82E();
        self notify( "death" );
    }
}

_id_F82E()
{
    var_0 = self._id_ECA1;
    var_0 notify( "scramble_fired", self.owner );
    var_0 endon( "scramble_fired" );
    var_0 endon( "death" );
    var_0 thread scripts\mp\killstreaks\helicopter::_id_8D99();
    var_0._id_EC9B = 1;
    var_0._id_F0C5 = self.owner;
    var_0 notify( "findNewTarget" );
    wait 30;

    if ( isdefined( var_0 ) )
    {
        var_0._id_EC9B = 0;
        var_0._id_F0C5 = undefined;
        var_0 thread scripts\mp\killstreaks\helicopter::_id_8D99();
    }
}

_id_EC9A()
{
    level endon( "game_ended" );
    self endon( "death" );

    while ( isdefined( self._id_ECA1 ) && isdefined( self getturrettarget( 1 ) ) && self getturrettarget( 1 ) == self._id_ECA1 )
    {
        var_0 = self gettagorigin( "tag_laser" );

        if ( !sighttracepassed( var_0, self._id_ECA1.origin, 0, self, self._id_ECA1 ) )
        {
            self cleartargetentity();
            self._id_ECA1 = undefined;
            break;
        }

        wait 0.05;
    }
}

_id_EC98()
{
    self endon( "death" );
    self laseron();
    self._id_A86B = 1;

    while ( isdefined( self._id_ECA1 ) && isdefined( self getturrettarget( 1 ) ) && self getturrettarget( 1 ) == self._id_ECA1 )
        wait 0.05;

    self laseroff();
    self._id_A86B = 0;
}

_id_EC97()
{
    self endon( "death" );
    self._id_ECA1 endon( "death" );

    if ( !isdefined( self._id_ECA1.helitype ) )
        return;

    self._id_ECA1 waittill( "crashing" );
    self cleartargetentity();
    self._id_ECA1 = undefined;
}

_id_EC99()
{
    self endon( "death" );
    self._id_ECA1 endon( "death" );

    if ( !isdefined( self._id_ECA1._id_01F1 ) )
        return;

    if ( self._id_ECA1._id_01F1 == "vehicle_uav_static_mp" )
    {
        self._id_ECA1 waittill( "leaving" );
        self cleartargetentity();
        self._id_ECA1 = undefined;
    }
}

_id_F26D()
{
    self endon( "death" );
    self endon( "carried" );
    level endon( "game_ended" );
    thread _id_13B37();
    self.airlookatent = scripts\engine\utility::_id_107E6( self.origin, self.angles );
    self.airlookatent linkto( self, "tag_flash" );

    for (;;)
    {
        var_0 = scripts\engine\utility::_id_13736( 1, "turret_on_target" );

        if ( var_0 == "timeout" )
        {
            if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_sam_turret" ) )
            {
                self.sentryshocksamtarget = thread searchforshocksentryairtarget();

                if ( isdefined( self.sentryshocksamtarget ) )
                {
                    thread shootshocksentrysamtarget( self.sentryshocksamtarget, self.airlookatent );
                    self waittill( "done_firing" );
                }
            }

            continue;
        }

        self._id_F26C = self getturrettarget( 1 );

        if ( isdefined( self._id_F26C ) && scripts\mp\utility\game::isreallyalive( self._id_F26C ) )
        {
            thread _id_FE4F( self._id_F26C );
            self waittill( "done_firing" );
        }
    }
}

searchforshocksentryairtarget()
{
    if ( isdefined( level._id_12AF3 ) )
    {
        if ( level.teambased )
        {
            foreach ( var_1 in level._id_12AF3[scripts\mp\utility\game::_id_8027( self.owner.team )] )
            {
                if ( targetvisibleinfront( var_1 ) )
                    return var_1;
            }
        }
        else
        {
            foreach ( var_1 in level._id_12AF3 )
            {
                if ( var_1.owner == self.owner )
                    continue;

                if ( targetvisibleinfront( var_1 ) )
                    return var_1;
            }
        }
    }

    if ( isdefined( level._id_27EF ) )
    {
        foreach ( var_6 in level._id_27EF )
        {
            if ( var_6._id_110EA != "ball_drone_backup" )
                continue;

            if ( level.teambased && var_6.team == self.owner.team )
                continue;

            if ( !level.teambased && var_6.owner == self.owner )
                continue;

            if ( targetvisibleinfront( var_6 ) )
                return var_6;
        }
    }

    if ( isdefined( level._id_8DD3 ) )
    {
        foreach ( var_9 in level._id_8DD3 )
        {
            if ( var_9._id_110EA != "jackal" )
                continue;

            if ( level.teambased && var_9.team == self.owner.team )
                continue;

            if ( !level.teambased && var_9.owner == self.owner )
                continue;

            if ( targetvisibleinfront( var_9 ) )
                return var_9;
        }
    }

    if ( isdefined( level._id_DA61 ) )
    {
        foreach ( var_12 in level._id_DA61 )
        {
            if ( var_12._id_110EA != "thor" )
                continue;

            if ( isdefined( var_12.team ) )
            {
                if ( level.teambased && var_12.team == self.owner.team )
                    continue;
            }

            if ( !level.teambased && var_12.owner == self.owner )
                continue;

            if ( targetvisibleinfront( var_12 ) )
                return var_12;
        }
    }

    if ( isdefined( level._id_105EA ) )
    {
        foreach ( var_12 in level._id_105EA )
        {
            if ( var_12._id_110EA != "minijackal" )
                continue;

            if ( isdefined( var_12.team ) )
            {
                if ( level.teambased && var_12.team == self.owner.team )
                    continue;
            }

            if ( !level.teambased && var_12.owner == self.owner )
                continue;

            if ( targetvisibleinfront( var_12 ) )
                return var_12;
        }
    }
}

targetvisibleinfront( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = 0;
    var_2 = self gettagorigin( "tag_flash" );
    var_3 = var_0.origin;
    var_4 = vectornormalize( var_3 - var_2 );
    var_5 = anglestoforward( self.angles );
    var_6 = [ self, self.owner, var_0 ];
    var_7 = physics_createcontents( [ "physicscontents_solid", "physicscontents_glass", "physicscontents_water", "physicscontents_vehicle", "physicscontents_item" ] );

    if ( scripts\engine\trace::_id_DCF1( var_2, var_3, var_6, var_7 ) && vectordot( var_5, var_4 ) > 0.25 && distance2dsquared( var_2, var_3 ) > 10000 )
        var_1 = 1;

    return var_1;
}

shootshocksentrysamtarget( var_0, var_1 )
{
    self endon( "death" );
    self endon( "carried" );
    level endon( "game_ended" );
    self _meth_830F( "manual" );
    thread setshocksamtargetent( var_0, var_1 );
    self.sentryshocksamtarget = undefined;
    self waittill( "turret_on_target" );
    thread _id_B383( var_0 );
    self playsound( "shock_sentry_charge_up" );
    playfxontag( scripts\engine\utility::_id_7ECB( "sentry_shock_charge" ), self, "tag_laser" );
    _id_F25C();
    stopfxontag( scripts\engine\utility::_id_7ECB( "sentry_shock_charge" ), self, "tag_laser" );
    self notify( "start_firing" );
    self setscriptablepartstate( "coil", "active" );
    var_2 = 2;
    var_3 = 1;

    while ( isdefined( var_0 ) && targetvisibleinfront( var_0 ) )
    {
        var_4 = self gettagorigin( "tag_flash" );
        var_5 = scripts\mp\utility\game::_id_1309( "sentry_shock_missile_mp", var_4, var_0.origin, self.owner );
        var_5 _meth_8206( var_0 );
        var_5 _meth_8204();
        var_5._id_A63A = self._id_A63A;
        var_5._id_110E8 = self._id_110E8;
        self setscriptablepartstate( "muzzle", "fire" + var_3, 0 );
        level notify( "laserGuidedMissiles_incoming", self.owner, var_5, var_0 );
        var_3++;

        if ( var_3 > 2 )
            var_3 = 1;

        wait( var_2 );
    }

    self setscriptablepartstate( "muzzle", "neutral", 0 );
    self notify( "sentry_lost_target" );
    var_1 unlink();
    var_1.origin = self gettagorigin( "tag_flash" );
    var_1 linkto( self, "tag_flash" );
    self _meth_830F( "sentry" );
    self cleartargetentity();
    self setscriptablepartstate( "coil", "idle" );
    _id_F25B();
    self notify( "done_firing" );
}

setshocksamtargetent( var_0, var_1 )
{
    self endon( "death" );
    self endon( "carried" );
    self endon( "sentry_lost_target" );
    var_0 endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        var_2 = self gettagorigin( "tag_aim" );
        var_3 = var_0.origin;
        var_4 = vectornormalize( var_3 - var_2 );
        var_5 = var_2 + var_4 * 500;
        var_1 unlink();
        var_1.origin = var_5;
        var_1 linkto( self );
        self settargetentity( var_1 );
        scripts\engine\utility::waitframe();
    }
}

_id_13B37()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "carried" );

        if ( isdefined( self._id_F26C ) )
            self._id_F26C = undefined;

        if ( isdefined( self.sentryshocksamtarget ) )
            self.sentryshocksamtarget = undefined;

        self cleartargetentity();
    }
}

_id_FE4F( var_0 )
{
    self endon( "death" );
    self endon( "carried" );

    if ( !isdefined( var_0 ) )
        return;

    thread _id_B383( var_0 );

    if ( !_id_0DC9::_id_A69F( self._id_110E8, "passive_sam_turret" ) )
        thread _id_13B3C( var_0 );

    self playsound( "shock_sentry_charge_up" );
    playfxontag( scripts\engine\utility::_id_7ECB( "sentry_shock_charge" ), self, "tag_laser" );
    _id_F25C();
    stopfxontag( scripts\engine\utility::_id_7ECB( "sentry_shock_charge" ), self, "tag_laser" );
    self notify( "start_firing" );
    self setscriptablepartstate( "coil", "active" );
    level thread scripts\mp\battlechatter_mp::_id_EB87( var_0, "plr_killstreak_target" );
    var_1 = weaponfiretime( level._id_F26B[self._id_F26E]._id_039B );

    while ( isdefined( var_0 ) && scripts\mp\utility\game::isreallyalive( var_0 ) && isdefined( self getturrettarget( 1 ) ) && self getturrettarget( 1 ) == var_0 && !scripts\mp\utility\game::_id_C7A0( self gettagorigin( "tag_flash" ), var_0 geteye() ) )
    {
        if ( _id_0DC9::_id_A69F( self._id_110E8, "passive_mini_explosives" ) )
        {
            thread missileburstfire( var_0 );
            var_1 = 1.5;
        }
        else
            self shootturret();

        wait( var_1 );
    }

    self setscriptablepartstate( "coil", "idle" );
    self setscriptablepartstate( "muzzle", "neutral", 0 );
    self._id_F26C = undefined;
    self cleartargetentity();
    _id_F25B();
    self notify( "done_firing" );
}

missileburstfire( var_0 )
{
    self endon( "death" );
    self endon( "carried" );
    var_1 = 3;
    var_2 = 1;

    while ( var_1 > 0 )
    {
        if ( !isdefined( var_0 ) )
            return;

        if ( !isdefined( self.owner ) )
            return;

        var_3 = scripts\mp\utility\game::_id_1309( "sentry_shock_grenade_mp", self gettagorigin( "tag_flash" ), var_0.origin, self.owner );

        if ( _id_0DC9::manualmissilecantracktarget( var_0 ) )
        {
            var_3 _meth_8206( var_0, gettargetoffset( var_0 ) );
            var_0 thread watchtarget( var_3 );
        }

        var_3._id_A63A = self._id_A63A;
        var_3._id_110E8 = self._id_110E8;
        self setscriptablepartstate( "muzzle", "fire" + var_2, 0 );
        var_2++;

        if ( var_2 > 2 )
            var_2 = 1;

        var_1--;
        wait 0.2;
    }
}

gettargetoffset( var_0 )
{
    var_1 = ( 0, 0, 40 );
    var_2 = var_0 getstance();

    switch ( var_2 )
    {
        case "stand":
            var_1 = ( 0, 0, 40 );
            break;
        case "crouch":
            var_1 = ( 0, 0, 20 );
            break;
        case "prone":
            var_1 = ( 0, 0, 5 );
            break;
    }

    return var_1;
}

watchtarget( var_0 )
{
    self endon( "disconnect" );

    for (;;)
    {
        if ( !_id_0DC9::manualmissilecantracktarget( self ) )
            break;

        if ( !isdefined( var_0 ) )
            break;

        scripts\engine\utility::waitframe();
    }

    if ( isdefined( var_0 ) )
        var_0 _meth_8203();
}

_id_B383( var_0 )
{
    self endon( "death" );
    self laseron();
    self._id_A86B = 1;
    scripts\engine\utility::waittill_any( "done_firing", "carried" );
    self laseroff();
    self._id_A86B = 0;
}

_id_13B3C( var_0 )
{
    self endon( "death" );
    self endon( "done_firing" );
    var_1 = undefined;

    for (;;)
    {
        self waittill( "victim_damaged", var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );

        if ( var_2 == var_0 )
        {
            var_12 = 100;
            var_13 = scripts\mp\utility\game::_id_807D( var_8, var_12, var_2.team, self.owner );
            playfx( scripts\engine\utility::_id_7ECB( "sentry_shock_explosion" ), var_8 );

            if ( var_13.size > 0 )
            {
                foreach ( var_15 in var_13 )
                {
                    if ( var_15.player != var_2 )
                    {
                        var_15.player _meth_80B0( 5, var_8, self.owner, self, var_6, var_7 );
                        var_16 = undefined;
                        var_17 = undefined;

                        if ( var_15.visiblelocations.size > 1 )
                        {
                            var_17 = randomint( var_15.visiblelocations.size );
                            var_16 = var_15.visiblelocations[var_17];
                        }
                        else
                            var_16 = var_15.visiblelocations[0];

                        playfxbetweenpoints( scripts\engine\utility::_id_7ECB( "sentry_shock_arc" ), var_8, vectortoangles( var_16 - var_8 ), var_16 );
                    }
                }
            }
        }
    }
}

_id_1CB4( var_0 )
{
    if ( var_0 )
    {
        scripts\engine\utility::_id_1C71( 1 );
        thread scripts\mp\supers::_id_12D6C();
    }
    else
    {
        thread scripts\mp\supers::_id_1CAB();
        scripts\engine\utility::_id_1C71( 0 );
    }
}

_id_CC1B()
{
    var_0 = self._id_F26E;

    if ( var_0 == "super_trophy" )
    {
        self.owner _meth_80F4( &"LUA_MENU_MP_PLACE_SUPER_TROPHY" );
        return;
    }
    else
        self.owner _meth_80F4( &"SENTRY_PLACE" );
}

_id_38E2()
{
    var_0 = self._id_F26E;

    if ( var_0 == "super_trophy" )
    {
        self.owner _meth_80F4( &"LUA_MENU_MP_CANNOT_PLACE_SUPER_TROPHY" );
        return;
    }
    else
        self.owner _meth_80F4( &"SENTRY_CANNOT_PLACE" );
}

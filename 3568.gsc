// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_B703()
{
    if ( !isdefined( level._id_B726 ) )
        level._id_B726 = [];
}

_id_B70A()
{

}

_id_B718( var_0 )
{
    thread _id_B6F5();

    if ( isdefined( self._id_B710 ) )
    {
        self._id_B710 = undefined;
        _id_B6F9( var_0 );
    }
}

_id_B719()
{
    scripts\mp\utility\game::_id_1254();
    self setscriptablepartstate( "killstreak", "visor_active", 0 );
    self._id_B710 = 1;
    _id_5232();
    thread _id_139EE();
    thread _id_139EC();
    thread _id_139ED();
    thread watcharbitraryup();
}

_id_B6F9( var_0 )
{
    self notify( "microTurret_end" );

    if ( !scripts\mp\utility\game::istrue( var_0 ) )
        scripts\mp\utility\game::_id_11DB();

    self setscriptablepartstate( "killstreak", "neutral", 0 );
    _id_5236( var_0 );
    var_1 = self._id_B710;
    self._id_B710 = undefined;
    return scripts\mp\utility\game::istrue( var_1 );
}

_id_B711( var_0, var_1, var_2 )
{
    level thread scripts\mp\battlechatter_mp::_id_EB87( self, "plr_perk_turret", undefined, 0.75 );
    self notify( "microTurret_spawned" );

    if ( !isdefined( self._id_B726 ) )
        self._id_B726 = [];

    if ( self._id_B726.size >= microturret_getmaxnum() )
        self._id_B726[0] thread _id_B6F6();

    var_3 = spawnturret( "misc_turret", var_0, "micro_turret_gun_mp" );
    var_3 setmodel( "micro_turret_wm" );
    var_3.angles = var_1;
    var_3.owner = self;
    var_3.team = self.team;
    var_3._id_13C2E = "micro_turret_mp";
    var_3 playsound( "mp_super_miniturret_plant" );
    var_3 thread microturret_beepsounds();
    var_3 maketurretinoperable();
    var_3 makeunusable();

    if ( level.teambased )
        var_3 _meth_835E( self.team );

    var_3._id_1A4A = scripts\engine\utility::_id_107E6( var_3.origin, var_3.angles );
    var_3._id_1A4A linkto( var_3, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    microturret_addtoarrays( var_3, self );
    var_3 thread _id_B71E();
    var_3 thread _id_B71C();
    var_3 setdefaultdroppitch( 0 );
    var_3 _meth_830F( "sentry_offline" );
    var_3 _meth_8336( self );
    var_3 _meth_82FB( 180 );
    var_3 _meth_8330( 180 );
    var_3 _meth_8353( 90 );
    var_3 _meth_82B6( 45 );
    var_3 _meth_831F( self );
    var_3 _meth_8317( 1 );
    var_4 = scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" );
    var_5 = scripts\engine\utility::ter_op( var_4, 209, 119 );
    var_6 = scripts\engine\utility::ter_op( var_4, "hitequip", "" );
    var_3 thread scripts\mp\damage::monitordamage( var_5, var_6, ::_id_B6FF, ::_id_B6FE, 0, 0 );
    var_3._id_A63A = _id_B6F3( var_3 );

    if ( isdefined( var_2 ) )
        var_3 scripts\mp\weapons::_id_69FF( var_2 );

    var_3._id_11196 = 0;
    var_3 thread scripts\mp\perks\perk_equipmentping::_id_E84B();
    thread scripts\mp\weapons::outlinesuperequipment( var_3, self );
    var_3 thread _id_B6EA();
    thread _id_B71D();
    self._id_B710 = undefined;
    scripts\mp\supers::_id_DE3B( 9999000 );
    scripts\mp\utility\game::_id_D915( "microturret placed", self );
}

microturret_beepsounds()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        wait 3.0;

        if ( !isdefined( self._id_3A9D ) )
            self playsound( "mp_super_miniturret_beep" );
    }
}

_id_B6F6()
{
    thread _id_B700();
}

_id_B6F5()
{
    self notify( "microTurret_destroyAll" );

    if ( isdefined( self._id_B726 ) )
    {
        foreach ( var_1 in self._id_B726 )
            var_1 _id_B6F6();
    }

    self._id_B726 = undefined;
}

_id_B70B()
{
    self setscriptablepartstate( "effects", "activeArmed", 0 );
    self _meth_835A( 1, "micro_turret" );
    self setdefaultdroppitch( 0 );
    self _meth_830F( "manual_target" );
    _id_B70F();
    self.planted = 1;

    if ( !issentient( self ) )
        scripts\mp\sentientpoolmanager::registersentient( "Killstreak_Ground", self.owner );
}

_id_B70C()
{
    self _meth_835A( 0 );
    self laseroff();
    self setdefaultdroppitch( 45 );
    self _meth_830F( "sentry_offline" );
    _id_B6F2();
    scripts\mp\sentientpoolmanager::unregistersentient( self.sentientpool, self.sentientpoolindex );
    _id_B6F1();
}

_id_B70F()
{
    if ( !isdefined( self.owner ) )
        return;

    var_0 = self.owner;
    var_1 = var_0.team;

    if ( level.teambased && !scripts\mp\utility\game::istrue( self._id_115D1 ) )
    {
        scripts\mp\entityheadicons::_id_F877( var_1, ( 0, 0, 50 ) );
        self._id_115D1 = 1;
    }
    else if ( !scripts\mp\utility\game::istrue( self._id_D3AA ) )
    {
        scripts\mp\entityheadicons::_id_F7F2( var_0, ( 0, 0, 50 ) );
        self._id_D3AA = 1;
    }
}

_id_B6F2()
{
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

_id_B71C()
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "emp_damage", var_0, var_1, var_2, var_3, var_4 );
        var_5 = 119;

        if ( self.owner scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" ) )
            var_5 = 209;

        var_6 = int( ceil( var_5 / 1 ) );

        if ( isdefined( var_3 ) && var_3 == "kineticpulse_emp_mp" )
            var_6 = int( ceil( var_5 / 1 ) );

        var_2 = scripts\engine\utility::ter_op( isdefined( var_2 ), var_2, self.origin );
        var_3 = scripts\engine\utility::ter_op( isdefined( var_3 ), var_3, "emp_grenade_mp" );
        var_4 = scripts\engine\utility::ter_op( isdefined( var_4 ), var_4, "MOD_EXPLOSIVE" );
        thread _id_B6F8( var_1 );
        self _meth_80B0( var_6, var_2, var_0, undefined, var_4, var_3 );
    }
}

_id_B6F8( var_0 )
{
    self endon( "death" );

    if ( isdefined( self._id_11198 ) && self._id_11198 < gettime() + var_0 * 1000 )
        return;

    self._id_11196 = 1;
    self._id_11198 = gettime() + var_0 * 1000;
    self notify( "stunned" );
    self endon( "stunned" );
    wait( var_0 );
    self._id_11196 = 0;
    self._id_11198 = undefined;
}

_id_B6EA()
{
    self endon( "death" );
    level endon( "game_ended" );
    self._id_1E2D = 34;
    wait 1;

    for (;;)
    {
        _id_B70B();

        if ( !self._id_11196 && !_id_B701() )
            _id_B717();

        _id_B712();

        if ( !self._id_11196 && _id_B701() )
            _id_B6EB();

        if ( self._id_11196 )
            _id_B713();

        scripts\engine\utility::waitframe();
    }
}

_id_B717()
{
    self endon( "stunned" );
    self _meth_830F( "manual" );
    self laseroff();

    if ( _id_B701() )
        _id_B6F1();

    thread _id_B709();

    for (;;)
    {
        var_0 = anglestoforward( self gettagangles( "tag_flash" ) );
        var_1 = [];
        var_2 = gettime();

        foreach ( var_4 in level._id_69D6 )
        {
            if ( var_4._id_11832 + 1500 > var_2 )
                var_1[var_1.size] = var_4;
        }

        var_6 = scripts\engine\utility::_id_227F( level._id_3CB5, var_1, level.spidergrenade.activeagents, level.spidergrenade.proxies );
        var_7 = [];
        var_8 = [];

        foreach ( var_10 in var_6 )
        {
            if ( !_id_B71A( var_10 ) )
                continue;

            var_11 = var_10.origin - self gettagorigin( "tag_dummy" );
            var_12 = vectornormalize( var_11 );
            var_13 = vectordot( var_11, var_12 );
            var_14 = scripts\engine\utility::_id_1E7E( var_0, var_12 );
            var_15 = 1 - var_13 / 800;
            var_16 = 1 - var_14 / 180;
            var_17 = var_15 * 0.5 + var_16 * 0.8;
            var_7[var_7.size] = var_10;
            var_8[var_8.size] = var_17;
        }

        for (;;)
        {
            var_19 = 0;

            for ( var_20 = 0; var_20 < var_7.size - 1; var_20++ )
            {
                var_21 = var_7[var_20];
                var_22 = var_8[var_20];

                if ( var_22 < var_8[var_20] )
                {
                    var_7[var_20] = var_7[var_20 + 1];
                    var_8[var_20] = var_8[var_20 + 1];
                    var_7[var_20 + 1] = var_21;
                    var_8[var_20 + 1] = var_22;
                    var_19 = 1;
                }
            }

            if ( !var_19 )
                break;
        }

        for ( var_20 = 0; var_20 < var_7.size; var_20++ )
        {
            var_23 = var_7[var_20];
            var_24 = _id_B714( var_23 );

            if ( isdefined( var_24 ) )
            {
                _id_B70D( var_23, var_24 );
                return;
            }
        }

        wait 0.1;
    }
}

_id_B6EB()
{
    self endon( "stunned" );
    self endon( "lostTarget" );
    self _meth_830F( "manual" );
    self laseron();
    thread _id_B721();
    _id_B704();
    _id_B6EC();
}

_id_B6EC()
{
    var_0 = weaponfiretime( "micro_turret_gun_mp" );

    if ( isdefined( self._id_1A4A ) && isplayer( self._id_1A4A ) )
        level thread scripts\mp\battlechatter_mp::_id_EB87( self._id_1A4A, "plr_killstreak_target" );

    for (;;)
    {
        if ( _id_B701() )
        {
            var_1 = self _meth_8161( 0 );

            if ( !isdefined( self._id_1A4A ) )
                self settargetentity( self._id_1A4A );

            if ( _id_B715() && isdefined( self _meth_8161( 1 ) ) )
            {
                self shootturret();
                self._id_1E2D--;

                if ( self._id_1E2D <= 0 )
                    _id_B6F6();
            }

            wait( var_0 );
            continue;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_B713()
{
    self setscriptablepartstate( "effects", "activeStunned", 0 );
    _id_B70C();
}

_id_B721()
{
    self endon( "death" );
    self endon( "stunned" );
    level endon( "game_ended" );
    _id_B722();
    _id_B6F1();
    self notify( "lostTarget" );
}

_id_B722()
{
    var_0 = _id_B6FD();
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_1 = undefined;
    var_2 = _id_B6FD();

    while ( isdefined( var_2 ) && var_2 == var_0 )
    {
        var_2 = _id_B6FD();

        if ( !isdefined( var_2 ) || var_2 != var_0 )
            break;

        if ( var_2 scripts\mp\utility\game::_id_12D6( "specialty_blindeye" ) )
            break;

        if ( isdefined( var_1 ) && gettime() > var_1 )
            break;

        if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_2 ) )
        {
            if ( !isdefined( var_1 ) )
                var_1 = gettime() + 500.0;

            wait 0.1;
            continue;
        }

        var_3 = _id_B714( var_2 );

        if ( !isdefined( var_3 ) )
        {
            if ( !isdefined( var_1 ) )
                var_1 = gettime() + 500.0;

            wait 0.1;
            continue;
        }

        _id_B70D( var_2, var_3 );
        var_1 = undefined;
        wait 0.1;
    }
}

_id_B704()
{
    var_0 = _id_B6FD();

    if ( isplayer( var_0 ) || isagent( var_0 ) )
        thread _id_B705( var_0 );

    wait 0.65;
    self notify( "lockOnEnded" );
}

_id_B705( var_0 )
{
    self endon( "death" );
    self endon( "lockOnEnded" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_1 = 0;
    var_2 = 0.2;

    for (;;)
    {
        var_0 playlocalsound( "mp_super_miniturret_lockon" );
        wait( var_2 );
        var_1 += var_2;
    }
}

_id_B6FE( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;
    var_5 = scripts\mp\damage::_id_89C3( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8975( var_1, var_2, var_5 );
    var_5 = microturret_handlesuperandexplosivedamage( var_1, var_2, var_5 );
    var_5 = scripts\mp\supers::modifysuperequipmentdamage( var_0, var_1, var_2, var_5, var_4 );
    return var_5;
}

_id_B6FF( var_0, var_1, var_2, var_3 )
{
    if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0 ) ) )
    {
        if ( var_0 scripts\mp\missions::_id_66B8( "specialty_blindeye" ) )
            var_0 scripts\mp\missions::_id_D991( "ch_perk_kills_blindeye" );

        var_0 scripts\mp\missions::_id_D991( "ch_killjoy_six_ability" );
        var_0 thread scripts\mp\events::_id_11265( self.owner );
        var_0 notify( "destroyed_equipment" );
    }

    thread _id_B700();
}

_id_B700()
{
    self notify( "death" );
    self._id_1A4A delete();
    microturret_removefromarrays( self, self.owner );
    _id_B70C();
    self setscriptablepartstate( "effects", "activeDestroyed" );
    wait 3;
    scripts\mp\weapons::_id_66A8( self.origin, self.angles );
    scripts\mp\utility\game::_id_D915( "microturret destroyed", self.owner );
    self delete();
}

_id_139EE()
{
    self endon( "disconnect" );
    self endon( "microTurret_spawned" );
    self endon( "microTurret_end" );

    for (;;)
    {
        self waittill( "equip_deploy_succeeded", var_0, var_1, var_2, var_3 );

        if ( var_0 == "deploy_microturret_mp" )
            thread _id_B711( var_1, var_2, var_3 );
    }
}

_id_139EC()
{
    self endon( "disconnect" );
    self endon( "microTurret_spawned" );
    self endon( "microTurret_end" );

    for (;;)
    {
        self waittill( "equip_deploy_failed", var_0, var_1, var_2, var_3 );

        if ( var_0 == "deploy_microturret_mp" )
            self setweaponammoclip( "deploy_microturret_mp", 100 );
    }
}

_id_139ED()
{
    self endon( "disconnect" );
    self endon( "microTurret_spawned" );
    self endon( "microTurret_end" );
    level waittill( "game_ended" );
    scripts\mp\supers::_id_DE3B( 9999000 );
}

watcharbitraryup()
{
    self endon( "disconnect" );
    self endon( "microTurret_spawned" );
    self endon( "microTurret_end" );
    scripts\engine\utility::waitframe();

    while ( !scripts\mp\utility\game::isinarbitraryup() )
        scripts\engine\utility::waitframe();

    scripts\mp\supers::superdisabledinarbitraryupmessage();
    scripts\mp\supers::_id_DE3B( 9999000 );
}

_id_5232()
{
    self._id_B6FB = 1;
    scripts\engine\utility::_id_1C6E( 0 );
    _id_0AE2::_id_D729();
    scripts\mp\utility\game::_id_1C47( 0 );
}

_id_5236( var_0 )
{
    if ( !scripts\mp\utility\game::istrue( var_0 ) )
    {
        if ( scripts\mp\utility\game::istrue( self._id_B6FB ) )
        {
            scripts\engine\utility::_id_1C6E( 1 );
            _id_0AE2::_id_D72F();
            scripts\mp\utility\game::_id_1C47( 1 );
        }
    }

    self._id_B6FB = undefined;
}

_id_B71E()
{
    self endon( "death" );
    self.owner waittill( "disconnect" );
    thread _id_B6F6();
}

_id_B71D()
{
    self endon( "disconnect" );
    self endon( "microTurret_destroyAll" );
    self notify( "microTurret_watchForGameEnd" );
    self endon( "microTurret_watchForGameEnd" );
    level scripts\engine\utility::waittill_any( "game_ended", "bro_shot_start" );
    thread _id_B6F5();
}

microturret_addtoarrays( var_0, var_1 )
{
    var_1._id_B726[var_1._id_B726.size] = var_0;
    level._id_B726[var_0 getentitynumber()] = var_0;
}

microturret_removefromarrays( var_0, var_1 )
{
    if ( isdefined( var_1 ) && isdefined( var_1._id_B726 ) )
        var_1._id_B726 = scripts\engine\utility::array_remove( var_1._id_B726, var_0 );

    level._id_B726[var_0 getentitynumber()] = undefined;
}

_id_B6F3( var_0 )
{
    var_1 = var_0 gettagorigin( "tag_laser" );
    var_2 = spawn( "script_model", var_0.origin + anglestoup( var_0.angles ) * 30 );
    var_2 setmodel( "tag_origin" );
    var_2 setscriptmoverkillcam( "explosive" );
    var_2 linkto( var_0 );
    var_2 thread _id_B6F0( var_0 );
    return var_2;
}

_id_B6F0( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );
    wait 10;
    self delete();
}

_id_B714( var_0 )
{
    var_1 = undefined;
    var_2 = physics_createcontents( [ "physicscontents_solid", "physicscontents_vehicle", "physicscontents_glass", "physicscontents_ainosight", "physicscontents_sky" ] );
    var_3 = self gettagorigin( "tag_dummy" );

    if ( isplayer( var_0 ) || isagent( var_0 ) && !scripts\mp\utility\game::_id_9F72( var_0 ) )
    {
        var_4 = "j_spine4";
        var_5 = var_0 gettagorigin( var_4 );

        if ( !isdefined( var_1 ) && !scripts\mp\utility\game::_id_C7A0( var_3, var_5 ) )
        {
            var_6 = physics_raycast( var_3, var_5, var_2, self, 0, "physicsquery_closest" );
            var_7 = !isdefined( var_6 ) || var_6.size == 0;
            var_1 = scripts\engine\utility::ter_op( var_7, var_4, var_1 );
        }

        if ( !isdefined( var_1 ) )
        {
            var_4 = "tag_eye";
            var_5 = var_0 gettagorigin( var_4 );

            if ( !isdefined( var_1 ) && !scripts\mp\utility\game::_id_C7A0( var_3, var_5 ) )
            {
                var_6 = physics_raycast( var_3, var_5, var_2, self, 0, "physicsquery_closest" );
                var_7 = !isdefined( var_6 ) || var_6.size == 0;
                var_1 = scripts\engine\utility::ter_op( var_7, var_4, var_1 );
            }
        }

        if ( !isdefined( var_1 ) )
        {
            var_5 = var_0.origin;

            if ( !isdefined( var_1 ) && !scripts\mp\utility\game::_id_C7A0( var_3, var_5 ) )
            {
                var_6 = physics_raycast( var_3, var_5, var_2, self, 0, "physicsquery_closest" );
                var_7 = !isdefined( var_6 ) || var_6.size == 0;
                var_1 = scripts\engine\utility::ter_op( var_7, var_4, var_1 );
            }
        }
    }
    else
    {
        var_4 = "tag_origin";
        var_5 = var_0 gettagorigin( var_4 );

        if ( !isdefined( var_1 ) && !scripts\mp\utility\game::_id_C7A0( var_3, var_5 ) )
        {
            var_6 = physics_raycast( var_3, var_5, var_2, self, 0, "physicsquery_closest" );
            var_7 = !isdefined( var_6 ) || var_6.size == 0;
            var_1 = scripts\engine\utility::ter_op( var_7, var_4, var_1 );
        }
    }

    return var_1;
}

_id_B70D( var_0, var_1 )
{
    if ( !isdefined( self._id_1A4A ) )
        return 0;

    self._id_1A4A._id_23EA = var_0;
    self._id_1A4A._id_23EB = var_1;
    self._id_1A4A linkto( var_0, var_1, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    self settargetentity( self._id_1A4A );
}

_id_B6F1()
{
    if ( isdefined( self._id_1A4A ) )
    {
        self._id_1A4A linkto( self, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        self._id_1A4A._id_23EA = undefined;
        self._id_1A4A._id_23EB = undefined;
    }

    self cleartargetentity();
}

_id_B701()
{
    return isdefined( self._id_1A4A ) && isdefined( self._id_1A4A._id_23EA );
}

_id_B6FD()
{
    if ( _id_B701() )
        return self._id_1A4A._id_23EA;

    return undefined;
}

_id_B715()
{
    return isdefined( self._id_1A4A ) && isdefined( self._id_1A4A._id_23EB );
}

_id_B71A( var_0 )
{
    var_1 = var_0;

    if ( !isdefined( var_0 ) )
        return 0;

    if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_0 ) )
        return 0;

    if ( var_0 scripts\mp\utility\game::_id_12D6( "specialty_blindeye" ) && !scripts\mp\utility\game::_id_9F72( var_0 ) )
        return 0;

    if ( isplayer( var_0 ) || isagent( var_0 ) )
    {
        if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
            return 0;

        if ( scripts\mp\utility\game::_id_9F22( var_0 ) )
            var_1 = var_0.owner;

        if ( scripts\mp\utility\game::_id_9F72( var_0 ) )
            var_1 = var_0.owner;
    }
    else
        var_1 = var_0.owner;

    if ( !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_1 ) ) )
        return 0;

    if ( distancesquared( var_0.origin, self.origin ) > 640000 )
        return 0;

    return 1;
}

_id_B709()
{
    self endon( "death" );
    self endon( "microTurret_stopIdleMovements" );
    self settargetentity( self._id_1A4A );
    self._id_1A4A unlink();

    for (;;)
    {
        self._id_1A4A.origin = ( randomintrange( -100, 100 ), randomintrange( -100, 100 ), 50 ) + self.origin;
        self playsound( "mp_super_miniturret_servos" );
        wait( randomfloatrange( 0.75, 1.25 ) );
    }
}

_id_B712()
{
    self notify( "microTurret_stopIdleMovements" );
}

microturret_getmaxnum()
{
    var_0 = 1;

    if ( scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" ) )
        var_0++;

    return var_0;
}

microturret_onruggedequipmentunset()
{
    self endon( "disconnect" );

    if ( !isdefined( self._id_B726 ) || self._id_B726.size <= 0 )
        return;

    if ( !scripts\mp\utility\game::isreallyalive( self ) )
    {
        self waittill( "giveLoadout" );

        if ( !isdefined( self._id_B726 ) || self._id_B726.size <= 0 )
            return;
    }

    var_0 = microturret_getmaxnum();
    var_1 = max( 0, self._id_B726.size - var_0 );

    for ( var_2 = 0; var_2 < var_1; var_2++ )
        self._id_B726[0] thread _id_B6F6();
}

microturret_handlesuperandexplosivedamage( var_0, var_1, var_2 )
{
    var_3 = 1;
    var_4 = getweaponbasename( var_0 );

    if ( isdefined( var_4 ) )
        var_0 = var_4;

    switch ( var_0 )
    {
        case "micro_turret_gun_mp":
            var_3 = 5;
            break;
        case "iw7_penetrationrail_mp":
            var_3 = 2.3;
            break;
        case "iw7_atomizer_mp":
            var_3 = 1.5;
            break;
    }

    if ( isexplosivedamagemod( var_1 ) && var_3 < 1.5 )
        var_3 = 1.5;

    return int( ceil( var_3 * var_2 ) );
}

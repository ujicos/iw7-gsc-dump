// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_3CED()
{
    level._effect["chargemode_expl"] = loadfx( "vfx/iw7/_requests/mp/super/vfx_chargemode_expl.vfx" );
}

_id_3D0E()
{

}

_id_3D19()
{
    self notify( "chargeMode_unset" );

    if ( self _meth_84CA() )
        _id_3CDD();
}

_id_3D1A()
{
    self.chargemode_epicimpactents = [];
    scripts\mp\utility\game::_id_1253( 1 );
    scripts\engine\utility::_id_1C6E( 0 );
    scripts\mp\utility\game::_id_2BBB( "specialty_lightweight" );
    scripts\mp\utility\game::giveperk( "specialty_stun_resistance" );
    var_0 = self getcurrentweapon();

    if ( issubstr( var_0, "iw7_nunchucks" ) || issubstr( var_0, "iw7_katana" ) )
    {
        if ( !( self._id_AE7F == "iw7_fists" || self._id_AE94 == "iw7_fists" ) )
            scripts\mp\utility\game::_id_12C6( "iw7_fists_mp" );

        scripts\mp\utility\game::_id_141B( "iw7_fists_mp" );
        self.savedbullchargeweapon = var_0;
    }

    _id_3CD3();
    thread _id_3CF7();
    thread chargemode_monitorkillstreakusage();
    thread chargemode_monitorshield();
    thread chargemode_monitorarmor();
    thread _id_3CFA();
    thread _id_3D04();
    thread _id_3CFB();
    thread _id_3D02();
    thread _id_3CF9();

    if ( !scripts\mp\utility\game::_id_9D46() )
        thread scripts\mp\supers::watchobjuse( 125 );

    return 1;
}

_id_3CDD( var_0 )
{
    self notify( "chargeMode_end" );
    self notify( "obj_drain_end" );

    if ( self _meth_84CA() )
        self _meth_84CB();

    self setscriptablepartstate( "chargeModeMove", "neutral", 0 );
    var_1 = self._id_3D11;
    self._id_3D11 = undefined;
    self._id_3D10 = undefined;
    self._id_3CEA = undefined;
    self._id_3CEC = undefined;
    self._id_3CEB = undefined;
    self.chargemode_epicimpactents = undefined;

    if ( !scripts\mp\utility\game::istrue( var_0 ) )
    {
        self setscriptablepartstate( "chargeMode", "activeEnd", 0 );
        scripts\mp\utility\game::_id_1253( 0 );
        scripts\engine\utility::_id_1C6E( 1 );
        scripts\mp\utility\game::_id_12B83( "specialty_lightweight" );
        scripts\mp\utility\game::_id_E150( "specialty_stun_resistance" );

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( isdefined( var_3 ) )
                    var_3 delete();
            }
        }

        _id_3CD7();

        if ( isdefined( self.savedbullchargeweapon ) )
        {
            if ( !( self._id_AE7F == "iw7_fists" || self._id_AE94 == "iw7_fists" ) )
                scripts\mp\utility\game::_id_141E( "iw7_fists_mp" );

            scripts\mp\utility\game::_id_141B( self.savedbullchargeweapon );
            self.savedbullchargeweapon = undefined;
        }
    }
    else
        self setscriptablepartstate( "chargeMode", "neutral", 0 );
}

_id_3CFB()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "chargemode_end" );
    var_0 = cos( 30 );

    for (;;)
    {
        self waittill( "collided", var_1, var_2, var_3, var_4, var_5 );

        if ( !chargemode_validdatapoint( var_2, var_3 ) )
            continue;

        var_6 = anglestoup( self.angles );
        var_7 = anglestoforward( self.angles );
        var_8 = var_2 - self.origin;
        var_9 = vectornormalize( var_8 - var_6 * vectordot( var_6, var_8 ) );
        var_10 = vectordot( var_1, var_9 );

        if ( var_10 < 85 )
            continue;

        if ( vectordot( var_7, var_9 ) <= var_0 )
            continue;

        self.chargemode_lastimpacttime = gettime();
    }
}

chargemode_validdatapoint( var_0, var_1 )
{
    var_2 = anglestoup( self.angles );
    var_3 = var_2 * -1;
    var_4 = self gettagorigin( "j_helmet" );
    var_5 = var_4 - var_0;
    var_6 = vectordot( var_5, var_2 );

    if ( var_6 >= 0 && var_6 <= 6 )
    {
        if ( acos( vectordot( var_1, var_3 ) <= 45 ) )
            return 0;
        else
            return 1;
    }

    var_7 = self gettagorigin( "tag_origin" );
    var_8 = var_7 - var_0;
    var_9 = vectordot( var_8, var_3 );

    if ( var_9 >= 0 || var_6 <= 6 )
    {
        if ( acos( vectordot( var_1, var_2 ) <= 45 ) )
            return 0;
        else
            return 1;
    }

    return 1;
}

_id_3CFD( var_0 )
{
    var_1 = var_0 getentitynumber();
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "chargeMode_monitorKnockbackEnded_" + var_1 );
    scripts\mp\utility\game::_id_1253( 1 );

    if ( scripts\mp\utility\game::istrue( level.tactical ) )
        scripts\engine\utility::_id_1C42( 0 );

    thread _id_3CFE( var_0 );

    for (;;)
    {
        self waittill( "collided", var_2, var_3, var_4, var_5, var_6 );

        if ( var_6 != "hittype_world" )
            continue;

        var_2 = ( var_2[0], var_2[1], max( 0, var_2[2] ) );
        var_7 = -1 * vectordot( var_2, var_4 );

        if ( var_7 < 450 )
            continue;

        if ( isdefined( var_0 ) )
            self _meth_80B0( 135, var_3, var_0, undefined, "MOD_EXPLOSIVE", "chargemode_mp" );

        break;
    }

    if ( !level.tactical )
        scripts\engine\utility::_id_1C42( 1 );

    scripts\mp\utility\game::_id_1253( 0 );
    self notify( "chargeMode_monitorKnockbackEnded_" + var_1 );
}

_id_3CFE( var_0 )
{
    var_1 = var_0 getentitynumber();
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "chargeMode_monitorKnockbackEnded_" + var_1 );
    wait 0.35;

    if ( !level.tactical )
        scripts\engine\utility::_id_1C42( 1 );

    scripts\mp\utility\game::_id_1253( 0 );
    self notify( "chargeMode_monitorKnockbackEnded_" + var_1 );
}

_id_3CF7()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "chargeMode_end" );
    self waittill( "bullChargeEnd", var_0, var_1 );

    if ( scripts\mp\utility\game::istrue( var_1 ) || var_0 && _id_3CDF() )
        thread _id_3CE9();

    scripts\mp\supers::_id_DE3B( 9999 );
}

chargemode_monitorkillstreakusage()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "chargeMode_end" );

    for (;;)
    {
        if ( isdefined( self._id_13111 ) )
        {
            waittillframeend;
            self notify( "bullChargeEnd", 0, 0, 1 );
            break;
        }

        scripts\engine\utility::waitframe();
    }
}

chargemode_monitorshield()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "chargeMode_end" );

    for (;;)
    {
        if ( !self _meth_853E() )
        {
            waittillframeend;
            self notify( "bullChargeEnd", 0, 0, 1 );
            break;
        }

        scripts\engine\utility::waitframe();
    }
}

chargemode_monitorarmor()
{
    self endon( "death" );
    self endon( "disconnect" );
    chargemode_monitorarmorendearly();

    if ( isdefined( self ) && scripts\mp\utility\game::isreallyalive( self ) )
        scripts\mp\lightarmor::_id_F786( self, 0, 1, 0 );
}

chargemode_monitorarmorendearly()
{
    self endon( "chargeMode_end" );
    var_0 = gettime();
    var_1 = var_0 + 3000;

    for (;;)
    {
        if ( gettime() > var_1 )
            return;

        if ( !isdefined( self._id_2777 ) && !scripts\mp\utility\game::istrue( self._id_10902 ) )
            break;

        scripts\engine\utility::waitframe();
    }

    scripts\mp\lightarmor::_id_F786( self, 19, 1, 0 );
    var_2 = int( ceil( 0.95 ) );
    scripts\engine\utility::waitframe();

    for (;;)
    {
        if ( gettime() > var_1 )
            return;

        var_3 = scripts\mp\lightarmor::_id_7F73( self );
        scripts\mp\lightarmor::_id_F786( self, var_3 + var_2, 1, 0 );
        scripts\engine\utility::waitframe();
    }

    self waittill( "forever" );
}

_id_3D02()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "chargeMode_end" );
    self._id_3D11 = [];

    for (;;)
    {
        self waittill( "shield_hit", var_0 );
        self._id_3D11[self._id_3D11.size] = var_0;
    }
}

_id_3CFA()
{
    self endon( "disconnect" );
    self endon( "chargemode_unset" );
    self endon( "gracePeriodRaceEnd" );
    var_0 = spawnstruct();
    childthread _id_3CE2( var_0 );
    childthread _id_3CE4( var_0 );
    childthread _id_3CE3( var_0 );
    childthread _id_3CE5( var_0 );
    self waittill( "gracePeriodRaceBegin" );
    waittillframeend;

    if ( !scripts\mp\utility\game::istrue( var_0._id_8462 ) )
    {
        if ( scripts\mp\utility\game::istrue( var_0._id_00E6 ) || scripts\mp\utility\game::istrue( var_0._id_6ABF ) )
            scripts\mp\supers::_id_DE7D();
        else
        {
            var_1 = getsubstr( self._id_AE62, 10, self._id_AE62.size );
            scripts\mp\missions::_id_D991( "ch_" + var_1 + "_super" );
            scripts\mp\supers::combatrecordsuperuse( "super_chargemode" );
        }
    }
    else
    {
        var_1 = getsubstr( self._id_AE62, 10, self._id_AE62.size );
        scripts\mp\missions::_id_D991( "ch_" + var_1 + "_super" );
        scripts\mp\supers::combatrecordsuperuse( "super_chargemode" );
    }

    self notify( "gracePeriodRaceEnd" );
}

_id_3CE2( var_0 )
{
    self waittill( "death" );
    var_0._id_00E6 = 1;
    self notify( "gracePeriodRaceBegin" );
}

_id_3CE4( var_0 )
{
    for (;;)
    {
        self waittill( "got_a_kill", var_1, var_2, var_3 );

        if ( var_2 == "chargemode_mp" )
            break;
    }

    var_0._id_8462 = 1;
    self notify( "gracePeriodRaceBegin" );
}

_id_3CE3( var_0 )
{
    self waittill( "bullChargeEnd", var_1, var_2, var_3 );

    if ( scripts\mp\utility\game::istrue( var_3 ) )
        var_0._id_6ABF = 1;
    else if ( var_1 && !_id_3CDF() )
        var_0._id_6ABF = 1;

    self notify( "gracePeriodRaceBegin" );
}

_id_3CE5( var_0 )
{
    wait 1.0;
    var_0._id_11901 = 1;
    self notify( "gracePeriodRaceBegin" );
}

_id_3D04()
{
    self endon( "disconnect" );
    self endon( "chargeMode_end" );
    self endon( "chargeMode_unset" );
    var_0 = spawn( "trigger_rotatable_radius", self.origin, 0, 30, 72 );
    var_0 _meth_80D2();
    var_0 endon( "death" );
    childthread _id_3D07( var_0 );
    childthread _id_3D06( var_0 );
    childthread chargemode_monitortriggerinteractionmanual( var_0 );
    thread _id_3D05( var_0 );
}

_id_3D07( var_0 )
{
    for (;;)
    {
        if ( _id_3D0C() )
        {
            var_1 = self _meth_816B();
            var_2 = vectortoangles( var_1 );
            var_3 = anglestoforward( var_2 );
            var_4 = anglestoup( var_2 );
            var_5 = self.origin + anglestoup( self.angles ) * 36.0;
            var_6 = var_5 + var_3 * 40;
            var_7 = scripts\engine\trace::_id_48BC( 0, 1, 1, 0, 1, 0 );
            var_8 = physics_raycast( var_5, var_6, var_7, undefined, 0, "physicsquery_closest" );

            if ( isdefined( var_8 ) && var_8.size > 0 )
                var_6 = var_8[0]["position"];

            var_0 unlink();
            var_0 dontinterpolate();
            var_0.origin = var_6 - var_4 * 36.0;
            var_0.angles = var_2;
            var_0 linkto( self );
        }

        scripts\engine\utility::waitframe();
    }
}

_id_3D06( var_0 )
{
    var_0._id_11AD2 = [];

    for (;;)
    {
        var_0 waittill( "trigger", var_1 );

        if ( isdefined( var_0._id_11AD2[var_1 getentitynumber()] ) )
            continue;

        if ( !scripts\mp\equipment\phase_shift::_id_213D( var_1, self ) )
            continue;

        if ( var_1 == self )
            continue;

        var_2 = scripts\engine\utility::ter_op( isdefined( var_1.owner ), var_1.owner, var_1 );

        if ( !level._id_740A && var_2 != self && !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( var_2, self ) ) )
            continue;

        if ( vectordot( var_1.origin - self.origin, anglestoforward( self.angles ) ) <= 0 )
            continue;

        if ( !isplayer( var_1 ) && !scripts\mp\utility\game::_id_9F22( var_1 ) )
            continue;

        _id_3D18( var_0, var_1 );
    }
}

_id_3D18( var_0, var_1 )
{
    if ( !scripts\mp\utility\game::isreallyalive( var_1 ) )
        return;

    if ( isplayer( var_1 ) )
    {
        if ( var_1 _meth_8569() )
            return;

        if ( var_1 _meth_8568() )
            return;
    }

    var_2 = scripts\engine\trace::_id_48BC( 0, 1, 1, 0, 1, 0 );
    var_3 = physics_raycast( self geteye(), var_1 geteye(), var_2, undefined, 0, "physicsquery_closest" );

    if ( isdefined( var_3 ) && var_3.size > 0 )
        return;

    var_4 = self _meth_816B();
    var_5 = vectortoangles( var_4 );
    var_6 = anglestoforward( var_5 );

    if ( scripts\mp\utility\game::_id_9F22( var_1 ) )
    {
        var_7 = vectornormalize( ( var_1.origin - self.origin ) * ( 1, 1, 0 ) );
        var_8 = vectornormalize( var_6 * ( 1, 1, 0 ) );
        var_9 = scripts\engine\utility::_id_1E7E( var_7, var_8 );
        thread _id_3D14( var_0, var_1 );

        if ( !_id_3CE7( var_1 ) )
            _id_3CD5( var_1 );

        if ( var_9 <= 25 )
        {
            _id_3CE0();
            return;
        }
    }
    else
    {
        thread _id_3D14( var_0, var_1 );
        thread scripts\mp\gamescore::_id_11ACF( self, var_1, "chargemode_mp", 5 );

        if ( !chargemode_isqueuedforepicimpact( var_1 ) )
        {
            if ( var_1 _meth_84CA() && _id_3CE8( var_1 ) )
            {
                if ( var_1 _id_3CE8( self ) )
                {
                    thread chargemode_queueforepicimpact( var_1 );
                    var_1 thread chargemode_queueforepicimpact( self );
                }
                else
                    _id_3CF5( var_1, var_6 );
            }
            else
            {
                _id_3CF5( var_1, var_6 );
                _id_3CD5( var_1 );
            }
        }
    }
}

chargemode_isqueuedforepicimpact( var_0 )
{
    if ( !isdefined( self.chargemode_epicimpactents ) )
        return 0;

    return isdefined( self.chargemode_epicimpactents[var_0 getentitynumber()] );
}

chargemode_queueforepicimpact( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "chargeMode_queueEpicImpact" );
    self endon( "chargeMode_queueEpicImpact" );
    self.chargemode_epicimpactents[var_0 getentitynumber()] = var_0;
    waittillframeend;
    _id_3CE0();
}

_id_3D05( var_0 )
{
    var_0 endon( "death" );
    scripts\engine\utility::waittill_any( "death", "disconnect", "chargeMode_end", "chargeMode_unset" );
    var_0 delete();
}

chargemode_monitortriggerinteractionmanual( var_0 )
{
    var_1 = 36.0;
    var_2 = 4096;
    var_3 = scripts\engine\trace::_id_48BC( 0, 1, 1, 0, 1, 1 );

    for (;;)
    {
        var_4 = var_0.origin + anglestoup( var_0.angles ) * var_1;
        var_5 = chargemode_gettriggermanualents();

        foreach ( var_7 in var_5 )
        {
            if ( isdefined( var_0._id_11AD2[var_7 getentitynumber()] ) )
                continue;

            if ( !scripts\mp\equipment\phase_shift::_id_213D( var_7, self ) )
                continue;

            var_8 = scripts\engine\utility::ter_op( isdefined( var_7.owner ), var_7.owner, var_7 );

            if ( !level._id_740A && var_8 != self && !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( var_8, self ) ) )
                continue;

            var_9 = var_7.origin - self.origin;

            if ( vectordot( var_9, anglestoforward( self.angles ) ) <= 0 )
                continue;

            var_10 = var_7.origin - var_4;

            if ( lengthsquared( var_10 ) > var_2 )
                continue;

            var_11 = physics_raycast( var_4, var_7.origin, var_3, [ var_7 ], 0, "physicsquery_closest", 1 );

            if ( isdefined( var_11 ) && var_11.size > 0 )
                continue;

            if ( var_7 scripts\mp\equipment\exploding_drone::isexplodingdrone() )
                var_7 scripts\mp\equipment\exploding_drone::explodingdrone_makedamageimmune( self );
            else if ( var_7 scripts\mp\killstreaks\venom::isvenom() )
                var_7 scripts\mp\killstreaks\venom::makedamageimmune( self );

            thread _id_3D14( var_0, var_7 );
            _id_3CD5( var_7 );
        }

        scripts\engine\utility::waitframe();
    }
}

_id_3CD5( var_0 )
{
    var_1 = 140;
    var_2 = var_0._id_110EA;

    if ( isdefined( var_2 ) )
    {
        switch ( var_2 )
        {
            case "remote_c8":
                var_1 = int( ceil( var_0.maxhealth / 4 ) );
                break;
            case "ball_drone_backup":
                var_1 = int( ceil( var_0.maxhealth / 1 ) );
                break;
            case "minijackal":
                var_1 = int( ceil( var_0.maxhealth / 4 ) );
                break;
            case "dronedrop":
                var_1 = int( ceil( var_0.maxhealth / 1 ) );
                break;
            case "sentry_shock":
                var_1 = int( ceil( var_0.maxhealth / 2 ) );
                break;
        }
    }
    else
    {
        var_3 = var_0._id_13C2E;

        if ( isdefined( var_3 ) )
        {
            switch ( var_3 )
            {
                case "super_trophy_mp":
                    var_1 = int( ceil( var_0.maxhealth / 2 ) );
                    break;
                case "micro_turret_mp":
                    var_1 = int( ceil( var_0.maxhealth / 1 ) );
                    break;
            }
        }
    }

    var_0 _meth_80B0( var_1, self.origin, self, self, "MOD_EXPLOSIVE", "chargemode_mp" );
    thread _id_3CD6();
}

_id_3CF5( var_0, var_1 )
{
    var_2 = var_0.origin - self.origin;
    var_3 = length( var_2 );

    if ( var_3 != 0 )
    {
        var_4 = var_2 / var_3;
        var_5 = var_0 _meth_816B();
        var_5 -= var_4 * vectordot( var_5, var_4 );
        var_5 += var_4 * 750;
        var_5 += ( 0, 0, 250 );
        var_6 = clamp( var_5[2], 100, 500 );
        var_5 = ( var_5[0], var_5[1], var_6 );
        var_0 _meth_84DC( var_5, length( var_5 ) );
        var_0 shellshock( "chargemode_mp", 0.85 );
    }
}

_id_3CE9()
{
    thread chargemode_monitordestructibleimpactimmunity();
    self _meth_8253( self.origin, 256, 140, 70, self, "MOD_EXPLOSIVE", "chargemode_mp" );
    scripts\mp\shellshock::_id_858B( self.origin );
    playfx( scripts\engine\utility::_id_7ECB( "chargemode_expl" ), self.origin );
    self playsound( "heavy_charge_impact_wall" );
    self setclientomnvar( "ui_hud_shake", 1 );
}

_id_3CD3()
{
    self attachshieldmodel( "weapon_retract_shield_wm_mp", "tag_weapon_left" );
    self._id_3D10 = 1;
}

_id_3CD7()
{
    self _meth_8098( "weapon_retract_shield_wm_mp", "tag_weapon_left" );
    self._id_3D10 = 0;
}

_id_3D14( var_0, var_1 )
{
    var_0 endon( "death" );
    var_2 = var_1 getentitynumber();
    var_0._id_11AD2[var_2] = var_1;
    _id_3D15( var_0, var_1 );
    var_0._id_11AD2[var_2] = undefined;
}

_id_3D15( var_0, var_1 )
{
    self endon( "disconnect" );
    self endon( "chargeMode_end" );
    var_1 endon( "death" );
    var_1 endon( "disconnect" );
    wait 0.2;
}

_id_3CEE( var_0 )
{
    return var_0 _meth_84CA();
}

_id_3D0C()
{
    var_0 = self _meth_816B();
    var_0 = ( var_0[0], var_0[1], 0 );
    var_1 = lengthsquared( var_0 );
    return var_1 >= 55225 && vectordot( var_0, anglestoforward( self.angles ) ) > 0 && !self _meth_8499();
}

_id_3CDF()
{
    var_0 = self.chargemode_lastimpacttime;

    if ( isdefined( var_0 ) && gettime() - var_0 <= 50 )
        return 1;

    return 0;
}

_id_3CE0()
{
    self notify( "bullChargeEnd", 1, 1 );
}

_id_3CE8( var_0 )
{
    var_1 = self.origin * ( 1, 1, 0 );
    var_2 = var_0.origin * ( 1, 1, 0 );

    if ( var_1 == var_2 )
        return 0;

    var_3 = var_1 - var_2;
    var_4 = anglestoforward( var_0.angles );
    var_5 = scripts\engine\utility::_id_1E7C( var_3, var_4 );

    if ( var_5 < 30 )
        return 1;

    return 0;
}

_id_3CE7( var_0 )
{
    var_1 = self.origin * ( 1, 1, 0 );
    var_2 = var_0.origin * ( 1, 1, 0 );

    if ( var_1 == var_2 )
        return 0;

    var_3 = var_1 - var_2;
    var_4 = anglestoforward( var_0.angles );
    var_5 = anglestoright( var_0.angles );
    var_6 = scripts\engine\utility::_id_1E7C( var_3, var_4 );

    if ( vectordot( var_5, var_3 ) < 0 )
        var_6 *= -1;

    if ( var_0 _meth_853E() )
    {
        if ( var_6 >= -45 && var_6 <= 30 )
            return 1;
    }
    else if ( var_6 >= -75 && var_6 <= 0 )
        return 1;

    return 0;
}

chargemode_gettriggermanualents()
{
    var_0 = [];

    if ( isdefined( level._id_12A83 ) )
        var_0[var_0.size] = level._id_12A83;

    if ( isdefined( level._id_AD8B ) )
        var_0[var_0.size] = level._id_AD8B;

    if ( isdefined( level._id_105EA ) )
        var_0[var_0.size] = level._id_105EA;

    if ( isdefined( level._id_27EF ) )
        var_0[var_0.size] = level._id_27EF;

    if ( isdefined( level._id_11267 ) && isdefined( level._id_11267._id_12801 ) )
        var_0[var_0.size] = level._id_11267._id_12801;

    if ( isdefined( level._id_69D6 ) )
        var_0[var_0.size] = level._id_69D6;

    return scripts\engine\utility::_id_2282( var_0 );
}

chargemode_modifieddamage( var_0, var_1, var_2, var_3, var_4 )
{
    if ( chargemode_isdamageimmune( var_0, var_1, var_2, var_3 ) )
        var_4 = 0;

    return var_4;
}

chargemode_isdamageimmune( var_0, var_1, var_2, var_3 )
{
    var_4 = 0;

    if ( !var_4 )
        var_4 = var_4 || chargemode_isdamageimmuneepicimpact( var_0, var_1, var_2 );

    if ( !var_4 )
        var_4 = var_4 || chargemode_isdamageimmunedestructibleimpact( var_0, var_1, var_2, var_3 );

    return var_4;
}

chargemode_isdamageimmuneepicimpact( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( !isdefined( var_2 ) )
        return 0;

    if ( var_2 != "chargemode_mp" )
        return 0;

    if ( !isdefined( var_0.chargemode_epicimpactents ) )
        return 0;

    return isdefined( var_0.chargemode_epicimpactents[var_1 getentitynumber()] );
}

chargemode_isdamageimmunedestructibleimpact( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        return 0;

    if ( !isdefined( var_2 ) )
        return 0;

    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0 != var_1 )
        return 0;

    if ( !scripts\mp\utility\game::istrue( var_1.chargemode_destructibleimpactimmune ) )
        return 0;

    if ( !scripts\engine\utility::string_starts_with( var_2, "destructible" ) )
        return 0;

    var_4 = anglestoforward( var_1.angles );
    var_5 = vectornormalize( var_3 - var_1.origin );
    return scripts\engine\utility::_id_1E7E( var_4, var_5 ) <= 65;
}

chargemode_monitordestructibleimpactimmunity()
{
    self endon( "disconnect" );
    self.chargemode_destructibleimpactimmune = 1;
    wait 0.1;
    self.chargemode_destructibleimpactimmune = undefined;
}

_id_3CD6()
{
    if ( isdefined( self.chargemode_damagefxtime ) && self.chargemode_damagefxtime == gettime() )
        return;

    self.chargemode_damagefxtime = gettime();

    if ( !isdefined( self.chargemode_damagefxindex ) )
        self.chargemode_damagefxindex = 1;

    var_0 = "active" + self.chargemode_damagefxindex;
    self setclientomnvar( "ui_hud_shake", 1 );
    self setscriptablepartstate( "chargeModeImpact", var_0, 0 );
    self.chargemode_damagefxindex = 1 + scripts\engine\utility::_id_B8F8( self.chargemode_damagefxindex, 3 );
}

_id_3CF9()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "chargemode_end" );
    var_0 = 0;
    var_1 = undefined;
    self setscriptablepartstate( "chargeMode", "active", 0 );

    for (;;)
    {
        var_1 = _id_3D0C();

        if ( var_1 != var_0 )
        {
            if ( var_1 )
                self setscriptablepartstate( "chargeModeMove", "active", 0 );
            else
                self setscriptablepartstate( "chargeModeMove", "neutral", 0 );
        }

        var_0 = var_1;
        wait 0.1;
    }
}

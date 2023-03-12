// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_4ADA( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    scripts\mp\utility\game::_id_D915( "cryo mine spawn", var_0.owner );
    var_0 thread _id_4AD5();
    thread scripts\mp\weapons::monitordisownedgrenade( self, var_0 );
    var_0 waittill( "missile_stuck", var_1 );
    var_0 _meth_8317( 1 );

    if ( scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" ) )
        var_0.hasruggedeqp = 1;

    scripts\mp\weapons::_id_C5AC( var_0, "power_cryoMine" );
    thread scripts\mp\weapons::_id_B9CA( self, var_0 );
    var_0 thread scripts\mp\weapons::_id_B76A();
    var_0._id_ABC6 = _id_4AD1( var_0 );
    var_0 thread scripts\mp\weapons::_id_B76C( var_0._id_ABC6 );
    var_0 thread _id_4ACE();
    var_0 _meth_859F();
    var_0 _meth_85A0();
    var_0 scripts\mp\sentientpoolmanager::registersentient( "Tactical_Static", var_0.owner );
    var_0 thread scripts\mp\weapons::_id_B2A7( "tag_use", 1 );
    var_0 thread _id_4AD7();
    var_0 thread _id_4AD4();
    var_0 thread scripts\mp\perks\perk_equipmentping::_id_E84B();
    var_0 setscriptablepartstate( "plant", "active", 0 );
    var_0.shouldnotblockspawns = 1;
    thread scripts\mp\weapons::_id_C798( var_0, self );
    var_0 thread scripts\mp\entityheadicons::_id_F73E( self, ( 0, 0, 20 ), 0.1 );
}

_id_4ACE()
{
    self endon( "mine_triggered" );
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    wait 2;
    thread _id_4ADC();
}

_id_4AD9( var_0 )
{
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    self notify( "mine_triggered" );
    scripts\mp\utility\game::_id_D915( "cryo mine triggered", self.owner );
    self setscriptablepartstate( "plant", "neutral", 0 );
    self setscriptablepartstate( "trigger", "active", 0 );
    scripts\mp\weapons::_id_6A08( var_0, 0.3, "cryoMine" );
    thread _id_4AD6( self.owner );
}

_id_4AD6( var_0 )
{
    thread _id_4AD2( 0.1 );
    self _meth_82DD( var_0 );
    self _meth_8593();
    self setscriptablepartstate( "plant", "neutral", 0 );
    self setscriptablepartstate( "trigger", "neutral", 0 );
    self setscriptablepartstate( "explode", "active", 0 );
}

_id_4AD3( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    thread _id_4AD2( var_0 + 0.1 );
    wait( var_0 );
    self setscriptablepartstate( "plant", "neutral", 0 );
    self setscriptablepartstate( "trigger", "neutral", 0 );
    self setscriptablepartstate( "destroy", "active", 0 );
}

_id_4AD2( var_0 )
{
    self notify( "death" );
    level._id_B779[self getentitynumber()] = undefined;
    self setcandamage( 0 );
    scripts\mp\weapons::_id_B2A4();
    self._id_69BA = 1;
    var_1 = self.owner;

    if ( isdefined( self.owner ) )
    {
        var_1._id_CC4D = scripts\engine\utility::array_remove( var_1._id_CC4D, self );
        var_1 notify( "cryo_mine_update", 0 );
    }

    wait( var_0 );
    self delete();
}

_id_4AD7()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    level endon( "game_ended" );
    var_0 = self.owner;
    self waittill( "detonateExplosive", var_1 );

    if ( isdefined( var_1 ) )
    {
        if ( var_1 != var_0 )
            var_0 thread scripts\mp\utility\game::leaderdialogonplayer( "mine_destroyed", undefined, undefined, self.origin );

        thread _id_4AD6( var_1 );
    }
    else
        thread _id_4AD6( var_0 );
}

_id_4AD4()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self waittill( "emp_damage", var_0, var_1, var_2, var_3, var_4 );

    if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0 ) ) )
    {
        var_0 notify( "destroyed_equipment" );
        var_0 scripts\mp\killstreaks\killstreaks::_id_83A0();

        if ( isdefined( var_3 ) && var_3 == "emp_grenade_mp" )
            var_0 scripts\mp\missions::_id_D991( "ch_tactical_emp_eqp" );
    }

    var_5 = "";

    if ( scripts\mp\utility\game::istrue( self.hasruggedeqp ) )
        var_5 = "hitequip";

    if ( isplayer( var_0 ) )
        var_0 scripts\mp\damagefeedback::updatedamagefeedback( var_5 );

    thread _id_4AD3();
}

_id_4AD5()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    level scripts\engine\utility::waittill_any( "game_ended", "start_bro_shot" );
    thread _id_4AD3();
}

_id_4ADC()
{
    self endon( "mine_triggered" );
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    var_0 = self._id_ABC6;

    while ( isdefined( var_0 ) )
    {
        var_0 waittill( "trigger", var_1 );

        if ( _id_4ADB( var_1 ) )
            thread _id_4AD9( var_1 );
    }
}

_id_4AD1( var_0 )
{
    var_1 = spawn( "trigger_rotatable_radius", var_0.origin, 0, 128, 100 );
    var_1.angles = var_0.angles;
    var_1 _meth_80D2();
    var_1 linkto( var_0 );
    var_1 hide();
    return var_1;
}

_id_4ACF( var_0, var_1 )
{
    if ( !isplayer( self ) || !isdefined( var_0 ) )
        return;

    var_2 = var_0 _id_0AE1::_id_7FC1( "power_cryoMine", 4.5 );

    if ( scripts\mp\utility\game::_id_12D6( "specialty_stun_resistance" ) )
    {
        scripts\mp\perks\perkfunctions::_id_20E0( var_0, self );
        var_2 = 0.5;
    }

    if ( isdefined( var_1 ) )
        var_2 += var_1;

    thread _id_4AD8( var_0, var_2 );
    _id_0D8C::_id_3E69( var_0 getentitynumber(), var_2 );
    var_0 scripts\mp\damage::combatrecordtacticalstat( "power_cryoMine" );
}

_id_4ADB( var_0 )
{
    var_1 = var_0;

    if ( !isdefined( var_0 ) )
        return 0;

    if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_0 ) )
        return 0;

    if ( isplayer( var_0 ) || isagent( var_0 ) )
    {
        if ( scripts\mp\utility\game::_id_9F72( var_0 ) )
            return 0;

        if ( scripts\mp\utility\game::_id_9F22( var_0 ) )
            var_1 = var_0.owner;

        if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
            return 0;

        if ( !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_1 ) ) )
            return 0;

        if ( lengthsquared( var_0 getentityvelocity() ) < 0.0001 )
            return 0;

        var_2 = scripts\engine\trace::_id_48BC( 0, 1, 0, 0, 1, 0, 0 );
        var_3 = physics_raycast( self.origin, var_0 geteye(), var_2, self, 0, "physicsquery_closest" );

        if ( isdefined( var_3 ) && var_3.size > 0 )
        {
            var_3 = physics_raycast( self.origin, var_0.origin, var_2, self, 0, "physicsquery_closest" );

            if ( isdefined( var_3 ) && var_3.size > 0 )
                return 0;
        }

        return 1;
    }

    return 0;
}

_id_4AD8( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 endon( "disconnect" );
    var_2 = var_0 getentitynumber();
    self notify( "cryoGrenade_trackDebuff_" + var_2 );
    self endon( "cryoGrenade_trackDebuff_" + var_2 );
    scripts\mp\weapons::_id_F7FC();
    scripts\mp\gamescore::_id_11ACE( var_0, self, "cryo_mine_mp" );
    scripts\engine\utility::_id_13736( var_1, "chillEnd" );
    scripts\mp\weapons::_id_F800();
    scripts\mp\gamescore::_id_12D6F( var_0, self, "cryo_mine_mp" );
}

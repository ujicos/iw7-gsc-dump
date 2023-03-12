// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_127F2( var_0 )
{
    self endon( "disconnect" );
    var_0 endon( "death" );
    scripts\mp\utility\game::_id_D915( "trip mine spawn", var_0.owner );
    var_0 thread _id_127D9();
    thread scripts\mp\weapons::monitordisownedgrenade( self, var_0 );
    var_0 waittill( "missile_stuck", var_1 );
    var_0 _meth_831F( self );
    var_0 _meth_8317( 1 );

    if ( scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" ) )
        var_0.hasruggedeqp = 1;

    var_0._id_ABC7 = _id_127EB( var_0 );
    var_0 thread scripts\mp\weapons::_id_B76C( var_0._id_ABC7 );
    var_0._id_ABC9 = _id_127EC( var_0 );
    var_0 thread scripts\mp\weapons::_id_B76C( var_0._id_ABC9 );
    scripts\mp\weapons::_id_C54E( var_0, "power_tripMine" );
    thread scripts\mp\weapons::_id_B9CA( self, var_0 );
    var_0 thread scripts\mp\weapons::_id_B76A();
    var_0 scripts\mp\sentientpoolmanager::registersentient( "Lethal_Static", var_0.owner );
    var_0 thread scripts\mp\weapons::_id_B2A7( "tag_use", 1 );
    var_0 thread _id_127DC();
    var_0 thread _id_127D8();
    var_0 thread _id_127D1();
    var_0 thread scripts\mp\perks\perk_equipmentping::_id_E84B();
    var_0 setscriptablepartstate( "plant", "active", 0 );
    var_0 _meth_859F();
    var_0 _meth_85A0();
    thread scripts\mp\weapons::_id_C798( var_0, self );
}

_id_127EB( var_0 )
{
    var_1 = var_0 gettagorigin( "tag_laser" );
    var_2 = var_0.angles;
    var_3 = spawn( "trigger_rotatable_radius", var_1, 0, 3, 210 );
    var_3.angles = var_2;
    var_3 _meth_80D2();
    var_3 linkto( var_0 );
    var_3 hide();
    return var_3;
}

_id_127EC( var_0 )
{
    var_1 = spawn( "trigger_rotatable_radius", var_0.origin, 0, 32, 32 );
    var_1.angles = var_0.angles;
    var_1 _meth_80D2();
    var_1 linkto( var_0 );
    var_1 hide();
    return var_1;
}

_id_127D1()
{
    self endon( "mine_triggered" );
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    wait 2.0;
    self setscriptablepartstate( "arm", "active", 0 );
    thread _id_127F3();
    thread _id_127F4();
    thread tripmine_watchlethaltriggerbeammanual();
    thread _id_127F7();
}

_id_127DC()
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

        thread _id_127DB( var_1 );
    }
    else
        thread _id_127DB( var_0 );
}

_id_127D8()
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

    thread _id_127D7();
}

_id_127D9()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    level scripts\engine\utility::waittill_any( "game_ended", "bro_shot_start" );
    thread _id_127D7();
}

_id_127DB( var_0 )
{
    thread _id_127D6( 0.1 );
    self _meth_82DD( var_0 );
    self _meth_8593();
    self setscriptablepartstate( "plant", "neutral", 0 );
    self setscriptablepartstate( "arm", "neutral", 0 );
    self setscriptablepartstate( "trigger", "neutral", 0 );
    self setscriptablepartstate( "launch", "neutral", 0 );
    self setscriptablepartstate( "explode", "active", 0 );
}

_id_127D7( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    thread _id_127D6( var_0 + 0.1 );
    wait( var_0 );
    self setscriptablepartstate( "plant", "neutral", 0 );
    self setscriptablepartstate( "arm", "neutral", 0 );
    self setscriptablepartstate( "trigger", "neutral", 0 );
    self setscriptablepartstate( "launch", "neutral", 0 );
    self setscriptablepartstate( "destroy", "active", 0 );
}

_id_127E7( var_0 )
{
    var_1 = spawn( "script_model", self gettagorigin( "tag_laser" ) );
    var_1.angles = self.angles;
    var_1.planted = self.planted;
    var_1 _meth_831F( self.owner );
    var_1 _meth_82DD( self.owner );
    var_1 setmodel( "trip_mine_wm_projectile" );
    var_1.owner = self.owner;
    var_1.team = self.team;
    var_1._id_13C2E = "trip_mine_mp";
    var_1._id_D719 = "power_tripMine";
    var_1._id_A63A = self;
    thread _id_127D7( 0.2 );
    self setscriptablepartstate( "launch", "active", 0 );
    var_1 setscriptablepartstate( "trail", "active", 0 );
    var_1 moveto( var_0, 0.2, 0.1 );
    wait 0.2;
    var_2 = undefined;

    if ( isdefined( var_1.owner ) )
    {
        var_2 = 0.1;
        var_1 setscriptablepartstate( "explode", "active", 0 );
    }
    else
    {
        var_2 = 0.1;
        var_1 setscriptablepartstate( "destroy", "active", 0 );
    }

    wait( var_2 );
    var_1 delete();
}

_id_127F3()
{
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    var_0 = _id_127D2();

    for (;;)
    {
        var_1 = self gettagorigin( "tag_laser" );
        var_2 = var_1 + anglestoforward( self gettagangles( "tag_laser" ) ) * 210;
        var_3 = physics_raycast( var_1, var_2, var_0, self, 0, "physicsquery_closest" );

        if ( isdefined( var_3 ) && var_3.size > 0 )
            var_2 = var_3[0]["position"];

        self._id_2A3F = var_1;
        self._id_2A3A = var_2;
        self._id_2A3C = distance( var_1, var_2 );
        self _meth_8589( self._id_2A3C );
        scripts\engine\utility::waitframe();
    }
}

_id_127F4()
{
    self endon( "mine_triggered" );
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    var_0 = self._id_ABC7;
    var_1 = _id_127D2();

    while ( isdefined( var_0 ) )
    {
        var_0 waittill( "trigger", var_2 );

        if ( tripmine_testlethaltriggerbeam( var_0, var_1, var_2 ) )
            return;
    }
}

tripmine_watchlethaltriggerbeammanual()
{
    self endon( "mine_triggered" );
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    var_0 = self._id_ABC7;
    var_1 = _id_127D2();

    while ( isdefined( var_0 ) )
    {
        var_2 = level._id_69D6;
        var_3 = self.origin;
        var_4 = anglestoup( self.angles );

        foreach ( var_6 in var_2 )
        {
            if ( !isdefined( var_6 ) )
                continue;

            var_7 = var_6.origin - var_3;

            if ( lengthsquared( var_7 ) > 62500 )
                continue;

            if ( vectordot( var_7, var_4 ) < 0 )
                continue;

            if ( tripmine_testlethaltriggerbeam( var_0, var_1, var_6 ) )
                return;
        }

        wait 0.1;
    }
}

tripmine_testlethaltriggerbeam( var_0, var_1, var_2 )
{
    if ( !_id_127E4( var_2, 1 ) )
        return 0;

    var_3 = var_2.origin;
    var_4 = var_2.origin;
    var_5 = 16;

    if ( isplayer( var_2 ) || isagent( var_2 ) )
        var_3 = var_2 gettagorigin( "j_helmet" );
    else if ( isdefined( var_2._id_110EA ) && var_2._id_110EA == "venom" )
        var_3 = var_2.origin + ( 0, 0, 15 );
    else if ( isdefined( var_2._id_110EA ) && var_2._id_110EA == "minijackal" )
    {
        var_4 = var_2.origin - ( 0, 0, 60 );
        var_3 = var_2.origin + ( 0, 0, 24 );
        var_5 = 30;
    }
    else if ( isdefined( var_2._id_110EA ) && var_2._id_110EA == "ball_drone_backup" )
    {
        var_4 = var_2.origin - ( 0, 0, 12 );
        var_3 = var_2.origin + ( 0, 0, 12 );
        var_5 = 20;
    }
    else if ( var_2 scripts\mp\equipment\exploding_drone::isexplodingdrone() )
    {
        var_4 = var_2.origin - ( 0, 0, 12 );
        var_3 = var_2.origin + ( 0, 0, 12 );
        var_5 = 14;
    }

    var_6 = self._id_2A3F;
    var_7 = self._id_2A3A;
    var_8 = scripts\engine\utility::_id_42A2( var_4, var_3, var_6, var_7 );

    if ( !isdefined( var_8 ) )
        return 0;

    var_9 = var_8[0];
    var_10 = var_8[1];
    var_11 = var_8[2];
    var_12 = var_10[2] > var_3[2];
    var_13 = var_10[2] < var_4[2];

    if ( var_12 || var_13 || var_11 > var_5 )
        return 0;

    thread _id_127E8( var_2, var_10 );
    return 1;
}

_id_127F7()
{
    self endon( "mine_triggered" );
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    var_0 = self._id_ABC9;
    var_1 = _id_127D2();

    while ( isdefined( var_0 ) )
    {
        var_0 waittill( "trigger", var_2 );

        if ( !_id_127E4( var_2, 0 ) )
            continue;

        var_3 = var_2.origin;

        if ( isplayer( var_2 ) || isagent( var_2 ) )
            var_3 = var_2 geteye();

        var_4 = physics_raycast( self.origin, var_2 geteye(), var_1, self, 0, "physicsquery_closest" );

        if ( isdefined( var_4 ) && var_4.size > 0 )
            continue;

        var_5 = self._id_2A3F;
        var_6 = self._id_2A3A;
        var_7 = var_5 + ( var_6 - var_5 ) * 0.2;
        thread _id_127E8( var_2, var_7 );
        break;
    }
}

_id_127E8( var_0, var_1 )
{
    self endon( "mine_destroyed" );
    self endon( "mine_selfdestruct" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    self notify( "mine_triggered" );
    scripts\mp\utility\game::_id_D915( "trip mine triggered", self.owner );
    self setscriptablepartstate( "plant", "neutral", 0 );
    self setscriptablepartstate( "arm", "neutral", 0 );
    self setscriptablepartstate( "trigger", "active", 0 );
    scripts\mp\weapons::_id_6A08( var_0, 0.3, "tripMine" );
    thread _id_127E7( var_1 );
}

_id_127E4( var_0, var_1 )
{
    var_2 = var_0;

    if ( !isdefined( var_0 ) )
        return 0;

    if ( scripts\mp\equipment\phase_shift::_id_9DDF( var_0 ) )
        return 0;

    if ( isplayer( var_0 ) || isagent( var_0 ) )
    {
        if ( scripts\mp\utility\game::_id_9F72( var_0 ) )
            return 0;

        if ( scripts\mp\utility\game::_id_9F22( var_0 ) )
            var_2 = var_0.owner;

        if ( !scripts\mp\utility\game::isreallyalive( var_0 ) )
            return 0;

        if ( !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_2 ) ) )
            return 0;

        if ( !var_1 && lengthsquared( var_0 getentityvelocity() ) < 0.0001 )
            return 0;
    }
    else
    {
        if ( isdefined( var_0._id_110EA ) )
        {
            var_2 = var_0.owner;

            if ( !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_2 ) ) )
                return 0;

            if ( var_0._id_110EA == "venom" || var_0._id_110EA == "minijackal" )
            {
                if ( !var_1 && lengthsquared( var_0 getentityvelocity() ) < 0.0001 )
                    return 0;

                return 1;
            }
            else if ( var_0._id_110EA == "ball_drone_backup" )
                return 1;
        }
        else if ( var_0 scripts\mp\equipment\exploding_drone::isexplodingdrone() )
        {
            var_2 = var_0.owner;

            if ( !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_2 ) ) )
                return 0;

            return 1;
        }

        return 0;
    }

    return 1;
}

_id_127D6( var_0 )
{
    self notify( "death" );
    level._id_B779[self getentitynumber()] = undefined;
    self setcandamage( 0 );
    scripts\mp\weapons::_id_B2A4();
    self._id_69BA = 1;
    var_1 = self.owner;

    if ( isdefined( self.owner ) )
    {
        var_1._id_CC4C = scripts\engine\utility::array_remove( var_1._id_CC4C, self );
        var_1 notify( "trip_mine_update", 0 );
    }

    wait( var_0 );
    self delete();
}

_id_127D2()
{
    return physics_createcontents( [ "physicscontents_solid", "physicscontents_water", "physicscontents_sky", "physicscontents_glass", "physicscontents_vehicle", "physicscontents_item", "physicscontents_missileclip" ] );
}

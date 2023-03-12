// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "drone_hive", ::_id_128E3, undefined, undefined, undefined, ::_id_13C8C );
    level._id_5CB9 = getentarray( "remoteMissileSpawn", "targetname" );

    foreach ( var_1 in level._id_5CB9 )
        var_1._id_1155F = getent( var_1._id_0334, "targetname" );

    var_3 = [ "passive_predator", "passive_no_missiles", "passive_implosion", "passive_rapid_missiles" ];
    _id_0AC7::_id_DF07( "drone_hive", var_3 );
}

_id_13C8C( var_0 )
{
    self setclientomnvar( "ui_remote_control_sequence", 1 );
}

_id_128E3( var_0 )
{
    return _id_1307F( self, var_0._id_AC68, var_0 );
}

_id_1307F( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_12B90 ) && self._id_12B90 )
        return 0;

    var_3 = scripts\mp\killstreaks\killstreaks::_id_D507( var_2 );

    if ( !var_3 )
        return 0;

    var_0 scripts\engine\utility::_id_1C76( 0 );
    level thread _id_B9CB( var_0 );
    level thread _id_B9DD( var_0 );
    level thread _id_B9FD( var_0 );
    level thread _id_E846( var_0, var_1, var_2._id_110EA, var_2 );
    return 1;
}

_id_13AA4( var_0 )
{
    var_0 endon( "killstreak_disowned" );
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "death" );

    for (;;)
    {
        level waittill( "host_migration_begin" );

        if ( isdefined( self ) )
        {
            var_0 _meth_83C0();
            var_0 _meth_83BE();
            continue;
        }

        var_0 setclientomnvar( "ui_predator_missile", 2 );
    }
}

_id_13AA2( var_0 )
{
    var_0 endon( "killstreak_disowned" );
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "death" );

    for (;;)
    {
        level waittill( "host_migration_end" );

        if ( isdefined( self ) )
        {
            var_0 setclientomnvar( "ui_predator_missile", 1 );
            var_0 setclientomnvar( "ui_predator_missiles_left", self._id_B8AF );
            continue;
        }

        var_0 setclientomnvar( "ui_predator_missile", 2 );
    }
}

watchclosetogoal( var_0 )
{
    var_0 endon( "killstreak_disowned" );
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    var_1 = scripts\engine\trace::_id_48BC( 1, 1, 1, 1, 1, 1, 1 );

    while ( isdefined( self ) )
    {
        var_2 = scripts\engine\trace::_id_DCED( self.origin, self.origin - ( 0, 0, 1000 ), level._id_3CB5, var_1 );

        if ( isdefined( var_2["position"] ) && distancesquared( self.origin, var_2["position"] ) < 5000 )
            break;

        scripts\engine\utility::waitframe();
    }

    var_0 thread scripts\mp\killstreaks\killstreaks::_id_11086();
}

_id_E846( var_0, var_1, var_2, var_3 )
{
    var_0 endon( "killstreak_disowned" );
    level endon( "game_ended" );
    var_4 = "used_drone_hive";
    var_5 = "drone_hive_projectile_mp";
    var_6 = "switch_blade_child_mp";
    var_7 = _id_0AC7::getrarityforlootitem( var_3._id_1318B );

    if ( var_7 != "" )
        var_4 = var_4 + "_" + var_7;

    if ( _id_0DC9::_id_A69F( var_3, "passive_implosion" ) )
    {
        var_5 = "drone_hive_impulse_mp";
        var_6 = "switch_blade_impulse_mp";
    }

    level thread scripts\mp\utility\game::_id_115DE( var_4, var_0 );
    var_0 notifyonplayercommand( "missileTargetSet", "+attack" );
    var_0 notifyonplayercommand( "missileTargetSet", "+attack_akimbo_accessible" );
    var_8 = _id_7DFE( var_0, level._id_5CB9 );
    var_9 = var_8.origin * ( 1, 1, 0 ) + ( 0, 0, level.mapcenter[2] + 10000 );
    var_10 = var_8._id_1155F.origin;
    var_11 = scripts\mp\utility\game::_id_1309( var_5, var_9, var_10, var_0 );
    var_11 setcandamage( 1 );
    var_11 _meth_80A2();
    var_11 _meth_830B( 1 );
    var_11.team = var_0.team;
    var_11._id_AC68 = var_1;
    var_11.type = "remote";
    var_11.owner = var_0;
    var_11._id_6649 = var_11 getentitynumber();
    var_11._id_110E8 = var_3;
    var_11._id_13C2E = "drone_hive_projectile_mp";
    var_11 thread watchmissileextraeffect( var_3, 1 );
    level._id_E5DE[var_11._id_6649] = var_11;
    level._id_DF80 = 1;
    level thread _id_B9C8( var_11, 1 );
    level thread _id_B9C1( var_11 );

    if ( isdefined( var_0._id_A685 ) )
    {
        var_0._id_A685["drone_hive_projectile_mp"] = 0;
        var_0._id_A685["switch_blade_child_mp"] = 0;
    }

    _id_B889( var_0, var_11 );
    var_0 setclientomnvar( "ui_predator_missile", 1 );
    var_11 thread _id_13AA4( var_0 );
    var_11 thread _id_13AA2( var_0 );
    var_11 thread _id_0DC9::watchsupertrophynotify( var_0 );
    var_0 scripts\mp\matchdata::_id_AFC9( var_2, var_11.origin );
    var_12 = 0;
    var_11._id_B8AF = 2;

    if ( _id_0DC9::_id_A69F( var_3, "passive_predator" ) )
    {
        var_11._id_B8AF = -1;
        var_11.singlefire = 1;
        var_11 _meth_80D3();
    }

    if ( _id_0DC9::_id_A69F( var_3, "passive_rapid_missiles" ) )
        var_11._id_12BA7 = 1;

    var_13 = 2;
    var_0 setclientomnvar( "ui_predator_missiles_left", var_11._id_B8AF );

    for (;;)
    {
        var_14 = var_11 scripts\engine\utility::_id_13734( "death", "missileTargetSet" );
        scripts\mp\hostmigration::waittillhostmigrationdone();

        if ( var_14 == "death" )
            break;

        if ( !isdefined( var_11 ) )
            break;

        if ( scripts\mp\utility\game::istrue( var_11._id_12BA7 ) )
        {
            if ( scripts\mp\utility\game::istrue( var_11.lasttimefired ) )
            {
                if ( gettime() < var_11.lasttimefired + var_13 * 1000 && var_12 == 0 )
                    continue;
            }

            level thread firerapidmissiles( var_11, var_12, var_3, var_6 );
            var_12++;
            var_11.lasttimefired = gettime();
            var_11._id_B8AF = 2 - var_12;
            var_15 = var_11._id_B8AF;

            if ( var_11._id_B8AF == 0 )
                var_15 = -1;

            var_0 setclientomnvar( "ui_predator_missiles_left", var_15 );

            if ( var_12 == 2 )
            {
                var_12 = 0;
                var_11._id_B8AF = 2;
                var_0 thread resetmissiles( var_11, var_13 );
            }

            continue;
        }

        if ( var_12 < 2 )
        {
            if ( !scripts\mp\utility\game::istrue( var_11.singlefire ) )
            {
                level thread _id_10914( var_11, var_12, var_3, var_6 );
                var_12++;
                var_11._id_B8AF = 2 - var_12;
                var_0 setclientomnvar( "ui_predator_missiles_left", var_11._id_B8AF );

                if ( var_12 == 2 )
                    var_11 _meth_80D3();
            }
        }
    }

    level thread _id_E474( var_0 );
    scripts\mp\utility\game::_id_D915( "killstreak ended - drone_hive", var_0 );
}

firerapidmissiles( var_0, var_1, var_2, var_3 )
{
    var_4 = var_1;

    for ( var_5 = 0; var_5 < 2; var_5++ )
    {
        level thread _id_10914( var_0, var_4, var_2, var_3 );
        var_4++;

        if ( var_4 > 1 )
            var_4 = 0;

        wait 0.1;
    }
}

resetmissiles( var_0, var_1 )
{
    var_0 endon( "death" );
    self endon( "disconnect" );
    wait( var_1 );
    self setclientomnvar( "ui_predator_missiles_left", var_0._id_B8AF );
}

_id_B9EE()
{
    level endon( "game_ended" );
    self endon( "death" );
    var_0 = [];
    var_1 = [];

    for (;;)
    {
        var_2 = [];
        var_0 = _id_0DC9::_id_7E92();

        foreach ( var_4 in var_0 )
        {
            var_5 = self.owner _meth_8409( var_4.origin, 65, 90 );

            if ( var_5 )
            {
                self.owner thread scripts\mp\utility\game::_id_5B7A( self.origin, var_4.origin, 10, ( 0, 0, 1 ) );
                var_2[var_2.size] = var_4;
            }
        }

        if ( var_2.size )
        {
            var_1 = sortbydistance( var_2, self.origin );
            self._id_AA25 = var_1[0];
            scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.25 );
        }

        wait 0.05;
        scripts\mp\hostmigration::waittillhostmigrationdone();
    }
}

_id_10914( var_0, var_1, var_2, var_3 )
{
    var_0.owner playlocalsound( "ammo_crate_use" );
    var_4 = var_0 gettagangles( "tag_origin" );
    var_5 = anglestoforward( var_4 );
    var_6 = anglestoright( var_4 );
    var_7 = ( 100, 100, 100 );
    var_8 = ( 15000, 15000, 15000 );

    if ( var_1 )
        var_7 *= -1;

    var_9 = bullettrace( var_0.origin, var_0.origin + var_5 * var_8, 0, var_0 );
    var_8 *= var_9["fraction"];
    var_10 = var_0.origin + var_6 * var_7;
    var_11 = var_0.origin + var_5 * var_8;
    var_12 = scripts\mp\utility\game::_id_1309( var_3, var_10, var_11, var_0.owner );
    var_13 = var_0 getclosesttargetinview( var_0.owner, var_11 );

    if ( isdefined( var_13 ) && !_id_0DC9::_id_A69F( var_2, "passive_rapid_missiles" ) )
        var_12 _meth_8206( var_13 );

    var_12 setcandamage( 1 );
    var_12 _meth_830B( 1 );
    var_12.team = var_0.team;
    var_12._id_AC68 = var_0._id_AC68;
    var_12.type = var_0.type;
    var_12.owner = var_0.owner;
    var_12._id_6649 = var_12 getentitynumber();
    var_12._id_110E8 = var_2;
    var_12._id_13C2E = "switch_blade_child_mp";
    var_12 thread watchmissileextraeffect( var_2, 0 );
    level._id_E5DE[var_12._id_6649] = var_12;
    level thread _id_B9C8( var_12, 0 );
}

getclosesttargetinview( var_0, var_1 )
{
    var_2 = _id_0DC9::_id_7E92( var_0 );
    var_3 = undefined;
    var_4 = undefined;

    foreach ( var_6 in var_2 )
    {
        if ( !_id_0DC9::manualmissilecantracktarget( var_6 ) )
            continue;

        if ( scripts\mp\utility\game::istrue( var_6.trinityrocketlocked ) )
            continue;

        var_7 = distance2dsquared( var_6.origin, var_1 );

        if ( var_7 < 262144 && scripts\mp\utility\game::istrue( _id_390B( var_6 ) ) )
        {
            if ( !isdefined( var_4 ) || var_7 < var_4 )
            {
                var_3 = var_6;
                var_4 = var_7;
            }
        }
    }

    if ( isdefined( var_3 ) )
    {
        var_3.trinityrocketlocked = 1;
        var_3 thread watchtarget( self );
    }

    return var_3;
}

_id_390B( var_0 )
{
    var_1 = 0;
    var_2 = scripts\engine\trace::_id_48BC( 0, 1, 1, 1, 1, 1, 0 );
    var_3 = [ var_0 gettagorigin( "j_head" ), var_0 gettagorigin( "j_mainroot" ), var_0 gettagorigin( "tag_origin" ) ];

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        if ( !scripts\engine\trace::_id_DCF1( self.origin, var_3[var_4], self, var_2 ) )
            continue;

        var_1 = 1;
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

    self.trinityrocketlocked = undefined;

    if ( isdefined( var_0 ) )
        var_0 _meth_8203();
}

_id_B06C( var_0, var_1 )
{
    var_1 endon( "death" );
    level endon( "game_ended" );
    self endon( "death" );

    for (;;)
    {
        triggerfx( var_0 );
        wait 0.25;
    }
}

_id_7FE7( var_0 )
{
    var_1 = var_0 + 1;

    if ( var_1 == level._id_5CB9.size )
        var_1 = 0;

    return var_1;
}

_id_B9C1( var_0 )
{
    var_0 endon( "death" );

    for (;;)
    {
        var_0.owner waittill( "missileTargetSet" );
        var_0 notify( "missileTargetSet" );
    }
}

_id_7DFE( var_0, var_1 )
{
    var_2 = [];

    foreach ( var_4 in level.players )
    {
        if ( !scripts\mp\utility\game::isreallyalive( var_4 ) )
            continue;

        if ( var_4.team == var_0.team )
            continue;

        if ( var_4.team == "spectator" )
            continue;

        var_2[var_2.size] = var_4;
    }

    if ( !var_2.size )
        return var_1[randomint( var_1.size )];

    var_6 = scripts\engine\utility::_id_22A7( var_1 );
    var_7 = var_6[0];

    foreach ( var_9 in var_6 )
    {
        var_9._id_101E4 = 0;

        for ( var_10 = 0; var_10 < var_2.size; var_10++ )
        {
            var_11 = var_2[var_10];

            if ( !scripts\mp\utility\game::isreallyalive( var_11 ) )
            {
                var_2[var_10] = var_2[var_2.size - 1];
                var_2[var_2.size - 1] = undefined;
                var_10--;
                continue;
            }

            if ( bullettracepassed( var_11.origin + ( 0, 0, 32 ), var_9.origin, 0, var_11 ) )
            {
                var_9._id_101E4 += 1;
                return var_9;
            }

            wait 0.05;
            scripts\mp\hostmigration::waittillhostmigrationdone();
        }

        if ( var_9._id_101E4 == var_2.size )
            return var_9;

        if ( var_9._id_101E4 > var_7._id_101E4 )
            var_7 = var_9;
    }

    return var_7;
}

_id_B889( var_0, var_1 )
{
    var_2 = 0.5;
    var_0 scripts\mp\utility\game::_id_7385( 1 );
    var_0 cameralinkto( var_1, "tag_origin" );
    var_0 _meth_808D( var_1 );
    var_0 _meth_83C0();
    var_0 _meth_83BE();
    var_0 playlocalsound( "trinity_rocket_plr" );
    var_0 setclientomnvar( "ui_killstreak_health", 1 );
    var_0 setclientomnvar( "ui_killstreak_countdown", gettime() + int( 15000 ) );
    level thread _id_12B9B( var_0, var_2 );
}

_id_12B9B( var_0, var_1, var_2 )
{
    var_0 endon( "disconnect" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_1 - 0.35 );
    var_0 scripts\mp\utility\game::_id_7385( 0 );
}

_id_B9CB( var_0 )
{
    var_0 endon( "disconnect" );
    var_0 endon( "end_kill_streak" );
    var_0 waittill( "killstreak_disowned" );
    level thread _id_E474( var_0 );
}

_id_B9DD( var_0 )
{
    var_0 endon( "disconnect" );
    var_0 endon( "end_kill_streak" );
    level waittill( "game_ended" );
    var_1 = 1;
    level thread _id_E474( var_0, 0, var_1 );
}

_id_B9FD( var_0 )
{
    var_0 endon( "end_kill_streak" );
    var_0 endon( "disconnect" );
    level waittill( "objective_cam" );
    level thread _id_E474( var_0, 1 );
}

_id_B9C8( var_0, var_1 )
{
    var_2 = var_0.owner;
    var_0 waittill( "death" );
    scripts\mp\hostmigration::waittillhostmigrationdone();

    if ( isdefined( var_0._id_114F1 ) )
        var_0._id_114F1 delete();

    if ( isdefined( var_0._id_6649 ) )
        level._id_E5DE[var_0._id_6649] = undefined;

    if ( var_1 )
        level._id_DF80 = undefined;

    if ( isdefined( var_2 ) && !scripts\mp\utility\game::isreallyalive( var_2 ) && scripts\mp\utility\game::istrue( var_1 ) )
        var_2 thread stopmissilesoundonspawn();
}

stopmissilesoundonspawn()
{
    self endon( "disconnect" );
    self waittill( "spawned_player" );
    self stopolcalsound( "trinity_rocket_plr" );
    self stopolcalsound( "trinity_rocket_plr_lsrs" );
    self stopolcalsound( "trinity_rocket_plr_lfe" );
}

_id_E474( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_0 playlocalsound( "trinity_rocket_exp_plr" );

    if ( !scripts\mp\utility\game::istrue( var_2 ) )
        var_0 thread scripts\mp\killstreaks\killstreaks::_id_11086();

    var_0 setclientomnvar( "ui_predator_missile", 2 );
    var_0 notify( "end_kill_streak" );
    var_0 stopolcalsound( "trinity_rocket_plr" );
    var_0 stopolcalsound( "trinity_rocket_plr_lsrs" );
    var_0 stopolcalsound( "trinity_rocket_plr_lfe" );
    var_0 thermalvisionoff();
    var_0 thermalvisionfofoverlayoff();
    var_0 _meth_808E();
    var_0 cameraunlink();
    var_0 setclientomnvar( "ui_predator_missile", 0 );
    var_0 scripts\engine\utility::_id_1C76( 1 );
}

watchmissileextraeffect( var_0, var_1 )
{
    level endon( "game_ended" );
    var_2 = _id_0DC9::_id_A69F( var_0, "passive_predator" );
    var_3 = _id_0DC9::_id_A69F( var_0, "passive_implosion" );

    if ( !var_2 && !var_3 )
        return;

    if ( var_2 && !scripts\mp\utility\game::istrue( var_1 ) )
        return;

    var_4 = self.owner;
    var_5 = self._id_13C2E;
    var_6 = scripts\engine\utility::_id_107E6();
    var_6 linkto( self );
    var_4.extraeffectkillcam = var_6;
    self.explosiontarget = spawn( "script_model", self.origin );
    self.explosiontarget setmodel( "ks_drone_hive_target_mp" );
    self.explosiontarget _meth_82DD( var_4 );
    self.explosiontarget _meth_831F( var_4 );
    self.explosiontarget linkto( self, "tag_origin" );
    self.explosiontarget._id_13C2E = var_5;
    self.explosiontarget._id_110E8 = var_0;
    var_7 = self.explosiontarget;
    self waittill( "death" );

    if ( !isdefined( var_7 ) )
        return;

    if ( var_2 )
    {
        wait 0.27;
        var_7 setscriptablepartstate( "chain_explode_1", "active", 0 );
        wait 0.27;
        var_7 setscriptablepartstate( "chain_explode_2", "active", 0 );
        wait 1;
    }
    else if ( var_3 )
    {
        var_7 setscriptablepartstate( "impulse_explode", "active", 0 );
        wait 0.5;
        var_8 = _func_2AF( var_4, "drone_hive_implosion_mp", var_7.origin );
        wait 0.1;
        var_8 delete();
        var_7 _meth_8253( var_7.origin, 325, 1000, 1000, var_4, "MOD_EXPLOSIVE", var_5 );
        scripts\mp\shellshock::_id_858B( var_7.origin );
        physicsexplosionsphere( var_7.origin, 300, 0, 200 );
        wait 1;
    }

    if ( isdefined( var_7 ) )
        var_7 delete();

    if ( isdefined( var_6 ) )
        var_6 delete();
}

watchgastrigger( var_0, var_1 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_2 );

        if ( !isplayer( var_2 ) )
            continue;

        if ( level.teambased && var_2.team == var_0.team && var_2 != var_0 )
            continue;

        if ( scripts\mp\utility\game::istrue( var_2.gettinggassed ) )
            continue;

        thread applygasdamageovertime( var_0, var_1, var_2 );
    }
}

applygasdamageovertime( var_0, var_1, var_2 )
{
    var_2 endon( "disconnect" );
    var_2.gettinggassed = 1;

    while ( var_2 istouching( self ) )
    {
        var_2 _meth_80B0( 20, self.origin, var_0, self, "MOD_EXPLOSIVE", var_1 );
        var_3 = scripts\engine\utility::_id_13736( 0.5, "death" );

        if ( var_3 == "death" )
            break;
    }

    if ( scripts\mp\utility\game::istrue( var_2.gettinggassed ) )
        var_2.gettinggassed = undefined;
}

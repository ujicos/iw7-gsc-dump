// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

spidergrenade_init()
{
    var_0 = spawnstruct();
    var_0.agents = [];
    var_0.activeagents = [];
    var_0.proxies = [];
    level.spidergrenade = var_0;
}

spidergrenade_used( var_0 )
{
    var_0 endon( "death" );

    if ( !spidergrenade_agentavailable() )
        spidergrenade_freeactiveagent();

    var_0 thread spidergrenade_cleanuponownerdisconnect();
    var_0 waittill( "missile_stuck", var_1 );
    var_0 _meth_859F();
    var_0 _meth_85A0();

    if ( isplayer( var_1 ) )
        thread spidergrenade_stuckplayer( var_0, var_1 );
    else
        thread spidergrenade_stuckground( var_0, var_1 );
}

spidergrenade_stuckground( var_0, var_1 )
{
    var_0 endon( "death" );
    spidergrenade_proxyinitialize( var_0 );
    var_2 = spidergrenade_getplacementinfo( var_0, var_0.origin );

    if ( var_2._id_38EE )
    {
        var_0 unlink();
        var_0 dontinterpolate();
        var_0.origin = var_2._id_0245;
        var_0.canbecomeagent = 1;
    }
    else
        var_0.canbecomeagent = 0;

    var_0 thread spidergrenade_setstate( 0, var_1 );
}

spidergrenade_stuckplayer( var_0, var_1 )
{
    spidergrenade_proxyinitialize( var_0 );

    if ( scripts\mp\utility\game::isreallyalive( var_1 ) )
        var_0 linkto( var_1, "j_head", ( 3, -5, 0 ), ( 0, 0, 90 ) );

    scripts\mp\weapons::_id_85DD( var_0, var_1 );
    var_0 thread spidergrenade_setstate( 3, var_1 );
}

spidergrenade_destroy()
{
    if ( isagent( self ) )
    {
        var_0 = self.proxy;

        if ( isalive( self ) )
            self suicide();

        if ( isdefined( var_0 ) && !scripts\mp\utility\game::istrue( var_0._id_69BA ) )
            var_0 thread spidergrenade_destroy();

        return;
    }

    scripts\mp\utility\game::_id_D915( "spider grenade destroy", self.owner );
    self show();
    thread spidergrenade_delete( 0.1 );
    self setscriptablepartstate( "beacon", "neutral", 0 );
    self setscriptablepartstate( "anims", "neutral", 0 );
    self setscriptablepartstate( "destroy", "active", 0 );
}

spidergrenade_explode()
{
    if ( isagent( self ) )
    {
        var_0 = self.proxy;

        if ( isalive( self ) )
            self suicide();

        if ( isdefined( var_0 ) && !scripts\mp\utility\game::istrue( var_0._id_69BA ) )
            var_0 thread spidergrenade_explode();

        return;
    }

    scripts\mp\utility\game::_id_D915( "spider grenade explode", self.owner );
    self show();
    thread spidergrenade_delete( 0.1 );
    self setscriptablepartstate( "beacon", "neutral", 0 );
    self setscriptablepartstate( "anims", "neutral", 0 );
    self setscriptablepartstate( "explode", "active", 0 );
}

spidergrenade_delete( var_0 )
{
    self notify( "death" );
    self setcandamage( 0 );
    self._id_69BA = 1;
    wait( var_0 );
    self delete();
}

spidergrenade_setstate( var_0, var_1 )
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self notify( "spiderGrenade_setState" );
    self endon( "spiderGrenade_setState" );

    switch ( var_0 )
    {
        case 0:
            self setscriptablepartstate( "beacon", "activeSeek", 0 );
            self setscriptablepartstate( "anims", "activeSeek", 0 );
            var_2 = gettime() + _id_0C26::getseekenemytimeout();
            var_3 = undefined;

            while ( gettime() <= var_2 )
            {
                var_3 = _id_0C26::_id_7FDB();

                if ( isdefined( var_3 ) )
                    break;

                scripts\engine\utility::waitframe();
            }

            if ( spidergrenade_agentavailable() && isdefined( var_3 ) )
            {
                var_4 = _id_0F6E::_id_1090C( self.origin, self.angles, self.owner );

                if ( isdefined( var_4 ) )
                {
                    var_4._id_F181 = var_3;
                    thread spidergrenade_proxytoagent( self, var_4 );
                    return;
                }
            }

            thread spidergrenade_setstate( 2 );
            break;
        case 1:
            self setscriptablepartstate( "beacon", "activeChase", 0 );
            self setscriptablepartstate( "anims", "activeChase", 0 );
            wait( _id_0C26::_id_7E27() / 1000 );
            thread spidergrenade_setstate( 2 );
            break;
        case 2:
            self setscriptablepartstate( "beacon", "activeExplode", 0 );
            self setscriptablepartstate( "anims", "activeExplodeGround", 0 );
            wait( _id_0C26::_id_7EA9() / 1000 );
            thread spidergrenade_explode();
            break;
        case 3:
            self _meth_8429( var_1 );
            self setscriptablepartstate( "beacon", "activeExplode", 0 );
            self setscriptablepartstate( "anims", "activeExplodePlayer", 0 );
            wait( _id_0C26::_id_7EA9() / 1000 );
            thread spidergrenade_explode();
        case 4:
            self setscriptablepartstate( "beacon", "neutral", 0 );
            self setscriptablepartstate( "anims", "neutral", 0 );
            break;
    }
}

spidergrenade_destroyonemp()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self waittill( "emp_damage", var_0, var_1, var_2, var_3, var_4 );

    if ( isdefined( var_3 ) && var_3 == "emp_grenade_mp" )
    {
        if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0 ) ) )
            var_0 scripts\mp\missions::_id_D991( "ch_tactical_emp_eqp" );
    }

    spidergrenade_awardpoints( var_0 );

    if ( isplayer( var_0 ) )
    {
        var_5 = scripts\engine\utility::ter_op( scripts\mp\utility\game::istrue( self.hasruggedeqp ), "hitequip", "" );
        var_0 scripts\mp\damagefeedback::updatedamagefeedback( var_5 );
    }

    thread spidergrenade_destroy();
}

spidergrenade_destroyongameend()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    level scripts\engine\utility::waittill_any( "bro_shot_start", "game_ended" );
    thread spidergrenade_destroy();
}

spidergrenadeproxy_handledamage( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !scripts\mp\equipment\phase_shift::_id_213D( var_0, self ) )
        return 0;

    if ( var_2 == "MOD_MELEE" )
        return 0;

    var_5 = _id_0F6E::getseekermaxhealth();
    var_6 = 1;

    if ( scripts\mp\utility\game::_id_9DFF( var_1, var_2 ) )
        var_6 = 2;
    else if ( var_3 >= scripts\mp\weapons::minegettwohitthreshold() )
        var_6 = 2;

    _id_0AE2::equipmenthit( self.owner, var_0, var_1, var_2 );
    return var_6 * var_5;
}

spidergrenadeproxy_handlefataldamage( var_0, var_1, var_2, var_3, var_4 )
{
    spidergrenade_awardpoints( var_0 );
    thread spidergrenade_explode();
}

_id_5856( var_0 )
{
    playfx( scripts\engine\utility::_id_7ECB( "seeker_sparks" ), var_0 );
}

spidergrenade_proxyinitialize( var_0 )
{
    var_0._id_9F72 = 1;
    var_0 _meth_831F( self );
    var_0 _meth_82DD( self );
    var_0 _meth_8317( 1 );
    var_1 = var_0.owner scripts\mp\utility\game::_id_12D6( "specialty_rugged_eqp" );
    var_0.hasruggedeqp = var_1;
    var_2 = scripts\engine\utility::ter_op( var_1, _id_0F6E::getseekermaxhealthrugged(), _id_0F6E::getseekermaxhealth() );
    var_3 = scripts\engine\utility::ter_op( var_1, "hitequip", "" );
    var_0 thread scripts\mp\damage::monitordamage( var_2, var_3, ::spidergrenadeproxy_handlefataldamage, ::spidergrenadeproxy_handledamage );
    var_0 thread spidergrenade_cleanuponownerdisconnect();
    var_0 thread spidergrenade_destroyongameend();
    var_0 thread spidergrenade_destroyonemp();
    var_0 thread scripts\mp\perks\perk_equipmentping::_id_E84B();
    thread scripts\mp\weapons::_id_C798( var_0, self );
    spidergrenade_addtoproxyarray( var_0 );
}

spidergrenade_proxytoagent( var_0, var_1 )
{
    var_0 notify( "death" );
    var_0 thread spidergrenade_cleanuponownerdisconnect();
    var_2 = var_0.maxhealth - var_0._id_00E1;
    var_3 = var_0.equipping_lastpingtime;
    var_1.owner = var_0.owner;
    var_1.team = var_0.team;
    var_1._id_13C2E = var_0._id_13C2E;
    var_1._id_D719 = var_0._id_D719;
    var_1.attackers = var_0.attackers;
    var_1.proxy = var_0;
    var_1._id_A63A = var_0;
    var_1._id_9F72 = var_0._id_9F72;
    var_1.hasruggedeqp = var_0.hasruggedeqp;
    var_1 _meth_831F( var_1.owner );
    var_1 _meth_82DD( var_1.owner );
    var_1 _meth_8317( 1 );
    var_1 scripts\mp\mp_agent::set_agent_health( var_2 );
    var_1._id_CA5B = [];
    var_1._id_CA5D = [];
    var_1 scripts\mp\utility\game::giveperk( "specialty_blindeye" );
    var_1 thread spidergrenade_cleanuponownerdisconnect();
    var_1 thread spidergrenade_cleanuponparentdeath( var_0 );
    var_1 thread spidergrenade_destroyongameend();
    var_1 thread spidergrenade_destroyonemp();
    var_1 thread scripts\mp\perks\perk_equipmentping::_id_E84B( undefined, var_3 );
    thread scripts\mp\weapons::_id_C798( var_1, var_1.owner );
    var_4 = spawn( "script_model", var_1.origin );
    var_4 setmodel( "tag_origin" );
    var_4 linkto( var_1 );
    var_4 thread spidergrenade_cleanuponparentdeath( var_0 );
    var_0._id_A638 = var_4;
    var_0 hide( 1 );
    var_0 setcandamage( 0 );
    var_0 linkto( var_4 );
    var_0 thread spidergrenade_setstate( 4 );
    var_1 thread spidergrenade_trackdebuff( undefined, var_1._id_F181 );
}

spidergrenade_agenttoproxy( var_0, var_1 )
{
    var_2 = var_0.health;
    var_3 = var_0.equipping_lastpingtime;
    var_1.attackers = var_0.attackers;
    var_1._id_A638 delete();
    var_1 show();
    var_4 = scripts\engine\utility::ter_op( scripts\mp\utility\game::istrue( var_1.hasruggedeqp ), "hitequip", "" );
    var_1 thread scripts\mp\damage::monitordamage( var_2, var_4, ::spidergrenadeproxy_handlefataldamage, ::spidergrenadeproxy_handledamage );
    var_1 thread scripts\mp\perks\perk_equipmentping::_id_E84B( undefined, var_3 );
    thread scripts\mp\weapons::_id_C798( var_1, var_1.owner );
    spidergrenade_addtoproxyarray( var_1 );
    var_1 thread spidergrenade_setstate( 2 );

    if ( isdefined( var_0._id_F181 ) && scripts\mp\utility\game::isreallyalive( var_0._id_F181 ) )
        var_1 thread spidergrenade_trackdebuff( var_0, var_0._id_F181 );

    var_0 suicide();
}

spidergrenade_awardpoints( var_0 )
{
    if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( self.owner, var_0 ) ) )
    {
        var_0 notify( "destroyed_equipment" );
        var_0 thread scripts\mp\utility\game::_id_83B4( "destroyed_equipment" );
    }
}

spidergrenade_trackdebuff( var_0, var_1 )
{
    var_2 = self.owner;
    self endon( "spiderGrenade_trackDebuff" );
    var_2 endon( "disconnect" );
    var_1 endon( "death" );
    var_1 endon( "disconnect" );

    if ( isdefined( var_0 ) )
        var_0 notify( "spiderGrenade_trackDebuff" );
    else
        scripts\mp\gamescore::_id_11ACE( var_2, var_1, "power_spider_grenade_mp" );

    self waittill( "death" );
    scripts\mp\gamescore::_id_12D6F( var_2, var_1, "power_spider_grenade_mp" );
}

spidergrenade_getplacementinfo( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_2 ) )
    {
        var_2 = spawnstruct();
        var_2._id_38EE = 0;
        var_2._id_0245 = self.origin;
        var_2.angles = self.angles;
    }

    var_4 = isdefined( var_3 );

    if ( var_4 )
        scripts\engine\utility::waitframe();

    var_5 = var_0.origin;
    var_6 = getclosestpointonnavmesh( var_1 );
    var_7 = var_6 - var_5;

    if ( var_4 && var_3 == var_6 )
        return var_2;

    var_8 = lengthsquared( var_7 * ( 0, 0, 1 ) );
    var_9 = lengthsquared( var_7 * ( 1, 1, 0 ) );

    if ( var_8 > 9216 || var_9 > 4096 )
    {
        if ( var_4 )
            return var_2;

        var_1 -= ( 0, 0, 72 );
        return spidergrenade_getplacementinfo( var_0, var_1, var_2, var_4 );
    }

    var_10 = undefined;
    var_11 = undefined;
    var_12 = spidergrenade_getplacementcontents();
    var_13 = vectordot( var_7, ( 0, 0, 1 ) ) >= 0;

    if ( var_13 )
    {
        var_14 = var_5;
        var_15 = var_6 + ( 0, 0, 10 );
        var_16 = var_15 - var_14;
        var_17 = var_16 * ( 0, 0, 1 );
        var_10 = var_14;
        var_11 = var_10 + var_17;
        var_18 = physics_raycast( var_10, var_11, var_12, [ var_0 ], 1, "physicsquery_closest", 1 );

        if ( isdefined( var_18 ) && var_18.size > 0 )
        {
            if ( var_4 )
                return var_2;

            var_1 -= ( 0, 0, 72 );
            return spidergrenade_getplacementinfo( var_0, var_1, var_2, var_4 );
        }
        else
        {
            var_17 = var_16 - var_17;
            var_10 = var_11;
            var_11 = var_15;
            var_18 = physics_raycast( var_10, var_11, var_12, [ var_0 ], 1, "physicsquery_closest", 1 );

            if ( isdefined( var_18 ) && var_18.size > 0 )
            {
                if ( var_4 )
                    return var_2;

                var_1 -= ( 0, 0, 72 );
                return spidergrenade_getplacementinfo( var_0, var_1, var_2, var_4 );
            }
            else
            {
                var_16 = var_6 - var_11;
                var_17 = var_16 - ( 0, 0, 64 );
                var_10 = var_11;
                var_11 = var_10 + var_17;
                var_12 = spidergrenade_getfinalplacementcontents();
                var_18 = physics_raycast( var_10, var_11, var_12, [ var_0 ], 1, "physicsquery_closest", 1 );

                if ( isdefined( var_18 ) && var_18.size > 0 )
                {
                    var_19 = var_18[0]["position"];

                    if ( vectordot( var_19 - var_6, ( 0, 0, 1 ) ) > 32 )
                    {
                        if ( var_4 )
                            return var_2;

                        var_1 -= ( 0, 0, 72 );
                        return spidergrenade_getplacementinfo( var_0, var_1, var_2, var_4 );
                    }
                    else
                    {
                        var_2._id_38EE = 1;
                        var_2._id_0245 = var_19 + ( 0, 0, 2 );
                        var_2.angles = var_0.angles * ( 0, 1, 0 );
                    }
                }
            }
        }
    }
    else
    {
        var_10 = var_5;
        var_11 = var_10 + ( 0, 0, 10 );
        var_18 = physics_raycast( var_10, var_11, var_12, [ var_0 ], 1, "physicsquery_closest", 1 );

        if ( isdefined( var_18 ) && var_18.size > 0 )
            return var_2;
        else
        {
            var_16 = var_6 - var_11;
            var_17 = var_16 * ( 1, 1, 0 );
            var_10 = var_11;
            var_11 = var_10 + var_17;
            var_18 = physics_raycast( var_10, var_11, var_12, [ var_0 ], 1, "physicsquery_closest", 1 );

            if ( isdefined( var_18 ) && var_18.size > 0 )
                return var_2;
            else
            {
                var_16 = var_6 - var_11;
                var_17 = var_16 - ( 0, 0, 64 );
                var_10 = var_11;
                var_11 = var_10 + var_17;
                var_12 = spidergrenade_getfinalplacementcontents();
                var_18 = physics_raycast( var_10, var_11, var_12, [ var_0 ], 1, "physicsquery_closest", 1 );

                if ( isdefined( var_18 ) && var_18.size > 0 )
                {
                    var_19 = var_18[0]["position"];

                    if ( vectordot( var_19 - var_6, ( 0, 0, 1 ) ) > 32 )
                        return var_2;
                    else
                    {
                        var_2._id_38EE = 1;
                        var_2._id_0245 = var_19 + ( 0, 0, 2 );
                        var_2.angles = var_0.angles * ( 0, 1, 0 );
                    }
                }
            }
        }
    }

    return var_2;
}

spidergrenade_getplacementcontents()
{
    return physics_createcontents( [ "physicscontents_solid", "physicscontents_glass", "physicscontents_sky", "physicscontents_water" ] );
}

spidergrenade_getfinalplacementcontents()
{
    return physics_createcontents( [ "physicscontents_solid", "physicscontents_glass", "physicscontents_sky", "physicscontents_water", "physicscontents_item", "physicscontents_playerclip", "physicscontents_monsterclip" ] );
}

spidergrenade_addtoproxyarray( var_0 )
{
    var_1 = var_0 getentitynumber();

    if ( isdefined( level.spidergrenade.proxies[var_1] ) )
        return;

    level.spidergrenade.proxies[var_1] = var_0;
    thread spidergrenade_removefromproxyarrayondeath( var_0 );
}

spidergrenade_removefromproxyarray( var_0 )
{
    level.spidergrenade.proxies[var_0] = undefined;
}

spidergrenade_removefromproxyarrayondeath( var_0 )
{
    var_1 = var_0 getentitynumber();
    var_0 waittill( "death" );
    spidergrenade_removefromproxyarray( var_1 );
}

spidergrenade_addtoactiveagentarray( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level.spidergrenade.activeagents )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3 == var_0 )
            continue;

        var_1[var_1.size] = var_3;
    }

    var_1[var_1.size] = var_0;
    level.spidergrenade.activeagents = var_1;
    spidergrenade_addtoagentarray( var_0 );
}

spidergrenade_removefromactiveagentarray( var_0 )
{
    level.spidergrenade.activeagents = scripts\engine\utility::array_remove( level.spidergrenade.activeagents, var_0 );
    thread spidergrenade_removefromactiveagentarrayinternal( var_0 );
}

spidergrenade_removefromactiveagentarrayinternal( var_0 )
{
    var_0 scripts\engine\utility::_id_13737( level.agent_recycle_interval, "agent_in_use" );
    spidergrenade_removefromagentarray( var_0 );
}

spidergrenade_addtoagentarray( var_0 )
{
    var_1 = [];
    var_1[0] = var_0;

    foreach ( var_3 in level.spidergrenade.agents )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3 == var_0 )
            continue;

        var_1[var_1.size] = var_3;
    }

    level.spidergrenade.agents = var_1;
}

spidergrenade_removefromagentarray( var_0 )
{
    level.spidergrenade.agents = scripts\engine\utility::array_remove( level.spidergrenade.agents, var_0 );
}

spidergrenade_agentavailable()
{
    return level.spidergrenade.agents.size < 8;
}

spidergrenade_freeactiveagent()
{
    foreach ( var_1 in level.spidergrenade.activeagents )
    {
        if ( !var_1 _id_0C26::_id_9FB2() && isdefined( var_1.proxy ) )
        {
            thread spidergrenade_agenttoproxy( var_1, var_1.proxy );
            return 1;
        }
    }

    return 0;
}

spidergrenade_cleanuponparentdeath( var_0 )
{
    self endon( "death" );
    self notify( "spiderGrenade_cleanupOnParentDeath" );
    self endon( "spiderGrenade_cleanupOnParentDeath" );
    var_0 waittill( "death" );

    if ( isagent( self ) && isalive( self ) )
        self suicide();
    else
        self delete();
}

spidergrenade_cleanuponownerdisconnect()
{
    self endon( "death" );
    self notify( "spiderGrenade_cleanupOnOwnerDisconnect" );
    self endon( "spiderGrenade_cleanupOnOwnerDisconnect" );
    self.owner scripts\engine\utility::waittill_any( "joined_team", "joined_spectators", "disconnect" );

    if ( isagent( self ) && isalive( self ) )
        self suicide();
    else
        self delete();
}

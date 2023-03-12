// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_94DC( var_0 )
{
    level._id_18EE = [];
    level._id_18EB = [];
    level.agent_recycle_interval = 500;
    var_1 = [];
    var_1["species"] = 3;
    var_1["traversal_unit_type"] = 4;
    var_1["body_model"] = 5;
    var_1["animclass"] = 6;
    var_1["health"] = 7;
    var_1["xp"] = 8;
    var_1["reward"] = 9;
    var_1["behaviorTree"] = 10;
    var_1["asm"] = 11;
    var_1["radius"] = 12;
    var_1["height"] = 13;
    var_2 = 0;
    var_3 = 50;

    for ( var_4 = var_2; var_4 <= var_3; var_4++ )
    {
        var_5 = tablelookupbyrow( var_0, var_4, 2 );

        if ( var_5 == "" )
            break;

        var_6 = [];

        foreach ( var_11, var_8 in var_1 )
        {
            var_9 = tablelookupbyrow( var_0, var_4, var_8 );

            if ( var_9 == "0" )
                var_9 = 0;
            else if ( int( var_9 ) != 0 )
            {
                var_10 = var_9 + "";

                if ( issubstr( var_10, "." ) )
                    var_9 = float( var_9 );
                else
                    var_9 = int( var_9 );
            }

            var_6[var_11] = var_9;
        }

        level._id_18EE[var_5] = var_6;
    }

    level notify( "scripted_agents_initialized" );
}

_id_F8ED()
{
    var_0 = level._id_18EE[self.agent_type];

    if ( !isdefined( var_0["behaviorTree"] ) || var_0["behaviorTree"] == "" )
        return;

    scripts\anim\notetracks_mp::_id_197F( var_0["behaviorTree"], var_0["asm"] );
}

_id_FAFA( var_0 )
{
    self.weapon = var_0;
    self giveweapon( var_0 );
    self setspawnweapon( var_0 );
    self._id_3250 = weaponclipsize( var_0 );
    self.primaryweapon = var_0;
}

_id_FAED( var_0 )
{
    self._id_02AE = var_0;
}

_id_108E8( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = _id_7EC5( var_0 );

    if ( isdefined( var_6 ) )
    {
        if ( !isdefined( var_3 ) )
            var_3 = ( 0, 0, 0 );

        var_6.connecttime = gettime();

        if ( isdefined( var_5 ) )
            var_6 _id_FAED( var_5 );

        var_6 _id_F28D( var_6, var_0 );
        var_6 _id_F28F( var_6, var_0 );

        if ( _id_9CB3( var_0 ) )
            var_6 = _id_107CF( var_6, var_0, var_2, var_3 );
        else
            var_6 = _id_107B2( var_6, var_2, var_3 );

        var_6 _id_F8A9( var_0 );
        var_6 _id_F290( var_1 );
        var_6 _id_F28E( var_6, var_0 );
        var_6 _id_F291( var_6, var_0 );
        var_6 _id_184B();

        if ( isdefined( var_4 ) )
            var_6 _id_FAFA( var_4 );

        if ( _id_9CF8( var_0 ) )
            var_6 _id_F8ED();

        var_6 _id_1601();
    }

    return var_6;
}

_id_F291( var_0, var_1 )
{
    if ( !_id_384C( var_0 ) )
        return;

    var_0 _meth_828C( level._id_18EE[var_1]["traversal_unit_type"] );
}

_id_384C( var_0 )
{
    if ( _id_9B53( var_0 ) )
        return 1;

    return 0;
}

_id_F28D( var_0, var_1 )
{
    var_2 = level._id_18EE[var_1]["setup_model_func"];

    if ( isdefined( var_2 ) )
    {
        var_0 [[ var_2 ]]( var_1 );
        return;
    }

    var_0 detachall();
    var_0 setmodel( level._id_18EE[var_1]["body_model"] );
    var_0 show();
}

_id_9CB3( var_0 )
{
    return level._id_18EE[var_0]["animclass"] != "";
}

_id_9CF8( var_0 )
{
    if ( !isdefined( level._id_18EE[var_0] ) )
        return 0;

    return level._id_18EE[var_0]["behaviorTree"] != "";
}

_id_107CF( var_0, var_1, var_2, var_3 )
{
    var_0._id_C50F = var_0 _id_10972( "on_enter_animstate" );
    var_0._id_9CB3 = 1;
    var_4 = level._id_18EE[var_1]["radius"];

    if ( !isdefined( var_4 ) )
        var_4 = 15;

    var_5 = level._id_18EE[var_1]["height"];

    if ( !isdefined( var_5 ) )
        var_5 = 50;

    var_0 spawnagent( var_2, var_3, level._id_18EE[var_1]["animclass"], var_4, var_5 );
    var_0._id_18F4 = var_5;
    var_0._id_18F9 = var_4;
    return var_0;
}

_id_107B2( var_0, var_1, var_2 )
{
    var_0._id_9CB3 = 0;
    var_0 spawnagent( var_1, var_2 );
    return var_0;
}

_id_9B53( var_0 )
{
    return var_0._id_9CB3;
}

_id_18F3( var_0, var_1, var_2, var_3, var_4 )
{
    if ( _id_9B53( self ) )
        self _meth_8286( var_0 );
    else
        self botsetscriptgoal( var_0, var_1, var_2, var_3, var_4 );
}

_id_F8A9( var_0 )
{
    var_1 = level._id_18EE[var_0];

    if ( !isdefined( var_1 ) )
        return;

    var_2 = var_1["setup_func"];

    if ( !isdefined( var_2 ) )
        return;

    self [[ var_2 ]]();
}

_id_F28F( var_0, var_1 )
{
    if ( !isdefined( level.agent_funcs[var_1] ) )
        level.agent_funcs[var_1] = [];

    var_0._id_1096F = level._id_18EE[var_1]["species"];

    if ( !isdefined( level._id_10970[var_0._id_1096F] ) || !isdefined( level._id_10970[var_0._id_1096F]["on_enter_animstate"] ) )
    {
        level._id_10970[var_0._id_1096F] = [];
        level._id_10970[var_0._id_1096F]["on_enter_animstate"] = ::_id_5005;
    }

    _id_23B2( "spawn", ::_id_5016 );
    _id_23B2( "on_damaged", ::_id_5003 );
    _id_23B2( "on_damaged_finished", ::_id_5004 );
    _id_23B2( "on_killed", ::_id_5006 );
}

_id_23B2( var_0, var_1 )
{
    var_2 = self.agent_type;

    if ( !isdefined( level.agent_funcs[var_2][var_0] ) )
    {
        if ( !isdefined( level._id_10970[self._id_1096F] ) || !isdefined( level._id_10970[self._id_1096F][var_0] ) )
            level.agent_funcs[var_2][var_0] = var_1;
        else
            level.agent_funcs[var_2][var_0] = level._id_10970[self._id_1096F][var_0];
    }
}

_id_F28E( var_0, var_1 )
{
    var_0 set_agent_health( level._id_18EE[var_1]["health"] );
}

_id_77D7( var_0 )
{
    return var_0.agent_type;
}

_id_7EC6()
{
    if ( !isdefined( level.agentarray ) )
        return 0;

    var_0 = gettime();
    var_1 = 0;

    foreach ( var_3 in level.agentarray )
    {
        if ( !isdefined( var_3._id_9D25 ) || !var_3._id_9D25 )
        {
            if ( isdefined( var_3._id_136FD ) && var_3._id_136FD )
                continue;

            var_4 = var_3 getentitynumber();

            if ( isdefined( level._id_18EB ) && isdefined( level._id_18EB[var_4] ) && var_0 < level._id_18EB[var_4] )
                continue;

            var_1++;
        }
    }

    return var_1;
}

_id_7EC5( var_0 )
{
    var_1 = undefined;
    var_2 = gettime();

    if ( isdefined( level.agentarray ) )
    {
        foreach ( var_4 in level.agentarray )
        {
            if ( !isdefined( var_4._id_9D25 ) || !var_4._id_9D25 )
            {
                if ( isdefined( var_4._id_136FD ) && var_4._id_136FD )
                    continue;

                var_5 = var_4 getentitynumber();

                if ( isdefined( level._id_18EB ) && isdefined( level._id_18EB[var_5] ) && var_2 < level._id_18EB[var_5] )
                    continue;

                level._id_18EB[var_5] = undefined;
                var_1 = var_4;
                var_1.agent_type = var_0;
                var_1 _id_97C2();
                var_1 notify( "agent_in_use" );
                break;
            }
        }
    }

    return var_1;
}

_id_97C2()
{
    self.pers = [];
    self._id_8BE2 = 0;
    self._id_9D25 = 0;
    self._id_10916 = 0;
    self.entity_number = self getentitynumber();
    self._id_18F2 = 0;
    self detachall();
    _id_98BB();
}

_id_98BB()
{
    self.class = undefined;
    self._id_BCF6 = undefined;
    self._id_26B9 = undefined;
    self.guid = undefined;
    self.name = undefined;
    self._id_EB6A = undefined;
    self._id_CA5B = undefined;
    self._id_13CA0 = undefined;
    self._id_C2AD = undefined;
    self._id_0291 = undefined;
    self.sessionstate = undefined;
    self._id_55E6 = undefined;
    self._id_55E9 = undefined;
    self._id_55D9 = undefined;
    self._id_55E4 = 1;
    self._id_C026 = undefined;
    self._id_0184 = 0;
    self._id_0180 = 0;
    self._id_116D4 = undefined;
    self._id_441A = undefined;
    self._id_4B82 = undefined;
    self._id_5793 = undefined;

    if ( isdefined( level._id_768B ) )
        self [[ level._id_768B ]]();
}

_id_F290( var_0, var_1 )
{
    self.team = var_0;
    self._id_0020 = var_0;
    self.pers["team"] = var_0;
    self.owner = var_1;
    self _meth_831F( var_1 );
    self _meth_82DD( var_1 );
}

_id_184B()
{
    for ( var_0 = 0; var_0 < level._id_3CB5.size; var_0++ )
    {
        if ( level._id_3CB5[var_0] == self )
            return;
    }

    level._id_3CB5[level._id_3CB5.size] = self;
}

agentfunc( var_0 )
{
    return level.agent_funcs[self.agent_type][var_0];
}

_id_10972( var_0 )
{
    return level._id_10970[self._id_1096F][var_0];
}

_id_1313C( var_0 )
{
    if ( isagent( var_0 ) && ( !isdefined( var_0._id_9D25 ) || !var_0._id_9D25 ) )
        return undefined;

    if ( isagent( var_0 ) && !isdefined( var_0.classname ) )
        return undefined;

    return var_0;
}

set_agent_health( var_0 )
{
    self.agenthealth = var_0;
    self.health = var_0;
    self.maxhealth = var_0;
}

_id_5016( var_0, var_1, var_2 )
{

}

_id_9BEA( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
    {
        if ( isdefined( var_1.team ) && var_1.team == var_0.team )
            return 1;

        if ( isdefined( var_1.owner ) && isdefined( var_1.owner.team ) && var_1.owner.team == var_0.team )
            return 1;
    }

    return 0;
}

_id_5003( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_12 = self;
    var_13 = level.agent_funcs[self.agent_type]["gametype_on_damaged"];

    if ( isdefined( var_13 ) )
        [[ var_13 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );

    if ( _id_9BEA( var_12, var_0 ) )
        return;

    var_12 [[ level.agent_funcs[var_12.agent_type]["on_damaged_finished"] ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, 0.0, var_10, var_11 );
}

_id_5004( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 )
{
    var_13 = self.health;

    if ( isdefined( var_7 ) )
    {
        var_14 = vectortoyaw( var_7 );
        var_15 = self.angles[1];
        self._id_00E3 = angleclamp180( var_14 - var_15 );
    }
    else
        self._id_00E3 = 0;

    self._id_00DD = var_8;
    self._id_00DE = var_4;
    self._id_4D3F = var_1;
    self._id_00DC = var_7;
    self._id_00E1 = var_2;
    self._id_00E2 = var_5;
    self._id_4D62 = var_6;
    self finishagentdamage( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, 0.0, var_11, var_12 );

    if ( self.health > 0 && self.health < var_13 )
        self notify( "pain" );

    if ( isalive( self ) && isdefined( self.agent_type ) )
    {
        var_16 = level.agent_funcs[self.agent_type]["gametype_on_damage_finished"];

        if ( isdefined( var_16 ) )
            [[ var_16 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12 );
    }
}

_id_5006( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( isdefined( level._id_C4BD ) )
        self [[ level._id_C4BD ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, 0 );
    else
        _id_C4B3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, 0 );

    var_9 = level.agent_funcs[self.agent_type]["gametype_on_killed"];

    if ( isdefined( var_9 ) )
        [[ var_9 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );

    deactivateagent();
}

_id_5005( var_0, var_1 )
{
    self._id_1B03 = var_1;

    switch ( var_1 )
    {
        case "traverse":
            self._id_5793 = 1;
            _id_0F3C::_id_5AC0();
            self._id_5793 = 0;
            break;
        default:
            break;
    }

    _id_41A5();
}

_id_41A5()
{
    self._id_DDC0 = [];
    self._id_4D57 = 0;
}

deactivateagent()
{
    var_0 = self getentitynumber();
    level._id_18EB[var_0] = gettime() + 500;
}

_id_8008( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "all";

    var_1 = _id_7D95( var_0 );
    return var_1.size;
}

_id_7D95( var_0 )
{
    var_1 = [];

    if ( !isdefined( level.agentarray ) )
        return var_1;

    foreach ( var_3 in level.agentarray )
    {
        if ( isdefined( var_3._id_9D25 ) && var_3._id_9D25 )
        {
            if ( var_0 == "all" || var_3.agent_type == var_0 )
                var_1[var_1.size] = var_3;
        }
    }

    return var_1;
}

_id_7DB0( var_0 )
{
    var_1 = [];

    foreach ( var_3 in level.agentarray )
    {
        if ( isalive( var_3 ) && isdefined( var_3.team ) && var_3.team == var_0 )
            var_1[var_1.size] = var_3;
    }

    return var_1;
}

_id_7D94( var_0 )
{
    var_1 = [];

    if ( !isdefined( level.agentarray ) )
        return var_1;

    foreach ( var_3 in level.agentarray )
    {
        if ( isdefined( var_3._id_9D25 ) && var_3._id_9D25 )
        {
            if ( var_3._id_1096F == var_0 )
                var_1[var_1.size] = var_3;
        }
    }

    return var_1;
}

_id_7DAF()
{
    var_0 = [];

    foreach ( var_2 in level.agentarray )
    {
        if ( isalive( var_2 ) )
            var_0[var_0.size] = var_2;
    }

    return var_0;
}

_id_1601()
{
    self._id_9D25 = 1;
    self._id_107F7 = gettime();
}

_id_C4B3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = self._id_164D[self._id_238F]._id_4BC0;
    var_11 = anim._id_2303[self._id_238F]._id_10E2F[var_10];

    if ( scripts\asm\asm_mp::_id_2382( self._id_238F, var_11 ) )
        scripts\asm\asm::_id_231E( self._id_238F, var_11, var_10 );

    if ( isdefined( self._id_C026 ) )
        return;

    var_12 = self;
    self._id_2C09 = self cloneagent( var_8 );

    if ( _id_FF32( self ) )
        _id_5793( self._id_2C09 );
    else
        thread _id_5124( self._id_2C09, var_6, var_5, var_4, var_0, var_3 );
}

_id_FF32( var_0 )
{
    if ( isdefined( var_0._id_5793 ) && var_0._id_5793 )
        return 1;

    return 0;
}

_id_5793( var_0 )
{
    if ( isdefined( var_0 ) )
        var_0 startragdoll();
}

_id_5124( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_0 ) )
    {
        var_6 = var_0 _meth_8112();

        if ( animhasnotetrack( var_6, "ignore_ragdoll" ) )
            return;
    }

    if ( isdefined( level._id_C08A ) && level._id_C08A.size )
    {
        foreach ( var_8 in level._id_C08A )
        {
            if ( distancesquared( var_0.origin, var_8.origin ) < 65536 )
                return;
        }
    }

    wait 0.2;

    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 _meth_81B7() )
        return;

    var_6 = var_0 _meth_8112();
    var_10 = 0.35;

    if ( animhasnotetrack( var_6, "start_ragdoll" ) )
    {
        var_11 = getnotetracktimes( var_6, "start_ragdoll" );

        if ( isdefined( var_11 ) )
            var_10 = var_11[0];
    }

    var_12 = var_10 * getanimlength( var_6 ) - 0.2;

    if ( var_12 > 0 )
        wait( var_12 );

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0.ragdollhitloc ) && isdefined( var_0.ragdollimpactvector ) )
            var_0 _meth_839B( var_0.ragdollhitloc, var_0.ragdollimpactvector );
        else
            var_0 startragdoll();
    }
}

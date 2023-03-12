// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

agentfunc( var_0 )
{
    return level.agent_funcs[self.agent_type][var_0];
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

_id_97C2()
{
    self.agent_type = "player";
    self.pers = [];
    self._id_8BE2 = 0;
    self._id_9D25 = 0;
    self._id_9D2B = 1;
    self._id_1391E = 0;
    self._id_10916 = 0;
    self.entity_number = self getentitynumber();
    self._id_18FE = 0;
    self._id_18F2 = 0;
    self._id_001F = undefined;
    self detachall();
    _id_98BB( 0 );
}

_id_98BB( var_0 )
{
    if ( !var_0 )
    {
        self.class = undefined;
        self._id_A95C = undefined;
        self._id_BCF6 = undefined;
        self._id_26B9 = undefined;
        self.guid = undefined;
        self.name = undefined;
        self._id_EB6A = undefined;
        self._id_CA5B = undefined;
        self._id_13CA0 = undefined;
        self._id_C47E = undefined;
        self._id_C2AD = undefined;
        self._id_11A46 = undefined;
        self.carryobject = undefined;
        self._id_3FFA = undefined;
        self._id_38ED = undefined;
        self._id_A64F = undefined;
        self._id_0291 = undefined;
        self.sessionstate = undefined;
        self.lastspawntime = undefined;
        self._id_A9F4 = undefined;
        self._id_55E6 = undefined;
        self._id_55E9 = undefined;
        self._id_55D9 = undefined;
        self._id_55E4 = undefined;
        self._id_FC96 = undefined;
        self._id_FC95 = undefined;
        self._id_DDCC = undefined;
    }
    else
    {
        self._id_BCF6 = 1;
        self._id_26B9 = 4;
        self.guid = scripts\mp\utility\game::_id_81EC();
        self.name = self.guid;
        self._id_0291 = self.team;
        self.sessionstate = "playing";
        self._id_FC96 = 0;
        self._id_FC95 = 0;
        self._id_DDCC = 0;
        self._id_18F2 = 1;
        scripts\mp\playerlogic::_id_FAE7();
        thread scripts\mp\perks::onplayerspawned();

        if ( scripts\mp\utility\game::_id_9E0E( self ) )
        {
            self._id_C2AD = 1;
            scripts\mp\gameobjects::_id_96DF();
            self._id_55E6 = 0;
            self._id_55E9 = 0;
            self._id_55D9 = 0;
        }
    }

    self._id_55E4 = 1;
}

_id_7EC5( var_0 )
{
    var_1 = undefined;

    if ( isdefined( level.agentarray ) )
    {
        foreach ( var_3 in level.agentarray )
        {
            if ( !isdefined( var_3._id_9D25 ) || !var_3._id_9D25 )
            {
                if ( isdefined( var_3._id_136FD ) && var_3._id_136FD )
                    continue;

                var_1 = var_3;
                var_1 _id_97C2();

                if ( isdefined( var_0 ) )
                    var_1.agent_type = var_0;

                break;
            }
        }
    }

    return var_1;
}

_id_1601()
{
    self._id_9D25 = 1;
}

deactivateagent()
{
    thread _id_4DDC();
}

_id_4DDC()
{
    self notify( "deactivateAgentDelayed" );
    self endon( "deactivateAgentDelayed" );

    if ( scripts\mp\utility\game::_id_9E0E( self ) )
        scripts\mp\spawnlogic::_id_E113();

    scripts\mp\spawnlogic::_id_E106();
    wait 0.05;
    self._id_9D25 = 0;
    self._id_8BE2 = 0;
    self.owner = undefined;
    self.connecttime = undefined;
    self._id_136FD = undefined;

    foreach ( var_1 in level._id_3CB5 )
    {
        if ( isdefined( var_1.attackers ) )
        {
            foreach ( var_4, var_3 in var_1.attackers )
            {
                if ( var_3 == self )
                    var_1.attackers[var_4] = undefined;
            }
        }
    }

    if ( isdefined( self._id_8C98 ) )
    {
        self _meth_8096( self._id_8C98 );
        self._id_8C98 = undefined;
    }

    self notify( "disconnect" );
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

_id_8010( var_0 )
{
    return _id_8011( var_0, "all" );
}

_id_8011( var_0, var_1 )
{
    var_2 = 0;

    if ( !isdefined( level.agentarray ) )
        return var_2;

    foreach ( var_4 in level.agentarray )
    {
        if ( isdefined( var_4._id_9D25 ) && var_4._id_9D25 )
        {
            if ( isdefined( var_4.owner ) && var_4.owner == var_0 )
            {
                if ( var_1 == "all" && var_4.agent_type != "alien" || var_4.agent_type == var_1 )
                    var_2++;
            }
        }
    }

    return var_2;
}

_id_8012( var_0, var_1 )
{
    var_2 = 0;

    if ( !isdefined( level.agentarray ) )
        return var_2;

    foreach ( var_4 in level.agentarray )
    {
        if ( isdefined( var_4._id_9D25 ) && var_4._id_9D25 )
        {
            if ( isdefined( var_4.team ) && var_4.team == var_0 )
            {
                if ( var_1 == "all" && var_4.agent_type != "alien" || var_4.agent_type == var_1 )
                    var_2++;
            }
        }
    }

    return var_2;
}

_id_81FB( var_0, var_1 )
{
    var_2 = getnodesinradius( self.origin, 350, 64, 128, "Path" );

    if ( !isdefined( var_2 ) || var_2.size == 0 )
        return undefined;

    if ( isdefined( level._id_13BBA ) && isdefined( level._id_127CE ) )
    {
        var_3 = var_2;
        var_2 = [];

        foreach ( var_5 in var_3 )
        {
            if ( var_5.origin[2] > level._id_13BBA || !ispointinvolume( var_5.origin, level._id_127CE ) )
                var_2[var_2.size] = var_5;
        }
    }

    var_7 = anglestoforward( self.angles );
    var_8 = -10;
    var_9 = scripts\mp\spawnlogic::_id_8083( self );
    var_10 = ( 0, 0, var_9 );

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_11 = [];
    var_12 = [];

    foreach ( var_14 in var_2 )
    {
        if ( !var_14 doesnodeallowstance( "stand" ) || isdefined( var_14._id_BFDB ) )
            continue;

        var_15 = vectornormalize( var_14.origin - self.origin );
        var_16 = vectordot( var_7, var_15 );

        for ( var_17 = 0; var_17 < var_12.size; var_17++ )
        {
            if ( var_16 > var_12[var_17] )
            {
                for ( var_18 = var_12.size; var_18 > var_17; var_18-- )
                {
                    var_12[var_18] = var_12[var_18 - 1];
                    var_11[var_18] = var_11[var_18 - 1];
                }

                break;
            }
        }

        var_11[var_17] = var_14;
        var_12[var_17] = var_16;
    }

    for ( var_17 = 0; var_17 < var_11.size; var_17++ )
    {
        var_14 = var_11[var_17];
        var_20 = self.origin + var_10;
        var_21 = var_14.origin + var_10;

        if ( var_17 > 0 )
            wait 0.05;

        if ( !sighttracepassed( var_20, var_21, 0, self ) )
            continue;

        if ( var_1 )
        {
            if ( var_17 > 0 )
                wait 0.05;

            var_22 = playerphysicstrace( var_14.origin + var_10, var_14.origin );

            if ( distancesquared( var_22, var_14.origin ) > 1 )
                continue;
        }

        if ( var_0 )
        {
            if ( var_17 > 0 )
                wait 0.05;

            var_22 = _func_16D( var_20, var_21 );

            if ( distancesquared( var_22, var_21 ) > 1 )
                continue;
        }

        return var_14;
    }
}

_id_A632( var_0 )
{
    var_0 _meth_80B0( var_0.health + 500000, var_0.origin );
}

_id_A649()
{
    self [[ agentfunc( "on_damaged" ) ]]( level, undefined, self.health + 1, 0, "MOD_CRUSH", "none", ( 0, 0, 0 ), ( 0, 0, 0 ), "none", 0 );
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

codecallback_agentadded()
{
    self [[ level._id_97C2 ]]();
    var_0 = "axis";

    if ( level.numagents % 2 == 0 )
        var_0 = "allies";

    level.numagents++;
    self sethitlocdamagetable( "locdmgtable/mp_lochit_dmgtable" );
    self [[ level._id_F635 ]]( var_0 );
    level.agentarray[level.agentarray.size] = self;
}

codecallback_agentdamaged( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 )
{
    var_1 = [[ level._id_190A ]]( var_1 );
    var_12 = self [[ level.agentfunc ]]( "on_damaged" );

    if ( isdefined( var_12 ) )
        self [[ var_12 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11 );
}

_id_00A5( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    if ( isdefined( level.callbackplayerimpaled ) )
        [[ level.callbackplayerimpaled ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 );
}

codecallback_agentkilled( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_1 = [[ level._id_190A ]]( var_1 );
    var_10 = self [[ level.agentfunc ]]( "on_killed" );

    if ( isdefined( var_10 ) )
        self thread [[ var_10 ]]( var_0, var_1, var_2, var_4, var_5, var_6, var_7, var_8, var_9 );
}

_id_00A7( var_0, var_1, var_2, var_3 )
{

}

_id_00A8( var_0, var_1 )
{

}

_id_00A9( var_0, var_1, var_2, var_3 )
{

}

init()
{
    initagentlevelvariables();
    scripts\anim\notetracks_mp::registernotetracks();
    level thread add_agents_to_game();
}

_id_4535( var_0, var_1, var_2 )
{
    var_3 = [[ level._id_7EC5 ]]( var_0 );

    if ( isdefined( var_3 ) )
    {
        var_3.connecttime = gettime();

        if ( isdefined( var_1 ) )
            var_3 [[ level._id_F635 ]]( var_1 );
        else
            var_3 [[ level._id_F635 ]]( var_3.team );

        if ( isdefined( var_2 ) )
            var_3.class_override = var_2;

        if ( isdefined( level.agent_funcs[var_0]["onAIConnect"] ) )
            var_3 [[ var_3 [[ level.agentfunc ]]( "onAIConnect" ) ]]();

        var_3 [[ level._id_184B ]]();
    }

    return var_3;
}

initagentlevelvariables()
{
    level.agentarray = [];
    level.numagents = 0;
}

add_agents_to_game()
{
    level endon( "game_ended" );
    level waittill( "connected", var_0 );
    var_1 = getmaxagents();

    while ( level.agentarray.size < var_1 )
    {
        var_2 = addagent();

        if ( !isdefined( var_2 ) )
        {
            scripts\engine\utility::waitframe();
            continue;
        }
    }
}

set_agent_health( var_0 )
{
    self.agenthealth = var_0;
    self.health = var_0;
    self.maxhealth = var_0;
}

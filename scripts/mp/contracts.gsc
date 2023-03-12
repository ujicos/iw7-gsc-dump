// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( getdvarint( "mission_team_contracts_enabled", 0 ) == 0 )
        return;

    var_0 = spawnstruct();
    level.contractglobals = var_0;
    scripts\mp\contractchallenges::registercontractchallenges();
    var_0.numchallenges = 0;
    var_1 = 0;

    for (;;)
    {
        var_2 = tablelookupbyrow( "mp/contractChallenges.csv", var_1, 0 );

        if ( !isdefined( var_2 ) || var_2 == "" )
            break;

        var_0.numchallenges++;
        var_1++;
    }

    level thread _id_C56E();
}

contractsenabled()
{
    if ( isai( self ) )
        return 0;

    if ( !level.rankedmatch )
        return 0;

    if ( !scripts\mp\utility\game::_id_DCD5() )
        return 0;

    if ( getdvarint( "mission_team_contracts_enabled", 0 ) == 0 )
        return 0;

    return 1;
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !var_0 contractsenabled() )
            continue;

        var_0.contracts = [];
        var_1 = var_0 getchallengeids();

        foreach ( var_4, var_3 in var_1 )
            var_0 givecontractchallenge( var_3, var_4 );
    }
}

getchallengeids()
{
    var_0 = self getrankedplayerdata( "mp", "contracts", "challenges", 0, "challengeID" );
    var_1 = self getrankedplayerdata( "mp", "contracts", "challenges", 1, "challengeID" );
    return [ var_0, var_1 ];
}

givecontractchallenge( var_0, var_1 )
{
    var_2 = lookupcontractchallengeref( var_0 );

    if ( !isdefined( var_2 ) )
        return undefined;

    var_3 = spawnstruct();
    var_3._id_10307 = var_1;
    var_3._id_DE3F = var_2;
    var_3._id_0334 = lookupcontractchallengetarget( var_0 );
    var_3.team = lookupcontractchallengeteam( var_0 );
    var_3._id_92B8 = var_0;
    var_3._id_D9D9 = self getrankedplayerdata( "mp", "contracts", "challenges", var_3._id_10307, "progress" );
    var_4 = self getrankedplayerdata( "mp", "activeMissionTeam" );
    var_5 = var_3.team == var_4 || var_3.team == -1;
    var_3.completed = var_3._id_D9D9 >= var_3._id_0334;

    if ( !var_3.completed && var_5 )
    {
        self thread [[ level.contractchallenges[var_3._id_DE3F] ]]( var_3 );
        self.contracts[var_1] = var_3;
    }
}

lookupcontractchallengeref( var_0 )
{
    var_1 = tablelookup( "mp/contractChallenges.csv", 0, var_0, 1 );

    if ( !isdefined( var_1 ) || var_1 == "" )
        return undefined;

    return var_1;
}

lookupcontractchallengetarget( var_0 )
{
    var_1 = tablelookup( "mp/contractChallenges.csv", 0, var_0, 3 );

    if ( !isdefined( var_1 ) || var_1 == "" )
        return undefined;

    return int( var_1 );
}

lookupcontractchallengeteam( var_0 )
{
    var_1 = tablelookup( "mp/contractChallenges.csv", 0, var_0, 2 );

    if ( !isdefined( var_1 ) || var_1 == "" )
        return undefined;

    return int( var_1 );
}

updatecontractprogress( var_0, var_1 )
{
    if ( !level.onlinegame )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_0._id_D9D9 += var_1;
    var_0._id_D9D9 = int( min( var_0._id_D9D9, var_0._id_0334 ) );

    if ( !var_0.completed )
    {
        var_0.completed = var_0._id_D9D9 >= var_0._id_0334;

        if ( var_0.completed )
        {
            var_2 = scripts\engine\utility::ter_op( var_0.team == -1, "contract_complete_joint_ops", "contract_complete_team_" + var_0.team );
            thread scripts\mp\hud_message::showsplash( var_2 );
            self setrankedplayerdata( "mp", "contracts", "challenges", var_0._id_10307, "completed", 1 );
        }
    }

    self setrankedplayerdata( "mp", "contracts", "challenges", var_0._id_10307, "progress", var_0._id_D9D9 );
}

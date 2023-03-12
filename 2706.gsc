// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_400C["class0"] = 0;
    level._id_400C["class1"] = 1;
    level._id_400C["class2"] = 2;
    level._id_400C["custom1"] = 0;
    level._id_400C["custom2"] = 1;
    level._id_400C["custom3"] = 2;
    level._id_400C["custom4"] = 3;
    level._id_400C["custom5"] = 4;
    level._id_400C["custom6"] = 5;
    level._id_400C["custom7"] = 6;
    level._id_400C["custom8"] = 7;
    level._id_400C["custom9"] = 8;
    level._id_400C["custom10"] = 9;
    level._id_400C["axis_recipe1"] = 0;
    level._id_400C["axis_recipe2"] = 1;
    level._id_400C["axis_recipe3"] = 2;
    level._id_400C["axis_recipe4"] = 3;
    level._id_400C["axis_recipe5"] = 4;
    level._id_400C["axis_recipe6"] = 5;
    level._id_400C["allies_recipe1"] = 0;
    level._id_400C["allies_recipe2"] = 1;
    level._id_400C["allies_recipe3"] = 2;
    level._id_400C["allies_recipe4"] = 3;
    level._id_400C["allies_recipe5"] = 4;
    level._id_400C["allies_recipe6"] = 5;
    level._id_400C["gamemode"] = 0;
    level._id_400C["callback"] = 0;
    level._id_400C["default1"] = 0;
    level._id_400C["default2"] = 1;
    level._id_400C["default3"] = 2;
    level._id_400C["default4"] = 3;
    level._id_400C["default5"] = 4;
    level._id_5034 = "CLASS_ASSAULT";
    level._id_4010 = "mp/classTable.csv";
    level thread _id_C572();
}

_id_7E2A( var_0 )
{
    return var_0;
}

_id_821E( var_0 )
{
    var_1 = strtok( var_0, "," );

    if ( var_1.size > 1 )
        return int( var_1[1] );
    else
        return 0;
}

_id_3689( var_0, var_1 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", var_0, "weaponSetups", var_1, "weapon" );
}

_id_368A( var_0, var_1, var_2 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", var_0, "weaponSetups", var_1, "attachment", var_2 );
}

_id_3692( var_0, var_1 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", var_0, "weaponSetups", var_1, "lootItemID" );
}

_id_3695( var_0, var_1 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", var_0, "weaponSetups", var_1, "variantID" );
}

_id_3691( var_0, var_1 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", var_0, "weaponSetups", var_1, "camo" );
}

_id_3694( var_0, var_1 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", var_0, "weaponSetups", var_1, "reticle" );
}

_id_367B( var_0 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "killstreakSetups", var_0, "killstreak" );
}

_id_3676()
{
    if ( isdefined( self._id_3C56 ) )
        return self._id_3C56._id_2123;

    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "archetype" );
}

_id_3682( var_0 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", var_0, "powerSetups", 0, "power" );
}

_id_3678( var_0 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", var_0, "powerSetups", 0, "extraCharge" );
}

_id_3684( var_0 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", var_0, "powerSetups", 1, "power" );
}

_id_3679( var_0 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", var_0, "powerSetups", 1, "extraCharge" );
}

_id_3683( var_0 )
{
    var_1 = self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", var_0, "powerSetups", 0, "lootItemID" );
    return _id_0AE1::_id_804B( var_1 );
}

_id_3685( var_0 )
{
    var_1 = self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", var_0, "powerSetups", 1, "lootItemID" );
    return _id_0AE1::_id_804B( var_1 );
}

_id_3688()
{
    if ( isdefined( self._id_3C56 ) )
        return self._id_3C56._id_11234;

    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "archetypeSuper" );
}

_id_367A()
{
    var_0 = "none";

    if ( isdefined( self._id_3C56 ) )
    {
        var_1 = level._id_2127[self._id_3C56._id_2123];

        if ( level.rankedmatch )
            var_0 = self getrankedplayerdata( "rankedloadouts", "squadMembers", "archetypePreferences", var_1, "gesture" );
        else
            var_0 = self getrankedplayerdata( "privateloadouts", "squadMembers", "archetypePreferences", var_1, "gesture" );
    }
    else if ( level.rankedmatch )
        var_0 = self getrankedplayerdata( "rankedloadouts", "squadMembers", "gesture" );
    else
        var_0 = self getrankedplayerdata( "privateloadouts", "squadMembers", "gesture" );

    return scripts\mp\gestures::_id_7ED0( var_0 );
}

_id_3680( var_0, var_1 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", var_0, "loadoutPerks", var_1 );
}

_id_367F( var_0, var_1 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", var_0, "extraPerks", var_1 );
}

_id_367E()
{
    if ( isdefined( self._id_3C56 ) )
        return self._id_3C56._id_11B2C;

    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "archetypePerk" );
}

_id_367C( var_0, var_1 )
{
    var_2 = self getrankedplayerdata( level._id_AEA6, "squadMembers", "killstreakSetups", var_1, "lootItemID" );
    return _id_0AC7::_id_804B( var_2 );
}

cac_getkillstreakvariantid( var_0 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "killstreakSetups", var_0, "lootItemID" );
}

cac_getweaponcosmeticattachment( var_0, var_1 )
{
    return self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", var_0, "weaponSetups", var_1, "cosmeticAttachment" );
}

_id_DDD5( var_0, var_1, var_2 )
{
    return scripts\mp\utility\game::_id_7F91( "defaultClasses", var_0, var_1, "class", "kilstreakSetups", var_2, "killstreak" );
}

_id_113B3( var_0, var_1 )
{
    return tablelookup( var_0, 0, "loadoutArchetype", var_1 + 1 );
}

_id_113C0( var_0, var_1, var_2 )
{
    if ( var_2 == 0 )
        return tablelookup( var_0, 0, "loadoutPrimary", var_1 + 1 );
    else
        return tablelookup( var_0, 0, "loadoutSecondary", var_1 + 1 );
}

_id_113C1( var_0, var_1, var_2, var_3 )
{
    var_4 = "none";

    if ( var_2 == 0 )
        var_4 = tablelookup( var_0, 0, "loadoutPrimaryAttachment" + ( var_3 + 1 ), var_1 + 1 );
    else
        var_4 = tablelookup( var_0, 0, "loadoutSecondaryAttachment" + ( var_3 + 1 ), var_1 + 1 );

    if ( var_4 == "" || var_4 == "none" )
        return "none";
    else
        return var_4;
}

_id_113C3( var_0, var_1, var_2 )
{
    if ( var_2 == 0 )
        return tablelookup( var_0, 0, "loadoutPrimaryCamo", var_1 + 1 );
    else
        return tablelookup( var_0, 0, "loadoutSecondaryCamo", var_1 + 1 );
}

_id_113C4( var_0, var_1, var_2 )
{
    if ( var_2 == 0 )
        return tablelookup( var_0, 0, "loadoutPrimaryReticle", var_1 + 1 );
    else
        return tablelookup( var_0, 0, "loadoutSecondaryReticle", var_1 + 1 );
}

_id_113BB( var_0, var_1, var_2 )
{
    return tablelookup( var_0, 0, "loadoutPerk" + ( var_2 + 1 ), var_1 + 1 );
}

table_getextraperk( var_0, var_1, var_2 )
{
    return tablelookup( var_0, 0, "loadoutExtraPerk" + ( var_2 + 1 ), var_1 + 1 );
}

_id_113BC( var_0, var_1 )
{
    return tablelookup( var_0, 0, "loadoutPowerPrimary", var_1 + 1 );
}

_id_113B6( var_0, var_1 )
{
    var_2 = tablelookup( var_0, 0, "loadoutExtraPowerPrimary", var_1 + 1 );
    return isdefined( var_2 ) && var_2 == "TRUE";
}

_id_113BD( var_0, var_1 )
{
    return tablelookup( var_0, 0, "loadoutPowerSecondary", var_1 + 1 );
}

_id_113B7( var_0, var_1 )
{
    var_2 = tablelookup( var_0, 0, "loadoutExtraPowerSecondary", var_1 + 1 );
    return isdefined( var_2 ) && var_2 == "TRUE";
}

_id_113BE( var_0, var_1 )
{
    return tablelookup( var_0, 0, "loadoutSuper", var_1 + 1 );
}

_id_113B8( var_0, var_1 )
{
    return tablelookup( var_0, 0, "loadoutGesture", var_1 + 1 );
}

_id_113B9( var_0, var_1, var_2 )
{
    return tablelookup( var_0, 0, "loadoutStreak" + var_2, var_1 + 1 );
}

_id_AE33( var_0 )
{
    var_1 = undefined;

    switch ( var_0 )
    {
        case "streaktype_support":
            var_1 = "support";
            break;
        case "streaktype_specialist":
            var_1 = "specialist";
            break;
        case "streaktype_resource":
            var_1 = "resource";
            break;
        default:
            var_1 = "assault";
    }

    return var_1;
}

_id_7F7C( var_0 )
{
    if ( !isdefined( var_0 ) )
        return "streaktype_assault";

    switch ( var_0 )
    {
        case "support":
            return "streaktype_support";
        case "specialist":
            return "streaktype_specialist";
        case "assault":
            return "streaktype_assault";
        default:
            return "streaktype_assault";
    }
}

_id_AE32( var_0 )
{
    var_1 = undefined;

    if ( issubstr( var_0, "axis" ) )
        var_1 = "axis";
    else if ( issubstr( var_0, "allies" ) )
        var_1 = "allies";
    else
        var_1 = "none";

    return var_1;
}

_id_AE23()
{
    self.health = self.maxhealth;
    thread scripts\mp\utility\game::_id_DDD9( scripts\mp\utility\game::isjuggernaut() );
    self.isjuggernaut = 1;
}

_id_AE3E()
{
    self notify( "lost_juggernaut" );
    self.isjuggernaut = 0;
    self._id_BCF6 = 1;
}

_id_AE26()
{
    self takeallweapons();
    scripts\mp\perks\weaponpassives::resetmodeswitchkillweapons( self );
    _id_11D7();
    _id_0AE2::_id_110C2();
    _id_0AE2::_id_41D0();

    if ( isdefined( self._id_AE62 ) )
        _id_41D8();

    scripts\mp\archetypes\archcommon::_id_E0D0( self._id_AE62 );
    scripts\mp\perks::_id_11AA();
    scripts\mp\perks\weaponpassives::_id_72FB();
    scripts\mp\gestures::_id_41B2();
    _id_E243();
    _id_E250();

    if ( isplayer( self ) )
        scripts\mp\killstreaks\emp_common::_id_E24E();
}

_id_AE31()
{
    var_0 = spawnstruct();
    var_0._id_AE62 = "none";
    var_0._id_AE7F = "none";
    var_0._id_AE86 = [];

    for ( var_1 = 0; var_1 < 6; var_1++ )
        var_0._id_AE86[var_1] = "none";

    var_0._id_AE88 = "none";
    var_0._id_AE90 = "none";
    var_0._id_AE8A = 0;
    var_0._id_AE91 = -1;
    var_0.loadoutprimarycosmeticattachment = "none";
    var_0._id_AE94 = "none";
    var_0._id_AE9A = [];

    for ( var_1 = 0; var_1 < 5; var_1++ )
        var_0._id_AE9A[var_1] = "none";

    var_0._id_AE9C = "none";
    var_0._id_AEA4 = "none";
    var_0._id_AE9E = 0;
    var_0._id_AEA5 = -1;
    var_0.loadoutsecondarycosmeticattachment = "none";
    var_0._id_AE7A = 0;
    var_0._id_AE79 = [];
    var_0._id_AEA7 = [];
    var_0._id_AE66 = [];
    var_0._id_AE92 = "specialty_null";
    var_0._id_AE7B = "none";
    var_0._id_AE7C = [];
    var_0._id_AE67 = 0;
    var_0._id_AE7D = "none";
    var_0._id_AE7E = [];
    var_0._id_AE68 = 0;
    var_0._id_AEAA = "none";
    var_0._id_AE6C = "none";
    var_0._id_AEA8 = 0;
    var_0._id_AEA9 = "streaktype_assault";
    var_0._id_AE6E = "none";
    var_0.loadoutkillstreak1variantid = -1;
    var_0._id_AE6F = [];
    var_0._id_AE70 = "none";
    var_0.loadoutkillstreak2variantid = -1;
    var_0._id_AE71 = [];
    var_0._id_AE72 = "none";
    var_0.loadoutkillstreak3variantid = -1;
    var_0._id_AE73 = [];
    return var_0;
}

_id_AE52( var_0, var_1, var_2 )
{
    var_2 = _id_AE32( var_1 );
    var_3 = scripts\mp\utility\game::_id_7E2B( var_1 );
    self._id_4006 = var_3;
    self._id_4012 = var_2;
    var_0._id_AE62 = scripts\mp\utility\game::_id_7F91( "defaultClasses", var_2, var_3, "class", "archetype" );
    var_0._id_AE7F = scripts\mp\utility\game::_id_7F91( "defaultClasses", var_2, var_3, "class", "weaponSetups", 0, "weapon" );

    if ( var_0._id_AE7F == "none" )
        var_0._id_AE7F = "iw7_fists";
    else
    {
        for ( var_4 = 0; var_4 < 6; var_4++ )
            var_0._id_AE86[var_4] = scripts\mp\utility\game::_id_7F91( "defaultClasses", var_2, var_3, "class", "weaponSetups", 0, "attachment", var_4 );
    }

    var_0._id_AE88 = scripts\mp\utility\game::_id_7F91( "defaultClasses", var_2, var_3, "class", "weaponSetups", 0, "camo" );
    var_0._id_AE90 = scripts\mp\utility\game::_id_7F91( "defaultClasses", var_2, var_3, "class", "weaponSetups", 0, "reticle" );
    var_0._id_AE94 = scripts\mp\utility\game::_id_7F91( "defaultClasses", var_2, var_3, "class", "weaponSetups", 1, "weapon" );

    for ( var_4 = 0; var_4 < 5; var_4++ )
        var_0._id_AE9A[var_4] = scripts\mp\utility\game::_id_7F91( "defaultClasses", var_2, var_3, "class", "weaponSetups", 1, "attachment", var_4 );

    var_0._id_AE9C = scripts\mp\utility\game::_id_7F91( "defaultClasses", var_2, var_3, "class", "weaponSetups", 1, "camo" );
    var_0._id_AEA4 = scripts\mp\utility\game::_id_7F91( "defaultClasses", var_2, var_3, "class", "weaponSetups", 1, "reticle" );
    var_0._id_AE7B = "none";
    var_0._id_AE67 = 0;
    var_0._id_AE7D = "none";
    var_0._id_AE68 = 0;
    var_0._id_AEAA = "none";
    var_0._id_AE6C = scripts\mp\utility\game::_id_7F91( "defaultClasses", var_2, var_3, "class", "gesture" );
    var_0._id_AEA8 = 1;
    var_0._id_AE6E = _id_DDD5( var_2, var_3, 0 );
    var_0._id_AE70 = _id_DDD5( var_2, var_3, 1 );
    var_0._id_AE72 = _id_DDD5( var_2, var_3, 2 );
    var_0._id_AE6F = [];
    var_0._id_AE71 = [];
    var_0._id_AE73 = [];
    var_0._id_AE7C = [];
    var_0._id_AE7E = [];
    var_0.loadoutkillstreak1variantid = -1;
    var_0.loadoutkillstreak2variantid = -1;
    var_0.loadoutkillstreak3variantid = -1;

    if ( scripts\mp\utility\game::_id_7F91( "defaultClasses", var_2, var_3, "juggernaut" ) )
        _id_AE23();
    else if ( scripts\mp\utility\game::isjuggernaut() )
        _id_AE3E();
}

_id_AE4A( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_7E2B( var_1 );
    self._id_4006 = var_2;
    var_0._id_AE62 = _id_3676();
    var_0._id_AE7F = _id_3689( var_2, 0 );

    for ( var_3 = 0; var_3 < 6; var_3++ )
        var_0._id_AE86[var_3] = _id_368A( var_2, 0, var_3 );

    var_0._id_AE88 = _id_3691( var_2, 0 );
    var_0._id_AE90 = _id_3694( var_2, 0 );
    var_0._id_AE8A = _id_3692( var_2, 0 );
    var_0._id_AE91 = _id_3695( var_2, 0 );
    var_0.loadoutprimarycosmeticattachment = cac_getweaponcosmeticattachment( var_2, 0 );
    var_0._id_AE94 = _id_3689( var_2, 1 );

    for ( var_3 = 0; var_3 < 5; var_3++ )
        var_0._id_AE9A[var_3] = _id_368A( var_2, 1, var_3 );

    var_0._id_AE9C = _id_3691( var_2, 1 );
    var_0._id_AEA4 = _id_3694( var_2, 1 );
    var_0._id_AE9E = _id_3692( var_2, 1 );
    var_0._id_AEA5 = _id_3695( var_2, 1 );
    var_0.loadoutsecondarycosmeticattachment = cac_getweaponcosmeticattachment( var_2, 1 );
    var_0._id_AE7B = _id_3682( var_2 );
    var_0._id_AE7C = _id_3683( var_2 );
    var_0._id_AE67 = _id_3678( var_2 );
    var_0._id_AE7D = _id_3684( var_2 );
    var_0._id_AE7E = _id_3685( var_2 );
    var_0._id_AE68 = _id_3679( var_2 );
    var_0._id_AEAA = _id_3688();
    var_0._id_AE6C = _id_367A();
    var_0._id_AEA8 = 1;
    var_0._id_AE6E = _id_367B( 0 );
    var_0._id_AE6F = _id_367C( var_2, 0 );
    var_0.loadoutkillstreak1variantid = cac_getkillstreakvariantid( 0 );
    var_0._id_AE70 = _id_367B( 1 );
    var_0._id_AE71 = _id_367C( var_2, 1 );
    var_0.loadoutkillstreak2variantid = cac_getkillstreakvariantid( 1 );
    var_0._id_AE72 = _id_367B( 2 );
    var_0._id_AE73 = _id_367C( var_2, 2 );
    var_0.loadoutkillstreak3variantid = cac_getkillstreakvariantid( 2 );
}

_id_AE4E( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_7E2B( var_1 );
    self._id_4006 = var_2;
    var_3 = self.pers["gamemodeLoadout"];

    if ( isdefined( var_3["loadoutArchetype"] ) )
    {
        var_0._id_AE62 = var_3["loadoutArchetype"];

        if ( isbot( self ) )
            self._id_2ED8 = var_3["loadoutArchetype"];
    }
    else if ( isbot( self ) )
    {
        var_4 = scripts\mp\bots\bots_loadout::_id_2E05();
        var_0._id_AE62 = var_4["loadoutArchetype"];
    }
    else
        var_0._id_AE62 = _id_3676();

    if ( isdefined( var_3["loadoutRigTrait"] ) )
        var_0._id_AE92 = var_3["loadoutRigTrait"];

    if ( isdefined( var_3["loadoutPrimary"] ) )
        var_0._id_AE7F = var_3["loadoutPrimary"];

    for ( var_5 = 0; var_5 < 6; var_5++ )
    {
        var_6 = _id_7DE0( var_5, "primary" );

        if ( isdefined( var_3[var_6] ) )
            var_0._id_AE86[var_5] = var_3[var_6];
    }

    if ( isdefined( var_3["loadoutPrimaryCamo"] ) )
        var_0._id_AE88 = var_3["loadoutPrimaryCamo"];

    if ( isdefined( var_3["loadoutPrimaryReticle"] ) )
        var_0._id_AE90 = var_3["loadoutPrimaryReticle"];

    if ( isdefined( var_3["loadoutSecondary"] ) )
        var_0._id_AE94 = var_3["loadoutSecondary"];

    for ( var_5 = 0; var_5 < 5; var_5++ )
    {
        var_6 = _id_7DE0( var_5, "secondary" );

        if ( isdefined( var_3[var_6] ) )
            var_0._id_AE9A[var_5] = var_3[var_6];
    }

    if ( isdefined( var_3["loadoutSecondaryCamo"] ) )
        var_0._id_AE9C = var_3["loadoutSecondaryCamo"];

    if ( isdefined( var_3["loadoutSecondaryReticle"] ) )
        var_0._id_AEA4 = var_3["loadoutSecondaryReticle"];

    var_0._id_AE7A = isdefined( var_3["loadoutPerks"] );

    if ( isdefined( var_3["loadoutPerks"] ) )
        var_0._id_AE79 = var_3["loadoutPerks"];

    if ( isdefined( var_3["loadoutPowerPrimary"] ) )
        var_0._id_AE7B = var_3["loadoutPowerPrimary"];

    if ( isdefined( var_3["loadoutExtraPowerPrimary"] ) )
        var_0._id_AE67 = var_3["loadoutExtraPowerPrimary"];

    if ( isdefined( var_3["loadoutPowerPrimaryPassives"] ) )
        var_0._id_AE7C = var_3["loadoutPowerPrimaryPassives"];

    if ( isdefined( var_3["loadoutPowerSecondary"] ) )
        var_0._id_AE7D = var_3["loadoutPowerSecondary"];

    if ( isdefined( var_3["loadoutExtraPowerSecondary"] ) )
        var_0._id_AE68 = var_3["loadoutExtraPowerSecondary"];

    if ( isdefined( var_3["loadoutPowerSecondaryPassives"] ) )
        var_0._id_AE7E = var_3["loadoutPowerSecondaryPassives"];

    if ( isdefined( var_3["loadoutSuper"] ) )
        var_0._id_AEAA = var_3["loadoutSuper"];

    if ( isdefined( var_3["loadoutGesture"] ) && var_3["loadoutGesture"] == "playerData" )
    {
        if ( isbot( self ) )
            var_0._id_AE6C = "none";
        else
            var_0._id_AE6C = _id_367A();
    }
    else if ( isdefined( var_3["loadoutGesture"] ) )
        var_0._id_AE6C = var_3["loadoutGesture"];

    if ( isdefined( var_3["loadoutKillstreak1"] ) && var_3["loadoutKillstreak1"] != "specialty_null" || isdefined( var_3["loadoutKillstreak2"] ) && var_3["loadoutKillstreak2"] != "specialty_null" || isdefined( var_3["loadoutKillstreak3"] ) && var_3["loadoutKillstreak3"] != "specialty_null" )
    {
        var_0._id_AEA8 = 1;
        var_0._id_AE6E = var_3["loadoutKillstreak1"];
        var_0._id_AE70 = var_3["loadoutKillstreak2"];
        var_0._id_AE72 = var_3["loadoutKillstreak3"];

        if ( isdefined( var_3["loadoutKillstreak1Passives"] ) )
            var_0._id_AE6F = var_3["loadoutKillstreak1Passives"];

        if ( isdefined( var_3["loadoutKillstreak2Passives"] ) )
            var_0._id_AE71 = var_3["loadoutKillstreak2Passives"];

        if ( isdefined( var_3["loadoutKillstreak3Passives"] ) )
            var_0._id_AE73 = var_3["loadoutKillstreak3Passives"];
    }

    if ( var_3["loadoutJuggernaut"] )
        _id_AE23();
    else if ( scripts\mp\utility\game::isjuggernaut() )
        _id_AE3E();
}

_id_AE50( var_0 )
{
    var_0._id_AE7F = "iw7_chargeshot_c8";
    var_0._id_AE94 = "iw7_c8landing";
}

_id_AE49( var_0 )
{
    if ( !isdefined( self._id_4009 ) )
        scripts\engine\utility::_id_66BD( "self.classCallback function reference required for class 'callback'" );

    var_1 = self [[ self._id_4009 ]]();

    if ( !isdefined( var_1 ) )
        scripts\engine\utility::_id_66BD( "array required from self.classCallback for class 'callback'" );

    if ( isdefined( var_1["loadoutArchetype"] ) )
        var_0._id_AE62 = var_1["loadoutArchetype"];

    if ( isdefined( var_1["loadoutPrimary"] ) )
        var_0._id_AE7F = var_1["loadoutPrimary"];

    for ( var_2 = 0; var_2 < 6; var_2++ )
    {
        var_3 = _id_7DE0( var_2, "primary" );

        if ( isdefined( var_1[var_3] ) )
            var_0._id_AE86[var_2] = var_1[var_3];
    }

    if ( isdefined( var_1["loadoutPrimaryCamo"] ) )
        var_0._id_AE88 = var_1["loadoutPrimaryCamo"];

    if ( isdefined( var_1["loadoutPrimaryReticle"] ) )
        var_0._id_AE90 = var_1["loadoutPrimaryReticle"];

    if ( isdefined( var_1["loadoutSecondary"] ) )
        var_0._id_AE94 = var_1["loadoutSecondary"];

    for ( var_2 = 0; var_2 < 5; var_2++ )
    {
        var_3 = _id_7DE0( var_2, "secondary" );

        if ( isdefined( var_1[var_3] ) )
            var_0._id_AE9A[var_2] = var_1[var_3];
    }

    if ( isdefined( var_1["loadoutSecondaryCamo"] ) )
        var_0._id_AE9C = var_1["loadoutSecondaryCamo"];

    if ( isdefined( var_1["loadoutSecondaryReticle"] ) )
        var_0._id_AEA4 = var_1["loadoutSecondaryReticle"];

    if ( isdefined( var_1["loadoutPowerPrimary"] ) )
        var_0._id_AE7B = var_1["loadoutPowerPrimary"];

    if ( isdefined( var_1["loadoutPowerPrimaryPassives"] ) )
        var_0._id_AE7C = var_1["loadoutPowerPrimaryPassives"];

    if ( isdefined( var_1["loadoutExtraPowerPrimary"] ) )
        var_0._id_AE67 = var_1["loadoutExtraPowerPrimary"];

    if ( isdefined( var_1["loadoutPowerSecondary"] ) )
        var_0._id_AE7D = var_1["loadoutPowerSecondary"];

    if ( isdefined( var_1["loadoutPowerSecondaryPassives"] ) )
        var_0._id_AE7E = var_1["loadoutPowerSecondaryPassives"];

    if ( isdefined( var_1["loadoutExtraPowerSecondary"] ) )
        var_0._id_AE68 = var_1["loadoutPowerExtraSecondary"];

    if ( isdefined( var_1["loadoutSuper"] ) )
        var_0._id_AEAA = var_1["loadoutSuper"];

    if ( isdefined( var_1["loadoutGesture"] ) )
        var_0._id_AE6C = var_1["loadoutGesture"];

    var_0._id_AEA8 = isdefined( var_1["loadoutStreak1"] ) || isdefined( var_1["loadoutStreak2"] ) || isdefined( var_1["loadoutStreak3"] );

    if ( isdefined( var_1["loadoutStreakType"] ) )
        var_0._id_AEA9 = var_1["loadoutStreakType"];

    if ( isdefined( var_1["loadoutStreak1"] ) )
        var_0._id_AE6E = var_1["loadoutStreak1"];

    if ( isdefined( var_1["loadoutStreak2"] ) )
        var_0._id_AE70 = var_1["loadoutStreak2"];

    if ( isdefined( var_1["loadoutStreak3"] ) )
        var_0._id_AE72 = var_1["loadoutStreak3"];

    if ( isdefined( var_1["loadoutKillstreak1Passives"] ) )
        var_0._id_AE6F = var_1["loadoutKillstreak1Passives"];

    if ( isdefined( var_1["loadoutKillstreak2Passives"] ) )
        var_0._id_AE71 = var_1["loadoutKillstreak2Passives"];

    if ( isdefined( var_1["loadoutKillstreak3Passives"] ) )
        var_0._id_AE73 = var_1["loadoutKillstreak3Passives"];
}

_id_AE4B( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_7E2B( var_1 );
    self._id_4006 = var_2;
    var_0._id_AE7F = _id_113C0( level._id_4010, var_2, 0 );

    for ( var_3 = 0; var_3 < 6; var_3++ )
        var_0._id_AE86[var_3] = _id_113C1( level._id_4010, var_2, 0, var_3 );

    var_0._id_AE88 = _id_113C3( level._id_4010, var_2, 0 );
    var_0._id_AE90 = _id_113C4( level._id_4010, var_2, 0 );
    var_0._id_AE94 = _id_113C0( level._id_4010, var_2, 1 );

    for ( var_3 = 0; var_3 < 5; var_3++ )
        var_0._id_AE9A[var_3] = _id_113C1( level._id_4010, var_2, 1, var_3 );

    var_0._id_AE9C = _id_113C3( level._id_4010, var_2, 1 );
    var_0._id_AEA4 = _id_113C4( level._id_4010, var_2, 1 );
    var_0._id_AE7B = _id_113BC( level._id_4010, var_2 );
    var_0._id_AE67 = _id_113B6( level._id_4010, var_2 );
    var_0._id_AE7D = _id_113BD( level._id_4010, var_2 );
    var_0._id_AE68 = _id_113B7( level._id_4010, var_2 );
    var_0._id_AE6C = _id_113B8( level._id_4010, var_2 );
    var_0._id_AE62 = _id_3676();
    var_0._id_AEAA = _id_3688();
    var_0._id_AE6E = _id_367B( 0 );
    var_0._id_AE70 = _id_367B( 1 );
    var_0._id_AE72 = _id_367B( 2 );
    var_0._id_AE92 = _id_367E();
    var_0._id_AE6C = _id_367A();
}

_id_AE5D( var_0 )
{
    self._id_110F4 = "streaktype_assault";
    var_0._id_AEA9 = self._id_110F4;
}

_id_AE47( var_0, var_1 )
{
    if ( !isdefined( self.pers["loadoutPerks"] ) )
        self.pers["loadoutPerks"] = [];

    if ( !isdefined( self.pers["loadoutStandardPerks"] ) )
        self.pers["loadoutStandardPerks"] = [];

    if ( !isdefined( self.pers["loadoutExtraPerks"] ) )
        self.pers["loadoutExtraPerks"] = [];

    if ( !isdefined( self.pers["loadoutRigTrait"] ) )
        self.pers["loadoutRigTrait"] = [];

    if ( scripts\mp\utility\game::isjuggernaut() )
        return;

    var_2 = getsubstr( var_1, 0, 7 ) == "default";

    if ( var_0._id_AE7A )
        return;

    if ( !scripts\mp\utility\game::_id_CA5F() )
        return;
    else if ( isai( self ) )
    {
        if ( isdefined( self.pers["loadoutPerks"] ) )
            var_0._id_AE79 = self.pers["loadoutPerks"];
    }
    else if ( _id_8BDC() || _id_8BDB() )
    {
        var_3 = _id_AE32( var_1 );

        for ( var_4 = 0; var_4 < 3; var_4++ )
        {
            var_5 = "specialty_null";

            if ( var_3 != "none" )
            {
                var_6 = scripts\mp\utility\game::_id_7E2B( var_1 );
                var_5 = scripts\mp\utility\game::_id_7F91( "defaultClasses", var_3, var_6, "class", "loadoutPerks" );
            }
            else if ( var_2 )
            {
                var_6 = scripts\mp\utility\game::_id_7E2B( var_1 );
                var_5 = _id_113BB( level._id_4010, var_6, var_4 );
            }
            else
                var_5 = _id_3680( self._id_4006, var_4 );

            if ( var_5 != "specialty_null" )
            {
                var_0._id_AE79[var_0._id_AE79.size] = var_5;
                var_0._id_AEA7[var_0._id_AEA7.size] = var_5;
            }
        }

        for ( var_4 = 0; var_4 < 3; var_4++ )
        {
            var_5 = "specialty_null";

            if ( var_3 != "none" )
            {
                var_6 = scripts\mp\utility\game::_id_7E2B( var_1 );
                var_5 = scripts\mp\utility\game::_id_7F91( "defaultClasses", var_3, var_6, "class", "extraPerks" );
            }
            else if ( var_2 )
            {
                var_6 = scripts\mp\utility\game::_id_7E2B( var_1 );
                var_5 = table_getextraperk( level._id_4010, var_6, var_4 );
            }
            else
                var_5 = _id_367F( self._id_4006, var_4 );

            if ( var_5 != "specialty_null" )
            {
                var_0._id_AE79[var_0._id_AE79.size] = var_5;
                var_0._id_AE66[var_0._id_AE66.size] = var_5;
            }
        }

        var_5 = "specialty_null";

        if ( var_3 != "none" )
        {
            var_6 = scripts\mp\utility\game::_id_7E2B( var_1 );
            var_5 = scripts\mp\utility\game::_id_7F91( "defaultClasses", var_3, var_6, "class", "archetypePerk" );
        }
        else
            var_5 = _id_367E();

        if ( var_5 != "specialty_null" )
        {
            var_0._id_AE79[var_0._id_AE79.size] = var_5;
            self.pers["loadoutRigTrait"] = var_5;
            var_0._id_AE92 = var_5;
            return;
        }
    }
    else
    {
        var_0._id_AE79 = self.pers["loadoutPerks"];
        var_0._id_AEA7 = self.pers["loadoutStandardPerks"];
        var_0._id_AE66 = self.pers["loadoutExtraPerks"];
        var_0._id_AE92 = self.pers["loadoutRigTrait"];
        return;
    }
}

_id_AE48( var_0, var_1 )
{
    var_2 = _id_AE32( var_1 );

    if ( var_2 != "none" )
        _id_AE52( var_0, var_1 );
    else if ( issubstr( var_1, "custom" ) )
        _id_AE4A( var_0, var_1 );
    else if ( var_1 == "gamemode" )
        _id_AE4E( var_0, var_1 );
    else if ( var_1 == "rc8Agent" )
        _id_AE50( var_0 );
    else if ( var_1 == "callback" )
        _id_AE49( var_0 );
    else
        _id_AE4B( var_0, var_1 );

    _id_AE4D( var_0 );
    _id_AE5D( var_0 );
    _id_AE47( var_0, var_1 );
    var_0 = _id_AE5F( var_0, var_1 );
    return var_0;
}

_id_AE4D( var_0 )
{
    if ( var_0._id_AE7F == "none" )
        var_0._id_AE7F = "iw7_fists";

    if ( var_0._id_AE94 == "none" && var_0._id_AE7F != "iw7_fists" )
        var_0._id_AE94 = "iw7_fists";
    else if ( var_0._id_AE7F == "iw7_fists" && var_0._id_AE94 == "iw7_fists" )
        var_0._id_AE94 = "none";
}

_id_AE5F( var_0, var_1 )
{
    if ( issubstr( var_1, "custom" ) )
        return scripts\mp\validation::_id_13140( var_0 );

    return var_0;
}

_id_AE2E( var_0 )
{
    var_1 = getdvarint( "forceArchetype", 0 );

    if ( var_1 > 0 )
    {
        var_2 = getdvarint( "forceArchetype", 0 );

        switch ( var_2 )
        {
            case 1:
                var_0._id_AE62 = "archetype_assault";
                break;
            case 2:
                var_0._id_AE62 = "archetype_heavy";
                break;
            case 3:
                var_0._id_AE62 = "archetype_scout";
                break;
            case 4:
                var_0._id_AE62 = "archetype_assassin";
                break;
            case 5:
                var_0._id_AE62 = "archetype_engineer";
                break;
            case 6:
                var_0._id_AE62 = "archetype_sniper";
                break;
            case 7:
                var_0._id_AE62 = "archetype_reaper";
                break;
            default:
                var_0._id_AE62 = "archetype_assault";
                break;
        }
    }
    else if ( var_1 == -1 )
    {
        var_3 = [ "archetype_assault", "archetype_heavy", "archetype_scout", "archetype_assassin", "archetype_engineer", "archetype_sniper" ];
        var_4 = randomint( var_3.size );
        var_0._id_AE62 = var_3[var_4];
        self iprintlnbold( "Random Archetype: " + var_3[var_4] );
    }
}

_id_AE55( var_0 )
{
    if ( !scripts\engine\utility::_id_9CEE( self.btestclient ) )
    {
        if ( !isdefined( level.aonrules ) || level.aonrules == 0 )
        {

        }
    }

    self._id_AE62 = var_0._id_AE62;
    scripts\mp\weapons::_id_12ED5();
    var_1 = 1;
    var_2 = 2;
    var_3 = 4;
    var_4 = 8;
    var_5 = "defaultsuit_mp";
    var_6 = 0;
    var_7 = undefined;
    var_8 = undefined;
    var_9 = 400;
    var_10 = 400;
    var_11 = 900;

    if ( level.tactical )
    {
        var_10 = 133.333;
        var_11 = 1800;
    }

    switch ( self._id_AE62 )
    {
        case "archetype_assault":
            var_5 = "assault_mp";
            var_6 = var_1 | var_2 | var_3;
            var_7 = scripts\mp\archetypes\archassault::_id_20BB;
            var_8 = "vestlight";
            break;
        case "archetype_heavy":
            var_5 = "armor_mp";
            var_6 = var_1 | var_2 | var_3;
            var_7 = _id_0D6C::_id_20BB;
            var_8 = "vestheavy";
            break;
        case "archetype_scout":
            var_5 = "scout_mp";
            var_6 = var_1 | var_2 | var_3;
            var_7 = _id_0D6F::_id_20BB;
            var_8 = "c6servo";
            break;
        case "archetype_assassin":
            var_5 = "assassin_mp";
            var_6 = var_1 | var_2 | var_3;
            var_7 = _id_0D67::_id_20BB;
            var_8 = "vestftl";
            break;
        case "archetype_engineer":
            var_5 = "engineer_mp";
            var_6 = var_1 | var_2 | var_3;
            var_7 = _id_0D6B::_id_20BB;
            var_8 = "vestlight";
            break;
        case "archetype_sniper":
            var_5 = "sniper_mp";
            var_6 = var_1 | var_2 | var_3;
            var_7 = _id_0D70::_id_20BB;
            var_8 = "vestghost";
            break;
        default:
            if ( !scripts\engine\utility::_id_9CEE( self.btestclient ) )
            {
                if ( !isdefined( level.aonrules ) || level.aonrules == 0 )
                {

                }
            }

            break;
    }

    if ( level.tactical )
    {
        var_5 += "_tactical";
        var_1 = 0;
    }

    self _meth_845E( 0 );
    self _meth_8422( var_6 & var_1 );
    self _meth_8427( var_6 & var_2 );
    self _meth_8424( var_6 & var_3 );
    self _meth_8412( var_6 & var_4 );
    self _meth_800E( 0 );
    self _meth_845A( var_5 );
    self _meth_842E( 0, var_9 );
    self _meth_842C( 0, var_9 );
    self _meth_8434( 0, var_10 );
    self _meth_8430( 0, var_11 );
    self _meth_842E( 1, 50 );
    self _meth_842C( 1, 50 );
    self _meth_8434( 1, 10 );
    self _meth_8430( 1, scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_9D46(), 2500, 0 ) );

    if ( isdefined( level._id_112C1 ) )
    {
        if ( !level._id_112C1 )
            scripts\engine\utility::_id_1C42( 0 );
    }

    if ( isdefined( level._id_112C6 ) )
    {
        if ( !level._id_112C6 )
            scripts\engine\utility::_id_1C70( 0 );
    }

    if ( isdefined( var_7 ) )
        self [[ var_7 ]]();

    if ( isdefined( var_8 ) )
    {
        self _meth_82C6( var_8 );

        if ( var_8 == "c6servo" )
            self _meth_8460( "clothtype", "c6servo" );
        else
            self _meth_8460( "clothtype", "" );

        self._id_42B0 = var_8;
    }

    thread scripts\mp\archetypes\archcommon::_id_EF38();
    thread scripts\mp\archetypes\archcommon::_id_EF41();
}

_id_AE4C( var_0 )
{
    if ( isdefined( self._id_4006 ) )
    {
        var_0._id_AE8B = self._id_4006 * 2 + 0;
        var_0._id_AE9F = self._id_4006 * 2 + 1;
    }
    else
    {
        var_0._id_AE8B = -1;
        var_0._id_AE9F = -1;
    }

    var_0._id_AE89 = _id_3224( var_0._id_AE7F, var_0._id_AE86, var_0._id_AE88, var_0._id_AE90, var_0._id_AE91, self getentitynumber(), self._id_41F0, var_0._id_AE8B, var_0.loadoutprimarycosmeticattachment );

    if ( var_0._id_AE94 == "none" )
        var_0._id_AE9D = "none";
    else
        var_0._id_AE9D = _id_3224( var_0._id_AE94, var_0._id_AE9A, var_0._id_AE9C, var_0._id_AEA4, var_0._id_AEA5, self getentitynumber(), self._id_41F0, var_0._id_AE9F, var_0.loadoutsecondarycosmeticattachment );
}

_id_AE5C( var_0, var_1, var_2 )
{
    if ( getdvarint( "scr_require_loot", 0 ) == 1 && !scripts\mp\utility\game::istrue( self._id_54BC ) )
    {
        if ( var_0._id_AE8A == 0 && var_0._id_AE9E == 0 )
        {
            iprintlnbold( self.name + " is not using a loot weapon!" );
            self._id_54BC = 1;
        }
    }

    if ( var_1 == "rc8Agent" )
        return;

    _id_AE4C( var_0 );
    self._id_AE7F = var_0._id_AE7F;
    self._id_AE88 = var_0._id_AE88;
    self._id_AE94 = var_0._id_AE94;
    self._id_AE9C = var_0._id_AE9C;
    self._id_AE86 = var_0._id_AE86;
    self._id_AE9A = var_0._id_AE9A;
    self._id_AE90 = var_0._id_AE90;
    self._id_AEA4 = var_0._id_AEA4;
    self._id_AE8A = var_0._id_AE8A;
    self._id_AE91 = var_0._id_AE91;
    self._id_AE9E = var_0._id_AE9E;
    self._id_AEA5 = var_0._id_AEA5;
    var_3 = scripts\mp\weapons::_id_12E5C( var_0._id_AE89 );
    scripts\mp\utility\game::_id_12C6( var_3, undefined, undefined, getweaponbasename( var_3 ) == "iw7_fists_mp" );
    scripts\mp\weapons::_id_12F48( var_0._id_AE89 );
    scripts\mp\perks\weaponpassives::loadoutweapongiven( var_0._id_AE89 );
    var_4 = "none";

    if ( var_0._id_AE94 != "none" )
    {
        var_4 = scripts\mp\weapons::_id_12E5C( var_0._id_AE9D );
        scripts\mp\utility\game::_id_12C6( var_4, undefined, undefined, 1 );
        scripts\mp\weapons::_id_12F48( var_0._id_AE9D );

        if ( scripts\mp\utility\game::_id_8234( var_4 ) == "iw7_axe" )
            self setweaponammoclip( var_4, 1 );

        scripts\mp\perks\weaponpassives::loadoutweapongiven( var_0._id_AE9D );
    }

    var_5 = var_3;

    if ( var_4 != "none" && getweaponbasename( var_5 ) == "iw7_fists_mp" )
        var_5 = var_4;

    if ( !isai( self ) )
    {
        self._id_EB6D = undefined;
        scripts\mp\utility\game::_id_141A( var_5 );
    }

    if ( !isdefined( var_2 ) || var_2 )
    {
        var_6 = !scripts\mp\utility\game::_id_766C( "prematch_done" ) && !scripts\mp\weapons::_id_9D3E( var_5 );
        self setspawnweapon( var_5, var_6 );
    }

    self.primaryweapon = var_0._id_AE89;
    self._id_F0C4 = var_0._id_AE9D;
    self._id_10922 = var_5;
    self.pers["primaryWeapon"] = var_0._id_AE89;
    self.pers["secondaryWeapon"] = var_0._id_AE9D;
    scripts\mp\teams::_id_FADC();
    scripts\mp\weapons::_id_12ED5();
    thread scripts\mp\weapons::_id_13BA9();
}

_id_AE58( var_0 )
{
    scripts\mp\utility\game::giveperk( "specialty_marathon" );
    scripts\mp\utility\game::giveperk( "specialty_sharp_focus" );
    scripts\mp\utility\game::giveperk( "specialty_silentdoublejump" );

    if ( var_0._id_AE79.size > 0 )
        scripts\mp\perks::_id_838A( var_0._id_AE79, 0 );

    self.pers["loadoutPerks"] = var_0._id_AE79;
    self.pers["loadoutStandardPerks"] = var_0._id_AEA7;
    self.pers["loadoutExtraPerks"] = var_0._id_AE66;
    self.pers["loadoutRigTrait"] = var_0._id_AE92;
    self setclientomnvar( "ui_trait_ref", scripts\mp\perks::_id_805A( self.pers["loadoutRigTrait"] ) );

    if ( !scripts\mp\utility\game::isjuggernaut() && isdefined( self._id_26B9 ) && self._id_26B9 > 0 )
        thread scripts\mp\perks::_id_838B();
}

_id_AE59( var_0 )
{
    self._id_D782 = [];
    self._id_AE7B = var_0._id_AE7B;
    self._id_AE7D = var_0._id_AE7D;
    _id_0AE2::_id_8397( var_0._id_AE7B, "primary", 0, var_0._id_AE7C, var_0._id_AE67 );
    _id_0AE2::_id_8397( var_0._id_AE7D, "secondary", 0, var_0._id_AE7E, var_0._id_AE68 );
}

_id_AE5B( var_0 )
{
    var_1 = var_0._id_AEAA;

    if ( isbot( self ) && level._id_1CAA )
    {
        if ( isdefined( self._id_AEAA ) )
            var_1 = self._id_AEAA;
        else
            var_1 = scripts\mp\bots\bots_supers::_id_2EE9();

        var_0._id_AEAA = var_1;

        if ( isdefined( self._id_AE92 ) )
            var_2 = self._id_AE92;
        else if ( isdefined( var_0._id_AE92 ) && self.class == "gamemode" )
            var_2 = var_0._id_AE92;
        else
            var_2 = scripts\mp\bots\bots_supers::botpicktrait();

        var_0._id_AE92 = var_2;
        self.pers["loadoutRigTrait"] = var_2;

        if ( var_2 != "specialty_null" )
        {
            scripts\mp\utility\game::giveperk( var_2 );
            self setclientomnvar( "ui_trait_ref", scripts\mp\perks::_id_805A( self.pers["loadoutRigTrait"] ) );
        }
    }

    if ( isdefined( scripts\mp\supers::_id_7E4E() ) )
    {
        var_3 = scripts\mp\supers::_id_7E4F();

        if ( var_3 == var_1 && !_id_8BDB() )
        {
            scripts\mp\supers::givesuperweapon( self._id_11234 );
            return;
        }
    }

    if ( var_1 == "none" || !level._id_1CAA )
    {
        scripts\mp\supers::_id_41E2();
        self._id_AEAA = undefined;
    }
    else if ( level._id_1CAA && isdefined( self.pers["gamemodeLoadout"] ) && isdefined( self.pers["gamemodeLoadout"]["loadoutSuper"] ) )
    {
        self._id_AEAA = self.pers["gamemodeLoadout"]["loadoutSuper"];
        scripts\mp\supers::_id_83A8( self._id_AEAA, 1 );
    }
    else
    {
        self._id_AEAA = var_1;
        scripts\mp\supers::_id_83A8( var_1, 1 );
    }
}

_id_AE56( var_0 )
{
    if ( !scripts\engine\utility::_id_9CEE( self.btestclient ) )
    {
        if ( var_0._id_AE6C != "none" )
        {
            self._id_AE6C = var_0._id_AE6C;
            scripts\mp\gestures::_id_8368( var_0._id_AE6C );
        }
    }
}

_id_AE5A( var_0 )
{
    self._id_110F4 = _id_AE33( var_0._id_AEA9 );
}

_id_AE57( var_0, var_1 )
{
    if ( !level._id_1C98 )
    {
        var_0._id_AE6E = "none";
        var_0._id_AE70 = "none";
        var_0._id_AE72 = "none";
    }

    self.streakvariantids = [];
    self.streakvariantids[var_0._id_AE6E] = var_0.loadoutkillstreak1variantid;
    self.streakvariantids[var_0._id_AE70] = var_0.loadoutkillstreak2variantid;
    self.streakvariantids[var_0._id_AE72] = var_0.loadoutkillstreak3variantid;

    if ( var_0._id_AEA8 == 0 && isdefined( self._id_A6AB ) && self._id_A6AB.size > 0 && ( var_1 == "gamemode" || issubstr( var_1, "juggernaut" ) ) )
    {
        var_2 = 0;

        foreach ( var_4 in self._id_A6AB )
        {
            if ( var_2 == 0 )
            {
                var_0._id_AE6E = var_4;
                var_2++;
                continue;
            }

            if ( var_2 == 1 )
            {
                var_0._id_AE70 = var_4;
                var_2++;
                continue;
            }

            if ( var_2 == 2 )
            {
                var_0._id_AE72 = var_4;
                break;
            }
        }
    }

    level.sortedkillstreaksbycost = getsortedkillstreaksbycost( var_0 );
    var_0._id_AE6E = level.sortedkillstreaksbycost[0];
    var_0._id_AE70 = level.sortedkillstreaksbycost[1];
    var_0._id_AE72 = level.sortedkillstreaksbycost[2];

    if ( var_1 == "gamemode" && self._id_110F4 == "specialist" )
    {
        self.pers["gamemodeLoadout"]["loadoutKillstreak1"] = var_0._id_AE6E;
        self.pers["gamemodeLoadout"]["loadoutKillstreak2"] = var_0._id_AE70;
        self.pers["gamemodeLoadout"]["loadoutKillstreak3"] = var_0._id_AE72;
    }

    _id_F775( var_0._id_AE6E, var_0._id_AE70, var_0._id_AE72 );
    var_6 = 0;

    if ( !isagent( self ) )
        var_6 = scripts\mp\killstreaks\killstreaks::_id_213F( [ var_0._id_AE6E, var_0._id_AE70, var_0._id_AE72 ] );

    if ( !isagent( self ) && !var_6 )
    {
        self notify( "givingLoadout" );
        var_7 = scripts\mp\killstreaks\killstreaks::_id_7ED6();
        var_8 = scripts\mp\killstreaks\killstreaks::_id_7DE7();

        if ( !scripts\mp\utility\game::_id_12D6( "specialty_support_killstreaks" ) && !isdefined( self._id_5FBD ) )
            scripts\mp\killstreaks\killstreaks::_id_41C0();

        if ( isdefined( var_0._id_AE6E ) && var_0._id_AE6E != "none" && var_0._id_AE6E != "" )
            scripts\mp\killstreaks\killstreaks::_id_66B9( var_0._id_AE6E, var_0._id_AE6F, var_0.loadoutkillstreak1variantid );

        if ( isdefined( var_0._id_AE70 ) && var_0._id_AE70 != "none" && var_0._id_AE70 != "" )
            scripts\mp\killstreaks\killstreaks::_id_66BB( var_0._id_AE70, var_0._id_AE71, var_0.loadoutkillstreak2variantid );

        if ( isdefined( var_0._id_AE72 ) && var_0._id_AE72 != "none" && var_0._id_AE72 != "" )
            scripts\mp\killstreaks\killstreaks::_id_66BA( var_0._id_AE72, var_0._id_AE73, var_0.loadoutkillstreak3variantid );

        for ( var_9 = var_7.size - 1; var_9 >= 0; var_9-- )
            scripts\mp\killstreaks\killstreaks::_id_26D5( var_7[var_9] );

        for ( var_9 = 0; var_9 < var_8.size; var_9++ )
            scripts\mp\killstreaks\killstreaks::_id_26D5( var_8[var_9] );
    }

    self notify( "equipKillstreaksFinished" );
}

getsortedkillstreaksbycost( var_0 )
{
    var_1 = [ var_0._id_AE6E, var_0._id_AE70, var_0._id_AE72 ];

    for ( var_2 = 0; var_2 < var_1.size - 1; var_2++ )
    {
        if ( isdefined( var_1[var_2] ) && var_1[var_2] != "none" && var_1[var_2] != "" )
        {
            for ( var_3 = var_2 + 1; var_3 < var_1.size; var_3++ )
            {
                if ( isdefined( var_1[var_3] ) && var_1[var_3] != "none" && var_1[var_3] != "" )
                {
                    var_4 = scripts\mp\killstreaks\killstreaks::_id_817B( var_1[var_2] );
                    var_5 = scripts\mp\killstreaks\killstreaks::_id_817B( var_1[var_3] );

                    if ( var_5 < var_4 )
                    {
                        var_6 = var_1[var_3];
                        var_1[var_3] = var_1[var_2];
                        var_1[var_2] = var_6;
                    }
                }
            }
        }
    }

    return var_1;
}

_id_AE53( var_0, var_1, var_2 )
{
    _id_AE5A( var_0 );
    _id_AE55( var_0 );
    _id_AE5C( var_0, var_1, var_2 );
    _id_AE58( var_0 );
    _id_AE59( var_0 );
    _id_AE5B( var_0 );
    _id_AE56( var_0 );
    _id_AE57( var_0, var_1 );
    self.pers["lastClass"] = self.class;
    self._id_A95C = self.class;
    self._id_A93D = self._id_3C56;

    if ( isdefined( self._id_7673 ) )
    {
        self.pers["class"] = self._id_7673;
        self.pers["lastClass"] = self._id_7673;
        self.class = self._id_7673;
        self._id_A95C = self._id_7673;
        self._id_7673 = undefined;
    }
}

_id_F7A0( var_0, var_1 )
{
    var_0 endon( "disconnect" );
    var_0 notify( "setMLGSpectatorClientLoadoutData()" );
    var_0 endon( "setMLGSpectatorClientLoadoutData()" );
    var_0 _meth_80BE( 0, var_1._id_AE89 );
    var_0 _meth_80BE( 1, var_1._id_AE9D );
    var_2 = _id_0AE2::_id_D738( var_1._id_AE7B );
    var_0 _meth_80BC( "primaryPower", var_2 );
    var_3 = _id_0AE2::_id_D738( var_1._id_AE7D );
    var_0 _meth_80BC( "secondaryPower", var_3 );
    var_4 = scripts\mp\supers::_id_8186( var_1._id_AEAA );
    var_0 _meth_80BC( "super", var_4 );

    if ( isai( var_0 ) )
    {
        for ( var_5 = 0; var_5 < var_1._id_AE79.size; var_5++ )
        {
            var_6 = var_1._id_AE79[var_5];
            var_7 = scripts\mp\perks::_id_805A( var_6 );
            var_0 _meth_80BC( var_5 + 1 + "_perk", var_7 );
        }
    }
    else
    {
        if ( var_1._id_AE7A )
            var_1._id_AEA7 = var_1._id_AE79;

        for ( var_5 = 0; var_5 < var_1._id_AEA7.size; var_5++ )
        {
            var_6 = var_1._id_AEA7[var_5];
            var_7 = scripts\mp\perks::_id_805A( var_6 );
            var_0 _meth_80BC( var_5 + 1 + "_perk", var_7 );
        }

        for ( var_5 = 0; var_5 < var_1._id_AE66.size; var_5++ )
        {
            var_6 = var_1._id_AE66[var_5];
            var_7 = scripts\mp\perks::_id_805A( var_6 );
            var_0 _meth_80BC( var_5 + 1 + "_extraPerk", var_7 );
        }
    }

    var_8 = var_1._id_AE92;
    var_9 = scripts\mp\perks::_id_805A( var_8 );
    var_0 _meth_80BC( "rigTrait", var_9 );
    var_10 = scripts\mp\archetypes\archcommon::_id_80F3( var_1._id_AE62 );
    var_0 _meth_80BC( "archetype", var_10 );
    var_0 _meth_80BD( 0, var_1._id_AE67 );
    var_0 _meth_80BD( 1, var_1._id_AE68 );
}

_id_FFBB()
{
    return level.ingraceperiod && level._id_8487 - level.ingraceperiod >= 0 && level._id_8487 - level.ingraceperiod < 5 && !self._id_8BE9;
}

_id_837A()
{
    _id_F691( self.pers["class"] );
    self._id_0322 = undefined;
    self._id_113E7 = undefined;
    self._id_11B2C = undefined;
    scripts\mp\weapons::recordtogglescopestates();
    scripts\mp\weapons::_id_DDF6();
    giveloadout( self.pers["team"], self.pers["class"] );

    if ( !scripts\mp\utility\game::_id_766C( "prematch_done" ) )
        scripts\mp\playerlogic::_id_1CA2( self );
}

giveloadout( var_0, var_1, var_2 )
{
    self notify( "giveLoadout_start" );
    self._id_81D1 = 1;

    if ( isdefined( self._id_CA5B ) )
        self.oldperks = self._id_CA5B;

    _id_AE26();
    var_3 = undefined;

    if ( scripts\engine\utility::_id_9CEE( self._id_400F ) )
    {
        var_3 = self._id_400E;
        self._id_400F = undefined;
    }
    else
    {
        var_3 = _id_AE31();
        var_3 = _id_AE48( var_3, var_1 );
        self._id_400E = var_3;
    }

    loadout_giveextraweapons( var_3 );
    _id_AE53( var_3, var_1, var_2 );
    _id_AE38( var_3, var_1 );
    self._id_81D1 = 0;
    self notify( "changed_kit" );
    self notify( "giveLoadout" );
}

loadout_giveextraweapons( var_0 )
{

}

_id_AE38( var_0, var_1 )
{
    if ( !isplayer( self ) && !isalive( self ) )
        return;

    if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
        thread _id_F7A0( self, var_0 );

    var_2 = scripts\mp\utility\game::_id_7E2B( var_1 );
    var_3 = var_2;
    var_4 = getsubstr( var_1, 0, 7 ) == "default";

    if ( var_4 )
        var_3 += 20;

    var_5 = 10;
    var_6 = -1;

    for ( var_7 = 0; var_7 < var_5; var_7++ )
    {
        var_8 = _func_0AD( "players", self._id_41F0, "loadouts", var_7, "slotUsed" );

        if ( var_8 )
        {
            var_9 = _func_0AD( "players", self._id_41F0, "loadouts", var_7, "classIndex" );

            if ( var_9 == var_3 )
            {
                var_6 = var_7;
                break;
            }
        }
        else
        {
            var_6 = var_7;
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "slotUsed", 1 );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "classIndex", var_3 );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "primaryWeaponSetup", "weapon", var_0._id_AE7F );

            for ( var_10 = 0; var_10 < 6; var_10++ )
                setmatchdata( "players", self._id_41F0, "loadouts", var_7, "primaryWeaponSetup", "attachment", var_10, var_0._id_AE86[var_10] );

            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "primaryWeaponSetup", "camo", var_0._id_AE88 );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "primaryWeaponSetup", "reticle", var_0._id_AE90 );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "primaryWeaponSetup", "lootItemID", var_0._id_AE8A );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "primaryWeaponSetup", "variantID", var_0._id_AE91 );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "primaryWeaponSetup", "paintJobID", var_0._id_AE8B );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "primaryWeaponSetup", "cosmeticAttachment", var_0.loadoutprimarycosmeticattachment );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "secondaryWeaponSetup", "weapon", var_0._id_AE94 );

            for ( var_10 = 0; var_10 < 5; var_10++ )
                setmatchdata( "players", self._id_41F0, "loadouts", var_7, "secondaryWeaponSetup", "attachment", var_10, var_0._id_AE9A[var_10] );

            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "secondaryWeaponSetup", "camo", var_0._id_AE9C );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "secondaryWeaponSetup", "reticle", var_0._id_AEA4 );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "secondaryWeaponSetup", "lootItemID", var_0._id_AE9E );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "secondaryWeaponSetup", "variantID", var_0._id_AEA5 );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "secondaryWeaponSetup", "paintJobID", var_0._id_AE9F );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "secondaryWeaponSetup", "cosmeticAttachment", var_0.loadoutsecondarycosmeticattachment );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "powerSetups", 0, "power", var_0._id_AE7B );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "powerSetups", 0, "extraCharge", _id_3678( var_2 ) );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "powerSetups", 1, "power", var_0._id_AE7D );
            setmatchdata( "players", self._id_41F0, "loadouts", var_7, "powerSetups", 1, "extraCharge", _id_3679( var_2 ) );
            var_11 = var_0._id_AEA7.size;

            if ( var_11 > 3 )
                var_11 = 3;

            for ( var_12 = 0; var_12 < var_11; var_12++ )
                setmatchdata( "players", self._id_41F0, "loadouts", var_7, "loadoutPerks", var_12, var_0._id_AEA7[var_12] );

            var_13 = var_0._id_AE66.size;

            if ( var_13 > 3 )
                var_13 = 3;

            for ( var_12 = 0; var_12 < var_13; var_12++ )
                setmatchdata( "players", self._id_41F0, "loadouts", var_7, "extraPerks", var_12, var_0._id_AE66[var_12] );

            setmatchdata( "players", self._id_41F0, "killstreaks", 0, var_0._id_AE6E );
            setmatchdata( "players", self._id_41F0, "killstreaks", 1, var_0._id_AE70 );
            setmatchdata( "players", self._id_41F0, "killstreaks", 2, var_0._id_AE72 );

            if ( var_6 == 0 )
            {
                self _meth_859B( self._id_41F0, self._id_8C98, self._id_01F1 );

                if ( isdefined( self._id_AE6C ) )
                    self _meth_85AB( self._id_41F0, self._id_AE6C );
            }

            break;
        }
    }

    if ( isdefined( self._id_B3E3 ) && scripts\mp\matchdata::_id_38CA( self._id_B3E3 ) )
    {
        if ( isdefined( var_0._id_AE62 ) )
            setmatchdata( "lives", self._id_B3E3, "archetype", var_0._id_AE62 );

        if ( isdefined( var_0._id_AE92 ) && var_0._id_AE92 != "specialty_null" )
        {
            setmatchdata( "lives", self._id_B3E3, "trait", var_0._id_AE92 );
            self.lastmatchdatarigtrait = var_0._id_AE92;
        }
        else if ( isdefined( self.lastmatchdatarigtrait ) )
            setmatchdata( "lives", self._id_B3E3, "trait", self.lastmatchdatarigtrait );

        if ( isdefined( var_0._id_AEAA ) )
            setmatchdata( "lives", self._id_B3E3, "super", var_0._id_AEAA );

        setmatchdata( "lives", self._id_B3E3, "loadoutIndex", var_6 );
    }

    self._id_AE6D = var_6;
}

_id_8C38()
{
    return isdefined( self.pers ) && isdefined( self.pers["validationInfractions"] ) && self.pers["validationInfractions"] > 0;
}

_id_DDF5()
{
    if ( isdefined( self.pers ) && isdefined( self.pers["validationInfractions"] ) )
        self.pers["validationInfractions"] += 1;
}

_id_11D7()
{
    self._id_8C98 = undefined;

    if ( isdefined( self.riotshieldmodel ) )
        scripts\mp\utility\game::_id_E54F( 1 );

    if ( isdefined( self.riotshieldmodelstowed ) )
        scripts\mp\utility\game::_id_E54F( 0 );

    self.hasriotshieldequipped = 0;
    self detachall();
}

_id_9EE1( var_0 )
{
    var_1 = tablelookup( "mp/perktable.csv", 1, var_0, 8 );

    if ( var_1 == "" || var_1 == "specialty_null" )
        return 0;

    if ( !self _meth_81A7( var_1, "perk" ) )
        return 0;

    return 1;
}

_id_805D( var_0 )
{
    var_1 = tablelookup( "mp/perktable.csv", 1, var_0, 8 );

    if ( var_1 == "" || var_1 == "specialty_null" )
        return "specialty_null";

    if ( !self _meth_81A7( var_1, "perk" ) )
        return "specialty_null";

    return var_1;
}

_id_11B05()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );

    for (;;)
    {
        self waittill( "grenade_pullback", var_0 );

        if ( var_0 != "trophy_mp" )
            continue;

        if ( !isdefined( self.riotshieldmodel ) )
            continue;

        scripts\mp\utility\game::_id_E554( 1 );
        self waittill( "offhand_end" );

        if ( scripts\mp\weapons::_id_9F2D( self getcurrentweapon() ) && isdefined( self.riotshieldmodelstowed ) )
            scripts\mp\utility\game::_id_E554( 0 );
    }
}

_id_11B04()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self.hasriotshield = scripts\mp\utility\game::_id_E552();
    self.hasriotshieldequipped = scripts\mp\weapons::_id_9F2D( self._id_4C16 );

    if ( self.hasriotshield )
    {
        if ( self.hasriotshieldequipped )
            scripts\mp\utility\game::_id_E54D( 1, scripts\mp\utility\game::riotshield_getmodel() );
        else
            scripts\mp\utility\game::_id_E54D( 0, scripts\mp\utility\game::riotshield_getmodel() );
    }

    thread _id_11B05();

    for (;;)
    {
        self waittill( "weapon_change", var_0 );

        if ( var_0 == "none" )
            continue;

        var_1 = scripts\mp\weapons::_id_9F2D( var_0 );
        var_2 = !var_1 && scripts\mp\utility\game::_id_E552();

        if ( var_1 )
        {
            if ( !isdefined( self.riotshieldmodel ) )
            {
                if ( isdefined( self.riotshieldmodelstowed ) )
                    scripts\mp\utility\game::_id_E554( 0 );
                else
                    scripts\mp\utility\game::_id_E54D( 1, scripts\mp\utility\game::riotshield_getmodel() );
            }
        }
        else if ( var_2 )
        {
            if ( !isdefined( self.riotshieldmodelstowed ) )
            {
                if ( isdefined( self.riotshieldmodel ) )
                    scripts\mp\utility\game::_id_E554( 1 );
                else
                    scripts\mp\utility\game::_id_E54D( 0, scripts\mp\utility\game::riotshield_getmodel() );
            }
        }
        else
        {
            if ( isdefined( self.riotshieldmodel ) )
                scripts\mp\utility\game::_id_E54F( 1 );

            if ( isdefined( self.riotshieldmodelstowed ) )
                scripts\mp\utility\game::_id_E54F( 0 );
        }

        self.hasriotshield = var_1 || var_2;
        self.hasriotshieldequipped = var_1;
    }
}

updateattachmentsformlg( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( var_3 == "ripperrscope_camo" )
            var_3 = "ripperrscope_na_camo";
        else if ( var_3 == "m8scope_camo" )
            var_3 = "m8scope_na_camo";
        else if ( var_3 == "arripper" || var_3 == "arm8" || var_3 == "akimbofmg" || var_3 == "glarclassic" || var_3 == "glmp28" || var_3 == "shotgunlongshot" || var_3 == "glsmoke" || var_3 == "glsmoke_slow" || var_3 == "gltacburst" || var_3 == "gltacburst_big" || var_3 == "gltacburst_regen" || var_3 == "glmp28_smoke" )
            continue;

        var_1[var_1.size] = var_3;
    }

    return var_1;
}

ismark2weapon( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    return var_0 >= 32;
}

isholidayweapon( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 < 0 )
        return 0;

    var_2 = scripts\mp\loot::lookupvariantref( scripts\mp\utility\game::_id_8234( var_0 ), var_1 );
    return var_2 == "weapon_iw7_ripper_common_3" || var_2 == "weapon_iw7_lmg03_rare_3" || var_2 == "weapon_iw7_ar57_legendary_3";
}

isholidayweaponusingdefaultscope( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_2496( "scope", getweaponbasename( var_0 ) );
    return isdefined( var_2 ) && scripts\engine\utility::array_contains( var_1, var_2 );
}

issummerholidayweapon( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 < 0 )
        return 0;

    var_2 = scripts\mp\loot::lookupvariantref( scripts\mp\utility\game::_id_8234( var_0 ), var_1 );
    return var_2 == "weapon_iw7_erad_legendary_4" || var_2 == "weapon_iw7_ake_epic_4" || var_2 == "weapon_iw7_sdflmg_legendary_4" || var_2 == "weapon_iw7_mod2187_legendary_3" || var_2 == "weapon_iw7_longshot_legendary_3";
}

ishalloweenholidayweapon( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 < 0 )
        return 0;

    var_2 = scripts\mp\loot::lookupvariantref( scripts\mp\utility\game::_id_8234( var_0 ), var_1 );
    return var_2 == "weapon_iw7_kbs_rare_3" || var_2 == "weapon_iw7_ripper_rare_3" || var_2 == "weapon_iw7_m4_rare_3" || var_2 == "weapon_iw7_mod2187_legendary_5" || var_2 == "weapon_iw7_mag_rare_3" || var_2 == "weapon_iw7_minilmg_epic_3";
}

hasscope( var_0 )
{
    foreach ( var_2 in var_0 )
    {
        if ( scripts\mp\utility\game::_id_7DE1( var_2 ) == "rail" )
            return 1;
    }

    return 0;
}

_id_3224( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_1 = scripts\mp\utility\game::_id_13C7A( var_1 );
    var_1 = scripts\engine\utility::array_remove( var_1, "none" );
    var_9 = scripts\mp\utility\game::_id_13C76( var_0 );
    var_10 = _id_3220( var_0, var_4 );

    if ( isdefined( self._id_81D1 ) && self._id_81D1 )
    {
        var_11 = _id_80C6( var_10, var_4, var_1 );

        if ( var_11.size > 0 )
        {
            var_1 = scripts\engine\utility::_id_2284( var_1, var_11 );

            foreach ( var_13 in var_11 )
                scripts\mp\perks\weaponpassives::_id_3E2F( "passive_random_attachments", "_" + scripts\mp\utility\game::_id_2496( var_13, var_10 ) );
        }
    }

    for ( var_15 = 0; var_15 < var_1.size; var_15++ )
        var_1[var_15] = scripts\mp\utility\game::_id_2496( var_1[var_15], var_10 );

    if ( isdefined( var_9 ) )
    {
        for ( var_15 = 0; var_15 < var_9.size; var_15++ )
            var_9[var_15] = scripts\mp\utility\game::_id_2496( var_9[var_15], var_10 );
    }

    if ( isdefined( var_9 ) )
        var_1 = scripts\engine\utility::_id_2284( var_1, var_9 );

    if ( isdefined( var_4 ) )
    {
        var_16 = _id_823A( var_10, var_4 );

        if ( var_16.size > 0 )
            var_1 = scripts\engine\utility::_id_2284( var_1, var_16 );
    }

    if ( isdefined( var_8 ) && var_8 != "none" )
        var_1[var_1.size] = var_8;

    if ( var_1.size > 0 )
        var_1 = _id_6C18( var_1 );

    var_17 = [];

    foreach ( var_19 in var_1 )
    {
        var_20 = scripts\mp\utility\game::_id_2495( var_19 );

        if ( isdefined( var_20 ) )
            var_17[var_17.size] = scripts\mp\utility\game::_id_2496( var_20, var_10 );
    }

    if ( var_17.size > 0 )
        var_1 = scripts\engine\utility::_id_2284( var_1, var_17 );

    if ( scripts\mp\utility\game::_id_9D46() )
        var_1 = updateattachmentsformlg( var_1 );

    if ( var_1.size > 0 )
        var_1 = scripts\engine\utility::_id_1D3A( var_1 );

    foreach ( var_23 in var_1 )
        var_10 += ( "+" + var_23 );

    if ( issubstr( var_10, "iw7" ) )
    {
        var_10 = _id_3225( var_10, var_2, var_4 );
        var_25 = 0;

        if ( isholidayweapon( var_10, var_4 ) || issummerholidayweapon( var_10, var_4 ) || ishalloweenholidayweapon( var_10, var_4 ) )
            var_25 = isholidayweaponusingdefaultscope( var_10, var_1 );

        if ( hasscope( var_1 ) )
        {
            if ( var_25 && !issubstr( var_10, "iw7_longshot" ) && !issubstr( var_10, "iw7_kbs" ) )
            {
                if ( ishalloweenholidayweapon( var_10, var_4 ) )
                    var_10 += ( "+scope" + gethalloweenscopenumber( var_10, var_4 ) );
                else
                    var_10 += "+scope1";
            }
            else
                var_10 = _id_3227( var_10, var_3 );
        }

        var_10 = _id_3228( var_10, var_4 );
    }

    return var_10;
}

gethalloweenscopenumber( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 < 0 )
        return 0;

    var_2 = scripts\mp\loot::lookupvariantref( scripts\mp\utility\game::_id_8234( var_0 ), var_1 );
    var_3 = 0;

    switch ( var_2 )
    {
        case "weapon_iw7_minilmg_epic_3":
            var_3 = 1;
            break;
        case "weapon_iw7_mod2187_legendary_5":
        case "weapon_iw7_ripper_rare_3":
            var_3 = 2;
            break;
    }

    return var_3;
}

_id_80C6( var_0, var_1, var_2 )
{
    var_3 = [];

    if ( _id_13C96( var_0, var_1, "passive_random_attachments" ) )
    {
        if ( 1 )
        {
            var_4 = _id_7DE6( var_0, var_2, 0 );
            var_3[var_3.size] = var_4[randomint( var_4.size )];
        }
        else
        {
            var_5 = randomintrange( 1, 2 );
            var_3 = _id_3217( var_0, var_5, var_2 );
        }
    }

    return var_3;
}

_id_11754( var_0, var_1 )
{
    var_2 = _id_7DE6( var_0, [], 0 );

    foreach ( var_4 in var_2 )
        scripts\mp\perks\weaponpassives::_id_11751( "passive_random_attachments", "_" + scripts\mp\utility\game::_id_2496( var_4, var_0 ) );
}

_id_3217( var_0, var_1, var_2 )
{
    var_3 = [];
    var_4 = _id_7DE2( var_0, var_2 );

    if ( var_4.size > 0 )
    {
        var_3 = [];
        var_5 = scripts\engine\utility::_id_22A8( var_4 );

        foreach ( var_10, var_7 in var_5 )
        {
            if ( var_1 <= 0 )
                break;

            var_8 = 1;

            switch ( var_10 )
            {
                case "undermount":
                case "barrel":
                    var_8 = 1;
                    break;
                case "rail":
                    var_8 = 0;
                    break;
                default:
                    var_8 = randomintrange( 1, var_1 + 1 );
                    break;
            }

            if ( var_8 > 0 )
            {
                if ( var_8 > var_7.size )
                    var_8 = var_7.size;

                var_1 -= var_8;

                for ( var_7 = scripts\engine\utility::_id_22A8( var_7 ); var_8 > 0; var_8-- )
                {
                    var_9 = var_7[var_7.size - var_8];
                    var_3[var_3.size] = var_9;
                }
            }
        }
    }

    return var_3;
}

_id_7DE2( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_8217( var_0 );
    var_3 = [];

    foreach ( var_5 in var_2 )
    {
        var_6 = scripts\mp\utility\game::_id_7DE1( var_5 );

        if ( _id_AD7F( var_1, var_5 ) )
            continue;

        if ( !isdefined( var_3[var_6] ) )
            var_3[var_6] = [];

        var_7 = var_3[var_6];
        var_7[var_7.size] = var_5;
        var_3[var_6] = var_7;
    }

    return var_3;
}

_id_7DE6( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_3 = scripts\mp\utility\game::_id_8217( var_0 );
    var_4 = [];

    foreach ( var_6 in var_3 )
    {
        var_7 = scripts\mp\utility\game::_id_7DE1( var_6 );

        if ( !var_2 && var_7 == "rail" )
            continue;

        if ( _id_AD7F( var_1, var_6 ) )
            continue;

        var_4[var_4.size] = var_6;
    }

    return var_4;
}

_id_AD7F( var_0, var_1 )
{
    foreach ( var_3 in var_0 )
    {
        if ( var_3 == var_1 )
            return 1;
    }

    return 0;
}

_id_80B0( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_8217( var_0 );
    return _id_80B2( var_2, var_1 );
}

_id_80B3( var_0, var_1, var_2 )
{
    var_3 = scripts\mp\utility\game::_id_821B( var_0, var_1 );
    return _id_80B2( var_3, var_2 );
}

_id_80B2( var_0, var_1 )
{
    if ( var_0.size > 0 )
    {
        var_0 = scripts\engine\utility::_id_22A7( var_0 );

        if ( var_1 > var_0.size )
            var_1 = var_0.size;

        for ( var_2 = []; var_1 > 0 && var_0.size > 0; var_1-- )
        {
            var_3 = var_0[var_0.size - var_1];
            var_2[var_2.size] = var_3;
        }

        if ( var_2.size > 0 )
            return var_2;
    }

    return var_0;
}

_id_6C18( var_0 )
{
    var_1 = [];

    if ( isdefined( var_0 ) )
    {
        foreach ( var_3 in var_0 )
        {
            if ( var_3 == "none" )
                continue;

            var_4 = 1;

            foreach ( var_6 in var_1 )
            {
                if ( var_3 == var_6 )
                {
                    var_4 = 0;
                    break;
                }

                if ( !scripts\mp\utility\game::_id_249D( var_3, var_6 ) )
                {
                    var_4 = 0;
                    break;
                }
            }

            if ( var_4 )
                var_1[var_1.size] = var_3;
        }
    }

    return var_1;
}

_id_3220( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 < 0 )
        return scripts\mp\utility\game::_id_13C75( var_0 );
    else
    {
        var_2 = scripts\mp\loot::_id_8215( var_0, var_1 );
        return var_2;
    }
}

_id_3225( var_0, var_1, var_2 )
{
    var_3 = -1;

    if ( isholidayweapon( var_0, var_2 ) )
    {
        var_3 = int( tablelookup( "mp/camoTable.csv", 1, "camo89", scripts\engine\utility::getcamotablecolumnindex( "weapon_index" ) ) );
        return var_0 + "+camo" + var_3;
    }
    else if ( issummerholidayweapon( var_0, var_2 ) )
    {
        var_3 = int( tablelookup( "mp/camoTable.csv", 1, "camo230", scripts\engine\utility::getcamotablecolumnindex( "weapon_index" ) ) );
        return var_0 + "+camo" + var_3;
    }
    else if ( ishalloweenholidayweapon( var_0, var_2 ) )
    {
        var_3 = int( tablelookup( "mp/camoTable.csv", 1, "camo242", scripts\engine\utility::getcamotablecolumnindex( "weapon_index" ) ) );
        return var_0 + "+camo" + var_3;
    }
    else if ( ( !isdefined( var_1 ) || var_1 == "none" ) && ismark2weapon( var_2 ) )
    {
        var_4 = scripts\mp\loot::getweaponqualitybyid( var_0, var_2 );
        var_5 = undefined;

        switch ( var_4 )
        {
            case 1:
                var_5 = "camo99";
                break;
            case 2:
                var_5 = "camo101";
                break;
            case 3:
                var_5 = "camo102";
                break;
            case 4:
                var_5 = "camo103";
                break;
            default:
                break;
        }

        var_3 = int( tablelookup( "mp/camoTable.csv", 1, var_5, scripts\engine\utility::getcamotablecolumnindex( "weapon_index" ) ) );
        return var_0 + "+camo" + var_3;
    }

    if ( !isdefined( var_1 ) )
        var_3 = 0;
    else
        var_3 = int( tablelookup( "mp/camoTable.csv", 1, var_1, scripts\engine\utility::getcamotablecolumnindex( "weapon_index" ) ) );

    if ( var_3 <= 0 )
    {
        var_4 = scripts\mp\loot::getweaponqualitybyid( var_0, var_2 );
        var_5 = undefined;

        switch ( var_4 )
        {
            case 1:
                var_5 = "camo24";
                break;
            case 2:
                var_5 = "camo19";
                break;
            case 3:
                var_5 = "camo18";
                break;
            default:
                break;
        }

        if ( isdefined( var_5 ) )
            var_3 = int( tablelookup( "mp/camoTable.csv", 1, var_5, scripts\engine\utility::getcamotablecolumnindex( "weapon_index" ) ) );
        else
            return var_0;
    }

    return var_0 + "+camo" + var_3;
}

_id_3227( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return var_0;

    var_2 = int( tablelookup( "mp/reticleTable.csv", 1, var_1, 5 ) );

    if ( !isdefined( var_2 ) || var_2 == 0 )
        return var_0;

    var_0 += ( "+scope" + var_2 );
    return var_0;
}

_id_3228( var_0, var_1 )
{
    if ( !isdefined( var_1 ) || var_1 < 0 )
        return var_0;

    var_0 += ( "+loot" + var_1 );
    return var_0;
}

_id_8229( var_0, var_1 )
{
    return scripts\mp\loot::_id_804C( _id_3228( var_0, var_1 ) );
}

_id_13C96( var_0, var_1, var_2 )
{
    var_3 = _id_8229( var_0, var_1 );

    if ( !isdefined( var_3 ) || var_3.size <= 0 )
        return 0;

    foreach ( var_5 in var_3 )
    {
        if ( var_2 == var_5 )
            return 1;
    }

    return 0;
}

_id_823A( var_0, var_1 )
{
    var_2 = [];
    var_3 = _id_8229( var_0, var_1 );

    if ( isdefined( var_3 ) )
    {
        foreach ( var_5 in var_3 )
        {
            var_6 = scripts\mp\passives::_id_8048( var_5 );

            if ( !isdefined( var_6 ) )
                continue;

            var_2[var_2.size] = var_6;
        }
    }

    return var_2;
}

_id_F775( var_0, var_1, var_2 )
{
    self._id_A6AB = [];
    var_3 = [];

    if ( isdefined( var_0 ) && var_0 != "none" )
    {
        var_4 = scripts\mp\killstreaks\killstreaks::_id_817B( var_0 );
        var_3[var_4] = var_0;
    }

    if ( isdefined( var_1 ) && var_1 != "none" )
    {
        var_4 = scripts\mp\killstreaks\killstreaks::_id_817B( var_1 );
        var_3[var_4] = var_1;
    }

    if ( isdefined( var_2 ) && var_2 != "none" )
    {
        var_4 = scripts\mp\killstreaks\killstreaks::_id_817B( var_2 );
        var_3[var_4] = var_2;
    }

    var_5 = 0;

    foreach ( var_4, var_7 in var_3 )
    {
        if ( var_4 > var_5 )
            var_5 = var_4;
    }

    for ( var_8 = 0; var_8 <= var_5; var_8++ )
    {
        if ( !isdefined( var_3[var_8] ) )
            continue;

        var_7 = var_3[var_8];
        self._id_A6AB[var_8] = var_3[var_8];
    }
}

_id_E19F()
{
    var_0 = self.pers["team"];
    var_1 = self.pers["class"];
    var_2 = self _meth_8173();

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];
        self givemaxammo( var_4 );
        self setweaponammoclip( var_4, 9999 );

        if ( var_4 == "claymore_mp" || var_4 == "claymore_detonator_mp" )
            self setweaponammostock( var_4, 2 );
    }

    if ( self getammocount( level._id_400A[var_1]["primary"]["type"] ) < level._id_400A[var_1]["primary"]["count"] )
        self setweaponammoclip( level._id_400A[var_1]["primary"]["type"], level._id_400A[var_1]["primary"]["count"] );

    if ( self getammocount( level._id_400A[var_1]["secondary"]["type"] ) < level._id_400A[var_1]["secondary"]["count"] )
        self setweaponammoclip( level._id_400A[var_1]["secondary"]["type"], level._id_400A[var_1]["secondary"]["count"] );
}

_id_C572()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !isdefined( var_0.pers["class"] ) )
            var_0.pers["class"] = "";

        if ( !isdefined( var_0.pers["lastClass"] ) )
            var_0.pers["lastClass"] = "";

        var_0.class = var_0.pers["class"];
        var_0._id_A95C = var_0.pers["lastClass"];
        var_0._id_53AD = 0;
        var_0._id_2C66 = [];
        var_0._id_2C67 = [];
        var_0._id_3C56 = var_0.pers["changedArchetypeInfo"];
        var_0._id_A93D = undefined;

        if ( !isai( var_0 ) && !scripts\engine\utility::_id_9CEE( var_0.btestclient ) )
        {
            var_0 setclientomnvar( "ui_selected_archetype", level._id_2127[var_0 _id_3676()] );
            var_0 setclientomnvar( "ui_selected_super", scripts\mp\supers::_id_8186( var_0 _id_3688() ) );
            var_0 setclientomnvar( "ui_selected_trait", scripts\mp\perks::_id_805A( var_0 _id_367E() ) );
        }

        if ( !isdefined( var_0.pers["validationInfractions"] ) )
            var_0.pers["validationInfractions"] = 0;
    }
}

_id_6AB2( var_0, var_1 )
{
    wait( var_0 );
    self fadeovertime( var_1 );
    self.alpha = 0;
}

_id_F691( var_0 )
{
    self._id_4B1C = var_0;
}

_id_9E63( var_0 )
{
    return scripts\mp\utility\game::_id_7F44( var_0 ) != -1;
}

_id_8BDC()
{
    if ( isdefined( self._id_A95C ) && self._id_A95C != self.class || !isdefined( self._id_A95C ) )
        return 1;

    if ( level.gametype == "infect" && ( !isdefined( self._id_A8D0 ) || self._id_A8D0 != self._id_9419 ) )
        return 1;

    return 0;
}

_id_8BDB()
{
    if ( isdefined( self._id_3C56 ) )
    {
        if ( !isdefined( self._id_A93D ) )
            return 1;

        if ( self._id_3C56 != self._id_A93D )
            return 1;
    }

    return 0;
}

_id_E243()
{
    scripts\mp\utility\game::_id_13CB( 1, "" );
    scripts\mp\utility\game::_id_13CB( 2, "" );
    scripts\mp\utility\game::_id_13CB( 3, "" );
    scripts\mp\utility\game::_id_13CB( 4, "" );

    if ( !level._id_4542 )
    {
        scripts\mp\utility\game::_id_13CB( 5, "" );
        scripts\mp\utility\game::_id_13CB( 6, "" );
        scripts\mp\utility\game::_id_13CB( 7, "" );
    }
}

_id_E250()
{
    self _meth_80CD( 0 );
    self setclientomnvar( "ui_hide_hud", 0 );
    self setclientomnvar( "ui_hide_minimap", 0 );
    self._id_55E4 = undefined;
    self._id_55D5 = undefined;
    self._id_55C8 = undefined;
    self._id_55BE = undefined;
    self._id_55E6 = undefined;
    self._id_55E9 = undefined;
    self._id_55D9 = undefined;
    self._id_55DC = undefined;
    self._id_55C3 = undefined;
    self._id_55E2 = undefined;
    self._id_55D0 = undefined;
    self._id_55C6 = undefined;
    self._id_5AE0 = undefined;
    self._id_5AE1 = undefined;
    self._id_55D4 = undefined;
    self._id_55E1 = undefined;
    self._id_55E0 = undefined;
    self._id_55E5 = undefined;
    self._id_6262 = undefined;
    self._id_6263 = undefined;
    self._id_8EC7 = undefined;
    self._id_8ECE = undefined;
    self._id_9F80 = undefined;
    self._id_9D6B = undefined;
    self._id_C026 = undefined;
    self._id_D84C = undefined;
    scripts\mp\damage::_id_E247();
    scripts\mp\damage::clearcorpsetablefuncs();
    _id_0D8C::_id_3E70();
    scripts\mp\perks\weaponpassives::passivecolddamageresetdata( self );
    scripts\mp\utility\game::_resetenableignoreme();
}

_id_41D8()
{
    self setscriptablepartstate( "CompassIcon", "defaultIcon" );
    _id_0D8C::_id_3E71();
    scripts\mp\perks\weaponpassives::passivecolddamageresetscriptable( self );
    _id_0D6F::_id_B946();
    scripts\mp\equipment\cloak::_id_E26A();
}

_id_3C53( var_0, var_1, var_2 )
{
    if ( isdefined( self._id_3C56 ) )
    {
        var_3 = self._id_3C56;

        if ( var_3._id_2123 == var_0 && var_3._id_11234 == var_1 && var_3._id_11B2C == var_2 )
            return;
    }

    var_4 = spawnstruct();
    var_4._id_2123 = var_0;
    var_4._id_11234 = var_1;
    var_4._id_11B2C = var_2;
    self._id_3C56 = var_4;
    self.pers["changedArchetypeInfo"] = var_4;

    if ( !isai( self ) )
    {
        self setclientomnvar( "ui_selected_archetype", level._id_2127[var_0] );
        self setclientomnvar( "ui_selected_super", scripts\mp\supers::_id_8186( var_1 ) );
        self setclientomnvar( "ui_selected_trait", scripts\mp\perks::_id_805A( var_2 ) );
    }

    if ( isdefined( self.pers["class"] ) && self.pers["class"] != "" )
    {
        scripts\mp\menus::_id_D848( self.pers["class"] );

        if ( _id_FFBB() )
            _id_837A();
        else if ( isalive( self ) )
            self iprintlnbold( game["strings"]["change_rig"] );
    }
}

_id_7DE0( var_0, var_1 )
{
    var_2 = scripts\engine\utility::ter_op( var_1 == "primary", "loadoutPrimaryAttachment", "loadoutSecondaryAttachment" );

    if ( var_0 == 0 )
        return var_2;

    return var_2 + ( var_0 + 1 );
}

_id_7F9E()
{
    return 6;
}

_id_7FA0()
{
    return 5;
}

_id_7F96( var_0 )
{
    return scripts\engine\utility::ter_op( var_0 == "primary", _id_7F9E(), _id_7FA0() );
}

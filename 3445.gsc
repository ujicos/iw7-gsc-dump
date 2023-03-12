// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    _id_9779();
    _id_9579();
    _id_96D0();
    _id_955A();
    _id_9555();
    _id_9556();
    _id_9554();
    level._id_2E14 = 1;
}

_id_9579()
{
    var_0 = "mp/botClassTable.csv";
    level._id_2EE7 = [];
    var_1 = _id_2E07();
    var_2 = 0;

    for (;;)
    {
        var_2++;
        var_3 = tablelookup( var_0, 0, "botArchetype", var_2 );
        var_4 = tablelookup( var_0, 0, "botPersonalities", var_2 );
        var_5 = tablelookup( var_0, 0, "botDifficulties", var_2 );

        if ( !isdefined( var_3 ) || var_3 == "" )
            break;

        if ( !isdefined( var_4 ) || var_4 == "" )
            break;

        if ( !isdefined( var_5 ) || var_5 == "" )
            break;

        var_6 = [];

        foreach ( var_8 in var_1 )
            var_6[var_8] = tablelookup( var_0, 0, var_8, var_2 );

        var_10 = strtok( var_3, "|" );
        var_11 = strtok( var_4, "| " );
        var_12 = strtok( var_5, "| " );

        foreach ( var_14 in var_10 )
        {
            var_14 = "archetype_" + var_14;
            var_6["loadoutArchetype"] = var_14;

            foreach ( var_16 in var_11 )
            {
                foreach ( var_18 in var_12 )
                {
                    var_19 = _id_2E0E( var_14, var_16, var_18, 1 );
                    var_20 = spawnstruct();
                    var_20._id_AEAC = var_6;
                    var_19._id_AE93[var_19._id_AE93.size] = var_20;
                }
            }
        }
    }
}

_id_9779()
{
    var_0 = "mp/botTemplateTable.csv";
    level._id_2EE8 = [];
    var_1 = _id_2E07();
    var_2 = 0;

    for (;;)
    {
        var_2++;
        var_3 = tablelookup( var_0, 0, "template_", var_2 );

        if ( !isdefined( var_3 ) || var_3 == "" )
            break;

        var_4 = "template_" + var_3;
        level._id_2EE8[var_4] = [];

        foreach ( var_6 in var_1 )
        {
            var_7 = tablelookup( var_0, 0, var_6, var_2 );

            if ( isdefined( var_7 ) && var_7 != "" )
                level._id_2EE8[var_4][var_6] = var_7;
        }
    }
}

_id_9554()
{
    level._id_2ED9 = [];
    level._id_2ED9["cqb"] = [ "archetype_assault", "archetype_scout", "archetype_assassin", "archetype_heavy", "archetype_engineer" ];
    level._id_2ED9["run_and_gun"] = [ "archetype_assault", "archetype_scout", "archetype_heavy", "archetype_engineer" ];
    level._id_2ED9["camper"] = [ "archetype_assassin", "archetype_heavy", "archetype_sniper" ];
    level._id_2ED9["default"] = [ "archetype_assault" ];
}

_id_2E0A( var_0, var_1, var_2 )
{
    if ( !isusingmatchrulesdata() )
        return 1;

    if ( !getmatchrulesdata( "commonOption", "allowCustomClasses" ) )
        return 1;

    if ( var_1 == "specialty_null" )
        return 1;

    if ( var_1 == "none" )
        return 1;

    if ( var_0 == "equipment" )
    {
        if ( getmatchrulesdata( "commonOption", "perkRestricted", var_1 ) )
            return 0;

        var_0 = "weapon";
    }

    var_3 = var_0 + "Restricted";
    var_4 = var_0 + "ClassRestricted";
    var_5 = "";

    switch ( var_0 )
    {
        case "weapon":
            var_5 = scripts\mp\utility\game::_id_8225( var_1 );
            break;
        case "attachment":
            var_5 = scripts\mp\utility\game::_id_7DE1( var_1 );
            break;
        case "killstreak":
            var_5 = var_2;
            break;
        case "perk":
            var_5 = "ability_" + level._id_2E41[var_1];
            break;
        default:
            return 0;
    }

    if ( getmatchrulesdata( "commonOption", var_3, var_1 ) )
        return 0;

    if ( getmatchrulesdata( "commonOption", var_4, var_5 ) )
        return 0;

    return 1;
}

_id_2DFD( var_0 )
{
    var_1 = "none";
    var_2 = [ "veteran", "hardened", "regular", "recruit" ];
    var_2 = scripts\engine\utility::_id_22A7( var_2 );

    foreach ( var_4 in var_2 )
    {
        var_1 = _id_2E03( "weap_statstable", var_0, "loadoutPrimary", self._id_2ED8, self.personality, var_4 );

        if ( var_1 != "none" )
            return var_1;
    }

    if ( isdefined( level._id_2E45 ) )
    {
        var_6 = scripts\engine\utility::_id_22A7( level._id_2E45 );

        foreach ( var_8 in var_6 )
        {
            foreach ( var_4 in var_2 )
            {
                var_1 = _id_2E03( "weap_statstable", var_0, "loadoutPrimary", var_0["loadoutArchetype"], var_8, var_4 );

                if ( var_1 != "none" )
                {
                    self._id_2D6F = var_8;
                    return var_1;
                }
            }
        }
    }

    if ( isusingmatchrulesdata() )
    {
        for ( var_12 = 0; var_12 < 6 && ( !isdefined( var_1 ) || var_1 == "none" || var_1 == "" ); var_12++ )
        {
            if ( scripts\mp\utility\game::_id_7F91( "defaultClasses", self.team, var_12, "class", "inUse" ) )
            {
                var_1 = scripts\mp\utility\game::_id_7F91( "defaultClasses", self.team, var_12, "class", "weaponSetups", 0, "weapon" );

                if ( var_1 != "none" )
                {
                    self._id_2D6F = "weapon";
                    return var_1;
                }
            }
        }
    }

    self._id_2D6F = "weapon";
    return level._id_2D70;
}

_id_2E48( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        var_1 = level._id_2ED5[var_0];

        if ( isdefined( var_1 ) )
        {
            var_2 = strtok( var_1, "| " );

            if ( var_2.size > 0 )
                scripts\mp\bots\bots_util::bot_set_personality( scripts\engine\utility::_id_DC6B( var_2 ) );
        }
    }
}

_id_2E07()
{
    var_0 = [];
    var_0[var_0.size] = "loadoutPrimary";
    var_0[var_0.size] = "loadoutPrimaryAttachment";
    var_0[var_0.size] = "loadoutPrimaryAttachment2";
    var_0[var_0.size] = "loadoutPrimaryCamo";
    var_0[var_0.size] = "loadoutPrimaryReticle";
    var_0[var_0.size] = "loadoutSecondary";
    var_0[var_0.size] = "loadoutSecondaryAttachment";
    var_0[var_0.size] = "loadoutSecondaryAttachment2";
    var_0[var_0.size] = "loadoutSecondaryCamo";
    var_0[var_0.size] = "loadoutSecondaryReticle";
    var_0[var_0.size] = "loadoutStreakType";
    var_0[var_0.size] = "loadoutStreak1";
    var_0[var_0.size] = "loadoutStreak2";
    var_0[var_0.size] = "loadoutStreak3";
    var_0[var_0.size] = "loadoutPowerPrimary";
    var_0[var_0.size] = "loadoutPowerSecondary";
    var_0[var_0.size] = "loadoutPerk1";
    var_0[var_0.size] = "loadoutPerk2";
    var_0[var_0.size] = "loadoutPerk3";
    return var_0;
}

_id_2E0E( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_2E0B( var_0, var_1, var_2 );

    if ( !isdefined( level._id_2EE7 ) )
        level._id_2EE7 = [];

    if ( !isdefined( level._id_2EE7[var_4] ) && var_3 )
    {
        level._id_2EE7[var_4] = spawnstruct();
        level._id_2EE7[var_4]._id_AE93 = [];
    }

    if ( isdefined( level._id_2EE7[var_4] ) )
        return level._id_2EE7[var_4];
}

_id_2E0D( var_0, var_1, var_2 )
{
    var_3 = _id_2E0E( var_0, var_1, var_2, 0 );

    if ( isdefined( var_3 ) && isdefined( var_3._id_AE93 ) && var_3._id_AE93.size > 0 )
    {
        var_4 = randomint( var_3._id_AE93.size );
        return var_3._id_AE93[var_4]._id_AEAC;
    }
}

_id_2EC2( var_0, var_1, var_2, var_3 )
{
    var_4 = scripts\mp\utility\game::_id_8217( var_0 );

    if ( isdefined( var_1 ) && var_1 != "none" && !_id_2E0A( "attachment", var_1 ) )
        return 0;

    if ( isdefined( var_2 ) && var_2 != "none" && !_id_2E0A( "attachment", var_2 ) )
        return 0;

    if ( isdefined( var_3 ) && var_3 != "none" && !_id_2E0A( "attachment", var_3 ) )
        return 0;

    if ( var_1 != "none" && !scripts\engine\utility::array_contains( var_4, var_1 ) )
        return 0;

    if ( var_2 != "none" && !scripts\engine\utility::array_contains( var_4, var_2 ) )
        return 0;

    if ( isdefined( var_3 ) && var_3 != "none" && !scripts\engine\utility::array_contains( var_4, var_3 ) )
        return 0;

    if ( ( var_1 == "none" || var_2 == "none" ) && ( !isdefined( var_3 ) || var_3 == "none" ) )
        return 1;

    if ( !isdefined( level._id_2DD2 ) )
    {
        level._id_2DD2 = [];
        level._id_1C77 = [];
        var_5 = "mp/attachmentcombos.csv";
        var_6 = 0;

        for (;;)
        {
            var_6++;
            var_7 = tablelookupbyrow( var_5, 0, var_6 );

            if ( var_7 == "" )
                break;

            var_8 = 0;

            for (;;)
            {
                var_8++;
                var_9 = tablelookupbyrow( var_5, var_8, 0 );

                if ( var_9 == "" )
                    break;

                if ( var_9 == var_7 )
                {
                    if ( tablelookupbyrow( var_5, var_8, var_6 ) != "no" )
                        level._id_1C77[var_9] = 1;

                    continue;
                }

                if ( tablelookupbyrow( var_5, var_8, var_6 ) == "no" )
                    level._id_2DD2[var_7][var_9] = 1;
            }
        }
    }

    if ( var_1 == var_2 && !isdefined( level._id_1C77[var_1] ) )
        return 0;

    if ( isdefined( var_3 ) )
    {
        if ( var_2 == var_3 && !isdefined( level._id_1C77[var_2] ) )
            return 0;

        if ( var_1 == var_3 && !isdefined( level._id_1C77[var_1] ) )
            return 0;

        if ( var_3 != "none" && var_1 == var_3 && var_2 == var_3 )
            return 0;

        if ( isdefined( level._id_2DD2[var_2] ) && isdefined( level._id_2DD2[var_2][var_3] ) )
            return 0;

        if ( isdefined( level._id_2DD2[var_1] ) && isdefined( level._id_2DD2[var_1][var_3] ) )
            return 0;
    }

    return !( isdefined( level._id_2DD2[var_1] ) && isdefined( level._id_2DD2[var_1][var_2] ) );
}

_id_2EC1( var_0, var_1, var_2 )
{
    if ( isdefined( var_1[var_0 + "Attachment"] ) && isdefined( level._id_2D0D[var_1[var_0 + "Attachment"]] ) )
        return 1;

    if ( isdefined( var_1[var_0 + "Attachment2"] ) && isdefined( level._id_2D0D[var_1[var_0 + "Attachment2"]] ) )
        return 1;

    if ( isdefined( var_1[var_0 + "Attachment3"] ) && isdefined( level._id_2D0D[var_1[var_0 + "Attachment3"]] ) )
        return 1;

    return 0;
}

_id_2E3E( var_0 )
{
    return level._id_CA65[var_0];
}

_id_CA64( var_0, var_1 )
{
    if ( _id_2E3E( var_0 ) > 0 )
    {
        var_2 = [];
        var_2["type"] = var_1;
        var_2["name"] = var_0;
        level._id_2E3F[level._id_2E3F.size] = var_2;
        level._id_2E41[var_0] = var_1;
    }
}

_id_96D0()
{
    level._id_CA65 = [];
    var_0 = 1;

    for (;;)
    {
        var_1 = tablelookupbyrow( "mp/perktable.csv", var_0, 1 );

        if ( var_1 == "" )
            break;

        level._id_CA65[var_1] = int( tablelookupbyrow( "mp/perktable.csv", var_0, 10 ) );
        var_0++;
    }

    level._id_CA65["none"] = 0;
    level._id_CA65["specialty_null"] = 0;
    level._id_2E3F = [];
    level._id_2E41 = [];
    var_0 = 1;

    for ( var_2 = "ability_null"; isdefined( var_2 ) && var_2 != ""; var_2 = tablelookupbyrow( "mp/cacabilitytable.csv", var_0, 1 ) )
    {
        var_2 = getsubstr( var_2, 8 );

        for ( var_3 = 4; var_3 <= 13; var_3++ )
        {
            var_1 = tablelookupbyrow( "mp/cacabilitytable.csv", var_0, var_3 );

            if ( var_1 != "" )
                _id_CA64( var_1, var_2 );
        }

        var_0++;
    }
}

_id_955A()
{
    var_0 = "mp/statstable.csv";
    var_1 = 4;
    var_2 = 38;
    var_3 = 39;
    var_4 = 40;
    level._id_2ED6 = [];
    level._id_2ED5 = [];
    var_5 = 1;

    for (;;)
    {
        var_6 = tablelookupbyrow( var_0, var_5, var_1 );

        if ( var_6 == "specialty_null" )
            break;

        var_7 = tablelookupbyrow( var_0, var_5, var_2 );
        var_8 = tablelookupbyrow( var_0, var_5, var_4 );
        var_9 = tablelookupbyrow( var_0, var_5, var_3 );

        if ( var_6 != "" && var_9 != "" )
            level._id_2ED5[var_6] = var_9;

        if ( var_8 != "" && var_6 != "" && var_9 != "" && var_7 != "" )
        {
            var_10 = "loadoutPrimary";

            if ( scripts\mp\utility\game::_id_9D79( var_6 ) )
                var_10 = "loadoutSecondary";
            else if ( !scripts\mp\utility\game::_id_9D78( var_6 ) )
            {
                var_5++;
                continue;
            }

            if ( !isdefined( level._id_2ED6[var_10] ) )
                level._id_2ED6[var_10] = [];

            var_11 = strtok( var_7, "|" );
            var_12 = strtok( var_9, "| " );
            var_13 = strtok( var_8, "| " );

            foreach ( var_15 in var_11 )
            {
                var_15 = "archetype_" + var_15;

                foreach ( var_17 in var_12 )
                {
                    foreach ( var_19 in var_13 )
                    {
                        var_20 = _id_2E0B( var_15, var_17, var_19 );

                        if ( !isdefined( level._id_2ED6[var_10][var_20] ) )
                            level._id_2ED6[var_10][var_20] = [];

                        var_21 = level._id_2ED6[var_10][var_20].size;
                        level._id_2ED6[var_10][var_20][var_21] = var_6;
                    }
                }
            }
        }

        var_5++;
    }
}

_id_2E03( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = "specialty_null";

    if ( var_2 == "loadoutPrimary" )
        var_6 = "iw7_ar57";
    else if ( var_2 == "loadoutSecondary" )
        var_6 = "iw7_revolver";

    if ( var_4 == "default" )
        var_4 = "run_and_gun";

    if ( var_2 == "loadoutSecondary" && scripts\engine\utility::array_contains( var_1, "specialty_twoprimaries" ) )
        var_2 = "loadoutPrimary";

    if ( !isdefined( level._id_2ED6 ) )
        return var_6;

    if ( !isdefined( level._id_2ED6[var_2] ) )
        return var_6;

    var_7 = _id_2E0B( var_3, var_4, var_5 );

    if ( !isdefined( level._id_2ED6[var_2][var_7] ) )
        return var_6;

    var_6 = _id_2E02( level._id_2ED6[var_2][var_7], var_0, var_1, var_2 );
    return var_6;
}

_id_2E01( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = "specialty_null";

    if ( !isdefined( level._id_2E3F ) )
        return var_6;

    if ( !isdefined( level._id_2E40 ) )
        level._id_2E40 = [];

    if ( !isdefined( level._id_2E40[var_0] ) )
    {
        var_7 = strtok( var_0, "_" );
        var_7[0] = "";
        var_8 = 0;

        if ( scripts\engine\utility::array_contains( var_7, "any" ) )
            var_8 = 1;

        var_9 = [];

        foreach ( var_11 in level._id_2E3F )
        {
            if ( var_8 || scripts\engine\utility::array_contains( var_7, var_11["type"] ) )
                var_9[var_9.size] = var_11["name"];
        }

        level._id_2E40[var_0] = var_9;
    }

    if ( level._id_2E40[var_0].size > 0 )
        var_6 = _id_2E02( level._id_2E40[var_0], var_1, var_2, var_3 );

    return var_6;
}

_id_2EC0( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = var_4 - var_3 + 1;

    if ( isdefined( var_5 ) )
        var_6 = var_5;

    var_7 = 0;
    var_8 = int( getsubstr( var_1, 11 ) );

    if ( var_0 == "specialty_twoprimaries" )
        return 0;

    if ( var_0 == "specialty_extra_attachment" )
        return 0;

    if ( !_id_2E0A( "perk", var_0 ) )
        return 0;

    for ( var_9 = var_8 - 1; var_9 > 0; var_9-- )
    {
        var_10 = "loadoutPerk" + var_9;

        if ( var_2[var_10] == "none" || var_2[var_10] == "specialty_null" )
            continue;

        if ( var_0 == var_2[var_10] )
            return 0;

        if ( var_9 >= var_3 && var_9 <= var_4 )
            var_7 += _id_2E3E( var_2[var_10] );
    }

    if ( var_7 + _id_2E3E( var_0 ) > var_6 )
        return 0;

    return 1;
}

_id_2E00( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = int( getsubstr( var_0, 5, 6 ) ) - 1;

    switch ( var_3 )
    {
        case "loadoutPrimary":
            return scripts\mp\class::_id_113C0( level._id_4010, var_6, 0 );
        case "loadoutPrimaryAttachment":
            return scripts\mp\class::_id_113C1( level._id_4010, var_6, 0, 0 );
        case "loadoutPrimaryAttachment2":
            return scripts\mp\class::_id_113C1( level._id_4010, var_6, 0, 1 );
        case "loadoutPrimaryCamo":
            return scripts\mp\class::_id_113C3( level._id_4010, var_6, 0 );
        case "loadoutPrimaryReticle":
            return scripts\mp\class::_id_113C4( level._id_4010, var_6, 0 );
        case "loadoutSecondary":
            return scripts\mp\class::_id_113C0( level._id_4010, var_6, 1 );
        case "loadoutSecondaryAttachment":
            return scripts\mp\class::_id_113C1( level._id_4010, var_6, 1, 0 );
        case "loadoutSecondaryAttachment2":
            return scripts\mp\class::_id_113C1( level._id_4010, var_6, 1, 1 );
        case "loadoutSecondaryCamo":
            return scripts\mp\class::_id_113C3( level._id_4010, var_6, 1 );
        case "loadoutSecondaryReticle":
            return scripts\mp\class::_id_113C4( level._id_4010, var_6, 1 );
        case "loadoutStreak1":
            return scripts\mp\class::_id_113B9( level._id_4010, var_6, 0 );
        case "loadoutStreak2":
            return scripts\mp\class::_id_113B9( level._id_4010, var_6, 1 );
        case "loadoutStreak3":
            return scripts\mp\class::_id_113B9( level._id_4010, var_6, 2 );
        case "loadoutPerk6":
        case "loadoutPerk5":
        case "loadoutPerk4":
        case "loadoutPerk3":
        case "loadoutPerk2":
        case "loadoutPerk1":
            var_7 = int( getsubstr( var_3, 11 ) );
            var_8 = scripts\mp\class::_id_113BB( level._id_4010, var_6, var_7 );

            if ( var_8 == "" )
                return "specialty_null";

            var_9 = int( getsubstr( var_8, 0, 1 ) );
            var_10 = int( getsubstr( var_8, 1, 2 ) );
            var_11 = tablelookupbyrow( "mp/cacabilitytable.csv", var_9 + 1, var_10 + 3 );
            return var_11;
    }

    return var_0;
}

_id_9555()
{
    var_0 = "mp/attachmenttable.csv";
    var_1 = 5;
    var_2 = 19;
    var_3 = 11;
    level._id_2D0E = [];
    level._id_2D0D = [];
    var_4 = 1;

    for (;;)
    {
        var_5 = tablelookupbyrow( var_0, var_4, var_1 );

        if ( var_5 == "done" )
            break;

        var_6 = tablelookupbyrow( var_0, var_4, var_2 );

        if ( var_5 != "" && var_6 != "" )
        {
            var_7 = tablelookupbyrow( var_0, var_4, var_3 );

            if ( var_7 == "TRUE" )
                level._id_2D0D[var_5] = 1;

            var_8 = strtok( var_6, "| " );

            foreach ( var_10 in var_8 )
            {
                if ( !isdefined( level._id_2D0E[var_10] ) )
                    level._id_2D0E[var_10] = [];

                if ( !scripts\engine\utility::array_contains( level._id_2D0E[var_10], var_5 ) )
                {
                    var_11 = level._id_2D0E[var_10].size;
                    level._id_2D0E[var_10][var_11] = var_5;
                }
            }
        }

        var_4++;
    }
}

_id_2DFE( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = "none";

    if ( !isdefined( level._id_2D0E ) )
        return var_5;

    if ( !isdefined( level._id_2D0E[var_4] ) )
        return var_5;

    var_5 = _id_2E02( level._id_2D0E[var_4], var_0, var_1, var_2 );
    return var_5;
}

_id_9556()
{
    var_0 = "mp/camotable.csv";
    level._id_2D1E = [];
    var_1 = 0;

    for (;;)
    {
        var_2 = tablelookupbyrow( var_0, var_1, scripts\engine\utility::getcamotablecolumnindex( "ref" ) );

        if ( !isdefined( var_2 ) || var_2 == "" )
            break;

        var_3 = tablelookupbyrow( var_0, var_1, scripts\engine\utility::getcamotablecolumnindex( "bot_valid" ) );

        if ( isdefined( var_3 ) && int( var_3 ) )
            level._id_2D1E[level._id_2D1E.size] = var_2;

        var_1++;
    }
}

_id_2DFF( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = "none";
    return var_5;
}

_id_2E0C( var_0 )
{
    var_1 = 8;

    if ( isdefined( var_0["loadoutPrimary"] ) && var_0["loadoutPrimary"] == "none" )
        var_1 += 1;

    if ( isdefined( var_0["loadoutSecondary"] ) && var_0["loadoutSecondary"] == "none" )
        var_1 += 1;

    if ( isdefined( var_0["loadoutPowerPrimary"] ) && var_0["loadoutPowerPrimary"] == "none" )
        var_1 += 1;

    if ( isdefined( var_0["loadoutPowerSecondary"] ) && var_0["loadoutPowerSecondary"] == "none" )
        var_1 += 1;

    return var_1;
}

_id_2E13( var_0, var_1, var_2, var_3 )
{
    var_4 = 1;

    switch ( var_2 )
    {
        case "loadoutPrimary":
            var_4 = _id_2E0A( "weapon", var_3 );
            break;
        case "loadoutPowerSecondary":
        case "loadoutPowerPrimary":
            var_4 = _id_2E0A( "equipment", var_3 );
            break;
        case "loadoutPrimaryAttachment":
            var_4 = _id_2EC2( var_1["loadoutPrimary"], var_3, "none" );
            break;
        case "loadoutPrimaryAttachment2":
            var_4 = _id_2EC2( var_1["loadoutPrimary"], var_1["loadoutPrimaryAttachment"], var_3 );
            break;
        case "loadoutPrimaryAttachment3":
            var_4 = _id_2EC2( var_1["loadoutPrimary"], var_1["loadoutPrimaryAttachment"], var_1["loadoutPrimaryAttachment2"], var_3 );
            break;
        case "loadoutPrimaryReticle":
            var_4 = _id_2EC1( "loadoutPrimary", var_1, var_3 );
            break;
        case "loadoutPrimaryCamo":
            var_4 = !isdefined( self._id_2EE6 ) || var_3 == self._id_2EE6;
            break;
        case "loadoutSecondary":
            var_4 = var_3 != var_1["loadoutPrimary"];
            var_4 = var_4 && _id_2E0A( "weapon", var_3 );
            break;
        case "loadoutSecondaryAttachment":
            var_4 = _id_2EC2( var_1["loadoutSecondary"], var_3, "none" );
            break;
        case "loadoutSecondaryAttachment2":
            var_4 = _id_2EC2( var_1["loadoutSecondary"], var_1["loadoutSecondaryAttachment"], var_3 );
            break;
        case "loadoutSecondaryAttachment3":
            var_4 = _id_2EC2( var_1["loadoutSecondary"], var_1["loadoutSecondaryAttachment"], var_1["loadoutSecondaryAttachment2"], var_3 );
            break;
        case "loadoutSecondaryReticle":
            var_4 = _id_2EC1( "loadoutSecondary", var_1, var_3 );
            break;
        case "loadoutSecondaryCamo":
            var_4 = !isdefined( self._id_2EE6 ) || var_3 == self._id_2EE6;
            break;
        case "loadoutStreak3":
        case "loadoutStreak2":
        case "loadoutStreak1":
            var_4 = scripts\mp\bots\bots_killstreaks::_id_2DEE( var_3, "bots", undefined, var_1["loadoutStreakType"] );
            var_4 = var_4 && _id_2E0A( "killstreak", var_3, var_1["loadoutStreakType"] );
            break;
        case "loadoutPerk12":
        case "loadoutPerk11":
        case "loadoutPerk10":
        case "loadoutPerk9":
        case "loadoutPerk8":
        case "loadoutPerk7":
        case "loadoutPerk6":
        case "loadoutPerk5":
        case "loadoutPerk4":
        case "loadoutPerk3":
        case "loadoutPerk2":
        case "loadoutPerk1":
            var_4 = _id_2EC0( var_3, var_2, var_1, 1, 12, _id_2E0C( var_1 ) );
            break;
        case "loadoutPerk15":
        case "loadoutPerk14":
        case "loadoutPerk13":
            if ( var_1["loadoutStreakType"] != "streaktype_specialist" )
                var_4 = 0;
            else
                var_4 = _id_2EC0( var_3, var_2, var_1, -1, -1 );

            break;
        case "loadoutPerk23":
        case "loadoutPerk22":
        case "loadoutPerk21":
        case "loadoutPerk20":
        case "loadoutPerk19":
        case "loadoutPerk18":
        case "loadoutPerk17":
        case "loadoutPerk16":
            if ( var_1["loadoutStreakType"] != "streaktype_specialist" )
                var_4 = 0;
            else
                var_4 = _id_2EC0( var_3, var_2, var_1, 16, 23, 8 );

            break;
    }

    return var_4;
}

_id_2E02( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = "none";
    var_6 = undefined;
    var_7 = 0.0;

    if ( scripts\engine\utility::array_contains( var_0, "specialty_null" ) )
        var_5 = "specialty_null";

    foreach ( var_9 in var_0 )
    {
        var_10 = undefined;

        if ( getsubstr( var_9, 0, 9 ) == "template_" )
        {
            var_10 = var_9;
            var_11 = level._id_2EE8[var_9][var_3];
            var_9 = _id_2E02( strtok( var_11, "| " ), var_1, var_2, var_3, 1 );

            if ( isdefined( var_10 ) && isdefined( self._id_3F29[var_10] ) )
                return var_9;
        }

        if ( var_9 == "attachmenttable" )
            return _id_2DFE( var_1, var_2, var_3, self.personality, self.difficulty );

        if ( var_9 == "weap_statstable" )
            return _id_2E03( var_1, var_2, var_3, self._id_2ED8, self.personality, self.difficulty );

        if ( var_9 == "camotable" )
            return _id_2DFF( var_1, var_2, var_3, self.personality, self.difficulty );

        if ( getsubstr( var_9, 0, 5 ) == "class" && int( getsubstr( var_9, 5, 6 ) ) > 0 )
            var_9 = _id_2E00( var_9, var_1, var_2, var_3, self.personality, self.difficulty );

        if ( isdefined( level._id_2E3F ) && getsubstr( var_9, 0, 10 ) == "perktable_" )
            return _id_2E01( var_9, var_1, var_2, var_3, self.personality, self.difficulty );

        if ( _id_2E13( var_1, var_2, var_3, var_9 ) )
        {
            var_7 += 1.0;

            if ( randomfloat( 1.0 ) <= 1.0 / var_7 )
            {
                var_5 = var_9;
                var_6 = var_10;
            }
        }
    }

    if ( isdefined( var_6 ) )
        self._id_3F29[var_6] = 1;

    return var_5;
}

_id_2E04( var_0 )
{
    self._id_3F29 = [];

    foreach ( var_6, var_2 in var_0 )
    {
        var_3 = strtok( var_2, "| " );
        var_4 = _id_2E02( var_3, var_2, var_0, var_6 );
        var_0[var_6] = var_4;
    }

    return var_0;
}

_id_2E09()
{
    var_0 = "regular";
    var_0 = self botgetdifficulty();

    if ( var_0 == "default" )
    {
        scripts\mp\bots\bots_util::bot_set_difficulty( "default" );
        var_0 = self botgetdifficulty();
    }

    return var_0;
}

_id_2E08()
{
    if ( !isdefined( self._id_2ED8 ) )
    {
        var_0 = self botgetpersonality();
        var_1 = level._id_2ED9[var_0];
        var_2 = randomint( var_1.size );
        self._id_2ED8 = var_1[var_2];
    }

    return self._id_2ED8;
}

_id_2E05()
{
    while ( !isdefined( level._id_2E14 ) )
        wait 0.05;

    while ( !isdefined( self.personality ) )
        wait 0.05;

    var_0 = [];
    var_1 = _id_2E09();
    self.difficulty = var_1;
    var_2 = self botgetpersonality();
    var_3 = _id_2E08();

    if ( isdefined( self._id_2EE3 ) )
    {
        var_4 = self._id_2EE4 == var_1;
        var_5 = self._id_2EE5 == var_2;

        if ( var_4 && var_5 && ( !isdefined( self._id_8BE2 ) || self._id_8BE2 ) && !isdefined( self.respawn_with_launcher ) )
            return self._id_2EE3;
    }

    var_0 = _id_2E0D( var_3, var_2, var_1 );
    var_0 = _id_2E04( var_0 );

    if ( isdefined( level.bot_funcs["gametype_loadout_modify"] ) )
        var_0 = self [[ level.bot_funcs["gametype_loadout_modify"] ]]( var_0 );

    if ( var_0["loadoutPrimary"] == "none" )
    {
        self._id_2D6F = undefined;
        var_0["loadoutPrimary"] = _id_2DFD( var_0 );
        var_0["loadoutPrimaryCamo"] = "none";
        var_0["loadoutPrimaryAttachment"] = "none";
        var_0["loadoutPrimaryAttachment2"] = "none";
        var_0["loadoutPrimaryAttachment3"] = "none";
        var_0["loadoutPrimaryReticle"] = "none";

        if ( isdefined( self._id_2D6F ) )
        {
            if ( self._id_2D6F == "weapon" )
                _id_2E48( var_0["loadoutPrimary"] );
            else
                scripts\mp\bots\bots_util::bot_set_personality( self._id_2D6F );

            var_2 = self.personality;
            self._id_2D6F = undefined;
        }
    }

    self._id_2EE3 = var_0;
    self._id_2EE4 = var_1;
    self._id_2EE5 = var_2;

    if ( isdefined( var_0["loadoutPrimaryCamo"] ) && var_0["loadoutPrimaryCamo"] != "none" )
        self._id_2EE6 = var_0["loadoutPrimaryCamo"];

    if ( isdefined( self.respawn_with_launcher ) )
    {
        if ( isdefined( level._id_2E66 ) && _id_2E0A( "weapon", level._id_2E66 ) )
        {
            var_0["loadoutSecondary"] = level._id_2E66;
            var_0["loadoutSecondaryAttachment"] = "none";
            var_0["loadoutSecondaryAttachment2"] = "none";
            self._id_2EE3 = undefined;
        }

        self.respawn_with_launcher = undefined;
    }

    var_0 = _id_2E0F( var_0 );

    if ( scripts\mp\utility\game::bot_israndom() )
    {
        if ( scripts\engine\utility::array_contains( self.pers["loadoutPerks"], "specialty_twoprimaries" ) )
        {
            var_6 = _id_2E0D( "cqb", var_1 );
            var_0["loadoutSecondary"] = var_6["loadoutPrimary"];
            var_0["loadoutSecondaryAttachment"] = var_6["loadoutPrimaryAttachment"];
            var_0["loadoutSecondaryAttachment2"] = var_6["loadoutPrimaryAttachment2"];
            var_0 = _id_2E04( var_0 );
            var_0 = _id_2E0F( var_0 );
        }

        if ( scripts\engine\utility::array_contains( self.pers["loadoutPerks"], "specialty_extra_attachment" ) )
        {
            var_7 = _id_2E0D( var_2, var_1 );
            var_0["loadoutPrimaryAttachment3"] = var_7["loadoutPrimaryAttachment2"];

            if ( scripts\engine\utility::array_contains( self.pers["loadoutPerks"], "specialty_twoprimaries" ) )
                var_0["loadoutSecondaryAttachment2"] = var_7["loadoutPrimaryAttachment2"];
            else
                var_0["loadoutSecondaryAttachment2"] = var_7["loadoutSecondaryAttachment2"];

            var_0 = _id_2E04( var_0 );
            var_0 = _id_2E0F( var_0 );
        }
        else
        {
            var_0["loadoutSecondaryAttachment2"] = "none";

            if ( !_id_2EC1( "loadoutSecondary", var_0, var_0["loadoutSecondaryReticle"] ) )
                var_0["loadoutSecondaryReticle"] = "none";
        }
    }

    return var_0;
}

_id_2E0F( var_0 )
{
    self.pers["loadoutPerks"] = [];
    self.pers["specialistBonusStreaks"] = [];
    self.pers["specialistStreaks"] = [];
    self.pers["specialistStreakKills"] = [];
    var_1 = 0;
    var_2 = isdefined( var_0["loadoutStreakType"] ) && var_0["loadoutStreakType"] == "streaktype_specialist";

    if ( var_2 )
    {
        var_0["loadoutStreak1"] = "none";
        var_0["loadoutStreak2"] = "none";
        var_0["loadoutStreak3"] = "none";
    }

    foreach ( var_8, var_4 in var_0 )
    {
        if ( var_4 == "specialty_null" || var_4 == "none" )
            continue;

        if ( getsubstr( var_8, 0, 11 ) == "loadoutPerk" )
        {
            var_5 = int( getsubstr( var_8, 11 ) );

            if ( !var_2 && var_5 > 12 )
                continue;

            var_6 = scripts\mp\utility\game::_id_7DF6( var_4 );

            if ( var_5 <= 12 )
                self.pers["loadoutPerks"][self.pers["loadoutPerks"].size] = var_6;
            else if ( var_5 <= 15 )
            {
                var_0["loadoutStreak" + ( var_1 + 1 )] = var_6 + "_ks";
                self.pers["specialistStreaks"][self.pers["specialistStreaks"].size] = var_6 + "_ks";
                var_7 = 0;

                if ( var_1 > 0 )
                    var_7 = self.pers["specialistStreakKills"][self.pers["specialistStreakKills"].size - 1];

                self.pers["specialistStreakKills"][self.pers["specialistStreakKills"].size] = var_7 + _id_2E3E( var_6 ) + 2;
                var_1++;
            }
            else
                self.pers["specialistBonusStreaks"][self.pers["specialistBonusStreaks"].size] = var_6;
        }
    }

    if ( var_2 && !isdefined( self.pers["specialistStreakKills"][0] ) )
    {
        self.pers["specialistStreakKills"][0] = 0;
        self.pers["specialistStreaks"][0] = "specialty_null";
    }

    if ( var_2 && !isdefined( self.pers["specialistStreakKills"][1] ) )
    {
        self.pers["specialistStreakKills"][1] = self.pers["specialistStreakKills"][0];
        self.pers["specialistStreaks"][1] = "specialty_null";
    }

    if ( var_2 && !isdefined( self.pers["specialistStreakKills"][2] ) )
    {
        self.pers["specialistStreakKills"][2] = self.pers["specialistStreakKills"][1];
        self.pers["specialistStreaks"][2] = "specialty_null";
    }

    return var_0;
}

bot_setup_loadout_callback()
{
    var_0 = _id_2E08();
    var_1 = self botgetpersonality();
    var_2 = _id_2E09();
    var_3 = _id_2E0E( var_0, var_1, var_2, 0 );

    if ( isdefined( var_3 ) && isdefined( var_3._id_AE93 ) && var_3._id_AE93.size > 0 )
    {
        self._id_4009 = ::_id_2E05;
        return 1;
    }

    var_4 = getsubstr( self.name, 0, self.name.size - 10 );
    self._id_4009 = undefined;
    return 0;
}

_id_2E9C( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( var_6 ) )
        return var_0 getrankedplayerdata( "privateloadouts", "squadMembers", "loadouts", var_2, var_3, var_4, var_5, var_6 );
    else if ( isdefined( var_5 ) )
        return var_0 getrankedplayerdata( "privateloadouts", "squadMembers", "loadouts", var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        return var_0 getrankedplayerdata( "privateloadouts", "squadMembers", "loadouts", var_2, var_3, var_4 );
    else
        return var_0 getrankedplayerdata( "privateloadouts", "squadMembers", "loadouts", var_2, var_3 );
}

_id_2E9D( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( var_6 ) )
        return var_0 getrankedplayerdata( "rankedloadouts", "squadMembers", "loadouts", var_2, var_3, var_4, var_5, var_6 );
    else if ( isdefined( var_5 ) )
        return var_0 getrankedplayerdata( "rankedloadouts", "squadMembers", "loadouts", var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        return var_0 getrankedplayerdata( "rankedloadouts", "squadMembers", "loadouts", var_2, var_3, var_4 );
    else
        return var_0 getrankedplayerdata( "rankedloadouts", "squadMembers", "loadouts", var_2, var_3 );
}

_id_2E9B( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( var_6 ) )
        return getenemysquaddata( "squadMembers", "loadouts", var_2, var_3, var_4, var_5, var_6 );
    else if ( isdefined( var_5 ) )
        return getenemysquaddata( "squadMembers", "loadouts", var_2, var_3, var_4, var_5 );
    else if ( isdefined( var_4 ) )
        return getenemysquaddata( "squadMembers", "loadouts", var_2, var_3, var_4 );
    else
        return getenemysquaddata( "squadMembers", "loadouts", var_2, var_3 );
}

_id_2E9A( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    var_7 = ::_id_2E9D;

    if ( getdvar( "squad_match" ) == "1" && self.team == "axis" )
        var_7 = ::_id_2E9B;
    else if ( !scripts\mp\utility\game::matchmakinggame() )
        var_7 = ::_id_2E9C;

    return self [[ var_7 ]]( var_0, var_1, var_2, var_3, var_4, var_5, var_6 );
}

_id_2E9E( var_0, var_1, var_2 )
{
    if ( getdvar( "squad_match" ) == "1" && self.team == "axis" )
        return getenemysquaddata( "squadMembers", var_1, var_2 );
    else if ( !scripts\mp\utility\game::matchmakinggame() )
        return var_0 getrankedplayerdata( "privateloadouts", "squadMembers", var_2 );
    else
        return var_0 getrankedplayerdata( "rankedloadouts", "squadMembers", var_2 );
}

_id_2E06( var_0, var_1, var_2, var_3 )
{
    var_0["loadoutPrimary"] = _id_2E9A( var_1, var_2, var_3, "weaponSetups", 0, "weapon" );
    var_0["loadoutPrimaryAttachment"] = _id_2E9A( var_1, var_2, var_3, "weaponSetups", 0, "attachment", 0 );
    var_0["loadoutPrimaryAttachment2"] = _id_2E9A( var_1, var_2, var_3, "weaponSetups", 0, "attachment", 1 );
    var_0["loadoutPrimaryAttachment3"] = _id_2E9A( var_1, var_2, var_3, "weaponSetups", 0, "attachment", 2 );
    var_0["loadoutPrimaryCamo"] = _id_2E9A( var_1, var_2, var_3, "weaponSetups", 0, "camo" );
    var_0["loadoutPrimaryReticle"] = _id_2E9A( var_1, var_2, var_3, "weaponSetups", 0, "reticle" );
    var_0["loadoutSecondary"] = _id_2E9A( var_1, var_2, var_3, "weaponSetups", 1, "weapon" );
    var_0["loadoutSecondaryAttachment"] = _id_2E9A( var_1, var_2, var_3, "weaponSetups", 1, "attachment", 0 );
    var_0["loadoutSecondaryAttachment2"] = _id_2E9A( var_1, var_2, var_3, "weaponSetups", 1, "attachment", 1 );
    var_0["loadoutSecondaryCamo"] = _id_2E9A( var_1, var_2, var_3, "weaponSetups", 1, "camo" );
    var_0["loadoutSecondaryReticle"] = _id_2E9A( var_1, var_2, var_3, "weaponSetups", 1, "reticle" );
    var_0["loadoutPowerPrimary"] = _id_2E9A( var_1, var_2, var_3, "perks", 0 );
    var_0["loadoutPowerSecondary"] = _id_2E9A( var_1, var_2, var_3, "perks", 1 );
    var_0["loadoutStreak1"] = "none";
    var_0["loadoutStreak2"] = "none";
    var_0["loadoutStreak3"] = "none";
    var_4 = _id_2E9A( var_1, var_2, var_3, "perks", 5 );

    if ( isdefined( var_4 ) )
    {
        var_0["loadoutStreakType"] = var_4;

        if ( var_4 == "streaktype_assault" )
        {
            var_0["loadoutStreak1"] = _id_2E9A( var_1, var_2, var_3, "assaultStreaks", 0 );
            var_0["loadoutStreak2"] = _id_2E9A( var_1, var_2, var_3, "assaultStreaks", 1 );
            var_0["loadoutStreak3"] = _id_2E9A( var_1, var_2, var_3, "assaultStreaks", 2 );
        }
        else if ( var_4 == "streaktype_support" )
        {
            var_0["loadoutStreak1"] = _id_2E9A( var_1, var_2, var_3, "supportStreaks", 0 );
            var_0["loadoutStreak2"] = _id_2E9A( var_1, var_2, var_3, "supportStreaks", 1 );
            var_0["loadoutStreak3"] = _id_2E9A( var_1, var_2, var_3, "supportStreaks", 2 );
        }
        else if ( var_4 == "streaktype_specialist" )
        {
            var_0["loadoutPerk13"] = _id_2E9A( var_1, var_2, var_3, "specialistStreaks", 0 );
            var_0["loadoutPerk14"] = _id_2E9A( var_1, var_2, var_3, "specialistStreaks", 1 );
            var_0["loadoutPerk15"] = _id_2E9A( var_1, var_2, var_3, "specialistStreaks", 2 );
        }
    }

    var_0["loadoutCharacterType"] = _id_2E9A( var_1, var_2, var_3, "type" );
    _id_2E48( var_0["loadoutPrimary"] );
    self._id_0240 = _id_2E9E( var_1, var_2, "patch" );
    self._id_023F = _id_2E9E( var_1, var_2, "background" );
    return var_0;
}

_id_2E0B( var_0, var_1, var_2 )
{
    return var_0 + "_" + var_1 + "_" + var_2;
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_1314D( var_0, var_1, var_2 )
{
    var_3 = var_0;

    if ( isdefined( var_1 ) )
        var_3 = var_3 + "_" + var_1;

    if ( isdefined( var_2 ) )
        var_3 = var_3 + " - " + var_2;

    if ( getdvarint( "scr_validate_print", 0 ) == 1 )
    {

    }

    if ( getdvarint( "scr_validate_assert", 0 ) == 1 )
    {

    }

    if ( getdvarint( "scr_validate_record", 0 ) == 1 )
        scripts\mp\class::_id_DDF5();
}

_id_13140( var_0 )
{
    var_1 = spawnstruct();
    var_1._id_D640 = 0;
    var_1._id_13D1E = [];
    var_1._id_9B0F = [];
    var_1._id_9B0F[2] = [];
    var_1._id_9B0F[5] = [];
    var_1._id_9B0F[9] = [];
    _id_1314B( var_1, var_0._id_AE7F, var_0._id_AE86, var_0._id_AE88, var_0._id_AE90, var_0._id_AE8A, var_0._id_AE91, 0 );
    _id_1314B( var_1, var_0._id_AE94, var_0._id_AE9A, var_0._id_AE9C, var_0._id_AEA4, var_0._id_AE9E, var_0._id_AEA5, 1 );
    _id_13146( var_1, var_0._id_AE7B, "primary", var_0._id_AE69 );
    _id_13146( var_1, var_0._id_AE7D, "secondary", var_0._id_AE6A );
    _id_13145( var_1, var_0._id_AE79, var_0._id_AE62 );
    _id_13147( var_1, var_0._id_AE6E, var_0._id_AE70, var_0._id_AE72 );
    _id_13148( var_1, var_0._id_AEAA, var_0._id_AE62 );
    _id_1313A( var_1, var_0._id_AE62 );

    if ( var_1._id_D640 > 10 )
    {
        _id_1314D( "totalPointCost" );
        var_1._id_9B0F[0] = 1;
    }

    _id_1314C( var_1 );
    var_0 = _id_6E06( var_0, var_1._id_9B0F );
    return var_0;
}

_id_1314B( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7 )
{
    var_8 = scripts\mp\utility\game::_id_8234( var_1 );
    var_9 = scripts\mp\utility\game::_id_9D79( var_1 );
    var_10 = scripts\engine\utility::ter_op( var_7, "secondary", "primary" );
    var_11 = scripts\engine\utility::ter_op( var_7, 4, 1 );

    if ( isdefined( var_1 ) && var_1 != "none" && var_1 != "iw7_fists" )
    {
        var_0._id_D640++;

        if ( var_7 )
        {
            if ( !var_9 )
            {
                var_0._id_D640++;
                var_0._id_13D1E["overkill"] = 1;
            }
        }
        else if ( var_9 )
        {
            _id_1314D( "secondaryAsPrimary", undefined, var_1 );
            var_0._id_9B0F[var_11] = 1;
        }

        var_12 = scripts\mp\utility\game::_id_13CAC( var_8 );

        if ( !isdefined( var_12 ) )
        {
            _id_1314D( "unknownWeapon", var_10, var_1 );
            var_0._id_9B0F[var_11] = 1;
        }
        else
        {
            var_13 = tablelookup( "mp/statstable.csv", 0, var_12, 41 );

            if ( int( var_13 ) < 0 )
            {
                _id_1314D( "unreleasedWeapon", var_10, var_1 );
                var_0._id_9B0F[var_11] = 1;
            }
        }

        if ( !self _meth_81A7( var_8, "weapon" ) && !weaponunlocksvialoot( var_8 ) )
        {
            _id_1314D( "lockedWeapon", var_10, var_1 );
            var_0._id_9B0F[var_11] = 1;
        }

        if ( var_5 == 0 )
        {
            if ( var_6 != -1 )
            {
                _id_1314D( "emptyItemIDMismatch", var_10, var_1 );
                var_0._id_9B0F[var_11] = 1;
            }
        }
        else if ( var_6 == -1 )
        {
            _id_1314D( "emptyVariantIDMismatch", var_10, var_1 );
            var_0._id_9B0F[var_11] = 1;
        }
        else
        {
            if ( !scripts\mp\loot::_id_A001( var_5 ) )
            {
                _id_1314D( "nonWeaponLootItemID", var_10, var_1 );
                var_0._id_9B0F[var_11] = 1;
            }

            var_14 = scripts\mp\loot::getlootweaponref( var_5 );

            if ( !isdefined( var_14 ) )
            {
                _id_1314D( "badLootItemID", var_10, var_1 );
                var_0._id_9B0F[var_11] = 1;
            }
            else
            {
                var_15 = scripts\mp\loot::lookupvariantref( var_1, var_6 );

                if ( !isdefined( var_15 ) )
                {
                    _id_1314D( "badVariantRef", var_10, var_1 );
                    var_0._id_9B0F[var_11] = 1;
                }
                else if ( var_15 != var_14 )
                {
                    _id_1314D( "lootDataMismatch", var_10, var_1 );
                    var_0._id_9B0F[var_11] = 1;
                }
            }
        }

        _id_1313B( var_0, var_2, var_1, var_8, var_10 );
    }
}

_id_1313B( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = scripts\mp\utility\game::_id_13C8F( var_2 );
    var_6 = getsubstr( var_5, 7 ) + "Attach";
    var_7 = scripts\engine\utility::ter_op( var_4 == "primary", 2, 5 );
    var_8 = 0;
    var_9 = 0;
    var_10 = scripts\engine\utility::ter_op( var_4 == "primary", 2, 2 );

    foreach ( var_17, var_12 in var_1 )
    {
        var_13 = 0;

        if ( isdefined( var_12 ) && var_12 != "none" )
        {
            var_14 = scripts\mp\utility\game::_id_7DE1( var_12 );

            if ( isdefined( var_14 ) && var_14 != "" )
            {
                var_15 = scripts\mp\utility\game::_id_2496( var_12, var_2 );

                if ( isdefined( var_15 ) )
                {
                    if ( var_14 == "rail" )
                        var_13 = 1;
                }
            }

            var_16 = var_3 + "+" + var_12;

            if ( !self _meth_81A7( var_16, var_6 ) )
            {
                _id_1314D( "lockedAttachment", var_4, var_12 );
                var_0._id_9B0F[var_7][var_0._id_9B0F[var_7].size] = var_17;
            }

            if ( !scripts\mp\weapons::_id_9F3C( var_3, var_12 ) )
            {
                _id_1314D( "nonSelectableAttachment", var_4, var_12 );
                var_0._id_9B0F[var_7][var_0._id_9B0F[var_7].size] = var_17;
            }

            if ( var_13 )
            {
                var_8++;
                var_0._id_D640++;
            }
            else
            {
                var_9++;

                if ( var_9 <= var_10 )
                    var_0._id_D640++;
                else
                {
                    var_0._id_13D1E[var_4 + "_attachment_" + ( var_9 + 1 )] = 1;
                    var_0._id_D640 += 2;
                }
            }
        }
    }

    if ( var_9 > 5 )
    {
        _id_1314D( "tooManyAttachments", var_4, var_9 );
        var_0._id_9B0F[scripts\engine\utility::ter_op( var_4 == "primary", 3, 6 )] = 1;
    }

    if ( var_8 > 1 )
    {
        _id_1314D( "tooManyOpticAttachments", var_4, var_8 );
        var_0._id_9B0F[scripts\engine\utility::ter_op( var_4 == "primary", 3, 6 )] = 1;
    }
}

_id_13146( var_0, var_1, var_2, var_3 )
{
    var_4 = scripts\engine\utility::ter_op( var_2 == "primary", 7, 8 );

    if ( isdefined( var_1 ) && var_1 != "none" )
    {
        if ( !isdefined( level._id_D782[var_1] ) )
        {
            _id_1314D( "unknownPower", var_2, var_1 );
            var_0._id_9B0F[var_4] = 1;
        }

        if ( !self _meth_81A7( var_1, "power" ) )
        {
            _id_1314D( "lockedPower", var_2, var_1 );
            var_0._id_9B0F[var_4] = 1;
        }

        var_5 = _id_B02F( var_1 );

        if ( !isdefined( var_5 ) )
        {
            _id_1314D( "unknownMenuPower", var_2, var_1 );
            var_0._id_9B0F[var_4] = 1;
        }
        else if ( var_5 != var_2 )
        {
            _id_1314D( "powerInWrongSlot", var_2, var_1 );
            var_0._id_9B0F[var_4] = 1;
        }

        var_0._id_D640++;
    }

    if ( scripts\mp\utility\game::istrue( var_3 ) )
    {
        var_0._id_D640 += 2;
        var_6 = scripts\engine\utility::ter_op( var_2 == "primary", "extra_lethal", "extra_tactical" );
        var_0._id_13D1E[var_6] = 1;
    }
}

_id_13145( var_0, var_1, var_2 )
{
    var_3 = [];
    var_3[1] = 0;
    var_3[2] = 0;
    var_3[3] = 0;

    foreach ( var_5 in var_1 )
    {
        if ( isdefined( var_5 ) && var_5 != "none" )
        {
            if ( !isdefined( level._id_CA63[var_5] ) )
            {
                _id_1314D( "invalidPerk", undefined, var_5 );
                var_0._id_9B0F[9][var_0._id_9B0F[9].size] = var_5;
            }

            var_6 = scripts\mp\perks::_id_805C( var_5 );

            if ( isdefined( var_6 ) )
            {
                var_3[var_6]++;

                if ( var_3[var_6] > 2 )
                {
                    _id_1314D( "tooManyPerks", var_6, var_5 );
                    var_0._id_9B0F[9][var_0._id_9B0F[9].size] = var_5;
                }

                if ( !self _meth_81A7( var_5, "perk" ) )
                {
                    _id_1314D( "lockedPerk", var_6, var_5 );
                    var_0._id_9B0F[9][var_0._id_9B0F[9].size] = var_5;
                }

                if ( var_3[var_6] == 1 )
                    var_0._id_D640++;
                else
                {
                    var_0._id_13D1E["extra_perk_" + var_6] = 1;
                    var_0._id_D640 += 2;
                }
            }
            else if ( isdefined( level._id_B676[var_5] ) )
            {
                if ( level._id_B676[var_5]._id_2123 != var_2 )
                {
                    _id_1314D( "rigPerkOnWrongRig", undefined, var_5 );
                    var_0._id_9B0F[9][var_0._id_9B0F[9].size] = var_5;
                }

                if ( !self _meth_81A7( var_5, "trait" ) )
                {
                    _id_1314D( "lockedRigPerk", var_6, var_5 );
                    var_0._id_9B0F[9][var_0._id_9B0F[9].size] = var_5;
                }
            }
            else
            {
                _id_1314D( "unknownPerkType", undefined, var_5 );
                var_0._id_9B0F[9][var_0._id_9B0F[9].size] = var_5;
            }
        }
    }
}

_id_13147( var_0, var_1, var_2, var_3 )
{
    var_4 = [ var_1, var_2, var_3 ];

    foreach ( var_6 in var_4 )
    {
        if ( var_6 == "none" )
            continue;

        var_7 = scripts\mp\killstreaks\killstreaks::_id_7F50( var_6 );

        if ( !isdefined( var_7 ) )
        {
            _id_1314D( "unknownStreak", undefined, var_6 );
            var_0._id_9B0F[12] = 1;
        }

        if ( !self _meth_81A7( var_6, "killstreak" ) )
        {
            _id_1314D( "lockedStreak", undefined, var_6 );
            var_0._id_9B0F[12] = 1;
        }
    }

    if ( var_1 == var_2 && var_1 != "none" )
    {
        _id_1314D( "duplicateStreak", undefined, var_1 );
        var_0._id_9B0F[12] = 1;
    }
    else if ( var_1 == var_3 && var_1 != "none" )
    {
        _id_1314D( "duplicateStreak", undefined, var_1 );
        var_0._id_9B0F[12] = 1;
    }
    else if ( var_2 == var_3 && var_2 != "none" )
    {
        _id_1314D( "duplicateStreak", undefined, var_2 );
        var_0._id_9B0F[12] = 1;
    }
}

_id_1313A( var_0, var_1 )
{
    if ( !isdefined( level._id_2127[var_1] ) )
    {
        _id_1314D( "unknownArchetype", undefined, var_1 );
        var_0._id_9B0F[10] = 1;
    }

    if ( !self _meth_81A7( var_1, "rig" ) )
    {
        _id_1314D( "lockedArchetype", undefined, var_1 );
        var_0._id_9B0F[10] = 1;
    }
}

_id_13148( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) || var_1 == "none" )
        return;

    var_3 = level._id_10E4E[var_1];

    if ( !isdefined( var_3 ) )
    {
        _id_1314D( "unknownSuper", undefined, var_1 );
        var_0._id_9B0F[11] = 1;
    }
    else if ( var_3._id_2123 != var_2 )
    {
        _id_1314D( "superOnWrongRig", undefined, var_1 );
        var_0._id_9B0F[11] = 1;
    }

    if ( !self _meth_81A7( var_1, "super" ) )
    {
        _id_1314D( "lockedSuper", undefined, var_1 );
        var_0._id_9B0F[11] = 1;
    }
}

_id_1314C( var_0 )
{

}

_id_6E08( var_0 )
{
    var_1 = scripts\mp\class::_id_AE31();
    var_1._id_AE62 = "archetype_assault";
    var_1._id_AE7F = "iw7_m4";
    return var_1;
}

_id_6E10( var_0, var_1 )
{
    if ( var_1 == "primary" )
    {
        var_0._id_AE7F = "iw7_m4";
        var_0._id_AE88 = "none";
        var_0._id_AE90 = "none";
        var_0._id_AE8A = 0;
        var_0._id_AE91 = -1;

        for ( var_2 = 0; var_2 < scripts\mp\class::_id_7F9E(); var_2++ )
            var_0._id_AE86[var_2] = "none";
    }
    else
    {
        var_0._id_AE94 = "none";
        var_0._id_AE9C = "none";
        var_0._id_AEA4 = "none";
        var_0._id_AE9E = 0;
        var_0._id_AEA5 = -1;

        for ( var_2 = 0; var_2 < scripts\mp\class::_id_7FA0(); var_2++ )
            var_0._id_AE9A[var_2] = "none";
    }
}

_id_6E00( var_0, var_1, var_2 )
{
    if ( var_1 == "primary" )
        var_0._id_AE86[var_2] = "none";
    else
        var_0._id_AE9A[var_2] = "none";
}

_id_6E0A( var_0, var_1 )
{
    if ( var_1 == "primary" )
    {
        var_0._id_AE7B = "none";
        var_0._id_AE7C = [];
        var_0._id_AE67 = 0;
    }
    else
    {
        var_0._id_AE7D = "none";
        var_0._id_AE7E = [];
        var_0._id_AE68 = 0;
    }
}

_id_6E09( var_0, var_1 )
{
    var_0._id_AE79 = scripts\engine\utility::array_remove( var_0._id_AE79, var_1 );
}

_id_6E07( var_0 )
{
    var_0._id_AE6E = "none";
    var_0._id_AE6F = [];
    var_0._id_AE70 = "none";
    var_0._id_AE71 = [];
    var_0._id_AE72 = "none";
    var_0._id_AE73 = [];
}

_id_6DFF( var_0 )
{
    var_0._id_AE62 = "archetype_assault";
    _id_6E0B( var_0 );

    foreach ( var_2 in var_0._id_AE79 )
    {
        if ( isdefined( level._id_B676[var_2] ) )
        {
            _id_6E09( var_0, var_2 );
            break;
        }
    }
}

_id_6E0B( var_0 )
{
    var_0._id_AEAA = "none";
}

_id_6E06( var_0, var_1 )
{
    if ( isdefined( var_1[0] ) )
    {
        var_0 = _id_6E08( var_0 );
        return var_0;
    }

    if ( isdefined( var_1[1] ) )
        _id_6E10( var_0, "primary" );
    else if ( isdefined( var_1[3] ) )
    {
        for ( var_2 = 0; var_2 < scripts\mp\class::_id_7F9E(); var_2++ )
            _id_6E00( var_0, "primary", var_2 );
    }
    else
    {
        foreach ( var_2 in var_1[2] )
            _id_6E00( var_0, "primary", var_2 );
    }

    if ( isdefined( var_1[4] ) )
        _id_6E10( var_0, "secondary" );
    else if ( isdefined( var_1[6] ) )
    {
        for ( var_2 = 0; var_2 < scripts\mp\class::_id_7FA0(); var_2++ )
            _id_6E00( var_0, "secondary", var_2 );
    }
    else
    {
        foreach ( var_2 in var_1[5] )
            _id_6E00( var_0, "secondary", var_2 );
    }

    if ( isdefined( var_1[7] ) )
        _id_6E0A( var_0, "primary" );

    if ( isdefined( var_1[8] ) )
        _id_6E0A( var_0, "secondary" );

    foreach ( var_8 in var_1[9] )
        _id_6E09( var_0, var_8 );

    if ( isdefined( var_1[10] ) )
        _id_6DFF( var_0 );
    else if ( isdefined( var_1[11] ) )
        _id_6DFF( var_0 );

    if ( isdefined( var_1[12] ) )
        _id_6E07( var_0 );

    return var_0;
}

_id_B02F( var_0 )
{
    var_1 = tablelookup( "mp/menuPowers.csv", 3, var_0, 2 );

    if ( !isdefined( var_1 ) || var_1 != "1" && var_1 != "2" )
        return undefined;

    return scripts\engine\utility::ter_op( var_1 == "1", "primary", "secondary" );
}

weaponunlocksvialoot( var_0 )
{
    switch ( var_0 )
    {
        case "iw7_venomx":
        case "iw7_unsalmg":
        case "iw7_mp28":
        case "iw7_crdb":
        case "iw7_udm45":
        case "iw7_katana":
        case "iw7_nunchucks":
        case "iw7_mag":
        case "iw7_mod2187":
        case "iw7_ba50cal":
        case "iw7_vr":
        case "iw7_minilmg":
        case "iw7_longshot":
        case "iw7_axe":
        case "iw7_gauss":
        case "iw7_revolver":
        case "iw7_tacburst":
        case "iw7_rvn":
            return 1;
    }

    return 0;
}

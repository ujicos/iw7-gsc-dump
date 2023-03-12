// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( !_id_B4E8() )
        return;

    level._id_B8CD = [];
    _id_DEFF( "playerDamaged", ::_id_3BF5 );
    _id_DEFF( "playerKilled", ::_id_3BFE );
    _id_DEFF( "playerKilled", ::_id_3C01 );
    _id_DEFF( "playerUsedKillstreak", ::_id_3C02 );
    _id_DEFF( "playerKillstreakActive", ::_id_3C00 );
    _id_DEFF( "playerAssist", ::_id_3BF3 );
    _id_DEFF( "roundEnd", ::_id_3C04 );
    _id_DEFF( "roundEnd", ::_id_3C03 );
    _id_DEFF( "vehicleKilled", ::_id_3C09 );
    level thread _id_C56E();
    level thread onroundended();
}

onroundended()
{
    level waittill( "game_ended" );

    foreach ( var_1 in level.players )
    {
        var_1.pers["killstreaksKilledByWeapon"] = var_1._id_A6B3;
        var_1.pers["killsPerWeapon"] = var_1._id_A681;
        var_1.pers["shotsLandedLMG"] = var_1.shotslandedlmg;
        var_1.pers["classicKills"] = var_1.classickills;
        var_1.pers["akimboKills"] = var_1.akimbokills;
        var_1.pers["hipfireMagKills"] = var_1.hipfiremagkills;
        var_1.pers["burstFireKills"] = var_1.burstfirekills;
    }
}

_id_823C( var_0 )
{
    for ( var_1 = 0; var_1 < 3; var_1++ )
    {
        var_2 = self getrankedplayerdata( "mp", "weeklyChallengeId", var_1 );
        var_3 = tablelookupbyrow( "mp/weeklyChallengesTable.csv", var_2, 0 );

        if ( var_3 == var_0 )
            return "ch_weekly_" + var_1;
    }

    return "";
}

_id_7E57( var_0 )
{
    for ( var_1 = 0; var_1 < 3; var_1++ )
    {
        var_2 = self getrankedplayerdata( "mp", "dailyChallengeId", var_1 );
        var_3 = tablelookupbyrow( "mp/dailyChallengesTable.csv", var_2, 0 );

        if ( var_3 == var_0 )
            return "ch_daily_" + var_1;
    }

    return "";
}

_id_3BF8( var_0 )
{
    if ( !isenumvaluevalid( "mp", "Challenge", var_0 ) )
        return 0;

    if ( level._id_3C2C[var_0]["type"] == 0 )
        return self getrankedplayerdata( "mp", "challengeProgress", var_0 );
    else if ( level._id_3C2C[var_0]["type"] == 1 )
        return self getrankedplayerdata( "mp", "challengeProgress", _id_7E57( var_0 ) );
    else if ( level._id_3C2C[var_0]["type"] == 2 )
        return self getrankedplayerdata( "mp", "challengeProgress", _id_823C( var_0 ) );
}

_id_3BF9( var_0 )
{
    if ( !isenumvaluevalid( "mp", "Challenge", var_0 ) )
        return 0;

    if ( level._id_3C2C[var_0]["type"] == 0 )
        return self getrankedplayerdata( "mp", "challengeState", var_0 );
    else if ( level._id_3C2C[var_0]["type"] == 1 )
        return self getrankedplayerdata( "mp", "challengeState", _id_7E57( var_0 ) );
    else if ( level._id_3C2C[var_0]["type"] == 2 )
        return self getrankedplayerdata( "mp", "challengeState", _id_823C( var_0 ) );
}

_id_3C05( var_0, var_1 )
{
    if ( level._id_3C2C[var_0]["type"] == 0 )
        return self setrankedplayerdata( "mp", "challengeProgress", var_0, var_1 );
    else if ( level._id_3C2C[var_0]["type"] == 1 )
        return self setrankedplayerdata( "mp", "challengeProgress", _id_7E57( var_0 ), var_1 );
    else if ( level._id_3C2C[var_0]["type"] == 2 )
        return self setrankedplayerdata( "mp", "challengeProgress", _id_823C( var_0 ), var_1 );
}

_id_3C06( var_0, var_1 )
{
    if ( level._id_3C2C[var_0]["type"] == 0 )
        return self setrankedplayerdata( "mp", "challengeState", var_0, var_1 );
    else if ( level._id_3C2C[var_0]["type"] == 1 )
        return self setrankedplayerdata( "mp", "challengeState", _id_7E57( var_0 ), var_1 );
    else if ( level._id_3C2C[var_0]["type"] == 2 )
        return self setrankedplayerdata( "mp", "challengeState", _id_823C( var_0 ), var_1 );
}

_id_3BFA( var_0, var_1 )
{
    if ( level._id_3C2C[var_0]["type"] == 0 )
        return _id_B029( var_0, var_1 );
    else if ( level._id_3C2C[var_0]["type"] == 1 )
        return int( tablelookup( "mp/dailyChallengesTable.csv", 0, var_0, 9 + var_1 * 3 ) );
    else if ( level._id_3C2C[var_0]["type"] == 2 )
        return int( tablelookup( "mp/weeklyChallengesTable.csv", 0, var_0, 9 + var_1 * 3 ) );
}

_id_10117( var_0, var_1 )
{
    var_2 = undefined;
    var_2 = _id_3BF9( var_0 ) - 1;
    var_3 = level._id_3C2C[var_0]["displayParam"];

    if ( !isdefined( var_3 ) )
    {
        var_3 = _id_3BFA( var_0, var_2 );

        if ( var_3 == 0 )
            var_3 = 1;

        var_4 = level._id_3C2C[var_0]["paramScale"];

        if ( isdefined( var_4 ) )
            var_3 = int( var_3 / var_4 );
    }

    var_5 = undefined;

    if ( scripts\mp\utility\game::istrue( var_1 ) )
        var_5 = int( min( var_2, scripts\mp\hud_message::getsplashtablemaxaltdisplays() ) );
    else
    {
        var_6 = _id_2139( var_0 );

        if ( scripts\mp\utility\game::istrue( var_6 ) )
            var_5 = 1;
    }

    thread scripts\mp\hud_message::showsplash( var_0, var_3, undefined, var_5 );
}

_id_B4E8()
{
    return level.rankedmatch;
}

_id_D3D6()
{
    if ( !_id_B4E8() )
        return 0;

    if ( level.players.size < 2 )
        return 0;

    if ( !scripts\mp\utility\game::_id_DCD5() )
        return 0;

    if ( !isplayer( self ) || isai( self ) )
        return 0;

    return 1;
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0._id_A6B3 = var_0.pers["killstreaksKilledByWeapon"];
        var_0 thread _id_989E();

        if ( isai( var_0 ) )
            continue;

        var_0 thread onplayerspawned();
        var_0 thread _id_BA2A();
        var_0 thread _id_B9C0();
        var_0 thread _id_B9ED();
        var_0 thread _id_BA24();
        var_0 thread _id_B9BF();
        var_0 thread _id_BA08();
        var_0 thread _id_B9E9();
        var_0 thread _id_B9E6();
        var_0 thread _id_BA3B();
        var_0 thread _id_B9DA();
        var_0 thread _id_BA29();
        var_0 thread _id_BA1F();
        var_0 thread _id_B9CE();
        var_0 thread _id_B9BA();
        var_0 thread _id_B9DF();
        var_0 thread awardpostshipadjustedtargets();
        var_0 notifyonplayercommand( "hold_breath", "+breath_sprint" );
        var_0 notifyonplayercommand( "hold_breath", "+melee_breath" );
        var_0 notifyonplayercommand( "release_breath", "-breath_sprint" );
        var_0 notifyonplayercommand( "release_breath", "-melee_breath" );
        var_0 thread _id_B9E0();
        var_0 notifyonplayercommand( "jumped", "+goStand" );
        var_0 thread _id_B9F0();

        if ( isdefined( level._id_C978 ) && issubstr( var_0.name, level._id_C978 ) )
        {
            var_0 setrankedplayerdata( "mp", "challengeState", "ch_infected", 2 );
            var_0 setrankedplayerdata( "mp", "challengeProgress", "ch_infected", 1 );
            var_0 setrankedplayerdata( "mp", "challengeState", "ch_plague", 2 );
            var_0 setrankedplayerdata( "mp", "challengeProgress", "ch_plague", 1 );
        }

        var_0 setrankedplayerdata( "common", "round", "weaponsUsed", 0, "none" );
        var_0 setrankedplayerdata( "common", "round", "weaponsUsed", 1, "none" );
        var_0 setrankedplayerdata( "common", "round", "weaponsUsed", 2, "none" );
        var_0 setrankedplayerdata( "common", "round", "weaponXpEarned", 0, 0 );
        var_0 setrankedplayerdata( "common", "round", "weaponXpEarned", 1, 0 );
        var_0 setrankedplayerdata( "common", "round", "weaponXpEarned", 2, 0 );

        if ( randomint( 1001 ) == 1 )
            var_0 setrankedplayerdata( "mp", "plagued", 1 );

        if ( var_0 _id_3BF9( "ch_solar_rig" ) == 1 )
            var_0 thread monitorblackskykills();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        self._id_A686 = [];
        self._id_110E5 = 0;
        self._id_D99C = 0;
        self._id_6A06 = [];
        self._id_69F2 = 0;
        self._id_1119A = [];
        self._id_110E6 = [];
        self.sixthsensesource = [];
        self.relaysource = [];
        self._id_13CB9 = [];
        thread _id_BA1E();
        thread _id_B9B4();
        thread _id_BA33();
        thread _id_B9D5();
        thread _id_BA07();
        thread _id_BA0B();
        thread _id_B9B2();
        thread _id_BA12();
        thread _id_B9D4();
        thread _id_B9EF();
    }
}

monitorblackskykills()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "kill_event_buffered", var_0, var_1 );

        if ( !scripts\mp\utility\game::_id_9E6C( var_1 ) )
        {
            if ( !isdefined( self.pers[self._id_AE62 + "_kills"] ) )
            {
                self.pers[self._id_AE62 + "_kills"] = 1;
                continue;
            }

            self.pers[self._id_AE62 + "_kills"]++;

            if ( isdefined( self.pers["archetype_assault_kills"] ) && self.pers["archetype_assault_kills"] >= 5 && isdefined( self.pers["archetype_heavy_kills"] ) && self.pers["archetype_heavy_kills"] >= 5 && isdefined( self.pers["archetype_scout_kills"] ) && self.pers["archetype_scout_kills"] >= 5 && isdefined( self.pers["archetype_assassin_kills"] ) && self.pers["archetype_assassin_kills"] >= 5 && isdefined( self.pers["archetype_engineer_kills"] ) && self.pers["archetype_engineer_kills"] >= 5 && isdefined( self.pers["archetype_sniper_kills"] ) && self.pers["archetype_sniper_kills"] >= 5 )
                _id_D991( "ch_uber_camo_rig" );
        }
    }
}

monitorweaponpickup( var_0 )
{
    if ( scripts\mp\utility\game::ispickedupweapon( var_0 ) )
    {
        if ( isdefined( self._id_13CB9 ) && !isdefined( self._id_13CB9[var_0] ) )
            self._id_13CB9[var_0] = gettime();
    }
}

awardpostshipadjustedtargets()
{
    self endon( "disconnect" );
    self waittill( "spawned_player" );
    wait 20.0;
    checkpostshipadjustedchallenge( "ch_heavy_ground_pound_kills" );
    checkpostshipadjustedchallenge( "ch_sniper_ballista_collateral" );
    checkpostshipadjustedchallenge( "ch_dd_wins" );
    checkpostshipadjustedchallenge( "ch_siege_wins" );
    checkpostshipadjustedchallenge( "ch_clutch_revives" );
    checkpostshipadjustedchallenge( "ch_perk_kills_tacresist" );
    var_0 = self getrankedplayerdata( "mp", "postShipFlags", 1 );

    if ( var_0 == 0 )
    {
        runonce_checkpostshiprigprogress();
        self setrankedplayerdata( "mp", "postShipFlags", 1, 1 );
    }
}

checkpostshipadjustedchallenge( var_0 )
{
    var_1 = _id_7E22( var_0 );
    var_2 = _id_3BF8( var_0 );
    var_3 = level._id_3C2C[var_0]["targetval"].size - 1;

    if ( var_1 > var_3 )
        return;

    for ( var_4 = level._id_3C2C[var_0]["targetval"][var_1]; var_2 >= var_4; var_4 = level._id_3C2C[var_0]["targetval"][var_1] )
    {
        _id_D991( var_0 );
        var_1 = _id_7E22( var_0 );

        if ( var_1 > var_3 )
            break;
    }
}

awardpostshipchallenge( var_0 )
{
    var_1 = _id_7E22( var_0 );
    var_2 = level._id_3C2C[var_0]["targetval"].size - 1;

    if ( var_1 > var_2 )
        return;

    var_3 = level._id_3C2C[var_0]["targetval"][var_2];

    for ( var_4 = level._id_3C2C[var_0]["targetval"][var_1]; var_3 >= var_4; var_4 = level._id_3C2C[var_0]["targetval"][var_1] )
    {
        _id_D991( var_0 );
        var_1 = _id_7E22( var_0 );

        if ( var_1 > var_2 )
            break;
    }
}

runonce_checkpostshiprigprogress()
{
    var_0 = [ "ch_gold_rig_assault_body", "ch_gold_rig_assault_head", "ch_gold_rig_heavy_body", "ch_gold_rig_heavy_head", "ch_gold_rig_scout_body", "ch_gold_rig_scout_head", "ch_gold_rig_assassin_body", "ch_gold_rig_assassin_head", "ch_gold_rig_engineer_body", "ch_gold_rig_engineer_head", "ch_gold_rig_sniper_body", "ch_gold_rig_sniper_head", "ch_diamond_rig_assault", "ch_diamond_rig_heavy", "ch_diamond_rig_scout", "ch_diamond_rig_assassin", "ch_diamond_rig_engineer", "ch_diamond_rig_sniper", "ch_solar_rig" ];

    foreach ( var_2 in var_0 )
    {
        var_3 = _id_3BF9( var_2 );

        if ( var_3 > 0 )
        {
            thread _id_839C( var_2, var_3 );
            scripts\mp\matchdata::_id_AF99( var_2, var_3 );
            _id_110AE( var_2 );
            _id_8358( level._id_3C2C[var_2]["score"][var_3] );
            thread _id_10117( var_2 );
        }
    }
}

_id_BA12()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    var_0 = 0;

    for (;;)
    {
        self waittill( "scavenger_pickup" );
        _id_D991( "ch_perk_scavenger" );

        if ( !var_0 )
        {
            var_1 = 0;
            var_2 = 0;
            var_3 = self getweaponslistprimaries();

            foreach ( var_5 in var_3 )
            {
                if ( !scripts\mp\utility\game::_id_9D78( var_5 ) && !scripts\mp\weapons::_id_9F54( var_5 ) )
                    continue;

                var_2++;

                if ( self _meth_8127( var_5 ) < 1.0 )
                    break;

                var_1++;
            }

            if ( var_2 > 0 && var_1 == var_2 )
            {
                _id_D991( "ch_scavenger_full_ammo" );
                var_0 = 1;
            }
        }
    }
}

_id_10DC7()
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    thread _id_B9E8();
    wait 5.0;
    self notify( "stopMonitorKillsAfterAbilityActive" );
}

_id_B9E8()
{
    self endon( "stopMonitorKillsAfterAbilityActive" );
    self endon( "remove_super" );
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = undefined;

    if ( isdefined( scripts\mp\supers::_id_7E4E() ) )
        var_0 = scripts\mp\supers::_id_7E4F();
    else
        return;

    for (;;)
    {
        self waittill( "kill_event_buffered", var_1, var_2, var_3, var_4 );

        switch ( var_0 )
        {
            case "super_rewind":
                _id_D991( "ch_ability_rewind" );
                break;
            case "super_teleport":
                _id_D991( "ch_ability_teleport" );
                break;
            case "super_phaseshift":
                _id_D991( "ch_ability_phase_shift" );
                break;
        }
    }
}

_id_D98A( var_0 )
{
    if ( var_0._id_250D )
    {
        switch ( var_0._id_24E8 )
        {
            default:
                break;
            case "super_amplify":
                _id_D991( "ch_ability_amplify" );
                break;
            case "super_overdrive":
                _id_D991( "ch_ability_overdrive" );
                break;
            case "super_chargemode":
                _id_D991( "ch_ability_bull_charge" );
                break;
            case "super_armorup":
                _id_D991( "ch_ability_reactive_armor" );
                break;
            case "super_reaper":
                _id_D991( "ch_ability_reaper" );
                break;
        }
    }

    if ( scripts\mp\utility\game::istrue( var_0.attackervisionpulsedvictim ) )
        _id_D991( "ch_ability_pulsar" );

    if ( scripts\mp\utility\game::istrue( var_0.attackerhassupertrophyout ) )
        _id_D991( "ch_ability_centurion" );

    if ( isdefined( var_0.sweapon ) && var_0.sweapon == "micro_turret_gun_mp" )
        _id_D991( "ch_ability_micro_turret" );

    if ( isdefined( var_0._id_B930 ) && isdefined( self._id_B930["super_kill_medal"] ) && self._id_B930["super_kill_medal"] == "super_invisible" )
        _id_D991( "ch_ability_active_camo" );
}

_id_B9C2()
{
    self endon( "bounceKillCancel" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "bounceKillVerify" );
        _id_D991( "ch_darkops_bounce" );
    }
}

_id_BA36()
{
    self endon( "tripleStopCancel" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "tripleStopVerify" );

        if ( self._id_127D0 == 3 )
        {
            _id_D991( "ch_darkops_slidestop" );
            self._id_127D0 = undefined;
            break;
        }
    }
}

_id_D998( var_0, var_1, var_2 )
{
    if ( var_0.team != self.team && ( var_1 == "drone_hive_projectile_mp" || var_1 == "switch_blade_child_mp" ) )
    {
        var_3 = 0;
        var_4 = 0;

        foreach ( var_6 in level.players )
        {
            if ( !isdefined( var_6.team ) )
                continue;

            if ( !scripts\mp\utility\game::isreallyalive( var_6 ) )
                continue;

            if ( var_6.team == self.team )
            {
                var_7 = scripts\mp\domeshield::_id_7E80( var_6 );

                if ( !isdefined( var_7 ) )
                    continue;

                var_8 = var_7._id_58EF;

                if ( !isdefined( var_8 ) )
                    continue;

                if ( var_8 == var_2 )
                {
                    if ( var_6 == self )
                    {
                        var_4 = 1;
                        continue;
                    }

                    var_3++;
                }
            }
        }

        if ( var_4 && var_3 > 1 )
            _id_D991( "ch_darkops_chrome" );
    }
}

_id_D997( var_0 )
{
    _id_D9AF( var_0 );
}

_id_D996( var_0 )
{
    if ( isdefined( var_0._id_94B7 ) )
    {
        if ( var_0._id_94B7 )
            _id_D991( "ch_darkops_howthe" );
    }

    if ( scripts\engine\utility::_id_9D74( var_0.smeansofdeath ) && var_0._id_24E3 == 0 && !scripts\mp\utility\game::_id_9E6C( var_0.sweapon ) )
    {
        if ( isdefined( self._id_127D0 ) )
        {
            self._id_127D0++;
            self notify( "tripleStopVerify" );
        }
        else
        {
            self._id_127D0 = 1;
            thread _id_BA36();
        }
    }
    else
    {
        self._id_127D0 = undefined;
        self notify( "tripleStopCancel" );
    }

    if ( isdefined( var_0._id_B930["headshot"] ) && var_0._id_92BE & level.idflags_no_team_protection )
    {
        if ( isdefined( self._id_2F04 ) )
            self notify( "bounceKillVerify" );
        else
        {
            thread _id_B9C2();
            self._id_2F04 = 1;
        }
    }
    else
    {
        self notify( "bounceKillCancel" );
        self._id_2F04 = undefined;
    }

    if ( isdefined( var_0._id_1337C ) && isdefined( var_0._id_1337A ) && isdefined( var_0._id_250D ) && isdefined( var_0._id_24E8 ) )
    {
        if ( var_0._id_1337C && var_0._id_250D && var_0._id_1337A == "super_phaseshift" && var_0._id_24E8 == "super_phaseshift" )
            _id_D991( "ch_darkops_phase" );
    }

    if ( isdefined( var_0.sweapon ) )
    {
        var_1 = scripts\mp\utility\game::_id_8234( var_0.sweapon );

        if ( var_1 == "iw7_revolver" && scripts\mp\utility\game::_id_13C90( var_0.sweapon, "akimbo" ) && scripts\mp\utility\game::_id_13C90( var_0.sweapon, "fastaim" ) && scripts\mp\weapons::_id_13C98( var_0.sweapon ) )
            _id_D991( "ch_darkops_no_idea" );
    }
}

processrigkillchallengesonkill_delayed( var_0 )
{
    var_0.attacker _id_D991( "ch_" + var_0.attackerarchetype + "_kills" );

    if ( isdefined( var_0.attackerkillsthislife ) && _id_9EBC( var_0.attackerkillsthislife, 3 ) )
        var_0.attacker _id_D991( "ch_" + var_0.attackerarchetype + "_3streak" );

    if ( isdefined( var_0._id_2504 ) )
    {
        if ( _id_9EBC( var_0._id_2504, 2 ) )
        {
            var_0.attacker _id_D991( "ch_" + var_0.attackerarchetype + "_2multikill" );

            if ( isdefined( var_0._id_2506 ) && var_0._id_2506 == "specialty_boom" )
                var_0.attacker _id_D991( "ch_assault_ping_2multi" );
        }
    }

    if ( isdefined( var_0._id_2506 ) && var_0._id_2506 == "specialty_scavenger_eqp" )
    {
        var_1 = scripts\mp\utility\game::_id_7E9D( var_0.sweapon );

        if ( isdefined( var_1 ) && var_1 == "lethal" )
            var_0.attacker _id_D991( "ch_assault_resupply_lethal_kills" );
    }

    if ( isdefined( var_0._id_2506 ) && var_0._id_2506 == "specialty_rugged_eqp" )
    {
        if ( scripts\mp\utility\game::istrue( var_0.wasplantedmine ) )
            var_0.attacker _id_D991( "ch_engineer_hardened_kill" );
    }

    if ( isdefined( var_0.sweapon ) && var_0.sweapon == "iw7_reaperblade_mp" && isdefined( var_0._id_24F3[var_0.sweapon] ) && _id_9EBC( var_0._id_24F3[var_0.sweapon], 4 ) )
        var_0.attacker _id_D991( "ch_scout_reaper_4multi" );

    if ( isdefined( var_0._id_2506 ) && var_0._id_2506 == "specialty_ftlslide" && var_0._id_24EF && scripts\mp\utility\game::istrue( var_0._id_B930["slidekill"] ) )
        var_0.attacker _id_D991( "ch_assassin_ads_slide_kill" );

    if ( isdefined( var_0.attackersixthsensesource ) && scripts\mp\utility\game::istrue( var_0.attackersixthsensesource[var_0.victimid] ) )
        var_0.attacker _id_D991( "ch_assassin_perception_revenge" );

    if ( isdefined( var_0.attackerrelaysource ) && scripts\mp\utility\game::istrue( var_0.attackerrelaysource[var_0.victimid] ) )
        var_0.attacker _id_D991( "ch_engineer_relay_kill" );

    if ( isdefined( var_0._id_2506 ) && var_0._id_2506 == "specialty_rearguard" )
    {
        if ( isdefined( var_0.attackerrearguardattackers ) && isdefined( var_0.attackerrearguardattackers[var_0.victimid] ) )
            var_0.attacker _id_D991( "ch_sniper_rearguard_kill" );
    }
}

_id_D9A8( var_0 )
{
    if ( !isdefined( var_0._id_B930["superShutdown"] ) )
        return;

    switch ( var_0._id_B930["superShutdown"] )
    {
        case "super_claw":
            _id_D991( "ch_killjoy_assault_weapon" );
            break;
        case "super_steeldragon":
            _id_D991( "ch_killjoy_armor_weapon" );
            break;
        case "super_armmgs":
            _id_D991( "ch_killjoy_synaptic_weapon" );
            break;
        case "super_atomizer":
            _id_D991( "ch_killjoy_ftl_weapon" );
            break;
        case "super_blackholegun":
            _id_D991( "ch_killjoy_six_weapon" );
            break;
        case "super_penetrationrailgun":
            _id_D991( "ch_killjoy_ghost_weapon" );
            break;
        case "super_overdrive":
        case "super_amplify":
            _id_D991( "ch_killjoy_assault_ability" );
            break;
        case "super_armorup":
        case "super_chargemode":
            _id_D991( "ch_killjoy_armor_ability" );
            break;
        case "super_reaper":
        case "super_rewind":
            _id_D991( "ch_killjoy_synaptic_ability" );
            break;
        case "super_phaseshift":
        case "super_teleport":
            _id_D991( "ch_killjoy_ftl_ability" );
            break;
        case "super_visionpulse":
        case "super_invisible":
            _id_D991( "ch_killjoy_ghost_ability" );
            break;
    }
}

_id_D995()
{
    if ( self iswallrunning() )
        _id_D991( "ch_darkops_epic_run" );
    else if ( self _meth_81BE() )
        _id_D991( "ch_darkops_epic_slide" );
}

_id_D9B1( var_0 )
{
    if ( var_0 getrankedplayerdata( "mp", "plagued" ) )
    {
        self setrankedplayerdata( "mp", "plagued", 1 );
        _id_D991( "ch_darkops_plague" );
    }
}

_id_D9BE( var_0 )
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );

    if ( isdefined( var_0.guid ) )
        self endon( "killedPlayer" + var_0.guid );

    wait 60.0;
    _id_D991( "ch_darkops_warchief" );
}

_id_D9AF( var_0 )
{
    foreach ( var_2 in level.players )
    {
        if ( !isdefined( var_2.team ) )
            continue;

        if ( var_2.team != var_0.team )
        {
            if ( !isdefined( var_2._id_114ED ) )
                var_2._id_114ED = [];

            var_2._id_114ED[var_0.guid] = [];
        }
    }
}

_id_D9B7( var_0, var_1, var_2 )
{
    if ( !isdefined( self._id_114ED ) )
        self._id_114ED = [];

    if ( self.team == var_0.team )
        return;

    if ( var_0.health - var_2 > 0 )
    {
        if ( !isdefined( self._id_114ED[var_0.guid] ) )
            self._id_114ED[var_0.guid] = [];

        var_3 = getweaponbasename( var_1 );

        if ( !isdefined( self._id_114ED[var_0.guid][var_3] ) )
        {
            self._id_114ED[var_0.guid][var_3] = 1;

            if ( self._id_114ED[var_0.guid].size == 4 )
                _id_D991( "ch_darkops_chimp" );
        }
    }
}

_id_D9BB( var_0 )
{
    if ( !isdefined( var_0._id_2506 ) )
        return;

    switch ( var_0._id_2506 )
    {
        default:
            break;
        case "specialty_man_at_arms":
            _id_D991( "ch_trait_man_at_arms" );
            break;
        case "specialty_rush":
            _id_D991( "ch_trait_momentum" );
            break;
        case "specialty_afterburner":
            _id_D991( "ch_trait_rushdown" );
            break;
        case "specialty_rearguard":
            _id_D991( "ch_trait_perch" );
            break;
    }

    if ( isdefined( var_0.sweapon ) )
    {
        if ( var_0.sweapon == "groundpound_mp" )
            _id_D991( "ch_heavy_ground_pound_kills" );

        if ( var_0.sweapon == "thruster_mp" )
            _id_D991( "ch_scout_afterburner_kill" );
    }
}

monitorsuperscoreearned()
{
    self endon( "disconnect" );
    self endon( "super_use_finished" );
    self endon( "death" );
    level endon( "game_ended" );
    self notify( "monitorSuperScoreEarned" );
    self endon( "monitorSuperScoreEarned" );

    if ( level.gametype == "dm" )
        var_0 = self.pers["gamemodeScore"] + 500;
    else
        var_0 = self.score + 500;

    var_1 = 0;

    for (;;)
    {
        if ( level.gametype == "dm" )
            var_2 = self.pers["gamemodeScore"];
        else
            var_2 = self.score;

        if ( var_2 >= var_0 )
        {
            var_0 += 500;
            _id_D991( "ch_assault_amplify_score" );
        }

        scripts\engine\utility::waitframe();
    }
}

_id_BA2B()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "monitorSuperWeaponKills" );
    self endon( "monitorSuperWeaponKills" );

    for (;;)
    {
        self waittill( "super_weapon_kill", var_0 );
        var_1 = int( self._id_112A8 / 3 );
        self._id_112A8 %= 3;

        while ( var_1 > 0 )
        {
            var_1--;
            var_0 = scripts\mp\utility\game::_id_821D( var_0 );

            switch ( var_0 )
            {
                case "iw7_claw_mp":
                    _id_D991( "ch_super_streak_assault" );
                    break;
                case "iw7_steeldragon_mp":
                    _id_D991( "ch_super_streak_armor" );
                    break;
                case "iw7_armmgs_mp":
                    _id_D991( "ch_super_streak_synaptic" );
                    break;
                case "iw7_atomizer_mp":
                    _id_D991( "ch_super_streak_ftl" );
                    break;
                case "iw7_blackholegun_mp":
                    _id_D991( "ch_super_streak_six" );
                    break;
                case "iw7_penetrationrail_mp":
                    _id_D991( "ch_super_streak_ghost" );
                    break;
            }
        }
    }
}

updatesuperkills( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) || !isdefined( var_2 ) )
        return;

    switch ( var_0 )
    {
        case "super_overdrive":
            if ( _id_9EBC( var_2, 2 ) )
                _id_D991( "ch_assault_overdrive_2multi" );

            break;
        case "super_chargemode":
            if ( _id_9EBC( var_2, 2 ) )
                _id_D991( "ch_heavy_bullcharge_multi" );

            break;
        case "super_teleport":
            if ( var_1 == "MOD_MELEE" )
                _id_D991( "ch_assassin_jump_melee" );

            break;
        case "super_invisible":
            if ( var_1 == "MOD_MELEE" )
                _id_D991( "ch_sniper_camo_melee" );

            break;
        case "super_visionpulse":
            if ( _id_9EBC( var_2, 2 ) )
                _id_D991( "ch_sniper_pulsar_2multi" );

            break;
    }
}

_id_12F33( var_0, var_1 )
{
    if ( !isdefined( self._id_112A8 ) )
        return;
    else
        self._id_112A8++;

    self notify( "super_weapon_kill", var_0 );
    var_0 = scripts\mp\utility\game::_id_821D( var_0 );

    switch ( var_0 )
    {
        case "iw7_claw_mp":
            _id_D991( "ch_super_weapon_assault" );
            break;
        case "iw7_steeldragon_mp":
            _id_D991( "ch_super_weapon_armor" );
            break;
        case "iw7_armmgs_mp":
            _id_D991( "ch_super_weapon_synaptic" );
            break;
        case "iw7_atomizer_mp":
            _id_D991( "ch_super_weapon_ftl" );
            break;
        case "iw7_blackholegun_mp":
            _id_D991( "ch_super_weapon_six" );

            if ( isdefined( var_1 ) )
            {
                if ( !isdefined( var_1.kills ) )
                    var_1.kills = 1;
                else
                    var_1.kills++;

                if ( _id_9EBC( var_1.kills, 2 ) )
                    _id_D991( "ch_engineer_bhgun_3multi" );
            }

            break;
        case "iw7_penetrationrail_mp":
            _id_D991( "ch_super_weapon_ghost" );
            break;
    }
}

_id_BA2A()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "super_use_started" );
        var_0 = scripts\mp\supers::_id_7E4F();

        if ( isdefined( var_0 ) && var_0 == "super_phaseshift" && self.health < self.maxhealth )
            _id_D991( "ch_assassin_damaged_phase_shift" );

        if ( isdefined( var_0 ) && var_0 == "super_amplify" )
            thread monitorsuperscoreearned();

        self._id_112A8 = 0;
        thread _id_BA2B();
        thread _id_10DC7();
    }
}

_id_B9DF()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "healed" );

        if ( isdefined( self._id_11B2C ) && self._id_11B2C == "specialty_regenfaster" )
            _id_D991( "ch_heavy_icu_heals" );
    }
}

_id_BA24()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "received_earned_killstreak" );

        if ( _id_66B8( "specialty_hardline" ) )
            _id_D991( "ch_perk_hardline" );

        wait 0.05;
    }
}

_id_B9BF()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "survived_explosion", var_0 );

        if ( isdefined( var_0 ) && isplayer( var_0 ) && self == var_0 )
            continue;

        if ( self _meth_81A7( "specialty_blastshield", "perk" ) && scripts\mp\utility\game::_id_12D6( "specialty_blastshield" ) )
            _id_D992( "ch_blastshield" );

        scripts\engine\utility::waitframe();
    }
}

_id_989E()
{
    self._id_6A00 = [];

    if ( !isdefined( self._id_A681 ) )
    {
        self._id_A681 = self.pers["killsPerWeapon"];

        if ( !isdefined( self._id_A681 ) )
            self._id_A681 = [];
    }

    if ( !isdefined( self.shotslandedlmg ) )
    {
        self.shotslandedlmg = self.pers["shotsLandedLMG"];

        if ( !isdefined( self.shotslandedlmg ) )
            self.shotslandedlmg = 0;
    }

    if ( !isdefined( self.classickills ) )
    {
        self.classickills = self.pers["classicKills"];

        if ( !isdefined( self.classickills ) )
            self.classickills = 0;
    }

    if ( !isdefined( self.akimbokills ) )
    {
        self.akimbokills = self.pers["akimboKills"];

        if ( !isdefined( self.akimbokills ) )
            self.akimbokills = 0;
    }

    if ( !isdefined( self.hipfiremagkills ) )
    {
        self.hipfiremagkills = self.pers["hipfireMagKills"];

        if ( !isdefined( self.hipfiremagkills ) )
            self.hipfiremagkills = 0;
    }

    if ( !isdefined( self.burstfirekills ) )
    {
        self.burstfirekills = self.pers["burstFireKills"];

        if ( !isdefined( self.burstfirekills ) )
            self.burstfirekills = 0;
    }
}

_id_DEFF( var_0, var_1 )
{
    if ( !isdefined( level._id_B8CD[var_0] ) )
        level._id_B8CD[var_0] = [];

    level._id_B8CD[var_0][level._id_B8CD[var_0].size] = var_1;
}

_id_7E22( var_0 )
{
    if ( isdefined( self._id_3C2A[var_0] ) )
        return self._id_3C2A[var_0];
    else
        return 0;
}

_id_3BF3( var_0 )
{
    var_1 = var_0.player;

    if ( isdefined( var_0.sweapon ) && scripts\mp\utility\game::_id_9E6C( var_0.sweapon ) )
        var_1 _id_D991( "ch_lifetime_streak_assists" );
}

_id_3C02( var_0 )
{
    var_1 = var_0.player;
    var_1 _id_D991( "ch_lifetime_streaks_used" );
}

_id_3C00( var_0 )
{
    var_1 = var_0.player;
    var_2 = 0;
    var_3 = 0;

    foreach ( var_5 in level._id_1655 )
    {
        if ( var_5.owner == var_1 )
        {
            if ( var_5._id_110EA == "sentry_shock" )
            {
                var_2++;

                if ( var_2 == 2 )
                    var_1 _id_D991( "ch_two_sentries" );
            }

            continue;
        }

        if ( var_5._id_110EA == "uav" || var_5._id_110EA == "directional_uav" )
            var_3 = 1;
    }

    if ( var_3 && var_0._id_A6A7 == "counter_uav" )
        var_1 _id_D991( "ch_counter_other_uav" );

    if ( var_0._id_A6A7 == "jammer" )
        return;
}

_id_3C01( var_0 )
{
    if ( !isdefined( var_0.attacker ) || !isplayer( var_0.attacker ) )
        return;

    if ( !isdefined( var_0.sweapon ) || !scripts\mp\utility\game::_id_9E6C( var_0.sweapon ) )
        return;

    var_1 = var_0.attacker;
    var_2 = _id_7F48( var_0.sweapon );

    switch ( var_2 )
    {
        case "sentry_shock":
            var_1 _id_D991( "ch_scorestreak_kills_sentry" );
            break;
        case "ball_drone_backup":
            var_1 _id_D991( "ch_scorestreak_kills_vulture" );
            break;
        case "drone_hive":
            var_1 _id_D991( "ch_scorestreak_kills_trinity" );
            break;
        case "precision_airstrike":
            var_1 _id_D991( "ch_scorestreak_kills_airstrike" );
            break;
        case "minijackal":
            var_1 _id_D991( "ch_scorestreak_kills_apex" );
            break;
        case "thor":
            var_1 _id_D991( "ch_scorestreak_kills_thor" );
            break;
        case "bombardment":
            var_1 _id_D991( "ch_scorestreak_kills_bombardment" );
            break;
        case "remote_c8":
            if ( isdefined( var_1._id_4BE1 ) && var_1._id_4BE1 == "MANUAL" )
                var_1 _id_D991( "ch_rc8_controlled_kills" );

            var_1 _id_D991( "ch_scorestreak_kills_rc8" );
            break;
        case "venom":
            var_1 _id_D991( "ch_scorestreak_kills_scarab" );
            break;
        case "jackal":
            var_1 _id_D991( "ch_scorestreak_kills_warden" );
            break;
    }

    var_1 _id_D991( "ch_lifetime_streak_kills" );
}

_id_7F48( var_0 )
{
    if ( isdefined( level._id_A6C5[var_0] ) )
        return level._id_A6C5[var_0];

    return undefined;
}

_id_9E4B( var_0 )
{
    var_1 = 0;

    switch ( level.gametype )
    {
        case "sd":
        case "dd":
        case "sr":
            foreach ( var_3 in level._id_2C7A )
            {
                var_4 = distancesquared( var_3.trigger.origin, var_0 );

                if ( var_4 < 90000 )
                {
                    var_1 = 1;
                    break;
                }
            }

            break;
        case "dom":
            foreach ( var_3 in level._id_C2A8 )
            {
                var_4 = distancesquared( var_3.origin, var_0 );

                if ( var_4 < 90000 )
                {
                    var_1 = 1;
                    break;
                }
            }

            break;
        case "siege":
            foreach ( var_3 in level._id_0134 )
            {
                var_4 = distancesquared( var_3.origin, var_0 );

                if ( var_4 < 90000 )
                {
                    var_1 = 1;
                    break;
                }
            }

            break;
        case "grind":
            foreach ( var_3 in level._id_13FC1 )
            {
                var_4 = distancesquared( var_3.origin, var_0 );

                if ( var_4 < 90000 )
                {
                    var_1 = 1;
                    break;
                }
            }

            break;
        case "grnd":
        case "koth":
            var_1 = ispointinvolume( var_0, level.zone.gameobject.trigger );
            break;
    }

    return var_1;
}

_id_9DBA( var_0 )
{
    var_1 = 0;

    switch ( level.gametype )
    {
        case "sd":
        case "dd":
        case "sr":
            if ( self.team != game["defenders"] )
                break;

            foreach ( var_3 in level._id_2C7A )
            {
                var_4 = distancesquared( var_3.trigger.origin, var_0 );

                if ( var_4 < 90000 )
                {
                    var_1 = 1;
                    break;
                }
            }

            break;
        case "dom":
            foreach ( var_3 in level._id_5913 )
            {
                if ( self.team != var_3 scripts\mp\gameobjects::_id_803E() )
                    continue;

                var_4 = distancesquared( var_3.curorigin, var_0 );

                if ( var_4 < 90000 )
                {
                    var_1 = 1;
                    break;
                }
            }

            break;
        case "siege":
            foreach ( var_3 in level._id_5913 )
            {
                if ( self.team != var_3 scripts\mp\gameobjects::_id_803E() )
                    continue;

                var_4 = distancesquared( var_3.curorigin, var_0 );

                if ( var_4 < 90000 )
                {
                    var_1 = 1;
                    break;
                }
            }

            break;
        case "grind":
            break;
        case "koth":
            var_1 = ispointinvolume( self.origin, level.zone.gameobject.trigger ) || ispointinvolume( var_0, level.zone.gameobject.trigger );
            break;
    }

    return var_1;
}

_id_D9BC( var_0, var_1 )
{
    switch ( var_1 )
    {
        case "uav":
            var_0 _id_D991( "ch_scorestreak_assists_uav" );
            break;
        case "counter_uav":
            var_0 _id_D991( "ch_scorestreak_assists_cuav" );
            break;
        case "directional_uav":
            var_0 _id_D991( "ch_scorestreak_assists_auav" );
            break;
    }

    var_0 _id_D991( "ch_lifetime_streak_assists" );
}

_id_3C09( var_0 )
{
    if ( !isdefined( var_0.attacker ) || !isplayer( var_0.attacker ) )
        return;

    var_1 = var_0.attacker;
}

_id_D98F( var_0 )
{
    switch ( var_0 )
    {
        case "quad_feed":
            _id_D991( "ch_quad_feed" );
            break;
        case "one_shot_two_kills":
            _id_D991( "ch_collateral" );
            break;
        case "first_place_kill":
            _id_D991( "ch_kill_1st_place" );
            break;
        case "gun_butt":
            _id_D991( "ch_gun_butt" );
            break;
        case "backfire":
            _id_D991( "ch_owner_kill" );
            break;
        case "item_impact":
            _id_D991( "ch_direct_impact" );
            break;
    }

    if ( var_0 == "longshot" && self._id_26D9["longshot"] == 1 && isdefined( self._id_26D9["pointblank"] ) || var_0 == "pointblank" && self._id_26D9["pointblank"] == 1 && isdefined( self._id_26D9["longshot"] ) )
        _id_D991( "ch_longshot_pointblank" );
}

_id_3BF6( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    var_6 = self;

    if ( isplayer( var_1 ) )
    {
        if ( isexplosivedamagemod( var_3 ) )
        {
            if ( var_2 < var_6.health )
            {
                if ( isdefined( var_6 ) )
                {
                    var_6._id_6A06[var_1.guid] = var_1;

                    if ( isdefined( var_6._id_69F2 ) )
                    {
                        var_6._id_69F2++;

                        if ( var_6._id_69F2 == 3 )
                            var_6 _id_D991( "ch_blastshield_hits" );
                    }
                }
            }
        }

        var_1 _id_D9B7( var_6, var_4, var_2 );
    }
}

_id_3BF5( var_0, var_1 )
{
    var_2 = var_0.attacker;
    var_3 = var_0.victim;

    if ( !isdefined( var_2 ) || !isplayer( var_2 ) || !isalive( var_2 ) )
        return;

    var_1 = var_0.time;

    if ( issubstr( var_0.smeansofdeath, "MOD_MELEE" ) )
    {
        if ( var_3.health > 0 )
            var_2 thread _id_D9BE( var_3 );

        var_2 _id_D9B1( var_3 );
    }
}

_id_3BFF( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !isdefined( var_1 ) || !isplayer( var_1 ) )
        return;

    if ( var_5 == "throwingknifec4_mp" )
    {
        if ( var_4 == "MOD_IMPACT" )
            var_1._id_A949 = gettime();
        else if ( var_4 == "MOD_EXPLOSIVE" && isdefined( var_1._id_A949 ) )
        {
            var_9 = gettime() - var_1._id_A949;

            if ( var_9 <= 50 )
                var_1 _id_D991( "ch_biospike_double" );
        }
    }

    if ( var_5 == "micro_turret_gun_mp" && isdefined( var_0 ) )
    {
        if ( !isdefined( var_0.kills ) )
            var_0.kills = 1;
        else
            var_0.kills++;

        if ( _id_9EBC( var_0.kills, 2 ) )
            var_1 _id_D991( "ch_engineer_micro_turret_2multi" );
    }

    if ( scripts\mp\utility\game::_id_9E6C( var_5 ) )
    {
        var_10 = _id_7F48( var_5 );

        if ( !isdefined( var_1._id_A6A5 ) )
            var_1._id_A6A5 = [];

        if ( isdefined( var_0 ) && isdefined( var_0._id_1653 ) )
        {
            if ( !isdefined( var_1._id_A6A5[var_0._id_1653] ) )
            {
                var_11 = spawnstruct();
                var_11._id_A6A7 = var_10;
                var_11.kills = 1;
                var_11._id_C2A4 = scripts\engine\utility::ter_op( _id_9E4B( var_0.origin ), 1, 0 );
                var_1._id_A6A5[var_0._id_1653] = var_11;
            }
            else
            {
                var_1._id_A6A5[var_0._id_1653].kills++;

                if ( _id_9E4B( var_0.origin ) )
                    var_1._id_A6A5[var_0._id_1653]._id_C2A4++;
            }
        }
        else
        {

        }

        switch ( var_10 )
        {
            case "sentry_shock":
                if ( _id_9EBC( var_1._id_A6A5[var_0._id_1653]._id_C2A4, 3 ) )
                    var_1 _id_D991( "ch_sentry_defender" );

                if ( _id_9EBC( var_1._id_A6A5[var_0._id_1653].kills, 5 ) )
                    var_1 _id_D991( "ch_sentry_streak" );

                break;
            case "ball_drone_backup":
                break;
            case "drone_hive":
                if ( var_1._id_DDC3[var_5] > 0 && var_1._id_DDC3[var_5] % 3 == 0 )
                    var_1 _id_D991( "ch_scorestreak_triple_kills" );

                break;
            case "precision_airstrike":
                if ( var_1._id_DDC3[var_5] > 0 && var_1._id_DDC3[var_5] % 3 == 0 )
                    var_1 _id_D991( "ch_scorestreak_triple_kills" );

                break;
            case "minijackal":
                if ( var_1._id_DDC3[var_5] > 0 && var_1._id_DDC3[var_5] % 3 == 0 )
                    var_1 _id_D991( "ch_scorestreak_triple_kills" );

                break;
            case "thor":
                if ( var_1._id_DDC3[var_5] > 0 && var_1._id_DDC3[var_5] % 3 == 0 )
                    var_1 _id_D991( "ch_scorestreak_triple_kills" );

                break;
            case "bombardment":
                if ( var_1._id_DDC3[var_5] > 0 && var_1._id_DDC3[var_5] % 3 == 0 )
                    var_1 _id_D991( "ch_scorestreak_triple_kills" );

                break;
            case "remote_c8":
                break;
            case "venom":
                if ( var_1._id_DDC3[var_5] > 0 && var_1._id_DDC3[var_5] % 2 == 0 )
                    var_1 _id_D991( "ch_scorestreak_double_scarab" );

                if ( self iswallrunning() )
                    var_1 _id_D991( "ch_scarab_wall_kill" );

                break;
            case "jackal":
                if ( var_1._id_DDC3[var_5] > 0 && var_1._id_DDC3[var_5] % 3 == 0 )
                    var_1 _id_D991( "ch_scorestreak_triple_kills" );

                break;
        }
    }

    var_1 _id_D98B();
    var_1 _id_D997( self );
}

_id_3BFE( var_0, var_1 )
{
    var_2 = var_0.attacker;
    var_3 = var_0.victim;

    if ( !isdefined( var_2 ) || !isplayer( var_2 ) )
        return;

    var_1 = var_0.time;
    var_2 _id_D991( "ch_lifetime_kills" );

    if ( isdefined( var_0.victim ) && isdefined( var_0.victim.guid ) )
        var_2 notify( "killedPlayer" + var_0.victim.guid );

    _id_D9D8( var_0, var_2 );
    _id_D9AE( var_0, var_1, var_2, var_3 );
    _id_D9B9( var_0, var_1, var_2, var_3 );
    _id_D9B2( var_0, var_1, var_2, var_3 );
    _id_D9B0( var_0, var_1, var_2, var_3 );
    var_2 _id_D98A( var_0 );
    var_2 _id_D9BB( var_0 );
    var_2 _id_D9A8( var_0 );
    var_2 _id_D996( var_0 );
    var_2 processrigkillchallengesonkill_delayed( var_0 );

    if ( isdefined( var_0._id_13374 ) )
    {
        var_4 = var_0._id_13374[var_2.guid];

        if ( scripts\mp\utility\game::istrue( var_4._id_54B3 ) && var_0._id_9D74 )
            var_2 _id_D991( "ch_lethal_bullet_combo" );

        if ( scripts\mp\utility\game::istrue( var_4.isprimary ) && scripts\mp\utility\game::_id_9D79( var_0.sweapon ) )
            var_2 _id_D991( "ch_swap_kill" );

        if ( isdefined( var_0._id_24E0 ) )
        {
            if ( isdefined( var_0._id_24E0[var_3.guid] ) )
            {
                if ( !scripts\mp\utility\game::istrue( var_4._id_54BD ) )
                    var_2 _id_D991( "ch_hurt_melee_kill" );
            }
        }
    }

    if ( var_0._id_24F6.size > 0 )
        var_2 _id_D9B8();

    if ( isdefined( var_0._id_24F2[var_3.guid] ) )
    {
        var_5 = var_0._id_24F2[var_3.guid];

        if ( _id_9EBC( var_5, 5 ) )
            var_2 _id_D991( "ch_repeat_kill" );
    }

    if ( var_0._id_24E1 )
        var_2 _id_D991( "ch_while_stunned_kill" );

    if ( var_0._id_13375 )
        var_2 _id_D991( "ch_stun_kill" );

    if ( scripts\mp\utility\game::istrue( var_0._id_24EA ) )
        var_2 _id_D991( "ch_tactical_smoke" );

    if ( scripts\mp\utility\game::istrue( var_0._id_2501 ) )
        var_2 _id_D991( "ch_tactical_radar" );

    if ( _id_9E8A( var_0.shitloc ) )
        var_2 _id_D991( "ch_lower_body_kill" );

    if ( scripts\mp\utility\game::istrue( var_0._id_2511 ) )
        var_2 _id_D991( "ch_pre_adrenaline" );

    if ( isdefined( var_0._id_13377 ) )
    {
        if ( var_0._id_13377 == var_2 )
            var_2 _id_D991( "ch_dome_defense" );

        if ( var_0._id_13377 == var_3 )
            var_2 _id_D991( "ch_dome_assault" );
    }

    if ( isdefined( var_3.debuffedbyplayers ) )
    {
        var_6 = var_2 getentitynumber();

        if ( isdefined( var_0._id_13376["cryo_mine_mp"] ) && isdefined( var_0._id_13376["cryo_mine_mp"][var_6] ) )
            var_2 _id_D991( "ch_tactical_cryomine" );

        if ( isdefined( var_0._id_13376["blackout_grenade_mp"] ) && isdefined( var_0._id_13376["blackout_grenade_mp"][var_6] ) )
            var_2 _id_D991( "ch_tactical_blackout" );

        if ( isdefined( var_0._id_13376["emp_grenade_mp"] ) && isdefined( var_0._id_13376["emp_grenade_mp"][var_6] ) || isdefined( var_0._id_13376["concussion_grenade_mp"] ) && isdefined( var_0._id_13376["concussion_grenade_mp"][var_6] ) )
            var_2 _id_D991( "ch_tactical_concussion" );
    }

    if ( isdefined( var_0._id_24E9[var_3.guid] ) )
        var_2 _id_D991( "ch_blastshield_revenge" );

    var_7 = [];

    foreach ( var_9 in var_0._id_24FD )
    {
        var_10 = scripts\mp\perks::_id_805C( var_9 );

        if ( isdefined( var_10 ) )
        {
            if ( !isdefined( var_7[var_10] ) )
            {
                var_7[var_10] = 1;
                continue;
            }

            var_7[var_10]++;
        }
    }

    if ( isdefined( var_7[1] ) && var_7[1] == 2 )
        var_2 _id_D991( "ch_perk_1_combo" );

    if ( isdefined( var_7[2] ) && var_7[2] == 2 )
        var_2 _id_D991( "ch_perk_2_combo" );

    if ( isdefined( var_7[3] ) && var_7[3] == 2 )
        var_2 _id_D991( "ch_perk_3_combo" );

    if ( scripts\mp\utility\game::_id_9E6C( var_0.sweapon ) && !_id_1C97( var_2, var_0.sweapon ) )
        return;

    _id_D9C8( var_0, var_1, var_2, var_3 );

    if ( isdefined( var_0._id_24F8 ) && var_0.time - var_0._id_24F8 < 4500 )
        var_2 _id_D991( "ch_use_gesture" );

    if ( isdefined( var_3._id_A6AE ) )
    {
        foreach ( var_13 in var_3._id_A6AE )
        {
            if ( var_13.owner == var_2 )
            {
                switch ( var_13._id_A6A7 )
                {
                    case "remote_c8":
                        var_2 _id_D991( "ch_rc8_defense" );
                        break;
                }
            }
        }
    }
}

_id_D98B()
{
    if ( isdefined( level._id_1655 ) )
    {
        foreach ( var_1 in level._id_1655 )
        {
            if ( var_1.owner == self )
            {
                switch ( var_1._id_110EA )
                {
                    case "uav":
                        _id_D991( "ch_scorestreak_kills_uav" );
                        break;
                    case "counter_uav":
                        _id_D991( "ch_scorestreak_kills_cuav" );
                        break;
                    case "directional_uav":
                        _id_D991( "ch_scorestreak_kills_auav" );
                        break;
                }
            }
        }
    }
}

_id_D9D8( var_0, var_1 )
{
    var_2 = scripts\mp\loot::_id_7F82( var_0.sweapon );

    if ( isdefined( var_2 ) && isdefined( var_2._id_DB52 ) )
    {
        switch ( var_2._id_DB52 )
        {
            case 4:
                var_1 _id_D991( "ch_outfitter_epic" );
                break;
            case 3:
                var_1 _id_D991( "ch_outfitter_legendary" );
                break;
            case 2:
                var_1 _id_D991( "ch_outfitter_rare" );
                break;
            case 1:
                var_1 _id_D991( "ch_outfitter_common" );
                break;
        }
    }

    if ( isdefined( var_0._id_24F3 ) )
    {
        var_3 = 0;

        foreach ( var_7, var_5 in var_0._id_24F3 )
        {
            var_6 = getweaponvariantindex( var_7 );

            if ( !isdefined( var_6 ) )
                continue;

            var_3++;
        }

        if ( _id_9EBC( var_3, 3 ) )
            var_1 _id_D991( "ch_outfitter_variant_triplet" );
    }

    if ( var_0.sweapon != var_1.primaryweapon && var_0.sweapon != var_1._id_F0C4 )
        return;

    var_8 = scripts\mp\loot::_id_7F82( var_1.primaryweapon );
    var_9 = scripts\mp\loot::_id_7F82( var_1._id_F0C4 );

    if ( isdefined( var_8 ) && isdefined( var_8._id_DB52 ) && isdefined( var_9 ) && isdefined( var_9._id_DB52 ) )
    {
        if ( var_8._id_DB52 == var_9._id_DB52 )
        {
            switch ( var_8._id_DB52 )
            {
                case 4:
                    var_1 _id_D991( "ch_outfitter_epic_set" );
                    break;
                case 3:
                    var_1 _id_D991( "ch_outfitter_legendary_set" );
                    break;
                case 2:
                    var_1 _id_D991( "ch_outfitter_rare_set" );
                    break;
                case 1:
                    var_1 _id_D991( "ch_outfitter_common_set" );
                    break;
            }
        }
    }
}

_id_D9AE( var_0, var_1, var_2, var_3 )
{
    if ( scripts\mp\utility\game::istrue( var_0._id_B930["wallkill"] ) )
        var_2 _id_D991( "ch_wallrun_kill" );

    if ( scripts\mp\utility\game::istrue( var_0._id_B930["jumpkill"] ) )
        var_2 _id_D991( "ch_air_kill" );

    if ( scripts\mp\utility\game::istrue( var_0._id_B930["slidekill"] ) )
        var_2 _id_D991( "ch_slide_kill" );

    if ( scripts\mp\utility\game::istrue( var_0._id_B930["killonwall"] ) )
        var_2 _id_D991( "ch_kill_wallrunner" );

    if ( scripts\mp\utility\game::istrue( var_0._id_B930["killinair"] ) )
        var_2 _id_D991( "ch_kill_jumper" );

    if ( scripts\mp\utility\game::istrue( var_0._id_B930["clutchkill"] ) )
        var_2 _id_D991( "ch_clutch_grenade" );

    if ( scripts\mp\utility\game::istrue( var_0._id_B930["wallkill"] ) && scripts\mp\utility\game::istrue( var_0._id_B930["killonwall"] ) )
        var_2 _id_D991( "ch_wall_vs_wall" );
}

_id_D9B9( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0._id_24E4 ) )
    {
        if ( _id_9EBC( var_0._id_24E4, 5 ) )
            var_2 _id_D991( "ch_bloodthirsty" );

        if ( _id_9EBC( var_0._id_24E4, 10 ) )
            var_2 _id_D991( "ch_merciless" );

        if ( _id_9EBC( var_0._id_24E4, 15 ) )
            var_2 _id_D991( "ch_ruthless" );
    }
}

_id_D9B2( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_0._id_2504 ) )
    {
        if ( _id_9EBC( var_0._id_2504, 2 ) )
            var_2 _id_D991( "ch_double_kill" );

        if ( _id_9EBC( var_0._id_2504, 3 ) )
            var_2 _id_D991( "ch_triple_kill" );

        if ( _id_9EBC( var_0._id_2504, 4 ) )
            var_2 _id_D991( "ch_quad_kill" );
    }
}

_id_D9B0( var_0, var_1, var_2, var_3 )
{
    foreach ( var_5 in var_0._id_24FD )
    {
        switch ( var_5 )
        {
            case "specialty_expanded_minimap":
                var_2 _id_D991( "ch_perk_kills_awareness" );
                break;
            case "specialty_blastshield":
                var_2 _id_D991( "ch_perk_kills_blastshield" );
                break;
            case "specialty_dexterity":
                var_2 _id_D991( "ch_perk_kills_dexterity" );

                if ( isdefined( var_0._id_24FA ) && gettime() - var_0._id_24FA < 5000 || isdefined( var_0._id_24FC ) && gettime() - var_0._id_24FC < 5000 )
                    var_2 _id_D991( "ch_dexterity_actions" );

                break;
            case "specialty_ghost":
                if ( scripts\mp\utility\game::istrue( var_0._id_13384 ) )
                    var_2 _id_D991( "ch_perk_kills_ghost" );

                if ( scripts\mp\utility\game::istrue( var_0._id_B930["backstab"] ) )
                    var_2 _id_D991( "ch_ghost_backstab" );

                break;
            case "specialty_momentum":
                if ( var_0.smeansofdeath == "MOD_MELEE" && var_0._id_24FE > 1.0 )
                    var_2 _id_D991( "ch_momentum_melee" );

                break;
            case "specialty_tracker":
                var_2 _id_D991( "ch_perk_kills_tracker" );

                if ( var_0.smeansofdeath == "MOD_MELEE" )
                    var_2 _id_D991( "ch_tracker_melee" );

                break;
            case "specialty_stun_resistance":
                if ( isdefined( var_0._id_250C[var_3.guid] ) )
                    var_2 _id_D991( "ch_perk_kills_tacresist" );

                break;
            case "specialty_coldblooded":
                if ( scripts\mp\utility\game::_id_13C90( var_0._id_13385, "thermal" ) || scripts\mp\utility\game::istrue( var_0._id_1337D ) || scripts\mp\utility\game::istrue( var_0._id_1337B ) )
                    var_2 _id_D991( "ch_perk_kills_coldblooded" );

                if ( scripts\mp\utility\game::_id_8225( var_0.sweapon ) == "weapon_sniper" )
                    var_2 _id_D991( "ch_coldblood_sniper" );

                break;
            case "specialty_sprintfire":
                if ( var_0._id_24F1 && var_0._id_9D74 )
                    var_2 _id_D991( "ch_perk_kills_gungho" );

                if ( isdefined( var_0._id_24F5 ) && _id_9EBC( var_0._id_24F5, 2 ) )
                    var_2 _id_D991( "ch_gungho_double_kill" );

                break;
            case "specialty_bullet_outline":
                var_2 _id_D991( "ch_perk_kills_pinpoint" );
                var_6 = undefined;

                if ( isdefined( var_0._id_13374[var_2.guid] ) )
                    var_6 = var_0._id_13374[var_2.guid].firsttimedamaged;

                if ( isdefined( var_6 ) )
                {
                    var_7 = undefined;

                    if ( isdefined( var_0._id_24E0[var_3.guid] ) )
                        var_7 = var_0._id_24E0[var_3.guid].firsttimedamaged;

                    if ( isdefined( var_7 ) && var_7 < var_6 )
                        var_2 _id_D991( "ch_pinpoint_counter_kill" );
                }

                break;
            case "specialty_marksman":
                if ( scripts\mp\utility\game::istrue( var_0._id_B930["longshot"] ) )
                    var_2 _id_D991( "ch_marksman_longshot" );

                if ( var_0._id_24EF && isdefined( var_0._id_24F9 ) && gettime() < var_0._id_24F9 + 3000 )
                    var_2 _id_D991( "ch_marksman_flinch" );

                break;
            case "specialty_empimmune":
                var_2 _id_D991( "ch_perk_kills_hardwired" );
                break;
            case "specialty_quieter":
                var_2 _id_D991( "ch_perk_kills_deadsilence" );

                if ( var_0.smeansofdeath == "MOD_MELEE" )
                    var_2 _id_D991( "ch_deadsilence_melee" );

                break;
        }
    }
}

_id_D9C8( var_0, var_1, var_2, var_3 )
{
    if ( var_0.sweapon == "none" )
    {
        if ( isdefined( var_0.victim._id_6A00 ) && isdefined( var_0.victim._id_6A00["weapon"] ) )
            var_0.sweapon = var_0.victim._id_6A00["weapon"];
        else
            return;
    }

    if ( var_0.attacker scripts\mp\utility\game::ispickedupweapon( var_0.sweapon ) )
    {
        var_2 _id_D991( "ch_pickup_kills" );
        var_4 = scripts\mp\loot::_id_7F82( var_0.sweapon );

        if ( isdefined( var_4 ) && isdefined( var_4._id_DB52 ) && var_4._id_DB52 == 4 )
            var_2 _id_D991( "ch_outfitter_thief" );

        if ( isdefined( var_0._id_2512 ) && isdefined( var_0._id_2512[var_0.sweapon] ) && gettime() - var_0._id_2512[var_0.sweapon] < 10000 )
            var_2 _id_D991( "ch_quick_pickup_kill" );
    }

    var_5 = scripts\mp\utility\game::_id_8234( var_0.sweapon );
    var_6 = scripts\mp\utility\game::_id_8225( var_0.sweapon );

    if ( var_0.smeansofdeath == "MOD_PISTOL_BULLET" || var_0.smeansofdeath == "MOD_RIFLE_BULLET" || var_0.smeansofdeath == "MOD_HEAD_SHOT" )
        _id_D990( var_0, var_2, var_1, var_6, var_5 );
    else if ( isexplosivedamagemod( var_0.smeansofdeath ) )
        _id_D99E( var_0, var_2, var_1, var_6, var_5 );
    else if ( issubstr( var_0.smeansofdeath, "MOD_MELEE" ) && !scripts\mp\weapons::_id_9F2D( var_0.sweapon ) )
        _id_D9AC( var_0, var_2, var_1, var_6, var_5 );
    else if ( scripts\mp\weapons::_id_9F2D( var_0.sweapon ) )
        _id_D9B3( var_0, var_2, var_1, var_6, var_5 );
    else if ( issubstr( var_0.smeansofdeath, "MOD_IMPACT" ) )
    {
        if ( var_5 == "iw7_axe" )
            var_2 processweaponchallenge_axethrow( var_5, var_0 );

        _id_D9A0( var_0, var_2, var_1, var_6, var_5 );
    }

    if ( var_6 == "weapon_projectile" )
        var_2 _id_D9CE( var_5, var_0 );

    var_7 = scripts\mp\utility\game::_id_7E9D( var_0.sweapon );

    if ( isdefined( var_7 ) )
    {
        if ( var_7 == "lethal" )
            _id_D9A9( var_0, var_2, var_1, var_6, var_5 );
    }

    if ( scripts\mp\utility\game::isclassicweapon( var_0.sweapon ) && var_0.smeansofdeath != "MOD_MELEE" )
    {
        if ( !isdefined( var_2.classickills ) )
            var_2.classickills = 1;
        else
            var_2.classickills++;
    }

    if ( scripts\mp\utility\game::isburstfireweapon( var_0.sweapon ) && var_0.smeansofdeath != "MOD_MELEE" )
    {
        if ( !isdefined( var_2.burstfirekills ) )
            var_2.burstfirekills = 1;
        else
            var_2.burstfirekills++;
    }

    if ( !scripts\mp\utility\game::istrue( var_2._id_D99C ) )
    {
        var_8 = 0;
        var_9 = 0;
        var_10 = 0;

        foreach ( var_13, var_12 in var_0._id_24F3 )
        {
            var_8 = var_8 || scripts\mp\utility\game::_id_9D78( var_13 );
            var_9 = var_9 || scripts\mp\utility\game::_id_9D79( var_13 );
            var_7 = scripts\mp\utility\game::_id_7E9D( var_13 );
            var_10 = var_10 || isdefined( var_7 ) && var_7 == "lethal";
        }

        if ( var_8 && var_9 && var_10 )
        {
            var_2 _id_D991( "ch_3_kill_types" );
            var_2._id_D99C = 1;
        }
    }
}

_id_D990( var_0, var_1, var_2, var_3, var_4 )
{
    if ( scripts\mp\utility\game::_id_9E6C( var_0.sweapon ) || scripts\mp\utility\game::_id_9DE2( var_0.sweapon ) )
        return;

    switch ( var_3 )
    {
        case "weapon_smg":
            var_1 _id_D9D1( var_4, var_0 );
            break;
        case "weapon_assault":
            var_1 _id_D9C9( var_4, var_0 );
            break;
        case "weapon_shotgun":
            var_1 _id_D9D0( var_4, var_0 );
            break;
        case "weapon_dmr":
            var_1 _id_D9CA( var_4, var_0 );
            break;
        case "weapon_sniper":
            if ( var_4 == "iw7_m1c" )
                var_1 _id_D9C9( var_4, var_0 );
            else
                var_1 _id_D9D2( var_4, var_0 );

            break;
        case "weapon_pistol":
            var_1 _id_D9CD( var_4, var_0 );
            break;
        case "weapon_lmg":
            var_1 _id_D9CB( var_4, var_0 );
            break;
        default:
            break;
    }

    if ( scripts\mp\utility\game::istrue( _func_2D4( var_0.sweapon ) ) )
        var_1 _id_D991( "ch_lifetime_energy_kills" );

    if ( scripts\mp\utility\game::istrue( var_0._id_B930["headshot"] ) )
        var_1 _id_D991( "ch_lifetime_headshots" );

    if ( var_0._id_24E3 == 0 )
    {
        var_5 = weaponclipsize( var_0.sweapon );

        if ( var_5 >= 10 )
            var_1 _id_D991( "ch_last_bullet_kill" );
    }

    var_6 = scripts\mp\utility\game::_id_8234( var_0.sweapon );
    var_7 = issubstr( var_0.sweapon, "alt_" );
    var_8 = getweaponvariantindex( var_0.sweapon );
    var_9 = var_6 == "iw7_fmg" && var_7 || var_6 == "iw7_ump45" && isdefined( var_8 ) && ( var_8 == 3 || var_8 == 35 ) || var_6 == "iw7_minilmg" && isdefined( var_8 ) && ( var_8 == 3 || var_8 == 35 );

    if ( var_9 )
    {
        if ( !isdefined( var_1.akimbokills ) )
            var_1.akimbokills = 1;
        else
            var_1.akimbokills++;
    }

    _id_D98E( var_0, var_1, var_2, var_3, var_4 );
}

_id_D98E( var_0, var_1, var_2, var_3, var_4 )
{
    if ( scripts\mp\utility\game::_id_9F8D( var_0.sweapon ) )
        return 0;

    if ( getweaponcamoname( var_0.sweapon ) != "camo0" )
        var_1 _id_D991( "ch_outfitter_camo" );

    if ( var_3 == "weapon_sniper" && !scripts\mp\weapons::_id_13C98( var_0.sweapon ) )
        var_1 _id_D9C3( var_4, "noscope", var_0 );

    var_5 = 0;
    var_6 = 0;
    var_7 = scripts\mp\utility\game::_id_821A( var_0.sweapon );

    foreach ( var_9 in var_7 )
    {
        if ( scripts\mp\utility\game::_id_248E( var_9 ) )
        {
            var_1 _id_D991( "ch_outfitter_charm" );

            if ( var_9 == "cos_026" || var_9 == "cos_007" || var_9 == "cos_006" )
                var_5 = 1;
        }

        if ( !scripts\mp\weapons::_id_9F3C( var_4, var_9 ) )
            continue;

        switch ( var_9 )
        {
            case "oscope":
            case "vzscope":
            case "elo":
            case "phase":
            case "reflex":
            case "hybrid":
            case "acog":
            case "thermal":
                var_1 _id_D9C3( var_4, var_9, var_0 );
                var_1 _id_D991( "ch_attach_rof" );
                var_6 = 1;
                break;
            case "smart":
                var_1 _id_D991( "ch_attach_rof" );
                var_6 = 1;
                break;
            case "xmags":
                if ( _id_9EBC( var_0._id_24F4, 2 ) )
                    var_1 _id_D991( "ch_xmags_two_kills" );

                var_1 _id_D991( "ch_attach_" + var_9 );
                break;
            case "xmagse":
                if ( _id_9EBC( var_0._id_24F4, 2 ) )
                    var_1 _id_D991( "ch_xmags_two_kills" );

                var_1 _id_D991( "ch_attach_xmags" );
                break;
            case "fastaim":
                if ( gettime() - var_0._id_24F7 < 3000 )
                    var_1 _id_D991( "ch_fastaim_ads_kill" );

                var_1 _id_D991( "ch_attach_" + var_9 );
                break;
            case "stock":
                if ( var_0._id_24EF && var_0._id_250A >= 50 )
                    var_1 _id_D991( "ch_stock_ads_kill" );

                var_1 _id_D991( "ch_attach_" + var_9 );
                break;
            case "cpu":
                if ( var_0._id_24EF && !var_0._id_24EB )
                    var_1 _id_D991( "ch_cpu_ads_kill" );

                var_1 _id_D991( "ch_attach_" + var_9 );
                break;
            case "akimbo":
                if ( !var_0._id_2500 )
                    var_1 _id_D991( "ch_akimbo_jump_kill" );

                var_1 _id_D991( "ch_attach_" + var_9 );

                if ( !isdefined( var_1.akimbokills ) )
                    var_1.akimbokills = 1;
                else
                    var_1.akimbokills++;

                break;
            case "fmj":
                if ( var_0._id_92BE & level.idflags_penetration )
                    var_1 _id_D991( "ch_fmj_penetrate" );

                var_1 _id_D991( "ch_attach_" + var_9 );
                break;
            case "highcal":
                if ( isdefined( var_0._id_B930["headshot"] ) )
                    var_1 _id_D991( "ch_highcal_headshots" );

                var_1 _id_D991( "ch_attach_" + var_9 );
                break;
            case "barrelrange":
                if ( isdefined( var_0._id_B930["longshot"] ) )
                    var_1 _id_D991( "ch_barrelrange_longshots" );

                var_1 _id_D991( "ch_attach_" + var_9 );
                break;
            case "hipaim":
                if ( isdefined( var_0._id_B930["hipfire"] ) )
                    var_1 _id_D991( "ch_hipaim_hipfire" );

                var_1 _id_D991( "ch_attach_" + var_9 );
                break;
            case "overclock":
            case "rof":
            case "silencer":
            case "grip":
            case "firetypeauto":
                var_1 _id_D991( "ch_attach_" + var_9 );
                break;
            case "reflect":
                var_1 _id_D991( "ch_attach_ricochet" );
                break;
            default:
                break;
        }
    }

    if ( var_5 )
    {
        var_3 = scripts\mp\utility\game::_id_8225( var_0.sweapon );

        if ( var_3 == "weapon_assault" && scripts\mp\utility\game::istrue( _func_2D4( var_0.sweapon ) ) )
            var_1 _id_D991( "ch_rvn_unlock" );

        if ( var_3 == "weapon_pistol" && var_6 == 1 )
            var_1 _id_D991( "ch_udm_unlock" );
    }

    if ( scripts\mp\utility\game::_id_13C91( var_0.sweapon ) )
        var_1 _id_D9BF( var_4, "firetypeburst" );

    if ( scripts\mp\utility\game::_id_13C94( var_4 ) )
        var_1 _id_D9BF( var_4, "silencer" );

    if ( scripts\mp\utility\game::_id_13C93( var_4 ) )
        var_1 _id_D9BF( var_4, "grip" );

    if ( scripts\mp\utility\game::_id_13C92( var_4 ) )
        var_1 _id_D9BF( var_4, "fmj" );

    if ( var_1 scripts\mp\utility\game::_id_9EE8() && scripts\mp\utility\game::_id_13C95( var_0.sweapon ) )
        var_1 _id_D9BF( var_4, "tracker" );
}

_id_D99E( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = scripts\mp\utility\game::_id_821A( var_0.sweapon );

    foreach ( var_7 in var_5 )
    {
        switch ( var_7 )
        {
            case "gl":
                if ( scripts\mp\utility\game::_id_9F7C( var_0.sweapon, "alt_" ) )
                    var_1 _id_D9BF( var_4, var_7 );

                break;
        }
    }

    if ( isdefined( var_0._id_94B6 ) )
    {
        if ( var_0._id_94B6 == "power_explodingDrone" )
        {
            if ( isdefined( var_0._id_94B3 ) && isdefined( var_0._id_94B5 ) )
            {
                if ( var_0._id_94B3 == var_1 )
                {
                    if ( var_0._id_94B5 == var_1 )
                        var_1 _id_D991( "ch_explodingdrone_combo" );
                }
            }
        }
        else if ( var_0._id_94B6 == "power_tripMine" )
        {
            if ( isdefined( var_0._id_94B3 ) && isdefined( var_0._id_94B5 ) )
            {
                if ( var_0._id_94B3 == var_1 )
                {
                    if ( var_0._id_94B5 == var_1 )
                        var_1 _id_D991( "ch_tripmine_explode" );
                    else if ( var_0._id_94B5 == var_0.victim )
                        var_1 _id_D991( "ch_enemy_equip_kill" );
                }
            }
        }
    }
}

_id_D9AC( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = scripts\mp\utility\game::_id_821A( var_0.sweapon );

    foreach ( var_7 in var_5 )
    {
        switch ( var_7 )
        {
            case "tactical":
                var_1 _id_D9BF( var_4, var_7 );
                break;
        }
    }

    if ( var_0._id_13380 == "crouch" || var_0._id_13380 == "prone" )
        var_1 _id_D991( "ch_melee_crouch_prone" );

    if ( var_3 == "weapon_melee" )
    {
        if ( var_4 == "iw7_axe" )
            var_1 processweaponchallenge_axemelee( var_4, var_0 );
        else
            var_1 _id_D9CC( var_4, var_0 );
    }
}

_id_D9B3( var_0, var_1, var_2, var_3, var_4 )
{
    if ( issubstr( var_0.smeansofdeath, "MOD_MELEE" ) )
        var_1 _id_D9CF( var_4, var_0 );

    var_5 = scripts\mp\utility\game::_id_821A( var_0.sweapon );

    foreach ( var_7 in var_5 )
    {
        switch ( var_7 )
        {
            case "rshieldspikes":
            case "rshieldscrambler":
            case "rshieldradar":
                var_1 _id_D9BF( var_4, var_7 );
                break;
        }
    }
}

_id_D9A0( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = scripts\mp\utility\game::_id_821A( var_0.sweapon );

    foreach ( var_7 in var_5 )
    {
        switch ( var_7 )
        {
            case "gl":
                if ( scripts\mp\utility\game::_id_9F7C( var_0.sweapon, "alt_" ) )
                    var_1 _id_D9BF( var_4, var_7 );

                break;
        }
    }
}

_id_D9A9( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = level._id_D7A4[var_0.sweapon];

    switch ( var_5 )
    {
        case "power_splashGrenade":
            var_1 _id_D991( "ch_lethal_splash" );
            break;
        case "power_clusterGrenade":
            var_1 _id_D991( "ch_lethal_cluster" );
            break;
        case "power_tripMine":
            var_1 _id_D991( "ch_lethal_tripmine" );
            break;
        case "power_splitGrenade":
            var_1 _id_D991( "ch_lethal_split" );
            break;
        case "power_explodingDrone":
            var_1 _id_D991( "ch_lethal_explodingdrone" );
            break;
        case "power_blackholeGrenade":
            var_1 _id_D991( "ch_lethal_blackhole" );
            break;
        case "power_wristRocket":
            var_1 _id_D991( "ch_lethal_armlauncher" );
            break;
        case "power_spiderGrenade":
            var_1 _id_D991( "ch_lethal_spider" );
            break;
        case "power_c4":
            var_1 _id_D991( "ch_lethal_c4" );
            break;
        case "power_bioSpike":
            var_1 _id_D991( "ch_lethal_biospike" );
            break;
        case "power_throwingKnife":
            break;
        default:
    }

    if ( isdefined( var_0._id_94B4 ) && var_0._id_94B4 == "friendly" )
        var_1 _id_D991( "ch_stick_teammate" );
}

_id_3C03( var_0 )
{
    if ( !isdefined( game["uniquePlayerCount"] ) || game["uniquePlayerCount"] < 3 )
        return;

    var_1 = var_0.player;

    if ( var_1._id_13906 )
    {
        var_2 = var_1.pers["kills"];
        var_3 = var_1.pers["deaths"];
        var_4 = var_1.pers["score"];
        var_5 = 1000000;

        if ( var_3 > 0 )
            var_5 = var_2 / var_3;

        var_1.pers["kdratio"] = var_5;

        if ( var_5 >= 5.0 && var_2 >= 5.0 )
            var_1 _id_D992( "ch_starplayer" );

        if ( var_3 == 0 && scripts\mp\utility\game::_id_81CB() > 300000 )
            var_1 _id_D992( "ch_flawless" );

        if ( var_1.score > 0 )
        {
            var_6 = scripts\mp\utility\game::_id_E76A( var_1.score / 100 );
            var_1 _id_D991( "ch_lifetime_score", var_6 );

            switch ( level.gametype )
            {
                case "dm":
                    if ( var_0._id_CBFC < 3 )
                        var_1 _id_D991( "ch_ffa_wins" );

                    break;
                case "sotf_ffa":
                    if ( var_0._id_CBFC < 3 )
                        var_1 _id_D992( "ch_hunted_victor" );

                    break;
            }
        }
    }

    var_1 checkvrunlockchallenge();
    var_1 checkmp28unlockchallenge();
    var_1 checkminilmgunlockchallenge();
    var_1 checkba50calunlockchallenge();
    var_1 checkmod2187unlockchallenge();
    var_1 checklongshotunlockchallenge();
    var_1 checkgaussunlockchallenge();
    var_1 checkmustangunlockchallenge();
    var_1 checktacburstunlockchallenge();
    var_1 checkatlasunlockchallenge();
}

_id_3C04( var_0 )
{
    if ( !var_0._id_13D8A )
        return;

    if ( !isdefined( game["uniquePlayerCount"] ) || game["uniquePlayerCount"] < 3 )
        return;

    var_1 = var_0.player;

    if ( var_1._id_13906 )
    {
        var_1 _id_D991( "ch_global_wins" );

        if ( level.tactical )
            var_1 _id_D991( "ch_ctf_wins" );

        if ( var_0._id_CBFC == 0 )
            var_1 _id_D991( "ch_first_place" );

        if ( var_0._id_CBFC <= 2 )
            var_1 _id_D991( "ch_top3" );

        switch ( level.gametype )
        {
            case "war":
                var_1 _id_D991( "ch_war_wins" );
                break;
            case "sd":
                var_1 _id_D991( "ch_sd_sr_wins" );
                break;
            case "dom":
                var_1 _id_D991( "ch_dom_wins" );
                break;
            case "conf":
                var_1 _id_D991( "ch_kc_grind_wins" );
                break;
            case "sr":
                var_1 _id_D991( "ch_sd_sr_wins" );
                break;
            case "grind":
                var_1 _id_D991( "ch_kc_grind_wins" );
                break;
            case "ball":
                var_1 _id_D991( "ch_ball_wins" );
                break;
            case "infect":
                break;
            case "aliens":
                break;
            case "gun":
                break;
            case "grnd":
                break;
            case "siege":
                var_1 _id_D991( "ch_siege_wins" );
                break;
            case "koth":
                var_1 _id_D991( "ch_koth_wins" );
                break;
            case "mp_zomb":
                break;
            case "ctf":
                break;
            case "dd":
                var_1 _id_D991( "ch_dd_wins" );
                break;
            case "tdef":
                var_1 _id_D991( "ch_tdef_wins" );
                break;
            case "front":
                var_1 _id_D991( "ch_war_wins" );
                break;
            default:
                break;
        }

        var_2 = getdvarint( "scr_playlist_type", 0 );

        if ( var_2 == 1 )
        {
            var_1 _id_D992( "ch_bromance" );

            if ( !level._id_4542 )
                var_1 _id_D992( "ch_tactician" );
        }
        else if ( var_2 == 2 )
            var_1 _id_D992( "ch_tactician" );

        if ( level._id_8B38 )
            var_1 _id_D992( "ch_hardcore_extreme" );
    }

    var_1 checkcrdbunlockchallenge();
}

checkvrunlockchallenge()
{
    if ( _id_2139( "ch_vr_unlock" ) )
        return;

    if ( isdefined( self._id_A681 ) )
    {
        var_0 = [];

        foreach ( var_4, var_2 in self._id_A681 )
        {
            if ( var_2 > 0 && ( scripts\mp\utility\game::_id_9D78( var_4 ) || scripts\mp\utility\game::_id_9D79( var_4 ) ) )
            {
                var_3 = scripts\mp\utility\game::_id_8234( var_4 );
                var_0[var_3] = 1;

                if ( var_0.size >= 6 )
                {
                    _id_D991( "ch_vr_unlock" );
                    return;
                }
            }
        }
    }
}

checkcrdbunlockchallenge()
{
    if ( _id_2139( "ch_crdb_unlock" ) )
        return;

    if ( isdefined( self._id_A681 ) )
    {
        var_0 = 0;

        foreach ( var_3, var_2 in self._id_A681 )
        {
            if ( scripts\mp\utility\game::_id_8234( var_3 ) == "iw7_vr" )
                var_0 += var_2;

            if ( var_0 > 0 )
            {
                _id_D991( "ch_crdb_unlock" );
                return;
            }
        }
    }
}

checkminilmgunlockchallenge()
{
    if ( _id_2139( "ch_minilmg_unlock" ) )
        return;

    if ( isdefined( self.shotslandedlmg ) && self.shotslandedlmg >= 50 )
        _id_D991( "ch_minilmg_unlock" );
}

checkmp28unlockchallenge()
{
    if ( _id_2139( "ch_mp28_unlock" ) )
        return;

    if ( isdefined( self.classickills ) && self.classickills >= 10 )
        _id_D991( "ch_mp28_unlock" );
}

checkba50calunlockchallenge()
{
    if ( _id_2139( "ch_ba50cal_unlock" ) )
        return;

    if ( isdefined( self.pers["oneShotKills"] ) && self.pers["oneShotKills"] >= 5 )
        _id_D991( "ch_ba50cal_unlock" );
}

checkmod2187unlockchallenge()
{
    if ( _id_2139( "ch_mod2187_unlock" ) )
        return;

    if ( isdefined( self.akimbokills ) && self.akimbokills >= 10 )
        _id_D991( "ch_mod2187_unlock" );
}

checklongshotunlockchallenge()
{
    if ( _id_2139( "ch_longshot_unlock" ) )
        return;

    var_0 = 0;
    var_1 = 0;

    foreach ( var_5, var_3 in self._id_A681 )
    {
        if ( var_3 > 0 && ( scripts\mp\utility\game::_id_9D78( var_5 ) || scripts\mp\utility\game::_id_9D79( var_5 ) ) )
        {
            var_4 = scripts\mp\utility\game::_id_8234( var_5 );

            if ( var_4 == "iw7_ba50cal" )
                var_0 = 1;

            if ( var_4 == "iw7_mod2187" )
                var_1 = 1;
        }
    }

    if ( var_0 && var_1 )
        _id_D991( "ch_longshot_unlock" );
}

checkgaussunlockchallenge()
{
    if ( _id_2139( "ch_gauss_unlock" ) )
        return;

    if ( isdefined( self.hipfiremagkills ) && self.hipfiremagkills >= 5 )
        _id_D991( "ch_gauss_unlock" );
}

checkmustangunlockchallenge()
{
    if ( _id_2139( "ch_mag_unlock" ) )
        return;

    var_0 = 1;
    var_1 = 0;

    foreach ( var_5, var_3 in self._id_A681 )
    {
        if ( !scripts\mp\utility\game::_id_9D78( var_5 ) && !scripts\mp\utility\game::_id_9D79( var_5 ) )
            continue;

        var_4 = scripts\mp\utility\game::_id_8225( var_5 );

        if ( var_4 != "weapon_pistol" )
        {
            var_0 = 0;
            break;
        }
        else
            var_1 += var_3;
    }

    if ( var_0 && var_1 >= 5 )
        _id_D991( "ch_mag_unlock" );
}

checktacburstunlockchallenge()
{
    if ( _id_2139( "ch_tacburst_unlock" ) )
        return;

    if ( isdefined( self.burstfirekills ) && self.burstfirekills >= 10 )
        _id_D991( "ch_tacburst_unlock" );
}

checkatlasunlockchallenge()
{
    if ( _id_2139( "ch_unsalmg_unlock" ) )
        return;

    if ( isdefined( self._id_A681 ) )
    {
        var_0 = 0;

        foreach ( var_3, var_2 in self._id_A681 )
        {
            if ( scripts\mp\utility\game::_id_8234( var_3 ) == "iw7_tacburst" )
                var_0 += var_2;

            if ( var_0 >= 10 )
            {
                _id_D991( "ch_unsalmg_unlock" );
                return;
            }
        }
    }
}

_id_D378( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !_id_B4E8() )
        return;

    if ( !isplayer( self ) )
        return;

    self endon( "disconnect" );

    if ( isdefined( var_1 ) )
        var_1 endon( "disconnect" );

    _id_3BF6( var_0, var_1, var_2, var_3, var_4, var_5 );
    wait 0.05;
    scripts\mp\utility\game::_id_13842();
    var_6 = spawnstruct();
    var_6.victim = self;
    var_6.einflictor = var_0;
    var_6.attacker = var_1;
    var_6.idamage = var_2;
    var_6.smeansofdeath = var_3;
    var_6.sweapon = var_4;
    var_6.shitloc = var_5;
    _id_5914( "playerDamaged", var_6 );
}

_id_D3C3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !_id_B4E8() )
        return;

    if ( !isdefined( var_1 ) )
        return;

    if ( isdefined( var_1._id_A686 ) )
        var_1._id_A686++;

    if ( isplayer( var_1 ) && var_1 _meth_81BD() )
    {
        if ( !isdefined( var_1._id_A687 ) )
            var_1._id_A687 = 1;
        else
            var_1._id_A687++;
    }

    _id_3BFF( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 );
    self endon( "disconnect" );
    var_1 endon( "disconnect" );
    var_9 = spawnstruct();
    var_9.victim = self;
    var_9.victimid = self getentitynumber();
    var_9.einflictor = var_0;
    var_9.attacker = var_1;
    var_9.idamage = var_2;
    var_9._id_92BE = var_3;
    var_9.smeansofdeath = var_4;
    var_9.sweapon = var_5;
    var_9.sprimaryweapon = var_6;
    var_9.shitloc = var_7;
    var_9.time = gettime();
    var_9._id_B930 = var_8;
    var_9._id_9D74 = scripts\engine\utility::_id_9D74( var_4 );

    if ( isdefined( var_5 ) && issubstr( var_5, "_hybrid" ) )
    {
        if ( var_1 getcurrentweapon() == var_5 )
            var_9._id_9272 = var_1 _meth_812E( var_5 );
        else
            var_9._id_9272 = 0;
    }

    var_9._id_1337E = var_9.victim isonground();

    if ( isplayer( var_1 ) )
    {
        var_1._id_A684[var_1._id_A684.size] = var_9;

        if ( isdefined( var_1._id_A685[var_9.sweapon] ) )
            var_1._id_A685[var_9.sweapon]++;
        else
            var_1._id_A685[var_9.sweapon] = 1;

        if ( !scripts\mp\utility\game::_id_9E6C( var_9.sweapon ) )
        {
            if ( isdefined( var_1._id_A681[var_9.sweapon] ) )
                var_1._id_A681[var_9.sweapon]++;
            else
                var_1._id_A681[var_9.sweapon] = 1;
        }

        var_9._id_24EC = isdefined( var_9.attacker.laststand );
        var_9._id_2500 = var_9.attacker isonground();
        var_9._id_250B = var_9.attacker getstance();
        var_9._id_24E4 = var_1.pers["cur_kill_streak"];
        var_9._id_2504 = var_1._id_DDC2;
        var_9._id_2505 = var_1._id_DDC3;
        var_9.attackerarchetype = getsubstr( var_1._id_AE62, 10, var_1._id_AE62.size );
        var_9.attackerkillsthislife = var_1._id_A684.size;
        var_9._id_24F3 = var_1._id_A685;
        var_9._id_24E3 = var_1 getweaponammoclip( var_5 );
        var_9._id_24EB = var_1._id_9074;
        var_9._id_24F8 = var_1._id_A960;
        var_9._id_2503 = var_1.pers["primaryWeapon"];
        var_9._id_2509 = var_1.pers["secondaryWeapon"];
        var_9._id_24F6 = var_1._id_A6B4;
        var_9._id_24F2 = var_1._id_A653;
        var_9._id_24E1 = var_1 scripts\mp\weapons::_id_9F81();
        var_9._id_24E0 = var_1.attackerdata;
        var_9._id_2512 = var_1._id_13CB9;
        var_9._id_24EA = var_1._id_8BC1;
        var_9._id_2501 = var_1._id_CA7D;
        var_9._id_2511 = var_1._id_13071;
        var_9._id_24F4 = var_1._id_A686;
        var_9._id_24EF = var_1 scripts\mp\utility\game::_id_9EE8();
        var_9._id_24F7 = var_1._id_A932;
        var_9._id_250A = length( var_1 _meth_816B() );
        var_9._id_24FD = var_1.pers["loadoutPerks"];
        var_9._id_24FA = var_1._id_A9DD;
        var_9._id_24FC = var_1._id_A9D3;
        var_9._id_24F9 = var_1._id_A98B;
        var_9._id_24FE = scripts\engine\utility::ter_op( isdefined( var_1._id_BCF6 ), var_1._id_BCF6, 1.0 );
        var_9._id_24E9 = var_1._id_6A06;
        var_9._id_250C = var_1._id_1119A;
        var_9._id_24F5 = var_1._id_A687;
        var_9._id_24F1 = var_1 _meth_81BD();
        var_9._id_24E8 = var_1 scripts\mp\supers::_id_7E4F();
        var_9._id_250D = var_1 scripts\mp\supers::_id_9F88();
        var_9._id_2506 = var_1._id_11B2C;
        var_9.attackersixthsensesource = var_1.sixthsensesource;
        var_9.attackerrelaysource = var_1.relaysource;
        var_9.attackerrearguardattackers = var_1.rearguardattackers;
        var_9._id_2510 = var_1._id_119DF;
        var_9._id_24EE = var_1 _meth_8173();
        var_9.attackerhassupertrophyout = isdefined( var_1.supertrophies ) && var_1.supertrophies.size > 0;
        var_9.attackervisionpulsedvictim = var_1 scripts\mp\supers\super_visionpulse::_id_9EF9( var_9.victim );

        if ( isdefined( var_1._id_6A06 ) )
            var_1._id_6A06[self.guid] = undefined;

        if ( isdefined( var_1._id_1119A ) )
            var_1._id_1119A[self.guid] = undefined;
    }
    else
    {
        var_9._id_24EC = 0;
        var_9._id_2500 = 0;
        var_9._id_250B = "stand";
        var_9._id_24E4 = 0;
        var_9._id_2505 = 0;
        var_9._id_24F3 = [];
        var_9._id_24F2 = [];
        var_9._id_24E1 = 0;
        var_9._id_24E0 = [];
        var_9._id_2512 = [];
        var_9._id_24F4 = 0;
        var_9._id_24FD = [];
        var_9._id_24F5 = 0;
        var_9._id_24F1 = 0;
        var_9._id_24E8 = "";
        var_9._id_250D = 0;
    }

    if ( isdefined( var_0 ) )
    {
        var_9._id_94B4 = var_0._id_9F7D;
        var_9._id_94B5 = var_0.owner;
        var_9._id_94B6 = var_0._id_D719;
        var_9._id_94B3 = var_0._id_4D3F;
        var_9._id_94B7 = var_0._id_13908;
        var_9.wasplantedmine = var_0.planted;
    }

    var_9._id_13374 = self.attackerdata;
    var_9._id_13375 = scripts\mp\weapons::_id_9F81();
    var_9._id_13380 = self getstance();
    var_9._id_13376 = self.debuffedbyplayers;
    var_9._id_13384 = _id_0DC9::_id_9FB9( self.team );
    var_9._id_13385 = self._id_EB6C;
    var_9._id_1337D = _id_66B8( "specialty_tracker" );
    var_9._id_1337B = _id_66B8( "specialty_sixth_sense" );
    var_9._id_13379 = _id_66B8( "specialty_quieter" );
    var_9._id_1337A = var_9.victim scripts\mp\supers::_id_7E4F();
    var_9._id_1337C = var_9.victim scripts\mp\supers::_id_9F88();
    var_10 = var_9.victim scripts\mp\supers::_id_7E4E();

    if ( isdefined( var_10 ) )
        var_9._id_13381 = var_10._id_A986;

    var_11 = scripts\mp\domeshield::_id_7E80( self );

    if ( isdefined( var_11 ) )
        var_9._id_13377 = var_11.owner;

    _id_1369C( var_9 );
    var_9.attacker notify( "playerKilledChallengesProcessed" );
}

_id_A695( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_2._id_A6AE ) )
        var_2._id_A6AE = [];

    if ( isdefined( self._id_1653 ) )
    {
        if ( !isdefined( var_2._id_A6AE[self._id_1653] ) )
        {
            var_5 = spawnstruct();
            var_5.owner = self.owner;
            var_5._id_A6A7 = var_0;
            var_5._id_4D71 = var_4;
            var_2._id_A6AE[self._id_1653] = var_5;
        }
        else
            var_2._id_A6AE[self._id_1653]._id_4D71 += var_4;
    }
    else
    {

    }
}

_id_A6A3( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    if ( !_id_B4E8() )
        return;

    if ( isdefined( var_4 ) && isplayer( var_4 ) && ( !isdefined( var_1 ) || var_4 != var_1 ) && isdefined( var_7 ) )
    {
        var_9 = scripts\mp\utility\game::_id_8234( var_7 );

        if ( !isdefined( var_4._id_A6B3 ) )
            var_4._id_A6B3 = [];

        if ( !isdefined( var_4._id_A6B3[var_9] ) )
            var_4._id_A6B3[var_9] = 1;
        else
            var_4._id_A6B3[var_9]++;

        if ( var_4 _id_66B8( "specialty_engineer" ) )
            var_4 _id_D991( "ch_perk_kills_engineer" );

        if ( var_4._id_A684.size > 0 )
            var_4 _id_D9B8();

        if ( _id_0DC9::_id_9D28( var_0 ) )
        {
            if ( var_4 _id_66B8( "specialty_blindeye" ) )
                var_4 _id_D991( "ch_perk_kills_blindeye" );
        }

        var_10 = var_7;
        var_11 = scripts\mp\utility\game::_id_9E6C( var_10 );
        var_12 = 0;
        var_13 = 0;
        var_14 = 0;
        var_15 = scripts\mp\utility\game::_id_9F8D( var_10 );
        var_16 = scripts\engine\utility::_id_9D74( var_6 );

        if ( var_11 )
        {
            switch ( _id_7F48( var_10 ) )
            {
                case "jackal":
                case "bombardment":
                case "precision_airstrike":
                case "thor":
                case "minijackal":
                case "drone_hive":
                    var_12 = 1;
                    break;
            }
        }

        switch ( var_0 )
        {
            case "precision_airstrike":
            case "drone_hive":
                var_13 = 1;
                break;
            case "directional_uav":
            case "counter_uav":
            case "uav":
                var_4 _id_D991( "ch_destroy_uav" );
                var_13 = 1;
                break;
            case "minijackal":
                var_4 _id_D991( "ch_destroy_apex" );
                var_13 = 1;
                break;
            case "thor":
                if ( var_16 )
                    var_4 _id_D991( "ch_thor_bullet_kill" );

                var_13 = 1;
                break;
            case "bombardment":
                var_13 = 1;
                break;
            case "jackal":
                if ( var_16 )
                    var_4 _id_D991( "ch_armada_warden_bullet_kill" );

                var_13 = 1;
                break;
            case "dronedrop":
                var_4 _id_D991( "ch_destroy_dronepackage" );
                var_13 = 1;
                break;
            case "sentry_shock":
                var_4 _id_D991( "ch_destroy_sentry" );
                var_14 = 1;
                break;
            case "ball_drone_backup":
                var_4 _id_D991( "ch_destroy_vulture" );
                var_14 = 1;
                break;
            case "remote_c8":
                var_4 _id_D991( "ch_kill_rc8" );
                var_14 = 1;
                break;
            case "venom":
                var_4 _id_D991( "ch_destroy_scarab" );
                var_14 = 1;
                break;
        }

        if ( var_13 )
            var_4 _id_D991( "ch_destroy_aerial" );

        if ( var_12 && var_13 )
            var_4 _id_D991( "ch_scorestreak_air_to_air" );

        if ( var_12 && var_14 )
            var_4 _id_D991( "ch_scorestreak_air_to_ground" );

        if ( var_15 )
            var_4 _id_D991( "ch_super_scorestreak_kill" );

        var_4 _id_D9D4( var_9, var_0, var_2 );
        var_4._id_A9A8 = gettime();
    }
}

_id_D9D4( var_0, var_1, var_2 )
{
    var_3 = scripts\mp\utility\game::_id_8225( var_0 );

    switch ( var_3 )
    {
        case "weapon_projectile":
            _id_D9D3( var_0, var_1, var_2 );
            break;
    }
}

_id_D9D3( var_0, var_1, var_2 )
{
    switch ( var_0 )
    {
        case "iw7_glprox":
            _id_D9D6( var_0, var_1, var_2 );
            break;
        case "iw7_chargeshot":
            _id_D9D5( var_0, var_1, var_2 );
            break;
        case "iw7_lockon":
            _id_D9D7( var_0, var_1, var_2 );
            break;
        case "iw7_venomx":
            processweaponkilledkillstreak_venomx( var_0, var_1, var_2 );
            break;
    }
}

_id_8375( var_0, var_1 )
{
    if ( isdefined( self.attackers ) )
    {
        foreach ( var_3 in self.attackers )
        {
            if ( self.attackerdata[var_3.guid].damage >= 100 )
            {
                if ( !isdefined( scripts\mp\utility\game::_validateattacker( var_3 ) ) )
                    continue;

                if ( isdefined( self.owner ) && self.owner == var_3 )
                    continue;

                if ( isdefined( self.owner.team ) && scripts\mp\utility\game::_id_9E05( self.owner.team, var_3 ) )
                    continue;

                if ( var_3 == var_1 )
                    continue;

                var_3 thread scripts\mp\utility\game::_id_83B4( "vehicle_destroyed_assist" );
            }
        }
    }
}

_id_1369C( var_0 )
{
    if ( isdefined( var_0.attacker ) )
        var_0.attacker endon( "disconnect" );

    self._id_D9A6 = 1;
    wait 0.05;
    scripts\mp\utility\game::_id_13842();
    _id_5914( "playerKilled", var_0 );
    self._id_D9A6 = undefined;
}

_id_D366( var_0 )
{
    var_1 = spawnstruct();
    var_1.player = self;
    var_1.victim = var_0;
    var_2 = var_0.attackerdata[self.guid];

    if ( isdefined( var_2 ) )
        var_1.sweapon = var_2.weapon;

    _id_5914( "playerAssist", var_1 );
}

_id_13079( var_0 )
{
    self endon( "disconnect" );
    wait 0.05;
    scripts\mp\utility\game::_id_13842();
    var_1 = spawnstruct();
    var_1.player = self;
    var_1._id_A6A7 = var_0;
    _id_5914( "playerUsedKillstreak", var_1 );
}

_id_A691( var_0 )
{
    self endon( "disconnect" );
    wait 0.05;
    scripts\mp\utility\game::_id_13842();
    var_1 = spawnstruct();
    var_1.player = self.owner;
    var_1._id_A6A7 = var_0;
    _id_5914( "playerKillstreakActive", var_1 );
}

_id_E75B()
{
    _id_5914( "roundBegin" );
}

_id_E75D( var_0 )
{
    var_1 = spawnstruct();

    if ( level.teambased )
    {
        var_2 = "allies";

        for ( var_3 = 0; var_3 < level.placement[var_2].size; var_3++ )
        {
            var_1.player = level.placement[var_2][var_3];
            var_1._id_13D8A = var_2 == var_0;
            var_1._id_CBFC = var_3;
            _id_5914( "roundEnd", var_1 );
            var_1.player scripts\mp\contractchallenges::contractmatchend( var_1 );
        }

        var_2 = "axis";

        for ( var_3 = 0; var_3 < level.placement[var_2].size; var_3++ )
        {
            var_1.player = level.placement[var_2][var_3];
            var_1._id_13D8A = var_2 == var_0;
            var_1._id_CBFC = var_3;
            _id_5914( "roundEnd", var_1 );
            var_1.player scripts\mp\contractchallenges::contractmatchend( var_1 );
        }
    }
    else
    {
        for ( var_3 = 0; var_3 < level.placement["all"].size; var_3++ )
        {
            var_1.player = level.placement["all"][var_3];
            var_1._id_13D8A = isdefined( var_0 ) && isplayer( var_0 ) && var_1.player == var_0;
            var_1._id_CBFC = var_3;
            _id_5914( "roundEnd", var_1 );
            var_1.player scripts\mp\contractchallenges::contractmatchend( var_1 );
        }
    }
}

_id_5914( var_0, var_1 )
{
    if ( !_id_B4E8() )
        return;

    if ( isdefined( var_1 ) )
    {
        var_2 = var_1.player;

        if ( !isdefined( var_2 ) )
            var_2 = var_1.attacker;

        if ( isdefined( var_2 ) && isai( var_2 ) )
            return;
    }

    if ( getdvarint( "disable_challenges" ) > 0 )
        return;

    if ( !isdefined( level._id_B8CD[var_0] ) )
        return;

    if ( isdefined( var_1 ) )
    {
        for ( var_3 = 0; var_3 < level._id_B8CD[var_0].size; var_3++ )
            thread [[ level._id_B8CD[var_0][var_3] ]]( var_1 );
    }
    else
    {
        for ( var_3 = 0; var_3 < level._id_B8CD[var_0].size; var_3++ )
            thread [[ level._id_B8CD[var_0][var_3] ]]();
    }
}

_id_BA1E()
{
    level endon( "game_ended" );
    self endon( "spawned_player" );
    self endon( "death" );
    self endon( "disconnect" );
    self._id_10ABF = 0;

    for (;;)
    {
        self waittill( "sprint_begin" );
        self._id_A9F8 = gettime();
        thread _id_BA17();
        thread _id_BA18();
    }
}

_id_BA1F()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self._id_A687 = 0;
        scripts\engine\utility::waittill_any( "sprint_end", "death" );
    }
}

_id_BA18()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self notify( "monitorSingleSprintMomentumTime()" );
    self endon( "monitorSingleSprintMomentumTime()" );
    self waittill( "momentum_max_speed" );
    var_0 = gettime();
    self waittill( "momentum_reset" );

    if ( gettime() > var_0 + 5000 )
        _id_D991( "ch_momentum_time" );
}

_id_B9BA()
{
    if ( level.gametype != "tdef" )
        return;

    level endon( "game_ended" );
    self endon( "disconnect" );
    self._id_6DE0 = 0;

    for (;;)
    {
        self waittill( "ball_grab" );
        self._id_6DE0 = 1;
        self waittill( "ball_dropped" );
        self._id_6DE0 = 0;
    }
}

_id_27FA()
{
    if ( scripts\mp\utility\game::istrue( self._id_6DE0 ) )
        _id_D991( "ch_keep_away" );
}

_id_BA17()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self notify( "monitorSingleSprintDistance()" );
    self endon( "monitorSingleSprintDistance()" );
    var_0 = 0.0;
    var_1 = gettime();

    for (;;)
    {
        var_2 = self.origin;
        var_3 = scripts\engine\utility::_id_13736( 0.1, "sprint_end", "death" );
        var_4 = distance( self.origin, var_2 );
        var_0 += var_4;

        if ( var_3 != "timeout" || !self _meth_81BD() )
            break;
    }

    var_5 = gettime() - var_1;
    var_6 = int( var_5 * 0.35 );
    var_0 = int( min( var_0, var_6 ) / 12 );
    _id_D991( "ch_sprint", var_0 );
}

_id_B9B4()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    var_0 = self isonground() && !self iswallrunning();
    var_1 = 0;

    for (;;)
    {
        if ( scripts\mp\utility\game::istrue( level._id_90A4 ) )
            level waittill( "host_migration_end" );

        if ( self isonground() && !self iswallrunning() )
            var_0 = 1;
        else
        {
            if ( var_0 )
                var_1 = 0;
            else
                var_1 += 0.05;

            if ( var_1 >= 20 )
            {
                _id_D991( "ch_stay_in_air" );
                return;
            }

            var_0 = 0;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_BA33()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "used_cosmetic_gesture" );
        self._id_A960 = gettime();
    }
}

_id_B9D5()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "killed_exploding_drone", var_0 );

        if ( isdefined( var_0 ) && var_0 != self )
            _id_D991( "ch_destroy_explodingdrone" );
    }
}

_id_BA07()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    var_0 = [];

    for (;;)
    {
        self waittill( "power_activated", var_1, var_2 );

        if ( !isdefined( var_0[var_2] ) )
            var_0[var_2] = 1;
        else
            var_0[var_2]++;

        if ( var_2 == "secondary" )
        {
            _id_D991( "ch_tactical_uses" );

            if ( _id_9EBC( var_0[var_2], 2 ) )
                _id_D991( "ch_tactical_two_uses" );
        }
    }
}

_id_A9B5()
{
    if ( !_id_B4E8() )
        return;

    if ( !self._id_13906 )
        return;

    if ( self._id_115D5 > 0 )
        return;

    _id_D992( "ch_lastmanstanding" );
}

_id_B9C0()
{
    self endon( "disconnect" );

    for (;;)
    {
        var_0 = scripts\engine\utility::_id_13734( "bomb_planted", "bomb_defused" );

        if ( !isdefined( var_0 ) )
            continue;

        if ( var_0 == "bomb_planted" )
        {
            _id_D992( "ch_saboteur" );
            continue;
        }

        if ( var_0 == "bomb_defused" )
            _id_D992( "ch_hero" );
    }
}

_id_B9ED()
{
    for (;;)
    {
        self waittill( "spawned_player" );
        thread _id_112E0();
    }
}

_id_112E0()
{
    self endon( "death" );
    self endon( "disconnect" );
    wait 300;

    if ( isdefined( self ) )
        _id_D992( "ch_survivalist" );
}

_id_B9EF()
{
    self endon( "death" );
    self endon( "disconnect" );
    self._id_AF2C = [];

    for (;;)
    {
        self waittill( "missile_fire", var_0, var_1 );

        if ( !isdefined( var_1 ) )
            continue;

        var_2 = scripts\mp\utility\game::_id_8234( var_1 );

        if ( var_2 == "iw7_lockon" )
        {
            self._id_AF2C[self._id_AF2C.size] = var_0;

            if ( isdefined( self._id_10FAA ) && isdefined( self._id_10FA9 ) && self._id_10FA9 == 2 )
                var_0._id_C83D = self._id_10FAA;
        }
    }
}

_id_D992( var_0, var_1, var_2 )
{

}

_id_D991( var_0, var_1, var_2 )
{
    if ( !_id_D3D6() )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( !_id_8C49( var_0 ) )
    {
        if ( getdvarint( "debug_challenges" ) )
        {

        }

        return;
    }

    if ( !_id_9D84( var_0 ) )
        return;

    var_3 = _id_7E22( var_0 );

    if ( _id_2139( var_0 ) )
        return;

    var_4 = _id_3BF8( var_0 );
    var_5 = level._id_3C2C[var_0]["targetval"][var_3];

    if ( isdefined( var_2 ) && var_2 )
        var_6 = var_1;
    else
        var_6 = var_4 + var_1;

    var_7 = 0;

    if ( var_6 >= var_5 )
    {
        var_8 = 1;
        var_7 = var_6 - var_5;
        var_6 = var_5;
    }
    else
        var_8 = 0;

    if ( var_4 < var_6 )
        _id_3C05( var_0, var_6 );

    if ( var_8 )
    {
        thread _id_839C( var_0, var_3 );
        scripts\mp\matchdata::_id_AF99( var_0, var_3 );
        _id_110AE( var_0 );
        _id_8358( level._id_3C2C[var_0]["score"][var_3] );
        var_3++;
        _id_3C06( var_0, var_3 );
        self._id_3C2A[var_0] = var_3;

        if ( _id_2139( var_0 ) )
        {
            thread _id_10117( var_0, challengesplasheseachtier( var_0 ) );
            processmasterchallenge( var_0 );

            switch ( var_0 )
            {
                case "ch_iw7_knife_gold":
                case "ch_iw7_lockon_gold":
                case "ch_iw7_chargeshot_gold":
                case "ch_iw7_glprox_gold":
                case "ch_iw7_emc_gold":
                case "ch_iw7_g18_gold":
                case "ch_iw7_revolver_gold":
                case "ch_iw7_nrg_gold":
                    thread _id_D991( "ch_diamond_melee" );
                    break;
            }
        }
        else
        {
            if ( givesmasterprogresseachtier( var_0 ) )
                processmasterchallenge( var_0 );

            if ( challengesplasheseachtier( var_0 ) )
                thread _id_10117( var_0, 1 );
        }
    }
}

processmasterchallenge( var_0 )
{
    var_1 = level._id_3C2C[var_0]["master"];

    if ( isdefined( var_1 ) )
        thread _id_D991( var_1 );
}

_id_110AE( var_0 )
{
    if ( !isdefined( self._id_3C30 ) )
        self._id_3C30 = [];

    var_1 = 0;

    foreach ( var_3 in self._id_3C30 )
    {
        if ( var_3 == var_0 )
            var_1 = 1;
    }

    if ( !var_1 )
        self._id_3C30[self._id_3C30.size] = var_0;
}

_id_839C( var_0, var_1 )
{
    self endon( "disconnect" );

    if ( !level._id_7669 )
        wait 0.25;

    var_2 = "challenge";
    var_3 = undefined;

    if ( _id_9FFC( var_0 ) )
        var_3 = scripts\mp\utility\game::_id_13C75( _id_8222( var_0 ) );

    var_4 = level._id_3C2C[var_0]["reward"][var_1];
    var_5 = "bonus_challenge_xp";

    if ( isdefined( level.prestigeextras[var_5] ) )
    {
        if ( self _meth_81A7( var_5, "prestigeExtras", 1 ) )
            var_4 = int( var_4 * 1.25 );
    }

    scripts\mp\rank::_id_839A( var_2, var_4, var_3 );
}

_id_8358( var_0 )
{
    var_1 = self getrankedplayerdata( "mp", "challengeScore" );
    self setrankedplayerdata( "mp", "challengeScore", var_1 + var_0 );
}

_id_12E71()
{
    self._id_3C2A = [];
    self endon( "disconnect" );

    if ( !_id_B4E8() )
        return;

    var_0 = 0;

    foreach ( var_5, var_2 in level._id_3C2C )
    {
        var_0++;

        if ( var_0 % 20 == 0 )
            wait 0.05;

        self._id_3C2A[var_5] = 0;
        var_3 = var_2["index"];
        var_4 = _id_3BF9( var_5 );
        self._id_3C2A[var_5] = var_4;
    }
}

_id_7E20( var_0 )
{
    return tablelookup( "mp/allChallengesTable.csv", 0, var_0, 6 );
}

_id_7E21( var_0 )
{
    var_1 = tablelookup( "mp/allChallengesTable.csv", 0, var_0, 7 );

    if ( isdefined( var_1 ) && var_1 == "" )
        return undefined;

    return var_1;
}

_id_B029( var_0, var_1 )
{
    return int( tablelookup( "mp/allChallengesTable.csv", 0, var_0, 10 + var_1 * 3 ) );
}

_id_9F27( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = _id_7E20( var_0 );

    switch ( var_1 )
    {
        case "all_optics":
        case "oscope":
        case "vzscope":
        case "elo":
        case "phase":
        case "reflex":
        case "hybrid":
        case "acog":
        case "noscope":
        case "thermal":
            return 1;
    }

    return 0;
}

isrigcustomizationchallenge( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = _id_7E20( var_0 );

    if ( var_1 == "rig_customization" )
        return 1;

    return 0;
}

_id_9FFC( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = _id_7E20( var_0 );

    if ( isdefined( var_1 ) )
    {
        if ( scripts\mp\utility\game::_id_13C86( var_1 ) )
            return 1;
    }

    return 0;
}

challengesplasheseachtier( var_0 )
{
    return _id_9FFC( var_0 ) || isweaponclasschallenge( var_0 ) || _id_9F27( var_0 ) || isrigcustomizationchallenge( var_0 );
}

givesmasterprogresseachtier( var_0 )
{
    return _id_9FFC( var_0 ) || isweaponclasschallenge( var_0 ) || _id_9F27( var_0 ) || isrigcustomizationchallenge( var_0 );
}

isweaponclasschallenge( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = _id_7E20( var_0 );

    if ( isdefined( var_1 ) )
    {
        switch ( var_1 )
        {
            case "weapon_all":
            case "weapon_projectile":
            case "weapon_shotgun":
            case "weapon_sniper":
            case "weapon_lmg":
            case "weapon_assault":
            case "weapon_smg":
            case "weapon_pistol":
            case "weapon_melee":
                return 1;
        }
    }

    return 0;
}

_id_8222( var_0 )
{
    return _id_7E20( var_0 );
}

_id_8122( var_0 )
{
    return _id_7E20( var_0 );
}

_id_3C27( var_0, var_1, var_2 )
{
    var_3 = tablelookup( var_0, 0, var_1, 10 + var_2 * 3 );
    return int( var_3 );
}

_id_3C20( var_0, var_1, var_2 )
{
    var_3 = tablelookup( var_0, 0, var_1, 11 + var_2 * 3 );
    return int( var_3 );
}

_id_3C25( var_0, var_1, var_2 )
{
    var_3 = tablelookup( var_0, 0, var_1, 12 + var_2 * 3 );
    return int( var_3 );
}

_id_3C18( var_0, var_1 )
{
    var_2 = tablelookup( var_0, 0, var_1, 8 );
    return scripts\engine\utility::ter_op( var_2 == "", undefined, int( var_2 ) );
}

_id_3C1C( var_0, var_1 )
{
    var_2 = tablelookup( var_0, 0, var_1, 9 );
    return scripts\engine\utility::ter_op( var_2 == "", undefined, int( var_2 ) );
}

_id_31D8( var_0, var_1 )
{
    var_2 = 0;
    var_3 = 0;
    level._id_3C2D = [];
    var_2 = 0;

    for (;;)
    {
        var_4 = tablelookupbyrow( var_0, var_2, 0 );

        if ( var_4 == "" )
            break;

        var_5 = _id_7E21( var_4 );
        level._id_3C2C[var_4] = [];
        level._id_3C2C[var_4]["index"] = var_2;
        level._id_3C2C[var_4]["type"] = var_1;
        level._id_3C2C[var_4]["targetval"] = [];
        level._id_3C2C[var_4]["reward"] = [];
        level._id_3C2C[var_4]["score"] = [];
        level._id_3C2C[var_4]["filter"] = _id_7E20( var_4 );
        level._id_3C2C[var_4]["master"] = var_5;

        for ( var_6 = 0; var_6 < 8; var_6++ )
        {
            var_7 = _id_3C27( var_0, var_4, var_6 );

            if ( var_7 == 0 )
                break;

            var_8 = _id_3C20( var_0, var_4, var_6 );
            var_9 = _id_3C25( var_0, var_4, var_6 );
            level._id_3C2C[var_4]["targetval"][var_6] = var_7;
            level._id_3C2C[var_4]["reward"][var_6] = var_8;
            level._id_3C2C[var_4]["score"][var_6] = var_9;
            var_3 += var_8;
        }

        var_10 = _id_3C18( var_0, var_4 );
        level._id_3C2C[var_4]["displayParam"] = var_10;
        var_11 = _id_3C1C( var_0, var_4 );
        level._id_3C2C[var_4]["paramScale"] = var_11;

        if ( isdefined( var_5 ) )
        {
            if ( !isdefined( level._id_3C2D[var_5] ) )
                level._id_3C2D[var_5] = [];

            level._id_3C2D[var_5][level._id_3C2D[var_5].size] = var_4;
        }

        var_2++;
    }

    return int( var_3 );
}

validatemasterchallenges()
{
    level endon( "game_ended" );
    wait 1.0;

    foreach ( var_6, var_1 in level._id_3C2D )
    {
        var_2 = 0;

        foreach ( var_1 in var_1 )
        {
            if ( givesmasterprogresseachtier( var_1 ) )
            {
                var_2 += level._id_3C2C[var_1]["targetval"].size;
                continue;
            }

            var_2 += 1;
        }

        var_5 = level._id_3C2C[var_6]["targetval"][0];
    }
}

_id_31D7()
{
    level._id_3C2C = [];
    var_0 = 0;
    var_0 += _id_31D8( "mp/allChallengesTable.csv", 0 );
}

_id_BA08()
{
    self endon( "disconnect" );
    level endon( "game_end" );

    for (;;)
    {
        if ( !_id_B4E8() )
            return;

        self waittill( "process", var_0 );
        _id_D992( var_0 );
    }
}

_id_B9E9()
{
    self endon( "disconnect" );
    level endon( "game_end" );

    for (;;)
    {
        self waittill( "got_killstreak", var_0 );

        if ( !isdefined( var_0 ) )
            continue;

        if ( var_0 == 10 && self._id_A6AB.size == 0 )
        {
            _id_D992( "ch_theloner" );
            continue;
        }

        if ( var_0 == 9 )
        {
            if ( isdefined( self._id_A6AB[7] ) && isdefined( self._id_A6AB[8] ) && isdefined( self._id_A6AB[9] ) )
                _id_D992( "ch_6fears7" );
        }
    }
}

_id_B9E6()
{
    self endon( "disconnect" );
    level endon( "game_end" );

    for (;;)
    {
        self waittill( "destroyed_killstreak", var_0 );

        if ( self _meth_81A7( "specialty_blindeye", "perk" ) && scripts\mp\utility\game::_id_12D6( "specialty_blindeye" ) )
            _id_D992( "ch_blindeye" );
    }
}

_id_D39B()
{
    var_0 = self getweaponslistprimaries();

    foreach ( var_2 in var_0 )
    {
        if ( self getweaponammoclip( var_2 ) )
        {
            if ( !scripts\mp\weapons::_id_9F2D( var_2 ) && !scripts\mp\weapons::_id_9E6D( var_2 ) )
                return 1;
        }

        var_3 = weaponaltweaponname( var_2 );

        if ( !isdefined( var_3 ) || var_3 == "none" )
            continue;

        if ( self getweaponammoclip( var_3 ) )
            return 1;
    }

    return 0;
}

_id_B9B2()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    var_0 = scripts\mp\utility\game::_id_9EE8();
    self._id_A932 = 0;

    for (;;)
    {
        if ( scripts\mp\utility\game::_id_9EE8() )
        {
            if ( !var_0 )
            {
                self._id_A932 = gettime();
                var_0 = 1;
            }
        }
        else
            var_0 = 0;

        wait 0.05;
    }
}

_id_B9E0()
{
    self endon( "disconnect" );
    self._id_9074 = 0;

    for (;;)
    {
        self waittill( "hold_breath" );
        self._id_9074 = 1;
        self waittill( "release_breath" );
        self._id_9074 = 0;
    }
}

_id_B9F0()
{
    self endon( "disconnect" );
    self._id_B315 = 0;

    for (;;)
    {
        self waittill( "jumped" );
        var_0 = self getcurrentweapon();
        scripts\engine\utility::_id_137B7( "weapon_change", 1 );
        var_1 = self getcurrentweapon();

        if ( var_1 == "none" )
            self._id_B315 = 1;
        else
            self._id_B315 = 0;

        if ( self._id_B315 )
        {
            if ( self _meth_81A7( "specialty_fastmantle", "perk" ) && scripts\mp\utility\game::_id_12D6( "specialty_fastmantle" ) )
                _id_D992( "ch_fastmantle" );

            scripts\engine\utility::_id_137B7( "weapon_change", 1 );
            var_1 = self getcurrentweapon();

            if ( var_1 == var_0 )
                self._id_B315 = 0;
        }
    }
}

_id_BA3B()
{
    self endon( "disconnect" );
    var_0 = self getcurrentweapon();

    for (;;)
    {
        self waittill( "weapon_change", var_1 );

        if ( var_1 == "none" )
            continue;

        if ( var_1 == var_0 )
            continue;

        if ( scripts\mp\utility\game::_id_9E6C( var_1 ) )
            continue;

        if ( var_1 == "briefcase_bomb_mp" || var_1 == "briefcase_bomb_defuse_mp" )
            continue;

        var_2 = weaponinventorytype( var_1 );

        if ( var_2 != "primary" )
            continue;

        self._id_A9D3 = gettime();
    }
}

_id_B9DA()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "flashbang", var_0, var_1, var_2, var_3 );

        if ( self == var_3 )
            continue;

        self._id_A98A = gettime();
    }
}

_id_B9F4()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "triggeredExpl", var_0 );
        thread _id_136A2();
    }
}

_id_136A2()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait( level._id_5113 + 2 );
    _id_D992( "ch_delaymine" );
}

_id_10061( var_0 )
{
    return self _meth_81A7( var_0, "perk" ) && scripts\mp\utility\game::_id_12D6( var_0 );
}

_id_D9BF( var_0, var_1 )
{
    _id_D992( "ch_" + var_1 );
}

processfinalkillchallenges( var_0, var_1 )
{
    if ( !_id_B4E8() || isai( var_0 ) )
        return;

    var_0 _id_D992( "ch_theedge" );

    if ( !isai( var_1 ) )
        var_1 _id_D992( "ch_starryeyed" );

    if ( isdefined( var_0 ) && isdefined( var_0._id_B930 ) && isdefined( var_0._id_B930["revenge"] ) )
        var_0 _id_D992( "ch_moneyshot" );

    if ( isdefined( var_1 ) && isdefined( var_1._id_6A00 ) && isdefined( var_1._id_6A00["stickKill"] ) && var_1._id_6A00["stickKill"] )
        var_0 _id_D992( "ch_stickman" );

    if ( isdefined( var_1.attackerdata[var_0.guid] ) && isdefined( var_1.attackerdata[var_0.guid].smeansofdeath ) && isdefined( var_1.attackerdata[var_0.guid].weapon ) && issubstr( var_1.attackerdata[var_0.guid].smeansofdeath, "MOD_MELEE" ) && scripts\mp\weapons::_id_9F2D( var_1.attackerdata[var_0.guid].weapon ) )
        var_0 _id_D992( "ch_owned" );

    var_2 = var_0.team;

    if ( !level.teambased )
        var_2 = "none";

    var_0 _id_D991( "ch_final_killcam" );
}

_id_D9C3( var_0, var_1, var_2 )
{
    if ( scripts\mp\utility\game::_id_9EE8() )
    {
        _id_D991( "ch_" + var_1 + "_kills" );

        if ( isdefined( var_2._id_B930["headshot"] ) )
            _id_D991( "ch_" + var_1 + "_headshots" );

        if ( isdefined( var_2._id_B930["longshot"] ) )
            _id_D991( "ch_" + var_1 + "_longshots" );

        if ( var_2._id_2504 % 2 == 0 )
            _id_D991( "ch_" + var_1 + "_double_kills" );
    }

    if ( var_2._id_24E4 > 0 && var_2._id_24E4 % 3 == 0 )
        _id_D991( "ch_" + var_1 + "_streak" );
}

_id_D9C9( var_0, var_1 )
{
    _id_D991( "ch_lifetime_ar_kills" );
    _id_D991( "ch_" + var_0 );
    _id_3DF9( var_1, "headshot", var_0 );
    _id_3DF9( var_1, "longshot", var_0 );
    _id_3E59( var_0, var_1.sweapon );
    _id_3DEF( var_0, var_1.sweapon, 0 );
    _id_3E2B( var_1.sweapon, var_1, var_0, 2 );
    _id_3DFE( var_1.sweapon, var_1, var_0, 3 );
}

_id_D9D1( var_0, var_1 )
{
    _id_D991( "ch_lifetime_smg_kills" );
    _id_D991( "ch_" + var_0 );
    _id_3DF9( var_1, "hipfire", var_0 );
    _id_3DF9( var_1, "pointblank", var_0 );
    _id_3DF9( var_1, "sliding", var_0 );
    _id_3DEF( var_0, var_1.sweapon, 0 );
    _id_3E2B( var_1.sweapon, var_1, var_0, 2 );
    _id_3DFE( var_1.sweapon, var_1, var_0, 3 );
}

_id_D9CB( var_0, var_1 )
{
    _id_D991( "ch_lifetime_lmg_kills" );
    _id_D991( "ch_" + var_0 );
    _id_3DF9( var_1, "headshot", var_0 );

    if ( isdefined( var_1._id_B930["hipfire"] ) )
        _id_D991( "ch_" + var_0 + "_penetrate" );

    _id_3E25( var_1, var_0, var_1.sweapon );
    _id_3DEF( var_0, var_1.sweapon, 6 );
    _id_3E2B( var_1.sweapon, var_1, var_0, 2 );
    _id_3DFE( var_1.sweapon, var_1, var_0, 3 );
}

_id_D9CA( var_0, var_1 )
{
    _id_D991( "ch_" + var_0 );

    if ( var_1._id_250B == "crouch" )
        _id_D992( "ch_" + var_0 + "_crouch" );

    _id_3DFA( var_1, "defender", var_0 );
    _id_3DFA( var_1, "longshot", var_0 );
    _id_3DFA( var_1, "headshot", var_0 );
    _id_3DFA( var_1, "pointblank", var_0 );
    _id_3DF8( var_0 );
}

_id_D9D2( var_0, var_1 )
{
    _id_D991( "ch_lifetime_sniper_kills" );
    _id_D991( "ch_" + var_0 );
    _id_3DF9( var_1, "headshot", var_0 );
    _id_3DF9( var_1, "longshot", var_0 );

    if ( var_1._id_24EB )
        _id_D991( "ch_" + var_0 + "_holdbreath" );

    _id_3DEF( var_0, var_1.sweapon, 6 );
    _id_3E2B( var_1.sweapon, var_1, var_0, 2 );
    _id_3DFE( var_1.sweapon, var_1, var_0, 3 );

    if ( scripts\mp\utility\game::istrue( var_1._id_B930["pointblank"] ) )
        _id_D991( "ch_point_blank_sniper" );
}

_id_D9D0( var_0, var_1 )
{
    _id_D991( "ch_lifetime_shotgun_kills" );
    _id_D991( "ch_" + var_0 );
    _id_3DF9( var_1, "hipfire", var_0 );
    _id_3DF9( var_1, "pointblank", var_0 );
    _id_3DF9( var_1, "sliding", var_0 );
    _id_3DEF( var_0, var_1.sweapon, 0 );
    _id_3E2B( var_1.sweapon, var_1, var_0, 2 );
    _id_3DFE( var_1.sweapon, var_1, var_0, 3 );
}

_id_D9CF( var_0, var_1 )
{
    _id_D991( "ch_" + var_0 );
}

_id_D9CD( var_0, var_1 )
{
    _id_D991( "ch_lifetime_pistol_kills" );
    _id_D991( "ch_" + var_0 );
    _id_3DF9( var_1, "headshot", var_0 );
    _id_3DF9( var_1, "pointblank", var_0 );

    if ( !_id_3E17( var_1 ) )
        _id_D991( "ch_" + var_0 + "_pistol_only" );

    _id_3DEF( var_0, var_1.sweapon, 5 );
    _id_3E2B( var_1.sweapon, var_1, var_0, 2 );
    _id_3DFE( var_1.sweapon, var_1, var_0, 3 );
    var_2 = scripts\mp\utility\game::_id_8234( var_1.sweapon );

    if ( var_2 == "iw7_mag" && isdefined( var_1._id_B930["hipfire"] ) )
    {
        if ( !isdefined( self.hipfiremagkills ) )
            self.hipfiremagkills = 1;
        else
            self.hipfiremagkills++;
    }
}

_id_D9CE( var_0, var_1 )
{
    switch ( var_0 )
    {
        case "iw7_glprox":
            _id_D9C6( var_0, var_1 );
            break;
        case "iw7_chargeshot":
            _id_D9C5( var_0, var_1 );
            break;
        case "iw7_lockon":
            _id_D9C7( var_0, var_1 );
            break;
        case "iw7_venomx":
            processweaponchallenge_venomx( var_0, var_1 );
            break;
    }
}

_id_D9C6( var_0, var_1 )
{
    _id_D991( "ch_iw7_glprox" );

    if ( var_1.smeansofdeath == "MOD_IMPACT" || var_1.smeansofdeath == "MOD_GRENADE" )
        _id_D991( "ch_iw7_glprox_direct" );

    _id_3E2B( var_1.sweapon, var_1, var_0, 2 );

    if ( !_id_3E17( var_1 ) )
        _id_D991( "ch_iw7_glprox_no_primary" );

    if ( isdefined( var_1.victim ) )
    {
        if ( distancesquared( var_1.victim.origin, self.origin ) > 1440000 )
            _id_D991( "ch_iw7_glprox_long_range" );
    }

    _id_3DFE( var_1.sweapon, var_1, var_0, 3 );
}

_id_D9D6( var_0, var_1, var_2 )
{
    _id_D991( "ch_iw7_glprox_kill_streak" );
}

processweaponchallenge_venomx( var_0, var_1 )
{
    _id_D991( "ch_iw7_venomx" );

    if ( var_1.smeansofdeath == "MOD_IMPACT" || var_1.smeansofdeath == "MOD_GRENADE" )
        _id_D991( "ch_iw7_venomx_direct" );

    _id_3E2B( var_1.sweapon, var_1, var_0, 2 );

    if ( !_id_3E17( var_1 ) )
        _id_D991( "ch_iw7_venomx_no_primary" );

    if ( isdefined( var_1.victim ) )
    {
        if ( distancesquared( var_1.victim.origin, self.origin ) > 1440000 )
            _id_D991( "ch_iw7_venomx_long_range" );
    }

    _id_3DFE( var_1.sweapon, var_1, var_0, 3 );
}

processweaponkilledkillstreak_venomx( var_0, var_1, var_2 )
{
    _id_D991( "ch_iw7_venomx_kill_streak" );
}

_id_D9C5( var_0, var_1 )
{
    _id_D991( "ch_iw7_chargeshot_kill" );
    _id_3E2B( var_1.sweapon, var_1, var_0, 2 );
    _id_3E4D( var_0 );
}

_id_D9D5( var_0, var_1, var_2 )
{
    _id_D991( "ch_iw7_chargeshot" );
    _id_D991( "ch_iw7_chargeshot_kill_streak_points", scripts\mp\killstreaks\killstreaks::_id_817B( var_1 ) );

    if ( isdefined( self._id_A9A8 ) && gettime() - self._id_A9A8 < 10000 )
        _id_D991( "ch_iw7_chargeshot_streak_double" );

    if ( isdefined( self._id_A6B3 ) && isdefined( self._id_A6B3[var_0] ) && _id_9EBC( self._id_A6B3[var_0], 3 ) )
        _id_D991( "ch_iw7_chargeshot_kill_3_streaks" );

    _id_3E4D( var_0 );
}

_id_D9C7( var_0, var_1 )
{
    _id_D991( "ch_iw7_lockon_kill" );
    _id_3E4D( var_0 );
}

_id_D9D7( var_0, var_1, var_2 )
{
    _id_D991( "ch_iw7_lockon" );
    _id_D991( "ch_iw7_lockon_kill_streak_points", scripts\mp\killstreaks\killstreaks::_id_817B( var_1 ) );
    var_3 = undefined;
    var_4 = 0;

    foreach ( var_6 in self._id_AF2C )
    {
        if ( isdefined( var_6 ) )
        {
            var_7 = distancesquared( var_6.origin, var_2.origin );

            if ( !isdefined( var_3 ) || var_4 > var_7 )
            {
                var_3 = var_6;
                var_4 = var_7;
            }
        }
    }

    if ( isdefined( var_3 ) && !isdefined( var_3._id_C83D ) )
        _id_D991( "ch_iw7_lockon_no_lock_on" );

    if ( isdefined( self._id_A9A8 ) && gettime() - self._id_A9A8 < 10000 )
        _id_D991( "ch_iw7_lockon_streak_double" );

    if ( isdefined( self._id_A6B3 ) && isdefined( self._id_A6B3[var_0] ) && _id_9EBC( self._id_A6B3[var_0], 3 ) )
        _id_D991( "ch_iw7_lockon_kill_3_streaks" );

    _id_3E4D( var_0 );
}

_id_D9CC( var_0, var_1 )
{
    _id_D991( "ch_" + var_0 );

    if ( isdefined( var_1._id_B930["backstab"] ) )
        _id_D991( "ch_" + var_0 + "_backstab" );
    else
        _id_D991( "ch_" + var_0 + "_frontstab" );

    if ( !_id_3E17( var_1 ) )
        _id_D991( "ch_" + var_0 + "_melee_only" );

    _id_3DF9( var_1, "sliding", var_0 );
    _id_3E2B( var_1.sweapon, var_1, var_0, 2 );
    _id_3DFE( var_1.sweapon, var_1, var_0, 3 );
}

processweaponchallenge_axemelee( var_0, var_1 )
{
    var_2 = "alt_" + var_1.sweapon;
    _id_D991( "ch_iw7_axe" );

    if ( isdefined( var_1._id_B930["backstab"] ) )
        _id_D991( "ch_" + var_0 + "_backstab" );

    checkaxecombochallenge( var_1, var_1.sweapon, var_2 );
    checkaxemultikillchallenge( var_1, var_1.sweapon, var_2 );
    checkaxeconsecutivechallenge( var_1, var_1.sweapon, var_2 );
}

processweaponchallenge_axethrow( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_E0CF( var_1.sweapon );
    _id_D991( "ch_iw7_axe_frontstab" );

    if ( isdefined( var_1._id_B930["backstab"] ) )
        _id_D991( "ch_" + var_0 + "_backstab" );

    var_3 = var_1._id_24F3[var_1.sweapon];

    if ( isdefined( var_3 ) && _id_9EBC( var_3, 2 ) )
        _id_D991( "ch_iw7_axe_melee_only" );

    checkaxecombochallenge( var_1, var_2, var_1.sweapon );
    checkaxemultikillchallenge( var_1, var_2, var_1.sweapon );
    checkaxeconsecutivechallenge( var_1, var_2, var_1.sweapon );
}

checkaxecombochallenge( var_0, var_1, var_2 )
{
    var_3 = var_0._id_24F3[var_1];
    var_4 = var_0._id_24F3[var_2];

    if ( var_0.sweapon == var_1 )
    {
        var_5 = isdefined( var_3 ) && var_3 == 1;
        var_6 = isdefined( var_4 ) && var_4 > 0;

        if ( var_5 && var_6 )
        {
            _id_D991( "ch_iw7_axe_sliding" );
            return;
        }
    }
    else if ( var_0.sweapon == var_2 )
    {
        var_7 = isdefined( var_4 ) && var_4 == 1;
        var_8 = isdefined( var_3 ) && var_3 > 0;

        if ( var_7 && var_8 )
        {
            _id_D991( "ch_iw7_axe_sliding" );
            return;
        }
    }
    else
    {

    }
}

checkaxemultikillchallenge( var_0, var_1, var_2 )
{
    var_3 = 0;

    if ( isdefined( var_0._id_2505[var_1] ) )
        var_3 += var_0._id_2505[var_1];

    if ( isdefined( var_0._id_2505[var_2] ) )
        var_3 += var_0._id_2505[var_2];

    if ( isdefined( var_3 ) && _id_9EBC( var_3, 2 ) )
        _id_D991( "ch_iw7_axe_2multikill" );
}

checkaxeconsecutivechallenge( var_0, var_1, var_2 )
{
    var_3 = 0;

    if ( isdefined( var_0._id_24F3[var_1] ) )
        var_3 += var_0._id_24F3[var_1];

    if ( isdefined( var_0._id_24F3[var_2] ) )
        var_3 += var_0._id_24F3[var_2];

    if ( isdefined( var_3 ) && _id_9EBC( var_3, 3 ) )
        _id_D991( "ch_iw7_axe_3streak" );
}

_id_3DF9( var_0, var_1, var_2 )
{
    if ( isdefined( var_0._id_B930[var_1] ) )
        _id_D991( "ch_" + var_2 + "_" + var_1 );
}

_id_3DFA( var_0, var_1, var_2 )
{
    if ( isdefined( var_0._id_B930[var_1] ) )
        _id_D992( "ch_" + var_2 + "_" + var_1 );
}

_id_3DF8( var_0 )
{
    if ( self _meth_81AA() )
        _id_D992( "ch_" + var_0 + "_leaning" );
}

_id_3E32( var_0, var_1 )
{
    if ( var_0._id_92BE & level.idflags_penetration )
        _id_D992( "ch_" + var_1 + "_penetrate" );
}

_id_3E31( var_0, var_1 )
{
    if ( var_0._id_92BE & level.idflags_penetration )
        _id_D991( "ch_" + var_1 + "_penetrate" );
}

_id_3DFE( var_0, var_1, var_2, var_3 )
{
    var_4 = var_1._id_24F3[var_0];

    if ( isdefined( var_4 ) && _id_9EBC( var_4, var_3 ) )
        _id_D991( "ch_" + var_2 + "_" + var_3 + "streak" );
}

_id_3E5F()
{
    var_0 = self getcurrentweapon();

    if ( scripts\mp\weapons::_id_9F2D( var_0 ) )
        return 1;
    else
    {
        var_1 = scripts\engine\utility::_id_7F62();
        return scripts\mp\weapons::_id_9F2D( var_1 );
    }
}

_id_3DE3( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
    {
        if ( isdefined( level._id_C321 ) && isdefined( level._id_C321["odin_assault"] ) && ( var_2 == level._id_C321["odin_assault"].weapon["large_rod"]._id_DA5A || var_2 == level._id_C321["odin_assault"].weapon["small_rod"]._id_DA5A ) )
        {
            var_0 _id_D992( "ch_shooting_star" );
            return 1;
        }
        else if ( var_2 == "aamissile_projectile_mp" )
            var_0 _id_D992( "ch_air_superiority" );
    }

    var_0 _id_D992( "ch_clearskies" );
    return 0;
}

_id_3DFF( var_0, var_1 )
{
    if ( !isai( var_0 ) )
    {
        var_2 = var_0 scripts\mp\teams::_id_8078();
        var_3 = var_0 scripts\mp\teams::_id_8079( var_2 );
        return var_3 == var_1;
    }

    return 0;
}

_id_3E59( var_0, var_1 )
{
    if ( scripts\mp\utility\game::istrue( self._id_B930["ads"] ) )
    {
        var_2 = getweaponattachments( var_1 );

        foreach ( var_4 in var_2 )
        {
            var_5 = scripts\mp\weapons::_id_248C( var_4 );

            if ( var_5 == "rail" )
            {
                var_6 = scripts\mp\utility\game::_id_2494( var_4 );

                if ( scripts\mp\weapons::_id_9F3C( var_0, var_6 ) )
                {
                    _id_D991( "ch_" + var_0 + "_optic" );
                    break;
                }
            }
        }
    }
}

_id_3E2B( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_1._id_2505[var_0] ) )
    {
        var_4 = var_1._id_2505[var_0];

        if ( isdefined( var_4 ) && _id_9EBC( var_4, var_3 ) )
            _id_D991( "ch_" + var_2 + "_" + var_3 + "multikill" );
    }
}

_id_3DEF( var_0, var_1, var_2 )
{
    var_3 = 0;

    foreach ( var_5 in getweaponattachments( var_1 ) )
    {
        var_6 = scripts\mp\utility\game::_id_2494( var_5 );

        if ( scripts\mp\weapons::_id_9F3C( var_0, var_6 ) )
            var_3++;
    }

    if ( var_3 == var_2 )
        _id_D991( "ch_" + var_0 + "_" + var_2 + "attachments" );
}

_id_3E25( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0._id_24E3 ) )
        return;

    var_3 = var_0._id_24E3;
    var_4 = weaponclipsize( var_2 );

    if ( var_3 <= var_4 * 0.15 )
        _id_D991( "ch_" + var_1 + "_lastshots" );
}

_id_3E17( var_0 )
{
    if ( isdefined( var_0._id_24EE ) )
    {
        foreach ( var_2 in var_0._id_24EE )
        {
            if ( scripts\mp\utility\game::_id_9D78( var_2 ) )
                return 1;
        }
    }

    return 0;
}

_id_3E4D( var_0 )
{
    if ( isdefined( self._id_A684 ) && isdefined( self._id_A6B4 ) )
    {
        if ( self._id_A684.size > 0 && self._id_A6B4.size > 0 && !scripts\mp\utility\game::istrue( self._id_110E6[var_0] ) )
        {
            _id_D991( "ch_" + var_0 + "_combo" );
            self._id_110E6[var_0] = 1;
        }
    }
}

_id_D994( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( var_3.team == var_1 )
            var_3 _id_D992( var_0 );
    }
}

_id_9D84( var_0 )
{
    var_1 = level._id_3C2C[var_0]["filter"];

    if ( !isdefined( var_1 ) )
        return 1;

    return self _meth_81A7( var_1, "challenge" ) && self _meth_81A7( var_0, "challenge" );
}

_id_8C49( var_0 )
{
    return isdefined( level._id_3C2C ) && isdefined( level._id_3C2C[var_0] );
}

_id_1C97( var_0, var_1 )
{
    return 0;
}

_id_3E2D( var_0, var_1 )
{
    var_2 = self.pers[var_0];
    return _id_9EBC( var_2, var_1 );
}

_id_9EBC( var_0, var_1 )
{
    return var_0 > 0 && var_0 % var_1 == 0;
}

_id_8C0E()
{
    if ( isdefined( self.pers["loadoutPerks"] ) )
        return self.pers["loadoutPerks"].size == 0;

    return 1;
}

_id_9D83( var_0 )
{
    if ( !_id_D3D6() )
        return 0;

    if ( _id_2139( var_0 ) )
        return 0;

    return 1;
}

_id_2139( var_0 )
{
    if ( self._id_3C2A[var_0] >= level._id_3C2C[var_0]["targetval"].size )
        return 1;

    return 0;
}

_id_D9B8()
{
    if ( scripts\mp\utility\game::istrue( self._id_110E5 ) )
        return;

    _id_D991( "ch_streak_player_kill" );
    self._id_110E5 = 1;
}

_id_9E8A( var_0 )
{
    switch ( var_0 )
    {
        case "right_foot":
        case "right_leg_lower":
        case "right_leg_upper":
        case "left_foot":
        case "left_leg_lower":
        case "left_leg_upper":
            return 1;
    }

    return 0;
}

_id_D3A8( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return;

    var_2 = scripts\engine\utility::ter_op( isplayer( var_1 ), var_1, var_1.owner );

    if ( !isdefined( var_2 ) || !isplayer( var_2 ) )
        return;

    if ( isdefined( var_0.debuffedbyplayers ) && isdefined( var_0.debuffedbyplayers["cryo_mine_mp"] ) && var_0.debuffedbyplayers["cryo_mine_mp"].size > 0 )
        var_2 _id_D991( "ch_plasma_cryo_combo" );
}

minedestroyed( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) || !isplayer( var_1 ) )
        return;

    if ( isdefined( var_0._id_13C2E ) && var_0._id_13C2E == "c4_mp" )
    {
        if ( var_0.owner != var_1 && !scripts\mp\utility\game::istrue( var_0.planted ) && scripts\engine\utility::_id_9D74( var_2 ) )
            var_1 _id_D991( "ch_c4_air_kill" );
    }
}

_id_2AEA( var_0, var_1, var_2 )
{
    if ( var_0._id_5726 >= 1300 )
        var_1 _id_D991( "ch_biospike_longrange" );
}

_id_BA0B()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self._id_A686 = 0;

    for (;;)
    {
        self waittill( "reload" );
        self._id_A9DD = gettime();
        self._id_A686 = 0;
    }
}

_id_C5A8( var_0 )
{
    if ( !_id_B4E8() )
        return;

    if ( isdefined( self._id_453C ) && isdefined( self._id_453C[var_0] ) )
    {
        if ( _id_9EBC( self._id_453C[var_0], 5 ) && scripts\mp\utility\game::_id_13C90( var_0, "grip" ) )
            _id_D991( "ch_grip_accuracy" );
    }
}

_id_BA29()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "super_earned" );

        if ( !scripts\mp\utility\game::_id_766C( "prematch_done" ) )
            continue;

        if ( _id_66B8( "specialty_overclock" ) )
        {
            _id_D991( "ch_perk_overclock" );

            if ( self.pers["supersEarned"] % 5 == 0 )
                _id_D991( "ch_overclock_unlocked" );
        }
    }
}

_id_66B8( var_0 )
{
    if ( !scripts\mp\utility\game::_id_12D6( var_0 ) || !scripts\mp\perks::_id_9EDF( var_0 ) )
        return 0;

    return 1;
}

_id_E280( var_0 )
{
    if ( !isdefined( var_0 ) || !isplayer( var_0 ) )
        return;

    self._id_1119A[var_0.guid] = 1;
}

_id_B9D4()
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "destroyed_equipment" );
        _id_D991( "ch_destroy_items" );

        if ( _id_66B8( "specialty_engineer" ) )
            _id_D991( "ch_perk_kills_engineer" );
    }
}

_id_127BC()
{
    _id_D991( "ch_engineer_explosion_delay" );
}

_id_B9CE()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "earned_award_buffered", var_0 );
        var_1 = 0;
        var_2 = 0;
        var_3 = 0;
        var_4 = 0;
        var_5 = 0;

        switch ( var_0 )
        {
            case "mode_ctf_kill_with_flag":
            case "mode_uplink_kill_with_ball":
            case "mode_sd_defuse_save":
            case "mode_x_assault":
                var_1 = 1;
                break;
            case "mode_sd_plant_save":
            case "mode_x_defend":
                var_2 = 1;
                break;
            case "mode_ctf_kill_carrier":
            case "mode_uplink_kill_carrier":
                var_2 = 1;
                var_4 = 1;
                break;
            case "mode_siege_secure":
            case "mode_ctf_cap":
            case "mode_uplink_fieldgoal":
            case "mode_uplink_dunk":
            case "mode_hp_secure":
            case "mode_dom_secure":
            case "mode_dom_secure_neutral":
            case "mode_dom_secure_b":
            case "mode_sd_detonate":
                var_3 = 1;
                break;
            case "mode_sd_defuse":
            case "mode_sd_last_defuse":
                var_3 = 1;
                var_5 = 1;
                break;
        }

        if ( var_1 )
            _id_D991( "ch_kill_defenders" );

        if ( var_2 )
            _id_D991( "ch_kill_attackers" );

        if ( var_3 )
            _id_D991( "ch_objectives" );

        if ( var_5 )
            _id_D991( "ch_defuse" );

        if ( var_4 )
            _id_D991( "ch_kill_carrier" );
    }
}

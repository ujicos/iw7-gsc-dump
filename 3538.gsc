// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_F7D0()
{

}

_id_12D01()
{

}

_id_F6DC()
{

}

_id_12CA9()
{

}

_id_F650()
{
    if ( !isplayer( self ) )
        return;

    _id_2694();
    _id_2695();
}

_id_2695()
{
    self waittill( "death" );
    self endon( "disconnect" );
    self endon( "endAutoSpotAdsWatcher" );
    level endon( "game_ended" );
    self autospotoverlayoff();
}

_id_12C76()
{
    if ( !isplayer( self ) )
        return;

    self notify( "endAutoSpotAdsWatcher" );
    self autospotoverlayoff();
}

_id_2694()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "endAutoSpotAdsWatcher" );
    level endon( "game_ended" );
    var_0 = 0;

    for (;;)
    {
        wait 0.05;

        if ( self isusingturret() )
        {
            self autospotoverlayoff();
            continue;
        }

        var_1 = self playerads();

        if ( var_1 < 1 && var_0 )
        {
            var_0 = 0;
            self autospotoverlayoff();
        }

        if ( var_1 < 1 && !var_0 )
            continue;

        if ( var_1 == 1 && !var_0 )
        {
            var_0 = 1;
            self autospotoverlayon();
        }
    }
}

_id_F81B()
{
    self._id_11B2C = "specialty_regenfaster";
}

_id_12D19()
{
    self._id_11B2C = undefined;
}

_id_11906()
{
    self._id_8C1A = undefined;
    scripts\mp\utility\game::_id_E150( "specialty_regenfaster" );
    self setclientdvar( "ui_regen_faster_end_milliseconds", 0 );
    self notify( "timeOutRegenFaster" );
}

_id_F73A()
{
    self._id_FC6B = 0.25;
}

_id_12CCC()
{
    self._id_FC6B = 0;
}

_id_F83C()
{
    thread _id_BA14();
}

_id_BA14()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "stop_monitorSharpFocus" );

    for (;;)
    {
        _id_12F1A();
        self waittill( "weapon_change" );
    }
}

_id_12F1A()
{
    var_0 = self getcurrentweapon();
    var_1 = undefined;

    if ( level.tactical )
    {
        if ( weaponclass( var_0 ) == "sniper" )
            var_1 = 0.85;
        else
            var_1 = 0.5;
    }
    else if ( weaponclass( var_0 ) == "sniper" )
        var_1 = 0.85;
    else
        var_1 = 0.25;

    scripts\mp\weapons::_id_12F58( var_1 );
}

_id_12D29()
{
    self notify( "stop_monitorSharpFocus" );
    scripts\mp\weapons::_id_12F58( 1.0 );
}

_id_FB0D()
{
    self._id_C826 = 0.2;
    self.overrideviewkickscalesniper = 0.425;
    scripts\mp\weapons::_id_12F58();
}

_id_12D64()
{
    self._id_C826 = undefined;
    self.overrideviewkickscalesniper = undefined;
    scripts\mp\weapons::_id_12F58();
}

_id_F633()
{
    self._id_13C70 = 0.08;
    scripts\mp\weapons::_id_12ED5();
}

_id_12C6D()
{
    self._id_13C70 = undefined;
    scripts\mp\weapons::_id_12ED5();
}

_id_F632()
{
    self._id_13C6E = 1;
    var_0 = scripts\mp\class::_id_3224( self._id_AE7F, self._id_AE86, self._id_AE88, self._id_AE90, self._id_AE91 );
    var_1 = scripts\mp\class::_id_3224( self._id_AE94, self._id_AE9A, self._id_AE9C, self._id_AEA4, self._id_AEA5 );

    if ( scripts\mp\utility\game::_id_8225( var_0 ) == "weapon_projectile" )
        self setweaponammoclip( var_0, weaponclipsize( var_0 ) );

    if ( scripts\mp\utility\game::_id_8225( var_1 ) == "weapon_projectile" )
        self setweaponammoclip( var_1, weaponclipsize( var_1 ) );
}

_id_12C6C()
{
    self._id_13C6E = undefined;
}

_id_F6D7()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "endDoubleLoad" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "reload" );
        var_0 = self _meth_8172( "primary" );

        foreach ( var_2 in var_0 )
        {
            var_3 = self getweaponammoclip( var_2 );
            var_4 = weaponclipsize( var_2 );
            var_5 = var_4 - var_3;
            var_6 = self getweaponammostock( var_2 );

            if ( var_3 != var_4 && var_6 > 0 )
            {
                if ( var_3 + var_6 >= var_4 )
                {
                    self setweaponammoclip( var_2, var_4 );
                    self setweaponammostock( var_2, var_6 - var_5 );
                    continue;
                }

                self setweaponammoclip( var_2, var_3 + var_6 );

                if ( var_6 - var_5 > 0 )
                {
                    self setweaponammostock( var_2, var_6 - var_5 );
                    continue;
                }

                self setweaponammostock( var_2, 0 );
            }
        }
    }
}

_id_12CA8()
{
    self notify( "endDoubleLoad" );
}

_id_F78F( var_0 )
{
    return;

    if ( !isdefined( var_0 ) )
        var_0 = 10;
    else
        var_0 = int( var_0 ) * 2;

    scripts\mp\utility\game::_id_F817( var_0 );
    self._id_DDDB = var_0;
}

_id_12CEC()
{
    return;
    scripts\mp\utility\game::_id_F817( 0 );
    self._id_DDDB = 0;
}

setfastcrouch()
{
    thread watchfastcrouch();
}

watchfastcrouch()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "fastcrouch_unset" );

    for (;;)
    {
        var_0 = self getstance() == "crouch" && !self _meth_81BE();

        if ( !isdefined( self.fastcrouchspeedmod ) )
        {
            if ( var_0 )
            {
                self.fastcrouchspeedmod = 0.3;
                scripts\mp\weapons::_id_12ED5();
            }
        }
        else if ( !var_0 )
        {
            self.fastcrouchspeedmod = undefined;
            scripts\mp\weapons::_id_12ED5();
        }

        scripts\engine\utility::waitframe();
    }
}

unsetfastcrouch()
{
    self notify( "fastcrouch_unset" );

    if ( isdefined( self.fastcrouchspeedmod ) )
    {
        self.fastcrouchspeedmod = undefined;
        scripts\mp\weapons::_id_12ED5();
    }
}

_id_F821()
{
    self endon( "unsetRShieldRadar" );
    wait 0.75;
    self _meth_81F3();
    thread _id_F822();
}

_id_F822()
{
    self endon( "unsetRShieldRadar" );
    scripts\engine\utility::waittill_any( "disconnect", "death" );

    if ( isdefined( self ) )
        _id_12D1D();
}

_id_12D1D()
{
    self _meth_8079();
    self notify( "unsetRShieldRadar" );
}

_id_F823()
{
    self _meth_81F4();
    thread _id_F824();
}

_id_F824()
{
    self endon( "unsetRShieldScrambler" );
    scripts\engine\utility::waittill_any( "disconnect", "death" );

    if ( isdefined( self ) )
        _id_12D1E();
}

_id_12D1E()
{
    self _meth_807C();
    self notify( "unsetRShieldScrambler" );
}

_id_F869( var_0 )
{
    scripts\mp\utility\game::giveperk( "specialty_hard_shell" );

    if ( !isdefined( var_0 ) )
        var_0 = 10;

    var_0 = int( var_0 );

    if ( var_0 == 10 )
        self.stunscalar = 0;
    else
        self.stunscalar = var_0 / 10;
}

_id_12D3C()
{
    self.stunscalar = 1;
}

_id_20E0( var_0, var_1, var_2 )
{
    if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_stun_resistance" ) )
    {
        if ( isdefined( var_1.stunscalar ) && isdefined( var_2 ) )
            var_2 *= var_1.stunscalar;

        var_3 = scripts\engine\utility::ter_op( isdefined( var_0.owner ), var_0.owner, var_0 );
        var_4 = scripts\engine\utility::ter_op( isdefined( var_1.owner ), var_1.owner, var_1 );

        if ( isplayer( var_3 ) && var_3 != var_1 )
            var_0 scripts\mp\damagefeedback::updatedamagefeedback( "hittacresist", undefined, undefined, undefined, 1 );

        if ( scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( var_3, var_4 ) ) )
            var_1 scripts\mp\missions::_id_E280( var_3 );
    }

    return var_2;
}

_id_FB17()
{
    if ( isagent( self ) )
        return;

    self endon( "unsetWeaponLaser" );
    wait 0.5;
    thread _id_FB18();
}

_id_12D68()
{
    self notify( "unsetWeaponLaser" );

    if ( isdefined( self._id_CA6A ) && self._id_CA6A )
        scripts\mp\utility\game::_id_561C();

    self._id_CA6A = undefined;
    self._id_CA69 = undefined;
}

_id_FB1C( var_0 )
{
    for (;;)
    {
        var_0 = getweaponbasename( var_0 );

        if ( isdefined( var_0 ) && ( var_0 == "iw6_kac_mp" || var_0 == "iw6_arx160_mp" ) )
            break;

        self waittill( "weapon_change", var_0 );
    }
}

_id_FB18()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unsetWeaponLaser" );
    self._id_CA6A = 0;
    var_0 = self getcurrentweapon();

    for (;;)
    {
        _id_FB1C( var_0 );

        if ( self._id_CA6A == 0 )
        {
            self._id_CA6A = 1;
            scripts\mp\utility\game::_id_6282();
        }

        childthread _id_FB19();
        childthread _id_FB1A( 1.0 );
        self._id_CA69 = undefined;
        self waittill( "weapon_change", var_0 );

        if ( self._id_CA6A == 1 )
        {
            self._id_CA6A = 0;
            scripts\mp\utility\game::_id_561C();
        }
    }
}

_id_FB1A( var_0 )
{
    self endon( "weapon_change" );

    for (;;)
    {
        self waittill( "weapon_switch_started" );
        childthread _id_FB1B( var_0 );
    }
}

_id_FB1B( var_0 )
{
    self notify( "setWeaponLaser_onWeaponSwitchStart" );
    self endon( "setWeaponLaser_onWeaponSwitchStart" );

    if ( self._id_CA6A == 1 )
    {
        self._id_CA69 = 1;
        self._id_CA6A = 0;
        scripts\mp\utility\game::_id_561C();
    }

    wait( var_0 );
    self._id_CA69 = undefined;

    if ( self._id_CA6A == 0 && self playerads() <= 0.6 )
    {
        self._id_CA6A = 1;
        scripts\mp\utility\game::_id_6282();
    }
}

_id_FB19()
{
    self endon( "weapon_change" );

    for (;;)
    {
        if ( !isdefined( self._id_CA69 ) || self._id_CA69 == 0 )
        {
            if ( self playerads() > 0.6 )
            {
                if ( self._id_CA6A == 1 )
                {
                    self._id_CA6A = 0;
                    scripts\mp\utility\game::_id_561C();
                }
            }
            else if ( self._id_CA6A == 0 )
            {
                self._id_CA6A = 1;
                scripts\mp\utility\game::_id_6282();
            }
        }

        scripts\engine\utility::waitframe();
    }
}

_id_F860()
{
    self _meth_829B( 0.5 );
}

_id_12D37()
{
    self notify( "end_SteadyAimPro" );
    self _meth_829B( 1.0 );
}

_id_2B69( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "end_perkUseTracker" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "empty_offhand" );

        if ( !scripts\engine\utility::_id_9EC1() )
            continue;

        self [[ var_1 ]]( scripts\mp\utility\game::_id_12D6( "specialty_blastshield" ) );
    }
}

_id_CA67()
{
    self endon( "disconnect" );
    self waittill( "death" );
    self._id_1439 = undefined;
}

_id_F6DE()
{
    if ( isdefined( self.endgame ) )
        return;

    self.maxhealth = scripts\mp\tweakables::_id_81E7( "player", "maxhealth" ) * 4;
    self.health = self.maxhealth;
    self.endgame = 1;
    self._id_250E[0] = "";
    self visionsetnakedforplayer( "end_game", 5 );
    thread _id_6325( 7 );
    scripts\mp\gamelogic::_id_F73B( self, 1 );
}

_id_12CAA()
{
    self notify( "stopEndGame" );
    self.endgame = undefined;
    scripts\mp\utility\game::restorebasevisionset( 1 );

    if ( !isdefined( self._id_632B ) )
        return;

    self._id_632B scripts\mp\hud_util::_id_52DC();
    self._id_6328 scripts\mp\hud_util::_id_52DC();
}

_id_6325( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    level endon( "game_ended" );
    self endon( "stopEndGame" );
    wait( var_0 + 1 );
    scripts\mp\utility\game::_id_1417();
}

_id_F827()
{
    self._id_C2AD = 1.2;
}

_id_12D21()
{
    self._id_C2AD = 1;
}

_id_F698()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unsetCombatSpeed" );
    self._id_93CF = 0;
    _id_12C96();

    for (;;)
    {
        self waittill( "damage", var_0, var_1 );

        if ( !isdefined( var_1.team ) )
            continue;

        if ( level.teambased && var_1.team == self.team )
            continue;

        if ( self._id_93CF )
            continue;

        _id_F699();
        self._id_93CF = 1;
        thread _id_636C();
    }
}

_id_636C()
{
    self notify( "endOfSpeedWatcher" );
    self endon( "endOfSpeedWatcher" );
    self endon( "death" );
    self endon( "disconnect" );
    self waittill( "healed" );
    _id_12C96();
    self._id_93CF = 0;
}

_id_F699()
{
    if ( isdefined( self.isjuggernaut ) && self.isjuggernaut )
        return;

    if ( self._id_13CCF <= 0.8 )
        self._id_440B = 1.4;
    else if ( self._id_13CCF <= 0.9 )
        self._id_440B = 1.3;
    else
        self._id_440B = 1.2;

    scripts\mp\weapons::_id_12ED5();
}

_id_12C96()
{
    self._id_440B = 1;
    scripts\mp\weapons::_id_12ED5();
}

_id_12C95()
{
    _id_12C96();
    self notify( "unsetCombatSpeed" );
}

_id_F788()
{
    if ( !isdefined( self.cranked ) )
    {
        self._id_BCF6 = scripts\mp\utility\game::_id_ACD8();
        scripts\mp\weapons::_id_12ED5();
    }
}

_id_12CE6()
{
    self._id_BCF6 = 1;
    scripts\mp\weapons::_id_12ED5();
}

_id_F663()
{
    self._id_A6AD = 1.5;
}

_id_12C7F()
{
    self._id_A6AD = 1;
}

_id_F862()
{
    scripts\mp\utility\game::giveperk( "specialty_bulletaccuracy" );
    scripts\mp\utility\game::giveperk( "specialty_holdbreath" );
}

_id_12D39()
{
    scripts\mp\utility\game::_id_E150( "specialty_bulletaccuracy" );
    scripts\mp\utility\game::_id_E150( "specialty_holdbreath" );
}

_id_F6C1()
{

}

_id_12CA1()
{

}

_id_F78A()
{
    if ( !scripts\mp\killstreaks\emp_common::_id_9D29() )
        self _meth_81F4();
}

_id_12CE9()
{
    self _meth_807C();
}

_id_F885()
{
    self _meth_83C0();
}

_id_12D49()
{
    self thermalvisionoff();
}

_id_F7C6()
{
    thread _id_C50C();
}

_id_12CF9()
{
    self notify( "stop_oneManArmyTracker" );
}

_id_C50C()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "stop_oneManArmyTracker" );

    for (;;)
    {
        self waittill( "weapon_change", var_0 );

        if ( var_0 != "onemanarmy_mp" )
            continue;

        thread _id_F1CC();
    }
}

_id_9EC5( var_0 )
{
    if ( var_0 == game["menu_onemanarmy"] )
        return 1;

    if ( isdefined( game["menu_onemanarmy_defaults_splitscreen"] ) && var_0 == game["menu_onemanarmy_defaults_splitscreen"] )
        return 1;

    if ( isdefined( game["menu_onemanarmy_custom_splitscreen"] ) && var_0 == game["menu_onemanarmy_custom_splitscreen"] )
        return 1;

    return 0;
}

_id_F1CC()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\engine\utility::_id_1C76( 0 );
    scripts\engine\utility::_id_1C58( 0 );
    scripts\engine\utility::_id_1C6E( 0 );
    thread _id_4293();
    self waittill( "menuresponse", var_0, var_1 );
    scripts\engine\utility::_id_1C76( 1 );
    scripts\engine\utility::_id_1C58( 1 );
    scripts\engine\utility::_id_1C6E( 1 );

    if ( var_1 == "back" || !_id_9EC5( var_0 ) || scripts\mp\utility\game::isusingremote() )
    {
        if ( self getcurrentweapon() == "onemanarmy_mp" )
        {
            scripts\engine\utility::_id_1C76( 0 );
            scripts\engine\utility::_id_1C58( 0 );
            scripts\engine\utility::_id_1C6E( 0 );
            scripts\mp\utility\game::_id_141A( scripts\engine\utility::_id_7F62() );
            self waittill( "weapon_change" );
            scripts\engine\utility::_id_1C76( 1 );
            scripts\engine\utility::_id_1C58( 1 );
            scripts\engine\utility::_id_1C6E( 1 );
        }

        return;
    }

    thread _id_8384( var_1 );
}

_id_4293()
{
    self endon( "menuresponse" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "death" );
    scripts\engine\utility::_id_1C76( 1 );
    scripts\engine\utility::_id_1C58( 1 );
    scripts\engine\utility::_id_1C6E( 1 );
}

_id_8384( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( scripts\mp\utility\game::_id_12D6( "specialty_omaquickchange" ) )
    {
        var_1 = 3.0;
        scripts\mp\utility\game::_id_D4FB( self, "foly_onemanarmy_bag3_plr", "foly_onemanarmy_bag3_npc" );
    }
    else
    {
        var_1 = 6.0;
        scripts\mp\utility\game::_id_D4FB( self, "foly_onemanarmy_bag6_plr", "foly_onemanarmy_bag6_npc" );
    }

    thread _id_C4A0( var_1 );
    scripts\engine\utility::_id_1C71( 0 );
    scripts\engine\utility::_id_1C58( 0 );
    scripts\engine\utility::_id_1C6E( 0 );
    wait( var_1 );
    scripts\engine\utility::_id_1C71( 1 );
    scripts\engine\utility::_id_1C58( 1 );
    scripts\engine\utility::_id_1C6E( 1 );
    self._id_C47E = 1;
    scripts\mp\class::giveloadout( self.pers["team"], var_0 );

    if ( isdefined( self._id_3AF4 ) )
        self attach( self._id_3AF4, "J_spine4", 1 );

    self notify( "changed_kit" );
    level notify( "changed_kit" );
}

_id_C4A0( var_0 )
{
    self endon( "disconnect" );
    var_1 = scripts\mp\hud_util::_id_4A02();
    var_2 = scripts\mp\hud_util::_id_4A03();
    var_2 _meth_834D( &"MPUI_CHANGING_KIT" );
    var_1 scripts\mp\hud_util::_id_12E63( 0, 1 / var_0 );

    for ( var_3 = 0; var_3 < var_0 && isalive( self ) && !level._id_7669; var_3 += 0.05 )
        wait 0.05;

    var_1 scripts\mp\hud_util::_id_52DC();
    var_2 scripts\mp\hud_util::_id_52DC();
}

_id_F634()
{
    self._id_11B2C = "specialty_afterburner";
    self _meth_8434( 0, scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_9D46(), 600, 650 ) );
    self _meth_8430( 0, scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_9D46(), 900, 900 ) );
}

_id_12C6E()
{
    self._id_11B2C = undefined;
    self _meth_8434( 0, 400 );
    self _meth_8430( 0, 900 );
}

_id_F667()
{
    self _meth_8376( "primaryoffhand", "icon_perks_blast_shield" );
}

_id_12C82()
{
    self _meth_8376( "primaryoffhand", "none" );
}

_id_F719()
{

}

_id_12CC1()
{

}

_id_F870()
{
    var_0 = "secondary";
    var_1 = _id_0AE2::_id_808C( var_0 );

    if ( isdefined( var_1 ) )
        _id_0AE2::_id_E15E( var_1 );

    _id_0AE2::_id_8397( "power_tacInsert", var_0, 0 );
    thread _id_BA34();
}

_id_12D41()
{
    self notify( "end_monitorTIUse" );
}

_id_41D2()
{
    scripts\engine\utility::waittill_any( "disconnect", "joined_team", "joined_spectators" );

    if ( isdefined( self._id_F851 ) )
        _id_51D7( self._id_F851 );
}

_id_12F47()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "end_monitorTIUse" );

    while ( scripts\mp\utility\game::isreallyalive( self ) )
    {
        if ( _id_9FE9() )
            self._id_11947 = self.origin;

        wait 0.05;
    }
}

_id_9FE9()
{
    if ( canspawn( self.origin ) && self isonground() && !scripts\mp\utility\game::_id_11A44() )
        return 1;
    else
        return 0;
}

_id_11899( var_0 )
{
    if ( scripts\mp\utility\game::isreallyalive( var_0.owner ) )
        var_0.owner _id_51D7( self );
}

_id_BA34()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "end_monitorTIUse" );
    thread _id_12F47();
    thread _id_41D2();

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 != "flare_mp" )
            continue;

        if ( isdefined( self._id_F851 ) )
            _id_51D7( self._id_F851 );

        if ( !isdefined( self._id_11947 ) )
            continue;

        if ( scripts\mp\utility\game::_id_11A42() )
            continue;

        var_2 = self._id_11947 + ( 0, 0, 16 );
        var_3 = self._id_11947 - ( 0, 0, 2048 );
        var_4 = playerphysicstrace( var_2, var_3 ) + ( 0, 0, 1 );
        var_5 = [];
        var_5[0] = self;
        var_6 = scripts\engine\trace::_id_48BC( 1, 1, 1, 1, 0, 1, 1 );
        var_7 = scripts\engine\trace::_id_DCED( var_2, var_3, var_5, var_6, 0 );
        var_8 = spawn( "script_model", var_4 );
        var_8.angles = self.angles;
        var_8.team = self.team;
        var_8.owner = self;
        var_8._id_6578 = spawn( "script_origin", var_4 );
        var_8 thread _id_83EC( self );
        var_8._id_D424 = self._id_11947;
        var_8 _meth_831F( self );
        var_8 scripts\mp\sentientpoolmanager::registersentient( "Tactical_Static", self );
        var_8 scripts\mp\weapons::_id_69FF( var_7["entity"] );
        scripts\mp\weapons::_id_C5AC( var_8 );
        self._id_F851 = var_8;
        return;
    }
}

_id_83EC( var_0 )
{
    self setmodel( level._id_108D3["enemy"] );

    if ( level.teambased )
        scripts\mp\entityheadicons::_id_F877( self.team, ( 0, 0, 20 ) );
    else
        scripts\mp\entityheadicons::_id_F7F2( var_0, ( 0, 0, 20 ) );

    thread _id_83E8( var_0 );
    thread _id_83E9( var_0 );
    thread _id_83EE( var_0 );
    thread _id_83EF( var_0 );
    var_1 = spawn( "script_model", self.origin );
    var_1.angles = self.angles;
    var_1 setmodel( level._id_108D3["friendly"] );
    var_1 _meth_82C7( 0 );
    var_1 linkto( self );
    var_1 playloopsound( "tactical_insert_lp" );
    thread _id_83ED( self, var_1, var_0 );
    self waittill( "death" );
    var_1 stoploopsound();
    var_1 delete();
}

_id_83ED( var_0, var_1, var_2 )
{
    var_0 endon( "death" );
    wait 0.05;
    var_3 = [];
    var_3["enemy"] = var_0;
    var_3["friendly"] = var_1;

    for (;;)
    {
        foreach ( var_5 in var_3 )
            var_5 hide();

        foreach ( var_8 in level.players )
        {
            var_9 = "friendly";

            if ( var_2 scripts\mp\utility\game::isenemy( var_8 ) )
                var_9 = "enemy";

            var_5 = var_3[var_9];
            var_5 show();
            scripts\engine\utility::waitframe();
            playfxontagforclients( level._id_108D2[var_9], var_5, "tag_fx", var_8 );
        }

        level waittill( "joined_team" );

        foreach ( var_9, var_5 in var_3 )
            stopfxontag( level._id_108D2[var_9], var_5, "tag_fx" );

        scripts\engine\utility::waitframe();
    }
}

_id_51BF( var_0 )
{
    self waittill( "death" );

    if ( isdefined( var_0 ) )
        var_0 delete();
}

_id_83E8( var_0 )
{
    scripts\mp\damage::monitordamage( 100, "tactical_insertion", ::_id_83EB, ::_id_83EA, 1 );
}

_id_83EB( var_0, var_1, var_2, var_3, var_4 )
{
    return scripts\mp\damage::_id_89C3( var_1, var_2 );
}

_id_83EA( var_0, var_1, var_2, var_3, var_4 )
{
    if ( isdefined( self.owner ) && var_0 != self.owner )
    {
        var_0 notify( "destroyed_insertion", self.owner );
        var_0 notify( "destroyed_equipment" );
        self.owner thread scripts\mp\utility\game::leaderdialogonplayer( "ti_destroyed", undefined, undefined, self.origin );
    }

    var_0 thread _id_51D7( self );
}

_id_83EE( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self setcursorhint( "HINT_NOICON" );
    self sethintstring( &"MP_PATCH_PICKUP_TI" );
    thread _id_12E8B( var_0 );

    for (;;)
    {
        self waittill( "trigger", var_1 );
        var_1 playsound( "tactical_insert_flare_pu" );

        if ( !var_1 scripts\mp\utility\game::isjuggernaut() )
            var_1 thread _id_F870();

        var_1 thread _id_51D7( self );
    }
}

_id_12E8B( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        scripts\mp\utility\game::_id_F838( var_0 );
        level scripts\engine\utility::_id_13762( "joined_team", "player_spawned" );
    }
}

_id_83EF( var_0 )
{
    self endon( "death" );
    var_0 waittill( "disconnect" );
    thread _id_51D7( self );
}

_id_51D7( var_0 )
{
    if ( isdefined( var_0._id_6578 ) )
        var_0._id_6578 delete();

    var_1 = var_0.origin;
    var_2 = var_0.angles;
    var_3 = var_0 _meth_8138();
    var_0 delete();
    var_4 = spawn( "script_model", var_1 );
    var_4.angles = var_2;
    var_4 setmodel( level._id_108D3["friendly"] );
    var_4 _meth_82C7( 0 );

    if ( isdefined( var_3 ) )
        var_4 linkto( var_3 );

    thread _id_5F2B( var_4 );
}

_id_5F2B( var_0 )
{
    wait 1;
    stopfxontag( level._id_108D2["friendly"], var_0, "tag_fx" );
    stopfxontag( level._id_108D2["enemy"], var_0, "tag_fx" );
    var_0 delete();
}

_id_83E9( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 endon( "disconnect" );
    self._id_6578 setcursorhint( "HINT_NOICON" );
    self._id_6578 sethintstring( &"MP_PATCH_DESTROY_TI" );
    self._id_6578 scripts\mp\utility\game::_id_B2A0( var_0 );

    for (;;)
    {
        self._id_6578 waittill( "trigger", var_1 );
        var_1 notify( "destroyed_insertion", var_0 );
        var_1 notify( "destroyed_equipment" );

        if ( isdefined( var_0 ) && var_1 != var_0 )
            var_0 thread scripts\mp\utility\game::leaderdialogonplayer( "ti_destroyed", undefined, undefined, self.origin );

        var_1 thread _id_51D7( self );
    }
}

_id_F7D5( var_0 )
{
    if ( isplayer( self ) )
    {
        var_1 = 0.5;

        if ( !scripts\mp\utility\game::_id_12D6( "specialty_engineer" ) && !scripts\mp\utility\game::_id_12D6( "specialty_noscopeoutline" ) )
        {
            self._id_C881 = 1;
            var_2 = scripts\mp\utility\game::_id_C794( self, "orange", var_0, 0, 0, "perk" );
            thread _id_13AE8( var_2, var_1 );
            thread _id_13AE9( var_2 );
        }
    }
}

_id_13AE8( var_0, var_1 )
{
    self notify( "painted_again" );
    self endon( "painted_again" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\engine\utility::_id_13736( var_1, "death" );
    self._id_C881 = 0;
    scripts\mp\utility\game::_id_C78F( var_0, self );
    self notify( "painted_end" );
}

_id_13AE9( var_0 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\engine\utility::waittill_any( "painted_again", "painted_end" );
    scripts\mp\utility\game::_id_C78F( var_0, self );
}

_id_9ED2()
{
    return isdefined( self._id_C881 ) && self._id_C881;
}

_id_F64B()
{

}

_id_12C71()
{

}

_id_F819()
{
    if ( isdefined( self._id_D8D6 ) )
        self givemaxammo( self._id_D8D6 );

    if ( isdefined( self._id_F0BB ) )
        self givemaxammo( self._id_F0BB );
}

_id_12D17()
{

}

_id_F818()
{
    if ( isdefined( self.primaryweapon ) )
        self givemaxammo( self.primaryweapon );

    if ( isdefined( self._id_F0C4 ) )
        self givemaxammo( self._id_F0C4 );
}

_id_12D16()
{

}

_id_F737()
{
    thread _id_F738();
}

_id_F738()
{
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    self endon( "unsetGunsmith" );
    self waittill( "giveLoadout" );

    if ( self._id_AE86.size == 0 && self._id_AE9A.size == 0 )
        return;

    for (;;)
    {
        self waittill( "weapon_change", var_0 );

        if ( var_0 == "none" )
            continue;

        if ( scripts\mp\utility\game::_id_9E6C( var_0 ) )
            continue;

        if ( !scripts\mp\utility\game::_id_9F7C( var_0, "iw6_" ) && !scripts\mp\utility\game::_id_9F7C( var_0, "iw7_" ) )
            continue;

        var_1 = undefined;

        if ( scripts\mp\utility\game::_id_8225( var_0 ) == "weapon_pistol" )
        {
            if ( self._id_AE9A.size > 0 )
                var_1 = self._id_AE9A;
        }
        else if ( self._id_AE86.size > 0 )
            var_1 = self._id_AE86;

        if ( !isdefined( var_1 ) )
            continue;

        var_2 = 0;
        var_3 = scripts\mp\utility\game::_id_821A( var_0 );

        if ( var_3.size == 0 )
            var_2 = 1;
        else
        {
            foreach ( var_5 in var_1 )
            {
                if ( !scripts\engine\utility::array_contains( var_3, var_5 ) )
                {
                    var_2 = 1;
                    break;
                }
            }
        }

        if ( !var_2 )
            continue;

        var_7 = [];
        var_8 = scripts\mp\utility\game::_id_8217( var_0 );

        foreach ( var_5 in var_1 )
        {
            if ( scripts\engine\utility::array_contains( var_8, var_5 ) )
                var_7[var_7.size] = var_5;
        }

        var_1 = var_7;
        var_11 = [];

        foreach ( var_13 in var_3 )
        {
            var_14 = 1;

            foreach ( var_16 in var_1 )
            {
                if ( !scripts\mp\utility\game::_id_249D( var_16, var_13 ) )
                {
                    var_14 = 0;
                    break;
                }
            }

            if ( var_14 )
                var_11[var_11.size] = var_13;
        }

        var_3 = var_11;
        var_19 = var_1.size + var_3.size;

        if ( var_19 > 4 )
            var_3 = scripts\engine\utility::_id_22A7( var_3 );

        for ( var_20 = 0; var_1.size < 4 && var_20 < var_3.size; var_20++ )
            var_1[var_1.size] = var_3[var_20];

        var_21 = getweaponbasename( var_0 );
        var_22 = var_21;

        foreach ( var_20, var_5 in var_1 )
        {
            var_24 = scripts\mp\utility\game::_id_2496( var_5, var_0 );
            var_1[var_20] = var_24;
        }

        var_1 = scripts\engine\utility::_id_1D3A( var_1 );

        foreach ( var_5 in var_1 )
            var_22 += ( "_" + var_5 );

        if ( var_22 != var_21 )
        {
            var_27 = self getweaponammoclip( var_0 );
            var_28 = self getweaponammostock( var_0 );
            scripts\mp\utility\game::_id_141E( var_0 );
            self giveweapon( var_22 );
            self setweaponammoclip( var_22, var_27 );
            self setweaponammostock( var_22, var_28 );
            scripts\mp\utility\game::_id_141A( var_22 );
        }
    }
}

_id_12CCB()
{
    self notify( "unsetGunsmith" );
}

_id_F71F()
{
    self setclientomnvar( "ui_gambler_show", -1 );
    _id_F720();
}

_id_F720()
{

}

_id_765A()
{
    if ( !isai( self ) )
        return self getrankedplayerdata( level._id_AEA6, "squadMembers", "loadouts", self._id_4006, "abilitiesPicked", scripts\mp\utility\game::_id_7D91( 6, 0 ) );
    else
    {
        var_0 = [];

        if ( isdefined( self.pers["loadoutPerks"] ) )
            var_0 = scripts\engine\utility::_id_227F( var_0, self.pers["loadoutPerks"] );

        foreach ( var_2 in var_0 )
        {
            if ( scripts\mp\utility\game::_id_7DF6( var_2 ) == "specialty_gambler" )
                return 1;
        }
    }

    return 0;
}

_id_8367( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unsetGambler" );
    level endon( "game_ended" );

    if ( !scripts\mp\utility\game::_id_766C( "prematch_done" ) )
        scripts\mp\utility\game::_id_7670( "prematch_done" );
    else if ( scripts\mp\utility\game::_id_766C( "prematch_done" ) && self._id_110F4 != "specialist" )
        self waittill( "giveLoadout" );

    if ( !isdefined( self._id_1519 ) )
        self._id_1519 = 0;

    if ( !self._id_1519 )
    {
        var_1 = _id_80AD( var_0 );
        self._id_7658 = var_1;
    }
    else
        var_1 = self._id_7658;

    scripts\mp\utility\game::giveperk( var_1._id_92B8 );

    if ( var_1._id_92B8 == "specialty_hardline" )
        scripts\mp\killstreaks\killstreaks::_id_F866();

    if ( _id_1012B() )
    {
        self playlocalsound( "mp_suitcase_pickup" );
        self setclientomnvar( "ui_gambler_show", var_1._id_E76D );
        thread _id_7659();
    }

    if ( level.gametype != "infect" )
        self._id_1519 = 1;
}

_id_1012B()
{
    var_0 = 1;

    if ( !level.ingraceperiod && self._id_1519 )
        var_0 = 0;

    if ( !scripts\mp\utility\game::_id_1C7D() && level.gametype != "infect" )
        var_0 = 0;

    return var_0;
}

_id_7659()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unsetGambler" );
    level endon( "game_ended" );
    self waittill( "luinotifyserver", var_0, var_1 );

    if ( var_0 == "gambler_anim_complete" )
        self setclientomnvar( "ui_gambler_show", -1 );
}

_id_80AD( var_0 )
{
    var_1 = [];
    var_1 = thread _id_10437( var_0 );
    var_1 = thread _id_F674( var_1 );
    var_2 = randomint( level._id_151A["sum"] );
    var_3 = undefined;

    foreach ( var_5 in var_1 )
    {
        if ( !var_5._id_13CE8 || var_5._id_92B8 == "specialty_gambler" )
            continue;

        if ( var_5._id_13CE8 > var_2 )
        {
            var_3 = var_5;
            break;
        }
    }

    return var_3;
}

_id_10437( var_0 )
{
    var_1 = [];
    var_2 = [];

    for ( var_3 = 1; var_3 < var_0.size; var_3++ )
    {
        var_4 = var_0[var_3]._id_13CE8;
        var_1 = var_0[var_3];

        for ( var_5 = var_3 - 1; var_5 >= 0 && _id_9D1D( var_0[var_5]._id_13CE8, var_4 ); var_5-- )
        {
            var_2 = var_0[var_5];
            var_0[var_5] = var_1;
            var_0[var_5 + 1] = var_2;
        }
    }

    return var_0;
}

_id_9D1D( var_0, var_1 )
{
    return var_0 < var_1;
}

_id_F674( var_0 )
{
    level._id_151A["sum"] = 0;

    foreach ( var_2 in var_0 )
    {
        if ( !var_2._id_13CE8 )
            continue;

        level._id_151A["sum"] += var_2._id_13CE8;
        var_2._id_13CE8 = level._id_151A["sum"];
    }

    return var_0;
}

_id_12CC5()
{
    self notify( "unsetGambler" );
}

_id_F69B()
{

}

_id_12C97()
{

}

_id_F871()
{
    thread _id_F872();
}

_id_F872()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unsetTagger" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "eyesOn" );
        var_0 = self _meth_8156();

        foreach ( var_2 in var_0 )
        {
            if ( level.teambased && var_2.team == self.team )
                continue;

            if ( isalive( var_2 ) && var_2.sessionstate == "playing" )
            {
                if ( !isdefined( var_2._id_CA55 ) )
                    var_2._id_CA55 = 0;

                if ( !var_2._id_CA55 )
                    var_2._id_CA55 = 1;

                var_2 thread _id_C7B2( self );
            }
        }
    }
}

_id_C7B2( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "eyesOff" );
    level endon( "game_ended" );

    for (;;)
    {
        var_1 = 1;
        var_2 = var_0 _meth_8156();

        foreach ( var_4 in var_2 )
        {
            if ( var_4 == self )
            {
                var_1 = 0;
                break;
            }
        }

        if ( var_1 )
        {
            self._id_CA55 = 0;
            self notify( "eyesOff" );
        }

        wait 0.5;
    }
}

_id_12D42()
{
    self notify( "unsetTagger" );
}

_id_F7E9()
{
    thread _id_F7EA();
}

_id_F7EA()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unsetPitcher" );
    level endon( "game_ended" );
    scripts\mp\utility\game::giveperk( "specialty_throwback" );
    self _meth_82F3( 1.5 );

    for (;;)
    {
        self _meth_82F4( 1.25 );
        self waittill( "grenade_pullback", var_0 );

        if ( var_0 == "airdrop_marker_mp" || var_0 == "killstreak_uplink_mp" || var_0 == "deployable_vest_marker_mp" || var_0 == "deployable_weapon_crate_marker_mp" || var_0 == "airdrop_juggernaut_mp" )
            self _meth_82F4( 1 );

        self waittill( "grenade_fire", var_1, var_2 );
    }
}

_id_12D0C()
{
    self _meth_82F3( 1 );
    self _meth_82F4( 1 );
    scripts\mp\utility\game::_id_E150( "specialty_throwback" );
    self notify( "unsetPitcher" );
}

_id_F670()
{
    self._id_11B2C = "specialty_boom";
}

_id_F671( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unsetBoom" );
    level endon( "game_ended" );
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    scripts\engine\utility::waitframe();
    triggerportableradarping( self.origin, var_0, 800, 1500 );
    var_0 _id_2CA9( self.origin, self );
}

_id_2CA9( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( var_1 == var_3 )
            continue;

        if ( scripts\mp\utility\game::isenemy( var_3 ) && isalive( var_3 ) && !var_3 scripts\mp\utility\game::_id_12D6( "specialty_gpsjammer" ) && distancesquared( var_0, var_3.origin ) <= 490000 )
            scripts\mp\missions::_id_D991( "ch_trait_ping" );
    }
}

_id_2CA8( var_0, var_1 )
{
    self endon( "disconnect" );
    var_0 endon( "removearchetype" );
    var_2 = scripts\engine\utility::_id_13736( 7.0, "death" );

    if ( var_2 == "timeout" && isdefined( self._id_B370[var_1] ) )
        self._id_B370[var_1] = undefined;
    else
    {
        self waittill( "spawned_player" );
        self._id_B370 = undefined;
    }
}

_id_12C87()
{
    self._id_11B2C = undefined;
    self notify( "unsetBoom" );
}

_id_4C8E( var_0 )
{
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );
    self endon( "unset_custom_juiced" );
    level endon( "game_ended" );
    self._id_9E62 = 1;
    self._id_BCF6 = 1.1;
    scripts\mp\weapons::_id_12ED5();
    scripts\mp\utility\game::giveperk( "specialty_fastreload" );
    scripts\mp\utility\game::giveperk( "specialty_quickdraw" );
    scripts\mp\utility\game::giveperk( "specialty_stalker" );
    scripts\mp\utility\game::giveperk( "specialty_fastoffhand" );
    scripts\mp\utility\game::giveperk( "specialty_fastsprintrecovery" );
    scripts\mp\utility\game::giveperk( "specialty_quickswap" );
    thread _id_12C9C();
    thread _id_12C9E();
    thread _id_12C9D();
    var_1 = var_0 * 1000 + gettime();

    if ( !isai( self ) )
        self setclientomnvar( "ui_juiced_end_milliseconds", var_1 );

    wait( var_0 );
    _id_12C9B();
}

_id_12C9B( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        if ( scripts\mp\utility\game::isjuggernaut() )
        {
            if ( isdefined( self._id_A4AA ) )
                self._id_BCF6 = self._id_A4AA;
            else
                self._id_BCF6 = 0.7;
        }
        else
        {
            self._id_BCF6 = 1;

            if ( scripts\mp\utility\game::_id_12D6( "specialty_lightweight" ) )
                self._id_BCF6 = scripts\mp\utility\game::_id_ACD8();
        }

        scripts\mp\weapons::_id_12ED5();
    }

    scripts\mp\utility\game::_id_E150( "specialty_fastreload" );
    scripts\mp\utility\game::_id_E150( "specialty_quickdraw" );
    scripts\mp\utility\game::_id_E150( "specialty_stalker" );
    scripts\mp\utility\game::_id_E150( "specialty_fastoffhand" );
    scripts\mp\utility\game::_id_E150( "specialty_fastsprintrecovery" );
    scripts\mp\utility\game::_id_E150( "specialty_quickswap" );
    self._id_9E62 = undefined;

    if ( !isai( self ) )
        self setclientomnvar( "ui_juiced_end_milliseconds", 0 );

    self notify( "unset_custom_juiced" );
}

_id_12C9E()
{
    self endon( "disconnect" );
    self endon( "unset_custom_juiced" );

    for (;;)
    {
        wait 0.05;

        if ( scripts\mp\utility\game::isusingremote() )
        {
            thread _id_12C9B();
            break;
        }
    }
}

_id_12C9C()
{
    self endon( "disconnect" );
    self endon( "unset_custom_juiced" );
    scripts\engine\utility::waittill_any( "death", "faux_spawn" );
    thread _id_12C9B( 1 );
}

_id_12C9D()
{
    self endon( "disconnect" );
    self endon( "unset_custom_juiced" );
    level scripts\engine\utility::waittill_any( "round_end_finished", "game_ended" );
    thread _id_12C9B();
}

_id_F897()
{

}

_id_F898()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unsetTriggerHappy" );
    level endon( "game_ended" );
    var_0 = self._id_A978;
    var_1 = self getweaponammostock( var_0 );
    var_2 = self getweaponammoclip( var_0 );
    self _meth_817C( var_0 );
    var_3 = self getweaponammoclip( var_0 );
    var_4 = var_3 - var_2;
    var_5 = var_1 - var_4;

    if ( var_4 > var_1 )
    {
        self setweaponammoclip( var_0, var_2 + var_1 );
        var_5 = 0;
    }

    self setweaponammostock( var_0, var_5 );
    self playlocalsound( "ammo_crate_use" );
    self setclientomnvar( "ui_trigger_happy", 1 );
    wait 0.2;
    self setclientomnvar( "ui_trigger_happy", 0 );
}

_id_12D51()
{
    self setclientomnvar( "ui_trigger_happy", 0 );
    self notify( "unsetTriggerHappy" );
}

_id_F754()
{

}

_id_12CD7()
{

}

_id_F668()
{

}

_id_12C83()
{

}

_id_F810()
{

}

_id_12D13()
{

}

_id_F6F4()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unset_extraammo" );
    level endon( "game_ended" );

    if ( self._id_81D1 )
        self waittill( "giveLoadout" );

    var_0 = scripts\mp\utility\game::_id_81F6();

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2 ) && var_2 != "none" )
            self givemaxammo( var_2 );
    }
}

_id_12CB3()
{
    self notify( "unset_extraammo" );
}

_id_F6F8()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unset_extraequipment" );
    level endon( "game_ended" );

    if ( self._id_81D1 )
        self waittill( "giveLoadout" );

    var_0 = self._id_AE78;

    if ( isdefined( var_0 ) && var_0 != "specialty_null" )
    {
        if ( var_0 != "specialty_tacticalinsertion" && var_0 != "smoke_grenade_mp" && var_0 != "player_trophy_system_mp" && var_0 != "shoulder_cannon_mp" )
            self setweaponammoclip( var_0, 2 );
    }
}

_id_12CB7()
{
    self notify( "unset_extraequipment" );
}

_id_F6F6()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unset_extradeadly" );
    level endon( "game_ended" );
}

_id_12CB5()
{
    self notify( "unset_extradeadly" );
}

_id_10D79( var_0 )
{
    if ( isdefined( var_0 ) && var_0 != self )
    {
        var_1 = self getweaponslistall();
        var_2 = 1;
        var_3 = 0;

        foreach ( var_5 in var_1 )
        {
            if ( var_5 != "throwingknife_mp" )
            {
                var_3 = self getweaponammoclip( var_5 );
                var_2 += var_3;
            }
        }

        var_7 = 1;
        var_8 = spawn( "script_origin", self.origin );
        var_8.owner = var_0;

        if ( !isdefined( var_8.team ) )
            var_8.team = var_0.team;

        var_8._id_42E0 = var_2;
        var_8 thread scripts\mp\weapons::_id_42D8( var_7 );
        var_8 notify( "explode", var_8.origin );
        var_8 delete();
    }
}

_id_F65B()
{
    scripts\mp\archetypes\archcommon::_id_116E( 1 );
    scripts\mp\equipment\battle_slide::_id_28F2();
}

_id_12C7B()
{
    scripts\mp\archetypes\archcommon::_id_116E( 0 );
    scripts\mp\equipment\battle_slide::_id_28F6();
}

_id_F7CF()
{

}

_id_12D00()
{

}

_id_F62C()
{
    scripts\mp\perks\perk_activereload::_id_1664();
}

_id_12C66()
{
    scripts\mp\perks\perk_activereload::_id_1667();
}

_id_F782()
{
    if ( !isdefined( level._effect["life_pack_pickup"] ) )
        level._effect["life_pack_pickup"] = loadfx( "vfx/iw7/_requests/mp/vfx_health_pickup" );

    thread _id_13ABD();
}

_id_13ABD()
{
    self endon( "death" );
    self endon( "disconnect" );
    self notify( "unset_lifepack" );
    self endon( "unset_lifepack" );

    for (;;)
    {
        self waittill( "got_a_kill", var_0, var_1, var_2 );
        var_3 = self.origin;
        var_4 = 20;
        var_5 = 20;
        var_6 = spawn( "script_model", self.origin + ( 0, 0, 10 ) );
        var_6 setmodel( "weapon_life_pack" );
        var_6.owner = self;
        var_6.team = self.team;
        var_6 _meth_8429( self );
        var_7 = spawn( "trigger_radius", self.origin, 0, var_4, var_5 );
        var_7 thread _id_13AC1( var_6 );
        var_7 thread _id_13ABC( var_6 );
        var_6 thread _id_90F0();
        var_6 _meth_8271( 1000, 30, 0.2, 0.2 );
        var_6 thread _id_13ABE( 10, var_7 );
        var_6 thread _id_13AC0();

        foreach ( var_9 in level.players )
            var_6 _id_F784( var_9 );
    }
}

_id_160B( var_0, var_1, var_2 )
{
    self._id_AC67 = 1;

    if ( isdefined( var_1 ) && var_1 > 0 )
        thread _id_13ABB( var_1 );

    if ( isdefined( var_2 ) && var_2 )
        thread _id_13AC2();

    scripts\mp\utility\game::giveperk( "specialty_regenfaster" );
    self setclientomnvar( "ui_life_link", 1 );
    self notify( "enabled_life_pack_boost" );
    self._id_AC70 = var_0;
    scripts\mp\gamescore::_id_11AC9( var_0, self, "medic_lifepack" );
}

_id_13ABB( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    wait( var_0 );

    if ( isdefined( self._id_AC67 ) )
        _id_55F9();
}

_id_55F9()
{
    if ( isdefined( self ) && isdefined( self._id_AC67 ) )
    {
        self._id_AC67 = undefined;
        self setclientomnvar( "ui_life_link", 0 );
        self notify( "disabled_life_pack_boost" );
        scripts\mp\utility\game::_id_E150( "specialty_regenfaster" );
        scripts\mp\gamescore::_id_12D6E( self._id_AC70, self, "medic_lifepack" );
        self._id_AC70 = undefined;
    }
}

_id_F784( var_0 )
{
    if ( level.teambased && var_0.team == self.team && var_0 != self.owner )
    {
        _id_F783( var_0 );
        self _meth_8388( var_0 );
        thread _id_13ABF( var_0 );
    }
    else
        self _meth_8429( var_0 );
}

_id_F783( var_0 )
{
    if ( isdefined( var_0._id_AC67 ) )
    {
        if ( isdefined( var_0._id_AC6F ) && var_0._id_AC6F.size > 0 )
        {
            foreach ( var_2 in var_0._id_AC6F )
            {
                if ( self == var_2._id_C858 )
                {
                    scripts\mp\utility\game::_id_C78F( var_2._id_92B8, var_2._id_C858 );
                    var_0._id_AC6F = scripts\engine\utility::array_remove( var_0._id_AC6F, var_2 );
                    var_2 = undefined;
                }
            }
        }
    }
    else
    {
        if ( !isdefined( var_0._id_AC6F ) )
            var_0._id_AC6F = [];

        var_4 = spawnstruct();
        var_4._id_92B8 = scripts\mp\utility\game::_id_C794( self, "cyan", var_0, 1, 0, "equipment" );
        var_4._id_C858 = self;
        var_0._id_AC6F = scripts\engine\utility::_id_1756( var_0._id_AC6F, var_4 );
    }
}

_id_13ABF( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        var_0 scripts\engine\utility::waittill_any( "enabled_life_pack_boost", "disabled_life_pack_boost" );
        _id_F783( var_0 );
    }
}

_id_90F0()
{
    self endon( "death" );
    self endon( "phase_resource_pickup" );
    var_0 = self.origin;

    for (;;)
    {
        self moveto( var_0 + ( 0, 0, 15 ), 1, 0.2, 0.2 );
        wait 1;
        self moveto( var_0, 1, 0.2, 0.2 );
        wait 1;
    }
}

_id_13AC1( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( !isplayer( var_1 ) )
            continue;

        if ( var_1.team != var_0.team )
            continue;

        if ( isdefined( var_1._id_AC67 ) )
            continue;

        if ( var_1 == var_0.owner )
            continue;

        var_1 _id_160B( var_0.owner, 5, 1 );
        var_1 playlocalsound( "scavenger_pack_pickup" );
        var_2 = spawnfx( scripts\engine\utility::_id_7ECB( "life_pack_pickup" ), self.origin );
        triggerfx( var_2 );
        var_2 thread scripts\mp\utility\game::_id_5106( 2 );

        foreach ( var_4 in level.players )
        {
            if ( var_4.team == var_1.team )
                continue;

            var_2 _meth_8429( var_4 );
        }

        var_0 delete();
    }
}

_id_13ABC( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );

    if ( isdefined( self ) )
        self delete();
}

_id_13ABE( var_0, var_1 )
{
    self endon( "death" );
    wait( var_0 );
    var_1 delete();
    self delete();
}

_id_13AC0()
{
    self endon( "death" );
    self.owner waittill( "disconnect" );

    if ( isdefined( self ) )
        self delete();
}

_id_13AC2()
{
    self endon( "disconnect" );
    self waittill( "death" );
    _id_55F9();
}

_id_12CE4()
{
    _id_55F9();
    self notify( "unset_lifepack" );
}

_id_F891()
{
    if ( !isdefined( level._effect["toughen_up_screen"] ) )
        level._effect["toughen_up_screen"] = loadfx( "vfx/iw7/_requests/mp/vfx_toughen_up_scrn" );

    thread _id_13B87();
}

_id_13B87()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unsetToughenUp" );
    level endon( "game_ended" );
    var_0 = 0;
    var_1 = 15;
    var_2 = 7.5;
    var_3 = 4;
    var_4 = 5;
    var_5 = 2;
    var_6 = [];
    var_6 = scripts\engine\utility::_id_1756( var_6, ( 35, 0, 10 ) );
    var_6 = scripts\engine\utility::_id_1756( var_6, ( 0, 35, 10 ) );
    var_6 = scripts\engine\utility::_id_1756( var_6, ( -35, 0, 10 ) );
    var_6 = scripts\engine\utility::_id_1756( var_6, ( 0, -35, 10 ) );
    self waittill( "spawned_player" );

    for (;;)
    {
        self waittill( "got_a_kill", var_7, var_8, var_9 );

        if ( !isdefined( self._id_11A47 ) )
        {
            self._id_11A47 = 1;
            var_10 = spawnfxforclient( scripts\engine\utility::_id_7ECB( "toughen_up_screen" ), self geteye(), self );
            triggerfx( var_10 );
            thread _id_24AD( "j_forehead", level._id_3257["section"]._id_741D );
            thread _id_24AD( "tag_reflector_arm_le", level._id_3257["section"]._id_741D );
            thread _id_24AD( "tag_reflector_arm_ri", level._id_3257["section"]._id_741D );
            thread _id_24AD( "j_spineupper", level._id_3257["section"]._id_741D );
            thread _id_24AD( "tag_shield_back", level._id_3257["section"]._id_741D );
            thread _id_24AD( "j_hip_le", level._id_3257["section"]._id_741D );
            thread _id_24AD( "j_hip_ri", level._id_3257["section"]._id_741D );

            if ( var_5 == 1 )
            {
                scripts\mp\utility\game::_id_F741( var_1 );
                thread _id_13B89( var_4 );
            }
            else
            {
                scripts\mp\lightarmor::_id_F786( self, 100 );
                thread _id_13B8A();
            }

            var_10 thread _id_13B8D( self );
            continue;
        }

        if ( var_5 == 1 )
        {
            self notify( "toughen_up_reset" );
            thread _id_13B89( var_4 );
        }
    }
}

_id_24AD( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = self gettagorigin( var_0 );
    var_6 = spawn( "script_model", var_5 );
    var_6 setmodel( var_1 );
    var_7 = ( 0, 0, 0 );
    var_8 = ( 0, 0, 0 );

    if ( isdefined( var_2 ) )
        var_7 = var_2;

    if ( isdefined( var_3 ) )
        var_8 = var_3;

    var_6.angles = self.angles;
    var_6 linkto( self, var_0, var_7, var_8 );
    var_6 thread _id_13B8D( self );
    var_6 thread _id_13B88();
    return var_6;
}

_id_F892( var_0, var_1, var_2, var_3 )
{
    var_4 = spawn( "script_model", self.origin + ( 0, 0, 50 ) );
    var_4.team = self.owner.team;

    if ( var_3 == "friendly" )
        var_4 setmodel( level._id_3257["section"]._id_741D );
    else
        var_4 setmodel( level._id_3257["section"]._id_6564 );

    var_4 linkto( self, "tag_origin", var_1, ( 0, 90 * ( var_2 + 1 ), 0 ) );
    var_4 hide();
    var_4 thread _id_13B8D( self.owner );
    var_4 thread _id_13B88();
    var_4 thread _id_F893( var_3, self.owner );
}

_id_13B8A()
{
    self endon( "disconnect" );
    self waittill( "remove_light_armor" );
}

_id_13B8D( var_0 )
{
    self endon( "death" );
    var_0 scripts\engine\utility::waittill_any( "death", "disconnect", "toughen_up_end" );
    var_0._id_11A47 = undefined;

    if ( var_0 scripts\mp\lightarmor::_id_8C07( var_0 ) )
        var_0 _id_12CE5();

    if ( isdefined( self ) )
        self delete();
}

_id_13B88()
{
    self endon( "death" );
    level waittill( "game_ended" );

    if ( isdefined( self ) )
        self delete();
}

_id_13B89( var_0 )
{
    self endon( "death" );
    self endon( "toughen_up_reset" );

    while ( var_0 > 0 )
    {
        var_0 -= 1;
        wait 1;
    }

    self notify( "toughen_up_end" );
}

_id_F893( var_0, var_1 )
{
    foreach ( var_3 in level.players )
    {
        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3 == var_1 )
            continue;

        if ( !scripts\mp\equipment\phase_shift::_id_9DDF( var_3 ) )
        {
            if ( _id_3911( var_3, var_0 ) )
                self _meth_8388( var_3 );
        }

        thread _id_13B8C( var_3, var_0 );
        thread _id_13B8B( var_3, var_0 );
    }
}

_id_13B8C( var_0, var_1 )
{
    var_0 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "death" );

    for (;;)
    {
        var_0 waittill( "spawned_player" );
        self _meth_8429( var_0 );

        if ( _id_3911( var_0, var_1 ) )
            self _meth_8388( var_0 );

        thread _id_13B8B( var_0, var_1 );
    }
}

_id_3911( var_0, var_1 )
{
    var_2 = 0;

    if ( var_1 == "friendly" && var_0.team == self.team || var_1 == "enemy" && var_0.team != self.team )
        var_2 = 1;

    return var_2;
}

_id_13B8B( var_0, var_1 )
{

}

_id_12D4D()
{
    scripts\mp\utility\game::_id_41B4();
    _id_12CE5();
    self notify( "unsetToughenUp" );
}

_id_F82D()
{
    thread _id_0D6F::_id_13B32();
    thread _id_12F0D();
}

_id_12F0D()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unsetScoutPing" );
    var_0 = 50;
    var_1 = 1200;

    for (;;)
    {
        var_2 = var_0;
        var_3 = var_1;

        if ( isdefined( self._id_EC82 ) )
            var_2 = self._id_EC82;

        if ( isdefined( self._id_EC83 ) )
            var_3 = self._id_EC83;

        var_2 = int( var_2 );
        var_3 = int( var_3 );

        if ( var_2 != var_0 )
            triggerportableradarpingteam( self.origin, self.team, var_2, var_3 );

        wait( var_1 / 1200 );
    }
}

_id_12F0E( var_0 )
{
    var_1 = 0;
    var_2 = 150;
    var_3 = 3000;

    if ( isdefined( self._id_EC80 ) )
        var_1 = self._id_EC80;

    if ( isdefined( self._id_EC81 ) )
    {
        if ( var_0 > self._id_EC81 )
        {
            var_4 = var_0 - self._id_EC81;
            var_1 += var_4 / 10;
        }
        else if ( var_0 < self._id_EC81 )
        {
            var_4 = self._id_EC81 - var_0;
            var_1 -= var_4 / 10;
        }
    }

    if ( isdefined( self._id_EC80 ) )
    {
        if ( var_1 > self._id_EC80 || var_1 < self._id_EC80 )
        {
            var_2 += var_2 * var_1 * 1.5;
            var_3 -= var_3 * var_1 / 1.5;
            self._id_EC82 = var_2;
            self._id_EC83 = var_3;
        }
    }

    if ( var_0 == 0 )
    {
        self._id_EC82 = undefined;
        self._id_EC83 = undefined;
    }

    self._id_EC80 = var_1;
    self._id_EC81 = var_0;
}

_id_12D26()
{
    self._id_EC82 = undefined;
    self._id_EC83 = undefined;
    self._id_EC80 = undefined;
    self._id_EC81 = undefined;
    self notify( "unsetScoutPing" );
    thread _id_0D6F::_id_3886();
}

_id_F6A1()
{
    thread _id_139D8();
}

_id_12C9A()
{

}

_id_3E41()
{
    self endon( "disconnect" );
    self waittill( "spawned_player" );
    thread _id_139D8();
}

_id_139D8()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );

    for (;;)
    {
        self waittill( "got_a_kill", var_0, var_1, var_2 );
        var_3 = var_0 _meth_8113();
        var_4 = "primary";
        var_5 = "none";
        var_6 = getarraykeys( var_0._id_D782 );

        foreach ( var_8 in var_6 )
        {
            if ( var_0._id_D782[var_8]._id_10307 == var_4 )
                var_5 = var_8;
        }

        if ( var_5 == "none" )
            continue;

        var_10 = 20;
        var_11 = 20;
        var_12 = spawn( "script_model", var_3.origin + ( 0, 0, 10 ) );
        var_12.owner = self;
        var_12.team = self.team;
        var_13 = spawn( "trigger_radius", var_3.origin, 0, var_10, var_11 );
        var_13 thread _id_139D9( var_12 );
        var_12 thread _id_139DA( 30, var_13 );
        var_12 thread _id_139DB();
        var_12 _id_B29E( var_5 );
    }
}

_id_12F4D()
{
    self endon( "death" );

    for (;;)
    {
        if ( isdefined( self ) )
        {
            self.origin = self.origin;

            if ( isdefined( self._id_2C68 ) )
                self._id_2C68.origin = self.origin;
        }
        else
            return;

        wait 0.05;
    }
}

_id_4650( var_0, var_1, var_2 )
{
    self endon( "spawned_player" );
    self endon( "disconnect" );
    self endon( "death" );
    self.trigger setcursorhint( "HINT_NOICON" );

    switch ( var_2 )
    {
        case "power_c4":
            self.trigger sethintstring( &"MP_PICKUP_C4" );
            break;
        case "power_biospike":
            self.trigger sethintstring( &"MP_PICKUP_BIOSPIKE" );
            break;
        case "power_bouncingBetty":
            self.trigger sethintstring( &"MP_PICKUP_BOUNCING_BETTY" );
            break;
        case "power_semtex":
            self.trigger sethintstring( &"MP_PICKUP_SEMTEX" );
            break;
        case "power_smokeGrenade":
            self.trigger sethintstring( &"MP_PICKUP_SMOKE_GRENADE" );
            break;
        case "power_domeshield":
            self.trigger sethintstring( &"MP_PICKUP_DOME_SHIELD" );
            break;
        case "power_shardBall":
            self.trigger sethintstring( &"MP_PICKUP_SHARD_BALL" );
            break;
        case "power_splashGrenade":
            self.trigger sethintstring( &"MP_PICKUP_SPLASH_GRENADE" );
            break;
        case "power_clusterGrenade":
            self.trigger sethintstring( &"MP_PICKUP_CLUSTER_GRENADE" );
            break;
        case "power_smokeWall":
            self.trigger sethintstring( &"MP_PICKUP_SMOKE_WALL" );
            break;
        case "power_empGrenade":
            self.trigger sethintstring( &"MP_PICKUP_EMP_GRENADE" );
            break;
        case "power_blackholeGrenade":
            self.trigger sethintstring( &"MP_PICKUP_BLACKHOLE_GRENADE" );
            break;
        case "power_blinkKnife":
            self.trigger sethintstring( &"MP_PICKUP_TELEPORT_KNIFE" );
            break;
        case "power_throwingReap":
            self.trigger sethintstring( &"MP_PICKUP_THROWING_REAP" );
            break;
        case "power_thermobaric":
            self.trigger sethintstring( &"MP_PICKUP_THERMOBARIC" );
            break;
        case "power_playerTrophySystem":
            self.trigger sethintstring( &"MP_PICKUP_PLAYER_TROPHY" );
            break;
        case "power_discMarker":
            self.trigger sethintstring( &"MP_PICKUP_DISC_MARKER" );
            break;
        case "power_caseBomb":
            self.trigger sethintstring( &"MP_PICKUP_CASE_BOMB" );
            break;
        case "power_transponder":
            self.trigger sethintstring( &"MP_PICKUP_TRANSPONDER" );
            break;
        case "power_gasGrenade":
            self.trigger sethintstring( &"MP_PICKUP_GAS_GRENADE" );
            break;
        case "power_blackoutGrenade":
            self.trigger sethintstring( &"MP_PICKUP_BLACKOUT_GRENADE" );
            break;
        case "power_copycatGrenade":
            self.trigger sethintstring( &"MP_PICKUP_COPYCAT_GRENADE" );
            break;
        case "power_arcGrenade":
            self.trigger sethintstring( &"MP_PICKUP_ARC_MINE" );
            break;
    }

    self.trigger makeusable();

    foreach ( var_4 in level.players )
    {
        if ( var_4 == var_0 )
        {
            self.trigger enableplayeruse( var_4 );
            continue;
        }

        self.trigger disableplayeruse( var_4 );
    }

    self.trigger thread scripts\mp\utility\game::_id_C18A( var_0 );

    if ( isdefined( var_1 ) && var_1 )
        thread _id_12F4D();

    for (;;)
    {
        self.trigger waittill( "trigger", var_0 );
        var_0 playlocalsound( "scavenger_pack_pickup" );
        var_6 = var_2;
        var_7 = "primary";
        var_0 notify( "start_copycat" );
        var_0 notify( "corpse_steal" );
        var_8 = "none";
        var_9 = getarraykeys( var_0._id_D782 );

        foreach ( var_11 in var_9 )
        {
            if ( var_0._id_D782[var_11]._id_10307 == var_7 )
                var_8 = var_11;
        }

        var_0 _id_0AE2::_id_E15E( var_8 );
        var_0 _id_0AE2::_id_8397( var_6, var_7, 1 );
        var_0 thread scripts\mp\weapons::_id_139D7( var_6, var_7 );
        self.trigger delete();
        self delete();
        self notify( "death" );
    }
}

_id_B29E( var_0 )
{
    if ( scripts\mp\utility\game::isreallyalive( self.owner ) )
    {
        self _meth_831F( self.owner );
        self.trigger = spawn( "script_origin", self.origin, 0, 1, 1 );
        self.trigger.owner = self;
        thread _id_4650( self.owner, 1, var_0 );
    }
}

_id_139D9( var_0 )
{
    self endon( "death" );
    var_0 waittill( "death" );

    if ( isdefined( self ) )
        self delete();
}

_id_139DA( var_0, var_1 )
{
    self endon( "death" );
    wait( var_0 );
    self.trigger delete();
    var_1 delete();
    self delete();
}

_id_139DB()
{
    self endon( "death" );
    self.owner waittill( "disconnect" );

    if ( isdefined( self ) )
        self delete();
}

_id_F7E6()
{
    thread _id_13AEE();
    thread _id_13AED();
}

_id_13AEE()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "phase_shift_start" );
        self._id_CAB0 = 0.2;
        scripts\mp\weapons::_id_12ED5();
    }
}

_id_13AED()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "phase_shift_completed" );
        self._id_CAB0 = undefined;
        scripts\mp\weapons::_id_12ED5();
    }
}

_id_12D0A()
{
    self._id_CAB0 = undefined;
}

_id_F6CC()
{
    self._id_11B2C = "specialty_dodge";
    self _meth_8412( 1 );

    if ( scripts\mp\utility\game::_id_9D46() )
        self _meth_8454( 6 );
    else
        self _meth_8454( 3 );

    scripts\mp\perks\perks_dodgedefense::_id_139F9();
}

_id_12CA4()
{
    self._id_11B2C = undefined;
    self _meth_8412( 0 );
}

_id_F6F7()
{
    self _meth_842E( 1, 100 );
    self _meth_842C( 1, 100 );
}

_id_12CB6()
{
    self _meth_842E( 1, 50 );
    self _meth_842C( 1, 50 );
}

_id_F846()
{
    self._id_11B2C = "specialty_sixth_sense";
    _id_12F1B( 0, 0 );
    thread _id_10225();
}

_id_12D2E()
{
    self._id_11B2C = undefined;
    self._id_10224 = undefined;
    self notify( "removeSixthSense" );
    _id_12F1B( 0, 0 );
}

_id_F6E9()
{

}

_id_12CAD()
{

}

_id_10225()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeSixthSense" );
    self endon( "round_switch" );
    thread watchdeathsixthsense();

    for (;;)
    {
        var_0 = 0;
        var_1 = level.players;
        var_2 = 0;
        var_3 = scripts\mp\utility\game::_id_12D6( "specialty_enhanced_sixth_sense" );

        if ( !scripts\mp\killstreaks\emp_common::_id_9D29() )
        {
            foreach ( var_5 in var_1 )
            {
                if ( !isdefined( var_5 ) || !scripts\mp\utility\game::isreallyalive( var_5 ) )
                    continue;

                if ( var_5.team == self.team )
                    continue;

                if ( var_5 scripts\mp\utility\game::_id_12D6( "specialty_coldblooded" ) )
                    continue;

                if ( !scripts\mp\equipment\phase_shift::_id_213D( self, var_5 ) )
                    continue;

                var_6 = self.origin - var_5.origin;
                var_7 = anglestoforward( var_5 getplayerangles() );
                var_8 = vectordot( var_6, var_7 );

                if ( var_8 <= 0 )
                    continue;

                var_9 = vectornormalize( var_6 );
                var_10 = vectornormalize( var_7 );
                var_8 = vectordot( var_9, var_10 );

                if ( var_8 < 0.965926 )
                    continue;

                var_0++;
                var_11 = var_5 geteye();
                var_12 = self geteye();

                if ( bullettracepassed( var_11, var_12, 0, self ) )
                {
                    thread watchperceptionchallengedeath();
                    thread watchperceptionchallengeprogress();
                    var_2 |= _id_8125( var_5 );
                    thread markassixthsensesource( var_5 );
                    continue;
                }

                if ( var_0 >= 3 )
                {
                    scripts\engine\utility::waitframe();
                    var_0 = 0;
                }
            }
        }

        if ( var_2 > 4 )
            var_2 = 255;
        else
            var_2 = 0;

        _id_12F1B( var_2, var_3 );
        scripts\engine\utility::waitframe();
    }
}

watchperceptionchallengedeath()
{
    self endon( "disconnect" );

    if ( scripts\mp\utility\game::istrue( self.startperceptionchallengewatch ) )
        return;

    scripts\engine\utility::waittill_any( "removesixthsense", "death", "perceptionChallengeCheckDone" );
    self.startperceptionchallengewatch = 0;
}

watchperceptionchallengeprogress()
{
    self endon( "disconnect" );
    self endon( "removesixthsense" );
    self endon( "death" );

    if ( scripts\mp\utility\game::istrue( self.startperceptionchallengewatch ) )
        return;

    self.startperceptionchallengewatch = 1;
    wait 10.0;
    scripts\mp\missions::_id_D991( "ch_trait_perception" );
    self notify( "perceptionChallengeCheckDone" );
}

watchdeathsixthsense()
{
    self endon( "disconnect" );
    self endon( "removesixthsense" );
    self waittill( "death" );
    self setclientomnvar( "ui_edge_glow", 0 );
}

_id_12F1B( var_0, var_1 )
{
    var_2 = 0;

    if ( isdefined( self._id_10224 ) )
        var_2 = self._id_10224;

    if ( isdefined( var_1 ) && var_1 )
    {
        if ( var_2 != var_0 )
            self._id_10224 = var_0;
    }

    self setclientomnvar( "ui_edge_glow", var_0 );
}

_id_8125( var_0 )
{
    var_1 = anglestoforward( self getplayerangles() );
    var_2 = ( var_1[0], var_1[1], var_1[2] );
    var_2 = vectornormalize( var_2 );
    var_3 = var_0.origin - self.origin;
    var_4 = ( var_3[0], var_3[1], var_3[2] );
    var_4 = vectornormalize( var_4 );
    var_5 = vectordot( var_2, var_4 );

    if ( var_5 >= 0.92388 )
        return 2;
    else if ( var_5 >= 0.382683 )
        return scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_9E7A( self.origin, var_2, var_0.origin ), 4, 1 );
    else if ( var_5 >= -0.382683 )
        return scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_9E7A( self.origin, var_2, var_0.origin ), 128, 64 );
    else if ( var_5 >= -0.92388 )
        return scripts\engine\utility::ter_op( scripts\mp\utility\game::_id_9E7A( self.origin, var_2, var_0.origin ), 32, 8 );
    else
        return 16;
}

markassixthsensesource( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_1 = var_0 getentitynumber();

    if ( !isdefined( self.sixthsensesource ) )
        self.sixthsensesource = [];
    else if ( isdefined( self.sixthsensesource[var_1] ) )
    {
        self notify( "markAsSixthSenseSource" );
        self endon( "markAsSixthSenseSource" );
    }

    self.sixthsensesource[var_1] = 1;
    var_0 scripts\engine\utility::_id_13736( 10, "death" );
    self.sixthsensesource[var_1] = 0;
}

_id_F67B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );

    for (;;)
    {
        var_0 = 0;
        var_1 = level.players;
        var_2 = 0;

        if ( !scripts\mp\killstreaks\emp_common::_id_9D29() )
        {
            foreach ( var_4 in var_1 )
            {
                if ( !isdefined( var_4 ) || !scripts\mp\utility\game::isreallyalive( var_4 ) )
                    continue;

                if ( var_4.team == self.team )
                    continue;

                if ( var_4 scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) )
                    continue;

                if ( !scripts\mp\equipment\phase_shift::_id_213D( self, var_4 ) )
                    continue;

                var_5 = self.origin - var_4.origin;
                var_6 = anglestoforward( var_4 getplayerangles() );
                var_7 = vectordot( var_5, var_6 );

                if ( var_7 <= 0 )
                    continue;

                var_8 = vectornormalize( var_5 );
                var_9 = vectornormalize( var_6 );
                var_7 = vectordot( var_8, var_9 );

                if ( var_7 < 0.965926 )
                    continue;

                var_0++;
                var_10 = var_4 geteye();
                var_11 = self geteye();

                if ( bullettracepassed( var_10, var_11, 0, self ) )
                {
                    var_2 = 1;
                    break;
                }

                if ( var_0 >= 3 )
                {
                    scripts\engine\utility::waitframe();
                    var_0 = 0;
                }
            }

            scripts\engine\utility::waitframe();
        }

        _id_12E6C( var_2 );
        scripts\engine\utility::waitframe();
    }
}

_id_12E6C( var_0 )
{

}

_id_12C8C()
{

}

_id_F704()
{
    scripts\mp\utility\game::giveperk( "specialty_pistoldeath" );
}

_id_12CBD()
{
    scripts\mp\utility\game::_id_E150( "specialty_pistoldeath" );
}

_id_F67E()
{
    thread scripts\mp\killstreaks\killstreaks::_id_8374( "airdrop_assault", 0, 0, self );
}

_id_12C8D()
{

}

_id_F89F()
{
    thread scripts\mp\killstreaks\killstreaks::_id_8374( "uav", 0, 0, self );
}

_id_12D53()
{

}

_id_F864()
{
    scripts\mp\utility\game::giveperk( "specialty_bulletdamage" );
    thread _id_13B63();
}

_id_13B63()
{
    self notify( "watchStoppingPowerKill" );
    self endon( "watchStoppingPowerKill" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "killed_enemy" );
    _id_12D3A();
}

_id_12D3A()
{
    scripts\mp\utility\game::_id_E150( "specialty_bulletdamage" );
    self notify( "watchStoppingPowerKill" );
}

_id_F678()
{
    scripts\mp\utility\game::giveperk( "specialty_pistoldeath" );
}

_id_12C8A()
{
    if ( scripts\mp\utility\game::_id_12D6( "specialty_pistoldeath" ) )
        scripts\mp\utility\game::_id_E150( "specialty_pistoldeath" );
}

_id_F769( var_0 )
{
    self endon( "death" );
    self endon( "faux_spawn" );
    self endon( "disconnect" );
    self endon( "unset_juiced" );
    level endon( "game_ended" );
    self._id_9E62 = 1;
    self._id_BCF6 = 1.25;
    scripts\mp\weapons::_id_12ED5();
    scripts\mp\utility\game::giveperk( "specialty_fastreload" );
    scripts\mp\utility\game::giveperk( "specialty_quickdraw" );
    scripts\mp\utility\game::giveperk( "specialty_stalker" );
    scripts\mp\utility\game::giveperk( "specialty_fastoffhand" );
    scripts\mp\utility\game::giveperk( "specialty_fastsprintrecovery" );
    scripts\mp\utility\game::giveperk( "specialty_quickswap" );
    thread _id_12CDD();
    thread _id_12CDF();
    thread _id_12CDE();

    if ( !isdefined( var_0 ) )
        var_0 = 10;

    var_1 = var_0 * 1000 + gettime();

    if ( !isai( self ) )
        self setclientomnvar( "ui_juiced_end_milliseconds", var_1 );

    wait( var_0 );
    _id_12CDC();
}

_id_12CDC( var_0 )
{
    if ( !isdefined( var_0 ) )
    {
        if ( scripts\mp\utility\game::isjuggernaut() )
        {
            if ( isdefined( self._id_A4AA ) )
                self._id_BCF6 = self._id_A4AA;
            else
                self._id_BCF6 = 0.7;
        }
        else
        {
            self._id_BCF6 = 1;

            if ( scripts\mp\utility\game::_id_12D6( "specialty_lightweight" ) )
                self._id_BCF6 = scripts\mp\utility\game::_id_ACD8();
        }

        scripts\mp\weapons::_id_12ED5();
    }

    scripts\mp\utility\game::_id_E150( "specialty_fastreload" );
    scripts\mp\utility\game::_id_E150( "specialty_quickdraw" );
    scripts\mp\utility\game::_id_E150( "specialty_stalker" );
    scripts\mp\utility\game::_id_E150( "specialty_fastoffhand" );
    scripts\mp\utility\game::_id_E150( "specialty_fastsprintrecovery" );
    scripts\mp\utility\game::_id_E150( "specialty_quickswap" );
    self._id_9E62 = undefined;

    if ( !isai( self ) )
        self setclientomnvar( "ui_juiced_end_milliseconds", 0 );

    self notify( "unset_juiced" );
}

_id_12CDF()
{
    self endon( "disconnect" );
    self endon( "unset_juiced" );

    for (;;)
    {
        wait 0.05;

        if ( scripts\mp\utility\game::isusingremote() )
        {
            thread _id_12CDC();
            break;
        }
    }
}

_id_12CDD()
{
    self endon( "disconnect" );
    self endon( "unset_juiced" );
    scripts\engine\utility::waittill_any( "death", "faux_spawn" );
    thread _id_12CDC( 1 );
}

_id_12CDE()
{
    self endon( "disconnect" );
    self endon( "unset_juiced" );
    level scripts\engine\utility::waittill_any( "round_end_finished", "game_ended" );
    thread _id_12CDC();
}

_id_8C03()
{
    return isdefined( self._id_9E62 );
}

_id_F696()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unset_combathigh" );
    level endon( "end_game" );
    self._id_4D2D = 0;

    if ( level._id_10A56 )
    {
        var_0 = 56;
        var_1 = 21;
    }
    else
    {
        var_0 = 112;
        var_1 = 32;
    }

    if ( isdefined( self._id_A4B1 ) )
        self._id_A4B1 destroy();

    if ( isdefined( self._id_A4B0 ) )
        self._id_A4B0 destroy();

    self._id_4404 = newclienthudelem( self );
    self._id_4404.x = 0;
    self._id_4404.y = 0;
    self._id_4404._id_002B = "left";
    self._id_4404._id_002C = "top";
    self._id_4404._id_017D = "fullscreen";
    self._id_4404._id_0382 = "fullscreen";
    self._id_4404 setshader( "combathigh_overlay", 640, 480 );
    self._id_4404._id_02A4 = -10;
    self._id_4404._id_0049 = 1;
    self._id_4405 = scripts\mp\hud_util::_id_4A27( "hudsmall", 1.0 );
    self._id_4405 scripts\mp\hud_util::_id_F801( "CENTER", "CENTER", 0, var_0 );
    self._id_4405 _meth_834F( 10.0 );
    self._id_4405._id_00B9 = ( 0.8, 0.8, 0 );
    self._id_4405._id_0049 = 0;
    self._id_4405._id_0142 = 1;
    self._id_4403 = scripts\mp\hud_util::_id_49D9( "specialty_painkiller", var_1, var_1 );
    self._id_4403.alpha = 0;
    self._id_4403 scripts\mp\hud_util::_id_F7D6( self._id_4405 );
    self._id_4403 scripts\mp\hud_util::_id_F801( "BOTTOM", "TOP" );
    self._id_4403._id_0049 = 1;
    self._id_4403._id_02A4 = 1;
    self._id_4403._id_0142 = 1;
    self._id_4404.alpha = 0.0;
    self._id_4404 fadeovertime( 1.0 );
    self._id_4403 fadeovertime( 1.0 );
    self._id_4404.alpha = 1.0;
    self._id_4403.alpha = 0.85;
    thread _id_12C93();
    thread _id_12C94();
    wait 8;
    self._id_4403 fadeovertime( 2.0 );
    self._id_4403.alpha = 0.0;
    self._id_4404 fadeovertime( 2.0 );
    self._id_4404.alpha = 0.0;
    self._id_4405 fadeovertime( 2.0 );
    self._id_4405.alpha = 0.0;
    wait 2;
    self._id_4D2D = undefined;
    scripts\mp\utility\game::_id_E150( "specialty_combathigh" );
}

_id_12C93()
{
    self endon( "disconnect" );
    self endon( "unset_combathigh" );
    self waittill( "death" );
    thread scripts\mp\utility\game::_id_E150( "specialty_combathigh" );
}

_id_12C94()
{
    self endon( "disconnect" );
    self endon( "unset_combathigh" );

    for (;;)
    {
        wait 0.05;

        if ( scripts\mp\utility\game::isusingremote() )
        {
            thread scripts\mp\utility\game::_id_E150( "specialty_combathigh" );
            break;
        }
    }
}

_id_12C92()
{
    self notify( "unset_combathigh" );
    self._id_4404 destroy();
    self._id_4403 destroy();
    self._id_4405 destroy();
}

_id_F785()
{
    scripts\mp\lightarmor::_id_F786( self, 150 );
}

_id_12CE5()
{
    scripts\mp\lightarmor::_id_ACAC();
}

_id_F81D()
{
    self notify( "stopRevenge" );
    wait 0.05;

    if ( !isdefined( self._id_A9A3 ) )
        return;

    if ( level.teambased && self.team == self._id_A9A3.team )
        return;

    var_0 = spawnstruct();
    var_0._id_10158 = self;
    var_0._id_928E = "compassping_revenge";
    var_0._id_C364 = ( 0, 0, 64 );
    var_0._id_039F = 10;
    var_0.height = 10;
    var_0._id_0049 = 0;
    var_0._id_50AE = 1.5;
    var_0._id_4554 = 0;
    var_0._id_CB9B = 1;
    var_0._id_6ABA = 0;
    var_0._id_9B3F = 0;
    self._id_E48E = var_0;
    self._id_A9A3 scripts\mp\entityheadicons::_id_F73D( var_0._id_10158, var_0._id_928E, var_0._id_C364, var_0._id_039F, var_0.height, var_0._id_0049, var_0._id_50AE, var_0._id_4554, var_0._id_CB9B, var_0._id_6ABA, var_0._id_9B3F );
    thread _id_13B2A();
    thread _id_13B2C();
    thread _id_13B2B();
    thread _id_13B2D();
    thread _id_13B64();
}

_id_13B2A()
{
    self endon( "stopRevenge" );
    self endon( "disconnect" );
    var_0 = self._id_A9A3;

    for (;;)
    {
        var_0 waittill( "spawned_player" );
        var_0 scripts\mp\entityheadicons::_id_F73D( self._id_E48E._id_10158, self._id_E48E._id_928E, self._id_E48E._id_C364, self._id_E48E._id_039F, self._id_E48E.height, self._id_E48E._id_0049, self._id_E48E._id_50AE, self._id_E48E._id_4554, self._id_E48E._id_CB9B, self._id_E48E._id_6ABA, self._id_E48E._id_9B3F );
    }
}

_id_13B2C()
{
    self endon( "stopRevenge" );
    self waittill( "killed_enemy" );
    self notify( "stopRevenge" );
}

_id_13B2B()
{
    self endon( "stopRevenge" );
    self._id_A9A3 waittill( "disconnect" );
    self notify( "stopRevenge" );
}

_id_13B64()
{
    var_0 = self._id_A9A3;
    self waittill( "stopRevenge" );

    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_3, var_2 in var_0._id_6647 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_2 destroy();
    }
}

_id_13B2D()
{
    var_0 = self._id_C2BB;
    var_1 = self._id_A9A3;
    var_1 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "stopRevenge" );
    self waittill( "disconnect" );

    if ( !isdefined( var_1 ) )
        return;

    foreach ( var_4, var_3 in var_1._id_6647 )
    {
        if ( !isdefined( var_3 ) )
            continue;

        var_3 destroy();
    }
}

_id_12D1A()
{
    self notify( "stopRevenge" );
}

_id_F7E5()
{
    self._id_38EB = 1;
    thread _id_0D67::_id_CAAF();
}

_id_12D09()
{
    self._id_38EB = 0;
}

_id_F880()
{
    self._id_3925 = 1;
    thread _id_0D67::_id_1166B();
}

_id_12D46()
{
    self._id_3925 = 0;
}

_id_F7E4()
{
    self._id_8C1C = 1;
    thread _id_0D67::_id_E88E();
}

_id_12D08()
{
    self._id_8C1C = 0;
}

_id_F7E0()
{
    scripts\mp\equipment\ground_pound::_id_8659( "phase" );
}

_id_12D05()
{
    scripts\mp\equipment\ground_pound::_id_865A();
}

_id_F62F()
{
    self._id_8BC2 = 1;
}

_id_12C68()
{
    self._id_8BC2 = 0;
}

_id_F630()
{
    self._id_8BC3 = 1;
    self notify( "force_regeneration" );
}

_id_12C69()
{
    self._id_8BC3 = 1;
}

_id_F6F1()
{
    _id_0D6F::_id_F6F2();
}

_id_12CB1()
{

}

_id_F64E()
{
    _id_0D6C::_id_261D();
}

_id_12C74()
{

}

_id_F64D()
{
    scripts\mp\archetypes\archassault::_id_2616();
}

_id_12C73()
{

}

_id_F64F()
{
    _id_0D6F::_id_2620();
}

_id_12C75()
{

}

_id_F790()
{
    self._id_11B2E = "specialty_mark_targets";
    _id_0DD0::_id_B381();
}

_id_12CED()
{
    self._id_11B2C = undefined;
}

_id_F65A()
{
    _id_0D6B::_id_F6E6( "battery" );
}

_id_12C7A()
{

}

_id_F67A()
{

}

_id_12C8B()
{

}

_id_F669()
{
    self._id_8CC1 = 1;
    self notify( "force_regen" );
}

_id_12C84()
{
    self._id_8CC1 = undefined;
    self notify( "force_regen" );
}

_id_F82C()
{
    _id_0D6B::_id_F6E6( "scorestreak" );
}

_id_12D25()
{

}

_id_F86B()
{
    self._id_11B2C = "specialty_superpack";
    _id_0D6B::_id_F6E6( "super" );
}

_id_12D3E()
{
    self._id_11B2C = undefined;
}

_id_F84F()
{

}

_id_12D32()
{

}

_id_F6CE()
{
    scripts\mp\utility\game::_id_17C0( "dodgeDefense", 0.5, 0, ::_id_5804 );
}

_id_12CA5()
{
    scripts\mp\utility\game::_id_E0E6( "dodgeDefense", 0 );
}

_id_5804( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !( isdefined( var_2._id_5812 ) && var_2._id_5812 && var_2 scripts\mp\utility\game::_id_12D6( "specialty_dodge_defense" ) ) )
        return 1;

    return 0;
}

_id_F6CF()
{

}

_id_12CA6()
{

}

_id_F72D()
{
    self._id_11B2C = "specialty_ground_pound";
    scripts\mp\equipment\ground_pound::_id_8659();
}

_id_12CC7()
{
    self._id_11B2C = undefined;
    scripts\mp\equipment\ground_pound::_id_865A();
}

_id_F793()
{
    self giveweapon( "iw7_fistsperk_mp" );
    self _meth_84E8( "iw7_fistsperk_mp" );

    if ( self hasweapon( "iw7_fists_mp" ) )
    {
        var_0 = self getcurrentweapon();
        scripts\mp\utility\game::_id_141E( "iw7_fists_mp" );
        self giveweapon( "iw7_fistslethal_mp" );

        if ( var_0 == "iw7_fists_mp" )
        {
            scripts\mp\utility\game::_id_141A( "iw7_fistslethal_mp" );

            if ( isdefined( self._id_81D1 ) && self._id_81D1 && isdefined( self._id_10922 ) && self._id_10922 == "iw7_fists_mp" )
            {
                self setspawnweapon( "iw7_fistslethal_mp" );
                self._id_10922 = "iw7_fistslethal_mp";
            }
        }
    }
}

_id_12CEE()
{
    scripts\mp\utility\game::_id_141E( "iw7_fistsperk_mp" );

    if ( self hasweapon( "iw7_fistslethal_mp" ) )
    {
        var_0 = self getcurrentweapon();
        scripts\mp\utility\game::_id_141E( "iw7_fistslethal_mp" );
        self giveweapon( "iw7_fists_mp" );

        if ( var_0 == "iw7_fistslethal_mp" )
            scripts\mp\utility\game::_id_141A( "iw7_fists_mp" );
    }
}

_id_F807()
{

}

_id_12D0F()
{

}

sethardline()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "perk_end_hardline" );
    self.hardlineactive["kills"] = 0;
    self.hardlineactive["assists"] = 0;
    thread watchhardlineassists();

    while ( self.hardlineactive["kills"] < 8 )
    {
        self waittill( "got_a_kill", var_0, var_1, var_2 );

        if ( isdefined( var_1 ) && !scripts\mp\utility\game::_id_9E6C( var_1 ) )
            self.hardlineactive["kills"] += 1;
    }

    self.hardlineactive = undefined;
}

watchhardlineassists()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "perk_end_hardline" );

    for (;;)
    {
        self waittill( "assist_hardline" );

        if ( self.hardlineactive["assists"] == 1 )
        {
            self.hardlineactive["kills"] += 1;
            self.hardlineactive["assists"] = 0;
            continue;
        }

        self.hardlineactive["assists"] += 1;
    }
}

unsethardline()
{
    self.hardlineactive = undefined;
    self notify( "perk_end_hardline" );
}

_id_F74A()
{
    for (;;)
    {
        foreach ( var_1 in level.players )
        {
            if ( !scripts\mp\utility\game::isreallyalive( var_1 ) )
                continue;

            if ( var_1.team == self.team )
                continue;

            if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_coldblooded" ) )
                continue;

            if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_gpsjammer" ) )
                continue;

            if ( length2d( var_1 _meth_816B() ) < 150 && !isdefined( var_1._id_37EE ) && distance2d( self.origin, var_1.origin ) < 1024 )
                thread _id_49EE( var_1 );
        }

        scripts\engine\utility::waitframe();
    }
}

_id_49EE( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );

    if ( !isdefined( self ) || !scripts\mp\utility\game::isreallyalive( self ) )
        return;

    var_0._id_37EE = 1;
    var_1 = scripts\mp\objidpoolmanager::requestminimapid( 1 );

    if ( var_1 != -1 )
    {
        scripts\mp\objidpoolmanager::minimap_objective_add( var_1, "active", var_0.origin, "cb_compassping_sniper_enemy", self );
        scripts\mp\objidpoolmanager::minimap_objective_team( var_1, self.team );
        var_0 thread _id_13A35( var_1 );
    }

    while ( length2d( var_0 _meth_816B() ) < 150 )
        wait 2;

    scripts\mp\objidpoolmanager::returnminimapid( var_1 );
    var_0._id_37EE = undefined;
}

_id_13A35( var_0 )
{
    scripts\engine\utility::waittill_any( "death", "disconnect" );
    scripts\mp\objidpoolmanager::returnminimapid( var_0 );
    self._id_37EE = undefined;
}

_id_12CD3()
{

}

_id_F7CD()
{

}

_id_12CFE()
{

}

_id_F894()
{
    thread _id_E8A9();
    thread _id_E8AA();
}

_id_12D4E()
{

}

_id_F7DE()
{
    self._id_11B2C = "specialty_personal_trophy";
    thread _id_0ADF::_id_D446();
}

_id_12D04()
{
    self._id_11B2C = undefined;
    thread _id_0ADF::_id_D448();
}

_id_F6CA()
{
    thread _id_0D6C::_id_56E7();
}

_id_12CA3()
{

}

_id_F6EB()
{
    self._id_11B2C = "specialty_equipment_ping";
}

_id_12CAE()
{
    self._id_11B2C = undefined;
}

_id_F825()
{
    self._id_11B2C = "specialty_rugged_eqp";
}

_id_12D1F()
{
    self._id_11B2C = undefined;
    thread scripts\mp\supers\super_supertrophy::supertrophy_onruggedequipmentunset();
    thread scripts\mp\equipment\micro_turret::microturret_onruggedequipmentunset();
}

_id_6BC4( var_0, var_1 )
{

}

_id_F78D()
{
    self._id_11B2C = "specialty_man_at_arms";
}

_id_12CEB()
{
    self._id_11B2C = undefined;
}

_id_F7CB()
{
    self endon( "disconnect" );
    self endon( "unsetOutlineKillstreaks" );
    self.engstructks = engineer_createengstruct();
    var_0 = self.engstructks;
    thread engineer_watchownerdisconnect( var_0, "unsetOutlineKillstreaks" );

    for (;;)
    {
        var_1 = level._id_1655;

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( isdefined( var_3._id_01F1 ) )
                {
                    if ( engineer_shouldoutlineent( var_3, var_0 ) )
                        engineer_addoutlinedent( var_3, var_0 );
                }
            }
        }

        wait 0.1;
    }
}

_id_12CFC()
{
    self notify( "unsetOutlineKillstreaks" );

    if ( isdefined( self.engstructks ) )
        thread engineer_clearoutlinedents( self.engstructks );

    self.engstructks = undefined;
}

_id_F6E4()
{
    self endon( "disconnect" );
    self endon( "unsetEngineer" );
    self.engstructeqp = engineer_createengstruct();
    var_0 = self.engstructeqp;
    thread engineer_watchownerdisconnect( var_0, "unsetEngineer" );

    for (;;)
    {
        var_1 = _id_7D96();

        foreach ( var_3 in var_1 )
        {
            if ( engineer_shouldoutlineent( var_3, var_0 ) )
                engineer_addoutlinedent( var_3, var_0 );
        }

        wait 0.1;
    }
}

_id_12CAB()
{
    self notify( "unsetEngineer" );

    if ( isdefined( self.engstructeqp ) )
        thread engineer_clearoutlinedents( self.engstructeqp );

    self.engstructeqp = undefined;
}

engineer_createengstruct()
{
    var_0 = spawnstruct();
    var_0.owner = self;
    var_0._id_C78E = [];
    var_0.outlinedids = [];
    return var_0;
}

engineer_addoutlinedent( var_0, var_1 )
{
    var_2 = var_0 getentitynumber();
    var_3 = var_1.outlinedids[var_2];

    if ( isdefined( var_3 ) )
        thread engineer_removeoutlinedent( var_2, var_1 );

    var_3 = scripts\mp\utility\game::_id_C794( var_0, "red", var_1.owner, 0, 1, "level_script" );
    var_1._id_C78E[var_2] = var_0;
    var_1.outlinedids[var_2] = var_3;
    thread engineer_removeoutlinedentondeath( var_2, var_1 );
}

engineer_removeoutlinedent( var_0, var_1 )
{
    var_1 notify( "engineer_removeOutlinedEnt_" + var_0 );
    var_2 = var_1._id_C78E[var_0];
    var_3 = var_1.outlinedids[var_0];
    scripts\mp\utility\game::_id_C78F( var_3, var_2 );
    var_1._id_C78E[var_0] = undefined;
    var_1.outlinedids[var_0] = undefined;
}

engineer_removeoutlinedentondeath( var_0, var_1 )
{
    var_1 endon( "engineer_clearOutlinedEnts" );
    var_1 endon( "engineer_removeOutlinedEnt_" + var_0 );
    var_2 = var_1._id_C78E[var_0];
    var_2 waittill( "death" );
    thread engineer_removeoutlinedent( var_0, var_1 );
}

engineer_clearoutlinedents( var_0 )
{
    var_0 notify( "engineer_clearOutlinedEnts" );

    foreach ( var_3, var_2 in var_0.outlinedids )
        scripts\mp\utility\game::_id_C78F( var_2, var_0._id_C78E[var_3] );
}

engineer_shouldoutlineent( var_0, var_1 )
{
    var_2 = var_0 getentitynumber();

    if ( isdefined( var_1.outlinedids[var_2] ) )
        return 0;

    var_3 = var_0.owner;

    if ( !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( var_3, var_1.owner ) ) )
        return 0;

    return 1;
}

engineer_watchownerdisconnect( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        var_0.owner endon( var_1 );

    var_0 endon( "engineer_clearOutlinedEnts" );
    var_0.owner waittill( "disconnect" );
    thread engineer_clearoutlinedents( var_0 );
}

_id_7D96()
{
    return scripts\engine\utility::_id_22AF( scripts\engine\utility::_id_2282( [ level._id_B779, level._id_B726, level._id_69D6, level._id_11267._id_12801, level._id_590F, level._id_2ABD, level.spidergrenade.activeagents, level.spidergrenade.proxies ] ) );
}

_id_F693()
{

}

_id_12C90()
{

}

_id_FB15()
{
    self._id_11B2C = "specialty_wall_lock";
    thread _id_0D70::_id_E8AC();
}

_id_12D66()
{
    self._id_11B2C = undefined;
}

_id_F826()
{
    self._id_11B2C = "specialty_rush";
    thread _id_0D6F::_id_B947();
}

_id_12D20()
{
    self notify( "removeCombatHigh" );
    self.speedonkillmod = undefined;
    self._id_11B2C = undefined;
}

_id_F747()
{
    thread _id_E859();
}

_id_12CD2()
{

}

_id_F7A4()
{
    self._id_11B2C = "specialty_momentum";
    thread _id_E863();
}

_id_E863()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "momentum_unset" );

    for (;;)
    {
        if ( self _meth_81BD() )
        {
            _id_848B();
            self._id_BCF6 = 1;
            scripts\mp\weapons::_id_12ED5();
        }

        wait 0.1;
    }
}

_id_848B()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "game_ended" );
    self endon( "momentum_reset" );
    self endon( "momentum_unset" );
    thread _id_B944();
    thread _id_B943();

    for ( var_0 = 0; var_0 < 0.06; var_0 += 0.01 )
    {
        self._id_BCF6 += 0.01;
        scripts\mp\weapons::_id_12ED5();
        wait 0.208333;
    }

    self notify( "momentum_max_speed" );
    thread momentum_endaftermax();
    self waittill( "momentum_reset" );
}

momentum_endaftermax()
{
    self endon( "momentum_unset" );
    self waittill( "momentum_reset" );
}

_id_B944()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "momentum_unset" );

    for (;;)
    {
        if ( !self _meth_81BD() || self _meth_81BE() || !self isonground() || self iswallrunning() )
        {
            wait 0.4;

            if ( !self _meth_81BD() || self _meth_81BE() || !self isonground() || self iswallrunning() )
            {
                self notify( "momentum_reset" );
                break;
            }
        }

        scripts\engine\utility::waitframe();
    }
}

_id_B943()
{
    self endon( "death" );
    self endon( "disconnect" );
    self waittill( "damage" );
    self notify( "momentum_reset" );
}

_id_12CF2()
{
    self notify( "momentum_unset" );
    self._id_11B2C = undefined;
}

_id_F829()
{
    self._id_11B2C = "specialty_scavenger_eqp";
    _id_0D6B::_id_F6E6( "equipment" );
}

_id_12D22()
{
    self._id_11B2C = undefined;
}

_id_F854()
{
    thread _id_0D67::_id_1091C();
}

_id_12D34()
{
    foreach ( var_1 in level.players )
        var_1 notify( "end_spawnview" );
}

_id_F73C()
{
    thread scripts\mp\equipment\headgear::_id_E855();
}

_id_12CCD()
{

}

_id_F71D()
{
    self._id_11B2C = "specialty_ftlslide";

    if ( scripts\mp\utility\game::_id_9D46() && level.tactical )
        self _meth_845A( "assassin_mlgslide_mp_tactical" );
    else if ( scripts\mp\utility\game::_id_9D46() )
        self _meth_845A( "assassin_mlgslide_mp" );
    else if ( level.tactical )
        self _meth_845A( "assassin_slide_mp_tactical" );
    else
        self _meth_845A( "assassin_slide_mp" );
}

_id_12CC3()
{
    self._id_11B2C = undefined;
}

_id_F753()
{
    thread _id_0D70::_id_E7FE();
}

_id_12CD6()
{

}

_id_F721()
{
    thread _id_12EA3();
}

_id_12CC6()
{
    thread _id_E127();
}

_id_F86D()
{
    self endon( "disconnect" );
    self._id_11B2C = "specialty_support_killstreaks";
    self waittill( "equipKillstreaksFinished" );

    if ( !isdefined( self.pers["killstreaks"][1] ) )
    {
        foreach ( var_1 in self.pers["killstreaks"] )
            var_1._id_5FB9 = 0;
    }
}

_id_12D40()
{
    self notify( "end_support_killstreaks" );
    self._id_11B2C = undefined;
}

_id_F7D2()
{
    self._id_C829 = 0.98;
    scripts\mp\weapons::_id_12ED5();
}

_id_12D02()
{
    self._id_C829 = undefined;
}

_id_F657()
{
    self setclientomnvar( "ui_uplink_carrier_hud", 1 );

    if ( level._id_218A == 0 )
        self setclientomnvar( "ui_uplink_carrier_armor_max", 100 );
    else
        self setclientomnvar( "ui_uplink_carrier_armor_max", level._id_3AEC );

    if ( level._id_D6AF != 0 )
        self setclientomnvar( "ui_uplink_timer_hud", 1 );
}

_id_12C77()
{
    self notify( "unsetBallCarrier" );
    self setclientomnvar( "ui_uplink_carrier_hud", 0 );
    self setclientomnvar( "ui_uplink_carrier_armor", -1 );

    if ( level._id_D6AF != 0 )
        self setclientomnvar( "ui_uplink_timer_hud", 0 );
}

_id_F694()
{
    self._id_11B2C = "specialty_cloak_aerial";
}

_id_12C91()
{
    self._id_11B2C = undefined;
}

_id_F852()
{
    self._id_11B2C = "specialty_spawn_radar";
    self._id_8C2B = 1;
}

_id_12D33()
{
    self._id_11B2C = undefined;
    self._id_8C2B = 1;
}

_id_F752()
{

}

_id_12CD5()
{

}

_id_F886()
{

}

_id_12D4A()
{

}

_id_F631()
{
    self._id_11B2C = "specialty_ads_awareness";
    thread _id_E832();
    self setscriptablepartstate( "heightened_senses", "default" );
}

_id_E832()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "unsetADSAwareness" );
    self.awarenessradius = 256;
    self.awarenessqueryrate = 2.0;
    thread awarenessmonitorstance();

    for (;;)
    {
        wait( self.awarenessqueryrate );

        foreach ( var_1 in level.players )
        {
            if ( var_1.team == self.team )
                continue;

            if ( var_1 scripts\mp\utility\game::_id_12D6( "specialty_coldblooded" ) )
                continue;

            if ( var_1 isonground() && !var_1 _meth_81BD() && !var_1 iswallrunning() && !var_1 _meth_81BE() )
                continue;

            if ( distance2d( var_1.origin, self.origin ) < self.awarenessradius )
                thread playincomingwarning( var_1 );
        }
    }
}

playincomingwarning( var_0 )
{
    self setscriptablepartstate( "heightened_senses", "scrn_pulse" );
    self playrumbleonentity( "damage_heavy" );
    var_0 playsoundtoplayer( "ghost_senses_ping", self );
    wait 0.2;

    if ( isdefined( self ) )
    {
        self setscriptablepartstate( "heightened_senses", "default" );

        if ( scripts\mp\utility\game::isreallyalive( self ) )
        {
            self playrumbleonentity( "damage_heavy" );

            if ( isdefined( var_0 ) && scripts\mp\utility\game::isreallyalive( var_0 ) )
                var_0 playsoundtoplayer( "ghost_senses_ping", self );
        }
    }
}

awarenessmonitorstance()
{
    self endon( "death" );
    self endon( "disconnect" );

    for (;;)
    {
        var_0 = self getstance();
        var_1 = self _meth_816B();

        switch ( var_0 )
        {
            case "stand":
                self.awarenessradius = 400;
                self.awarenessqueryrate = 2.0;
                break;
            case "crouch":
                self.awarenessradius = 650;
                self.awarenessqueryrate = 1.0;
                break;
            case "prone":
                self.awarenessradius = 700;
                self.awarenessqueryrate = 0.5;
                break;
        }

        wait 0.01;
    }
}

awarenessaudiopulse()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "stop_awareness" );

    for (;;)
    {
        playloopsound( self.origin + ( 0, 0, 5 ), "ghost_senses_ping" );
        wait 2.0;
    }
}

_id_12C6B()
{
    self notify( "unsetADSAwareness" );
    self._id_11B2C = undefined;
    self setscriptablepartstate( "heightened_senses", "default" );
}

_id_F815()
{
    self._id_11B2C = "specialty_rearguard";
    _id_0DD1::_id_E814();
}

_id_12D14()
{
    self._id_11B2C = undefined;
    self._id_8C19 = undefined;
}

_id_F675()
{
    self._id_3248 = spawnstruct();
    self._id_3248.player = self;
    self._id_3248._id_639D = [];
    self._id_3248._id_655F = [];
    self._id_3248._id_6556 = [];
    self._id_3248 thread _id_139B6();
    self._id_3248 thread _id_139B7();
}

_id_12C88()
{
    self notify( "unsetBulletOutline" );
    self._id_3248 = undefined;
}

_id_139B6()
{
    self.player endon( "death" );
    self.player endon( "disconnect" );
    self.player endon( "unsetBulletOutline" );

    while ( isdefined( self.player ) )
    {
        var_0 = gettime();

        foreach ( var_3, var_2 in self._id_639D )
        {
            if ( !isdefined( var_2 ) )
            {
                _id_324C( undefined, var_3 );
                continue;
            }

            if ( var_2 scripts\mp\utility\game::_id_12D6( "specialty_noscopeoutline" ) )
            {
                _id_324C( var_2, var_3 );
                continue;
            }

            if ( var_0 >= self._id_6556[var_3] )
                _id_324C( var_2, var_3 );
        }

        scripts\engine\utility::waitframe();
    }
}

_id_139B7()
{
    self.player scripts\engine\utility::waittill_any( "disconnect", "unsetBulletOutline" );

    foreach ( var_2, var_1 in self._id_639D )
    {
        if ( isdefined( var_1 ) )
            _id_324C( var_1, var_2 );
    }
}

_id_3249( var_0, var_1, var_2 )
{
    var_3 = var_0 getentitynumber();
    var_4 = gettime() + var_1 * 1000;
    self._id_639D[var_3] = var_0;

    if ( !isdefined( self._id_655F[var_3] ) )
        self._id_655F[var_3] = scripts\mp\utility\game::_id_C794( var_0, "red", self.player, 1, 0, "perk" );

    if ( !isdefined( self._id_6556[var_3] ) || !isdefined( var_2 ) || var_2 )
        self._id_6556[var_3] = var_4;
}

_id_324C( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = var_0 getentitynumber();

    self._id_639D[var_1] = undefined;
    self._id_6556[var_1] = undefined;

    if ( isdefined( var_0 ) )
        scripts\mp\utility\game::_id_C78F( self._id_655F[var_1], var_0 );

    self._id_655F[var_1] = undefined;
}

_id_324B( var_0, var_1, var_2, var_3 )
{
    if ( !( var_3 == "MOD_HEAD_SHOT" || var_3 == "MOD_RIFLE_BULLET" || var_3 == "MOD_PISTOL_BULLET" || var_3 == "MOD_EXPLOSIVE_BULLET" ) )
        return;

    if ( !isdefined( var_0 ) || !isdefined( var_1 ) )
        return;

    if ( !( isplayer( var_0 ) || scripts\mp\utility\game::_id_9F22( var_0 ) ) || !( isplayer( var_1 ) || scripts\mp\utility\game::_id_9F22( var_1 ) ) )
        return;

    var_4 = var_0;

    if ( isdefined( var_0.owner ) )
        var_4 = var_0.owner;

    var_5 = var_1;

    if ( isdefined( var_1.owner ) )
        var_5 = var_1.owner;

    if ( !scripts\mp\utility\game::istrue( scripts\mp\utility\game::playersareenemies( var_4, var_5 ) ) )
        return;

    if ( isplayer( var_0 ) && isplayer( var_1 ) && scripts\mp\utility\game::_id_C7A0( var_0 geteye(), var_1 geteye() ) )
        return;

    if ( isdefined( var_0._id_3248 ) && !var_1 scripts\mp\utility\game::_id_12D6( "specialty_noscopeoutline" ) )
        var_0._id_3248 _id_3249( var_1, 1 );

    if ( isdefined( var_1._id_3248 ) && !var_0 scripts\mp\utility\game::_id_12D6( "specialty_noscopeoutline" ) )
        var_1._id_3248 _id_3249( var_0, 2.0, 0 );
}

_id_E8A9()
{
    self endon( "death" );
    self endon( "disconnect" );
    var_0 = scripts\mp\utility\game::_id_81EC();

    for (;;)
    {
        foreach ( var_2 in level.players )
        {
            if ( !isdefined( var_2 ) || !scripts\mp\utility\game::isreallyalive( var_2 ) )
                continue;

            if ( var_2.team == self.team || var_2 == self )
                continue;

            if ( var_2 scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) )
                continue;

            if ( var_2 scripts\mp\equipment\cloak::_id_9FC1() )
                thread _id_B375( var_2, var_0 );
        }

        scripts\engine\utility::waitframe();
    }
}

_id_E8AA()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "track_killstreak_end" );

    for (;;)
    {
        if ( scripts\mp\utility\game::isusingremote() )
        {
            scripts\engine\utility::waitframe();
            scripts\mp\utility\game::_id_E150( "specialty_tracker" );

            while ( scripts\mp\utility\game::isusingremote() )
                scripts\engine\utility::waitframe();

            scripts\mp\utility\game::giveperk( "specialty_tracker" );
            break;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_B375( var_0, var_1 )
{
    if ( !isdefined( var_0._id_61AA ) )
        var_0._id_61AA = [];

    if ( isdefined( var_0._id_61AA[var_1] ) && var_0._id_61AA[var_1] == "active" )
        return;

    var_0._id_61AA[var_1] = "active";
    thread _id_61C2( var_0, var_1 );
    var_0 scripts\engine\utility::waittill_any( "death", "cloak_end" );
    var_0._id_61AA[var_1] = undefined;
}

_id_61C2( var_0, var_1 )
{
    var_2 = [ "j_shoulder_ri", "j_shoulder_le", "j_hip_ri", "j_hip_le", "j_spine4", "j_wrist_ri", "j_wrist_le" ];

    while ( var_0 scripts\mp\equipment\cloak::_id_9FC1() )
    {
        playfxontagforclients( scripts\engine\utility::_id_7ECB( "tracker_cloak_tag" ), var_0, var_2[randomint( var_2.size - 1 )], self );
        wait 0.25;
    }

    var_0._id_61AA[var_1] = undefined;
}

_id_12EA3()
{
    self endon( "remove_gpsjammer" );
    self endon( "death" );
    self endon( "disconnect" );

    if ( isai( self ) )
    {
        while ( isdefined( self._id_26B9 ) && self._id_26B9 > 0 )
            scripts\engine\utility::waitframe();
    }

    if ( level._id_B7CC == 0 )
        return;

    if ( level._id_1190C < 0.05 )
        return;

    var_0 = 1;
    var_1 = 0;
    var_2 = 0;
    var_3 = 0;
    var_4 = 0;
    var_5 = 0;
    var_6 = self.origin;
    var_7 = 0;

    if ( 1 )
    {
        var_7 = 1;
        self _meth_8522( 1 );
        thread ghostadvanceduavwatcher();
    }
    else
    {
        thread ghostadvanceduavwatcher();

        for (;;)
        {
            var_7 = 0;

            if ( scripts\mp\utility\game::isusingremote() || scripts\engine\utility::_id_9CEE( self._id_9EE6 ) || scripts\engine\utility::_id_9CEE( self._id_9DBC ) || self _meth_81AD() )
                var_7 = 1;
            else
            {
                if ( var_5 > 1 )
                {
                    var_5 = 0;

                    if ( distancesquared( var_6, self.origin ) < level._id_B75E )
                        var_2 = 1;
                    else
                        var_2 = 0;

                    var_6 = self.origin;
                }

                var_8 = self _meth_816B();
                var_9 = lengthsquared( var_8 );

                if ( var_9 > level._id_B7CC && var_2 == 0 )
                    var_7 = 1;
            }

            if ( var_7 == 1 )
            {
                var_3 = 0;

                if ( var_0 == 0 )
                {
                    var_1 = 0;
                    var_0 = 1;
                    self _meth_8522( 1 );
                }
            }
            else
            {
                var_3++;

                if ( var_0 == 1 && var_3 >= level._id_848A )
                {
                    var_1 = 1;
                    var_0 = 0;
                    self _meth_8522( 0 );
                }
            }

            if ( var_1 == 1 )
                level notify( "radar_status_change" );

            var_5 += level._id_1190C;
            wait( level._id_1190C );
        }
    }
}

ghostadvanceduavwatcher()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "remove_gpsjammer" );

    for (;;)
    {
        if ( level.teambased )
        {
            if ( isdefined( level.activeadvanceduavs ) && scripts\mp\utility\game::istrue( level.activeadvanceduavs[scripts\mp\utility\game::_id_8027( self.team )] ) )
            {
                self _meth_8522( 0 );

                while ( scripts\mp\utility\game::istrue( level.activeadvanceduavs[scripts\mp\utility\game::_id_8027( self.team )] ) )
                    scripts\engine\utility::waitframe();

                self _meth_8522( 1 );
            }
        }
        else
        {
            foreach ( var_1 in level.players )
            {
                if ( var_1 == self )
                    continue;

                if ( scripts\mp\utility\game::istrue( level.activeadvanceduavs[var_1.guid] ) && level.activeadvanceduavs[var_1.guid] > 0 )
                {
                    self _meth_8522( 0 );

                    while ( scripts\mp\utility\game::istrue( level.activeadvanceduavs[var_1.guid] ) && level.activeadvanceduavs[var_1.guid] > 0 )
                        level waittill( "uav_update" );

                    self _meth_8522( 1 );
                }
            }
        }

        scripts\engine\utility::waitframe();
    }
}

_id_E127()
{
    self notify( "remove_gpsjammer" );
    self _meth_8522( 0 );
}

_id_F72F()
{
    level._effect["groundPoundShield_impact"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    thread scripts\mp\equipment\ground_pound::_id_8655( 6, 8, ::_id_866A, "groundPoundShield_unset" );
}

_id_12CC9()
{
    self notify( "groundPoundShield_unset" );
}

_id_866A( var_0 )
{
    thread _id_866C();
}

_id_866C()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "groundPound_unset" );
    self endon( "groundPoundLand" );
    wait 0.25;
    _id_866B();
}

_id_866B()
{
    if ( isdefined( self._id_865C ) )
        thread _id_8662( self._id_865C );

    var_0 = self.origin + anglestoforward( self.angles ) * 5;
    var_1 = self.angles + ( 0, 90, 0 );
    var_2 = spawn( "script_model", var_0 );
    var_2.angles = var_1;
    var_2 setmodel( "weapon_shinguard_col_wm" );
    var_3 = spawn( "script_model", var_0 );
    var_3.angles = var_1;
    var_3 setmodel( "weapon_shinguard_fr_wm" );
    var_3._id_C79D = scripts\mp\utility\game::_id_C793( var_3, "cyan", 0, 0, "equipment" );
    var_4 = spawn( "script_model", var_0 );
    var_4.angles = var_1;
    var_4 setmodel( "weapon_shinguard_en_wm" );
    var_4._id_C79D = scripts\mp\utility\game::_id_C793( var_4, "orange", 0, 0, "equipment" );
    var_2._id_13434 = var_3;
    var_2._id_13433 = var_4;
    var_2.owner = self;
    var_2 setcandamage( 1 );
    var_2 _meth_847F( 1 );
    var_2.health = 9999;
    var_2._id_FC9B = 210;
    self._id_865C = var_2;
    var_5 = level._id_3CB5;

    foreach ( var_7 in var_5 )
    {
        if ( !isdefined( var_7 ) )
            continue;

        if ( level.teambased && var_7.team == self.team )
        {
            var_4 _meth_8429( var_7 );
            continue;
        }

        var_3 _meth_8429( var_7 );
    }

    thread _id_8669( var_2 );
    thread _id_8665( var_2 );
    thread _id_8666( var_2, 3.25 );
    thread _id_8664( var_2 );
    thread _id_8660( var_2 );
    thread _id_8668( var_2 );
    thread _id_8658();
    return var_2;
}

_id_8662( var_0 )
{
    self notify( "groundPoundShield_end" );

    if ( !isdefined( var_0 ) )
        return;

    thread _id_8663();
    thread _id_8661( var_0 );
}

_id_865D( var_0 )
{
    self notify( "groundPoundShield_end" );

    if ( !isdefined( var_0 ) )
        return;

    thread _id_865E();
    thread _id_8661( var_0 );
}

_id_8668( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "groundPound_unset" );
    self endon( "groundPoundShield_end" );
    self endon( "groundPoundShield_deleteShield" );

    for (;;)
    {
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );

        if ( isdefined( var_2 ) )
        {
            if ( var_2 == self || var_2.team != self.team )
                var_0._id_FC9B -= var_1;
        }

        var_0.health = 9999;
        thread _id_865F( var_2, var_4, var_3 );

        if ( var_0._id_FC9B <= 0 )
        {
            thread _id_865D( var_0 );
            return;
        }
        else if ( var_0._id_FC9B <= 105.0 )
        {
            if ( var_0._id_13434._id_01F1 != "weapon_shinguard_dam_wm" )
            {
                var_0._id_13434 setmodel( "weapon_shinguard_dam_wm" );
                scripts\mp\utility\game::_id_C7AA( var_0._id_13434 );
            }

            if ( var_0._id_13433._id_01F1 != "weapon_shinguard_dam_wm" )
            {
                var_0._id_13433 setmodel( "weapon_shinguard_dam_wm" );
                scripts\mp\utility\game::_id_C7AA( var_0._id_13433 );
            }
        }
    }
}

_id_8664( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "groundPound_unset" );
    self endon( "groundPoundShield_end" );
    self endon( "groundPoundShield_deleteShield" );
    var_1 = self isjumping();
    var_2 = undefined;

    for (;;)
    {
        var_2 = var_1;
        var_1 = self isjumping();

        if ( !var_2 && var_1 )
        {
            thread _id_8662( var_0 );
            return;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_8666( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "groundPound_unset" );
    self endon( "groundPoundShield_end" );
    self endon( "groundPoundShield_deleteShield" );
    wait( var_1 );
    thread _id_8662( var_0 );
}

_id_8665( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "groundPound_unset" );
    self endon( "groundPoundShield_end" );
    self endon( "groundPoundShield_deleteShield" );

    while ( isdefined( var_0 ) )
    {
        if ( lengthsquared( var_0.origin - self.origin ) > 11664 )
        {
            thread _id_8662( var_0 );
            return;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_8660( var_0 )
{
    self endon( "groundPoundShield_deleteShield" );
    scripts\engine\utility::waittill_any( "death", "disconnect", "groundPound_unset" );
    thread _id_8661( var_0 );
}

_id_8669( var_0 )
{
    self endon( "groundPoundShield_deleteShield" );
    var_1 = self.team;

    for (;;)
    {
        level waittill( "joined_team", var_2 );

        if ( level.teambased && var_2.team == var_1 )
        {
            var_0._id_13434 _meth_8388( var_2 );
            var_0._id_13433 _meth_8429( var_2 );
            continue;
        }

        var_0._id_13434 _meth_8429( var_2 );
        var_0._id_13433 _meth_8388( var_2 );
    }
}

_id_8661( var_0 )
{
    self notify( "groundPoundShield_deleteShield" );
    scripts\mp\utility\game::_id_C78F( var_0._id_13434._id_C79D, var_0._id_13434 );
    scripts\mp\utility\game::_id_C78F( var_0._id_13433._id_C79D, var_0._id_13433 );
    var_0._id_13434 delete();
    var_0._id_13433 delete();
    var_0 delete();
}

_id_8658()
{
    self endon( "disconnect" );
    self endon( "groundPound_unset" );
    self endon( "groundPoundShield_end" );
    self endon( "groundPoundShield_deleteShield" );
    self playlocalsound( "heavy_shield_up" );
    self playsoundtoteam( "heavy_shield_up_npc", "axis", self );
    self playsoundtoteam( "heavy_shield_up_npc", "allies", self );
}

_id_8663()
{
    self endon( "disconnect" );
    self endon( "groundPound_unset" );
    self endon( "groundPoundShield_end" );
    self endon( "groundPoundShield_deleteShield" );
    self playlocalsound( "heavy_shield_down" );
    self playsoundtoteam( "heavy_shield_down_npc", "axis", self );
    self playsoundtoteam( "heavy_shield_down_npc", "allies", self );
}

_id_865F( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    self endon( "groundPound_unset" );
    self endon( "groundPoundShield_end" );
    self endon( "groundPoundShield_deleteShield" );
    playfx( scripts\engine\utility::_id_7ECB( "groundPoundShield_impact" ), var_1, -1 * var_2 );
    playloopsound( var_1, "ds_shield_impact" );
    var_0 scripts\mp\damagefeedback::updatedamagefeedback( "hitbulletstorm" );
}

_id_865E()
{
    self endon( "disconnect" );
    self endon( "groundPound_unset" );
    self endon( "groundPoundShield_end" );
    self endon( "groundPoundShield_deleteShield" );
}

_id_F730()
{
    level._effect["groundPoundShock_impact_sm"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    level._effect["groundPoundShock_impact_lrg"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    thread scripts\mp\equipment\ground_pound::_id_8655( 7, 8, ::_id_866E, "groundPoundShock_unset" );
}

_id_12CCA()
{
    self notify( "groundPoundShock_unset" );
}

_id_866E( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "groundPound_unset" );
    self endon( "groundPoundShock_unset" );
    var_1 = undefined;
    var_2 = undefined;

    switch ( var_0 )
    {
        case "groundPoundLandTier0":
            var_2 = scripts\engine\utility::_id_7ECB( "groundPoundShock_impact_sm" );
            var_1 = 144;
            break;
        case "groundPoundLandTier1":
            var_2 = scripts\engine\utility::_id_7ECB( "groundPoundShock_impact_sm" );
            var_1 = 180;
            break;
        case "groundPoundLandTier2":
            var_2 = scripts\engine\utility::_id_7ECB( "groundPoundShock_impact_lrg" );
            var_1 = 216;
            break;
    }

    thread _id_866F( var_1, var_2 );
    var_3 = undefined;

    if ( level.teambased )
        var_3 = scripts\mp\utility\game::_id_81A0( scripts\mp\utility\game::_id_8027( self.team ) );
    else
        var_3 = level._id_3CB5;

    var_4 = var_1 * var_1;
    var_5 = scripts\engine\trace::_id_48BC( 0, 1, 0, 0, 1, 0, 0 );

    foreach ( var_7 in var_3 )
    {
        if ( !isdefined( var_7 ) || var_7 == self || !var_7 scripts\mp\killstreaks\emp_common::_id_FFC5() )
            continue;

        if ( lengthsquared( var_7 geteye() - self geteye() ) > var_4 )
            continue;

        var_8 = physics_raycast( self geteye(), var_7 geteye(), var_5, undefined, 0, "physicsquery_closest" );

        if ( isdefined( var_8 ) && var_8.size > 0 )
            continue;

        thread _id_866D( var_7 );
    }

    var_10 = scripts\mp\weapons::_id_7E8C( self.origin, var_1, 0, undefined );

    foreach ( var_12 in var_10 )
    {
        if ( isdefined( var_12.owner ) && !scripts\mp\weapons::_id_7415( self, var_12.owner ) )
            continue;

        var_12 notify( "emp_damage", self, 3 );
    }
}

_id_866D( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 scripts\mp\killstreaks\emp_common::_id_20C3();
    scripts\mp\gamescore::_id_11ACE( self, var_0, "groundpound_mp" );
    var_0 shellshock( "concussion_grenade_mp", 3 );
    wait 3;
    var_0 scripts\mp\killstreaks\emp_common::_id_E0F3();

    if ( isdefined( self ) )
        scripts\mp\gamescore::_id_12D6F( self, var_0, "groundpound_mp" );
}

_id_866F( var_0, var_1 )
{
    playfx( var_1, self.origin + ( 0, 0, 20 ), ( 0, 0, 1 ) );
}

_id_F72E()
{
    thread scripts\mp\equipment\ground_pound::_id_8655( 8, 8, ::_id_865B, "groundPoundBoost_unset" );
}

_id_12CC8()
{
    self notify( "groundPoundBoost_unset" );
}

_id_865B( var_0 )
{
    scripts\engine\utility::_id_F367( self _meth_842D( 0 ) );
}

_id_F65D()
{
    level._effect["battleSlideShield_damage"] = loadfx( "vfx/iw7/_requests/mp/vfx_debug_warning.vfx" );
    thread _id_2904();
}

_id_12C7D()
{
    self notify( "battleSlideShield_unset" );
}

_id_2904()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "battleSlide_unset" );
    self notify( "battleSlideShield_monitor" );
    self endon( "battleSlideShield_monitor" );

    for (;;)
    {
        self waittill( "sprint_slide_begin" );
        thread _id_2906();
    }
}

_id_2905( var_0 )
{
    self endon( "disconnect" );
    self endon( "battleSlide_unset" );

    while ( isdefined( var_0 ) )
    {
        var_0 waittill( "damage", var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10 );
        thread _id_28FB( var_0, var_2, var_4, var_3 );

        if ( var_0.health <= 0 )
        {
            thread _id_28F9( var_0 );
            var_0 delete();
            continue;
        }

        if ( var_0.health <= 125.0 )
        {
            if ( var_0._id_01F1 != "weapon_shinguard_dam_wm" )
                var_0 setmodel( "weapon_shinguard_dam_wm" );

            continue;
        }

        if ( var_0._id_01F1 != "weapon_shinguard_wm" )
            var_0 setmodel( "weapon_shinguard_wm" );
    }
}

_id_2906()
{
    if ( isdefined( self._id_28F8 ) )
        thread _id_2900( self._id_28F8 );

    var_0 = scripts\engine\utility::_id_107E6();
    var_0 setmodel( "weapon_shinguard_wm" );
    var_0 setcandamage( 1 );
    var_0.health = 250;
    var_0 linkto( self, "tag_origin", ( 30, 0, 0 ), ( 0, 90, 0 ) );
    var_0 show();
    self._id_28F8 = var_0;
    thread _id_28FD( var_0 );
    thread _id_28FE( var_0 );
    thread _id_28FF( var_0 );
    thread _id_2909( var_0 );
    thread _id_2905( var_0 );
    thread _id_28FC( var_0 );
    thread _id_2907( var_0 );
    return var_0;
}

_id_2900( var_0 )
{
    self notify( "battleSlideShield_end" );

    if ( !isdefined( var_0 ) )
        return;

    thread _id_2901( var_0 );
    var_0 delete();
}

_id_28FC( var_0 )
{
    var_0 endon( "death" );
    scripts\engine\utility::waittill_any( "death", "disconnect", "battleSlide_unset" );
    var_0 delete();
}

_id_28FD( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "battleSlide_unset" );
    self endon( "battleSlideShield_unlink" );
    self endon( "battleSlideShield_end" );
    var_0 endon( "death" );

    for (;;)
    {
        if ( !self isonground() )
        {
            var_0 delete();
            self notify( "battleSlideShield_end" );
            return;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_28FE( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "battleSlide_unset" );
    self endon( "battleSlideShield_unlink" );
    self endon( "battleSlideShield_end" );
    var_0 endon( "death" );
    self waittill( "sprint_begin" );
    var_0 delete();
    self notify( "battleSlideShield_end" );
}

_id_2902( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "battleSlide_unset" );
    self endon( "battleSlideShield_end" );
    var_0 endon( "death" );

    for (;;)
    {
        if ( lengthsquared( var_0.origin - self.origin ) > 11664 )
        {
            thread _id_2900( var_0 );
            return;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_2903( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "battleSlide_unset" );
    self endon( "battleSlideShield_end" );
    var_0 endon( "death" );
    wait 3.5;
    thread _id_2900( var_0 );
}

_id_2908( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    var_0 unlink();
    self notify( "battleSlideShield_unlink" );
    thread _id_2903( var_0 );
    thread _id_2902( var_0 );
    self notify( "battleSlideShield_unlink" );
}

_id_28FF( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "battleSlide_unset" );
    self endon( "battleSlideShield_unlink" );
    self endon( "battleSlideShield_end" );
    var_0 endon( "death" );
    self waittill( "sprint_slide_end" );
    wait 0.75;
    var_0 delete();
    self notify( "battleSlideShield_end" );
}

_id_2909( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "battleSlide_unset" );
    self endon( "battleSlideShield_unlink" );
    self endon( "battleSlideShield_end" );
    var_0 endon( "death" );
    self waittill( "sprint_slide_end" );

    for (;;)
    {
        if ( lengthsquared( self _meth_816B() ) < 100 )
        {
            thread _id_2908( var_0 );
            return;
        }

        scripts\engine\utility::waitframe();
    }
}

_id_28F9( var_0 )
{
    if ( !isdefined( var_0 ) )
        return;

    thread _id_28FA( var_0 );
    self notify( "battleSlideShield_end" );
}

_id_2907( var_0 )
{
    self endon( "disconnect" );
    self endon( "battleSlide_unset" );
    var_0 endon( "death" );
    self playlocalsound( "heavy_shield_up" );
    self playsoundtoteam( "heavy_shield_up_npc", "axis", self );
    self playsoundtoteam( "heavy_shield_up_npc", "allies", self );
}

_id_2901( var_0 )
{
    self endon( "disconnect" );
    self endon( "battleSlide_unset" );
    var_0 endon( "death" );
    self playlocalsound( "heavy_shield_down" );
    self playsoundtoteam( "heavy_shield_down_npc", "axis", self );
    self playsoundtoteam( "heavy_shield_down_npc", "allies", self );
}

_id_28FB( var_0, var_1, var_2, var_3 )
{
    self endon( "disconnect" );
    self endon( "battleSlide_unset" );
    var_0 endon( "death" );
    playfx( scripts\engine\utility::_id_7ECB( "battleSlideShield_damage" ), var_2, -1 * var_3 );
    playloopsound( var_2, "ds_shield_impact" );
    var_1 scripts\mp\damagefeedback::updatedamagefeedback( "hitbulletstorm" );
}

_id_28FA( var_0 )
{

}

_id_F65C()
{

}

_id_12C7C()
{

}

_id_7DF8()
{
    return 100;
}

_id_F888()
{
    level._effect["thrusterRadFr"] = loadfx( "vfx/iw7/core/mp/powers/thrust_blast/vfx_thrust_blast_radius_fr" );
    level._effect["thrusterRadEn"] = loadfx( "vfx/iw7/core/mp/powers/thrust_blast/vfx_thrust_blast_radius_en" );
    _id_11886();
}

_id_12D4B()
{
    if ( isdefined( self._id_1188A ) )
        self._id_1188A delete();

    self notify( "thruster_unset" );
}

_id_11886()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "thruster_unset" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "doubleJumpBoostBegin" );
        thread _id_11878();
        thread _id_11870();
    }
}

_id_11878()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "thruster_unset" );
    level endon( "game_ended" );
    self endon( "doubleJumpBoostEnd" );

    if ( !scripts\mp\utility\game::_id_12D6( "specialty_quieter" ) )
        self playsoundonmovingent( "demolition_jump_expl" );

    thread _id_11885();

    if ( !isdefined( self._id_1188A ) )
    {
        self._id_1188A = spawn( "script_model", self.origin );
        self._id_1188A setmodel( "tag_origin" );
    }
    else
        self._id_1188A.origin = self.origin;

    wait 0.05;

    for (;;)
    {
        self playrumbleonentity( "damage_light" );
        scripts\mp\shellshock::_id_1245( 0.1, 0.3, self.origin, 120 );
        var_0 = playerphysicstrace( self.origin + ( 0, 0, 10 ), self.origin - ( 0, 0, 600 ) ) + ( 0, 0, 1 );
        self._id_1188A.origin = var_0;
        self._id_1188A.angles = ( 90, 0, 0 );
        wait 0.05;
        scripts\mp\utility\game::_id_D486( self._id_1188A, "tag_origin", self.team, scripts\engine\utility::_id_7ECB( "thrusterRadFr" ), scripts\engine\utility::_id_7ECB( "thrusterRadEn" ) );
        wait 0.33;
    }
}

_id_11870()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "thruster_unset" );
    level endon( "game_ended" );
    self endon( "doubleJumpBoostEnd" );

    for (;;)
    {
        scripts\mp\utility\game::_id_DC0B( self.origin, 12, 64, 5, 12, self, undefined, "MOD_IMPACT", "thruster_mp", 1 );
        wait 0.05;
    }
}

_id_11885()
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\engine\utility::waittill_any( "doubleJumpBoostEnd", "thruster_unset" );
    wait 0.05;
}

_id_E859()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );

    for (;;)
    {
        if ( self _meth_8416() && self playerads() > 0.3 && self _meth_842B( 0 ) > 0 )
        {
            _id_68D6();
            thread _id_13AA5();
            self waittill( "hover_ended" );
            _id_6334();
        }

        wait 0.1;
    }
}

_id_13AA5()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    self endon( "walllock_ended" );

    while ( self playerads() > 0.3 )
        wait 0.05;

    self notify( "hover_ended" );
}

_id_68D6()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    self._id_9E37 = 1;
    self _meth_8423( 0 );
    self allowjump( 0 );
    self playlocalsound( "ghost_wall_attach" );
    var_0 = scripts\engine\utility::_id_107E6();
    self _meth_823A( var_0 );
    thread _id_B2F5( var_0 );
}

_id_B2F5( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    var_1 = self _meth_8433( 0 );
    self _meth_8434( 0, 1.0 );
    wait 2;
    self notify( "hover_ended" );
    self _meth_8434( 0, var_1 );
    self _meth_842C( 0, 0 );
}

_id_6334()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "removeArchetype" );
    level endon( "game_ended" );
    self._id_9E37 = undefined;
    self _meth_8423( 1 );
    self allowjump( 1 );
    self playlocalsound( "ghost_wall_detach" );
    self unlink();
}

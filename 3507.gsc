// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_fastsprintrecovery_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_fastreload_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_lightweight_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_marathon_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_stalker_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_reducedsway_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_quickswap_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_pitcher_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_bulletaccuracy_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_quickdraw_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_sprintreload_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_silentkill_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_blindeye_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_gpsjammer_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_quieter_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_incog_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_paint_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_scavenger_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_detectexplosive_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_selectivehearing_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_comexp_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_falldamage_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_regenfaster_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_sharp_focus_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_stun_resistance_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_blastshield_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_gunsmith_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_extraammo_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_extra_equipment_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_extra_deadly_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_extra_attachment_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_explosivedamage_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_gambler_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_hardline_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_twoprimaries_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_boom_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_deadeye_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "specialty_chain_reaction_ks", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "teleport", ::tryuseperkstreak );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "all_perks_bonus", ::_id_128D6 );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "speed_boost", ::_id_12904 );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "refill_grenades", ::_id_128FA );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "refill_ammo", ::_id_128F9 );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "regen_faster", ::_id_128FB );
}

_id_12904( var_0, var_1 )
{
    _id_58E3( "specialty_juiced", "speed_boost" );
    return 1;
}

_id_128FA( var_0, var_1 )
{
    _id_58E3( "specialty_refill_grenades", "refill_grenades" );
    return 1;
}

_id_128F9( var_0, var_1 )
{
    _id_58E3( "specialty_refill_ammo", "refill_ammo" );
    return 1;
}

_id_128FB( var_0, var_1 )
{
    _id_58E3( "specialty_regenfaster", "regen_faster" );
    return 1;
}

_id_128D6( var_0, var_1 )
{
    return 1;
}

tryuseperkstreak( var_0, var_1 )
{
    var_2 = scripts\mp\utility\game::_id_11150( var_1, "_ks" );
    _id_5A5D( var_2 );
    return 1;
}

_id_5A5D( var_0 )
{
    scripts\mp\utility\game::giveperk( var_0 );
    thread _id_139E8( var_0 );
    thread _id_3E15( var_0 );

    if ( var_0 == "specialty_hardline" )
        scripts\mp\killstreaks\killstreaks::_id_F866();

    scripts\mp\matchdata::_id_AFC9( var_0 + "_ks", self.origin );
}

_id_58E3( var_0, var_1 )
{
    scripts\mp\utility\game::giveperk( var_0 );

    if ( isdefined( var_1 ) )
        scripts\mp\matchdata::_id_AFC9( var_1, self.origin );
}

_id_139E8( var_0 )
{
    self endon( "disconnect" );
    self waittill( "death" );
    scripts\mp\utility\game::_id_E150( var_0 );
}

_id_3E15( var_0 )
{
    var_1 = scripts\mp\class::_id_805D( var_0 );

    if ( var_1 != "specialty_null" )
    {
        scripts\mp\utility\game::giveperk( var_1 );
        thread _id_139E8( var_1 );
    }
}

_id_9EE0( var_0 )
{
    for ( var_1 = 1; var_1 < 4; var_1++ )
    {
        if ( isdefined( self.pers["killstreaks"][var_1]._id_110EA ) && self.pers["killstreaks"][var_1]._id_110EA == var_0 )
        {
            if ( self.pers["killstreaks"][var_1]._id_269A )
                return 1;
        }
    }

    return 0;
}

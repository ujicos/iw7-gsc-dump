// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_2EA3()
{
    level._id_2D1D["super_claw"] = ::_id_89EF;
    level._id_2D1D["super_steeldragon"] = ::_id_89EF;
    level._id_2D1D["super_armmgs"] = ::_id_89EF;
    level._id_2D1D["super_atomizer"] = ::_id_89EF;
    level._id_2D1D["super_blackholegun"] = ::_id_89EF;
    level._id_2D1D["super_penetrationrailgun"] = ::_id_89EF;
    level._id_2D1D["super_amplify"] = ::_id_89EE;
    level._id_2D1D["super_overdrive"] = ::_id_89EE;
    level._id_2D1D["super_armorup"] = ::_id_89EE;
    level._id_2D1D["super_rewind"] = ::_id_89EE;
    level._id_2D1D["super_phaseshift"] = ::_id_89EE;
    level._id_2D1D["super_teleport"] = ::_id_89EE;
    level._id_2D1D["super_invisible"] = ::_id_89EE;
    level._id_2D1D["super_visionpulse"] = ::_id_89EE;
}

_id_9F8B( var_0 )
{
    if ( !isdefined( level._id_2D1D ) )
        return 0;

    if ( !isdefined( level._id_2D1D[var_0] ) )
        return 0;

    return 1;
}

_id_2EE9()
{
    var_0 = self._id_2ED8;
    var_1 = randomint( level._id_2EFC[var_0].size );
    return level._id_2EFC[var_0][var_1];
}

botpicktrait()
{
    var_0 = self._id_2ED8;

    if ( !isdefined( level.botsupportedarchetypetraits ) )
    {
        level.botsupportedarchetypetraits = [];
        level.botsupportedarchetypetraits["archetype_assault"] = [];
        level.botsupportedarchetypetraits["archetype_heavy"] = [];
        level.botsupportedarchetypetraits["archetype_scout"] = [];
        level.botsupportedarchetypetraits["archetype_assassin"] = [];
        level.botsupportedarchetypetraits["archetype_engineer"] = [];
        level.botsupportedarchetypetraits["archetype_sniper"] = [];
        level.botsupportedarchetypetraits["archetype_assault"][level.botsupportedarchetypetraits["archetype_assault"].size] = "specialty_boom";
        level.botsupportedarchetypetraits["archetype_heavy"][level.botsupportedarchetypetraits["archetype_heavy"].size] = "specialty_regenfaster";
        level.botsupportedarchetypetraits["archetype_heavy"][level.botsupportedarchetypetraits["archetype_heavy"].size] = "specialty_man_at_arms";
        level.botsupportedarchetypetraits["archetype_scout"][level.botsupportedarchetypetraits["archetype_scout"].size] = "specialty_afterburner";
        level.botsupportedarchetypetraits["archetype_scout"][level.botsupportedarchetypetraits["archetype_scout"].size] = "specialty_rush";
        level.botsupportedarchetypetraits["archetype_assassin"][level.botsupportedarchetypetraits["archetype_assassin"].size] = "specialty_sixth_sense";
        level.botsupportedarchetypetraits["archetype_engineer"][level.botsupportedarchetypetraits["archetype_engineer"].size] = "specialty_personal_trophy";
        level.botsupportedarchetypetraits["archetype_engineer"][level.botsupportedarchetypetraits["archetype_engineer"].size] = "specialty_rugged_eqp";
        level.botsupportedarchetypetraits["archetype_sniper"][level.botsupportedarchetypetraits["archetype_sniper"].size] = "specialty_rearguard";
        level.botsupportedarchetypetraits["archetype_sniper"][level.botsupportedarchetypetraits["archetype_sniper"].size] = "specialty_mark_targets";
    }

    var_1 = randomint( level.botsupportedarchetypetraits[var_0].size );
    return level.botsupportedarchetypetraits[var_0][var_1];
}

bot_think_supers()
{
    if ( isdefined( self.bot_think_supers ) )
        return;

    self notify( "bot_think_supers" );
    self endon( "bot_think_supers" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    self.bot_think_supers = 1;

    for (;;)
    {
        self waittill( "super_ready" );

        if ( !isdefined( self._id_AEAA ) )
            continue;

        if ( isdefined( level._id_2D1D[self._id_AEAA] ) )
            self [[ level._id_2D1D[self._id_AEAA] ]]();
        else
        {

        }

        self botsetflag( "super_ready", 0 );
        self waittill( "super_finished" );
    }
}

_id_89EF()
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    for (;;)
    {
        var_0 = randomfloatrange( 3, 6 );
        wait( var_0 );

        if ( !isalive( self ) )
            continue;

        if ( !isdefined( self._id_010C ) || !isalive( self._id_010C ) )
            scripts\engine\utility::waittill_any( "enemy", "death" );

        if ( !isalive( self ) )
            continue;

        if ( !isdefined( self._id_010C ) )
            continue;

        var_1 = distance( self._id_010C.origin, self.origin );

        if ( var_1 < 800 && _id_0D79::_id_8BEE() )
        {
            if ( var_1 < 550 )
                continue;
        }

        self botsetflag( "super_ready", 1 );
        break;
    }

    self waittill( "super_started" );
}

_id_89EE()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    wait( randomfloatrange( 1, 3 ) );

    for (;;)
    {
        wait 0.25;

        if ( !isalive( self ) )
            continue;

        if ( !isdefined( self._id_010C ) || !isalive( self._id_010C ) )
            scripts\engine\utility::waittill_any( "enemy", "death" );

        if ( !isalive( self ) )
            continue;

        if ( _id_0D79::_id_8BEE() )
        {
            var_0 = distance( self._id_010C.origin, self.origin );

            if ( var_0 < 600 )
                continue;
        }

        break;
    }

    self botsetflag( "super_ready", 1 );
    self waittill( "super_started" );
}

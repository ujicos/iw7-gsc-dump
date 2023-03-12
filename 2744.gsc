// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_8CBC = 0.55;
    var_0 = scripts\mp\tweakables::_id_81E7( "player", "healthregentime" );
    level._id_8CC1 = var_0 <= 0;
    level._id_D3A4 = var_0;
    level thread _id_C56E();
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread onplayerspawned();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        thread _id_D3A5();
        self _meth_8401( game["thermal_vision"] );
    }
}

_id_D3A5()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    self endon( "faux_spawn" );
    level endon( "game_ended" );

    if ( self.health <= 0 )
        return;

    var_0 = 0;
    var_1 = 0;
    thread _id_D368( self.maxhealth * 0.55 );

    for (;;)
    {
        scripts\engine\utility::waittill_any( "damage", "force_regen", "force_regeneration" );

        if ( self.health <= 0 )
            return;

        if ( scripts\mp\utility\game::isjuggernaut() )
            continue;

        var_1 = gettime();
        var_2 = self.health / self.maxhealth;
        self._id_DE8E = level._id_D3A4;

        if ( scripts\mp\utility\game::_id_12D6( "specialty_regenfaster" ) )
            self._id_DE8E *= level._id_DE8A;

        if ( var_2 <= level._id_8CBC )
            self._id_2410 = 1;

        thread _id_8CC4( var_1, var_2 );
    }
}

_id_D367()
{
    self notify( "playerBreathingBetterSound" );
    self endon( "playerBreathingBetterSound" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    level endon( "game_ended" );

    if ( level._id_7669 )
        return;

    if ( !isplayer( self ) )
        return;

    if ( scripts\mp\utility\game::isusingremote() )
        return;

    if ( scripts\mp\utility\game::_id_9D48( "archetype_scout" ) )
        self playlocalsound( "breathing_better_c6" );
    else if ( scripts\mp\utility\game::isfemale() )
        self playlocalsound( "Fem_breathing_better" );
    else
        self playlocalsound( "breathing_better" );
}

_id_8CC4( var_0, var_1 )
{
    self notify( "healthRegeneration" );
    self endon( "healthRegeneration" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );
    level endon( "game_ended" );

    if ( !scripts\mp\utility\game::_id_12D6( "specialty_adrenaline" ) )
    {
        if ( level._id_8CC1 )
            return;

        while ( scripts\mp\utility\game::istrue( self._id_8CC1 ) )
            wait 0.5;
    }

    if ( !scripts\mp\utility\game::_id_12D6( "specialty_adrenaline" ) )
        scripts\mp\utility\game::_id_1359E( self._id_DE8E, "force_regeneration" );

    if ( var_1 < 0.55 )
        var_2 = 1;
    else
        var_2 = 0;

    if ( scripts\mp\utility\game::_id_12D6( "specialty_adrenaline" ) || scripts\mp\utility\game::_id_12D6( "specialty_regenfaster" ) )
        self setclientomnvar( "ui_health_regen_hud", 1 );

    var_3 = self.maxhealth / 50.0;
    var_4 = 0.0;
    var_5 = gettime();

    for (;;)
    {
        if ( scripts\mp\utility\game::istrue( self._id_8CC1 ) && !scripts\mp\utility\game::_id_12D6( "specialty_adrenaline" ) )
            return;

        wait 0.05;
        var_6 = 0;

        if ( scripts\mp\utility\game::_id_12D6( "specialty_adrenaline" ) || scripts\mp\utility\game::_id_12D6( "specialty_adrenaline_lite" ) )
            var_6 = scripts\mp\equipment\adrenaline::_id_7EF5();
        else if ( scripts\mp\utility\game::_id_12D6( "specialty_regenfaster" ) )
            var_6 = var_3 * level._id_DE89;
        else
            var_6 = var_3;

        var_7 = 0;

        if ( self.health < self.maxhealth )
        {
            var_7 = 1;
            var_8 = self.health + var_6 + var_4;
            var_9 = int( min( self.maxhealth, var_8 ) );
            self.health = var_9;
            var_4 = var_8 - var_9;
        }

        if ( self.health >= self.maxhealth )
        {
            self.health = self.maxhealth;

            if ( var_7 && scripts\mp\utility\game::_id_12D6( "specialty_regenfaster" ) )
                scripts\mp\missions::_id_D991( "ch_trait_icu" );

            break;
        }
    }

    self notify( "healed" );
    thread scripts\mp\damage::_id_E143();
    _id_D367();
    self setclientomnvar( "ui_health_regen_hud", 0 );
}

_id_135F0()
{
    self notify( "waiting_to_stop_remote" );
    self endon( "waiting_to_stop_remote" );
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "stopped_using_remote" );
    scripts\mp\utility\game::restorebasevisionset( 0 );
}

_id_D368( var_0 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "joined_team" );
    self endon( "joined_spectators" );

    if ( !isplayer( self ) )
        return;

    self.hardcoreinjuredlooopsplayed = 0;
    wait 2;

    for (;;)
    {
        wait 0.2;

        if ( self.health <= 0 )
            return;

        if ( self.health >= var_0 )
            continue;

        var_1 = level._id_8CC1 || isdefined( self._id_8CC1 ) && self._id_8CC1;

        if ( scripts\mp\utility\game::isusingremote() )
            continue;

        if ( scripts\mp\utility\game::_id_9D48( "archetype_scout" ) )
            self playlocalsound( "breathing_hurt_c6" );
        else if ( scripts\mp\utility\game::isfemale() )
            self playlocalsound( "Fem_breathing_hurt" );
        else
            self playlocalsound( "breathing_hurt" );

        wait 1.5;

        if ( level._id_8B38 )
        {
            self.hardcoreinjuredlooopsplayed++;

            if ( self.hardcoreinjuredlooopsplayed > 3 )
                return;
        }
    }
}

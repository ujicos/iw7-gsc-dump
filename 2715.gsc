// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_9040 = [];
    level._id_9040["low_damage"] = 25;
    level._id_9040["standard"] = 50;
    level._id_9040["standard_cp"] = 50;
    level._id_9040["high_damage"] = 75;
}

updatedamagefeedback( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isplayer( self ) && !scripts\mp\utility\game::_id_9EF0( self ) )
        return;

    if ( !isdefined( var_3 ) )
        var_3 = "standard";

    if ( !isdefined( var_4 ) )
        var_4 = 0;

    if ( ( !isdefined( level._id_4D4E ) || !level._id_4D4E ) && !var_4 )
    {
        if ( !isdefined( self._id_903F ) )
            self._id_903F = 0;

        self._id_903F++;
        self setclientomnvar( "ui_hitmarker_audio_events", self._id_903F % 16 );
    }

    switch ( var_0 )
    {
        case "none":
            break;
        case "hitmotionsensor":
        case "hitbulletstorm":
        case "hiticontrophysystem":
        case "hiticonarmorup":
        case "hithealthshield":
        case "hiticonempimmune":
        case "hitspawnprotection":
        case "hitlowdamage":
        case "hitcritical":
        case "hitmorehealth":
        case "hitblastshield":
        case "hittacresist":
        case "thermobaric_debuff":
        case "hitjuggernaut":
        case "hitlightarmor":
        case "hitequip":
            self setclientomnvar( "damage_feedback_icon", var_0 );
            self setclientomnvar( "damage_feedback_icon_notify", gettime() );
            _id_12EA8( var_3, var_1, var_2 );
            break;
        default:
            _id_12EA8( var_3, var_1, var_2 );
            break;
    }
}

_id_12EA8( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    var_2 = 0;
    var_3 = _id_7F03( var_0 );

    if ( isdefined( self._id_A99E ) && self._id_A99E == gettime() && var_3 <= self._id_A99D && !var_1 )
        return;

    self._id_A99E = gettime();
    self._id_A99D = var_3;
    self setclientomnvar( "damage_feedback", var_0 );
    self setclientomnvar( "damage_feedback_notify", gettime() );

    if ( var_1 )
        self setclientomnvar( "damage_feedback_kill", 1 );
    else
        self setclientomnvar( "damage_feedback_kill", 0 );

    if ( var_2 )
        self setclientomnvar( "damage_feedback_headshot", 1 );
    else
        self setclientomnvar( "damage_feedback_headshot", 0 );
}

_id_7F03( var_0 )
{
    if ( !isdefined( level._id_9040[var_0] ) )
        return 0;

    return level._id_9040[var_0];
}

_id_917F( var_0 )
{
    var_1 = 0;

    if ( isdefined( level._id_4D4E ) && level._id_4D4E )
        var_1 = 1;

    if ( !isplayer( self ) )
        return;

    switch ( var_0 )
    {
        case "throwingknife":
        case "scavenger":
            if ( !var_1 )
                self playlocalsound( "scavenger_pack_pickup" );

            if ( !level._id_8B38 )
                self setclientomnvar( "damage_feedback_other", var_0 );

            break;
        case "scavenger_eqp":
            if ( !var_1 )
                self playlocalsound( "scavenger_pack_pickup" );

            if ( !level._id_8B38 )
                self setclientomnvar( "damage_feedback_other", var_0 );

            break;
        case "boxofguns":
            if ( !var_1 )
                self playlocalsound( "mp_box_guns_ammo" );

            if ( !level._id_8B38 )
                self setclientomnvar( "damage_feedback_other", var_0 );

            break;
        case "eqp_ping":
            if ( !var_1 )
                self playsoundtoplayer( "mp_cranked_countdown", self );

            if ( !level._id_8B38 )
                self setclientomnvar( "damage_feedback_other", var_0 );

            break;
    }
}

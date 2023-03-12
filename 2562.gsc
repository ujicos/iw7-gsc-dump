// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( isdefined( level._id_119F ) )
        return;

    level._id_119F = [];
    level._id_119E = [];
    anim.failure = 0;
    anim.success = 1;
    anim.running = 2;
    anim.invalid = 3;
    anim.aborted = 3;
}

_id_0077()
{
    self._id_3135 = spawnstruct();

    if ( isdefined( self._id_2A80 ) )
        self btregistertreeinstance( self._id_2A80 );
    else
    {
        self._id_3135._id_E87F = [];
        self._id_3135._id_D8BE = [];
        self._id_3135._id_BE5D = 0;
        self._id_C9D9 = level._id_119F[self._id_2A7F];
        self [[ self._id_C9D9._id_71AD ]]();
    }

    self._id_3135._id_9928 = [];
    thread _id_0071();
}

_id_0071()
{
    self endon( "death" );
    self endon( "terminate_ai_threads" );

    for (;;)
    {
        self waittill( "ai_notify", var_0, var_1 );
        scripts\asm\asm::_id_232F( "ai_notify", var_0, var_1 );
    }
}

_id_008D( var_0, var_1 )
{
    level._id_119F[var_0] = var_1;

    switch ( var_0 )
    {
        case "human/ally_combatant":
        case "human/enemy_combatant":
            _id_09FD::_id_103F2();
            break;
        case "c6/base":
            _id_09FD::_id_3353();
            break;
        case "c12/c12":
            _id_09FD::_id_3508();
            break;
        case "seeker/seeker":
            _id_09FD::_id_F10A();
            break;
    }
}

_id_007B( var_0 )
{
    return isdefined( level._id_119F ) && isdefined( level._id_119F[var_0] );
}

_id_0074( var_0, var_1 )
{
    return self._id_C9D9._id_11591[var_0] + var_1;
}

_id_0076( var_0 )
{
    return [[ self._id_C9D9._id_1158E[var_0] ]]();
}

_id_008F( var_0, var_1, var_2, var_3 )
{
    var_4 = var_0._id_D8BE[var_2];

    if ( !isdefined( var_4 ) )
        return;

    if ( var_4 <= var_3 )
        return;

    var_5 = spawnstruct();
    var_5._id_71D2 = var_1;
    var_5._id_1158F = var_2;

    for (;;)
    {
        self [[ var_5._id_71D2 ]]( var_0, var_5._id_1158F, var_5 );

        if ( !isdefined( var_5._id_71D2 ) )
            break;
    }
}

_id_0087( var_0 )
{
    if ( var_0 == anim.success )
        return anim.failure;
    else if ( var_0 == anim.failure )
        return anim.success;

    return var_0;
}

_id_0090()
{
    if ( isdefined( self._id_2A80 ) )
        self bttick();
}

_id_0075()
{
    if ( isdefined( self._id_51E3 ) )
        return self._id_51E3;

    if ( isdefined( self._id_1198._id_7366 ) )
        return self._id_1198._id_7366;

    return "combat";
}

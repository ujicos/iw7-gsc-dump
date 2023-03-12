// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_2371()
{
    if ( scripts\asm\asm::_id_232E( "seeker_mp" ) )
        return;

    scripts\asm\asm::_id_230B( "seeker_mp", "seeker_init" );
    scripts\asm\asm::_id_2374( "idle", _id_0F3C::_id_B050, undefined, undefined, undefined, undefined, _id_0F3C::_id_3E96, undefined, undefined, undefined, undefined, undefined, undefined, undefined, "death_generic", undefined, undefined, undefined, undefined, "face current", "anim deltas", undefined );
    scripts\asm\asm::_id_2375( "exit", undefined, ::_id_12244, undefined );
    scripts\asm\asm::_id_2374( "run_loop", _id_0F38::_id_B063, undefined, undefined, _id_0F38::_id_F173, undefined, _id_0F3C::_id_3E96, undefined, undefined, undefined, undefined, undefined, undefined, undefined, "death_generic", undefined, undefined, undefined, undefined, "face motion", "code_move", undefined );
    scripts\asm\asm::_id_2375( "idle", undefined, ::_id_1243F, undefined );
    scripts\asm\asm::_id_2374( "seeker_init", scripts\asm\shared\utility::_id_2B58, undefined, undefined, undefined, undefined, _id_0F3C::_id_3E96, undefined, undefined, undefined, undefined, undefined, undefined, undefined, "death_generic", undefined, undefined, undefined, undefined, undefined, undefined, 1 );
    scripts\asm\asm::_id_2375( "idle", undefined, scripts\asm\shared\utility::_id_12668, undefined );
    scripts\asm\asm::_id_2374( "traverse_external", _id_0F38::_id_D560, undefined, undefined, _id_0F38::_id_F178, "run_loop", _id_0F3C::_id_3E96, 0, undefined, undefined, undefined, undefined, undefined, undefined, "death_generic", undefined, undefined, undefined, undefined, "face current", "anim deltas", undefined );
    scripts\asm\asm::_id_2374( "death_generic", _id_0F38::_id_F16E, undefined, undefined, undefined, undefined, _id_0F3C::_id_3E96, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined );
    scripts\asm\asm::_id_2374( "exit", _id_0F3C::_id_CEA8, undefined, undefined, undefined, undefined, _id_0F3C::_id_3E96, undefined, undefined, undefined, undefined, undefined, undefined, undefined, "death_generic", undefined, undefined, undefined, undefined, "face current", "anim deltas", undefined );
    scripts\asm\asm::_id_2375( "run_loop", undefined, _id_0F38::_id_9DEE, undefined );
    scripts\asm\asm::_id_2327();
}

_id_12244( var_0, var_1, var_2, var_3 )
{
    return isdefined( self._id_0233 );
}

_id_1243F( var_0, var_1, var_2, var_3 )
{
    return !isdefined( self._id_0233 );
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_10218()
{

}

_id_1181D( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) && isdefined( var_1 ) )
    {
        if ( isplayer( var_1 ) && var_1 != var_2 )
        {
            if ( !level.teambased || var_2.team != var_1.team )
            {
                var_2 thread _id_10219( var_2 );
                scripts\mp\lightarmor::_id_F786( var_2, var_2.maxhealth, 0 );
            }
        }
    }

    var_2 thread _id_10217( var_2, var_0 );
    var_0 delete();
}

_id_10219( var_0 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );
    var_0 thread _id_1021A( var_0 );
    var_0 notify( "adrenaline_used" );
    var_0 scripts\mp\utility\game::giveperk( "specialty_adrenaline" );
    wait 2;
    var_0 scripts\mp\utility\game::_id_E150( "specialty_adrenaline" );
    var_0 notify( "siphonKnife_regen_end" );
}

_id_1021A( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "siphonKnife_regen_end" );

    if ( !isdefined( var_0 ) )
        return;

    self playlocalsound( "mp_overcharge_on" );

    for (;;)
    {
        var_1 = playfx( scripts\engine\utility::_id_7ECB( "siphonKnife_regenWorld" ), self.origin + ( 0, 0, 25 ), anglestoforward( self.angles ), anglestoup( self.angles ) );
        var_1 _meth_8429( self );
        wait 0.1;
    }
}

_id_10217( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
        var_0 playlocalsound( "bs_shield_explo" );

    var_1 playsoundtoteam( "bs_shield_explo_npc", "axis", var_0 );
    var_1 playsoundtoteam( "bs_shield_explo_npc", "allies", var_0 );
    playfx( scripts\engine\utility::_id_7ECB( "siphonKnife_impactWorld" ), var_1.origin, anglestoforward( var_1.angles ), anglestoup( var_1.angles ) );
}

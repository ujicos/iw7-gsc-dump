// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_B381()
{
    level._effect["marked_target"] = loadfx( "vfx/iw7/_requests/mp/vfx_marked_target_z.vfx" );
}

_id_B382( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    level endon( "game_ended" );

    if ( scripts\engine\utility::_id_9D74( var_1 ) && isplayer( var_0 ) && var_0.team != self.team && !var_0 scripts\mp\utility\game::_id_12D6( "specialty_empimmune" ) && !isdefined( var_0._id_9E92 ) )
        thread _id_B380( var_0 );
}

_id_B380( var_0 )
{
    var_1 = var_0 scripts\engine\utility::_id_107E6();
    var_2 = spawn( "script_model", var_1.origin );
    var_2 setmodel( "tag_origin" );
    var_2 linkto( var_1, "tag_origin", ( 0, 0, 45 ), ( 0, 0, 0 ) );
    var_1 linkto( var_0, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0._id_9E92 = 1;
    var_0._id_8CC1 = 1;
    wait 0.1;
    _id_11417( var_0, var_2 );
    wait 0.1;

    if ( isdefined( var_0 ) )
        var_0 _id_E13C( var_1 );
}

_id_11417( var_0, var_1 )
{
    self endon( "death" );
    self endon( "disconnect" );
    scripts\mp\missions::_id_D991( "ch_trait_marked_target" );
    var_2 = gettime() + 3000;

    while ( isalive( var_0 ) && gettime() < var_2 )
    {
        if ( level.gametype != "dm" )
            var_3 = _func_29A( scripts\engine\utility::_id_7ECB( "marked_target" ), var_1, "tag_origin", self.team );
        else
            var_3 = playfxontagforclients( scripts\engine\utility::_id_7ECB( "marked_target" ), var_1, "tag_origin", self );

        wait 1.1;
    }
}

_id_E13C( var_0 )
{
    var_0 delete();
    self._id_9E92 = undefined;
    self._id_8CC1 = undefined;
}

_id_13AA0( var_0, var_1, var_2 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    scripts\engine\utility::_id_13737( var_2, "leave" );

    if ( isdefined( var_1 ) )
        scripts\mp\utility\game::_id_C78F( var_0, var_1 );
}

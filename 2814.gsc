// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    var_0 = [];
    var_1 = getentarray( "zipline", "targetname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = scripts\mp\gameobjects::createuseobject( "neutral", var_1[var_2], var_0, ( 0, 0, 0 ) );
        var_3 scripts\mp\gameobjects::allowuse( "any" );
        var_3 scripts\mp\gameobjects::_id_FB08( 0.25 );
        var_3 scripts\mp\gameobjects::_id_FB07( &"MP_ZIPLINE_USE" );
        var_3 scripts\mp\gameobjects::_id_FB06( &"MP_ZIPLINE_USE" );
        var_3 scripts\mp\gameobjects::_id_FB0E( "any" );
        var_3._id_C4CB = ::_id_C4CB;
        var_3._id_C5BB = ::_id_C5BB;
        var_4 = [];
        var_5 = getent( var_1[var_2]._id_0334, "targetname" );

        if ( !isdefined( var_5 ) )
        {

        }

        while ( isdefined( var_5 ) )
        {
            var_4[var_4.size] = var_5;

            if ( isdefined( var_5._id_0334 ) )
            {
                var_5 = getent( var_5._id_0334, "targetname" );
                continue;
            }

            break;
        }

        var_3._id_1157E = var_4;
    }

    precachemodel( "tag_player" );
}

_id_C4CB( var_0 )
{
    var_0 playsound( "scrambler_pullout_lift_plr" );
}

_id_C5BB( var_0 )
{
    var_0 thread _id_13EFA( self );
}

_id_13EFA( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "zipline_drop" );
    level endon( "game_ended" );
    var_1 = spawn( "script_origin", var_0.trigger.origin );
    var_1.origin = var_0.trigger.origin;
    var_1.angles = self.angles;
    var_1 setmodel( "tag_player" );
    self _meth_823D( var_1, "tag_player", 1, 180, 180, 180, 180 );
    thread _id_139E8( var_1 );
    thread _id_13A06( var_1 );
    var_2 = var_0._id_1157E;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = distance( var_1.origin, var_2[var_3].origin ) / 600;
        var_5 = 0.0;

        if ( var_3 == 0 )
            var_5 = var_4 * 0.2;

        var_1 moveto( var_2[var_3].origin, var_4, var_5 );

        if ( var_1.angles != var_2[var_3].angles )
            var_1 rotateto( var_2[var_3].angles, var_4 * 0.8 );

        wait( var_4 );
    }

    self notify( "destination" );
    self unlink();
    var_1 delete();
}

_id_13A06( var_0 )
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "destination" );
    level endon( "game_ended" );
    self notifyonplayercommand( "zipline_drop", "+gostand" );
    self waittill( "zipline_drop" );
    self unlink();
    var_0 delete();
}

_id_139E8( var_0 )
{
    self endon( "disconnect" );
    self endon( "destination" );
    self endon( "zipline_drop" );
    level endon( "game_ended" );
    self waittill( "death" );
    self unlink();
    var_0 delete();
}

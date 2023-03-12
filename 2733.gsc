// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_5B78 = 0;
    game["headicon_allies"] = scripts\mp\teams::_id_81B0( "allies" );
    game["headicon_axis"] = scripts\mp\teams::_id_81B0( "axis" );
    precacheheadicon( game["headicon_allies"] );
    precacheheadicon( game["headicon_axis"] );
    precacheshader( "waypoint_revive" );
    level thread _id_C56E();

    for (;;)
    {
        _id_12E97();
        wait 5;
    }
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread onplayerspawned();
        var_0 thread _id_C577();
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        thread _id_10128();
    }
}

_id_C577()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "killed_player" );
        self._id_016F = "";
    }
}

_id_10128()
{
    if ( level._id_5B78 )
    {
        if ( self.pers["team"] == "allies" )
        {
            self._id_016F = game["headicon_allies"];
            self._id_0170 = "allies";
        }
        else
        {
            self._id_016F = game["headicon_axis"];
            self._id_0170 = "axis";
        }
    }
}

_id_12E97()
{
    var_0 = scripts\mp\utility\game::_id_7F1D( "scr_drawfriend", level._id_5B78 );

    if ( level._id_5B78 != var_0 )
    {
        level._id_5B78 = var_0;
        _id_12E96();
    }
}

_id_12E96()
{
    var_0 = level.players;

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( isdefined( var_2.pers["team"] ) && var_2.pers["team"] != "spectator" && var_2.sessionstate == "playing" )
        {
            if ( level._id_5B78 )
            {
                if ( var_2.pers["team"] == "allies" )
                {
                    var_2._id_016F = game["headicon_allies"];
                    var_2._id_0170 = "allies";
                }
                else
                {
                    var_2._id_016F = game["headicon_axis"];
                    var_2._id_0170 = "axis";
                }

                continue;
            }

            var_0 = level.players;

            for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            {
                var_2 = var_0[var_1];

                if ( isdefined( var_2.pers["team"] ) && var_2.pers["team"] != "spectator" && var_2.sessionstate == "playing" )
                    var_2._id_016F = "";
            }
        }
    }
}

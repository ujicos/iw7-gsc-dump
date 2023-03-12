// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( !isdefined( level._id_5056 ) || level._id_5056 == 0 )
        return;

    if ( !isdefined( game["defcon"] ) )
        game["defcon"] = 4;

    setdvar( "scr_defcon", game["defcon"] );
    level._id_5059[5] = 0;
    level._id_5059[4] = 0;
    level._id_5059[3] = -1;
    level._id_5059[2] = -1;
    level._id_5059[1] = -1;
    level._id_5057[5] = 1;
    level._id_5057[4] = 1;
    level._id_5057[3] = 1;
    level._id_5057[2] = 1;
    level._id_5057[1] = 2;
    _id_12E87( game["defcon"] );
    thread _id_5054();
}

_id_5055( var_0 )
{
    for (;;)
    {
        level waittill( "player_got_killstreak_" + var_0, var_1 );
        level notify( "defcon_killstreak", var_0, var_1 );
    }
}

_id_5054()
{
    level endon( "game_ended" );
    var_0 = 10;
    level thread _id_5055( var_0 );
    level thread _id_5055( var_0 - 1 );
    level thread _id_5055( var_0 - 2 );
    level thread _id_5055( var_0 * 2 );
    level thread _id_5055( var_0 * 2 - 1 );
    level thread _id_5055( var_0 * 2 - 2 );
    level thread _id_5055( var_0 * 3 );
    level thread _id_5055( var_0 * 3 - 1 );
    level thread _id_5055( var_0 * 3 - 2 );

    for (;;)
    {
        level waittill( "defcon_killstreak", var_1, var_2 );

        if ( game["defcon"] <= 1 )
            continue;

        if ( var_1 % var_0 == var_0 - 2 )
        {
            foreach ( var_4 in level.players )
            {
                if ( !isalive( var_4 ) )
                    continue;

                var_4 thread scripts\mp\hud_message::showsplash( "two_from_defcon", undefined, var_2 );
            }

            continue;
        }

        if ( var_1 % var_0 == var_0 - 1 )
        {
            foreach ( var_4 in level.players )
            {
                if ( !isalive( var_4 ) )
                    continue;

                var_4 thread scripts\mp\hud_message::showsplash( "one_from_defcon", undefined, var_2 );
            }

            continue;
        }

        _id_12E87( game["defcon"] - 1, var_2, var_1 );
    }
}

_id_12E87( var_0, var_1, var_2 )
{
    var_0 = int( var_0 );
    var_3 = game["defcon"];
    game["defcon"] = var_0;
    level._id_C2A7 = level._id_5057[var_0];
    setdvar( "scr_defcon", game["defcon"] );

    if ( isdefined( var_1 ) )
        var_1 notify( "changed_defcon" );

    if ( var_0 == var_3 )
        return;

    if ( game["defcon"] == 3 && isdefined( var_1 ) )
    {
        var_1 scripts\mp\killstreaks\killstreaks::_id_8374( "airdrop_mega" );
        var_1 thread scripts\mp\hud_message::showsplash( "caused_defcon", var_2 );
    }

    foreach ( var_5 in level.players )
    {
        if ( isalive( var_5 ) )
        {
            if ( isdefined( var_1 ) )
                var_5 thread scripts\mp\hud_message::showsplash( "changed_defcon", undefined, var_1 );
        }
    }
}

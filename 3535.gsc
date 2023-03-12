// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_E84B( var_0, var_1 )
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    var_2 = self.owner;
    var_3 = level.uavsettings["uav_3dping"];

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    self.equipping_lastpingtime = var_1;

    if ( var_2 scripts\mp\utility\game::_id_12D6( "specialty_equipment_ping" ) )
    {
        for (;;)
        {
            var_4 = 0;

            if ( gettime() >= self.equipping_lastpingtime + 3000 )
            {
                foreach ( var_6 in level.players )
                {
                    if ( !scripts\mp\utility\game::isreallyalive( var_6 ) )
                        continue;

                    if ( !var_2 scripts\mp\utility\game::isenemy( var_6 ) )
                        continue;

                    if ( var_6 scripts\mp\utility\game::_id_12D6( "specialty_engineer" ) )
                        continue;

                    if ( isdefined( var_6._id_C78B ) )
                        continue;

                    var_7 = scripts\engine\utility::_id_2279( level.players, self );

                    if ( isdefined( var_0 ) )
                        var_7 = scripts\engine\utility::_id_2279( var_7, var_0 );

                    var_8 = self.origin + anglestoup( self.angles ) * 10;

                    if ( distance2d( var_6.origin, self.origin ) < 300 && scripts\engine\trace::_id_DCF1( var_8, var_6 gettagorigin( "j_head" ), var_7 ) )
                    {
                        if ( !var_6 scripts\mp\utility\game::_id_12D6( "specialty_gpsjammer" ) )
                            var_2 thread markasrelaysource( var_6 );

                        var_4 = 1;
                    }
                }

                if ( var_4 )
                {
                    if ( !scripts\mp\utility\game::istrue( self.eyespyalerted ) )
                    {
                        var_2 scripts\mp\missions::_id_D991( "ch_trait_eye_spy" );
                        self.eyespyalerted = 1;
                    }

                    playfxontagforclients( var_3._id_7636, self, "tag_origin", var_2 );
                    self playsoundtoplayer( "ghost_senses_ping", var_2 );
                    triggerportableradarping( self.origin, var_2, 400, 800 );
                    wait 3;
                }
            }

            scripts\engine\utility::waitframe();
        }
    }
}

_id_B369( var_0, var_1 )
{
    var_0 endon( "death" );
    var_0 endon( "disconnect" );

    if ( !isdefined( var_0 ) || !scripts\mp\utility\game::isreallyalive( var_0 ) )
        return;

    thread markasrelaysource( var_0 );
    var_2 = scripts\mp\objidpoolmanager::requestminimapid( 10 );

    if ( var_2 == -1 )
        return;

    scripts\mp\objidpoolmanager::minimap_objective_add( var_2, "active", var_1.origin, "cb_compassping_eqp_ping", "icon_large" );
    scripts\mp\objidpoolmanager::minimap_objective_player( var_2, self getentitynumber() );
    var_0 thread _id_13A35( var_2 );
    wait 3;
    scripts\mp\objidpoolmanager::returnminimapid( var_2 );
}

_id_13A35( var_0 )
{
    scripts\engine\utility::waittill_any( "death", "disconnect" );
    scripts\mp\objidpoolmanager::returnminimapid( var_0 );
}

markasrelaysource( var_0 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    var_1 = var_0 getentitynumber();

    if ( !isdefined( self.relaysource ) )
        self.relaysource = [];
    else if ( isdefined( self.relaysource[var_1] ) )
    {
        self notify( "markAsRelaySource" );
        self endon( "markAsRelaySource" );
    }

    self.relaysource[var_1] = 1;
    var_0 scripts\engine\utility::_id_13736( 10, "death", "disconnect" );
    self.relaysource[var_1] = 0;
}

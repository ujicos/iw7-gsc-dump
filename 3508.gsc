// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( !isdefined( level._id_CC09 ) )
        level._id_CC09 = [];
}

_id_838E( var_0, var_1 )
{
    var_2 = _id_49FC( var_0 );
    _id_E152();
    self._id_3AA0 = var_2;
    var_3 = _id_C4CA( var_0, var_2, 1, var_1 );
    self._id_3AA0 = undefined;
    _id_E2E0();
    return isdefined( var_2 );
}

_id_49FC( var_0 )
{
    if ( isdefined( self._id_9D81 ) && self._id_9D81 )
        return;

    var_1 = level._id_CC09[var_0];
    var_2 = spawn( "script_model", self.origin );
    var_2 setmodel( var_1._id_B91A );
    var_2.angles = self.angles;
    var_2.owner = self;
    var_2.team = self.team;
    var_2._id_451C = var_1;
    var_2._id_6DEC = 1;

    if ( isdefined( var_1._id_C4DE ) )
        var_2 [[ var_1._id_C4DE ]]( var_0 );

    var_2 _id_4DA6( var_0 );
    var_2 thread _id_11901( var_0 );
    var_2 thread _id_89FA( var_0 );
    var_2 thread _id_C547( var_0 );
    var_2 thread _id_C533( var_0 );
    var_2 thread _id_4988( var_0 );
    return var_2;
}

_id_89FA( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );

    for (;;)
    {
        self waittill( "trigger", var_1 );

        if ( !scripts\mp\utility\game::isreallyalive( var_1 ) )
            continue;

        if ( isdefined( self _meth_8138() ) )
            self unlink();

        var_1 _id_C4CA( var_0, self, 0 );
    }
}

_id_C4CA( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    self endon( "disconnect" );
    var_1 thread _id_C4D5( var_0, self );
    scripts\engine\utility::_id_1C71( 0 );

    if ( !isai( self ) )
    {
        self notifyonplayercommand( "placePlaceable", "+attack" );
        self notifyonplayercommand( "placePlaceable", "+attack_akimbo_accessible" );
        self notifyonplayercommand( "cancelPlaceable", "+actionslot 4" );

        if ( !level._id_4542 )
        {
            self notifyonplayercommand( "cancelPlaceable", "+actionslot 5" );
            self notifyonplayercommand( "cancelPlaceable", "+actionslot 6" );
            self notifyonplayercommand( "cancelPlaceable", "+actionslot 7" );
        }
    }

    for (;;)
    {
        if ( isdefined( var_3 ) && var_3 == 1 && !self isonladder() && self isonground() && !self _meth_81AD() )
            var_4 = "placePlaceable";
        else
            var_4 = scripts\engine\utility::_id_13734( "placePlaceable", "cancelPlaceable", "force_cancel_placement" );

        if ( !isdefined( var_1 ) )
        {
            scripts\engine\utility::_id_1C71( 1 );
            return 1;
        }
        else if ( var_4 == "cancelPlaceable" && var_2 || var_4 == "force_cancel_placement" )
        {
            var_1 _id_C4D2( var_0, var_4 == "force_cancel_placement" && !isdefined( var_1._id_6DEC ) );
            return 0;
        }
        else if ( var_1._id_3872 )
        {
            var_1 thread _id_C56B( var_0 );
            scripts\engine\utility::_id_1C71( 1 );
            return 1;
        }
        else
            wait 0.05;
    }
}

_id_C4D2( var_0, var_1 )
{
    if ( isdefined( self._id_3A9D ) )
    {
        var_2 = self._id_3A9D;
        var_2 _meth_80F3();
        var_2._id_9D81 = undefined;
        var_2._id_3AA0 = undefined;
        var_2 scripts\engine\utility::_id_1C71( 1 );
    }

    if ( isdefined( self._id_2C68 ) )
        self._id_2C68 delete();

    if ( isdefined( self._id_3AA2 ) )
        self._id_3AA2 delete();

    var_3 = level._id_CC09[var_0];

    if ( isdefined( var_3._id_C4D3 ) )
        self [[ var_3._id_C4D3 ]]( var_0 );

    if ( isdefined( var_1 ) && var_1 )
        scripts\mp\weapons::_id_66A8();

    self delete();
}

_id_C56B( var_0 )
{
    var_1 = level._id_CC09[var_0];
    self.origin = self._id_CC24;
    self.angles = self._id_3AA2.angles;
    self playsound( var_1._id_CC15 );
    _id_10146( var_0 );

    if ( isdefined( var_1._id_C56C ) )
        self [[ var_1._id_C56C ]]( var_0 );

    self setcursorhint( "HINT_NOICON" );
    self sethintstring( var_1._id_017B );
    var_2 = self.owner;
    var_2 _meth_80F3();
    var_2._id_9D81 = undefined;
    self._id_3A9D = undefined;
    self._id_9EE4 = 1;
    self._id_6DEC = undefined;

    if ( isdefined( var_1._id_8C79 ) )
    {
        if ( level.teambased )
            scripts\mp\entityheadicons::_id_F877( self.team, ( 0, 0, var_1._id_8C79 ) );
        else
            scripts\mp\entityheadicons::_id_F7F2( var_2, ( 0, 0, var_1._id_8C79 ) );
    }

    thread _id_898C( var_0 );
    thread _id_898E( var_0 );
    self makeusable();
    scripts\mp\sentientpoolmanager::registersentient( "Killstreak_Ground", self.owner );

    foreach ( var_4 in level.players )
    {
        if ( var_4 == var_2 )
        {
            self enableplayeruse( var_4 );
            continue;
        }

        self disableplayeruse( var_4 );
    }

    if ( isdefined( self._id_10085 ) )
    {
        level thread scripts\mp\utility\game::_id_115DE( var_1._id_10A38, var_2 );
        self._id_10085 = 0;
    }

    var_6 = spawnstruct();
    var_6._id_AD39 = self._id_BD3B;
    var_6._id_CF14 = 1;
    var_6._id_6371 = "carried";

    if ( isdefined( var_1._id_C55B ) )
        var_6._id_4E53 = var_1._id_C55B;

    thread scripts\mp\movers::_id_892F( var_6 );
    thread _id_13AFA();
    self notify( "placed" );
    self._id_3AA2 delete();
    self._id_3AA2 = undefined;
}

_id_C4D5( var_0, var_1 )
{
    var_2 = level._id_CC09[var_0];
    self._id_3AA2 = var_1 _id_4992( var_0 );
    self._id_9EE4 = undefined;
    self._id_3A9D = var_1;
    var_1._id_9D81 = 1;
    _id_4DA6( var_0 );
    _id_8ED4( var_0 );

    if ( isdefined( var_2._id_C4D6 ) )
        self [[ var_2._id_C4D6 ]]( var_0 );

    thread _id_12EEC( var_0, var_1 );
    thread _id_C4D7( var_0, var_1 );
    self notify( "carried" );
}

_id_12EEC( var_0, var_1 )
{
    var_1 endon( "death" );
    var_1 endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "placed" );
    self endon( "death" );
    self._id_3872 = 1;
    var_2 = -1;
    var_3 = level._id_CC09[var_0];
    var_4 = ( 0, 0, 0 );

    if ( isdefined( var_3._id_CC23 ) )
        var_4 = ( 0, 0, var_3._id_CC23 );

    var_5 = self._id_3AA2;

    for (;;)
    {
        var_6 = var_1 canplayerplacesentry( 1, var_3._id_CC25 );
        self._id_CC24 = var_6["origin"];
        var_5.origin = self._id_CC24 + var_4;
        var_5.angles = var_6["angles"];
        self._id_3872 = var_1 isonground() && var_6["result"] && abs( self._id_CC24[2] - var_1.origin[2] ) < var_3._id_CC22;

        if ( isdefined( var_6["entity"] ) )
            self._id_BD3B = var_6["entity"];
        else
            self._id_BD3B = undefined;

        if ( self._id_3872 != var_2 )
        {
            if ( self._id_3872 )
            {
                var_5 setmodel( var_3._id_B924 );
                var_1 _meth_80F4( var_3._id_CC28 );
            }
            else
            {
                var_5 setmodel( var_3._id_B925 );
                var_1 _meth_80F4( var_3._id_38E3 );
            }
        }

        var_2 = self._id_3872;
        wait 0.05;
    }
}

_id_4DA6( var_0 )
{
    self makeunusable();
    _id_8EC3();
    var_1 = level._id_CC09[var_0];

    if ( isdefined( var_1._id_C4E7 ) )
        self [[ var_1._id_C4E7 ]]( var_0 );
}

_id_8EC3()
{
    if ( level.teambased )
        scripts\mp\entityheadicons::_id_F877( "none", ( 0, 0, 0 ) );
    else if ( isdefined( self.owner ) )
        scripts\mp\entityheadicons::_id_F7F2( undefined, ( 0, 0, 0 ) );
}

_id_898C( var_0 )
{
    self endon( "carried" );
    var_1 = level._id_CC09[var_0];
    scripts\mp\damage::monitordamage( var_1.maxhealth, var_1._id_4D4A, ::_id_898F, ::_id_B938, 1 );
}

_id_B938( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;
    var_6 = self._id_451C;

    if ( isdefined( var_6._id_1C9D ) && var_6._id_1C9D )
        var_5 = scripts\mp\damage::_id_89C3( var_1, var_2, var_5 );

    if ( isdefined( var_6._id_1C8F ) && var_6._id_1C8F )
        var_5 = scripts\mp\damage::_id_8999( var_1, var_2, var_5 );

    var_5 = scripts\mp\damage::_id_89C6( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_89AC( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8975( var_1, var_2, var_5 );

    if ( isdefined( var_6._id_B938 ) )
        var_5 = self [[ var_6._id_B938 ]]( var_1, var_2, var_5 );

    return var_5;
}

_id_898F( var_0, var_1, var_2, var_3 )
{
    var_4 = self._id_451C;
    var_5 = scripts\mp\damage::onkillstreakkilled( self._id_110EA, var_0, var_1, var_2, var_3, var_4._id_EC44, var_4._id_52DA );

    if ( var_5 && isdefined( var_4._id_C4F3 ) )
        self [[ var_4._id_C4F3 ]]( self._id_110EA, var_0, self.owner, var_2 );
}

_id_898E( var_0 )
{
    self endon( "carried" );
    self waittill( "death" );
    var_1 = level._id_CC09[var_0];

    if ( isdefined( self ) )
    {
        _id_4DA6( var_0 );

        if ( isdefined( var_1._id_B91D ) )
            self setmodel( var_1._id_B91D );

        if ( isdefined( var_1._id_C4EB ) )
            self [[ var_1._id_C4EB ]]( var_0 );

        self delete();
    }
}

_id_C4D7( var_0, var_1 )
{
    self endon( "placed" );
    self endon( "death" );
    var_1 endon( "disconnect" );
    var_1 waittill( "death" );

    if ( self._id_3872 )
        thread _id_C56B( var_0 );
    else
        _id_C4D2( var_0 );
}

_id_C547( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    self.owner waittill( "killstreak_disowned" );
    _id_4045( var_0 );
}

_id_C533( var_0 )
{
    self endon( "death" );
    level waittill( "game_ended" );
    _id_4045( var_0 );
}

_id_4045( var_0 )
{
    if ( isdefined( self._id_9EE4 ) )
        self notify( "death" );
    else
        _id_C4D2( var_0 );
}

_id_13AFA()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        thread _id_C570( var_0 );
    }
}

_id_C570( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 waittill( "spawned_player" );
    self disableplayeruse( var_0 );
}

_id_11901( var_0 )
{
    self endon( "death" );
    level endon( "game_ended" );
    var_1 = level._id_CC09[var_0];
    var_2 = var_1._id_AC71;

    while ( var_2 > 0.0 )
    {
        wait 1.0;
        scripts\mp\hostmigration::waittillhostmigrationdone();

        if ( !isdefined( self._id_3A9D ) )
            var_2 -= 1.0;
    }

    if ( isdefined( self.owner ) && isdefined( var_1._id_844E ) )
        self.owner thread scripts\mp\utility\game::leaderdialogonplayer( var_1._id_844E );

    self notify( "death" );
}

_id_E18E()
{
    if ( self hasweapon( "iw6_riotshield_mp" ) )
    {
        self._id_E2E6 = "iw6_riotshield_mp";
        scripts\mp\utility\game::_id_141E( "iw6_riotshield_mp" );
    }
}

_id_E152()
{
    if ( scripts\mp\utility\game::_id_12D6( "specialty_explosivebullets" ) )
    {
        self._id_E2DF = "specialty_explosivebullets";
        scripts\mp\utility\game::_id_E150( "specialty_explosivebullets" );
    }
}

_id_E2E8()
{
    if ( isdefined( self._id_E2E6 ) )
    {
        scripts\mp\utility\game::_id_12C6( self._id_E2E6 );
        self._id_E2E6 = undefined;
    }
}

_id_E2E0()
{
    if ( isdefined( self._id_E2DF ) )
    {
        scripts\mp\utility\game::giveperk( self._id_E2DF );
        self._id_E2DF = undefined;
    }
}

_id_4988( var_0 )
{
    var_1 = level._id_CC09[var_0];

    if ( isdefined( var_1._id_B91C ) )
    {
        var_2 = spawn( "script_model", self.origin );
        var_2.angles = self.angles;
        var_2 hide();
        var_2 thread scripts\mp\weapons::_id_2C69( self.owner );
        var_2 setmodel( var_1._id_B91C );
        var_2 linkto( self );
        var_2 _meth_82C7( 0 );
        self._id_2C68 = var_2;
        self waittill( "death" );

        if ( isdefined( var_2 ) )
        {
            var_2 delete();
            self._id_2C68 = undefined;
        }
    }
}

_id_10146( var_0 )
{
    self show();

    if ( isdefined( self._id_2C68 ) )
    {
        self._id_2C68 show();
        level notify( "update_bombsquad" );
    }
}

_id_8ED4( var_0 )
{
    self hide();

    if ( isdefined( self._id_2C68 ) )
        self._id_2C68 hide();
}

_id_4992( var_0 )
{
    if ( isdefined( self._id_9D81 ) && self._id_9D81 )
        return;

    var_1 = spawnturret( "misc_turret", self.origin + ( 0, 0, 25 ), "sentry_minigun_mp" );
    var_1.angles = self.angles;
    var_1.owner = self;
    var_2 = level._id_CC09[var_0];
    var_1 setmodel( var_2._id_B91A );
    var_1 maketurretinoperable();
    var_1 _meth_835B( 1 );
    var_1 _meth_830F( "sentry_offline" );
    var_1 makeunusable();
    var_1 _meth_8336( self );
    var_1 _meth_8335( self );
    var_1 setcandamage( 0 );
    var_1 _meth_82C7( 0 );
    return var_1;
}

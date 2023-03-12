// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    if ( !isdefined( level._id_2F30 ) )
        level._id_2F30 = [];
}

_id_2A63( var_0, var_1, var_2, var_3 )
{
    thread _id_139EB( var_1, var_0, var_2, var_3 );
    return 1;
}

_id_139EB( var_0, var_1, var_2, var_3 )
{
    self endon( "spawned_player" );
    self endon( "disconnect" );

    if ( !isdefined( var_2 ) )
        return;

    if ( !isdefined( var_3 ) )
        return;

    if ( !scripts\mp\utility\game::isreallyalive( self ) )
        var_2 delete();

    var_2 _meth_81EF( 1 );
    self notify( "deployable_deployed" );
    var_2.owner = self;
    var_2.weaponname = var_3;
    self._id_B377 = var_2;

    if ( _id_9E19( var_0 ) )
    {
        self thread [[ level._id_2F30[var_0]._id_85E7 ]]( var_2 );
        return;
    }

    var_2 playsoundtoplayer( level._id_2F30[var_0]._id_5230, self );
    var_2 thread _id_B378( var_1, var_0, ::_id_2F22 );
}

_id_C80D( var_0 )
{
    self notify( "death" );
}

_id_B378( var_0, var_1, var_2 )
{
    self notify( "markerActivate" );
    self endon( "markerActivate" );
    self waittill( "missile_stuck" );
    var_3 = self.owner;
    var_4 = self.origin;

    if ( !isdefined( var_3 ) )
        return;

    var_5 = _id_498B( var_1, var_4, var_3 );
    var_6 = spawnstruct();
    var_6._id_AD39 = self _meth_8138();

    if ( isdefined( var_6._id_AD39 ) && isdefined( var_6._id_AD39._id_01F1 ) && var_6._id_AD39._id_01F1 != "" )
    {
        var_5.origin = var_6._id_AD39.origin;
        var_7 = var_6._id_AD39 _meth_8138();

        if ( isdefined( var_7 ) )
            var_6._id_AD39 = var_7;
        else
            var_6._id_AD39 = undefined;
    }

    var_6._id_4E53 = ::_id_C80D;
    var_5 thread scripts\mp\movers::_id_892F( var_6 );
    var_5._id_BD3B = var_6._id_AD39;
    var_5 _meth_831F( var_3 );
    wait 0.05;
    var_5 thread [[ var_2 ]]();
    self delete();

    if ( isdefined( var_5 ) && var_5 scripts\mp\utility\game::_id_11A42() )
        var_5 notify( "death" );
}

_id_5225( var_0 )
{
    if ( var_0 == "mp_satcom" )
        return 1;
    else if ( issubstr( var_0, "paris_catacombs_iron" ) )
        return 1;
    else if ( issubstr( var_0, "mp_warhawk_iron_gate" ) )
        return 1;

    return 0;
}

_id_9E32()
{
    var_0 = self getcurrentweapon();

    if ( isdefined( var_0 ) )
    {
        foreach ( var_2 in level._id_2F30 )
        {
            if ( var_0 == var_2._id_039B )
                return 1;
        }
    }

    return 0;
}

_id_498B( var_0, var_1, var_2 )
{
    var_3 = level._id_2F30[var_0];
    var_4 = spawn( "script_model", var_1 - ( 0, 0, 1 ) );
    var_4 setmodel( var_3._id_B91A );
    var_4.health = 999999;
    var_4.maxhealth = var_3.maxhealth;
    var_4.angles = var_2.angles;
    var_4.boxtype = var_0;
    var_4.owner = var_2;
    var_4.team = var_2.team;
    var_4._id_92B8 = var_3._id_92B8;

    if ( isdefined( var_3._id_5B0C ) )
        var_4._id_5B0C = var_3._id_5B0C;

    if ( isdefined( var_3._id_B4D1 ) )
        var_4._id_130DC = var_3._id_B4D1;

    var_4 _id_2F24();
    var_4 thread _id_2F1C();
    var_4 _id_17AF();
    return var_4;
}

_id_2F22( var_0 )
{
    self setcursorhint( "HINT_NOICON" );
    var_1 = level._id_2F30[self.boxtype];
    self sethintstring( var_1._id_017B );
    self._id_9B04 = 0;
    var_2 = scripts\mp\objidpoolmanager::requestminimapid( 1 );

    if ( var_2 != -1 )
    {
        scripts\mp\objidpoolmanager::minimap_objective_add( var_2, "invisible", ( 0, 0, 0 ) );

        if ( !isdefined( self _meth_8138() ) )
            scripts\mp\objidpoolmanager::minimap_objective_position( var_2, self.origin );
        else
            scripts\mp\objidpoolmanager::minimap_objective_onentity( var_2, self );

        scripts\mp\objidpoolmanager::minimap_objective_state( var_2, "active" );
        scripts\mp\objidpoolmanager::minimap_objective_icon( var_2, var_1._id_FC47 );
    }

    self._id_C2BB = var_2;

    if ( level.teambased )
    {
        if ( var_2 != -1 )
            scripts\mp\objidpoolmanager::minimap_objective_team( var_2, self.team );

        foreach ( var_4 in level.players )
        {
            if ( self.team == var_4.team && ( !isdefined( var_1._id_3936 ) || var_4 [[ var_1._id_3936 ]]( self ) ) )
                _id_2F23( var_4, var_1._id_110EA, var_1._id_8C7A );
        }
    }
    else
    {
        if ( var_2 != -1 )
            scripts\mp\objidpoolmanager::minimap_objective_player( var_2, self.owner getentitynumber() );

        if ( !isdefined( var_1._id_3936 ) || self.owner [[ var_1._id_3936 ]]( self ) )
            _id_2F23( self.owner, var_1._id_110EA, var_1._id_8C7A );
    }

    self makeusable();
    self._id_9FBF = 1;
    self setcandamage( 1 );
    thread _id_2F19();
    thread _id_2F1A();
    thread _id_2F26();
    thread _id_561E();

    if ( issentient( self ) )
        self setthreatbiasgroup( "DogsDontAttack" );

    if ( isdefined( self.owner ) )
        self.owner notify( "new_deployable_box", self );

    if ( level.teambased )
    {
        foreach ( var_4 in level._id_C928 )
        {
            _id_119B( var_4, self.team == var_4.team, var_1._id_3936 );

            if ( !isai( var_4 ) )
                thread _id_2F21( var_4 );
        }
    }
    else
    {
        foreach ( var_4 in level._id_C928 )
            _id_119B( var_4, isdefined( self.owner ) && self.owner == var_4, var_1._id_3936 );
    }

    thread _id_2F20();
    thread _id_2F14();

    if ( isdefined( var_1._id_C4F0 ) )
        self [[ var_1._id_C4F0 ]]( var_1 );

    thread _id_4988( self.boxtype );
}

_id_119B( var_0, var_1, var_2 )
{
    if ( var_1 )
    {
        if ( !isdefined( var_2 ) || var_0 [[ var_2 ]]( self ) )
            _id_2F18( var_0 );
        else
        {
            _id_2F15( var_0 );
            thread _id_5ADE( var_0 );
        }

        thread _id_2F31( var_0 );
    }
    else
        _id_2F15( var_0 );
}

_id_2F20()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "connected", var_0 );
        childthread _id_2F27( var_0 );
    }
}

_id_2F14()
{
    self endon( "death" );

    for (;;)
    {
        level waittill( "spawned_agent_player", var_0 );
        _id_2F13( var_0 );
    }
}

_id_2F27( var_0 )
{
    var_0 waittill( "spawned_player" );

    if ( level.teambased )
    {
        _id_2F13( var_0 );
        thread _id_2F21( var_0 );
    }
}

_id_2F21( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );

    for (;;)
    {
        var_0 waittill( "joined_team" );

        if ( level.teambased )
            _id_2F13( var_0 );
    }
}

_id_2F13( var_0 )
{
    if ( self.team == var_0.team )
    {
        _id_2F18( var_0 );
        thread _id_2F31( var_0 );
        _id_2F23( var_0, level._id_2F30[self.boxtype]._id_110EA, level._id_2F30[self.boxtype]._id_8C7A );
    }
    else
    {
        _id_2F15( var_0 );
        scripts\mp\entityheadicons::_id_F73D( var_0, "", ( 0, 0, 0 ) );
    }
}

_id_2F23( var_0, var_1, var_2 )
{
    scripts\mp\entityheadicons::_id_F73D( var_0, scripts\mp\utility\game::_id_7F49( var_1 ), ( 0, 0, var_2 ), 14, 14, undefined, undefined, undefined, undefined, undefined, 0 );
}

_id_2F18( var_0 )
{
    if ( isplayer( var_0 ) )
        self enableplayeruse( var_0 );

    self._id_55BC[var_0 getentitynumber()] = 0;
}

_id_2F15( var_0 )
{
    if ( isplayer( var_0 ) )
        self disableplayeruse( var_0 );

    self._id_55BC[var_0 getentitynumber()] = 1;
}

_id_2F24()
{
    self makeunusable();
    self._id_9FBF = 0;
    scripts\mp\entityheadicons::_id_F73D( "none", "", ( 0, 0, 0 ) );

    if ( isdefined( self._id_C2BB ) )
        scripts\mp\objidpoolmanager::returnminimapid( self._id_C2BB );
}

_id_2F19()
{
    var_0 = level._id_2F30[self.boxtype];
    scripts\mp\damage::monitordamage( var_0.maxhealth, var_0._id_4D4A, ::_id_2F1B, ::_id_2F1F, 1 );
}

_id_2F1F( var_0, var_1, var_2, var_3, var_4 )
{
    var_5 = var_3;
    var_6 = level._id_2F30[self.boxtype];

    if ( var_6._id_1C9D )
        var_5 = scripts\mp\damage::_id_89C3( var_1, var_2, var_5 );

    var_5 = scripts\mp\damage::_id_89C6( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_89AC( var_1, var_2, var_5 );
    var_5 = scripts\mp\damage::_id_8975( var_1, var_2, var_5 );
    return var_5;
}

_id_2F1B( var_0, var_1, var_2, var_3 )
{
    var_4 = level._id_2F30[self.boxtype];
    var_5 = scripts\mp\damage::onkillstreakkilled( "deployable_ammo", var_0, var_1, var_2, var_3, var_4._id_EC44, var_4._id_13523 );

    if ( var_5 )
        var_0 notify( "destroyed_equipment" );
}

_id_2F1A()
{
    self waittill( "death" );

    if ( !isdefined( self ) )
        return;

    _id_2F24();
    _id_E0DA();
    var_0 = level._id_2F30[self.boxtype];
    playfx( var_0._id_4E74, self.origin );
    self playsound( "mp_killstreak_disappear" );

    if ( isdefined( var_0._id_4E3A ) )
    {
        var_1 = undefined;

        if ( isdefined( self.owner ) )
            var_1 = self.owner;

        radiusdamage( self.origin + ( 0, 0, var_0._id_8C7A ), var_0._id_4E3C, var_0._id_4E3A, var_0._id_4E3B, var_1, "MOD_EXPLOSIVE", var_0._id_4E76 );
    }

    self notify( "deleting" );
    self delete();
}

_id_2F1C()
{
    self endon( "death" );
    level endon( "game_ended" );
    self notify( "box_handleOwner" );
    self endon( "box_handleOwner" );
    self.owner waittill( "killstreak_disowned" );
    self notify( "death" );
}

_id_2F31( var_0 )
{
    self endon( "death" );
    thread _id_2F28( var_0 );

    if ( !isdefined( var_0._id_2F2B ) )
        var_0._id_2F2B = [];

    var_0._id_2F2B[var_0._id_2F2B.size] = self;
    var_1 = level._id_2F30[self.boxtype];

    for (;;)
    {
        self waittill( "captured", var_2 );

        if ( var_2 == var_0 )
        {
            var_0 playlocalsound( var_1._id_C5C7 );

            if ( isdefined( var_1._id_C5BC ) )
                var_0 [[ var_1._id_C5BC ]]( self );

            if ( isdefined( self.owner ) && var_0 != self.owner )
                self.owner thread scripts\mp\utility\game::_id_83B4( "support", undefined, var_1._id_130FC );

            if ( isdefined( self._id_130DC ) )
            {
                self._id_130DC--;

                if ( self._id_130DC == 0 )
                {
                    _id_2F1D();
                    break;
                }
            }

            if ( isdefined( var_1._id_393B ) && var_1._id_393B )
            {
                foreach ( var_4 in level._id_5212[var_1._id_110EA] )
                {
                    var_4 _id_2F15( self );
                    var_4 scripts\mp\entityheadicons::_id_F73D( self, "", ( 0, 0, 0 ) );
                    var_4 thread _id_5ADE( self );
                }

                continue;
            }

            scripts\mp\entityheadicons::_id_F73D( var_0, "", ( 0, 0, 0 ) );
            _id_2F15( var_0 );
            thread _id_5ADE( var_0 );
        }
    }
}

_id_5ADE( var_0 )
{
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 waittill( "death" );

    if ( level.teambased )
    {
        if ( self.team == var_0.team )
        {
            _id_2F23( var_0, level._id_2F30[self.boxtype]._id_110EA, level._id_2F30[self.boxtype]._id_8C7A );
            _id_2F18( var_0 );
        }
    }
    else if ( isdefined( self.owner ) && self.owner == var_0 )
    {
        _id_2F23( var_0, level._id_2F30[self.boxtype]._id_110EA, level._id_2F30[self.boxtype]._id_8C7A );
        _id_2F18( var_0 );
    }
}

_id_2F28( var_0 )
{
    level endon( "game_ended" );

    while ( isdefined( self ) )
    {
        self waittill( "trigger", var_1 );

        if ( isdefined( level._id_2F30[self.boxtype]._id_C18C ) && level._id_2F30[self.boxtype]._id_C18C && scripts\mp\utility\game::_id_9E6C( var_0 getcurrentweapon() ) )
            continue;

        if ( var_1 == var_0 && _id_13093( var_0, level._id_2F30[self.boxtype]._id_130EE ) )
            self notify( "captured", var_0 );
    }
}

_id_9E08( var_0 )
{
    return level.teambased && self.team == var_0.team;
}

_id_2F26()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_0 = level._id_2F30[self.boxtype];
    var_1 = var_0._id_AC71;
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( var_1 );

    if ( isdefined( var_0._id_13524 ) )
        self.owner thread scripts\mp\utility\game::leaderdialogonplayer( var_0._id_13524 );

    _id_2F1D();
}

_id_2F1D()
{
    wait 0.05;
    self notify( "death" );
}

_id_51C5( var_0 )
{
    wait 0.25;
    self linkto( var_0, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    var_0 waittill( "death" );
    _id_2F1D();
}

_id_2F1E( var_0 )
{
    self endon( "death" );
    self hide();

    foreach ( var_2 in level.players )
    {
        if ( var_2.team == var_0 )
            self _meth_8388( var_2 );
    }

    for (;;)
    {
        level waittill( "joined_team" );
        self hide();

        foreach ( var_2 in level.players )
        {
            if ( var_2.team == var_0 )
                self _meth_8388( var_2 );
        }
    }
}

_id_13093( var_0, var_1 )
{
    scripts\mp\movers::_id_EE3E( var_0 );
    var_0 scripts\engine\utility::_id_1C71( 0 );
    var_0._id_2F2F = spawnstruct();
    var_0._id_2F2F._id_4B30 = 0;
    var_0._id_2F2F._id_9B04 = 1;
    var_0._id_2F2F._id_130C7 = 0;
    var_0._id_2F2F._id_92B8 = self._id_92B8;

    if ( isdefined( var_1 ) )
        var_0._id_2F2F._id_130EE = var_1;
    else
        var_0._id_2F2F._id_130EE = 3000;

    var_2 = _id_13094( var_0 );

    if ( isalive( var_0 ) )
    {
        var_0 scripts\engine\utility::_id_1C71( 1 );
        scripts\mp\movers::_id_EE4D( var_0 );
    }

    if ( !isdefined( self ) )
        return 0;

    var_0._id_2F2F._id_9B04 = 0;
    var_0._id_2F2F._id_4B30 = 0;
    return var_2;
}

_id_13094( var_0 )
{
    var_1 = var_0._id_2F2F;

    while ( var_0 _id_9EFD( var_1 ) )
    {
        if ( !var_0 scripts\mp\movers::_id_EE4E( self ) )
        {
            var_0 scripts\mp\gameobjects::_id_12F53( var_1, 0 );
            return 0;
        }

        var_1._id_4B30 += 50 * var_1._id_130C7;

        if ( isdefined( var_0._id_C2AD ) )
            var_1._id_130C7 = 1 * var_0._id_C2AD;
        else
            var_1._id_130C7 = 1;

        var_0 scripts\mp\gameobjects::_id_12F53( var_1, 1 );

        if ( var_1._id_4B30 >= var_1._id_130EE )
        {
            var_0 scripts\mp\gameobjects::_id_12F53( var_1, 0 );
            return scripts\mp\utility\game::isreallyalive( var_0 );
        }

        wait 0.05;
    }

    var_0 scripts\mp\gameobjects::_id_12F53( var_1, 0 );
    return 0;
}

_id_561E()
{
    level endon( "game_ended" );
    self endon( "death" );

    for (;;)
    {
        level waittill( "juggernaut_equipped", var_0 );
        scripts\mp\entityheadicons::_id_F73D( var_0, "", ( 0, 0, 0 ) );
        _id_2F15( var_0 );
        thread _id_5ADE( var_0 );
    }
}

_id_17AF()
{
    level._id_5212[self.boxtype][self getentitynumber()] = self;
}

_id_E0DA()
{
    level._id_5212[self.boxtype][self getentitynumber()] = undefined;
}

_id_4988( var_0 )
{
    var_1 = level._id_2F30[var_0];

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

_id_9EFD( var_0 )
{
    return !level._id_7669 && isdefined( var_0 ) && scripts\mp\utility\game::isreallyalive( self ) && self usebuttonpressed() && !self isonladder() && !self meleebuttonpressed() && var_0._id_4B30 < var_0._id_130EE && ( !isdefined( self._id_1165E ) || !self._id_1165E );
}

_id_9E19( var_0 )
{
    var_1 = 0;

    switch ( var_0 )
    {
        case "deployable_adrenaline_mist":
        case "deployable_speed_strip":
            var_1 = 1;
            break;
        default:
            var_1 = 0;
            break;
    }

    return var_1;
}

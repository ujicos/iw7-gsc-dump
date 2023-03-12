// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    _id_97D5();
    level thread _id_C56E();
    level.givemidmatchawardfunc = ::givemidmatchaward;
}

_id_C56E()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread onplayerspawned();
        var_0 thread initaarawardlist();
        var_0._id_26D7 = [];
    }
}

onplayerspawned()
{
    self endon( "disconnect" );

    for (;;)
    {
        self waittill( "spawned_player" );
        self._id_26D9 = [];
    }
}

_id_97D5()
{
    _id_989C();
}

_id_97D7( var_0, var_1 )
{
    level._id_26D8[var_0] = spawnstruct();
    level._id_26D8[var_0].type = var_1;
    var_2 = tablelookup( "mp/awardtable.csv", 1, var_0, 10 );

    if ( isdefined( var_2 ) && var_2 != "" )
        level._id_26D8[var_0]._id_13E28 = var_2;

    var_3 = tablelookup( "mp/awardtable.csv", 1, var_0, 11 );

    if ( isdefined( var_3 ) && var_3 != "" )
        level._id_26D8[var_0]._id_7681 = var_3;

    var_4 = tablelookup( "mp/awardtable.csv", 1, var_0, 3 );

    if ( isdefined( var_4 ) && var_4 != "" )
        level._id_26D8[var_0]._id_3B95 = var_4;

    var_5 = tablelookup( "mp/awardtable.csv", 1, var_0, 7 );

    if ( isdefined( var_5 ) && var_5 != "" )
    {
        var_6 = randomfloat( 1.0 );
        level._id_26D8[var_0].aarpriority = float( var_5 ) + var_6;
    }
}

_id_97D8( var_0, var_1 )
{
    _id_97D7( var_0, var_1 );
}

_id_989B( var_0 )
{
    _id_97D8( var_0, "midmatch" );
}

_id_989C()
{
    var_0 = 0;

    for (;;)
    {
        var_1 = tablelookupbyrow( "mp/awardtable.csv", var_0, 1 );

        if ( !isdefined( var_1 ) || var_1 == "" )
            break;

        var_2 = tablelookupbyrow( "mp/awardtable.csv", var_0, 9 );

        if ( isdefined( var_2 ) && var_2 != "" )
            _id_989B( var_1 );

        level._id_26D8[var_1]._id_92B8 = var_0;
        var_0++;
    }
}

_id_93E0( var_0 )
{
    var_1 = self getrankedplayerdata( "common", "awards", var_0 );
    self setrankedplayerdata( "common", "awards", var_0, var_1 + 1 );
}

_id_8352( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_26D8[var_0] ) )
        return;

    if ( !isenumvaluevalid( "mp", "Awards", var_0 ) )
        return;

    _id_93E0( var_0 );
    addawardtoaarlist( var_0 );
    var_3 = level._id_26D8[var_0]._id_13E28;

    if ( isdefined( var_3 ) )
    {
        if ( isdefined( var_2 ) )
            var_4 = var_2;
        else
            var_4 = scripts\mp\rank::getscoreinfovalue( var_3 );

        scripts\mp\rank::_id_839A( var_3, var_4 );
    }

    var_5 = level._id_26D8[var_0]._id_7681;

    if ( isdefined( var_5 ) )
        scripts\mp\utility\game::_id_83B4( var_5, undefined, var_1, undefined, undefined, 1 );

    scripts\mp\utility\game::_id_316C( "earned_award_buffered", var_0 );

    if ( isdefined( self._id_26D9[var_0] ) )
        self._id_26D9[var_0]++;
    else
        self._id_26D9[var_0] = 1;

    scripts\mp\matchdata::_id_AF97( var_0 );
    scripts\mp\missions::_id_D98F( var_0 );
}

_id_DB92( var_0 )
{
    self._id_26D7[self._id_26D7.size] = var_0;
    thread _id_6F75();
}

_id_6F74()
{
    foreach ( var_1 in self._id_26D7 )
        givemidmatchaward( var_1 );

    self._id_26D7 = [];
}

_id_6F75()
{
    self endon( "disconnect" );
    self notify( "flushMidMatchAwardQueueWhenAble()" );
    self endon( "flushMidMatchAwardQueueWhenAble()" );

    for (;;)
    {
        if ( !_id_10064() )
            break;

        scripts\engine\utility::waitframe();
    }

    thread _id_6F74();
}

_id_10064( var_0 )
{
    if ( level._id_7669 )
        return 0;

    if ( !scripts\mp\utility\game::isreallyalive( self ) )
    {
        if ( !scripts\mp\utility\game::istrue( var_0 ) || scripts\mp\utility\game::_id_9E4A() )
        {
            if ( !scripts\mp\utility\game::isusingremote() )
                return 1;
        }
    }

    return 0;
}

_id_B8E6( var_0 )
{
    if ( !isdefined( var_0 ) || !isdefined( level._id_26D8 ) || !isdefined( level._id_26D8[var_0] ) )
        return;

    if ( !isdefined( self._id_1097C ) || !isdefined( self._id_D8B1 ) )
    {
        self._id_1097C = 0;
        self._id_D8B1 = 0;
    }

    var_1 = level._id_26D8[var_0]._id_92B8;

    if ( var_1 > 255 )
        scripts\engine\utility::_id_66BD( "awardID can't be larger than 255! Must increased bit size for award id stored in ui_spectating_award_event_bitfield" );

    var_2 = self._id_D8B1;
    var_3 = 8 * self._id_1097C % 4;
    var_4 = ~( 255 << var_3 );
    var_2 &= var_4;
    var_5 = var_1 << var_3;
    var_2 |= var_5;
    self setclientomnvar( "ui_spectating_award_event_bitfield", var_2 );
    self setclientomnvar( "ui_spectating_award_event_index", self._id_1097C );
    self._id_D8B1 = var_2;
    self._id_1097C++;

    if ( self._id_1097C > 99 )
        self._id_1097C = 0;
}

givemidmatchaward( var_0, var_1, var_2, var_3 )
{
    if ( !isplayer( self ) )
        return;

    if ( getdvarint( "com_codcasterEnabled", 0 ) == 1 )
    {
        foreach ( var_5 in level.players )
        {
            if ( var_5 ismlgspectator() )
            {
                var_6 = var_5 getspectatingplayer();

                if ( isdefined( var_6 ) )
                {
                    var_7 = var_6 getentitynumber();
                    var_8 = self getentitynumber();

                    if ( var_7 == var_8 )
                        var_5 _id_B8E6( var_0 );
                }
            }
        }
    }

    if ( isai( self ) )
        return;

    if ( _id_10064( var_3 ) )
    {
        _id_DB92( var_0 );
        return;
    }

    scripts\mp\analyticslog::_id_AF9D( var_0 );
    _id_8352( var_0, var_1, var_2 );
}

addawardtoaarlist( var_0 )
{
    if ( !isdefined( self.aarawards ) )
    {
        self.aarawards = [];
        self.aarawardcount = 0;

        for ( var_1 = 0; var_1 < 10; var_1++ )
        {
            var_2 = spawnstruct();
            self.aarawards[var_1] = var_2;
            var_2._id_DE3F = "none";
            var_2._id_00C1 = 0;
        }
    }

    foreach ( var_1, var_4 in self.aarawards )
    {
        if ( var_4._id_DE3F == var_0 )
        {
            var_4._id_00C1++;
            self setrankedplayerdata( "common", "round", "awards", var_1, "value", var_4._id_00C1 );
            return;
        }
    }

    var_5 = level._id_26D8[var_0].aarpriority;

    for ( var_6 = 0; var_6 < self.aarawards.size; var_6++ )
    {
        var_4 = self.aarawards[var_6];

        if ( var_4._id_DE3F == "none" )
            break;

        var_7 = level._id_26D8[var_4._id_DE3F].aarpriority;

        if ( var_5 > var_7 )
            break;
    }

    if ( var_6 >= self.aarawards.size )
        return;

    for ( var_8 = self.aarawards.size - 2; var_8 >= var_6; var_8-- )
    {
        var_9 = var_8 + 1;
        self.aarawards[var_9] = self.aarawards[var_8];
        var_4 = self.aarawards[var_9];

        if ( var_4._id_DE3F != "none" )
        {
            self setrankedplayerdata( "common", "round", "awards", var_9, "award", var_4._id_DE3F );
            self setrankedplayerdata( "common", "round", "awards", var_9, "value", var_4._id_00C1 );
        }
    }

    var_4 = spawnstruct();
    self.aarawards[var_6] = var_4;
    var_4._id_DE3F = var_0;
    var_4._id_00C1 = 1;
    self setrankedplayerdata( "common", "round", "awards", var_6, "award", var_4._id_DE3F );
    self setrankedplayerdata( "common", "round", "awards", var_6, "value", var_4._id_00C1 );

    if ( self.aarawardcount < 10 )
    {
        self.aarawardcount++;
        self setrankedplayerdata( "common", "round", "awardCount", self.aarawardcount );
    }

    if ( scripts\mp\utility\game::istrue( self.savedaarawards ) )
        saveaarawards();
}

initaarawardlist()
{
    self.aarawards = self.pers["aarAwards"];
    self.aarawardcount = self.pers["aarAwardCount"];
    thread saveaarawardsonroundswitch();

    if ( isdefined( self.aarawards ) )
        return;

    self setrankedplayerdata( "common", "round", "awardCount", 0 );

    for ( var_0 = 0; var_0 < 10; var_0++ )
    {
        self setrankedplayerdata( "common", "round", "awards", var_0, "award", "none" );
        self setrankedplayerdata( "common", "round", "awards", var_0, "value", 0 );
    }
}

saveaarawardsonroundswitch()
{
    self endon( "disconnect" );
    level waittill( "game_ended" );
    saveaarawards();
}

saveaarawards()
{
    self.pers["aarAwards"] = self.aarawards;
    self.pers["aarAwardCount"] = self.aarawardcount;
    self.savedaarawards = 1;
}

// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_10D6F( var_0, var_1, var_2 )
{
    if ( !_id_13151( var_0, var_1 ) )
        return;

    if ( isdefined( self._id_2B4B ) )
        self._id_2B4B thread _id_6310( 0, 1, 1 );

    var_3 = spawnstruct();
    self._id_2B4B = var_3;
    var_3.victim = self;
    var_3.attacker = var_0;
    var_3._id_10DFF = gettime();

    if ( !isdefined( var_2 ) )
        var_2 = _id_7F68( max( 0, _id_823D( var_1, self ) + _id_823F( var_0 ) ) );

    switch ( var_2 )
    {
        case 4:
            var_3._id_5FEB = 4;
            var_3.refreshwindowms = 3000;
            var_3._id_10475 = "blackout_grenade_drone_lr";
            var_3.blurstrength = 7;
            var_3.blursnapstrength = 12;
            var_3.blurindur = 0.2;
            var_3.blurdur = 1.9;
            var_3.bluroutdur = 3.2;
            var_3.overlayinalpha = 1;
            var_3.overlayindur = 0.2;
            var_3.overlaydur = 0.35;
            var_3.overlayoutalpha = 0.3;
            var_3.overlayoutdur = 0.4;
            var_3.useoverlay2 = 1;
            var_3.overlay2delay = 0.15;
            var_3.overlay2inalpha = 1;
            var_3.overlay2indur = 0.65;
            var_3.overlay2dur = 0.35;
            var_3.overlay2outalpha = 0;
            var_3.overlay2outdur = 3.2;
            var_3.shockdelay = 0.55;
            var_3.shockdur = 1;
            var_3.shock2delay = 0.35;
            var_3.shock2dur = 2;
            break;
        case 3:
            var_3._id_5FEB = 3;
            var_3.refreshwindowms = 2000;
            var_3._id_10475 = "blackout_grenade_drone_lr";
            var_3.blurstrength = 7;
            var_3.blursnapstrength = 12;
            var_3.blurindur = 0.2;
            var_3.blurdur = 1.9;
            var_3.bluroutdur = 2.2;
            var_3.overlayinalpha = 1;
            var_3.overlayindur = 0.2;
            var_3.overlaydur = 0.35;
            var_3.overlayoutalpha = 0.3;
            var_3.overlayoutdur = 0.4;
            var_3.useoverlay2 = 1;
            var_3.overlay2delay = 0.15;
            var_3.overlay2inalpha = 1;
            var_3.overlay2indur = 0.65;
            var_3.overlay2dur = 0.35;
            var_3.overlay2outalpha = 0;
            var_3.overlay2outdur = 2.2;
            var_3.shockdelay = 0.55;
            var_3.shockdur = 1;
            var_3.shock2delay = 0.35;
            var_3.shock2dur = 2;
            break;
        case 2:
            var_3._id_5FEB = 2;
            var_3.refreshwindowms = 1000;
            var_3._id_10475 = "blackout_grenade_drone_lr";
            var_3.blurstrength = 7;
            var_3.blursnapstrength = 12;
            var_3.blurindur = 0.2;
            var_3.blurdur = 1.9;
            var_3.bluroutdur = 1.2;
            var_3.overlayinalpha = 1;
            var_3.overlayindur = 0.2;
            var_3.overlaydur = 0.35;
            var_3.overlayoutalpha = 0.3;
            var_3.overlayoutdur = 0.4;
            var_3.useoverlay2 = 1;
            var_3.overlay2delay = 0.15;
            var_3.overlay2inalpha = 1;
            var_3.overlay2indur = 0.65;
            var_3.overlay2dur = 0.35;
            var_3.overlay2outalpha = 0;
            var_3.overlay2outdur = 1.2;
            var_3.shockdelay = 0.55;
            var_3.shockdur = 1;
            var_3.shock2delay = 0.35;
            var_3.shock2dur = 1.6;
            break;
        case 1:
            var_3._id_5FEB = 1;
            var_3.refreshwindowms = 1000;
            var_3._id_10475 = "blackout_grenade_drone_short_lr";
            var_3.blurstrength = 7;
            var_3.blursnapstrength = 12;
            var_3.blurindur = 0.2;
            var_3.blurdur = 0.35;
            var_3.bluroutdur = 1.2;
            var_3.overlayinalpha = 1;
            var_3.overlayindur = 0.2;
            var_3.overlaydur = 0.35;
            var_3.overlayoutalpha = 0;
            var_3.overlayoutdur = 1.2;
            var_3.useoverlay2 = 0;
            var_3.overlay2delay = 0;
            var_3.overlay2inalpha = 0;
            var_3.overlay2indur = 0;
            var_3.overlay2dur = 0;
            var_3.overlay2outalpha = 0;
            var_3.overlay2outdur = 0;
            var_3.shockdelay = 0.55;
            var_3.shockdur = 1.6;
            var_3.shock2delay = 0;
            var_3.shock2dur = 0;
            break;
    }

    var_3.blurdurtotal = var_3.blurindur + var_3.blurdur + var_3.bluroutdur;
    var_3.overlaydurtotal = var_3.overlayindur + var_3.overlaydur + var_3.overlayoutdur;

    if ( var_3.useoverlay2 )
        var_3.overlaydurtotal += ( var_3.overlay2delay + var_3.overlay2indur + var_3.overlay2dur + var_3.overlay2outdur );

    var_3.durtotal = max( var_3.blurdurtotal, var_3.overlaydurtotal );
    var_4 = newclienthudelem( self );
    var_4.x = 0;
    var_4.y = 0;
    var_4._id_002B = "left";
    var_4._id_002C = "top";
    var_4._id_02A4 = 1;
    var_4._id_017D = "fullscreen";
    var_4._id_0382 = "fullscreen";
    var_4.alpha = 0;
    var_4._id_0142 = 1;
    var_4 setshader( "black", 640, 480 );
    var_3._id_C7FD = var_4;
    var_3 thread _id_B9BB();
    var_0 scripts\mp\damage::combatrecordtacticalstat( "power_blackoutGrenade" );
}

_id_6310( var_0, var_1, var_2 )
{
    self notify( "blackoutEnded" );
    var_3 = self.attacker;
    var_4 = self.victim;

    if ( isdefined( var_4 ) )
    {
        var_4._id_2B4B = undefined;

        if ( !var_0 )
        {
            if ( var_2 )
                thread endblackoutsfx();
            else
                thread endblackoutsfx( 2 );

            if ( var_1 )
                var_4 setblurforplayer( 0, 0.05 );

            if ( isdefined( var_3 ) )
                scripts\mp\gamescore::_id_12D6F( var_3, var_4, "blackout_grenade_mp" );

            var_4 scripts\mp\weapons::_id_F7FF();
            var_4 scripts\mp\utility\game::_id_8EC4();
        }
        else
            thread endblackoutsfx();
    }

    self._id_C7FD destroy();
}

endblackoutsfx( var_0 )
{
    self.victim endon( "disconnect" );
    self notify( "endBlackoutSfx" );
    self endon( "endBlackoutSfx" );

    if ( isdefined( var_0 ) )
        wait( var_0 );

    self.victim stopolcalsound( "blackout_grenade_drone_lr" );
    self.victim stopolcalsound( "blackout_grenade_drone_lsrs" );
    self.victim stopolcalsound( "blackout_grenade_drone_short_lr" );
    self.victim stopolcalsound( "blackout_grenade_drone_short_lsrs" );
}

_id_B9BB()
{
    var_0 = self.victim;
    var_0 endon( "disconnect" );
    self endon( "blackoutEnded" );
    var_1 = self.attacker;
    var_2 = self._id_10475;
    var_3 = self.durtotal;
    var_0 shellshock( "blackout_grenade_mp", 1 );
    var_0 playlocalsound( var_2 );
    var_0 scripts\mp\weapons::_id_F7EE();
    var_0 scripts\mp\utility\game::_id_8EC6();

    if ( isdefined( self.attacker ) )
        scripts\mp\gamescore::_id_11ACE( var_1, var_0, "blackout_grenade_mp" );

    thread monitorvictimdeathdisconnect();
    childthread monitorblur();
    childthread monitoroverlay();
    childthread monitorshock();
    childthread monitorgameended();
    wait( var_3 + 0.05 );
    thread _id_6310( 0, 0, 0 );
}

monitorblur()
{
    var_0 = self.victim;
    var_0 endon( "disconnect" );
    self endon( "blackoutEnded" );
    var_1 = self.blurstrength;
    var_2 = self.blursnapstrength;
    var_3 = self.blurindur;
    var_4 = self.blurdur;
    var_5 = self.bluroutdur;
    var_0 setblurforplayer( var_1, var_3 );

    if ( var_2 != var_1 && var_4 > 0.1 )
    {
        wait( var_3 + var_4 - 0.1 );
        var_0 setblurforplayer( var_2, 0.05 );
        wait 0.1;
    }
    else
        wait( var_3 + var_4 );

    var_0 setblurforplayer( 0, var_5 );
}

monitoroverlay()
{
    var_0 = self.victim;
    var_0 endon( "disconnect" );
    self endon( "blackoutEnded" );
    var_1 = self._id_C7FD;
    var_2 = self.overlayinalpha;
    var_3 = self.overlayindur;
    var_4 = self.overlaydur;
    var_5 = self.overlayoutalpha;
    var_6 = self.overlayoutdur;
    var_7 = self.useoverlay2;
    var_8 = self.overlay2delay;
    var_9 = self.overlay2inalpha;
    var_10 = self.overlay2indur;
    var_11 = self.overlay2dur;
    var_12 = self.overlay2outalpha;
    var_13 = self.overlay2outdur;
    var_1 fadeovertime( var_3 );
    var_1.alpha = var_2;
    wait( var_3 + var_4 );
    var_1 fadeovertime( var_6 );
    var_1.alpha = var_5;

    if ( var_7 )
    {
        wait( var_6 + var_8 );
        var_1 fadeovertime( var_10 );
        var_1.alpha = var_9;
        wait( var_10 + var_11 );
        var_1 fadeovertime( var_13 );
        var_1.alpha = var_12;
    }
}

monitorshock()
{
    var_0 = self.victim;
    var_0 endon( "disconnect" );
    self endon( "blackoutEnded" );
    var_1 = self.shockdelay;
    var_2 = self.shockdur;
    var_3 = self.useoverlay2;
    var_4 = self.shock2delay;
    var_5 = self.shock2dur;
    wait( var_1 );
    var_0 shellshock( "blackout_grenade_mp", var_2, 0 );

    if ( var_3 )
    {
        wait( var_2 + var_4 );
        var_0 shellshock( "blackout_grenade_mp", var_5, 0 );
    }
}

monitorvictimdeathdisconnect()
{
    self endon( "blackoutEnded" );
    self.victim scripts\engine\utility::waittill_any( "death", "disconnect" );
    thread _id_6310( 1, 0, 0 );
}

monitorgameended()
{
    self endon( "blackoutEnded" );
    level scripts\engine\utility::waittill_any( "game_ended", "round_end_finished" );
    thread _id_6310( 0, 1, 1 );
}

_id_823D( var_0, var_1 )
{
    var_2 = var_0 - var_1 geteye();
    var_3 = clamp( length( var_2 ), 100, 512 );
    var_4 = ( 1 - ( var_3 - 100 ) / 412 ) * 70;
    var_5 = anglestoforward( var_1 getplayerangles() );
    var_6 = scripts\engine\utility::_id_1E7C( var_2, var_5 );
    var_6 = clamp( var_6, 15, 60 );
    var_7 = ( 1 - ( var_6 - 15 ) / 45 ) * 30;
    return var_4 + var_7;
}

_id_7F68( var_0 )
{
    if ( var_0 > 70 )
        return 4;

    if ( var_0 > 55 )
        return 3;

    if ( var_0 > 30 )
        return 2;

    return 1;
}

_id_823F( var_0 )
{
    if ( self == var_0 )
        return -30;

    return 0;
}

_id_13151( var_0, var_1 )
{
    if ( !isplayer( self ) )
        return 0;

    if ( !scripts\mp\utility\game::isreallyalive( self ) )
        return 0;

    if ( scripts\mp\utility\game::_id_12D6( "specialty_stun_resistance" ) )
    {
        scripts\mp\perks\perkfunctions::_id_20E0( var_0, self );
        return 0;
    }

    var_2 = _id_7E09();
    var_3 = getblackoutrefreshwindowms();

    if ( isdefined( var_2 ) && isdefined( var_3 ) && var_2 - gettime() > var_3 )
        return 0;

    return 1;
}

_id_7E09()
{
    if ( !isdefined( self._id_2B4B ) )
        return undefined;

    return self._id_2B4B._id_10DFF + self._id_2B4B.durtotal * 1000;
}

getblackoutrefreshwindowms()
{
    if ( !isdefined( self._id_2B4B ) )
        return undefined;

    return self._id_2B4B.refreshwindowms;
}

_id_B92C( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) || !isdefined( var_4 ) || !isdefined( var_1 ) || !isdefined( var_2 ) )
        return var_0;

    if ( var_4 != "blackout_grenade_mp" )
        return var_0;

    if ( var_1 != var_2 )
        return var_0;

    if ( distancesquared( var_2.origin, var_3.origin ) <= 65536 )
        return var_0;

    return 0;
}

debug_blackouttestlevels()
{
    self endon( "disconnect" );
    self notifyonplayercommand( "debug_startBlackout_1", "+actionslot 1" );
    self notifyonplayercommand( "debug_startBlackout_2", "+actionslot 4" );
    self notifyonplayercommand( "debug_startBlackout_3", "+actionslot 2" );
    self notifyonplayercommand( "debug_startBlackout_4", "+actionslot 3" );

    for (;;)
    {
        var_0 = scripts\engine\utility::_id_13735( "debug_startBlackout_1", "debug_startBlackout_2", "debug_startBlackout_3", "debug_startBlackout_4" );
        var_1 = strtok( var_0, "_" );
        var_2 = int( var_1[2] );
        _id_10D6F( self, self.origin, var_2 );
        wait 0.1;
    }
}

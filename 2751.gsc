// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    level._id_12B29 = spawnstruct();
    level._id_12B29._id_017D = "left";
    level._id_12B29._id_0382 = "top";
    level._id_12B29._id_002B = "left";
    level._id_12B29._id_002C = "top";
    level._id_12B29.x = 0;
    level._id_12B29.y = 0;
    level._id_12B29._id_039F = 0;
    level._id_12B29.height = 0;
    level._id_12B29._id_3E67 = [];
    level._id_724F = 12;
    level._id_912F["allies"] = spawnstruct();
    level._id_912F["axis"] = spawnstruct();
    level._id_D8DE = -61;
    level._id_D8DD = 0;
    level._id_D8D9 = 9;
    level._id_D8DC = 120;
    level._id_D8DB = -75;
    level._id_D8DA = 0;
    level._id_D8D8 = 1.2;
    level._id_115E4 = 32;
    level._id_115E1 = 14;
    level._id_115E3 = 192;
    level._id_115E2 = 8;
    level._id_115E0 = 1.65;
    level._id_B0E6 = "BOTTOM";
    level._id_B0E5 = -140;
    level._id_B0E4 = 1.6;
}

_id_7251( var_0 )
{
    self._id_289F = self._id_013B;

    if ( isdefined( var_0 ) )
        self._id_B49C = min( var_0, 6.3 );
    else
        self._id_B49C = min( self._id_013B * 2, 6.3 );

    self._id_94C4 = 2;
    self._id_C766 = 4;
}

fontpulse( var_0 )
{
    self notify( "fontPulse" );
    self endon( "fontPulse" );
    self endon( "death" );
    var_0 endon( "disconnect" );
    var_0 endon( "joined_team" );
    var_0 endon( "joined_spectators" );
    self _meth_8067( self._id_94C4 * 0.05 );
    self._id_013B = self._id_B49C;
    wait( self._id_94C4 * 0.05 );
    self _meth_8067( self._id_C766 * 0.05 );
    self._id_013B = self._id_289F;
}

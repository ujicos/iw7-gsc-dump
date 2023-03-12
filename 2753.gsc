// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_F7D6( var_0 )
{
    if ( isdefined( self._id_C8F2 ) && self._id_C8F2 == var_0 )
        return;

    if ( isdefined( self._id_C8F2 ) )
        self._id_C8F2 _id_E0DD( self );

    self._id_C8F2 = var_0;
    self._id_C8F2 _id_17BC( self );

    if ( isdefined( self._id_0244 ) )
        _id_F801( self._id_0244, self._id_DF31, self._id_13E19, self._id_13E5A );
    else
        _id_F801( "TOPLEFT" );
}

_id_8045()
{
    return self._id_C8F2;
}

_id_E0EB()
{
    if ( isdefined( self._id_3E66 ) && self._id_3E66 == gettime() )
        return;

    self._id_3E66 = gettime();
    var_0 = [];

    foreach ( var_3, var_2 in self._id_3E67 )
    {
        if ( !isdefined( var_2 ) )
            continue;

        var_2.index = var_0.size;
        var_0[var_0.size] = var_2;
    }

    self._id_3E67 = var_0;
}

_id_17BC( var_0 )
{
    var_0.index = self._id_3E67.size;
    self._id_3E67[self._id_3E67.size] = var_0;
    _id_E0EB();
}

_id_E0DD( var_0 )
{
    var_0._id_C8F2 = undefined;

    if ( self._id_3E67[self._id_3E67.size - 1] != var_0 )
    {
        self._id_3E67[var_0.index] = self._id_3E67[self._id_3E67.size - 1];
        self._id_3E67[var_0.index].index = var_0.index;
    }

    self._id_3E67[self._id_3E67.size - 1] = undefined;
    var_0.index = undefined;
}

_id_F801( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = 0;

    var_5 = _id_8045();

    if ( var_4 )
        self _meth_820C( var_4 );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    self._id_13E19 = var_2;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    self._id_13E5A = var_3;
    self._id_0244 = var_0;
    self._id_002B = "center";
    self._id_002C = "middle";

    if ( issubstr( var_0, "TOP" ) )
        self._id_002C = "top";

    if ( issubstr( var_0, "BOTTOM" ) )
        self._id_002C = "bottom";

    if ( issubstr( var_0, "LEFT" ) )
        self._id_002B = "left";

    if ( issubstr( var_0, "RIGHT" ) )
        self._id_002B = "right";

    if ( !isdefined( var_1 ) )
        var_1 = var_0;

    self._id_DF31 = var_1;
    var_6 = "center_adjustable";
    var_7 = "middle";

    if ( issubstr( var_1, "TOP" ) )
        var_7 = "top_adjustable";

    if ( issubstr( var_1, "BOTTOM" ) )
        var_7 = "bottom_adjustable";

    if ( issubstr( var_1, "LEFT" ) )
        var_6 = "left_adjustable";

    if ( issubstr( var_1, "RIGHT" ) )
        var_6 = "right_adjustable";

    if ( var_5 == level._id_12B29 )
    {
        self._id_017D = var_6;
        self._id_0382 = var_7;
    }
    else
    {
        self._id_017D = var_5._id_017D;
        self._id_0382 = var_5._id_0382;
    }

    if ( scripts\mp\utility\game::_id_11150( var_6, "_adjustable" ) == var_5._id_002B )
    {
        var_8 = 0;
        var_9 = 0;
    }
    else if ( var_6 == "center" || var_5._id_002B == "center" )
    {
        var_8 = int( var_5._id_039F / 2 );

        if ( var_6 == "left_adjustable" || var_5._id_002B == "right" )
            var_9 = -1;
        else
            var_9 = 1;
    }
    else
    {
        var_8 = var_5._id_039F;

        if ( var_6 == "left_adjustable" )
            var_9 = -1;
        else
            var_9 = 1;
    }

    self.x = var_5.x + var_8 * var_9;

    if ( scripts\mp\utility\game::_id_11150( var_7, "_adjustable" ) == var_5._id_002C )
    {
        var_10 = 0;
        var_11 = 0;
    }
    else if ( var_7 == "middle" || var_5._id_002C == "middle" )
    {
        var_10 = int( var_5.height / 2 );

        if ( var_7 == "top_adjustable" || var_5._id_002C == "bottom" )
            var_11 = -1;
        else
            var_11 = 1;
    }
    else
    {
        var_10 = var_5.height;

        if ( var_7 == "top_adjustable" )
            var_11 = -1;
        else
            var_11 = 1;
    }

    self.y = var_5.y + var_10 * var_11;
    self.x += self._id_13E19;
    self.y += self._id_13E5A;

    switch ( self._id_601F )
    {
        case "bar":
            _id_F802( var_0, var_1, var_2, var_3 );
            break;
    }

    _id_12E74();
}

_id_F802( var_0, var_1, var_2, var_3 )
{
    self._id_2812._id_017D = self._id_017D;
    self._id_2812._id_0382 = self._id_0382;
    self._id_2812._id_002B = "left";
    self._id_2812._id_002C = self._id_002C;
    self._id_2812.y = self.y;

    if ( self._id_002B == "left" )
        self._id_2812.x = self.x;
    else if ( self._id_002B == "right" )
        self._id_2812.x = self.x - self._id_039F;
    else
        self._id_2812.x = self.x - int( self._id_039F / 2 );

    if ( self._id_002C == "top" )
        self._id_2812.y = self.y;
    else if ( self._id_002C == "bottom" )
        self._id_2812.y = self.y;

    _id_12E63( self._id_2812._id_7349 );
}

_id_12E63( var_0, var_1 )
{
    if ( self._id_601F == "bar" )
        _id_12E64( var_0, var_1 );
}

_id_12E64( var_0, var_1 )
{
    var_2 = int( self._id_039F * var_0 + 0.5 );

    if ( !var_2 )
        var_2 = 1;

    self._id_2812._id_7349 = var_0;
    self._id_2812 setshader( self._id_2812._id_FC44, var_2, self.height );

    if ( isdefined( var_1 ) && var_2 < self._id_039F )
    {
        if ( var_1 > 0 )
            self._id_2812 _meth_8276( ( 1 - var_0 ) / var_1, self._id_039F, self.height );
        else if ( var_1 < 0 )
            self._id_2812 _meth_8276( var_0 / -1 * var_1, 1, self.height );
    }

    self._id_2812._id_DCE7 = var_1;
    self._id_2812._id_AA36 = gettime();
}

_id_49B2( var_0, var_1 )
{
    var_2 = newclienthudelem( self );
    var_2._id_601F = "font";
    var_2._id_013A = var_0;
    var_2._id_013B = var_1;
    var_2._id_289F = var_1;
    var_2.x = 0;
    var_2.y = 0;
    var_2._id_039F = 0;
    var_2.height = int( level._id_724F * var_1 );
    var_2._id_13E19 = 0;
    var_2._id_13E5A = 0;
    var_2._id_3E67 = [];
    var_2 _id_F7D6( level._id_12B29 );
    var_2._id_8E5A = 0;
    return var_2;
}

_id_4A15( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_3 = newteamhudelem( var_2 );
    else
        var_3 = newhudelem();

    var_3._id_601F = "font";
    var_3._id_013A = var_0;
    var_3._id_013B = var_1;
    var_3._id_289F = var_1;
    var_3.x = 0;
    var_3.y = 0;
    var_3._id_039F = 0;
    var_3.height = int( level._id_724F * var_1 );
    var_3._id_13E19 = 0;
    var_3._id_13E5A = 0;
    var_3._id_3E67 = [];
    var_3 _id_F7D6( level._id_12B29 );
    var_3._id_8E5A = 0;
    return var_3;
}

_id_4A17( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_3 = newteamhudelem( var_2 );
    else
        var_3 = newhudelem();

    var_3._id_601F = "timer";
    var_3._id_013A = var_0;
    var_3._id_013B = var_1;
    var_3._id_289F = var_1;
    var_3.x = 0;
    var_3.y = 0;
    var_3._id_039F = 0;
    var_3.height = int( level._id_724F * var_1 );
    var_3._id_13E19 = 0;
    var_3._id_13E5A = 0;
    var_3._id_3E67 = [];
    var_3 _id_F7D6( level._id_12B29 );
    var_3._id_8E5A = 0;
    return var_3;
}

_id_4A27( var_0, var_1 )
{
    var_2 = newclienthudelem( self );
    var_2._id_601F = "timer";
    var_2._id_013A = var_0;
    var_2._id_013B = var_1;
    var_2._id_289F = var_1;
    var_2.x = 0;
    var_2.y = 0;
    var_2._id_039F = 0;
    var_2.height = int( level._id_724F * var_1 );
    var_2._id_13E19 = 0;
    var_2._id_13E5A = 0;
    var_2._id_3E67 = [];
    var_2 _id_F7D6( level._id_12B29 );
    var_2._id_8E5A = 0;
    return var_2;
}

_id_49D9( var_0, var_1, var_2 )
{
    var_3 = newclienthudelem( self );
    var_3._id_601F = "icon";
    var_3.x = 0;
    var_3.y = 0;
    var_3._id_039F = var_1;
    var_3.height = var_2;
    var_3._id_28B0 = var_3._id_039F;
    var_3._id_28A2 = var_3.height;
    var_3._id_13E19 = 0;
    var_3._id_13E5A = 0;
    var_3._id_3E67 = [];
    var_3 _id_F7D6( level._id_12B29 );
    var_3._id_8E5A = 0;

    if ( isdefined( var_0 ) )
    {
        var_3 setshader( var_0, var_1, var_2 );
        var_3._id_FC44 = var_0;
    }

    return var_3;
}

_id_4A16( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
        var_4 = newteamhudelem( var_3 );
    else
        var_4 = newhudelem();

    var_4._id_601F = "icon";
    var_4.x = 0;
    var_4.y = 0;
    var_4._id_039F = var_1;
    var_4.height = var_2;
    var_4._id_28B0 = var_4._id_039F;
    var_4._id_28A2 = var_4.height;
    var_4._id_13E19 = 0;
    var_4._id_13E5A = 0;
    var_4._id_3E67 = [];
    var_4 _id_F7D6( level._id_12B29 );
    var_4._id_8E5A = 0;

    if ( isdefined( var_0 ) )
    {
        var_4 setshader( var_0, var_1, var_2 );
        var_4._id_FC44 = var_0;
    }

    return var_4;
}

_id_4A14( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_4 ) )
        var_6 = newteamhudelem( var_4 );
    else
        var_6 = newhudelem();

    var_6.x = 0;
    var_6.y = 0;
    var_6._id_7349 = 0;
    var_6._id_00B9 = var_0;
    var_6._id_02A4 = -2;
    var_6._id_FC44 = "progress_bar_fill";
    var_6 setshader( "progress_bar_fill", var_1, var_2 );
    var_6._id_8E5A = 0;

    if ( isdefined( var_3 ) )
        var_6._id_6ECC = var_3;

    if ( isdefined( var_4 ) )
        var_7 = newteamhudelem( var_4 );
    else
        var_7 = newhudelem();

    var_7._id_601F = "bar";
    var_7.x = 0;
    var_7.y = 0;
    var_7._id_039F = var_1;
    var_7.height = var_2;
    var_7._id_13E19 = 0;
    var_7._id_13E5A = 0;
    var_7._id_2812 = var_6;
    var_7._id_3E67 = [];
    var_7._id_02A4 = -3;
    var_7._id_00B9 = ( 0, 0, 0 );
    var_7.alpha = 0.5;
    var_7 _id_F7D6( level._id_12B29 );
    var_7 setshader( "progress_bar_bg", var_1, var_2 );
    var_7._id_8E5A = 0;
    return var_7;
}

_id_4987( var_0, var_1, var_2, var_3 )
{
    var_4 = newclienthudelem( self );
    var_4.x = 0;
    var_4.y = 0;
    var_4._id_7349 = 0;
    var_4._id_00B9 = var_0;
    var_4._id_02A4 = -2;
    var_4._id_FC44 = "progress_bar_fill";
    var_4 setshader( "progress_bar_fill", var_1, var_2 );
    var_4._id_8E5A = 0;

    if ( isdefined( var_3 ) )
        var_4._id_6ECC = var_3;

    var_5 = newclienthudelem( self );
    var_5._id_601F = "bar";
    var_5._id_039F = var_1;
    var_5.height = var_2;
    var_5._id_13E19 = 0;
    var_5._id_13E5A = 0;
    var_5._id_2812 = var_4;
    var_5._id_3E67 = [];
    var_5._id_02A4 = -3;
    var_5._id_00B9 = ( 0, 0, 0 );
    var_5.alpha = 0.5;
    var_5 _id_F7D6( level._id_12B29 );
    var_5 setshader( "progress_bar_bg", var_1 + 4, var_2 + 4 );
    var_5._id_8E5A = 0;
    return var_5;
}

_id_7E4C()
{
    var_0 = self._id_2812._id_7349;

    if ( isdefined( self._id_2812._id_DCE7 ) )
    {
        var_0 += ( gettime() - self._id_2812._id_AA36 ) * self._id_2812._id_DCE7;

        if ( var_0 > 1 )
            var_0 = 1;

        if ( var_0 < 0 )
            var_0 = 0;
    }

    return var_0;
}

_id_4A02( var_0, var_1 )
{
    if ( isagent( self ) )
        return undefined;

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = -25;

    if ( self issplitscreenplayer() )
        var_1 += 20;

    var_2 = _id_4987( ( 1, 1, 1 ), level._id_D8DC, level._id_D8D9 );
    var_2 _id_F801( "CENTER", undefined, level._id_D8DD + var_0, level._id_D8DE + var_1 );
    return var_2;
}

_id_4A03( var_0, var_1, var_2, var_3 )
{
    if ( isagent( self ) )
        return undefined;

    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = -25;

    if ( self issplitscreenplayer() )
        var_1 += 20;

    var_4 = level._id_D8D8;
    var_5 = "default";

    if ( isdefined( var_2 ) )
        var_4 = var_2;

    if ( isdefined( var_3 ) )
        var_5 = var_3;

    var_6 = _id_49B2( var_5, var_4 );
    var_6 _id_F801( "CENTER", undefined, level._id_D8DA + var_0, level._id_D8DB + var_1 );
    var_6._id_02A4 = -1;
    return var_6;
}

_id_4A24( var_0 )
{
    var_1 = _id_4A14( ( 1, 0, 0 ), level._id_115E3, level._id_115E1, undefined, var_0 );
    var_1 _id_F801( "TOP", undefined, 0, level._id_115E4 );
    return var_1;
}

_id_4A25( var_0 )
{
    var_1 = _id_4A15( "default", level._id_115E0, var_0 );
    var_1 _id_F801( "TOP", undefined, 0, level._id_115E2 );
    return var_1;
}

_id_F710( var_0 )
{
    self._id_2812._id_6ECC = var_0;
}

_id_8EBD()
{
    if ( self._id_8E5A )
        return;

    self._id_8E5A = 1;

    if ( self.alpha != 0 )
        self.alpha = 0;

    if ( self._id_601F == "bar" || self._id_601F == "bar_shader" )
    {
        self._id_2812._id_8E5A = 1;

        if ( self._id_2812.alpha != 0 )
            self._id_2812.alpha = 0;
    }
}

_id_1011F()
{
    if ( !self._id_8E5A )
        return;

    self._id_8E5A = 0;

    if ( self._id_601F == "bar" || self._id_601F == "bar_shader" )
    {
        if ( self.alpha != 0.5 )
            self.alpha = 0.5;

        self._id_2812._id_8E5A = 0;

        if ( self._id_2812.alpha != 1 )
            self._id_2812.alpha = 1;
    }
    else if ( self.alpha != 1 )
        self.alpha = 1;
}

_id_6EDE()
{
    self endon( "death" );

    if ( !self._id_8E5A )
        self.alpha = 1;

    for (;;)
    {
        if ( self._id_7349 >= self._id_6ECC )
        {
            if ( !self._id_8E5A )
            {
                self fadeovertime( 0.3 );
                self.alpha = 0.2;
                wait 0.35;
                self fadeovertime( 0.3 );
                self.alpha = 1;
            }

            wait 0.7;
            continue;
        }

        if ( !self._id_8E5A && self.alpha != 1 )
            self.alpha = 1;

        wait 0.05;
    }
}

_id_52DC()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < self._id_3E67.size; var_1++ )
    {
        if ( isdefined( self._id_3E67[var_1] ) )
            var_0[var_0.size] = self._id_3E67[var_1];
    }

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _id_F7D6( _id_8045() );

    if ( self._id_601F == "bar" || self._id_601F == "bar_shader" )
        self._id_2812 destroy();

    self destroy();
}

_id_F74C( var_0 )
{
    self setshader( var_0, self._id_039F, self.height );
    self._id_FC44 = var_0;
}

_id_7F0B( var_0 )
{
    return self._id_FC44;
}

_id_F74D( var_0, var_1 )
{
    self setshader( self._id_FC44, var_0, var_1 );
}

_id_FB1F( var_0 )
{
    self._id_039F = var_0;
}

_id_F743( var_0 )
{
    self.height = var_0;
}

_id_F847( var_0, var_1 )
{
    self._id_039F = var_0;
    self.height = var_1;
}

_id_12E74()
{
    for ( var_0 = 0; var_0 < self._id_3E67.size; var_0++ )
    {
        var_1 = self._id_3E67[var_0];
        var_1 _id_F801( var_1._id_0244, var_1._id_DF31, var_1._id_13E19, var_1._id_13E5A );
    }
}

_id_1267A()
{
    self.x = self._id_13E19;
    self.y = self._id_13E5A;

    if ( self._id_601F == "font" )
    {
        self._id_013B = self._id_289F;
        self._id_01AD = &"";
    }
    else if ( self._id_601F == "icon" )
        self setshader( self._id_FC44, self._id_039F, self.height );

    self.alpha = 0;
}

_id_12683( var_0 )
{
    switch ( self._id_601F )
    {
        case "timer":
        case "font":
            self._id_013B = 6.3;
            self _meth_8067( var_0 );
            self._id_013B = self._id_289F;
            break;
        case "icon":
            self setshader( self._id_FC44, self._id_039F * 6, self.height * 6 );
            self _meth_8276( var_0, self._id_039F, self.height );
            break;
    }
}

_id_12679( var_0, var_1 )
{
    var_2 = int( var_0 ) * 1000;
    var_3 = int( var_1 ) * 1000;

    switch ( self._id_601F )
    {
        case "timer":
        case "font":
            self _meth_832C( var_2 + 250, var_3 + var_2, var_2 + 250 );
            break;
        default:
            break;
    }
}

_id_1267C( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "left";

    switch ( var_1 )
    {
        case "left":
            self.x += 1000;
            break;
        case "right":
            self.x -= 1000;
            break;
        case "up":
            self.y -= 1000;
            break;
        case "down":
            self.y += 1000;
            break;
    }

    self _meth_820C( var_0 );
    self.x = self._id_13E19;
    self.y = self._id_13E5A;
}

_id_1267D( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "left";

    var_2 = self._id_13E19;
    var_3 = self._id_13E5A;

    switch ( var_1 )
    {
        case "left":
            var_2 += 1000;
            break;
        case "right":
            var_2 -= 1000;
            break;
        case "up":
            var_3 -= 1000;
            break;
        case "down":
            var_3 += 1000;
            break;
    }

    self.alpha = 1;
    self _meth_820C( var_0 );
    self.x = var_2;
    self.y = var_3;
}

_id_12684( var_0 )
{
    switch ( self._id_601F )
    {
        case "timer":
        case "font":
            self _meth_8067( var_0 );
            self._id_013B = 6.3;
        case "icon":
            self _meth_8276( var_0, self._id_039F * 6, self.height * 6 );
            break;
    }
}

_id_12676( var_0 )
{
    self fadeovertime( var_0 );

    if ( isdefined( self._id_B47B ) )
        self.alpha = self._id_B47B;
    else
        self.alpha = 1;
}

_id_12677( var_0 )
{
    self fadeovertime( 0.15 );
    self.alpha = 0;
}

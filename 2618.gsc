// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_F9A6( var_0 )
{
    var_1 = var_0.targetname;

    if ( !isdefined( level._id_69B8[var_1] ) )
        level._id_69B8[var_1] = [];

    var_2 = var_0._id_0336;

    if ( !isdefined( var_2 ) )
        var_2 = "";

    level._id_69B8[var_1][level._id_69B8[var_1].size] = var_0;

    if ( _id_69AD( var_0 ) )
    {
        var_0 hide();
        return;
    }

    if ( _id_69AC( var_0 ) )
    {
        var_0 hide();
        var_0 notsolid();

        if ( isdefined( var_0._id_02AF ) && var_0._id_02AF & 1 )
        {
            if ( isdefined( var_0._id_ED5D ) )
                var_0 connectpaths();
        }

        return;
    }

    if ( _id_69AB( var_0 ) )
    {
        var_0 hide();
        var_0 notsolid();

        if ( isdefined( var_0._id_02AF ) && var_0._id_02AF & 1 )
            var_0 connectpaths();

        return;
    }
}

_id_FAAA()
{
    scripts\engine\utility::_id_F315();
    level._id_69B8 = [];
    var_0 = getentarray( "script_brushmodel", "classname" );
    var_1 = getentarray( "script_model", "classname" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        var_0[var_0.size] = var_1[var_2];

    foreach ( var_4 in var_0 )
    {
        if ( isdefined( var_4._id_EE89 ) )
            var_4.targetname = var_4._id_EE89;

        if ( isdefined( var_4._id_B3CC ) )
            continue;

        if ( isdefined( var_4.targetname ) )
            _id_F9A6( var_4 );
    }

    var_6 = [];
    var_7 = getentarray( "script_brushmodel", "classname" );

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( isdefined( var_7[var_2]._id_EE89 ) )
            var_7[var_2].targetname = var_7[var_2]._id_EE89;

        if ( isdefined( var_7[var_2].targetname ) )
            var_6[var_6.size] = var_7[var_2];
    }

    var_7 = getentarray( "script_model", "classname" );

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( isdefined( var_7[var_2]._id_EE89 ) )
            var_7[var_2].targetname = var_7[var_2]._id_EE89;

        if ( isdefined( var_7[var_2].targetname ) )
            var_6[var_6.size] = var_7[var_2];
    }

    var_7 = getentarray( "item_health", "classname" );

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( isdefined( var_7[var_2]._id_EE89 ) )
            var_7[var_2].targetname = var_7[var_2]._id_EE89;

        if ( isdefined( var_7[var_2].targetname ) )
            var_6[var_6.size] = var_7[var_2];
    }

    var_7 = level.struct;

    for ( var_2 = 0; var_2 < var_7.size; var_2++ )
    {
        if ( !isdefined( var_7[var_2] ) )
            continue;

        if ( isdefined( var_7[var_2]._id_EE89 ) )
            var_7[var_2].targetname = var_7[var_2]._id_EE89;

        if ( isdefined( var_7[var_2].targetname ) )
        {
            if ( !isdefined( var_7[var_2].angles ) )
                var_7[var_2].angles = ( 0, 0, 0 );

            var_6[var_6.size] = var_7[var_2];
        }
    }

    if ( !isdefined( level.createfxent ) )
        level.createfxent = [];

    var_8 = [];
    var_8["exploderchunk visible"] = 1;
    var_8["exploderchunk"] = 1;
    var_8["exploder"] = 1;
    thread _id_F97F();

    for ( var_2 = 0; var_2 < var_6.size; var_2++ )
    {
        var_9 = var_6[var_2];
        var_4 = scripts\engine\utility::_id_49AE( var_9._id_EDBB );
        var_4.v = [];
        var_4.v["origin"] = var_9.origin;
        var_4.v["angles"] = var_9.angles;
        var_4.v["delay"] = var_9._id_027B;
        var_4.v["delay_post"] = var_9._id_ED51;
        var_4.v["firefx"] = var_9._id_ED93;
        var_4.v["firefxdelay"] = var_9._id_ED94;
        var_4.v["firefxsound"] = var_9._id_ED95;
        var_4.v["earthquake"] = var_9._id_ED76;
        var_4.v["rumble"] = var_9._id_EEA0;
        var_4.v["damage"] = var_9._id_ED41;
        var_4.v["damage_radius"] = var_9._id_EE8F;
        var_4.v["soundalias"] = var_9._id_EEB1;
        var_4.v["repeat"] = var_9._id_EE94;
        var_4.v["delay_min"] = var_9._id_ED50;
        var_4.v["delay_max"] = var_9._id_ED4F;
        var_4.v["target"] = var_9._id_0334;
        var_4.v["ender"] = var_9._id_ED78;
        var_4.v["physics"] = var_9._id_EE82;
        var_4.v["type"] = "exploder";

        if ( !isdefined( var_9._id_EDBB ) )
            var_4.v["fxid"] = "No FX";
        else
            var_4.v["fxid"] = var_9._id_EDBB;

        var_4.v["exploder"] = var_9.targetname;

        if ( isdefined( level.createfxexploders ) )
        {
            var_10 = level.createfxexploders[var_4.v["exploder"]];

            if ( !isdefined( var_10 ) )
                var_10 = [];

            var_10[var_10.size] = var_4;
            level.createfxexploders[var_4.v["exploder"]] = var_10;
        }

        if ( !isdefined( var_4.v["delay"] ) )
            var_4.v["delay"] = 0;

        if ( isdefined( var_9._id_0334 ) )
        {
            var_11 = getentarray( var_4.v["target"], "targetname" )[0];

            if ( isdefined( var_11 ) )
            {
                var_12 = var_11.origin;
                var_4.v["angles"] = vectortoangles( var_12 - var_4.v["origin"] );
            }
            else
            {
                var_11 = scripts\engine\utility::_id_7CD1( var_4.v["target"] );

                if ( isdefined( var_11 ) )
                {
                    var_12 = var_11.origin;
                    var_4.v["angles"] = vectortoangles( var_12 - var_4.v["origin"] );
                }
            }
        }

        if ( !isdefined( var_9.code_classname ) )
        {
            var_4._id_01F1 = var_9;

            if ( isdefined( var_4._id_01F1._id_EE24 ) )
                precachemodel( var_4._id_01F1._id_EE24 );
        }
        else if ( var_9.code_classname == "script_brushmodel" || isdefined( var_9._id_01F1 ) )
        {
            var_4._id_01F1 = var_9;
            var_4._id_01F1._id_5635 = var_9._id_ED5D;
        }

        if ( isdefined( var_9._id_0336 ) && isdefined( var_8[var_9._id_0336] ) )
            var_4.v["exploder_type"] = var_9._id_0336;
        else
            var_4.v["exploder_type"] = "normal";

        if ( isdefined( var_9._id_B3CC ) )
        {
            var_4.v["masked_exploder"] = var_9._id_01F1;
            var_4.v["masked_exploder_spawnflags"] = var_9._id_02AF;
            var_4.v["masked_exploder_script_disconnectpaths"] = var_9._id_ED5D;
            var_9 delete();
        }

        var_4 scripts\common\createfx::_id_D6CF();
    }
}

_id_F97F()
{
    waittillframeend;
    waittillframeend;
    waittillframeend;
    var_0 = [];

    foreach ( var_2 in level.createfxent )
    {
        if ( var_2.v["type"] != "exploder" )
            continue;

        var_3 = var_2.v["flag"];

        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3 == "nil" )
            var_2.v["flag"] = undefined;

        var_0[var_3] = 1;
    }

    foreach ( var_7, var_6 in var_0 )
        thread _id_69A9( var_7 );
}

_id_69A9( var_0 )
{
    if ( !scripts\engine\utility::_id_6E34( var_0 ) )
        scripts\engine\utility::_id_6E39( var_0 );

    scripts\engine\utility::_id_6E4C( var_0 );

    foreach ( var_2 in level.createfxent )
    {
        if ( var_2.v["type"] != "exploder" )
            continue;

        var_3 = var_2.v["flag"];

        if ( !isdefined( var_3 ) )
            continue;

        if ( var_3 != var_0 )
            continue;

        var_2 scripts\engine\utility::activate_individual_exploder();
    }
}

_id_69AC( var_0 )
{
    return isdefined( var_0._id_0336 ) && var_0._id_0336 == "exploder";
}

_id_69AD( var_0 )
{
    return var_0._id_01F1 == "fx" && ( !isdefined( var_0._id_0336 ) || var_0._id_0336 != "exploderchunk" );
}

_id_69AB( var_0 )
{
    return isdefined( var_0._id_0336 ) && var_0._id_0336 == "exploderchunk";
}

_id_100DB( var_0 )
{
    var_0 += "";

    if ( isdefined( level.createfxexploders ) )
    {
        var_1 = level.createfxexploders[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( !_id_69AD( var_3._id_01F1 ) && !_id_69AC( var_3._id_01F1 ) && !_id_69AB( var_3._id_01F1 ) )
                    var_3._id_01F1 show();

                if ( isdefined( var_3._id_3103 ) )
                    var_3._id_01F1 show();
            }

            return;
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level.createfxent.size; var_5++ )
        {
            var_3 = level.createfxent[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3.v["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3.v["exploder"] ) )
                continue;

            if ( var_3.v["exploder"] + "" != var_0 )
                continue;

            if ( isdefined( var_3._id_01F1 ) )
            {
                if ( !_id_69AD( var_3._id_01F1 ) && !_id_69AC( var_3._id_01F1 ) && !_id_69AB( var_3._id_01F1 ) )
                    var_3._id_01F1 show();

                if ( isdefined( var_3._id_3103 ) )
                    var_3._id_01F1 show();
            }
        }
    }
}

_id_10FED( var_0 )
{
    var_0 += "";

    if ( isdefined( level.createfxexploders ) )
    {
        var_1 = level.createfxexploders[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( !isdefined( var_3._id_B051 ) )
                    continue;

                if ( isdefined( var_3._id_B066 ) )
                {
                    var_3._id_B066 stoploopsound();
                    var_3._id_B066 delete();
                }

                var_3._id_B051 delete();
            }

            return;
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level.createfxent.size; var_5++ )
        {
            var_3 = level.createfxent[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3.v["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3.v["exploder"] ) )
                continue;

            if ( var_3.v["exploder"] + "" != var_0 )
                continue;

            if ( !isdefined( var_3._id_B051 ) )
                continue;

            if ( isdefined( var_3._id_B066 ) )
            {
                var_3._id_B066 stoploopsound();
                var_3._id_B066 delete();
            }

            var_3._id_B051 delete();
        }
    }
}

_id_79A7( var_0 )
{
    var_0 += "";
    var_1 = [];

    if ( isdefined( level.createfxexploders ) )
    {
        var_2 = level.createfxexploders[var_0];

        if ( isdefined( var_2 ) )
            var_1 = var_2;
    }
    else
    {
        foreach ( var_4 in level.createfxent )
        {
            if ( var_4.v["type"] != "exploder" )
                continue;

            if ( !isdefined( var_4.v["exploder"] ) )
                continue;

            if ( var_4.v["exploder"] + "" != var_0 )
                continue;

            var_1[var_1.size] = var_4;
        }
    }

    return var_1;
}

_id_8E81( var_0 )
{
    var_0 += "";

    if ( isdefined( level.createfxexploders ) )
    {
        var_1 = level.createfxexploders[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( isdefined( var_3._id_01F1 ) )
                    var_3._id_01F1 hide();
            }

            return;
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level.createfxent.size; var_5++ )
        {
            var_3 = level.createfxent[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3.v["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3.v["exploder"] ) )
                continue;

            if ( var_3.v["exploder"] + "" != var_0 )
                continue;

            if ( isdefined( var_3._id_01F1 ) )
                var_3._id_01F1 hide();
        }
    }
}

_id_5152( var_0 )
{
    var_0 += "";

    if ( isdefined( level.createfxexploders ) )
    {
        var_1 = level.createfxexploders[var_0];

        if ( isdefined( var_1 ) )
        {
            foreach ( var_3 in var_1 )
            {
                if ( isdefined( var_3._id_01F1 ) )
                    var_3._id_01F1 delete();
            }
        }
    }
    else
    {
        for ( var_5 = 0; var_5 < level.createfxent.size; var_5++ )
        {
            var_3 = level.createfxent[var_5];

            if ( !isdefined( var_3 ) )
                continue;

            if ( var_3.v["type"] != "exploder" )
                continue;

            if ( !isdefined( var_3.v["exploder"] ) )
                continue;

            if ( var_3.v["exploder"] + "" != var_0 )
                continue;

            if ( isdefined( var_3._id_01F1 ) )
                var_3._id_01F1 delete();
        }
    }

    level notify( "killexplodertridgers" + var_0 );
}

_id_69A6()
{
    if ( isdefined( self.v["delay"] ) )
        var_0 = self.v["delay"];
    else
        var_0 = 0;

    if ( isdefined( self.v["damage_radius"] ) )
        var_1 = self.v["damage_radius"];
    else
        var_1 = 128;

    var_2 = self.v["damage"];
    var_3 = self.v["origin"];
    wait( var_0 );

    if ( isdefined( level._id_4C6F ) )
        [[ level._id_4C6F ]]( var_3, var_1, var_2 );
    else
        radiusdamage( var_3, var_1, var_2, var_2 );
}

_id_15B9()
{
    if ( isdefined( self.v["firefx"] ) )
        thread _id_6CF5();

    if ( isdefined( self.v["fxid"] ) && self.v["fxid"] != "No FX" )
        thread _id_38D4();
    else if ( isdefined( self.v["soundalias"] ) && self.v["soundalias"] != "nil" )
        thread _id_1045A();

    if ( isdefined( self.v["loopsound"] ) && self.v["loopsound"] != "nil" )
        thread _id_5FE2();

    if ( isdefined( self.v["damage"] ) )
        thread _id_69A6();

    if ( isdefined( self.v["earthquake"] ) )
        thread _id_69A8();

    if ( isdefined( self.v["rumble"] ) )
        thread _id_69B0();

    if ( self.v["exploder_type"] == "exploder" )
        thread _id_3102();
    else if ( self.v["exploder_type"] == "exploderchunk" || self.v["exploder_type"] == "exploderchunk visible" )
        thread _id_3104();
    else
        thread _id_3101();
}

_id_3101()
{
    var_0 = self.v["exploder"];

    if ( isdefined( self.v["delay"] ) )
        wait( self.v["delay"] );
    else
        wait 0.05;

    if ( !isdefined( self._id_01F1 ) )
        return;

    if ( isdefined( self._id_01F1.classname ) )
    {
        if ( !_func_2A4( self._id_01F1 ) && isdefined( self._id_01F1.classname ) )
        {
            if ( scripts\engine\utility::_id_9F64() && self._id_01F1._id_02AF & 1 )
                self._id_01F1 call [[ level._id_74C2["connectPaths"] ]]();
        }
    }

    if ( level.createfx_enabled )
    {
        if ( isdefined( self._id_699E ) )
            return;

        self._id_699E = 1;
        self._id_01F1 hide();
        self._id_01F1 notsolid();
        wait 3;
        self._id_699E = undefined;
        self._id_01F1 show();
        self._id_01F1 solid();
        return;
    }

    if ( !isdefined( self.v["fxid"] ) || self.v["fxid"] == "No FX" )
        self.v["exploder"] = undefined;

    waittillframeend;

    if ( isdefined( self._id_01F1 ) && !_func_2A4( self._id_01F1 ) && isdefined( self._id_01F1.classname ) )
        self._id_01F1 delete();
}

_id_3104()
{
    if ( isdefined( self.v["delay"] ) )
        wait( self.v["delay"] );

    var_0 = undefined;

    if ( isdefined( self.v["target"] ) )
        var_0 = scripts\engine\utility::_id_7CD1( self.v["target"] );

    if ( !isdefined( var_0 ) )
    {
        self._id_01F1 delete();
        return;
    }

    self._id_01F1 show();

    if ( isdefined( self.v["delay_post"] ) )
        wait( self.v["delay_post"] );

    var_1 = self.v["origin"];
    var_2 = self.v["angles"];
    var_3 = var_0.origin;
    var_4 = isdefined( self.v["physics"] );

    if ( var_4 )
    {
        var_5 = undefined;

        if ( isdefined( var_0._id_0334 ) )
            var_5 = var_0 scripts\engine\utility::_id_7CD1();

        if ( isdefined( var_5 ) )
        {
            var_6 = var_0.origin;
            var_7 = vectornormalize( var_5.origin - var_0.origin );
        }
        else
        {
            var_6 = self._id_01F1.origin;
            var_7 = vectornormalize( var_3 - self._id_01F1.origin );
        }

        var_7 *= self.v["physics"];
        self._id_01F1 physicslaunchserver( var_6, var_7 );
        return;
    }
    else
    {
        var_7 = var_3 - self._id_01F1.origin;
        self._id_01F1 rotatevelocity( var_7, 12 );
        self._id_01F1 movegravity( var_7, 12 );
    }

    if ( level.createfx_enabled )
    {
        if ( isdefined( self._id_699E ) )
            return;

        self._id_699E = 1;
        wait 3;
        self._id_699E = undefined;
        self.v["origin"] = var_1;
        self.v["angles"] = var_2;
        self._id_01F1 hide();
        return;
    }

    self.v["exploder"] = undefined;
    wait 6;
    self._id_01F1 delete();
}

_id_3102()
{
    if ( isdefined( self.v["delay"] ) )
        wait( self.v["delay"] );

    if ( !isdefined( self._id_01F1._id_EE24 ) )
    {
        self._id_01F1 show();
        self._id_01F1 solid();
    }
    else
    {
        var_0 = self._id_01F1 scripts\engine\utility::_id_107E6();

        if ( isdefined( self._id_01F1._id_027C ) )
            var_0._id_027C = self._id_01F1._id_027C;

        var_0 setmodel( self._id_01F1._id_EE24 );
        var_0 show();
    }

    self._id_3103 = 1;

    if ( scripts\engine\utility::_id_9F64() && !isdefined( self._id_01F1._id_EE24 ) && self._id_01F1._id_02AF & 1 )
    {
        if ( !isdefined( self._id_01F1._id_5635 ) )
            self._id_01F1 call [[ level._id_74C2["connectPaths"] ]]();
        else
            self._id_01F1 call [[ level._id_74C2["disconnectPaths"] ]]();
    }

    if ( level.createfx_enabled )
    {
        if ( isdefined( self._id_699E ) )
            return;

        self._id_699E = 1;
        wait 3;
        self._id_699E = undefined;

        if ( !isdefined( self._id_01F1._id_EE24 ) )
        {
            self._id_01F1 hide();
            self._id_01F1 notsolid();
        }
    }
}

_id_69B0()
{
    if ( !scripts\engine\utility::_id_9F64() )
        return;

    _id_69A7();
    level.player playrumbleonentity( self.v["rumble"] );
}

_id_69A7()
{
    if ( !isdefined( self.v["delay"] ) )
        self.v["delay"] = 0;

    var_0 = self.v["delay"];
    var_1 = self.v["delay"] + 0.001;

    if ( isdefined( self.v["delay_min"] ) )
        var_0 = self.v["delay_min"];

    if ( isdefined( self.v["delay_max"] ) )
        var_1 = self.v["delay_max"];

    if ( var_0 > 0 )
        wait( randomfloatrange( var_0, var_1 ) );
}

_id_5FE2()
{
    if ( isdefined( self._id_B066 ) )
    {
        self._id_B066 stoploopsound();
        self._id_B066 delete();
    }

    var_0 = self.v["origin"];
    var_1 = self.v["loopsound"];
    _id_69A7();
    self._id_B066 = scripts\engine\utility::_id_CD86( var_1, var_0 );
}

_id_1045A()
{
    _id_5FE6();
}

_id_5FE6()
{
    var_0 = self.v["origin"];
    var_1 = self.v["soundalias"];
    _id_69A7();
    scripts\engine\utility::_id_CE2B( var_1, var_0 );
}

_id_69A8()
{
    _id_69A7();
    scripts\engine\utility::_id_577E( self.v["earthquake"], self.v["origin"] );
}

_id_69AF()
{
    if ( !isdefined( self.v["soundalias"] ) || self.v["soundalias"] == "nil" )
        return;

    scripts\engine\utility::_id_CE2B( self.v["soundalias"], self.v["origin"] );
}

_id_6CF5()
{
    var_0 = self.v["forward"];
    var_1 = self.v["up"];
    var_2 = undefined;
    var_3 = self.v["firefxsound"];
    var_4 = self.v["origin"];
    var_5 = self.v["firefx"];
    var_6 = self.v["ender"];

    if ( !isdefined( var_6 ) )
        var_6 = "createfx_effectStopper";

    var_7 = 0.5;

    if ( isdefined( self.v["firefxdelay"] ) )
        var_7 = self.v["firefxdelay"];

    _id_69A7();

    if ( isdefined( var_3 ) )
        scripts\engine\utility::_id_B040( var_3, var_4, 1, var_6 );

    playfx( level._effect[var_5], self.v["origin"], var_0, var_1 );
}

_id_38D4()
{
    if ( isdefined( self.v["repeat"] ) )
    {
        thread _id_69AF();

        for ( var_0 = 0; var_0 < self.v["repeat"]; var_0++ )
        {
            playfx( level._effect[self.v["fxid"]], self.v["origin"], self.v["forward"], self.v["up"] );
            _id_69A7();
        }

        return;
    }

    _id_69A7();

    if ( isdefined( self._id_B051 ) )
        self._id_B051 delete();

    self._id_B051 = spawnfx( scripts\engine\utility::_id_7ECB( self.v["fxid"] ), self.v["origin"], self.v["forward"], self.v["up"] );
    triggerfx( self._id_B051 );
    _id_69AF();
}

activate_exploder( var_0, var_1, var_2 )
{
    var_0 += "";
    level notify( "exploding_" + var_0 );
    var_3 = 0;

    if ( isdefined( level.createfxexploders ) && !level.createfx_enabled )
    {
        var_4 = level.createfxexploders[var_0];

        if ( isdefined( var_4 ) )
        {
            foreach ( var_6 in var_4 )
            {
                var_6 scripts\engine\utility::activate_individual_exploder();
                var_3 = 1;
            }
        }
    }
    else
    {
        for ( var_8 = 0; var_8 < level.createfxent.size; var_8++ )
        {
            var_6 = level.createfxent[var_8];

            if ( !isdefined( var_6 ) )
                continue;

            if ( var_6.v["type"] != "exploder" )
                continue;

            if ( !isdefined( var_6.v["exploder"] ) )
                continue;

            if ( var_6.v["exploder"] + "" != var_0 )
                continue;

            var_6 scripts\engine\utility::activate_individual_exploder();
            var_3 = 1;
        }
    }

    if ( !shouldrunserversideeffects() && !var_3 )
        activate_clientside_exploder( var_0, var_1, var_2 );
}

activate_clientside_exploder( var_0, var_1, var_2 )
{
    if ( !is_valid_clientside_exploder_name( var_0 ) )
        return;

    var_3 = int( var_0 );
    activateclientexploder( var_3, var_1, var_2 );
}

is_valid_clientside_exploder_name( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    var_1 = var_0;

    if ( isstring( var_0 ) )
    {
        var_1 = int( var_0 );

        if ( var_1 == 0 && var_0 != "0" )
            return 0;
    }

    return var_1 >= 0;
}

shouldrunserversideeffects()
{
    if ( scripts\engine\utility::_id_9F64() )
        return 1;

    if ( !isdefined( level.createfx_enabled ) )
        scripts\engine\utility::_id_F315();

    if ( level.createfx_enabled )
        return 1;
    else
        return getdvar( "clientSideEffects" ) != "1";
}

_id_69A5( var_0, var_1, var_2 )
{
    waittillframeend;
    waittillframeend;
    activate_exploder( var_0, var_1, var_2 );
}

_id_69A4( var_0, var_1, var_2 )
{
    activate_exploder( var_0, var_1, var_2 );
}

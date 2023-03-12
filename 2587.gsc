// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

_id_2980( var_0, var_1 )
{
    self._id_1198._id_1FC7[var_0] = var_1;
}

_id_2927( var_0 )
{
    if ( isdefined( self._id_1198._id_1FC7 ) && isdefined( self._id_1198._id_1FC7[var_0] ) )
        return self._id_1198._id_1FC7[var_0];

    return undefined;
}

_id_2928( var_0 )
{
    var_1 = _id_2927( var_0 );

    if ( isdefined( var_1 ) && var_1.size > 0 )
        return var_1 + "_";

    return undefined;
}

_id_298E()
{
    if ( isdefined( self._id_1198._id_B633 ) && self._id_1198._id_B633 )
        return 1;

    if ( isdefined( self._id_1198._id_3323 ) )
        return self._id_1198._id_3323;

    return 0;
}

_id_9DA4( var_0, var_1, var_2, var_3 )
{
    return self._id_1491._id_D6A5 == var_3;
}

_id_296A( var_0 )
{
    self._id_1198._id_527D = var_0;
}

_id_292C()
{
    return self._id_1198._id_527D;
}

_id_2949( var_0, var_1, var_2, var_3 )
{
    return self._id_1198._id_527D == var_3;
}

_id_297E( var_0 )
{
    self._id_1198._id_2B11 = !isdefined( var_0 ) || var_0;
}

_id_2941()
{
    if ( isdefined( self._id_1198._id_2B11 ) )
        return self._id_1198._id_2B11;

    return 0;
}

_id_294D( var_0, var_1, var_2, var_3 )
{
    return scripts\engine\utility::_id_13C07( self.weapon ) == var_3;
}

_id_2986( var_0, var_1, var_2, var_3 )
{
    if ( scripts\engine\utility::_id_13C07( self.weapon ) != "rocketlauncher" )
        return 0;

    var_4 = _id_292E();

    if ( !isdefined( var_4 ) )
        return 0;

    return var_4 != "rocketlauncher";
}

_id_2967()
{

}

_id_2917()
{

}

_id_2955()
{
    return self codemoverequested();
}

_id_2958( var_0, var_1, var_2, var_3 )
{
    return !self codemoverequested();
}

_id_2956( var_0 )
{
    return self._id_1198._id_BD23 == var_0;
}

_id_2968( var_0 )
{
    self._id_1198._id_BD23 = var_0;

    if ( var_0 == "cqb" )
        self._id_2303._id_13CAF = 0;
}

_id_2970( var_0 )
{
    self._id_1198._id_13CC2 = var_0;
}

_id_2919()
{
    self._id_1198._id_13CC2 = undefined;
}

_id_292E()
{
    return self._id_1198._id_13CC2;
}

_id_2969( var_0 )
{
    if ( !isdefined( var_0 ) )
        self._id_1198._id_2FC8 = 1;
    else
        self._id_1198._id_2FC8 = var_0;
}

_id_2959()
{
    if ( isdefined( self._id_1198._id_2FC8 ) )
        return self._id_1198._id_2FC8;

    return 0;
}

_id_296C( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        self._id_1198._id_313B = 1;
    else
        self._id_1198._id_313B = var_0;

    if ( self._id_1198._id_313B )
        self._id_1198._id_11815 = var_1;
    else
        self._id_1198._id_11815 = undefined;
}

_id_298A()
{
    if ( isdefined( self._id_1198._id_313B ) )
        return self._id_1198._id_313B && isdefined( self._id_1198._id_11815 );

    return 0;
}

_id_2930()
{
    return self._id_1198._id_11815;
}

_id_296D( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        self._id_1198._id_313D = 1;
    else
        self._id_1198._id_313D = var_0;

    if ( self._id_1198._id_313D )
        self._id_1198._id_1182F = var_1;
    else
        self._id_1198._id_1182F = undefined;
}

_id_298B()
{
    if ( isdefined( self._id_1198._id_313D ) )
        return self._id_1198._id_313D && isdefined( self._id_1198._id_1182F );

    return 0;
}

_id_2931()
{
    return self._id_1198._id_1182F;
}

_id_2962( var_0 )
{
    if ( !isdefined( var_0 ) )
        self._id_1198._id_2AA6 = 1;
    else
        self._id_1198._id_2AA6 = var_0;
}

_id_291C()
{
    if ( isdefined( self._id_1198._id_2AA6 ) )
        return self._id_1198._id_2AA6;

    return 0;
}

_id_2983( var_0, var_1 )
{
    self._id_1198._id_FECD = var_0;

    if ( isdefined( var_0 ) )
    {
        self._id_1198._id_FECD._id_0334 = var_1;

        if ( isdefined( var_1 ) )
            self._id_1198._id_FECD._id_3137 = 1;
        else
            self._id_1198._id_FECD._id_3137 = undefined;
    }
}

_id_2985()
{
    if ( isdefined( self._id_1198._id_FECD ) )
    {
        if ( isdefined( self._id_FED1 ) && isdefined( self._id_1198._id_FECD._id_D699 ) )
            return 1;

        if ( isdefined( self._id_595D ) && self._id_595D )
            return 0;

        if ( isdefined( self._id_1198._id_FECD._id_0334 ) && isdefined( self._id_010C ) && self._id_010C == self._id_1198._id_FECD._id_0334 )
            return scripts\engine\utility::_id_9DA3();
    }

    return 0;
}

_id_2961( var_0 )
{
    self._id_1198._id_474D = var_0;
}

_id_292B()
{
    if ( !isdefined( self._id_1198._id_474D ) )
        return "none";

    return self._id_1198._id_474D;
}

_id_2948( var_0, var_1, var_2, var_3 )
{
    return _id_292B() == var_3;
}

_id_2944( var_0, var_1, var_2, var_3 )
{
    return _id_292B() != var_3;
}

_id_295E( var_0 )
{
    self._id_1198._id_4720 = var_0;
}

_id_2929()
{
    return self._id_1198._id_4720;
}

_id_2947( var_0, var_1, var_2, var_3 )
{
    return isdefined( self._id_1198._id_4720 ) && self._id_1198._id_4720 == var_3;
}

_id_2946( var_0, var_1, var_2, var_3 )
{
    return _id_292B() == "exposed" && _id_2947( var_0, var_1, var_2, var_3 );
}

_id_2943( var_0, var_1, var_2, var_3 )
{
    return _id_292B() != "exposed" || !_id_2947( var_0, var_1, var_2, var_3 );
}

_id_295D( var_0 )
{
    self._id_1198._id_2996 = var_0;
}

_id_291A()
{
    return isdefined( self._id_1198._id_2996 ) && self._id_1198._id_2996;
}

_id_2976( var_0 )
{
    self._id_1198._id_473C = var_0;
    self._id_1198._id_2AB3 = isdefined( var_0 );
}

_id_2932()
{
    return isdefined( self._id_1198._id_2AB3 ) && self._id_1198._id_2AB3;
}

_id_2920()
{
    return self._id_1198._id_473C;
}

_id_292D()
{
    if ( isdefined( self._id_1198._id_E1AE ) )
        return self._id_1198._id_E1AE;

    return undefined;
}

_id_296E( var_0 )
{
    self._id_1198._id_E1AE = var_0;
}

_id_296F( var_0 )
{
    self._id_1198._id_E1AF = var_0;
}

_id_2934( var_0, var_1, var_2, var_3 )
{
    return isdefined( self._id_1198._id_10171 ) && isdefined( self._id_0205 ) && self._id_1198._id_10171 == self._id_0205 && distancesquared( self._id_0205.origin, self.origin ) > 16;
}

_id_2936( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self._id_1198._id_10171 ) )
        return 0;

    if ( !isdefined( self._id_0205 ) )
        return 0;

    if ( self._id_1198._id_10171 != self._id_0205 )
        return 0;

    if ( distancesquared( self._id_0205.origin, self.origin ) <= 16 )
        return 0;

    if ( self._id_1198._id_10171.type != var_3 )
        return 0;

    return 1;
}

_id_9F53( var_0, var_1 )
{
    var_2 = vectornormalize( var_0.origin - self.origin );
    var_3 = anglestoforward( var_0.angles );
    var_4 = vectorcross( var_3, var_2 );

    if ( var_4[2] > 0 && var_1 == "left" )
        return 1;

    if ( var_4[2] < 0 && var_1 == "right" )
        return 1;

    return 0;
}

_id_2935( var_0, var_1, var_2, var_3 )
{
    if ( !_id_2934( var_0, var_1, var_2, var_3 ) )
        return 0;

    return _id_9F53( self._id_1198._id_10171, var_3 );
}

_id_2933( var_0, var_1, var_2, var_3 )
{
    if ( !_id_2934( var_0, var_1, var_2, var_3 ) )
        return 0;

    if ( !_id_9F53( self._id_1198._id_10171, var_3 ) )
        return 0;

    if ( var_3 == "right" )
        return self._id_1198._id_1016B.type == "Cover Right" && self._id_1198._id_10171.type == "Cover Left";
    else
        return self._id_1198._id_1016B.type == "Cover Left" && self._id_1198._id_10171.type == "Cover Right";
}

_id_2973()
{
    self._id_1198._id_1FCD = 1;
}

_id_2911()
{
    self._id_1198._id_1FCD = 0;
}

_id_2938()
{
    if ( !isdefined( self.script ) )
        return 0;

    return self.script == "scripted" || self.script == "<custom>" || scripts\engine\utility::_id_9CEE( self._id_1198._id_1FCD );
}

_id_2965( var_0 )
{
    self._id_1198._id_B633 = 1;
    self._id_1198._id_B638 = var_0;
    self._id_1198._id_B637 = 0;
}

_id_2925()
{
    if ( !isdefined( self._id_1198._id_B633 ) )
        return undefined;

    return self._id_1198._id_B638;
}

_id_2914()
{
    self._id_1198._id_B633 = undefined;
    self._id_1198._id_B638 = undefined;
}

_id_2915()
{
    self._id_1198._id_B637 = undefined;
}

_id_2952( var_0, var_1, var_2, var_3 )
{
    return isdefined( self._id_1198._id_B637 );
}

_id_2951( var_0, var_1, var_2, var_3 )
{
    return isdefined( self._id_1198._id_B637 ) && self._id_1198._id_B637;
}

_id_2953( var_0, var_1, var_2, var_3 )
{
    return isdefined( self._id_1198._id_B633 ) && self._id_1198._id_B633;
}

_id_2954( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self._id_B55B ) )
        return 1;

    if ( !isdefined( self._id_B55B._id_0334 ) )
        return 1;

    return 0;
}

_id_2966( var_0, var_1 )
{
    self._id_1198._id_B634 = 1;
    self._id_1198._id_B635 = var_0;
    self._id_1198._id_B636 = var_1;
}

_id_2913()
{
    self._id_1198._id_B634 = undefined;
    self._id_1198._id_B635 = undefined;
    self._id_1198._id_B636 = undefined;
}

_id_2950( var_0, var_1, var_2, var_3 )
{
    return isdefined( self._id_1198._id_B634 ) && self._id_1198._id_B634 && isdefined( self._id_0233 );
}

_id_2957( var_0, var_1, var_2, var_3 )
{
    return !_id_2950( var_0, var_1, var_2, var_3 );
}

_id_294F( var_0, var_1, var_2, var_3 )
{
    if ( _id_2950( var_0, var_1, var_2, var_3 ) )
        return 0;

    return 1;
}

_id_2923()
{
    if ( !isdefined( self._id_1198._id_B634 ) )
        return undefined;

    return self._id_1198._id_B635;
}

_id_2924()
{
    return self._id_1198._id_B636;
}

_id_2964( var_0 )
{
    self._id_1198._id_2AB0 = var_0;
}

_id_293D( var_0, var_1, var_2, var_3 )
{
    return isdefined( self._id_1198._id_2AB0 ) && self._id_1198._id_2AB0;
}

_id_2963( var_0 )
{
    self._id_1198._id_2AAF = var_0;
}

_id_293C()
{
    return isdefined( self._id_1198._id_2AAF ) && self._id_1198._id_2AAF;
}

_id_2971( var_0 )
{
    self._id_1198._id_13D14 = var_0;
}

_id_294E()
{
    return isdefined( self._id_1198._id_13D14 );
}

_id_292F()
{
    return self._id_1198._id_13D14;
}

_id_293B()
{
    var_0 = _id_2920();

    if ( !isdefined( var_0 ) )
        var_0 = self._id_0205;

    var_1 = isdefined( var_0 ) && ( var_0.type == "Conceal Crouch" || var_0.type == "Conceal Stand" );
    return self._id_1198._id_BD23 == "frantic" && !var_1;
}

_id_2942()
{
    var_0 = _id_2926();

    if ( isdefined( var_0 ) )
        return 1;

    return 0;
}

_id_2926()
{
    var_0 = 0;
    var_1 = undefined;

    if ( !isdefined( self._id_1198._id_5665 ) )
        return var_1;

    if ( isdefined( self._id_1198._id_5665["left_leg"] ) )
    {
        var_0++;
        var_1 = "left";
    }

    if ( isdefined( self._id_1198._id_5665["right_leg"] ) )
    {
        var_0++;
        var_1 = "right";
    }

    if ( var_0 == 2 )
        var_1 = "both";

    return var_1;
}

_id_9ED3( var_0 )
{
    if ( !isdefined( self._id_1198 ) )
        return 0;

    if ( isdefined( self._id_1198._id_EF3B ) )
    {
        if ( !isdefined( self._id_1198._id_EF3B[var_0] ) )
            return 0;

        return self._id_1198._id_EF3B[var_0]._id_10E19 == "dismember";
    }

    if ( !isdefined( self._id_1198._id_5665 ) )
        return 0;

    return isdefined( self._id_1198._id_5665[var_0] );
}

_id_2945( var_0, var_1, var_2, var_3 )
{
    return _id_9ED3( var_3 );
}

_id_13919( var_0 )
{
    if ( isdefined( self._id_1198._id_EF3B ) )
    {
        if ( !isdefined( self._id_1198._id_EF3B[var_0] ) )
            return 0;

        if ( self._id_1198._id_EF3B[var_0]._id_10E19 != "dismember" )
            return 0;

        return self._id_1198._id_EF3B[var_0].time == gettime();
    }

    if ( !isdefined( self._id_1198._id_5665 ) )
        return 0;

    if ( !isdefined( self._id_1198._id_5665[var_0] ) )
        return 0;

    return self._id_1198._id_5665[var_0] == gettime();
}

_id_298F( var_0, var_1, var_2, var_3 )
{
    return _id_13919( var_3 );
}

_id_2991( var_0, var_1, var_2, var_3 )
{
    return _id_9ED3( var_3[0] ) && _id_13919( var_3[1] );
}

_id_291B( var_0 )
{
    self._id_1198._id_5665[var_0] = gettime();
}

_id_2982( var_0 )
{
    self._id_1198._id_F1EB = var_0;
}

_id_294B()
{
    if ( !isdefined( self._id_1198._id_F1EB ) )
    {
        if ( isdefined( self._id_3135._id_72DD ) && gettime() > self._id_3135._id_72DD )
            self._id_1198._id_F1EB = 1;
    }

    return isdefined( self._id_1198._id_F1EB );
}

_id_2972()
{
    self._id_1198._id_F1FF = 1;
}

_id_2988()
{
    return isdefined( self._id_1198._id_F1FF );
}

_id_297C( var_0 )
{
    self._id_1198._id_9E22 = var_0;
}

_id_293F()
{
    if ( isdefined( self._id_3135._id_4882 ) )
        return 0;

    return isdefined( self._id_1198._id_9E22 );
}

_id_2974( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = 1;

    var_2 = "left";

    if ( var_0 == var_2 )
        var_2 = "right";

    if ( isdefined( self._id_1198._id_E5E7 ) && isdefined( self._id_1198._id_E5E7[var_2] ) )
    {
        self._id_1198._id_E5E7[var_2] = 0;
        self._id_1198._id_E5E7[var_0] = 0;
        return;
    }

    self._id_1198._id_E5E7[var_0] = var_1;
}

_id_2910( var_0 )
{
    if ( !isdefined( self._id_1198._id_E5E7 ) )
        return 0;

    if ( !isdefined( self._id_1198._id_E5E7[var_0] ) )
        return 0;

    if ( !self._id_1198._id_E5E7[var_0] )
        return 0;

    return 1;
}

_id_2981( var_0 )
{
    self._id_1198._id_E5FF = var_0;
}

_id_2918( var_0 )
{
    self._id_1198._id_E600 = undefined;
}

_id_294A( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( self._id_1198._id_E5FF ) )
        return 0;

    return 1;
}

_id_297F( var_0 )
{
    self._id_B55B = spawnstruct();
    var_0._id_B55B = spawnstruct();
    self._id_B55B._id_0334 = var_0;
    self._id_B55B._id_C92C = var_0;
    var_0._id_B55B._id_C92C = self;
}

_id_2916()
{
    if ( !isdefined( self._id_B55B ) )
        return;

    if ( isdefined( self._id_B55B._id_0334 ) )
        self._id_B55B._id_0334._id_B55B = undefined;

    if ( isdefined( self._id_B55B._id_1168C ) )
        self._id_B55B._id_1168C delete();

    self._id_B55B = undefined;
}

_id_2977( var_0 )
{
    self._id_1198._id_4879 = var_0;
}

_id_293A()
{
    return isdefined( self._id_1198._id_4879 );
}

_id_297B( var_0 )
{
    self._id_1198._id_8C52 = var_0;
}

_id_293E()
{
    return isdefined( self._id_1198._id_8C52 );
}

_id_2922()
{
    return self._id_1198._id_8C52;
}

_id_297D( var_0 )
{
    self._id_1198._id_2992 = var_0;
}

_id_2940()
{
    return isdefined( self._id_1198._id_2992 ) && self._id_1198._id_2992;
}

_id_2975( var_0 )
{
    self._id_1198._id_3FEC = var_0;
    self._id_1198._id_3FED = gettime();
}

_id_291D( var_0 )
{
    return self._id_1198._id_3FEC;
}

_id_291E()
{
    return self._id_1198._id_3FED;
}

_id_1005F( var_0, var_1, var_2, var_3 )
{
    return !isdefined( self._id_2F39 ) || !self._id_2F39;
}

_id_294C()
{
    return isdefined( self._id_1198._id_FEED ) && self._id_1198._id_FEED;
}

_id_2984( var_0 )
{
    self._id_1198._id_FEED = var_0;
}

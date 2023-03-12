// IW7 GSC SOURCE
// Dumped by https://github.com/xensik/gsc-tool

init()
{
    var_0 = getentarray( "destructable", "targetname" );

    if ( getdvar( "scr_destructables" ) == "0" )
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            var_0[var_1] delete();
    }
    else
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
            var_0[var_1] thread _id_5335();
    }
}

_id_5335()
{
    var_0 = 40;
    var_1 = 0;

    if ( isdefined( self._id_ECE4 ) )
        var_0 = self._id_ECE4;

    if ( isdefined( self._id_EEE3 ) )
        var_1 = self._id_EEE3;

    if ( isdefined( self._id_ED59 ) )
    {
        var_2 = strtok( self._id_ED59, " " );

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
            _id_2BAB( var_2[var_3] );
    }

    if ( isdefined( self._id_EDBB ) )
        self._id_7542 = loadfx( self._id_EDBB );

    var_4 = 0;
    self setcandamage( 1 );

    for (;;)
    {
        self waittill( "damage", var_5, var_6 );

        if ( var_5 >= var_1 )
        {
            var_4 += var_5;

            if ( var_4 >= var_0 )
            {
                thread _id_5334();
                return;
            }
        }
    }
}

_id_5334()
{
    var_0 = self;

    if ( isdefined( self._id_ED59 ) )
    {
        var_1 = strtok( self._id_ED59, " " );

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
            _id_12B81( var_1[var_2] );
    }

    if ( isdefined( var_0._id_7542 ) )
        playfx( var_0._id_7542, var_0.origin + ( 0, 0, 6 ) );

    var_0 delete();
}

_id_2BAB( var_0 )
{

}

_id_2BAD( var_0, var_1 )
{

}

_id_12B81( var_0 )
{

}

_id_12B82( var_0, var_1 )
{

}

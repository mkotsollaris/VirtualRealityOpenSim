integer LightTurnedOn;

default
{
    touch_start(integer total_number)
    {
        LightTurnedOn = !LightTurnedOn;
        vector COLOR_WHITE = <1.0, 1.0, 1.0>;
        
        if(LightTurnedOn)
        {
            llSetLinkPrimitiveParamsFast(LINK_SET, [PRIM_FULLBRIGHT, ALL_SIDES, TRUE]);
llSetLinkPrimitiveParamsFast(LINK_ALL_CHILDREN,[PRIM_POINT_LIGHT, TRUE, COLOR_WHITE, 1.0, 13.0, 0.6]);
        }
        else
        {
                        llSetLinkPrimitiveParamsFast(LINK_SET, [PRIM_FULLBRIGHT, ALL_SIDES, FALSE]);
llSetLinkPrimitiveParamsFast(LINK_ALL_CHILDREN,[PRIM_POINT_LIGHT, FALSE, COLOR_WHITE, 1.0, 13.0, 0.6]);
        }
    }
}
default
{
    touch_start(integer num_detected)
    {
        rotation rot = llGetLocalRot();

        if(rot.z==0) //door closed
        {
            rot.z=-0.707107;
            rot.s=0.707107;
        }
        else //door opened
        {
            rot.z=0;
            rot.s=1;
        }  
        llSetLocalRot(rot);  
    }
}
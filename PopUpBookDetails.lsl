string mainMenuDialog = "\nTitle:
Author:
Category:
Description:\n";

list mainMenuButtons = ["OK"]; 
integer dialogChannel;
integer dialogHandle;
 
open_menu(key inputKey, string inputString, list inputList)
{
    dialogChannel = (integer)llFrand(DEBUG_CHANNEL)*-1;
    dialogHandle = llListen(dialogChannel, "", inputKey, "");
    llDialog(inputKey, inputString, inputList, dialogChannel);
    llSetTimerEvent(30.0);
}

close_menu()
{
    llSetTimerEvent(0.0);
    llListenRemove(dialogHandle);
}
 
default
{
    on_rez(integer start_param)
    {
        llResetScript();
    }
 
    touch_start(integer total_number)
    {
        key id = llDetectedKey(0);
        close_menu();
        open_menu(id, mainMenuDialog, mainMenuButtons);
    }
 
    listen(integer channel, string name, key id, string message)
    {
        if(channel != dialogChannel)
            return;
 
        close_menu();
 
        if(message == "-Main-")
            open_menu(id, mainMenuDialog, mainMenuButtons);
    }
 
    timer()
    {
        close_menu();
    }
}
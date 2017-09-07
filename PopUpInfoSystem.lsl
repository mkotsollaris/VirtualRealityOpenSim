/*******************************************************************************
*
*
* Script Description: Creates several menus in order to interface with any user
* that touches the object.
*
*
*******************************************************************************/

// representing a book as 4 lists with the sections: title, author, category, shelf
list title;
list author;
list category;
list shelf;

//Data import
DataImport()
{
   title=["Beginning Ubuntu LTS Server Administration","THE TWO TOWERS","Number Theory Through Inquiry","In The Hour of Peril","Go to the Doctor","Sea Creatures","Big Red Lollipop","Small Crimes","Harry Potter and the Goblet of Fire","Can I have a ... with you?","Number One Kid","The Last Days Of The Lacuna Cabal","Inconstant Moon","The Great Gatsby","The Jungle Upton Sinclair","The Iron Man","Shouting Won't Help","Fearless Beauty","Cholera","Guy Kawasaki","Simmer and Smoke","Cathing Fire","Modern Cartoonist","BAD","Captain Marvel","Space Between Us","New Moon","Twilight","Murder By Death","Little brother fate","Making Short Films","The school for Husbands","The Gettysburc Adress","Ecologies of Decay","Trundy Powrot","The right way to do wrong","HAP PYF ISH","The House Girl","Making Ideas Happen","FSTR JMS GLCK","Lauren Conrad","Nova","The Third Man Factor","Castle in the Sky","His Dark Materials","This Bright River","Yummy","Dinosaurs","Count with Dora!","Don't Lick the Dog","UNLEASH","Penguin by Design","The art of Immersion","Creature","Eclpise","Dead Men","Lie of Pi","The Mistress","The cat in the Hat","Ever Falled in Love","Double Shot","The Humane Interface","Pieces of Light","The sun in the Simply still","The Secret Language of Leadership","Harry Potter and the Deathly Hallows","The Almost Moon","Sex And The City","The Leader's Guide to StoryTelling","Why we Suck","Don't worry we won't kill you","Before Green Gables","The Hunt for Red October","His Dark Materials","Darwin's Island","Iceberg","Something Wicked Weird","Harry Potter and the Deathly Hallows","1984","The Golden Compass","The Bokk of The damned","SunSet Kisses","Brad Thor Full Black","The Selection","Book of Truth","Moonwalking with Einstein","FAHRENHEIT 451","What Every Body is Saying","India","American Psycho","The Magician King","Lord of the Rings","The Misfit","Online Marketing","The Real Story"];
author=["Sander van Vugt","J.R.R. Tolkien","David Marshall, Edward Odell, Michael Starbird","Daniel Stashower","Stan & Jan Berenstain","Justin Draskyl","Rukhsana Khan, Sophie Blackall","Matthew Kneale","J.K. Rowling","Howard Richler","Patricia Beilly Gift","Sean Dixon","Laurel L. Russwurm","Scitt Fitzgerald","Markus Gerlen","Ted Hughes","Katherine Bouton","Brian Frangs","Josef Delteil","Gedrik Paul","King Coral","Suzanne Collins","Daniel Clowes","Michael Jackson","Marvel","Thrity Umrigar","Stephenie Meyer","Stephanie Meyer","Magnus Carlsen","Mary-Carter Roberts","Clifford Thurlow","Wendy Holden","Charles Octave","Jean-Michel Mapp","Eugeniusz Gruda","Harry Houdini","Bard Nick","Tara ConKlin","Scott Belsky","James Gleick","L.A. Candy","James Boice","John Geiger","Jessalynn Anders","Philip Pullman","Patrick Somerville","Lucy Cousins","Will Osborne, Mary Pope Osborne","Phoebe Benstein","Wendy Wahman","David Brown","Phil Baines","Frank Rose","Andrew Zuckerman","Stephenie Meyer","M.E. Chaber","Yann Martel","Carter Brown","Dr. Seuss","Zoe Strachan","Anna Blundy","Jef Raskin","Charles Fernyhough","Markus Scholes","Stephen Denning","J.K Rowling","Alice Sebold","Candace Bushnell","Stephen Denning","Dr. Denis Leary","Leoni Witson","Budge Wilson","Tom Claney","Philip Pullman","Steve Jones","Ali Smith","Chris Mould","J.K. Rowling","George Orwell","Philip Pullman","Charles Fort","Ermisenda Alvarez","George Washincton","Artur Babayeuski","Maria Divine Mercy","Joshua Foer","Ray Bradbury","Joe Navard","Draskyl Wun","Bret Easton Ellis","Maria Dersik","E. Tolkin","Kazil Fredberg","Papatheodorou Christos","Stephen R. Donaldson"];
category=["Computers","Novel","Mathematics","Novel, Biography","Medical","Educational","Novel","Crime","Novel, Adventure","Novel","Novel, Adventure","Novel","Mystery","Novel","Mystery","Science Fiction, Adventure","Political","Horror, Novel","Novel","Novel","Adventure","Novel","Novel, crime","Horror","Comics","Novel","Drama","Drama","Horror","Crime","Educational","Novel","Novel, Horror","Novel, Adventure","Novel","Novel","Novel, Adventures","Novel","Educational","Novel","Novel","Novel","Adventure, Educational","Novel","Mystery","Educational","Adventure","Educational","Educational","Novel","Thriller","Novel","Novel","Educational","Novel","Novel, Adventure","Novel","Novel","Novel","Novel, Drama","Novel","Educational","Novel","Novel","Novel","Novel","Novel","Educational","Novel","Novel","Drama, Horror","Novel","Novel","Novel","Novel","Novel","Horror, Novel","Science Fiction","Historical","Novel","Novel","Novel , Romance","Thriller","Romance","Novel","Novel","Science Fiction","Novel","Educational","Horror","Science Fiction","Adventure, Science fiction","Novel, Thriler","Educational","Science Fiction"];
shelf=[1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8];   
}

//@input (resultList): The books that were found in the search operation
//@return (producedDialogList): List of strings for each Dialog. Each string
//costs lower than 512 bytes.
list DialogProduction(list resultList)
{
    list producedDialogList = [];
    string producedDialog="Search Results:\n";
    string index;
    integer i=0;
    integer end = llGetListLength(resultList);
    integer counter=0;//counter for strided list elements. works as delimiter (each 4 elements)
    integer numberofbook=0;
    for(;i<end;i++)
    {
        index = llList2String(resultList,i);
        if(counter == 0)
        {
            numberofbook++;
            //New Dialog string
            if(numberofbook%6==0)
            {
                producedDialogList = producedDialog + producedDialogList;
                producedDialog = "\n";
            }
            producedDialog +=(string)numberofbook;
            producedDialog +=")";
            producedDialog +="Title: ";
            producedDialog +=(string)index;
            producedDialog +="\n";
            
            counter++;
        }
        else if(counter == 1)
        {
            producedDialog +="Author: ";
            producedDialog +=(string)index;
            producedDialog +="\n";
            counter++;     
        }
        else if(counter == 2)
        {
            producedDialog +="Category: ";
            producedDialog +=(string)index;
            producedDialog +="\n";
            counter++;             
        }
        else if(counter == 3)
        {
            producedDialog +="Shelf: ";
            producedDialog +=(string)index;
            producedDialog +="\n\n";
            counter=0;            
        }
    }
    
    producedDialogList = producedDialog + producedDialogList;
    return producedDialogList;
}
//Search Function
//@input (parameter): title or author or category or shelf
//(keyword): the keyword given by user (keyword is being searched)
//@return (resultList) the search result with structure: Strided list with step = 4
//with values: title,author,category,shelf
list SearchResult(string parameter, string keyword)
{
    list resultList;
    
    list searchingList;//the List that we are searching
    if(parameter == "title")
    {
        searchingList = title;
    }
    else if(parameter == "author")
    {
        searchingList = author;
    }
    else if(parameter == "category")
    {
        searchingList = category;
    }
    else if(parameter == "shelf")
    {
        searchingList = shelf;
    }
    
    integer lengthsearchingList = llGetListLength(searchingList);
    string index;
    integer i=0;
    integer end = lengthsearchingList;
    integer flagsubstringIndex; //!=-1 if it is substring of the wanted keyword, works as boolean
    
    for(; i<end; i++)
    {
        index=llList2String(searchingList,i);
        //Lower-casing any possible capslock - ignoring case sensitivity   
        flagsubstringIndex = llSubStringIndex(llToLower(index),llToLower(keyword));
        
        if(flagsubstringIndex != -1) //Substring found
        {
            //adding matching elements to our list
            resultList+=llList2String(title,i);
            resultList+=llList2String(author,i);
            resultList+=llList2String(category,i);
            resultList+=llList2String(shelf,i);
        }
    }
    return resultList;
}

string mainMenuDialog = "\nWhich action would you like to access?\nClick \"Close\" to close the menu.";
list mainMenuButtons = ["Books", "About", "Close"];

string bookDialog = "\nWhat parameter would you like to search?";
list bookButtons = ["Title","Author","Category","Shelf","Close", "-"];

string aboutDialog = "\nThe Local Library is a nice place to relax and learn about the new-coming books, in a wonderful and peaceful environment!";
list aboutButtons = ["Close", "-"];

list historyButtons = ["OK","<<previous", "next>>"];
list historyNextButtons = ["OK","next>>"];
list historyPrevButtons = ["OK","<<previous"];
list historyOKButtons = ["OK"];
//the dialogs of the following sections will be produced dynamically each time, depending on the input given
list titleButtons=["OK"];
list authorButtons = ["OK"];
list shelfButtons = ["OK"];
list categoryButtons = ["OK"];

//global counter keeping track of the dynamically produced strings for llDialog creation
integer currenthistoryKeeper;
list producedDialog=[];

//required global variables for Listen function
key ToucherID;
integer dialogChannel;
integer listenHandle;
 
default
{
    state_entry()
    {
        //unique negative channel for communicating with Dialogs
        dialogChannel = -1 - (integer)("0x" + llGetSubString( (string)llGetKey(), -7, -1) );
    }
 
    touch_start(integer num_detected)
    {
        ToucherID = llDetectedKey(0);
        llListenRemove(listenHandle);
        
        listenHandle = llListen(dialogChannel, "", ToucherID, "");
        llDialog(ToucherID, mainMenuDialog, mainMenuButtons, dialogChannel);
        llSetTimerEvent(80.0); //removes any listener after 80 seconds
    }
 
    
    listen(integer channel, string name, key id, string message)
    {
        if (message == "-")
        {
            llDialog(ToucherID, mainMenuDialog, mainMenuButtons, dialogChannel);
        }
        if (message == "Close" || message== "OK")
        {
            llListenRemove(listenHandle);
        }
        
        if (message == "Books")
        {
            llDialog(ToucherID, bookDialog, bookButtons, dialogChannel);
        }
        else if(message == "About")
        {
            llDialog(ToucherID, aboutDialog, aboutButtons, dialogChannel);
        }
        else if (message == "Author")
        {
            listenHandle = llListen(-5, "", ToucherID, "");
            llTextBox(ToucherID, "\nType the name of the author you are looking for:", -5);

        }
        else if(message == "next>>")
        {
            if(currenthistoryKeeper-1 > 0) //has more elements to be shown
            {
                currenthistoryKeeper--;         
                llDialog(ToucherID,llList2String(producedDialog,currenthistoryKeeper), historyButtons, dialogChannel);
            }
            else if(currenthistoryKeeper-1 == 0)
            {
                currenthistoryKeeper--;
                llDialog(ToucherID,llList2String(producedDialog,currenthistoryKeeper), historyPrevButtons, dialogChannel);
            }
        }
        else if(message == "<<previous")
        {
            integer maxIndexproducedDialog=llGetListLength(producedDialog)-1;
            if(currenthistoryKeeper+1 == maxIndexproducedDialog) //no more previous page to be shown
            {
                currenthistoryKeeper++;
                llDialog(ToucherID,llList2String(producedDialog,currenthistoryKeeper), historyNextButtons, dialogChannel);
            }
            else if(currenthistoryKeeper+1 < maxIndexproducedDialog)//has more pages to be shown
            {
                currenthistoryKeeper++;
                llDialog(ToucherID,llList2String(producedDialog,currenthistoryKeeper), historyButtons, dialogChannel);
            }
        }
        else if (message == "Title")
        {
            listenHandle = llListen(-6, "", ToucherID, "");
            llTextBox(ToucherID, "\nType the title of the book you are looking for:", -6);
        }
        else if(message == "Shelf")
        {
            listenHandle = llListen(-8, "", ToucherID, "");
            llTextBox(ToucherID, "\nType the number of the shelf to see its containing books:", -8);
        }
        else if(message == "Category")
        {
            listenHandle = llListen(-7, "", ToucherID, "");
            llTextBox(ToucherID, "\nType the category of the book you are looking for:", -7);
        }
        else
        {
            integer flagImport=0;//0:data imported, 1:data not imported
            list resultList;//the list of the results after Searching
            //importing the data of books
            if(channel==-5 || channel==-6 ||channel==-7 || channel==-8)
            {
                DataImport();
                flagImport=1;
            }
            if(channel==-5) //channel -5 used for searching by author
            {
                listenHandle = llListen(dialogChannel, "", ToucherID, "");
                resultList = SearchResult("author",message);
                producedDialog = DialogProduction(resultList);
                currenthistoryKeeper=llGetListLength(producedDialog)-1;
                if(llGetListLength(producedDialog)>1)
                {
                    llDialog(ToucherID,llList2String(producedDialog,currenthistoryKeeper), historyNextButtons, dialogChannel);
                }
                else
                {
                    llDialog(ToucherID,llList2String(producedDialog,currenthistoryKeeper), historyOKButtons, dialogChannel);                    
                }
            }
            else if(channel==-6)//channel -6 used for searching by title
            {
                listenHandle = llListen(dialogChannel, "", ToucherID, "");
                resultList = SearchResult("title",message);
                producedDialog = DialogProduction(resultList);
                currenthistoryKeeper=llGetListLength(producedDialog)-1;
                if(llGetListLength(producedDialog)>1)
                {
                    llDialog(ToucherID,llList2String(producedDialog,currenthistoryKeeper), historyNextButtons, dialogChannel);
                }
                else
                {
                    llDialog(ToucherID,llList2String(producedDialog,currenthistoryKeeper), historyOKButtons, dialogChannel);                    
                }               
            }
            else if(channel==-7)//channel -7 used for searchin by category
            {
                listenHandle = llListen(dialogChannel, "", ToucherID, "");
                resultList = SearchResult("category",message);
                producedDialog = DialogProduction(resultList);
                currenthistoryKeeper=llGetListLength(producedDialog)-1;
                if(llGetListLength(producedDialog)>1)
                {
                    llDialog(ToucherID,llList2String(producedDialog,currenthistoryKeeper), historyNextButtons, dialogChannel);
                }
                else
                {
                    llDialog(ToucherID,llList2String(producedDialog,currenthistoryKeeper), historyOKButtons, dialogChannel);                    
                }                 
            }
            else if(channel==-8)//channel -8 used for searching by shelf
            {
                listenHandle = llListen(dialogChannel, "", ToucherID, "");
                resultList = SearchResult("shelf",message);
                producedDialog = DialogProduction(resultList);
                currenthistoryKeeper=llGetListLength(producedDialog)-1;
                if(llGetListLength(producedDialog)>1)
                {
                    llDialog(ToucherID,llList2String(producedDialog,currenthistoryKeeper), historyNextButtons, dialogChannel);
                }
                else
                {
                    llDialog(ToucherID,llList2String(producedDialog,currenthistoryKeeper), historyOKButtons, dialogChannel);                    
                }                
            }
            
            //Clearing Lists to free memory at the end of the operations
            if(flagImport==1)
            {
                title = [];
                author = [];
                category = [];
                shelf = [];
                resultList= [];
            }
        }
    }
    
    timer()
    {
        llSetTimerEvent(0);
        llListenRemove(listenHandle);
    }
}
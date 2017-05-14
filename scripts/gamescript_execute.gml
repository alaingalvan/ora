//gamescript_execute(inputstring)
//By Alain Galvan
//You're free to use this tutorial as you'd like, but if it's not to much trouble,
//Please add me in the credits if you can. Thanks! This script doesn't modify a history, so can work by itself. 
///////////////////////////////////////////////////////////////////////////////
/*
This script takes an input string, tokenizes it and analyzes the tokens. 
The script will then return a string to the string_history var, but you can
change this to do anything you want in game. 

An example token would be:
hpheal
help
epheal
spawn

depending on each token, the anyaliser will expect certain tokens to follow. 
if they don't follow, the analyzer will return an error message. 
*/
///////////////////////////////////////////////////////////////////////////////
//Initialize
///////////////////////////////////////////////////////////////////////////////
var inputstring, cur_char, cur_token, l;
inputstring = argument0
cur_char = 0
cur_token = 0
tokenlistmax = 1
for (l = 0; l < tokenlistmax; l += 1)
{
    tokenlist[l] = ""
}
///////////////////////////////////////////////////////////////////////////////
//Populate tokenlist array.
///////////////////////////////////////////////////////////////////////////////
while (cur_char < string_length(inputstring))
{
    cur_char += 1;

    if string_char_at(inputstring, cur_char) != " "
    {
        tokenlist[cur_token] += string_char_at(inputstring, cur_char)
    }

    if string_char_at(inputstring, cur_char) == " "
    {
        //Break array adding.

        tokenlist[cur_token + 1] = ""
        cur_token += 1
        tokenlistmax += 1
    }


}

///////////////////////////////////////////////////////////////////////////////
//Token Reactions
///////////////////////////////////////////////////////////////////////////////
var a;
for (a = 0; a < tokenlistmax; a += 1)
{

//----------------------------------------------------------------------------\\
//return - Calculates the next token if it's a digit and returns it.  
//----------------------------------------------------------------------------\\
    if string_lower(tokenlist[a]) == "return"
    {
        if a < tokenlistmax - 1 //change that 1 to however many arguments you have.
        {
            if string_isdigit(tokenlist[a + 1])
            {
            //Do something
            }
        }
    }

//----------------------------------------------------------------------------\\
//multiply <a> <b> - Multiplies a with b.   
//----------------------------------------------------------------------------\\
    if string_lower(tokenlist[a]) == "multiply"
    {
        if a < tokenlistmax - 2 //change that 1 to however many arguments you have.
        {
            if string_isdigit(tokenlist[a + 1]) and string_isdigit(tokenlist[a + 2])
            {
            //(real(tokenlist[a + 1])*real(tokenlist[a + 2]))
            }
        }
    }
}


///////////////////////////////////////////////////////////////////////////////
//Clear Arraylist
///////////////////////////////////////////////////////////////////////////////
for (a = 0; a < tokenlistmax; a += 1)
{
    tokenlist[a] = ""
}

/// scrInflect(word, count)

var word, n;
word = argument[0];
n    = argument[1];

if (word == "úkol")
    {
     if (n == 1) {return "úkol";}
     else if (n < 5) {return "úkoly";}
     else {return "úkolů";}
    }
if (word == "aktivní")
    {
     if (n < 5) {return "aktivní";}
     else {return "aktivních";}
    }
if (word == "bod")
    {
     if (n <= 0) {return "bodů";}
     else if (n < 2) {return "bod";}
     else if (n < 5) {return "body";}
     else {return "bodů";}
    }
if (word == "život")
    {
     if (n <= 0) {return "životů";}
     else if (n < 2) {return "život";}
     else if (n < 5) {return "životy";}
     else {return "životů";}
    }

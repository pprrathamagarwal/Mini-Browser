%{
    #include <stdio.h>
    #include <string.h>
    // Token definitions
    #define TOKBODY 1
    #define TOKBODYCLOSE 2
    #define TOKNAV 3
    #define TOKNAVCLOSE 4
    #define TOKUL 5
    #define TOKULCLOSE 6
    #define TOKLI 7
    #define TOKLICLOSE 8
    #define TOKHEADER 9
    #define TOKHEADERCLOSE 10
    #define TOKH1 11
    #define TOKH1CLOSE 12
    #define TOKH2 13
    #define TOKH2CLOSE 14
    #define TOKH3 15
    #define TOKH3CLOSE 16
    #define TOKH4 17
    #define TOKH4CLOSE 18
    #define TOKH5 19
    #define TOKH5CLOSE 20
    #define TOKP 21
    #define TOKPCLOSE 22
    #define TOKSECTION 23
    #define TOKSECTIONCLOSE 24
    #define TOKARTICLE 25
    #define TOKARTICLECLOSE 26
    #define TOKASIDE 50
    #define TOKASIDECLOSE 27
    #define TOKFOOTER 28
    #define TOKFOOTERCLOSE 29
    #define TOKIMG 30
    #define TOKA 31
    #define TOKACLOSE 32
    #define TOKSTRONG 33
    #define TOKSTRONGCLOSE 34
    #define TOKEM 35
    #define TOKEMCLOSE 36
    #define TOKU 37
    #define TOKUCLOSE 38
    #define TOKSMALL 39
    #define TOKSMALLCLOSE 40
    #define TOKBLOCKQUOTE 41
    #define TOKBLOCKQUOTECLOSE 42
    #define TOKPRE 43
    #define TOKPRECLOSE 44
    #define TOKOL 45
    #define TOKOLCLOSE 46
    #define TOKCODE 47
    #define TOKCODECLOSE 48
    extern int yylval;

%}

/* Regular expression definitions */

digit               [0-9]
alpha               [a-zA-Z]
alphaNum            [a-zA-Z0-9]
special             [\!\+*=\-\.,?`~@\$%\^&\;\:'"\_\(\)]
text                ({alphaNum}|{special})*
newtext             {text}({space}{text})*
space               [ ]
attribute           {alpha}+={alphaNum}+
whitespace          [ \t\n\r]

%%

\<html\>                  { printf("HTML Open");}
\<\/html\>                 { printf("HTML Close");}

\<head\>                  { printf("Head Open"); }
\<\/head\>                 { printf("HTML Close"); }

\<title\>                 { printf("Title Open"); }
\<\/title\>                { printf("Title Close"); }

\<\/ul\>                   { return TOKULCLOSE; }

\<li\>                    { return TOKLI; }
\<\/li\>                   { return TOKLICLOSE; }

\<header\>                { return TOKHEADER; }
\<\/header\>               { return TOKHEADERCLOSE; }

\<h1\>                    { return TOKH1; }
\<\/h1\>                   { return TOKH1CLOSE; }

\<h2\>                    { return TOKH2; }
\<\/h2\>                   { return TOKH2CLOSE; }

\<h3\>                    { return TOKH3; }
\<\/h3\>                   { return TOKH3CLOSE; }

\<h4\>                    { return TOKH4; }
\<\/h4\>                   { return TOKH4CLOSE; }

\<h5\>                    { return TOKH5; }
\<\/h5\>                   { return TOKH5CLOSE; }

\<p\>                     { return TOKP; }
\<\/p\>                    { return TOKPCLOSE; }

\<section\>               { return TOKSECTION; }
\<\/section\>              { return TOKSECTIONCLOSE; }

\<article\>               { return TOKARTICLE; }
\<\/article\>              { return TOKARTICLECLOSE; }

\<aside\>                 { return TOKASIDE; }
\<\/aside\>                { return TOKASIDECLOSE; }

\<footer\>                { return TOKFOOTER; }
\<\/footer\>               { return TOKFOOTERCLOSE; }

\<img\>                  { return TOKIMG; }
\<a\>                     { return TOKA; }
\<\/a\>                    { return TOKACLOSE; }

\<strong\>                { return TOKSTRONG; }
\<\/strong\>               { return TOKSTRONGCLOSE; }

\<em\>                    { return TOKEM; }
\<\/em\>                   { return TOKEMCLOSE; }

\<u\>                     { return TOKU; }
\<\/u\>                    { return TOKUCLOSE; }

\<small\>                 { return TOKSMALL; }
\<\/small\>                { return TOKSMALLCLOSE; }

\<blockquote\>            { return TOKBLOCKQUOTE; }
\<\/blockquote\>           { return TOKBLOCKQUOTECLOSE; }

\<pre\>                   { return TOKPRE; }
\<\/pre\>                  { return TOKPRECLOSE; }

\<code\>                  { return TOKCODE; }
\<\/code\>                 { return TOKCODECLOSE; }

\<ol\>                    { return TOKOL; }
\<\/ol\>                   { return TOKOLCLOSE; }

%%
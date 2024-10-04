/*HTML, head, title, body, nav, ul, li, header, h1, h2, h3, h4, h5, p, section, article, aside, footer,img, a, strong, em, u, small, blockquote, pre, code, ol.*/

%{
#include "parser.tab.h"
#include "helper.h"

#define SVAL(token) {yylval.str = strdup(yytext); return (token);}
#define LEX(token) return (token);
%}

/* Regular expression definitions */
alphaNum            [a-zA-Z0-9]
punc                [\!\+/=\-\.,?@\$%\^&;\:'"<>\(\)_]
space               [ ]
text                ({alphaNum}|{punc})*
newtext             {text}({space}{text})*

html                "<html>"
head                "<head>"
title               "<title>"
body                "<body>"
nav                 "<nav>"
ul                  "<ul>"
li                  "<li>"
header              "<header>"
h1                  "<h1>"
h2                  "<h2>"
h3                  "<h3>"
h4                  "<h4>"
h5                  "<h5>"
p                   "<p>"
section             "<section>"
article             "<article>"
aside               "<aside>"
footer              "<footer>"
img                 "<img"
a                   "<a"
strong              "<strong>"
em                  "<em>"
u                   "<u>"
small               "<small>"
blockquote          "<blockquote>"
pre                 "<pre>"
code                "<code>"
ol                  "<ol>"

%%

{html}              { LEX(HTML); }
{head}              { LEX(HEAD); }
{title}             { LEX(TITLE); }
{body}              { LEX(BODY); }
{nav}               { LEX(NAV); }
{ul}                { LEX(UL); }
{li}                { LEX(LI); }
{header}            { LEX(HEADER); }
{h1}                { LEX(H1); }
{h2}                { LEX(H2); }
{h3}                { LEX(H3); }
{h4}                { LEX(H4); }
{h5}                { LEX(H5); }
{p}                 { LEX(P); }
{section}           { LEX(SECTION); }
{article}           { LEX(ARTICLE); }
{aside}             { LEX(ASIDE); }
{footer}            { LEX(FOOTER); }
{img}               { LEX(IMG); }
{a}                 { LEX(A); }
{strong}            { LEX(STRONG); }
{em}                { LEX(EM); }
{u}                 { LEX(U); }
{small}             { LEX(SMALL); }
{blockquote}        { LEX(BLOCKQUOTE); }
{pre}               { LEX(PRE); }
{code}              { LEX(CODE); }
{ol}                { LEX(OL); }

"\\{"               { LEX(OPEN_BRACE); }
"\\}"               { LEX(CLOSE_BRACE); }
[\r\n]              ;  // Ignore newlines
.                   { printf("Unexpected character: %s\n", yytext); }

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (file) {
            yyin = file;
            yylex();
            fclose(file);
        }
    } else {
        yylex();
    }
    return 0;
}

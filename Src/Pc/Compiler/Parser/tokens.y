%namespace Microsoft.Pc.Parser
%using Microsoft.Pc.Domains;
%visibility internal 
%YYSTYPE LexValue
%sharetokens
%partial
%tokentype PTokens
%parsertype DummyTokenParser

%token INT BOOL ANY SEQ MAP ID
%token TYPE INCLUDE MAIN EVENT MACHINE ASSUME SPEC ENUM EVENTSET

%token VAR START HOT COLD MODEL STATE FUN ACTION GROUP OBSERVES

%token ENTRY EXIT DEFER IGNORE GOTO ON DO PUSH AS WITH

%token IF WHILE THIS NEW RETURN ID POP ASSERT PRINT CALL RAISE SEND DEFAULT HALT NULL RECEIVE CASE ANNOUNCE
%token LPAREN RPAREN LCBRACE RCBRACE LBRACKET RBRACKET SIZEOF KEYS VALUES

%token TRUE FALSE

%token EVENTSET
%token RECEIVES SENDS CREATES EXTERN

%token SWAP, REF, XFER

%token ASSIGN REMOVE INSERT
%token EQ NE LT GT LE GE IN
%left LAND LNOT LOR NONDET FAIRNONDET

%token DOT COLON COMMA
%left  SEMICOLON

%token INT BOOL STR

%left  PLUS MINUS
%left  DIV
%left  MUL 
%token ELSE

%token maxParseToken 
%token LEX_WHITE LEX_ERROR LEX_COMMENT



%%
DummyTokensRule
	: {}
	;
" Vim/Neovim Complete Syntax File for ColdFusion
" Language: ColdFusion Markup Language (CFML)
" Maintainer: ColdFusion Syntax Team
" Version: 2.1
" Last Updated: 2025-02-05

" Prevent duplicate loading
if exists("b:current_syntax")
  finish
endif

" ColdFusion is case-insensitive
syntax case ignore

" ======================
"  HTML Tags & Attributes
" ======================
syntax keyword htmlTagName
    \ a abbr address area article aside audio
    \ b base bdi bdo blockquote body br button
    \ canvas caption cite code col colgroup
    \ data datalist dd del details dfn dialog
    \ div dl dt em embed fieldset figcaption
    \ figure footer form h1 h2 h3 h4 h5 h6
    \ head header hr html i iframe img input
    \ ins kbd label legend li link main map
    \ mark meta meter nav noscript object ol
    \ optgroup option output p param picture
    \ pre progress q rp rt ruby s samp script
    \ section select small source span strong
    \ style sub summary sup svg table tbody
    \ td template textarea tfoot th thead
    \ time title tr track u ul var video wbr

syntax keyword htmlArg
    \ accept accept-charset accesskey action
    \ align alt async autocomplete autofocus
    \ border cellpadding cellspacing challenge
    \ charset checked class cols colspan
    \ content contenteditable contextmenu data-*
    \ datetime default defer dir dirname
    \ disabled download draggable enctype
    \ for form formaction headers height
    \ hidden high href hreflang http-equiv
    \ id imagesrcset imagesizes inputmode
    \ integrity is keytype kind label
    \ lang list loop low max maxlength
    \ media method min minlength multiple
    \ name novalidate onabort onafterprint
    \ onbeforeprint onbeforeunload onblur
    \ oncanplay oncanplaythrough onchange
    \ onclick oncontextmenu oncopy oncut
    \ ondblclick ondrag ondragend ondragenter
    \ ondragleave ondragover ondragstart
    \ ondrop ondurationchange onemptied
    \ onended onerror onfocus onhashchange
    \ oninput oninvalid onkeydown onkeypress
    \ onkeyup onload onloadeddata
    \ onloadedmetadata onloadstart onmessage
    \ onmousedown onmousemove onmouseout
    \ onmouseover onmouseup onmousewheel
    \ onoffline ononline onpagehide onpageshow
    \ onpaste onpause onplay onplaying
    \ onpopstate onprogress onratechange
    \ onreset onresize onscroll onsearch
    \ onseeked onseeking onselect onstalled
    \ onstorage onsubmit onsuspend ontimeupdate
    \ ontoggle onunload onvolumechange
    \ onwaiting open optimum pattern placeholder
    \ poster preload radiogroup readonly
    \ referrerpolicy rel required reversed
    \ rows rowspan sandbox scope seamless
    \ selected shape size sizes step
    \ tabindex target title translate type
    \ usemap value width wrap

" ======================
"  ColdFusion Core Syntax
" ======================
syntax keyword cfmlTag
    \ cfabort cfapplet cfapplication cfargument
    \ cfassociate cfbreak cfcache cfcalendar
    \ cfcase cfcatch cfchart cfchartdata
    \ cfchartseries cfcol cfcolumn cfcomponent
    \ cfcontent cfcookie cfdbinfo cfdirectory
    \ cfdump cfelse cfelseif cfemailparam
    \ cfexecute cfexit cffile cfflush cfform
    \ cfformgroup cfformitem cffunction cfgrid
    \ cfgridcolumn cfgridrow cfheader cfhtmlhead
    \ cfhttp cfhttpparam cfif cfimport cfinclude
    \ cfindex cfinput cfinsert cfinterface
    \ cfinvoke cfinvokeargument cfldap cfloop
    \ cfmail cfmailpart cfmailparam cfmodule
    \ cfobject cfobjectcache cfoutput cfparam
    \ cfpresentation cfpresentationslide
    \ cfprocessingdirective cfprocparam
    \ cfprocresult cfprop cfquery cfqueryparam
    \ cfread cfreadline cfregistry cfreport
    \ cfreturn cfsavecontent cfschedule cfscript
    \ cfset cfsetting cfsilent cfslider
    \ cfspreadsheet cfstore cfswitch cftable
    \ cftextarea cfthread cfthrow cftimer
    \ cftrace cftransaction cftree cftreeitem
    \ cfupdate cfwddx cfzip cfzipparam fuseaction set
    \ include circuit

syntax keyword cfmlScriptKeywords
    \ abstract and break case catch
    \ continue default do else extends
    \ final finally for function if
    \ implements import in interface new
    \ not or package private property
    \ public return rethrow switch
    \ then throw to try while var is lt gt eq neq exit

syntax keyword cfmlFunctions
    \ abs acos addsoaprequestheader addsoapresponseheader
    \ ajaxlink ajaxonload applicationstarttime applicationstop
    \ argon2checkhash array arrayappend arrayavg arrayclear
    \ arraycontains arraycontainsnocase arraydelete arraydeleteat
    \ arraydeletenocase arrayeach arrayevery arrayfilter arrayfind
    \ arrayfindall arrayfindallnocase arrayfindnocase arrayfirst
    \ arraygetmetadata arrayindexexists arrayinsertat arrayisdefined
    \ isarray isbinary isboolean isclosure iscustomfunction
    \ isdate isdateobject isddx isdebugmode isdefined
    \ isempty isfileobject isimage isimagefile isinstanceof
    \ isinthread isipinrange isipv6 isjson isk2serverabroker
    \ isk2serverdoccountexceeded isk2serveronline isleapyear islocalhost
    \ isnotmap isnull isnumeric isnumericdate isobject ispdfarchive
    \ ispdffile ispdfobject isquery issafehtml issimplevalue
    \ issoaprequest isspreadsheetfile isspreadsheetobject isstruct
    \ isuserinanyrole isuserinrole isuserloggedin isvalid
    \ isvalidoauthaccesstoken isvideofile iswddx isxml
    \ isxmlattribute isxmldoc isxmlelem isxmlnode isxmlroot
    \ iszipfile javacast jsstringformat lcase left
    \ len listappend listavg listchangedelims listcompact
    \ listcontains listcontainsnocase listdeleteat listeach
    \ listevery listfilter listfind listfindnocase listfirst
    \ listgetat listindexexists listinsertat listitemtrim
    \ listlast listlen listmap listprepend listqualify
    \ listreduce listreduceright listremoveduplicates listrest
    \ listsetat listsome listsort listtoarray listtrim
    \ listvaluecount listvaluecountnocase ljustify location
    \ log log10 lscurrencyformat lsdateformat lsdatetimeformat
    \ lsdayofweek lseurocurrencyformat lsiscurrency lsisdate
    \ lsisnumeric lsnumberformat lsparsecurrency lsparsedatetime
    \ lsparseeurocurrency lsparsenumber lstimeformat lsweek
    \ ltrim manifestread max metaphone mid
    \ millisecond min minute month
    \ monthasstring monthshortasstring newline now nowserver
    \ nullvalue numberformat objectequals objectload
    \ objectsave onapplicationend onapplicationstart
    \ onerror onmissingmethod onmissingtemplate onrequest
    \ onrequestend onrequeststart onserverstart onsessionend
    \ onsessionstart ormclearsession ormcloseallsessions
    \ ormclosesession ormevictcollection ormevictentity ormevictqueries
    \ ormexecutequery ormflush ormflushall ormgetsession
    \ ormgetsessionfactory ormindex ormindexpurge ormreload
    \ ormsearch ormsearchoffline pagepoolclear pagepoollist
    \ paragraphformat parameterexists parsedatetime parsenumber
    \ pi precisionevaluate preservesinglequotes quarter
    \ query queryaddcolumn queryaddrow queryappend queryclear
    \ querycolumnarray querycolumncount querycolumndata
    \ querycolumnexists querycolumnlist queryconvertforgrid
    \ querycurrentrow querydeletecolumn querydeleterow
    \ queryeach queryevery queryexecute queryfilter querygetcell
    \ querygetresult querygetrow queryinsertat querykeyexists
    \ querylazy querymap querynew queryprepend
    \ queryrecordcount queryreduce queryreverse queryrowdata
    \ queryrowswap querysetcell querysetrow queryslice
    \ querysome querysort quotedvaluelist rand randomize
    \ randrange reescape refind refindnocase releasecomobject rematch
    \ rematchnocase removecachedquery removechars render
    \ repeatstring replace replacelist replacelistnocase
    \ replacenocase rereplace rereplacenocase restdeleteapplication
    \ restinitapplication restsetresponse reverse
    \ right rjustify round rtrim runasync sanitizehtml
    \ second sendgatewaymessage serialize serializeavro
    \ serializejson serializeprotobuf serializexml sessiongetmetadata
    \ sessioninvalidate sessionrotate sessionstarttime setencoding
    \ setlocale setprofilestring settimezone setvariable
    \ sgn sin sizeof sleep soundex spanexcluding spanincluding
    \ spreadsheetaddautofilter spreadsheetaddcolumn spreadsheetaddfreezepane
    \ spreadsheetaddimage spreadsheetaddinfo spreadsheetaddpagebreaks
    \ spreadsheetaddrow spreadsheetaddrows spreadsheetaddsplitpane
    \ spreadsheetcreatesheet spreadsheetdeletecolumn spreadsheetdeletecolumns
    \ spreadsheetdeleterow spreadsheetdeleterows spreadsheetformatcell
    \ spreadsheetformatcellrange spreadsheetformatcolumn spreadsheetformatcolumns
    \ spreadsheetformatrow spreadsheetformatrows spreadsheetgetcellcomment
    \ spreadsheetgetcellformula spreadsheetgetcellvalue
    \ spreadsheetgetcolumncount spreadsheetinfo spreadsheetmergecells
    \ spreadsheetnew spreadsheetread spreadsheetreadbinary
    \ spreadsheetremovesheet spreadsheetsetactivesheet
    \ spreadsheetsetactivesheetnumber spreadsheetsetcellcomment
    \ spreadsheetsetcellformula spreadsheetsetcellvalue
    \ spreadsheetsetcolumnwidth spreadsheetsetfooter
    \ spreadsheetsetheader spreadsheetsetrowheight spreadsheetshiftcolumns
    \ spreadsheetshiftrows spreadsheetwrite sqr sslcertificateinstall
    \ sslcertificatelist storeaddacl storegetacl
    \ storegetmetadata storesetacl storesetmetadata
    \ stringeach stringevery stringfilter stringlen
    \ stringmap stringreduce stringreduceright stringsome
    \ stringsort stripcr structappend structclear
    \ structcopy structcount structdelete structeach
    \ structequals structevery structfilter structfind
    \ structfindkey structfindvalue structget structgetmetadata
    \ structinsert structiscasesensitive structisempty
    \ structisordered structkeyarray StructKeyExists
    \ structkeylist structkeytranslate structlistnew structmap
    \ structnew structreduce structsetmetadata
    \ structsome structsort structtosorted structupdate
    \ structvaluearray systemcacheclear systemoutput
    \ tan threadjoin threadterminate throw timeformat
    \ tobase64 tobinary tonumeric toscript tostring
    \ trace transactioncommit transactionrollback
    \ transactionsetsavepoint trim truefalseformat
    \ ucase ucfirst unserializejava urldecode
    \ urlencode urlencodedformat urlsessionformat val
    \ valuearray valuelist verifybcrypthash verifyclient
    \ verifyencryptedjwt verifyscrypthash verifysignedjwt
    \ webservicenew week wrap writebody writedump
    \ writelog writeoutput wsgetallchannels wsgetsubscribers
    \ wspublish wssendmessage xmlchildpos xmlclear
    \ xmldeleteat xmlelemnew xmlformat xmlgetnodetype
    \ xmlhaschild xmlnew xmlparse xmlsearch
    \ xmltransform xmlupdate xmlvalidate year
    \ yesnoformat


syntax keyword luceeFunctions
      \ expandPath fileWrite fileRead fileAppend serializeJSON FileUpload FileUploadAll structKeyArray queryExecute


syntax keyword cfmlScope
    \ application arguments cgi cffile
    \ client cookie form local
    \ request server session thistag url document

" ======================
"  Basic Syntax Elements
" ======================
syntax region cfmlString start=+"+ end=+"+ contains=cfmlHashSurround,cfmlTag
syntax region cfmlString start=+'+ end=+'+ contains=cfmlHashSurround,cfmlTag

" syntax match cfmlNumber "\<\d\+\>"
" syntax match cfmlNumber "\<\d\+\.\d\+\>"

syntax match cfmlNumber "\<\d\+\(\.\d\+\)\?\>"

syntax match cfmlOperator   "\v\=|\+|\-|\&|\."



syntax region cfmlHashSurround
    \ keepend
    \ oneline
    \ start="#"
    \ end="#"
    \ skip="##"
    \ contains=cfmlFunctions

" ======================
"  Comment Handling
" ======================
syntax region cfmlCommentBlock
    \ keepend
    \ start="/\*"
    \ end="\*/"

syntax match cfmlCommentLine "\/\/.*$"


syntax match cfmlSqlCommentLine /--.*$/ contained


syntax region cfmlTagComment
    \ keepend extend
    \ start="<!---"
    \ end="--->"
    \ skip="<!---" contains=cfmlTagComment


syntax region cfmlTagShortComment
    \ keepend extend
    \ start="<!--"
    \ end="-->"
    \ skip="<!--" contains=cfmlTagShortComment


syntax match cfmlScriptComment "/\*\_.\{-}\*/"


sy cluster cfmlComment
  \ contains=
    \cfmlCommentBlock,
    \cfmlCommentLine,
    \cfmlTagComment,
    \cfmlTagShortComment,
    \cfmlScriptComment


" ======================
"  Embedded Language Support
" ======================
" JavaScript Support
" syntax include @jsSyntax syntax/javascript.vim
syntax region cfmlJavascriptBlock
    \ fold
    \ keepend
    \ transparent
    \ start="<script\s*\_[^>]*>"
    \ end="</script>"
    \ contains=@jsSyntax

syntax cluster jsSyntax contains=
    \ htmlTagName,
    \ cfmlTag,
    \ cfmlScriptKeywords,
    \ cfmlFunctions,
    \ cfmlScope,
    \ cfmlString,
    \ cfmlNumber,
    \ cfmlHashSurround,
    \ @cfmlComment,
    \ cfmlOperator,


" SQL Support
" syntax include @sqlSyntax syntax/sql.vim


syntax keyword cfmlSqlKeywords contained
      \ ABORT ABSOLUTE ACCESS ACTION ADD ADMIN AFTER AGGREGATE ALL ALSO ALTER ALWAYS ANALYSE ANALYZE AND ANY ARRAY AS ASC ASSERTION ASSIGNMENT ASYMMETRIC AT ATTRIBUTE AUTHORIZATION BACKWARD BEFORE BEGIN BETWEEN BIGINT BINARY BIT BOOLEAN BOTH BY CACHE CALLED CASCADE CASE CAST CATALOG CHAIN CHAR CHARACTER CHARACTERISTICS CHECK CHECKPOINT CLASS CLOSE CLUSTER COALESCE COLLATE COLLATION COLUMN COLUMNS COMMENT COMMENTS COMMIT COMMITTED CONCURRENTLY CONFIGURATION CONFLICT CONNECTION CONSTRAINT CONSTRAINTS CONTENT CONTINUE CONVERSION COPY COST CREATE CREATEDB CREATEROLE CREATEUSER CROSS CSV CURRENT CURRENT_CATALOG CURRENT_DATE CURRENT_ROLE CURRENT_SCHEMA CURRENT_TIME CURRENT_TIMESTAMP CURRENT_USER CURSOR CYCLE DATA DATABASE DAY DEALLOCATE DEC DECIMAL DECLARE DEFAULT DEFAULTS DEFERRABLE DEFERRED DEFINER DELETE DELIMITER DELIMITERS DESC DETERMINISTIC DICTIONARY DISABLE DISCARD DISTINCT DO DOCUMENT DOMAIN DOUBLE DROP EACH ELSE ENABLE ENCODING ENCRYPTED END ENUM ESCAPE EXCEPT EXCLUDE EXCLUDING EXCLUSIVE EXECUTE EXISTS EXPLAIN EXTERNAL EXTRACT FALSE FAMILY FETCH FILTER FIRST FLOAT FOLLOWING FOR FORCE FOREIGN FORWARD FREEZE FROM FULL FUNCTION FUNCTIONS GENERATED GLOBAL GRANT GRANTED GREATEST GROUP GROUPING HANDLER HAVING HEADER HOLD HOUR IDENTITY IF ILIKE IMMEDIATE IMMUTABLE IMPLICIT IMPORT IN INCLUDING INCREMENT INDEX INDEXES INHERIT INHERITS INITIALLY INLINE INNER INOUT INPUT INSENSITIVE INSERT INSTEAD INT INTEGER INTERSECT INTERVAL INTO INVOKER IS ISNULL ISOLATION JOIN KEY LABEL LANGUAGE LARGE LAST LATERAL LEADING LEAKPROOF LEAST LEFT LEVEL LIKE LIMIT LISTEN LOAD LOCAL LOCALTIME LOCALTIMESTAMP LOCATION LOCK LOCKED LOGGED MAPPING MATCH MATERIALIZED MAXVALUE METHOD MINUTE MINVALUE MODE MONTH MOVE NAME NAMES NATIONAL NATURAL NCHAR NEW NEXT NO NOCREATEDB NOCREATEROLE NOINHERIT NOLOGIN NONE NOT NOTHING NOTIFY NOTNULL NOWAIT NULL NULLIF NULLS NUMERIC OBJECT OF OFF OFFSET OIDS OLD ON ONLY OPERATOR OPTION OPTIONS OR ORDER ORDINALITY OUT OUTER OVER OVERLAPS OVERLAY OWNED OWNER PARALLEL PARSER PARTIAL PARTITION PASSING PASSWORD PLACING PLANS POLICY POSITION PRECEDING PRECISION PRESERVE PREPARE PREPARED PRIMARY PRIOR PRIVILEGES PROCEDURAL PROCEDURE PROGRAM PUBLICATION QUOTE RANGE READ REAL REASSIGN RECHECK RECURSIVE REF REFERENCES REFERENCING REFRESH REINDEX RELATIVE RELEASE RENAME REPEATABLE REPLACE REPLICA RESET RESTART RESTRICT RETURNING RETURNS REVOKE RIGHT ROLE ROLLBACK ROW ROWS RULE SAVEPOINT SCHEMA SCHEMAS SCROLL SEARCH SECOND SECURITY SELECT SEQUENCE SEQUENCES SERIALIZABLE SERVER SESSION SESSION_USER SET SETOF SHARE SHOW SIMILAR SIMPLE SKIP SMALLINT SNAPSHOT SOME SQL STABLE STANDALONE START STATEMENT STATISTICS STDIN STDOUT STORAGE STRICT STRIP SUBSTRING SYMMETRIC SYSID SYSTEM TABLE TABLES TABLESAMPLE TABLESPACE TEMP TEMPLATE TEMPORARY TEXT THEN TIME TIMESTAMP TO TRAILING TRANSACTION TRANSFORM TREAT TRIGGER TRIM TRUE TRUNCATE TRUSTED TYPE TYPES UNBOUNDED UNCOMMITTED UNENCRYPTED UNION UNIQUE UNKNOWN UNLISTEN UNLOGGED UNTIL UPDATE USER USING VACUUM VALID VALIDATE VALIDATOR VALUE VALUES VARCHAR VARIADIC VARYING VERBOSE VERSION VIEW VIEWS VOLATILE WHEN WHERE WHITESPACE WINDOW WITH WITHIN WITHOUT WORK WRAPPER WRITE XML YEAR YES ZONE


syn keyword cfmlSqlFunctions contained
      \ UPPER LOWER INITCAP CONCAT SUBSTRING REPLACE TRIM LENGTH CHAR_LENGTH POSITION COALESCE NULLIF ROUND ABS CEIL FLOOR MOD POWER RANDOM SQRT EXP LOG DATE_PART DATE_TRUNC CURRENT_DATE CURRENT_TIME CURRENT_TIMESTAMP EXTRACT AGE NOW TO_CHAR TO_DATE TO_NUMBER CAST SUM AVG MIN MAX COUNT ARRAY_AGG STRING_AGG JSON_BUILD_OBJECT JSON_EXTRACT_PATH GENERATE_SERIES GREATEST LEAST CASE WHEN COALESCE NULLIF MD5 ENCODE DECODE PG_SLEEP VERSION


syntax region cfmlQueryTagRegion
    \ fold
    \ keepend
    \ transparent
    \ start="<cfquery" end="</cfquery>" contains=
    \ cfmlScriptKeywords,
    \ cfmlSqlKeywords,
    \ cfmlSqlFunctions,
    \ cfmlFunctions,
    \ cfmlScope,
    \ cfmlString,
    \ cfmlNumber,
    \ cfmlHashSurround,
    \ cfmlOperator,
    \ cfmlTag,
    \ @cfmlComment,
    \ cfmlSqlCommentLine,


" CFScript Support
syntax region cfmlScriptBlock
    \ fold
    \ keepend
    \ transparent
    \ start="<cfscript>" end="</cfscript>"
    \ contains=@cfmlScript

syntax cluster cfmlScript contains=
    \ cfmlScriptKeywords,
    \ cfmlFunctions,
    \ cfmlScope,
    \ cfmlString,
    \ cfmlNumber,
    \ cfmlHashSurround,
    \ cfmlOperator,
    \ cfmlTag,
    \ @cfmlComment,
    \ luceeFunctions

" ======================
"  Highlight Links
" ======================
highlight link htmlTagName Tag
highlight link htmlArg Attribute
highlight link cfmlTag Function
highlight link cfmlScriptKeywords Keyword
highlight link cfmlSqlKeywords Keyword
highlight link cfmlFunctions Function
highlight link cfmlSqlFunctions Function
highlight link luceeFunctions Function
highlight link cfmlScope Type
highlight link cfmlString String
highlight link cfmlNumber Number

highlight link cfmlCommentBlock Comment
highlight link cfmlCommentLine Comment
highlight link cfmlTagComment Comment
highlight link cfmlTagShortComment Comment
highlight link cfmlScriptComment Comment
highlight link cfmlSqlCommentLine Comment

highlight link cfmlHashSurround PreProc
highlight link cfmlOperator Operator

let b:current_syntax = "cf"

" Filetype detection
augroup cfFiletype
    autocmd!
    autocmd BufNewFile,BufRead *.cfm,*.cfc set filetype=cf
augroup END

" Vim/Neovim Complete Syntax File for ColdFusion
" Language: ColdFusion Markup Language (CFML)
" Maintainer: ColdFusion Syntax Team
" Version: 2.0
" Last Updated: 2025-02-03

" Prevent duplicate loading
if exists("b:current_syntax")
  finish
endif

" ColdFusion is case-insensitive
syntax case ignore

" HTML Tags
" syntax keyword htmlTagName containedin=ALLBUT,cfmlTag
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

" ColdFusion Tags
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
    \ cfupdate cfwddx cfzip cfzipparam

" HTML Attributes
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

" ColdFusion Script Keywords
syntax keyword cfmlScriptKeywords
    \ abstract and break case catch
    \ continue default do else extends
    \ final finally for function if
    \ implements import in interface new
    \ not or package private property
    \ public return rethrow switch
    \ then throw to try while var

" ColdFusion Built-in Functions
syntax keyword cfmlFunctions
    \ abs acos addsoaprequestheader addsoapresponseheader
    \ ajaxlink ajaxonload applicationstarttime applicationstop
    \ argon2checkhash array arrayappend arrayavg arrayclear
    \ arraycontains arraycontainsnocase arraydelete arraydeleteat
    \ arraydeletenocase arrayeach arrayevery arrayfilter arrayfind
    \ arrayfindall arrayfindallnocase arrayfindnocase arrayfirst
    \ arraygetmetadata arrayindexexists arrayinsertat arrayisdefined
    \ arrayisempty arraylast arraylen arraymap arraymax
    \ arraymedian arraymerge arraymid arraymin arraynew
    \ arraypop arrayprepend arraypush arrayreduce arrayreduceright
    \ arrayresize arrayreverse arrayset arraysetmetadata arrayshift
    \ arrayslice arraysome arraysort arraysplice arraysum
    \ arrayswap arraytolist arraytostruct arrayunshift asc asin
    \ atn beat binarydecode binaryencode bitand bitmaskclear
    \ bitmaskread bitmaskset bitnot bitor bitshln bitshrn
    \ bitxor booleanformat bundleinfo cacheclear cachecount
    \ cachedelete cacheget cachegetall cachegetallids cachegetdefaultcachename
    \ cachegetengineproperties cachegetmetadata cachegetproperties cachegetsession
    \ cacheidexists cachekeyexists cacheput cacheregionexists cacheregionnew
    \ cacheregionremove cacheremove cacheremoveall cachesetproperties callstackdump
    \ callstackget canonicalize ceiling cfusion_decrypt cfusion_encrypt
    \ charsetdecode charsetencode chr cjustify cleartimezone collectioneach
    \ collectionevery collectionfilter collectionmap collectionreduce collectionsome
    \ compare comparenocase componentcacheclear componentcachelist componentinfo
    \ compress configimport contractpath cos createdate createdatetime
    \ createdynamicproxy createencryptedjwt createguid createobject createodbcdate
    \ createodbcdatetime createodbctime createsignedjwt createtime createtimespan
    \ createuniqueid createuuid csrfgeneratetoken csrfverifytoken ctcacheclear
    \ ctcachelist datasourceflushmetacache dateadd datecompare dateconvert
    \ datediff dateformat datepart datetimeformat day dayofweek
    \ dayofweekasstring dbpoolclear dayofweekshortasstring dayofyear
    \ daysinmonth daysinyear de decimalformat decodeforhtml decodefromurl
    \ decrementvalue decrypt decryptbinary deleteclientvariable
    \ deserialize deserializeavro deserializejson deserializeprotobuf deserializexml
    \ directorycopy directorycreate directorydelete directoryexists
    \ directorylist directoryrename dollarformat dotnettocftype duplicate each
    \ echo empty encodefor encodeforcss encodefordn encodeforhtml
    \ encodeforhtmlattribute encodeforjavascript encodeforldap encodeforurl
    \ encodeforxml encodeforxmlattribute encodeforxpath encrypt encryptbinary
    \ entitydelete entityload entityloadbyexample entityloadbypk
    \ entitymerge entitynamearray entitynamelist entitynew
    \ entityreload entitysave entitytoquery esapidecode esapiencode evaluate
    \ exceptionkeyexists exp expandpath extensionexists extensionlist
    \ extract fileappend fileclose filecopy filedelete
    \ fileexists filegetmimetype fileiseof filemove
    \ fileopen fileread filereadbinary filereadline fileseek
    \ filesetaccessmode filesetattribute filesetlastmodified fileskipbytes
    \ fileupload fileuploadall filewrite filewriteline find
    \ findnocase findoneof firstdayofmonth fix floor
    \ formatbasen generateargon2hash generatebcrypthash generategraphqlmodels
    \ generatepbkdfkey generatescrypthash generatesecretkey getapplicationmetadata
    \ getapplicationsettings getauthuser getbasetagdata getbasetaglist
    \ getbasetemplatepath getbuiltinfunction getcanonicalpath
    \ getclasspath getclientvariableslist getcomponentmetadata getcontextroot
    \ getcpuusage getcurrentcontext getcurrenttemplatepath getdirectoryfrompath
    \ getencoding getexception getfilefrompath getfileinfo
    \ getfreespace getfunctioncalledname getfunctiondata
    \ getfunctionkeywords getfunctionlist getgatewayhelper getgraphqlclient
    \ gethttprequestdata gethttptimestring getk2serverdoccount
    \ getk2serverdoccountlimit getlocale getlocalecountry
    \ getlocaledisplayname getlocaleinfo getlocalelanguage
    \ getlocalhostip getluceeid getmemoryusage getmetadata
    \ getmetricdata getnumericdate getpagecontext getprinterinfo
    \ getprinterlist getprofilesections getprofilestring
    \ getreadableimageformats getsafehtml
    \ getsoaprequest getsoaprequestheader getsoapresponse
    \ getsoapresponseheader getsystemfreememory getsystemtotalmemory
    \ gettagdata gettaglist gettempdirectory gettempfile
    \ gettemplatepath gettickcount gettimezone gettimezoneinfo
    \ gettoken gettotalspace getuserroles getvariable
    \ getvfsmetadata getwriteableimageformats hash hash40
    \ hmac hour htmlcodeformat htmleditformat htmlparse
    \ iif imageaddborder imageblur imagecaptcha imageclearrect
    \ imagecopy imagecreatecaptcha imagecrop imagedrawarc
    \ imagedrawbeveledrect imagedrawcubiccurve imagedrawimage
    \ imagedrawline imagedrawlines imagedrawoval imagedrawpoint
    \ imagedrawquadraticcurve imagedrawrect imagedrawroundrect
    \ imagedrawtext imagefilter imagefiltercolormap imagefiltercurves
    \ imagefilterkernel imagefilterwarpgrid imageflip imagefonts
    \ imageformats imagegetblob imagegetbufferedimage
    \ imagegetexifmetadata imagegetexiftag imagegetheight
    \ imagegetiptcmetadata imagegetiptctag imagegetmetadata
    \ imagegetwidth imagegrayscale imageinfo imagemakecolortransparent
    \ imagemaketranslucent imagenegative imagenew
    \ imageoverlay imagepaste imageread imagereadbase64
    \ imageresize imagerotate imagerotatedrawingaxis imagescaletofit
    \ imagesetantialiasing imagesetbackgroundcolor imagesetdrawingalpha
    \ imagesetdrawingcolor imagesetdrawingstroke imagesetdrawingtransparency
    \ imagesharpen imageshear imagesheardrawingaxis imagetranslate
    \ imagetranslatedrawingaxis imagewrite imagewritebase64 imagexordrawingmode
    \ incrementvalue inputbasen insert int invalidateoauthaccesstoken
    \ invoke isarray isbinary isboolean isclosure iscustomfunction
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

" ColdFusion Scope Variables
syntax keyword cfmlScope
    \ application arguments cgi cffile
    \ client cookie form local
    \ request server session thistag url

" Operators
" syntax match cfmlOperator "[\+\-\*\/\%\&\|\^\!]"
" syntax match cfmlCompareOperator "[<>!=]=\?"

" Strings
syntax region cfmlString start=+"+ end=+"+
  \ contains=cfmlHashSurround
syntax region cfmlString start=+'+ end=+'+
  \ contains=cfmlHashSurround

" Numbers
syntax match cfmlNumber "\<\d\+\>"
syntax match cfmlNumber "\<\d\+\.\d\+\>"

" ColdFusion Comments
" syntax match cfmlComment "<!---\_.\{-}--->"
syntax match cfmlLineComment "//.*$"
syntax match cfmlScriptComment "/\*\_.\{-}\*/"


" COMMENT {{{

" COMMENT BLOCK {{{
" /*...*/
" s^   ^e
sy region cfmlCommentBlock
  \ keepend
  \ start="/\*"
  \ end="\*/"
  " \ contains=
  "   \cfmlMetaData
" / COMMENT BLOCK }}}

" COMMENT LINE {{{
" //...
" s^
sy match cfmlCommentLine
        \ "\/\/.*"
" / COMMENT LINE }}}

sy cluster cfmlComment
  \ contains=
    \cfmlCommentBlock,
    \cfmlCommentLine,
    \cfmlTagComment,
    \cfmlScriptComment
" / COMMENT }}}

" TAG COMMENT {{{
" <!---...--->
" s^^^^   ^^^e
sy region cfmlTagComment
  \ keepend
    \ start="<!---"
    \ end="--->"
    " \ contains=
    "   \cfmlTagComment
" / TAG COMMENT }}}


" HASH SURROUNDED {{{
sy region cfmlHashSurround
  \ keepend
  \ oneline
  \ start="#"
  \ end="#"
  \ skip="##"
    \ contains=cfmlFunctions
" / HASH SURROUNDED }}}

sy include @sqlSyntax $VIMRUNTIME/syntax/sql.vim
sy include @jsSyntax $VIMRUNTIME/syntax/javascript.vim

" ColdFusion Script Blocks
syntax region cfmlScriptBlock
  \ fold
  \ keepend
  \ transparent
  \ start="<cfscript>" end="</cfscript>"
  \ contains=cfmlTag,cfmlEqualSign,cfmlScriptKeywords,cfmlFunctions,cfmlString,cfmlNumber,@cfmlComment


" syntax keyword jsScriptKeywords
"     \ var script


" JavaScript Blocks
syntax region cfmlJavascriptBlock
  \ fold
  \ keepend
  \ transparent
  \ start="<script\(\s\+\w\+\s*=\s*['\"].*['\"]\)*\s*>" end="</script>"
  " \ contains=@jsScriptStatement




" CFQUERY REGION AND FOLD {{{
" <cfquery
" s^^^^^^^
" </cfquery>
" ^^^^^^^^^e
        "\@cfmlSqlStatement,
sy region cfmlQueryTagRegion
  \ fold
  \ keepend
  \ transparent
  \ start="\c<cfquery"
  \ end="\c</cfquery>"
  \ contains=
    \@cfmlSqlStatement,
    \cfmlTagComment
" / CFQUERY REGION AND FOLD }}}


" EQUAL SIGN {{{
sy match cfmlEqualSign
    \ "\v\=|\+"
" / EQUAL SIGN }}}

sy cluster jsScriptStatement
  \ contains=cfmlTag,jsSyntax,cfmlEqualSign,cfmlScriptKeywords,cfmlFunctions,cfmlString,cfmlNumber,@cfmlComment,cfmlScriptComment

" SQL STATEMENT {{{
sy cluster cfmlSqlStatement
  \ contains=
    \@sqlSyntax,
    \cfmlEqualSign,
    \cfmlFunctions,
    \cfmlHashSurround,
    \cfmlNumber
" / SQL STATEMENT }}}
" Highlighting
highlight link htmlTagName Tag
highlight link htmlArg Attribute
highlight link cfmlTag Function
highlight link cfmlScriptKeywords Keyword
" highlight link jsScriptKeywords Keyword
highlight link cfmlFunctions Function
highlight link cfmlScope Type
highlight link cfmlOperator Operator
highlight link cfmlCompareOperator Operator
highlight link cfmlString String
highlight link cfmlNumber Number
" highlight link cfmlComment Comment

hi link cfmlCommentBlock Comment
hi link cfmlCommentLine Comment
hi link cfmlTagComment Comment

highlight link cfmlLineComment Comment
highlight link cfmlScriptComment Comment
" highlight link cfmlScriptBlock Function

hi link cfmlHashSurround PreProc

hi link cfmlEqualSign Keyword
" Set syntax
let b:current_syntax = "cf"

" Filetype detection
augroup cfFiletype
    autocmd!
    autocmd BufNewFile,BufRead *.cfm,*.cfc set filetype=cf
augroup END

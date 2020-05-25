"Highlight the word self -- self.new, self
syn match pythonSelf    /\<self\>/
:hi pythonSelf          guifg=#5f9ba9

"Python2 unicode string -- u'hello', u"hello"
syn match pythonUni     /\<\zsu\ze["']/
:hi pythonUni           guifg=#c1341f cterm=bold

"Python all caps var -- MAX_VALUE, VALUE
syn match pythonCaps    /\<[A-Z_]\+\>/
 :hi pythonCaps         guifg=#c1341f cterm=bold

"Highlight Exceptions, Errors in python -- TypeError, MyCustomException
syn match pythonExc     /\v<\w*(Error|Exception)\w*>/
:hi pythonExc           guifg=#8290de cterm=bold

"Highlight SQL keywords -- not very good, how to only highlight those within a string?
syn match pythonSql     /\v<(SELECT|DELETE|INSERT|UPDATE|ON|FROM|WHERE|ALTER|TABLE|AS|DUPLICATE|KEY|IGNORE|AS|CAST|SEPARATOR|JOIN|INNER|OUTER|LEFT|RIGHT|ORDER|BY|AND|IN|NOT|ON|USING|ORDER|BY|LIMIT|OFFSET|COUNT|SUM|CONCAT|COALESCE|DISTINCT|OR|AND|IS|NULL|GROUP|UNION|ALL|CASE|WHEN|THEN|IF|IFNULL|AS|DATE|LIKE|GROUP_CONCAT|END|BETWEEN)\ze(\s|\()/ containedin=.*String
:hi def link pythonSql Identifier
:hi pythonSql     guifg=#2e49de cterm=bold



list = {'AG Mortgage Investment Trust Inc  	'=>'MITT',
'AGNC Investment Corp  '=>'AGNC',
'Alibaba Group Holding Ltd  '=>'BABA',
'Alphabet Inc  	'=>'GOOGL',
'Ambac Financial Group, Inc.  	'=>'ABKFQ',
'Annaly Capital Management, Inc.  '=>'NLY',
'Axis Capital Holdings Limited  '=>'AXS',
'AutoZone, Inc.  	'=>'AZO',
'Bank of America Corp  '=>'BAC',
'Berkshire Hathaway Inc.  	'=>'BRK.B',
'BP Prudhoe Bay Royalty Trust  	'=>'BPT',
'Camden Property Trust  '=>'CPT',
'Camping World Holdings Inc  '=>'CWH',
'Cherry Hill Mortgage Investment Corp  '=>'CHMI',
'Chuy Holdings Inc  '=>'CHUY',
'Cornerstone Progressive Return Fund  	'=>'CFP',
'Echostar Corporation  '=>'SATS',
'Equity Commonwealth  '=>'EQC',
'Everest Re Group Ltd  	'=>'RE',
'Five Below Inc  '=>'FIVE',
'Golar LNG Partners LP  	'=>'GMLP',
'Gentherm Inc  '=>'THRM',
'iShares NASDAQ Biotechnology Index (ETF)  '=>'IBB',
'Liberty Expedia Holdings Inc  '=>'LEXEA',
'Manulife Financial Corporation (USA)  '=>'MFC',
'New Residential Investment Corp  	'=>'NRZ',
'Northern Tier Energy LP  	'=>'NTI',
'Oxford Lane Capital Corp  '=>'OXLC',
'PerkinElmer, Inc.  '=>'PKI',
'Premier Inc  '=>'PINC',
'Priceline Group Inc  	'=>'PCLN',
'Qihoo 360 Technology Co Ltd  '=>'QIHU',
'Sensata Technologies Holding N.V.  '=>'ST',
'Ship Finance International Limited  	'=>'SFL',
'SunCoke Energy Partners LP  	'=>'SXCP',
'Sutherland Asset Management Corp  '=>'SLD',
'TPG Specialty Lending Inc  '=>'TSLX',
'Ubiquiti Networks Inc  '=>'UBNT',
'Waddell & Reed Financial, Inc.  '=>'WDR'}
list.each do |key,val|
	# current_stock = StockQuote::Stock.quote(val)
	Stock.create(quote: val)
	# Stock.create(quote: val, stockname: key)
end

User.create(username: 'Tom', email: 't@dbc.com', password: "123")
User.create(username: 'Jim', email: 'j@dbc.com', password: "123")
User.create(username: 'Bob', email: 'b@dbc.com', password: "123")
Type.create(typename: 'dividend')
Type.create(typename: 'value')
Favorite.create(user: User.find_by(id: 1), stock: Stock.find_by(id: 1), type: Type.find_by(id: 1) )
Favorite.create(user: User.find_by(id: 1), stock: Stock.find_by(id: 2), type: Type.find_by(id: 1))
Favorite.create(user: User.find_by(id: 2), stock: Stock.find_by(id: 3), type: Type.find_by(id: 2) )

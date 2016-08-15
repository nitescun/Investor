list = {'AG Mortgage Investment Trust Inc  	'=>'MITT',
'Align Technology, Inc.  	'=>'ALGN',
'Allegiant Travel Company  	'=>'ALGT',
'Alphabet Inc  	'=>'GOOGL',
'Ambac Financial Group, Inc.  	'=>'ABKFQ',
'American Railcar Industries, Inc.  	'=>'ARII',
'Apple Inc.  	'=>'AAPL',
'AutoZone, Inc.  	'=>'AZO',
'Baidu Inc (ADR)  	'=>'BIDU',
'Berkshire Hathaway Inc.  	'=>'BRK.B',
'Biogen Inc  	'=>'BIIB',
'BioNovelus Inc  	'=>'FINW',
'BlackRock, Inc.  	'=>'BLK',
'BP Prudhoe Bay Royalty Trust  	'=>'BPT',
'Broadcom Ltd  	'=>'AVGO',
'Canadian Imperial Bank of Commerce (USA)  	'=>'CM',
'Catamaran Corp (USA)  	'=>'CTRX',
'Charter Communications, Inc.  	'=>'CHTR',
'Chesapeake Granite Wash Trust  	'=>'CHKR',
'Chimera Investment Corporation  	'=>'CIM',
'Cornerstone Progressive Return Fund  	'=>'CFP',
'Costamare Inc  	'=>'CMRE',
'Credit Acceptance Corp.  	'=>'CACC',
'CVR Energy, Inc.  	'=>'CVI',
'CVR Partners LP  	'=>'UAN',
'CVR Refining LP  	'=>'CVRR',
'DHT Holdings Inc  	'=>'DHT',
'Everest Re Group Ltd  	'=>'RE',
'Frontline Ltd.  	'=>'FRO',
'Golar LNG Partners LP  	'=>'GMLP',
'Great Basin Scientific Inc  	'=>'GBSN',
'HIGH PERFORMANCE B COM USD0.001(POST REV SPLIT  	'=>'TBEV',
'Intuitive Surgical, Inc.  	'=>'ISRG',
'IPG Photonics Corporation  	'=>'IPGP',
'Keurig Green Mountain Inc  	'=>'GMCR',
'Koninklijke KPN N.V. (ADR)  	'=>'KKPNY',
'Ladder Capital Corp  	'=>'LADR',
'Lear Corporation  	'=>'LEA',
'LeMaitre Vascular Inc  	'=>'LMAT',
'Lululemon Athletica inc.  	'=>'LULU',
'Martin Midstream Partners L.P.  	'=>'MMLP',
'Mercadolibre Inc  	'=>'MELI',
'Mettler-Toledo International Inc.  	'=>'MTD',
'Monotype Imaging Holdings Inc.  	'=>'TYPE',
'Navios Maritime Acquisition Corporation  	'=>'NNA',
'Navios Maritime Midstream Partners LP  	'=>'NAP',
'New Oriental Education & Tech Grp (ADR)  	'=>'EDU',
'New Residential Investment Corp  	'=>'NRZ',
'New York Mortgage Trust Inc  	'=>'NYMT',
'Northern Tier Energy LP  	'=>'NTI',
'Pacific Coast Oil Trust  	'=>'ROYT',
'PennyMac Mortgage Investment Trust  	'=>'PMT',
'Priceline Group Inc  	'=>'PCLN',
'Prospect Capital Corporation  	'=>'PSEC',
'Resource Capital Corp.  	'=>'RSO',
'SandRidge Mississippian Trust II  	'=>'SDR',
'SandRidge Permian Trust  	'=>'PER',
'Seven Arts Entertainment Inc  	'=>'SAPX',
'Shanda Interactive Entertainment Ltd ADR  	'=>'SNDA',
'Ship Finance International Limited  	'=>'SFL',
'Sturm, Ruger & Company  	'=>'RGR',
'SunCoke Energy Partners LP  	'=>'SXCP',
'SuperMedia Inc  	'=>'SPMD',
'TAL International Group, Inc.  	'=>'TAL',
'Taro Pharmaceutical Industries Ltd.  	'=>'TARO',
'The Hackett Group, Inc.  	'=>'HCKT',
'Toyota Motor Corp (ADR)  	'=>'TM',
'Turkcell Iletisim Hizmetleri A.S. (ADR)  	'=>'TKC',
'Ulta Salon, Cosmetics & Fragrance, Inc.  	'=>'ULTA',
'United Continental Holdings Inc  	'=>'UAL',
'United Therapeutics Corporation  	'=>'UTHR',
'Viaderma Inc  	'=>'VDRM',
'Virtusa Corporation  	'=>'VRTU'}
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


Config = {}

Config.Dispatch = {
    Enable = true, -- Enable dispatch
    Type = 'normal', --['normal'/'cd_dispatch'/'qs-dispatch'/'ps-dispatch']
	Jobs = {
		'police',
		'sheriff'
	}
}

-- The distance at which peds and props get loaded in for players
Config.SpawnDistance = 100.0

-- This will map addAccountMoney calls to your dirty money item
-- You can use your black_money item as an account in our scripts due to this
Config.BlackMoney = {
	-- You can change it to whatever your dirty money item name is
	ItemName = 'black_money',

	-- marked_bills use metadata in some moneywashing scripts, this is up to you
	-- Beware that you can only use the dirty money item as a reward when this is set to true
	-- I don't recommend using this if you're not 100% sure
	UsesMetadata = false
}

" Vim syntax file
" Language: Cottle template language (with EDDI functions)
" Maintainer: KORYUOH
" Description: Syntax highlighting for Cottle + EDDI extensions

if exists("b:current_syntax")
	finish
endif

" -----------------------------
" Directives / Keywords
" -----------------------------
syntax keyword cottleDirective if else for while set call return break continue
syntax keyword cottleDirective include import
syntax keyword cottleDirective true false null

" -----------------------------
" Built-in Functions (Cottle)
" -----------------------------
syntax keyword cottleFunction Abs Avg Ceil Concat Count DateTime Floor Join
syntax keyword cottleFunction Contains
syntax keyword cottleFunction Lower Max Min Power Random Replace Round Split Substring
syntax keyword cottleFunction Sum TimeSpan Trim Upper

" -----------------------------
" EDDI Functions
" -----------------------------
" Commander
syntax keyword cottleFunction CmdrName CmdrRank CmdrRating CmdrCombat CmdrTrade CmdrExplore CmdrCQC CmdrBalance CmdrDebt CmdrCredits CmdrLoan CmdrLocation CmdrSystem CmdrShip CmdrShipName CmdrShipIdent CmdrShipRole CmdrShipType CmdrShipTypeLocal CmdrShipTypePhonetic CmdrShipTypeSpoken CmdrShipTypeShort CmdrShipTypeShortSpoken CmdrLegalStatus CmdrWanted CmdrHealth CmdrFuel CmdrFuelCapacity CmdrFuelPercent CmdrCargo CmdrCargoCapacity CmdrCargoPercent CmdrJumpRange CmdrInsurance CmdrRebuy CmdrHot CmdrRankCombat CmdrRankTrade CmdrRankExplore CmdrRankCQC CmdrRankEmpire CmdrRankFederation CmdrRankPower CmdrRankSoldier CmdrRankExobiologist

" Ship
syntax keyword cottleFunction ShipName ShipIdent ShipRole ShipType ShipTypeLocal ShipTypePhonetic ShipTypeSpoken ShipTypeShort ShipTypeShortSpoken ShipFuel ShipFuelCapacity ShipFuelPercent ShipCargo ShipCargoCapacity ShipCargoPercent ShipJumpRange ShipHot ShipLegalStatus ShipWanted ShipHealth ShipInsurance ShipRebuy

" System
syntax keyword cottleFunction SystemName SystemAddress SystemSecurity SystemEconomy SystemPopulation SystemFaction SystemGovernment SystemAllegiance SystemPermit SystemCoordinates SystemDistance SystemStarClass SystemStarLuminosity SystemStarMass SystemStarRadius SystemStarTemperature SystemStarAge SystemStarType SystemStarTypeLocal SystemStarTypeSpoken SystemStarTypeShort SystemStarTypeShortSpoken

" Station
syntax keyword cottleFunction StationName StationType StationFaction StationGovernment StationAllegiance StationEconomy StationServices StationDistance StationMarketId StationStarSystem StationSecurity StationPopulation StationPermit

" Materials / Commodities
syntax keyword cottleFunction MaterialName MaterialCategory MaterialGrade MaterialCount CommodityName CommodityCategory CommodityCount

" Missions
syntax keyword cottleFunction MissionName MissionType MissionFaction MissionTarget MissionReward MissionExpiry MissionStatus MissionDestination MissionOrigin MissionCargo MissionPassengers MissionPassengerVIP MissionPassengerWanted MissionPassengerCount

" Galaxy / Navigation
syntax keyword cottleFunction RouteNextSystem RouteRemainingJumps RouteTotalJumps RouteDistance RouteETA RouteFuelRequired RouteFuelAvailable RouteFuelPercent RouteFuelCapacity RouteFuelCurrent

" Misc
syntax keyword cottleFunction DateTime TimeSpan Random Replace Round Split Substring Sum Trim Upper Lower Concat Count Avg Max Min Power Abs Ceil Floor Join
syntax keyword cottleFunction Contains

" -----------------------------
" Operators
" -----------------------------
syntax match cottleOperator "[=<>!]=\?"
syntax match cottleOperator "[+\-*/%]"

" -----------------------------
" Numbers
" -----------------------------
syntax match cottleNumber "\<\d\+\(\.\d\+\)\?\>"

" -----------------------------
" Strings
" -----------------------------
syntax region cottleString start=/"/ skip=/\\"/ end=/"/
syntax region cottleString start=/'/ skip=/\\'/ end=/'/

" -----------------------------
" Comments
" -----------------------------
syntax region cottleComment start="{#" end="#}" contains=cottleTodo
syntax keyword cottleTodo TODO FIXME XXX contained

" -----------------------------
" Variables
" -----------------------------
syntax match cottleVariable "\<[A-Za-z_][A-Za-z0-9_]*\>"

" -----------------------------
" Highlight groups
" -----------------------------
hi def link cottleDirective Keyword
hi def link cottleFunction Function
hi def link cottleOperator Operator
hi def link cottleNumber Number
hi def link cottleString String
hi def link cottleComment Comment
hi def link cottleVariable Identifier
hi def link cottleTodo Todo

let b:current_syntax = "cottle"

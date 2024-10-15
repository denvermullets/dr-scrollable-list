require 'app/scrollable_list'

def tick(args)
  args.state.list ||= ScrollableList.new(args, base_array)
  args.state.list.tick
end

def base_array
  [
    "Winter is Coming", "Valar Morghulis", "Valar Dohaeris", "The Iron Throne", "Dracarys", "The Night King", "Mother of Dragons",
    "A Lannister always pays his debts", "The Kingslayer", "The Red Wedding", "The Rains of Castamere", "Arya's kill list",
    "Hold the door", "The Three-Eyed Raven", "The Battle of the Bastards", "Chaos is a ladder", "I drink and I know things",
    "The Prince that was Promised", "Valyrian steel", "The Great War", "The Wall", "The White Walkers", "King in the North",
    "Queen of the Seven Kingdoms", "The Unsullied", "The Dothraki", "The Faceless Men", "The Many-Faced God", "The House of Black and White",
    "Sansa Stark", "House Stark", "House Lannister", "House Targaryen", "Fire and Blood", "Ours is the Fury", "Hear Me Roar",
    "A Girl has no name", "The Mountain and the Viper", "The Lord of Light", "The Hound", "Bran the Broken", "The Iron Fleet",
    "Greyjoy Rebellion", "Kingslayer", "Breaker of Chains", "No One", "Jon Snow", "The Dragon and the Wolf", "Tyrion Lannister",
    "Cersei Lannister", "Daenerys Targaryen", "Jorah Mormont", "Varys the Spider", "Littlefinger", "Bronn of the Blackwater",
    "House Martell", "House Greyjoy", "House Baratheon", "Wildfire", "Blackwater Bay", "The Battle of Winterfell", "Syrio Forel",
    "Needle", "Longclaw", "Oathkeeper", "Lightbringer", "The Night's Watch", "The Crow", "Lord Commander", "The Sword of the Morning",
    "The Kingsguard", "The Golden Company", "Qyburn's experiments", "The High Sparrow", "Shame!", "The Faith Militant",
    "The Maesters of Oldtown", "Citadel of Oldtown", "Casterly Rock", "Winterfell", "Dragonstone", "Storm's End", "Harrenhal",
    "The Twins", "Meereen", "Astapor", "Yunkai", "The Sons of the Harpy", "The Brotherhood Without Banners", "Dorne", "The Reach",
    "The Riverlands", "The Vale of Arryn", "Pyke", "Euron Greyjoy", "Balon Greyjoy", "Robert Baratheon", "Renly Baratheon",
    "Stannis Baratheon", "Melisandre", "Gendry", "Ygritte", "Tormund Giantsbane", "The Wildlings", "Mance Rayder", "Beyond the Wall"
  ]
end

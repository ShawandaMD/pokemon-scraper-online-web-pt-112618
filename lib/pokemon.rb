require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: ,name: ,type: ,db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    #binding.pry
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", @id, name, type)
  end

  def self.find(id_num, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id= ?", id_num).flatten
    Pokemon.new(id: new_pokemon[0], name:new_pokemon[1], type: new_pokemon[2], hp: new_pokemon[3], db: db,)
  end

  def alter_hp(hp_hit, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ? ", hp_hit, @id)
  end

end

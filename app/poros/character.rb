class Character
  attr_reader :id, :name, :house, :role, :patronus
  def initialize(character_hash)
    @id = character_hash[:_id]
    @name = character_hash[:name]
    @house = character_hash[:house]
    @role = character_hash[:role] if character_hash[:role]
    @patronus = character_hash[:patronus] if character_hash[:patronus]
  end
end

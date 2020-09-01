RSpec.describe Character do
  it 'has attributes of name, role, house, patronus' do
    character_hash = {
      :_id=>"5a0fa7dcae5bc100213c2338",
      :name=>"Sirius Black",
      :house=>"Gryffindor",
      :school=>"Hogwarts School of Witchcraft and Wizardry",
      :alias=>"Padfoot",
      :animagus=>"black dog",
      :__v=>0,
      :ministryOfMagic=>false,
      :orderOfThePhoenix=>true,
      :dumbledoresArmy=>false,
      :deathEater=>false,
      :bloodStatus=>"pure-blood",
      :species=>"human"
    }

    character = Character.new(character_hash)

    expect(character.name).to eq("Sirius Black")
    expect(character.house).to eq("Gryffindor")
    expect(character.role).to eq(nil)
    expect(character.patronus).to eq(nil)
  end
end

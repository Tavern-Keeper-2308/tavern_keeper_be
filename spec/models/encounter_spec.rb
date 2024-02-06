require 'rails_helper'

RSpec.describe Encounter, type: :model do
 describe 'Validations' do
   it { should validate_presence_of(:party_size)}
   it { should validate_presence_of(:party_level)}
   it { should validate_presence_of(:encounter_name)}
   it { should validate_presence_of(:user_id)}
 end
 describe 'relationships' do
   it { should have_many(:encounter_monsters)}
 end
end

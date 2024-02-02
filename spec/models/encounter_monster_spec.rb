require 'rails_helper'

RSpec.describe EncounterMonster, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:monster_name)}
  end
  describe 'relationships' do
    it { should belong_to(:encounter)}
  end
end

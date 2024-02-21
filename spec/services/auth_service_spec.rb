require 'rails_helper'

RSpec.describe AuthService, type: :service do
  describe 'Class Methods' do
    describe '#conn' do
      it "returns Faraday object" do
        expect(AuthService.conn).to be_a(Faraday::Connection)      
      end
    end
  end
end 
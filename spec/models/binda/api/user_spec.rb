require "rails_helper"

module Binda
  module Api
    describe User do
      let(:user){ create(:api_user) }

      it "has a API KEY upon creation" do
        expect(user.api_key).not_to be_nil
      end

      it "doesn't change API KEY after update" do
        old_api_key = user.api_key
        user.name = 'New Name'
        user.save
        expect(old_api_key).to eq(user.reload.api_key)
      end

      it "has a relation with Binda structures" do
        expect(user.structures.count).to eq 0
        user.structures << Structure.last
        expect(user.reload.structures.count).to eq 1
      end
    end
  end
end


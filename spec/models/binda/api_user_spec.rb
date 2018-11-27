require "rails_helper"

module Binda
  describe ApiUser do
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

    it "has a generator method to create users" do
      STDIN = StringIO.new("foo\n")
      ::Binda::ApiUser.create_api_user
      users = ::Binda::ApiUser.all
      expect(users.last.name).to eq('foo')
    end

    it "has a generator method to create users which are granted access to all existing structures" do
      STDIN = StringIO.new("bar\n")
      ::Binda::ApiUser.create_api_user
      num_of_structures = Structure.all.count
      users = ::Binda::ApiUser.all
      expect(users.last.name).to eq('bar')
      expect(users.last.reload.structures.count).to eq(num_of_structures)
    end
  end
end


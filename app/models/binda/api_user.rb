module Binda
  class ApiUser < ActiveRecord::Base
    validates :api_key, presence: true, uniqueness: true
    validates :name, presence: true, uniqueness: true

    has_many :api_authorizations
    has_many :structures, through: :api_authorizations

    before_validation :generate_api_key, on: :create

    accepts_nested_attributes_for :structures

    def self.create_api_user
      STDOUT.puts "What is the api user name? [api_user]"
      username = STDIN.gets.strip
      username = 'api_user' if username.blank?
      new_user = ApiUser.create!( name: username )
      puts "User \"#{username}\" successfully created."
      ::Binda::Structure.all.each do |structure|
        new_user.structures << structure
      end
      new_user.save!
      puts "User \"#{username}\" has now granted access to all existing structures."
    end

    private
    def generate_api_key
      self.api_key = SecureRandom.hex(24)
    end
  end
end

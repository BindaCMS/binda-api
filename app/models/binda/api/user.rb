module Binda
  module Api
    class User < ActiveRecord::Base
      validates :api_key, presence: true, uniqueness: true
      validates :name, presence: true
      
      has_many :authorizations
      has_many :structures, through: :authorizations

      before_validation :generate_api_key, on: :create

      private
      def generate_api_key
        self.api_key = SecureRandom.hex(24)
      end
    end
  end
end

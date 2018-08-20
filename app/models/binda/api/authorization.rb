module Binda
  module Api
    class Authorization < ActiveRecord::Base
      belongs_to :user
      belongs_to :structure
    end
  end
end

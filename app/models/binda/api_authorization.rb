module Binda
  class ApiAuthorization < ActiveRecord::Base
    belongs_to :api_user
    belongs_to :structure
  end
end

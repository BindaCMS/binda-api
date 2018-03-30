module Binda
  module Api
    class Engine < ::Rails::Engine
      isolate_namespace Binda::Api
    end
  end
end

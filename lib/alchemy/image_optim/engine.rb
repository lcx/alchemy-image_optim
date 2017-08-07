module Alchemy
  module ImageOptim
    class Engine < ::Rails::Engine
      isolate_namespace Alchemy
      engine_name 'alchemy_image_optim'

      initializer 'register_dragonfly_image_optim_processor' do
        ::Dragonfly.app(:alchemy_pictures).configure do
          processor :optimize, Processor
        end
      end

      config.to_prepare do
        require_relative '../../../app/models/alchemy/picture_extension.rb'
      end
    end
  end
end

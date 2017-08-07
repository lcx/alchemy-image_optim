module Alchemy
  module ImageOptim
    class Processor
      class << self
        def call(content, *args)
          if optimized = ::ImageOptim.new.optimize_image(content.path).presence
            # We have to use a Tempfile which copy the optimized image because optimized correspond to a Tempfile path which may be deleted
            tempfile = Tempfile.new('optimized-image')
            begin
              optimized.copy(tempfile.path)
              content.update tempfile
            rescue => e
              if Alchemy::ImageOptim.configuration.raise_errors
                raise e
              else
                Logger.warn(e, caller.first)
              end
            ensure
              tempfile.close # here we cannot use `close!` because of https://github.com/markevans/dragonfly/issues/319
            end
          end
        end
      end
    end
  end
end

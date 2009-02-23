module StaticResource
  class Base < ::ActiveResource::Base
  
    self.site = ""

    class << self

      def static_resource
        if defined?(@static_resource)
          @static_resource
        elsif superclass != Object && superclass.static_resource
          superclass.static_resource.dup.freeze
        end
      end
    
      def static_resource=(static_resource)
        if static_resource.nil?
          @static_resource = nil
        else
          @static_resource = static_resource
        end
      end

      def find(*args)
        scope   = args.slice!(0)
        options = args.slice!(0) || {:from => self.static_resource}

        case scope
          when :one   then find_one(options)
        end
      end

      def connection(refresh = false)
        Connection.new(ActiveResource::Formats[:xml])
      end
    end
  end

  class Connection < ::ActiveResource::Connection
    def initialize(format = ActiveResource::Formats[:xml])
      self.format = format
    end

    def get(path, headers = {})
      format.decode(request(:get, path, nil))
    end

    private

    def request(method, path, *arguments)
      File.read( path )
    end
  end
end
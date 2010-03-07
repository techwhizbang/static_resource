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

      def find(*arguments)
        scope   = arguments.slice!(0)
        options = arguments.slice!(0) || {}
        options = { :from => @static_resource }.merge(options)
        if scope == :all  
          resource = find_every(options)
          if options[:id] && options[:key]
            resource = resource.detect { |r| r.send(options[:key].to_sym) == options[:id] }
          end
        elsif scope == :first
          resource = find_every(options).first
        elsif scope == :last
          resource= find_every(options).last
        elsif scope == :one
          resource = find_one(options)
        else
          resource = find_single(scope, options)
        end
 
        resource = resource.attributes[options[:id]] if scope != :all && options[:id] 
        resource
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

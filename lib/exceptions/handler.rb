module Exceptions
  module Handler

    # Define error Classes Here
    class RecordNotFound < StandardError; end
    class ApplicationError < StandardError; end
    class ApiError < StandardError; end

    def self.included(base)
      base.extend Rescuer
    end

    module Rescuer
      def self.extended(base)
        base.send(:include,ActiveSupport::Rescuable)
        base.send(:include, InstanceRescuer)
        base.send(:include, PresetErrorMessages)

        base.class_eval do
          # Define rescuers
          attr_accessor :error
          rescue_from Mongoid::Errors::DocumentNotFound, :with => :record_not_found
          rescue_from ZeroDivisionError, :with => :zero_division
          rescue_from Errno::ENOENT, :with => :file_not_found
          rescue_from SocketError, :with => :api_error
          rescue_from Timeout::Error, :with => :api_error
        end
      end

      def execute(*args,&block)
        new.send(:execute,*args,&block)
      end

      def self.log(exception,message=nil)
        new.send(:log,exception,message)
      end
    end

    module InstanceRescuer
      def execute(*args,&block)
        yield
      rescue Exception => exception
        rescue_with_handler(exception) || log(exception,args[0])
        if exception.is_a?(SocketError) || exception.is_a?(Timeout::Error)
          raise ApiError
        else
          raise exception
        end
        #log(exception)
      end

      def log(exception,message=nil)
        Failure.notify(message,exception)
      end
    end

    # Define error Messages or return values
    module PresetErrorMessages

      def api_error(exception)
        log(exception, "API Error")
        return false
      end

      def docsplit(exception)
        log(exception,"while splitting")
      end

      def file_not_found(exception)
        @error = exception
        log(exception)
      end

      def zero_division(exception)
        return 0
      end

      def record_not_found(exception)
        @error = exception
        log(exception)
      end
    end

  end

end


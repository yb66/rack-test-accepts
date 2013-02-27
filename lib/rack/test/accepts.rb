require "rack"

module Rack
  module Test
    module Accepts      
      def env( *methods )
        methods.each_with_object({}) do |meth, obj|
          obj.merge! __send__(meth)
        end
      end

      Rack::Mime::MIME_TYPES.each do |ext,mime_type|
        define_method "accepts_#{ext[1..-1]}" do
          {"HTTP_ACCEPT" => mime_type }
        end
      end

      # Sets the HTTP_ACCEPT header to XMLHttpRequest
      def via_xhr
        {"HTTP_X_REQUESTED_WITH" => "XMLHttpRequest"}
      end

    end
  end
end

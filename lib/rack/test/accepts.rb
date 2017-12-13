require "rack"

# @see https://rubygems.org/gems/rack
module Rack

  # @see https://rubygems.org/gems/rack-test
  module Test

    # Helpers for rack-test for the HTTP_ACCEPT header.
    module Accepts

      # @param methods [String,Symbol] The methods to accept.
      # @example
      #   RSpec.configure do |config|
      #     config.include Rack::Test::Accepts, :type => :request
      #   # <snip!>
      #
      #   describe "My route", :type => :request do
      #     let(:body) { { :key => "abcdef" }.to_json }
      #     before do
      #       post '/channel/create', body, env(:accepts_json)
      #     end
      def env( *methods )
        methods.each_with_object({}) do |meth, obj|
          obj.merge! __send__(meth)
        end
      end


      # Include all the Rack::Mime types
      Rack::Mime::MIME_TYPES.each do |ext,mime_type|
        define_method "accepts_#{ext[1..-1]}" do
          {"HTTP_ACCEPT" => mime_type }
        end
      end


      # Sets the HTTP_ACCEPT header to XMLHttpRequest
      # @example
      #   get "/", {}, env(:accepts_xhr)
      def via_xhr
        {"HTTP_X_REQUESTED_WITH" => "XMLHttpRequest"}
      end

    end
  end
end

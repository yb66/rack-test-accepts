# encoding: UTF-8

require 'spec_helper'
require_relative "../lib/rack/test/accepts.rb"

describe "Accepts module" do
  subject { Rack::Test::Accepts.instance_methods }
  it { should include :env }
  Rack::Mime::MIME_TYPES.each do |k,v|
    it { should include "accepts_#{k[1..-1]}".to_sym }
  end

  describe "Including the methods" do
    let(:fake_thing) {
      o = Object.new
      o.extend Rack::Test::Accepts
      o
    }
    subject{ fake_thing }
    it { should respond_to :env }
    describe "Using the methods" do
      
      Rack::Mime::MIME_TYPES.each do |k,v|
        method = "accepts_#{k[1..-1]}"
        context "calling env(:#{method})" do
          subject { fake_thing.env method.to_sym }
          it { should = {"HTTP_ACCEPT" => v } }
        end
      end
      
    end
  end

end

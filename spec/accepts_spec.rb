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
      context "xhr" do
        context "calling accepts_xhr" do
          subject { fake_thing.env :accepts_xhr }
          it { should = {"HTTP_X_REQUESTED_WITH" => "XMLHttpRequest"} }
        end  
        context "via_xhr helper" do
          subject { fake_thing.env :via_xhr }
          it { should = {"HTTP_X_REQUESTED_WITH" => "XMLHttpRequest"} }
        end
      end
      context "Failure" do
        it "should fail because there is no zzz type" do
          expect { fake_thing.env :via_zzz }.to raise_error NoMethodError
        end
      end   
      
    end
  end

end

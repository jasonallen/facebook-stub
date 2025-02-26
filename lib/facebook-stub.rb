require "facebook-stub/version"
require 'facebook-stub/rails/action_view_helper'

module Facebook
  module Stub
    BASE_INFO = {
      "name"          => "Gandalf the Grey",
      "location"      => {
        "name"        => "San Francisco, California",
        "city"        => "San Francisco",
        "zip"         => "94107",
        "country"     => "United States",
        "id"          => 114952118516947,
        "state"       => "California"
      },
      "timezone"      =>  -8,
      "gender"        => "male",
      "id"            => "234567898765432",
      "birthday"      => "07/21/1954",
      "updated_time"  => "2011-02-10T00:40:26+0000",
      "verified"      => true,
      "locale"        => "en_US",
      "religion"      => "Wikipedia",
      "bio"           => "The greatest thing you'll ever learn is just to love and be loved in return.\r\n\r\nIf hearing the name Sharon Salinger causes you physical pain and emotional trauma then we are friends.\r\n\r\nMy life has a great cast but I can't figure out the plot.",
      "hometown"      => { "name" => nil, "id" => "" },
      "link"          => "http://www.facebook.com/gandalf.the.grey",
      "political"     => "Fellowship",
      "email"         => "gandalf@change.org",
      "first_name"    => "Gandalf",
      "middle_name"   => "the",
      "last_name"     => "Grey"
    }

    def Stub::reset!
      # Marshal to force a deep copy
      @info = Marshal.load(Marshal.dump(BASE_INFO))
    end

    def Stub::info
      @info
    end

    def Stub::invalid!
      @info = {}
    end

    Stub::reset!
  end
end


if defined?(ActionView::Base)
  ActionView::Base.send(:include, Facebook::Stub::Rails::ActionViewHelper)
end

class StaticController < ApplicationController
  def ping
    render text: 'OK'
  end
end

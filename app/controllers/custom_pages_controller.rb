class CustomPagesController < ApplicationController
  layout 'application_no_container'
  before_filter :set_defaults

  def flm
    @footer = false
  end

  def flm_he
    @header = false
  end

  def flm_schools
    @header = false
  end

  def flm_sponsors
    @header = false
  end

  private
  def set_defaults
    @header = true
    @footer = true
  end
end

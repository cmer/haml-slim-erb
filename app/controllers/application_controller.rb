class ApplicationController < ActionController::Base
  before_action :load_notes

  private

  def load_notes
    @notes = JSON.parse(Constants::NOTES, object_class: OpenStruct)
  end
end

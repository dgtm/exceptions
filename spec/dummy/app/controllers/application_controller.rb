class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from StandardError, :with => :handler

  protected

  def handler(exception)
    binding.pry
    Exception::Failure.notify("A", exception)
  end
end

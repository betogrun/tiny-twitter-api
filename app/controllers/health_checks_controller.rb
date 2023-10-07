# frozen_string_literal: true

class HealthChecksController < ApplicationController
  rescue_from(Exception) { head :internal_server_error }

  def show
    head :ok
  end
end

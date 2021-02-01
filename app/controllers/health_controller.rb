class HealthController < ApplicationController
  def health
    render json: {api: 'OK'}, status: :ok
    end
  def welcome
    render json: {welcome: 'Coding Exercise', author: 'LuisArturoMR', start: 'Read README.md'}, status: :ok
  end
end
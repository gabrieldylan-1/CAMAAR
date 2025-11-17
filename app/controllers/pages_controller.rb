# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @message = "Este é o seu ambiente Ruby on Rails com BDD pronto para uso."
  end
end

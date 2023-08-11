# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = current_user.articles
    respond_to do |format|
      format.html
      format.pdf { render template: 'articles/reporte', pdf: 'mis_articulos' }
    end
  end
end

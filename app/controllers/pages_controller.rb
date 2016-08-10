class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:logout]

  def index
  end

  def show
  end

  def _summary
  end

  def _favlist
  end

  def _mylist
  end

end

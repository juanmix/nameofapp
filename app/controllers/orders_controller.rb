class OrdersController < ApplicationController

before_filter :authenticate_user! # from devise, to restrict access to routes...
#... or entire controllers. a user must be logged in before they can access...
#... actions contained within.

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end


end
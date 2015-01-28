require 'rho/rhocontroller'
require 'helpers/browser_helper'

class NarcoticsController < Rho::RhoController
  include BrowserHelper

  # GET /Narcotics
  def index
    @narcoticses = Narcotics.find(:all)
    render :back => '/app'
  end

  # GET /Narcotics/{1}
  def show
    @narcotics = Narcotics.find(:first, :conditions => {'Id' => @params['id'][1..-1].chop})
      

   # @narcotics = Narcotics.find(@params['id'])
    if @narcotics
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Narcotics/new
  def new
    @narcotics = Narcotics.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Narcotics/{1}/edit
  def edit
    @narcotics = Narcotics.find(@params['id'])
    if @narcotics
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Narcotics/create
  def create
    @narcotics = Narcotics.create(@params['narcotics'])
      redirect :controller => :FamliyHistory, :action => :new
  end

  # POST /Narcotics/{1}/update
  def update
    @narcotics = Narcotics.find(@params['id'])
    @narcotics.update_attributes(@params['narcotics']) if @narcotics
    redirect :action => :index
  end

  # POST /Narcotics/{1}/delete
  def delete
    @narcotics = Narcotics.find(@params['id'])
    @narcotics.destroy if @narcotics
    redirect :action => :index  
  end
end

require 'rho/rhocontroller'
require 'helpers/browser_helper'

class HeartBloodController < Rho::RhoController
  include BrowserHelper

  # GET /HeartBlood
  def index
    @heartbloods = HeartBlood.find(:all)
    render :back => '/app'
  end

  # GET /HeartBlood/{1}
  def show
    @heartblood = HeartBlood.find(:first, :conditions => {'id' => @params['id'][1..-1].chop})

    # @heartblood = HeartBlood.find(@params['id'])
    if @heartblood
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /HeartBlood/new
  def new
    @heartblood = HeartBlood.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /HeartBlood/{1}/edit
  def edit
    @heartblood = HeartBlood.find(@params['id'])
    if @heartblood
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /HeartBlood/create
  def create
    @heart = HeartBlood.create(@params['heartblood'])
    fileNameW = File.join(Rho::RhoApplication::get_base_app_path(), 'diseasefile.txt')
              afile=File.new(fileNameW,'a+')
        
            afile.write(@heart.chestpain+","+@heart.rheumaticfever+","+@heart.infraction+","+@heart.bp+","+@heart.breathlessness+","+@heart.palpitation+","+@heart.heartattack+",")
    redirect :controller => :Stomach, :action => :new
  end

  # POST /HeartBlood/{1}/update
  def update
    @heartblood = HeartBlood.find(@params['id'])
    @heartblood.update_attributes(@params['heartblood']) if @heartblood
    redirect :action => :index
  end

  # POST /HeartBlood/{1}/delete
  def delete
    @heartblood = HeartBlood.find(@params['id'])
    @heartblood.destroy if @heartblood
    redirect :action => :index  
  end
end

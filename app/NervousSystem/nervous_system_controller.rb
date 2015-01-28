require 'rho/rhocontroller'
require 'helpers/browser_helper'

class NervousSystemController < Rho::RhoController
  include BrowserHelper

  # GET /NervousSystem
  def index
    @nervoussystems = NervousSystem.find(:all)
    render :back => '/app'
  end

  # GET /NervousSystem/{1}
  def show
    @nervoussystem = NervousSystem.find(:first, :conditions => {'id' => @params['id'][1..-1].chop})

    #@nervoussystem = NervousSystem.find(@params['id'])
    if @nervoussystem
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /NervousSystem/new
  def new
    @nervoussystem = NervousSystem.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /NervousSystem/{1}/edit
  def edit
    @nervoussystem = NervousSystem.find(@params['id'])
    if @nervoussystem
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /NervousSystem/create
  def create
    @nervous = NervousSystem.create(@params['nervoussystem'])
    fileNameW = File.join(Rho::RhoApplication::get_base_app_path(), 'diseasefile.txt')
              afile=File.new(fileNameW,'a+')
        
            afile.write(@nervous.epilepsy+","+@nervous.paralysis+","+@nervous.insanity+","+@nervous.nervousbreakdown+","+@nervous.alzheimer+","+@nervous.multiplesclerosis+","+@nervous.parkinson+",")
    redirect :controller => :BodyStructure, :action => :new
  end

  # POST /NervousSystem/{1}/update
  def update
    @nervoussystem = NervousSystem.find(@params['id'])
    @nervoussystem.update_attributes(@params['nervoussystem']) if @nervoussystem
    redirect :action => :index
  end

  # POST /NervousSystem/{1}/delete
  def delete
    @nervoussystem = NervousSystem.find(@params['id'])
    @nervoussystem.destroy if @nervoussystem
    redirect :action => :index  
  end
end

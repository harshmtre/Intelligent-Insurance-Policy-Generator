require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ExcretarySystemController < Rho::RhoController
  include BrowserHelper

  # GET /ExcretarySystem
  def index
    @excretarysystems = ExcretarySystem.find(:all)
    render :back => '/app'
  end

  # GET /ExcretarySystem/{1}
  def show
    @excretarysystem = ExcretarySystem.find(:first, :conditions => {'id' => @params['id'][1..-1].chop})

#    @excretarysystem = ExcretarySystem.find(@params['id'])
    if @excretarysystem
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /ExcretarySystem/new
  def new
    @excretarysystem = ExcretarySystem.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /ExcretarySystem/{1}/edit
  def edit
    @excretarysystem = ExcretarySystem.find(@params['id'])
    if @excretarysystem
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /ExcretarySystem/create
  def create
    @excretary = ExcretarySystem.create(@params['excretarysystem'])
    fileNameW = File.join(Rho::RhoApplication::get_base_app_path(), 'diseasefile.txt')
              afile=File.new(fileNameW,'a+')
        
            afile.write(@excretary.chronic+","+@excretary.prostratediseases+","+@excretary.urinary+","+@excretary.kidneystone+",")
    redirect :controller => :NervousSystem, :action => :new
  end

  # POST /ExcretarySystem/{1}/update
  def update
    @excretarysystem = ExcretarySystem.find(@params['id'])
    @excretarysystem.update_attributes(@params['excretarysystem']) if @excretarysystem
    redirect :action => :index
  end

  # POST /ExcretarySystem/{1}/delete
  def delete
    @excretarysystem = ExcretarySystem.find(@params['id'])
    @excretarysystem.destroy if @excretarysystem
    redirect :action => :index  
  end
end

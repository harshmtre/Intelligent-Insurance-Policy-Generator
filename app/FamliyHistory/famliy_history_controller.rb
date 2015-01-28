require 'rho/rhocontroller'
require 'helpers/browser_helper'

class FamliyHistoryController < Rho::RhoController
  include BrowserHelper

  # GET /FamliyHistory
  def index
    @famliyhistories = FamliyHistory.find(:all)
    render :back => '/app'
  end

  # GET /FamliyHistory/{1}
  def show
    @famliyhistory = FamliyHistory.find(:first, :conditions => {'Id' => @params['id'][1..-1].chop})

    #@famliyhistory = FamliyHistory.find(@params['id'])
    if @famliyhistory
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /FamliyHistory/new
  def new
    @famliyhistory = FamliyHistory.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /FamliyHistory/{1}/edit
  def edit
    @famliyhistory = FamliyHistory.find(@params['id'])
    if @famliyhistory
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /FamliyHistory/create
  def create
    @famliyhistory = FamliyHistory.create(@params['famliyhistory'])
     
           
      
      @id = @famliyhistory.Id
    @abc = PersonalForm.find(:first, :conditions => {'Id' => @id})
      @gender=@abc.Gender
      if @gender == 'Female'
         redirect :controller => :FemaleSection, :action => :new
      
       else
        redirect :controller => :DentalIssues, :action => :new
      end  
  end

  # POST /FamliyHistory/{1}/update
  def update
    @famliyhistory = FamliyHistory.find(@params['id'])
    @famliyhistory.update_attributes(@params['famliyhistory']) if @famliyhistory
    redirect :action => :index
  end

  # POST /FamliyHistory/{1}/delete
  def delete
    @famliyhistory = FamliyHistory.find(@params['id'])
    @famliyhistory.destroy if @famliyhistory
    redirect :action => :index  
  end
end

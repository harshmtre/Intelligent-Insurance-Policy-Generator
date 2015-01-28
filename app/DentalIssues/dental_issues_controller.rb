require 'rho/rhocontroller'
require 'helpers/browser_helper'

class DentalIssuesController < Rho::RhoController
  include BrowserHelper

  # GET /DentalIssues
  def index
    @dentalissueses = DentalIssues.find(:all)
    render :back => '/app'
  end

  # GET /DentalIssues/{1}
  def show
    @dentalissues = DentalIssues.find(:first, :conditions => {'id' => @params['id'][1..-1].chop})

#    @dentalissues = DentalIssues.find(@params['id'])
    if @dentalissues
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /DentalIssues/new
  def new
    @dentalissues = DentalIssues.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /DentalIssues/{1}/edit
  def edit
    @dentalissues = DentalIssues.find(@params['id'])
    if @dentalissues
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /DentalIssues/create
  def create
    @dentalissues = DentalIssues.create(@params['dentalissues'])
    fileNameW = File.join(Rho::RhoApplication::get_base_app_path(), 'diseasefile.txt')
              afile=File.new(fileNameW,'a+')
            afile.write(@dentalissues.id+","+@dentalissues.pyrarrhoea+","+@dentalissues.missingteeth+",")
      redirect :controller => :Lungs, :action => :new
  end

  # POST /DentalIssues/{1}/update
  def update
    @dentalissues = DentalIssues.find(@params['id'])
    @dentalissues.update_attributes(@params['dentalissues']) if @dentalissues
    redirect :action => :index
  end

  # POST /DentalIssues/{1}/delete
  def delete
    @dentalissues = DentalIssues.find(@params['id'])
    @id = @dentalissues.id
           @lungs = Lungs.find(:first, :conditions => {'id' => @id})
           @lungs.destroy
           @body = BodyStructure.find(:first, :conditions => {'id' => @id})
           @body.destroy
           @diabetes = Diabetes.find(:first, :conditions => {'id' => @id})
           @diabetes.destroy
           @excretary = ExcretarySystem.find(:first, :conditions => {'id' => @id})
           @excretary.destroy
           @heart=HeartBlood.find(:first, :conditions => {'id' => @id})
           @heart.destroy
           @nervous=NervousSystem.find(:first, :conditions => {'id' => @id})
           @nervous.destroy
           @other=OtherDiseases.find(:first, :conditions => {'id' => @id})
           @other.destroy
           @stomach=Stomach.find(:first, :conditions => {'id' => @id})
           @stomach.destroy   
           @bodily=BodilyDefects.find(:first, :conditions => {'id' => @id})
           @bodily.destroy
       
    @dentalissues.destroy if @dentalissues
    redirect :action => :index  
  end
end

class SubjectsController < ApplicationController
  #specifies the layout to use
  layout 'admin'
  before_action :confirm_logged_in
  before_action :set_subject_count, :only => [:new, :create, :edit, :update]

  def index
    @subjects = Subject.sorted
    render('index') #default
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    #Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    #Save the object
    if @subject.save
    #If save succeeds, redirect to the index action
    flash[:notice] = "Subject Created Successfully"
    redirect_to subjects_path
    else
    #If save fails, redisplay the form so user can fix problems
     render 'new' 
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject Updated Successfully"
      redirect_to subject_path(@subject)
    else
      render 'edit'
    end
  end
  
  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' Destroyed Successfully"
    redirect_to subjects_path
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

  def set_subject_count
    @subject_count = Subject.count
    if params[:action] == 'new'|| params[:action] == 'create'
      @subject_count += 1    
    end
  end
end

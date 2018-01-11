class SubjectsController < ApplicationController
  #specifies the layout to use
  layout 'admin'
  def index
    @subjects = Subject.sorted
    render('index') #default
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
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
     @subject_count = Subject.count + 1
     render 'new' 
    end
  end

  def edit
    @subject_count = Subject.count
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject Updated Successfully"
      redirect_to subject_path(@subject)
    else
      @subject_count = Subject.count
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
end

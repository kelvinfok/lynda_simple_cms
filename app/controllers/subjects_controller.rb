class SubjectsController < ApplicationController

  layout false

  def index
    # @subjects = Subject.order("position ASC")
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(:name => 'Default Value')
  end

  def create
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
      # If save suceeds, redirect to the index page
      flash[:notice] = "Subject created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, re-displays the form
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # Update the object
    if @subject.update_attributes(subject_params)
    # If update suceeds, redirect to the index page
    flash[:notice] = "Subject updated successfully."
      redirect_to(:action => 'show', :id => @subject.id)
    else
      # If update fails, re-displays the form
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id])
    subject.destroy
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end

  private

  def subject_params
    # same as using "params[:subject]", except that it:
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
    params.require(:subject).permit(:name, :position, :visible)
  end
end

class SummariesController < ApplicationController
  def index
    @summaries.all
    authorize @summaries
  end

  def new
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.new
    authorize @summary

  end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.find(params[:id])
    authorize @summary

  end

  def edit
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.find(params[:id])
    authorize @summary
  end
  def create
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
     @summary = Summary.new(params.require(:summary).permit(:body))
     authorize @summary
     if @summary.save
       redirect_to @summary, notice: "Summary was saved successfully."
     else
       flash[:error] = "Error creating summary. Please try again."
       render :new
     end
   end

   def update
     @post = Post.find(params[:id])
     @topic = Topic.find(params[:topic_id])
     @summary = Topic.find(params[:id])
     authorize @summary
     if @summary.update_attributes(params.require(:summary).permit(:body))
       redirect_to @summary
     else
       flash[:error] = "Error saving topic. Please try again."
       render :edit
     end
   end
end

class TopicsController < ApplicationController
    skip_before_action :authenticate_user!, only: :index

    def index
      # @topics = Topic.all
      @topics = policy_scope(Topic)
    end
  
    def show
      @topic = Topic.find(params[:id])
    end
  
    def new
      @topic = Topic.new
      authorize @topic
    end
  
    def create
      @topic = Topic.new(topic_params)
      @owner = User.find(params[:user_id])
      # @topic.user_id = (params[:user_id])
      @topic.user = @owner
      #@topic.reviewer = current_user
      authorize @topic
  
      if @topic.save
        redirect_to topics_path, notice: 'Topic added!'
      else
        render :new
      end
    end
  
    def edit
      @topic = Topic.find(params[:id])
      authorize @topic
    end
  
    def update
      @topic = Topic.find(params[:id])
      authorize @topic
      @topic.update(topic_params)
      redirect_to topic_path(@topic)
    end
  
    def topic_params
      params.require(:topic).permit(:content, :title)
      # params.require(:topic).permit(:rating, :content, :reviewer_id)
    end
end

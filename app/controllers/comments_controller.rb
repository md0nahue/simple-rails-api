class CommentsController < ApplicationController
  include Response
  
  def index
    @comments = Comment.all
    json_response(@comments)
  end

  # POST /Comments
  def create
    @comment = Comment.create!(comment_params)
    json_response(@comment, :created)
  end

  # GET /Comments/:id
  def show
    json_response(@comment)
  end

  # PUT /Comments/:id
  def update
    @comment.update(comment_params)
    head :no_content
  end

  # DELETE /Comments/:id
  def destroy
    Comment.find(params[:id]).destroy
    head :no_content
  end

  private

  def comment_params
    # whitelist params
    params.permit(:name, :body)
  end

end

class CommentsController < ApplicationController
  def create
    @work_room = WorkRoom.find(params[:work_room_id])
    @comment = current_user.comments.build(comment_params)
    @comment.work_room_id = @work_room.id
    if @comment.save
      flash[:success] = "コメントを投稿しました"
      render 'add_comment'
    else
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @work_room = WorkRoom.find(params[:work_room_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "コメントを更新しました"
    else
    end
  end

  def destroy
    @work_room = WorkRoom.find(params[:work_room_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to work_room_path(@work_room)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end

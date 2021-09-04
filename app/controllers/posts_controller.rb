class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
    @post_comments = PostComment.all
    @tags = Tag.all
    @post_comment = PostComment.new
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def show
    @posts = Post.where(user_id: current_user.id)
    @post = Post.find(params[:id])
    @user = @post.user
    @plan_day = PlanDay.new
    @plans = @plan_day.plans.build
    @plan_days = @post.plan_days
    @tags = @post.tags
    # @post = @post.plan
    @post_comments = @post.post_comments
    @post_comment = PostComment.new
  end

  def post_show
    @posts = Post.where(user_id: current_user.id)
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comments = @post.post_comments
    @post_comment = PostComment.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.score = Language.get_data(post_params[:content])  #自然言語API
    @tag_list = params[:post][:name].split(nil) #formから、@postオブジェクトを参照してタグの名前も一緒に送信、スペースで区切って配列化
    if @post.save
       @post.save_tag(@tag_list) #モデルで定義
       tags = Vision.get_image_data(@post.image)
       tags.each do |tag|
         saved_tag = Tag.find_or_create_by(name:tag) # カラムの中から同じ値がないか探して、あればそのままfindの動き、なければcreateの動きで新たにカラムに保存
         TagsRelationship.find_or_create_by(tag_id:saved_tag.id,post_id:@post.id)
       end
       flash[:notice] = "You have created successfully."
       redirect_to posts_path
    else
       render :new
    end

  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    redirect_to posts_path
  end

  def edit
   @post = Post.find(params[:id])
   @tag_list = @post.tags.pluck(:name).split(nil)# 特定のカラムデータのみ参照pluckメソッドは、SQLの段階から取得するカラムのデータを絞り込んでいる
  end

  def update
   @post = Post.find(params[:id])
   @post.score = Language.get_data(post_params[:content])  #自然言語API
   @tag_list = params[:post][:name].split(nil)
    if @post.update(post_params)
       @post.save_tag(@tag_list) #save_tagモデルで定義
       tags = Vision.get_image_data(@post.image)
       tags.each do |tag|
         saved_tag = Tag.find_by(name:tag)
         TagsRelationship.find_by(tag_id:saved_tag.id,post_id:@post.id)
       end
       flash[:notice] = "You have updateed successfully."
       redirect_to posts_path(@posts)
    end
  end

  def search
    @tags = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
    @posts = @tag.posts.page(params[:page]).per(10)  #クリックしたタグに紐付けられた投稿を全て表示
  end

  private

  def post_params
    params.require(:post).permit(:destination, :days, :nights, :image, :content, :budget)
  end

end
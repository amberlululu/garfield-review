class Api::V1::ReviewsController < ApiController

  skip_before_action :verify_authenticity_token
  
  def create 
    product = Product.find(params[:product_id])
    new_review = Review.new(review_params)
    new_review.product = product
    user = current_user
    new_review.user = user
    
    if new_review.save
      render json: new_review 
    else
      render json: {errors: new_review.errors.full_messages}
    end
  end 

  def destroy
    @review = Review.find(review_params)
    @review.destroy
  end
  def update
    @reviews = Object.find(review_params)
      if @reviews.update_attributes(params[:vote_count])
        flash[:success] = "Object was successfully updated"
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  private
    
  def review_params
    params.require(:review).permit(:rating, :body)
  end

  def destroy_review_params
    params.require(:id)
  end
end
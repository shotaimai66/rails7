class InquiriesController < ApplicationController
  def new
    @form = InquiryForm.new
  end

  def create
    @form = InquiryForm.new(inquiry_params)
    if @form.save
      redirect_to inquiry_complete_path, notice: 'お問い合わせを送信いたしました'
    else
      flash['notice'] = 'お問い合わせを送信いたしました'
      render :new, status: :unprocessable_entity
    end
  end

  def complete
  end

  private

  def inquiry_params
    params.require(:inquery).permit(:name, :content, :type, :email)
  end
end

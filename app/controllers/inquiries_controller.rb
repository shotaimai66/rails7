class InquiriesController < ApplicationController
  def new
    @form = InquiryForm.new
  end

  def create
    @form = InquiryForm.new(inquiry_params)
    if @form.save
      redirect_to inquiry_complete_path, notice: 'お問い合わせを送信いたしました'
    else
      flash['notice'] = 'お問い合わせの送信に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def complete; end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :content, :type, :email)
  end
end

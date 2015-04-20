class BillingController < ApplicationController
  def balance_email
    # TODO mail a real balance
    @person = Person.find(params[:id])

    PersonMailer.balance_email(@person).deliver
    redirect_to(:back)
  end
end
class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success

    end

    def webhook

        #we're using a webhook to get stripe to send us a confirmation if our payment is a success. 
        #we install ultrahook so that we can target our localhost because our server is locally deployed

        p params


        ########this code caused 500 error, not sure ############
        # payment_id= params[:data][:object][:payment_intent]
        # payment = Stripe::PaymentIntent.retrieve(payment_id)
        # note_id = payment.metadata.note_id
        # user_id = payment.metadata.user_id

        # p "note id " + note_id
        # p "user id " + user_id

        # status 200
    end
end
class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:show]
  before_action :set_user_listing, only: [:edit, :update, :destroy]


  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    #this code in the show method is used to creatte the stripe session with all the relevant meta-data about the purchase
    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
            name: @note.title,
            amount: 500, #this sets the price that will be charged
            currency: 'aud',
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id,
                note_id: @note.id
            }
        },
        success_url: "#{root_url}payments/success?userID=#{current_user.id}&noteId=#{@note.id}",
        cancel_url: "#{root_url}"
    )

    @session_id = session.id
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    # @note = Note.new(note_params)
    @note=current_user.notes.create(note_params)
    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:title, :body, :picture)
    end

    def set_user_listing
      id = params[:id]
      @note = current_user.notes.find_by_id(id)
  
      if @note == nil
          redirect_to notes_path
      end
  end


end

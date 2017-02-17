class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :original, :rendered, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: [:create]

  # GET /emails/where
  # GET /emails/where
  def where
    @email = Email.find_by!(params.permit(:message_id))
    render :show
  rescue
    render :missing, status: 404
  end

  # GET /emails/remote
  # GET /emails/remote.json
  def remote
    @objects = EmailReader.bucket.objects
  end

  # GET /emails
  # GET /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
  end

  # GET /emails/1/original
  # GET /emails/1/original.json
  def original
  end

  # GET /emails/1/rendered
  # GET /emails/1/rendered.json
  def rendered
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  # POST /emails.json
  def create
    reader = EmailReader.new(email_params[:remote_message_id])
    @email = EmailPersister.new(reader).persist

    respond_to do |format|
      if @email.persisted?
        format.html { redirect_to @email, notice: 'Email was successfully created.' }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to @email, notice: 'Email was successfully updated.' }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: 'Email was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_email
      @email = Email.find(params[:id])
    end

    def email_params
      params.require(:email).permit(:remote_message_id, :message)
    end
end

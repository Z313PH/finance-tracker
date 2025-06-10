class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.order(occurred_on: :desc)

    @income = @transactions.where(category: "Income").sum(:amount)
    @expenses = @transactions.where(category: "Expense").sum(:amount)
    @savings = @transactions.where(category: "Savings").sum(:amount)
    @giving = @transactions.where(category: "Giving").sum(:amount)

    @balance = @income - @expenses - @giving - @savings

  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
  @transaction = Transaction.new(transaction_params)

  case @transaction.category
  when "Expense"
    @transaction.amount = -@transaction.amount.abs
  when "Income", "Savings", "Giving"
    @transaction.amount = @transaction.amount.abs
  end

  if @transaction.save
    redirect_to transactions_path, notice: "Transaction created successfully."
  else
    render :new
  end
end


  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @transaction.destroy!

    respond_to do |format|
      format.html { redirect_to transactions_path, status: :see_other, notice: "Transaction was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.expect(transaction: [ :title, :amount, :category, :occurred_on, :notes ])
    end
end

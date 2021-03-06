class BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :edit, :update, :destroy, :add_plan, :disable, :enable]

  # GET /branches
  # GET /branches.json
  def index
    @branches = Branch.all
  end

  # GET /branches/1
  # GET /branches/1.json
  def show
  end

  # GET /branches/new
  def new
    @branch = Branch.new
  end

  # GET /branches/1/edit
  def edit
  end

  # POST /branches
  # POST /branches.json
  def create
    @branch = Branch.new(branch_params)

    respond_to do |format|
      if @branch.save
        format.html { redirect_to @branch, notice: 'Branch was successfully created.' }
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :new }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1
  # PATCH/PUT /branches/1.json
  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to @branch, notice: 'Branch was successfully updated.' }
        format.json { render :show, status: :ok, location: @branch }
      else
        format.html { render :edit }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    @branch.destroy
    respond_to do |format|
      format.html { redirect_to branches_url, notice: 'Branch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def disable
    respond_to do |format|
      if @branch.update(disabled: true)
        @branches = Branch.all
        format.html { render :index, notice: 'Branch was successfully disabled.' }
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :index, notice: 'Failed to disable the branch.' }
      end
    end
  end

  def enable
    respond_to do |format|
      if @branch.update(disabled: false)
        @branches = Branch.all
        format.html { render :index, notice: 'Branch was successfully enabled.' }
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :index, notice: 'Failed to enable the branch.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branch_params
      params.require(:branch).permit(:title)
    end
end

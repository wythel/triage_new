class ReportsController < ApplicationController
    before_action :set_report, only: [:show, :edit, :update, :destroy]
    before_action :get_plan_selection, only: [:edit, :new]

    # GET /reports
    # GET /reports.json
    def index
        @reports = Report.all
    end

    def list
       @reports = Report.all
       branches = Branch.all.order('title asc')
       table = {}

       branches.each do |b|
        plans = Plan.where(branch_id: b.id)
        table[b.title] = plans
       end

       @table = table
    end

    # GET /reports/1
    # GET /reports/1.json
    def show
    end

    # GET /reports/new
    def new
        @report = Report.new
    end

    # GET /reports/1/edit
    def edit
    end

    # POST /reports
    # POST /reports.json
    def create
        @report = Report.new(report_params)

        respond_to do |format|
        if @report.save
            format.html { redirect_to action: "index", notice: 'Report was successfully created.' }
            format.json { render :show, status: :created, location: @report }
        else
            format.html { render :new }
            format.json { render json: @report.errors, status: :unprocessable_entity }
        end
        end
    end

    # PATCH/PUT /reports/1
    # PATCH/PUT /reports/1.json
    def update
        respond_to do |format|
            if @report.update(report_params)
                format.html { redirect_to action: "index", notice: 'Report was successfully updated.' }
                format.json { render :show, status: :ok, location: @report }
            else
                format.html { render :edit }
                format.json { render json: @report.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /reports/1
    # DELETE /reports/1.json
    def destroy
        @report.destroy
        respond_to do |format|
            format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
        @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
        params.require(:report).permit(:url, :pass, :fail, :error, :note, :plan_id, :build)
    end

    def get_plan_selection
        s = []
        plans = Plan.all.sort_by {|p| [p.branch.title, p.title]}
        plans.each do |p|
            s.push([p.branch.title + '-' + p.title, p.id])
        end
        @plan_selection = s
    end
end

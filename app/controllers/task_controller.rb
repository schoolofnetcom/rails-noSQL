class TaskController < ApplicationController

    def index
        # @tasks = Task.paginate(:page => 2, :limit => 3)
        @tasks = Task.page(params[:page]).per(2)

        respond_to do |format|
            format.html
            format.json { render json: @tasks }
        end
    end

    def new
        @task = Task.new
        respond_to do |format|
            format.html
        end
    end

    def create
        @task = Task.create(task_params)

        if @task.save
            redirect_to :action => :index
        else
            render "new"
        end
    end

    def show
        @task = Task.find(params[:id])

        respond_to do |format|
            format.html
        end
    end

    def edit
        @task = Task.find(params[:id])

        respond_to do |format|
            format.html
        end
    end

    def update
        @task = Task.find(params[:id])

        respond_to do |format|
            if @task.update_attributes(task_params)
                format.html { redirect_to @task }
            else
                format.html { render action: 'edit' }
            end
        end
    end

    def destroy
        @task = Task.where(:_id => params[:id])

        @task.destroy

        redirect_to :action => :index
    end

    private
        def task_params
            params.require(:task).permit(:name, :description)
        end
end

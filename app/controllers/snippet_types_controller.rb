class SnippetTypesController < ApplicationController
  # GET /snippet_types
  # GET /snippet_types.json
  def index
    @snippet_types = SnippetType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @snippet_types }
    end
  end

  # GET /snippet_types/1
  # GET /snippet_types/1.json
  def show
    @snippet_type = SnippetType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @snippet_type }
    end
  end

  # GET /snippet_types/new
  # GET /snippet_types/new.json
  def new
    @snippet_type = SnippetType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @snippet_type }
    end
  end

  # GET /snippet_types/1/edit
  def edit
    @snippet_type = SnippetType.find(params[:id])
  end

  # POST /snippet_types
  # POST /snippet_types.json
  def create
    @snippet_type = SnippetType.new(params[:snippet_type])

    respond_to do |format|
      if @snippet_type.save
        format.html { redirect_to @snippet_type, notice: 'Snippet type was successfully created.' }
        format.json { render json: @snippet_type, status: :created, location: @snippet_type }
      else
        format.html { render action: "new" }
        format.json { render json: @snippet_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /snippet_types/1
  # PUT /snippet_types/1.json
  def update
    @snippet_type = SnippetType.find(params[:id])

    respond_to do |format|
      if @snippet_type.update_attributes(params[:snippet_type])
        format.html { redirect_to @snippet_type, notice: 'Snippet type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @snippet_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snippet_types/1
  # DELETE /snippet_types/1.json
  def destroy
    @snippet_type = SnippetType.find(params[:id])
    @snippet_type.destroy

    respond_to do |format|
      format.html { redirect_to snippet_types_url }
      format.json { head :no_content }
    end
  end
end

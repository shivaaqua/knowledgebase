require 'spec_helper'

describe SnippetTypesController do

  def valid_attributes
    FactoryGirl.attributes_for(:snippet_type)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SnippetTypesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all snippet_types as @snippet_types" do
      snippet_type = SnippetType.create! valid_attributes
      get :index, {}, valid_session
      assigns(:snippet_types).should eq([snippet_type])
    end
  end

  describe "GET show" do
    it "assigns the requested snippet_type as @snippet_type" do
      snippet_type = SnippetType.create! valid_attributes
      get :show, {:id => snippet_type.to_param}, valid_session
      assigns(:snippet_type).should eq(snippet_type)
    end
  end

  describe "GET new" do
    it "assigns a new snippet_type as @snippet_type" do
      get :new, {}, valid_session
      assigns(:snippet_type).should be_a_new(SnippetType)
    end
  end

  describe "GET edit" do
    it "assigns the requested snippet_type as @snippet_type" do
      snippet_type = SnippetType.create! valid_attributes
      get :edit, {:id => snippet_type.to_param}, valid_session
      assigns(:snippet_type).should eq(snippet_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SnippetType" do
        expect {
          post :create, {:snippet_type => valid_attributes}, valid_session
        }.to change(SnippetType, :count).by(1)
      end

      it "assigns a newly created snippet_type as @snippet_type" do
        post :create, {:snippet_type => valid_attributes}, valid_session
        assigns(:snippet_type).should be_a(SnippetType)
        assigns(:snippet_type).should be_persisted
      end

      it "redirects to the created snippet_type" do
        post :create, {:snippet_type => valid_attributes}, valid_session
        response.should redirect_to(SnippetType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved snippet_type as @snippet_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        SnippetType.any_instance.stub(:save).and_return(false)
        post :create, {:snippet_type => {}}, valid_session
        assigns(:snippet_type).should be_a_new(SnippetType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SnippetType.any_instance.stub(:save).and_return(false)
        post :create, {:snippet_type => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested snippet_type" do
        snippet_type = SnippetType.create! valid_attributes
        # Assuming there are no other snippet_types in the database, this
        # specifies that the SnippetType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SnippetType.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => snippet_type.to_param, :snippet_type => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested snippet_type as @snippet_type" do
        snippet_type = SnippetType.create! valid_attributes
        put :update, {:id => snippet_type.to_param, :snippet_type => valid_attributes}, valid_session
        assigns(:snippet_type).should eq(snippet_type)
      end

      it "redirects to the snippet_type" do
        snippet_type = SnippetType.create! valid_attributes
        put :update, {:id => snippet_type.to_param, :snippet_type => valid_attributes}, valid_session
        response.should redirect_to(snippet_type)
      end
    end

    describe "with invalid params" do
      it "assigns the snippet_type as @snippet_type" do
        snippet_type = SnippetType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SnippetType.any_instance.stub(:save).and_return(false)
        put :update, {:id => snippet_type.to_param, :snippet_type => {}}, valid_session
        assigns(:snippet_type).should eq(snippet_type)
      end

      it "re-renders the 'edit' template" do
        snippet_type = SnippetType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SnippetType.any_instance.stub(:save).and_return(false)
        put :update, {:id => snippet_type.to_param, :snippet_type => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested snippet_type" do
      snippet_type = SnippetType.create! valid_attributes
      expect {
        delete :destroy, {:id => snippet_type.to_param}, valid_session
      }.to change(SnippetType, :count).by(-1)
    end

    it "redirects to the snippet_types list" do
      snippet_type = SnippetType.create! valid_attributes
      delete :destroy, {:id => snippet_type.to_param}, valid_session
      response.should redirect_to(snippet_types_url)
    end
  end

end

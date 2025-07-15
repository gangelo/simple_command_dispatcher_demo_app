require 'rails_helper'

RSpec.describe "Mechs destroy" do
  context "when the user is authenticated" do
    before do
      login_user(user)
    end

    context "when the user is authorized" do
      let(:user) { create(:user, :admin_role) }

      it "deletes the mech and returns a success response" do
        mech = create(:mech)

        expect do
          delete "/api/mechs/#{mech.id}", headers: auth_headers(user)
        end.to change(Mech, :count).by(-1)

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to include("mech" => mech.as_json)
      end
    end

    context "when the user is not authorized" do
      let(:user) { create(:user, :user_role) }

      it "returns an unauthorized response" do
        mech = create(:mech)

        expect do
          delete "/api/mechs/#{mech.id}", headers: auth_headers(user)
        end.to change(Mech, :count).by(0)

        expect(response).to have_http_status(:unauthorized)
        expect(response.status).to eq(401)
        expect(JSON.parse(response.body)).to eq({ "errors" => [ "Unauthorized" ] })
      end
    end
  end

  context "when the user is not authenticated" do
    let(:user) { create(:user, :admin_role) }

    it "returns an unauthorized response" do
      mech = create(:mech)

      expect do
        delete "/api/mechs/#{mech.id}"
      end.to change(Mech, :count).by(0)

      expect(response).to have_http_status(:unauthorized)
      expect(response.status).to eq(401)
      expect(JSON.parse(response.body)).to eq({ "errors" => [ "Token not provided" ] })
    end
  end
end

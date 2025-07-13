require 'rails_helper'

RSpec.describe "Api::V1::Mechs", type: :request do
  before do
    login_user(user)
  end

  let(:user) { create(:user) }
  let!(:atlas) { create(:mech) }
  let!(:awesome) { create(:mech, :awesome) }
  let!(:marauder) { create(:mech, :marauder) }

  describe "GET /api/v1/mechs/search" do
    context "with valid mech_name parameter" do
      it "returns mechs matching the name" do
        get "/api/v1/mechs/search", params: { mech_name: "Atlas" }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"]).to be_an(Array)
        expect(json["mechs"].size).to eq(1)
        expect(json["mechs"].first["mech_name"]).to eq("Atlas")
      end

      it "returns partial matches" do
        get "/api/v1/mechs/search", params: { mech_name: "Awe" }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"].size).to eq(1)
        expect(json["mechs"].first["mech_name"]).to eq("Awesome")
      end

      it "is case insensitive" do
        get "/api/v1/mechs/search", params: { mech_name: "atlas" }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"].size).to eq(1)
        expect(json["mechs"].first["mech_name"]).to eq("Atlas")
      end
    end

    context "without mech_name parameter" do
      it "returns empty array" do
        get "/api/v1/mechs/search", headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"]).to eq([])
      end
    end

    context "with empty mech_name parameter" do
      it "returns empty array" do
        get "/api/v1/mechs/search", params: { mech_name: "" }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"]).to eq([])
      end
    end

    context "with non-matching mech_name" do
      it "returns empty array" do
        get "/api/v1/mechs/search", params: { mech_name: "NonExistent" }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"]).to eq([])
      end
    end

    context "v1 only accepts mech_name" do
      it "ignores other parameters" do
        get "/api/v1/mechs/search", params: {
          mech_name: "Atlas",
          tonnage: 100,
          variant: "AS7-D"
        }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"].size).to eq(1)
        expect(json["mechs"].first["mech_name"]).to eq("Atlas")
      end
    end
  end
end

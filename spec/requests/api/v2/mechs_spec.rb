require 'rails_helper'

RSpec.describe "Api::V2::Mechs" do
  before do
    login_user(user)
  end

  let(:user) { create(:user) }
  let!(:atlas) { create(:mech) }
  let!(:awesome) { create(:mech, :awesome) }
  let!(:marauder) { create(:mech, :marauder) }
  let!(:mad_cat) { create(:mech, :mad_cat) }

  describe "GET /api/v2/mechs/search" do
    context "with single search parameter" do
      it "searches by mech_name" do
        get "/api/v2/mechs/search", params: { mech_name: "Atlas" }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"].size).to eq(1)
        expect(json["mechs"].first["mech_name"]).to eq("Atlas")
      end

      it "searches by variant" do
        get "/api/v2/mechs/search", params: { variant: "AWS-8Q" }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"].size).to eq(1)
        expect(json["mechs"].first["variant"]).to eq("AWS-8Q")
      end

      it "searches by tonnage" do
        get "/api/v2/mechs/search", params: { tonnage: 75 }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"].size).to eq(2) # Marauder and Mad Cat

        mech_names = json["mechs"].map { |m| m["mech_name"] }
        expect(mech_names).to contain_exactly("Marauder", "Mad Cat")
      end

      it "searches by cost" do
        get "/api/v2/mechs/search", params: { cost: 6436000.0 }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"].size).to eq(1)
        expect(json["mechs"].first["mech_name"]).to eq("Awesome")
      end

      it "searches by introduction_year" do
        get "/api/v2/mechs/search", params: { introduction_year: 2945 }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"].size).to eq(1)
        expect(json["mechs"].first["mech_name"]).to eq("Mad Cat")
      end
    end

    context "with multiple search parameters (OR logic)" do
      it "returns mechs matching any parameter" do
        get "/api/v2/mechs/search", params: {
          mech_name: "Atlas",
          tonnage: 80
        }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"].size).to eq(2) # Atlas (by name) and Awesome (by tonnage)

        mech_names = json["mechs"].map { |m| m["mech_name"] }
        expect(mech_names).to contain_exactly("Atlas", "Awesome")
      end

      it "handles overlapping results correctly" do
        get "/api/v2/mechs/search", params: {
          mech_name: "Atlas",
          tonnage: 100
        }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"].size).to eq(1) # Atlas matches both criteria but only returned once
        expect(json["mechs"].first["mech_name"]).to eq("Atlas")
      end

      it "searches across all supported fields" do
        get "/api/v2/mechs/search", params: {
          variant: "MAD-3R",
          introduction_year: 2945,
          cost: 6436000.0
        }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"].size).to eq(3) # Marauder, Mad Cat, Awesome

        mech_names = json["mechs"].map { |m| m["mech_name"] }
        expect(mech_names).to contain_exactly("Marauder", "Mad Cat", "Awesome")
      end
    end

    context "with string searches (ILIKE)" do
      it "performs case-insensitive partial matching on mech_name" do
        get "/api/v2/mechs/search", params: { mech_name: "mad" }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"].size).to eq(1)
        expect(json["mechs"].first["mech_name"]).to eq("Mad Cat")
      end

      it "performs case-insensitive partial matching on variant" do
        get "/api/v2/mechs/search", params: { variant: "prime" }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"].size).to eq(1)
        expect(json["mechs"].first["mech_name"]).to eq("Mad Cat")
      end
    end

    context "without any search parameters" do
      it "returns empty array" do
        get "/api/v2/mechs/search", headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"]).to eq([])
      end
    end

    context "with non-matching parameters" do
      it "returns empty array" do
        get "/api/v2/mechs/search", params: { tonnage: 999 }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"]).to eq([])
      end
    end

    context "with empty parameters" do
      it "returns empty array when all params are empty" do
        get "/api/v2/mechs/search", params: {
          mech_name: "",
          variant: "",
          tonnage: "",
          cost: "",
          introduction_year: ""
        }, headers: auth_headers(user)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json["mechs"]).to eq([])
      end
    end
  end
end

require "test_helper"

describe HousesController do
  let(:house) { houses :one }

  it "gets index" do
    get houses_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_house_url
    value(response).must_be :success?
  end

  it "creates house" do
    expect {
      post houses_url, params: { house: { basement: house.basement, companies_id: house.companies_id, currentowner: house.currentowner, floors: house.floors, listprice: house.listprice, location: house.location, potentialbuyers: house.potentialbuyers, realtorcontact: house.realtorcontact, squareft: house.squareft, style: house.style, yearbuilt: house.yearbuilt } }
    }.must_change "House.count"

    must_redirect_to house_path(House.last)
  end

  it "shows house" do
    get house_url(house)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_house_url(house)
    value(response).must_be :success?
  end

  it "updates house" do
    patch house_url(house), params: { house: { basement: house.basement, companies_id: house.companies_id, currentowner: house.currentowner, floors: house.floors, listprice: house.listprice, location: house.location, potentialbuyers: house.potentialbuyers, realtorcontact: house.realtorcontact, squareft: house.squareft, style: house.style, yearbuilt: house.yearbuilt } }
    must_redirect_to house_path(house)
  end

  it "destroys house" do
    expect {
      delete house_url(house)
    }.must_change "House.count", -1

    must_redirect_to houses_path
  end
end
